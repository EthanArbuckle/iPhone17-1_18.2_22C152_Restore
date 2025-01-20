@interface CoreDAVXMLData
+ (BOOL)string:(id)a3 isEqualToXmlCharString:(const char *)a4;
- (BOOL)shouldAddFormattingSpaces;
- (CoreDAVXMLData)init;
- (NSData)data;
- (const)_prefixForNameSpace:(const char *)a3;
- (void)_startElement:(id)a3 inNamespace:(id)a4;
- (void)_startElement:(id)a3 inNamespace:(id)a4 withAttributeNamesAndValues:(id)a5 attributes:(char *)a6;
- (void)appendElement:(id)a3 inNamespace:(id)a4 withStringContent:(id)a5 withAttributeNamesAndValues:(id)a6;
- (void)appendElement:(id)a3 inNamespace:(id)a4 withStringContentAsCDATA:(id)a5 withAttributeNamesAndValues:(id)a6;
- (void)dealloc;
- (void)endElement:(id)a3 inNamespace:(id)a4;
- (void)setShouldAddFormattingSpaces:(BOOL)a3;
- (void)startElement:(id)a3 inNamespace:(id)a4 withAttributeNamesAndValues:(id)a5;
- (void)startElement:(id)a3 inNamespace:(id)a4 withAttributes:(id)a5;
@end

@implementation CoreDAVXMLData

- (CoreDAVXMLData)init
{
  v12.receiver = self;
  v12.super_class = (Class)CoreDAVXMLData;
  v2 = [(CoreDAVXMLData *)&v12 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    dataImpl = v2->_dataImpl;
    v2->_dataImpl = (CoreDAVXMLData_Impl *)v3;

    initializeLibXMLParser();
    v2->_dataImpl->_writer = xmlNewTextWriterDoc(&v2->_dataImpl->_doc, 0);
    xmlTextWriterStartDocument(v2->_dataImpl->_writer, cdXMLVersion, cdXMLEncoding, 0);
    uint64_t v5 = objc_opt_new();
    seenURIsToPrefixes = v2->_seenURIsToPrefixes;
    v2->_seenURIsToPrefixes = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    seenURIsToDepth = v2->_seenURIsToDepth;
    v2->_seenURIsToDepth = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_opt_new();
    elementStack = v2->_elementStack;
    v2->_elementStack = (NSMutableArray *)v9;

    [(CoreDAVXMLData *)v2 setShouldAddFormattingSpaces:1];
  }
  return v2;
}

- (void)dealloc
{
  xmlFreeTextWriter(self->_dataImpl->_writer);
  xmlFreeDoc(self->_dataImpl->_doc);
  v3.receiver = self;
  v3.super_class = (Class)CoreDAVXMLData;
  [(CoreDAVXMLData *)&v3 dealloc];
}

- (const)_prefixForNameSpace:(const char *)a3
{
  if (_prefixForNameSpace__pred != -1) {
    dispatch_once(&_prefixForNameSpace__pred, &__block_literal_global_3);
  }
  v6 = [NSString stringWithUTF8String:a3];
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0;
  uint64_t v7 = _prefixForNameSpace___sPrefixQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__CoreDAVXMLData__prefixForNameSpace___block_invoke_2;
  block[3] = &unk_2641E0108;
  v23 = &v24;
  id v8 = v6;
  id v22 = v8;
  dispatch_sync(v7, block);
  uint64_t v9 = (const char *)v25[3];
  if (!v9)
  {
    v10 = malloc_type_calloc(2uLL, 1uLL, 0x100004077774924uLL);
    v25[3] = (uint64_t)v10;
    char v11 = _prefixForNameSpace__sNextPrefix++;
    unsigned char *v10 = v11;
    objc_super v12 = _prefixForNameSpace___sPrefixQueue;
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    v17 = __38__CoreDAVXMLData__prefixForNameSpace___block_invoke_3;
    v18 = &unk_2641E0130;
    id v19 = v8;
    v20 = &v24;
    dispatch_sync(v12, &v15);
    if (_prefixForNameSpace__sNextPrefix >= 0x5Bu)
    {
      v14 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", v15, v16, v17, v18);
      [v14 handleFailureInMethod:a2 object:self file:@"CoreDAVXMLData.m" lineNumber:78 description:@"Whoops- we're out of XML namespaces!"];
    }
    uint64_t v9 = (const char *)v25[3];
  }

  _Block_object_dispose(&v24, 8);
  return v9;
}

uint64_t __38__CoreDAVXMLData__prefixForNameSpace___block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.coredav.namespacequeue", 0);
  v1 = (void *)_prefixForNameSpace___sPrefixQueue;
  _prefixForNameSpace___sPrefixQueue = (uint64_t)v0;

  uint64_t v2 = objc_opt_new();
  uint64_t v3 = _prefixForNameSpace___sNamespacePrefixes;
  _prefixForNameSpace___sNamespacePrefixes = v2;
  return MEMORY[0x270F9A758](v2, v3);
}

void __38__CoreDAVXMLData__prefixForNameSpace___block_invoke_2(uint64_t a1)
{
  id v2 = [(id)_prefixForNameSpace___sNamespacePrefixes objectForKeyedSubscript:*(void *)(a1 + 32)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 pointerValue];
}

void __38__CoreDAVXMLData__prefixForNameSpace___block_invoke_3(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08D40] valueWithPointer:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  [(id)_prefixForNameSpace___sNamespacePrefixes setObject:v2 forKeyedSubscript:*(void *)(a1 + 32)];
}

- (void)_startElement:(id)a3 inNamespace:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = (const xmlChar *)[a3 UTF8String];
  id v8 = v6;
  uint64_t v9 = [v8 UTF8String];
  if (v9)
  {
    v10 = (const xmlChar *)v9;
    char v11 = [(NSMutableDictionary *)self->_seenURIsToPrefixes objectForKeyedSubscript:v8];
    objc_super v12 = (const xmlChar *)[v11 pointerValue];

    if (!v12)
    {
      v13 = [(CoreDAVXMLData *)self _prefixForNameSpace:v10];
      if (v13)
      {
        objc_super v12 = (const xmlChar *)v13;
        v14 = [MEMORY[0x263F08D40] valueWithPointer:v13];
        [(NSMutableDictionary *)self->_seenURIsToPrefixes setObject:v14 forKeyedSubscript:v8];
      }
      else
      {
        v17 = +[CoreDAVLogging sharedLogging];
        v18 = [v17 logHandleForAccountInfoProvider:0];
        id v19 = v18;
        if (v18 && os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          int v27 = 136315138;
          v28 = v10;
          _os_log_impl(&dword_213BFC000, v19, OS_LOG_TYPE_ERROR, "Unknown namespace being written %s.  This will not go well", (uint8_t *)&v27, 0xCu);
        }

        objc_super v12 = 0;
      }
    }
    uint64_t v20 = [(NSMutableArray *)self->_elementStack count];
    v21 = [(NSMutableDictionary *)self->_seenURIsToDepth objectForKey:v8];

    if (v21)
    {
      id v22 = [(NSMutableDictionary *)self->_seenURIsToDepth objectForKeyedSubscript:v8];
      uint64_t v23 = [v22 integerValue];

      if (v20 > v23)
      {
        v10 = 0;
LABEL_15:
        elementStack = self->_elementStack;
        uint64_t v26 = [MEMORY[0x263F08D40] valueWithPointer:v7];
        [(NSMutableArray *)elementStack addObject:v26];

        xmlTextWriterStartElementNS(self->_dataImpl->_writer, v12, v7, v10);
        goto LABEL_16;
      }
      if (v20 >= v23) {
        goto LABEL_15;
      }
    }
    uint64_t v24 = [NSNumber numberWithInteger:v20];
    [(NSMutableDictionary *)self->_seenURIsToDepth setObject:v24 forKeyedSubscript:v8];

    goto LABEL_15;
  }
  uint64_t v15 = self->_elementStack;
  uint64_t v16 = [MEMORY[0x263F08D40] valueWithPointer:v7];
  [(NSMutableArray *)v15 addObject:v16];

  xmlTextWriterStartElement(self->_dataImpl->_writer, v7);
LABEL_16:
}

- (void)_startElement:(id)a3 inNamespace:(id)a4 withAttributeNamesAndValues:(id)a5 attributes:(char *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v25 = a6;
  [(CoreDAVXMLData *)self _startElement:v10 inNamespace:v11];
  if (v12)
  {
    id v13 = *(id *)a6;
    xmlTextWriterStartAttributeNS(self->_dataImpl->_writer, 0, (const xmlChar *)[v12 UTF8String], 0);
    writer = self->_dataImpl->_writer;
    id v15 = v13;
    xmlTextWriterWriteString(writer, (const xmlChar *)[v15 UTF8String]);
    xmlTextWriterEndAttribute(self->_dataImpl->_writer);
    uint64_t v16 = (id *)(v25 + 8);
    uint64_t v26 = (id *)(v25 + 16);
    id v17 = *v16;
    if (v17)
    {
      id v18 = v17;
      id v19 = 0;
      do
      {
        id v20 = *v26;

        v21 = self->_dataImpl->_writer;
        id v22 = v18;
        xmlTextWriterStartAttributeNS(v21, 0, (const xmlChar *)[v22 UTF8String], 0);
        uint64_t v23 = self->_dataImpl->_writer;
        id v19 = v20;
        xmlTextWriterWriteString(v23, (const xmlChar *)[v19 UTF8String]);
        xmlTextWriterEndAttribute(self->_dataImpl->_writer);
        uint64_t v24 = v26 + 1;
        v26 += 2;
        id v18 = *v24;
      }
      while (v18);
    }
  }
}

- (void)startElement:(id)a3 inNamespace:(id)a4 withAttributeNamesAndValues:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (self->_docHasEnded)
  {
    id v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"CoreDAVXMLData.m", 145, @"You cannot append to %@ after getting its data", objc_opt_class() object file lineNumber description];
  }
  [(CoreDAVXMLData *)self _startElement:v9 inNamespace:v10 withAttributeNamesAndValues:v11 attributes:&v13];
}

- (void)startElement:(id)a3 inNamespace:(id)a4 withAttributes:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (self->_docHasEnded)
  {
    id v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"CoreDAVXMLData.m", 153, @"You cannot append to %@ after getting its data", objc_opt_class() object file lineNumber description];
  }
  [(CoreDAVXMLData *)self _startElement:v9 inNamespace:v10];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __58__CoreDAVXMLData_startElement_inNamespace_withAttributes___block_invoke;
  v13[3] = &unk_2641DFEC0;
  v13[4] = self;
  [v11 enumerateKeysAndObjectsUsingBlock:v13];
}

uint64_t __58__CoreDAVXMLData_startElement_inNamespace_withAttributes___block_invoke(uint64_t a1, id a2, void *a3)
{
  uint64_t v5 = *(xmlTextWriter **)(*(void *)(*(void *)(a1 + 32) + 16) + 8);
  id v6 = a2;
  id v7 = a3;
  xmlTextWriterStartAttributeNS(v5, 0, (const xmlChar *)[v6 UTF8String], 0);
  id v8 = *(xmlTextWriter **)(*(void *)(*(void *)(a1 + 32) + 16) + 8);
  id v9 = v7;
  id v10 = (const xmlChar *)[v9 UTF8String];

  xmlTextWriterWriteString(v8, v10);
  id v11 = *(xmlTextWriter **)(*(void *)(*(void *)(a1 + 32) + 16) + 8);
  return xmlTextWriterEndAttribute(v11);
}

- (void)endElement:(id)a3 inNamespace:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v7;
  uint64_t v10 = [v9 UTF8String];
  id v11 = v8;
  uint64_t v12 = [v11 UTF8String];

  if (self->_docHasEnded)
  {
    id v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"CoreDAVXMLData.m", 166, @"You cannot append to %@ after getting its data", objc_opt_class() object file lineNumber description];
  }
  if (![(NSMutableArray *)self->_elementStack count])
  {
    id v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"CoreDAVXMLData.m" lineNumber:168 description:@"You can't end an element if there aren't any on the stack"];
  }
  uint64_t v13 = [(NSMutableArray *)self->_elementStack lastObject];
  uint64_t v14 = [(id)v13 pointerValue];

  LOBYTE(v13) = [(id)objc_opt_class() string:v9 isEqualToXmlCharString:v14];
  if ((v13 & 1) == 0)
  {
    v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"CoreDAVXMLData.m", 171, @"You tried to end element %s, but the last element on the stack was %s.", v10, v14 object file lineNumber description];
  }
  [(NSMutableArray *)self->_elementStack removeLastObject];
  xmlTextWriterFullEndElement(self->_dataImpl->_writer);
  if (v11 && v12)
  {
    uint64_t v15 = [(NSMutableArray *)self->_elementStack count];
    id v22 = [NSString stringWithUTF8String:v12];
    uint64_t v16 = -[NSMutableDictionary objectForKey:](self->_seenURIsToDepth, "objectForKey:");

    if (v16)
    {
      id v17 = [(NSMutableDictionary *)self->_seenURIsToDepth objectForKeyedSubscript:v22];
      uint64_t v18 = [v17 integerValue];

      if (v18 == v15) {
        [(NSMutableDictionary *)self->_seenURIsToDepth removeObjectForKey:v22];
      }
    }
  }
}

- (void)appendElement:(id)a3 inNamespace:(id)a4 withStringContent:(id)a5 withAttributeNamesAndValues:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (self->_docHasEnded)
  {
    uint64_t v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"CoreDAVXMLData.m", 193, @"You cannot append to %@ after getting its data", objc_opt_class() object file lineNumber description];
  }
  [(CoreDAVXMLData *)self _startElement:v11 inNamespace:v12 withAttributeNamesAndValues:v14 attributes:&v16];
  if ([v13 length]) {
    xmlTextWriterWriteString(self->_dataImpl->_writer, (const xmlChar *)[v13 UTF8String]);
  }
  [(CoreDAVXMLData *)self endElement:v11 inNamespace:v12];
}

- (void)appendElement:(id)a3 inNamespace:(id)a4 withStringContentAsCDATA:(id)a5 withAttributeNamesAndValues:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (self->_docHasEnded)
  {
    v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"CoreDAVXMLData.m", 207, @"You cannot append to %@ after getting its data", objc_opt_class() object file lineNumber description];
  }
  v22[1] = &v23;
  [(CoreDAVXMLData *)self _startElement:v11 inNamespace:v12 withAttributeNamesAndValues:v14 attributes:&v23];
  if ([v13 length])
  {
    if (appendElement_inNamespace_withStringContentAsCDATA_withAttributeNamesAndValues__once != -1) {
      dispatch_once(&appendElement_inNamespace_withStringContentAsCDATA_withAttributeNamesAndValues__once, &__block_literal_global_26);
    }
    if ([v13 rangeOfCharacterFromSet:appendElement_inNamespace_withStringContentAsCDATA_withAttributeNamesAndValues__invalidXMLCharacterSet] == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v15 = v13;
    }
    else
    {
      uint64_t v15 = [MEMORY[0x263F089D8] string];
      uint64_t v16 = [MEMORY[0x263F08B08] scannerWithString:v13];
      [v16 setCharactersToBeSkipped:appendElement_inNamespace_withStringContentAsCDATA_withAttributeNamesAndValues__invalidXMLCharacterSet];
      if (([v16 isAtEnd] & 1) == 0)
      {
        id v17 = 0;
        do
        {

          v22[0] = 0;
          int v18 = [v16 scanUpToCharactersFromSet:appendElement_inNamespace_withStringContentAsCDATA_withAttributeNamesAndValues__invalidXMLCharacterSet intoString:v22];
          id v19 = v22[0];
          id v17 = v19;
          if (v18 && [v19 length]) {
            [v15 appendString:v17];
          }
        }
        while (![v16 isAtEnd]);
      }
    }
    writer = self->_dataImpl->_writer;
    id v13 = v15;
    xmlTextWriterWriteCDATA(writer, (const xmlChar *)[v13 UTF8String]);
  }
  [(CoreDAVXMLData *)self endElement:v11 inNamespace:v12];
}

void __97__CoreDAVXMLData_appendElement_inNamespace_withStringContentAsCDATA_withAttributeNamesAndValues___block_invoke()
{
  id v2 = [MEMORY[0x263F089C0] characterSetWithCharactersInString:@"\t\n\r"];
  objc_msgSend(v2, "addCharactersInRange:", 32, 55264);
  objc_msgSend(v2, "addCharactersInRange:", 57344, 8190);
  objc_msgSend(v2, "addCharactersInRange:", 0x10000, 0x100000);
  uint64_t v0 = [v2 invertedSet];
  v1 = (void *)appendElement_inNamespace_withStringContentAsCDATA_withAttributeNamesAndValues__invalidXMLCharacterSet;
  appendElement_inNamespace_withStringContentAsCDATA_withAttributeNamesAndValues__invalidXMLCharacterSet = v0;
}

- (NSData)data
{
  if (!self->_docHasEnded)
  {
    self->_docHasEnded = 1;
    xmlTextWriterEndDocument(self->_dataImpl->_writer);
  }
  int size = 0;
  uint64_t v5 = 0;
  xmlDocDumpFormatMemory(self->_dataImpl->_doc, &v5, &size, [(CoreDAVXMLData *)self shouldAddFormattingSpaces]);
  uint64_t v3 = [MEMORY[0x263EFF8F8] dataWithBytes:v5 length:size];
  ((void (*)(xmlChar *))*MEMORY[0x263F8C880])(v5);
  return (NSData *)v3;
}

+ (BOOL)string:(id)a3 isEqualToXmlCharString:(const char *)a4
{
  id v5 = a3;
  if ([v5 length])
  {
    if (a4)
    {
      size_t v6 = strlen(a4);
      if (v6)
      {
        id v7 = (void *)[objc_allocWithZone(NSString) initWithBytes:a4 length:v6 encoding:4];
        LOBYTE(a4) = [v5 isEqualToString:v7];
      }
      else
      {
        LOBYTE(a4) = 0;
      }
    }
  }
  else if (a4)
  {
    LOBYTE(a4) = *a4 == 0;
  }
  else
  {
    LOBYTE(a4) = 1;
  }

  return (char)a4;
}

- (BOOL)shouldAddFormattingSpaces
{
  return self->_shouldAddFormattingSpaces;
}

- (void)setShouldAddFormattingSpaces:(BOOL)a3
{
  self->_shouldAddFormattingSpaces = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementStack, 0);
  objc_storeStrong((id *)&self->_seenURIsToDepth, 0);
  objc_storeStrong((id *)&self->_seenURIsToPrefixes, 0);
  objc_storeStrong((id *)&self->_dataImpl, 0);
}

@end