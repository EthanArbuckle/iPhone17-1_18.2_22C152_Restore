@interface CPSValidationResult
+ (BOOL)supportsSecureCoding;
- (CPSValidationRequest)request;
- (CPSValidationResult)initWithCoder:(id)a3;
- (CPSValidationResult)initWithRequest:(id)a3 response:(id)a4;
- (NSDictionary)availabilities;
- (id)validBundleIDForURL:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CPSValidationResult

- (CPSValidationResult)initWithRequest:(id)a3 response:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CPSValidationResult;
  v9 = [(CPSValidationResult *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    objc_storeStrong((id *)&v10->_response, a4);
    v11 = v10;
  }

  return v10;
}

- (id)validBundleIDForURL:(id)a3
{
  return [(NSDictionary *)self->_response objectForKeyedSubscript:a3];
}

- (NSDictionary)availabilities
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = [(CPSValidationRequest *)self->_request urls];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v10 = [(CPSValidationResult *)self validBundleIDForURL:v9];
        BOOL v11 = v10 != 0;

        v12 = [NSNumber numberWithBool:v11];
        [v3 setObject:v12 forKeyedSubscript:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return (NSDictionary *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPSValidationResult)initWithCoder:(id)a3
{
  v16[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CPSValidationResult;
  uint64_t v5 = [(CPSValidationResult *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"request"];
    request = v5->_request;
    v5->_request = (CPSValidationRequest *)v6;

    id v8 = (void *)MEMORY[0x263EFFA08];
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    v16[2] = objc_opt_class();
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:3];
    v10 = [v8 setWithArray:v9];
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"response"];
    response = v5->_response;
    v5->_response = (NSDictionary *)v11;

    objc_super v13 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  request = self->_request;
  id v5 = a3;
  [v5 encodeObject:request forKey:@"request"];
  [v5 encodeObject:self->_response forKey:@"response"];
}

- (CPSValidationRequest)request
{
  return self->_request;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);

  objc_storeStrong((id *)&self->_response, 0);
}

@end