@interface MLModel
+ (BOOL)serializeInterfaceAndMetadata:(void *)a3 toArchive:(void *)a4 error:(id *)a5;
+ (MLModel)modelWithContentsOfURL:(NSURL *)url configuration:(MLModelConfiguration *)configuration error:(NSError *)error;
+ (MLModel)modelWithContentsOfURL:(NSURL *)url error:(NSError *)error;
+ (NSArray)availableComputeDevices;
+ (NSURL)compileModelAtURL:(NSURL *)modelURL error:(NSError *)error;
+ (id)_compileModelAtURL:(id)a3 options:(id)a4 error:(id *)a5;
+ (id)compileModelWithoutAutoreleaseAtURL:(id)a3 options:(id)a4 error:(id *)a5;
+ (id)predictionsFromLoopingOverBatch:(id)a3 model:(id)a4 options:(id)a5 error:(id *)a6;
+ (id)predictionsFromSubbatchingBatch:(id)a3 maxSubbatchLength:(int64_t)a4 predictionBlock:(id)a5 options:(id)a6 error:(id *)a7;
+ (int64_t)maxPredictionsInFlight;
+ (unint64_t)generateSignpostId;
+ (void)compileModelAtURL:(NSURL *)modelURL completionHandler:(void *)handler;
+ (void)loadContentsOfURL:(NSURL *)url configuration:(MLModelConfiguration *)configuration completionHandler:(void *)handler;
+ (void)loadModelAsset:(MLModelAsset *)asset configuration:(MLModelConfiguration *)configuration completionHandler:(void *)handler;
- (BOOL)recordsPredictionEvent;
- (BOOL)supportsConcurrentSubmissions;
- (MLClassifier)classifier;
- (MLFairPlayDecryptSession)decryptSession;
- (MLModel)initWithConfiguration:(id)a3;
- (MLModel)initWithDescription:(id)a3;
- (MLModel)initWithDescription:(id)a3 configuration:(id)a4;
- (MLModel)initWithName:(id)a3 inputDescription:(id)a4 outputDescription:(id)a5 orderedInputFeatureNames:(id)a6 orderedOutputFeatureNames:(id)a7 configuration:(id)a8;
- (MLModelConfiguration)configuration;
- (MLModelDescription)modelDescription;
- (MLModelMetadata)metadata;
- (MLNeuralNetwork)neuralNetwork;
- (MLPipeline)pipeline;
- (MLPredictionEvent)predictionEvent;
- (MLProgram)program;
- (MLRegressor)regressor;
- (MLWritable)writable;
- (NSString)description;
- (id)executionSchedule;
- (id)initDescriptionOnlyWithSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5;
- (id)initInterfaceAndMetadataWithCompiledArchive:(void *)a3 error:(id *)a4;
- (id)modelPath;
- (id)newRequestForModel:(id)a3 inputFeatures:(id)a4 options:(id)a5 error:(id *)a6;
- (id)newRequestWithInputFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (id)newRequestWithInputFeatures:(id)a3 usingState:(id)a4 options:(id)a5 error:(id *)a6;
- (id)newState;
- (id)newStateForFeatureNamed:(id)a3 initializerBlock:(id)a4;
- (id)newStateWithClientBuffers:(id)a3;
- (id)objectBoundingBoxOutputDescription;
- (id)parameterValueForKey:(MLParameterKey *)key error:(NSError *)error;
- (id)pipelineOfPostVisionFeaturePrintModelsFromPipeline:(id)a3;
- (id)predictionFromFeatures:(id)a3 usingState:(id)a4 error:(id *)a5;
- (id)predictionFromFeatures:(id)a3 usingState:(id)a4 options:(id)a5 error:(id *)a6;
- (id)predictionFromFeatures:(id)input error:(NSError *)error;
- (id)predictionFromFeatures:(id)input options:(MLPredictionOptions *)options error:(NSError *)error;
- (id)predictionsFromBatch:(id)inputBatch error:(NSError *)error;
- (id)predictionsFromBatch:(id)inputBatch options:(MLPredictionOptions *)options error:(NSError *)error;
- (id)updatable;
- (id)vectorizeInput:(id)a3 error:(id *)a4;
- (id)visionFeaturePrintInfo;
- (unint64_t)nextPredictionRequestID;
- (unint64_t)predictionTypeForKTrace;
- (unint64_t)signpostID;
- (void)enableInstrumentsTracing;
- (void)enableInstrumentsTracingIfNeeded;
- (void)predictionFromFeatures:(id)a3 usingState:(id)a4 options:(id)a5 completionHandler:(id)a6;
- (void)predictionFromFeatures:(id)input completionHandler:(void *)completionHandler;
- (void)predictionFromFeatures:(id)input options:(MLPredictionOptions *)options completionHandler:(void *)completionHandler;
- (void)prepareWithCompletionHandler:(id)a3;
- (void)prepareWithConcurrencyHint:(int64_t)a3;
- (void)setConfiguration:(id)a3;
- (void)setDecryptSession:(id)a3;
- (void)setModelDescription:(id)a3;
- (void)setModelPath:(id)a3 modelName:(id)a4;
- (void)setPredictionEvent:(id)a3;
- (void)setSignpostID:(unint64_t)a3;
- (void)submitPredictionRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation MLModel

- (MLModel)initWithDescription:(id)a3 configuration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MLModel;
  v9 = [(MLModel *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_modelDescription, a3);
    objc_storeStrong((id *)&v10->_configuration, a4);
    v10->_signpostID = +[MLModel generateSignpostId];
    atomic_store(0, (unsigned __int8 *)&v10->_emittedDetailsToInstruments);
    atomic_store(1uLL, &v10->_nextPredictionRequestID.__a_.__a_value);
    v11 = objc_alloc_init(MLPredictionEvent);
    predictionEvent = v10->_predictionEvent;
    v10->_predictionEvent = v11;

    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.coreml.DefaultAsyncPredictionQueue", v13);
    asyncPredictionQueue = v10->_asyncPredictionQueue;
    v10->_asyncPredictionQueue = (OS_dispatch_queue *)v14;
  }
  return v10;
}

+ (unint64_t)generateSignpostId
{
  v2 = +[MLLogging coreChannel];
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  return v3;
}

- (MLPredictionEvent)predictionEvent
{
  return self->_predictionEvent;
}

- (MLModelDescription)modelDescription
{
  return self->_modelDescription;
}

- (void)enableInstrumentsTracingIfNeeded
{
  if ([(MLModelConfiguration *)self->_configuration allowsInstrumentation])
  {
    if (MLLoggingGetInstrumentsActiveChannel_onceToken != -1) {
      dispatch_once(&MLLoggingGetInstrumentsActiveChannel_onceToken, &__block_literal_global_22);
    }
    BOOL v3 = os_signpost_enabled((os_log_t)MLLoggingGetInstrumentsActiveChannel_instrumentsActiveChannel);
    unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_emittedDetailsToInstruments);
    if (v3)
    {
      if (v4)
      {
        atomic_load((unsigned __int8 *)&self->_emittedDetailsToInstruments);
      }
      else
      {
        [(MLModel *)self enableInstrumentsTracing];
        atomic_store(1u, (unsigned __int8 *)&self->_emittedDetailsToInstruments);
      }
    }
    else if (v4)
    {
      atomic_store(0, (unsigned __int8 *)&self->_emittedDetailsToInstruments);
    }
  }
}

- (unint64_t)nextPredictionRequestID
{
  return atomic_fetch_add((atomic_ullong *volatile)&self->_nextPredictionRequestID, 1uLL);
}

+ (MLModel)modelWithContentsOfURL:(NSURL *)url configuration:(MLModelConfiguration *)configuration error:(NSError *)error
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v7 = url;
  id v8 = configuration;
  if (v7)
  {
    v9 = (void *)MEMORY[0x19F3C29E0]();
    id v22 = 0;
    v10 = +[MLModelAsset modelAssetWithURL:v7 error:&v22];
    id v11 = v22;
    if (v10)
    {
      v12 = (void *)[(MLModelConfiguration *)v8 copy];
      id v21 = v11;
      v13 = [v10 modelWithConfiguration:v12 error:&v21];
      id v14 = v21;

      id v11 = v14;
    }
    else
    {
      v13 = 0;
    }

    if (v13)
    {
      id v17 = v13;
      v19 = v17;
LABEL_14:

      goto LABEL_15;
    }
    if (!error)
    {
      id v17 = 0;
      v19 = 0;
      goto LABEL_14;
    }
    v18 = (NSError *)v11;
    id v11 = v18;
    id v17 = 0;
LABEL_13:
    v19 = 0;
    *error = v18;
    goto LABEL_14;
  }
  v15 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19E58B000, v15, OS_LOG_TYPE_ERROR, "nil value for URL", buf, 2u);
  }

  if (error)
  {
    v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    id v11 = [NSString stringWithFormat:@"nil value for URL"];
    v25[0] = v11;
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    v18 = [v16 errorWithDomain:@"com.apple.CoreML" code:3 userInfo:v17];
    goto LABEL_13;
  }
  v19 = 0;
LABEL_15:

  return (MLModel *)v19;
}

- (void)setDecryptSession:(id)a3
{
}

- (id)initDescriptionOnlyWithSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = [[MLModelDescription alloc] initFromSingleFunctionModelSpecification:a3];
  v9 = [(MLModel *)self initWithDescription:v8 configuration:v7];

  return v9;
}

- (id)objectBoundingBoxOutputDescription
{
  BOOL v3 = [(MLModel *)self internalEngine];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [(MLModel *)self internalEngine];
    if (v5)
    {
LABEL_3:
      v6 = [v5 parameters];
      id v7 = [v6 objectBoundingBoxOutputDescription];

      goto LABEL_12;
    }
  }
  else
  {
    id v8 = [(MLModel *)self pipeline];
    v9 = v8;
    if (v8)
    {
      v10 = [v8 models];
      id v11 = [v10 lastObject];

      v12 = [v11 internalEngine];
      objc_opt_class();
      char v13 = objc_opt_isKindOfClass();

      if (v13)
      {
        v5 = [v11 internalEngine];
      }
      else
      {
        v5 = 0;
      }
    }
    else
    {
      v5 = 0;
    }

    if (v5) {
      goto LABEL_3;
    }
  }
  id v7 = 0;
LABEL_12:

  return v7;
}

+ (NSArray)availableComputeDevices
{
  v2 = +[MLAllComputeDeviceRegistry sharedRegistry];
  BOOL v3 = [v2 registeredAndAccessibleComputeDevices];

  return (NSArray *)v3;
}

- (id)initInterfaceAndMetadataWithCompiledArchive:(void *)a3 error:(id *)a4
{
  _ZNSt3__115allocate_sharedB8ne180100IN6CoreML13Specification16ModelDescriptionENS_9allocatorIS3_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v13);
  if (+[MLModelIOUtils deserializeInterfaceFormat:&v13 archive:a3 error:a4])
  {
    id v7 = [[MLModelAssetDescription alloc] initFromModelDescriptionSpecification:&v13];
    id v8 = [v7 defaultModelDescription];
    v9 = objc_alloc_init(MLModelConfiguration);
    v10 = [(MLModel *)self initWithDescription:v8 configuration:v9];

    self = v10;
    id v11 = self;
  }
  else
  {
    id v11 = 0;
  }
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }

  return v11;
}

+ (BOOL)serializeInterfaceAndMetadata:(void *)a3 toArchive:(void *)a4 error:(id *)a5
{
  if (*(void *)(*(void *)a3 + 16)) {
    id v7 = *(const CoreML::Specification::ModelDescription **)(*(void *)a3 + 16);
  }
  else {
    id v7 = (const CoreML::Specification::ModelDescription *)&CoreML::Specification::_ModelDescription_default_instance_;
  }
  _MLModelDescriptionSpecification::_MLModelDescriptionSpecification((_MLModelDescriptionSpecification *)&v10, v7);
  BOOL v8 = +[MLModelIOUtils serializeInterfaceFormat:&v10 archive:a4 error:a5];
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  return v8;
}

- (id)visionFeaturePrintInfo
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    BOOL v3 = [(MLModel *)self pipeline];
  }
  else
  {
    id v14 = [(MLModel *)self internalEngine];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      unsigned __int8 v4 = 0;
LABEL_13:
      id v11 = 0;
      goto LABEL_19;
    }
    BOOL v3 = [(MLModel *)self internalEngine];
  }
  unsigned __int8 v4 = v3;
  if (!v3) {
    goto LABEL_13;
  }
  v5 = [v3 models];
  unint64_t v6 = [v5 count];

  if (v6 < 2) {
    goto LABEL_13;
  }
  id v7 = [v4 models];
  BOOL v8 = [v7 firstObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [v8 parameters];
    uint64_t v10 = [v9 featureExtractorParameters];

    id v11 = objc_alloc_init(MLModelVisionFeaturePrintInfo);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      -[MLModelVisionFeaturePrintInfo setVersion:](v11, "setVersion:", [v10 scenePrintVersion]);
      v12 = [v4 models];
      char v13 = [v12 objectAtIndexedSubscript:1];
      [(MLModelVisionFeaturePrintInfo *)v11 setPostVisionFeaturePrintModel:v13];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_17:
        [(MLModelVisionFeaturePrintInfo *)v11 setFeatureExtractorParameters:v10];

        goto LABEL_18;
      }
      -[MLModelVisionFeaturePrintInfo setVersion:](v11, "setVersion:", [v10 objectPrintVersion]);
      v12 = [(MLModel *)self pipelineOfPostVisionFeaturePrintModelsFromPipeline:v4];
      [(MLModelVisionFeaturePrintInfo *)v11 setPostVisionFeaturePrintModel:v12];
    }

    goto LABEL_17;
  }
  id v11 = 0;
LABEL_18:

LABEL_19:

  return v11;
}

- (id)pipelineOfPostVisionFeaturePrintModelsFromPipeline:(id)a3
{
  BOOL v3 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v23 = a3;
  id v24 = objc_alloc_init(v3);
  unsigned __int8 v4 = [v23 models];
  id v22 = [v4 objectAtIndexedSubscript:1];

  v5 = [v23 models];
  unint64_t v6 = [v5 objectAtIndexedSubscript:2];

  id v7 = [MLModelDescription alloc];
  BOOL v8 = [v22 modelDescription];
  v9 = [v8 inputDescriptionsByName];
  uint64_t v10 = [v6 modelDescription];
  id v11 = [v10 outputDescriptionsByName];
  v12 = [v6 modelDescription];
  char v13 = [v12 predictedFeatureName];
  id v14 = [v6 modelDescription];
  v15 = [v14 predictedProbabilitiesName];
  v16 = [(MLModelDescription *)v7 initWithInputDescriptions:v9 outputDescriptions:v11 predictedFeatureName:v13 predictedProbabilitiesName:v15 trainingInputDescriptions:0 orderedInputFeatureNames:0 orderedOutputFeatureNames:0 metadata:0];

  [v24 addObject:v22];
  [v24 addObject:v6];
  id v17 = [MLPipeline alloc];
  v18 = [v23 configuration];

  v19 = [(MLPipeline *)v17 initWithModels:v24 modelNames:&unk_1EF11A958 description:v16 configuration:v18];
  v20 = [[MLDelegateModel alloc] initWithEngine:v19 error:0];

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_modelDescription, 0);
  objc_storeStrong((id *)&self->_predictionEvent, 0);
  objc_storeStrong((id *)&self->_decryptSession, 0);
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_asyncPredictionQueue, 0);
}

- (void)setSignpostID:(unint64_t)a3
{
  self->_signpostID = a3;
}

- (void)setConfiguration:(id)a3
{
}

- (void)setModelDescription:(id)a3
{
}

- (void)setPredictionEvent:(id)a3
{
}

- (MLFairPlayDecryptSession)decryptSession
{
  return self->_decryptSession;
}

- (MLModelMetadata)metadata
{
  return (MLModelMetadata *)objc_getProperty(self, a2, 40, 1);
}

- (id)newStateForFeatureNamed:(id)a3 initializerBlock:(id)a4
{
  unsigned __int8 v4 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)unint64_t v6 = 0;
    _os_log_error_impl(&dword_19E58B000, v4, OS_LOG_TYPE_ERROR, "This model type does not currently support states.", v6, 2u);
  }

  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"This model type does not currently support states."];
  return 0;
}

- (id)newRequestWithInputFeatures:(id)a3 usingState:(id)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = +[MLState emptyState];

  if (v12 != v10)
  {
    char v13 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v19 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v19);
      *(_DWORD *)buf = 138412290;
      id v22 = v20;
      _os_log_error_impl(&dword_19E58B000, v13, OS_LOG_TYPE_ERROR, "This model engine (%@) doesn't support a stateful prediction.", buf, 0xCu);
    }
    id v14 = (void *)MEMORY[0x1E4F1CA00];
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    [v14 raise:*MEMORY[0x1E4F1C3B8], @"This model engine (%@) doesn't support a stateful prediction.", v16 format];
  }
  id v17 = [[MLGenericPredictionRequest alloc] initForModel:self inputFeatures:v9 options:v11];

  return v17;
}

- (id)newRequestWithInputFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [[MLGenericPredictionRequest alloc] initForModel:self inputFeatures:v7 options:v8];

  return v9;
}

- (void)enableInstrumentsTracing
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(MLModelConfiguration *)self->_configuration modelDisplayName];
  if (v3)
  {
    unsigned __int8 v4 = [(MLModelConfiguration *)self->_configuration modelDisplayName];
  }
  else
  {
    unsigned __int8 v4 = &stru_1EF0E81D0;
  }

  v5 = +[MLLogging coreChannel];
  unint64_t v6 = +[MLLogging coreChannel];
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    unint64_t signpostID = self->_signpostID;
    int v9 = 134218498;
    unint64_t v10 = signpostID;
    __int16 v11 = 2082;
    uint64_t v12 = [(__CFString *)v4 UTF8String];
    __int16 v13 = 2048;
    id v14 = self;
    _os_signpost_emit_with_name_impl(&dword_19E58B000, v5, OS_SIGNPOST_EVENT, v7, "MLModel_Generic_Discover", "Model-signpost-id:%lluModel-name:%{public}sModel-address:%llu", (uint8_t *)&v9, 0x20u);
  }
}

- (MLPipeline)pipeline
{
  if ([(MLModel *)self conformsToProtocol:&unk_1EF12B2D0]) {
    BOOL v3 = self;
  }
  else {
    BOOL v3 = 0;
  }

  return (MLPipeline *)v3;
}

- (MLRegressor)regressor
{
  if ([(MLModel *)self conformsToProtocol:&unk_1EF121EC0]) {
    BOOL v3 = self;
  }
  else {
    BOOL v3 = 0;
  }

  return (MLRegressor *)v3;
}

- (MLClassifier)classifier
{
  if ([(MLModel *)self conformsToProtocol:&unk_1EF11CB68]) {
    BOOL v3 = self;
  }
  else {
    BOOL v3 = 0;
  }

  return (MLClassifier *)v3;
}

- (id)updatable
{
  if ([(MLModel *)self conformsToProtocol:&unk_1EF1247D8]) {
    BOOL v3 = self;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (MLWritable)writable
{
  if ([(MLModel *)self conformsToProtocol:&unk_1EF1246F0]) {
    BOOL v3 = self;
  }
  else {
    BOOL v3 = 0;
  }

  return (MLWritable *)v3;
}

- (MLNeuralNetwork)neuralNetwork
{
  if ([(MLModel *)self conformsToProtocol:&unk_1EF121E48]) {
    BOOL v3 = self;
  }
  else {
    BOOL v3 = 0;
  }

  return (MLNeuralNetwork *)v3;
}

- (MLProgram)program
{
  return 0;
}

- (MLModelConfiguration)configuration
{
  v2 = (void *)[(MLModelConfiguration *)self->_configuration copy];

  return (MLModelConfiguration *)v2;
}

- (id)parameterValueForKey:(MLParameterKey *)key error:(NSError *)error
{
  v5 = key;
  if (error)
  {
    *error = +[MLModelErrorUtils parameterErrorWithUnderlyingError:0, @"Model does not have a parameter for requested key %@.", v5 format];
  }

  return 0;
}

- (id)predictionsFromBatch:(id)inputBatch options:(MLPredictionOptions *)options error:(NSError *)error
{
  id v8 = inputBatch;
  int v9 = options;
  [(MLModel *)self enableInstrumentsTracingIfNeeded];
  unint64_t v10 = [(MLModel *)self signpostID];
  uint64_t v11 = [(MLPredictionOptions *)v9 parentSignpostID];
  kdebug_trace();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __46__MLModel_predictionsFromBatch_options_error___block_invoke;
  v15[3] = &__block_descriptor_48_e5_v8__0l;
  v15[4] = v10;
  v15[5] = v11;
  uint64_t v12 = (void (**)(void))_Block_copy(v15);
  if (!v9)
  {
    int v9 = +[MLPredictionOptions defaultOptions];
  }
  __int16 v13 = +[MLModel predictionsFromLoopingOverBatch:v8 model:self options:v9 error:error];
  v12[2](v12);

  return v13;
}

uint64_t __46__MLModel_predictionsFromBatch_options_error___block_invoke()
{
  return kdebug_trace();
}

- (id)predictionsFromBatch:(id)inputBatch error:(NSError *)error
{
  id v6 = inputBatch;
  os_signpost_id_t v7 = (void *)MEMORY[0x19F3C29E0]();
  id v8 = +[MLPredictionOptions defaultOptions];
  id v12 = 0;
  int v9 = [(MLModel *)self predictionsFromBatch:v6 options:v8 error:&v12];
  id v10 = v12;

  if (error && !v9) {
    *error = (NSError *)v10;
  }

  return v9;
}

- (NSString)description
{
  BOOL v3 = NSString;
  unsigned __int8 v4 = [(MLModel *)self modelDescription];
  v5 = [(MLModel *)self configuration];
  id v6 = [v3 stringWithFormat:@"\nmodelDescription: %@, \nconfiguration: %@", v4, v5];

  return (NSString *)v6;
}

- (void)predictionFromFeatures:(id)a3 usingState:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10)
  {
    id v14 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E58B000, v14, OS_LOG_TYPE_ERROR, "The input feature provider cannot be nil.", buf, 2u);
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The input feature provider cannot be nil."];
  }
  if (v12)
  {
    if (v13) {
      goto LABEL_12;
    }
  }
  else
  {
    id v12 = +[MLPredictionOptions defaultOptions];
    if (v13) {
      goto LABEL_12;
    }
  }
  uint64_t v15 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19E58B000, v15, OS_LOG_TYPE_ERROR, "The completion handler cannot be nil.", buf, 2u);
  }

  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The completion handler cannot be nil."];
LABEL_12:
  asyncPredictionQueue = self->_asyncPredictionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__MLModel_predictionFromFeatures_usingState_options_completionHandler___block_invoke;
  block[3] = &unk_1E59A4B58;
  block[4] = self;
  id v22 = v10;
  id v23 = v11;
  id v24 = v12;
  id v25 = v13;
  id v17 = v13;
  id v18 = v12;
  id v19 = v11;
  id v20 = v10;
  dispatch_async(asyncPredictionQueue, block);
}

void __71__MLModel_predictionFromFeatures_usingState_options_completionHandler___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  id v8 = 0;
  id v6 = [v2 predictionFromFeatures:v3 usingState:v4 options:v5 error:&v8];
  id v7 = v8;
  (*(void (**)(void))(a1[8] + 16))();
}

- (void)predictionFromFeatures:(id)input options:(MLPredictionOptions *)options completionHandler:(void *)completionHandler
{
  id v11 = input;
  id v8 = options;
  int v9 = completionHandler;
  id v10 = +[MLState emptyState];
  [(MLModel *)self predictionFromFeatures:v11 usingState:v10 options:v8 completionHandler:v9];
}

- (void)predictionFromFeatures:(id)input completionHandler:(void *)completionHandler
{
  id v9 = input;
  id v6 = completionHandler;
  id v7 = (void *)MEMORY[0x19F3C29E0]();
  id v8 = +[MLPredictionOptions defaultOptions];
  [(MLModel *)self predictionFromFeatures:v9 options:v8 completionHandler:v6];
}

- (void)submitPredictionRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v8 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v11 = 0;
      _os_log_error_impl(&dword_19E58B000, v8, OS_LOG_TYPE_ERROR, "The prediction request cannot be nil.", v11, 2u);
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The prediction request cannot be nil."];
  }
  id v9 = [v6 inputFeatures];
  id v10 = [v6 predictionOptions];
  [(MLModel *)self predictionFromFeatures:v9 options:v10 completionHandler:v7];
}

- (id)predictionFromFeatures:(id)a3 usingState:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)MEMORY[0x19F3C29E0]();
  id v11 = +[MLPredictionOptions defaultOptions];
  id v15 = 0;
  id v12 = [(MLModel *)self predictionFromFeatures:v8 usingState:v9 options:v11 error:&v15];
  id v13 = v15;

  if (a5 && !v12) {
    *a5 = v13;
  }

  return v12;
}

- (id)predictionFromFeatures:(id)input error:(NSError *)error
{
  id v6 = input;
  id v7 = (void *)MEMORY[0x19F3C29E0]();
  id v8 = +[MLPredictionOptions defaultOptions];
  id v12 = 0;
  id v9 = [(MLModel *)self predictionFromFeatures:v6 options:v8 error:&v12];
  id v10 = v12;

  if (error && !v9) {
    *error = (NSError *)v10;
  }

  return v9;
}

- (id)predictionFromFeatures:(id)a3 usingState:(id)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = +[MLState emptyState];

  if (v14 == v12)
  {
    id v20 = [(MLModel *)self predictionFromFeatures:v11 options:v13 error:a6];
  }
  else
  {
    id v15 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v22 = (objc_class *)objc_opt_class();
      id v23 = NSStringFromClass(v22);
      id v24 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v26 = v23;
      __int16 v27 = 2112;
      v28 = v24;
      _os_log_error_impl(&dword_19E58B000, v15, OS_LOG_TYPE_ERROR, "This model engine (%@) doesn't implement %@.", buf, 0x16u);
    }
    v16 = (void *)MEMORY[0x1E4F1CA00];
    id v17 = (objc_class *)objc_opt_class();
    id v18 = NSStringFromClass(v17);
    id v19 = NSStringFromSelector(a2);
    [v16 raise:*MEMORY[0x1E4F1C3B8], @"This model engine (%@) doesn't implement %@.", v18, v19 format];

    id v20 = 0;
  }

  return v20;
}

- (id)predictionFromFeatures:(id)input options:(MLPredictionOptions *)options error:(NSError *)error
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v11 = 0;
    _os_log_error_impl(&dword_19E58B000, v6, OS_LOG_TYPE_ERROR, "Missing predictionFromFeatures:options:error: implementation", v11, 2u);
  }

  if (error)
  {
    id v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28568];
    id v8 = [NSString stringWithFormat:@"Missing predictionFromFeatures:options:error: implementation"];
    v13[0] = v8;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    *error = [v7 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v9];
  }
  return 0;
}

- (void)prepareWithCompletionHandler:(id)a3
{
}

- (id)modelPath
{
  v2 = [(MLModel *)self modelDescription];
  uint64_t v3 = [v2 modelPath];
  uint64_t v4 = (void *)[v3 copy];

  return v4;
}

- (void)setModelPath:(id)a3 modelName:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = (void *)[v9 copy];
  [(MLModelDescription *)self->_modelDescription setModelPath:v7];

  id v8 = [(MLModelDescription *)self->_modelDescription modelPath];
  [v8 appendPathComponent:v6];
}

- (id)executionSchedule
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_alloc_init(MLModelExecutionSchedule);
  uint64_t v4 = [[MLLayerExecutionSchedule alloc] initWithLayerError:2];
  uint64_t v5 = [(MLModel *)self modelPath];
  id v8 = v5;
  v9[0] = v4;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

  [(MLModelExecutionSchedule *)v3 setModelExecutionSchedule:v6];

  return v3;
}

- (id)newStateWithClientBuffers:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    uint64_t v12 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    id v14 = v11;
    __int16 v15 = 2112;
    v16 = v12;
    _os_log_error_impl(&dword_19E58B000, v4, OS_LOG_TYPE_ERROR, "This model engine (%@) doesn't implement %@.", buf, 0x16u);
  }
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  id v8 = NSStringFromSelector(a2);
  [v5 raise:*MEMORY[0x1E4F1C3B8], @"This model engine (%@) doesn't implement %@.", v7, v8 format];

  return 0;
}

- (id)newState
{
  uint64_t v3 = (void *)MEMORY[0x19F3C29E0](self, a2);
  id v4 = [(MLModel *)self newStateWithClientBuffers:MEMORY[0x1E4F1CC08]];
  return v4;
}

- (void)prepareWithConcurrencyHint:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    id v11 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    id v13 = v10;
    __int16 v14 = 2112;
    __int16 v15 = v11;
    _os_log_error_impl(&dword_19E58B000, v4, OS_LOG_TYPE_ERROR, "This model engine (%@) doesn't implement %@.", buf, 0x16u);
  }
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  id v8 = NSStringFromSelector(a2);
  [v5 raise:*MEMORY[0x1E4F1C3B8], @"This model engine (%@) doesn't implement %@.", v7, v8 format];
}

- (id)newRequestForModel:(id)a3 inputFeatures:(id)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    id v13 = (objc_class *)objc_opt_class();
    __int16 v14 = NSStringFromClass(v13);
    __int16 v15 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v17 = v14;
    __int16 v18 = 2112;
    id v19 = v15;
    _os_log_error_impl(&dword_19E58B000, v7, OS_LOG_TYPE_ERROR, "This model engine (%@) doesn't implement %@.", buf, 0x16u);
  }
  id v8 = (void *)MEMORY[0x1E4F1CA00];
  id v9 = (objc_class *)objc_opt_class();
  id v10 = NSStringFromClass(v9);
  id v11 = NSStringFromSelector(a2);
  [v8 raise:*MEMORY[0x1E4F1C3B8], @"This model engine (%@) doesn't implement %@.", v10, v11 format];

  return 0;
}

- (BOOL)recordsPredictionEvent
{
  v2 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v4 = 0;
    _os_log_error_impl(&dword_19E58B000, v2, OS_LOG_TYPE_ERROR, "MLModel will not conform to MLModeling and therefore you should not call this method.", v4, 2u);
  }

  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"MLModel will not conform to MLModeling and therefore you should not call this method."];
  return 0;
}

- (unint64_t)predictionTypeForKTrace
{
  return 0;
}

- (BOOL)supportsConcurrentSubmissions
{
  v2 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v4 = 0;
    _os_log_error_impl(&dword_19E58B000, v2, OS_LOG_TYPE_ERROR, "MLModel will not conform to MLModeling and therefore you should not call this method.", v4, 2u);
  }

  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"MLModel will not conform to MLModeling and therefore you should not call this method."];
  return 0;
}

- (unint64_t)signpostID
{
  return self->_signpostID;
}

- (MLModel)initWithName:(id)a3 inputDescription:(id)a4 outputDescription:(id)a5 orderedInputFeatureNames:(id)a6 orderedOutputFeatureNames:(id)a7 configuration:(id)a8
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a8;
  __int16 v14 = [MLModelDescription alloc];
  __int16 v15 = [(MLModelDescription *)v14 initWithInputDescriptions:v11 outputDescriptions:v12 predictedFeatureName:0 predictedProbabilitiesName:0 trainingInputDescriptions:MEMORY[0x1E4F1CC08] metadata:MEMORY[0x1E4F1CC08]];
  uint64_t v16 = [(MLModel *)self initWithDescription:v15 configuration:v13];

  return v16;
}

- (MLModel)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MLModel;
  id v6 = [(MLModel *)&v12 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v7->_unint64_t signpostID = +[MLModel generateSignpostId];
    atomic_store(0, (unsigned __int8 *)&v7->_emittedDetailsToInstruments);
    id v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.coreml.DefaultAsyncPredictionQueue", v8);
    asyncPredictionQueue = v7->_asyncPredictionQueue;
    v7->_asyncPredictionQueue = (OS_dispatch_queue *)v9;
  }
  return v7;
}

- (MLModel)initWithDescription:(id)a3
{
  id v4 = a3;
  id v5 = +[MLModelConfiguration defaultConfiguration];
  id v6 = [(MLModel *)self initWithDescription:v4 configuration:v5];

  return v6;
}

+ (void)loadModelAsset:(MLModelAsset *)asset configuration:(MLModelConfiguration *)configuration completionHandler:(void *)handler
{
  id v7 = asset;
  id v8 = configuration;
  dispatch_queue_t v9 = handler;
  id v10 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__MLModel_loadModelAsset_configuration_completionHandler___block_invoke;
  block[3] = &unk_1E59A4F18;
  __int16 v15 = v7;
  uint64_t v16 = v8;
  id v17 = v9;
  id v11 = v9;
  objc_super v12 = v8;
  id v13 = v7;
  dispatch_async(v10, block);
}

void __58__MLModel_loadModelAsset_configuration_completionHandler___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v6 = 0;
  id v4 = [v2 modelWithConfiguration:v3 error:&v6];
  id v5 = v6;
  (*(void (**)(void))(a1[6] + 16))();
}

+ (void)loadContentsOfURL:(NSURL *)url configuration:(MLModelConfiguration *)configuration completionHandler:(void *)handler
{
  id v7 = url;
  id v8 = configuration;
  dispatch_queue_t v9 = handler;
  id v10 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__MLModel_loadContentsOfURL_configuration_completionHandler___block_invoke;
  block[3] = &unk_1E59A4F18;
  __int16 v15 = v7;
  uint64_t v16 = v8;
  id v17 = v9;
  id v11 = v9;
  objc_super v12 = v8;
  id v13 = v7;
  dispatch_async(v10, block);
}

void __61__MLModel_loadContentsOfURL_configuration_completionHandler___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[5];
  id v6 = 0;
  id v4 = +[MLModel modelWithContentsOfURL:v2 configuration:v3 error:&v6];
  id v5 = v6;
  (*(void (**)(void))(a1[6] + 16))();
}

+ (MLModel)modelWithContentsOfURL:(NSURL *)url error:(NSError *)error
{
  id v5 = url;
  id v6 = (void *)MEMORY[0x19F3C29E0]();
  id v7 = objc_alloc_init(MLModelConfiguration);
  id v11 = 0;
  id v8 = +[MLModel modelWithContentsOfURL:v5 configuration:v7 error:&v11];
  id v9 = v11;

  if (error && !v8) {
    *error = (NSError *)v9;
  }

  return (MLModel *)v8;
}

- (id)vectorizeInput:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(MLModel *)self modelDescription];
  id v8 = [v7 inputFeatureNames];
  id v9 = [v8 array];
  id v10 = +[MLFeatureProviderUtils vectorizeFeaturesProvidedBy:v6 featureNames:v9 error:a4];

  if (v10) {
    id v11 = v10;
  }

  return v10;
}

+ (int64_t)maxPredictionsInFlight
{
  return 2;
}

+ (id)predictionsFromSubbatchingBatch:(id)a3 maxSubbatchLength:(int64_t)a4 predictionBlock:(id)a5 options:(id)a6 error:(id *)a7
{
  id v11 = a3;
  objc_super v12 = (void (**)(id, void *, id, id *))a5;
  id v29 = a6;
  v30 = v11;
  uint64_t v13 = [v11 count];
  uint64_t v14 = v13;
  if (a4 <= 1) {
    int64_t v15 = 1;
  }
  else {
    int64_t v15 = a4;
  }
  v28 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v13 / v15 + 1];
  if (v14 < 1)
  {
    id v17 = 0;
LABEL_14:
    id v24 = v28;
    id v25 = +[MLBatchProviderUtils batchFromConcatinatingBatches:v28];
  }
  else
  {
    uint64_t v16 = 0;
    id v17 = 0;
    __int16 v27 = a7;
    int64_t v18 = v14;
    while (1)
    {
      id v19 = (void *)MEMORY[0x19F3C29E0]();
      if (v15 >= v18) {
        int64_t v20 = v18;
      }
      else {
        int64_t v20 = v15;
      }
      id v32 = v17;
      id v21 = +[MLBatchProviderUtils lazyBatchWindowIntoBatch:v30 startIndex:v16 windowLength:v20 error:&v32];
      id v22 = v32;

      if (!v21)
      {
        id v17 = v22;
        goto LABEL_17;
      }
      id v31 = v22;
      id v23 = v12[2](v12, v21, v29, &v31);
      id v17 = v31;

      if (!v23) {
        break;
      }
      [v28 addObject:v23];

      v16 += v15;
      v18 -= v15;
      if (v16 >= v14) {
        goto LABEL_14;
      }
    }

LABEL_17:
    id v24 = v28;
    if (v27)
    {
      id v17 = v17;
      id v25 = 0;
      *__int16 v27 = v17;
    }
    else
    {
      id v25 = 0;
    }
  }

  return v25;
}

+ (id)predictionsFromLoopingOverBatch:(id)a3 model:(id)a4 options:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [v9 count];
  uint64_t v13 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v12];
  uint64_t v14 = (void *)v13;
  uint64_t v32 = v12;
  if (v12 < 1) {
    goto LABEL_14;
  }
  v30 = a6;
  id v31 = (void *)v13;
  uint64_t v15 = 0;
  id v16 = 0;
  while (1)
  {
    id v17 = (void *)MEMORY[0x19F3C29E0]();
    uint64_t v18 = [v9 featuresAtIndex:v15];
    if (!v18) {
      break;
    }
    id v19 = (void *)v18;
    id v33 = v16;
    int64_t v20 = [v10 predictionFromFeatures:v18 options:v11 error:&v33];
    id v21 = v33;

    if (v20)
    {
      [v14 addObject:v20];
      id v16 = v21;
    }
    else
    {
      [NSNumber numberWithInteger:v15];
      id v22 = v9;
      id v23 = v11;
      v25 = id v24 = v10;
      id v16 = +[MLModelErrorUtils errorWithCode:0, v21, @"Failed to obtain prediction for sample %@", v25 underlyingError format];

      id v10 = v24;
      id v11 = v23;
      id v9 = v22;
      uint64_t v14 = v31;
    }

    if (v20)
    {
      if (++v15 < v32) {
        continue;
      }
    }
    goto LABEL_11;
  }
  v26 = [NSNumber numberWithInteger:v15];
  uint64_t v27 = +[MLModelErrorUtils genericErrorWithFormat:@"Batch produced nil feature provider for index %@", v26];

  id v16 = (id)v27;
LABEL_11:
  if (v16)
  {
    if (v30)
    {
      id v16 = v16;
      v28 = 0;
      id *v30 = v16;
    }
    else
    {
      v28 = 0;
    }
  }
  else
  {
LABEL_14:
    v28 = [[MLArrayBatchProvider alloc] initWithFeatureProviderArray:v14];
    id v16 = 0;
  }

  return v28;
}

+ (void)compileModelAtURL:(NSURL *)modelURL completionHandler:(void *)handler
{
  id v6 = modelURL;
  id v7 = handler;
  id v8 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__MLModel_MLModelCompilation__compileModelAtURL_completionHandler___block_invoke;
  block[3] = &unk_1E59A52B0;
  id v13 = v7;
  id v14 = a1;
  uint64_t v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __67__MLModel_MLModelCompilation__compileModelAtURL_completionHandler___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[6];
  uint64_t v3 = a1[4];
  id v4 = +[MLCompilerOptions defaultOptions];
  id v7 = 0;
  id v5 = [v2 _compileModelAtURL:v3 options:v4 error:&v7];
  id v6 = v7;

  (*(void (**)(void))(a1[5] + 16))();
}

+ (NSURL)compileModelAtURL:(NSURL *)modelURL error:(NSError *)error
{
  id v6 = modelURL;
  id v7 = +[MLCompilerOptions defaultOptions];
  id v8 = [a1 _compileModelAtURL:v6 options:v7 error:error];

  return (NSURL *)v8;
}

+ (id)_compileModelAtURL:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (_compileModelAtURL_options_error__once_token != -1) {
    dispatch_once(&_compileModelAtURL_options_error__once_token, &__block_literal_global_26464);
  }
  if (pthread_main_np() == 1)
  {
    id v10 = [MEMORY[0x1E4F963E8] currentProcess];
    int v11 = [v10 isApplication];

    if (v11)
    {
      uint64_t v12 = _compileModelAtURL_options_error__logging_system;
      if (os_log_type_enabled((os_log_t)_compileModelAtURL_options_error__logging_system, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_19E58B000, v12, OS_LOG_TYPE_FAULT, "This method should not be called on the main thread as it may lead to UI unresponsiveness.", buf, 2u);
      }
    }
  }
  id v13 = (void *)MEMORY[0x19F3C29E0]();
  id v17 = 0;
  id v14 = [a1 compileModelWithoutAutoreleaseAtURL:v8 options:v9 error:&v17];
  id v15 = v17;
  if (a5) {
    *a5 = v15;
  }

  return v14;
}

void __64__MLModel_MLModelCompilation___compileModelAtURL_options_error___block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.runtime-issues", "CoreML");
  v1 = (void *)_compileModelAtURL_options_error__logging_system;
  _compileModelAtURL_options_error__logging_system = (uint64_t)v0;
}

+ (id)compileModelWithoutAutoreleaseAtURL:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = NSTemporaryDirectory();
  if (v9)
  {
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v9 isDirectory:1];
    if (!v10)
    {
      if (a5)
      {
        +[MLModelErrorUtils IOErrorWithFormat:@"Failed to create NSURL object for path: %@", v9];
        id v20 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v20 = 0;
      }
      goto LABEL_24;
    }
    int v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v12 = [v11 URLForDirectory:99 inDomain:1 appropriateForURL:v10 create:1 error:a5];
    if (v12)
    {
      id v13 = +[MLCompiler compileModelAtURL:v7 toURL:v12 options:v8 error:a5];

      if (v13)
      {
        id v14 = [v7 lastPathComponent];
        id v15 = [v14 stringByDeletingPathExtension];
        id v16 = [v15 stringByAppendingPathExtension:@"mlmodelc"];

        uint64_t v17 = [v12 URLByAppendingPathComponent:v16];
        uint64_t v18 = [v10 URLByAppendingPathComponent:v16];
        v30 = (void *)v17;
        if ([v11 moveItemAtURL:v17 toURL:v18 error:a5])
        {
          [v11 removeItemAtURL:v12 error:0];
          id v19 = v18;
          id v20 = v19;
        }
        else
        {
          v28 = v18;
          if (a5) {
            *a5 = 0;
          }
          id v29 = v16;
          uint64_t v27 = [v16 stringByDeletingPathExtension];
          id v21 = [MEMORY[0x1E4F29128] UUID];
          id v22 = [v21 UUIDString];
          uint64_t v23 = [v27 stringByAppendingFormat:@"_%@.mlmodelc", v22];

          id v24 = (void *)v23;
          id v19 = [v10 URLByAppendingPathComponent:v23];

          int v25 = [v11 moveItemAtURL:v30 toURL:v19 error:a5];
          [v11 removeItemAtURL:v12 error:0];
          id v20 = 0;
          if (v25) {
            id v20 = v19;
          }

          id v16 = v29;
        }

        goto LABEL_23;
      }
      [v11 removeItemAtURL:v12 error:0];
    }
    else if (a5)
    {
      +[MLModelErrorUtils errorWithCode:3, *a5, @"Failed to create a working directory appropriate for URL: %@", v10 underlyingError format];
      id v20 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:

LABEL_24:
      goto LABEL_25;
    }
    id v20 = 0;
    goto LABEL_23;
  }
  if (a5)
  {
    +[MLModelErrorUtils IOErrorWithFormat:@"Failed to get the temporary directory for the current user."];
    id v20 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v20 = 0;
  }
LABEL_25:

  return v20;
}

@end