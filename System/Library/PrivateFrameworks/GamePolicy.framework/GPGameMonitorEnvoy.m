@interface GPGameMonitorEnvoy
+ (BOOL)applicationIsIdentifiedGame:(id)a3 info:(id)a4 entitlements:(id)a5;
+ (BOOL)deviceSupportsGamePolicy;
+ (id)gameCategories;
+ (id)gameModeBundleIdentifierAllowList;
+ (id)shared;
+ (id)sharedInstance;
- (GPGameMonitorEnvoy)init;
- (void)gameDidLaunch:(id)a3;
@end

@implementation GPGameMonitorEnvoy

- (void)gameDidLaunch:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (+[GPGameMonitorEnvoy deviceSupportsGamePolicy])
  {
    if (gp_isInternalBuild())
    {
      v4 = getGPLogger();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        int v5 = 138412290;
        id v6 = v3;
        _os_log_impl(&dword_24F921000, v4, OS_LOG_TYPE_INFO, "[GPGameMonitorEnvoy] gameDidLaunch: %@", (uint8_t *)&v5, 0xCu);
      }
    }
    notify_post((const char *)[@"com.apple.gamepolicy.daemon.launch" UTF8String]);
  }
}

+ (BOOL)deviceSupportsGamePolicy
{
  if (deviceSupportsGamePolicy_onceToken != -1) {
    dispatch_once(&deviceSupportsGamePolicy_onceToken, &__block_literal_global_3_0);
  }
  return deviceSupportsGamePolicy__deviceSupportsGamePolicy;
}

+ (id)sharedInstance
{
  if (sharedInstance__onceToken != -1) {
    dispatch_once(&sharedInstance__onceToken, &__block_literal_global_2);
  }
  v2 = (void *)sharedInstance__sharedMonitor;
  return v2;
}

+ (id)shared
{
  return +[GPGameMonitorEnvoy sharedInstance];
}

uint64_t __36__GPGameMonitorEnvoy_sharedInstance__block_invoke()
{
  sharedInstance__sharedMonitor = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

uint64_t __46__GPGameMonitorEnvoy_deviceSupportsGamePolicy__block_invoke()
{
  if (_os_feature_enabled_impl()) {
    uint64_t result = 1;
  }
  else {
    uint64_t result = MGIsDeviceOneOfType();
  }
  deviceSupportsGamePolicy__deviceSupportsGamePolicy = result;
  return result;
}

+ (id)gameCategories
{
  if (gameCategories_onceToken != -1) {
    dispatch_once(&gameCategories_onceToken, &__block_literal_global_30);
  }
  v2 = (void *)gameCategories__gameCategories;
  return v2;
}

void __36__GPGameMonitorEnvoy_gameCategories__block_invoke()
{
  v12[20] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F01928];
  v12[0] = *MEMORY[0x263F01970];
  v12[1] = v0;
  uint64_t v1 = *MEMORY[0x263F01938];
  v12[2] = *MEMORY[0x263F01930];
  v12[3] = v1;
  uint64_t v2 = *MEMORY[0x263F01948];
  v12[4] = *MEMORY[0x263F01940];
  v12[5] = v2;
  uint64_t v3 = *MEMORY[0x263F01958];
  v12[6] = *MEMORY[0x263F01950];
  v12[7] = v3;
  uint64_t v4 = *MEMORY[0x263F01968];
  v12[8] = *MEMORY[0x263F01960];
  v12[9] = v4;
  uint64_t v5 = *MEMORY[0x263F01980];
  v12[10] = *MEMORY[0x263F01978];
  v12[11] = v5;
  uint64_t v6 = *MEMORY[0x263F01990];
  v12[12] = *MEMORY[0x263F01988];
  v12[13] = v6;
  uint64_t v7 = *MEMORY[0x263F019A0];
  v12[14] = *MEMORY[0x263F01998];
  v12[15] = v7;
  uint64_t v8 = *MEMORY[0x263F019B0];
  v12[16] = *MEMORY[0x263F019A8];
  v12[17] = v8;
  uint64_t v9 = *MEMORY[0x263F019C0];
  v12[18] = *MEMORY[0x263F019B8];
  v12[19] = v9;
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:20];
  v11 = (void *)gameCategories__gameCategories;
  gameCategories__gameCategories = v10;
}

+ (id)gameModeBundleIdentifierAllowList
{
  if (gameModeBundleIdentifierAllowList_onceToken != -1) {
    dispatch_once(&gameModeBundleIdentifierAllowList_onceToken, &__block_literal_global_33);
  }
  uint64_t v2 = (void *)gameModeBundleIdentifierAllowList__gameModeBundleIdentifierAllowList;
  return v2;
}

void __55__GPGameMonitorEnvoy_gameModeBundleIdentifierAllowList__block_invoke()
{
  uint64_t v0 = (void *)gameModeBundleIdentifierAllowList__gameModeBundleIdentifierAllowList;
  gameModeBundleIdentifierAllowList__gameModeBundleIdentifierAllowList = (uint64_t)&unk_2701134F0;
}

+ (BOOL)applicationIsIdentifiedGame:(id)a3 info:(id)a4 entitlements:(id)a5
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = [v7 genreID];
  int v10 = [v9 unsignedIntValue];

  BOOL v11 = 1;
  if (v10 != 6014 && (v10 - 7001) >= 0x11)
  {
    v12 = [v7 correspondingApplicationRecord];
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    v13 = [a1 gameModeBundleIdentifierAllowList];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v56 objects:v62 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v57;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v57 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v56 + 1) + 8 * i);
          v19 = [v12 bundleIdentifier];
          LOBYTE(v18) = [v19 isEqual:v18];

          if (v18)
          {

            goto LABEL_20;
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v56 objects:v62 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    if (!v10)
    {
      id v55 = 0;
      v27 = [v12 categoryTypesWithError:&v55];
      id v46 = v55;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v28 = v27;
      uint64_t v43 = [v28 countByEnumeratingWithState:&v51 objects:v61 count:16];
      if (v43)
      {
        uint64_t v29 = *(void *)v52;
        unint64_t v30 = 0x26533D000uLL;
        v45 = v28;
        uint64_t v42 = *(void *)v52;
        do
        {
          uint64_t v31 = 0;
          do
          {
            if (*(void *)v52 != v29) {
              objc_enumerationMutation(v28);
            }
            uint64_t v44 = v31;
            v32 = *(void **)(*((void *)&v51 + 1) + 8 * v31);
            long long v47 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            long long v50 = 0u;
            v33 = [*(id *)(v30 + 1856) gameCategories];
            uint64_t v34 = [v33 countByEnumeratingWithState:&v47 objects:v60 count:16];
            if (v34)
            {
              uint64_t v35 = v34;
              uint64_t v36 = *(void *)v48;
              while (2)
              {
                for (uint64_t j = 0; j != v35; ++j)
                {
                  if (*(void *)v48 != v36) {
                    objc_enumerationMutation(v33);
                  }
                  uint64_t v38 = *(void *)(*((void *)&v47 + 1) + 8 * j);
                  v39 = [v32 identifier];
                  LOBYTE(v38) = [v39 isEqual:v38];

                  if (v38)
                  {

                    goto LABEL_20;
                  }
                }
                uint64_t v35 = [v33 countByEnumeratingWithState:&v47 objects:v60 count:16];
                if (v35) {
                  continue;
                }
                break;
              }
            }

            uint64_t v31 = v44 + 1;
            id v28 = v45;
            uint64_t v29 = v42;
            unint64_t v30 = 0x26533D000;
          }
          while (v44 + 1 != v43);
          uint64_t v43 = [v45 countByEnumeratingWithState:&v51 objects:v61 count:16];
        }
        while (v43);
      }
    }
    if ([v8 BOOLForKey:@"com.apple.developer.sustained-execution"]) {
      goto LABEL_20;
    }
    if ([v8 BOOLForKey:@"com.apple.developer.kernel.increased-memory-limit"]) {
      goto LABEL_20;
    }
    if ([v8 BOOLForKey:@"com.apple.developer.kernel.increased-debugging-memory-limit"]) {
      goto LABEL_20;
    }
    v20 = [v7 requiredDeviceCapabilities];
    char v21 = [v20 containsObject:@"iphone-performance-gaming-tier"];

    if (v21) {
      goto LABEL_20;
    }
    v22 = [v12 infoDictionary];
    v23 = [v22 objectForKey:@"GCSupportsGameMode" ofClass:objc_opt_class()];

    if (v23) {
      goto LABEL_20;
    }
    v24 = [v7 sdkVersion];
    uint64_t v25 = [v24 compare:@"18.0" options:64];

    if (v25 != -1) {
      goto LABEL_18;
    }
    v40 = [v12 infoDictionary];
    v41 = [v40 objectForKey:@"GCSupportsControllerUserInteraction" ofClass:objc_opt_class()];

    if (v41) {
LABEL_20:
    }
      BOOL v11 = 1;
    else {
LABEL_18:
    }
      BOOL v11 = 0;
  }
  return v11;
}

- (GPGameMonitorEnvoy)init
{
  v3.receiver = self;
  v3.super_class = (Class)GPGameMonitorEnvoy;
  return [(GPGameMonitorEnvoy *)&v3 init];
}

@end