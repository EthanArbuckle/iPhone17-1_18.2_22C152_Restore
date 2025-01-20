@interface NSError(HKOAuth2)
+ (__CFString)_hk_OAuth2_defaultDescriptionForErrorCode:()HKOAuth2;
+ (id)_hk_OAuth2_error:()HKOAuth2 userInfo:underlyingError:;
+ (id)_hk_OAuth2_errorForBadRequestStatusWithResponse:()HKOAuth2 data:;
+ (id)_hk_OAuth2_errorForUnauthorizedStatusWithRequest:()HKOAuth2 response:;
+ (id)_hk_OAuth2_errorFromResponseData:()HKOAuth2 defaultError:parseError:;
+ (id)_hk_OAuth2_rawErrorForRequest:()HKOAuth2 response:data:;
+ (id)hk_OAuth2_errorForRequest:()HKOAuth2 response:data:;
+ (id)hk_OAuth2_errorFromErrorValue:()HKOAuth2;
+ (uint64_t)hk_OAuth2_error:()HKOAuth2;
+ (uint64_t)hk_OAuth2_error:()HKOAuth2 underlyingError:;
- (__CFString)hk_OAuth2_errorCode;
- (id)_hk_OAuth2_errorByAddingItemsToUserInfo:()HKOAuth2;
- (uint64_t)hk_OAuth2_isAccessDeniedError;
- (uint64_t)hk_OAuth2_isBearerAuthenticationError;
- (uint64_t)hk_OAuth2_isOAuth2Error;
- (uint64_t)hk_OAuth2_isOAuth2ErrorWithCode:()HKOAuth2;
@end

@implementation NSError(HKOAuth2)

+ (uint64_t)hk_OAuth2_error:()HKOAuth2
{
  return objc_msgSend(a1, "hk_OAuth2_error:underlyingError:", a3, 0);
}

+ (uint64_t)hk_OAuth2_error:()HKOAuth2 underlyingError:
{
  return objc_msgSend(a1, "_hk_OAuth2_error:userInfo:underlyingError:", a3, 0, a4);
}

+ (id)_hk_OAuth2_error:()HKOAuth2 userInfo:underlyingError:
{
  id v8 = a5;
  v9 = (void *)[a4 mutableCopy];
  v10 = v9;
  if (v9) {
    id v11 = v9;
  }
  else {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  v12 = v11;

  uint64_t v13 = *MEMORY[0x1E4F28568];
  v14 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F28568]];
  if (v14)
  {
    [v12 setObject:v14 forKeyedSubscript:v13];
  }
  else
  {
    v15 = objc_msgSend(a1, "_hk_OAuth2_defaultDescriptionForErrorCode:", a3);
    [v12 setObject:v15 forKeyedSubscript:v13];
  }
  uint64_t v16 = *MEMORY[0x1E4F28A50];
  uint64_t v17 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];
  v18 = (void *)v17;
  if (v17) {
    id v19 = (id)v17;
  }
  else {
    id v19 = v8;
  }
  [v12 setObject:v19 forKeyedSubscript:v16];

  v20 = [a1 errorWithDomain:@"com.apple.healthkit.private.oauth2" code:a3 userInfo:v12];

  return v20;
}

+ (__CFString)_hk_OAuth2_defaultDescriptionForErrorCode:()HKOAuth2
{
  if (a3 > 0xD) {
    return @"The request is missing a required parameter, includes an invalid parameter value, includes a parameter more than once, or is otherwise malformed.";
  }
  else {
    return off_1E58C7740[a3];
  }
}

+ (id)hk_OAuth2_errorFromErrorValue:()HKOAuth2
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isEqualToString:@"invalid_request"])
  {
    uint64_t v5 = 1;
  }
  else if ([v4 isEqualToString:@"invalid_client"])
  {
    uint64_t v5 = 2;
  }
  else if ([v4 isEqualToString:@"invalid_grant"])
  {
    uint64_t v5 = 3;
  }
  else if ([v4 isEqualToString:@"unauthorized_client"])
  {
    uint64_t v5 = 4;
  }
  else if ([v4 isEqualToString:@"access_denied"])
  {
    uint64_t v5 = 7;
  }
  else if ([v4 isEqualToString:@"unsupported_response_type"])
  {
    uint64_t v5 = 10;
  }
  else if ([v4 isEqualToString:@"unsupported_grant_type"])
  {
    uint64_t v5 = 5;
  }
  else if ([v4 isEqualToString:@"invalid_scope"])
  {
    uint64_t v5 = 6;
  }
  else if ([v4 isEqualToString:@"server_error"])
  {
    uint64_t v5 = 8;
  }
  else if ([v4 isEqualToString:@"temporarily_unavailable"])
  {
    uint64_t v5 = 9;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v9 = @"HKOAuth2ErrorResponseErrorNameErrorKey";
  v10[0] = v4;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v7 = objc_msgSend(a1, "_hk_OAuth2_error:userInfo:underlyingError:", v5, v6, 0);

  return v7;
}

- (__CFString)hk_OAuth2_errorCode
{
  if (objc_msgSend(a1, "hk_OAuth2_isOAuth2Error")
    && (uint64_t v2 = [a1 code], (unint64_t)(v2 - 1) <= 9))
  {
    return off_1E58C77B0[v2 - 1];
  }
  else
  {
    return 0;
  }
}

+ (id)hk_OAuth2_errorForRequest:()HKOAuth2 response:data:
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = objc_msgSend(a1, "_hk_OAuth2_rawErrorForRequest:response:data:", a3, v8, a5);
  if (v9)
  {
    v14 = @"HKOAuth2ErrorHTTPStatusCodeErrorKey";
    v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v8, "statusCode"));
    v15[0] = v10;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];

    v12 = objc_msgSend(v9, "_hk_OAuth2_errorByAddingItemsToUserInfo:", v11);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)_hk_OAuth2_rawErrorForRequest:()HKOAuth2 response:data:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 statusCode];
  switch(v11)
  {
    case 400:
      uint64_t v12 = objc_msgSend(a1, "_hk_OAuth2_errorForBadRequestStatusWithResponse:data:", v9, v10);
      goto LABEL_7;
    case 401:
      uint64_t v12 = objc_msgSend(a1, "_hk_OAuth2_errorForUnauthorizedStatusWithRequest:response:", v8, v9);
      goto LABEL_7;
    case 403:
      uint64_t v12 = objc_msgSend(a1, "hk_OAuth2_error:", 7);
LABEL_7:
      uint64_t v13 = (void *)v12;
      goto LABEL_9;
  }
  uint64_t v13 = 0;
LABEL_9:

  return v13;
}

+ (id)_hk_OAuth2_errorForUnauthorizedStatusWithRequest:()HKOAuth2 response:
{
  v6 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  id v10 = [v8 allHTTPHeaderFields];

  uint64_t v11 = [v10 objectForKeyedSubscript:@"Authorization"];

  uint64_t v12 = [v7 allHeaderFields];

  uint64_t v13 = [v12 objectForKeyedSubscript:@"WWW-Authenticate"];

  int v14 = [v11 hasPrefix:@"Bearer "];
  uint64_t v15 = 11;
  if (v14 && v13)
  {
    [v9 setObject:v13 forKeyedSubscript:@"HKOAuth2ErrorBearerAuthenticateResponseErrorKey"];
    uint64_t v15 = 12;
  }
  uint64_t v16 = objc_msgSend(a1, "_hk_OAuth2_error:userInfo:underlyingError:", v15, v9, 0);

  return v16;
}

+ (id)_hk_OAuth2_errorForBadRequestStatusWithResponse:()HKOAuth2 data:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_OAuth2_error:", 1);
  id v14 = 0;
  id v9 = objc_msgSend(a1, "_hk_OAuth2_errorFromResponseData:defaultError:parseError:", v7, v8, &v14);
  id v10 = v14;
  if (v10)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR)) {
      +[NSError(HKOAuth2) _hk_OAuth2_errorForBadRequestStatusWithResponse:data:]();
    }
  }
  if (v9) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = v8;
  }
  id v12 = v11;

  return v12;
}

+ (id)_hk_OAuth2_errorFromResponseData:()HKOAuth2 defaultError:parseError:
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    id v10 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v8 options:0 error:a5];
    if (v10)
    {
      uint64_t v11 = objc_opt_class();
      id v12 = HKSafeObject(v10, v11, @"responseObject", a5);
      uint64_t v13 = v12;
      if (v12)
      {
        id v14 = objc_msgSend(v12, "hk_safeStringForKeyPath:error:", @"error", a5);
        id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v16 = [v13 objectForKeyedSubscript:@"error_description"];
        if (v16)
        {
          uint64_t v17 = objc_opt_class();
          id v25 = 0;
          v18 = HKSafeObject(v16, v17, @"errorDescription", (uint64_t)&v25);
          id v19 = v25;
          if (v19)
          {
            _HKInitializeLogging();
            uint64_t v24 = HKLogDefault;
            if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR)) {
              +[NSError(HKOAuth2) _hk_OAuth2_errorFromResponseData:defaultError:parseError:]();
            }
          }
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, @"HKOAuth2ErrorResponseErrorDescriptionErrorKey", v24);
        }
        if (v14)
        {
          objc_msgSend(a1, "hk_OAuth2_errorFromErrorValue:", v14);
          id v20 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v20 = v9;
        }
        v22 = v20;
        v21 = objc_msgSend(v20, "_hk_OAuth2_errorByAddingItemsToUserInfo:", v15);
      }
      else
      {
        v21 = 0;
      }
    }
    else
    {
      v21 = 0;
    }
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (uint64_t)hk_OAuth2_isOAuth2Error
{
  v1 = [a1 domain];
  uint64_t v2 = [v1 isEqualToString:@"com.apple.healthkit.private.oauth2"];

  return v2;
}

- (uint64_t)hk_OAuth2_isOAuth2ErrorWithCode:()HKOAuth2
{
  uint64_t result = objc_msgSend(a1, "hk_OAuth2_isOAuth2Error");
  if (result) {
    return [a1 code] == a3;
  }
  return result;
}

- (uint64_t)hk_OAuth2_isAccessDeniedError
{
  return objc_msgSend(a1, "hk_OAuth2_isOAuth2ErrorWithCode:", 7);
}

- (uint64_t)hk_OAuth2_isBearerAuthenticationError
{
  return objc_msgSend(a1, "hk_OAuth2_isOAuth2ErrorWithCode:", 12);
}

- (id)_hk_OAuth2_errorByAddingItemsToUserInfo:()HKOAuth2
{
  id v4 = a3;
  uint64_t v5 = [a1 userInfo];
  id v6 = (void *)[v5 mutableCopy];

  [v6 addEntriesFromDictionary:v4];
  id v7 = objc_alloc(MEMORY[0x1E4F28C58]);
  id v8 = [a1 domain];
  id v9 = objc_msgSend(v7, "initWithDomain:code:userInfo:", v8, objc_msgSend(a1, "code"), v6);

  return v9;
}

+ (void)_hk_OAuth2_errorForBadRequestStatusWithResponse:()HKOAuth2 data:.cold.1()
{
  OUTLINED_FUNCTION_0_19();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "OAuth2: Failed to parse response data %@ for response %@.");
}

+ (void)_hk_OAuth2_errorFromResponseData:()HKOAuth2 defaultError:parseError:.cold.1()
{
  OUTLINED_FUNCTION_0_19();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "OAuth2: Failed to parse error_description %@ for response data %@.");
}

@end