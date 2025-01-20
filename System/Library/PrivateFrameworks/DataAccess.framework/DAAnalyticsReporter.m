@interface DAAnalyticsReporter
+ (void)endDailyAnalyticsReporter;
+ (void)reportActiveExchangeOAuthAccountsCount;
+ (void)startDailyAnalyticsReporter;
@end

@implementation DAAnalyticsReporter

+ (void)startDailyAnalyticsReporter
{
  v3 = DALoggingwithCategory();
  os_log_type_t v4 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
  if (os_log_type_enabled(v3, v4))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BA384000, v3, v4, "starting daily Analytics reporter", buf, 2u);
  }

  v5 = (void *)*MEMORY[0x1E4F14158];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __50__DAAnalyticsReporter_startDailyAnalyticsReporter__block_invoke;
  handler[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  handler[4] = a1;
  xpc_activity_register("com.apple.dataaccess.dataaccessd.dailyAnalytics", v5, handler);
}

void __50__DAAnalyticsReporter_startDailyAnalyticsReporter__block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    v5 = dataaccess_get_global_queue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__DAAnalyticsReporter_startDailyAnalyticsReporter__block_invoke_1;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(v5, block);
LABEL_10:

    goto LABEL_11;
  }
  if (!state)
  {
    v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E4F142F8], 1);
    xpc_dictionary_set_int64(v5, (const char *)*MEMORY[0x1E4F14170], *MEMORY[0x1E4F141E8]);
    xpc_dictionary_set_int64(v5, (const char *)*MEMORY[0x1E4F141A8], *MEMORY[0x1E4F141F8]);
    xpc_object_t v6 = xpc_activity_copy_criteria(v3);
    if (!v6 || !xpc_equal(v5, v6))
    {
      v7 = DALoggingwithCategory();
      os_log_type_t v8 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
      if (os_log_type_enabled(v7, v8))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BA384000, v7, v8, "Updating criteria for daily Analytics xpc activity.", buf, 2u);
      }

      xpc_activity_set_criteria(v3, v5);
    }

    goto LABEL_10;
  }
LABEL_11:
}

uint64_t __50__DAAnalyticsReporter_startDailyAnalyticsReporter__block_invoke_1(uint64_t a1)
{
  return [*(id *)(a1 + 32) reportActiveExchangeOAuthAccountsCount];
}

+ (void)endDailyAnalyticsReporter
{
  xpc_activity_unregister("com.apple.dataaccess.dataaccessd.dailyAnalytics");
  v2 = DALoggingwithCategory();
  os_log_type_t v3 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
  if (os_log_type_enabled(v2, v3))
  {
    *(_WORD *)os_log_type_t v4 = 0;
    _os_log_impl(&dword_1BA384000, v2, v3, "unregistering daily Analytics reporter", v4, 2u);
  }
}

+ (void)reportActiveExchangeOAuthAccountsCount
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = DALoggingwithCategory();
  os_log_type_t v3 = *(unsigned char *)(MEMORY[0x1E4F5E9A0] + 6);
  if (os_log_type_enabled(v2, v3))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BA384000, v2, v3, "Reporting Exchange OAuth accounts count", buf, 2u);
  }

  os_log_type_t v4 = objc_opt_new();
  v5 = [v4 accountTypeWithAccountTypeIdentifier:*MEMORY[0x1E4F17798]];
  if (v5)
  {
    xpc_object_t v6 = [v4 accountsWithAccountType:v5];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v6);
          }
          v12 = [*(id *)(*((void *)&v16 + 1) + 8 * i) objectForKeyedSubscript:@"DAExchangeOAuthSupportedKey"];

          if (v12) {
            ++v9;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v23 count:16];
      }
      while (v8);
    }
    else
    {
      uint64_t v9 = 0;
    }
    v21 = @"count";
    v13 = [NSNumber numberWithInteger:v9];
    v22 = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    AnalyticsSendEvent();

    v15 = DALoggingwithCategory();
    if (os_log_type_enabled(v15, v3))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BA384000, v15, v3, "Reported Exchange OAuth accounts count", buf, 2u);
    }
  }
}

@end