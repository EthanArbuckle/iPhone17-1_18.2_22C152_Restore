@interface ESExchangeEmptyBearerResponse
- (ESExchangeEmptyBearerResponse)initWithData:(id)a3 urlResponse:(id)a4 error:(id)a5;
- (NSError)error;
- (NSString)authURI;
- (int64_t)statusCode;
@end

@implementation ESExchangeEmptyBearerResponse

- (ESExchangeEmptyBearerResponse)initWithData:(id)a3 urlResponse:(id)a4 error:(id)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  v37.receiver = self;
  v37.super_class = (Class)ESExchangeEmptyBearerResponse;
  v9 = [(ESExchangeEmptyBearerResponse *)&v37 init];
  v10 = v9;
  if (v9)
  {
    p_error = &v9->_error;
    objc_storeStrong((id *)&v9->_error, a5);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = v7;
      v10->_int64_t statusCode = [v12 statusCode];
      v13 = DALoggingwithCategory();
      os_log_type_t v14 = *(unsigned char *)(MEMORY[0x263F38F90] + 6);
      if (os_log_type_enabled(v13, v14))
      {
        int64_t statusCode = v10->_statusCode;
        *(_DWORD *)buf = 134217984;
        int64_t v40 = statusCode;
        _os_log_impl(&dword_22C076000, v13, v14, "ESExchangeEmptyBearerResponse httpResponse status code %ld", buf, 0xCu);
      }

      if (!*p_error)
      {
        id v31 = v8;
        id v32 = v7;
        [v12 valueForHTTPHeaderField:@"Www-Authenticate"];
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        v30 = long long v36 = 0u;
        v16 = [v30 componentsSeparatedByString:@","];
        uint64_t v17 = [v16 countByEnumeratingWithState:&v33 objects:v38 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v34;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v34 != v19) {
                objc_enumerationMutation(v16);
              }
              v21 = *(void **)(*((void *)&v33 + 1) + 8 * i);
              v22 = [MEMORY[0x263F08708] whitespaceCharacterSet];
              v23 = [v21 stringByTrimmingCharactersInSet:v22];

              if ([v23 hasPrefix:@"authorization_uri"])
              {
                v24 = [v21 componentsSeparatedByString:@"="];
                v25 = [v24 objectAtIndexedSubscript:1];

                uint64_t v26 = [v25 stringByReplacingOccurrencesOfString:@"\"" withString:&stru_26DF7DF88];
                authURI = v10->_authURI;
                v10->_authURI = (NSString *)v26;
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v33 objects:v38 count:16];
          }
          while (v18);
        }

        id v8 = v31;
        id v7 = v32;
      }
    }
    else
    {
      v12 = DALoggingwithCategory();
      os_log_type_t v28 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
      if (os_log_type_enabled(v12, v28))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C076000, v12, v28, "ESExchangeEmptyBearerResponse response is not an NSHTTPURLResponse.", buf, 2u);
      }
    }
  }
  return v10;
}

- (NSString)authURI
{
  return self->_authURI;
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_authURI, 0);
}

@end