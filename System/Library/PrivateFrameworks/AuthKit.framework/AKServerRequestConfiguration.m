@interface AKServerRequestConfiguration
+ (BOOL)supportsSecureCoding;
- (AKAppleIDServerResourceLoadDelegate)resourceLoadDelegate;
- (AKServerRequestConfiguration)initWithCoder:(id)a3;
- (AKServerRequestConfiguration)initWithRequest:(id)a3 requestType:(unint64_t)a4;
- (NSArray)whitelistedPathURLs;
- (NSURLRequest)request;
- (id)description;
- (unint64_t)presentationType;
- (unint64_t)requestType;
- (void)encodeWithCoder:(id)a3;
- (void)setPresentationType:(unint64_t)a3;
- (void)setRequest:(id)a3;
- (void)setRequestType:(unint64_t)a3;
- (void)setResourceLoadDelegate:(id)a3;
- (void)setWhitelistedPathURLs:(id)a3;
@end

@implementation AKServerRequestConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKServerRequestConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AKServerRequestConfiguration;
  v5 = [(AKServerRequestConfiguration *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_request"];
    request = v5->_request;
    v5->_request = (NSURLRequest *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_resourceLoadDelegate"];
    resourceLoadDelegate = v5->_resourceLoadDelegate;
    v5->_resourceLoadDelegate = (AKAppleIDServerResourceLoadDelegate *)v8;

    v5->_requestType = [v4 decodeIntegerForKey:@"_requestType"];
    v5->_presentationType = [v4 decodeIntegerForKey:@"_presentationType"];
    v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"_whitelistedRedirectURLs"];
    whitelistedPathURLs = v5->_whitelistedPathURLs;
    v5->_whitelistedPathURLs = (NSArray *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  request = self->_request;
  id v5 = a3;
  [v5 encodeObject:request forKey:@"_request"];
  [v5 encodeObject:self->_resourceLoadDelegate forKey:@"_resourceLoadDelegate"];
  [v5 encodeInteger:self->_requestType forKey:@"_requestType"];
  [v5 encodeInteger:self->_presentationType forKey:@"_presentationType"];
  [v5 encodeObject:self->_whitelistedPathURLs forKey:@"_whitelistedRedirectURLs"];
}

- (AKServerRequestConfiguration)initWithRequest:(id)a3 requestType:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AKServerRequestConfiguration;
  uint64_t v8 = [(AKServerRequestConfiguration *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_requestType = a4;
    objc_storeStrong((id *)&v8->_request, a3);
  }

  return v9;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p \n{\n request: %@\n delegate: %@\n requestType: %lu\n presentationType: %lu \n}>", v5, self, self->_request, self->_resourceLoadDelegate, self->_requestType, self->_presentationType];

  return v6;
}

- (NSURLRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (AKAppleIDServerResourceLoadDelegate)resourceLoadDelegate
{
  return self->_resourceLoadDelegate;
}

- (void)setResourceLoadDelegate:(id)a3
{
}

- (unint64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(unint64_t)a3
{
  self->_requestType = a3;
}

- (unint64_t)presentationType
{
  return self->_presentationType;
}

- (void)setPresentationType:(unint64_t)a3
{
  self->_presentationType = a3;
}

- (NSArray)whitelistedPathURLs
{
  return self->_whitelistedPathURLs;
}

- (void)setWhitelistedPathURLs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whitelistedPathURLs, 0);
  objc_storeStrong((id *)&self->_resourceLoadDelegate, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

@end