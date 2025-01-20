@interface DCTaskCreator
+ (id)create;
@end

@implementation DCTaskCreator

+ (id)create
{
  v2 = [[DCBGSTask alloc] initWithTaskIdentifier:@"com.apple.devicecheck.notify" observerIdentifier:@"activityInterval"];
  [(DCBGSTask *)v2 setTaskHandler:&__block_literal_global];

  return v2;
}

void __23__DCTaskCreator_create__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    v3 = +[DCAssetFetcher sharedFetcher];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __23__DCTaskCreator_create__block_invoke_2;
    v4[3] = &unk_264BDC178;
    id v5 = v2;
    [v3 initiateMetadataFetchIgnoringCachesWithCompletion:v4];
  }
}

void __23__DCTaskCreator_create__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v6 = _DCLogSystem();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    if (v5)
    {
      if (v7) {
        __23__DCTaskCreator_create__block_invoke_2_cold_2(a1, v5, v6);
      }
    }
    else if (v7)
    {
      __23__DCTaskCreator_create__block_invoke_2_cold_1(a1);
    }
  }
  else
  {
    v6 = _DCLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __23__DCTaskCreator_create__block_invoke_2_cold_3(a1);
    }
  }

  [*(id *)(a1 + 32) setTaskCompleted];
}

void __23__DCTaskCreator_create__block_invoke_2_cold_1(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) identifier];
  [v1 UTF8String];
  OUTLINED_FUNCTION_0(&dword_2330E6000, v2, v3, "Initiated MobileAsset fetch. { taskID=%s }", v4, v5, v6, v7, 2u);
}

void __23__DCTaskCreator_create__block_invoke_2_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = [*(id *)(a1 + 32) identifier];
  uint64_t v6 = [v5 UTF8String];
  uint64_t v7 = [a2 localizedDescription];
  int v8 = 136315394;
  uint64_t v9 = v6;
  __int16 v10 = 2112;
  v11 = v7;
  _os_log_debug_impl(&dword_2330E6000, a3, OS_LOG_TYPE_DEBUG, "Failed to to initiate metadata fetch. { taskID=%s, error=%@ }", (uint8_t *)&v8, 0x16u);
}

void __23__DCTaskCreator_create__block_invoke_2_cold_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) identifier];
  [v1 UTF8String];
  OUTLINED_FUNCTION_0(&dword_2330E6000, v2, v3, "Failed to initiate metadata fetch. { taskID=%s }", v4, v5, v6, v7, 2u);
}

@end