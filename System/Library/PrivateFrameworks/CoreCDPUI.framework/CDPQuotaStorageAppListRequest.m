@interface CDPQuotaStorageAppListRequest
- (ACAccount)account;
- (BOOL)isUrlAvailable;
- (CDPQuotaStorageAppListRequest)initWithAccount:(id)a3 appList:(unint64_t)a4 contentSpecifiesE2EE:(BOOL)a5;
- (id)_urlStringFormatFromBag;
- (id)urlRequest;
- (id)urlString;
- (void)_setAppListHeaderForRequest:(id)a3;
- (void)_setContentTypeHeaderForRequest:(id)a3;
- (void)urlRequest;
@end

@implementation CDPQuotaStorageAppListRequest

- (CDPQuotaStorageAppListRequest)initWithAccount:(id)a3 appList:(unint64_t)a4 contentSpecifiesE2EE:(BOOL)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CDPQuotaStorageAppListRequest;
  v10 = [(CDPQuotaStorageAppListRequest *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_account, a3);
    v11->_appList = a4;
    v11->_contentSpecifiesE2EE = a5;
  }

  return v11;
}

- (id)_urlStringFormatFromBag
{
  urlStringFormat = self->_urlStringFormat;
  if (!urlStringFormat)
  {
    v4 = [(ACAccount *)self->_account propertiesForDataclass:@"com.apple.Dataclass.Quota"];
    v5 = [v4 objectForKey:@"storageAppListURL"];
    v6 = self->_urlStringFormat;
    self->_urlStringFormat = v5;

    urlStringFormat = self->_urlStringFormat;
  }

  return urlStringFormat;
}

- (BOOL)isUrlAvailable
{
  v3 = [(ACAccount *)self->_account aa_personID];
  if (v3)
  {
    v4 = [(CDPQuotaStorageAppListRequest *)self _urlStringFormatFromBag];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)urlString
{
  if ([(CDPQuotaStorageAppListRequest *)self isUrlAvailable])
  {
    v3 = [(CDPQuotaStorageAppListRequest *)self _urlStringFormatFromBag];
    uint64_t v4 = *MEMORY[0x263F25B78];
    BOOL v5 = [(ACAccount *)self->_account aa_personID];
    v6 = [v3 stringByReplacingOccurrencesOfString:v4 withString:v5];

    uint64_t v7 = *MEMORY[0x263F25B90];
    v8 = [MEMORY[0x263F25820] udid];
    id v9 = [v6 stringByReplacingOccurrencesOfString:v7 withString:v8];

    v10 = [MEMORY[0x263F08708] URLQueryAllowedCharacterSet];
    v11 = [v9 stringByAddingPercentEncodingWithAllowedCharacters:v10];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)urlRequest
{
  v15[1] = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)CDPQuotaStorageAppListRequest;
  v3 = [(AARequest *)&v14 urlRequest];
  uint64_t v4 = (void *)[v3 mutableCopy];

  [v4 setHTTPMethod:@"GET"];
  objc_msgSend(v4, "ak_addAnisetteHeaders");
  objc_msgSend(v4, "ak_addClientInfoHeader");
  objc_msgSend(v4, "ak_addDeviceUDIDHeader");
  objc_msgSend(v4, "ak_addClientTimeHeader");
  objc_msgSend(v4, "ak_addTimeZoneHeaders");
  objc_msgSend(v4, "ak_addLocaleHeader");
  objc_msgSend(v4, "ak_addCountryHeader");
  objc_msgSend(v4, "ak_addInternalBuildHeader");
  BOOL v5 = [MEMORY[0x263F25820] userAgentHeader];
  [v4 setValue:v5 forHTTPHeaderField:@"User-Agent"];

  v6 = [MEMORY[0x263F25820] udid];
  [v4 setValue:v6 forHTTPHeaderField:@"X-Client-UDID"];

  [v4 setValue:@"application/x-buddyml" forHTTPHeaderField:@"Accept"];
  [v4 setValue:@"application/x-plist" forHTTPHeaderField:@"Content-Type"];
  uint64_t v7 = (void *)MEMORY[0x263EFF960];
  v8 = [MEMORY[0x263EFF960] _deviceLanguage];
  v15[0] = v8;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  v10 = [v7 minimizedLanguagesFromLanguages:v9];
  v11 = [v10 componentsJoinedByString:@","];

  v12 = _CDPLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    [(CDPQuotaStorageAppListRequest *)(uint64_t)v11 urlRequest];
  }

  [v4 setValue:v11 forHTTPHeaderField:@"Accept-Language"];
  [(CDPQuotaStorageAppListRequest *)self _setContentTypeHeaderForRequest:v4];
  [(CDPQuotaStorageAppListRequest *)self _setAppListHeaderForRequest:v4];
  objc_msgSend(v4, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", self->_account, 0);

  return v4;
}

- (void)_setContentTypeHeaderForRequest:(id)a3
{
  BOOL contentSpecifiesE2EE = self->_contentSpecifiesE2EE;
  id v4 = a3;
  BOOL v5 = _CDPLogSystem();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (contentSpecifiesE2EE)
  {
    if (v6) {
      -[CDPQuotaStorageAppListRequest _setContentTypeHeaderForRequest:]();
    }
    uint64_t v7 = @"cdp";
  }
  else
  {
    if (v6) {
      -[CDPQuotaStorageAppListRequest _setContentTypeHeaderForRequest:]();
    }
    uint64_t v7 = @"pcs";
  }

  [v4 setValue:v7 forHTTPHeaderField:@"x-apple-storageapplist-content-type"];
}

- (void)_setAppListHeaderForRequest:(id)a3
{
  id v4 = a3;
  unint64_t appList = self->_appList;
  switch(appList)
  {
    case 0uLL:
      uint64_t v7 = _CDPLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[CDPQuotaStorageAppListRequest _setAppListHeaderForRequest:]();
      }

      uint64_t v8 = *MEMORY[0x263F290B8];
      id v9 = @"x-apple-storageapplist-nadp";
      goto LABEL_13;
    case 1uLL:
      v10 = _CDPLogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[CDPQuotaStorageAppListRequest _setAppListHeaderForRequest:]();
      }

      uint64_t v8 = *MEMORY[0x263F290B8];
      id v9 = @"x-apple-storageapplist-sray";
LABEL_13:
      [v4 setValue:v8 forHTTPHeaderField:v9];
      break;
    case 2uLL:
      BOOL v6 = _CDPLogSystem();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        -[CDPQuotaStorageAppListRequest _setAppListHeaderForRequest:]();
      }

      break;
  }
}

- (ACAccount)account
{
  return self->_account;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);

  objc_storeStrong((id *)&self->_urlStringFormat, 0);
}

- (void)urlRequest
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2187CF000, a2, OS_LOG_TYPE_DEBUG, "CDPQuotaStorageAppListRequest: setting accepted languages: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_setContentTypeHeaderForRequest:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2187CF000, v0, v1, "Setting the content type for the PCS variant", v2, v3, v4, v5, v6);
}

- (void)_setContentTypeHeaderForRequest:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2187CF000, v0, v1, "Setting the content type for the CDP variant", v2, v3, v4, v5, v6);
}

- (void)_setAppListHeaderForRequest:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2187CF000, v0, v1, "Setting up quota screen with all apps list...", v2, v3, v4, v5, v6);
}

- (void)_setAppListHeaderForRequest:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2187CF000, v0, v1, "Setting up quota screen with Non ADP list...", v2, v3, v4, v5, v6);
}

- (void)_setAppListHeaderForRequest:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2187CF000, v0, v1, "Setting up quota screen with Stringray list...", v2, v3, v4, v5, v6);
}

@end