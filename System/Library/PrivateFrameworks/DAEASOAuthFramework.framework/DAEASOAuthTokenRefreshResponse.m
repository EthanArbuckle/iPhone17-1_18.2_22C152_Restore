@interface DAEASOAuthTokenRefreshResponse
- (DAEASOAuthTokenRefreshResponse)initWithData:(id)a3 urlResponse:(id)a4 error:(id)a5;
- (NSDate)expiryDate;
- (NSDictionary)responseBody;
- (NSError)error;
- (NSString)accessToken;
- (NSString)errorMessage;
- (NSString)errorName;
- (NSString)idToken;
- (NSString)refreshToken;
- (int64_t)statusCode;
@end

@implementation DAEASOAuthTokenRefreshResponse

- (DAEASOAuthTokenRefreshResponse)initWithData:(id)a3 urlResponse:(id)a4 error:(id)a5
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = DALoggingwithCategory();
  uint64_t v12 = MEMORY[0x263F38F90];
  os_log_type_t v13 = *(unsigned char *)(MEMORY[0x263F38F90] + 6);
  if (os_log_type_enabled(v11, v13))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v51 = [v8 length];
    __int16 v52 = 2112;
    id v53 = v10;
    _os_log_impl(&dword_22C076000, v11, v13, "DAEASOAuthTokenRefreshResponse initWithData: (length: %lu, responseError: %@)", buf, 0x16u);
  }

  v49.receiver = self;
  v49.super_class = (Class)DAEASOAuthTokenRefreshResponse;
  v14 = [(DAEASOAuthTokenRefreshResponse *)&v49 init];
  v15 = v14;
  if (v14)
  {
    p_error = &v14->_error;
    objc_storeStrong((id *)&v14->_error, a5);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v17 = DALoggingwithCategory();
      os_log_type_t v36 = *(unsigned char *)(v12 + 3);
      if (os_log_type_enabled(v17, v36))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C076000, v17, v36, "DAEASOAuthTokenRefreshResponse response is not NSHTTPURLResponse. Game over.", buf, 2u);
      }
      goto LABEL_21;
    }
    v17 = v9;
    v15->_int64_t statusCode = [v17 statusCode];
    v18 = DALoggingwithCategory();
    if (os_log_type_enabled(v18, v13))
    {
      int64_t statusCode = v15->_statusCode;
      *(_DWORD *)buf = 134217984;
      uint64_t v51 = statusCode;
      _os_log_impl(&dword_22C076000, v18, v13, "DAEASOAuthTokenRefreshResponse httpResponse status code %ld", buf, 0xCu);
    }

    if (*p_error)
    {
LABEL_21:

      goto LABEL_22;
    }
    id v48 = 0;
    v20 = [MEMORY[0x263F08900] JSONObjectWithData:v8 options:0 error:&v48];
    id v21 = v48;
    id v22 = v48;
    if (v22) {
      objc_storeStrong((id *)&v15->_error, v21);
    }
    v23 = [v20 objectForKeyedSubscript:@"error"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v25 = [v20 objectForKeyedSubscript:@"error"];
      errorName = v15->_errorName;
      v15->_errorName = (NSString *)v25;

      uint64_t v27 = [v20 objectForKeyedSubscript:@"error_description"];
      errorMessage = v15->_errorMessage;
      v15->_errorMessage = (NSString *)v27;

      v29 = DALoggingwithCategory();
      os_log_type_t v30 = *(unsigned char *)(v12 + 3);
      if (os_log_type_enabled(v29, v30))
      {
        v31 = v15->_errorMessage;
        *(_DWORD *)buf = 138543618;
        uint64_t v51 = (uint64_t)v31;
        __int16 v52 = 2112;
        id v53 = v20;
        v32 = "DAEASOAuthTokenRefreshResponse received an error: %{public}@ %@";
        v33 = v29;
        os_log_type_t v34 = v30;
        uint32_t v35 = 22;
LABEL_19:
        _os_log_impl(&dword_22C076000, v33, v34, v32, buf, v35);
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_storeStrong((id *)&v15->_responseBody, v20);
        uint64_t v37 = [(NSDictionary *)v15->_responseBody objectForKeyedSubscript:@"access_token"];
        accessToken = v15->_accessToken;
        v15->_accessToken = (NSString *)v37;

        uint64_t v39 = [(NSDictionary *)v15->_responseBody objectForKeyedSubscript:@"refresh_token"];
        refreshToken = v15->_refreshToken;
        v15->_refreshToken = (NSString *)v39;

        uint64_t v41 = [(NSDictionary *)v15->_responseBody objectForKeyedSubscript:@"id_token"];
        idToken = v15->_idToken;
        v15->_idToken = (NSString *)v41;

        v43 = (void *)MEMORY[0x263EFF910];
        v29 = [(NSDictionary *)v15->_responseBody objectForKeyedSubscript:@"expires_in"];
        uint64_t v44 = objc_msgSend(v43, "dateWithTimeIntervalSinceNow:", (double)-[NSObject integerValue](v29, "integerValue"));
        expiryDate = v15->_expiryDate;
        v15->_expiryDate = (NSDate *)v44;
      }
      else
      {
        v29 = DALoggingwithCategory();
        os_log_type_t v46 = *(unsigned char *)(v12 + 3);
        if (os_log_type_enabled(v29, v46))
        {
          *(_WORD *)buf = 0;
          v32 = "DAEASOAuthTokenRefreshResponse response JSON data does not represent NSDictionary. Game over.";
          v33 = v29;
          os_log_type_t v34 = v46;
          uint32_t v35 = 2;
          goto LABEL_19;
        }
      }
    }

    goto LABEL_21;
  }
LABEL_22:

  return v15;
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (NSError)error
{
  return self->_error;
}

- (NSString)errorName
{
  return self->_errorName;
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (NSDictionary)responseBody
{
  return self->_responseBody;
}

- (NSString)accessToken
{
  return self->_accessToken;
}

- (NSString)refreshToken
{
  return self->_refreshToken;
}

- (NSString)idToken
{
  return self->_idToken;
}

- (NSDate)expiryDate
{
  return self->_expiryDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_idToken, 0);
  objc_storeStrong((id *)&self->_refreshToken, 0);
  objc_storeStrong((id *)&self->_accessToken, 0);
  objc_storeStrong((id *)&self->_responseBody, 0);
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_errorName, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end