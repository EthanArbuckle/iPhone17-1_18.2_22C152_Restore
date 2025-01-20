@interface ENXMLSaxParser
- (BOOL)isHTML;
- (BOOL)parseContents:(id)a3;
- (BOOL)parseContentsOfFile:(id)a3;
- (BOOL)parseContentsOfURL:(id)a3;
- (BOOL)parseContentsOfURLWithRequest:(id)a3;
- (BOOL)parseData:(id)a3;
- (ENXMLSaxParser)init;
- (ENXMLSaxParserDelegate)delegate;
- (_xmlEntity)lookupEntity:(const char *)a3;
- (_xmlSAXHandler)saxHandler;
- (void)_stopAndSendError:(id)a3;
- (void)appendBytes:(char *)a3 length:(int)a4;
- (void)appendData:(id)a3;
- (void)connection:(id)a3 didFailWithError:(id)a4;
- (void)connection:(id)a3 didReceiveData:(id)a4;
- (void)connection:(id)a3 didReceiveResponse:(id)a4;
- (void)dealloc;
- (void)finalizeParser;
- (void)setDelegate:(id)a3;
- (void)setIsHTML:(BOOL)a3;
- (void)stopParser;
@end

@implementation ENXMLSaxParser

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dtds, 0);
  objc_storeStrong((id *)&self->_urlConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setIsHTML:(BOOL)a3
{
  self->_isHTML = a3;
}

- (BOOL)isHTML
{
  return self->_isHTML;
}

- (void)setDelegate:(id)a3
{
}

- (ENXMLSaxParserDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ENXMLSaxParserDelegate *)WeakRetained;
}

- (void)connection:(id)a3 didReceiveData:(id)a4
{
}

- (void)connection:(id)a3 didReceiveResponse:(id)a4
{
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v7 statusCode] != 200)
  {
    if (v7)
    {
      v5 = [NSDictionary dictionaryWithObject:v7 forKey:@"response"];
    }
    else
    {
      v5 = 0;
    }
    v6 = [MEMORY[0x263F087E8] errorWithDomain:@"ENXMLSaxParserErrorDomain" code:1002 userInfo:v5];
    [(ENXMLSaxParser *)self _stopAndSendError:v6];
  }
}

- (void)connection:(id)a3 didFailWithError:(id)a4
{
}

- (void)_stopAndSendError:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained parser:self didFailWithError:v5];
  }
  [(ENXMLSaxParser *)self stopParser];
}

- (void)stopParser
{
  urlConnection = self->_urlConnection;
  if (urlConnection)
  {
    [(NSURLConnection *)urlConnection cancel];
    v4 = self->_urlConnection;
    self->_urlConnection = 0;
  }
  parserContext = self->_parserContext;
  if (parserContext) {
    xmlStopParser(parserContext);
  }
  self->_parserHalted = 1;
}

- (BOOL)parseContentsOfURL:(id)a3
{
  id v4 = a3;
  if ([v4 isFileURL])
  {
    id v5 = [v4 path];

    BOOL v6 = [(ENXMLSaxParser *)self parseContentsOfFile:v5];
  }
  else
  {
    id v5 = [MEMORY[0x263EFC630] requestWithURL:v4];

    BOOL v6 = [(ENXMLSaxParser *)self parseContentsOfURLWithRequest:v5];
  }
  BOOL v7 = v6;

  return v7;
}

- (BOOL)parseContentsOfURLWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(ENXMLSaxParser *)self delegate];

  BOOL v6 = 0;
  if (v4 && v5)
  {
    uint64_t v7 = [(ENXMLSaxParser *)self stopParser];
    self->_parserHalted = 0;
    v8 = (void *)MEMORY[0x23ECE6170](v7);
    v9 = (NSURLConnection *)[objc_alloc(MEMORY[0x263EFC608]) initWithRequest:v4 delegate:self];
    urlConnection = self->_urlConnection;
    self->_urlConnection = v9;

    v11 = self->_urlConnection;
    BOOL v6 = v11 != 0;
    if (v11)
    {
      v12 = [MEMORY[0x263EFF9F0] currentRunLoop];
      uint64_t v13 = *MEMORY[0x263EFF478];
      [(NSURLConnection *)self->_urlConnection scheduleInRunLoop:v12 forMode:*MEMORY[0x263EFF478]];
      [(NSURLConnection *)self->_urlConnection start];
      do
      {
        if (self->_parserHalted) {
          break;
        }
        v14 = [MEMORY[0x263EFF910] distantFuture];
        char v15 = [v12 runMode:v13 beforeDate:v14];
      }
      while ((v15 & 1) != 0);
      [(ENXMLSaxParser *)self finalizeParser];
      [(NSURLConnection *)self->_urlConnection cancel];
      [(NSURLConnection *)self->_urlConnection unscheduleFromRunLoop:v12 forMode:v13];
      v16 = self->_urlConnection;
      self->_urlConnection = 0;
    }
  }

  return v6;
}

- (BOOL)parseContents:(id)a3
{
  id v4 = a3;
  [(ENXMLSaxParser *)self stopParser];
  id v5 = [v4 dataUsingEncoding:4];

  [(ENXMLSaxParser *)self appendData:v5];
  [(ENXMLSaxParser *)self finalizeParser];
  return 1;
}

- (BOOL)parseData:(id)a3
{
  id v4 = a3;
  [(ENXMLSaxParser *)self stopParser];
  [(ENXMLSaxParser *)self appendData:v4];

  [(ENXMLSaxParser *)self finalizeParser];
  return 1;
}

- (BOOL)parseContentsOfFile:(id)a3
{
  id v4 = a3;
  id v5 = [(ENXMLSaxParser *)self delegate];

  if (v5)
  {
    BOOL v6 = [MEMORY[0x263F08850] defaultManager];
    id v23 = 0;
    uint64_t v7 = [v6 attributesOfItemAtPath:v4 error:&v23];
    id v8 = v23;

    if (v7)
    {
      if ([v7 fileSize])
      {
        [(ENXMLSaxParser *)self stopParser];
        v9 = [MEMORY[0x263EFF950] inputStreamWithFileAtPath:v4];
        v10 = v9;
        if (v9)
        {
          [v9 open];
          self->_parserHalted = 0;
          size_t v11 = getpagesize();
          v12 = malloc_type_calloc(v11, 1uLL, 0xEEA8271FuLL);
          while (!self->_parserHalted)
          {
            uint64_t v13 = [v10 read:v12 maxLength:v11];
            uint64_t v14 = v13;
            if ((v13 & 0x80000000) != 0)
            {
              v18 = +[ENSession sharedSession];
              v19 = [v18 logger];
              v20 = objc_msgSend(NSString, "stringWithFormat:", @"read:maxLength: returned: %i", v14);
              [v19 evernoteLogInfoString:v20];

LABEL_16:
              self->_parserHalted = 1;
              break;
            }
            if (!v13) {
              goto LABEL_16;
            }
            [(ENXMLSaxParser *)self appendBytes:v12 length:v13];
          }
          free(v12);
          [(ENXMLSaxParser *)self finalizeParser];
          [v10 close];
          BOOL v15 = 1;
          goto LABEL_18;
        }
LABEL_14:
        BOOL v15 = 0;
LABEL_18:

        goto LABEL_19;
      }
      v10 = +[ENSession sharedSession];
      v16 = [v10 logger];
      [NSString stringWithFormat:@"The file %@ is 0 bytes!", v4, v22];
    }
    else
    {
      v10 = +[ENSession sharedSession];
      v16 = [v10 logger];
      [NSString stringWithFormat:@"attributesOfItemAtPath:%@ returned error:%@", v4, v8];
    v17 = };
    [v16 evernoteLogErrorString:v17];

    goto LABEL_14;
  }
  BOOL v15 = 0;
LABEL_19:

  return v15;
}

- (void)finalizeParser
{
  parserContext = self->_parserContext;
  if (parserContext)
  {
    if (self->_isHTML) {
      htmlParseChunk(parserContext, 0, 0, 1);
    }
    else {
      xmlParseChunk(parserContext, 0, 0, 1);
    }
    xmlFreeParserCtxt(self->_parserContext);
    self->_parserContext = 0;
    self->_parserHalted = 1;
  }
}

- (void)appendData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 bytes];
  uint64_t v6 = [v4 length];

  [(ENXMLSaxParser *)self appendBytes:v5 length:v6];
}

- (void)appendBytes:(char *)a3 length:(int)a4
{
  parserContext = self->_parserContext;
  if (parserContext)
  {
    if (self->_isHTML)
    {
      htmlParseChunk(parserContext, a3, a4, 0);
    }
    else
    {
      xmlParseChunk(parserContext, a3, a4, 0);
    }
  }
  else
  {
    -[ENXMLSaxParser saxHandler](self, "saxHandler", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0);
    if (self->_isHTML)
    {
      self->_parserContext = htmlCreatePushParserCtxt(&v9, self, a3, a4, 0, XML_CHAR_ENCODING_UTF8);
    }
    else
    {
      xmlParserCtxtPtr v8 = xmlCreatePushParserCtxt(&v9, self, a3, a4, 0);
      self->_parserContext = v8;
      xmlCtxtUseOptions(v8, 1);
    }
  }
}

- (_xmlSAXHandler)saxHandler
{
  *(_OWORD *)&retstr->_private = 0u;
  *(_OWORD *)&retstr->endElementNs = 0u;
  *(_OWORD *)&retstr->getParameterEntity = 0u;
  *(_OWORD *)&retstr->externalSubset = 0u;
  *(_OWORD *)&retstr->comment = 0u;
  *(_OWORD *)&retstr->error = 0u;
  *(_OWORD *)&retstr->reference = 0u;
  *(_OWORD *)&retstr->ignorableWhitespace = 0u;
  *(_OWORD *)&retstr->startDocument = 0u;
  *(_OWORD *)&retstr->startElement = 0u;
  *(_OWORD *)&retstr->attributeDecl = 0u;
  *(_OWORD *)&retstr->unparsedEntityDecl = 0u;
  *(_OWORD *)&retstr->resolveEntity = 0u;
  *(_OWORD *)&retstr->entityDecl = 0u;
  *(_OWORD *)&retstr->internalSubset = 0u;
  *(_OWORD *)&retstr->hasInternalSubset = 0u;
  if (objc_loadWeakRetained((id *)&self->_delegate))
  {
    if (objc_opt_respondsToSelector()) {
      retstr->comment = (commentSAXFunc)commentBlockSAXCallback;
    }
    if (objc_opt_respondsToSelector()) {
      retstr->characters = (charactersSAXFunc)charactersSAXCallback;
    }
    if (objc_opt_respondsToSelector()) {
      retstr->startDocument = (startDocumentSAXFunc)startDocumentSAXCallback;
    }
    if (objc_opt_respondsToSelector()) {
      retstr->endDocument = (endDocumentSAXFunc)endDocumentSAXCallback;
    }
    if (objc_opt_respondsToSelector()) {
      retstr->startElement = (startElementSAXFunc)startElementSAXCallback;
    }
    if (objc_opt_respondsToSelector()) {
      retstr->endElement = (endElementSAXFunc)endElementSAXCallback;
    }
    if (objc_opt_respondsToSelector()) {
      retstr->cdataBlock = (cdataBlockSAXFunc)cdataBlockSAXCallback;
    }
  }
  retstr->getEntity = (getEntitySAXFunc)getEntitySAXCallback;
  retstr->fatalError = (fatalErrorSAXFunc)fatalErrorCallback;
  retstr->error = (errorSAXFunc)errorCallback;
  return (_xmlSAXHandler *)MEMORY[0x270F9A790]();
}

- (_xmlEntity)lookupEntity:(const char *)a3
{
  v3 = (char *)a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (a3) {
    v3 = (char *)[objc_allocWithZone(NSString) initWithBytes:a3 length:strlen(a3) encoding:4];
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self->_dtds;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "xmlEntityNamed:", v3, (void)v13);
        if (v10)
        {
          size_t v11 = (_xmlEntity *)v10;
          goto LABEL_13;
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  size_t v11 = 0;
LABEL_13:

  return v11;
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_delegate, 0);
  [(ENXMLSaxParser *)self stopParser];
  dtds = self->_dtds;
  self->_dtds = 0;

  v4.receiver = self;
  v4.super_class = (Class)ENXMLSaxParser;
  [(ENXMLSaxParser *)&v4 dealloc];
}

- (ENXMLSaxParser)init
{
  v10.receiver = self;
  v10.super_class = (Class)ENXMLSaxParser;
  v2 = [(ENXMLSaxParser *)&v10 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263EFF8C0]);
    objc_super v4 = +[ENXMLDTD lat1DTD];
    uint64_t v5 = +[ENXMLDTD symbolDTD];
    uint64_t v6 = +[ENXMLDTD specialDTD];
    uint64_t v7 = objc_msgSend(v3, "initWithObjects:", v4, v5, v6, 0);
    dtds = v2->_dtds;
    v2->_dtds = (NSArray *)v7;
  }
  return v2;
}

@end