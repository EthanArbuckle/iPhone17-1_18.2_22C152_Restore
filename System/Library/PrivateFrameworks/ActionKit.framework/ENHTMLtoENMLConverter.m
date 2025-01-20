@interface ENHTMLtoENMLConverter
- (ENHTMLtoENMLConverterDelegate)delegate;
- (id)enmlFromContentsOfHTMLFile:(id)a3;
- (id)enmlFromHTMLContent:(id)a3;
- (id)enmlWriter;
- (id)htmlParser;
- (void)cancel;
- (void)finish;
- (void)parser:(id)a3 didEndElement:(id)a4;
- (void)parser:(id)a3 didFailWithError:(id)a4;
- (void)parser:(id)a3 didStartElement:(id)a4 attributes:(id)a5;
- (void)parser:(id)a3 foundCharacters:(id)a4;
- (void)parserDidEndDocument:(id)a3;
- (void)parserDidStartDocument:(id)a3;
- (void)setDelegate:(id)a3;
- (void)writeData:(id)a3;
- (void)xmlWriter:(id)a3 didGenerateData:(id)a4;
- (void)xmlWriterDidEndWritingDocument:(id)a3;
@end

@implementation ENHTMLtoENMLConverter

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_enml, 0);
  objc_storeStrong((id *)&self->_enmlWriter, 0);
  objc_storeStrong((id *)&self->_htmlParser, 0);
}

- (void)setDelegate:(id)a3
{
}

- (ENHTMLtoENMLConverterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ENHTMLtoENMLConverterDelegate *)WeakRetained;
}

- (void)xmlWriterDidEndWritingDocument:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    [WeakRetained htmlConverterDidFinish:self];
    id WeakRetained = v5;
  }
}

- (void)xmlWriter:(id)a3 didGenerateData:(id)a4
{
  id v5 = (objc_class *)NSString;
  id v6 = a4;
  id v9 = (id)[[v5 alloc] initWithData:v6 encoding:4];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained htmlConverter:self didGenerateString:v9];
  }
  else {
    [(NSMutableString *)self->_enml appendString:v9];
  }
}

- (void)parser:(id)a3 didFailWithError:(id)a4
{
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v6 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained htmlConverter:self didFailWithError:v7];
  }
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  id v5 = a4;
  if (self->_inHTMLBody && self->_skipCount <= 0)
  {
    id v6 = v5;
    [(ENXMLWriter *)self->_enmlWriter writeString:v5];
    id v5 = v6;
  }
}

- (void)parser:(id)a3 didEndElement:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = v6;
  int skipCount = self->_skipCount;
  BOOL v9 = __OFSUB__(skipCount, 1);
  int v10 = skipCount - 1;
  if (v10 < 0 != v9)
  {
    if (self->_inHTMLBody)
    {
      v11 = [v6 lowercaseString];
      int v12 = [v11 isEqualToString:@"body"];

      if (v12) {
        self->_inHTMLBody = 0;
      }
      else {
        [(ENXMLWriter *)self->_enmlWriter endElement];
      }
    }
  }
  else
  {
    self->_int skipCount = v10;
  }
}

- (void)parser:(id)a3 didStartElement:(id)a4 attributes:(id)a5
{
  id v7 = a5;
  int skipCount = self->_skipCount;
  if (skipCount >= 1)
  {
    self->_int skipCount = skipCount + 1;
    goto LABEL_12;
  }
  id v17 = v7;
  BOOL v9 = [a4 lowercaseString];
  int v10 = v9;
  if (self->_inHTMLBody)
  {
    v11 = [v17 objectForKey:@"class"];
    int v12 = [v11 componentsSeparatedByString:@" "];

    if (([v12 containsObject:@"en-ignore"] & 1) == 0)
    {
      if ([(ENMLWriter *)self->_enmlWriter startElement:v10 attributes:v17])
      {
LABEL_10:

        goto LABEL_11;
      }
      id v13 = +[ENSession sharedSession];
      v14 = [v13 logger];
      v15 = [NSString stringWithFormat:@"startElement:%@ returned NO, skipping element and children", v10];
      [v14 evernoteLogInfoString:v15];
    }
    ++self->_skipCount;
    goto LABEL_10;
  }
  if ([v9 isEqualToString:@"body"])
  {
    int v12 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v17];
    [v12 removeObjectForKey:@"class"];
    v16 = [(ENHTMLtoENMLConverter *)self enmlWriter];
    [v16 startDocumentWithAttributes:v17];

    self->_inHTMLBody = 1;
    goto LABEL_10;
  }
LABEL_11:

  id v7 = v17;
LABEL_12:
}

- (void)parserDidEndDocument:(id)a3
{
}

- (void)parserDidStartDocument:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    [WeakRetained htmlConverterDidStart:self];
    id WeakRetained = v5;
  }
}

- (void)cancel
{
  v3 = [(ENHTMLtoENMLConverter *)self htmlParser];
  [v3 stopParser];

  id v4 = [(ENHTMLtoENMLConverter *)self htmlParser];
  [v4 setDelegate:0];
}

- (void)finish
{
  id v2 = [(ENHTMLtoENMLConverter *)self htmlParser];
  [v2 finalizeParser];
}

- (void)writeData:(id)a3
{
  id v4 = a3;
  id v5 = [(ENHTMLtoENMLConverter *)self htmlParser];
  [v5 appendData:v4];
}

- (id)enmlFromHTMLContent:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F089D8];
  id v5 = a3;
  id v6 = (NSMutableString *)objc_alloc_init(v4);
  enml = self->_enml;
  self->_enml = v6;

  v8 = [(ENHTMLtoENMLConverter *)self htmlParser];
  [v8 parseContents:v5];

  BOOL v9 = NSString;
  int v10 = self->_enml;
  return (id)[v9 stringWithString:v10];
}

- (id)enmlFromContentsOfHTMLFile:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F089D8];
  id v5 = a3;
  id v6 = (NSMutableString *)objc_alloc_init(v4);
  enml = self->_enml;
  self->_enml = v6;

  v8 = [(ENHTMLtoENMLConverter *)self htmlParser];
  [v8 parseContentsOfFile:v5];

  BOOL v9 = NSString;
  int v10 = self->_enml;
  return (id)[v9 stringWithString:v10];
}

- (id)htmlParser
{
  htmlParser = self->_htmlParser;
  if (!htmlParser)
  {
    id v4 = objc_alloc_init(ENXMLSaxParser);
    id v5 = self->_htmlParser;
    self->_htmlParser = v4;

    [(ENXMLSaxParser *)self->_htmlParser setIsHTML:1];
    [(ENXMLSaxParser *)self->_htmlParser setDelegate:self];
    htmlParser = self->_htmlParser;
  }
  return htmlParser;
}

- (id)enmlWriter
{
  enmlWriter = self->_enmlWriter;
  if (!enmlWriter)
  {
    id v4 = [(ENXMLWriter *)[ENMLWriter alloc] initWithDelegate:self];
    id v5 = self->_enmlWriter;
    self->_enmlWriter = v4;

    enmlWriter = self->_enmlWriter;
  }
  return enmlWriter;
}

@end