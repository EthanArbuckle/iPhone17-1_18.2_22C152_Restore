@interface SHServerErrorResponse
- (NSDictionary)errorDictionary;
- (NSError)error;
- (SHServerErrorResponse)initWithErrorDictionary:(id)a3;
- (int64_t)errorCodeForResponseCode:(id)a3;
- (void)setErrorDictionary:(id)a3;
@end

@implementation SHServerErrorResponse

- (SHServerErrorResponse)initWithErrorDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHServerErrorResponse;
  v6 = [(SHServerErrorResponse *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_errorDictionary, a3);
  }

  return v7;
}

- (NSError)error
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = [(SHServerErrorResponse *)self errorDictionary];
  id v5 = [v4 objectForKeyedSubscript:@"detail"];

  if (v5)
  {
    v6 = [(SHServerErrorResponse *)self errorDictionary];
    v7 = [v6 objectForKeyedSubscript:@"detail"];
    [v3 setValue:v7 forKey:NSLocalizedDescriptionKey];
  }
  v8 = [(SHServerErrorResponse *)self errorDictionary];
  objc_super v9 = [v8 objectForKeyedSubscript:@"code"];
  v10 = +[SHError errorWithCode:[(SHServerErrorResponse *)self errorCodeForResponseCode:v9] underlyingError:0 keyOverrides:v3];

  return (NSError *)v10;
}

- (int64_t)errorCodeForResponseCode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"sh.001"])
  {
    int64_t v4 = 200;
  }
  else if ([v3 isEqualToString:@"sh.002"])
  {
    int64_t v4 = 201;
  }
  else
  {
    int64_t v4 = 202;
  }

  return v4;
}

- (NSDictionary)errorDictionary
{
  return self->_errorDictionary;
}

- (void)setErrorDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end