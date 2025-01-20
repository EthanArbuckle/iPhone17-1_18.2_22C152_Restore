@interface BMDistributedContextStreamWriter
+ (id)sharedEventQueue;
+ (id)sourceForStreamWithIdentifier:(id)a3;
+ (void)postEvent:(id)a3;
@end

@implementation BMDistributedContextStreamWriter

+ (id)sharedEventQueue
{
  if (sharedEventQueue_onceToken != -1) {
    dispatch_once(&sharedEventQueue_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedEventQueue_sharedEventQueue;
  return v2;
}

uint64_t __52__BMDistributedContextStreamWriter_sharedEventQueue__block_invoke()
{
  sharedEventQueue_sharedEventQueue = (uint64_t)dispatch_queue_create("com.apple.contextsync.main", 0);
  return MEMORY[0x270F9A758]();
}

+ (id)sourceForStreamWithIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  v4 = (void (*)(void))getBiomeLibrarySymbolLoc_ptr;
  v23 = getBiomeLibrarySymbolLoc_ptr;
  if (!getBiomeLibrarySymbolLoc_ptr)
  {
    v18[1] = (id)MEMORY[0x263EF8330];
    v18[2] = (id)3221225472;
    v18[3] = __getBiomeLibrarySymbolLoc_block_invoke;
    v18[4] = &unk_26455C250;
    v19 = &v20;
    v5 = (void *)BiomeLibraryLibrary();
    v21[3] = (uint64_t)dlsym(v5, "BiomeLibrary");
    getBiomeLibrarySymbolLoc_ptr = *(_UNKNOWN **)(v19[1] + 24);
    v4 = (void (*)(void))v21[3];
  }
  _Block_object_dispose(&v20, 8);
  if (!v4) {
    +[BMDistributedContextStreamWriter sourceForStreamWithIdentifier:]();
  }
  v6 = v4();
  v18[0] = 0;
  v7 = [v6 streamWithIdentifier:v3 error:v18];
  id v8 = v18[0];
  if (v8)
  {
    v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[BMDistributedContextStreamWriter sourceForStreamWithIdentifier:]((uint64_t)v3, v9, v10, v11, v12, v13, v14, v15);
    }

    v16 = 0;
  }
  else
  {
    v16 = [v7 source];
  }

  return v16;
}

+ (void)postEvent:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() sharedEventQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__BMDistributedContextStreamWriter_postEvent___block_invoke;
  v7[3] = &unk_26455C228;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __46__BMDistributedContextStreamWriter_postEvent___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) streamIdentifier];
  id v3 = [*(id *)(a1 + 32) eventData];
  id v4 = [*(id *)(a1 + 32) eventDataVersion];
  uint64_t v5 = [v4 unsignedIntValue];

  if (v2) {
    BOOL v6 = v3 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    id v8 = getBMContextSyncLOIIdentifier();
    int v9 = [v2 isEqualToString:v8];

    if (v9)
    {
      id BMContextSyncLOIClass = getBMContextSyncLOIClass();
    }
    else
    {
      uint64_t v11 = getBMContextSyncDeviceActivityLevelIdentifier();
      int v12 = [v2 isEqualToString:v11];

      if (v12)
      {
        id BMContextSyncLOIClass = getBMContextSyncDeviceActivityLevelClass();
      }
      else
      {
        uint64_t v13 = getBMContextSyncCellularAvailabilityStatusIdentifier();
        int v14 = [v2 isEqualToString:v13];

        if (v14)
        {
          id BMContextSyncLOIClass = getBMContextSyncCellularAvailabilityStatusClass();
        }
        else
        {
          uint64_t v15 = getBMContextSyncWalletTransactionIdentifier();
          int v16 = [v2 isEqualToString:v15];

          if (v16)
          {
            id BMContextSyncLOIClass = getBMContextSyncWalletTransactionClass();
          }
          else
          {
            v17 = getBMContextSyncAppInFocusIdentifier();
            int v18 = [v2 isEqualToString:v17];

            if (!v18)
            {
              uint64_t v22 = __biome_log_for_category();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
                __46__BMDistributedContextStreamWriter_postEvent___block_invoke_cold_2((uint64_t)v2, v22, v23, v24, v25, v26, v27, v28);
              }

LABEL_25:
              v7 = __biome_log_for_category();
              if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
                __46__BMDistributedContextStreamWriter_postEvent___block_invoke_cold_1((uint64_t)v2, v7, v29, v30, v31, v32, v33, v34);
              }
              goto LABEL_27;
            }
            id BMContextSyncLOIClass = getBMContextSyncAppInFocusClass();
          }
        }
      }
    }
    uint64_t v19 = [BMContextSyncLOIClass eventWithData:v3 dataVersion:v5];
    if (v19)
    {
      v7 = v19;
      uint64_t v20 = [*(id *)(a1 + 40) sourceForStreamWithIdentifier:v2];
      [v20 sendEvent:v7];
      v21 = __biome_log_for_category();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        int v35 = 138412546;
        v36 = v2;
        __int16 v37 = 2112;
        v38 = v7;
        _os_log_impl(&dword_2201A2000, v21, OS_LOG_TYPE_DEFAULT, "Posted event for identifier: %@, %@", (uint8_t *)&v35, 0x16u);
      }

      goto LABEL_27;
    }
    goto LABEL_25;
  }
  v7 = __biome_log_for_category();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __46__BMDistributedContextStreamWriter_postEvent___block_invoke_cold_3(v7);
  }
LABEL_27:
}

+ (void)sourceForStreamWithIdentifier:.cold.1()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"id<BMRootLibrary> __softlink__BiomeLibrary(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMDistributedContextEventTranslation.m", 18, @"%s", dlerror());

  __break(1u);
}

+ (void)sourceForStreamWithIdentifier:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __46__BMDistributedContextStreamWriter_postEvent___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __46__BMDistributedContextStreamWriter_postEvent___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __46__BMDistributedContextStreamWriter_postEvent___block_invoke_cold_3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2201A2000, log, OS_LOG_TYPE_ERROR, "Could not post event with missing identifier or eventData", v1, 2u);
}

@end