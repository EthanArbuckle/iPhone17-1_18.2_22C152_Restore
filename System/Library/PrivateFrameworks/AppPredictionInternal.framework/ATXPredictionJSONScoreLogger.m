@interface ATXPredictionJSONScoreLogger
+ (id)sharedInstance;
- (ATXPredictionJSONScoreLogger)init;
- (void)flush;
- (void)flushWithCompletion:(id)a3;
- (void)flushWithCompletion:(id)a3 filenameSuffix:(id)a4;
- (void)flushWithFilenameSuffix:(id)a3;
- (void)logInputDict:(id)a3 subscores:(id)a4 forBundleId:(id)a5;
- (void)logInputs:(id)a3 subscores:(id)a4 forBundleId:(id)a5;
- (void)setAssetVersion:(unint64_t)a3;
- (void)setCacheAge:(double)a3;
- (void)setConsumerSubType:(unsigned __int8)a3;
- (void)setPredictionClass:(id)a3;
@end

@implementation ATXPredictionJSONScoreLogger

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_8 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_8, &__block_literal_global_71);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_10;
  return v2;
}

void __46__ATXPredictionJSONScoreLogger_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_10;
  sharedInstance__pasExprOnceResult_10 = v1;
}

- (ATXPredictionJSONScoreLogger)init
{
  v25.receiver = self;
  v25.super_class = (Class)ATXPredictionJSONScoreLogger;
  v2 = [(ATXPredictionJSONScoreLogger *)&v25 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    history = v2->_history;
    v2->_history = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    [(NSMutableDictionary *)v2->_history setObject:v5 forKeyedSubscript:@"predictionSubScores"];

    uint64_t v6 = objc_opt_new();
    subscoreHistories = v2->_subscoreHistories;
    v2->_subscoreHistories = (NSMutableArray *)v6;

    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    id v10 = [v9 stringByAppendingString:@"-fast"];
    v11 = (const char *)[v10 UTF8String];
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v14 = dispatch_queue_create(v11, v13);
    fastQueue = v2->_fastQueue;
    v2->_fastQueue = (OS_dispatch_queue *)v14;

    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    id v18 = [v17 stringByAppendingString:@"-slow"];
    v19 = (const char *)[v18 UTF8String];
    v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v21 = dispatch_queue_attr_make_with_qos_class(v20, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v22 = dispatch_queue_create(v19, v21);
    slowQueue = v2->_slowQueue;
    v2->_slowQueue = (OS_dispatch_queue *)v22;
  }
  return v2;
}

- (void)logInputs:(id)a3 subscores:(id)a4 forBundleId:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([MEMORY[0x1E4F93B08] shouldIncludePredictionLogs])
  {
    id v10 = +[ATXScoreDict scoreDictFromDictionary:v12];
    v11 = +[ATXScoreDict scoreDictFromDictionary:v8];
    [(ATXPredictionJSONScoreLogger *)self logInputDict:v10 subscores:v11 forBundleId:v9];
  }
}

- (void)logInputDict:(id)a3 subscores:(id)a4 forBundleId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([MEMORY[0x1E4F93B08] shouldIncludePredictionLogs])
  {
    if (v8)
    {
      if (v9)
      {
        if (v10)
        {
          fastQueue = self->_fastQueue;
          v34[0] = MEMORY[0x1E4F143A8];
          v34[1] = 3221225472;
          v34[2] = __67__ATXPredictionJSONScoreLogger_logInputDict_subscores_forBundleId___block_invoke;
          v34[3] = &unk_1E68AC3B8;
          v34[4] = self;
          id v35 = v10;
          id v36 = v8;
          id v37 = v9;
          dispatch_async(fastQueue, v34);

          goto LABEL_13;
        }
        id v12 = __atxlog_handle_default();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[ATXPredictionJSONScoreLogger logInputDict:subscores:forBundleId:](v12, v27, v28, v29, v30, v31, v32, v33);
        }
      }
      else
      {
        id v12 = __atxlog_handle_default();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[ATXPredictionJSONScoreLogger logInputDict:subscores:forBundleId:](v12, v20, v21, v22, v23, v24, v25, v26);
        }
      }
    }
    else
    {
      id v12 = __atxlog_handle_default();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[ATXPredictionJSONScoreLogger logInputDict:subscores:forBundleId:](v12, v13, v14, v15, v16, v17, v18, v19);
      }
    }
  }
LABEL_13:
}

void __67__ATXPredictionJSONScoreLogger_logInputDict_subscores_forBundleId___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v2 = NSNumber;
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  [v3 timeIntervalSince1970];
  v4 = objc_msgSend(v2, "numberWithDouble:");
  [*(id *)(*(void *)(a1 + 32) + 8) setObject:v4 forKeyedSubscript:@"secondsSince1970"];

  v5 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:@"predictionSubScores"];
  unint64_t v6 = [v5 count];

  if ([MEMORY[0x1E4F4B680] consumerTypeForSubType:*(unsigned __int8 *)(*(void *)(a1 + 32) + 16)] != 8
    || v6 > 0x63)
  {
    if ([MEMORY[0x1E4F4B680] consumerTypeForSubType:*(unsigned __int8 *)(*(void *)(a1 + 32) + 16)] == 9)
    {
      if (v6 >= 0xFA)
      {
        [*(id *)(a1 + 56) scoreForKey:@"TotalScore" found:0];
        goto LABEL_11;
      }
    }
    else if ([MEMORY[0x1E4F4B680] consumerTypeForSubType:*(unsigned __int8 *)(*(void *)(a1 + 32) + 16)] != 10|| v6 >= 0xFA)
    {
      [*(id *)(a1 + 56) scoreForKey:@"TotalScore" found:0];
      if (!v6)
      {
LABEL_15:
        v7 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:@"predictionSubScores"];
        long long v24 = *(_OWORD *)(a1 + 40);
        v23[0] = @"bundleId";
        v23[1] = @"inputs";
        v23[2] = @"subscores";
        uint64_t v25 = *(void *)(a1 + 56);
        id v8 = (void *)MEMORY[0x1E4F1C9E8];
        id v9 = &v24;
        id v10 = v23;
        goto LABEL_16;
      }
LABEL_11:
      double v12 = v11;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v14 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:@"predictionSubScores"];
        uint64_t v15 = [v14 objectAtIndexedSubscript:i];
        uint64_t v16 = [v15 objectForKeyedSubscript:@"subscores"];
        [v16 scoreForKey:@"TotalScore" found:0];
        double v18 = v17;

        if (v18 < v12)
        {
          uint64_t v20 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:@"predictionSubScores"];
          uint64_t v21 = [v20 count];

          if (v21 == 100)
          {
            uint64_t v22 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:@"predictionSubScores"];
            [v22 removeLastObject];
          }
          v7 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:@"predictionSubScores"];
          long long v27 = *(_OWORD *)(a1 + 40);
          v26[0] = @"bundleId";
          v26[1] = @"inputs";
          v26[2] = @"subscores";
          uint64_t v28 = *(void *)(a1 + 56);
          uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:v26 count:3];
          [v7 insertObject:v19 atIndex:i];
          goto LABEL_17;
        }
      }
      if (v6 > 0x63) {
        return;
      }
      goto LABEL_15;
    }
    v7 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:@"predictionSubScores"];
    long long v30 = *(_OWORD *)(a1 + 40);
    v29[0] = @"action";
    v29[1] = @"inputs";
    v29[2] = @"subscores";
    uint64_t v31 = *(void *)(a1 + 56);
    id v8 = (void *)MEMORY[0x1E4F1C9E8];
    id v9 = &v30;
    id v10 = v29;
    goto LABEL_16;
  }
  v7 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:@"predictionSubScores"];
  long long v33 = *(_OWORD *)(a1 + 40);
  v32[0] = @"actionKey";
  v32[1] = @"inputs";
  v32[2] = @"subscores";
  uint64_t v34 = *(void *)(a1 + 56);
  id v8 = (void *)MEMORY[0x1E4F1C9E8];
  id v9 = &v33;
  id v10 = v32;
LABEL_16:
  uint64_t v19 = [v8 dictionaryWithObjects:v9 forKeys:v10 count:3];
  [v7 addObject:v19];
LABEL_17:
}

- (void)setConsumerSubType:(unsigned __int8)a3
{
  fastQueue = self->_fastQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__ATXPredictionJSONScoreLogger_setConsumerSubType___block_invoke;
  v4[3] = &unk_1E68AF4F0;
  v4[4] = self;
  unsigned __int8 v5 = a3;
  dispatch_async(fastQueue, v4);
}

uint64_t __51__ATXPredictionJSONScoreLogger_setConsumerSubType___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 16) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setPredictionClass:(id)a3
{
  id v4 = a3;
  fastQueue = self->_fastQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__ATXPredictionJSONScoreLogger_setPredictionClass___block_invoke;
  v7[3] = &unk_1E68AB870;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(fastQueue, v7);
}

uint64_t __51__ATXPredictionJSONScoreLogger_setPredictionClass___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) setObject:*(void *)(a1 + 40) forKeyedSubscript:@"predictionClass"];
}

- (void)setAssetVersion:(unint64_t)a3
{
  fastQueue = self->_fastQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__ATXPredictionJSONScoreLogger_setAssetVersion___block_invoke;
  v4[3] = &unk_1E68ACD10;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(fastQueue, v4);
}

void __48__ATXPredictionJSONScoreLogger_setAssetVersion___block_invoke(uint64_t a1)
{
  id v2 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 8) setObject:v2 forKeyedSubscript:@"assetVersion"];
}

- (void)setCacheAge:(double)a3
{
  fastQueue = self->_fastQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__ATXPredictionJSONScoreLogger_setCacheAge___block_invoke;
  v4[3] = &unk_1E68ACD10;
  v4[4] = self;
  *(double *)&void v4[5] = a3;
  dispatch_async(fastQueue, v4);
}

void __44__ATXPredictionJSONScoreLogger_setCacheAge___block_invoke(uint64_t a1)
{
  id v2 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 8) setObject:v2 forKeyedSubscript:@"PredictionCacheAge"];
}

- (void)flush
{
}

- (void)flushWithFilenameSuffix:(id)a3
{
}

- (void)flushWithCompletion:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F4B680];
  uint64_t consumerSubType = self->_consumerSubType;
  id v6 = a3;
  id v7 = [v4 safeStringForConsumerSubtype:consumerSubType];
  [(ATXPredictionJSONScoreLogger *)self flushWithCompletion:v6 filenameSuffix:v7];
}

- (void)flushWithCompletion:(id)a3 filenameSuffix:(id)a4
{
  id v7 = (void (**)(void))a3;
  id v8 = a4;
  if ([MEMORY[0x1E4F93B08] shouldIncludePredictionLogs])
  {
    sel_getName(a2);
    id v9 = (void *)os_transaction_create();
    fastQueue = self->_fastQueue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __67__ATXPredictionJSONScoreLogger_flushWithCompletion_filenameSuffix___block_invoke;
    v12[3] = &unk_1E68AF518;
    v12[4] = self;
    uint64_t v15 = v7;
    id v13 = v9;
    id v14 = v8;
    id v11 = v9;
    dispatch_async(fastQueue, v12);
  }
  else
  {
    v7[2](v7);
  }
}

void __67__ATXPredictionJSONScoreLogger_flushWithCompletion_filenameSuffix___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 8) count])
  {
    id v2 = *(id *)(*(void *)(a1 + 32) + 8);
    uint64_t v3 = objc_opt_new();
    uint64_t v4 = *(void *)(a1 + 32);
    unsigned __int8 v5 = *(void **)(v4 + 8);
    *(void *)(v4 + 8) = v3;

    id v6 = objc_opt_new();
    [*(id *)(*(void *)(a1 + 32) + 8) setObject:v6 forKeyedSubscript:@"predictionSubScores"];

    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(NSObject **)(v7 + 40);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__ATXPredictionJSONScoreLogger_flushWithCompletion_filenameSuffix___block_invoke_2;
    block[3] = &unk_1E68AC320;
    block[4] = v7;
    id v22 = v2;
    id v23 = *(id *)(a1 + 40);
    id v9 = v2;
    dispatch_async(v8, block);
    id v10 = [NSString stringWithFormat:@"appPredictionScoreLog_%@.json", *(void *)(a1 + 48)];
    id v11 = [MEMORY[0x1E4F4B650] appPredictionDirectoryFile:v10];
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = *(NSObject **)(v12 + 40);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __67__ATXPredictionJSONScoreLogger_flushWithCompletion_filenameSuffix___block_invoke_3;
    v16[3] = &unk_1E68AF208;
    id v17 = v11;
    uint64_t v18 = v12;
    id v19 = *(id *)(a1 + 40);
    id v20 = *(id *)(a1 + 56);
    id v14 = v11;
    dispatch_async(v13, v16);
  }
  else
  {
    uint64_t v15 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v15();
  }
}

id __67__ATXPredictionJSONScoreLogger_flushWithCompletion_filenameSuffix___block_invoke_2(uint64_t a1)
{
  if ((unint64_t)[*(id *)(*(void *)(a1 + 32) + 24) count] >= 2) {
    [*(id *)(*(void *)(a1 + 32) + 24) removeObjectAtIndex:0];
  }
  return self;
}

uint64_t __67__ATXPredictionJSONScoreLogger_flushWithCompletion_filenameSuffix___block_invoke_3(uint64_t a1)
{
  id v2 = __atxlog_handle_default();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  uint64_t v4 = __atxlog_handle_default();
  unsigned __int8 v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "JSONScoreLogWrite", " enableTelemetry=YES ", buf, 2u);
  }

  id v6 = (void *)MEMORY[0x1D25F6CC0]();
  int v7 = open_dprotected_np((const char *)[*(id *)(a1 + 32) UTF8String], 1537, 3, 0, 384);
  if ((v7 & 0x80000000) == 0)
  {
    int v8 = v7;
    id v9 = fdopen(v7, "w");
    if (v9)
    {
      id v10 = v9;
      +[ATXScoreLogSerialization writeObject:*(void *)(*(void *)(a1 + 40) + 24) toFile:v9];
      fclose(v10);
    }
    else
    {
      close(v8);
    }
  }
  id v11 = __atxlog_handle_default();
  uint64_t v12 = v11;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)uint64_t v15 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v12, OS_SIGNPOST_INTERVAL_END, v3, "JSONScoreLogWrite", " enableTelemetry=YES ", v15, 2u);
  }

  id v13 = self;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slowQueue, 0);
  objc_storeStrong((id *)&self->_fastQueue, 0);
  objc_storeStrong((id *)&self->_subscoreHistories, 0);
  objc_storeStrong((id *)&self->_history, 0);
}

- (void)logInputDict:(uint64_t)a3 subscores:(uint64_t)a4 forBundleId:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)logInputDict:(uint64_t)a3 subscores:(uint64_t)a4 forBundleId:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)logInputDict:(uint64_t)a3 subscores:(uint64_t)a4 forBundleId:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end