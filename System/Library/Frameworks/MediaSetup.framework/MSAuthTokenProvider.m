@interface MSAuthTokenProvider
+ (void)fetchAuthTokensForMediaService:(id)a3 networkActivity:(id)a4 completion:(id)a5;
+ (void)validateConfigurationResourceForMediaService:(id)a3 networkActivity:(id)a4 completion:(id)a5;
@end

@implementation MSAuthTokenProvider

+ (void)fetchAuthTokensForMediaService:(id)a3 networkActivity:(id)a4 completion:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 authConfiguration];

  if (v11)
  {
    v12 = [MEMORY[0x263F08C00] ephemeralSessionConfiguration];
    v13 = [v8 bundleIdentifier];
    objc_msgSend(v12, "set_sourceApplicationBundleIdentifier:", v13);

    v14 = _MSLogingFacility();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = [v8 bundleIdentifier];
      *(_DWORD *)buf = 138412290;
      v25 = v15;
      _os_log_impl(&dword_225D52000, v14, OS_LOG_TYPE_INFO, "AuthFetch: Setting sourceApplicationBundleID to %@", buf, 0xCu);
    }
    v16 = [v8 authConfiguration];
    v17 = [v8 authCredential];
    v18 = +[MSOAuthTokenHandler tokenHandlerWithConfiguration:v16 existingCredential:v17 URLSessionConfiguration:v12 parentNetworkActivity:v9];

    objc_initWeak((id *)buf, a1);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __81__MSAuthTokenProvider_fetchAuthTokensForMediaService_networkActivity_completion___block_invoke;
    v20[3] = &unk_264775268;
    objc_copyWeak(&v23, (id *)buf);
    id v22 = v10;
    id v21 = v8;
    [v18 fetchTokens:v20];

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v19 = _MSLogingFacility();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      +[MSAuthTokenProvider fetchAuthTokensForMediaService:networkActivity:completion:](v8, v19);
    }

    v12 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.mediasetup.errorDomain" code:9 userInfo:0];
    (*((void (**)(id, void *))v10 + 2))(v10, v12);
  }
}

void __81__MSAuthTokenProvider_fetchAuthTokensForMediaService_networkActivity_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

  if (WeakRetained)
  {
    id v8 = (id *)(a1 + 32);
    [*(id *)(a1 + 32) setAuthCredential:v5];
    if (v6)
    {
      id v9 = [v6 domain];
      if ([v9 isEqualToString:@"com.apple.mediasetup.errorDomain"])
      {
        uint64_t v10 = [v6 code];

        if (v10 == 8) {
          [*v8 setAuthFatalError:1];
        }
      }
      else
      {
      }
      v16 = _MSLogingFacility();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        __81__MSAuthTokenProvider_fetchAuthTokensForMediaService_networkActivity_completion___block_invoke_cold_1((id *)(a1 + 32), (uint64_t)v6, v16);
      }

      v15 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    else
    {
      [*v8 setAuthFatalError:0];
      v13 = _MSLogingFacility();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = [*v8 serviceID];
        int v17 = 138477827;
        v18 = v14;
        _os_log_impl(&dword_225D52000, v13, OS_LOG_TYPE_DEFAULT, "Successfully fetched authTokens for service %{private}@", (uint8_t *)&v17, 0xCu);
      }
      v15 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    v15();
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 40);
    v12 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.mediasetup.errorDomain" code:1 userInfo:0];
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
  }
}

+ (void)validateConfigurationResourceForMediaService:(id)a3 networkActivity:(id)a4 completion:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a5;
  id v8 = [v6 authCredential];
  id v9 = [v8 authToken];

  if (v9)
  {
    uint64_t v10 = [v6 authCredential];
    v27 = [v10 authHeader];
  }
  else
  {
    v27 = 0;
  }
  uint64_t v11 = _MSLogingFacility();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [v6 bundleIdentifier];
    v13 = [v6 configPublicKey];
    *(_DWORD *)buf = 138412546;
    v31 = v12;
    __int16 v32 = 2112;
    v33 = v13;
    _os_log_impl(&dword_225D52000, v11, OS_LOG_TYPE_DEFAULT, "Validating mediaService for %@ with public key: %@", buf, 0x16u);
  }
  v14 = [MEMORY[0x263F08C00] ephemeralSessionConfiguration];
  v15 = [v6 bundleIdentifier];
  uint64_t v26 = v14;
  objc_msgSend(v14, "set_sourceApplicationBundleIdentifier:", v15);

  v16 = _MSLogingFacility();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    int v17 = [v6 bundleIdentifier];
    *(_DWORD *)buf = 138412290;
    v31 = v17;
    _os_log_impl(&dword_225D52000, v16, OS_LOG_TYPE_INFO, "ConfigFetch: Setting sourceApplicationBundleID to %@", buf, 0xCu);
  }
  v25 = (void *)MEMORY[0x263F327F8];
  v18 = [v6 configURL];
  uint64_t v19 = [MEMORY[0x263F08C38] UUID];
  v20 = [v19 UUIDString];
  id v21 = [v6 bundleIdentifier];
  id v22 = [v6 configPublicKey];
  id v23 = CMSCloudExtensionLanguageCode();
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __95__MSAuthTokenProvider_validateConfigurationResourceForMediaService_networkActivity_completion___block_invoke;
  v28[3] = &unk_264775290;
  id v29 = v7;
  id v24 = v7;
  [v25 configurationFromURL:v18 forSession:v20 usingAuth:v27 authProvider:0 parentNetworkActivity:0 keyID:v21 publicKey:v22 URLSessionConfiguration:v26 languageCode:v23 completion:v28];
}

void __95__MSAuthTokenProvider_validateConfigurationResourceForMediaService_networkActivity_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v15[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  id v8 = @"Missing configuration resource";
  if (v5 && !v6)
  {
    id v9 = [v5 configForEndpoint:*MEMORY[0x263F327F0]];
    if (v9)
    {

      uint64_t v10 = 0;
      goto LABEL_9;
    }
    id v8 = @"Invalid configuration resource";
  }
  uint64_t v11 = _MSLogingFacility();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    __95__MSAuthTokenProvider_validateConfigurationResourceForMediaService_networkActivity_completion___block_invoke_cold_1((uint64_t)v7, v11);
  }

  v12 = (void *)MEMORY[0x263F087E8];
  uint64_t v14 = *MEMORY[0x263F08320];
  v15[0] = v8;
  v13 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  uint64_t v10 = [v12 errorWithDomain:@"com.apple.mediasetup.errorDomain" code:10 userInfo:v13];

LABEL_9:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)fetchAuthTokensForMediaService:(void *)a1 networkActivity:(NSObject *)a2 completion:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = [a1 serviceID];
  int v4 = 138477827;
  id v5 = v3;
  _os_log_error_impl(&dword_225D52000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch authTokens for service %{private}@ - mediaService missing authConfig", (uint8_t *)&v4, 0xCu);
}

void __81__MSAuthTokenProvider_fetchAuthTokensForMediaService_networkActivity_completion___block_invoke_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = [*a1 serviceID];
  int v6 = 138478083;
  id v7 = v5;
  __int16 v8 = 2113;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_225D52000, a3, OS_LOG_TYPE_ERROR, "Failed to fetch authTokens for service %{private}@. Error: %{private}@", (uint8_t *)&v6, 0x16u);
}

void __95__MSAuthTokenProvider_validateConfigurationResourceForMediaService_networkActivity_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_225D52000, a2, OS_LOG_TYPE_ERROR, "Encountered an issue trying to attain configuration resource: %@", (uint8_t *)&v2, 0xCu);
}

@end