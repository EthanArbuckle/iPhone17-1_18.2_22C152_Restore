@interface ATXNotificationDigestRanker
- (ATXNotificationDigestRanker)init;
- (ATXNotificationDigestRanker)initWithDigestFeedback:(id)a3;
- (id)appsForNotificationGroups:(id)a3;
- (id)chooseAppsForMarquee:(id)a3;
- (id)createDigestForNotificationStacks:(id)a3 outError:(id *)a4;
- (id)sampleAppsForMarquee:(id)a3 numToSample:(unint64_t)a4 hasAutomaticMarqueeBeenUsedFlag:(BOOL *)a5;
@end

@implementation ATXNotificationDigestRanker

- (ATXNotificationDigestRanker)init
{
  v3 = objc_opt_new();
  v4 = [(ATXNotificationDigestRanker *)self initWithDigestFeedback:v3];

  return v4;
}

- (ATXNotificationDigestRanker)initWithDigestFeedback:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXNotificationDigestRanker;
  v6 = [(ATXNotificationDigestRanker *)&v11 init];
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

- (id)createDigestForNotificationStacks:(id)a3 outError:(id *)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    *(_DWORD *)buf = 138412290;
    v60 = v8;
    _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_INFO, "[%@] Generating a notification digest", buf, 0xCu);
  }
  v45 = v5;
  v9 = objc_msgSend(v5, "_pas_mappedArrayWithTransform:", &__block_literal_global_72_1);
  uint64_t v10 = objc_msgSend(v9, "_pas_filteredArrayWithTest:", &__block_literal_global_75);
  v44 = v9;
  uint64_t v11 = objc_msgSend(v9, "_pas_filteredArrayWithTest:", &__block_literal_global_77_3);
  v43 = (void *)v10;
  v12 = [(ATXNotificationDigestRanker *)self appsForNotificationGroups:v10];
  v13 = [v12 sortedArrayUsingComparator:&__block_literal_global_80_1];

  v42 = (void *)v11;
  v14 = [(ATXNotificationDigestRanker *)self appsForNotificationGroups:v11];
  v15 = [v14 sortedArrayUsingComparator:&__block_literal_global_82_1];

  v46 = [(ATXNotificationDigestRanker *)self chooseAppsForMarquee:v15];
  v16 = objc_opt_new();
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v17 = v13;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v53 objects:v58 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v54 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = [*(id *)(*((void *)&v53 + 1) + 8 * i) unorderedGroups];
        v23 = [v22 sortedArrayUsingComparator:&__block_literal_global_84_1];

        [v16 addObjectsFromArray:v23];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v53 objects:v58 count:16];
    }
    while (v19);
  }

  if ([v46 count] == 1
    && ([v46 firstObject],
        v24 = objc_claimAutoreleasedReturnValue(),
        [v24 orderedGroups],
        v25 = objc_claimAutoreleasedReturnValue(),
        unint64_t v26 = [v25 count],
        v25,
        v24,
        v26 >= 2))
  {
    v27 = [v46 firstObject];
    v28 = [v27 orderedGroups];
    v41 = objc_msgSend(v28, "subarrayWithRange:", 0, 2);
  }
  else
  {
    v41 = objc_msgSend(v46, "_pas_mappedArrayWithTransform:", &__block_literal_global_87_0);
  }
  v29 = objc_opt_new();
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v30 = v15;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v49 objects:v57 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v50;
    do
    {
      for (uint64_t j = 0; j != v32; ++j)
      {
        if (*(void *)v50 != v33) {
          objc_enumerationMutation(v30);
        }
        v35 = [*(id *)(*((void *)&v49 + 1) + 8 * j) unorderedGroups];
        v36 = [v35 sortedArrayUsingComparator:&__block_literal_global_89_4];

        [v29 addObjectsFromArray:v36];
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v49 objects:v57 count:16];
    }
    while (v32);
  }

  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __74__ATXNotificationDigestRanker_createDigestForNotificationStacks_outError___block_invoke_9;
  v47[3] = &unk_1E68B61F8;
  id v48 = v41;
  id v37 = v41;
  v38 = objc_msgSend(v29, "_pas_filteredArrayWithTest:", v47);
  v39 = (void *)[objc_alloc(MEMORY[0x1E4F4B408]) initWithMessageGroups:v16 highlightedGroups:v37 otherGroups:v38 rankerId:@"engagement_digest_ranking_1"];

  return v39;
}

id __74__ATXNotificationDigestRanker_createDigestForNotificationStacks_outError___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F4B418];
  id v3 = a2;
  v4 = (void *)[[v2 alloc] initWithNotifications:v3 useDigestOrder:1];

  return v4;
}

uint64_t __74__ATXNotificationDigestRanker_createDigestForNotificationStacks_outError___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isCommunicationGroup];
}

uint64_t __74__ATXNotificationDigestRanker_createDigestForNotificationStacks_outError___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 isCommunicationGroup] ^ 1;
}

uint64_t __74__ATXNotificationDigestRanker_createDigestForNotificationStacks_outError___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  v4 = NSNumber;
  id v5 = a2;
  [a3 appScore];
  v6 = objc_msgSend(v4, "numberWithDouble:");
  v7 = NSNumber;
  [v5 appScore];
  double v9 = v8;

  uint64_t v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

uint64_t __74__ATXNotificationDigestRanker_createDigestForNotificationStacks_outError___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  v4 = NSNumber;
  id v5 = a2;
  [a3 appScore];
  v6 = objc_msgSend(v4, "numberWithDouble:");
  v7 = NSNumber;
  [v5 appScore];
  double v9 = v8;

  uint64_t v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

uint64_t __74__ATXNotificationDigestRanker_createDigestForNotificationStacks_outError___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  v4 = NSNumber;
  id v5 = a2;
  [a3 appSpecifiedScore];
  v6 = objc_msgSend(v4, "numberWithDouble:");
  v7 = NSNumber;
  [v5 appSpecifiedScore];
  double v9 = v8;

  uint64_t v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

id __74__ATXNotificationDigestRanker_createDigestForNotificationStacks_outError___block_invoke_7(uint64_t a1, void *a2)
{
  v2 = [a2 orderedGroups];
  id v3 = [v2 firstObject];

  return v3;
}

uint64_t __74__ATXNotificationDigestRanker_createDigestForNotificationStacks_outError___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  v4 = NSNumber;
  id v5 = a2;
  [a3 appSpecifiedScore];
  v6 = objc_msgSend(v4, "numberWithDouble:");
  v7 = NSNumber;
  [v5 appSpecifiedScore];
  double v9 = v8;

  uint64_t v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

uint64_t __74__ATXNotificationDigestRanker_createDigestForNotificationStacks_outError___block_invoke_9(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

- (id)appsForNotificationGroups:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v24;
    *(void *)&long long v8 = 138412546;
    long long v22 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "bundleId", v22, (void)v23);
        if (v13)
        {
          v14 = [v5 objectForKeyedSubscript:v13];

          if (!v14)
          {
            v15 = [[ATXNotificationDigestApp alloc] initWithBundleId:v13 digestFeedback:self->_digestFeedback digestConstants:self->_c];
            [v5 setObject:v15 forKeyedSubscript:v13];
          }
          v16 = [v5 objectForKeyedSubscript:v13];
          [v16 addGroup:v12];
        }
        else
        {
          v16 = __atxlog_handle_notification_management();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            id v17 = (objc_class *)objc_opt_class();
            uint64_t v18 = NSStringFromClass(v17);
            uint64_t v19 = [v12 groupId];
            *(_DWORD *)buf = v22;
            v28 = v18;
            __int16 v29 = 2112;
            id v30 = v19;
            _os_log_impl(&dword_1D0FA3000, v16, OS_LOG_TYPE_INFO, "[%@] Missing bundle ID for group with ID %@", buf, 0x16u);
          }
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v9);
  }

  uint64_t v20 = [v5 allValues];

  return v20;
}

- (id)chooseAppsForMarquee:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ATXNotificationDigestRankingConstants *)self->_c numMarqueeSpots];
  char v13 = 0;
  id v6 = objc_msgSend(v4, "_pas_filteredArrayWithTest:", &__block_literal_global_95_2);
  uint64_t v7 = [(ATXNotificationDigestRanker *)self sampleAppsForMarquee:v6 numToSample:v5 hasAutomaticMarqueeBeenUsedFlag:&v13];
  unint64_t v8 = v5 - [v7 count];
  if (v8)
  {
    uint64_t v10 = objc_msgSend(v4, "_pas_filteredArrayWithTest:", &__block_literal_global_97_1);
    uint64_t v11 = [(ATXNotificationDigestRanker *)self sampleAppsForMarquee:v10 numToSample:v8 hasAutomaticMarqueeBeenUsedFlag:&v13];
    id v9 = [v7 arrayByAddingObjectsFromArray:v11];
  }
  else
  {
    id v9 = v7;
  }

  return v9;
}

uint64_t __52__ATXNotificationDigestRanker_chooseAppsForMarquee___block_invoke(uint64_t a1, void *a2)
{
  return [a2 hasImage];
}

uint64_t __52__ATXNotificationDigestRanker_chooseAppsForMarquee___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 hasImage] ^ 1;
}

- (id)sampleAppsForMarquee:(id)a3 numToSample:(unint64_t)a4 hasAutomaticMarqueeBeenUsedFlag:(BOOL *)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  unint64_t v8 = v7;
  if (a4 && [v7 count])
  {
    id v9 = (void *)MEMORY[0x1E4F4B658];
    uint64_t v10 = objc_msgSend(v8, "_pas_mappedArrayWithTransform:", &__block_literal_global_101_1);
    uint64_t v11 = [v9 sampleWeightedArray:v10 numToSample:a4];

    v12 = objc_opt_new();
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v25 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "unsignedIntegerValue", (void)v24));
          [v12 addObject:v18];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v15);
    }

    if (!*a5)
    {
      uint64_t v19 = objc_msgSend(v8, "_pas_filteredArrayWithTest:", &__block_literal_global_103_0);
      if ([v19 count] && objc_msgSend(v12, "count"))
      {
        uint64_t v20 = arc4random_uniform([v19 count]);
        v21 = [v19 objectAtIndexedSubscript:v20];
        if (([v12 containsObject:v21] & 1) == 0)
        {
          long long v22 = [v19 objectAtIndexedSubscript:v20];
          objc_msgSend(v12, "setObject:atIndexedSubscript:", v22, objc_msgSend(v12, "count") - 1);
        }
        *a5 = 1;
      }
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v12;
}

uint64_t __96__ATXNotificationDigestRanker_sampleAppsForMarquee_numToSample_hasAutomaticMarqueeBeenUsedFlag___block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  [a2 appScore];
  return objc_msgSend(v2, "numberWithDouble:");
}

uint64_t __96__ATXNotificationDigestRanker_sampleAppsForMarquee_numToSample_hasAutomaticMarqueeBeenUsedFlag___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isEligibleForAutomaticMarquee];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_c, 0);
  objc_storeStrong((id *)&self->_digestFeedback, 0);
}

@end