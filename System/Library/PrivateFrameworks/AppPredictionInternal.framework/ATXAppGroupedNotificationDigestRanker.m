@interface ATXAppGroupedNotificationDigestRanker
- (ATXAppGroupedNotificationDigestRanker)init;
- (ATXAppGroupedNotificationDigestRanker)initWithDigestFeedback:(id)a3;
- (id)bfsSelectGlobalMarqueeGroupsFromApps:(id)a3 maxCount:(unint64_t)a4 groupFilter:(id)a5;
- (id)createDigestForAppGroupedNotificationStacks:(id)a3 maxGlobalMarqueeGroups:(unint64_t)a4 maxAppMarqueeGroups:(unint64_t)a5 outError:(id *)a6;
- (id)getRankedAppsFromAppGroupedNotificationStacks:(id)a3 maxAppMarqueeGroups:(unint64_t)a4;
@end

@implementation ATXAppGroupedNotificationDigestRanker

- (ATXAppGroupedNotificationDigestRanker)init
{
  v3 = objc_opt_new();
  v4 = [(ATXAppGroupedNotificationDigestRanker *)self initWithDigestFeedback:v3];

  return v4;
}

- (ATXAppGroupedNotificationDigestRanker)initWithDigestFeedback:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXAppGroupedNotificationDigestRanker;
  v6 = [(ATXAppGroupedNotificationDigestRanker *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_digestFeedback, a3);
    uint64_t v8 = +[ATXNotificationDigestRankingConstants sharedInstance];
    c = v7->_c;
    v7->_c = (ATXNotificationDigestRankingConstants *)v8;
  }
  return v7;
}

- (id)createDigestForAppGroupedNotificationStacks:(id)a3 maxGlobalMarqueeGroups:(unint64_t)a4 maxAppMarqueeGroups:(unint64_t)a5 outError:(id *)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  objc_super v11 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    *(_DWORD *)buf = 138412290;
    v38 = v13;
    _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_INFO, "[%@] Generating a notification digest", buf, 0xCu);
  }
  if (v10 || !a6)
  {
    v18 = [(ATXAppGroupedNotificationDigestRanker *)self getRankedAppsFromAppGroupedNotificationStacks:v10 maxAppMarqueeGroups:a5];
    v19 = objc_opt_new();
    v20 = [(ATXAppGroupedNotificationDigestRanker *)self bfsSelectGlobalMarqueeGroupsFromApps:v18 maxCount:a4 groupFilter:&__block_literal_global_109];
    [v19 addObjectsFromArray:v20];

    if ([v19 count] < a4)
    {
      v21 = [(ATXAppGroupedNotificationDigestRanker *)self bfsSelectGlobalMarqueeGroupsFromApps:v18 maxCount:a4 groupFilter:&__block_literal_global_111_1];
      [v19 addObjectsFromArray:v21];
    }
    v22 = objc_opt_new();
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v16 = v18;
    uint64_t v23 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v31 != v25) {
            objc_enumerationMutation(v16);
          }
          v27 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * i), "groupsWithComms", (void)v30);
          [v22 addObjectsFromArray:v27];
        }
        uint64_t v24 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v24);
    }

    v28 = objc_msgSend(v16, "_pas_mappedArrayWithTransform:", &__block_literal_global_114);
    v17 = (void *)[objc_alloc(MEMORY[0x1E4F4B408]) initWithAppDigests:v28 highlightedGroups:v19 messageGroups:v22 rankerId:@"engagement_digest_ranking_2"];
  }
  else
  {
    v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F28798];
    uint64_t v35 = *MEMORY[0x1E4F28228];
    v36 = @"Missing argument. Notification stacks were nil.";
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    [v14 errorWithDomain:v15 code:22 userInfo:v16];
    v17 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

uint64_t __137__ATXAppGroupedNotificationDigestRanker_createDigestForAppGroupedNotificationStacks_maxGlobalMarqueeGroups_maxAppMarqueeGroups_outError___block_invoke(uint64_t a1, void *a2)
{
  return [a2 groupsWithoutCommsWithPreviewableAttachment];
}

uint64_t __137__ATXAppGroupedNotificationDigestRanker_createDigestForAppGroupedNotificationStacks_maxGlobalMarqueeGroups_maxAppMarqueeGroups_outError___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 groupsWithoutCommsWithoutPreviewableAttachment];
}

id __137__ATXAppGroupedNotificationDigestRanker_createDigestForAppGroupedNotificationStacks_maxGlobalMarqueeGroups_maxAppMarqueeGroups_outError___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F4B400];
  id v3 = a2;
  id v4 = [v2 alloc];
  id v5 = [v3 bundleId];
  v6 = [v3 appMarqueeGroups];
  v7 = [v3 nonAppMarqueeGroups];

  uint64_t v8 = (void *)[v4 initWithBundleId:v5 appMarqueeGroups:v6 nonAppMarqueeGroups:v7];
  return v8;
}

- (id)getRankedAppsFromAppGroupedNotificationStacks:(id)a3 maxAppMarqueeGroups:(unint64_t)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __107__ATXAppGroupedNotificationDigestRanker_getRankedAppsFromAppGroupedNotificationStacks_maxAppMarqueeGroups___block_invoke;
  v29[3] = &unk_1E68B63C0;
  v29[4] = self;
  v29[5] = a4;
  id v4 = objc_msgSend(a3, "_pas_mappedArrayWithTransform:", v29);
  id v5 = (void *)MEMORY[0x1E4F4B658];
  v6 = objc_msgSend(v4, "_pas_mappedArrayWithTransform:", &__block_literal_global_123);
  v7 = [v5 sampleWeightedArray:v6];

  uint64_t v8 = objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v36 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "unsignedIntegerValue", (void)v25));
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v36 count:16];
    }
    while (v11);
  }

  uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
  id v16 = objc_msgSend(v8, "_pas_mappedArrayWithTransform:", &__block_literal_global_127_0);
  v17 = [v15 setWithArray:v16];

  uint64_t v18 = [v17 count];
  if (v18 != [v8 count])
  {
    v19 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = (objc_class *)objc_opt_class();
      v21 = NSStringFromClass(v20);
      uint64_t v22 = [v17 count];
      uint64_t v23 = [v8 count];
      *(_DWORD *)buf = 138412802;
      long long v31 = v21;
      __int16 v32 = 2048;
      uint64_t v33 = v22;
      __int16 v34 = 2048;
      uint64_t v35 = v23;
      _os_log_impl(&dword_1D0FA3000, v19, OS_LOG_TYPE_INFO, "[%@] Found %lu bundleIds for %lu apps. # of bundle IDs should equal # of apps. Proceeding anyway.", buf, 0x20u);
    }
  }

  return v8;
}

_App *__107__ATXAppGroupedNotificationDigestRanker_getRankedAppsFromAppGroupedNotificationStacks_maxAppMarqueeGroups___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = [[_App alloc] initWithNotificationStacks:v3 maxAppMarqueeGroups:*(void *)(a1 + 40) digestFeedback:*(void *)(*(void *)(a1 + 32) + 8)];
  }
  else
  {
    id v5 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v6);
      int v9 = 138412290;
      uint64_t v10 = v7;
      _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_INFO, "[%@] notificationsStacks == nil. Skipping.", (uint8_t *)&v9, 0xCu);
    }
    id v4 = 0;
  }

  return v4;
}

uint64_t __107__ATXAppGroupedNotificationDigestRanker_getRankedAppsFromAppGroupedNotificationStacks_maxAppMarqueeGroups___block_invoke_120(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  [a2 digestRankingScore];
  return objc_msgSend(v2, "numberWithDouble:");
}

uint64_t __107__ATXAppGroupedNotificationDigestRanker_getRankedAppsFromAppGroupedNotificationStacks_maxAppMarqueeGroups___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 bundleId];
}

- (id)bfsSelectGlobalMarqueeGroupsFromApps:(id)a3 maxCount:(unint64_t)a4 groupFilter:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  v7 = (void (**)(id, void))a5;
  uint64_t v8 = objc_opt_new();
  unint64_t v20 = a4;
  if (a4)
  {
    unint64_t v9 = 0;
    do
    {
      uint64_t v19 = [v8 count];
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v10 = v18;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v22;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v22 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = v7[2](v7, *(void *)(*((void *)&v21 + 1) + 8 * i));
            if (v9 < [v15 count])
            {
              if ([v8 count] == v20)
              {

                goto LABEL_15;
              }
              id v16 = [v15 objectAtIndexedSubscript:v9];
              [v8 addObject:v16];
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }
LABEL_15:

      if ([v8 count] == v20) {
        break;
      }
      if (v19 == [v8 count]) {
        break;
      }
      ++v9;
    }
    while (v9 != v20);
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_c, 0);
  objc_storeStrong((id *)&self->_digestFeedback, 0);
}

@end