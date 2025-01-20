@interface SLYahooOAuth2MigrationResponse
- (NSDate)expiryDate;
- (NSDictionary)responseBody;
- (NSError)error;
- (NSString)accessToken;
- (NSString)refreshToken;
- (SLYahooOAuth2MigrationResponse)initWithData:(id)a3 urlResponse:(id)a4 error:(id)a5;
- (int64_t)statusCode;
@end

@implementation SLYahooOAuth2MigrationResponse

- (SLYahooOAuth2MigrationResponse)initWithData:(id)a3 urlResponse:(id)a4 error:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v28 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "length"));
  _SLLog(v5, 7, @"SLYahooOAuth2MigrationResponse initWithData: %@ length urlResponse: %@ error: %@");

  v31.receiver = self;
  v31.super_class = (Class)SLYahooOAuth2MigrationResponse;
  v12 = [(SLYahooOAuth2MigrationResponse *)&v31 init];
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
      v29 = [NSNumber numberWithInteger:v15];
      _SLLog(v5, 7, @"SLYahooOAuth2MigrationResponse httpResponse status code %@");

      if (!v13->_error)
      {
        id v30 = 0;
        v16 = objc_msgSend(MEMORY[0x1E4F28D90], "JSONObjectWithData:options:error:", v9, 0, &v30, v29);
        id v17 = v30;
        id v18 = v30;
        if (v18) {
          objc_storeStrong((id *)&v13->_error, v17);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_storeStrong((id *)&v13->_responseBody, v16);
          uint64_t v19 = [(NSDictionary *)v13->_responseBody objectForKeyedSubscript:@"access_token"];
          accessToken = v13->_accessToken;
          v13->_accessToken = (NSString *)v19;

          uint64_t v21 = [(NSDictionary *)v13->_responseBody objectForKeyedSubscript:@"refresh_token"];
          refreshToken = v13->_refreshToken;
          v13->_refreshToken = (NSString *)v21;

          v23 = (void *)MEMORY[0x1E4F1C9C8];
          v24 = [(NSDictionary *)v13->_responseBody objectForKeyedSubscript:@"expires_in"];
          uint64_t v25 = objc_msgSend(v23, "dateWithTimeIntervalSinceNow:", (double)objc_msgSend(v24, "integerValue"));
          expiryDate = v13->_expiryDate;
          v13->_expiryDate = (NSDate *)v25;
        }
        else
        {
          _SLLog(v5, 7, @"SLYahooOAuth2MigrationResponse response JSON data does not represent NSDictionary. Game over.");
        }
      }
    }
    else
    {
      _SLLog(v5, 7, @"SLYahooOAuth2MigrationResponse response is not NSHTTPURLResponse. Game over.");
    }
  }

  return v13;
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)responseBody
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)accessToken
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)refreshToken
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSDate)expiryDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_refreshToken, 0);
  objc_storeStrong((id *)&self->_accessToken, 0);
  objc_storeStrong((id *)&self->_responseBody, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

@end