@interface EQKitEquation
+ (id)equationSourceFromXMLMetadata:(id)a3;
+ (id)equationWithData:(id)a3 format:(unint64_t)a4 environment:(id)a5 error:(id *)a6;
+ (id)equationWithString:(id)a3 format:(unint64_t)a4 environment:(id)a5 error:(id *)a6;
+ (id)equationWithString:(id)a3 format:(unint64_t)a4 error:(id *)a5;
+ (id)equationWithXMLDoc:(_xmlDoc *)a3 node:(_xmlNode *)a4 environment:(id)a5 error:(id *)a6;
+ (id)mathMLStringFromLaTeXString:(id)a3 environment:(id)a4 error:(id *)a5;
+ (id)xmlMetadataFromEquationSource:(id)a3;
+ (unint64_t)formatFromData:(id)a3;
+ (unint64_t)formatFromString:(id)a3;
- (BOOL)exportToXMLWriter:(_xmlTextWriter *)a3 ns:(const char *)a4 prefix:(const char *)a5 characterCount:(int *)a6;
- (BOOL)isBaseFontNameUsed;
- (EQKitEnvironment)environment;
- (EQKitEquation)initWithRoot:(id)a3 source:(id)a4;
- (EQKitExpression)root;
- (id)description;
- (id)newLayout;
- (void)dealloc;
@end

@implementation EQKitEquation

- (EQKitEquation)initWithRoot:(id)a3 source:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)EQKitEquation;
  v6 = [(EQKitEquation *)&v9 init];
  v7 = v6;
  if (v6)
  {
    if (a3)
    {
      v6->mRoot = (EQKitExpression *)a3;
      v7->mSource = (NSData *)a4;
    }
    else
    {

      return 0;
    }
  }
  return v7;
}

+ (unint64_t)formatFromData:(id)a3
{
  v4 = (void *)[[NSString alloc] initWithData:a3 encoding:4];
  unint64_t v5 = [a1 formatFromString:v4];

  return v5;
}

+ (unint64_t)formatFromString:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if ([a3 hasPrefix:@"$$"]) {
    return 2;
  }
  if (!+[EQKitEquation formatFromString:]::sMathMLPatterns)
  {
    id v6 = objc_alloc(MEMORY[0x263EFF8C0]);
    uint64_t v7 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"<math", @"</math>", 0);
    +[EQKitEquation formatFromString:]::sMathMLPatterns = objc_msgSend(v6, "initWithObjects:", v7, objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"<", @":math", @"</", @":math>", 0), 0);
  }
  v8 = (void *)_laTeXPatterns();
  objc_super v9 = (NSString *)objc_msgSend(a3, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x263F08708], "whitespaceAndNewlineCharacterSet"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v10 = (void *)+[EQKitEquation formatFromString:]::sMathMLPatterns;
  uint64_t v11 = [(id)+[EQKitEquation formatFromString:]::sMathMLPatterns countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (!v11)
  {
LABEL_14:
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v15 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (!v15) {
      return 0;
    }
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v20;
LABEL_16:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v20 != v17) {
        objc_enumerationMutation(v8);
      }
      if (_findPattern(*(NSArray **)(*((void *)&v19 + 1) + 8 * v18), v9, 1) != 0x7FFFFFFFFFFFFFFFLL) {
        return 2;
      }
      if (v16 == ++v18)
      {
        uint64_t v16 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
        unint64_t v4 = 0;
        if (v16) {
          goto LABEL_16;
        }
        return v4;
      }
    }
  }
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)v24;
  unint64_t v4 = 1;
LABEL_8:
  uint64_t v14 = 0;
  while (1)
  {
    if (*(void *)v24 != v13) {
      objc_enumerationMutation(v10);
    }
    if (_findPattern(*(NSArray **)(*((void *)&v23 + 1) + 8 * v14), v9, 0) != 0x7FFFFFFFFFFFFFFFLL) {
      return v4;
    }
    if (v12 == ++v14)
    {
      uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v12) {
        goto LABEL_8;
      }
      goto LABEL_14;
    }
  }
}

+ (id)equationWithData:(id)a3 format:(unint64_t)a4 environment:(id)a5 error:(id *)a6
{
  if (a4 == 2)
  {
    if (a3) {
      _convertLaTeXStringToMathML((EQKitEnvironment *)a5, (NSString *)objc_msgSend([NSString alloc], "initWithBytes:length:encoding:", objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"), 4), (NSError **)a6);
    }
    return 0;
  }
  if (a4 != 1)
  {
    if (!a4 && a6 && !*a6)
    {
      objc_super v9 = (void *)MEMORY[0x263F087E8];
      v10 = NSDictionary;
      uint64_t v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "localizedStringForKey:value:table:", @"String format unknown. String format should be LaTeX or MathML.", &stru_27045C2A0, 0);
      uint64_t v12 = 0;
      *a6 = (id)objc_msgSend(v9, "errorWithDomain:code:userInfo:", @"EQKitErrorDomain", 0, objc_msgSend(v10, "dictionaryWithObjectsAndKeys:", v11, *MEMORY[0x263F08320], 0));
      return v12;
    }
    return 0;
  }
  id v13 = a3;
  if (!v13) {
    return 0;
  }
  if (xmlSAXVersion(&hdlr, 2))
  {
    uint64_t v12 = 0;
  }
  else
  {
    hdlr.getEntity = (getEntitySAXFunc)EQKitMathMLParserGetEntity;
    int v14 = xmlSubstituteEntitiesDefault(1);
    ExternalEntityLoader = xmlGetExternalEntityLoader();
    xmlSetExternalEntityLoader((xmlExternalEntityLoader)NoExternalEntityLoader);
    uint64_t v16 = xmlSAXParseMemory(&hdlr, (const char *)[v13 bytes], objc_msgSend(v13, "length"), 0);
    xmlSetExternalEntityLoader(ExternalEntityLoader);
    xmlSubstituteEntitiesDefault(v14);
    uint64_t v12 = 0;
    if (a5 && v16)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v17 = a5;
      }
      else {
        id v17 = 0;
      }
      uint64_t v18 = [[EQKitMathMLParser alloc] initWithDocument:v16 node:0 source:v13 attribution:a3 environment:v17];
      uint64_t v12 = [(EQKitMathMLParser *)v18 parse];
      if (a6 && !*a6) {
        *a6 = [(EQKitMathMLParser *)v18 error];
      }

      xmlFreeDoc(v16);
    }
  }
  if (a6 && !v12)
  {
    if (!*a6)
    {
      long long v19 = (void *)MEMORY[0x263F087E8];
      long long v20 = NSDictionary;
      uint64_t v21 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "localizedStringForKey:value:table:", @"Unable to create equation.", &stru_27045C2A0, 0);
      *a6 = (id)objc_msgSend(v19, "errorWithDomain:code:userInfo:", @"EQKitErrorDomain", 0, objc_msgSend(v20, "dictionaryWithObjectsAndKeys:", v21, *MEMORY[0x263F08320], 0));
    }

    return 0;
  }

  if (v12) {
    v12[3] = a5;
  }
  return v12;
}

+ (id)equationWithString:(id)a3 format:(unint64_t)a4 environment:(id)a5 error:(id *)a6
{
  v10 = (const char *)[a3 UTF8String];
  if (v10)
  {
    uint64_t v11 = [MEMORY[0x263EFF8F8] dataWithBytes:v10 length:strlen(v10)];
    return (id)[a1 equationWithData:v11 format:a4 environment:a5 error:a6];
  }
  else
  {
    if (a6) {
      *a6 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:2048 userInfo:0];
    }
    return 0;
  }
}

+ (id)equationWithString:(id)a3 format:(unint64_t)a4 error:(id *)a5
{
  v8 = (const char *)[a3 UTF8String];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x263EFF8F8] dataWithBytes:v8 length:strlen(v8)];
    v10 = +[EQKitEnvironment defaultEnvironment];
    return (id)[a1 equationWithData:v9 format:a4 environment:v10 error:a5];
  }
  else
  {
    if (a5) {
      *a5 = (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:2048 userInfo:0];
    }
    return 0;
  }
}

+ (id)equationWithXMLDoc:(_xmlDoc *)a3 node:(_xmlNode *)a4 environment:(id)a5 error:(id *)a6
{
  id v6 = 0;
  if (a3 && a4)
  {
    uint64_t v11 = [EQKitMathMLParser alloc];
    uint64_t v12 = objc_opt_class();
    id v13 = [(EQKitMathMLParser *)v11 initWithDocument:a3 node:a4 source:0 attribution:0 environment:EQKitUtilDynamicCast(v12, (uint64_t)a5)];
    id v6 = [(EQKitMathMLParser *)v13 parse];
    if (a6) {
      *a6 = [(EQKitMathMLParser *)v13 error];
    }
  }
  return v6;
}

- (BOOL)exportToXMLWriter:(_xmlTextWriter *)a3 ns:(const char *)a4 prefix:(const char *)a5 characterCount:(int *)a6
{
  return 0;
}

+ (id)xmlMetadataFromEquationSource:(id)a3
{
  unint64_t v4 = (void *)[MEMORY[0x263EFF990] data];
  unint64_t v5 = xmlNewDoc((const xmlChar *)"1.0");
  id v6 = xmlNewNode(0, (const xmlChar *)"root");
  xmlDocSetRootElement(v5, v6);
  uint64_t v7 = xmlNewChild(v6, 0, (const xmlChar *)"com.apple.iwork", 0);
  xmlNewProp(v7, (const xmlChar *)"version", (const xmlChar *)"1.0");
  v8 = xmlNewChild(v7, 0, (const xmlChar *)"equation", 0);
  uint64_t v9 = (void *)[a3 dataUsingEncoding:4];
  v10 = xmlNewCDataBlock(v5, (const xmlChar *)[v9 bytes], objc_msgSend(v9, "length"));
  xmlAddChild(v8, v10);
  if (v5)
  {
    int v11 = xmlKeepBlanksDefault(0);
    IO = xmlOutputBufferCreateIO((xmlOutputWriteCallback)sfaxmlNSMutableDataWriteCallback, 0, v4, 0);
    if (IO) {
      xmlSaveFormatFileTo(IO, v5, 0, 1);
    }
    xmlKeepBlanksDefault(v11);
  }
  xmlFreeDoc(v5);
  return v4;
}

+ (id)equationSourceFromXMLMetadata:(id)a3
{
  if (xmlSAXVersion(&v15, 2)) {
    return 0;
  }
  int v5 = xmlSubstituteEntitiesDefault(1);
  ExternalEntityLoader = xmlGetExternalEntityLoader();
  xmlSetExternalEntityLoader((xmlExternalEntityLoader)NoExternalEntityLoader);
  xmlDocPtr v7 = xmlSAXParseMemory(&v15, (const char *)[a3 bytes], objc_msgSend(a3, "length"), 0);
  xmlSetExternalEntityLoader(ExternalEntityLoader);
  xmlSubstituteEntitiesDefault(v5);
  if (!v7) {
    return 0;
  }
  children = xmlDocGetRootElement(v7)->children;
  if (!children) {
    goto LABEL_9;
  }
  while (1)
  {
    if (children->type == XML_ELEMENT_NODE)
    {
      name = (const char *)children->name;
      if (name)
      {
        if (!strcmp(name, "com.apple.iwork")) {
          break;
        }
      }
    }
    children = children->next;
    if (!children) {
      goto LABEL_9;
    }
  }
  int v11 = children->children;
  if (!v11) {
    goto LABEL_9;
  }
  while (1)
  {
    if (v11->type == XML_ELEMENT_NODE)
    {
      uint64_t v12 = (const char *)v11->name;
      if (v12)
      {
        if (!strcmp(v12, "equation")) {
          break;
        }
      }
    }
    int v11 = v11->next;
    if (!v11) {
      goto LABEL_9;
    }
  }
  id v13 = v11->children;
  if (v13)
  {
    unint64_t v4 = 0;
    do
    {
      if (v13->type - 3 <= 1 && v13->content && !xmlIsBlankNode(v13))
      {
        if (v4)
        {
          int v14 = (void *)[[NSString alloc] initWithUTF8String:v13->content];
          unint64_t v4 = (void *)[v4 stringByAppendingString:v14];
        }
        else
        {
          unint64_t v4 = (void *)[NSString stringWithUTF8String:v13->content];
        }
      }
      id v13 = v13->next;
    }
    while (v13);
  }
  else
  {
LABEL_9:
    unint64_t v4 = 0;
  }
  xmlFreeDoc(v7);
  return v4;
}

- (BOOL)isBaseFontNameUsed
{
  return [(EQKitExpression *)self->mRoot isBaseFontNameUsed];
}

- (id)newLayout
{
  return (id)[(EQKitExpression *)self->mRoot newLayout];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)EQKitEquation;
  [(EQKitEquation *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  unint64_t v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@ %p root=%@>", NSStringFromClass(v4), self, self->mRoot];
}

+ (id)mathMLStringFromLaTeXString:(id)a3 environment:(id)a4 error:(id *)a5
{
}

- (EQKitExpression)root
{
  return self->mRoot;
}

- (EQKitEnvironment)environment
{
  return self->mEnvironment;
}

@end