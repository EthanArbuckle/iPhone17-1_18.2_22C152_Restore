@interface _ATXInspectionServerPredictionScoreLogger
- (_ATXInspectionServerPredictionScoreLogger)init;
- (id)inputsAndSubscores;
- (id)stageScores;
- (void)logInputDict:(id)a3 subscores:(id)a4 forBundleId:(id)a5;
- (void)logInputs:(id)a3 subscores:(id)a4 forBundleId:(id)a5;
- (void)logStageScores:(id)a3 forStageType:(int64_t)a4;
@end

@implementation _ATXInspectionServerPredictionScoreLogger

- (_ATXInspectionServerPredictionScoreLogger)init
{
  v11.receiver = self;
  v11.super_class = (Class)_ATXInspectionServerPredictionScoreLogger;
  v2 = [(_ATXInspectionServerPredictionScoreLogger *)&v11 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    inputsAndSubscores = v2->_inputsAndSubscores;
    v2->_inputsAndSubscores = (NSMutableDictionary *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("_ATXInspectionServerPredictionScoreLogger", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    uint64_t v8 = objc_opt_new();
    stageScores = v2->_stageScores;
    v2->_stageScores = (NSMutableDictionary *)v8;
  }
  return v2;
}

- (id)inputsAndSubscores
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__86;
  v10 = __Block_byref_object_dispose__86;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63___ATXInspectionServerPredictionScoreLogger_inputsAndSubscores__block_invoke;
  v5[3] = &unk_1E68ACBD0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)stageScores
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__86;
  v10 = __Block_byref_object_dispose__86;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56___ATXInspectionServerPredictionScoreLogger_stageScores__block_invoke;
  v5[3] = &unk_1E68ACBD0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)logInputs:(id)a3 subscores:(id)a4 forBundleId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __77___ATXInspectionServerPredictionScoreLogger_logInputs_subscores_forBundleId___block_invoke;
  v15[3] = &unk_1E68AC3B8;
  v15[4] = self;
  id v16 = v10;
  id v17 = v8;
  id v18 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(queue, v15);
}

- (void)logInputDict:(id)a3 subscores:(id)a4 forBundleId:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v11 = [a3 toDictionary];
  id v10 = [v9 toDictionary];

  [(_ATXInspectionServerPredictionScoreLogger *)self logInputs:v11 subscores:v10 forBundleId:v8];
}

- (void)logStageScores:(id)a3 forStageType:(int64_t)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73___ATXInspectionServerPredictionScoreLogger_logStageScores_forStageType___block_invoke;
  block[3] = &unk_1E68AE7A8;
  id v10 = v6;
  int64_t v11 = a4;
  block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stageScores, 0);
  objc_storeStrong((id *)&self->_inputsAndSubscores, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end