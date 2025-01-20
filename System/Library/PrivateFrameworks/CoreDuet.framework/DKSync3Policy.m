@interface DKSync3Policy
@end

@implementation DKSync3Policy

void __32___DKSync3Policy_disabledPolicy__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)disabledPolicy_policy;
  disabledPolicy_policy = v0;

  if (disabledPolicy_policy) {
    *(unsigned char *)(disabledPolicy_policy + 8) = 1;
  }
}

void __77___DKSync3Policy_possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays___block_invoke(void *a1)
{
  keys[9] = *(char **)MEMORY[0x1E4F143B8];
  if (+[_DKCloudUtilities isUnitTesting])
  {
    id v20 = +[_CDPeriodicScheduler sharedInstance];
    [v20 unregisterJob:a1[4]];
  }
  else
  {
    uint64_t v2 = a1[4];
    v3 = dispatch_get_global_queue(-32768, 0);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __77___DKSync3Policy_possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays___block_invoke_2;
    v21[3] = &__block_descriptor_40_e5_v8__0l;
    v21[4] = a1[5];
    v4 = +[_CDPeriodicSchedulerJob jobWithInterval:v2 schedulerJobName:v3 queue:0 asynchronousHandler:v21 handler:0.0];

    v5 = (char *)*MEMORY[0x1E4F142F8];
    keys[0] = *(char **)MEMORY[0x1E4F141C8];
    keys[1] = v5;
    v6 = (char *)*MEMORY[0x1E4F142B0];
    keys[2] = *(char **)MEMORY[0x1E4F142C8];
    keys[3] = v6;
    v7 = (char *)*MEMORY[0x1E4F14330];
    keys[4] = *(char **)MEMORY[0x1E4F14138];
    keys[5] = v7;
    v8 = (char *)*MEMORY[0x1E4F14298];
    keys[6] = *(char **)MEMORY[0x1E4F14270];
    keys[7] = v8;
    int64_t v9 = 86400 * a1[6];
    keys[8] = *(char **)MEMORY[0x1E4F14320];
    values[0] = xpc_int64_create(v9);
    v10 = (void *)MEMORY[0x1E4F14518];
    id v11 = MEMORY[0x1E4F14518];
    values[1] = v10;
    values[2] = xpc_string_create((const char *)*MEMORY[0x1E4F142D0]);
    id v12 = v10;
    values[3] = v10;
    v13 = (void *)MEMORY[0x1E4F14510];
    id v14 = MEMORY[0x1E4F14510];
    values[4] = v13;
    id v15 = v10;
    values[5] = v10;
    values[6] = xpc_string_create((const char *)*MEMORY[0x1E4F14278]);
    values[7] = xpc_int64_create(5000);
    id v16 = v10;
    values[8] = v10;
    xpc_object_t v17 = xpc_dictionary_create((const char *const *)keys, values, 9uLL);
    [v4 setExecutionCriteria:v17];

    v18 = +[_CDPeriodicScheduler sharedInstance];
    [v18 registerJob:v4];

    for (uint64_t i = 8; i != -1; --i)
  }
}

void __77___DKSync3Policy_possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays___block_invoke_2()
{
  uint64_t v0 = +[_DKSync3Policy userDefaults];
  v1 = [v0 objectForKey:@"CloudSyncPoliciesLastModified"];

  uint64_t v2 = objc_opt_new();
  v3 = objc_opt_new();
  +[_CDServerRequest addHTTPIfModifiedSinceToHeaders:date:]((uint64_t)_CDServerRequest, v3, v1);
  v4 = -[_CDServerRequest startDataTaskWithURI:headers:timeoutInterval:responseHandler:](v2, @"https://configuration.apple.com/configurations/internetservices/cloudkit/knowledgestore/com.apple.coreduet.knowledge.Sync3Policy.plist", v3, &__block_literal_global_825, 10.0);
  v5 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __77___DKSync3Policy_possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays___block_invoke_2_cold_1();
  }
}

uint64_t __77___DKSync3Policy_possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays___block_invoke_3()
{
  return +[_DKSync3Policy handleDownloadSyncPolicyResponse:data:error:](_DKSync3Policy, "handleDownloadSyncPolicyResponse:data:error:");
}

void __42___DKSync3Policy_PolicyCache__policyCache__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)policyCache_policyCache_0;
  policyCache_policyCache_0 = (uint64_t)v0;

  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v3 = (void *)policyCache_policyCache_0;
  policyCache_policyCache_0 = (uint64_t)v2;

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v4 = (id)[v5 addObserverForName:@"_DKSync2CoordinatorDidIdleNotification" object:0 queue:0 usingBlock:&__block_literal_global_938];
}

uint64_t __42___DKSync3Policy_PolicyCache__policyCache__block_invoke_2()
{
  return +[_DKSyncSerializer performAsyncBlock:&__block_literal_global_941];
}

uint64_t __42___DKSync3Policy_PolicyCache__policyCache__block_invoke_3()
{
  return [(id)policyCache_policyCache_0 removeAllObjects];
}

void __77___DKSync3Policy_possiblyDownloadSyncPolicyWithPolicyDownloadIntervalInDays___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_6();
  id v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_7(&dword_18ECEB000, v1, v2, "%{public}@: Started session data task: %@", v3, v4, v5, v6, 2u);
}

@end