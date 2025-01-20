@interface ATXUtils
+ (BOOL)shouldSkipExpensiveTask;
+ (id)shuffle:(id)a3;
@end

@implementation ATXUtils

+ (BOOL)shouldSkipExpensiveTask
{
  v2 = [MEMORY[0x1E4F5B6A8] userContext];
  v3 = [MEMORY[0x1E4F5B6B8] keyPathForAppDataDictionary];
  v4 = [v2 objectForKeyedSubscript:v3];
  v5 = [MEMORY[0x1E4F5B6B8] appBundleIdKey];
  v6 = [v4 objectForKeyedSubscript:v5];

  int v7 = [v6 isEqualToString:@"com.apple.camera"];
  if (v7)
  {
    v8 = __atxlog_handle_default();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "Should hold off on expensive task", v10, 2u);
    }
  }
  return v7;
}

+ (id)shuffle:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    v4 = [v3 allObjects];
    v5 = (void *)[v4 mutableCopy];

    uint64_t v6 = [v5 count];
    uint64_t v7 = v6 - 1;
    if (v6 != 1)
    {
      do
      {
        [v5 exchangeObjectAtIndex:v7 withObjectAtIndex:arc4random_uniform(v7 + 1)];
        --v7;
      }
      while (v7);
    }
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

@end