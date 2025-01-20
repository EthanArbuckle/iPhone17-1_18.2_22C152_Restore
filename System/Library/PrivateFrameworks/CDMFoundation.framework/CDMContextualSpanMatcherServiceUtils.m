@interface CDMContextualSpanMatcherServiceUtils
+ (id)buildContextualSpanMatcherRequestWithNLContext:(id)a3 requestId:(id)a4 tokenChain:(id)a5;
@end

@implementation CDMContextualSpanMatcherServiceUtils

+ (id)buildContextualSpanMatcherRequestWithNLContext:(id)a3 requestId:(id)a4 tokenChain:(id)a5
{
  v7 = (objc_class *)MEMORY[0x263F71DD8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(v7);
  [v11 setNlContext:v10];

  [v11 setRequestId:v9];
  [v11 setTokenChain:v8];

  return v11;
}

@end