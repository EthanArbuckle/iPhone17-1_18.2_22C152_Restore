@interface _DKSync3Policy
+ (BOOL)cloudSyncDisabled;
+ (BOOL)rapportSyncDisabled;
+ (id)computePolicyDictionaryWithDefaultSyncPolicyDict:(id)a3 syncPolicyOverridesDict:(id)a4 topLevelDefaultsPolicy:(id)a5;
+ (id)computedPolicyDictionary;
+ (id)configurationPlistForFilename:(id)a3;
+ (id)disabledPolicy;
+ (id)policyCache;
+ (id)productVersion;
+ (id)syncPolicyConfigPathForFilename:(id)a3;
+ (id)userDefaults;
+ (void)_possiblyAddToArray:(id)a3 ifTransport:(int64_t)a4 existsInTransports:(int64_t)a5;
+ (void)addToDictionary:(id)a3 streamNamesToAlwaysSync:(id)a4;
+ (void)fillPolicyCache:(id)a3 bySplittingPolicyDictionary:(id)a4;
+ (void)handleDownloadSyncPolicyResponse:(id)a3 data:(id)a4 error:(id)a5;
+ (void)overrideDictionary:(id)a3 withOverrides:(id)a4;
+ (void)possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays:(unint64_t)a3;
- (BOOL)_anyFeaturePropertyValueWithKey:(id)a3 getterBlock:(id)a4;
- (NSDictionary)properties;
- (_DKSync3Policy)init;
- (id)description;
- (uint64_t)periodicSyncCadenceInMinutesMinimumValue;
- (unint64_t)_maximumPropertyValueWithKey:(id)a3 policies:(id)a4 skipZeroValues:(BOOL)a5;
- (unint64_t)_minimumPropertyValueWithKey:(id)a3 policies:(id)a4 skipZeroValues:(BOOL)a5;
- (unint64_t)minimumTimeBetweenSyncsInSecondsMaximumValue;
- (void)setProperties:(id)a3;
@end

@implementation _DKSync3Policy

+ (id)policyCache
{
  self;
  if (policyCache_onceToken_0 != -1) {
    dispatch_once(&policyCache_onceToken_0, &__block_literal_global_934);
  }
  v0 = (void *)policyCache_policyCache_0;
  return v0;
}

+ (id)disabledPolicy
{
  if (disabledPolicy_onceToken != -1) {
    dispatch_once(&disabledPolicy_onceToken, &__block_literal_global_33);
  }
  v2 = (void *)disabledPolicy_policy;
  return v2;
}

+ (id)computedPolicyDictionary
{
  v3 = +[_DKSync3Policy configurationPlistForFilename:@"Policies/com.apple.coreduet.knowledge.syncPolicies3.plist"];
  v4 = [a1 userDefaults];
  v5 = [v4 objectForKey:@"Sync3Policies"];

  v6 = [a1 userDefaults];
  v7 = [v6 objectForKey:@"Sync3Policy"];

  v8 = [a1 computePolicyDictionaryWithDefaultSyncPolicyDict:v3 syncPolicyOverridesDict:v5 topLevelDefaultsPolicy:v7];

  return v8;
}

+ (id)computePolicyDictionaryWithDefaultSyncPolicyDict:(id)a3 syncPolicyOverridesDict:(id)a4 topLevelDefaultsPolicy:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v11 = [v8 mutableCopy];
  }
  else {
    uint64_t v11 = objc_opt_new();
  }
  v12 = (void *)v11;
  v13 = [v8 objectForKeyedSubscript:@"Version"];
  [v13 floatValue];
  float v15 = v14;

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v16 = [v9 objectForKeyedSubscript:@"Version"];
    if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) || ([v16 floatValue], v17 < v15))
    {
      v18 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = [(id)objc_opt_class() description];
        int v26 = 138543362;
        v27 = v19;
        _os_log_impl(&dword_18ECEB000, v18, OS_LOG_TYPE_INFO, "%{public}@: Sync policy is invalid and/or old, removing saved policies from default", (uint8_t *)&v26, 0xCu);
      }
      if (!+[_DKCloudUtilities isUnitTesting])
      {
        v20 = [a1 userDefaults];
        [v20 removeObjectForKey:@"Sync3Policies"];
      }
      id v9 = (id)MEMORY[0x1E4F1CC08];
    }
    if ([v9 count])
    {
      v21 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        +[_DKSync3Policy computePolicyDictionaryWithDefaultSyncPolicyDict:syncPolicyOverridesDict:topLevelDefaultsPolicy:]();
      }

      [a1 overrideDictionary:v12 withOverrides:v9];
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v10 count])
  {
    v22 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      +[_DKSync2Policy _policyForSyncTransportType:]();
    }

    [a1 overrideDictionary:v12 withOverrides:v10];
    v23 = [v10 objectForKeyedSubscript:@"StreamNamesToAlwaysSync"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v23 count]) {
      [a1 addToDictionary:v12 streamNamesToAlwaysSync:v23];
    }
  }
  if (![v12 count]) {
    [v12 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"SyncDisabled"];
  }
  v24 = (void *)[v12 copy];

  return v24;
}

+ (void)overrideDictionary:(id)a3 withOverrides:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v36 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v23;
    *(void *)&long long v8 = 138544386;
    long long v19 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        v13 = objc_msgSend(v5, "objectForKeyedSubscript:", v12, v19);
        float v14 = [v6 objectForKeyedSubscript:v12];
        if (v13
          && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
           || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
          {
            id v15 = v14;
            v16 = (void *)[v13 mutableCopy];
            [v16 addEntriesFromDictionary:v15];

            [v5 setObject:v16 forKeyedSubscript:v12];
          }
          else
          {
            float v17 = +[_CDLogging syncChannel];
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              v21 = [(id)objc_opt_class() description];
              uint64_t v20 = objc_opt_class();
              uint64_t v18 = objc_opt_class();
              *(_DWORD *)buf = v19;
              v27 = v21;
              __int16 v28 = 2114;
              uint64_t v29 = v12;
              __int16 v30 = 2114;
              uint64_t v31 = v20;
              __int16 v32 = 2114;
              uint64_t v33 = v18;
              __int16 v34 = 2112;
              id v35 = v5;
              _os_log_error_impl(&dword_18ECEB000, v17, OS_LOG_TYPE_ERROR, "%{public}@: Ignoring override due to type mismatch for key %{public}@ (%{public}@ vs. %{public}@: %@", buf, 0x34u);
            }
          }
        }
        else
        {
          [v5 setObject:v14 forKeyedSubscript:v12];
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v22 objects:v36 count:16];
    }
    while (v9);
  }
}

+ (void)addToDictionary:(id)a3 streamNamesToAlwaysSync:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v33 = a4;
  __int16 v32 = objc_opt_new();
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v44;
    uint64_t v30 = *(void *)v44;
    id v31 = v6;
    do
    {
      uint64_t v10 = 0;
      uint64_t v34 = v8;
      do
      {
        if (*(void *)v44 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v43 + 1) + 8 * v10);
        uint64_t v12 = [v6 objectForKeyedSubscript:v11];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v13 = [v12 objectForKeyedSubscript:@"StreamNames"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            float v14 = (void *)[v13 mutableCopy];
            long long v39 = 0u;
            long long v40 = 0u;
            long long v41 = 0u;
            long long v42 = 0u;
            id v15 = v33;
            uint64_t v16 = [v15 countByEnumeratingWithState:&v39 objects:v48 count:16];
            if (v16)
            {
              uint64_t v17 = v16;
              uint64_t v18 = *(void *)v40;
              do
              {
                for (uint64_t i = 0; i != v17; ++i)
                {
                  if (*(void *)v40 != v18) {
                    objc_enumerationMutation(v15);
                  }
                  uint64_t v20 = *(void *)(*((void *)&v39 + 1) + 8 * i);
                  if (([v14 containsObject:v20] & 1) == 0) {
                    [v14 addObject:v20];
                  }
                }
                uint64_t v17 = [v15 countByEnumeratingWithState:&v39 objects:v48 count:16];
              }
              while (v17);
            }

            [v32 setObject:v14 forKeyedSubscript:v11];
            uint64_t v9 = v30;
            id v6 = v31;
            uint64_t v8 = v34;
          }
        }
        ++v10;
      }
      while (v10 != v8);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v8);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v21 = v32;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v35 objects:v47 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v36 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void *)(*((void *)&v35 + 1) + 8 * j);
        v27 = [v21 objectForKeyedSubscript:v26];
        __int16 v28 = [v6 objectForKeyedSubscript:v26];
        uint64_t v29 = (void *)[v28 mutableCopy];
        [v29 setObject:v27 forKeyedSubscript:@"StreamNames"];
        [v6 setObject:v29 forKeyedSubscript:v26];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v35 objects:v47 count:16];
    }
    while (v23);
  }
}

+ (void)fillPolicyCache:(id)a3 bySplittingPolicyDictionary:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v5 = a4;
  long long v25 = objc_opt_new();
  uint64_t v24 = objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v29;
    id v26 = v6;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v28 + 1) + 8 * v10);
        uint64_t v12 = [v6 objectForKeyedSubscript:v11];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v13 = v8;
          float v14 = v12;
          id v15 = [v14 objectForKeyedSubscript:@"Feature"];
          if (v15)
          {
            uint64_t v16 = -[_DKSync3FeaturePolicy initWithName:properties:]((id *)[_DKSync3FeaturePolicy alloc], v11, v14);
            [v27 setObject:v16 forKey:v11];
            [v25 addObject:v15];
            uint64_t v17 = [v27 objectForKey:v15];
            if (!v17)
            {
              uint64_t v17 = objc_opt_new();
              [v27 setObject:v17 forKey:v15];
            }
            uint64_t v18 = v17;
            long long v19 = v16;
LABEL_15:
            [v18 addObject:v19];
          }
          else
          {
            uint64_t v16 = [v14 objectForKeyedSubscript:@"Transport"];
            if (v16)
            {
              uint64_t v17 = -[_DKSync3TransportPolicy initWithName:properties:]((id *)[_DKSync3TransportPolicy alloc], v11, v14);
              [v27 setObject:v17 forKey:v11];
              uint64_t v18 = v24;
              long long v19 = v11;
              goto LABEL_15;
            }
            uint64_t v17 = +[_CDLogging syncChannel];
            if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
            {
              id v21 = [(id)objc_opt_class() description];
              *(_DWORD *)buf = 138543618;
              id v33 = v21;
              __int16 v34 = 2112;
              long long v35 = v14;
              _os_log_fault_impl(&dword_18ECEB000, v17, OS_LOG_TYPE_FAULT, "%{public}@: Ignoring unrecognized policy dictionary: %@", buf, 0x16u);
            }
          }

          uint64_t v8 = v13;
          id v6 = v26;
          goto LABEL_17;
        }
        float v14 = +[_CDLogging syncChannel];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v20 = [(id)objc_opt_class() description];
          *(_DWORD *)buf = 138543618;
          id v33 = v20;
          __int16 v34 = 2112;
          long long v35 = v12;
          _os_log_debug_impl(&dword_18ECEB000, v14, OS_LOG_TYPE_DEBUG, "%{public}@: Ignoring unrecognized policy object: %@", buf, 0x16u);
        }
LABEL_17:

        ++v10;
      }
      while (v8 != v10);
      uint64_t v22 = [v6 countByEnumeratingWithState:&v28 objects:v36 count:16];
      uint64_t v8 = v22;
    }
    while (v22);
  }

  [v27 setObject:v25 forKey:@"_DKSync3PolicyAllFeatures"];
  [v27 setObject:v24 forKey:@"_DKSync3PolicyAllTransports"];
  uint64_t v23 = [v27 debugDescription];
  NSLog(&cfstr_Policycache.isa, v23);
}

+ (id)productVersion
{
  v2 = (void *)_CFCopySystemVersionDictionary();
  if (v2)
  {
    v3 = v2;
    v4 = [v2 objectForKey:*MEMORY[0x1E4F1CD30]];
    CFRelease(v3);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)userDefaults
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.CoreDuet"];
  return v2;
}

+ (BOOL)rapportSyncDisabled
{
  v2 = [a1 userDefaults];
  v3 = [v2 objectForKey:@"Sync3Policy"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 objectForKeyedSubscript:@"RapportSyncDisabled"];
    char v5 = [v4 BOOLValue];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)cloudSyncDisabled
{
  v2 = [a1 userDefaults];
  v3 = [v2 objectForKey:@"Sync3Policy"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 objectForKeyedSubscript:@"CloudSyncDisabled"];
    char v5 = [v4 BOOLValue];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (void)possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays:(unint64_t)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77___DKSync3Policy_possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays___block_invoke;
  block[3] = &unk_1E560D4A8;
  v4 = @"com.apple.coreduet.sync-policy.policy-download";
  id v5 = a1;
  unint64_t v6 = a3;
  if (possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays__initialized_0 != -1) {
    dispatch_once(&possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays__initialized_0, block);
  }
}

+ (void)handleDownloadSyncPolicyResponse:(id)a3 data:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    uint64_t v11 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      +[_DKSync2Policy handleDownloadSyncPolicyResponse:data:error:].cold.4();
    }

    goto LABEL_5;
  }
  if ([v8 statusCode] != 200)
  {
    if ([v8 statusCode] != 204
      && [v8 statusCode] != 205
      && [v8 statusCode] != 404
      && [v8 statusCode] != 410)
    {
      goto LABEL_5;
    }
    uint64_t v12 = objc_opt_new();
    if (!v12) {
      goto LABEL_5;
    }
LABEL_19:
    uint64_t v13 = +[_DKSync3Policy userDefaults];
    uint64_t v16 = [v13 objectForKey:@"Sync3Policies"];
    uint64_t v17 = v16;
    if (v16) {
      id v18 = v16;
    }
    else {
      id v18 = (id)objc_opt_new();
    }
    long long v19 = v18;

    [v13 setValue:v12 forKey:@"Sync3Policies"];
    uint64_t v20 = [MEMORY[0x1E4F1C9C8] date];
    [v13 setValue:v20 forKey:@"CloudSyncPoliciesLastModified"];

    if (([v12 isEqualToDictionary:v19] & 1) == 0)
    {
      id v21 = +[_DKSync3Policy policyCache]();
      [v21 removeAllObjects];

      uint64_t v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v22 postNotificationName:@"_DKSync3PolicyDidChangeNotification" object:a1 userInfo:0];
    }
    goto LABEL_25;
  }
  id v23 = 0;
  uint64_t v12 = [MEMORY[0x1E4F28F98] propertyListWithData:v9 options:0 format:0 error:&v23];
  id v14 = v23;
  if (!v12)
  {
    id v15 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      +[_DKSync2Policy handleDownloadSyncPolicyResponse:data:error:]();
    }
  }
  if (v12) {
    goto LABEL_19;
  }
LABEL_5:
  if ([v8 statusCode] == 304)
  {
    uint64_t v12 = +[_DKSync3Policy userDefaults];
    uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
    [v12 setValue:v13 forKey:@"CloudSyncPoliciesLastModified"];
LABEL_25:
  }
}

+ (id)syncPolicyConfigPathForFilename:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28B50];
  id v4 = a3;
  id v5 = [v3 bundleForClass:objc_opt_class()];
  unint64_t v6 = [v5 pathForResource:v4 ofType:0];

  return v6;
}

+ (id)configurationPlistForFilename:(id)a3
{
  id v4 = a3;
  id v5 = [a1 syncPolicyConfigPathForFilename:v4];
  if (!v5)
  {
    unint64_t v6 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[_DKSync3Policy configurationPlistForFilename:]();
    }
    goto LABEL_9;
  }
  unint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v5];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v7 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[_DKSync3Policy configurationPlistForFilename:]();
    }

LABEL_9:
    unint64_t v6 = 0;
  }

  return v6;
}

- (_DKSync3Policy)init
{
  v3.receiver = self;
  v3.super_class = (Class)_DKSync3Policy;
  result = [(_DKSync3Policy *)&v3 init];
  if (result) {
    result->_syncDisabled = 1;
  }
  return result;
}

+ (void)_possiblyAddToArray:(id)a3 ifTransport:(int64_t)a4 existsInTransports:(int64_t)a5
{
  id v7 = a3;
  if ((a5 & a4) != 0)
  {
    id v8 = +[_DKSyncPeerStatusTracker stringForTransports:a4];
    id v9 = +[_DKSync3Policy policyCache]();
    uint64_t v10 = [v9 objectForKey:v8];
    uint64_t v11 = (void *)v10;
    if (v10)
    {
      if (!*(unsigned char *)(v10 + 8))
      {
        [v7 addObject:v10];
        goto LABEL_10;
      }
      uint64_t v12 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        +[_DKSync3Policy _possiblyAddToArray:ifTransport:existsInTransports:]();
      }
    }
    else
    {
      uint64_t v12 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        +[_DKSync3Policy _possiblyAddToArray:ifTransport:existsInTransports:]();
      }
    }

LABEL_10:
  }
}

- (unint64_t)_minimumPropertyValueWithKey:(id)a3 policies:(id)a4 skipZeroValues:(BOOL)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    unint64_t v11 = 0;
    uint64_t v12 = *(void *)v25;
    char v13 = 1;
    *(void *)&long long v9 = 138543618;
    long long v21 = v9;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v7);
        }
        id v15 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "properties", v21);
        uint64_t v16 = [v15 objectForKeyedSubscript:v6];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unint64_t v17 = [v16 unsignedIntegerValue];
          if (v17 >= v11) {
            unint64_t v18 = v11;
          }
          else {
            unint64_t v18 = v17;
          }
          if (v13) {
            unint64_t v18 = v17;
          }
          v13 &= v17 == 0 && a5;
          if (v17 != 0 || !a5) {
            unint64_t v11 = v18;
          }
        }
        else if (v16)
        {
          long long v19 = +[_CDLogging syncChannel];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            uint64_t v22 = [(id)objc_opt_class() description];
            *(_DWORD *)buf = v21;
            long long v29 = v22;
            __int16 v30 = 2114;
            id v31 = v6;
            _os_log_error_impl(&dword_18ECEB000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Invalid non-number type for key %{public}@", buf, 0x16u);
          }
        }
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v10);
  }
  else
  {
    unint64_t v11 = 0;
  }

  return v11;
}

- (unint64_t)_maximumPropertyValueWithKey:(id)a3 policies:(id)a4 skipZeroValues:(BOOL)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    unint64_t v11 = 0;
    uint64_t v12 = *(void *)v25;
    char v13 = 1;
    *(void *)&long long v9 = 138543618;
    long long v21 = v9;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v7);
        }
        id v15 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "properties", v21);
        uint64_t v16 = [v15 objectForKeyedSubscript:v6];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unint64_t v17 = [v16 unsignedIntegerValue];
          if (v17 <= v11) {
            unint64_t v18 = v11;
          }
          else {
            unint64_t v18 = v17;
          }
          if (v13) {
            unint64_t v18 = v17;
          }
          v13 &= v17 == 0 && a5;
          if (v17 != 0 || !a5) {
            unint64_t v11 = v18;
          }
        }
        else if (v16)
        {
          long long v19 = +[_CDLogging syncChannel];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            uint64_t v22 = [(id)objc_opt_class() description];
            *(_DWORD *)buf = v21;
            long long v29 = v22;
            __int16 v30 = 2114;
            id v31 = v6;
            _os_log_error_impl(&dword_18ECEB000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Invalid non-number type for key %{public}@", buf, 0x16u);
          }
        }
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v10);
  }
  else
  {
    unint64_t v11 = 0;
  }

  return v11;
}

- (BOOL)_anyFeaturePropertyValueWithKey:(id)a3 getterBlock:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = (uint64_t (**)(id, void))a4;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = self->_featurePolicies;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        if (v5[2](v5, *(void *)(*((void *)&v11 + 1) + 8 * i)))
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (unint64_t)minimumTimeBetweenSyncsInSecondsMaximumValue
{
  if (![(NSArray *)self->_transportPolicies count]) {
    return 0;
  }
  NSUInteger v3 = [(NSArray *)self->_transportPolicies count];
  transportPolicies = self->_transportPolicies;
  if (v3 == 1)
  {
    id v5 = [(NSArray *)self->_transportPolicies firstObject];
    if (v5) {
      unint64_t v6 = v5[9];
    }
    else {
      unint64_t v6 = 0;
    }

    return v6;
  }
  return [(_DKSync3Policy *)self _maximumPropertyValueWithKey:@"MinimumTimeBetweenSyncsInSeconds" policies:transportPolicies skipZeroValues:1];
}

- (uint64_t)periodicSyncCadenceInMinutesMinimumValue
{
  v1 = a1;
  if (!a1) {
    return (uint64_t)v1;
  }
  if (![a1[9] count]) {
    return 0;
  }
  uint64_t v2 = [v1[9] count];
  id v3 = v1[9];
  if (v2 == 1)
  {
    id v4 = [v1[9] firstObject];
    if (v4) {
      v1 = (id *)v4[10];
    }
    else {
      v1 = 0;
    }

    return (uint64_t)v1;
  }
  return [v1 _minimumPropertyValueWithKey:@"PeriodicSyncCadenceInMinutes" policies:v3 skipZeroValues:1];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"%@ { \n", v5];

  if (self)
  {
    [v3 appendFormat:@"                                 version: %@\n", self->_version];
    if (self->_syncDisabled
      || ![(NSArray *)self->_featurePolicies count]
      || ![(NSArray *)self->_transportPolicies count])
    {
      unint64_t v6 = @"YES";
      goto LABEL_4;
    }
  }
  else
  {
    [v3 appendFormat:@"                                 version: %@\n", 0];
  }
  unint64_t v6 = @"NO";
LABEL_4:
  [v3 appendFormat:@"                            syncDisabled: %@\n", v6];
  if (+[_DKSync3Policy cloudSyncDisabled])
  {
    if (+[_DKSync3Policy cloudSyncDisabled]) {
      uint64_t v7 = @"YES";
    }
    else {
      uint64_t v7 = @"NO";
    }
    [v3 appendFormat:@"                       cloudSyncDisabled: %@\n", v7];
  }
  if (+[_DKSync3Policy rapportSyncDisabled])
  {
    if (+[_DKSync3Policy rapportSyncDisabled]) {
      uint64_t v8 = @"YES";
    }
    else {
      uint64_t v8 = @"NO";
    }
    [v3 appendFormat:@"                     rapportSyncDisabled: %@\n", v8];
  }
  if (self) {
    unint64_t triggeredSyncDelayInSeconds = self->_triggeredSyncDelayInSeconds;
  }
  else {
    unint64_t triggeredSyncDelayInSeconds = 0;
  }
  uint64_t v10 = [NSNumber numberWithUnsignedInteger:triggeredSyncDelayInSeconds];
  [v3 appendFormat:@"             triggeredSyncDelayInSeconds: %@\n", v10];

  long long v11 = +[_DKSyncPeerStatusTracker stringForTransports:self->_mask];
  [v3 appendFormat:@"                              transports: %@\n", v11];

  if ([(NSArray *)self->_sourceDevices count])
  {
    long long v12 = _CDPrettyPrintCollection(self->_sourceDevices, 0, 0, 0);
    [v3 appendFormat:@"                           sourceDevices: %@\n", v12];
  }
  if ([(NSArray *)self->_destinationDevices count])
  {
    long long v13 = _CDPrettyPrintCollection(self->_destinationDevices, 0, 0, 0);
    [v3 appendFormat:@"                      destinationDevices: %@\n", v13];
  }
  if (self->_isSingleDevice) {
    long long v14 = @"YES";
  }
  else {
    long long v14 = @"NO";
  }
  [v3 appendFormat:@"                          isSingleDevice: %@\n", v14];
  if (self->_isOnPower) {
    id v15 = @"YES";
  }
  else {
    id v15 = @"NO";
  }
  [v3 appendFormat:@"                               isOnPower: %@\n", v15];
  uint64_t v16 = [NSNumber numberWithUnsignedInteger:-[_DKSync3Policy periodicSyncCadenceInMinutesMinimumValue]((id *)&self->super.isa)];
  [v3 appendFormat:@"periodicSyncCadenceInMinutesMinimumValue: %@\n", v16];

  [v3 appendFormat:@"                       transportPolicies: %@\n", self->_transportPolicies];
  [v3 appendFormat:@"                         featurePolicies: %@\n", self->_featurePolicies];
  [v3 appendString:@"}\n"];
  return v3;
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featurePolicies, 0);
  objc_storeStrong((id *)&self->_transportPolicies, 0);
  objc_storeStrong((id *)&self->_destinationDevices, 0);
  objc_storeStrong((id *)&self->_sourceDevices, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

+ (void)computePolicyDictionaryWithDefaultSyncPolicyDict:syncPolicyOverridesDict:topLevelDefaultsPolicy:.cold.2()
{
  OUTLINED_FUNCTION_6();
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_7(&dword_18ECEB000, v1, v2, "%{public}@: Using remote policy override: %{public}@", v3, v4, v5, v6, v7);
}

+ (void)configurationPlistForFilename:.cold.1()
{
  OUTLINED_FUNCTION_6();
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_1_0(&dword_18ECEB000, v1, v2, "%{public}@: Unable to obtain resource path for %@", v3, v4, v5, v6, 2u);
}

+ (void)configurationPlistForFilename:.cold.2()
{
  OUTLINED_FUNCTION_6();
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_1_0(&dword_18ECEB000, v1, v2, "%{public}@: Failed to read policy file: %@", v3, v4, v5, v6, 2u);
}

+ (void)_possiblyAddToArray:ifTransport:existsInTransports:.cold.1()
{
  OUTLINED_FUNCTION_6();
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_1_0(&dword_18ECEB000, v1, v2, "%{public}@: Missing transport policy for %{public}@", v3, v4, v5, v6, v7);
}

+ (void)_possiblyAddToArray:ifTransport:existsInTransports:.cold.2()
{
  OUTLINED_FUNCTION_6();
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_7(&dword_18ECEB000, v1, v2, "%{public}@: Transport policy is diabled for %{public}@", v3, v4, v5, v6, v7);
}

@end