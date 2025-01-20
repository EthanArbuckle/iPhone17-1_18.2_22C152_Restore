@interface KSHTMLWriter
+ (BOOL)isDocTypeXHTML:(id)a3;
- (BOOL)canWriteElementInline:(id)a3;
- (BOOL)elementCanBeEmpty:(id)a3;
- (BOOL)hasCurrentAttributes;
- (BOOL)isIDValid:(id)a3;
- (BOOL)isXHTML;
- (BOOL)topElementIsList;
- (BOOL)validateElement:(id)a3;
- (KSHTMLWriter)initWithOutputWriter:(id)a3;
- (KSHTMLWriter)initWithOutputWriter:(id)a3 docType:(id)a4 encoding:(unint64_t)a5;
- (NSString)docType;
- (id)currentAttributes;
- (id)currentElementClassName;
- (id)validateAttribute:(id)a3 value:(id)a4 ofElement:(id)a5;
- (void)closeEmptyElementTag;
- (void)endJavascriptCDATA;
- (void)pushAttribute:(id)a3 value:(id)a4;
- (void)pushClassName:(id)a3;
- (void)setDocType:(id)a3;
- (void)startAnchorElementWithHref:(id)a3 title:(id)a4 target:(id)a5 rel:(id)a6;
- (void)startDocumentWithDocType:(id)a3 encoding:(unint64_t)a4;
- (void)startElement:(id)a3 className:(id)a4;
- (void)startElement:(id)a3 idName:(id)a4 className:(id)a5;
- (void)startElement:(id)a3 writeInline:(BOOL)a4;
- (void)startJavascriptCDATA;
- (void)startJavascriptElementWithSrc:(id)a3;
- (void)startStyleElementWithType:(id)a3;
- (void)writeHTMLFormat:(id)a3;
- (void)writeImageWithSrc:(id)a3 alt:(id)a4 width:(id)a5 height:(id)a6;
- (void)writeJavascript:(id)a3 useCDATA:(BOOL)a4;
- (void)writeJavascriptWithSrc:(id)a3 charset:(id)a4;
- (void)writeJavascriptWithSrc:(id)a3 encoding:(unint64_t)a4;
- (void)writeLineBreak;
- (void)writeLinkToStylesheet:(id)a3 title:(id)a4 media:(id)a5;
- (void)writeLinkWithHref:(id)a3 type:(id)a4 rel:(id)a5 title:(id)a6 media:(id)a7;
- (void)writeParamElementWithName:(id)a3 value:(id)a4;
- (void)writeStyleElementWithCSSString:(id)a3;
@end

@implementation KSHTMLWriter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classNames, 0);
  objc_storeStrong((id *)&self->_IDs, 0);
  objc_storeStrong((id *)&self->_docType, 0);
}

- (NSString)docType
{
  return self->_docType;
}

- (void)closeEmptyElementTag
{
  if ([(KSHTMLWriter *)self isXHTML])
  {
    v3.receiver = self;
    v3.super_class = (Class)KSHTMLWriter;
    [(KSXMLWriter *)&v3 closeEmptyElementTag];
  }
  else
  {
    [(KSXMLWriter *)self writeString:@">"];
  }
}

- (void)startElement:(id)a3 writeInline:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v8 = [v7 lowercaseString];
  char v9 = [v7 isEqualToString:v8];

  if ((v9 & 1) == 0)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"KSHTMLWriter.m", 475, @"Attempt to start non-lowercase element: %@", v7 object file lineNumber description];
  }
  v10 = [(KSHTMLWriter *)self currentElementClassName];
  if (v10)
  {
    [(NSMutableArray *)self->_classNames removeAllObjects];
    v13.receiver = self;
    v13.super_class = (Class)KSHTMLWriter;
    [(KSXMLWriter *)&v13 pushAttribute:@"class" value:v10];
  }
  v12.receiver = self;
  v12.super_class = (Class)KSHTMLWriter;
  [(KSXMLWriter *)&v12 startElement:v7 writeInline:v4];
}

- (id)validateAttribute:(id)a3 value:(id)a4 ofElement:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)KSHTMLWriter;
  v10 = [(KSXMLWriter *)&v14 validateAttribute:v8 value:a4 ofElement:v9];
  if (v10)
  {
    if ([v9 isEqualToString:@"li"])
    {
      if ([v8 isEqualToString:@"value"])
      {
        v11 = [(KSXMLWriter *)self topElement];
        char v12 = [v11 isEqualToString:@"ol"];

        if ((v12 & 1) == 0)
        {

          v10 = 0;
        }
      }
    }
  }

  return v10;
}

- (BOOL)validateElement:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)KSHTMLWriter;
  if ([(KSXMLWriter *)&v7 validateElement:v4])
  {
    if ([(KSHTMLWriter *)self topElementIsList]) {
      char v5 = [v4 isEqualToString:@"li"];
    }
    else {
      char v5 = 1;
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)canWriteElementInline:(id)a3
{
  id v4 = a3;
  switch([v4 length])
  {
    case 1:
      if (([v4 isEqualToString:@"a"] & 1) != 0
        || ([v4 isEqualToString:@"b"] & 1) != 0
        || ([v4 isEqualToString:@"i"] & 1) != 0
        || ([v4 isEqualToString:@"u"] & 1) != 0)
      {
        goto LABEL_39;
      }
      char v5 = @"q";
      break;
    case 2:
      if (([v4 isEqualToString:@"br"] & 1) != 0
        || ([v4 isEqualToString:@"em"] & 1) != 0)
      {
        goto LABEL_39;
      }
      char v5 = @"tt";
      break;
    case 3:
      if (([v4 isEqualToString:@"img"] & 1) != 0
        || ([v4 isEqualToString:@"sup"] & 1) != 0
        || ([v4 isEqualToString:@"sub"] & 1) != 0
        || ([v4 isEqualToString:@"big"] & 1) != 0
        || ([v4 isEqualToString:@"del"] & 1) != 0
        || ([v4 isEqualToString:@"ins"] & 1) != 0
        || ([v4 isEqualToString:@"dfn"] & 1) != 0
        || ([v4 isEqualToString:@"map"] & 1) != 0
        || ([v4 isEqualToString:@"var"] & 1) != 0
        || ([v4 isEqualToString:@"bdo"] & 1) != 0)
      {
        goto LABEL_39;
      }
      char v5 = @"kbd";
      break;
    case 4:
      if (([v4 isEqualToString:@"span"] & 1) != 0
        || ([v4 isEqualToString:@"font"] & 1) != 0
        || ([v4 isEqualToString:@"abbr"] & 1) != 0
        || ([v4 isEqualToString:@"cite"] & 1) != 0
        || ([v4 isEqualToString:@"code"] & 1) != 0)
      {
        goto LABEL_39;
      }
      char v5 = @"samp";
      break;
    case 5:
      if (([v4 isEqualToString:@"small"] & 1) != 0
        || ([v4 isEqualToString:@"input"] & 1) != 0)
      {
        goto LABEL_39;
      }
      char v5 = @"label";
      break;
    case 6:
      if (([v4 isEqualToString:@"strong"] & 1) != 0
        || ([v4 isEqualToString:@"select"] & 1) != 0
        || ([v4 isEqualToString:@"button"] & 1) != 0
        || ([v4 isEqualToString:@"object"] & 1) != 0
        || ([v4 isEqualToString:@"applet"] & 1) != 0)
      {
        goto LABEL_39;
      }
      char v5 = @"script";
      break;
    case 7:
      char v5 = @"acronym";
      break;
    case 8:
      char v5 = @"textarea";
      break;
    default:
      goto LABEL_40;
  }
  if ([v4 isEqualToString:v5])
  {
LABEL_39:
    BOOL v6 = 1;
  }
  else
  {
LABEL_40:
    v8.receiver = self;
    v8.super_class = (Class)KSHTMLWriter;
    BOOL v6 = [(KSXMLWriter *)&v8 canWriteElementInline:v4];
  }

  return v6;
}

- (BOOL)elementCanBeEmpty:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"br"] & 1) != 0
    || ([v3 isEqualToString:@"img"] & 1) != 0
    || ([v3 isEqualToString:@"hr"] & 1) != 0
    || ([v3 isEqualToString:@"meta"] & 1) != 0
    || ([v3 isEqualToString:@"link"] & 1) != 0
    || ([v3 isEqualToString:@"input"] & 1) != 0
    || ([v3 isEqualToString:@"base"] & 1) != 0
    || ([v3 isEqualToString:@"basefont"] & 1) != 0
    || ([v3 isEqualToString:@"param"] & 1) != 0
    || ([v3 isEqualToString:@"area"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:@"source"];
  }

  return v4;
}

- (BOOL)topElementIsList
{
  v2 = [(KSXMLWriter *)self topElement];
  if ([v2 isEqualToString:@"ul"]) {
    char v3 = 1;
  }
  else {
    char v3 = [v2 isEqualToString:@"ol"];
  }

  return v3;
}

- (void)startStyleElementWithType:(id)a3
{
  if (a3) {
    [(KSHTMLWriter *)self pushAttribute:@"type" value:a3];
  }
  [(KSXMLWriter *)self startElement:@"style"];
}

- (void)writeStyleElementWithCSSString:(id)a3
{
  id v4 = a3;
  [(KSHTMLWriter *)self startStyleElementWithType:@"text/css"];
  [(KSXMLWriter *)self writeString:v4];

  [(KSXMLWriter *)self endElement];
}

- (void)writeParamElementWithName:(id)a3 value:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (v7) {
    [(KSHTMLWriter *)self pushAttribute:@"name" value:v7];
  }
  if (v6) {
    [(KSHTMLWriter *)self pushAttribute:@"value" value:v6];
  }
  [(KSXMLWriter *)self startElement:@"param"];
  [(KSXMLWriter *)self endElement];
}

- (void)endJavascriptCDATA
{
  [(KSXMLWriter *)self writeString:@"\n/* "];
  [(KSXMLWriter *)self endCDATA];
  [(KSXMLWriter *)self writeString:@" */\n"];
}

- (void)startJavascriptCDATA
{
  [(KSXMLWriter *)self writeString:@"\n/* "];
  [(KSXMLWriter *)self startCDATA];
  [(KSXMLWriter *)self writeString:@" */"];
}

- (void)startJavascriptElementWithSrc:(id)a3
{
  id v6 = a3;
  id v4 = [(KSHTMLWriter *)self docType];
  char v5 = [v4 isEqualToString:KSHTMLWriterDocTypeHTML_5];

  if ((v5 & 1) == 0) {
    [(KSHTMLWriter *)self pushAttribute:@"type" value:@"text/javascript"];
  }
  if (v6)
  {
    [(KSHTMLWriter *)self pushAttribute:@"src" value:v6];
    [(KSXMLWriter *)self startElement:@"script"];
  }
  else
  {
    [(KSXMLWriter *)self startElement:@"script"];
    [(KSXMLWriter *)self writeString:@"\n"];
    [(KSXMLWriter *)self stopWritingInline];
  }
}

- (void)writeJavascript:(id)a3 useCDATA:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(KSHTMLWriter *)self startJavascriptElementWithSrc:0];
  if (v4)
  {
    [(KSHTMLWriter *)self startJavascriptCDATA];
    [(KSXMLWriter *)self writeString:v6];
    [(KSHTMLWriter *)self endJavascriptCDATA];
  }
  else
  {
    [(KSXMLWriter *)self writeString:v6];
  }
  [(KSXMLWriter *)self endElement];
}

- (void)writeJavascriptWithSrc:(id)a3 charset:(id)a4
{
  id v6 = a3;
  if (a4) {
    [(KSHTMLWriter *)self pushAttribute:@"charset" value:a4];
  }
  [(KSHTMLWriter *)self startJavascriptElementWithSrc:v6];
  [(KSXMLWriter *)self endElement];
}

- (void)writeJavascriptWithSrc:(id)a3 encoding:(unint64_t)a4
{
  id v8 = a3;
  if ([(KSXMLWriter *)self encoding] == a4)
  {
    id v6 = 0;
  }
  else
  {
    CFStringEncoding v7 = CFStringConvertNSStringEncodingToEncoding(a4);
    id v6 = CFStringConvertEncodingToIANACharSetName(v7);
  }
  [(KSHTMLWriter *)self writeJavascriptWithSrc:v8 charset:v6];
}

- (void)writeLinkToStylesheet:(id)a3 title:(id)a4 media:(id)a5
{
}

- (void)writeLinkWithHref:(id)a3 type:(id)a4 rel:(id)a5 title:(id)a6 media:(id)a7
{
  id v16 = a3;
  char v12 = (__CFString *)a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v13) {
    [(KSHTMLWriter *)self pushAttribute:@"rel" value:v13];
  }
  if (!v12) {
    char v12 = @"text/css";
  }
  [(KSHTMLWriter *)self pushAttribute:@"type" value:v12];
  [(KSHTMLWriter *)self pushAttribute:@"href" value:v16];
  if (v14) {
    [(KSHTMLWriter *)self pushAttribute:@"title" value:v14];
  }
  if (v15) {
    [(KSHTMLWriter *)self pushAttribute:@"media" value:v15];
  }
  [(KSXMLWriter *)self startElement:@"link"];
  [(KSXMLWriter *)self endElement];
}

- (void)writeImageWithSrc:(id)a3 alt:(id)a4 width:(id)a5 height:(id)a6
{
  id v12 = a5;
  id v10 = a6;
  id v11 = a4;
  [(KSHTMLWriter *)self pushAttribute:@"src" value:a3];
  [(KSHTMLWriter *)self pushAttribute:@"alt" value:v11];

  if (v12) {
    [(KSHTMLWriter *)self pushAttribute:@"width" value:v12];
  }
  if (v10) {
    [(KSHTMLWriter *)self pushAttribute:@"height" value:v10];
  }
  [(KSXMLWriter *)self startElement:@"img"];
  [(KSXMLWriter *)self endElement];
}

- (void)startAnchorElementWithHref:(id)a3 title:(id)a4 target:(id)a5 rel:(id)a6
{
  id v13 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v13) {
    [(KSHTMLWriter *)self pushAttribute:@"href" value:v13];
  }
  if (v11) {
    [(KSHTMLWriter *)self pushAttribute:@"target" value:v11];
  }
  if (v10) {
    [(KSHTMLWriter *)self pushAttribute:@"title" value:v10];
  }
  if (v12) {
    [(KSHTMLWriter *)self pushAttribute:@"rel" value:v12];
  }
  [(KSXMLWriter *)self startElement:@"a"];
}

- (void)writeLineBreak
{
  [(KSXMLWriter *)self startElement:@"br"];
  [(KSXMLWriter *)self endElement];
}

- (BOOL)isIDValid:(id)a3
{
  return [(NSMutableSet *)self->_IDs containsObject:a3] ^ 1;
}

- (void)startElement:(id)a3 idName:(id)a4 className:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v8) {
    [(KSHTMLWriter *)self pushAttribute:@"id" value:v8];
  }
  if (v9) {
    [(KSHTMLWriter *)self pushAttribute:@"class" value:v9];
  }
  [(KSXMLWriter *)self startElement:v10];
}

- (void)startElement:(id)a3 className:(id)a4
{
}

- (void)writeHTMLFormat:(id)a3
{
  BOOL v4 = (objc_class *)NSString;
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v7];

  [(KSHTMLWriter *)self writeHTMLString:v6];
}

- (BOOL)hasCurrentAttributes
{
  v4.receiver = self;
  v4.super_class = (Class)KSHTMLWriter;
  return [(KSXMLWriter *)&v4 hasCurrentAttributes]
      || [(NSMutableArray *)self->_classNames count] != 0;
}

- (id)currentAttributes
{
  v6.receiver = self;
  v6.super_class = (Class)KSHTMLWriter;
  char v3 = [(KSXMLWriter *)&v6 currentAttributes];
  objc_super v4 = [(KSHTMLWriter *)self currentElementClassName];
  if (v4) {
    [v3 addAttribute:@"class" value:v4];
  }

  return v3;
}

- (void)pushAttribute:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"class"])
  {
    [(KSHTMLWriter *)self pushClassName:v7];
  }
  else
  {
    if ([v6 isEqualToString:@"id"]) {
      [(NSMutableSet *)self->_IDs addObject:v7];
    }
    v8.receiver = self;
    v8.super_class = (Class)KSHTMLWriter;
    [(KSXMLWriter *)&v8 pushAttribute:v6 value:v7];
  }
}

- (void)pushClassName:(id)a3
{
}

- (id)currentElementClassName
{
  char v3 = (void *)[(NSMutableArray *)self->_classNames count];
  if (v3)
  {
    char v3 = [(NSMutableArray *)self->_classNames componentsJoinedByString:@" "];
  }
  return v3;
}

- (BOOL)isXHTML
{
  return self->_isXHTML;
}

- (void)setDocType:(id)a3
{
  objc_super v4 = (NSString *)[a3 copy];
  docType = self->_docType;
  self->_docType = v4;
  id v6 = v4;

  LOBYTE(docType) = [(id)objc_opt_class() isDocTypeXHTML:v6];
  self->_isXHTML = (char)docType;
}

- (void)startDocumentWithDocType:(id)a3 encoding:(unint64_t)a4
{
  id v6 = a3;
  [(KSHTMLWriter *)self setDocType:v6];
  v7.receiver = self;
  v7.super_class = (Class)KSHTMLWriter;
  [(KSXMLWriter *)&v7 startDocumentWithDocType:v6 encoding:a4];
}

- (KSHTMLWriter)initWithOutputWriter:(id)a3 docType:(id)a4 encoding:(unint64_t)a5
{
  id v8 = a4;
  id v9 = [(KSXMLWriter *)self initWithOutputWriter:a3 encoding:a5];
  id v10 = v9;
  if (v9) {
    [(KSHTMLWriter *)v9 setDocType:v8];
  }

  return v10;
}

- (KSHTMLWriter)initWithOutputWriter:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)KSHTMLWriter;
  char v3 = [(KSXMLWriter *)&v10 initWithOutputWriter:a3];
  objc_super v4 = v3;
  if (v3)
  {
    [(KSHTMLWriter *)v3 setDocType:KSHTMLWriterDocTypeHTML_5];
    id v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    IDs = v4->_IDs;
    v4->_IDs = v5;

    objc_super v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    classNames = v4->_classNames;
    v4->_classNames = v7;
  }
  return v4;
}

+ (BOOL)isDocTypeXHTML:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:KSHTMLWriterDocTypeHTML_4_01_Strict] & 1) != 0
    || ([v3 isEqualToString:KSHTMLWriterDocTypeHTML_4_01_Transitional] & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    int v4 = [v3 isEqualToString:KSHTMLWriterDocTypeHTML_4_01_Frameset] ^ 1;
  }

  return v4;
}

@end