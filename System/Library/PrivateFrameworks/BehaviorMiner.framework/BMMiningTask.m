@interface BMMiningTask
+ (BOOL)supportsTaskSpecificEvents;
+ (id)supergreenMiningTask;
- (BMBasketExtractor)basketExtractor;
- (BMEventExtractor)eventExtractor;
- (BMMiningTask)init;
- (BMMiningTask)initWithDomain:(id)a3 types:(id)a4 targetTypes:(id)a5 samplingInterval:(double)a6 absoluteSupport:(unint64_t)a7 confidence:(double)a8 rulePersistBatchSize:(unint64_t)a9 miningInterval:(double)a10;
- (BMMiningTask)initWithStorageURL:(id)a3 types:(id)a4 targetTypes:(id)a5 samplingInterval:(double)a6 absoluteSupport:(unint64_t)a7 confidence:(double)a8;
- (BMMiningTask)initWithStorageURL:(id)a3 types:(id)a4 targetTypes:(id)a5 samplingInterval:(double)a6 absoluteSupport:(unint64_t)a7 confidence:(double)a8 rulePersistBatchSize:(unint64_t)a9;
- (BMMiningTask)initWithStorageURL:(id)a3 types:(id)a4 targetTypes:(id)a5 samplingInterval:(double)a6 absoluteSupport:(unint64_t)a7 confidence:(double)a8 rulePersistBatchSize:(unint64_t)a9 miningInterval:(double)a10;
- (BMMiningTaskConfig)bmMiningTaskConfig;
- (BMMiningTaskDelegate)delegate;
- (BMPatternMiner)patternMiner;
- (BMRuleExtractor)ruleExtractor;
- (BOOL)isFinished;
- (NSDate)start;
- (NSMutableDictionary)coreAnalyticsDict;
- (NSSet)targetTypes;
- (NSSet)types;
- (NSString)domain;
- (NSURL)storageURL;
- (double)confidence;
- (double)miningInterval;
- (double)samplingInterval;
- (int64_t)completionStatus;
- (unint64_t)absoluteSupport;
- (unint64_t)maxItemsetSize;
- (unint64_t)rulePersistBatchSize;
- (void)finishWithCompletionStatus:(int64_t)a3;
- (void)finishWithError:(id)a3;
- (void)mine;
- (void)setBasketExtractor:(id)a3;
- (void)setBmMiningTaskConfig:(id)a3;
- (void)setCompletionStatus:(int64_t)a3;
- (void)setCoreAnalyticsDict:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEventExtractor:(id)a3;
- (void)setMaxItemsetSize:(unint64_t)a3;
- (void)setPatternMiner:(id)a3;
- (void)setRuleExtractor:(id)a3;
- (void)setStart:(id)a3;
- (void)terminateEarly;
@end

@implementation BMMiningTask

- (BMMiningTask)initWithDomain:(id)a3 types:(id)a4 targetTypes:(id)a5 samplingInterval:(double)a6 absoluteSupport:(unint64_t)a7 confidence:(double)a8 rulePersistBatchSize:(unint64_t)a9 miningInterval:(double)a10
{
  id v18 = a3;
  id v19 = a5;
  id v20 = a4;
  v21 = BMStorageURLForDomain(v18);
  v22 = [(BMMiningTask *)self initWithStorageURL:v21 types:v20 targetTypes:v19 samplingInterval:a7 absoluteSupport:a9 confidence:a6 rulePersistBatchSize:a8 miningInterval:a10];

  if (v22)
  {
    uint64_t v23 = [v18 copy];
    domain = v22->_domain;
    v22->_domain = (NSString *)v23;
  }
  return v22;
}

- (BMMiningTask)initWithStorageURL:(id)a3 types:(id)a4 targetTypes:(id)a5 samplingInterval:(double)a6 absoluteSupport:(unint64_t)a7 confidence:(double)a8 rulePersistBatchSize:(unint64_t)a9
{
  return [(BMMiningTask *)self initWithStorageURL:a3 types:a4 targetTypes:a5 samplingInterval:a7 absoluteSupport:a9 confidence:a6 rulePersistBatchSize:a8 miningInterval:0.0];
}

- (BMMiningTask)initWithStorageURL:(id)a3 types:(id)a4 targetTypes:(id)a5 samplingInterval:(double)a6 absoluteSupport:(unint64_t)a7 confidence:(double)a8
{
  return [(BMMiningTask *)self initWithStorageURL:a3 types:a4 targetTypes:a5 samplingInterval:a7 absoluteSupport:500 confidence:a6 rulePersistBatchSize:a8 miningInterval:0.0];
}

- (BMMiningTask)initWithStorageURL:(id)a3 types:(id)a4 targetTypes:(id)a5 samplingInterval:(double)a6 absoluteSupport:(unint64_t)a7 confidence:(double)a8 rulePersistBatchSize:(unint64_t)a9 miningInterval:(double)a10
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  v30.receiver = self;
  v30.super_class = (Class)BMMiningTask;
  v21 = [(BMMiningTask *)&v30 init];
  v22 = v21;
  if (v21)
  {
    v21->_miningInterval = a10;
    v21->_completionStatus = -2;
    uint64_t v23 = [v18 copy];
    storageURL = v22->_storageURL;
    v22->_storageURL = (NSURL *)v23;

    objc_storeStrong((id *)&v22->_types, a4);
    objc_storeStrong((id *)&v22->_targetTypes, a5);
    v22->_samplingInterval = a6;
    v22->_absoluteSupport = a7;
    v22->_confidence = a8;
    v22->_rulePersistBatchSize = a9;
    v22->_maxItemsetSize = 0;
    v25 = objc_alloc_init(BMMiningTaskConfig);
    bmMiningTaskConfig = v22->_bmMiningTaskConfig;
    v22->_bmMiningTaskConfig = v25;

    uint64_t v27 = [MEMORY[0x263EFF9A0] dictionary];
    coreAnalyticsDict = v22->_coreAnalyticsDict;
    v22->_coreAnalyticsDict = (NSMutableDictionary *)v27;
  }
  return v22;
}

- (BMMiningTask)init
{
  id v19 = (void *)MEMORY[0x263EFFA08];
  id v18 = +[BMItemType locationIdentifier];
  uint64_t v23 = +[BMItemType interactionPhotoScene];
  v22 = +[BMItemType interactionPhotoContact];
  v2 = +[BMItemType interactionRecipients];
  v3 = +[BMItemType interactionContentURL];
  v4 = +[BMItemType interactionUTIType];
  v5 = +[BMItemType interactionSharingSourceBundleID];
  v6 = +[BMItemType interactionTargetBundleID];
  v7 = +[BMItemType interactionExtractedTopicFromAttachment];
  v8 = +[BMItemType bundleIdOfShareExtensionOpened];
  v9 = +[BMItemType bundleIdOfHostOpenedShareExtension];
  id v20 = objc_msgSend(v19, "setWithObjects:", v18, v23, v22, v2, v3, v4, v5, v6, v7, v8, v9, 0);

  v10 = (void *)MEMORY[0x263EFFA08];
  v11 = +[BMItemType interactionRecipients];
  v12 = +[BMItemType bundleIdOfShareExtensionOpened];
  v13 = +[BMItemType interactionTargetBundleID];
  v14 = objc_msgSend(v10, "setWithObjects:", v11, v12, v13, 0);

  v15 = +[BMBehaviorStorage defaultURL];
  v16 = [(BMMiningTask *)self initWithStorageURL:v15 types:v20 targetTypes:v14 samplingInterval:2 absoluteSupport:0.0 confidence:0.1];

  return v16;
}

+ (id)supergreenMiningTask
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = +[BMItemType relevanceIntentHash];
  v4 = +[BMItemType relevanceCoarseIntentHash];
  v5 = +[BMItemType relevanceAppActivityHash];
  v6 = +[BMItemType relevanceCoarseAppActivityHash];
  v7 = +[BMItemType locationIdentifier];
  v8 = objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, 0);

  v9 = [BMMiningTask alloc];
  v10 = +[BMBehaviorStorage defaultURL];
  v11 = [(BMMiningTask *)v9 initWithStorageURL:v10 types:v8 targetTypes:v8 samplingInterval:2 absoluteSupport:600.0 confidence:0.1];

  return v11;
}

+ (BOOL)supportsTaskSpecificEvents
{
  return 1;
}

- (void)finishWithError:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = BMLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[BMMiningTask finishWithError:]();
  }

  v7 = [(BMMiningTask *)v5 delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    v9 = [(BMMiningTask *)v5 delegate];
    [v9 miningTask:v5 didError:v4];
  }
  [(BMMiningTask *)v5 finishWithCompletionStatus:2];
  objc_sync_exit(v5);
}

- (void)finishWithCompletionStatus:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = self;
  objc_sync_enter(v4);
  if (![(BMMiningTask *)v4 isFinished])
  {
    v5 = [(BMMiningTask *)v4 start];
    [v5 timeIntervalSinceNow];
    double v7 = v6;

    char v8 = BMLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [NSNumber numberWithInteger:a3];
      int v13 = 134218242;
      double v14 = -v7;
      __int16 v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_21FF33000, v8, OS_LOG_TYPE_DEFAULT, "Finished behavioral mining with elapsed time %.2f seconds, completion status: %@.", (uint8_t *)&v13, 0x16u);
    }
    [(BMMiningTask *)v4 setCompletionStatus:a3];
    v10 = [(BMMiningTask *)v4 delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      v12 = [(BMMiningTask *)v4 delegate];
      [v12 miningTaskDidFinish:v4];
    }
  }
  objc_sync_exit(v4);
}

- (BOOL)isFinished
{
  return [(BMMiningTask *)self completionStatus] >= 0;
}

- (void)mine
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21FF33000, log, OS_LOG_TYPE_ERROR, "Attempting to start mining task when it is already mining.", v1, 2u);
}

BOOL __20__BMMiningTask_mine__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) delegate];
  char v5 = objc_opt_respondsToSelector();

  double v6 = v3;
  if (v5)
  {
    double v7 = [*(id *)(a1 + 32) delegate];
    double v6 = [v7 miningTask:*(void *)(a1 + 32) filteredRulesForExtractedRules:v3];
  }
  char v8 = [*(id *)(a1 + 32) delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    v10 = [*(id *)(a1 + 32) delegate];
    [v10 miningTask:*(void *)(a1 + 32) didExtractRules:v6];
  }
  id v11 = *(id *)(a1 + 32);
  objc_sync_enter(v11);
  v12 = *(void **)(a1 + 40);
  id v15 = 0;
  [v12 saveRules:v6 error:&v15];
  id v13 = v15;
  if (v13)
  {
    [*(id *)(a1 + 32) finishWithError:v13];
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [v3 count];
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += [v6 count];
  }

  objc_sync_exit(v11);
  return v13 != 0;
}

- (void)terminateEarly
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = BMLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_21FF33000, v3, OS_LOG_TYPE_DEFAULT, "Stopping mining task with early termination completion status.", v12, 2u);
  }

  id v4 = [(BMMiningTask *)v2 eventExtractor];

  if (v4)
  {
    char v5 = [(BMMiningTask *)v2 eventExtractor];
    [v5 terminateEarly];
  }
  double v6 = [(BMMiningTask *)v2 basketExtractor];

  if (v6)
  {
    double v7 = [(BMMiningTask *)v2 basketExtractor];
    [v7 terminateEarly];
  }
  char v8 = [(BMMiningTask *)v2 patternMiner];

  if (v8)
  {
    char v9 = [(BMMiningTask *)v2 patternMiner];
    [v9 terminateEarly];
  }
  v10 = [(BMMiningTask *)v2 ruleExtractor];

  if (v10)
  {
    id v11 = [(BMMiningTask *)v2 ruleExtractor];
    [v11 terminateEarly];
  }
  [(BMMiningTask *)v2 finishWithCompletionStatus:1];
  objc_sync_exit(v2);
}

- (BMMiningTaskDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BMMiningTaskDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)domain
{
  return self->_domain;
}

- (NSMutableDictionary)coreAnalyticsDict
{
  return self->_coreAnalyticsDict;
}

- (void)setCoreAnalyticsDict:(id)a3
{
}

- (int64_t)completionStatus
{
  return self->_completionStatus;
}

- (void)setCompletionStatus:(int64_t)a3
{
  self->_completionStatus = a3;
}

- (unint64_t)rulePersistBatchSize
{
  return self->_rulePersistBatchSize;
}

- (unint64_t)maxItemsetSize
{
  return self->_maxItemsetSize;
}

- (void)setMaxItemsetSize:(unint64_t)a3
{
  self->_maxItemsetSize = a3;
}

- (NSURL)storageURL
{
  return self->_storageURL;
}

- (double)miningInterval
{
  return self->_miningInterval;
}

- (NSDate)start
{
  return self->_start;
}

- (void)setStart:(id)a3
{
}

- (BMEventExtractor)eventExtractor
{
  return self->_eventExtractor;
}

- (void)setEventExtractor:(id)a3
{
}

- (BMBasketExtractor)basketExtractor
{
  return self->_basketExtractor;
}

- (void)setBasketExtractor:(id)a3
{
}

- (BMPatternMiner)patternMiner
{
  return self->_patternMiner;
}

- (void)setPatternMiner:(id)a3
{
}

- (BMRuleExtractor)ruleExtractor
{
  return self->_ruleExtractor;
}

- (void)setRuleExtractor:(id)a3
{
}

- (NSSet)types
{
  return self->_types;
}

- (NSSet)targetTypes
{
  return self->_targetTypes;
}

- (double)samplingInterval
{
  return self->_samplingInterval;
}

- (unint64_t)absoluteSupport
{
  return self->_absoluteSupport;
}

- (double)confidence
{
  return self->_confidence;
}

- (BMMiningTaskConfig)bmMiningTaskConfig
{
  return self->_bmMiningTaskConfig;
}

- (void)setBmMiningTaskConfig:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bmMiningTaskConfig, 0);
  objc_storeStrong((id *)&self->_targetTypes, 0);
  objc_storeStrong((id *)&self->_types, 0);
  objc_storeStrong((id *)&self->_ruleExtractor, 0);
  objc_storeStrong((id *)&self->_patternMiner, 0);
  objc_storeStrong((id *)&self->_basketExtractor, 0);
  objc_storeStrong((id *)&self->_eventExtractor, 0);
  objc_storeStrong((id *)&self->_start, 0);
  objc_storeStrong((id *)&self->_storageURL, 0);
  objc_storeStrong((id *)&self->_coreAnalyticsDict, 0);
  objc_storeStrong((id *)&self->_domain, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)finishWithError:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_21FF33000, v0, OS_LOG_TYPE_ERROR, "Finished with error: %@", v1, 0xCu);
}

@end