@interface BLEpubRightsDataParser
- (BLEpubRightsDataParser)initWithXMLData:(id)a3;
- (BOOL)isSinfElement;
- (NSData)sinfData;
- (NSMutableString)buffer;
- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
- (void)parser:(id)a3 foundCharacters:(id)a4;
- (void)setBuffer:(id)a3;
- (void)setIsSinfElement:(BOOL)a3;
@end

@implementation BLEpubRightsDataParser

- (BLEpubRightsDataParser)initWithXMLData:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BLEpubRightsDataParser;
  v5 = [(BLEpubRightsDataParser *)&v8 init];
  if (v5)
  {
    id v6 = [objc_alloc((Class)NSXMLParser) initWithData:v4];
    [v6 setDelegate:v5];
    [v6 parse];
  }
  return v5;
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  self->_isSinfElement = [a4 isEqualToString:@"fairplay:sData"];
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (self->_isSinfElement)
  {
    buffer = self->_buffer;
    if (!buffer)
    {
      objc_super v8 = (NSMutableString *)objc_alloc_init((Class)NSMutableString);
      v9 = self->_buffer;
      self->_buffer = v8;

      buffer = self->_buffer;
    }
    [(NSMutableString *)buffer appendString:v6];
  }
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  if (self->_isSinfElement)
  {
    v7 = (NSData *)[objc_alloc((Class)NSData) initWithBase64EncodedString:self->_buffer options:0];
    sinfData = self->_sinfData;
    self->_sinfData = v7;

    self->_isSinfElement = 0;
  }
}

- (NSData)sinfData
{
  return self->_sinfData;
}

- (NSMutableString)buffer
{
  return self->_buffer;
}

- (void)setBuffer:(id)a3
{
}

- (BOOL)isSinfElement
{
  return self->_isSinfElement;
}

- (void)setIsSinfElement:(BOOL)a3
{
  self->_isSinfElement = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffer, 0);

  objc_storeStrong((id *)&self->_sinfData, 0);
}

@end