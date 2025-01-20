@interface ATXWidgetPredictionTrainer
+ (BOOL)shouldTrainModelOnDeviceWithTimeOfLatestTraining:(id)a3;
+ (id)compiledModelURLForModelName:(id)a3;
+ (void)moveOriginalModelToWriteablePath:(id)a3;
- (ATXWidgetPredictionTrainer)initWithInformationStore:(id)a3 distinctScoreCounts:(id)a4;
- (id)_timeOfLatestTraining;
- (void)_updateTimeOfLatestTrainingTo:(id)a3;
- (void)modelPredictionWithSampleDictionaryFeatureProvider:(id)a3 withMLModel:(id)a4;
- (void)trainWidgetPredictionModelWithActivity:(id)a3;
- (void)trainWidgetPredictionModelWithMLArrayBatchProvider:(id)a3 modelURL:(id)a4 andSaveToURL:(id)a5 withActivity:(id)a6;
@end

@implementation ATXWidgetPredictionTrainer

- (ATXWidgetPredictionTrainer)initWithInformationStore:(id)a3 distinctScoreCounts:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXWidgetPredictionTrainer;
  v9 = [(ATXWidgetPredictionTrainer *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_informationStore, a3);
    v11 = [[ATXWidgetPredictionTrainingDatasetBuilder alloc] initWithDistinctScoreCounts:v8];
    datasetBuilder = v10->_datasetBuilder;
    v10->_datasetBuilder = v11;
  }
  return v10;
}

- (void)trainWidgetPredictionModelWithActivity:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_class();
  v6 = [(ATXWidgetPredictionTrainer *)self _timeOfLatestTraining];
  LODWORD(v5) = [v5 shouldTrainModelOnDeviceWithTimeOfLatestTraining:v6];

  if (v5)
  {
    id v7 = __atxlog_handle_timeline();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_INFO, "ATXWidgetPredictionTrainer: Preparing to train; it has been sufficiently long since the widget prediction model "
        "was trained on-device.",
        (uint8_t *)&v19,
        2u);
    }

    id v8 = [(ATXInformationStore *)self->_informationStore fetchWidgetEngagementRecords];
    v9 = [(ATXWidgetPredictionTrainingDatasetBuilder *)self->_datasetBuilder createMLArrayBatchProviderFromTrainingArray:v8];
    v10 = [(id)objc_opt_class() compiledModelURLForModelName:@"ATXWidgetPredictionMLModel"];
    v11 = [(id)objc_opt_class() compiledModelURLForModelName:@"ATXPersonalizedWidgetPredictionMLModel"];
    [(id)objc_opt_class() moveOriginalModelToWriteablePath:v10];
    v12 = [MEMORY[0x1E4F28CB8] defaultManager];
    v13 = [v11 path];
    int v14 = [v12 isReadableFileAtPath:v13];

    if (v14)
    {
      v15 = __atxlog_handle_timeline();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = [v11 path];
        int v19 = 138412290;
        v20 = v16;
        _os_log_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_INFO, "Using model from the previous round of on-device training at path: %@", (uint8_t *)&v19, 0xCu);
      }
      id v17 = v11;

      v10 = v17;
    }
    if ([v4 didDefer])
    {
      v18 = __atxlog_handle_timeline();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_1D0FA3000, v18, OS_LOG_TYPE_DEFAULT, "ATXWidgetPredictionTrainer: Deferring model training", (uint8_t *)&v19, 2u);
      }
    }
    else
    {
      [(ATXWidgetPredictionTrainer *)self trainWidgetPredictionModelWithMLArrayBatchProvider:v9 modelURL:v10 andSaveToURL:v11 withActivity:v4];
    }
  }
}

+ (BOOL)shouldTrainModelOnDeviceWithTimeOfLatestTraining:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 dateByAddingTimeInterval:604800.0];
  if (a3
    && ([MEMORY[0x1E4F1C9C8] now],
        v5 = objc_claimAutoreleasedReturnValue(),
        [v4 laterDate:v5],
        v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6 == v4))
  {
    id v8 = __atxlog_handle_timeline();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = NSNumber;
      v10 = [MEMORY[0x1E4F1C9C8] now];
      [v4 timeIntervalSinceDate:v10];
      v12 = [v9 numberWithDouble:v11 / 3600.0];
      int v14 = 138412290;
      v15 = v12;
      _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_INFO, "ATXWidgetPredictionTrainer: Next training date is in the future. Model will be retrained on-device in %@ hours", (uint8_t *)&v14, 0xCu);
    }
    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (void)trainWidgetPredictionModelWithMLArrayBatchProvider:(id)a3 modelURL:(id)a4 andSaveToURL:(id)a5 withActivity:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  int v14 = [v10 array];
  uint64_t v15 = [v14 count];

  if (!v15)
  {
    v23 = __atxlog_handle_timeline();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[ATXWidgetPredictionTrainer trainWidgetPredictionModelWithMLArrayBatchProvider:modelURL:andSaveToURL:withActivity:](v23);
    }
    goto LABEL_14;
  }
  if (!v12)
  {
    v23 = __atxlog_handle_timeline();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      -[ATXWidgetPredictionTrainer trainWidgetPredictionModelWithMLArrayBatchProvider:modelURL:andSaveToURL:withActivity:](v23);
    }
LABEL_14:

    goto LABEL_15;
  }
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = __Block_byref_object_copy__75;
  v39[4] = __Block_byref_object_dispose__75;
  id v40 = 0;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__75;
  v37 = __Block_byref_object_dispose__75;
  dispatch_semaphore_t v38 = dispatch_semaphore_create(0);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __116__ATXWidgetPredictionTrainer_trainWidgetPredictionModelWithMLArrayBatchProvider_modelURL_andSaveToURL_withActivity___block_invoke;
  aBlock[3] = &unk_1E68B3B28;
  id v32 = v13;
  uint64_t v16 = _Block_copy(aBlock);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __116__ATXWidgetPredictionTrainer_trainWidgetPredictionModelWithMLArrayBatchProvider_modelURL_andSaveToURL_withActivity___block_invoke_23;
  v26[3] = &unk_1E68B3B50;
  v29 = &v33;
  v30 = v39;
  id v27 = v12;
  v28 = self;
  id v17 = _Block_copy(v26);
  v18 = (void *)[objc_alloc(MEMORY[0x1E4F1E9F8]) initForEvents:3 progressHandler:v16 completionHandler:v17];
  int v19 = __atxlog_handle_timeline();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v19, OS_LOG_TYPE_INFO, "ATXWidgetPredictionTrainer: Starting MLUpdateTask", buf, 2u);
  }

  id v24 = 0;
  v20 = [MEMORY[0x1E4F1EA00] updateTaskForModelAtURL:v11 trainingData:v10 progressHandlers:v18 error:&v24];
  id v21 = v24;
  if (v21)
  {
    v22 = __atxlog_handle_timeline();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[ATXWidgetPredictionTrainer trainWidgetPredictionModelWithMLArrayBatchProvider:modelURL:andSaveToURL:withActivity:]();
    }
  }
  [v20 resume];
  dispatch_semaphore_wait((dispatch_semaphore_t)v34[5], 0x384uLL);

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(v39, 8);

LABEL_15:
}

void __116__ATXWidgetPredictionTrainer_trainWidgetPredictionModelWithMLArrayBatchProvider_modelURL_andSaveToURL_withActivity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 task];
  v5 = [v4 error];

  if (v5)
  {
    v6 = __atxlog_handle_timeline();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __116__ATXWidgetPredictionTrainer_trainWidgetPredictionModelWithMLArrayBatchProvider_modelURL_andSaveToURL_withActivity___block_invoke_cold_1(v3);
    }
  }
  if ([*(id *)(a1 + 32) didDefer])
  {
    BOOL v7 = __atxlog_handle_timeline();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "ATXWidgetPredictionTrainer: Deferring model training", v8, 2u);
    }
  }
}

void __116__ATXWidgetPredictionTrainer_trainWidgetPredictionModelWithMLArrayBatchProvider_modelURL_andSaveToURL_withActivity___block_invoke_23(void *a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 task];
  uint64_t v5 = [v4 state];

  if (v5 == 5)
  {
    v6 = __atxlog_handle_timeline();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __116__ATXWidgetPredictionTrainer_trainWidgetPredictionModelWithMLArrayBatchProvider_modelURL_andSaveToURL_withActivity___block_invoke_23_cold_1(v3);
    }
  }
  else
  {
    BOOL v7 = [v3 task];
    uint64_t v8 = [v7 state];

    if (v8 == 4)
    {
      v9 = __atxlog_handle_timeline();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = a1[4];
        *(_DWORD *)buf = 138543362;
        uint64_t v27 = v10;
        _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_INFO, "Success! Completed on-device training of widget prediction model; Saving the personalized model to path: %{public}@",
          buf,
          0xCu);
      }
    }
    id v11 = [v3 model];
    uint64_t v12 = a1[4];
    uint64_t v13 = *(void *)(a1[7] + 8);
    id obj = *(id *)(v13 + 40);
    char v14 = [v11 writeToURL:v12 error:&obj];
    objc_storeStrong((id *)(v13 + 40), obj);

    uint64_t v15 = *(void *)(*(void *)(a1[7] + 8) + 40);
    uint64_t v16 = __atxlog_handle_timeline();
    v6 = v16;
    if (v15 || (v14 & 1) == 0)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        __116__ATXWidgetPredictionTrainer_trainWidgetPredictionModelWithMLArrayBatchProvider_modelURL_andSaveToURL_withActivity___block_invoke_23_cold_2((uint64_t)(a1 + 7), v6, v19, v20, v21, v22, v23, v24);
      }
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = a1[4];
        *(_DWORD *)buf = 138543362;
        uint64_t v27 = v17;
        _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_INFO, "Successfully saved the personalized model at path: %{public}@", buf, 0xCu);
      }

      v18 = (void *)a1[5];
      v6 = [MEMORY[0x1E4F1C9C8] now];
      [v18 _updateTimeOfLatestTrainingTo:v6];
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1[6] + 8) + 40));
}

+ (id)compiledModelURLForModelName:(id)a3
{
  if (a3)
  {
    id v3 = (void *)MEMORY[0x1E4F4B650];
    id v4 = [NSString stringWithFormat:@"%@.mlmodelc", a3];
    uint64_t v5 = [v3 widgetPredictionModelFileWithFilename:v4];

    v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5];
  }
  else
  {
    BOOL v7 = __atxlog_handle_timeline();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[ATXWidgetPredictionTrainer compiledModelURLForModelName:](v7);
    }

    v6 = 0;
  }
  return v6;
}

+ (void)moveOriginalModelToWriteablePath:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [@"ATXWidgetPredictionMLModel" stringByAppendingPathExtension:@"mlmodelc"];
  uint64_t v5 = (void *)MEMORY[0x1E4F1CB10];
  v6 = [MEMORY[0x1E4F4AF08] asset];
  BOOL v7 = [v6 filesystemPathForAssetDataRelativePath:v4];
  uint64_t v8 = [v5 fileURLWithPath:v7];

  v9 = __atxlog_handle_timeline();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = [v8 path];
    id v11 = [v3 path];
    *(_DWORD *)buf = 138543618;
    uint64_t v23 = v10;
    __int16 v24 = 2114;
    v25 = v11;
    _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_INFO, "Moving original model from %{public}@ to %{public}@", buf, 0x16u);
  }
  id v12 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v13 = [v8 path];
  if (![v12 isReadableFileAtPath:v13]) {
    goto LABEL_8;
  }
  char v14 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v15 = [v3 path];
  char v16 = [v14 isReadableFileAtPath:v15];

  if ((v16 & 1) == 0)
  {
    uint64_t v17 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v21 = 0;
    char v18 = [v17 copyItemAtURL:v8 toURL:v3 error:&v21];
    id v12 = v21;

    if (v18)
    {
LABEL_9:

      goto LABEL_10;
    }
    uint64_t v13 = __atxlog_handle_timeline();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = [v8 path];
      uint64_t v20 = [v3 path];
      *(_DWORD *)buf = 138543874;
      uint64_t v23 = v19;
      __int16 v24 = 2114;
      v25 = v20;
      __int16 v26 = 2114;
      id v27 = v12;
      _os_log_error_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_ERROR, "Failed to move file from %{public}@ to %{public}@ with error %{public}@", buf, 0x20u);
    }
LABEL_8:

    goto LABEL_9;
  }
LABEL_10:
}

- (id)_timeOfLatestTraining
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CB18]);
  id v4 = (NSUserDefaults *)[v3 initWithSuiteName:*MEMORY[0x1E4F4B690]];
  defaults = self->_defaults;
  self->_defaults = v4;

  v6 = self->_defaults;
  return [(NSUserDefaults *)v6 objectForKey:@"timestampOfLastTraining"];
}

- (void)_updateTimeOfLatestTrainingTo:(id)a3
{
}

- (void)modelPredictionWithSampleDictionaryFeatureProvider:(id)a3 withMLModel:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v6)
  {
    BOOL v7 = objc_opt_new();
    [v7 setComputeUnits:0];
    uint64_t v8 = +[ATXWidgetPredictionTrainer compiledModelURLForModelName:@"ATXPersonalizedWidgetPredictionMLModel"];
    id v19 = 0;
    id v6 = [MEMORY[0x1E4F1E968] modelWithContentsOfURL:v8 configuration:v7 error:&v19];
    id v9 = v19;
    if (v9)
    {
      uint64_t v10 = __atxlog_handle_timeline();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[ATXWidgetPredictionTrainer modelPredictionWithSampleDictionaryFeatureProvider:withMLModel:]();
      }
    }
  }
  id v18 = 0;
  id v11 = [v6 predictionFromFeatures:v5 error:&v18];
  id v12 = v18;
  uint64_t v13 = __atxlog_handle_timeline();
  char v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ATXWidgetPredictionTrainer modelPredictionWithSampleDictionaryFeatureProvider:withMLModel:]();
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = [v11 featureValueForName:@"engaged"];
    char v16 = [v5 featureValueForName:@"input_widget_family"];
    uint64_t v17 = [v5 featureValueForName:@"input_widget_family"];
    *(_DWORD *)buf = 138543874;
    id v21 = v15;
    __int16 v22 = 2114;
    uint64_t v23 = v16;
    __int16 v24 = 2114;
    v25 = v17;
    _os_log_impl(&dword_1D0FA3000, v14, OS_LOG_TYPE_INFO, "ATXWidgetPredictionTrainer: Output from model: %{public}@ for unique score count: %{public}@ widget family: %{public}@", buf, 0x20u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_informationStore, 0);
  objc_storeStrong((id *)&self->_datasetBuilder, 0);
}

- (void)trainWidgetPredictionModelWithMLArrayBatchProvider:(os_log_t)log modelURL:andSaveToURL:withActivity:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "ATXWidgetPredictionTrainer: At least one feature provider is required for model training.", v1, 2u);
}

- (void)trainWidgetPredictionModelWithMLArrayBatchProvider:(os_log_t)log modelURL:andSaveToURL:withActivity:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "ATXWidgetPredictionTrainer: Missing required parameter: personalizedModelURL", v1, 2u);
}

- (void)trainWidgetPredictionModelWithMLArrayBatchProvider:modelURL:andSaveToURL:withActivity:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Error during ML Update task: %{public}@", v2, v3, v4, v5, v6);
}

void __116__ATXWidgetPredictionTrainer_trainWidgetPredictionModelWithMLArrayBatchProvider_modelURL_andSaveToURL_withActivity___block_invoke_cold_1(void *a1)
{
  uint64_t v1 = [a1 task];
  uint64_t v2 = [v1 error];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1D0FA3000, v3, v4, "ATXWidgetPredictionTrainer: Error encountered before MLUpdate task could complete; context.task.error: %{public}@",
    v5,
    v6,
    v7,
    v8,
    v9);
}

void __116__ATXWidgetPredictionTrainer_trainWidgetPredictionModelWithMLArrayBatchProvider_modelURL_andSaveToURL_withActivity___block_invoke_23_cold_1(void *a1)
{
  uint64_t v1 = [a1 task];
  uint64_t v2 = [v1 error];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1D0FA3000, v3, v4, "ML Update task failed with error%@", v5, v6, v7, v8, v9);
}

void __116__ATXWidgetPredictionTrainer_trainWidgetPredictionModelWithMLArrayBatchProvider_modelURL_andSaveToURL_withActivity___block_invoke_23_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)compiledModelURLForModelName:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "ATXWidgetPredictionTrainer: Missing model name", v1, 2u);
}

- (void)modelPredictionWithSampleDictionaryFeatureProvider:withMLModel:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "ATXWidgetPredictionTrainer: Error encountered while making predictions: %{public}@", v2, v3, v4, v5, v6);
}

- (void)modelPredictionWithSampleDictionaryFeatureProvider:withMLModel:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "ATXWidgetPredictionTrainer - modelPredictionWithSampleDictionaryFeatureProvider: Error encountered while creating model: %{public}@", v2, v3, v4, v5, v6);
}

@end