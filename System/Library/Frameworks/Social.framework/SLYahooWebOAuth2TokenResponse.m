@interface SLYahooWebOAuth2TokenResponse
- (NSArray)grantedDataclasses;
- (NSDate)expiryDate;
- (NSDictionary)data;
- (NSError)error;
- (NSString)GUID;
- (NSString)errorMessage;
- (NSString)idToken;
- (NSString)refreshToken;
- (NSString)token;
- (SLYahooWebOAuth2TokenResponse)initWithData:(id)a3 urlResponse:(id)a4 error:(id)a5;
- (int64_t)statusCode;
@end

@implementation SLYahooWebOAuth2TokenResponse

- (SLYahooWebOAuth2TokenResponse)initWithData:(id)a3 urlResponse:(id)a4 error:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v32 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "length"));
  _SLLog(v5, 7, @"SLWebOAuth2TokenResponse initWithData: %@ length urlResponse: %@ error: %@");

  v35.receiver = self;
  v35.super_class = (Class)SLYahooWebOAuth2TokenResponse;
  v12 = [(SLYahooWebOAuth2TokenResponse *)&v35 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_error, a5);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v14 = [v10 statusCode];
      v13->_statusCode = v14;
      v33 = [NSNumber numberWithInteger:v14];
      _SLLog(v5, 7, @"SLWebOAuth2TokenResponse httpResponse status code %@");

      if (!v13->_error)
      {
        id v34 = 0;
        v15 = objc_msgSend(MEMORY[0x1E4F28D90], "JSONObjectWithData:options:error:", v9, 0, &v34, v33);
        id v16 = v34;
        id v17 = v34;
        if (v17) {
          objc_storeStrong((id *)&v13->_error, v16);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_storeStrong((id *)&v13->_data, v15);
          uint64_t v18 = [(NSDictionary *)v13->_data objectForKeyedSubscript:@"access_token"];
          token = v13->_token;
          v13->_token = (NSString *)v18;

          uint64_t v20 = [(NSDictionary *)v13->_data objectForKeyedSubscript:@"refresh_token"];
          refreshToken = v13->_refreshToken;
          v13->_refreshToken = (NSString *)v20;

          v22 = (void *)MEMORY[0x1E4F1C9C8];
          uint64_t v23 = [(NSDictionary *)v13->_data objectForKeyedSubscript:@"expires_in"];
          uint64_t v24 = objc_msgSend(v22, "dateWithTimeIntervalSinceNow:", (double)objc_msgSend((id)v23, "integerValue"));
          expiryDate = v13->_expiryDate;
          v13->_expiryDate = (NSDate *)v24;

          v26 = [(NSDictionary *)v13->_data objectForKeyedSubscript:@"error"];
          objc_opt_class();
          LOBYTE(v23) = objc_opt_isKindOfClass();

          if (v23)
          {
            uint64_t v27 = [(NSDictionary *)v13->_data objectForKeyedSubscript:@"error"];
            errorMessage = v13->_errorMessage;
            v13->_errorMessage = (NSString *)v27;
          }
          uint64_t v29 = [(NSDictionary *)v13->_data objectForKeyedSubscript:@"xoauth_yahoo_guid"];
          GUID = v13->_GUID;
          v13->_GUID = (NSString *)v29;
        }
        else
        {
          _SLLog(v5, 7, @"SLWebOAuth2TokenResponse response JSON data does not represent NSDictionary. Game over.");
        }
      }
    }
    else
    {
      _SLLog(v5, 7, @"SLWebOAuth2TokenResponse response is not NSHTTPURLResponse. Game over.");
    }
  }

  return v13;
}

- (NSDictionary)data
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)errorMessage
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSDate)expiryDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)GUID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)refreshToken
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (NSString)token
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)idToken
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (NSArray)grantedDataclasses
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_grantedDataclasses, 0);
  objc_storeStrong((id *)&self->_idToken, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_refreshToken, 0);
  objc_storeStrong((id *)&self->_GUID, 0);
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end