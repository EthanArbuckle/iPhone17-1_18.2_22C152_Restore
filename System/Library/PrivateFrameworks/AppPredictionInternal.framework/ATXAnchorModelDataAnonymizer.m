@interface ATXAnchorModelDataAnonymizer
+ (BOOL)isFirstPartyApp:(id)a3;
+ (BOOL)shouldAnonymizeActionType:(id)a3 forBundleId:(id)a4;
+ (BOOL)shouldAnonymizeBundle:(id)a3;
+ (id)readDeviceSpecificSalt;
+ (id)setSaltToUserDefaults:(id)a3 scheme:(id)a4;
+ (void)_hashAndSaltActionKeyMetadataIfNeededInList:(id)a3 withSalt:(id)a4;
+ (void)anonymizeMessage:(id)a3;
@end

@implementation ATXAnchorModelDataAnonymizer

+ (void)anonymizeMessage:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = __atxlog_handle_default();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "Anchor Model Data Collection: starting anonymization procedure for log entry message...", buf, 2u);
  }

  v6 = [(id)objc_opt_class() readDeviceSpecificSalt];
  v7 = [v4 anchor];
  v8 = [v7 anchorEventIdentifier];
  v9 = _ATXAnchorModelSha256Hash(v8, v6);
  v10 = [v4 anchor];
  [v10 setAnchorEventIdentifier:v9];

  v11 = [v4 anchor];
  v12 = [v11 locationIdentifier];
  v13 = _ATXAnchorModelSha256Hash(v12, v6);
  v14 = [v4 anchor];
  [v14 setLocationIdentifier:v13];

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v15 = [v4 positiveAppLaunches];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v43;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v43 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v42 + 1) + 8 * v19);
        v21 = objc_opt_class();
        v22 = [v20 bundleId];
        LODWORD(v21) = [v21 shouldAnonymizeBundle:v22];

        if (v21)
        {
          v23 = [v20 bundleId];
          v24 = _ATXAnchorModelSha256Hash(v23, v6);
          [v20 setBundleId:v24];
        }
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v17);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v25 = objc_msgSend(v4, "negativeAppLaunches", 0);
  uint64_t v26 = [v25 countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v39;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v39 != v28) {
          objc_enumerationMutation(v25);
        }
        v30 = *(void **)(*((void *)&v38 + 1) + 8 * v29);
        v31 = objc_opt_class();
        v32 = [v30 bundleId];
        LODWORD(v31) = [v31 shouldAnonymizeBundle:v32];

        if (v31)
        {
          v33 = [v30 bundleId];
          v34 = _ATXAnchorModelSha256Hash(v33, v6);
          [v30 setBundleId:v34];
        }
        ++v29;
      }
      while (v27 != v29);
      uint64_t v27 = [v25 countByEnumeratingWithState:&v38 objects:v47 count:16];
    }
    while (v27);
  }

  v35 = [v4 positiveActions];
  [a1 _hashAndSaltActionKeyMetadataIfNeededInList:v35 withSalt:v6];

  v36 = [v4 negativeActions];
  [a1 _hashAndSaltActionKeyMetadataIfNeededInList:v36 withSalt:v6];

  v37 = __atxlog_handle_default();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v37, OS_LOG_TYPE_DEFAULT, "Anchor Model Data Collection: finished anonymization procedure for log entry message.", buf, 2u);
  }
}

+ (void)_hashAndSaltActionKeyMetadataIfNeededInList:(id)a3 withSalt:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v5;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v12 = [v11 appLaunchMetadata];
        v13 = [v12 bundleId];

        v14 = [v11 actionKeyMetadata];
        v15 = [v14 actionType];

        if ([(id)objc_opt_class() shouldAnonymizeBundle:v13])
        {
          uint64_t v16 = _ATXAnchorModelSha256Hash(v13, v6);
          uint64_t v17 = [v11 appLaunchMetadata];
          [v17 setBundleId:v16];
        }
        if ([(id)objc_opt_class() shouldAnonymizeActionType:v15 forBundleId:v13])
        {
          uint64_t v18 = _ATXAnchorModelSha256Hash(v15, v6);
          uint64_t v19 = [v11 actionKeyMetadata];
          [v19 setActionType:v18];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }
}

+ (BOOL)isFirstPartyApp:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x1E4F4AF00] isSystemAppForBundleId:v3]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 hasPrefix:@"com.apple."];
  }

  return v4;
}

+ (BOOL)shouldAnonymizeBundle:(id)a3
{
  id v4 = a3;
  if ([a1 isFirstPartyApp:v4])
  {
    BOOL v5 = 0;
  }
  else
  {
    id v6 = +[_ATXGlobals sharedInstance];
    uint64_t v7 = [v6 whitelistedBundlesForAnchorModelLogging];
    uint64_t v8 = [v7 objectForKey:v4];
    BOOL v5 = v8 == 0;
  }
  return v5;
}

+ (BOOL)shouldAnonymizeActionType:(id)a3 forBundleId:(id)a4
{
  id v6 = a3;
  if ([a1 isFirstPartyApp:a4])
  {
    BOOL v7 = 0;
  }
  else
  {
    uint64_t v8 = +[_ATXGlobals sharedInstance];
    uint64_t v9 = [v8 whitelistedActionTypesForAnchorModelLogging];
    v10 = [v9 objectForKey:v6];
    BOOL v11 = v10 == 0;

    v12 = [v8 approvedSiriKitIntents];
    char v13 = [v12 containsObject:v6];

    BOOL v7 = v11 & ~v13;
  }

  return v7;
}

+ (id)setSaltToUserDefaults:(id)a3 scheme:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = [MEMORY[0x1E4F1CA58] dataWithLength:32];
  uint64_t v8 = (const __SecRandom *)*MEMORY[0x1E4F3BC60];
  id v9 = v7;
  if (SecRandomCopyBytes(v8, 0x20uLL, (void *)[v9 mutableBytes]))
  {
  }
  else
  {
    BOOL v11 = [MEMORY[0x1E4F1C9B8] dataWithData:v9];

    if (v11)
    {
      [v5 setObject:v11 forKey:v6];
      goto LABEL_8;
    }
  }
  v10 = __atxlog_handle_default();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
    +[ATXAnchorModelDataAnonymizer setSaltToUserDefaults:scheme:](v10);
  }

  BOOL v11 = 0;
LABEL_8:

  return v11;
}

+ (id)readDeviceSpecificSalt
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB18]);
  id v3 = (void *)[v2 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  id v4 = [v3 dataForKey:@"ATXAnchorModelOfflineDataHarvesterDeviceSpecificSalt"];
  if (!v4)
  {
    id v4 = [(id)objc_opt_class() setSaltToUserDefaults:v3 scheme:@"ATXAnchorModelOfflineDataHarvesterDeviceSpecificSalt"];
    id v5 = __atxlog_handle_default();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)BOOL v7 = 0;
      _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_INFO, "Anchor Model Data Collection: Created a new salt for data collection.", v7, 2u);
    }
  }
  return v4;
}

+ (void)setSaltToUserDefaults:(os_log_t)log scheme:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "Anchor Model Data Collection: Tried to generate a salt for data collection, but got back an empty NSData object", v1, 2u);
}

@end