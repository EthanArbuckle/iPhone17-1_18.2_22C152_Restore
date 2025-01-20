@interface AKWalrusConfigProvider
+ (id)sharedInstance;
- (AKWalrusConfig)cachedConfig;
- (id)_extractWalrusConfigWithAccountCountry:(id)a3 fromGlobalConfig:(id)a4;
- (void)getWalrusConfigWithCompletion:(id)a3;
@end

@implementation AKWalrusConfigProvider

+ (id)sharedInstance
{
  if (sharedInstance_pred_1 != -1) {
    dispatch_once(&sharedInstance_pred_1, &__block_literal_global_46);
  }
  v2 = (void *)sharedInstance_sharedInstance_4;

  return v2;
}

uint64_t __40__AKWalrusConfigProvider_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_4 = objc_alloc_init(AKWalrusConfigProvider);

  return MEMORY[0x1F41817F8]();
}

- (void)getWalrusConfigWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(AKAppleIDAuthenticationController);
  v6 = +[AKAccountManager sharedInstance];
  v7 = [v6 primaryAuthKitAccount];

  v8 = +[AKAccountManager sharedInstance];
  v9 = [v8 appleIDCountryCodeForAccount:v7];

  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__13;
  v24[4] = __Block_byref_object_dispose__13;
  id v25 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __56__AKWalrusConfigProvider_getWalrusConfigWithCompletion___block_invoke;
  v20[3] = &unk_1E5761D40;
  v23 = v24;
  v20[4] = self;
  id v10 = v9;
  id v21 = v10;
  id v11 = v4;
  id v22 = v11;
  v12 = (void *)MEMORY[0x1996FE880](v20);
  v13 = _AKLogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[AKWalrusConfigProvider getWalrusConfigWithCompletion:](v13);
  }

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __56__AKWalrusConfigProvider_getWalrusConfigWithCompletion___block_invoke_66;
  v16[3] = &unk_1E5761D68;
  id v14 = v12;
  id v18 = v14;
  v19 = v24;
  v15 = v5;
  v17 = v15;
  [(AKAppleIDAuthenticationController *)v15 fetchGlobalConfigurationUsingPolicy:0 completion:v16];

  _Block_object_dispose(v24, 8);
}

void __56__AKWalrusConfigProvider_getWalrusConfigWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = _AKLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl(&dword_193494000, v7, OS_LOG_TYPE_DEFAULT, "Fetch global config completed with error: %@", (uint8_t *)&v10, 0xCu);
  }

  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)
    || (objc_msgSend(v5, "isEqualToDictionary:") & 1) == 0)
  {
    v8 = [*(id *)(a1 + 32) _extractWalrusConfigWithAccountCountry:*(void *)(a1 + 40) fromGlobalConfig:v5];
    uint64_t v9 = *(void *)(a1 + 48);
    if (v9) {
      (*(void (**)(uint64_t, void *, void))(v9 + 16))(v9, v8, 0);
    }
  }
}

void __56__AKWalrusConfigProvider_getWalrusConfigWithCompletion___block_invoke_66(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  id v6 = v3;

  [*(id *)(a1 + 32) fetchGlobalConfigurationUsingPolicy:1 completion:*(void *)(a1 + 40)];
}

- (id)_extractWalrusConfigWithAccountCountry:(id)a3 fromGlobalConfig:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7) {
    v8 = v7;
  }
  else {
    v8 = &unk_1EE43EC98;
  }
  uint64_t v9 = [v8 objectForKeyedSubscript:@"adpCountries"];
  if (v9)
  {
    int v10 = [v6 uppercaseString];
    id v11 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    uint64_t v12 = [v10 stringByTrimmingCharactersInSet:v11];

    objc_opt_class();
    id v13 = [v9 objectForKeyedSubscript:v12];
    if (objc_opt_isKindOfClass()) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }

    v15 = objc_opt_new();
    if (v14)
    {
      v16 = [v14 objectForKeyedSubscript:@"status"];
      uint64_t v17 = [v16 unsignedIntValue];

      [v15 setFeatureStatus:v17];
      id v18 = [v14 objectForKeyedSubscript:@"reason"];
      [v15 setLocalizedStatusDescription:v18];
    }
    else
    {
      v19 = _AKLogSystem();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[AKWalrusConfigProvider _extractWalrusConfigWithAccountCountry:fromGlobalConfig:](v19);
      }

      [v15 setFeatureStatus:0];
    }
    objc_storeStrong((id *)&self->_cachedConfig, v15);
  }
  else
  {
    uint64_t v12 = _AKLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[AKWalrusConfigProvider _extractWalrusConfigWithAccountCountry:fromGlobalConfig:](v12);
    }
    v15 = 0;
  }

  return v15;
}

- (AKWalrusConfig)cachedConfig
{
  return self->_cachedConfig;
}

- (void).cxx_destruct
{
}

- (void)getWalrusConfigWithCompletion:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_193494000, log, OS_LOG_TYPE_DEBUG, "Fetching global config for walrus config.", v1, 2u);
}

- (void)_extractWalrusConfigWithAccountCountry:(os_log_t)log fromGlobalConfig:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_193494000, log, OS_LOG_TYPE_ERROR, "Global config has no ADP countries", v1, 2u);
}

- (void)_extractWalrusConfigWithAccountCountry:(os_log_t)log fromGlobalConfig:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_193494000, log, OS_LOG_TYPE_ERROR, "Global config has no entry for account country", v1, 2u);
}

@end