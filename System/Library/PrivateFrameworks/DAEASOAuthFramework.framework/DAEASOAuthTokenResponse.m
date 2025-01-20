@interface DAEASOAuthTokenResponse
- (DAEASOAuthTokenResponse)initWithData:(id)a3 urlResponse:(id)a4 error:(id)a5;
- (NSDate)expiryDate;
- (NSDictionary)data;
- (NSError)error;
- (NSString)accessToken;
- (NSString)errorMessage;
- (NSString)idToken;
- (NSString)refreshToken;
- (NSString)user_id;
- (id)usernameFromJWTToken:(id)a3;
- (int64_t)statusCode;
@end

@implementation DAEASOAuthTokenResponse

- (DAEASOAuthTokenResponse)initWithData:(id)a3 urlResponse:(id)a4 error:(id)a5
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = DALoggingwithCategory();
  uint64_t v12 = MEMORY[0x263F38F90];
  os_log_type_t v13 = *(unsigned char *)(MEMORY[0x263F38F90] + 6);
  if (os_log_type_enabled(v11, v13))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v54 = [v8 length];
    __int16 v55 = 2112;
    id v56 = v9;
    __int16 v57 = 2112;
    id v58 = v10;
    _os_log_impl(&dword_22C076000, v11, v13, "DAEASOAuthOAuth2TokenResponse initWithData: %lu length urlResponse: %@ error: %@", buf, 0x20u);
  }

  v52.receiver = self;
  v52.super_class = (Class)DAEASOAuthTokenResponse;
  v14 = [(DAEASOAuthTokenResponse *)&v52 init];
  v15 = v14;
  if (v14)
  {
    p_error = &v14->_error;
    objc_storeStrong((id *)&v14->_error, a5);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v17 = DALoggingwithCategory();
      os_log_type_t v26 = *(unsigned char *)(v12 + 3);
      if (os_log_type_enabled(v17, v26))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C076000, v17, v26, "DAEASOAuthOAuth2TokenResponse response is not NSHTTPURLResponse. Game over.", buf, 2u);
      }
      goto LABEL_15;
    }
    v17 = v9;
    v15->_int64_t statusCode = [v17 statusCode];
    v18 = DALoggingwithCategory();
    if (os_log_type_enabled(v18, v13))
    {
      int64_t statusCode = v15->_statusCode;
      *(_DWORD *)buf = 134217984;
      uint64_t v54 = statusCode;
      _os_log_impl(&dword_22C076000, v18, v13, "DAEASOAuthOAuth2TokenResponse httpResponse status code %ld", buf, 0xCu);
    }

    if (*p_error)
    {
LABEL_15:

      goto LABEL_16;
    }
    id v51 = 0;
    v20 = [MEMORY[0x263F08900] JSONObjectWithData:v8 options:0 error:&v51];
    v21 = (NSError *)v51;
    if (v21)
    {
      v22 = *p_error;
      *p_error = v21;
      v23 = v21;

      v24 = DALoggingwithCategory();
      os_log_type_t v25 = *(unsigned char *)(v12 + 3);
      if (os_log_type_enabled(v24, v25))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v54 = (uint64_t)v23;
        _os_log_impl(&dword_22C076000, v24, v25, "DAEASOAuthTokenResponse response JSON data does not represent NSDictionary. Game over. %@", buf, 0xCu);
      }

      goto LABEL_12;
    }
    objc_storeStrong((id *)&v15->_data, v20);
    v28 = [(NSDictionary *)v15->_data objectForKeyedSubscript:@"error"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v30 = [(NSDictionary *)v15->_data objectForKeyedSubscript:@"error_description"];
      errorMessage = v15->_errorMessage;
      v15->_errorMessage = (NSString *)v30;

      v23 = DALoggingwithCategory();
      os_log_type_t v32 = *(unsigned char *)(v12 + 3);
      if (os_log_type_enabled(v23, v32))
      {
        v33 = v15->_errorMessage;
        *(_DWORD *)buf = 138543618;
        uint64_t v54 = (uint64_t)v33;
        __int16 v55 = 2112;
        id v56 = v20;
        v34 = "DAEASOAuthTokenResponse received an error: %{public}@ %@";
        v35 = v23;
        os_log_type_t v36 = v32;
        uint32_t v37 = 22;
LABEL_25:
        _os_log_impl(&dword_22C076000, v35, v36, v34, buf, v37);
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v23 = [(NSDictionary *)v15->_data objectForKeyedSubscript:@"id_token"];
        uint64_t v38 = [(NSDictionary *)v15->_data objectForKeyedSubscript:@"id_token"];
        idToken = v15->_idToken;
        v15->_idToken = (NSString *)v38;

        if (v23)
        {
          uint64_t v40 = [(DAEASOAuthTokenResponse *)v15 usernameFromJWTToken:v23];
          user_id = v15->_user_id;
          v15->_user_id = (NSString *)v40;

          uint64_t v42 = [(NSDictionary *)v15->_data objectForKeyedSubscript:@"access_token"];
          accessToken = v15->_accessToken;
          v15->_accessToken = (NSString *)v42;

          uint64_t v44 = [(NSDictionary *)v15->_data objectForKeyedSubscript:@"refresh_token"];
          refreshToken = v15->_refreshToken;
          v15->_refreshToken = (NSString *)v44;

          v46 = (void *)MEMORY[0x263EFF910];
          v47 = [(NSDictionary *)v15->_data objectForKeyedSubscript:@"expires_in"];
          uint64_t v48 = objc_msgSend(v46, "dateWithTimeIntervalSinceNow:", (double)objc_msgSend(v47, "integerValue"));
          expiryDate = v15->_expiryDate;
          v15->_expiryDate = (NSDate *)v48;
        }
        goto LABEL_12;
      }
      v23 = DALoggingwithCategory();
      os_log_type_t v50 = *(unsigned char *)(v12 + 3);
      if (os_log_type_enabled(v23, v50))
      {
        *(_WORD *)buf = 0;
        v34 = "DAEASOAuthOAuth2TokenResponse response JSON data does not represent NSDictionary.";
        v35 = v23;
        os_log_type_t v36 = v50;
        uint32_t v37 = 2;
        goto LABEL_25;
      }
    }
LABEL_12:

    goto LABEL_15;
  }
LABEL_16:

  return v15;
}

- (id)usernameFromJWTToken:(id)a3
{
  v3 = [a3 componentsSeparatedByString:@"."];
  v4 = [v3 objectAtIndexedSubscript:1];

  if (([v4 length] & 3) != 0)
  {
    v5 = objc_msgSend(&stru_26DF7DF88, "stringByPaddingToLength:withString:startingAtIndex:", (int)(4 * vcvtpd_s64_f64((double)(unint64_t)objc_msgSend(v4, "length") * 0.25))- objc_msgSend(v4, "length"), @"=", 0);
    uint64_t v6 = [v4 stringByAppendingString:v5];

    v4 = (void *)v6;
  }
  v7 = [v4 stringByReplacingOccurrencesOfString:@"_" withString:@"/"];

  id v8 = [v7 stringByReplacingOccurrencesOfString:@"-" withString:@"+"];

  id v9 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v8 options:0];
  if (v9)
  {
    uint64_t v17 = 0;
    id v10 = [MEMORY[0x263F08900] JSONObjectWithData:v9 options:0 error:&v17];
    v11 = [v10 objectForKeyedSubscript:@"preferred_username"];
    uint64_t v12 = v11;
    if (v11 && objc_msgSend(v11, "mf_isLegalEmailAddress"))
    {
      id v13 = v12;
    }
    else
    {
      id v13 = [v10 objectForKeyedSubscript:@"email"];
    }
    v14 = v13;
  }
  else
  {
    id v10 = DALoggingwithCategory();
    os_log_type_t v15 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
    if (os_log_type_enabled(v10, v15))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C076000, v10, v15, "Can Not Retrieve E-mail address from DAEASOAuthTokenResponse response.", buf, 2u);
    }
    v14 = 0;
  }

  return v14;
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (NSDictionary)data
{
  return self->_data;
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

- (NSError)error
{
  return self->_error;
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (NSString)user_id
{
  return self->_user_id;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_user_id, 0);
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_idToken, 0);
  objc_storeStrong((id *)&self->_refreshToken, 0);
  objc_storeStrong((id *)&self->_accessToken, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end