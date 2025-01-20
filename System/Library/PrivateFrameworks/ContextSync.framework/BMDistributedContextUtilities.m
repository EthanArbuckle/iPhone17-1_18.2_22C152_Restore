@interface BMDistributedContextUtilities
+ (BOOL)isSupportEnabledForBMDSL:(id)a3 useCase:(id)a4 withError:(id *)a5;
+ (id)currentBootSessionUUID;
+ (void)updateDescriptionForError:(id *)a3 withErrorCode:(int64_t)a4;
@end

@implementation BMDistributedContextUtilities

+ (void)updateDescriptionForError:(id *)a3 withErrorCode:(int64_t)a4
{
  if (a3)
  {
    v6 = [MEMORY[0x263EFF9A0] dictionary];
    if ((unint64_t)a4 > 5)
    {
      a4 = 0;
      v7 = @"Unknown Error";
    }
    else
    {
      v7 = off_26455C558[a4];
    }
    id v8 = v6;
    [v6 setValue:v7 forKey:*MEMORY[0x263F08320]];
    *a3 = [MEMORY[0x263F087E8] errorWithDomain:@"ContextSyncErrorDomain" code:a4 userInfo:v8];
  }
}

+ (BOOL)isSupportEnabledForBMDSL:(id)a3 useCase:(id)a4 withError:(id *)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v7 = a4;
  if (a3)
  {
    id v8 = [a3 streamPublishers];
    v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v8;
      _os_log_impl(&dword_2201A2000, v9, OS_LOG_TYPE_INFO, "isSupportEnabledForBMDSL: streamPublishers: %@", buf, 0xCu);
    }

    v10 = [MEMORY[0x263EFF9C0] set];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v30 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * i), "identifier", (void)v29);
          [v10 addObject:v16];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v13);
    }

    v17 = (void *)MEMORY[0x263F29E58];
    v18 = [MEMORY[0x263F29E80] current];
    v19 = [v17 policyForProcess:v18 connectionFlags:0 useCase:v7];

    char v20 = [v19 allowsAccessToContextSyncStreams:v10];
    if ((v20 & 1) == 0)
    {
      v21 = __biome_log_for_category();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        +[BMDistributedContextUtilities isSupportEnabledForBMDSL:useCase:withError:]((uint64_t)v10, v21, v22, v23, v24, v25, v26, v27);
      }

      +[BMDistributedContextUtilities updateDescriptionForError:a5 withErrorCode:4];
    }
  }
  else
  {
    char v20 = 0;
  }

  return v20;
}

+ (id)currentBootSessionUUID
{
  v2 = objc_msgSend(MEMORY[0x263F08C38], "bm_bootSessionUUID");
  v3 = [v2 UUIDString];

  return v3;
}

+ (void)isSupportEnabledForBMDSL:(uint64_t)a3 useCase:(uint64_t)a4 withError:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end