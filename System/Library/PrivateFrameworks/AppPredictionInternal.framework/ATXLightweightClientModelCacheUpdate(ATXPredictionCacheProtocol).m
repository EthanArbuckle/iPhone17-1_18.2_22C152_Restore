@interface ATXLightweightClientModelCacheUpdate(ATXPredictionCacheProtocol)
- (id)identifierForPredictionAtIndex:()ATXPredictionCacheProtocol;
- (uint64_t)confidenceCategoryForPredictionAtIndex:()ATXPredictionCacheProtocol;
- (uint64_t)numberOfPredictionsWithConfidence:()ATXPredictionCacheProtocol;
@end

@implementation ATXLightweightClientModelCacheUpdate(ATXPredictionCacheProtocol)

- (id)identifierForPredictionAtIndex:()ATXPredictionCacheProtocol
{
  v5 = [a1 suggestions];
  unint64_t v6 = [v5 count];

  if (v6 <= a3)
  {
    v9 = 0;
  }
  else
  {
    v7 = [a1 suggestions];
    v8 = [v7 objectAtIndexedSubscript:a3];
    v9 = [v8 executableIdentifier];
  }
  return v9;
}

- (uint64_t)confidenceCategoryForPredictionAtIndex:()ATXPredictionCacheProtocol
{
  v5 = [a1 suggestions];
  unint64_t v6 = [v5 count];

  if (v6 <= a3) {
    return 0;
  }
  v7 = [a1 suggestions];
  v8 = [v7 objectAtIndexedSubscript:a3];
  v9 = [v8 scoreSpecification];
  uint64_t v10 = [v9 suggestedConfidenceCategory];

  return v10;
}

- (uint64_t)numberOfPredictionsWithConfidence:()ATXPredictionCacheProtocol
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = objc_msgSend(a1, "suggestions", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) scoreSpecification];
        uint64_t v11 = [v10 suggestedConfidenceCategory];

        if (v11 == a3) {
          ++v7;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

@end