@interface SLYahooLoginTokenResponse
- (NSError)error;
- (NSString)body;
- (NSString)loginToken;
- (SLYahooLoginTokenResponse)initWithData:(id)a3 urlResponse:(id)a4 error:(id)a5;
- (int64_t)statusCode;
@end

@implementation SLYahooLoginTokenResponse

- (SLYahooLoginTokenResponse)initWithData:(id)a3 urlResponse:(id)a4 error:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "length"));
  _SLLog(v5, 7, @"SLYahooLoginTokenResponse initWithData: %@ length urlResponse: %@ error: %@");

  v25.receiver = self;
  v25.super_class = (Class)SLYahooLoginTokenResponse;
  v12 = [(SLYahooLoginTokenResponse *)&v25 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_error, a5);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v14 = [v10 statusCode];
      v13->_statusCode = v14;
      v24 = [NSNumber numberWithInteger:v14];
      _SLLog(v5, 7, @"SLYahooLoginTokenResponse httpResponse status code %@");

      if (!v13->_error)
      {
        uint64_t v15 = objc_msgSend([NSString alloc], "initWithData:encoding:", v9, 4, v24);
        body = v13->_body;
        v13->_body = (NSString *)v15;

        v17 = [(NSString *)v13->_body componentsSeparatedByString:@"="];
        if ((unint64_t)[v17 count] < 2)
        {
          v19 = v17;
        }
        else
        {
          v18 = [v17 objectAtIndexedSubscript:1];
          v19 = [v18 componentsSeparatedByString:@"\n"];

          if ([v19 count])
          {
            uint64_t v20 = [v19 firstObject];
            loginToken = v13->_loginToken;
            v13->_loginToken = (NSString *)v20;
          }
        }
      }
    }
    else
    {
      _SLLog(v5, 7, @"SLYahooLoginTokenResponse response is not NSHTTPURLResponse. Game over.");
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

- (NSString)body
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)loginToken
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loginToken, 0);
  objc_storeStrong((id *)&self->_body, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

@end