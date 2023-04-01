require "pdf-reader"
require "json"

pdfs = ["first", "second", "third"]

def file_reader file
    reader = PDF::Reader.new("./files/#{file}.pdf")
    puts reader.info

    reader.pages.each do |page|
        # puts page.text
    end     
    return reader
end

def json_content_writer (reader, file_name)
    file = File.open("./files/#{file_name}.json", 'w')
    file.write "#{reader.info.to_json}"            
    file.close
end

pdfs.each do |item|    
    json_content_writer(file_reader(item), item)
end