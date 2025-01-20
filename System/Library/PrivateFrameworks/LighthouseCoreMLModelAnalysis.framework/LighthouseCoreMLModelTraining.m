@interface LighthouseCoreMLModelTraining
+ (BOOL)trainModel:(id)a3 destModelUrl:(id)a4 modelConfiguration:(id)a5 dataBatch:(id)a6;
+ (BOOL)trainModel:(id)a3 destModelUrl:(id)a4 modelConfiguration:(id)a5 dataBatch:(id)a6 labelFeatureName:(id)a7;
+ (BOOL)validateModelFeatureName:(id)a3 modelConfiguration:(id)a4 dataBatch:(id)a5;
+ (id)evaluateModel:(id)a3 modelConfiguration:(id)a4 dataBatch:(id)a5;
+ (id)getLabelFeatureName:(id)a3 modelConfiguration:(id)a4;
+ (void)initialize;
@end

@implementation LighthouseCoreMLModelTraining

+ (void)initialize
{
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, &__block_literal_global);
  }
}

uint64_t __43__LighthouseCoreMLModelTraining_initialize__block_invoke()
{
  trainingLog = (uint64_t)os_log_create("com.apple.LighthouseCoreMLModelAnalysis.Training", "general");
  return MEMORY[0x270F9A758]();
}

+ (BOOL)validateModelFeatureName:(id)a3 modelConfiguration:(id)a4 dataBatch:(id)a5
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v9 count])
  {
    v10 = [v9 featuresAtIndex:0];
    if (v8)
    {
      uint64_t v46 = 0;
      v11 = (id *)&v46;
      uint64_t v12 = [MEMORY[0x263F00D80] modelWithContentsOfURL:v7 configuration:v8 error:&v46];
    }
    else
    {
      uint64_t v47 = 0;
      v11 = (id *)&v47;
      uint64_t v12 = [MEMORY[0x263F00D80] modelWithContentsOfURL:v7 error:&v47];
    }
    v22 = (void *)v12;
    id v23 = *v11;
    v24 = v23;
    if (v22)
    {
      id v41 = v23;
      v25 = [v22 modelDescription];
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      v26 = [v10 featureNames];
      uint64_t v27 = [v26 countByEnumeratingWithState:&v42 objects:v48 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        v37 = v22;
        v38 = v10;
        id v39 = v8;
        id v40 = v7;
        uint64_t v29 = *(void *)v43;
        while (2)
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v43 != v29) {
              objc_enumerationMutation(v26);
            }
            uint64_t v31 = *(void *)(*((void *)&v42 + 1) + 8 * i);
            v32 = [v25 inputFeatureNames];
            if ([v32 containsObject:v31])
            {
            }
            else
            {
              v33 = [v25 outputFeatureNames];
              char v34 = [v33 containsObject:v31];

              if ((v34 & 1) == 0)
              {
                v35 = (void *)trainingLog;
                if (os_log_type_enabled((os_log_t)trainingLog, OS_LOG_TYPE_ERROR)) {
                  +[LighthouseCoreMLModelTraining validateModelFeatureName:modelConfiguration:dataBatch:](v31, v35, v25);
                }
                BOOL v21 = 0;
                goto LABEL_26;
              }
            }
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v42 objects:v48 count:16];
          if (v28) {
            continue;
          }
          break;
        }
        BOOL v21 = 1;
LABEL_26:
        id v8 = v39;
        id v7 = v40;
        v22 = v37;
        v10 = v38;
      }
      else
      {
        BOOL v21 = 1;
      }

      v24 = v41;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)trainingLog, OS_LOG_TYPE_ERROR)) {
        +[LighthouseCoreMLModelTraining validateModelFeatureName:modelConfiguration:dataBatch:]();
      }
      BOOL v21 = 0;
    }
  }
  else
  {
    v13 = trainingLog;
    if (os_log_type_enabled((os_log_t)trainingLog, OS_LOG_TYPE_ERROR)) {
      +[LighthouseCoreMLModelTraining validateModelFeatureName:modelConfiguration:dataBatch:](v13, v14, v15, v16, v17, v18, v19, v20);
    }
    BOOL v21 = 0;
  }

  return v21;
}

+ (id)getLabelFeatureName:(id)a3 modelConfiguration:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    uint64_t v15 = 0;
    id v7 = (id *)&v15;
    uint64_t v8 = [MEMORY[0x263F00D80] modelWithContentsOfURL:v5 configuration:v6 error:&v15];
  }
  else
  {
    uint64_t v16 = 0;
    id v7 = (id *)&v16;
    uint64_t v8 = [MEMORY[0x263F00D80] modelWithContentsOfURL:v5 error:&v16];
  }
  id v9 = (void *)v8;
  id v10 = *v7;
  if (v9)
  {
    v11 = [v9 modelDescription];
    uint64_t v12 = [v11 inputFeatureNames];
    v13 = [v12 objectAtIndexedSubscript:0];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)trainingLog, OS_LOG_TYPE_ERROR)) {
      +[LighthouseCoreMLModelTraining validateModelFeatureName:modelConfiguration:dataBatch:]();
    }
    v13 = 0;
  }

  return v13;
}

+ (BOOL)trainModel:(id)a3 destModelUrl:(id)a4 modelConfiguration:(id)a5 dataBatch:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = +[LighthouseCoreMLModelTraining getLabelFeatureName:v12 modelConfiguration:v10];
  BOOL v14 = +[LighthouseCoreMLModelTraining trainModel:v12 destModelUrl:v11 modelConfiguration:v10 dataBatch:v9 labelFeatureName:v13];

  return v14;
}

+ (BOOL)trainModel:(id)a3 destModelUrl:(id)a4 modelConfiguration:(id)a5 dataBatch:(id)a6 labelFeatureName:(id)a7
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v41 = a4;
  id v12 = a5;
  id v13 = a6;
  id v40 = a7;
  BOOL v14 = (void *)trainingLog;
  if (os_log_type_enabled((os_log_t)trainingLog, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = v14;
    uint64_t v16 = [v11 absoluteURL];
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v16;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = [v13 count];
    _os_log_impl(&dword_2545AF000, v15, OS_LOG_TYPE_INFO, "Begin trainModel with model URL %@ and number of samples: %ld", buf, 0x16u);
  }
  if (+[LighthouseCoreMLModelTraining validateModelFeatureName:v11 modelConfiguration:v12 dataBatch:v13])
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v62 = __Block_byref_object_copy_;
    v63 = __Block_byref_object_dispose_;
    id v64 = 0;
    uint64_t v53 = 0;
    v54 = &v53;
    uint64_t v55 = 0x3032000000;
    v56 = __Block_byref_object_copy_;
    v57 = __Block_byref_object_dispose_;
    dispatch_semaphore_t v58 = dispatch_semaphore_create(0);
    uint64_t v49 = 0;
    v50 = &v49;
    uint64_t v51 = 0x2020000000;
    char v52 = 0;
    id v17 = v13;
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __103__LighthouseCoreMLModelTraining_trainModel_destModelUrl_modelConfiguration_dataBatch_labelFeatureName___block_invoke_67;
    v43[3] = &unk_2653B0A58;
    id v44 = v41;
    id v18 = v11;
    id v45 = v18;
    uint64_t v46 = &v49;
    uint64_t v47 = buf;
    v48 = &v53;
    id v39 = (void *)MEMORY[0x25A27DC50](v43);
    v38 = (void *)[objc_alloc(MEMORY[0x263F00DE0]) initForEvents:3 progressHandler:&__block_literal_global_66 completionHandler:v39];
    if (v17 && [v17 count])
    {
      uint64_t v19 = (id)trainingLog;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        uint64_t v20 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v17, "count"));
        *(_DWORD *)v59 = 138412290;
        v60 = v20;
        _os_log_impl(&dword_2545AF000, v19, OS_LOG_TYPE_INFO, "Update task will be initiated with %@ number of samples", v59, 0xCu);
      }
      BOOL v21 = (id)trainingLog;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v22 = [v12 parameters];
        *(_DWORD *)v59 = 138412290;
        v60 = v22;
        _os_log_impl(&dword_2545AF000, v21, OS_LOG_TYPE_INFO, "Config: %@", v59, 0xCu);
      }
      uint64_t v23 = *(void *)&buf[8];
      id obj = *(id *)(*(void *)&buf[8] + 40);
      v24 = [MEMORY[0x263F00DE8] updateTaskForModelAtURL:v18 trainingData:v17 configuration:v12 progressHandlers:v38 error:&obj];
      objc_storeStrong((id *)(v23 + 40), obj);
      if (*(void *)(*(void *)&buf[8] + 40))
      {
        v25 = trainingLog;
        if (os_log_type_enabled((os_log_t)trainingLog, OS_LOG_TYPE_INFO))
        {
          v26 = *(void **)(*(void *)&buf[8] + 40);
          *(_DWORD *)v59 = 138412290;
          v60 = v26;
          _os_log_impl(&dword_2545AF000, v25, OS_LOG_TYPE_INFO, "updateTaskForModelAtURL caused error: %@", v59, 0xCu);
        }
        goto LABEL_18;
      }
      [v24 resume];
      v37 = trainingLog;
      if (os_log_type_enabled((os_log_t)trainingLog, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v59 = 0;
        _os_log_impl(&dword_2545AF000, v37, OS_LOG_TYPE_INFO, "updateTaskForModelAtURL initiated", v59, 2u);
      }
    }
    else
    {
      uint64_t v28 = trainingLog;
      if (os_log_type_enabled((os_log_t)trainingLog, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v59 = 0;
        _os_log_impl(&dword_2545AF000, v28, OS_LOG_TYPE_INFO, "updateTaskForModelAtURL is not initiated due to lack of training data", v59, 2u);
      }
      dispatch_semaphore_signal((dispatch_semaphore_t)v54[5]);
    }
    dispatch_semaphore_wait((dispatch_semaphore_t)v54[5], 0xFFFFFFFFFFFFFFFFLL);
    id v29 = objc_alloc(MEMORY[0x263F51600]);
    v30 = [v18 lastPathComponent];
    id v31 = objc_alloc(MEMORY[0x263F515D8]);
    v32 = [MEMORY[0x263F515C0] fromMLProvider:v17];
    v33 = (void *)[v31 init:v32 labelFeatureName:v40];
    char v34 = [NSNumber numberWithBool:*((unsigned __int8 *)v50 + 24)];
    v24 = (void *)[v29 init:v30 batchProviderInfo:v33 succeeded:v34 trainingError:*(void *)(*(void *)&buf[8] + 40)];

    [MEMORY[0x263F515E0] emitModelTrainingEvent:v24];
LABEL_18:
    int v35 = *((unsigned __int8 *)v50 + 24);

    BOOL v27 = v35 != 0;
    _Block_object_dispose(&v49, 8);
    _Block_object_dispose(&v53, 8);

    _Block_object_dispose(buf, 8);
    goto LABEL_19;
  }
  BOOL v27 = 0;
LABEL_19:

  return v27;
}

void __103__LighthouseCoreMLModelTraining_trainModel_destModelUrl_modelConfiguration_dataBatch_labelFeatureName___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 task];
  v4 = [v3 error];

  if (v4)
  {
    id v5 = (void *)trainingLog;
    if (os_log_type_enabled((os_log_t)trainingLog, OS_LOG_TYPE_ERROR)) {
      __103__LighthouseCoreMLModelTraining_trainModel_destModelUrl_modelConfiguration_dataBatch_labelFeatureName___block_invoke_cold_1(v5, v2);
    }
  }
}

void __103__LighthouseCoreMLModelTraining_trainModel_destModelUrl_modelConfiguration_dataBatch_labelFeatureName___block_invoke_67(void *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = trainingLog;
  if (os_log_type_enabled((os_log_t)trainingLog, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = a1[4];
    if (!v5) {
      uint64_t v5 = a1[5];
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v22 = v5;
    _os_log_impl(&dword_2545AF000, v4, OS_LOG_TYPE_INFO, "Saving the adapted model at %@", buf, 0xCu);
  }
  id v6 = [v3 model];
  id v7 = v6;
  uint64_t v8 = a1[4];
  if (!v8) {
    uint64_t v8 = a1[5];
  }
  uint64_t v9 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v9 + 40);
  char v10 = [v6 writeToURL:v8 error:&obj];
  objc_storeStrong((id *)(v9 + 40), obj);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v10;

  if (*(void *)(*(void *)(a1[7] + 8) + 40) || !*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    id v11 = trainingLog;
    if (os_log_type_enabled((os_log_t)trainingLog, OS_LOG_TYPE_ERROR)) {
      __103__LighthouseCoreMLModelTraining_trainModel_destModelUrl_modelConfiguration_dataBatch_labelFeatureName___block_invoke_67_cold_1((uint64_t)(a1 + 7), v11, v12, v13, v14, v15, v16, v17);
    }
  }
  else
  {
    id v18 = (void *)MEMORY[0x263F51630];
    uint64_t v19 = [MEMORY[0x263EFF910] now];
    [v18 setLastTrainedDate:v19];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1[8] + 8) + 40));
}

+ (id)evaluateModel:(id)a3 modelConfiguration:(id)a4 dataBatch:(id)a5
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    uint64_t v55 = 0;
    char v10 = (id *)&v55;
    uint64_t v11 = [MEMORY[0x263F00D80] modelWithContentsOfURL:v7 configuration:v8 error:&v55];
  }
  else
  {
    uint64_t v56 = 0;
    char v10 = (id *)&v56;
    uint64_t v11 = [MEMORY[0x263F00D80] modelWithContentsOfURL:v7 error:&v56];
  }
  uint64_t v12 = (void *)v11;
  id v13 = *v10;
  uint64_t v14 = (void *)trainingLog;
  if (v13) {
    BOOL v15 = 1;
  }
  else {
    BOOL v15 = v12 == 0;
  }
  if (!v15)
  {
    if (os_log_type_enabled((os_log_t)trainingLog, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = v14;
      uint64_t v20 = [v7 absoluteString];
      *(_DWORD *)buf = 138412290;
      uint64_t v58 = (uint64_t)v20;
      _os_log_impl(&dword_2545AF000, v19, OS_LOG_TYPE_INFO, "Loaded ML Model at path %@", buf, 0xCu);
    }
    id v54 = 0;
    BOOL v21 = [v12 predictionsFromBatch:v9 error:&v54];
    id v16 = v54;
    uint64_t v22 = (void *)trainingLog;
    if (v16)
    {
      if (os_log_type_enabled((os_log_t)trainingLog, OS_LOG_TYPE_ERROR)) {
        +[LighthouseCoreMLModelTraining evaluateModel:modelConfiguration:dataBatch:]();
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)trainingLog, OS_LOG_TYPE_INFO))
      {
        uint64_t v23 = v22;
        uint64_t v24 = [v21 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v58 = v24;
        _os_log_impl(&dword_2545AF000, v23, OS_LOG_TYPE_INFO, "Predicted on %ld number of batches", buf, 0xCu);
      }
      if ([v21 count] < 1)
      {
        float v32 = 0.0;
        float v33 = 0.0;
LABEL_28:
        uint64_t v17 = objc_opt_new();
        *(float *)&double v34 = v32 / v33;
        int v35 = [NSNumber numberWithFloat:v34];
        [v17 setAccuracy:v35];

        goto LABEL_36;
      }
      id v53 = v8;
      uint64_t v25 = 0;
      int v26 = 0;
      while (1)
      {
        BOOL v27 = [v21 featuresAtIndex:v25];
        uint64_t v28 = [v27 objectForKeyedSubscript:@"WasShareRecipient"];

        id v29 = [v9 featuresAtIndex:v25];
        v30 = [v29 featureValueForName:@"WasShareRecipient"];

        if (!v28) {
          break;
        }
        if (!v30)
        {
          id v44 = trainingLog;
          id v8 = v53;
          if (os_log_type_enabled((os_log_t)trainingLog, OS_LOG_TYPE_ERROR)) {
            +[LighthouseCoreMLModelTraining evaluateModel:modelConfiguration:dataBatch:](v44, v45, v46, v47, v48, v49, v50, v51);
          }
          goto LABEL_34;
        }
        uint64_t v31 = [v28 int64Value];
        if (v31 == [v30 int64Value]) {
          ++v26;
        }
        ++v25;

        if (v25 >= [v21 count])
        {
          float v32 = (float)v26;
          float v33 = (float)(int)v25;
          id v8 = v53;
          goto LABEL_28;
        }
      }
      v36 = trainingLog;
      id v8 = v53;
      if (os_log_type_enabled((os_log_t)trainingLog, OS_LOG_TYPE_ERROR)) {
        +[LighthouseCoreMLModelTraining evaluateModel:modelConfiguration:dataBatch:](v36, v37, v38, v39, v40, v41, v42, v43);
      }

LABEL_34:
    }
    uint64_t v17 = 0;
LABEL_36:

    goto LABEL_37;
  }
  id v16 = v13;
  if (os_log_type_enabled((os_log_t)trainingLog, OS_LOG_TYPE_ERROR)) {
    +[LighthouseCoreMLModelTraining evaluateModel:modelConfiguration:dataBatch:].cold.4(v14, v7);
  }
  uint64_t v17 = 0;
LABEL_37:

  return v17;
}

+ (void)validateModelFeatureName:(uint64_t)a3 modelConfiguration:(uint64_t)a4 dataBatch:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)validateModelFeatureName:modelConfiguration:dataBatch:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2545AF000, v0, v1, "could not load a model %@", v2, v3, v4, v5, v6);
}

+ (void)validateModelFeatureName:(uint64_t)a1 modelConfiguration:(void *)a2 dataBatch:(void *)a3 .cold.3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v5 = a2;
  uint8_t v6 = [a3 inputFeatureNames];
  id v7 = [a3 outputFeatureNames];
  int v8 = 138412802;
  uint64_t v9 = a1;
  __int16 v10 = 2112;
  uint64_t v11 = v6;
  __int16 v12 = 2112;
  id v13 = v7;
  _os_log_error_impl(&dword_2545AF000, v5, OS_LOG_TYPE_ERROR, "featureName %@ is not in modelDescription %@ %@", (uint8_t *)&v8, 0x20u);
}

void __103__LighthouseCoreMLModelTraining_trainModel_destModelUrl_modelConfiguration_dataBatch_labelFeatureName___block_invoke_cold_1(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 task];
  uint64_t v5 = [v4 error];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_2545AF000, v6, v7, "context.task.error: %@", v8, v9, v10, v11, v12);
}

void __103__LighthouseCoreMLModelTraining_trainModel_destModelUrl_modelConfiguration_dataBatch_labelFeatureName___block_invoke_67_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)evaluateModel:(uint64_t)a3 modelConfiguration:(uint64_t)a4 dataBatch:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)evaluateModel:(uint64_t)a3 modelConfiguration:(uint64_t)a4 dataBatch:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)evaluateModel:modelConfiguration:dataBatch:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2545AF000, v0, v1, "ML model failed to predict with error：%@", v2, v3, v4, v5, v6);
}

+ (void)evaluateModel:(void *)a1 modelConfiguration:(void *)a2 dataBatch:.cold.4(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 absoluteString];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_2545AF000, v5, v6, "Failed to load ML Model at path：%@", v7, v8, v9, v10, v11);
}

@end