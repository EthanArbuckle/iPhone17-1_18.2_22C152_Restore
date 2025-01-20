@interface AMSURLRequest
+ (id)logableDescriptionForRequest:(id)a3;
- (AMSURLRequest)initWithRequest:(id)a3;
- (AMSURLRequest)initWithRequest:(id)a3 bag:(id)a4;
- (AMSURLRequest)initWithRequest:(id)a3 properties:(id)a4;
- (AMSURLRequest)initWithRequest:(id)a3 purchaseType:(int64_t)a4 buyParams:(id)a5;
- (AMSURLRequest)initWithURL:(id)a3 cachePolicy:(unint64_t)a4 timeoutInterval:(double)a5;
- (AMSURLRequestProperties)properties;
- (NSURLRequest)urlRequest;
- (id)_initWithCFURLRequest:(_CFURLRequest *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)setProperties:(id)a3;
@end

@implementation AMSURLRequest

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v5 = +[AMSURLRequest allocWithZone:](AMSURLRequest, "allocWithZone:");
  v11.receiver = self;
  v11.super_class = (Class)AMSURLRequest;
  id v6 = [(AMSURLRequest *)&v11 mutableCopyWithZone:a3];
  v7 = [(AMSURLRequest *)self properties];
  v8 = (void *)[v7 copyWithZone:a3];
  v9 = [(AMSURLRequest *)v5 initWithRequest:v6 properties:v8];

  return v9;
}

- (AMSURLRequest)initWithRequest:(id)a3 properties:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AMSURLRequest;
  v8 = -[AMSURLRequest _initWithCFURLRequest:](&v11, sel__initWithCFURLRequest_, [a3 _CFURLRequest]);
  v9 = (AMSURLRequest *)v8;
  if (v8) {
    objc_storeStrong(v8 + 3, a4);
  }

  return v9;
}

- (void).cxx_destruct
{
}

- (AMSURLRequestProperties)properties
{
  return self->_properties;
}

+ (id)logableDescriptionForRequest:(id)a3
{
  v3 = NSString;
  id v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  id v7 = [v4 URL];
  v8 = AMSLogableURL(v7);
  v9 = [v3 stringWithFormat:@"<%@: %p> { URL: %@ }", v6, v4, v8];

  return v9;
}

- (NSURLRequest)urlRequest
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F18DA8]), "_initWithCFURLRequest:", -[AMSURLRequest _CFURLRequest](self, "_CFURLRequest"));
  return (NSURLRequest *)v2;
}

- (AMSURLRequest)initWithRequest:(id)a3
{
  uint64_t v4 = [a3 _CFURLRequest];
  return (AMSURLRequest *)[(AMSURLRequest *)self _initWithCFURLRequest:v4];
}

- (id)_initWithCFURLRequest:(_CFURLRequest *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AMSURLRequest;
  v3 = [(AMSURLRequest *)&v7 _initWithCFURLRequest:a3];
  if (v3)
  {
    uint64_t v4 = objc_alloc_init(AMSURLRequestProperties);
    v5 = (void *)v3[3];
    v3[3] = v4;
  }
  return v3;
}

- (AMSURLRequest)initWithURL:(id)a3 cachePolicy:(unint64_t)a4 timeoutInterval:(double)a5
{
  v9.receiver = self;
  v9.super_class = (Class)AMSURLRequest;
  v5 = [(AMSURLRequest *)&v9 initWithURL:a3 cachePolicy:a4 timeoutInterval:a5];
  if (v5)
  {
    id v6 = objc_alloc_init(AMSURLRequestProperties);
    properties = v5->_properties;
    v5->_properties = v6;
  }
  return v5;
}

- (AMSURLRequest)initWithRequest:(id)a3 purchaseType:(int64_t)a4 buyParams:(id)a5
{
  id v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AMSURLRequest;
  objc_super v9 = -[AMSURLRequest _initWithCFURLRequest:](&v15, sel__initWithCFURLRequest_, [a3 _CFURLRequest]);
  if (v9)
  {
    v10 = [[AMSPurchase alloc] initWithPurchaseType:a4 buyParams:v8];
    objc_super v11 = [[AMSPurchaseInfo alloc] initWithPurchase:v10];
    v12 = objc_alloc_init(AMSURLRequestProperties);
    [(AMSURLRequestProperties *)v12 setPurchaseInfo:v11];
    properties = v9->_properties;
    v9->_properties = v12;
  }
  return v9;
}

- (AMSURLRequest)initWithRequest:(id)a3 bag:(id)a4
{
  id v6 = a4;
  objc_super v7 = [(AMSURLRequest *)self initWithRequest:a3];
  id v8 = v7;
  if (v7) {
    [(AMSURLRequestProperties *)v7->_properties setBag:v6];
  }

  return v8;
}

- (id)description
{
  return +[AMSURLRequest logableDescriptionForRequest:self];
}

- (void)setProperties:(id)a3
{
}

@end