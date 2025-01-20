@interface SGSuggestionsSystem
+ (void)_beforeSystemInitialization;
+ (void)start;
@end

@implementation SGSuggestionsSystem

+ (void)start
{
  +[SGSuggestionsSystem _beforeSystemInitialization];
  if ([MEMORY[0x1E4F93B10] isUnlocked])
  {
    v2 = +[SGSqlEntityStore defaultHarvestStore];
    v3 = +[SGSqlEntityStore defaultStore];
    v4 = v3;
    if (v2) {
      BOOL v5 = v3 == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5) {
      retrySuggestionsInitializationWhenUnlocked();
    }
    else {
      finishSuggestionsSetup(v2, v3);
    }
  }
  else
  {
    retrySuggestionsInitializationWhenUnlocked();
  }
  [MEMORY[0x1E4F93B10] runBlockWhenDeviceIsClassCUnlocked:&__block_literal_global_23_6232];
  v6 = +[SGXPCActivityManager sharedInstance];
  [v6 registerActivitiesWithSystem];

  int out_token = 0;
  v7 = (const char *)[(id)*MEMORY[0x1E4F5DEF8] UTF8String];
  v8 = dispatch_get_global_queue(9, 0);
  notify_register_dispatch(v7, &out_token, v8, &__block_literal_global_30);
}

void __28__SGSuggestionsSystem_start__block_invoke_2()
{
  v0 = sgLogHandle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v1 = 0;
    _os_log_debug_impl(&dword_1CA650000, v0, OS_LOG_TYPE_DEBUG, "Preparing for queries", v1, 2u);
  }
}

void __28__SGSuggestionsSystem_start__block_invoke()
{
  sharedSpotlightReceiver();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  SpotlightReceiverRegister();
}

+ (void)_beforeSystemInitialization
{
  +[SGDCloudKitSync setSharedInstanceConfigurationBlock:&__block_literal_global_6262];
  if (([MEMORY[0x1E4F93B10] isClassCLocked] & 1) == 0)
  {
    id v2 = +[SGSqlEntityStore defaultStore];
    id v3 = +[SGSqlEntityStore defaultHarvestStore];
  }
}

void __50__SGSuggestionsSystem__beforeSystemInitialization__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setNewEntitiesCallback:&__block_literal_global_7];
  [v2 setDeleteAllSyncedItemsCallback:&__block_literal_global_11];
  id v6 = (id)objc_opt_new();
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F19ED8]) initWithContainerIdentifier:@"com.apple.CoreSuggestions.PseudoEvents" environment:1];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F19EC8]) initWithContainerID:v3 options:v6];
  BOOL v5 = [v4 privateCloudDatabase];
  [v2 setDatabase:v5];
}

uint64_t __50__SGSuggestionsSystem__beforeSystemInitialization__block_invoke_3()
{
  id v0 = +[SGSqlEntityStore defaultStore];
  v1 = [MEMORY[0x1E4F5D9F0] fromSync];
  [v0 deleteItemsWithEntityTag:v1];

  return 1;
}

uint64_t __50__SGSuggestionsSystem__beforeSystemInitialization__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[SGSqlEntityStore defaultStore];
  [v3 writeEntity:v2];

  return 1;
}

@end