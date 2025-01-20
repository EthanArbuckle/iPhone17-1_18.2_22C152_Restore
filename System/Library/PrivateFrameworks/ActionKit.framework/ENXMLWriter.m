@interface ENXMLWriter
- (BOOL)startElement:(id)a3;
- (BOOL)startElement:(id)a3 attributes:(id)a4;
- (BOOL)writeAttributeName:(id)a3 value:(id)a4;
- (BOOL)writeElement:(id)a3 attributes:(id)a4 content:(id)a5;
- (ENXMLDTD)dtd;
- (ENXMLWriter)init;
- (ENXMLWriter)initWithDelegate:(id)a3;
- (ENXMLWriterDelegate)delegate;
- (NSString)contents;
- (NSString)currentElementName;
- (unint64_t)openElementCount;
- (void)dealloc;
- (void)endCDATA;
- (void)endDocument;
- (void)endElement;
- (void)setCurrentElementName:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDtd:(id)a3;
- (void)setOpenElementCount:(unint64_t)a3;
- (void)startCDATA;
- (void)startDocument;
- (void)writeCDATA:(id)a3;
- (void)writeRawString:(id)a3;
- (void)writeString:(id)a3;
- (void)writeString:(id)a3 raw:(BOOL)a4;
@end

@implementation ENXMLWriter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentElementName, 0);
  objc_storeStrong((id *)&self->_dtd, 0);
  objc_storeStrong((id *)&self->_contents, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setOpenElementCount:(unint64_t)a3
{
  self->_openElementCount = a3;
}

- (unint64_t)openElementCount
{
  return self->_openElementCount;
}

- (void)setDtd:(id)a3
{
}

- (ENXMLDTD)dtd
{
  return self->_dtd;
}

- (NSString)contents
{
  return &self->_contents->super;
}

- (void)setDelegate:(id)a3
{
}

- (ENXMLWriterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ENXMLWriterDelegate *)WeakRetained;
}

- (void)setCurrentElementName:(id)a3
{
}

- (NSString)currentElementName
{
  return self->_currentElementName;
}

- (void)endCDATA
{
  uint64_t v2 = xmlTextWriterEndCDATA(self->_xmlWriter);
  CheckXMLResult(v2, @"xmlTextWriterEndCDATA");
}

- (void)writeCDATA:(id)a3
{
  uint64_t v3 = xmlTextWriterWriteCDATA(self->_xmlWriter, (const xmlChar *)[a3 cStringUsingEncoding:4]);
  CheckXMLResult(v3, @"xmlTextWriterWriteCDATA");
}

- (void)startCDATA
{
  uint64_t started = xmlTextWriterStartCDATA(self->_xmlWriter);
  CheckXMLResult(started, @"xmlTextWriterStartCDATA");
}

- (void)writeString:(id)a3
{
}

- (void)writeRawString:(id)a3
{
}

- (void)writeString:(id)a3 raw:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    xmlWriter = self->_xmlWriter;
    id v11 = v6;
    v8 = (const xmlChar *)[v6 cStringUsingEncoding:4];
    if (v4)
    {
      uint64_t v9 = xmlTextWriterWriteRaw(xmlWriter, v8);
      v10 = @"xmlTextWriterWriteRaw";
    }
    else
    {
      uint64_t v9 = xmlTextWriterWriteString(xmlWriter, v8);
      v10 = @"xmlTextWriterWriteString";
    }
    CheckXMLResult(v9, v10);
    id v6 = v11;
  }
}

- (BOOL)writeAttributeName:(id)a3 value:(id)a4
{
  id v6 = a3;
  v7 = (__CFString *)a4;
  if (v7) {
    v8 = v7;
  }
  else {
    v8 = &stru_26F008428;
  }
  dtd = self->_dtd;
  if (dtd
    && ![(ENXMLDTD *)dtd isAttributeLegal:v6 inElement:self->_currentElementName])
  {
    BOOL v15 = 0;
  }
  else
  {
    v10 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:v8];
    objc_msgSend(v10, "replaceOccurrencesOfString:withString:options:range:", @"&#38;",
      @"&",
      0,
      0,
      [v10 length]);
    xmlWriter = self->_xmlWriter;
    v12 = (const xmlChar *)[v6 cStringUsingEncoding:4];
    id v13 = v10;
    uint64_t v14 = xmlTextWriterWriteAttribute(xmlWriter, v12, (const xmlChar *)[v13 cStringUsingEncoding:4]);
    CheckXMLResult(v14, @"xmlTextWriterWriteAttribute");

    BOOL v15 = 1;
  }

  return v15;
}

- (BOOL)writeElement:(id)a3 attributes:(id)a4 content:(id)a5
{
  id v8 = a5;
  BOOL v9 = [(ENXMLWriter *)self startElement:a3 attributes:a4];
  if (v9)
  {
    [(ENXMLWriter *)self writeString:v8];
    [(ENXMLWriter *)self endElement];
  }

  return v9;
}

- (void)endElement
{
  uint64_t v3 = xmlTextWriterEndElement(self->_xmlWriter);
  CheckXMLResult(v3, @"xmlTextWriterEndElement");
  [(ENXMLWriter *)self setCurrentElementName:0];
  --self->_openElementCount;
}

- (BOOL)startElement:(id)a3 attributes:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a4;
  BOOL v7 = [(ENXMLWriter *)self startElement:a3];
  if (v7)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = objc_msgSend(v6, "allKeys", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v14 = [v6 objectForKeyedSubscript:v13];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [(ENXMLWriter *)self writeAttributeName:v13 value:v14];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }
  }
  return v7;
}

- (BOOL)startElement:(id)a3
{
  id v4 = a3;
  dtd = self->_dtd;
  if (dtd && ![(ENXMLDTD *)dtd isElementLegal:v4])
  {
    BOOL v9 = 0;
  }
  else
  {
    xmlWriter = self->_xmlWriter;
    id v7 = v4;
    uint64_t started = xmlTextWriterStartElement(xmlWriter, (const xmlChar *)[v7 cStringUsingEncoding:4]);
    CheckXMLResult(started, @"xmlTextWriterStartElement");
    ++self->_openElementCount;
    [(ENXMLWriter *)self setCurrentElementName:v7];
    BOOL v9 = 1;
  }

  return v9;
}

- (void)endDocument
{
  uint64_t v3 = xmlTextWriterEndDocument(self->_xmlWriter);
  CheckXMLResult(v3, @"xmlTextWriterEndDocument");
  xmlFreeTextWriter(self->_xmlWriter);
  self->_xmlWriter = 0;
}

- (void)startDocument
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    id v4 = (int (__cdecl *)(void *, const char *, int))ENXMLWriter_delegateWriteCallback;
    v5 = (int (__cdecl *)(void *))ENXMLWriter_delegateCloseCallback;
    id v6 = self;
  }
  else
  {
    id v7 = (NSMutableString *)objc_alloc_init(MEMORY[0x263F089D8]);
    contents = self->_contents;
    self->_contents = v7;

    id v6 = self->_contents;
    id v4 = (int (__cdecl *)(void *, const char *, int))ENXMLWriter_contentsWriteCallback;
    v5 = 0;
  }
  IO = xmlOutputBufferCreateIO(v4, v5, v6, 0);
  self->_xmlOutputBuffer = IO;
  if (IO) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = 0xFFFFFFFFLL;
  }
  CheckXMLResult(v10, @"xmlOutputBufferCreateIO");
  uint64_t v11 = xmlNewTextWriter(self->_xmlOutputBuffer);
  self->_xmlWriter = v11;
  if (v11) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = 0xFFFFFFFFLL;
  }
  CheckXMLResult(v12, @"xmlNewTextWriter");
  uint64_t v13 = xmlTextWriterSetIndent(self->_xmlWriter, 0);
  CheckXMLResult(v13, @"xmlTextWriterSetIndent");
  dtd = self->_dtd;
  if (dtd)
  {
    BOOL v15 = [(ENXMLDTD *)dtd docTypeDeclaration];

    if (v15)
    {
      xmlWriter = self->_xmlWriter;
      CharEncodingName = xmlGetCharEncodingName(XML_CHAR_ENCODING_UTF8);
      uint64_t started = xmlTextWriterStartDocument(xmlWriter, 0, CharEncodingName, "no");
      CheckXMLResult(started, @"xmlTextWriterStartDocument");
      long long v19 = self->_xmlWriter;
      id v20 = [(ENXMLDTD *)self->_dtd docTypeDeclaration];
      uint64_t v21 = xmlTextWriterWriteRaw(v19, (const xmlChar *)[v20 cStringUsingEncoding:4]);

      CheckXMLResult(v21, @"xmlTextWriterWriteRaw");
    }
  }
  uint64_t v22 = xmlTextWriterWriteRaw(self->_xmlWriter, (const xmlChar *)"\n");
  CheckXMLResult(v22, @"xmlTextWriterWriteRaw");
}

- (void)dealloc
{
  xmlWriter = self->_xmlWriter;
  if (xmlWriter)
  {
    xmlFreeTextWriter(xmlWriter);
    self->_xmlWriter = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)ENXMLWriter;
  [(ENXMLWriter *)&v4 dealloc];
}

- (ENXMLWriter)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ENXMLWriter;
  v5 = [(ENXMLWriter *)&v8 init];
  id v6 = v5;
  if (v5) {
    [(ENXMLWriter *)v5 setDelegate:v4];
  }

  return v6;
}

- (ENXMLWriter)init
{
  return [(ENXMLWriter *)self initWithDelegate:0];
}

@end