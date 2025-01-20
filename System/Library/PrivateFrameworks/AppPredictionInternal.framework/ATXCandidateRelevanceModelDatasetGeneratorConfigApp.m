@interface ATXCandidateRelevanceModelDatasetGeneratorConfigApp
+ (id)candidatePublisherFromStartTime:(double)a3;
+ (id)candidatePublisherWithStartTime:(id)a3 endTime:(id)a4;
@end

@implementation ATXCandidateRelevanceModelDatasetGeneratorConfigApp

+ (id)candidatePublisherFromStartTime:(double)a3
{
  v4 = objc_opt_class();
  v5 = [NSNumber numberWithDouble:a3];
  v6 = [v4 candidatePublisherWithStartTime:v5 endTime:0];

  return v6;
}

+ (id)candidatePublisherWithStartTime:(id)a3 endTime:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = a4;
  id v7 = a3;
  v8 = +[_ATXAppIconState sharedInstance];
  v9 = [v8 allInstalledAppsKnownToSpringBoard];
  v10 = [v5 setWithArray:v9];

  v11 = BiomeLibrary();
  v12 = [v11 App];
  v13 = [v12 InFocus];
  v14 = objc_msgSend(v13, "atx_publisherWithStartTime:endTime:maxEvents:lastN:reversed:", v7, v6, 0, 0, 0);

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __95__ATXCandidateRelevanceModelDatasetGeneratorConfigApp_candidatePublisherWithStartTime_endTime___block_invoke;
  v19[3] = &unk_1E68AF140;
  id v20 = v10;
  id v15 = v10;
  v16 = [v14 filterWithIsIncluded:v19];
  v17 = [v16 mapWithTransform:&__block_literal_global_131];

  return v17;
}

uint64_t __95__ATXCandidateRelevanceModelDatasetGeneratorConfigApp_candidatePublisherWithStartTime_endTime___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 eventBody];
  v5 = [v4 bundleID];

  if (v5
    && ([v5 isEqualToString:@"unknown"] & 1) == 0
    && ([v5 hasPrefix:@"com.apple.springboard."] & 1) == 0
    && [v5 length]
    && ([v3 eventBody],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 starting],
        v6,
        v7))
  {
    uint64_t v8 = [*(id *)(a1 + 32) containsObject:v5];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

id __95__ATXCandidateRelevanceModelDatasetGeneratorConfigApp_candidatePublisherWithStartTime_endTime___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [ATXCandidateApp alloc];
  v4 = [v2 eventBody];
  v5 = [(ATXCandidate *)v3 initWithBiomeStoreData:v4];

  id v6 = objc_alloc(MEMORY[0x1E4F4B620]);
  [v2 timestamp];
  double v8 = v7;

  v9 = (void *)[v6 initWithEventBody:v5 timestamp:v8];
  return v9;
}

@end