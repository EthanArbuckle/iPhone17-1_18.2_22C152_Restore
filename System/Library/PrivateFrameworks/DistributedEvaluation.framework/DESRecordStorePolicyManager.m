@interface DESRecordStorePolicyManager
+ (DESRecordStorePolicyManager)sharedInstance;
- (DESRecordStorePolicyManager)initWithBundleRegistry:(id)a3 policyPathURL:(id)a4;
- (id)arrayOfStringForPlugin:(id)a3 key:(id)a4 defaultValue:(id)a5;
- (id)coreDuetEventQueryForPluginID:(id)a3;
- (id)coreDuetPredicateForPluginID:(id)a3;
- (id)policyForNSExtensionPluginID:(id)a3;
- (id)policyForPluginID:(id)a3;
- (id)stringForPluginID:(id)a3 key:(id)a4 defaultValue:(id)a5;
- (id)supportedCoreDuetEventStreamNamesForPluginID:(id)a3;
- (id)supportedRecordTypesForPluginID:(id)a3;
- (unint64_t)coreDuetEventLimitForPluginID:(id)a3;
- (unint64_t)daysToExpirationOfRecordsForPluginID:(id)a3;
- (unint64_t)maximumNumberOfRecordsForPluginID:(id)a3;
- (unint64_t)unsignedIntegerForPluginID:(id)a3 key:(id)a4 defaultValue:(unint64_t)a5;
@end

@implementation DESRecordStorePolicyManager

+ (DESRecordStorePolicyManager)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__DESRecordStorePolicyManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_singleton;

  return (DESRecordStorePolicyManager *)v2;
}

void __45__DESRecordStorePolicyManager_sharedInstance__block_invoke()
{
  id v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/System/Library/DistributedEvaluation/DESRecordStorePolicies" isDirectory:1];
  id v0 = objc_alloc((Class)objc_opt_class());
  v1 = +[DESBundleRegistry sharedInstance];
  uint64_t v2 = [v0 initWithBundleRegistry:v1 policyPathURL:v4];
  v3 = (void *)sharedInstance_singleton;
  sharedInstance_singleton = v2;
}

- (DESRecordStorePolicyManager)initWithBundleRegistry:(id)a3 policyPathURL:(id)a4
{
  unint64_t v7 = (unint64_t)a3;
  unint64_t v8 = (unint64_t)a4;
  if (v7 | v8)
  {
    v13.receiver = self;
    v13.super_class = (Class)DESRecordStorePolicyManager;
    v9 = [(DESRecordStorePolicyManager *)&v13 init];
    p_isa = (id *)&v9->super.isa;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_bundleRegistry, a3);
      objc_storeStrong(p_isa + 2, a4);
    }
    self = p_isa;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)policyForNSExtensionPluginID:(id)a3
{
  id v4 = a3;
  policyPathURL = self->_policyPathURL;
  p_policyPathURL = (uint64_t *)&self->_policyPathURL;
  unint64_t v7 = [NSString stringWithFormat:@"%@.plist", v4];
  unint64_t v8 = [(NSURL *)policyPathURL URLByAppendingPathComponent:v7 isDirectory:0];

  if (v8
    && ([MEMORY[0x1E4F28CB8] defaultManager],
        v9 = objc_claimAutoreleasedReturnValue(),
        [v8 path],
        v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [v9 fileExistsAtPath:v10],
        v10,
        v9,
        v11))
  {
    v12 = (void *)MEMORY[0x1C189B250]();
    id v18 = 0;
    objc_super v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v8 error:&v18];
    id v14 = v18;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      v16 = +[DESLogging coreChannel];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        [(DESRecordStorePolicyManager *)p_policyPathURL policyForNSExtensionPluginID:v16];
      }
    }
  }
  else
  {
    objc_super v13 = 0;
  }

  return v13;
}

- (id)policyForPluginID:(id)a3
{
  if (a3)
  {
    id v4 = -[DESRecordStorePolicyManager policyForNSExtensionPluginID:](self, "policyForNSExtensionPluginID:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (unint64_t)unsignedIntegerForPluginID:(id)a3 key:(id)a4 defaultValue:(unint64_t)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [(DESRecordStorePolicyManager *)self policyForPluginID:v8];
  int v11 = [v10 objectForKeyedSubscript:v9];
  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      a5 = [v11 unsignedIntegerValue];
    }
    else
    {
      v12 = +[DESLogging coreChannel];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v15 = 138412802;
        id v16 = (id)objc_opt_class();
        __int16 v17 = 2112;
        id v18 = v9;
        __int16 v19 = 2112;
        id v20 = v8;
        id v14 = v16;
        _os_log_error_impl(&dword_1BECCB000, v12, OS_LOG_TYPE_ERROR, "Ignore unknown value type %@, key=%@, plugin=%@.", (uint8_t *)&v15, 0x20u);
      }
    }
  }

  return a5;
}

- (id)stringForPluginID:(id)a3 key:(id)a4 defaultValue:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(DESRecordStorePolicyManager *)self policyForPluginID:v8];
  v12 = [v11 objectForKeyedSubscript:v9];
  objc_super v13 = v10;
  if (v12)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    objc_super v13 = v12;
    if ((isKindOfClass & 1) == 0)
    {
      int v15 = +[DESLogging coreChannel];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v19 = 138412802;
        id v20 = (id)objc_opt_class();
        __int16 v21 = 2112;
        id v22 = v9;
        __int16 v23 = 2112;
        id v24 = v8;
        id v18 = v20;
        _os_log_error_impl(&dword_1BECCB000, v15, OS_LOG_TYPE_ERROR, "Ignore unknown value type %@, key=%@, plugin=%@.", (uint8_t *)&v19, 0x20u);
      }
      objc_super v13 = v10;
    }
  }
  id v16 = v13;

  return v16;
}

- (id)arrayOfStringForPlugin:(id)a3 key:(id)a4 defaultValue:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(DESRecordStorePolicyManager *)self policyForPluginID:v8];
  v12 = [v11 objectForKeyedSubscript:v9];
  if (!v12)
  {
LABEL_15:
    id v18 = v10;
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v19 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v32 = (id)objc_opt_class();
      __int16 v33 = 2112;
      id v34 = v9;
      __int16 v35 = 2112;
      id v36 = v8;
      id v22 = v32;
      _os_log_error_impl(&dword_1BECCB000, v19, OS_LOG_TYPE_ERROR, "Ignore unknown value type=%@, key=%@, plugin=%@.", buf, 0x20u);
    }
    goto LABEL_15;
  }
  id v25 = v8;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v20 = +[DESLogging coreChannel];
          id v8 = v25;
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            __int16 v23 = objc_opt_class();
            *(_DWORD *)buf = 138412802;
            id v32 = v23;
            __int16 v33 = 2112;
            id v34 = v9;
            __int16 v35 = 2112;
            id v36 = v25;
            id v24 = v23;
            _os_log_error_impl(&dword_1BECCB000, v20, OS_LOG_TYPE_ERROR, "Ignore unknown element value type %@, key=%@, plugin=%@.", buf, 0x20u);
          }
          id v18 = v10;

          goto LABEL_19;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  id v18 = v13;
  id v8 = v25;
LABEL_19:

  return v18;
}

- (unint64_t)maximumNumberOfRecordsForPluginID:(id)a3
{
  return [(DESRecordStorePolicyManager *)self unsignedIntegerForPluginID:a3 key:@"DESMaximumNumberOfRecordsKey" defaultValue:10];
}

- (unint64_t)daysToExpirationOfRecordsForPluginID:(id)a3
{
  return [(DESRecordStorePolicyManager *)self unsignedIntegerForPluginID:a3 key:@"DESDaysToExpirationOfRecordsKey" defaultValue:28];
}

- (unint64_t)coreDuetEventLimitForPluginID:(id)a3
{
  return [(DESRecordStorePolicyManager *)self unsignedIntegerForPluginID:a3 key:@"DESCoreDuetEventLimit" defaultValue:1000];
}

- (id)coreDuetPredicateForPluginID:(id)a3
{
  return [(DESRecordStorePolicyManager *)self stringForPluginID:a3 key:@"DESCoreDuetEventPredicate" defaultValue:0];
}

- (id)supportedRecordTypesForPluginID:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:&v9 count:1];
  unint64_t v7 = [(DESRecordStorePolicyManager *)self arrayOfStringForPlugin:v5, @"DESSupportedRecordTypes", v6, v9, v10 key defaultValue];

  return v7;
}

- (id)supportedCoreDuetEventStreamNamesForPluginID:(id)a3
{
  return [(DESRecordStorePolicyManager *)self arrayOfStringForPlugin:a3 key:@"DESCoreDuetSupportedEventStreamNames" defaultValue:MEMORY[0x1E4F1CBF0]];
}

- (id)coreDuetEventQueryForPluginID:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policyPathURL, 0);

  objc_storeStrong((id *)&self->_bundleRegistry, 0);
}

- (void)policyForNSExtensionPluginID:(os_log_t)log .cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1BECCB000, log, OS_LOG_TYPE_ERROR, "Fail to load policy from plist=%@, error=%@", (uint8_t *)&v4, 0x16u);
}

@end