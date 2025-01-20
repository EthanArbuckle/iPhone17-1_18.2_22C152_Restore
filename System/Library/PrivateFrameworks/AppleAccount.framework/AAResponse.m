@interface AAResponse
- (AAResponse)initWithHTTPResponse:(id)a3 data:(id)a4;
- (AAResponse)initWithHTTPResponse:(id)a3 data:(id)a4 bodyIsPlist:(BOOL)a5;
- (AAResponse)initWithHTTPResponse:(id)a3 data:(id)a4 mediaType:(id)a5;
- (NSData)data;
- (NSDictionary)responseDictionary;
- (NSError)error;
- (NSHTTPURLResponse)httpResponse;
- (NSNumber)maxAge;
- (NSString)mediaType;
- (NSString)protocolVersion;
- (id)_deviceSpecificLocalizedString:(id)a3;
- (id)_stringWithDescriptionForResponseError:(id)a3;
- (int64_t)statusCode;
- (void)_parseResponse:(id)a3 ofType:(id)a4;
- (void)setError:(id)a3;
@end

@implementation AAResponse

- (void)_parseResponse:(id)a3 ofType:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    id v8 = [NSString alloc];
    id v9 = v6;
    v10 = objc_msgSend(v8, "initWithBytes:length:encoding:", objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"), 4);
    v11 = _AALogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v10;
      _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, "Response Body: %@", buf, 0xCu);
    }
  }
  objc_storeStrong((id *)&self->_mediaType, a4);
  v12 = [MEMORY[0x1E4F47000] ofType:v7];
  id v22 = 0;
  v13 = [v12 dictionaryFromObject:v6 error:&v22];
  id v14 = v22;
  responseDictionary = self->_responseDictionary;
  self->_responseDictionary = v13;

  if (v14)
  {
    v16 = _AALogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = [v14 localizedDescription];
      *(_DWORD *)buf = 138412546;
      id v24 = v7;
      __int16 v25 = 2112;
      v26 = v17;
      _os_log_impl(&dword_1A11D8000, v16, OS_LOG_TYPE_DEFAULT, "Unable to parse response of type: '%@', error: %@", buf, 0x16u);
    }
    v18 = [MEMORY[0x1E4F1CA60] dictionary];
    v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v20 = [v19 localizedStringForKey:@"COMMUNICATIONS_ERROR" value:&stru_1EF456870 table:@"Localizable"];
    [v18 setObject:v20 forKey:*MEMORY[0x1E4F28568]];

    v21 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"com.apple.appleaccount", objc_msgSend(v14, "code"), v18);
    [(AAResponse *)self setError:v21];
  }
}

- (AAResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  return [(AAResponse *)self initWithHTTPResponse:a3 data:a4 bodyIsPlist:1];
}

- (AAResponse)initWithHTTPResponse:(id)a3 data:(id)a4 bodyIsPlist:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = [v8 MIMEType];
  v11 = [MEMORY[0x1E4F47000] ofType:v10];

  if (!v11)
  {
    v12 = @"application/json";
    if (v5) {
      v12 = @"application/x-plist";
    }
    v13 = v12;

    v10 = v13;
  }
  id v14 = [(AAResponse *)self initWithHTTPResponse:v8 data:v9 mediaType:v10];

  return v14;
}

- (AAResponse)initWithHTTPResponse:(id)a3 data:(id)a4 mediaType:(id)a5
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v59.receiver = self;
  v59.super_class = (Class)AAResponse;
  v12 = [(AAResponse *)&v59 init];
  v13 = v12;
  if (v12)
  {
    if (v9)
    {
      objc_storeStrong((id *)&v12->_httpResponse, a3);
      v13->_statusCode = [v9 statusCode];
      objc_storeStrong((id *)&v13->_data, a4);
    }
    id v14 = _AALogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [(NSHTTPURLResponse *)v13->_httpResponse statusCode];
      *(_DWORD *)buf = 134217984;
      uint64_t v61 = v15;
      _os_log_impl(&dword_1A11D8000, v14, OS_LOG_TYPE_DEFAULT, "Response code: %ld", buf, 0xCu);
    }

    v16 = _AALogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = [(NSHTTPURLResponse *)v13->_httpResponse allHeaderFields];
      *(_DWORD *)buf = 138412290;
      uint64_t v61 = (uint64_t)v17;
      _os_log_impl(&dword_1A11D8000, v16, OS_LOG_TYPE_DEFAULT, "Response headers: %@", buf, 0xCu);
    }
    [(AAResponse *)v13 _parseResponse:v10 ofType:v11];
    if ([(NSHTTPURLResponse *)v13->_httpResponse statusCode] == 200)
    {
      v18 = [(NSHTTPURLResponse *)v13->_httpResponse allHeaderFields];
      v19 = [v18 objectForKeyedSubscript:@"Cache-control"];

      if (!v19) {
        goto LABEL_61;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_61;
      }
      v20 = [v19 componentsSeparatedByString:@"="];
      if ([v20 count] != 2) {
        goto LABEL_60;
      }
      v21 = [v20 objectAtIndexedSubscript:0];
      int v22 = [v21 isEqual:@"max-age"];

      if (!v22
        || ([v20 objectAtIndexedSubscript:1],
            v23 = objc_claimAutoreleasedReturnValue(),
            uint64_t v24 = [v23 integerValue],
            v23,
            v24 < 1))
      {
LABEL_60:

LABEL_61:
        goto LABEL_62;
      }
      uint64_t v25 = [NSNumber numberWithInteger:v24];
      maxAge = v13->_maxAge;
      v13->_maxAge = (NSNumber *)v25;
LABEL_59:

      goto LABEL_60;
    }
    v20 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v27 = [(NSHTTPURLResponse *)v13->_httpResponse statusCode];
    switch(v27)
    {
      case 401:
        v28 = _AALogSystem();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A11D8000, v28, OS_LOG_TYPE_DEFAULT, "Password is bad.", buf, 2u);
        }

        v29 = [(AAResponse *)v13 responseDictionary];
        v30 = [v29 objectForKey:@"message"];

        if (v30) {
          goto LABEL_39;
        }
        v31 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v32 = v31;
        v33 = @"INVALID_PASSWORD";
        goto LABEL_41;
      case 402:
      case 406:
      case 407:
      case 408:
        goto LABEL_25;
      case 403:
        v39 = _AALogSystem();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A11D8000, v39, OS_LOG_TYPE_DEFAULT, "Forbidden.", buf, 2u);
        }

        v40 = [(AAResponse *)v13 responseDictionary];
        v32 = [v40 objectForKey:@"localizedError"];

        if (v32) {
          [v20 setObject:v32 forKey:@"localizedError"];
        }
        v41 = [(AAResponse *)v13 responseDictionary];
        v42 = [v41 objectForKey:@"message"];

        if (v42) {
          goto LABEL_48;
        }
        v43 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        uint64_t v44 = [v43 localizedStringForKey:v32 value:&stru_1EF456870 table:@"Localizable"];
        goto LABEL_49;
      case 404:
        v37 = _AALogSystem();
        if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_38;
        }
        *(_WORD *)buf = 0;
        v38 = "Not found.";
        goto LABEL_37;
      case 405:
        v37 = _AALogSystem();
        if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_38;
        }
        *(_WORD *)buf = 0;
        v38 = "Method not allowed.";
        goto LABEL_37;
      case 409:
        v48 = _AALogSystem();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A11D8000, v48, OS_LOG_TYPE_DEFAULT, "Forbidden. (409)", buf, 2u);
        }

        v49 = [(AAResponse *)v13 responseDictionary];
        v32 = [v49 objectForKey:@"localizedError"];

        if (v32) {
          [v20 setObject:v32 forKey:@"localizedError"];
        }
        v50 = [(AAResponse *)v13 responseDictionary];
        v51 = [v50 objectForKey:@"message"];

        if (!v51)
        {
          uint64_t v47 = [(AAResponse *)v13 _stringWithDescriptionForResponseError:v32];
          goto LABEL_42;
        }
LABEL_48:
        v43 = [(AAResponse *)v13 responseDictionary];
        uint64_t v44 = [v43 objectForKey:@"message"];
LABEL_49:
        v19 = (void *)v44;

        goto LABEL_50;
      default:
        if (v27 == 503)
        {
          v34 = _AALogSystem();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A11D8000, v34, OS_LOG_TYPE_DEFAULT, "Scheduled maintenance.", buf, 2u);
          }

          v35 = [(AAResponse *)v13 responseDictionary];
          v36 = [v35 objectForKey:@"message"];

          if (!v36)
          {
            v31 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
            v32 = v31;
            v33 = @"SCHEDULED_MAINTENENCE";
            goto LABEL_41;
          }
        }
        else
        {
LABEL_25:
          v37 = _AALogSystem();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v38 = "Other error.";
LABEL_37:
            _os_log_impl(&dword_1A11D8000, v37, OS_LOG_TYPE_DEFAULT, v38, buf, 2u);
          }
LABEL_38:

          v45 = [(AAResponse *)v13 responseDictionary];
          v46 = [v45 objectForKey:@"message"];

          if (!v46)
          {
            v31 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
            v32 = v31;
            v33 = @"COMMUNICATIONS_ERROR";
LABEL_41:
            uint64_t v47 = [v31 localizedStringForKey:v33 value:&stru_1EF456870 table:@"Localizable"];
LABEL_42:
            v19 = (void *)v47;
LABEL_50:

            if (v19) {
              [v20 setObject:v19 forKey:*MEMORY[0x1E4F28568]];
            }
            v52 = [(AAResponse *)v13 responseDictionary];

            if (v52)
            {
              v53 = [(AAResponse *)v13 responseDictionary];
              [v20 setObject:v53 forKey:@"responseDictionary"];
            }
            v54 = [(AAResponse *)v13 error];

            if (v54) {
              goto LABEL_60;
            }
            uint64_t v55 = [(NSHTTPURLResponse *)v13->_httpResponse statusCode];
            v56 = (void *)MEMORY[0x1E4F28C58];
            if (v55 == 409) {
              uint64_t v57 = 403;
            }
            else {
              uint64_t v57 = [(NSHTTPURLResponse *)v13->_httpResponse statusCode];
            }
            maxAge = [v56 errorWithDomain:@"com.apple.appleaccount" code:v57 userInfo:v20];
            [(AAResponse *)v13 setError:maxAge];
            goto LABEL_59;
          }
        }
LABEL_39:
        v32 = [(AAResponse *)v13 responseDictionary];
        uint64_t v47 = [v32 objectForKey:@"message"];
        goto LABEL_42;
    }
  }
LABEL_62:

  return v13;
}

- (id)_stringWithDescriptionForResponseError:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (!v4)
  {
    id v8 = 0;
    goto LABEL_9;
  }
  id v6 = @"MOBILEME_CREATE_UNAVAILABLE";
  if ([v4 isEqualToString:@"MOBILEME_CREATE_UNAVAILABLE"]) {
    goto LABEL_7;
  }
  if ([v5 isEqualToString:@"MOBILEME_UNSUPPORTED_DEVICE_REBRAND"])
  {
    uint64_t v7 = AADeviceLocStringForKey(@"MOBILEME_UNSUPPORTED_DEVICE_REBRAND");
LABEL_8:
    id v8 = (void *)v7;
    goto LABEL_9;
  }
  id v6 = @"MOBILEME_INVALID_SIGNATURE";
  if ([v5 isEqualToString:@"MOBILEME_INVALID_SIGNATURE"])
  {
LABEL_7:
    uint64_t v7 = [(AAResponse *)self _deviceSpecificLocalizedString:v6];
    goto LABEL_8;
  }
  id v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v8 = [v10 localizedStringForKey:v5 value:&stru_1EF456870 table:@"Localizable"];

LABEL_9:

  return v8;
}

- (id)_deviceSpecificLocalizedString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = MGCopyAnswer();
  if (v4) {
    BOOL v5 = (__CFString *)v4;
  }
  else {
    BOOL v5 = @"iPhone";
  }
  id v6 = [(__CFString *)v5 uppercaseString];
  uint64_t v7 = [v6 stringByReplacingOccurrencesOfString:@" " withString:@"_"];

  id v8 = [NSString stringWithFormat:@"%@_%@", v3, v7];

  id v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:v8 value:&stru_1EF456870 table:@"Localizable"];

  return v10;
}

- (NSString)protocolVersion
{
  return (NSString *)[(NSDictionary *)self->_responseDictionary objectForKey:@"protocolVersion"];
}

- (NSDictionary)responseDictionary
{
  return self->_responseDictionary;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (NSData)data
{
  return self->_data;
}

- (NSHTTPURLResponse)httpResponse
{
  return self->_httpResponse;
}

- (NSNumber)maxAge
{
  return self->_maxAge;
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaType, 0);
  objc_storeStrong((id *)&self->_maxAge, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_httpResponse, 0);

  objc_storeStrong((id *)&self->_responseDictionary, 0);
}

@end