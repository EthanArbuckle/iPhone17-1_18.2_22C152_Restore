@interface ATXActionCacheBuilder
+ (id)serializedChunksFromActionPredictionResults:(id)a3 lockscreenPredictionIndices:(id)a4;
+ (id)serializedDataFromActionPredictionResults:(id)a3 lockscreenPredictionIndices:(id)a4;
@end

@implementation ATXActionCacheBuilder

+ (id)serializedDataFromActionPredictionResults:(id)a3 lockscreenPredictionIndices:(id)a4
{
  v4 = +[ATXActionCacheBuilder serializedChunksFromActionPredictionResults:a3 lockscreenPredictionIndices:a4];
  v5 = ATXCacheFileJoinChunks();

  return v5;
}

+ (id)serializedChunksFromActionPredictionResults:(id)a3 lockscreenPredictionIndices:(id)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  id v42 = a4;
  v5 = [MEMORY[0x1E4F4AE28] abGroupForConsumerSubType:24];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F4AE28] abGroupNilString];
  }
  id v8 = v7;

  v38 = v8;
  v9 = [MEMORY[0x1E4F4AE28] abGroupForConsumerSubType:25];
  v10 = v9;
  if (v9)
  {
    id v41 = v9;
  }
  else
  {
    id v41 = [MEMORY[0x1E4F4AE28] abGroupNilString];
  }

  v11 = [MEMORY[0x1E4F4AE28] abGroupForConsumerSubType:27];
  v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [MEMORY[0x1E4F4AE28] abGroupNilString];
  }
  id v14 = v13;

  v39 = v14;
  v43 = [NSString stringWithFormat:@"%@:%@:%@", v8, v41, v14];
  uint64_t v15 = [MEMORY[0x1E4F4AF08] version];
  v47 = objc_opt_new();
  v46 = (void *)[objc_alloc(MEMORY[0x1E4F4B060]) initWithABGroup:v43 assetVersion:v15];
  v44 = (void *)[objc_alloc(MEMORY[0x1E4F4B060]) initWithABGroup:v43 assetVersion:v15];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = v40;
  uint64_t v16 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
  if (v16)
  {
    uint64_t v17 = 0;
    uint64_t v18 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v53 != v18) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        v21 = (void *)MEMORY[0x1D25F6CC0]();
        v22 = [v20 scoredAction];
        if (v22)
        {
          id location = 0;
          *((float *)&v51[409] + 1) = -31337.0;
          uint64_t v23 = 16;
          LOWORD(v51[410]) = 0;
          do
          {
            *(float *)((char *)&v51[-1] + v23) = -31337.0;
            v23 += 4;
          }
          while (v23 != 3284);
          if ([v20 predictionItem])
          {
            v24 = (id *)[v20 predictionItem];
            objc_storeStrong(&location, *v24);
            memcpy(v51, v24 + 1, 0xCD2uLL);
          }
          v25 = [v22 predictedItem];
          [v25 setTitleForSerializationToCache];
          [v25 setSubtitleForSerializationToCache];
          [v22 score];
          objc_msgSend(v47, "recordPrediction:score:", v25);
          v26 = [NSNumber numberWithInteger:v17];
          LODWORD(v27) = HIDWORD(v51[409]);
          [v46 recordPrediction:v26 actionHash:v51[0] totalScore:&v51[1] scoreInputs:LOBYTE(v51[410]) isMediumConfidenceForBlendingLayer:BYTE1(v51[410]) isHighConfidenceForBlendingLayer:v27];

          ++v17;
        }
        else if ([v20 predictionItem])
        {
          uint64_t v28 = [v20 predictionItem];
          LODWORD(v29) = *(_DWORD *)(v28 + 3284);
          [v44 recordPrediction:*(void *)v28 actionHash:*(void *)(v28 + 8) totalScore:v28 + 16 scoreInputs:*(unsigned __int8 *)(v28 + 3288) isMediumConfidenceForBlendingLayer:*(unsigned __int8 *)(v28 + 3289) isHighConfidenceForBlendingLayer:v29];
        }
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
    }
    while (v16);
  }

  v30 = [v47 finish];
  v31 = objc_opt_new();
  [v42 count];
  ATXCacheAppendInteger();
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __97__ATXActionCacheBuilder_serializedChunksFromActionPredictionResults_lockscreenPredictionIndices___block_invoke;
  v48[3] = &unk_1E68B1BA0;
  id v32 = v31;
  id v49 = v32;
  [v42 enumerateIndexesUsingBlock:v48];
  v33 = [v46 finish];
  v34 = [v44 finish];
  v56[0] = v30;
  v35 = (void *)[v32 copy];
  v56[1] = v35;
  v56[2] = v33;
  v56[3] = v34;
  v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:4];

  return v36;
}

uint64_t __97__ATXActionCacheBuilder_serializedChunksFromActionPredictionResults_lockscreenPredictionIndices___block_invoke()
{
  return ATXCacheAppendInteger();
}

@end