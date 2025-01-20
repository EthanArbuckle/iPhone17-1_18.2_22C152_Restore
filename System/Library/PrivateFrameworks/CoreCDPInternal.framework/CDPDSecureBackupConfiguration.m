@interface CDPDSecureBackupConfiguration
+ (CDPDSecureBackupConfiguration)configurationWithContext:(id)a3;
+ (CDPDSecureBackupConfiguration)configurationWithContext:(id)a3 andSession:(id)a4;
+ (id)_configurationRequestWithURLString:(id)a3;
- (id)_configurationInfoURLRequest;
- (id)_escrowConfigurationBag;
- (id)_escrowConfigurationBagFull;
- (id)_escrowProxyConfigurationURL;
- (id)_escrowProxyConfigurationURLRequest;
- (id)_escrowProxyURL;
- (id)_fetchConfigurationDictionary;
- (id)_fetchConfigurationWithRequest:(id)a3;
- (id)_fetchEscrowConfigurationBag;
- (id)_iCloudEnvironment;
- (id)_setupConfigurationURLs;
- (id)accountInfoFetchSetupDictionary;
- (id)escrowAuthInfoForCreateEscrowRecordFlow:(BOOL)a3;
@end

@implementation CDPDSecureBackupConfiguration

+ (CDPDSecureBackupConfiguration)configurationWithContext:(id)a3
{
  uint64_t v4 = _SharedURLSession_onceToken;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&_SharedURLSession_onceToken, &__block_literal_global_12);
  }
  v6 = [a1 configurationWithContext:v5 andSession:_SharedURLSession_sharedURLSession];

  return (CDPDSecureBackupConfiguration *)v6;
}

+ (CDPDSecureBackupConfiguration)configurationWithContext:(id)a3 andSession:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc_init((Class)objc_opt_class());
  v8 = (void *)v7[1];
  v7[1] = v5;
  id v9 = v5;

  v10 = (void *)v7[4];
  v7[4] = v6;

  return (CDPDSecureBackupConfiguration *)v7;
}

- (id)escrowAuthInfoForCreateEscrowRecordFlow:(BOOL)a3
{
  id v5 = _CDPLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CDPDSecureBackupConfiguration escrowAuthInfoForCreateEscrowRecordFlow:].cold.6(a3, v5);
  }

  id v6 = [MEMORY[0x263EFF9A0] dictionary];
  if ([(CDPContext *)self->_context guestMode])
  {
    v7 = [(CDPDSecureBackupConfiguration *)self _iCloudEnvironment];
    if (v7)
    {
      [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x263F329E8]];
    }
    else
    {
      id v9 = _CDPLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[CDPDSecureBackupConfiguration escrowAuthInfoForCreateEscrowRecordFlow:]();
      }
    }
    v10 = [(CDPDSecureBackupConfiguration *)self _escrowProxyURL];
    if (v10)
    {
      [v6 setObject:v10 forKeyedSubscript:*MEMORY[0x263F329D8]];
      goto LABEL_29;
    }
    v13 = _CDPLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[CDPDSecureBackupConfiguration escrowAuthInfoForCreateEscrowRecordFlow:]();
    }
  }
  else
  {
    v8 = [MEMORY[0x263F34328] sharedInstance];
    v7 = [v8 iCloudEnv];

    if (v7)
    {
      [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x263F329E8]];
    }
    else
    {
      v11 = _CDPLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[CDPDSecureBackupConfiguration escrowAuthInfoForCreateEscrowRecordFlow:].cold.5();
      }
    }
    v12 = [MEMORY[0x263F34328] sharedInstance];
    v10 = [v12 authToken];

    if (v10)
    {
      [v6 setObject:v10 forKeyedSubscript:*MEMORY[0x263F329C8]];
    }
    else
    {
      v14 = _CDPLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[CDPDSecureBackupConfiguration escrowAuthInfoForCreateEscrowRecordFlow:].cold.4();
      }
    }
    v15 = [MEMORY[0x263F34328] sharedInstance];
    v13 = [v15 escrowURL];

    if (v13)
    {
      [v6 setObject:v13 forKeyedSubscript:*MEMORY[0x263F329D8]];
    }
    else
    {
      v16 = _CDPLogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[CDPDSecureBackupConfiguration escrowAuthInfoForCreateEscrowRecordFlow:]();
      }
    }
  }

LABEL_29:
  if ([(CDPContext *)self->_context idmsRecovery])
  {
    [v6 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F32A60]];
  }
  else
  {
    v17 = [(CDPContext *)self->_context findMyiPhoneUUID];

    if (v17)
    {
      [v6 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F32A38]];
      v18 = [(CDPContext *)self->_context findMyiPhoneUUID];
      [v6 setObject:v18 forKeyedSubscript:*MEMORY[0x263F32A40]];
    }
  }
  v19 = [(CDPContext *)self->_context appleID];

  if (v19)
  {
    v20 = [(CDPContext *)self->_context appleID];
    [v6 setObject:v20 forKeyedSubscript:*MEMORY[0x263F329C0]];
  }
  v21 = [(CDPContext *)self->_context dsid];
  v22 = [v21 stringValue];

  if (v22)
  {
    v23 = [(CDPContext *)self->_context dsid];
    v24 = [v23 stringValue];
    [v6 setObject:v24 forKeyedSubscript:*MEMORY[0x263F329D0]];
  }
  v25 = [(CDPContext *)self->_context passwordEquivToken];

  if (v25)
  {
    v26 = [(CDPContext *)self->_context passwordEquivToken];
    [v6 setObject:v26 forKeyedSubscript:*MEMORY[0x263F329E0]];
  }
  if (!a3 && [(CDPContext *)self->_context edpState] == 2) {
    [v6 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F329F8]];
  }
  v27 = (void *)[v6 copy];

  return v27;
}

- (id)accountInfoFetchSetupDictionary
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (([(CDPContext *)self->_context guestMode] & 1) == 0) {
    [v3 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F32AD0]];
  }
  if ([(CDPContext *)self->_context type] == 3
    || [(CDPContext *)self->_context type] == 6
    || [(CDPContext *)self->_context type] == 7)
  {
    uint64_t v4 = _CDPLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_218640000, v4, OS_LOG_TYPE_DEFAULT, "Requesting the server suppress filtering", v8, 2u);
    }

    [v3 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F32AC8]];
  }
  id v5 = [(CDPDSecureBackupConfiguration *)self escrowAuthInfoForCreateEscrowRecordFlow:0];
  [v3 addEntriesFromDictionary:v5];

  id v6 = (void *)[v3 copy];
  return v6;
}

- (id)_iCloudEnvironment
{
  v2 = [(CDPDSecureBackupConfiguration *)self _escrowConfigurationBag];
  v3 = [v2 objectForKeyedSubscript:@"iCloudEnv"];

  return v3;
}

- (id)_escrowProxyURL
{
  v2 = [(CDPDSecureBackupConfiguration *)self _escrowConfigurationBag];
  v3 = [v2 objectForKeyedSubscript:@"escrowProxyUrl"];

  return v3;
}

- (id)_escrowProxyConfigurationURL
{
  v2 = [(CDPDSecureBackupConfiguration *)self _setupConfigurationURLs];
  v3 = [v2 objectForKey:@"getRecoverySettings"];

  return v3;
}

- (id)_escrowConfigurationBag
{
  v2 = [(CDPDSecureBackupConfiguration *)self _escrowConfigurationBagFull];
  v3 = [v2 objectForKeyedSubscript:@"com.apple.mobileme"];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"com.apple.Dataclass.KeychainSync"];

  return v4;
}

- (id)_setupConfigurationURLs
{
  configurationURLs = self->_configurationURLs;
  if (!configurationURLs)
  {
    uint64_t v4 = [(CDPDSecureBackupConfiguration *)self _fetchConfigurationDictionary];
    id v5 = self->_configurationURLs;
    self->_configurationURLs = v4;

    configurationURLs = self->_configurationURLs;
  }
  return [(NSDictionary *)configurationURLs objectForKeyedSubscript:@"urls"];
}

- (id)_escrowConfigurationBagFull
{
  escrowConfigurationURLs = self->_escrowConfigurationURLs;
  if (!escrowConfigurationURLs)
  {
    uint64_t v4 = [(CDPDSecureBackupConfiguration *)self _fetchEscrowConfigurationBag];
    id v5 = self->_escrowConfigurationURLs;
    self->_escrowConfigurationURLs = v4;

    escrowConfigurationURLs = self->_escrowConfigurationURLs;
  }
  return escrowConfigurationURLs;
}

- (id)_escrowProxyConfigurationURLRequest
{
  v3 = objc_opt_class();
  uint64_t v4 = [(CDPDSecureBackupConfiguration *)self _escrowProxyConfigurationURL];
  id v5 = [v3 _configurationRequestWithURLString:v4];

  objc_msgSend(v5, "cdp_addClientInfoHeader");
  objc_msgSend(v5, "cdp_addAuthHeaderWithContext:", self->_context);
  [v5 setValue:@"en-us" forHTTPHeaderField:@"Accept-Language"];
  [v5 setValue:@"application/xml" forHTTPHeaderField:@"Accept"];
  return v5;
}

- (id)_configurationInfoURLRequest
{
  v2 = objc_opt_class();
  return (id)[v2 _configurationRequestWithURLString:@"https://setup.icloud.com/configurations/init?context=settings"];
}

+ (id)_configurationRequestWithURLString:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F089E0];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = [NSURL URLWithString:v4];

  v7 = (void *)[v5 initWithURL:v6];
  objc_msgSend(v7, "cdp_addClientInfoHeader");
  return v7;
}

- (id)_fetchEscrowConfigurationBag
{
  v3 = [(CDPDSecureBackupConfiguration *)self _escrowProxyConfigurationURLRequest];
  id v4 = [(CDPDSecureBackupConfiguration *)self _fetchConfigurationWithRequest:v3];

  return v4;
}

- (id)_fetchConfigurationDictionary
{
  v3 = [(CDPDSecureBackupConfiguration *)self _configurationInfoURLRequest];
  id v4 = [(CDPDSecureBackupConfiguration *)self _fetchConfigurationWithRequest:v3];

  return v4;
}

- (id)_fetchConfigurationWithRequest:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    uint64_t v26 = 0;
    v27[0] = &v26;
    v27[1] = 0x3032000000;
    v27[2] = __Block_byref_object_copy__8;
    v27[3] = __Block_byref_object_dispose__8;
    id v28 = 0;
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2020000000;
    char v25 = 0;
    uint64_t v5 = 1;
    uint64_t v6 = MEMORY[0x263EF8330];
    do
    {
      v7 = _CDPLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v4;
        _os_log_debug_impl(&dword_218640000, v7, OS_LOG_TYPE_DEBUG, "Attempting to fetch configuration using request: %@", buf, 0xCu);
      }

      dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
      session = self->_session;
      v17[0] = v6;
      v17[1] = 3221225472;
      v17[2] = __64__CDPDSecureBackupConfiguration__fetchConfigurationWithRequest___block_invoke;
      v17[3] = &unk_264330E00;
      v19 = &v22;
      v20 = &v26;
      uint64_t v21 = v5;
      v10 = v8;
      v18 = v10;
      v11 = [(NSURLSession *)session dataTaskWithRequest:v4 completionHandler:v17];
      [v11 resume];
      dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);

      ++v5;
    }
    while (*((unsigned char *)v23 + 24));
    v12 = *(void **)(v27[0] + 40);
    if (v12)
    {
      v13 = _CDPLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[CDPDSecureBackupConfiguration _fetchConfigurationWithRequest:]((uint64_t)v27, v13);
      }

      v12 = *(void **)(v27[0] + 40);
    }
    id v14 = v12;
    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v26, 8);
  }
  else
  {
    v15 = _CDPLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CDPDSecureBackupConfiguration _fetchConfigurationWithRequest:]();
    }

    id v14 = 0;
  }

  return v14;
}

void __64__CDPDSecureBackupConfiguration__fetchConfigurationWithRequest___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  v10 = _CDPLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    __64__CDPDSecureBackupConfiguration__fetchConfigurationWithRequest___block_invoke_cold_3((uint64_t)v8, v10);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v8 statusCode] == 500)
  {
    v11 = _CDPLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __64__CDPDSecureBackupConfiguration__fetchConfigurationWithRequest___block_invoke_cold_1();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(void *)(a1 + 56) < 4;
  }
  else if (v9)
  {
    v12 = _CDPLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __64__CDPDSecureBackupConfiguration__fetchConfigurationWithRequest___block_invoke_cold_2((uint64_t)v9, v12);
    }
  }
  else
  {
    uint64_t v16 = 0;
    uint64_t v13 = [MEMORY[0x263F08AC0] propertyListWithData:v7 options:0 format:0 error:&v16];
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_escrowConfigurationURLs, 0);
  objc_storeStrong((id *)&self->_configurationURLs, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)escrowAuthInfoForCreateEscrowRecordFlow:.cold.1()
{
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_218640000, v0, OS_LOG_TYPE_DEBUG, "Failed to fetch EP URL", v1, 2u);
}

- (void)escrowAuthInfoForCreateEscrowRecordFlow:.cold.2()
{
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_218640000, v0, OS_LOG_TYPE_DEBUG, "Failed to fetch iCloud Env", v1, 2u);
}

- (void)escrowAuthInfoForCreateEscrowRecordFlow:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_218640000, v0, v1, "Base URL missing, bad things to come...", v2, v3, v4, v5, v6);
}

- (void)escrowAuthInfoForCreateEscrowRecordFlow:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_218640000, v0, v1, "Auth Token missing, bad things to come...", v2, v3, v4, v5, v6);
}

- (void)escrowAuthInfoForCreateEscrowRecordFlow:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_218640000, v0, v1, "iCloud Env missing, bad things to come...", v2, v3, v4, v5, v6);
}

- (void)escrowAuthInfoForCreateEscrowRecordFlow:(char)a1 .cold.6(char a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_218640000, a2, OS_LOG_TYPE_DEBUG, "Creating SecureBackup auth info for creation flow: %{BOOL}d", (uint8_t *)v2, 8u);
}

- (void)_fetchConfigurationWithRequest:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_218640000, v0, v1, "Invalid configuration request detected", v2, v3, v4, v5, v6);
}

- (void)_fetchConfigurationWithRequest:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_218640000, a2, OS_LOG_TYPE_DEBUG, "Configuration Fetched: %@", (uint8_t *)&v3, 0xCu);
}

void __64__CDPDSecureBackupConfiguration__fetchConfigurationWithRequest___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_218640000, v0, v1, "Server Indicated that a retry attempt is needed", v2, v3, v4, v5, v6);
}

void __64__CDPDSecureBackupConfiguration__fetchConfigurationWithRequest___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_218640000, a2, OS_LOG_TYPE_ERROR, "Failed to load configuraiton: %@", (uint8_t *)&v2, 0xCu);
}

void __64__CDPDSecureBackupConfiguration__fetchConfigurationWithRequest___block_invoke_cold_3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_218640000, a2, OS_LOG_TYPE_DEBUG, "Configuration Response: %@", (uint8_t *)&v2, 0xCu);
}

@end