@interface SLWebUserInfoResponse
- (NSArray)emailAddresses;
- (NSDictionary)userInfo;
- (NSError)error;
- (NSString)displayName;
- (NSString)emailAddress;
- (NSString)errorMessage;
- (SLWebUserInfoResponse)initWithData:(id)a3 urlResponse:(id)a4 error:(id)a5;
- (int64_t)statusCode;
- (void)setDisplayName:(id)a3;
- (void)setEmailAddresses:(id)a3;
- (void)setError:(id)a3;
- (void)setErrorMessage:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation SLWebUserInfoResponse

- (SLWebUserInfoResponse)initWithData:(id)a3 urlResponse:(id)a4 error:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "length"));
  _SLLog(v5, 7, @"SLWebUserInfoResponse initWithData: %@ length urlResponse: %@ error: %@");

  v22.receiver = self;
  v22.super_class = (Class)SLWebUserInfoResponse;
  v12 = [(SLWebUserInfoResponse *)&v22 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_error, a5);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v14 = [v10 statusCode];
      v13->_statusCode = v14;
      v20 = [NSNumber numberWithInteger:v14];
      _SLLog(v5, 7, @"SLWebUserInfoResponse httpResponse status code %@");

      if (!v13->_error)
      {
        id v21 = 0;
        v15 = objc_msgSend(MEMORY[0x1E4F28D90], "JSONObjectWithData:options:error:", v9, 0, &v21, v20);
        id v16 = v21;
        id v17 = v21;
        if (v17) {
          objc_storeStrong((id *)&v13->_error, v16);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(SLWebUserInfoResponse *)v13 _populateDataFromResponseDictionary:v15];
        }
        else {
          _SLLog(v5, 7, @"SLWebUserInfoResponse response JSON data does not represent NSDictionary. Game over.");
        }
      }
    }
    else
    {
      _SLLog(v5, 7, @"SLWebUserInfoResponse response is not NSHTTPURLResponse. Game over.");
    }
  }

  return v13;
}

- (void)setErrorMessage:(id)a3
{
}

- (NSString)emailAddress
{
  return (NSString *)[(NSArray *)self->_emailAddresses firstObject];
}

- (void)setEmailAddresses:(id)a3
{
}

- (void)setDisplayName:(id)a3
{
}

- (void)setUserInfo:(id)a3
{
}

- (void)setError:(id)a3
{
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)emailAddresses
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)errorMessage
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);

  objc_storeStrong((id *)&self->_displayName, 0);
}

@end