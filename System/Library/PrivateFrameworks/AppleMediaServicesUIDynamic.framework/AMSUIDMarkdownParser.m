@interface AMSUIDMarkdownParser
+ (void)initialize;
- (AMSUIDMarkdownParser)delegate;
- (AMSUIDMarkdownParser)init;
- (AMSUIDMarkdownParser)initWithString:(id)a3;
- (NSString)string;
- (_xmlParserCtxt)_parserContext;
- (void)parse;
- (void)reportErrorWithCode:(unint64_t)a3 userInfo:(id)a4;
- (void)reportParseError:(_xmlError *)a3;
- (void)setDelegate:(id)a3;
- (void)set_parserContext:(_xmlParserCtxt *)a3;
@end

@implementation AMSUIDMarkdownParser

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    xmlInitParser();
  }
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___AMSUIDMarkdownParser;
  objc_msgSendSuper2(&v3, sel_initialize);
}

- (AMSUIDMarkdownParser)initWithString:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSUIDMarkdownParser;
  v5 = [(AMSUIDMarkdownParser *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    string = v5->_string;
    v5->_string = (NSString *)v6;
  }
  return v5;
}

- (AMSUIDMarkdownParser)init
{
  return 0;
}

- (void)reportErrorWithCode:(unint64_t)a3 userInfo:(id)a4
{
  id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AppleMediaServicesUIDynamic.MarkdownParser.errorDomain" code:a3 userInfo:a4];
  v5 = [(AMSUIDMarkdownParser *)self delegate];
  [v5 parser:self parseErrorOccurred:v6];
}

- (void)reportParseError:(_xmlError *)a3
{
  if (a3->level == XML_ERR_FATAL)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v5 = [NSNumber numberWithInt:a3->line];
    [v8 setObject:v5 forKeyedSubscript:@"AppleMediaServicesUIDynamic.MarkdownParser.errorLineNumber"];

    id v6 = [NSNumber numberWithInt:a3->int2];
    [v8 setObject:v6 forKeyedSubscript:@"AppleMediaServicesUIDynamic.MarkdownParser.errorColumn"];

    v7 = (void *)[[NSString alloc] initWithUTF8String:a3->message];
    if (v7) {
      [v8 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F28568]];
    }
    [(AMSUIDMarkdownParser *)self reportErrorWithCode:a3->code userInfo:v8];
  }
}

- (void)parse
{
  objc_super v3 = [(AMSUIDMarkdownParser *)self delegate];

  if (!v3) {
    return;
  }
  id v4 = [(AMSUIDMarkdownParser *)self string];
  v5 = (const char *)[v4 UTF8String];

  if (!v5
    || ([(AMSUIDMarkdownParser *)self string],
        id v6 = objc_claimAutoreleasedReturnValue(),
        unint64_t v7 = [v6 lengthOfBytesUsingEncoding:4],
        v6,
        v7 >> 31))
  {
    id v8 = self;
    uint64_t v9 = -101;
LABEL_5:
    [(AMSUIDMarkdownParser *)v8 reportErrorWithCode:v9 userInfo:0];
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
  long long v34 = xmmword_1F1AB3420;
  long long v35 = unk_1F1AB3430;
  long long v36 = xmmword_1F1AB3440;
  long long v37 = unk_1F1AB3450;
  long long v30 = xmmword_1F1AB33E0;
  long long v31 = unk_1F1AB33F0;
  long long v32 = xmmword_1F1AB3400;
  long long v33 = *(_OWORD *)&off_1F1AB3410;
  long long v26 = xmmword_1F1AB33A0;
  long long v27 = unk_1F1AB33B0;
  long long v28 = xmmword_1F1AB33C0;
  long long v29 = *(_OWORD *)&off_1F1AB33D0;
  long long v22 = xmmword_1F1AB3360;
  long long v23 = *(_OWORD *)algn_1F1AB3370;
  long long v24 = xmmword_1F1AB3380;
  long long v25 = unk_1F1AB3390;
  sax = MemoryParserCtxt->sax;
  if (sax) {
    ((void (*)(_xmlSAXHandler *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))*MEMORY[0x1E4FBA9D0])(sax, v11, v12, v13, v14, v15, v16, v17, v22, *((void *)&v22 + 1), v23, *((void *)&v23 + 1), v24, *((void *)&v24 + 1), v25, *((void *)&v25 + 1), v26, *((void *)&v26 + 1), v27,
  }
      *((void *)&v27 + 1),
      v28,
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
      *((void *)&v33 + 1));
  v18->sax = (_xmlSAXHandler *)&v22;
  v18->userData = self;
  v18->encoding = (const xmlChar *)"UTF-8";
  v18->charset = 1;
  htmlCtxtUseOptions(v18, 10305);
  [(AMSUIDMarkdownParser *)self set_parserContext:v18];
  if (htmlParseDocument(v18))
  {
    xmlErrorPtr LastError = xmlCtxtGetLastError([(AMSUIDMarkdownParser *)self _parserContext]);
    if (LastError) {
      [(AMSUIDMarkdownParser *)self reportParseError:LastError];
    }
  }
  myDoc = v18->myDoc;
  if (myDoc) {
    xmlFreeDoc(myDoc);
  }
  v18->encoding = 0;
  v18->charset = 0;
  v18->sax = 0;
  v18->userData = 0;
  xmlFreeParserCtxt(v18);
  [(AMSUIDMarkdownParser *)self set_parserContext:0];
}

- (NSString)string
{
  return self->_string;
}

- (AMSUIDMarkdownParser)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AMSUIDMarkdownParser *)WeakRetained;
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