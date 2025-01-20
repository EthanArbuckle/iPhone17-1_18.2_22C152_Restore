@interface SKStorePageRequest
- (NSDictionary)productParameters;
- (NSURL)productURL;
- (SKStorePageRequest)initWithXPCEncoding:(id)a3;
- (id)copyXPCEncoding;
- (int64_t)productPageStyle;
- (void)setProductPageStyle:(int64_t)a3;
- (void)setProductParameters:(id)a3;
- (void)setProductURL:(id)a3;
@end

@implementation SKStorePageRequest

- (SKStorePageRequest)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SKStorePageRequest;
  v5 = [(SKStorePageRequest *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"0"];
    if (objc_opt_respondsToSelector()) {
      v5->_pageStyle = [v6 integerValue];
    }
    v7 = [v4 objectForKey:@"1"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = [v7 copy];
      productParameters = v5->_productParameters;
      v5->_productParameters = (NSDictionary *)v8;
    }
    v10 = [v4 objectForKey:@"2"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v10];
      productURL = v5->_productURL;
      v5->_productURL = (NSURL *)v11;
    }
  }

  return v5;
}

- (id)copyXPCEncoding
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [NSNumber numberWithInteger:self->_pageStyle];
  [v3 setObject:v4 forKey:@"0"];

  productParameters = self->_productParameters;
  if (productParameters) {
    [v3 setObject:productParameters forKey:@"1"];
  }
  productURL = self->_productURL;
  if (productURL)
  {
    v7 = [(NSURL *)productURL absoluteString];
    [v3 setObject:v7 forKey:@"2"];
  }
  return v3;
}

- (int64_t)productPageStyle
{
  return self->_pageStyle;
}

- (void)setProductPageStyle:(int64_t)a3
{
  self->_pageStyle = a3;
}

- (NSDictionary)productParameters
{
  return self->_productParameters;
}

- (void)setProductParameters:(id)a3
{
}

- (NSURL)productURL
{
  return self->_productURL;
}

- (void)setProductURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productURL, 0);

  objc_storeStrong((id *)&self->_productParameters, 0);
}

@end