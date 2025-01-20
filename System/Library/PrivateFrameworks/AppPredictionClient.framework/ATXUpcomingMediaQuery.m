@interface ATXUpcomingMediaQuery
+ (id)getAllUpcomingMedia;
+ (id)getUpcomingMediaForBundle:(id)a3 isInternalApplication:(BOOL)a4;
+ (void)getUpcomingMediaForBundle:(id)a3 isInternalApplication:(BOOL)a4 completionHandler:(id)a5;
@end

@implementation ATXUpcomingMediaQuery

+ (id)getAllUpcomingMedia
{
  return (id)[a1 getUpcomingMediaForBundle:0 isInternalApplication:0];
}

+ (id)getUpcomingMediaForBundle:(id)a3 isInternalApplication:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__24;
  v20 = __Block_byref_object_dispose__24;
  id v21 = (id)objc_opt_new();
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__ATXUpcomingMediaQuery_getUpcomingMediaForBundle_isInternalApplication___block_invoke;
  v13[3] = &unk_1E5D0AC08;
  v15 = &v16;
  v8 = v7;
  v14 = v8;
  [a1 getUpcomingMediaForBundle:v6 isInternalApplication:v4 completionHandler:v13];
  v9 = v8;
  dispatch_time_t v10 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v9, v10);

  id v11 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v11;
}

void __73__ATXUpcomingMediaQuery_getUpcomingMediaForBundle_isInternalApplication___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)getUpcomingMediaForBundle:(id)a3 isInternalApplication:(BOOL)a4 completionHandler:(id)a5
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  id v9 = [NSString alloc];
  dispatch_time_t v10 = (void *)[v9 initWithFormat:@"(domainIdentifier == '%@')", *MEMORY[0x1E4F30268]];
  id v11 = objc_opt_new();
  [v11 setInternal:1];
  if (v7)
  {
    v33[0] = v7;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
    [v11 setBundleIDs:v12];
  }
  uint64_t v32 = *MEMORY[0x1E4F28358];
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
  [v11 setProtectionClasses:v13];

  v31[0] = *MEMORY[0x1E4F30128];
  v31[1] = @"kMDItemRankingHint";
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
  [v11 setFetchAttributes:v14];

  v15 = (void *)[objc_alloc(MEMORY[0x1E4F23828]) initWithQueryString:v10 context:v11];
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__24;
  v29[4] = __Block_byref_object_dispose__24;
  id v30 = (id)objc_opt_new();
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __91__ATXUpcomingMediaQuery_getUpcomingMediaForBundle_isInternalApplication_completionHandler___block_invoke;
  v26[3] = &unk_1E5D080D0;
  v28 = v29;
  id v16 = v7;
  id v27 = v16;
  [v15 setFoundItemsHandler:v26];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __91__ATXUpcomingMediaQuery_getUpcomingMediaForBundle_isInternalApplication_completionHandler___block_invoke_13;
  v20[3] = &unk_1E5D0AC30;
  id v17 = v10;
  id v21 = v17;
  id v18 = v8;
  id v23 = v18;
  v24 = v29;
  BOOL v25 = a4;
  id v19 = v16;
  id v22 = v19;
  [v15 setCompletionHandler:v20];
  [v15 start];

  _Block_object_dispose(v29, 8);
}

void __91__ATXUpcomingMediaQuery_getUpcomingMediaForBundle_isInternalApplication_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v2 = a2;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v27;
    uint64_t v6 = *MEMORY[0x1E4F30128];
    do
    {
      uint64_t v7 = 0;
      uint64_t v23 = v4;
      do
      {
        if (*(void *)v27 != v5) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v26 + 1) + 8 * v7);
        id v9 = (void *)MEMORY[0x1AD0D3C30]();
        dispatch_time_t v10 = [v8 attributeSet];
        id v11 = [v10 attributeForKey:v6];

        if (v11)
        {
          v12 = (void *)MEMORY[0x1E4F28DC0];
          uint64_t v13 = objc_opt_class();
          id v25 = 0;
          v14 = [v12 unarchivedObjectOfClass:v13 fromData:v11 error:&v25];
          id v15 = v25;
          if (v14)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v24 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
              id v16 = [v8 attributeSet];
              [v16 rankingHint];
              uint64_t v17 = v6;
              uint64_t v18 = v5;
              v20 = id v19 = v2;
              [v24 addUpcomingMediaIntent:v14 withRank:v20];

              id v2 = v19;
              uint64_t v5 = v18;
              uint64_t v6 = v17;
              uint64_t v4 = v23;
              goto LABEL_12;
            }
          }
          else
          {
            id v16 = __atxlog_handle_default();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v31 = v15;
              _os_log_error_impl(&dword_1A790D000, v16, OS_LOG_TYPE_ERROR, "Could not unarchive intent: %@", buf, 0xCu);
            }
LABEL_12:
          }
        }

        ++v7;
      }
      while (v4 != v7);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v4);
  }

  id v21 = __atxlog_handle_default();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    __91__ATXUpcomingMediaQuery_getUpcomingMediaForBundle_isInternalApplication_completionHandler___block_invoke_cold_1(v2, a1, v21);
  }
}

void __91__ATXUpcomingMediaQuery_getUpcomingMediaForBundle_isInternalApplication_completionHandler___block_invoke_13(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = __atxlog_handle_default();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __91__ATXUpcomingMediaQuery_getUpcomingMediaForBundle_isInternalApplication_completionHandler___block_invoke_13_cold_2(a1, (uint64_t)v3, v4);
    }
  }
  else
  {
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setIsInternalApplication:*(unsigned __int8 *)(a1 + 64)];
    uint64_t v4 = __atxlog_handle_default();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __91__ATXUpcomingMediaQuery_getUpcomingMediaForBundle_isInternalApplication_completionHandler___block_invoke_13_cold_1(a1, v4);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __91__ATXUpcomingMediaQuery_getUpcomingMediaForBundle_isInternalApplication_completionHandler___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 count];
  uint64_t v6 = *(void *)(a2 + 32);
  int v7 = 134218242;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_debug_impl(&dword_1A790D000, a3, OS_LOG_TYPE_DEBUG, "Found %lu upcoming media items for %@ in Spotlight.", (uint8_t *)&v7, 0x16u);
}

void __91__ATXUpcomingMediaQuery_getUpcomingMediaForBundle_isInternalApplication_completionHandler___block_invoke_13_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1A790D000, a2, OS_LOG_TYPE_DEBUG, "Completed recovery of upcoming media items for %@ from Spotlight.", (uint8_t *)&v3, 0xCu);
}

void __91__ATXUpcomingMediaQuery_getUpcomingMediaForBundle_isInternalApplication_completionHandler___block_invoke_13_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "ERROR in completion handler for CSSearchQuery: %@ - ERROR:%@", (uint8_t *)&v4, 0x16u);
}

@end