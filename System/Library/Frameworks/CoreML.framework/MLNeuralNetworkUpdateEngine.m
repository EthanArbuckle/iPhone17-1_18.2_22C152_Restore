@interface MLNeuralNetworkUpdateEngine
+ (BOOL)supportsSecureCoding;
+ (id)createCoreMLToEspressoParamsMap;
+ (id)loadModelFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7;
- (BOOL)continueWithUpdate;
- (BOOL)setWeightsOrBiasesForLayer:(id)a3 layerType:(unint64_t)a4 value:(id)a5 error:(id *)a6;
- (BOOL)updateLearningRateWithTaskContext:(id)a3 isInCallBack:(BOOL)a4 error:(id *)a5;
- (BOOL)updateWeightsAndBiasesFromConfigParams:(id)a3 error:(id *)a4;
- (BOOL)writeToURL:(id)a3 error:(id *)a4;
- (ETTaskDefinition)task;
- (ETTaskState)snapshot;
- (MLNeuralNetworkUpdateEngine)initWithCoder:(id)a3;
- (MLNeuralNetworkUpdateEngine)initWithCompiledArchive:(void *)a3 nnContainer:(id)a4 configuration:(id)a5 error:(id *)a6;
- (MLParameterContainer)parameterContainer;
- (MLShufflingBatchProvider)shuffableTrainingData;
- (MLUpdateProgressHandlers)progressHandlers;
- (NSDictionary)classLabelToIndexMap;
- (NSDictionary)coreMLToEspressoParamsMap;
- (NSString)lossOutputName;
- (NSString)lossTargetName;
- (OS_dispatch_queue)progressHandlersDispatchQueue;
- (id)biasForLayer:(id)a3 error:(id *)a4;
- (id)collectMetricsFromTaskContext:(id)a3 isInCallBack:(BOOL)a4;
- (id)createEspressoTaskFrom:(id)a3 updateParameters:(void *)a4 lossInputName:(id)a5 lossTargetName:(id)a6 lossOutputName:(id)a7 updatableLayerNames:(id)a8 configuration:(id)a9 error:(id *)a10;
- (id)parameterValueForKey:(id)a3;
- (id)parameterValueForKey:(id)a3 error:(id *)a4;
- (id)paramsForLayer:(id)a3 parameterType:(unint64_t)a4 error:(id *)a5;
- (id)predictionFromFeatures:(id)a3 error:(id *)a4;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (id)predictionsFromBatch:(id)a3 error:(id *)a4;
- (id)predictionsFromBatch:(id)a3 options:(id)a4 error:(id *)a5;
- (id)stringForDataType:(unint64_t)a3;
- (id)updateParameters;
- (id)weightsForLayer:(id)a3 error:(id *)a4;
- (unint64_t)predictionTypeForKTrace;
- (void)cancelUpdate;
- (void)loadLossInputName:(id *)a3 updatableLayerNames:(id *)a4 fromCompiledArchive:(void *)a5;
- (void)loadLossTargetName:(id *)a3 lossOutputName:(id *)a4 fromUpdateParameters:(void *)a5;
- (void)resumeUpdate;
- (void)resumeUpdateWithParameters:(id)a3;
- (void)setContinueWithUpdate:(BOOL)a3;
- (void)setCoreMLToEspressoParamsMap:(id)a3;
- (void)setLossOutputName:(id)a3;
- (void)setLossTargetName:(id)a3;
- (void)setParameterContainer:(id)a3;
- (void)setProgressHandlers:(id)a3;
- (void)setProgressHandlersDispatchQueue:(id)a3;
- (void)setShuffableTrainingData:(id)a3;
- (void)setSnapshot:(id)a3;
- (void)setTask:(id)a3;
- (void)setUpdateProgressHandlers:(id)a3 dispatchQueue:(id)a4;
- (void)updateModelWithData:(id)a3;
@end

@implementation MLNeuralNetworkUpdateEngine

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lossOutputName, 0);
  objc_storeStrong((id *)&self->_coreMLToEspressoParamsMap, 0);
  objc_storeStrong((id *)&self->_progressHandlersDispatchQueue, 0);
  objc_storeStrong((id *)&self->_progressHandlers, 0);
  objc_storeStrong((id *)&self->_classLabelToIndexMap, 0);
  objc_storeStrong((id *)&self->_lossTargetName, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_continueWithUpdate, 0);

  objc_storeStrong((id *)&self->super.super._network.network_index, 0);
}

- (void)setParameterContainer:(id)a3
{
}

- (MLParameterContainer)parameterContainer
{
  return (MLParameterContainer *)self->_lossOutputName;
}

- (void)setShuffableTrainingData:(id)a3
{
}

- (MLShufflingBatchProvider)shuffableTrainingData
{
  return (MLShufflingBatchProvider *)self->_coreMLToEspressoParamsMap;
}

- (void)setContinueWithUpdate:(BOOL)a3
{
  LOBYTE(self->super.super._network.plan) = a3;
}

- (BOOL)continueWithUpdate
{
  return (BOOL)self->super.super._network.plan;
}

- (void)setLossOutputName:(id)a3
{
}

- (NSString)lossOutputName
{
  return (NSString *)self->_progressHandlersDispatchQueue;
}

- (void)setCoreMLToEspressoParamsMap:(id)a3
{
}

- (NSDictionary)coreMLToEspressoParamsMap
{
  return (NSDictionary *)self->_progressHandlers;
}

- (void)setProgressHandlersDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)progressHandlersDispatchQueue
{
  return (OS_dispatch_queue *)self->_classLabelToIndexMap;
}

- (void)setProgressHandlers:(id)a3
{
}

- (MLUpdateProgressHandlers)progressHandlers
{
  return (MLUpdateProgressHandlers *)self->_lossTargetName;
}

- (NSDictionary)classLabelToIndexMap
{
  return (NSDictionary *)self->_task;
}

- (void)setLossTargetName:(id)a3
{
}

- (NSString)lossTargetName
{
  return (NSString *)self->_snapshot;
}

- (void)setTask:(id)a3
{
}

- (ETTaskDefinition)task
{
  return *(ETTaskDefinition **)&self->_continueWithUpdate;
}

- (void)setSnapshot:(id)a3
{
}

- (ETTaskState)snapshot
{
  return *(ETTaskState **)&self->super.super._network.network_index;
}

- (MLNeuralNetworkUpdateEngine)initWithCoder:(id)a3
{
  return 0;
}

- (id)biasForLayer:(id)a3 error:(id *)a4
{
  v4 = [(MLNeuralNetworkUpdateEngine *)self paramsForLayer:a3 parameterType:2 error:a4];

  return v4;
}

- (id)weightsForLayer:(id)a3 error:(id *)a4
{
  v4 = [(MLNeuralNetworkUpdateEngine *)self paramsForLayer:a3 parameterType:1 error:a4];

  return v4;
}

- (id)paramsForLayer:(id)a3 parameterType:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = [(MLNeuralNetworkUpdateEngine *)self task];
  id v29 = 0;
  v10 = [v9 getParameterOfType:a4 forLayerNamed:v8 error:&v29];
  id v11 = v29;

  if (v10)
  {
    v12 = [MLMultiArray alloc];
    uint64_t v13 = [v10 dataPointer];
    v14 = [v10 shape];
    v15 = [v10 strides];
    id v28 = v11;
    v16 = [(MLMultiArray *)v12 initWithDataPointer:v13 shape:v14 dataType:65568 strides:v15 deallocator:0 error:&v28];
    id v17 = v28;

    if (v16)
    {
      v18 = [MLMultiArray alloc];
      v19 = [v10 shape];
      id v27 = v17;
      v20 = [(MLMultiArray *)v18 initWithShape:v19 dataType:65568 storageOrder:0 error:&v27];
      id v21 = v27;

      if (v20)
      {
        id v26 = v21;
        BOOL v22 = [(MLMultiArray *)v16 copyIntoMultiArray:v20 error:&v26];
        id v23 = v26;

        if (v22)
        {
          v24 = v20;
        }
        else if (a5)
        {
          +[MLModelErrorUtils parameterErrorWithUnderlyingError:v23, @"Updatable neural network failed to retrive parameter for layer %@.", v8 format];
          v24 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v24 = 0;
        }
        id v21 = v23;
      }
      else if (a5)
      {
        +[MLModelErrorUtils parameterErrorWithUnderlyingError:v21, @"Updatable neural network failed to retrive parameter for layer %@.", v8 format];
        v24 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v24 = 0;
      }

      id v17 = v21;
    }
    else if (a5)
    {
      +[MLModelErrorUtils parameterErrorWithUnderlyingError:v17, @"Updatable neural network failed to retrive parameter for layer %@.", v8 format];
      v24 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = 0;
    }

    id v11 = v17;
  }
  else if (a5)
  {
    +[MLModelErrorUtils parameterErrorWithUnderlyingError:v11, @"Updatable neural network failed to retrive parameter for layer %@.", v8 format];
    v24 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)parameterValueForKey:(id)a3
{
  v3 = [(MLNeuralNetworkUpdateEngine *)self parameterValueForKey:a3 error:0];

  return v3;
}

- (id)parameterValueForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 hasGlobalScope])
  {
    v7 = [(MLNeuralNetworkUpdateEngine *)self parameterContainer];
    id v8 = [v7 currentParameterValues];
    v9 = [v8 objectForKeyedSubscript:v6];

    if (v9) {
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v10 = +[MLParameterKey weights];
  int v11 = [v6 hasSameNameAsKey:v10];

  if (v11)
  {
    v12 = [v6 scope];
    uint64_t v13 = [(MLNeuralNetworkUpdateEngine *)self paramsForLayer:v12 parameterType:1 error:a4];
LABEL_8:
    v9 = (void *)v13;

    goto LABEL_12;
  }
  v14 = +[MLParameterKey biases];
  int v15 = [v6 hasSameNameAsKey:v14];

  if (v15)
  {
    v12 = [v6 scope];
    uint64_t v13 = [(MLNeuralNetworkUpdateEngine *)self paramsForLayer:v12 parameterType:2 error:a4];
    goto LABEL_8;
  }
LABEL_9:
  if (a4)
  {
    +[MLModelErrorUtils parameterErrorWithUnderlyingError:0, @"Updated neural network model does not have a parameter for requested key %@.", v6 format];
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
LABEL_12:

  return v9;
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(MLModelEngine *)self modelDescription];
  id v8 = [v7 modelURL];
  id v29 = 0;
  BOOL v9 = +[MLSaver copyModelAtURL:v8 toURL:v6 error:&v29];
  id v10 = v29;

  if (v9)
  {
    int v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    v12 = [(MLNeuralNetworkUpdateEngine *)self task];
    uint64_t v13 = [v6 URLByAppendingPathComponent:@"model.espresso.net"];
    v14 = [v13 path];
    id v28 = v10;
    char v15 = [v12 saveNetwork:v14 inplace:1 error:&v28];
    id v16 = v28;

    if (v15)
    {
      id v17 = [v6 URLByAppendingPathComponent:@"model_updatable.espresso.net"];
      id v26 = v16;
      [v11 removeItemAtURL:v17 error:&v26];
      id v18 = v26;

      v19 = [v6 URLByAppendingPathComponent:@"model_updatable.espresso.weights"];
      id v25 = v18;
      [v11 removeItemAtURL:v19 error:&v25];
      id v16 = v25;

      v20 = [v6 URLByAppendingPathComponent:@"model_updatable.espresso.shape"];
      id v24 = v16;
      id v21 = &v24;
      [v11 removeItemAtURL:v20 error:&v24];
    }
    else
    {
      if (a4)
      {
        BOOL v22 = [v6 path];
        *a4 = +[MLModelErrorUtils errorWithCode:6, v16, @"Failed to copy updated model to %@", v22 underlyingError format];
      }
      v20 = objc_msgSend(NSString, "stringWithUTF8String:", objc_msgSend(v6, "fileSystemRepresentation"));
      v27[0] = v16;
      id v21 = (id *)v27;
      [v11 removeItemAtPath:v20 error:v27];
    }
    id v10 = *v21;
  }
  else
  {
    if (!a4)
    {
      char v15 = 0;
      goto LABEL_11;
    }
    int v11 = [v6 path];
    +[MLModelErrorUtils errorWithCode:6, v10, @"Failed to copy original model files to the new destionation: %@", v11 underlyingError format];
    char v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_11:
  return v15;
}

- (id)collectMetricsFromTaskContext:(id)a3 isInCallBack:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [MEMORY[0x1E4F1CA60] dictionary];
  if (v4)
  {
    id v8 = [(MLNeuralNetworkUpdateEngine *)self lossOutputName];
    BOOL v9 = [v6 getTensorNamed:v8];
  }
  else
  {
    id v8 = [(MLNeuralNetworkUpdateEngine *)self task];
    id v10 = [(MLNeuralNetworkUpdateEngine *)self lossOutputName];
    BOOL v9 = [v8 getTensorNamed:v10];
  }
  if (v9)
  {
    LODWORD(v11) = *(_DWORD *)[v9 dataPointer];
    v12 = [NSNumber numberWithFloat:v11];
    uint64_t v13 = +[MLMetricKey lossValue];
    [v7 setObject:v12 forKeyedSubscript:v13];
  }

  return v7;
}

- (BOOL)updateLearningRateWithTaskContext:(id)a3 isInCallBack:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  BOOL v9 = +[MLParameterKey learningRate];
  id v10 = [(MLNeuralNetworkUpdateEngine *)self parameterValueForKey:v9];
  [v10 floatValue];
  int v12 = v11;

  if (v6)
  {
    uint64_t v13 = [(MLNeuralNetworkUpdateEngine *)self coreMLToEspressoParamsMap];
    v14 = +[MLParameterKey learningRate];
    char v15 = [v13 objectForKeyedSubscript:v14];
    id v16 = [v8 getTensorNamed:v15];
  }
  else
  {
    uint64_t v13 = [(MLNeuralNetworkUpdateEngine *)self task];
    v14 = [(MLNeuralNetworkUpdateEngine *)self coreMLToEspressoParamsMap];
    char v15 = +[MLParameterKey learningRate];
    id v17 = [v14 objectForKeyedSubscript:v15];
    id v16 = [v13 getTensorNamed:v17];
  }
  if (v16)
  {
    *(_DWORD *)[v16 dataPointer] = v12;
    if (v6)
    {
      id v18 = [(MLNeuralNetworkUpdateEngine *)self coreMLToEspressoParamsMap];
      v19 = +[MLParameterKey learningRate];
      v20 = [v18 objectForKeyedSubscript:v19];
      id v27 = 0;
      [v8 setTensorNamed:v20 withValue:v16 error:&v27];
      id v21 = v27;
    }
    else
    {
      id v18 = [(MLNeuralNetworkUpdateEngine *)self task];
      v19 = [(MLNeuralNetworkUpdateEngine *)self coreMLToEspressoParamsMap];
      v20 = +[MLParameterKey learningRate];
      id v23 = [v19 objectForKeyedSubscript:v20];
      id v26 = 0;
      [v18 setTensorNamed:v23 withValue:v16 error:&v26];
      id v21 = v26;
    }
    if (!v21)
    {
      BOOL v24 = 1;
      goto LABEL_17;
    }
    if (!a5)
    {
      BOOL v24 = 0;
      goto LABEL_17;
    }
    id v22 = v21;
    id v21 = v22;
  }
  else
  {
    if (!a5)
    {
      BOOL v24 = 0;
      id v21 = 0;
      goto LABEL_17;
    }
    id v22 = +[MLModelErrorUtils updateErrorWithFormat:@"Cannot get current learning rate."];
    id v21 = 0;
  }
  BOOL v24 = 0;
  *a5 = v22;
LABEL_17:

  return v24;
}

- (void)resumeUpdateWithParameters:(id)a3
{
  id v4 = a3;
  v5 = [(MLNeuralNetworkUpdateEngine *)self parameterContainer];
  BOOL v6 = +[MLParameterKey learningRate];
  v7 = [v4 objectForKeyedSubscript:v6];
  id v8 = +[MLParameterKey learningRate];
  id v13 = 0;
  char v9 = [v5 setCurrentValue:v7 forKey:v8 error:&v13];
  id v10 = v13;

  if (v9)
  {
    [(MLNeuralNetworkUpdateEngine *)self setContinueWithUpdate:1];
  }
  else
  {
    int v11 = [(MLNeuralNetworkUpdateEngine *)self progressHandlers];
    int v12 = [(MLNeuralNetworkUpdateEngine *)self progressHandlersDispatchQueue];
    [v11 dispatchTrainingCompletionHandlerWithError:v10 onQueue:v12];
  }
}

- (void)cancelUpdate
{
}

- (void)resumeUpdate
{
}

- (id)updateParameters
{
  v2 = [(MLNeuralNetworkUpdateEngine *)self parameterContainer];
  v3 = [v2 currentParameterValues];

  return v3;
}

- (void)updateModelWithData:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__MLNeuralNetworkUpdateEngine_updateModelWithData___block_invoke;
  aBlock[3] = &unk_1E59A40F0;
  aBlock[4] = self;
  v5 = _Block_copy(aBlock);
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __51__MLNeuralNetworkUpdateEngine_updateModelWithData___block_invoke_2;
  v43[3] = &unk_1E59A40F0;
  v43[4] = self;
  BOOL v6 = _Block_copy(v43);
  v7 = +[MLParameterKey shuffle];
  id v8 = [(MLNeuralNetworkUpdateEngine *)self parameterValueForKey:v7];
  int v9 = [v8 BOOLValue];

  if (!v9)
  {
    id v41 = 0;
    char v15 = +[MLDataConversionUtils espressoDataProviderFromBatchProvider:v4 forPrediction:0 neuralNetworkEngine:self error:&v41];
    id v16 = v41;
    if (!v15) {
      goto LABEL_3;
    }
LABEL_5:
    v20 = +[MLParameterKey epochs];
    uint64_t v21 = [(MLNeuralNetworkUpdateEngine *)self parameterValueForKey:v20];
    uint64_t v22 = [(id)v21 longValue];

    id v23 = [(MLNeuralNetworkUpdateEngine *)self progressHandlers];
    LOBYTE(v21) = [v23 interestedEvents];

    if (v21)
    {
      BOOL v24 = [(MLNeuralNetworkUpdateEngine *)self progressHandlers];
      uint64_t v25 = [(MLNeuralNetworkUpdateEngine *)self updateParameters];
      id v26 = [(MLNeuralNetworkUpdateEngine *)self progressHandlersDispatchQueue];
      [v24 dispatchTrainingBeginProgressHandlerWithMetrics:MEMORY[0x1E4F1CC08] parameters:v25 onQueue:v26];

      id v40 = v16;
      LOBYTE(v25) = [(MLNeuralNetworkUpdateEngine *)self updateLearningRateWithTaskContext:0 isInCallBack:0 error:&v40];
      id v19 = v40;

      if ((v25 & 1) == 0)
      {
        id v17 = [(MLNeuralNetworkUpdateEngine *)self progressHandlers];
        id v18 = [(MLNeuralNetworkUpdateEngine *)self progressHandlersDispatchQueue];
        [v17 dispatchTrainingCompletionHandlerWithError:v19 onQueue:v18];
        goto LABEL_20;
      }
      id v16 = v19;
    }
    if ([(MLNeuralNetworkUpdateEngine *)self continueWithUpdate])
    {
      id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v27 = [(MLNeuralNetworkUpdateEngine *)self progressHandlers];
      char v28 = [v27 interestedEvents];

      if ((v28 & 2) != 0)
      {
        id v29 = _Block_copy(v5);
        [v17 setObject:v29 forKeyedSubscript:*MEMORY[0x1E4F61188]];
      }
      v30 = [(MLNeuralNetworkUpdateEngine *)self progressHandlers];
      char v31 = [v30 interestedEvents];

      if ((v31 & 4) != 0)
      {
        v32 = _Block_copy(v6);
        [v17 setObject:v32 forKeyedSubscript:*MEMORY[0x1E4F61180]];
      }
      v33 = [(MLNeuralNetworkUpdateEngine *)self task];
      id v39 = v16;
      char v34 = [v33 doTrainingOnData:v15 forNumberOfEpochs:v22 withCallback:v17 error:&v39];
      id v19 = v39;

      if ((v34 & 1) == 0)
      {
        id v18 = [(MLNeuralNetworkUpdateEngine *)self progressHandlers];
        v37 = [(MLNeuralNetworkUpdateEngine *)self progressHandlersDispatchQueue];
        [v18 dispatchTrainingCompletionHandlerWithError:v19 onQueue:v37];
        goto LABEL_19;
      }
      v35 = [(MLNeuralNetworkUpdateEngine *)self task];
      v36 = [v35 taskState];
      [(MLNeuralNetworkUpdateEngine *)self setSnapshot:v36];
    }
    else
    {
      id v19 = v16;
    }
    id v17 = [(MLNeuralNetworkUpdateEngine *)self collectMetricsFromTaskContext:0 isInCallBack:0];
    id v18 = [(MLNeuralNetworkUpdateEngine *)self progressHandlers];
    v37 = [(MLNeuralNetworkUpdateEngine *)self updateParameters];
    v38 = [(MLNeuralNetworkUpdateEngine *)self progressHandlersDispatchQueue];
    [v18 dispatchTrainingCompletionHandlerWithMetrics:v17 parameters:v37 onQueue:v38];

LABEL_19:
    goto LABEL_20;
  }
  id v10 = [MLShufflingBatchProvider alloc];
  int v11 = +[MLParameterKey seed];
  int v12 = [(MLNeuralNetworkUpdateEngine *)self parameterValueForKey:v11];
  id v13 = [(MLShufflingBatchProvider *)v10 initWithBatchProvider:v4 seed:v12];
  [(MLNeuralNetworkUpdateEngine *)self setShuffableTrainingData:v13];

  v14 = [(MLNeuralNetworkUpdateEngine *)self shuffableTrainingData];
  id v42 = 0;
  char v15 = +[MLDataConversionUtils espressoDataProviderFromBatchProvider:v14 forPrediction:0 neuralNetworkEngine:self error:&v42];
  id v16 = v42;

  if (v15) {
    goto LABEL_5;
  }
LABEL_3:
  id v17 = [(MLNeuralNetworkUpdateEngine *)self progressHandlers];
  id v18 = [(MLNeuralNetworkUpdateEngine *)self progressHandlersDispatchQueue];
  [v17 dispatchTrainingCompletionHandlerWithError:v16 onQueue:v18];
  id v19 = v16;
LABEL_20:
}

uint64_t __51__MLNeuralNetworkUpdateEngine_updateModelWithData___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  v7 = [MEMORY[0x1E4F1CA60] dictionary];
  id v8 = [NSNumber numberWithUnsignedInteger:a2];
  int v9 = +[MLMetricKey epochIndex];
  [v7 setObject:v8 forKeyedSubscript:v9];

  id v10 = [*(id *)(a1 + 32) collectMetricsFromTaskContext:v6 isInCallBack:1];
  int v11 = +[MLMetricKey lossValue];
  int v12 = [v10 objectForKeyedSubscript:v11];

  if (v12)
  {
    id v13 = +[MLMetricKey lossValue];
    v14 = [v10 objectForKeyedSubscript:v13];
    char v15 = +[MLMetricKey lossValue];
    [v7 setObject:v14 forKeyedSubscript:v15];
  }
  id v16 = [*(id *)(a1 + 32) progressHandlers];
  uint64_t v17 = [*(id *)(a1 + 32) updateParameters];
  id v18 = [*(id *)(a1 + 32) progressHandlersDispatchQueue];
  [v16 dispatchEpochEndProgressHandlerWithMetrics:v7 parameters:v17 onQueue:v18];

  id v19 = *(void **)(a1 + 32);
  id v32 = 0;
  LOBYTE(v17) = [v19 updateLearningRateWithTaskContext:v6 isInCallBack:1 error:&v32];
  id v20 = v32;
  uint64_t v21 = *(void **)(a1 + 32);
  if (v17)
  {
    uint64_t v22 = [v21 shuffableTrainingData];
    if (v22)
    {
      id v23 = *(void **)(a1 + 32);
      BOOL v24 = +[MLParameterKey shuffle];
      uint64_t v25 = [v23 parameterValueForKey:v24];
      int v26 = [v25 BOOLValue];

      if (v26)
      {
        id v27 = [*(id *)(a1 + 32) shuffableTrainingData];
        [v27 shuffle];
      }
    }
    uint64_t v28 = [*(id *)(a1 + 32) continueWithUpdate];
  }
  else
  {
    id v29 = [v21 progressHandlers];
    v30 = [*(id *)(a1 + 32) progressHandlersDispatchQueue];
    [v29 dispatchTrainingCompletionHandlerWithError:v20 onQueue:v30];

    uint64_t v28 = 0;
  }

  return v28;
}

uint64_t __51__MLNeuralNetworkUpdateEngine_updateModelWithData___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  v7 = [MEMORY[0x1E4F1CA60] dictionary];
  id v8 = [NSNumber numberWithUnsignedInteger:a2];
  int v9 = +[MLMetricKey miniBatchIndex];
  [v7 setObject:v8 forKeyedSubscript:v9];

  id v10 = [*(id *)(a1 + 32) collectMetricsFromTaskContext:v6 isInCallBack:1];
  int v11 = +[MLMetricKey lossValue];
  int v12 = [v10 objectForKeyedSubscript:v11];

  if (v12)
  {
    id v13 = +[MLMetricKey lossValue];
    v14 = [v10 objectForKeyedSubscript:v13];
    char v15 = +[MLMetricKey lossValue];
    [v7 setObject:v14 forKeyedSubscript:v15];
  }
  id v16 = [*(id *)(a1 + 32) progressHandlers];
  uint64_t v17 = [*(id *)(a1 + 32) updateParameters];
  id v18 = [*(id *)(a1 + 32) progressHandlersDispatchQueue];
  [v16 dispatchMiniBatchEndProgressHandlerWithMetrics:v7 parameters:v17 onQueue:v18];

  id v19 = *(void **)(a1 + 32);
  id v26 = 0;
  LOBYTE(v17) = [v19 updateLearningRateWithTaskContext:v6 isInCallBack:1 error:&v26];
  id v20 = v26;
  uint64_t v21 = *(void **)(a1 + 32);
  if (v17)
  {
    uint64_t v22 = [v21 continueWithUpdate];
  }
  else
  {
    id v23 = [v21 progressHandlers];
    BOOL v24 = [*(id *)(a1 + 32) progressHandlersDispatchQueue];
    [v23 dispatchTrainingCompletionHandlerWithError:v20 onQueue:v24];

    uint64_t v22 = 0;
  }

  return v22;
}

- (void)setUpdateProgressHandlers:(id)a3 dispatchQueue:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  [(MLNeuralNetworkUpdateEngine *)self setProgressHandlers:v7];
  [(MLNeuralNetworkUpdateEngine *)self setProgressHandlersDispatchQueue:v6];
}

- (BOOL)setWeightsOrBiasesForLayer:(id)a3 layerType:(unint64_t)a4 value:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  int v12 = [(MLNeuralNetworkUpdateEngine *)self task];
  id v29 = 0;
  id v13 = [v12 getParameterOfType:a4 forLayerNamed:v10 error:&v29];
  id v14 = v29;

  if (v13)
  {
    id v26 = v11;
    char v15 = [MLMultiArray alloc];
    uint64_t v16 = [v13 dataPointer];
    uint64_t v17 = [v13 shape];
    id v18 = [v13 strides];
    id v28 = v14;
    id v19 = [(MLMultiArray *)v15 initWithDataPointer:v16 shape:v17 dataType:65568 strides:v18 deallocator:0 error:&v28];
    id v20 = v28;

    if (v19)
    {
      id v27 = v20;
      char v21 = [v26 copyIntoMultiArray:v19 error:&v27];
      id v22 = v27;

      if (v21)
      {
        id v23 = [(MLNeuralNetworkUpdateEngine *)self task];
        char v24 = [v23 setParameterOfType:a4 forLayerNamed:v10 withValue:v13 error:a6];
      }
      else if (a6)
      {
        +[MLModelErrorUtils parameterErrorWithUnderlyingError:v22, @"Failed to set weights or biases for layer name: %@", v10 format];
        char v24 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        char v24 = 0;
      }
      id v20 = v22;
    }
    else if (a6)
    {
      +[MLModelErrorUtils parameterErrorWithUnderlyingError:v20, @"Failed to set weights or biases for layer name: %@", v10 format];
      char v24 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v24 = 0;
    }

    id v14 = v20;
    id v11 = v26;
  }
  else if (a6)
  {
    +[MLModelErrorUtils parameterErrorWithUnderlyingError:v14, @"Cannot get current weights or biases for layer %@.", v10 format];
    char v24 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v24 = 0;
  }

  return v24;
}

- (BOOL)updateWeightsAndBiasesFromConfigParams:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = a3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v5);
        }
        int v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v10 = +[MLParameterKey weights];
        int v11 = [v9 hasSameNameAsKey:v10];

        if (v11)
        {
          int v12 = [v5 objectForKeyedSubscript:v9];
          id v13 = [v9 scope];
          BOOL v14 = [(MLNeuralNetworkUpdateEngine *)self setWeightsOrBiasesForLayer:v13 layerType:1 value:v12 error:a4];

          if (!v14) {
            goto LABEL_13;
          }
        }
        char v15 = +[MLParameterKey biases];
        int v16 = [v9 hasSameNameAsKey:v15];

        if (v16)
        {
          uint64_t v17 = [v5 objectForKeyedSubscript:v9];
          id v18 = [v9 scope];
          BOOL v19 = [(MLNeuralNetworkUpdateEngine *)self setWeightsOrBiasesForLayer:v18 layerType:2 value:v17 error:a4];

          if (!v19)
          {
LABEL_13:
            BOOL v20 = 0;
            goto LABEL_14;
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v20 = 1;
LABEL_14:

  return v20;
}

- (id)stringForDataType:(unint64_t)a3
{
  if (a3 - 1 > 4) {
    return @"None";
  }
  else {
    return off_1E59A4110[a3 - 1];
  }
}

- (id)predictionsFromBatch:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = +[MLPredictionOptions defaultOptions];
  id v8 = [(MLNeuralNetworkUpdateEngine *)self predictionsFromBatch:v6 options:v7 error:a4];

  return v8;
}

- (id)predictionsFromBatch:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a4;
  int v9 = +[MLDataConversionUtils espressoDataProviderFromBatchProvider:a3 forPrediction:1 neuralNetworkEngine:self error:a5];
  if (v9)
  {
    id v10 = [(MLNeuralNetworkUpdateEngine *)self task];
    int v11 = [v10 doInferenceOnData:v9 error:a5];

    if (v11)
    {
      int v12 = +[MLDataConversionUtils batchProviderFromEspressoDataProvider:v11 neuralNetworkEngine:self options:v8 error:a5];
    }
    else
    {
      int v12 = 0;
    }
  }
  else
  {
    int v12 = 0;
  }

  return v12;
}

- (id)predictionFromFeatures:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = +[MLPredictionOptions defaultOptions];
  id v8 = [(MLNeuralNetworkUpdateEngine *)self predictionFromFeatures:v6 options:v7 error:a4];

  return v8;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a4;
  int v9 = +[MLDataConversionUtils espressoDataProviderFromFeatureProvider:a3 forPrediction:1 neuralNetworkEngine:self error:a5];
  if (v9)
  {
    id v10 = [(MLNeuralNetworkUpdateEngine *)self task];
    int v11 = [v10 doInferenceOnData:v9 error:a5];

    if (v11)
    {
      int v12 = +[MLDataConversionUtils featureProviderFromEspressoDataProvider:v11 neuralNetworkEngine:self options:v8 error:a5];
    }
    else
    {
      int v12 = 0;
    }
  }
  else
  {
    int v12 = 0;
  }

  return v12;
}

- (unint64_t)predictionTypeForKTrace
{
  return 0;
}

- (MLNeuralNetworkUpdateEngine)initWithCompiledArchive:(void *)a3 nnContainer:(id)a4 configuration:(id)a5 error:(id *)a6
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v46 = a5;
  v44 = v9;
  [v46 setComputeUnits:0];
  id v57 = 0;
  v56.receiver = self;
  v56.super_class = (Class)MLNeuralNetworkUpdateEngine;
  id v10 = [(MLNeuralNetworkEngine *)&v56 initWithContainer:v9 configuration:v46 error:&v57];
  id v11 = v57;
  if (v10)
  {
    id v45 = v11;
    uint64_t v12 = +[MLNeuralNetworkUpdateEngine createCoreMLToEspressoParamsMap];
    id v13 = (void *)*((void *)v10 + 70);
    *((void *)v10 + 70) = v12;

    CoreML::Specification::NetworkUpdateParameters::NetworkUpdateParameters((CoreML::Specification::NetworkUpdateParameters *)v55);
    if (+[MLNeuralNetworkUpdateUtils loadUpdateParameters:v55 fromCompiledArchive:a3 error:a6])
    {
      BOOL v14 = [v10 modelDescription];
      char v15 = +[MLNeuralNetworkUpdateUtils loadParameterDescriptionsAndContainerFromUpdateParameters:v55 modelDescription:v14];
      [v10 setParameterContainer:v15];

      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      int v16 = [v46 parameters];
      uint64_t v17 = [v16 countByEnumeratingWithState:&v51 objects:v58 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v52;
        while (2)
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v52 != v18) {
              objc_enumerationMutation(v16);
            }
            uint64_t v20 = *(void *)(*((void *)&v51 + 1) + 8 * i);
            char v21 = [v10 parameterContainer];
            id v22 = [v46 parameters];
            long long v23 = [v22 objectForKeyedSubscript:v20];
            LOBYTE(v20) = [v21 setCurrentValue:v23 forKey:v20 error:a6];

            if ((v20 & 1) == 0)
            {

              goto LABEL_17;
            }
          }
          uint64_t v17 = [v16 countByEnumeratingWithState:&v51 objects:v58 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }

      id v49 = 0;
      id v50 = 0;
      [v10 loadLossInputName:&v50 updatableLayerNames:&v49 fromCompiledArchive:a3];
      id v24 = v50;
      id v43 = v49;
      id v47 = 0;
      id v48 = 0;
      [v10 loadLossTargetName:&v48 lossOutputName:&v47 fromUpdateParameters:v55];
      id v25 = v48;
      id v26 = v48;
      id v27 = v47;
      id v28 = v47;
      objc_storeStrong((id *)v10 + 66, v25);
      objc_storeStrong((id *)v10 + 71, v27);
      id v29 = (void *)MEMORY[0x1E4F1CB10];
      v30 = [v44 modelFilePath];
      char v31 = [v29 fileURLWithPath:v30];

      id v32 = [v10 createEspressoTaskFrom:v31 updateParameters:v55 lossInputName:v24 lossTargetName:v26 lossOutputName:v28 updatableLayerNames:v43 configuration:v46 error:a6];
      if (v32)
      {
        objc_storeStrong((id *)v10 + 65, v32);
        uint64_t v33 = [v32 taskState];
        char v34 = (void *)*((void *)v10 + 64);
        *((void *)v10 + 64) = v33;

        v35 = [v10 classLabels];
        uint64_t v36 = +[MLNeuralNetworkUpdateUtils createClassLabelToIndexMapWith:v35];
        v37 = (void *)*((void *)v10 + 67);
        *((void *)v10 + 67) = v36;

        *((unsigned char *)v10 + 504) = 1;
        v38 = [v46 parameters];
        char v39 = [v10 updateWeightsAndBiasesFromConfigParams:v38 error:a6];

        CoreML::Specification::NetworkUpdateParameters::~NetworkUpdateParameters((CoreML::Specification::NetworkUpdateParameters *)v55);
        if (v39)
        {
          id v40 = (MLNeuralNetworkUpdateEngine *)v10;
          goto LABEL_19;
        }
LABEL_18:
        id v40 = 0;
        goto LABEL_19;
      }
    }
LABEL_17:
    CoreML::Specification::NetworkUpdateParameters::~NetworkUpdateParameters((CoreML::Specification::NetworkUpdateParameters *)v55);
    goto LABEL_18;
  }
  if (!a6)
  {
    id v40 = 0;
    goto LABEL_20;
  }
  id v45 = v11;
  +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6);
  id v40 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:
  id v11 = v45;
LABEL_20:

  return v40;
}

- (void)loadLossTargetName:(id *)a3 lossOutputName:(id *)a4 fromUpdateParameters:(void *)a5
{
  CoreML::Specification::LossLayer::LossLayer((CoreML::Specification::LossLayer *)v16, *(const CoreML::Specification::LossLayer **)(*((void *)a5 + 4) + 8));
  uint64_t v7 = NSString;
  id v8 = (char *)v17;
  if (*(char *)(v17 + 23) >= 0) {
    size_t v9 = *(unsigned __int8 *)(v17 + 23);
  }
  else {
    size_t v9 = *(void *)(v17 + 8);
  }
  id v10 = __p;
  std::string::basic_string[abi:ne180100]((uint64_t)__p, v9 + 10);
  if (v15 < 0) {
    id v10 = (void **)__p[0];
  }
  if (v9)
  {
    if (v8[23] >= 0) {
      id v11 = v8;
    }
    else {
      id v11 = *(char **)v8;
    }
    memmove(v10, v11, v9);
  }
  strcpy((char *)v10 + v9, "_lossValue");
  if (v15 >= 0) {
    uint64_t v12 = __p;
  }
  else {
    uint64_t v12 = (void **)__p[0];
  }
  *a4 = [v7 stringWithUTF8String:v12];
  if (v15 < 0) {
    operator delete(__p[0]);
  }
  if (v19 == 10 || v19 == 11)
  {
    id v13 = *(uint64_t **)(v18 + 24);
    if (*((char *)v13 + 23) < 0) {
      id v13 = (uint64_t *)*v13;
    }
    *a3 = [NSString stringWithUTF8String:v13];
  }
  CoreML::Specification::LossLayer::~LossLayer((CoreML::Specification::LossLayer *)v16);
}

- (void)loadLossInputName:(id *)a3 updatableLayerNames:(id *)a4 fromCompiledArchive:(void *)a5
{
  std::string::basic_string[abi:ne180100]<0>(&__p, "updateParameters");
  id v8 = IArchive::nestedArchive(a5, (uint64_t)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  size_t v9 = (std::__shared_weak_count *)*((void *)v8 + 1);
  uint64_t v12 = *(void *)v8;
  id v13 = v9;
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  std::map<std::string,IArchive>::map[abi:ne180100]((uint64_t)v14, (void *)v8 + 2);
  operator>>((uint64_t)&v12);
  id v10 = (id) [MEMORY[0x1E4F1CBF0] mutableCopy];
  *a4 = v10;
  memset(&__p, 0, sizeof(__p));
  operator>>((uint64_t)&v12, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  *a3 = [NSString stringWithUTF8String:p_p];
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }

  std::__tree<std::__value_type<std::string,IArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,IArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,IArchive>>>::destroy(v14[1]);
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
}

- (id)createEspressoTaskFrom:(id)a3 updateParameters:(void *)a4 lossInputName:(id)a5 lossTargetName:(id)a6 lossOutputName:(id)a7 updatableLayerNames:(id)a8 configuration:(id)a9 error:(id *)a10
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v55 = a5;
  id v56 = a6;
  id v57 = a7;
  id v54 = a8;
  id v53 = a9;
  long long v52 = v16;
  id v17 = objc_alloc(MEMORY[0x1E4F611B0]);
  id v65 = 0;
  uint64_t v18 = (void *)[v17 initWithInferenceNetworkPath:v16 inferenceInputs:MEMORY[0x1E4F1CBF0] inferenceOutputs:MEMORY[0x1E4F1CBF0] error:&v65];
  id v19 = v65;
  if (!v18)
  {
    id v21 = +[MLModelErrorUtils errorWithCode:6 underlyingError:v19 format:@"Error initializing model."];
    goto LABEL_18;
  }
  int v20 = *(_DWORD *)(*(void *)(*((void *)a4 + 4) + 8) + 36);
  if (v20 != 10)
  {
    if (v20 == 11)
    {
      long long v51 = [MEMORY[0x1E4F611A8] L2LossWithInputName:v55 targetInputName:v56 lossOutputName:v57];
      goto LABEL_7;
    }
    id v21 = +[MLModelErrorUtils updateErrorWithFormat:@"Loss layer type not recognized."];
LABEL_18:
    id v25 = 0;
    *a10 = v21;
    goto LABEL_43;
  }
  long long v51 = [MEMORY[0x1E4F611A8] crossEntropyLossWithInputName:v55 targetInputName:v56 lossOutputName:v57];
LABEL_7:
  if (!v51)
  {
    id v24 = *(uint64_t **)(*(void *)(*((void *)a4 + 4) + 8) + 16);
    if (*((char *)v24 + 23) < 0) {
      id v24 = (uint64_t *)*v24;
    }
    id v21 = +[MLModelErrorUtils updateErrorWithFormat:@"Error initializing loss layer %s.", v24];
    goto LABEL_18;
  }
  id v64 = v19;
  id v49 = (void *)[objc_alloc(MEMORY[0x1E4F611D8]) initForLayers:v54 error:&v64];
  id v50 = v64;

  if (v49)
  {
    id v22 = (uint64_t *)*((void *)a4 + 5);
    if (!v22) {
      id v22 = &CoreML::Specification::_Optimizer_default_instance_;
    }
    int v23 = *((_DWORD *)v22 + 7);
    if (v23 == 10)
    {
      uint64_t v47 = 0;
LABEL_21:
      id v27 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      v66[0] = +[MLParameterKey learningRate];
      id v48 = (void *)v66[0];
      id v28 = +[MLParameterKey miniBatchSize];
      v66[1] = v28;
      id v29 = +[MLParameterKey momentum];
      v66[2] = v29;
      v30 = +[MLParameterKey beta1];
      v66[3] = v30;
      char v31 = +[MLParameterKey beta2];
      v66[4] = v31;
      id v32 = +[MLParameterKey eps];
      v66[5] = v32;
      uint64_t v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:6];

      uint64_t v34 = [v33 countByEnumeratingWithState:&v60 objects:v67 count:16];
      if (v34)
      {
        uint64_t v35 = *(void *)v61;
        do
        {
          for (uint64_t i = 0; i != v34; ++i)
          {
            if (*(void *)v61 != v35) {
              objc_enumerationMutation(v33);
            }
            uint64_t v37 = *(void *)(*((void *)&v60 + 1) + 8 * i);
            v38 = [(MLNeuralNetworkUpdateEngine *)self parameterValueForKey:v37];
            char v39 = [(MLUpdateProgressHandlers *)self->_progressHandlers objectForKeyedSubscript:v37];
            [v27 setObject:v38 forKeyedSubscript:v39];
          }
          uint64_t v34 = [v33 countByEnumeratingWithState:&v60 objects:v67 count:16];
        }
        while (v34);
      }

      id v59 = v50;
      id v40 = (void *)[objc_alloc(MEMORY[0x1E4F611C0]) initWithOptimizationAlgorithm:v47 parameters:v27 error:&v59];
      id v41 = v59;

      if (v40)
      {
        if ((unint64_t)[v53 computeUnits] < 4)
        {
          id v42 = (void *)MEMORY[0x19F3C29E0]();
          id v58 = v41;
          id v25 = (void *)[objc_alloc(MEMORY[0x1E4F611D0]) initWithModelDefinition:v18 lossDefinition:v51 variablesDefinition:v49 optimizerDefinition:v40 forPlatform:1 error:&v58];
          id v43 = v58;

          if (v25)
          {
            id v44 = v25;
          }
          else
          {
            *a10 = +[MLModelErrorUtils errorWithCode:6 underlyingError:v43 format:@"Error initializing espresso task."];
          }

          id v41 = v43;
          goto LABEL_41;
        }
        if (!a10)
        {
          id v25 = 0;
          goto LABEL_41;
        }
        id v45 = +[MLModelErrorUtils updateErrorWithFormat:@"Invalid value for computeUnits in model configuration."];
      }
      else
      {
        id v45 = +[MLModelErrorUtils errorWithCode:6 underlyingError:v41 format:@"Error initializing optimizer."];
      }
      id v25 = 0;
      *a10 = v45;
LABEL_41:

      id v50 = v41;
      goto LABEL_42;
    }
    if (v23 == 11)
    {
      uint64_t v47 = 1;
      goto LABEL_21;
    }
    id v26 = +[MLModelErrorUtils updateErrorWithFormat:@"Optimizer type not recognized."];
  }
  else
  {
    id v26 = +[MLModelErrorUtils errorWithCode:6 underlyingError:v50 format:@"Error initializing training variables."];
  }
  id v25 = 0;
  *a10 = v26;
LABEL_42:

  id v19 = v50;
LABEL_43:

  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

+ (id)createCoreMLToEspressoParamsMap
{
  v11[6] = *MEMORY[0x1E4F143B8];
  v2 = +[MLParameterKey miniBatchSize];
  v10[0] = v2;
  v11[0] = *MEMORY[0x1E4F614E8];
  v3 = +[MLParameterKey learningRate];
  v10[1] = v3;
  v11[1] = *MEMORY[0x1E4F61508];
  id v4 = +[MLParameterKey beta1];
  v10[2] = v4;
  v11[2] = *MEMORY[0x1E4F614F0];
  id v5 = +[MLParameterKey beta2];
  v10[3] = v5;
  v11[3] = *MEMORY[0x1E4F614F8];
  id v6 = +[MLParameterKey eps];
  v10[4] = v6;
  v11[4] = *MEMORY[0x1E4F61500];
  uint64_t v7 = +[MLParameterKey momentum];
  v10[5] = v7;
  v11[5] = *MEMORY[0x1E4F61510];
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:6];

  return v8;
}

+ (id)loadModelFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7
{
  id v12 = a6;
  id v13 = +[MLNeuralNetworkV1Container containerFromCompiledArchive:a3 modelVersionInfo:a4 compilerVersionInfo:a5 configuration:v12 error:a7];
  if (v13) {
    BOOL v14 = (void *)[objc_alloc((Class)a1) initWithCompiledArchive:a3 nnContainer:v13 configuration:v12 error:a7];
  }
  else {
    BOOL v14 = 0;
  }

  return v14;
}

@end