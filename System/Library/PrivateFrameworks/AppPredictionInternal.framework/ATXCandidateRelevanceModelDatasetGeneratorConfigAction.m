@interface ATXCandidateRelevanceModelDatasetGeneratorConfigAction
+ (id)activityPublisherFromStartTime:(double)a3;
+ (id)candidatePublisherFromStartTime:(double)a3;
+ (id)intentPublisherFromStartTime:(double)a3;
@end

@implementation ATXCandidateRelevanceModelDatasetGeneratorConfigAction

+ (id)activityPublisherFromStartTime:(double)a3
{
  v4 = BiomeLibrary();
  v5 = [v4 UniversalRecents];
  v6 = [v5 UserActivity];
  v7 = [v6 Metadata];
  v8 = [NSNumber numberWithDouble:a3];
  v9 = objc_msgSend(v7, "atx_publisherFromStartTime:", v8);

  return v9;
}

+ (id)intentPublisherFromStartTime:(double)a3
{
  v4 = BiomeLibrary();
  v5 = [v4 App];
  v6 = [v5 Intent];
  v7 = [NSNumber numberWithDouble:a3];
  v8 = objc_msgSend(v6, "atx_publisherFromStartTime:", v7);

  return v8;
}

+ (id)candidatePublisherFromStartTime:(double)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v4 = [(id)objc_opt_class() activityPublisherFromStartTime:a3];
  v5 = [v4 flatMapWithTransform:&__block_literal_global_70_0];
  v6 = [(id)objc_opt_class() intentPublisherFromStartTime:a3];
  v7 = [v6 flatMapWithTransform:&__block_literal_global_77_1];
  v11[0] = v5;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  v9 = [v7 orderedMergeWithOthers:v8 comparator:&__block_literal_global_82_0];

  return v9;
}

id __90__ATXCandidateRelevanceModelDatasetGeneratorConfigAction_candidatePublisherFromStartTime___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = objc_opt_new();
  v4 = [v2 eventBody];
  id v5 = objc_alloc(MEMORY[0x1E4F22488]);
  v6 = [v4 userActivityData];
  v7 = (void *)[v5 _initWithUserActivityData:v6];

  if ([v7 isEligibleForPrediction]
    && ([v7 activityType],
        v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 length],
        v8,
        v9))
  {
    id v10 = objc_alloc(MEMORY[0x1E4F4AE38]);
    id v11 = objc_alloc(MEMORY[0x1E4F29128]);
    v12 = [v4 uuid];
    v13 = (void *)[v11 initWithUUIDString:v12];
    v14 = [v4 associatedBundleID];
    LOBYTE(v21) = 0;
    v15 = (void *)[v10 initWithNSUserActivity:v7 actionUUID:v13 bundleId:v14 contentAttributeSet:0 itemIdentifier:0 heuristic:0 heuristicMetadata:0 criteria:0 isFutureMedia:v21 title:0 subtitle:0];

    if (v15 && ([v15 hasActionTitle] & 1) != 0)
    {
      v16 = [[ATXCandidateAction alloc] initWithBiomeStoreData:v15];
      id v17 = objc_alloc(MEMORY[0x1E4F4B620]);
      [v2 timestamp];
      v18 = objc_msgSend(v17, "initWithEventBody:timestamp:", v16);
      [v3 addObject:v18];
      v19 = [v3 bpsPublisher];
    }
    else
    {
      v19 = [v3 bpsPublisher];
    }
  }
  else
  {
    v19 = [v3 bpsPublisher];
  }

  return v19;
}

id __90__ATXCandidateRelevanceModelDatasetGeneratorConfigAction_candidatePublisherFromStartTime___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = objc_opt_new();
  v4 = [v2 eventBody];
  id v5 = [v4 atxAction];

  if (v5 && ([v5 hasActionTitle] & 1) != 0)
  {
    +[_ATXActionUtils slotSetsForAction:v5];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(obj);
          }
          id v10 = [*(id *)(*((void *)&v18 + 1) + 8 * i) parameters];
          id v11 = (void *)[v5 copyWithParameterWhitelist:v10];

          v12 = [[ATXCandidateAction alloc] initWithBiomeStoreData:v11];
          id v13 = objc_alloc(MEMORY[0x1E4F4B620]);
          [v2 timestamp];
          v14 = objc_msgSend(v13, "initWithEventBody:timestamp:", v12);
          [v3 addObject:v14];
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v7);
    }
    v15 = [v3 bpsPublisher];
  }
  else
  {
    v15 = [v3 bpsPublisher];
  }

  return v15;
}

uint64_t __90__ATXCandidateRelevanceModelDatasetGeneratorConfigAction_candidatePublisherFromStartTime___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  v4 = NSNumber;
  id v5 = a3;
  [a2 timestamp];
  uint64_t v6 = objc_msgSend(v4, "numberWithDouble:");
  uint64_t v7 = NSNumber;
  [v5 timestamp];
  double v9 = v8;

  id v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

@end