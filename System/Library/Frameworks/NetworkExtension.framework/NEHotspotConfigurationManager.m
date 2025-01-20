@interface NEHotspotConfigurationManager
+ (NEHotspotConfigurationManager)sharedManager;
- (void)applyConfiguration:(NEHotspotConfiguration *)configuration completionHandler:(void *)completionHandler;
- (void)getConfiguredSSIDsWithCompletionHandler:(void *)completionHandler;
- (void)joinAccessoryHotspot:(id)a3 passphrase:(id)a4 completionHandler:(id)a5;
- (void)joinAccessoryHotspotWithoutSecurity:(id)a3 completionHandler:(id)a4;
- (void)removeConfigurationForHS20DomainName:(NSString *)domainName;
- (void)removeConfigurationForSSID:(NSString *)SSID;
- (void)reportError:(void *)a3 completionHandler:;
@end

@implementation NEHotspotConfigurationManager

- (void)joinAccessoryHotspotWithoutSecurity:(id)a3 completionHandler:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [a3 SSID];
  if (v7)
  {
    v8 = [[NEHotspotConfiguration alloc] initWithSSID:v7];
    [(NEHotspotConfiguration *)v8 setJoinOnce:1];
    [(NEHotspotConfiguration *)v8 setIsAccessory:1];
    [(NEHotspotConfigurationManager *)self applyConfiguration:v8 completionHandler:v6];
  }
  else
  {
    v9 = ne_log_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = (id)objc_opt_class();
      id v10 = v12;
      _os_log_error_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_ERROR, "%@ ASAccessory object not provided", (uint8_t *)&v11, 0xCu);
    }
    -[NEHotspotConfigurationManager reportError:completionHandler:]((uint64_t)self, 101, v6);
  }
}

- (void)reportError:(void *)a3 completionHandler:
{
  id v5 = a3;
  id v6 = v5;
  if (a1 && v5)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__NEHotspotConfigurationManager_reportError_completionHandler___block_invoke;
    block[3] = &unk_1E5992D90;
    block[4] = a1;
    id v8 = v5;
    uint64_t v9 = a2;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __63__NEHotspotConfigurationManager_reportError_completionHandler___block_invoke(void *a1)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1[5];
  if (a1[4])
  {
    id v4 = 0;
    uint64_t v5 = a1[6];
    if (!(!v2 & v1))
    {
      switch(v5)
      {
        case 0:
          goto LABEL_25;
        case 1:
          id v6 = @"failed to get user's approval.";
          uint64_t v7 = 7;
          goto LABEL_24;
        case 2:
          goto LABEL_8;
        case 3:
          id v6 = @"pending request.";
          uint64_t v7 = 9;
          goto LABEL_24;
        case 4:
          id v6 = @"unknown error.";
          goto LABEL_17;
        case 5:
          id v6 = @"cannot modify system configuration.";
          uint64_t v7 = 10;
          goto LABEL_24;
        case 6:
          id v6 = @"already associated.";
          uint64_t v7 = 13;
          goto LABEL_24;
        case 7:
        case 9:
          goto LABEL_16;
        case 8:
          id v6 = @"application is not in the foreground.";
          uint64_t v7 = 14;
          goto LABEL_24;
        case 10:
          id v6 = @"accessory access is unauthorized by the user.";
          uint64_t v7 = 16;
          goto LABEL_24;
        case 11:
          id v6 = @"system denied configuration of the accessory network.";
          uint64_t v7 = 17;
          goto LABEL_24;
        default:
          JUMPOUT(0);
      }
    }
    id v6 = @"invalid SSID.";
    uint64_t v7 = 1;
    switch(v5)
    {
      case 'd':
        break;
      case 'e':
        goto LABEL_24;
      case 'f':
        id v6 = @"invalid WPA/WPA2 Passphrase.";
        uint64_t v7 = 2;
        goto LABEL_24;
      case 'g':
        id v6 = @"invalid WEP Passphrase.";
        uint64_t v7 = 3;
        goto LABEL_24;
      case 'h':
        id v6 = @"invalid EAP settings.";
        uint64_t v7 = 4;
        goto LABEL_24;
      case 'i':
        id v6 = @"invalid Hotspot 2.0 Settings.";
        uint64_t v7 = 5;
        goto LABEL_24;
      case 'j':
        id v6 = @"invalid Hotspot 2.0 Domain Name.";
        uint64_t v7 = 6;
        goto LABEL_24;
      case 'k':
LABEL_8:
        id v6 = @"internal error.";
        uint64_t v7 = 8;
        goto LABEL_24;
      case 'm':
        id v6 = @"JoinOnce is not supported for EAP security type.";
        uint64_t v7 = 12;
        goto LABEL_24;
      case 'n':
        id v6 = @"invalid SSID Prefix.";
        uint64_t v7 = 15;
        goto LABEL_24;
      default:
LABEL_16:
        id v6 = @"<unknown>";
LABEL_17:
        uint64_t v7 = 11;
LABEL_24:
        id v8 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v12 = *MEMORY[0x1E4F28568];
        v13[0] = v6;
        uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
        id v10 = [v8 errorWithDomain:@"NEHotspotConfigurationErrorDomain" code:v7 userInfo:v9];

        id v4 = v10;
        break;
    }
  }
  else
  {
    id v4 = 0;
  }
LABEL_25:
  id v11 = v4;
  (*(void (**)(uint64_t))(v3 + 16))(v3);
}

- (void)joinAccessoryHotspot:(id)a3 passphrase:(id)a4 completionHandler:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = [a3 SSID];
  if (!v10)
  {
    uint64_t v12 = ne_log_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v18 = 138412290;
      id v19 = (id)objc_opt_class();
      id v16 = v19;
      _os_log_error_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_ERROR, "%@ ASAccessory object not provided", (uint8_t *)&v18, 0xCu);
    }
    uint64_t v13 = self;
    uint64_t v14 = 101;
    goto LABEL_10;
  }
  if (!v8)
  {
    v15 = ne_log_obj();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v18 = 138412290;
      id v19 = (id)objc_opt_class();
      id v17 = v19;
      _os_log_error_impl(&dword_19DDAF000, v15, OS_LOG_TYPE_ERROR, "%@ passphrase string not provided", (uint8_t *)&v18, 0xCu);
    }
    uint64_t v13 = self;
    uint64_t v14 = 102;
LABEL_10:
    -[NEHotspotConfigurationManager reportError:completionHandler:]((uint64_t)v13, v14, v9);
    goto LABEL_11;
  }
  id v11 = [[NEHotspotConfiguration alloc] initWithSSID:v10 passphrase:v8 isWEP:0];
  [(NEHotspotConfiguration *)v11 setJoinOnce:1];
  [(NEHotspotConfiguration *)v11 setIsAccessory:1];
  [(NEHotspotConfigurationManager *)self applyConfiguration:v11 completionHandler:v9];

LABEL_11:
}

- (void)getConfiguredSSIDsWithCompletionHandler:(void *)completionHandler
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = completionHandler;
  if (v3)
  {
    id v4 = +[NEHotspotConfigurationHelper sharedManager]();
    if (v4)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __73__NEHotspotConfigurationManager_getConfiguredSSIDsWithCompletionHandler___block_invoke;
      v7[3] = &unk_1E598FF98;
      id v8 = v3;
      -[NEHotspotConfigurationHelper sendRequest:requestType:resultHandler:](v4, 0, 2, v7);
      uint64_t v5 = v8;
    }
    else
    {
      uint64_t v5 = ne_log_obj();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v10 = (id)objc_opt_class();
        id v6 = v10;
        _os_log_error_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_ERROR, "%@ Failed to instantiate NEHotspotConfigurationHelper.", buf, 0xCu);
      }
    }
  }
  else
  {
    id v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_DEBUG, "no completion handler providd.", buf, 2u);
    }
  }
}

void __73__NEHotspotConfigurationManager_getConfiguredSSIDsWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__NEHotspotConfigurationManager_getConfiguredSSIDsWithCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E59936F8;
  id v7 = v4;
  id v8 = *(id *)(a1 + 32);
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __73__NEHotspotConfigurationManager_getConfiguredSSIDsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else {
    char v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  }

  return v2();
}

- (void)removeConfigurationForHS20DomainName:(NSString *)domainName
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = domainName;
  id v4 = +[NEHotspotConfigurationHelper sharedManager]();
  id v5 = v4;
  if (v4)
  {
    -[NEHotspotConfigurationHelper sendRequest:requestType:resultHandler:](v4, v3, 1, 0);
  }
  else
  {
    id v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = (id)objc_opt_class();
      id v7 = v9;
      _os_log_error_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_ERROR, "%@ failed to instantiate hotspot configuration helper.", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)removeConfigurationForSSID:(NSString *)SSID
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = SSID;
  id v4 = +[NEHotspotConfigurationHelper sharedManager]();
  id v5 = v4;
  if (v4)
  {
    -[NEHotspotConfigurationHelper sendRequest:requestType:resultHandler:](v4, v3, 1, 0);
  }
  else
  {
    id v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = (id)objc_opt_class();
      id v7 = v9;
      _os_log_error_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_ERROR, "%@ failed to instantiate hotspot configuration helper.", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)applyConfiguration:(NEHotspotConfiguration *)configuration completionHandler:(void *)completionHandler
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = configuration;
  id v7 = completionHandler;
  uint64_t v8 = [(NEHotspotConfiguration *)v6 validate];
  if (v8 != 100)
  {
    uint64_t v15 = v8;
    id v16 = self;
LABEL_11:
    -[NEHotspotConfigurationManager reportError:completionHandler:]((uint64_t)v16, v15, v7);
    goto LABEL_17;
  }
  if (!self) {
    goto LABEL_8;
  }
  id v9 = (objc_class *)MEMORY[0x1E4F28DB0];
  uint64_t v10 = v6;
  uint64_t v11 = (void *)[[v9 alloc] initRequiringSecureCoding:1];
  [v11 encodeObject:v10 forKey:@"NEHotspotConfigurationKey"];

  [v11 finishEncoding];
  uint64_t v12 = [v11 encodedData];

  if (!v12)
  {
LABEL_8:
    id v17 = ne_log_obj();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = (id)objc_opt_class();
      id v19 = v24;
      _os_log_error_impl(&dword_19DDAF000, v17, OS_LOG_TYPE_ERROR, "%@ failed to serialize configuration object", buf, 0xCu);
    }
    id v16 = self;
    uint64_t v15 = 107;
    goto LABEL_11;
  }
  uint64_t v13 = +[NEHotspotConfigurationHelper sharedManager]();
  uint64_t v14 = v13;
  if (v13)
  {
    if (v7)
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __70__NEHotspotConfigurationManager_applyConfiguration_completionHandler___block_invoke;
      v21[3] = &unk_1E598FF70;
      v21[4] = self;
      id v22 = v7;
      -[NEHotspotConfigurationHelper sendRequest:requestType:resultHandler:](v14, v12, 0, v21);
    }
    else
    {
      -[NEHotspotConfigurationHelper sendRequest:requestType:resultHandler:](v13, v12, 0, 0);
    }
  }
  else
  {
    int v18 = ne_log_obj();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = (id)objc_opt_class();
      id v20 = v24;
      _os_log_error_impl(&dword_19DDAF000, v18, OS_LOG_TYPE_ERROR, "%@ failed to instantiate hotspot configuration helper.", buf, 0xCu);
    }
    -[NEHotspotConfigurationManager reportError:completionHandler:]((uint64_t)self, 107, v7);
  }

LABEL_17:
}

void __70__NEHotspotConfigurationManager_applyConfiguration_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = ne_log_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412546;
    id v7 = (id)objc_opt_class();
    __int16 v8 = 2048;
    uint64_t v9 = a2;
    id v5 = v7;
    _os_log_debug_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_DEBUG, "%@ received result code %lld", (uint8_t *)&v6, 0x16u);
  }
  -[NEHotspotConfigurationManager reportError:completionHandler:](*(void *)(a1 + 32), a2, *(void **)(a1 + 40));
}

+ (NEHotspotConfigurationManager)sharedManager
{
  if (sharedManager_init_manager_7681 != -1) {
    dispatch_once(&sharedManager_init_manager_7681, &__block_literal_global_7682);
  }
  char v2 = (void *)sharedManager_g_manager_7683;

  return (NEHotspotConfigurationManager *)v2;
}

uint64_t __46__NEHotspotConfigurationManager_sharedManager__block_invoke()
{
  sharedManager_g_manager_7683 = objc_alloc_init(NEHotspotConfigurationManager);

  return MEMORY[0x1F41817F8]();
}

@end