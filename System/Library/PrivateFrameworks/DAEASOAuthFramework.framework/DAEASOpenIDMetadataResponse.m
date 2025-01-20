@interface DAEASOpenIDMetadataResponse
- (DAEASOpenIDMetadataResponse)initWithData:(id)a3 urlResponse:(id)a4 error:(id)a5;
- (NSDictionary)data;
- (NSError)error;
- (NSString)authorizationURI;
- (NSString)errorMessage;
- (NSString)issuer;
- (NSString)jwksURI;
- (NSString)tokenRequestURI;
- (int64_t)statusCode;
@end

@implementation DAEASOpenIDMetadataResponse

- (DAEASOpenIDMetadataResponse)initWithData:(id)a3 urlResponse:(id)a4 error:(id)a5
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v51.receiver = self;
  v51.super_class = (Class)DAEASOpenIDMetadataResponse;
  v11 = [(DAEASOpenIDMetadataResponse *)&v51 init];
  v12 = v11;
  if (v11)
  {
    p_error = &v11->_error;
    objc_storeStrong((id *)&v11->_error, a5);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = DALoggingwithCategory();
      os_log_type_t v25 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
      if (os_log_type_enabled(v14, v25))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C076000, v14, v25, "DAEASOpenIDMetadataResponse response is not NSHTTPURLResponse. Game over.", buf, 2u);
      }
      goto LABEL_22;
    }
    v14 = v9;
    v12->_int64_t statusCode = [v14 statusCode];
    v15 = DALoggingwithCategory();
    uint64_t v16 = MEMORY[0x263F38F90];
    os_log_type_t v17 = *(unsigned char *)(MEMORY[0x263F38F90] + 6);
    if (os_log_type_enabled(v15, v17))
    {
      int64_t statusCode = v12->_statusCode;
      *(_DWORD *)buf = 134217984;
      v53 = statusCode;
      _os_log_impl(&dword_22C076000, v15, v17, "DAEASOpenIDMetadataResponse httpResponse status code %ld", buf, 0xCu);
    }

    if (*p_error)
    {
LABEL_22:

      goto LABEL_23;
    }
    id v50 = 0;
    v19 = [MEMORY[0x263F08900] JSONObjectWithData:v8 options:0 error:&v50];
    v20 = (NSError *)v50;
    if (v20)
    {
      v21 = *p_error;
      *p_error = v20;
      v22 = v20;

      v23 = DALoggingwithCategory();
      os_log_type_t v24 = *(unsigned char *)(v16 + 3);
      if (os_log_type_enabled(v23, v24))
      {
        *(_DWORD *)buf = 138412290;
        v53 = v22;
        _os_log_impl(&dword_22C076000, v23, v24, "DAEASOAuthTokenResponse response JSON data does not represent NSDictionary. Game over. %@", buf, 0xCu);
      }

      goto LABEL_21;
    }
    objc_storeStrong((id *)&v12->_data, v19);
    v26 = [(NSDictionary *)v12->_data objectForKeyedSubscript:@"error"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v28 = [(NSDictionary *)v12->_data objectForKeyedSubscript:@"error_code"];
      errorMessage = v12->_errorMessage;
      v12->_errorMessage = (NSString *)v28;

      v22 = DALoggingwithCategory();
      os_log_type_t v30 = *(unsigned char *)(v16 + 3);
      if (os_log_type_enabled(v22, v30))
      {
        v31 = v12->_errorMessage;
        *(_DWORD *)buf = 138412546;
        v53 = v31;
        __int16 v54 = 2112;
        v55 = (NSString *)v19;
        v32 = "DAEASOpenIDMetadataResponse received an error: %@ %@";
        v33 = v22;
        os_log_type_t v34 = v30;
        uint32_t v35 = 22;
LABEL_20:
        _os_log_impl(&dword_22C076000, v33, v34, v32, buf, v35);
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v36 = [(NSDictionary *)v12->_data objectForKeyedSubscript:@"token_endpoint"];
        tokenRequestURI = v12->_tokenRequestURI;
        v12->_tokenRequestURI = (NSString *)v36;

        uint64_t v38 = [(NSDictionary *)v12->_data objectForKeyedSubscript:@"authorization_endpoint"];
        authorizationURI = v12->_authorizationURI;
        v12->_authorizationURI = (NSString *)v38;

        uint64_t v40 = [(NSDictionary *)v12->_data objectForKeyedSubscript:@"jwks_uri"];
        jwksURI = v12->_jwksURI;
        v12->_jwksURI = (NSString *)v40;

        uint64_t v42 = [(NSDictionary *)v12->_data objectForKeyedSubscript:@"issuer"];
        issuer = v12->_issuer;
        v12->_issuer = (NSString *)v42;

        v22 = DALoggingwithCategory();
        if (os_log_type_enabled(v22, v17))
        {
          v44 = v12->_tokenRequestURI;
          v45 = v12->_authorizationURI;
          v46 = v12->_jwksURI;
          v47 = v12->_issuer;
          *(_DWORD *)buf = 138413058;
          v53 = v44;
          __int16 v54 = 2112;
          v55 = v45;
          __int16 v56 = 2112;
          v57 = v46;
          __int16 v58 = 2112;
          v59 = v47;
          v32 = "DAEASOpenIDMetadataResponse response token_endpoint: %@, authorization_endpoint: %@, jwks_uri: %@, issuer: %@";
          v33 = v22;
          os_log_type_t v34 = v17;
          uint32_t v35 = 42;
          goto LABEL_20;
        }
      }
      else
      {
        v22 = DALoggingwithCategory();
        os_log_type_t v48 = *(unsigned char *)(v16 + 3);
        if (os_log_type_enabled(v22, v48))
        {
          *(_WORD *)buf = 0;
          v32 = "DAEASOpenIDMetadataResponse response JSON data does not represent NSDictionary.";
          v33 = v22;
          os_log_type_t v34 = v48;
          uint32_t v35 = 2;
          goto LABEL_20;
        }
      }
    }
LABEL_21:

    goto LABEL_22;
  }
LABEL_23:

  return v12;
}

- (NSString)tokenRequestURI
{
  return self->_tokenRequestURI;
}

- (NSString)authorizationURI
{
  return self->_authorizationURI;
}

- (NSString)jwksURI
{
  return self->_jwksURI;
}

- (NSString)issuer
{
  return self->_issuer;
}

- (NSDictionary)data
{
  return self->_data;
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (NSError)error
{
  return self->_error;
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_issuer, 0);
  objc_storeStrong((id *)&self->_jwksURI, 0);
  objc_storeStrong((id *)&self->_authorizationURI, 0);
  objc_storeStrong((id *)&self->_tokenRequestURI, 0);
}

@end