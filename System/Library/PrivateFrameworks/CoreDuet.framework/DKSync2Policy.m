@interface DKSync2Policy
@end

@implementation DKSync2Policy

void __29___DKSync2Policy_policyCache__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)policyCache_policyCache;
  policyCache_policyCache = (uint64_t)v0;

  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v2 = (id)[v3 addObserverForName:@"_DKSync2CoordinatorDidIdleNotification" object:0 queue:0 usingBlock:&__block_literal_global_111];
}

uint64_t __29___DKSync2Policy_policyCache__block_invoke_2()
{
  return [(id)policyCache_policyCache removeAllObjects];
}

void __77___DKSync2Policy_possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays___block_invoke(void *a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[_DKSync2Policy productVersion]();
  id v3 = (void *)possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays__productVersion;
  possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays__productVersion = v2;

  v4 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = [(id)objc_opt_class() description];
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays__productVersion;
    _os_log_impl(&dword_18ECEB000, v4, OS_LOG_TYPE_INFO, "%{public}@: Using productVersion %{public}@ for sync policy downloads", buf, 0x16u);
  }
  if (possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays__productVersion
    && !+[_DKCloudUtilities isUnitTesting])
  {
    uint64_t v7 = a1[4];
    v8 = dispatch_get_global_queue(-32768, 0);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __77___DKSync2Policy_possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays___block_invoke_143;
    v24[3] = &__block_descriptor_40_e5_v8__0l;
    v24[4] = a1[5];
    v6 = +[_CDPeriodicSchedulerJob jobWithInterval:v7 schedulerJobName:v8 queue:0 asynchronousHandler:v24 handler:0.0];

    uint64_t v9 = *MEMORY[0x1E4F142F8];
    *(void *)buf = *MEMORY[0x1E4F141C8];
    *(void *)&buf[8] = v9;
    uint64_t v10 = *MEMORY[0x1E4F142B0];
    *(void *)&buf[16] = *MEMORY[0x1E4F142C8];
    uint64_t v27 = v10;
    uint64_t v11 = *MEMORY[0x1E4F14330];
    uint64_t v28 = *MEMORY[0x1E4F14138];
    uint64_t v29 = v11;
    uint64_t v12 = *MEMORY[0x1E4F14298];
    uint64_t v30 = *MEMORY[0x1E4F14270];
    uint64_t v31 = v12;
    int64_t v13 = 86400 * a1[6];
    uint64_t v32 = *MEMORY[0x1E4F14320];
    values[0] = xpc_int64_create(v13);
    v14 = (void *)MEMORY[0x1E4F14518];
    id v15 = MEMORY[0x1E4F14518];
    values[1] = v14;
    values[2] = xpc_string_create((const char *)*MEMORY[0x1E4F142D0]);
    id v16 = v14;
    values[3] = v14;
    v17 = (void *)MEMORY[0x1E4F14510];
    id v18 = MEMORY[0x1E4F14510];
    values[4] = v17;
    id v19 = v14;
    values[5] = v14;
    values[6] = xpc_string_create((const char *)*MEMORY[0x1E4F14278]);
    values[7] = xpc_int64_create(5000);
    id v20 = v14;
    values[8] = v14;
    xpc_object_t v21 = xpc_dictionary_create((const char *const *)buf, values, 9uLL);
    [v6 setExecutionCriteria:v21];

    v22 = +[_CDPeriodicScheduler sharedInstance];
    [v22 registerJob:v6];

    for (uint64_t i = 8; i != -1; --i)
  }
  else
  {
    v6 = +[_CDPeriodicScheduler sharedInstance];
    [v6 unregisterJob:a1[4]];
  }
}

void __77___DKSync2Policy_possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays___block_invoke_143()
{
  id v0 = +[_DKSync2Policy userDefaults]();
  v1 = [v0 objectForKey:@"CloudSyncPoliciesLastModified"];

  uint64_t v2 = objc_opt_new();
  id v3 = objc_opt_new();
  +[_CDServerRequest addHTTPIfModifiedSinceToHeaders:date:]((uint64_t)_CDServerRequest, v3, v1);
  v4 = [@"https://configuration.apple.com/configurations/internetservices/cloudkit/knowledgestore/com.apple.coreduet.knowledge.syncPolicies2.ios.plist" pathComponents];
  v5 = (void *)[v4 mutableCopy];

  if ((unint64_t)[v5 count] < 3)
  {
    uint64_t v7 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __77___DKSync2Policy_possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays___block_invoke_143_cold_2();
    }

    v6 = @"https://configuration.apple.com/configurations/internetservices/cloudkit/knowledgestore/com.apple.coreduet.knowledge.syncPolicies2.ios.plist";
  }
  else
  {
    objc_msgSend(v5, "insertObject:atIndex:", possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays__productVersion, objc_msgSend(v5, "count") - 1);
    v6 = [NSString pathWithComponents:v5];
  }
  v8 = -[_CDServerRequest startDataTaskWithURI:headers:timeoutInterval:responseHandler:](v2, (uint64_t)v6, v3, &__block_literal_global_148, 10.0);
  uint64_t v9 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __77___DKSync2Policy_possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays___block_invoke_143_cold_1();
  }
}

void __77___DKSync2Policy_possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays___block_invoke_145(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
}

void __77___DKSync2Policy_possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays___block_invoke_143_cold_1()
{
  OUTLINED_FUNCTION_6();
  id v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_7(&dword_18ECEB000, v1, v2, "%{public}@: Started session data task: %@", v3, v4, v5, v6, v7);
}

void __77___DKSync2Policy_possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays___block_invoke_143_cold_2()
{
  id v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1_0(&dword_18ECEB000, v1, v2, "%{public}@: Unable to parse URL: %@", v3, v4, v5, v6, 2u);
}

@end