@interface DCCredentialResponse
+ (BOOL)supportsSecureCoding;
- (DCCredentialResponse)initWithCoder:(id)a3;
- (DCCredentialResponse)initWithResponseData:(id)a3 elementsByNamespace:(id)a4;
- (NSData)responseData;
- (NSDictionary)elementsByNamespace;
- (void)encodeWithCoder:(id)a3;
- (void)setElementsByNamespace:(id)a3;
- (void)setResponseData:(id)a3;
@end

@implementation DCCredentialResponse

- (DCCredentialResponse)initWithResponseData:(id)a3 elementsByNamespace:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DCCredentialResponse;
  v8 = [(DCCredentialResponse *)&v12 init];
  if (v8)
  {
    v9 = (void *)[v6 copy];
    [(DCCredentialResponse *)v8 setResponseData:v9];

    v10 = (void *)[v7 copy];
    [(DCCredentialResponse *)v8 setElementsByNamespace:v10];
  }
  return v8;
}

- (DCCredentialResponse)initWithCoder:(id)a3
{
  v14[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = NSStringFromSelector(sel_responseData);
  id v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  v14[2] = objc_opt_class();
  v14[3] = objc_opt_class();
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:4];
  v9 = [MEMORY[0x263EFFA08] setWithArray:v8];
  v10 = NSStringFromSelector(sel_elementsByNamespace);
  v11 = [v4 decodeObjectOfClasses:v9 forKey:v10];

  objc_super v12 = 0;
  if (v7 && v11)
  {
    self = [(DCCredentialResponse *)self initWithResponseData:v7 elementsByNamespace:v11];
    objc_super v12 = self;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DCCredentialResponse *)self responseData];
  id v6 = NSStringFromSelector(sel_responseData);
  [v4 encodeObject:v5 forKey:v6];

  id v8 = [(DCCredentialResponse *)self elementsByNamespace];
  id v7 = NSStringFromSelector(sel_elementsByNamespace);
  [v4 encodeObject:v8 forKey:v7];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)responseData
{
  return self->_responseData;
}

- (void)setResponseData:(id)a3
{
}

- (NSDictionary)elementsByNamespace
{
  return self->_elementsByNamespace;
}

- (void)setElementsByNamespace:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementsByNamespace, 0);

  objc_storeStrong((id *)&self->_responseData, 0);
}

@end