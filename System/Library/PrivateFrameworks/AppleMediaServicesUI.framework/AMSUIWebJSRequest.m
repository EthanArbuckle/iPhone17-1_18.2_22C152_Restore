@interface AMSUIWebJSRequest
+ (BOOL)supportsSecureCoding;
- (AMSUIWebJSRequest)init;
- (AMSUIWebJSRequest)initWithCoder:(id)a3;
- (AMSUIWebJSRequest)initWithServiceName:(id)a3 logKey:(id)a4;
- (NSDictionary)options;
- (NSString)logKey;
- (NSString)service;
- (void)encodeWithCoder:(id)a3;
- (void)setLogKey:(id)a3;
- (void)setOptions:(id)a3;
@end

@implementation AMSUIWebJSRequest

- (AMSUIWebJSRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)AMSUIWebJSRequest;
  return [(AMSUIWebJSRequest *)&v3 init];
}

- (AMSUIWebJSRequest)initWithServiceName:(id)a3 logKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AMSUIWebJSRequest;
  v9 = [(AMSUIWebJSRequest *)&v13 init];
  if (v9)
  {
    if (v8)
    {
      v10 = (NSString *)v8;
    }
    else
    {
      AMSGenerateLogCorrelationKey();
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    logKey = v9->_logKey;
    v9->_logKey = v10;

    objc_storeStrong((id *)&v9->_service, a3);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AMSUIWebJSRequest *)self logKey];
  [v4 encodeObject:v5 forKey:@"kCodingKeyLogKey"];

  v6 = [(AMSUIWebJSRequest *)self options];
  [v4 encodeObject:v6 forKey:@"kCodingKeyOptions"];

  id v7 = [(AMSUIWebJSRequest *)self service];
  [v4 encodeObject:v7 forKey:@"kCodingKeyService"];
}

- (AMSUIWebJSRequest)initWithCoder:(id)a3
{
  v17[5] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AMSUIWebJSRequest;
  v5 = [(AMSUIWebJSRequest *)&v16 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v17[2] = objc_opt_class();
    v17[3] = objc_opt_class();
    v17[4] = objc_opt_class();
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:5];
    id v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyLogKey"];
    logKey = v5->_logKey;
    v5->_logKey = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClasses:v8 forKey:@"kCodingKeyOptions"];
    options = v5->_options;
    v5->_options = (NSDictionary *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCodingKeyService"];
    service = v5->_service;
    v5->_service = (NSString *)v13;
  }
  return v5;
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void)setLogKey:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (NSString)service
{
  return self->_service;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
}

@end