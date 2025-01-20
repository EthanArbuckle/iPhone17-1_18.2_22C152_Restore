@interface WKDOMDocumentParserYieldToken
- (WKDOMDocumentParserYieldToken)initWithDocument:(NakedRef<WebCore::Document>)a3;
- (id).cxx_construct;
@end

@implementation WKDOMDocumentParserYieldToken

- (WKDOMDocumentParserYieldToken)initWithDocument:(NakedRef<WebCore::Document>)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WKDOMDocumentParserYieldToken;
  id v4 = [(WKDOMDocumentParserYieldToken *)&v7 init];
  if (v4)
  {
    uint64_t v5 = WTF::fastMalloc((WTF *)8);
    MEMORY[0x199737D00](v5, a3.var0);
    std::unique_ptr<WebCore::DocumentParserYieldToken>::reset[abi:sn180100]((uint64_t *)v4 + 1, v5);
  }
  return (WKDOMDocumentParserYieldToken *)v4;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end