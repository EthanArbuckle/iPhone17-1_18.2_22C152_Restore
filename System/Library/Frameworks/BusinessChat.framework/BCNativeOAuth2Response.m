@interface BCNativeOAuth2Response
- (BCError)error;
- (BCNativeOAuth2Response)initWithToken:(id)a3 error:(id)a4;
- (NSDictionary)dictionaryValue;
- (int64_t)status;
- (void)setStatus:(int64_t)a3;
@end

@implementation BCNativeOAuth2Response

- (BCNativeOAuth2Response)initWithToken:(id)a3 error:(id)a4
{
  v22[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)BCNativeOAuth2Response;
  v9 = [(BCNativeOAuth2Response *)&v21 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_token, a3);
    if (v8) {
      BOOL v11 = 1;
    }
    else {
      BOOL v11 = v7 == 0;
    }
    uint64_t v12 = 1;
    if (v11) {
      uint64_t v12 = 2;
    }
    v10->_status = v12;
    if (v8)
    {
      v13 = [BCError alloc];
      v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "code"));
      v15 = [v8 domain];
      v16 = [v8 localizedDescription];
      v17 = [(BCError *)v13 initWithCode:v14 domain:v15 message:v16];

      v22[0] = v17;
      uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
      errors = v10->_errors;
      v10->_errors = (NSArray *)v18;
    }
  }

  return v10;
}

- (NSDictionary)dictionaryValue
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  v4 = v3;
  if (self)
  {
    [v3 setObject:self->_token forKeyedSubscript:@"token"];
    v5 = NSStringFromNativeAuthStatus([(BCNativeOAuth2Response *)self status]);
    [v4 setObject:v5 forKeyedSubscript:@"status"];

    errors = self->_errors;
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"token"];
    v16 = NSStringFromNativeAuthStatus([0 status]);
    [v4 setObject:v16 forKeyedSubscript:@"status"];

    errors = 0;
  }
  if ([(NSArray *)errors count])
  {
    id v7 = objc_opt_new();
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    if (self) {
      id v8 = self->_errors;
    }
    else {
      id v8 = 0;
    }
    v9 = v8;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "dictionaryValue", (void)v17);
          [v7 addObject:v14];
        }
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }

    [v4 setObject:v7 forKeyedSubscript:@"errors"];
  }

  return (NSDictionary *)v4;
}

- (BCError)error
{
  if (self) {
    self = (BCNativeOAuth2Response *)self->_errors;
  }
  return (BCError *)[(BCNativeOAuth2Response *)self firstObject];
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errors, 0);

  objc_storeStrong((id *)&self->_token, 0);
}

@end