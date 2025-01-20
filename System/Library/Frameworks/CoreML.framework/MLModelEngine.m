@interface MLModelEngine
- (BOOL)recordsPredictionEvent;
- (BOOL)supportsConcurrentSubmissions;
- (MLModelConfiguration)configuration;
- (MLModelDescription)modelDescription;
- (MLModelEngine)initWithDescription:(id)a3 configuration:(id)a4;
- (MLModelEngine)initWithName:(id)a3 inputDescription:(id)a4 outputDescription:(id)a5 orderedInputFeatureNames:(id)a6 orderedOutputFeatureNames:(id)a7 configuration:(id)a8;
- (MLModelMetadata)metadata;
- (id)executionSchedule;
- (id)modelPath;
- (id)newRequestForModel:(id)a3 inputFeatures:(id)a4 options:(id)a5 error:(id *)a6;
- (id)parameterValueForKey:(id)a3 error:(id *)a4;
- (id)predictionFromFeatures:(id)a3 error:(id *)a4;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (id)predictionsFromBatch:(id)a3 error:(id *)a4;
- (id)predictionsFromBatch:(id)a3 options:(id)a4 error:(id *)a5;
- (id)vectorizeInput:(id)a3 error:(id *)a4;
- (unint64_t)predictionTypeForKTrace;
- (unint64_t)signpostID;
- (void)enableInstrumentsTracing;
- (void)setModelPath:(id)a3 modelName:(id)a4;
- (void)submitPredictionRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation MLModelEngine

- (MLModelConfiguration)configuration
{
  return self->_configuration;
}

- (BOOL)supportsConcurrentSubmissions
{
  return 0;
}

- (MLModelDescription)modelDescription
{
  return self->_modelDescription;
}

- (MLModelEngine)initWithDescription:(id)a3 configuration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MLModelEngine;
  v9 = [(MLModelEngine *)&v14 init];
  if (v9)
  {
    v10 = +[MLLogging coreChannel];
    v9->_signpostID = os_signpost_id_generate(v10);

    objc_storeStrong((id *)&v9->_modelDescription, a3);
    uint64_t v11 = [v8 copy];
    configuration = v9->_configuration;
    v9->_configuration = (MLModelConfiguration *)v11;
  }
  return v9;
}

- (unint64_t)signpostID
{
  return self->_signpostID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_modelDescription, 0);
}

- (id)predictionsFromBatch:(id)a3 options:(id)a4 error:(id *)a5
{
  v5 = +[MLModel predictionsFromLoopingOverBatch:a3 model:self options:a4 error:a5];

  return v5;
}

- (id)predictionsFromBatch:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[MLPredictionOptions defaultOptions];
  id v8 = [(MLModelEngine *)self predictionsFromBatch:v6 options:v7 error:a4];

  return v8;
}

- (id)vectorizeInput:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(MLModelEngine *)self modelDescription];
  id v8 = [v7 inputFeatureNames];
  v9 = [v8 array];

  v10 = +[MLFeatureProviderUtils vectorizeFeaturesProvidedBy:v6 featureNames:v9 error:a4];

  return v10;
}

- (void)enableInstrumentsTracing
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [(MLModelEngine *)self configuration];
  v4 = [v3 modelDisplayName];

  v5 = &stru_1EF0E81D0;
  if (v4) {
    v5 = v4;
  }
  id v6 = v5;
  id v7 = +[MLLogging coreChannel];
  id v8 = +[MLLogging coreChannel];
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    int v10 = 134218498;
    unint64_t v11 = [(MLModelEngine *)self signpostID];
    __int16 v12 = 2082;
    uint64_t v13 = [(__CFString *)v6 UTF8String];
    __int16 v14 = 2048;
    v15 = self;
    _os_signpost_emit_with_name_impl(&dword_19E58B000, v7, OS_SIGNPOST_EVENT, v9, "MLModel_Generic_Discover", "Model-signpost-id:%lluModel-name:%{public}sModel-address:%llu", (uint8_t *)&v10, 0x20u);
  }
}

- (void)submitPredictionRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, id))a4;
  id v8 = [v6 inputFeatures];
  os_signpost_id_t v9 = [v6 predictionOptions];
  id v12 = 0;
  int v10 = [(MLModelEngine *)self predictionFromFeatures:v8 options:v9 error:&v12];
  id v11 = v12;

  v7[2](v7, v10, v11);
}

- (id)newRequestForModel:(id)a3 inputFeatures:(id)a4 options:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [[MLGenericPredictionRequest alloc] initForModel:v8 inputFeatures:v9 options:v10];

  return v11;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v12 = (objc_class *)objc_opt_class();
    uint64_t v13 = NSStringFromClass(v12);
    __int16 v14 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v16 = v13;
    __int16 v17 = 2112;
    v18 = v14;
    _os_log_error_impl(&dword_19E58B000, v6, OS_LOG_TYPE_ERROR, "%@ must implement method: %@, but it doesn't.", buf, 0x16u);
  }
  id v7 = (void *)MEMORY[0x1E4F1CA00];
  id v8 = (objc_class *)objc_opt_class();
  id v9 = NSStringFromClass(v8);
  id v10 = NSStringFromSelector(a2);
  [v7 raise:*MEMORY[0x1E4F1C3B8], @"%@ must implement method: %@, but it doesn't.", v9, v10 format];

  return 0;
}

- (id)predictionFromFeatures:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(MLPredictionOptions);
  id v8 = [(MLModelEngine *)self predictionFromFeatures:v6 options:v7 error:a4];

  return v8;
}

- (id)parameterValueForKey:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (a4)
  {
    *a4 = +[MLModelErrorUtils parameterErrorWithUnderlyingError:0, @"Model does not have a parameter for requested key %@.", v5 format];
  }

  return 0;
}

- (id)modelPath
{
  v2 = [(MLModelEngine *)self modelDescription];
  v3 = [v2 modelPath];
  v4 = (void *)[v3 copy];

  return v4;
}

- (void)setModelPath:(id)a3 modelName:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = (void *)[v11 copy];
  id v8 = [(MLModelEngine *)self modelDescription];
  [v8 setModelPath:v7];

  id v9 = [(MLModelEngine *)self modelDescription];
  id v10 = [v9 modelPath];
  [v10 appendPathComponent:v6];
}

- (id)executionSchedule
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(MLModelExecutionSchedule);
  v4 = [[MLLayerExecutionSchedule alloc] initWithLayerError:2];
  id v5 = [(MLModelEngine *)self modelPath];
  id v8 = v5;
  v9[0] = v4;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

  [(MLModelExecutionSchedule *)v3 setModelExecutionSchedule:v6];

  return v3;
}

- (unint64_t)predictionTypeForKTrace
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    id v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    id v11 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v13 = v10;
    __int16 v14 = 2112;
    v15 = v11;
    _os_log_error_impl(&dword_19E58B000, v3, OS_LOG_TYPE_ERROR, "%@ must implement method: %@, but it doesn't.", buf, 0x16u);
  }
  v4 = (void *)MEMORY[0x1E4F1CA00];
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  id v7 = NSStringFromSelector(a2);
  [v4 raise:*MEMORY[0x1E4F1C3B8], @"%@ must implement method: %@, but it doesn't.", v6, v7 format];

  return 0;
}

- (MLModelMetadata)metadata
{
  v2 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
  }

  return 0;
}

- (BOOL)recordsPredictionEvent
{
  return 1;
}

- (MLModelEngine)initWithName:(id)a3 inputDescription:(id)a4 outputDescription:(id)a5 orderedInputFeatureNames:(id)a6 orderedOutputFeatureNames:(id)a7 configuration:(id)a8
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a8;
  __int16 v14 = [MLModelDescription alloc];
  v15 = [(MLModelDescription *)v14 initWithInputDescriptions:v11 outputDescriptions:v12 predictedFeatureName:0 predictedProbabilitiesName:0 trainingInputDescriptions:MEMORY[0x1E4F1CC08] metadata:MEMORY[0x1E4F1CC08]];
  uint64_t v16 = [(MLModelEngine *)self initWithDescription:v15 configuration:v13];

  return v16;
}

@end