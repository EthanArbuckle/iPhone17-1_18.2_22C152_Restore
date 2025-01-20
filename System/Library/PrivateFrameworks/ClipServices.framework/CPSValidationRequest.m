@interface CPSValidationRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CPSValidationRequest)initWithCoder:(id)a3;
- (CPSValidationRequest)initWithURLs:(id)a3 bundleIDs:(id)a4;
- (CPSValidationRequest)initWithValidation:(id)a3;
- (NSArray)bundleIdentifiers;
- (NSArray)urls;
- (void)encodeWithCoder:(id)a3;
- (void)validateWithCompletion:(id)a3;
@end

@implementation CPSValidationRequest

- (CPSValidationRequest)initWithURLs:(id)a3 bundleIDs:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CPSValidationRequest;
  v9 = [(CPSValidationRequest *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_urls, a3);
    objc_storeStrong((id *)&v10->_bundleIdentifiers, a4);
    v11 = v10;
  }

  return v10;
}

- (CPSValidationRequest)initWithValidation:(id)a3
{
  id v4 = a3;
  v5 = [v4 allKeys];
  v6 = [v4 allValues];

  id v7 = [(CPSValidationRequest *)self initWithURLs:v5 bundleIDs:v6];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CPSValidationRequest *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(CPSValidationRequest *)self urls];
      id v7 = [(CPSValidationRequest *)v5 urls];
      int v8 = [v6 isEqualToArray:v7];

      if (v8)
      {
        v9 = [(CPSValidationRequest *)self bundleIdentifiers];
        v10 = [(CPSValidationRequest *)v5 bundleIdentifiers];
        char v11 = [v9 isEqualToArray:v10];
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (void)validateWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = +[CPSDaemonConnection sharedConnection];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__CPSValidationRequest_validateWithCompletion___block_invoke;
  v7[3] = &unk_26424F350;
  id v8 = v4;
  id v6 = v4;
  [v5 performValidationWithRequest:self completion:v7];
}

uint64_t __47__CPSValidationRequest_validateWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPSValidationRequest)initWithCoder:(id)a3
{
  v20[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CPSValidationRequest;
  v5 = [(CPSValidationRequest *)&v18 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x263EFFA08];
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
    id v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"URLs"];
    urls = v5->_urls;
    v5->_urls = (NSArray *)v9;

    char v11 = (void *)MEMORY[0x263EFFA08];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
    objc_super v13 = [v11 setWithArray:v12];
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"bundleIdentifiers"];
    bundleIdentifiers = v5->_bundleIdentifiers;
    v5->_bundleIdentifiers = (NSArray *)v14;

    v16 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  urls = self->_urls;
  id v5 = a3;
  [v5 encodeObject:urls forKey:@"URLs"];
  [v5 encodeObject:self->_bundleIdentifiers forKey:@"bundleIdentifiers"];
}

- (NSArray)urls
{
  return self->_urls;
}

- (NSArray)bundleIdentifiers
{
  return self->_bundleIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifiers, 0);

  objc_storeStrong((id *)&self->_urls, 0);
}

@end