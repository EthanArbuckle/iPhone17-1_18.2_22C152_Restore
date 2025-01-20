@interface CMSCloudExtensionConfiguration
+ (id)_configurationFromJWS:(id)a3 URL:(id)a4 parentNetworkActivity:(id)a5 keyID:(id)a6 publicKey:(id)a7 languageCode:(id)a8 error:(id *)a9;
+ (void)configurationFromURL:(id)a3 forSession:(id)a4 usingAuth:(id)a5 authProvider:(id)a6 parentNetworkActivity:(id)a7 keyID:(id)a8 publicKey:(id)a9 URLSessionConfiguration:(id)a10 languageCode:(id)a11 completion:(id)a12;
- (BOOL)isExpiringSoon;
- (CMSCloudExtensionConfiguration)init;
- (CMSCloudExtensionConfiguration)initWithDictionary:(id)a3 fromURL:(id)a4 parentNetworkActivity:(id)a5 languageCode:(id)a6;
- (CMSNetworkActivity)parentNetworkActivity;
- (NSDate)configExpiry;
- (NSDictionary)configDictionary;
- (NSDictionary)globalHeaders;
- (NSError)parsingError;
- (NSMutableDictionary)endpointConfigs;
- (NSString)languageCode;
- (NSString)version;
- (NSURL)baseURL;
- (NSURL)configUrl;
- (id)configForEndpoint:(id)a3;
- (id)description;
- (void)_configureEndpoint:(id)a3 withDictionary:(id)a4 headers:(id)a5;
- (void)setBaseURL:(id)a3;
- (void)setConfigDictionary:(id)a3;
- (void)setConfigExpiry:(id)a3;
- (void)setEndpointConfigs:(id)a3;
@end

@implementation CMSCloudExtensionConfiguration

- (id)description
{
  return (id)[NSString stringWithFormat:@"<CMSCloudExtensionConfiguration: baseURL:%@ globalHeaders:%@ endpointConfigs:%@>", self->_baseURL, self->_globalHeaders, self->_endpointConfigs];
}

+ (id)_configurationFromJWS:(id)a3 URL:(id)a4 parentNetworkActivity:(id)a5 keyID:(id)a6 publicKey:(id)a7 languageCode:(id)a8 error:(id *)a9
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a3;
  v20 = [[CMSJSONWebSignature alloc] initWithJWSCompactEncodedString:v19 keyID:v18 publicKey:v17];

  id v21 = [(CMSJSONWebSignature *)v20 verificationError];
  if (!v21)
  {
    v22 = (void *)MEMORY[0x263F08900];
    v23 = [(CMSJSONWebSignature *)v20 payload];
    id v27 = 0;
    v24 = [v22 JSONObjectWithData:v23 options:0 error:&v27];
    id v21 = v27;

    if (!v21)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v25 = [[CMSCloudExtensionConfiguration alloc] initWithDictionary:v24 fromURL:v14 parentNetworkActivity:v15 languageCode:v16];
        id v21 = [(CMSCloudExtensionConfiguration *)v25 parsingError];
        if (!v21)
        {

          goto LABEL_11;
        }
      }
      else
      {
        id v21 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.configuration" code:0 userInfo:0];
      }
    }
  }
  v25 = 0;
  if (a9 && v21)
  {
    id v21 = v21;
    v25 = 0;
    *a9 = v21;
  }
LABEL_11:

  return v25;
}

+ (void)configurationFromURL:(id)a3 forSession:(id)a4 usingAuth:(id)a5 authProvider:(id)a6 parentNetworkActivity:(id)a7 keyID:(id)a8 publicKey:(id)a9 URLSessionConfiguration:(id)a10 languageCode:(id)a11 completion:(id)a12
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v17 = a3;
  id v18 = a4;
  id v46 = a5;
  id v41 = a6;
  id v19 = a7;
  id v42 = a8;
  id v44 = a9;
  id v20 = a10;
  id v21 = a11;
  id v22 = a12;
  if (v20) {
    [MEMORY[0x263F08BF8] sessionWithConfiguration:v20];
  }
  else {
  v23 = [MEMORY[0x263F08BF8] sharedSession];
  }
  v24 = v18;
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x3032000000;
  v68 = __Block_byref_object_copy_;
  v69 = __Block_byref_object_dispose_;
  v70 = [[CMSNetworkActivity alloc] initWithLabel:3 parentActivity:v19];
  v25 = CMSCreateCloudExtensionHTTPRequest(v17, v46, 0, v18);
  [v25 setValue:@"application/json" forHTTPHeaderField:@"Content-type"];
  [v25 setValue:@"application/jose" forHTTPHeaderField:@"Accept"];
  [v25 setCachePolicy:3];
  v55[0] = MEMORY[0x263EF8330];
  v55[1] = 3221225472;
  v55[2] = __175__CMSCloudExtensionConfiguration_configurationFromURL_forSession_usingAuth_authProvider_parentNetworkActivity_keyID_publicKey_URLSessionConfiguration_languageCode_completion___block_invoke;
  v55[3] = &unk_264888028;
  id v40 = v22;
  id v63 = v40;
  v64 = &v65;
  id v26 = v17;
  id v56 = v26;
  id v38 = v19;
  id v57 = v38;
  id v39 = v42;
  id v58 = v39;
  id v43 = v44;
  id v59 = v43;
  id v27 = v21;
  id v60 = v27;
  id v45 = v20;
  id v61 = v45;
  id v28 = v23;
  id v62 = v28;
  v29 = (void *)MEMORY[0x230F3FCD0](v55);
  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = __175__CMSCloudExtensionConfiguration_configurationFromURL_forSession_usingAuth_authProvider_parentNetworkActivity_keyID_publicKey_URLSessionConfiguration_languageCode_completion___block_invoke_75;
  v47[3] = &unk_2648880C8;
  id v30 = v26;
  id v48 = v30;
  id v31 = v29;
  id v53 = v31;
  id v32 = v25;
  id v49 = v32;
  id v33 = v28;
  id v50 = v33;
  id v34 = v41;
  id v51 = v34;
  id v35 = v24;
  id v52 = v35;
  v54 = &v65;
  v36 = [v33 dataTaskWithRequest:v32 completionHandler:v47];
  v37 = _CMSILogingFacility();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v72 = "+[CMSCloudExtensionConfiguration configurationFromURL:forSession:usingAuth:authProvider:parentNetworkActivity:"
          "keyID:publicKey:URLSessionConfiguration:languageCode:completion:]";
    __int16 v73 = 2112;
    id v74 = v30;
    _os_log_impl(&dword_22B0FF000, v37, OS_LOG_TYPE_DEFAULT, "%s loading configuration from URL %@", buf, 0x16u);
  }

  [(id)v66[5] associateWithTask:v36];
  [v36 resume];

  _Block_object_dispose(&v65, 8);
}

void __175__CMSCloudExtensionConfiguration_configurationFromURL_forSession_usingAuth_authProvider_parentNetworkActivity_keyID_publicKey_URLSessionConfiguration_languageCode_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (!*(void *)(a1 + 88))
  {
    id v18 = v9;
LABEL_17:
    if (*(void *)(a1 + 72)) {
      [*(id *)(a1 + 80) invalidateAndCancel];
    }
    goto LABEL_19;
  }
  if ([v7 length])
  {
    v11 = (void *)[[NSString alloc] initWithData:v7 encoding:4];
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v14 = *(void *)(a1 + 48);
    uint64_t v15 = *(void *)(a1 + 56);
    uint64_t v16 = *(void *)(a1 + 64);
    id v31 = v10;
    id v17 = +[CMSCloudExtensionConfiguration _configurationFromJWS:v11 URL:v12 parentNetworkActivity:v13 keyID:v14 publicKey:v15 languageCode:v16 error:&v31];
    id v18 = v31;

    id v19 = _CMSILogingFacility();
    id v20 = v19;
    if (v17)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v21 = 2;
        _os_log_impl(&dword_22B0FF000, v20, OS_LOG_TYPE_DEFAULT, "Successfully created configuration from JWS encryption", buf, 2u);
      }
      else
      {
        uint64_t v21 = 2;
      }
    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        __175__CMSCloudExtensionConfiguration_configurationFromURL_forSession_usingAuth_authProvider_parentNetworkActivity_keyID_publicKey_URLSessionConfiguration_languageCode_completion___block_invoke_cold_2();
      }
      uint64_t v21 = 3;
    }

    [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) completeActivity:v21];
    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();

    goto LABEL_17;
  }
  id v22 = _CMSILogingFacility();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    __175__CMSCloudExtensionConfiguration_configurationFromURL_forSession_usingAuth_authProvider_parentNetworkActivity_keyID_publicKey_URLSessionConfiguration_languageCode_completion___block_invoke_cold_1(v22, v23, v24, v25, v26, v27, v28, v29);
  }

  if (!v10)
  {
    v10 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.configuration" code:0 userInfo:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
  [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) completeActivity:3];
  id v18 = v10;
LABEL_19:
}

void __175__CMSCloudExtensionConfiguration_configurationFromURL_forSession_usingAuth_authProvider_parentNetworkActivity_keyID_publicKey_URLSessionConfiguration_languageCode_completion___block_invoke_75(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = [v8 statusCode];
  if (a4 || v9 != 200)
  {
LABEL_28:
    [*(id *)(a1 + 40) setCachePolicy:0];
    id v38 = _CMSILogingFacility();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v39 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      id v63 = "+[CMSCloudExtensionConfiguration configurationFromURL:forSession:usingAuth:authProvider:parentNetworkActivit"
            "y:keyID:publicKey:URLSessionConfiguration:languageCode:completion:]_block_invoke";
      __int16 v64 = 2112;
      uint64_t v65 = v39;
      _os_log_impl(&dword_22B0FF000, v38, OS_LOG_TYPE_DEFAULT, "%s configuration from URL %@ no usable cached response - trying network", buf, 0x16u);
    }

    uint64_t v41 = *(void *)(a1 + 40);
    id v40 = *(void **)(a1 + 48);
    v54[0] = MEMORY[0x263EF8330];
    v54[1] = 3221225472;
    v54[2] = __175__CMSCloudExtensionConfiguration_configurationFromURL_forSession_usingAuth_authProvider_parentNetworkActivity_keyID_publicKey_URLSessionConfiguration_languageCode_completion___block_invoke_77;
    v54[3] = &unk_2648880A0;
    v55 = (char *)*(id *)(a1 + 56);
    id v56 = *(id *)(a1 + 32);
    id v42 = *(id *)(a1 + 64);
    uint64_t v43 = *(void *)(a1 + 80);
    id v57 = v42;
    uint64_t v61 = v43;
    id v58 = *(id *)(a1 + 40);
    id v59 = *(id *)(a1 + 48);
    id v60 = *(id *)(a1 + 72);
    id v44 = [v40 dataTaskWithRequest:v41 completionHandler:v54];
    [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) associateWithTask:v44];
    [v44 resume];

    uint64_t v16 = v55;
    goto LABEL_31;
  }
  id v10 = v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    uint64_t v16 = 0;
LABEL_25:
    v36 = _CMSILogingFacility();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v37 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      id v63 = "+[CMSCloudExtensionConfiguration configurationFromURL:forSession:usingAuth:authProvider:parentNetworkActivit"
            "y:keyID:publicKey:URLSessionConfiguration:languageCode:completion:]_block_invoke";
      __int16 v64 = 2112;
      uint64_t v65 = v37;
      __int16 v66 = 2112;
      uint64_t v67 = v16;
      _os_log_impl(&dword_22B0FF000, v36, OS_LOG_TYPE_DEFAULT, "%s cached configuration for URL %@ has expired -  expiration %@", buf, 0x20u);
    }

    goto LABEL_28;
  }
  id v11 = v10;
  uint64_t v12 = [v11 valueForHTTPHeaderField:@"Date"];
  if (v12)
  {
    uint64_t v13 = [v11 valueForHTTPHeaderField:@"Cache-Control"];
    if (v13)
    {
      uint64_t v14 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
      id v15 = [v13 componentsSeparatedByString:@","];
      uint64_t v16 = (char *)[v15 count];
      if (v16)
      {
        v47 = v13;
        uint64_t v48 = a1;
        id v49 = v12;
        id v50 = v11;
        id v51 = v8;
        id v52 = v7;
        char v53 = 0;
        id v17 = 0;
        double v18 = 0.0;
        id v19 = @"=";
        do
        {
          id v20 = objc_msgSend(v15, "objectAtIndex:", v17, v47);
          uint64_t v21 = [v20 stringByTrimmingCharactersInSet:v14];

          id v22 = [v21 componentsSeparatedByString:v19];
          if ([v22 count] == 2)
          {
            [v22 objectAtIndex:0];
            uint64_t v23 = v16;
            uint64_t v24 = v14;
            id v25 = v15;
            uint64_t v27 = v26 = v19;
            uint64_t v28 = [v22 objectAtIndex:0];
            uint64_t v29 = objc_msgSend(v27, "compare:options:range:", @"Max-Age", 9, 0, objc_msgSend(v28, "length"));

            id v19 = v26;
            id v15 = v25;
            uint64_t v14 = v24;
            uint64_t v16 = v23;
            if (!v29)
            {
              char v53 = 1;
              id v30 = [v22 objectAtIndex:1];
              [v30 doubleValue];
              double v18 = v31;
            }
          }

          ++v17;
        }
        while (v16 != v17);

        if ((v53 & 1) == 0)
        {
          uint64_t v16 = 0;
          id v8 = v51;
          id v7 = v52;
          uint64_t v12 = v49;
          id v11 = v50;
          uint64_t v13 = v47;
          a1 = v48;
LABEL_22:

          goto LABEL_23;
        }
        id v15 = objc_alloc_init(MEMORY[0x263F08790]);
        [v15 setDateFormat:@"EE, dd LLL yyyy HH:mm:ss zz"];
        id v32 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US"];
        [v15 setLocale:v32];

        uint64_t v12 = v49;
        id v33 = [v15 dateFromString:v49];
        uint64_t v14 = v33;
        id v8 = v51;
        id v7 = v52;
        id v11 = v50;
        a1 = v48;
        if (v33)
        {
          uint64_t v16 = [v33 dateByAddingTimeInterval:v18];
        }
        else
        {
          uint64_t v16 = 0;
        }
        uint64_t v13 = v47;
      }

      goto LABEL_22;
    }
    uint64_t v16 = 0;
    goto LABEL_22;
  }
  uint64_t v16 = 0;
LABEL_23:

  if (!v16) {
    goto LABEL_25;
  }
  id v34 = [MEMORY[0x263EFF910] now];
  id v35 = [v16 laterDate:v34];

  if (v35 != v16) {
    goto LABEL_25;
  }
  id v45 = _CMSILogingFacility();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v46 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    id v63 = "+[CMSCloudExtensionConfiguration configurationFromURL:forSession:usingAuth:authProvider:parentNetworkActivity:"
          "keyID:publicKey:URLSessionConfiguration:languageCode:completion:]_block_invoke";
    __int16 v64 = 2112;
    uint64_t v65 = v46;
    __int16 v66 = 2112;
    uint64_t v67 = v16;
    _os_log_impl(&dword_22B0FF000, v45, OS_LOG_TYPE_DEFAULT, "%s using cached configuration for URL %@: Expires %@", buf, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
LABEL_31:
}

void __175__CMSCloudExtensionConfiguration_configurationFromURL_forSession_usingAuth_authProvider_parentNetworkActivity_keyID_publicKey_URLSessionConfiguration_languageCode_completion___block_invoke_77(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  uint64_t v11 = [v10 statusCode];
  if (!v9 && (v11 & 0xFFFFFFFFFFFFFFFDLL) == 0x191 && *(void *)(a1 + 32))
  {
    uint64_t v12 = _CMSILogingFacility();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136315394;
      uint64_t v29 = "+[CMSCloudExtensionConfiguration configurationFromURL:forSession:usingAuth:authProvider:parentNetworkActivit"
            "y:keyID:publicKey:URLSessionConfiguration:languageCode:completion:]_block_invoke";
      __int16 v30 = 2112;
      uint64_t v31 = v13;
      _os_log_impl(&dword_22B0FF000, v12, OS_LOG_TYPE_DEFAULT, "%s configuration from URL %@ auth challenge - trying to renew credentials", buf, 0x16u);
    }

    uint64_t v14 = *(void **)(a1 + 32);
    id v15 = *(void **)(a1 + 48);
    uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __175__CMSCloudExtensionConfiguration_configurationFromURL_forSession_usingAuth_authProvider_parentNetworkActivity_keyID_publicKey_URLSessionConfiguration_languageCode_completion___block_invoke_78;
    v19[3] = &unk_264888078;
    id v20 = v15;
    id v21 = *(id *)(a1 + 56);
    id v22 = *(id *)(a1 + 64);
    id v17 = *(id *)(a1 + 72);
    uint64_t v18 = *(void *)(a1 + 80);
    id v26 = v17;
    uint64_t v27 = v18;
    id v23 = 0;
    id v24 = v7;
    id v25 = v10;
    [v14 authRenewalForSessionIdentifier:v20 parentNetworkActivity:v16 completion:v19];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

void __175__CMSCloudExtensionConfiguration_configurationFromURL_forSession_usingAuth_authProvider_parentNetworkActivity_keyID_publicKey_URLSessionConfiguration_languageCode_completion___block_invoke_78(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (!v8 || v9 || [*(id *)(a1 + 32) compare:v7])
  {
    uint64_t v11 = _CMSILogingFacility();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v19 = v10;
      if (!v10) {
        id v19 = *(void **)(a1 + 56);
      }
      *(_DWORD *)buf = 136315394;
      id v23 = "+[CMSCloudExtensionConfiguration configurationFromURL:forSession:usingAuth:authProvider:parentNetworkActivit"
            "y:keyID:publicKey:URLSessionConfiguration:languageCode:completion:]_block_invoke";
      __int16 v24 = 2112;
      id v25 = v19;
      _os_log_error_impl(&dword_22B0FF000, v11, OS_LOG_TYPE_ERROR, "%s failed to get new tokens: %@", buf, 0x16u);
    }

    uint64_t v12 = v10;
    if (!v10) {
      uint64_t v12 = *(void **)(a1 + 56);
    }
    (*(void (**)(void, void, void, void *))(*(void *)(a1 + 80) + 16))(*(void *)(a1 + 80), *(void *)(a1 + 64), *(void *)(a1 + 72), v12);
  }
  else
  {
    [*(id *)(a1 + 40) setValue:v8 forHTTPHeaderField:@"Authorization"];
    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v13 = *(void **)(a1 + 48);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __175__CMSCloudExtensionConfiguration_configurationFromURL_forSession_usingAuth_authProvider_parentNetworkActivity_keyID_publicKey_URLSessionConfiguration_languageCode_completion___block_invoke_2;
    v20[3] = &unk_264888050;
    id v21 = *(id *)(a1 + 80);
    id v15 = [v13 dataTaskWithRequest:v14 completionHandler:v20];
    uint64_t v16 = [[CMSNetworkActivity alloc] initWithRetry:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
    [(CMSNetworkActivity *)v16 associateWithTask:v15];
    [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) completeActivity:3];
    uint64_t v17 = *(void *)(*(void *)(a1 + 88) + 8);
    uint64_t v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    [v15 resume];
  }
}

uint64_t __175__CMSCloudExtensionConfiguration_configurationFromURL_forSession_usingAuth_authProvider_parentNetworkActivity_keyID_publicKey_URLSessionConfiguration_languageCode_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_configureEndpoint:(id)a3 withDictionary:(id)a4 headers:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = [v8 componentsSeparatedByString:@"/"];
  uint64_t v12 = [v11 lastObject];
  uint64_t v13 = [v10 cmsOptionalDictionaryForKey:v12];

  if (v13)
  {
    uint64_t v14 = [v13 objectForKeyedSubscript:@"url"];
    if (!v14)
    {
      id v15 = (void *)[v13 mutableCopy];
      [v15 setObject:v8 forKeyedSubscript:@"url"];
      uint64_t v16 = [v15 copy];

      uint64_t v13 = (void *)v16;
    }
    uint64_t v17 = _CMSILogingFacility();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[CMSCloudExtensionConfiguration _configureEndpoint:withDictionary:headers:]();
    }

    uint64_t v18 = (objc_class *)objc_opt_class();
    id v19 = [v11 objectAtIndexedSubscript:0];
    int v20 = [v19 isEqualToString:@"intent"];

    if (v20) {
      uint64_t v18 = (objc_class *)objc_opt_class();
    }
    if ([v8 isEqualToString:@"queues/contentProtectionKey"]) {
      uint64_t v18 = (objc_class *)objc_opt_class();
    }
    id v21 = [v18 alloc];
    id v22 = [(CMSCloudExtensionConfiguration *)self baseURL];
    id v23 = (void *)[v21 initWithDictionary:v13 endpoint:v8 baseURL:v22 groupHeaders:v9];

    if (v23) {
      [(NSMutableDictionary *)self->_endpointConfigs setObject:v23 forKey:v8];
    }
  }
}

- (CMSCloudExtensionConfiguration)init
{
  v3 = [NSURL URLWithString:&stru_26DE5AB78];
  v4 = [(CMSCloudExtensionConfiguration *)self initWithDictionary:MEMORY[0x263EFFA78] fromURL:v3 parentNetworkActivity:0 languageCode:0];

  return v4;
}

- (CMSCloudExtensionConfiguration)initWithDictionary:(id)a3 fromURL:(id)a4 parentNetworkActivity:(id)a5 languageCode:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v51.receiver = self;
  v51.super_class = (Class)CMSCloudExtensionConfiguration;
  id v15 = [(CMSCloudExtensionConfiguration *)&v51 init];
  uint64_t v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_configDictionary, a3);
    objc_storeStrong((id *)&v16->_configUrl, a4);
    uint64_t v17 = [v11 cmsOptionalStringForKey:@"version"];
    version = v16->_version;
    v16->_version = (NSString *)v17;

    objc_storeStrong((id *)&v16->_parentNetworkActivity, a5);
    objc_storeStrong((id *)&v16->_languageCode, a6);
    id v19 = [(NSString *)v16->_version componentsSeparatedByString:@"."];
    if ([v19 count])
    {
      int v20 = [v19 objectAtIndexedSubscript:0];
      uint64_t v21 = [v20 integerValue];

      if (v21 >= 2)
      {
        uint64_t v22 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.configuration" code:1 userInfo:0];
        parsingError = v16->_parsingError;
        v16->_parsingError = (NSError *)v22;

        __int16 v24 = v16;
LABEL_19:

        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v25 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.configuration" code:0 userInfo:0];
      uint64_t v26 = v16->_parsingError;
      v16->_parsingError = (NSError *)v25;
    }
    uint64_t v27 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:5];
    endpointConfigs = v16->_endpointConfigs;
    v16->_endpointConfigs = (NSMutableDictionary *)v27;

    uint64_t v29 = [v11 cmsOptionalURLForKey:@"url" relativeToURL:0];
    __int16 v30 = v29;
    if (v29)
    {
      uint64_t v31 = [v29 baseURL];

      if (!v31)
      {
        uint64_t v32 = [v11 cmsOptionalURLForKey:@"url" relativeToURL:v12];

        __int16 v30 = (void *)v32;
      }
      objc_storeStrong((id *)&v16->_baseURL, v30);
    }
    if (!v16->_baseURL)
    {
      uint64_t v33 = [v12 baseURL];
      baseURL = v16->_baseURL;
      v16->_baseURL = (NSURL *)v33;

      if (!v16->_baseURL)
      {
        uint64_t v45 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.configuration" code:2 userInfo:0];
        uint64_t v46 = v16->_parsingError;
        v16->_parsingError = (NSError *)v45;

        v47 = v16;
        goto LABEL_19;
      }
    }
    uint64_t v35 = objc_msgSend(v11, "cmsOptionalDictionaryForKey:", @"hdr", v14, v13);
    globalHeaders = v16->_globalHeaders;
    v16->_globalHeaders = (NSDictionary *)v35;

    uint64_t v37 = [v11 cmsOptionalDictionaryForKey:@"intent"];
    id v38 = _CMSILogingFacility();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
      -[CMSCloudExtensionConfiguration initWithDictionary:fromURL:parentNetworkActivity:languageCode:]();
    }

    uint64_t v39 = [v37 cmsOptionalDictionaryForKey:@"hdr"];
    [(CMSCloudExtensionConfiguration *)v16 _configureEndpoint:@"intent/playMedia" withDictionary:v37 headers:v39];
    [(CMSCloudExtensionConfiguration *)v16 _configureEndpoint:@"intent/addMedia" withDictionary:v37 headers:v39];
    [(CMSCloudExtensionConfiguration *)v16 _configureEndpoint:@"intent/updateMediaAffinity" withDictionary:v37 headers:v39];
    id v40 = [v11 cmsOptionalDictionaryForKey:@"media"];
    uint64_t v41 = [v40 cmsOptionalDictionaryForKey:@"queues"];
    id v42 = _CMSILogingFacility();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
      -[CMSCloudExtensionConfiguration initWithDictionary:fromURL:parentNetworkActivity:languageCode:]();
    }

    uint64_t v43 = [v41 cmsOptionalDictionaryForKey:@"hdr"];
    [(CMSCloudExtensionConfiguration *)v16 _configureEndpoint:@"queues/playMedia" withDictionary:v41 headers:v43];
    [(CMSCloudExtensionConfiguration *)v16 _configureEndpoint:@"queues/updateActivity" withDictionary:v41 headers:v43];
    [(CMSCloudExtensionConfiguration *)v16 _configureEndpoint:@"queues/contentProtectionKey" withDictionary:v41 headers:v43];
    [(CMSCloudExtensionConfiguration *)v16 _configureEndpoint:@"queues/contentPlaybackFailure" withDictionary:v41 headers:v43];

    id v14 = v49;
    id v13 = v50;
  }
  id v44 = v16;
LABEL_20:

  return v16;
}

- (id)configForEndpoint:(id)a3
{
  v4 = [(NSMutableDictionary *)self->_endpointConfigs objectForKey:a3];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 request];

    if (!v6)
    {
      id v7 = [v5 endpointURL];

      if (!v7) {
        goto LABEL_9;
      }
      id v8 = [v5 endpointURL];
      id v9 = CMSCreateCloudExtensionHTTPRequest(v8, 0, 4, 0);

      id v10 = [(CMSCloudExtensionConfiguration *)self languageCode];
      if (!v10)
      {
        id v10 = CMSCloudExtensionLanguageCode();
      }
      [v9 setValue:v10 forHTTPHeaderField:@"Accept-Language"];
      id v11 = [(CMSCloudExtensionConfiguration *)self baseURL];
      [v9 setMainDocumentURL:v11];

      [v9 setNetworkServiceType:6];
      [v9 setHTTPShouldUsePipelining:1];
      [v9 setHTTPShouldHandleCookies:1];
      id v12 = [(CMSCloudExtensionConfiguration *)self globalHeaders];
      applyHeaderOverrides(v12, v9);

      id v13 = [v5 groupHeaders];
      applyHeaderOverrides(v13, v9);

      id v14 = [v5 headers];
      applyHeaderOverrides(v14, v9);

      [v5 setRequest:v9];
    }
    id v7 = v5;
  }
  else
  {
    id v7 = 0;
  }
LABEL_9:

  return v7;
}

- (BOOL)isExpiringSoon
{
  configExpiry = self->_configExpiry;
  if (configExpiry)
  {
    v3 = [MEMORY[0x263EFF910] date];
    [(NSDate *)configExpiry timeIntervalSinceDate:v3];
    LOBYTE(configExpiry) = v4 > -1800.0;
  }
  return (char)configExpiry;
}

- (NSString)version
{
  return self->_version;
}

- (NSError)parsingError
{
  return self->_parsingError;
}

- (NSURL)configUrl
{
  return self->_configUrl;
}

- (NSDictionary)configDictionary
{
  return self->_configDictionary;
}

- (void)setConfigDictionary:(id)a3
{
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (NSMutableDictionary)endpointConfigs
{
  return self->_endpointConfigs;
}

- (void)setEndpointConfigs:(id)a3
{
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
}

- (NSDictionary)globalHeaders
{
  return self->_globalHeaders;
}

- (NSDate)configExpiry
{
  return self->_configExpiry;
}

- (void)setConfigExpiry:(id)a3
{
}

- (CMSNetworkActivity)parentNetworkActivity
{
  return self->_parentNetworkActivity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentNetworkActivity, 0);
  objc_storeStrong((id *)&self->_configExpiry, 0);
  objc_storeStrong((id *)&self->_globalHeaders, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_endpointConfigs, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_configDictionary, 0);
  objc_storeStrong((id *)&self->_configUrl, 0);
  objc_storeStrong((id *)&self->_parsingError, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

void __175__CMSCloudExtensionConfiguration_configurationFromURL_forSession_usingAuth_authProvider_parentNetworkActivity_keyID_publicKey_URLSessionConfiguration_languageCode_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22B0FF000, a1, a3, "%s no configuration data returned", a5, a6, a7, a8, 2u);
}

void __175__CMSCloudExtensionConfiguration_configurationFromURL_forSession_usingAuth_authProvider_parentNetworkActivity_keyID_publicKey_URLSessionConfiguration_languageCode_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22B0FF000, v0, v1, "Failed to create configuration from JWS encryption: %@", v2, v3, v4, v5, v6);
}

- (void)_configureEndpoint:withDictionary:headers:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_22B0FF000, v0, v1, "endpointDict: %@", v2, v3, v4, v5, v6);
}

- (void)initWithDictionary:fromURL:parentNetworkActivity:languageCode:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_22B0FF000, v0, v1, "queuesDict: %@", v2, v3, v4, v5, v6);
}

- (void)initWithDictionary:fromURL:parentNetworkActivity:languageCode:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_22B0FF000, v0, v1, "intentDict: %@", v2, v3, v4, v5, v6);
}

@end