@interface _ATXInspectionServerActionPredictionScoreLogger
- (_ATXInspectionServerActionPredictionScoreLogger)init;
- (id)actionMetaDataItems;
- (void)storeMetaDataFromActionContainerForKey:(id)a3 actionContainer:(id)a4;
@end

@implementation _ATXInspectionServerActionPredictionScoreLogger

- (_ATXInspectionServerActionPredictionScoreLogger)init
{
  v6.receiver = self;
  v6.super_class = (Class)_ATXInspectionServerActionPredictionScoreLogger;
  v2 = [(_ATXInspectionServerPredictionScoreLogger *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    actionMetaDataItems = v2->_actionMetaDataItems;
    v2->_actionMetaDataItems = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (id)actionMetaDataItems
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__86;
  v10 = __Block_byref_object_dispose__86;
  id v11 = 0;
  queue = self->super._queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70___ATXInspectionServerActionPredictionScoreLogger_actionMetaDataItems__block_invoke;
  v5[3] = &unk_1E68ACBD0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)storeMetaDataFromActionContainerForKey:(id)a3 actionContainer:(id)a4
{
  id v31 = a3;
  id v5 = a4;
  uint64_t v6 = [v5 scoredAction];
  [v6 score];
  double v8 = v7;
  v9 = +[_ATXGlobals sharedInstance];
  [v9 actionExperienceMediumConfidenceThreshold];
  BOOL v29 = v10 < v8;

  id v11 = [v5 scoredAction];
  [v11 score];
  double v13 = v12;
  v14 = +[_ATXGlobals sharedInstance];
  [v14 actionExperienceHighConfidenceThreshold];
  BOOL v16 = v15 < v13;

  v17 = [_ATXActionMetaData alloc];
  v18 = [v5 scoredAction];
  v19 = [v18 predictedItem];
  v20 = [v19 actionTitle];
  v21 = [v5 scoredAction];
  v22 = [v21 predictedItem];
  v23 = [v22 actionSubtitle];
  v24 = [v5 actionKey];

  v25 = [(_ATXActionMetaData *)v17 initWithTitle:v20 subtitle:v23 shouldPredict:v29 shouldPredictLockScreen:v16 actionKey:v24];
  queue = self->super._queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __106___ATXInspectionServerActionPredictionScoreLogger_storeMetaDataFromActionContainerForKey_actionContainer___block_invoke;
  block[3] = &unk_1E68AC320;
  block[4] = self;
  id v33 = v31;
  v34 = v25;
  v27 = v25;
  id v28 = v31;
  dispatch_sync(queue, block);
}

- (void).cxx_destruct
{
}

@end