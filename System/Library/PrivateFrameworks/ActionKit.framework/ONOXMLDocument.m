@interface ONOXMLDocument
+ (ONOXMLDocument)XMLDocumentWithData:(id)a3 error:(id *)a4;
+ (ONOXMLDocument)XMLDocumentWithString:(id)a3 encoding:(unint64_t)a4 error:(id *)a5;
+ (id)HTMLDocumentWithData:(id)a3 error:(id *)a4;
+ (id)HTMLDocumentWithString:(id)a3 encoding:(unint64_t)a4 error:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (NSDateFormatter)dateFormatter;
- (NSMutableDictionary)defaultNamespaces;
- (NSNumberFormatter)numberFormatter;
- (NSString)version;
- (ONOXMLDocument)initWithCoder:(id)a3;
- (ONOXMLDocument)initWithDocument:(_xmlDoc *)a3;
- (ONOXMLElement)rootElement;
- (_xmlDoc)xmlDocument;
- (id)CSS:(id)a3;
- (id)XPath:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)elementWithNode:(_xmlNode *)a3;
- (id)enumeratorWithXPathObject:(_xmlXPathObject *)a3;
- (id)firstChildWithCSS:(id)a3;
- (id)firstChildWithXPath:(id)a3;
- (id)functionResultByEvaluatingXPath:(id)a3;
- (unint64_t)stringEncoding;
- (void)dealloc;
- (void)definePrefix:(id)a3 forDefaultNamespace:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateElementsWithCSS:(id)a3 block:(id)a4;
- (void)enumerateElementsWithCSS:(id)a3 usingBlock:(id)a4;
- (void)enumerateElementsWithXPath:(id)a3 block:(id)a4;
- (void)enumerateElementsWithXPath:(id)a3 usingBlock:(id)a4;
- (void)setDateFormatter:(id)a3;
- (void)setDefaultNamespaces:(id)a3;
- (void)setNumberFormatter:(id)a3;
- (void)setRootElement:(id)a3;
- (void)setStringEncoding:(unint64_t)a3;
- (void)setVersion:(id)a3;
- (void)setXmlDocument:(_xmlDoc *)a3;
@end

@implementation ONOXMLDocument

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultNamespaces, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_rootElement, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

- (void)setDefaultNamespaces:(id)a3
{
}

- (NSMutableDictionary)defaultNamespaces
{
  return self->_defaultNamespaces;
}

- (void)setXmlDocument:(_xmlDoc *)a3
{
  self->_xmlDocument = a3;
}

- (_xmlDoc)xmlDocument
{
  return self->_xmlDocument;
}

- (void)setDateFormatter:(id)a3
{
}

- (void)setNumberFormatter:(id)a3
{
}

- (void)setRootElement:(id)a3
{
}

- (ONOXMLElement)rootElement
{
  return self->_rootElement;
}

- (void)setStringEncoding:(unint64_t)a3
{
  self->_stringEncoding = a3;
}

- (void)setVersion:(id)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ONOXMLDocument *)self version];
  v6 = NSStringFromSelector(sel_version);
  [v4 encodeObject:v5 forKey:v6];

  id v8 = [(ONOXMLDocument *)self rootElement];
  v7 = NSStringFromSelector(sel_rootElement);
  [v4 encodeObject:v8 forKey:v7];
}

- (ONOXMLDocument)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ONOXMLDocument;
  v5 = [(ONOXMLDocument *)&v13 init];
  if (v5)
  {
    v6 = NSStringFromSelector(sel_version);
    v7 = [v4 decodeObjectForKey:v6];

    id v8 = NSStringFromSelector(sel_rootElement);
    v9 = [v4 decodeObjectForKey:v8];

    if (v7) {
      BOOL v10 = v9 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10)
    {
      v11 = 0;
    }
    else
    {
      [(ONOXMLDocument *)v5 setVersion:v7];
      [(ONOXMLDocument *)v5 setRootElement:v9];
      v11 = v5;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(ONOXMLDocument *)self version];
  [v4 setVersion:v5];

  v6 = [(ONOXMLDocument *)self rootElement];
  [v4 setRootElement:v6];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ONOXMLDocument *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = [(ONOXMLDocument *)self hash];
      BOOL v6 = v5 == [(ONOXMLDocument *)v4 hash];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (id)description
{
  v2 = [(ONOXMLDocument *)self rootElement];
  v3 = [v2 description];

  return v3;
}

- (unint64_t)stringEncoding
{
  if (!self->_stringEncoding && (void)[(ONOXMLDocument *)self xmlDocument][112])
  {
    objc_msgSend(NSString, "stringWithUTF8String:", (void)-[ONOXMLDocument xmlDocument](self, "xmlDocument")[112]);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFStringEncoding v4 = CFStringConvertIANACharSetNameToEncoding(v3);
    if (v4 != -1) {
      [(ONOXMLDocument *)self setStringEncoding:CFStringConvertEncodingToNSStringEncoding(v4)];
    }
  }
  return self->_stringEncoding;
}

- (NSString)version
{
  if (!self->_version && (void)[(ONOXMLDocument *)self xmlDocument][104])
  {
    v3 = objc_msgSend(NSString, "stringWithUTF8String:", (void)-[ONOXMLDocument xmlDocument](self, "xmlDocument")[104]);
    [(ONOXMLDocument *)self setVersion:v3];
  }
  version = self->_version;
  return version;
}

- (id)firstChildWithCSS:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ONOXMLDocument *)self rootElement];
  BOOL v6 = [v5 firstChildWithCSS:v4];

  return v6;
}

- (void)enumerateElementsWithCSS:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ONOXMLDocument *)self rootElement];
  [v8 enumerateElementsWithCSS:v7 usingBlock:v6];
}

- (void)enumerateElementsWithCSS:(id)a3 block:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ONOXMLDocument *)self rootElement];
  [v8 enumerateElementsWithCSS:v7 block:v6];
}

- (id)CSS:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ONOXMLDocument *)self rootElement];
  id v6 = [v5 CSS:v4];

  return v6;
}

- (id)firstChildWithXPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ONOXMLDocument *)self rootElement];
  id v6 = [v5 firstChildWithXPath:v4];

  return v6;
}

- (void)enumerateElementsWithXPath:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ONOXMLDocument *)self rootElement];
  [v8 enumerateElementsWithXPath:v7 usingBlock:v6];
}

- (void)enumerateElementsWithXPath:(id)a3 block:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = a3;
    id v8 = [(ONOXMLDocument *)self rootElement];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __51__ONOXMLDocument_enumerateElementsWithXPath_block___block_invoke;
    v9[3] = &unk_264E59190;
    id v10 = v6;
    [v8 enumerateElementsWithXPath:v7 usingBlock:v9];
  }
}

uint64_t __51__ONOXMLDocument_enumerateElementsWithXPath_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)functionResultByEvaluatingXPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ONOXMLDocument *)self rootElement];
  id v6 = [v5 functionResultByEvaluatingXPath:v4];

  return v6;
}

- (id)XPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ONOXMLDocument *)self rootElement];
  id v6 = [v5 XPath:v4];

  return v6;
}

- (id)enumeratorWithXPathObject:(_xmlXPathObject *)a3
{
  if (a3 && (xmlNodeSetPtr nodesetval = a3->nodesetval) != 0 && nodesetval->nodeNr && nodesetval->nodeTab)
  {
    id v6 = objc_alloc_init(ONOXPathEnumerator);
    [(ONOXPathEnumerator *)v6 setXmlXPath:a3];
    [(ONOXPathEnumerator *)v6 setDocument:self];
  }
  else
  {
    xmlXPathFreeObject(a3);
    id v6 = 0;
  }
  return v6;
}

- (id)elementWithNode:(_xmlNode *)a3
{
  if (a3)
  {
    unint64_t v5 = objc_alloc_init(ONOXMLElement);
    [(ONOXMLElement *)v5 setXmlNode:a3];
    [(ONOXMLElement *)v5 setDocument:self];
  }
  else
  {
    unint64_t v5 = 0;
  }
  return v5;
}

- (void)definePrefix:(id)a3 forDefaultNamespace:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ONOXMLDocument *)self defaultNamespaces];

  if (!v8)
  {
    v9 = [MEMORY[0x263EFF9A0] dictionary];
    [(ONOXMLDocument *)self setDefaultNamespaces:v9];
  }
  id v10 = [(ONOXMLDocument *)self defaultNamespaces];
  [v10 setObject:v7 forKeyedSubscript:v6];
}

- (NSDateFormatter)dateFormatter
{
  dateFormatter = self->_dateFormatter;
  if (!dateFormatter)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F08790]);
    unint64_t v5 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
    [v4 setLocale:v5];

    [v4 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    [(ONOXMLDocument *)self setDateFormatter:v4];

    dateFormatter = self->_dateFormatter;
  }
  return dateFormatter;
}

- (NSNumberFormatter)numberFormatter
{
  numberFormatter = self->_numberFormatter;
  if (!numberFormatter)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F08A30]);
    [v4 setNumberStyle:1];
    [(ONOXMLDocument *)self setNumberFormatter:v4];

    numberFormatter = self->_numberFormatter;
  }
  return numberFormatter;
}

- (void)dealloc
{
  xmlDocument = self->_xmlDocument;
  if (xmlDocument) {
    xmlFreeDoc(xmlDocument);
  }
  v4.receiver = self;
  v4.super_class = (Class)ONOXMLDocument;
  [(ONOXMLDocument *)&v4 dealloc];
}

- (ONOXMLDocument)initWithDocument:(_xmlDoc *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ONOXMLDocument;
  objc_super v4 = [(ONOXMLDocument *)&v9 init];
  unint64_t v5 = v4;
  if (v4)
  {
    v4->_xmlDocument = a3;
    if ([(ONOXMLDocument *)v4 xmlDocument])
    {
      id v6 = [(ONOXMLDocument *)v5 elementWithNode:xmlDocGetRootElement([(ONOXMLDocument *)v5 xmlDocument])];
      [(ONOXMLDocument *)v5 setRootElement:v6];
    }
    id v7 = v5;
  }

  return v5;
}

+ (id)HTMLDocumentWithData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (const char *)[v6 bytes];
  int v8 = [v6 length];

  htmlDocPtr Memory = htmlReadMemory(v7, v8, "", 0, 97);
  if (Memory)
  {
    htmlDocPtr v10 = Memory;
    xmlResetLastError();
    v11 = (void *)[objc_alloc((Class)a1) initWithDocument:v10];
  }
  else
  {
    LastError = xmlGetLastError();
    ONOSetErrorFromXMLErrorPtr(a4, LastError);
    v11 = 0;
  }
  return v11;
}

+ (id)HTMLDocumentWithString:(id)a3 encoding:(unint64_t)a4 error:(id *)a5
{
  id v7 = [a3 dataUsingEncoding:a4];
  int v8 = [a1 HTMLDocumentWithData:v7 error:a5];

  return v8;
}

+ (ONOXMLDocument)XMLDocumentWithData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (const char *)[v6 bytes];
  int v8 = [v6 length];

  xmlDocPtr Memory = xmlReadMemory(v7, v8, "", 0, 97);
  if (Memory)
  {
    xmlDocPtr v10 = Memory;
    xmlResetLastError();
    v11 = (void *)[objc_alloc((Class)a1) initWithDocument:v10];
  }
  else
  {
    LastError = xmlGetLastError();
    ONOSetErrorFromXMLErrorPtr(a4, LastError);
    v11 = 0;
  }
  return (ONOXMLDocument *)v11;
}

+ (ONOXMLDocument)XMLDocumentWithString:(id)a3 encoding:(unint64_t)a4 error:(id *)a5
{
  id v7 = [a3 dataUsingEncoding:a4];
  int v8 = [a1 XMLDocumentWithData:v7 error:a5];

  return (ONOXMLDocument *)v8;
}

@end