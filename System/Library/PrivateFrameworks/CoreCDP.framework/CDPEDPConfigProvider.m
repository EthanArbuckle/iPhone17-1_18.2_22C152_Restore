@interface CDPEDPConfigProvider
+ (id)sharedInstance;
- (BOOL)fetchCompleted;
- (NSString)tokenName;
- (NSString)tokenNameMedium;
- (NSString)tokenNameTitle;
- (void)_extractTokenNameFromConfig:(id)a3 finalize:(BOOL)a4;
- (void)fetchConfig;
- (void)setFetchCompleted:(BOOL)a3;
- (void)setTokenName:(id)a3;
- (void)setTokenNameMedium:(id)a3;
- (void)setTokenNameTitle:(id)a3;
@end

@implementation CDPEDPConfigProvider

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_instance;
  return v2;
}

uint64_t __38__CDPEDPConfigProvider_sharedInstance__block_invoke()
{
  sharedInstance_instance = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (void)fetchConfig
{
  if (![(CDPEDPConfigProvider *)self fetchCompleted])
  {
    v3 = [MEMORY[0x263F291F0] sharedInstance];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __35__CDPEDPConfigProvider_fetchConfig__block_invoke;
    v4[3] = &unk_264316E20;
    v4[4] = self;
    [v3 fetchGlobalConfigUsingCachePolicy:0 completion:v4];
  }
}

void __35__CDPEDPConfigProvider_fetchConfig__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __35__CDPEDPConfigProvider_fetchConfig__block_invoke_cold_1((uint64_t)v5, v6);
    }
  }
  else
  {
    [*(id *)(a1 + 32) _extractTokenNameFromConfig:a2 finalize:0];
  }
  v7 = [MEMORY[0x263F291F0] sharedInstance];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __35__CDPEDPConfigProvider_fetchConfig__block_invoke_30;
  v8[3] = &unk_264316E20;
  v8[4] = *(void *)(a1 + 32);
  [v7 fetchGlobalConfigUsingCachePolicy:1 completion:v8];
}

void __35__CDPEDPConfigProvider_fetchConfig__block_invoke_30(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __35__CDPEDPConfigProvider_fetchConfig__block_invoke_30_cold_1((uint64_t)v5, v6);
    }
  }
  else
  {
    [*(id *)(a1 + 32) _extractTokenNameFromConfig:a2 finalize:1];
  }
}

- (void)_extractTokenNameFromConfig:(id)a3 finalize:(BOOL)a4
{
  v6 = [a3 objectForKeyedSubscript:@"edp"];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [v6 objectForKeyedSubscript:@"rtName"];
      v8 = [v6 objectForKeyedSubscript:@"titleRTName"];
      v9 = [v6 objectForKeyedSubscript:@"shortRTName"];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __61__CDPEDPConfigProvider__extractTokenNameFromConfig_finalize___block_invoke;
      block[3] = &unk_264316E48;
      block[4] = self;
      id v14 = v7;
      id v15 = v8;
      id v16 = v9;
      BOOL v17 = a4;
      id v10 = v9;
      id v11 = v8;
      v12 = v7;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
    else
    {
      v12 = _CDPLogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[CDPEDPConfigProvider _extractTokenNameFromConfig:finalize:](v12);
      }
    }
  }
  else
  {
    v12 = _CDPLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CDPEDPConfigProvider _extractTokenNameFromConfig:finalize:](v12);
    }
  }
}

void __61__CDPEDPConfigProvider__extractTokenNameFromConfig_finalize___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) tokenName];
  char v3 = [v2 isEqualToString:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0) {
    [*(id *)(a1 + 32) setTokenName:*(void *)(a1 + 40)];
  }
  v4 = [*(id *)(a1 + 32) tokenNameTitle];
  char v5 = [v4 isEqualToString:*(void *)(a1 + 48)];

  if ((v5 & 1) == 0) {
    [*(id *)(a1 + 32) setTokenNameTitle:*(void *)(a1 + 48)];
  }
  v6 = [*(id *)(a1 + 32) tokenNameMedium];
  char v7 = [v6 isEqualToString:*(void *)(a1 + 56)];

  if ((v7 & 1) == 0) {
    [*(id *)(a1 + 32) setTokenNameMedium:*(void *)(a1 + 56)];
  }
  if (*(unsigned char *)(a1 + 64))
  {
    v8 = *(void **)(a1 + 32);
    [v8 setFetchCompleted:1];
  }
}

- (NSString)tokenName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTokenName:(id)a3
{
}

- (NSString)tokenNameTitle
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTokenNameTitle:(id)a3
{
}

- (NSString)tokenNameMedium
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTokenNameMedium:(id)a3
{
}

- (BOOL)fetchCompleted
{
  return self->_fetchCompleted;
}

- (void)setFetchCompleted:(BOOL)a3
{
  self->_fetchCompleted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenNameMedium, 0);
  objc_storeStrong((id *)&self->_tokenNameTitle, 0);
  objc_storeStrong((id *)&self->_tokenName, 0);
}

void __35__CDPEDPConfigProvider_fetchConfig__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2182AE000, a2, OS_LOG_TYPE_ERROR, "Error getting cached EDP config. Error - %@", (uint8_t *)&v2, 0xCu);
}

void __35__CDPEDPConfigProvider_fetchConfig__block_invoke_30_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2182AE000, a2, OS_LOG_TYPE_ERROR, "Error getting fresh EDP config. Error - %@", (uint8_t *)&v2, 0xCu);
}

- (void)_extractTokenNameFromConfig:(os_log_t)log finalize:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2182AE000, log, OS_LOG_TYPE_ERROR, "No EDP config found in global config.", v1, 2u);
}

- (void)_extractTokenNameFromConfig:(os_log_t)log finalize:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2182AE000, log, OS_LOG_TYPE_ERROR, "EDP config is not a dictionary", v1, 2u);
}

@end