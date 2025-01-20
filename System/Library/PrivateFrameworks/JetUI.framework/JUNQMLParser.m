@interface JUNQMLParser
+ (void)initialize;
- (JUNQMLParser)init;
- (JUNQMLParser)initWithString:(id)a3 behavior:(unint64_t)a4;
- (JUNQMLParserDelegate)delegate;
- (NSString)string;
- (_xmlParserCtxt)_parserContext;
- (unint64_t)behavior;
- (void)parse;
- (void)reportErrorWithCode:(unint64_t)a3 userInfo:(id)a4;
- (void)reportParseError:(_xmlError *)a3;
- (void)setDelegate:(id)a3;
- (void)set_parserContext:(_xmlParserCtxt *)a3;
@end

@implementation JUNQMLParser

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    xmlInitParser();
  }
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___JUNQMLParser;
  objc_msgSendSuper2(&v3, sel_initialize);
}

- (JUNQMLParser)initWithString:(id)a3 behavior:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)JUNQMLParser;
  v7 = [(JUNQMLParser *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    string = v7->_string;
    v7->_string = (NSString *)v8;

    v7->_behavior = a4;
  }

  return v7;
}

- (JUNQMLParser)init
{
  return 0;
}

- (void)reportErrorWithCode:(unint64_t)a3 userInfo:(id)a4
{
  id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"JetUI.NQMLParser.errorDomain" code:a3 userInfo:a4];
  v5 = [(JUNQMLParser *)self delegate];
  [v5 parser:self parseErrorOccurred:v6];
}

- (void)reportParseError:(_xmlError *)a3
{
  if (a3->level == XML_ERR_FATAL)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v5 = [NSNumber numberWithInt:a3->line];
    [v8 setObject:v5 forKeyedSubscript:@"JetUI.NQMLParser.errorLineNumber"];

    id v6 = [NSNumber numberWithInt:a3->int2];
    [v8 setObject:v6 forKeyedSubscript:@"JetUI.NQMLParser.errorColumn"];

    v7 = (void *)[[NSString alloc] initWithUTF8String:a3->message];
    if (v7) {
      [v8 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F28568]];
    }
    [(JUNQMLParser *)self reportErrorWithCode:a3->code userInfo:v8];
  }
}

- (void)parse
{
  objc_super v3 = [(JUNQMLParser *)self delegate];

  if (!v3) {
    return;
  }
  id v4 = [(JUNQMLParser *)self string];
  v5 = (const char *)[v4 UTF8String];

  if (!v5
    || ([(JUNQMLParser *)self string],
        id v6 = objc_claimAutoreleasedReturnValue(),
        unint64_t v7 = [v6 lengthOfBytesUsingEncoding:4],
        v6,
        v7 >> 31))
  {
    id v8 = self;
    uint64_t v9 = -101;
LABEL_5:
    [(JUNQMLParser *)v8 reportErrorWithCode:v9 userInfo:0];
    return;
  }
  htmlParserCtxtPtr MemoryParserCtxt = htmlCreateMemoryParserCtxt(v5, v7);
  if (!MemoryParserCtxt)
  {
    id v8 = self;
    uint64_t v9 = -100;
    goto LABEL_5;
  }
  v18 = MemoryParserCtxt;
  long long v35 = xmmword_1F09536D8;
  long long v36 = unk_1F09536E8;
  long long v37 = xmmword_1F09536F8;
  long long v38 = unk_1F0953708;
  long long v31 = xmmword_1F0953698;
  long long v32 = unk_1F09536A8;
  long long v33 = xmmword_1F09536B8;
  long long v34 = *(_OWORD *)&off_1F09536C8;
  long long v27 = xmmword_1F0953658;
  long long v28 = unk_1F0953668;
  long long v29 = xmmword_1F0953678;
  long long v30 = *(_OWORD *)&off_1F0953688;
  long long v23 = xmmword_1F0953618;
  long long v24 = unk_1F0953628;
  long long v25 = xmmword_1F0953638;
  long long v26 = unk_1F0953648;
  sax = MemoryParserCtxt->sax;
  if (sax) {
    ((void (*)(_xmlSAXHandler *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))*MEMORY[0x1E4FBA9D0])(sax, v11, v12, v13, v14, v15, v16, v17, v23, *((void *)&v23 + 1), v24, *((void *)&v24 + 1), v25, *((void *)&v25 + 1), v26, *((void *)&v26 + 1), v27, *((void *)&v27 + 1), v28,
  }
      *((void *)&v28 + 1),
      v29,
      *((void *)&v29 + 1),
      v30,
      *((void *)&v30 + 1),
      v31,
      *((void *)&v31 + 1),
      v32,
      *((void *)&v32 + 1),
      v33,
      *((void *)&v33 + 1),
      v34,
      *((void *)&v34 + 1));
  v18->sax = (_xmlSAXHandler *)&v23;
  v18->userData = self;
  v18->encoding = (const xmlChar *)"UTF-8";
  v18->charset = 1;
  htmlCtxtUseOptions(v18, 10305);
  [(JUNQMLParser *)self set_parserContext:v18];
  int v20 = htmlParseDocument(v18);
  myDoc = v18->myDoc;
  if (myDoc) {
    xmlFreeDoc(myDoc);
  }
  if (v20)
  {
    xmlErrorPtr LastError = xmlCtxtGetLastError([(JUNQMLParser *)self _parserContext]);
    if (LastError) {
      [(JUNQMLParser *)self reportParseError:LastError];
    }
  }
  v18->encoding = 0;
  v18->charset = 0;
  v18->sax = 0;
  v18->userData = 0;
  xmlFreeParserCtxt(v18);
  [(JUNQMLParser *)self set_parserContext:0];
}

- (NSString)string
{
  return self->_string;
}

- (unint64_t)behavior
{
  return self->_behavior;
}

- (JUNQMLParserDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (JUNQMLParserDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_xmlParserCtxt)_parserContext
{
  return self->__parserContext;
}

- (void)set_parserContext:(_xmlParserCtxt *)a3
{
  self->__parserContext = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_string, 0);
}

@end