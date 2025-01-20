@interface SLGoogleOAuth2TokenResponse
- (NSArray)grantedDataclasses;
- (NSDate)expiryDate;
- (NSDictionary)data;
- (NSError)error;
- (NSString)GUID;
- (NSString)errorMessage;
- (NSString)idToken;
- (NSString)refreshToken;
- (NSString)token;
- (SLGoogleOAuth2TokenResponse)initWithData:(id)a3 urlResponse:(id)a4 error:(id)a5;
- (int64_t)statusCode;
@end

@implementation SLGoogleOAuth2TokenResponse

- (SLGoogleOAuth2TokenResponse)initWithData:(id)a3 urlResponse:(id)a4 error:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v38 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "length"));
  _SLLog(v5, 7, @"SLGoogleOAuth2TokenResponse initWithData: %@ length urlResponse: %@ error: %@");

  v41.receiver = self;
  v41.super_class = (Class)SLGoogleOAuth2TokenResponse;
  v12 = [(SLGoogleOAuth2TokenResponse *)&v41 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_error, a5);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v10;
      uint64_t v15 = [v14 statusCode];
      v13->_statusCode = v15;
      v39 = [NSNumber numberWithInteger:v15];
      _SLLog(v5, 7, @"SLGoogleOAuth2TokenResponse httpResponse status code %@");

      if (!v13->_error)
      {
        id v40 = 0;
        v16 = objc_msgSend(MEMORY[0x1E4F28D90], "JSONObjectWithData:options:error:", v9, 0, &v40, v39);
        id v17 = v40;
        id v18 = v40;
        if (v18) {
          objc_storeStrong((id *)&v13->_error, v17);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_storeStrong((id *)&v13->_data, v16);
          uint64_t v19 = [(NSDictionary *)v13->_data objectForKeyedSubscript:@"access_token"];
          token = v13->_token;
          v13->_token = (NSString *)v19;

          uint64_t v21 = [(NSDictionary *)v13->_data objectForKeyedSubscript:@"refresh_token"];
          refreshToken = v13->_refreshToken;
          v13->_refreshToken = (NSString *)v21;

          uint64_t v23 = [(NSDictionary *)v13->_data objectForKeyedSubscript:@"id_token"];
          idToken = v13->_idToken;
          v13->_idToken = (NSString *)v23;

          v25 = (void *)MEMORY[0x1E4F1C9C8];
          v26 = [(NSDictionary *)v13->_data objectForKeyedSubscript:@"expires_in"];
          uint64_t v27 = objc_msgSend(v25, "dateWithTimeIntervalSinceNow:", (double)objc_msgSend(v26, "integerValue"));
          expiryDate = v13->_expiryDate;
          v13->_expiryDate = (NSDate *)v27;

          v29 = [(NSDictionary *)v13->_data objectForKeyedSubscript:@"scope"];
          v30 = [v29 componentsSeparatedByString:@" "];

          uint64_t v31 = +[SLGoogleWebClient dataclassesForScopes:v30];
          grantedDataclasses = v13->_grantedDataclasses;
          v13->_grantedDataclasses = (NSArray *)v31;

          v33 = [(NSDictionary *)v13->_data objectForKeyedSubscript:@"error"];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            uint64_t v35 = [(NSDictionary *)v13->_data objectForKeyedSubscript:@"error"];
            errorMessage = v13->_errorMessage;
            v13->_errorMessage = (NSString *)v35;
          }
        }
        else
        {
          _SLLog(v5, 7, @"SLGoogleOAuth2TokenResponse response JSON data does not represent NSDictionary. Game over.");
        }
      }
    }
    else
    {
      _SLLog(v5, 7, @"SLGoogleOAuth2TokenResponse response is not NSHTTPURLResponse. Game over.");
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