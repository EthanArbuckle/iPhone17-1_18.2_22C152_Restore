@interface ATXMLActionProducer
+ (id)consumerSubTypesToUpdate;
+ (id)predictionChunksForActionResults:(id)a3;
- (ATXMLActionProducer)init;
- (BOOL)_writeIntermediateCacheForConsumerSubType:(unsigned __int8)a3 actionPredictionCandidates:(id)a4 remainingPredictionItems:(void *)a5;
- (BOOL)writeCacheIfNotExistsForConsumerSubType:(unsigned __int8)a3;
- (id)_cachePathForConsumerSubtype:(unsigned __int8)a3;
- (id)_getActionsFromCacheForConsumerSubType:(unsigned __int8)a3 cacheFileData:(id)a4;
- (id)consumerSubTypesToInvalidateForTTL:(double)a3 disabledConsumerSubTypes:(id)a4 shouldOverrideRefreshRateForDisabledConsumerSubTypes:(BOOL)a5;
- (id)lockscreenActionsFromPredictions:(id)a3;
- (id)produceActions;
- (void)invalidateCacheForConsumerSubType:(unsigned __int8)a3 actionPredictionCandidates:(id)a4 remainingPredictionItems:()vector<ATXPredictionItem;
- (void)invalidateCacheForConsumerSubTypes:(id)a3 featureCache:(id)a4;
- (void)produceActions;
- (void)readCacheAndSendFilteredResultsToBlendingForConsumerSubType:(unsigned __int8)a3;
- (void)updateBlendingLayerForAllConsumerSubTypes;
- (void)updateBlendingLayerForConsumerSubType:(unsigned __int8)a3;
- (void)updateBlendingLayerForHomeScreen;
- (void)updateBlendingLayerForLockscreen;
- (void)updateBlendingLayerForSettings;
- (void)updateBlendingLayerForSpotlight;
@end

@implementation ATXMLActionProducer

- (ATXMLActionProducer)init
{
  v7.receiver = self;
  v7.super_class = (Class)ATXMLActionProducer;
  v2 = [(ATXMLActionProducer *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F4B650] appPredictionDirectory];
    uint64_t v4 = [v3 stringByAppendingPathComponent:@"caches/ATXCacheFile"];
    cacheBasePath = v2->_cacheBasePath;
    v2->_cacheBasePath = (NSString *)v4;
  }
  return v2;
}

- (id)produceActions
{
  v3 = objc_opt_new();
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F4AF38]) initWithCacheBasePath:self->_cacheBasePath];
  BOOL v5 = [(ATXMLActionProducer *)self writeCacheIfNotExistsForConsumerSubType:21];
  v6 = [(ATXMLActionProducer *)self _cachePathForConsumerSubtype:21];
  objc_super v7 = [v4 readCacheFileForCachePath:v6];

  if (v7) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = v5;
  }
  if (v8)
  {
    v9 = __atxlog_handle_default();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[ATXMLActionProducer produceActions](v9);
    }
  }
  if (v5)
  {
    uint64_t v10 = [(ATXMLActionProducer *)self _getActionsFromCacheForConsumerSubType:21 cacheFileData:v7];

    v3 = (void *)v10;
  }

  return v3;
}

- (BOOL)writeCacheIfNotExistsForConsumerSubType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  BOOL v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  v6 = [(ATXMLActionProducer *)self _cachePathForConsumerSubtype:v3];
  char v7 = [v5 fileExistsAtPath:v6];

  if (v7) {
    return 1;
  }
  memset(v11, 0, sizeof(v11));
  v9 = +[ATXActionPredictions _actionPredictionCandidatesForCandidateBundleIdentifiers:0 candidateActiontypes:0 firstStageScoreLogger:0 secondStageScoreLogger:0 multiStageScoreLogger:0 featureCache:0 remainingPredictionItems:v11];
  BOOL v8 = [(ATXMLActionProducer *)self _writeIntermediateCacheForConsumerSubType:v3 actionPredictionCandidates:v9 remainingPredictionItems:v11];

  v12 = (void **)v11;
  std::vector<ATXPredictionItem>::__destroy_vector::operator()[abi:ne180100](&v12);
  return v8;
}

- (id)_getActionsFromCacheForConsumerSubType:(unsigned __int8)a3 cacheFileData:(id)a4
{
  uint64_t v4 = a3;
  id v5 = a4;
  v6 = objc_opt_new();
  if (v5)
  {
    char v7 = (void *)MEMORY[0x1D25F6CC0]();
    BOOL v8 = [[ATXActionCacheReader alloc] initWithData:v5];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __76__ATXMLActionProducer__getActionsFromCacheForConsumerSubType_cacheFileData___block_invoke;
    v13[3] = &unk_1E68AD668;
    id v9 = v6;
    id v14 = v9;
    [(ATXActionCacheReader *)v8 enumerateActionsAndPredictionItemsForConsumerSubtype:v4 limit:0x7FFFFFFFLL block:v13];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __76__ATXMLActionProducer__getActionsFromCacheForConsumerSubType_cacheFileData___block_invoke_2;
    void v11[3] = &unk_1E68AD690;
    id v12 = v9;
    [(ATXActionCacheReader *)v8 enumerateExtraPredictionItemsWithBlock:v11];
  }

  return v6;
}

void __76__ATXMLActionProducer__getActionsFromCacheForConsumerSubType_cacheFileData___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  id v5 = [ATXActionResult alloc];
  v6 = [v9 predictedItem];
  char v7 = [v6 actionKey];
  BOOL v8 = [(ATXActionResult *)v5 initWithScoredAction:v9 predictionItem:a3 actionKey:v7];

  [*(id *)(a1 + 32) addObject:v8];
}

void __76__ATXMLActionProducer__getActionsFromCacheForConsumerSubType_cacheFileData___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [[ATXActionResult alloc] initWithScoredAction:0 predictionItem:a2 actionKey:@"predictionItem"];
  objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

- (id)consumerSubTypesToInvalidateForTTL:(double)a3 disabledConsumerSubTypes:(id)a4 shouldOverrideRefreshRateForDisabledConsumerSubTypes:(BOOL)a5
{
  id v8 = a4;
  id v9 = [(id)objc_opt_class() consumerSubTypesToUpdate];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __136__ATXMLActionProducer_consumerSubTypesToInvalidateForTTL_disabledConsumerSubTypes_shouldOverrideRefreshRateForDisabledConsumerSubTypes___block_invoke;
  v13[3] = &unk_1E68AD6B8;
  double v16 = a3;
  BOOL v17 = a5;
  id v10 = v8;
  id v14 = v10;
  v15 = self;
  v11 = objc_msgSend(v9, "_pas_filteredArrayWithTest:", v13);

  return v11;
}

BOOL __136__ATXMLActionProducer_consumerSubTypesToInvalidateForTTL_disabledConsumerSubTypes_shouldOverrideRefreshRateForDisabledConsumerSubTypes___block_invoke(uint64_t a1, void *a2)
{
  unsigned __int8 v3 = [a2 intValue];
  double v4 = *(double *)(a1 + 48);
  if (*(unsigned char *)(a1 + 56))
  {
    id v5 = *(void **)(a1 + 32);
    v6 = [NSNumber numberWithUnsignedChar:v3];
    LODWORD(v5) = [v5 containsObject:v6];

    if (v5)
    {
      char v7 = +[_ATXGlobals sharedInstance];
      [v7 cacheRefreshIntervalForDisabledActionConsumerSubType];
      double v4 = v8;
    }
  }
  id v9 = [*(id *)(a1 + 40) _cachePathForConsumerSubtype:v3];
  BOOL v10 = +[ATXFileUtil shouldUpdateCache:v9 withRefreshRate:v4];

  return v10;
}

+ (id)consumerSubTypesToUpdate
{
  if (+[ATXMLActionProducer consumerSubTypesToUpdate]::onceToken != -1) {
    dispatch_once(&+[ATXMLActionProducer consumerSubTypesToUpdate]::onceToken, &__block_literal_global_38);
  }
  v2 = (void *)+[ATXMLActionProducer consumerSubTypesToUpdate]::consumerSubTypesToUpdate;
  return v2;
}

void __47__ATXMLActionProducer_consumerSubTypesToUpdate__block_invoke()
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1D25F6CC0]();
  v0 = objc_opt_new();
  v1 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v2 = [&unk_1F27F2AF0 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v12;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v12 != v3) {
          objc_enumerationMutation(&unk_1F27F2AF0);
        }
        id v5 = *(void **)(*((void *)&v11 + 1) + 8 * v4);
        v6 = [MEMORY[0x1E4F4AEE8] sharedInstanceWithMobileAssets];
        char v7 = objc_msgSend(v6, "getAssetFileAndSubscoreForConsumerSubType:", objc_msgSend(v5, "intValue"));

        if (([v0 containsObject:v7] & 1) == 0)
        {
          [v1 addObject:v5];
          [v0 addObject:v7];
        }

        ++v4;
      }
      while (v2 != v4);
      uint64_t v2 = [&unk_1F27F2AF0 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v2);
  }
  uint64_t v8 = [v1 copy];
  id v9 = (void *)+[ATXMLActionProducer consumerSubTypesToUpdate]::consumerSubTypesToUpdate;
  +[ATXMLActionProducer consumerSubTypesToUpdate]::consumerSubTypesToUpdate = v8;
}

- (void)invalidateCacheForConsumerSubTypes:(id)a3 featureCache:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v18 = 0;
  v19 = 0;
  uint64_t v20 = 0;
  char v7 = +[ATXActionPredictions _actionPredictionCandidatesForCandidateBundleIdentifiers:0 candidateActiontypes:0 firstStageScoreLogger:0 secondStageScoreLogger:0 multiStageScoreLogger:0 featureCache:a4 remainingPredictionItems:&v18];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        unsigned __int8 v12 = [*(id *)(*((void *)&v14 + 1) + 8 * v11) unsignedIntegerValue];
        memset(v13, 0, sizeof(v13));
        std::vector<ATXPredictionItem>::__init_with_size[abi:ne180100]<ATXPredictionItem*,ATXPredictionItem*>(v13, v18, v19, 0xDAB7EC1DD3431B57 * (((char *)v19 - (char *)v18) >> 5));
        [(ATXMLActionProducer *)self invalidateCacheForConsumerSubType:v12 actionPredictionCandidates:v7 remainingPredictionItems:v13];
        v21 = (id **)v13;
        std::vector<ATXPredictionItem>::__destroy_vector::operator()[abi:ne180100]((void ***)&v21);
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v9);
  }

  v21 = &v18;
  std::vector<ATXPredictionItem>::__destroy_vector::operator()[abi:ne180100]((void ***)&v21);
}

- (void)invalidateCacheForConsumerSubType:(unsigned __int8)a3 actionPredictionCandidates:(id)a4 remainingPredictionItems:()vector<ATXPredictionItem
{
  uint64_t v6 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = __atxlog_handle_default();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:v6];
    int v15 = 138412290;
    long long v16 = v10;
    _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEFAULT, "Invalidating intermediate ML cache for %@ and attempting to replace it with new one", (uint8_t *)&v15, 0xCu);
  }
  BOOL v11 = [(ATXMLActionProducer *)self _writeIntermediateCacheForConsumerSubType:v6 actionPredictionCandidates:v8 remainingPredictionItems:a5];
  unsigned __int8 v12 = [MEMORY[0x1E4F4B2A0] sharedInstance];
  [v12 clearRecentMLEngagementsExceptForActions:0];

  if (v11)
  {
    long long v13 = __atxlog_handle_default();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      long long v14 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:v6];
      int v15 = 138412290;
      long long v16 = v14;
      _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_DEFAULT, "Intermediate ML cache for %@ successfully replaced", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (BOOL)_writeIntermediateCacheForConsumerSubType:(unsigned __int8)a3 actionPredictionCandidates:(id)a4 remainingPredictionItems:(void *)a5
{
  uint64_t v6 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = NSNumber;
  uint64_t v10 = +[_ATXGlobals sharedInstance];
  [v10 predictionsPerAppActionLimit];
  BOOL v11 = objc_msgSend(v9, "numberWithDouble:");
  unsigned __int8 v12 = +[ATXActionPredictions _predictionsForConsumerSubType:v6 thirdStageScoreLogger:0 multiStageScoreLogger:0 actionPredictionCandidates:v8 remainingPredictionItems:a5 predictionsPerAppActionLimit:v11];

  long long v13 = [(id)objc_opt_class() predictionChunksForActionResults:v12];
  long long v14 = [(ATXMLActionProducer *)self _cachePathForConsumerSubtype:v6];
  char v15 = ATXWriteActionPredictionChunks(v14, v13);

  if ((v15 & 1) == 0)
  {
    long long v16 = __atxlog_handle_default();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:v6];
      -[ATXMLActionProducer _writeIntermediateCacheForConsumerSubType:actionPredictionCandidates:remainingPredictionItems:](v17, v19, v16);
    }
  }
  return v15;
}

+ (id)predictionChunksForActionResults:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "scoredAction", (void)v16);
        BOOL v11 = v10 == 0;

        if (!v11)
        {
          unsigned __int8 v12 = [v9 scoredAction];
          [v4 addObject:v12];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  long long v13 = +[ATXDisplayCacheLockscreenFilter indicesOfLockScreenActionsForActionPredictions:v4];
  long long v14 = +[ATXActionCacheBuilder serializedChunksFromActionPredictionResults:v5 lockscreenPredictionIndices:v13];

  return v14;
}

- (void)updateBlendingLayerForAllConsumerSubTypes
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v3 = [&unk_1F27F2B08 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(&unk_1F27F2B08);
        }
        -[ATXMLActionProducer updateBlendingLayerForConsumerSubType:](self, "updateBlendingLayerForConsumerSubType:", [*(id *)(*((void *)&v6 + 1) + 8 * v5++) intValue]);
      }
      while (v3 != v5);
      uint64_t v3 = [&unk_1F27F2B08 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)updateBlendingLayerForConsumerSubType:(unsigned __int8)a3
{
  if ((int)a3 > 37)
  {
    if (a3 == 46)
    {
      [(ATXMLActionProducer *)self updateBlendingLayerForSettings];
    }
    else if (a3 == 38)
    {
      [(ATXMLActionProducer *)self updateBlendingLayerForHomeScreen];
    }
  }
  else if (a3 == 21)
  {
    [(ATXMLActionProducer *)self updateBlendingLayerForSpotlight];
  }
  else if (a3 == 22)
  {
    [(ATXMLActionProducer *)self updateBlendingLayerForLockscreen];
  }
}

- (void)updateBlendingLayerForLockscreen
{
}

- (void)updateBlendingLayerForHomeScreen
{
  if ([MEMORY[0x1E4F4AE68] shouldDisplayRecentActionsOnHomeScreen])
  {
    id v5 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:11];
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F4AE68], "actionResponseForDeveloperModeWithClientId:shouldShowRecentDonations:");
    uint64_t v4 = [v3 proactiveSuggestions];
    +[ATXActionBlendingUpdater updateBlendingLayerWithRecentShortcuts:v4];
  }
  else
  {
    id v6 = (id)objc_opt_new();
    +[ATXActionBlendingUpdater updateBlendingLayerWithRecentShortcuts:](ATXActionBlendingUpdater, "updateBlendingLayerWithRecentShortcuts:");

    +[ATXActionBlendingUpdater updateBlendingLayerWithFallbackActions];
    [(ATXMLActionProducer *)self readCacheAndSendFilteredResultsToBlendingForConsumerSubType:38];
  }
}

- (void)updateBlendingLayerForSpotlight
{
}

- (void)updateBlendingLayerForSettings
{
}

- (void)readCacheAndSendFilteredResultsToBlendingForConsumerSubType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F4AF38]) initWithCacheBasePath:self->_cacheBasePath];
  BOOL v6 = [(ATXMLActionProducer *)self writeCacheIfNotExistsForConsumerSubType:v3];
  long long v7 = [(ATXMLActionProducer *)self _cachePathForConsumerSubtype:v3];
  long long v8 = [v5 readCacheFileForCachePath:v7];

  if (v8) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = v6;
  }
  if (v9)
  {
    uint64_t v10 = __atxlog_handle_blending();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      uint64_t v11 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:v3];
      [(ATXMLActionProducer *)v11 readCacheAndSendFilteredResultsToBlendingForConsumerSubType:v10];
    }
  }
  unsigned __int8 v12 = objc_opt_new();
  if (v6)
  {
    uint64_t v13 = [(ATXMLActionProducer *)self _getActionsFromCacheForConsumerSubType:v3 cacheFileData:v8];

    unsigned __int8 v12 = (void *)v13;
  }
  long long v14 = __atxlog_handle_default();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    char v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = [v12 count];
    long long v18 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:v3];
    int v28 = 138412802;
    id v29 = v16;
    __int16 v30 = 2048;
    uint64_t v31 = v17;
    __int16 v32 = 2112;
    v33 = v18;
    _os_log_impl(&dword_1D0FA3000, v14, OS_LOG_TYPE_DEFAULT, "%@ - readCacheAndSendFilteredResultsToBlendingForConsumerSubType read %lu predictions for consumerSubType: %@", (uint8_t *)&v28, 0x20u);
  }
  long long v19 = +[ATXActionPredictions filterHighQualityActionResults:v12 consumerSubType:v3];

  uint64_t v20 = __atxlog_handle_default();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = [v19 count];
    v24 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:v3];
    int v28 = 138412802;
    id v29 = v22;
    __int16 v30 = 2048;
    uint64_t v31 = v23;
    __int16 v32 = 2112;
    v33 = v24;
    _os_log_impl(&dword_1D0FA3000, v20, OS_LOG_TYPE_DEFAULT, "%@ - readCacheAndSendFilteredResultsToBlendingForConsumerSubType has %lu predictions after filtering for consumerSubType: %@", (uint8_t *)&v28, 0x20u);
  }
  v25 = [(id)objc_opt_class() predictionChunksForActionResults:v19];
  v26 = ATXCacheFileJoinChunks();

  if (v3 == 22)
  {
    v27 = [(ATXMLActionProducer *)self lockscreenActionsFromPredictions:v19];
    +[ATXActionBlendingUpdater updateBlendingLayerWithLockscreenActions:v27 feedbackMetadata:v26];
  }
  else
  {
    +[ATXActionBlendingUpdater updateBlendingLayerWithBehavioralPredictions:v19 feedbackMetadata:v26 consumerSubType:v3];
  }
}

- (id)lockscreenActionsFromPredictions:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__18;
  v27 = __Block_byref_object_dispose__18;
  id v28 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__18;
  v21[4] = __Block_byref_object_dispose__18;
  id v22 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__ATXMLActionProducer_lockscreenActionsFromPredictions___block_invoke;
  aBlock[3] = &unk_1E68AD6E0;
  aBlock[4] = v21;
  aBlock[5] = &v23;
  uint64_t v4 = _Block_copy(aBlock);
  id v5 = objc_msgSend(v3, "atx_actionsFromActionResults");
  BOOL v6 = +[ATXDisplayCacheLockscreenFilter indicesOfLockScreenActionsForActionPredictions:v5 criteria:v4];
  long long v7 = [v5 objectsAtIndexes:v6];
  if ([v7 count])
  {
    long long v8 = [v7 firstObject];
    BOOL v9 = [v8 predictedItem];
    if ([v9 isTVWhiteListedLongFormMedia])
    {
      uint64_t v10 = [(id)v24[5] predictedRouteInfo];
      BOOL v11 = v10 == 0;

      if (v11)
      {
LABEL_6:
        id v16 = __atxlog_handle_blending();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v17 = [v8 predictedItem];
          *(_DWORD *)buf = 138412290;
          uint64_t v31 = v17;
          _os_log_impl(&dword_1D0FA3000, v16, OS_LOG_TYPE_DEFAULT, "lockscreen: Sending prediction to lockscreen: %@", buf, 0xCu);
        }
        id v29 = v8;
        long long v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
        goto LABEL_12;
      }
      unsigned __int8 v12 = [v8 predictedItem];
      uint64_t v13 = [(id)v24[5] predictedRouteInfo];
      BOOL v9 = [v12 actionWithRouteInfo:v13];

      id v14 = objc_alloc(MEMORY[0x1E4F4B2B0]);
      [v8 score];
      uint64_t v15 = objc_msgSend(v14, "initWithPredictedItem:score:", v9);

      long long v8 = v15;
    }

    goto LABEL_6;
  }
  long long v8 = __atxlog_handle_blending();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "lockscreen: clearing suggestions because no suggestions received", buf, 2u);
  }
  long long v18 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_12:

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(&v23, 8);

  return v18;
}

uint64_t __56__ATXMLActionProducer_lockscreenActionsFromPredictions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 predictedItem];
  if (![v3 isTVWhiteListedLongFormMedia])
  {
    if (![v3 isTVAction])
    {
      uint64_t v16 = 1;
      goto LABEL_16;
    }
    uint64_t v17 = __atxlog_handle_default();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      __56__ATXMLActionProducer_lockscreenActionsFromPredictions___block_invoke_cold_1(v17);
    }

    goto LABEL_12;
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    uint64_t v4 = objc_opt_new();
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    BOOL v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    if ([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) isTVExperienceAppNowPlaying])
    {
LABEL_12:
      uint64_t v16 = 0;
      goto LABEL_16;
    }
  }
  long long v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F4AE30]);
    BOOL v9 = +[_ATXGlobals sharedInstance];
    [v9 predictedRouteAcceptThreshold];
    *(float *)&double v10 = v10;
    uint64_t v11 = [v8 initWithAcceptThreshold:0 avRoutingSessionManager:v10];
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    long long v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  id v14 = [v7 predictedRouteInfo];
  if (v14)
  {
    uint64_t v15 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) predictedRouteInfo];
    uint64_t v16 = [v15 isExternalRoute];
  }
  else
  {
    uint64_t v16 = 0;
  }

LABEL_16:
  return v16;
}

- (id)_cachePathForConsumerSubtype:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  uint64_t v5 = [MEMORY[0x1E4F4AEE8] sharedInstanceWithMobileAssets];
  BOOL v6 = [v5 getFullCachePathWithBaseCachePath:self->_cacheBasePath consumerSubType:v3];

  return v6;
}

- (void).cxx_destruct
{
}

- (void)produceActions
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "While producing actions in the display cache, failed to read cache file data for Spotlight, although the cache is supposed to exist.", v1, 2u);
}

- (void)_writeIntermediateCacheForConsumerSubType:(void *)a1 actionPredictionCandidates:(uint8_t *)buf remainingPredictionItems:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "Failed to write intermediate cache for consumerSubType: %@", buf, 0xCu);
}

- (void)readCacheAndSendFilteredResultsToBlendingForConsumerSubType:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "While updating predictions for blending, failed to read cache file data for %@, although the cache is supposed to exist.", buf, 0xCu);
}

void __56__ATXMLActionProducer_lockscreenActionsFromPredictions___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "Prevented showing a TV intent which is not a TVWhiteListedLongFormMedia", v1, 2u);
}

@end