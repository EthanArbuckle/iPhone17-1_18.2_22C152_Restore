@interface NSXMLParser
+ (id)currentParser;
+ (void)setCurrentParser:(id)a3;
- (BOOL)_handleParseResult:(int64_t)a3;
- (BOOL)finishIncrementalParse;
- (BOOL)parseData:(id)a3;
- (BOOL)parseFromStream;
- (BOOL)shouldContinueAfterFatalError;
- (BOOL)shouldProcessNamespaces;
- (BOOL)shouldReportNamespacePrefixes;
- (BOOL)shouldResolveExternalEntities;
- (NSError)parserError;
- (NSInteger)columnNumber;
- (NSInteger)lineNumber;
- (NSSet)allowedExternalEntityURLs;
- (NSString)publicID;
- (NSString)systemID;
- (NSXMLParser)initWithContentsOfURL:(NSURL *)url;
- (NSXMLParser)initWithData:(NSData *)data;
- (NSXMLParser)initWithStream:(NSInputStream *)stream;
- (NSXMLParserExternalEntityResolvingPolicy)externalEntityResolvingPolicy;
- (_xmlParserInput)_xmlExternalEntityWithURL:(const char *)a3 identifier:(const char *)a4 context:(_xmlParserCtxt *)a5 originalLoaderFunction:(void *)a6;
- (id)delegate;
- (id)initForIncrementalParsing;
- (void)_initializeSAX2Callbacks;
- (void)_popNamespaces;
- (void)_pushNamespaces:(id)a3;
- (void)_setExpandedParserError:(id)a3;
- (void)_setParserError:(int64_t)a3;
- (void)abortParsing;
- (void)dealloc;
- (void)setAllowedExternalEntityURLs:(NSSet *)allowedExternalEntityURLs;
- (void)setDelegate:(id)delegate;
- (void)setExternalEntityResolvingPolicy:(NSXMLParserExternalEntityResolvingPolicy)externalEntityResolvingPolicy;
- (void)setShouldContinueAfterFatalError:(BOOL)a3;
- (void)setShouldProcessNamespaces:(BOOL)shouldProcessNamespaces;
- (void)setShouldReportNamespacePrefixes:(BOOL)shouldReportNamespacePrefixes;
- (void)setShouldResolveExternalEntities:(BOOL)shouldResolveExternalEntities;
@end

@implementation NSXMLParser

- (void)_popNamespaces
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSMutableArray *)self->_namespaces count] - 1;
  v4 = (void *)[(NSMutableArray *)self->_namespaces objectAtIndex:v3];
  if ((objc_msgSend(v4, "isEqual:", objc_msgSend(MEMORY[0x1E4F1CA98], "null")) & 1) == 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v9 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          [self->_delegate parser:self didEndMappingPrefix:*(void *)(*((void *)&v10 + 1) + 8 * v8++)];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v9 count:16];
      }
      while (v6);
    }
  }
  [(NSMutableArray *)self->_namespaces removeObjectAtIndex:v3];
}

- (NSXMLParser)initWithData:(NSData *)data
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (_NSSetupLibXML_xmlInitGuard != -1) {
    dispatch_once(&_NSSetupLibXML_xmlInitGuard, &__block_literal_global_56);
  }
  v8.receiver = self;
  v8.super_class = (Class)NSXMLParser;
  uint64_t v5 = [(NSXMLParser *)&v8 init];
  if (v5)
  {
    v5->_saxHandler = (_xmlSAXHandler *)malloc_type_malloc(0x100uLL, 0x1080040AADF51B8uLL);
    v5->_parserContext = 0;
    v5->_parserFlags = 0;
    v5->_error = 0;
    CFDictionaryKeyCallBacks keyCallBacks = *(CFDictionaryKeyCallBacks *)byte_1ECA5C170;
    v5->_slowStringMap = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, &keyCallBacks, MEMORY[0x1E4F1D540]);
    if (!_CFExecutableLinkedOnOrAfter()) {
      v5->_parserFlags |= 0x20uLL;
    }
    [(NSXMLParser *)v5 _initializeSAX2Callbacks];
    v5->_parserFlags |= 0xC0uLL;
    v5->_namespaces = 0;
    if (data)
    {
      v5->xmlParserStream = (NSInputStream *)(id)[MEMORY[0x1E4F1CA10] inputStreamWithData:data];
      if ([(NSData *)data length] >> 20) {
        uint64_t v6 = 0x100000;
      }
      else {
        uint64_t v6 = [(NSData *)data length];
      }
    }
    else
    {
      uint64_t v6 = 32 * *MEMORY[0x1E4F14B00];
    }
    v5->_chunkSize = v6;
  }
  return v5;
}

- (void)_initializeSAX2Callbacks
{
  saxHandler = self->_saxHandler;
  *(_OWORD *)&saxHandler->internalSubset = 0u;
  *(_OWORD *)&saxHandler->hasInternalSubset = 0u;
  *(_OWORD *)&saxHandler->resolveEntity = 0u;
  *(_OWORD *)&saxHandler->entityDecl = 0u;
  *(_OWORD *)&saxHandler->attributeDecl = 0u;
  *(_OWORD *)&saxHandler->unparsedEntityDecl = 0u;
  *(_OWORD *)&saxHandler->startDocument = 0u;
  *(_OWORD *)&saxHandler->startElement = 0u;
  *(_OWORD *)&saxHandler->_private = 0u;
  *(_OWORD *)&saxHandler->endElementNs = 0u;
  *(_OWORD *)&saxHandler->getParameterEntity = 0u;
  *(_OWORD *)&saxHandler->externalSubset = 0u;
  *(_OWORD *)&saxHandler->comment = 0u;
  *(_OWORD *)&saxHandler->error = 0u;
  *(_OWORD *)&saxHandler->reference = 0u;
  *(_OWORD *)&saxHandler->ignorableWhitespace = 0u;
  saxHandler->internalSubset = (internalSubsetSAXFunc)_internalSubset2;
  saxHandler->isStandalone = (isStandaloneSAXFunc)_isStandalone;
  saxHandler->hasInternalSubset = (hasInternalSubsetSAXFunc)_hasInternalSubset2;
  saxHandler->hasExternalSubset = (hasExternalSubsetSAXFunc)_hasExternalSubset2;
  saxHandler->getEntity = (getEntitySAXFunc)_getEntity;
  saxHandler->entityDecl = (entityDeclSAXFunc)_entityDecl;
  saxHandler->notationDecl = (notationDeclSAXFunc)_notationDecl;
  saxHandler->attributeDecl = (attributeDeclSAXFunc)_attributeDecl;
  saxHandler->elementDecl = (elementDeclSAXFunc)_elementDecl;
  saxHandler->unparsedEntityDecl = (unparsedEntityDeclSAXFunc)_unparsedEntityDecl;
  saxHandler->setDocumentLocator = 0;
  saxHandler->startDocument = (startDocumentSAXFunc)_startDocument;
  saxHandler->startElement = 0;
  saxHandler->endElement = 0;
  saxHandler->endDocument = (endDocumentSAXFunc)_endDocument;
  saxHandler->startElementNs = (startElementNsSAX2Func)_startElementNs;
  saxHandler->endElementNs = (endElementNsSAX2Func)_endElementNs;
  saxHandler->serror = 0;
  saxHandler->reference = 0;
  saxHandler->characters = (charactersSAXFunc)_characters;
  saxHandler->ignorableWhitespace = 0;
  saxHandler->processingInstruction = (processingInstructionSAXFunc)_processingInstruction;
  saxHandler->warning = 0;
  saxHandler->error = (errorSAXFunc)_errorCallback;
  saxHandler->fatalError = 0;
  saxHandler->cdataBlock = (cdataBlockSAXFunc)_cdataBlock;
  saxHandler->comment = (commentSAXFunc)_comment;
  saxHandler->externalSubset = (externalSubsetSAXFunc)_externalSubset2;
  saxHandler->initialized = -554844497;
}

- (BOOL)parseFromStream
{
  uint64_t v3 = self;
  +[NSXMLParser setCurrentParser:self];
  xmlParserStream = self->xmlParserStream;
  if (xmlParserStream)
  {
    [(NSInputStream *)xmlParserStream open];
    size_t chunkSize = self->_chunkSize;
    uint64_t v6 = malloc_type_malloc(chunkSize, 0x100004077774924uLL);
    uint64_t v7 = [(NSInputStream *)self->xmlParserStream read:v6 maxLength:chunkSize];
    if (v7 == -1)
    {
      BOOL v9 = 0;
    }
    else
    {
      while (v7 >= 1)
      {
        objc_super v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v6 length:v7 freeWhenDone:0];
        [(NSXMLParser *)self parseData:v8];

        uint64_t v7 = [(NSInputStream *)self->xmlParserStream read:v6 maxLength:chunkSize];
      }
      BOOL v9 = [(NSXMLParser *)self finishIncrementalParse];
    }
    free(v6);
    [(NSInputStream *)self->xmlParserStream close];
  }
  else
  {
    -[NSXMLParser _setExpandedParserError:](self, "_setExpandedParserError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", -1, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"Could not open data stream", @"NSXMLParserErrorMessage", 0)));
    BOOL v9 = 0;
  }
  +[NSXMLParser setCurrentParser:0];

  return v9;
}

+ (void)setCurrentParser:(id)a3
{
  v4 = [+[NSThread currentThread] threadDictionary];
  uint64_t v5 = v4;
  if (a3)
  {
    if (dyld_program_sdk_at_least()
      && [(NSMutableDictionary *)v5 objectForKey:@"__CurrentNSXMLParser"])
    {
      uint64_t v7 = +[NSString stringWithFormat:@"%@", @"NSXMLParser does not support reentrant parsing."];
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v7 userInfo:0]);
    }
    uint64_t v6 = [+[NSThread currentThread] threadDictionary];
    [(NSMutableDictionary *)v6 setObject:a3 forKey:@"__CurrentNSXMLParser"];
  }
  else
  {
    [(NSMutableDictionary *)v4 removeObjectForKey:@"__CurrentNSXMLParser"];
  }
}

- (BOOL)parseData:(id)a3
{
  if ((self->_parserFlags & 0x40) == 0)
  {
    v20 = +[NSAssertionHandler currentHandler];
    Name = sel_getName(a2);
    v22 = (objc_class *)objc_opt_class();
    [(NSAssertionHandler *)v20 handleFailureInMethod:a2, self, @"NSXMLParser.m", 488, @"%s should only be called on an incremental %@", Name, NSStringFromClass(v22) object file lineNumber description];
  }
  xmlSetStructuredErrorFunc(self, (xmlStructuredErrorFunc)_structuredErrorFunc);
  if (self->_haveDetectedEncoding)
  {
    uint64_t v5 = xmlParseChunk(self->_parserContext, (const char *)[a3 bytes], objc_msgSend(a3, "length"), 0);
    if (self->_shouldStopXMLParser)
    {
      self->_shouldStopXMLParser = 0;
      xmlStopParser(self->_parserContext);
      if (v5 >= -1) {
        uint64_t v5 = -1;
      }
    }
    BOOL v6 = [(NSXMLParser *)self _handleParseResult:v5];
  }
  else
  {
    int v7 = [(NSData *)self->_bomChunk length];
    int v8 = [a3 length] + v7;
    bomChunk = self->_bomChunk;
    if (v8 > 3)
    {
      if (bomChunk)
      {
        id v11 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
        [v11 appendData:self->_bomChunk];
        [v11 appendData:a3];
      }
      else
      {
        id v11 = a3;
      }
      if (self->_delegate) {
        saxHandler = self->_saxHandler;
      }
      else {
        saxHandler = 0;
      }
      xmlParserCtxtPtr PushParserCtxt = xmlCreatePushParserCtxt(saxHandler, self, (const char *)[v11 bytes], 4, 0);
      self->_parserContext = PushParserCtxt;
      if ([(NSXMLParser *)self shouldResolveExternalEntities]) {
        int v14 = 7;
      }
      else {
        int v14 = 3;
      }
      if (saxHandler) {
        int v15 = v14;
      }
      else {
        int v15 = v14 | 0x60;
      }
      xmlCtxtUseOptions(PushParserCtxt, v15);
      self->_haveDetectedEncoding = 1;

      self->_bomChunk = 0;
      if (v8 >= 5)
      {
        uint64_t v16 = [v11 bytes] + 4;
        v17 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v16 length:(v8 - 4) freeWhenDone:0];
        [(NSXMLParser *)self parseData:v17];
      }
    }
    else if (bomChunk)
    {
      uint64_t v10 = (NSData *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
      [(NSData *)v10 appendData:self->_bomChunk];
      [(NSData *)v10 appendData:a3];

      self->_bomChunk = v10;
    }
    else
    {
      self->_bomChunk = (NSData *)a3;
    }
    BOOL v6 = 1;
  }
  xmlSetStructuredErrorFunc(0, 0);
  return v6;
}

- (BOOL)_handleParseResult:(int64_t)a3
{
  if (!a3) {
    return 1;
  }
  if (a3 != -1) {
    goto LABEL_7;
  }
  if (_CFExecutableLinkedOnOrAfter())
  {
    if (self->_delegateAborted)
    {
      uint64_t v5 = +[NSError errorWithDomain:@"NSXMLParserErrorDomain" code:512 userInfo:0];
      [(NSXMLParser *)self _setExpandedParserError:v5];
      [(NSXMLParser *)self delegate];
      if (objc_opt_respondsToSelector()) {
        objc_msgSend(-[NSXMLParser delegate](self, "delegate"), "parser:parseErrorOccurred:", self, v5);
      }
      return 0;
    }
LABEL_7:
    xmlErrorPtr LastError = xmlCtxtGetLastError(self->_parserContext);
    if (LastError && LastError->code == a3) {
      [(NSXMLParser *)self _setExpandedParserError:_NSErrorFromXMLError((uint64_t)LastError, (uint64_t)self)];
    }
    else {
      [(NSXMLParser *)self _setParserError:a3];
    }
    return 0;
  }
  return 1;
}

- (BOOL)shouldResolveExternalEntities
{
  return (LOBYTE(self->_parserFlags) >> 4) & 1;
}

- (BOOL)finishIncrementalParse
{
  uint64_t v3 = xmlParseChunk(self->_parserContext, 0, 0, 1);

  return [(NSXMLParser *)self _handleParseResult:v3];
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)delegate
{
  self->_delegate = delegate;
  char v4 = objc_opt_respondsToSelector();
  unint64_t v5 = 0xFFFFFFFF80000000;
  if ((v4 & 1) == 0) {
    unint64_t v5 = 0;
  }
  self->_parserFlags = v5 & 0xFFFFFFFF80000000 | self->_parserFlags & 0x7FFFFFFF;
  char v6 = objc_opt_respondsToSelector();
  uint64_t v7 = 0x40000000;
  if ((v6 & 1) == 0) {
    uint64_t v7 = 0;
  }
  self->_parserFlags = self->_parserFlags & 0xFFFFFFFFBFFFFFFFLL | v7;
  char v8 = objc_opt_respondsToSelector();
  uint64_t v9 = 0x20000000;
  if ((v8 & 1) == 0) {
    uint64_t v9 = 0;
  }
  self->_parserFlags = self->_parserFlags & 0xFFFFFFFFDFFFFFFFLL | v9;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  unint64_t parserFlags = self->_parserFlags;

  free(self->_saxHandler);
  parserContext = self->_parserContext;
  if (parserContext)
  {
    if (parserContext->myDoc)
    {
      xmlFreeDoc(parserContext->myDoc);
      parserContext = self->_parserContext;
    }
    xmlFreeParserCtxt(parserContext);
  }

  slowStringMap = self->_slowStringMap;
  if (slowStringMap) {
    CFRelease(slowStringMap);
  }

  if ((parserFlags & 0x80) != 0) {
  v6.receiver = self;
  }
  v6.super_class = (Class)NSXMLParser;
  [(NSXMLParser *)&v6 dealloc];
}

- (NSXMLParser)initWithContentsOfURL:(NSURL *)url
{
  if ([(NSXMLParser *)self isMemberOfClass:NSXMLParser]
    && [(NSURL *)url isFileURL])
  {
    unint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA10]) initWithURL:url];
    objc_super v6 = [(NSXMLParser *)self initWithStream:v5];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:url];
    if (!v7) {
      uint64_t v7 = [MEMORY[0x1E4F1C9B8] data];
    }
    objc_super v6 = [(NSXMLParser *)self initWithData:v7];
  }
  v6->_url = url;
  return v6;
}

- (id)initForIncrementalParsing
{
  id result = [(NSXMLParser *)self initWithData:0];
  if (result) {
    *((void *)result + 5) &= ~0x80uLL;
  }
  return result;
}

- (NSXMLParser)initWithStream:(NSInputStream *)stream
{
  char v4 = [(NSXMLParser *)self initForIncrementalParsing];
  unint64_t v5 = v4;
  if (v4)
  {
    v4->_parserFlags |= 0x80uLL;
    v4->xmlParserStream = stream;
  }
  return v5;
}

- (void)setShouldProcessNamespaces:(BOOL)shouldProcessNamespaces
{
  if (!self->_parserContext)
  {
    uint64_t v3 = 4;
    if (!shouldProcessNamespaces) {
      uint64_t v3 = 0;
    }
    self->_unint64_t parserFlags = self->_parserFlags & 0xFFFFFFFFFFFFFFFBLL | v3;
  }
}

- (void)setShouldReportNamespacePrefixes:(BOOL)shouldReportNamespacePrefixes
{
  if (!self->_parserContext)
  {
    uint64_t v3 = 8;
    if (!shouldReportNamespacePrefixes) {
      uint64_t v3 = 0;
    }
    self->_unint64_t parserFlags = self->_parserFlags & 0xFFFFFFFFFFFFFFF7 | v3;
  }
}

- (void)setShouldResolveExternalEntities:(BOOL)shouldResolveExternalEntities
{
  if (!self->_parserContext)
  {
    uint64_t v3 = 16;
    if (!shouldResolveExternalEntities) {
      uint64_t v3 = 0;
    }
    self->_unint64_t parserFlags = self->_parserFlags & 0xFFFFFFFFFFFFFFEFLL | v3;
  }
}

- (NSSet)allowedExternalEntityURLs
{
  return self->_allowedEntityURLs;
}

- (void)setAllowedExternalEntityURLs:(NSSet *)allowedExternalEntityURLs
{
  allowedEntityURLs = self->_allowedEntityURLs;
  if (allowedEntityURLs != allowedExternalEntityURLs)
  {
    objc_super v6 = allowedEntityURLs;
    self->_allowedEntityURLs = (NSSet *)[(NSSet *)allowedExternalEntityURLs copy];
  }
}

- (void)setExternalEntityResolvingPolicy:(NSXMLParserExternalEntityResolvingPolicy)externalEntityResolvingPolicy
{
  self->_externalEntityResolvingPolicy = externalEntityResolvingPolicy;
}

- (NSXMLParserExternalEntityResolvingPolicy)externalEntityResolvingPolicy
{
  return self->_externalEntityResolvingPolicy;
}

- (_xmlParserInput)_xmlExternalEntityWithURL:(const char *)a3 identifier:(const char *)a4 context:(_xmlParserCtxt *)a5 originalLoaderFunction:(void *)a6
{
  NSXMLParserExternalEntityResolvingPolicy v10 = [(NSXMLParser *)self externalEntityResolvingPolicy];
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"NSXMLParserRestoreOldExternalEntityBehavior"))uint64_t v11 = 3; {
  else
  }
    uint64_t v11 = v10;
  long long v12 = [(NSXMLParser *)self allowedExternalEntityURLs];
  if (v12)
  {
    long long v13 = v12;
    int v14 = [[NSString alloc] initWithUTF8String:a3];
    int v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v14];
    if (objc_msgSend((id)objc_msgSend(v15, "scheme"), "isEqualToString:", @"file"))
    {
      uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CB10]), "initFileURLWithPath:", objc_msgSend(v15, "path"));

      int v15 = (void *)v16;
    }

    if (v15)
    {
      uint64_t v17 = [(NSSet *)v13 member:v15];
      if (!v17 && v11 == 2)
      {
        url = self->_url;
        if (!url) {
          goto LABEL_30;
        }
LABEL_18:
        if (!objc_msgSend((id)objc_msgSend(v15, "host"), "isEqualToString:", -[NSURL host](url, "host"))
          || ([v15 port] || -[NSURL port](url, "port"))
          && (objc_msgSend((id)objc_msgSend(v15, "port"), "isEqualToNumber:", -[NSURL port](url, "port")) & 1) == 0)
        {
        }
        else
        {
          char v20 = objc_msgSend((id)objc_msgSend(v15, "scheme"), "isEqualToString:", -[NSURL scheme](url, "scheme"));

          if (v20) {
            goto LABEL_31;
          }
        }
        return 0;
      }

      if (v17)
      {
LABEL_31:
        return (_xmlParserInput *)((uint64_t (*)(const char *, const char *, _xmlParserCtxt *))a6)(a3, a4, a5);
      }
    }
  }
  if (!v11) {
    return 0;
  }
  if (v11 != 1)
  {
    if (v11 == 2)
    {
      url = self->_url;
      if (!url)
      {
        int v15 = 0;
LABEL_30:

        goto LABEL_31;
      }
      v19 = [[NSString alloc] initWithUTF8String:a3];
      int v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v19];

      if (v15) {
        goto LABEL_18;
      }
    }
    goto LABEL_31;
  }

  return xmlNoNetExternalEntityLoader(a3, a4, a5);
}

+ (id)currentParser
{
  v2 = [+[NSThread currentThread] threadDictionary];

  return (id)[(NSMutableDictionary *)v2 objectForKey:@"__CurrentNSXMLParser"];
}

- (BOOL)shouldProcessNamespaces
{
  return (LOBYTE(self->_parserFlags) >> 2) & 1;
}

- (BOOL)shouldReportNamespacePrefixes
{
  return (LOBYTE(self->_parserFlags) >> 3) & 1;
}

- (void)setShouldContinueAfterFatalError:(BOOL)a3
{
  if (!self->_parserContext)
  {
    uint64_t v3 = 32;
    if (!a3) {
      uint64_t v3 = 0;
    }
    self->_unint64_t parserFlags = self->_parserFlags & 0xFFFFFFFFFFFFFFDFLL | v3;
  }
}

- (BOOL)shouldContinueAfterFatalError
{
  return (LOBYTE(self->_parserFlags) >> 5) & 1;
}

- (void)abortParsing
{
  parserContext = self->_parserContext;
  if (parserContext)
  {
    xmlStopParser(parserContext);
    self->_delegateAborted = 1;
  }
}

- (NSError)parserError
{
  v2 = self->_error;

  return v2;
}

- (NSString)publicID
{
  return 0;
}

- (NSString)systemID
{
  return 0;
}

- (NSInteger)lineNumber
{
  NSInteger result = (NSInteger)self->_parserContext;
  if (result) {
    return xmlSAX2GetLineNumber((void *)result);
  }
  return result;
}

- (NSInteger)columnNumber
{
  NSInteger result = (NSInteger)self->_parserContext;
  if (result) {
    return xmlSAX2GetColumnNumber((void *)result);
  }
  return result;
}

- (void)_setExpandedParserError:(id)a3
{
  error = self->_error;
  if (error) {
    objc_super v6 = error;
  }
  self->_error = (NSError *)a3;
}

- (void)_setParserError:(int64_t)a3
{
  char v4 = [[NSError alloc] initWithDomain:@"NSXMLParserErrorDomain" code:a3 userInfo:0];

  [(NSXMLParser *)self _setExpandedParserError:v4];
}

- (void)_pushNamespaces:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  namespaces = self->_namespaces;
  if (namespaces)
  {
    if (a3)
    {
LABEL_3:
      [(NSMutableArray *)namespaces addObject:a3];
      if (objc_opt_respondsToSelector())
      {
        long long v14 = 0u;
        long long v15 = 0u;
        long long v12 = 0u;
        long long v13 = 0u;
        uint64_t v6 = [a3 countByEnumeratingWithState:&v12 objects:v11 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v13;
          do
          {
            for (uint64_t i = 0; i != v7; ++i)
            {
              if (*(void *)v13 != v8) {
                objc_enumerationMutation(a3);
              }
              objc_msgSend(self->_delegate, "parser:didStartMappingPrefix:toURI:", self, *(void *)(*((void *)&v12 + 1) + 8 * i), objc_msgSend(a3, "objectForKey:", *(void *)(*((void *)&v12 + 1) + 8 * i)));
            }
            uint64_t v7 = [a3 countByEnumeratingWithState:&v12 objects:v11 count:16];
          }
          while (v7);
        }
      }
      return;
    }
  }
  else
  {
    namespaces = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    self->_namespaces = namespaces;
    if (a3) {
      goto LABEL_3;
    }
  }
  uint64_t v10 = [MEMORY[0x1E4F1CA98] null];

  [(NSMutableArray *)namespaces addObject:v10];
}

@end