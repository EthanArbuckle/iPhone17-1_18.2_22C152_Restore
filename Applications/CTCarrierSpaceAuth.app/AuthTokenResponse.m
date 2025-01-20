@interface AuthTokenResponse
- (AuthTokenResponse)initWithData:(id)a3 urlResponse:(id)a4 error:(id)a5;
- (NSDate)expiryDate;
- (NSDictionary)data;
- (NSError)error;
- (NSString)errorDescription;
- (NSString)refreshToken;
- (NSString)token;
- (int64_t)statusCode;
@end

@implementation AuthTokenResponse

- (AuthTokenResponse)initWithData:(id)a3 urlResponse:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)AuthTokenResponse;
  v11 = [(AuthTokenResponse *)&v28 init];
  v12 = v11;
  if (v11)
  {
    p_error = &v11->_error;
    objc_storeStrong((id *)&v11->_error, a5);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v12->_statusCode = (int64_t)[v9 statusCode];
    }
    if (v8 && !*p_error)
    {
      id v27 = 0;
      v14 = +[NSJSONSerialization JSONObjectWithData:v8 options:0 error:&v27];
      id v15 = v27;
      id v16 = v27;
      if (v16) {
        objc_storeStrong((id *)&v12->_error, v15);
      }
      if (v14)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_storeStrong((id *)&v12->_data, v14);
          uint64_t v17 = [(NSDictionary *)v12->_data objectForKeyedSubscript:@"access_token"];
          token = v12->_token;
          v12->_token = (NSString *)v17;

          uint64_t v19 = [(NSDictionary *)v12->_data objectForKeyedSubscript:@"refresh_token"];
          refreshToken = v12->_refreshToken;
          v12->_refreshToken = (NSString *)v19;

          v21 = [(NSDictionary *)v12->_data objectForKeyedSubscript:@"expires_in"];
          if (v21)
          {
            v22 = [(NSDictionary *)v12->_data objectForKeyedSubscript:@"expires_in"];
            uint64_t v23 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", (double)(uint64_t)[v22 integerValue]);
            expiryDate = v12->_expiryDate;
            v12->_expiryDate = (NSDate *)v23;
          }
          v25 = [(NSDictionary *)v12->_data objectForKeyedSubscript:@"error"];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_storeStrong((id *)&v12->_errorDescription, v25);
          }
        }
      }
    }
  }

  return v12;
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (NSDictionary)data
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)token
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)refreshToken
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSDate)expiryDate
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)errorDescription
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorDescription, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_refreshToken, 0);
  objc_storeStrong((id *)&self->_token, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end