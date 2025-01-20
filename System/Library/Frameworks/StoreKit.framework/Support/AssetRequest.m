@interface AssetRequest
- (AssetRequest)initWithRequest:(id)a3 properties:(id)a4;
- (AssetRequest)initWithURL:(id)a3 cachePolicy:(unint64_t)a4 timeoutInterval:(double)a5;
- (AssetRequest)initWithURL:(id)a3 properties:(id)a4;
- (id)copyRequestProperties;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)setAllowsCellularAccess:(BOOL)a3;
- (void)setAllowsConstrainedNetworkAccess:(BOOL)a3;
- (void)setAllowsExpensiveNetworkAccess:(BOOL)a3;
@end

@implementation AssetRequest

- (AssetRequest)initWithRequest:(id)a3 properties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  v15.receiver = self;
  v15.super_class = (Class)AssetRequest;
  v9 = (AssetRequest *)-[AssetRequest _initWithCFURLRequest:](&v15, "_initWithCFURLRequest:", [v8 _CFURLRequest]);
  if (v9)
  {
    v10 = (AssetRequestProperties *)[v7 copy];
    properties = v9->_properties;
    v9->_properties = v10;

    if (!v9->_properties)
    {
      v12 = objc_alloc_init(AssetRequestProperties);
      v13 = v9->_properties;
      v9->_properties = v12;
    }
    if (![v8 allowsCellularAccess]
      || ([v7 allowsCellularAccess] & 1) == 0)
    {
      [(AssetRequest *)v9 setAllowsCellularAccess:0];
    }
    if (![v8 allowsConstrainedNetworkAccess]
      || ([v7 allowsConstrainedNetworkAccess] & 1) == 0)
    {
      [(AssetRequest *)v9 setAllowsConstrainedNetworkAccess:0];
    }
    if (![v8 allowsExpensiveNetworkAccess]
      || ([v7 allowsExpensiveNetworkAccess] & 1) == 0)
    {
      [(AssetRequest *)v9 setAllowsExpensiveNetworkAccess:0];
    }
  }

  return v9;
}

- (AssetRequest)initWithURL:(id)a3 properties:(id)a4
{
  id v6 = a4;
  id v7 = +[NSURLRequest requestWithURL:a3];
  id v8 = [(AssetRequest *)self initWithRequest:v7 properties:v6];

  return v8;
}

- (AssetRequest)initWithURL:(id)a3 cachePolicy:(unint64_t)a4 timeoutInterval:(double)a5
{
  id v6 = +[NSURLRequest requestWithURL:a3 cachePolicy:a4 timeoutInterval:a5];
  id v7 = [(AssetRequest *)self initWithRequest:v6 properties:0];

  return v7;
}

- (void)setAllowsCellularAccess:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)AssetRequest;
  -[AssetRequest setAllowsCellularAccess:](&v5, "setAllowsCellularAccess:");
  [(AssetRequestProperties *)self->_properties setAllowsCellularAccess:v3];
}

- (void)setAllowsConstrainedNetworkAccess:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)AssetRequest;
  -[AssetRequest setAllowsConstrainedNetworkAccess:](&v5, "setAllowsConstrainedNetworkAccess:");
  [(AssetRequestProperties *)self->_properties setAllowsConstrainedNetworkAccess:v3];
}

- (void)setAllowsExpensiveNetworkAccess:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)AssetRequest;
  -[AssetRequest setAllowsExpensiveNetworkAccess:](&v5, "setAllowsExpensiveNetworkAccess:");
  [(AssetRequestProperties *)self->_properties setAllowsExpensiveNetworkAccess:v3];
}

- (id)copyRequestProperties
{
  return [(AssetRequestProperties *)self->_properties copy];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v5 = [(id)objc_opt_class() allocWithZone:a3];
  id v6 = [(AssetRequestProperties *)self->_properties mutableCopyWithZone:a3];
  id v7 = [v5 initWithRequest:self properties:v6];

  return v7;
}

- (void).cxx_destruct
{
}

@end