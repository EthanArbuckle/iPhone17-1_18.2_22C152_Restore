@interface AARequest
+ (Class)responseClass;
+ (id)protocolVersion;
+ (id)redactedHeadersFromHTTPHeaders:(id)a3;
- (AARequest)initWithURLString:(id)a3;
- (BOOL)flushCache;
- (NSDictionary)customHeaders;
- (NSURLRequest)urlRequest;
- (id)bodyDictionary;
- (id)redactedBodyStringWithPropertyList:(id)a3;
- (id)urlCredential;
- (id)urlString;
- (void)_handleDataTaskCompletionWithData:(id)a3 response:(id)a4 error:(id)a5;
- (void)dealloc;
- (void)performPinnedOnlyRequestWithHandler:(id)a3;
- (void)performPinnedRequestWithHandler:(id)a3;
- (void)performRequestForDevice:(id)a3 anisetteDataProvider:(id)a4 withHandler:(id)a5;
- (void)performRequestForDevice:(id)a3 withHandler:(id)a4;
- (void)performRequestWithHandler:(id)a3;
- (void)performRequestWithSession:(id)a3 withHandler:(id)a4;
- (void)performSignedRequestWithHandler:(id)a3;
- (void)setCookieStorage:(OpaqueCFHTTPCookieStorage *)a3;
- (void)setCustomHeaders:(id)a3;
- (void)setDeviceProvisioningMachineId:(id)a3;
- (void)setDeviceProvisioningOneTimePassword:(id)a3;
- (void)setFlushCache:(BOOL)a3;
@end

@implementation AARequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

+ (id)protocolVersion
{
  return @"1.0";
}

- (AARequest)initWithURLString:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AARequest;
  v6 = [(AARequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_initialURLString, a3);
  }

  return v7;
}

- (void)setCookieStorage:(OpaqueCFHTTPCookieStorage *)a3
{
  cookieStorage = self->_cookieStorage;
  if (cookieStorage != a3)
  {
    if (cookieStorage) {
      CFRelease(cookieStorage);
    }
    self->_cookieStorage = a3;
    if (a3)
    {
      CFRetain(a3);
    }
  }
}

- (void)setDeviceProvisioningOneTimePassword:(id)a3
{
}

- (void)setDeviceProvisioningMachineId:(id)a3
{
}

- (id)urlString
{
  return self->_initialURLString;
}

- (NSURLRequest)urlRequest
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(AARequest *)self urlString];
  if (v3) {
    v4 = (__CFString *)v3;
  }
  else {
    v4 = @"https://setup.icloud.com";
  }
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithString:v4];
  v6 = _AALogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v50 = v5;
    _os_log_impl(&dword_1A11D8000, v6, OS_LOG_TYPE_DEFAULT, "Request URL: %@", buf, 0xCu);
  }

  uint64_t v7 = [(AARequest *)self flushCache];
  v8 = (void *)MEMORY[0x1E4F18D50];
  objc_super v9 = [v5 URL];
  v10 = [v8 requestWithURL:v9 cachePolicy:v7 timeoutInterval:60.0];

  v11 = +[AADeviceInfo clientInfoHeader];
  v12 = _AALogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v50 = v11;
    _os_log_impl(&dword_1A11D8000, v12, OS_LOG_TYPE_DEFAULT, "Client Info Header: %@", buf, 0xCu);
  }

  [v10 addValue:v11 forHTTPHeaderField:@"X-MMe-Client-Info"];
  v13 = [MEMORY[0x1E4F1CA20] currentLocale];
  v14 = [v13 objectForKey:*MEMORY[0x1E4F1C400]];
  v15 = [v14 uppercaseString];
  [v10 addValue:v15 forHTTPHeaderField:@"X-MMe-Country"];

  v16 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  uint64_t v17 = [v16 componentsJoinedByString:@","];
  v18 = (void *)v17;
  if (v17) {
    v19 = (__CFString *)v17;
  }
  else {
    v19 = @"en";
  }
  [v10 addValue:v19 forHTTPHeaderField:@"X-MMe-Language"];

  v20 = (void *)MEMORY[0x1E4F1CA20];
  v21 = [MEMORY[0x1E4F1CA20] _deviceLanguage];
  v48 = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
  v23 = [v20 minimizedLanguagesFromLanguages:v22];
  v24 = [v23 componentsJoinedByString:@","];

  [v10 addValue:v24 forHTTPHeaderField:@"Accept-Language"];
  if (self->_cookieStorage)
  {
    [v10 _CFURLRequest];
    CFURLRequestSetHTTPCookieStorage();
    v25 = _AALogSystem();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v50 = v4;
      _os_log_impl(&dword_1A11D8000, v25, OS_LOG_TYPE_DEFAULT, "Use custom cookie storage for urlRequest: %@", buf, 0xCu);
    }
  }
  if (self->_oneTimePassword)
  {
    v26 = _AALogSystem();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v26, OS_LOG_TYPE_DEFAULT, "Adding device provisioning OTP to the request header", buf, 2u);
    }

    [v10 addValue:self->_oneTimePassword forHTTPHeaderField:@"X-Apple-MD"];
  }
  if (self->_machineId)
  {
    v27 = _AALogSystem();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v27, OS_LOG_TYPE_DEFAULT, "Adding device provisioning machineId to the request header", buf, 2u);
    }

    [v10 addValue:self->_machineId forHTTPHeaderField:@"X-Apple-MD-M"];
  }
  objc_msgSend(v10, "aa_addMultiUserDeviceHeaderIfEnabled");
  if (+[AAPreferences isExperimentalModeEnabled])
  {
    v28 = _AALogSystem();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v28, OS_LOG_TYPE_DEFAULT, "Adding exp mode header", buf, 2u);
    }

    [v10 addValue:@"true" forHTTPHeaderField:@"X-iCloud-Experiment-Mode"];
  }
  if (self->_customHeaders)
  {
    v41 = v24;
    v42 = v11;
    v29 = v5;
    v30 = v4;
    v31 = _AALogSystem();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      customHeaders = self->_customHeaders;
      *(_DWORD *)buf = 138412290;
      v50 = customHeaders;
      _os_log_impl(&dword_1A11D8000, v31, OS_LOG_TYPE_DEFAULT, "Appending custom headers %@", buf, 0xCu);
    }

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v33 = self->_customHeaders;
    uint64_t v34 = [(NSDictionary *)v33 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v44 != v36) {
            objc_enumerationMutation(v33);
          }
          uint64_t v38 = *(void *)(*((void *)&v43 + 1) + 8 * i);
          v39 = -[NSDictionary objectForKeyedSubscript:](self->_customHeaders, "objectForKeyedSubscript:", v38, v41, v42, (void)v43);
          [v10 setValue:v39 forHTTPHeaderField:v38];
        }
        uint64_t v35 = [(NSDictionary *)v33 countByEnumeratingWithState:&v43 objects:v47 count:16];
      }
      while (v35);
    }

    v4 = v30;
    id v5 = v29;
    v24 = v41;
    v11 = v42;
  }

  return (NSURLRequest *)v10;
}

- (id)urlCredential
{
  return 0;
}

- (id)bodyDictionary
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = [(id)objc_opt_class() protocolVersion];
  [v2 setObject:v3 forKey:@"protocolVersion"];

  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  v6 = [v5 name];

  [v4 setObject:v6 forKey:@"timezone"];
  uint64_t v7 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  uint64_t v8 = [v7 firstObject];

  if (v8) {
    objc_super v9 = (__CFString *)v8;
  }
  else {
    objc_super v9 = @"en";
  }
  [v4 setObject:v9 forKey:@"language"];
  v10 = +[AADeviceInfo appleIDClientIdentifier];
  [v4 setObject:v10 forKey:@"client-id"];

  [v2 setObject:v4 forKey:@"userInfo"];

  return v2;
}

- (void)performRequestWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[AAURLSession sharedSession];
  [(AARequest *)self performRequestWithSession:v5 withHandler:v4];
}

- (void)performSignedRequestWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[AAURLSession sharedSigningSession];
  [(AARequest *)self performRequestWithSession:v5 withHandler:v4];
}

- (void)performPinnedRequestWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[AAURLSession sharedPinningSession];
  [(AARequest *)self performRequestWithSession:v5 withHandler:v4];
}

- (void)performPinnedOnlyRequestWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[AAURLSession sharedPinningOnlySession];
  [(AARequest *)self performRequestWithSession:v5 withHandler:v4];
}

- (void)performRequestForDevice:(id)a3 withHandler:(id)a4
{
}

- (void)performRequestForDevice:(id)a3 anisetteDataProvider:(id)a4 withHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__0;
  v20 = __Block_byref_object_dispose__0;
  id v21 = [[AAURLSession alloc] initForProxiedDevice:v8 anisetteDataProvider:v9];
  uint64_t v11 = v17[5];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__AARequest_performRequestForDevice_anisetteDataProvider_withHandler___block_invoke;
  v13[3] = &unk_1E5A489C8;
  v15 = &v16;
  id v12 = v10;
  id v14 = v12;
  [(AARequest *)self performRequestWithSession:v11 withHandler:v13];

  _Block_object_dispose(&v16, 8);
}

void __70__AARequest_performRequestForDevice_anisetteDataProvider_withHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;
  id v9 = a4;
  id v10 = a3;
  id v11 = a2;

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performRequestWithSession:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_get_global_queue(2, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__AARequest_performRequestWithSession_withHandler___block_invoke;
  block[3] = &unk_1E5A48A18;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __51__AARequest_performRequestWithSession_withHandler___block_invoke(uint64_t a1)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 32) urlString];

  if (v3)
  {
    id v4 = [*v2 urlRequest];
    if (v4)
    {
      uint64_t v5 = [*(id *)(a1 + 48) copy];
      uint64_t v6 = *(void *)(a1 + 32);
      id v7 = *(void **)(v6 + 8);
      *(void *)(v6 + 8) = v5;

      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __51__AARequest_performRequestWithSession_withHandler___block_invoke_80;
      v21[3] = &unk_1E5A489F0;
      id v8 = *(void **)(a1 + 40);
      v21[4] = *(void *)(a1 + 32);
      id v9 = [v8 dataTaskWithRequest:v4 completion:v21];
      [v9 resume];
    }
    else
    {
      v15 = _AALogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __51__AARequest_performRequestWithSession_withHandler___block_invoke_cold_2((uint64_t *)v2, v15);
      }

      if (*(void *)(a1 + 48))
      {
        uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v22 = *MEMORY[0x1E4F28568];
        uint64_t v17 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
        uint64_t v18 = [v17 localizedStringForKey:@"ICLOUD_CONFIG_ERROR" value:0 table:@"Localizable"];
        v23 = v18;
        v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
        v20 = [v16 errorWithDomain:@"com.apple.appleaccount" code:-2 userInfo:v19];

        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      }
    }
    goto LABEL_12;
  }
  id v10 = _AALogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    __51__AARequest_performRequestWithSession_withHandler___block_invoke_cold_1((uint64_t *)v2, v10);
  }

  if (*(void *)(a1 + 48))
  {
    id v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    id v12 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    id v13 = [v12 localizedStringForKey:@"ICLOUD_CONFIG_ERROR" value:0 table:@"Localizable"];
    v25[0] = v13;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    id v4 = [v11 errorWithDomain:@"com.apple.appleaccount" code:-2 userInfo:v14];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_12:
  }
}

uint64_t __51__AARequest_performRequestWithSession_withHandler___block_invoke_80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _handleDataTaskCompletionWithData:a2 response:a3 error:a4];
}

- (void)_handleDataTaskCompletionWithData:(id)a3 response:(id)a4 error:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = _AALogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    id v19 = v9;
    _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, "Data task did complete with error: %@", (uint8_t *)&v18, 0xCu);
  }

  if (!v9)
  {
    id v12 = _AALogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      id v19 = v8;
      _os_log_impl(&dword_1A11D8000, v12, OS_LOG_TYPE_DEFAULT, "Response: %@", (uint8_t *)&v18, 0xCu);
    }
  }
  id v13 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "responseClass")), "initWithHTTPResponse:data:", v8, v10);

  if (!v13)
  {
    id v14 = _AALogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1A11D8000, v14, OS_LOG_TYPE_DEFAULT, "Failed to parse an AAResponse", (uint8_t *)&v18, 2u);
    }
  }
  v15 = objc_msgSend(v9, "_aa_userReadableError");
  handler = (void (**)(id, AARequest *, void *, void *))self->_handler;
  if (handler)
  {
    handler[2](handler, self, v13, v15);
    id v17 = self->_handler;
    self->_handler = 0;
  }
}

- (void)dealloc
{
  cookieStorage = self->_cookieStorage;
  if (cookieStorage) {
    CFRelease(cookieStorage);
  }
  v4.receiver = self;
  v4.super_class = (Class)AARequest;
  [(AARequest *)&v4 dealloc];
}

- (id)redactedBodyStringWithPropertyList:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[a3 mutableCopy];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v4 = [&unk_1EF483D50 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(&unk_1EF483D50);
        }
        uint64_t v8 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v9 = [v3 valueForKey:v8];
        id v10 = v9;
        if (v9)
        {
          id v11 = [v9 unredactedSuffixOfLength:4];
          id v12 = [NSString stringWithFormat:@"...%@", v11];
          [v3 setValue:v12 forKey:v8];
        }
      }
      uint64_t v5 = [&unk_1EF483D50 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }
  id v13 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v3 format:100 options:0 error:0];
  id v14 = [NSString alloc];
  id v15 = v13;
  uint64_t v16 = objc_msgSend(v14, "initWithBytes:length:encoding:", objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"), 4);

  return v16;
}

+ (id)redactedHeadersFromHTTPHeaders:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[a3 mutableCopy];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [&unk_1EF483D68 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(&unk_1EF483D68);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v9 = [v3 valueForKey:v8];
        id v10 = v9;
        if (v9)
        {
          id v11 = [v9 unredactedSuffixOfLength:4];
          id v12 = [NSString stringWithFormat:@"...%@", v11];
          [v3 setValue:v12 forKey:v8];
        }
      }
      uint64_t v5 = [&unk_1EF483D68 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  return v3;
}

- (BOOL)flushCache
{
  return self->_flushCache;
}

- (void)setFlushCache:(BOOL)a3
{
  self->_flushCache = a3;
}

- (NSDictionary)customHeaders
{
  return self->_customHeaders;
}

- (void)setCustomHeaders:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customHeaders, 0);
  objc_storeStrong((id *)&self->_machineId, 0);
  objc_storeStrong((id *)&self->_oneTimePassword, 0);
  objc_storeStrong((id *)&self->_initialURLString, 0);

  objc_storeStrong(&self->_handler, 0);
}

void __51__AARequest_performRequestWithSession_withHandler___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138477827;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1A11D8000, a2, OS_LOG_TYPE_ERROR, "AARequest has nil URL (%{private}@). Calling handler with an error.", (uint8_t *)&v3, 0xCu);
}

void __51__AARequest_performRequestWithSession_withHandler___block_invoke_cold_2(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138477827;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1A11D8000, a2, OS_LOG_TYPE_ERROR, "AARequest has nil underlying request (%{private}@). Calling handler with an error.", (uint8_t *)&v3, 0xCu);
}

@end