@interface ENXMLDTD
+ (ENXMLDTD)dtdWithBundleResource:(id)a3 ofType:(id)a4;
+ (ENXMLDTD)enexDTD;
+ (ENXMLDTD)enml2dtd;
+ (ENXMLDTD)lat1DTD;
+ (ENXMLDTD)specialDTD;
+ (ENXMLDTD)symbolDTD;
+ (void)initialize;
- (BOOL)isAttributeLegal:(id)a3 inElement:(id)a4;
- (BOOL)isElementLegal:(id)a3;
- (ENXMLDTD)initWithContentsOfFile:(id)a3;
- (NSString)docTypeDeclaration;
- (_xmlElement)xmlElementNamed:(id)a3;
- (_xmlEntity)xmlEntityNamed:(id)a3;
- (id)sanitizedAttributes:(id)a3 forElement:(id)a4;
- (void)dealloc;
- (void)setDocTypeDeclaration:(id)a3;
@end

@implementation ENXMLDTD

- (void).cxx_destruct
{
}

- (void)setDocTypeDeclaration:(id)a3
{
}

- (NSString)docTypeDeclaration
{
  return self->_docTypeDeclaration;
}

- (BOOL)isAttributeLegal:(id)a3 inElement:(id)a4
{
  v6 = NSDictionary;
  v7 = (void *)MEMORY[0x263EFF9D0];
  id v8 = a4;
  id v9 = a3;
  v10 = [v7 null];
  v11 = [v6 dictionaryWithObject:v10 forKey:v9];

  v12 = [(ENXMLDTD *)self sanitizedAttributes:v11 forElement:v8];

  LOBYTE(self) = [v12 count] == 1;
  return (char)self;
}

- (id)sanitizedAttributes:(id)a3 forElement:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ENXMLDTD *)self xmlElementNamed:v7];
  if (v8)
  {
    id v9 = v8;
    v20 = v6;
    id v21 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v10 = [v6 allKeys];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          xmlAttributePtr attributes = v9->attributes;
          if (attributes)
          {
            v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            while (1)
            {
              name = (xmlChar *)attributes->name;
              if (name)
              {
                name = (xmlChar *)[objc_allocWithZone(NSString) initWithBytes:name length:strlen((const char *)attributes->name) encoding:4];
                if (name)
                {
                  if (![v16 caseInsensitiveCompare:name]) {
                    break;
                  }
                }
              }
              xmlAttributePtr attributes = attributes->nexth;

              if (!attributes) {
                goto LABEL_15;
              }
            }
            v18 = [v20 objectForKey:v16];
            [v21 setObject:v18 forKey:v16];
          }
LABEL_15:
          ;
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v12);
    }

    id v6 = v20;
  }
  else
  {
    NSLog(&cfstr_ErrorRetrievin.isa, v7, self);
    id v21 = 0;
  }

  return v21;
}

- (BOOL)isElementLegal:(id)a3
{
  return [(ENXMLDTD *)self xmlElementNamed:a3] != 0;
}

- (_xmlElement)xmlElementNamed:(id)a3
{
  elements = (xmlHashTable *)self->_dtd->elements;
  v4 = (const xmlChar *)[a3 cStringUsingEncoding:4];
  return (_xmlElement *)xmlHashLookup(elements, v4);
}

- (_xmlEntity)xmlEntityNamed:(id)a3
{
  entities = (xmlHashTable *)self->_dtd->entities;
  if (!entities) {
    return 0;
  }
  v4 = (const xmlChar *)[a3 cStringUsingEncoding:4];
  return (_xmlEntity *)xmlHashLookup(entities, v4);
}

- (void)dealloc
{
  dtd = self->_dtd;
  if (dtd)
  {
    xmlFreeDtd(dtd);
    self->_dtd = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)ENXMLDTD;
  [(ENXMLDTD *)&v4 dealloc];
}

- (ENXMLDTD)initWithContentsOfFile:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ENXMLDTD;
  v5 = [(ENXMLDTD *)&v15 init];
  if (!v5) {
    goto LABEL_4;
  }
  id v6 = v4;
  Filename = xmlParserInputBufferCreateFilename((const char *)[v6 fileSystemRepresentation], XML_CHAR_ENCODING_NONE);
  if (!Filename)
  {
    xmlErrorPtr LastError = xmlGetLastError();
    if (LastError)
    {
      uint64_t v11 = [NSString stringWithCString:LastError->message encoding:4];
    }
    else
    {
      uint64_t v11 = 0;
    }
    NSLog(&cfstr_Xmlparserinput.isa, v6, v11);
    xmlResetLastError();

    goto LABEL_13;
  }
  xmlDtdPtr v8 = xmlIOParseDTD(0, Filename, XML_CHAR_ENCODING_NONE);
  v5->_dtd = v8;
  if (!v8)
  {
    xmlErrorPtr v12 = xmlGetLastError();
    if (v12)
    {
      uint64_t v13 = [NSString stringWithCString:v12->message encoding:4];
    }
    else
    {
      uint64_t v13 = 0;
    }
    NSLog(&cfstr_XmlioparsedtdR.isa, v13);
    xmlResetLastError();

LABEL_13:
    id v9 = 0;
    goto LABEL_14;
  }
LABEL_4:
  id v9 = v5;
LABEL_14:

  return v9;
}

+ (ENXMLDTD)specialDTD
{
  if (specialDTD_onceToken != -1) {
    dispatch_once(&specialDTD_onceToken, &__block_literal_global_28_6105);
  }
  v2 = (void *)specialDTD_dtd;
  return (ENXMLDTD *)v2;
}

void __22__ENXMLDTD_specialDTD__block_invoke()
{
  uint64_t v0 = +[ENXMLDTD dtdWithBundleResource:@"xhtml-special" ofType:@"ent"];
  v1 = (void *)specialDTD_dtd;
  specialDTD_dtd = v0;
}

+ (ENXMLDTD)symbolDTD
{
  if (symbolDTD_onceToken != -1) {
    dispatch_once(&symbolDTD_onceToken, &__block_literal_global_23);
  }
  v2 = (void *)symbolDTD_dtd;
  return (ENXMLDTD *)v2;
}

void __21__ENXMLDTD_symbolDTD__block_invoke()
{
  uint64_t v0 = +[ENXMLDTD dtdWithBundleResource:@"xhtml-symbol" ofType:@"ent"];
  v1 = (void *)symbolDTD_dtd;
  symbolDTD_dtd = v0;
}

+ (ENXMLDTD)lat1DTD
{
  if (lat1DTD_onceToken != -1) {
    dispatch_once(&lat1DTD_onceToken, &__block_literal_global_15);
  }
  v2 = (void *)lat1DTD_dtd;
  return (ENXMLDTD *)v2;
}

void __19__ENXMLDTD_lat1DTD__block_invoke()
{
  uint64_t v0 = +[ENXMLDTD dtdWithBundleResource:@"xhtml-lat1" ofType:@"ent"];
  v1 = (void *)lat1DTD_dtd;
  lat1DTD_dtd = v0;
}

+ (ENXMLDTD)enml2dtd
{
  if (enml2dtd_onceToken != -1) {
    dispatch_once(&enml2dtd_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)enml2dtd_dtd;
  return (ENXMLDTD *)v2;
}

uint64_t __20__ENXMLDTD_enml2dtd__block_invoke()
{
  uint64_t v0 = +[ENXMLDTD dtdWithBundleResource:@"enml2" ofType:@"dtd"];
  v1 = (void *)enml2dtd_dtd;
  enml2dtd_dtd = v0;

  v2 = (void *)enml2dtd_dtd;
  return [v2 setDocTypeDeclaration:@"<!DOCTYPE en-note SYSTEM \"http://xml.evernote.com/pub/enml2.dtd\">"];
}

+ (ENXMLDTD)enexDTD
{
  if (enexDTD_onceToken != -1) {
    dispatch_once(&enexDTD_onceToken, &__block_literal_global_6129);
  }
  v2 = (void *)enexDTD_dtd;
  return (ENXMLDTD *)v2;
}

void __19__ENXMLDTD_enexDTD__block_invoke()
{
  uint64_t v0 = +[ENXMLDTD dtdWithBundleResource:@"evernote-export" ofType:@"dtd"];
  v1 = (void *)enexDTD_dtd;
  enexDTD_dtd = v0;
}

+ (ENXMLDTD)dtdWithBundleResource:(id)a3 ofType:(id)a4
{
  id v4 = +[ENSDKResourceLoader pathToResourceNamed:a3 extension:a4];
  v5 = [[ENXMLDTD alloc] initWithContentsOfFile:v4];

  return v5;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    defaultExternalEntityLoader = (uint64_t (*)(void, void, void))xmlGetExternalEntityLoader();
    xmlSetExternalEntityLoader((xmlExternalEntityLoader)enxmlExternalEntityLoader);
  }
}

@end