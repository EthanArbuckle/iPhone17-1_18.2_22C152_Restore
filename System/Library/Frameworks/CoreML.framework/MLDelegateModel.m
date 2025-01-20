@interface MLDelegateModel
- (MLDelegateModel)initWithEngine:(id)a3 error:(id *)a4;
- (NSMutableArray)pendingPredictionQueue;
- (id)_predictionFromFeatures:(id)a3 usingState:(id)a4 options:(id)a5 error:(id *)a6;
- (id)_predictionsFromBatch:(id)a3 options:(id)a4 error:(id *)a5;
- (id)classifier;
- (id)executionSchedule;
- (id)internalEngine;
- (id)neuralNetwork;
- (id)newRequestWithInputFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (id)newRequestWithInputFeatures:(id)a3 usingState:(id)a4 options:(id)a5 error:(id *)a6;
- (id)newStateForFeatureNamed:(id)a3 initializerBlock:(id)a4;
- (id)newStateWithClientBuffers:(id)a3;
- (id)parameterValueForKey:(id)a3 error:(id *)a4;
- (id)pipeline;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (id)predictionFromFeatures:(id)a3 usingState:(id)a4 options:(id)a5 error:(id *)a6;
- (id)predictionsFromBatch:(id)a3 options:(id)a4 error:(id *)a5;
- (id)program;
- (id)regressor;
- (id)updatable;
- (id)writable;
- (int)engine;
- (unint64_t)maxAsyncPredictionsInFlight;
- (unint64_t)predictionTypeForKTrace;
- (unint64_t)signpostID;
- (void)_finishPredictionAndDispatchPendingPredictions;
- (void)_predictionFromFeatures:(id)a3 usingState:(id)a4 options:(id)a5 completionHandler:(id)a6;
- (void)_schedulePredictionRequest:(id)a3 completionHandler:(id)a4;
- (void)_submitPredictionRequest:(id)a3 completionHandler:(id)a4;
- (void)_validateStateFeatureNamed:(id)a3 backingMultiArray:(id)a4;
- (void)cancelPredictionRequest:(id)a3;
- (void)enableInstrumentsTracing;
- (void)predictionFromFeatures:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)predictionFromFeatures:(id)a3 usingState:(id)a4 options:(id)a5 completionHandler:(id)a6;
- (void)prepareWithCompletionHandler:(id)a3;
- (void)submitPredictionRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation MLDelegateModel

- (MLDelegateModel)initWithEngine:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    v8 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E58B000, v8, OS_LOG_TYPE_ERROR, "NULL engine", buf, 2u);
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"NULL engine"];
  }
  v9 = [v7 modelDescription];
  v10 = [v7 configuration];
  v27.receiver = self;
  v27.super_class = (Class)MLDelegateModel;
  v11 = [(MLModel *)&v27 initWithDescription:v9 configuration:v10];

  if (v11)
  {
    if ([v7 supportsConcurrentSubmissions]) {
      uint64_t v12 = +[MLModel maxPredictionsInFlight];
    }
    else {
      uint64_t v12 = 1;
    }
    v13 = [v7 configuration];
    char v14 = [v13 preparesLazily];

    if ((v14 & 1) == 0)
    {
      if ((prepareEngine(v7, v12, (uint64_t)a4) & 1) == 0)
      {
        v25 = 0;
        goto LABEL_17;
      }
      atomic_store(1u, (unsigned __int8 *)&v11->_prepared);
    }
    if ([v7 conformsToProtocol:&unk_1EF12E1E8]) {
      id v15 = v7;
    }
    else {
      id v15 = 0;
    }
    objc_storeStrong((id *)&v11->_internalEngine, a3);
    objc_storeStrong((id *)&v11->_statefulModelEngine, v15);
    v16 = [MLOutputBackingsVerifier alloc];
    v17 = [v7 modelDescription];
    v18 = [v17 outputDescriptionsByName];
    uint64_t v19 = [(MLOutputBackingsVerifier *)v16 initWithOutputDescriptions:v18];
    outputBackingsVerifier = v11->_outputBackingsVerifier;
    v11->_outputBackingsVerifier = (MLOutputBackingsVerifier *)v19;

    dispatch_queue_t v21 = dispatch_queue_create("com.apple.coreml.DefaultAsyncPredictionQueue", MEMORY[0x1E4F14430]);
    asyncPredictionQueue = v11->_asyncPredictionQueue;
    v11->_asyncPredictionQueue = (OS_dispatch_queue *)v21;

    v11->_asyncPredictionSchedulingLock._os_unfair_lock_opaque = 0;
    v11->_currentAsyncPredictionsInFlight = 0;
    v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingPredictionQueue = v11->_pendingPredictionQueue;
    v11->_pendingPredictionQueue = v23;

    v11->_maxAsyncPredictionsInFlight = v12;
  }
  v25 = v11;
LABEL_17:

  return v25;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)MEMORY[0x19F3C29E0]();
  v11 = +[MLState emptyState];
  id v15 = 0;
  uint64_t v12 = [(MLDelegateModel *)self _predictionFromFeatures:v8 usingState:v11 options:v9 error:&v15];
  id v13 = v15;

  if (a5 && !v12) {
    *a5 = v13;
  }

  return v12;
}

- (unint64_t)predictionTypeForKTrace
{
  v2 = [(MLDelegateModel *)self internalEngine];
  unint64_t v3 = [v2 predictionTypeForKTrace];

  return v3;
}

- (id)_predictionFromFeatures:(id)a3 usingState:(id)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v38 = a4;
  id v11 = a5;
  v37 = v10;
  if (!v10) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The input feature provider cannot be nil."];
  }
  if (!v11)
  {
    id v11 = +[MLPredictionOptions defaultOptions];
  }
  outputBackingsVerifier = self->_outputBackingsVerifier;
  id v13 = [v11 outputBackings];
  LOBYTE(outputBackingsVerifier) = [(MLOutputBackingsVerifier *)outputBackingsVerifier verifyOutputBackings:v13 predictionUsesBatch:0 error:a6];

  if (outputBackingsVerifier)
  {
    [(MLModel *)self enableInstrumentsTracingIfNeeded];
    char v42 = 0;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v39 = 0u;
    char v14 = [(MLDelegateModel *)self internalEngine];
    int v15 = [v14 recordsPredictionEvent];

    if (v15)
    {
      v16 = [(MLModel *)self predictionEvent];
      v17 = [(MLDelegateModel *)self internalEngine];
      uint64_t v18 = [v17 predictionTypeForKTrace];
      unint64_t v19 = [(MLDelegateModel *)self signpostID];
      uint64_t v20 = [v11 parentSignpostID];
      unint64_t v21 = [(MLModel *)self nextPredictionRequestID];
      id v22 = v16;
      *(void *)&long long v39 = mach_absolute_time();
      objc_storeStrong((id *)&v39 + 1, v16);
      *(void *)&long long v40 = v18;
      *((void *)&v40 + 1) = v19;
      *(void *)&long long v41 = v20;
      *((void *)&v41 + 1) = v21;
      char v42 = 1;
      kdebug_trace();
    }
    id v23 = +[MLState emptyState];

    if (v23 == v38)
    {
      v31 = [(MLDelegateModel *)self internalEngine];
      v30 = [v31 predictionFromFeatures:v37 options:v11 error:a6];
    }
    else
    {
      statefulModelEngine = self->_statefulModelEngine;
      if (!statefulModelEngine)
      {
        v25 = +[MLLogging coreChannel];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v33 = (objc_class *)objc_opt_class();
          v34 = NSStringFromClass(v33);
          v35 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          v44 = v34;
          __int16 v45 = 2112;
          v46 = v35;
          _os_log_error_impl(&dword_19E58B000, v25, OS_LOG_TYPE_ERROR, "This model engine (%@) doesn't support stateful predictions to perform %@.", buf, 0x16u);
        }
        v26 = (void *)MEMORY[0x1E4F1CA00];
        objc_super v27 = (objc_class *)objc_opt_class();
        v28 = NSStringFromClass(v27);
        v29 = NSStringFromSelector(a2);
        [v26 raise:*MEMORY[0x1E4F1C3B8], @"This model engine (%@) doesn't support stateful predictions to perform %@.", v28, v29 format];

        statefulModelEngine = self->_statefulModelEngine;
      }
      v30 = [(MLStatefulModelEngine *)statefulModelEngine predictionFromFeatures:v37 usingState:v38 options:v11 error:a6];
    }
    ElapsedTimeRecorder::~ElapsedTimeRecorder((id *)&v39);
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (id)internalEngine
{
  return self->_internalEngine;
}

- (unint64_t)signpostID
{
  v2 = [(MLDelegateModel *)self internalEngine];
  unint64_t v3 = [v2 signpostID];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingPredictionQueue, 0);
  objc_storeStrong((id *)&self->_outputBackingsVerifier, 0);
  objc_storeStrong((id *)&self->_statefulModelEngine, 0);
  objc_storeStrong((id *)&self->_internalEngine, 0);

  objc_storeStrong((id *)&self->_asyncPredictionQueue, 0);
}

- (NSMutableArray)pendingPredictionQueue
{
  return self->_pendingPredictionQueue;
}

- (unint64_t)maxAsyncPredictionsInFlight
{
  return self->_maxAsyncPredictionsInFlight;
}

- (id)newStateForFeatureNamed:(id)a3 initializerBlock:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  [(MLDelegateModel *)self _validateStateFeatureNamed:v7 backingMultiArray:0];
  if ([(MLModeling *)self->_internalEngine conformsToProtocol:&unk_1EF12E248])
  {
    id v9 = self->_internalEngine;
  }
  else
  {
    id v10 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v17 = (objc_class *)objc_opt_class();
      uint64_t v18 = NSStringFromClass(v17);
      unint64_t v19 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      unint64_t v21 = v18;
      __int16 v22 = 2112;
      id v23 = v19;
      _os_log_error_impl(&dword_19E58B000, v10, OS_LOG_TYPE_ERROR, "This model engine (%@) doesn't support the stateful predictions to perform the deprecated  %@.", buf, 0x16u);
    }
    id v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    char v14 = NSStringFromSelector(a2);
    [v11 raise:*MEMORY[0x1E4F1C3B8], @"This model engine (%@) doesn't support the stateful predictions to perform the deprecated  %@.", v13, v14 format];

    id v9 = 0;
  }
  int v15 = (void *)[(MLModeling *)v9 newStateForFeatureNamed:v7 initializerBlock:v8];

  return v15;
}

- (void)cancelPredictionRequest:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_asyncPredictionSchedulingLock);
  v5 = [(MLDelegateModel *)self pendingPredictionQueue];
  for (unint64_t i = 0; ; ++i)
  {
    if (i >= [v5 count])
    {
      os_unfair_lock_unlock(&self->_asyncPredictionSchedulingLock);
      goto LABEL_8;
    }
    id v7 = [v5 objectAtIndexedSubscript:i];
    id v8 = [v7 predictionRequest];

    if (v8 == v4) {
      break;
    }
  }
  [v5 removeObjectAtIndex:i];
  os_unfair_lock_unlock(&self->_asyncPredictionSchedulingLock);
  if (v7)
  {
    asyncPredictionQueue = self->_asyncPredictionQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__MLDelegateModel_cancelPredictionRequest___block_invoke;
    block[3] = &unk_1E59A5328;
    id v12 = v7;
    id v10 = v7;
    dispatch_async(asyncPredictionQueue, block);
  }
LABEL_8:
}

void __43__MLDelegateModel_cancelPredictionRequest___block_invoke(uint64_t a1)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) predictionRequest];
  unint64_t v3 = [v2 predictionOptions];
  id v4 = [v3 completionSyncPoint];

  if (v4) {
    [v4 notify];
  }
  v5 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v11 = 0;
    _os_log_error_impl(&dword_19E58B000, v5, OS_LOG_TYPE_ERROR, "Prediction was cancelled prior to completion.", v11, 2u);
  }

  v6 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v12 = *MEMORY[0x1E4F28568];
  id v7 = [NSString stringWithFormat:@"Prediction was cancelled prior to completion."];
  v13[0] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v9 = [v6 errorWithDomain:@"com.apple.CoreML" code:11 userInfo:v8];

  id v10 = [*(id *)(a1 + 32) completionHandler];
  ((void (**)(void, void, void *))v10)[2](v10, 0, v9);
}

- (void)_finishPredictionAndDispatchPendingPredictions
{
  p_asyncPredictionSchedulingLock = &self->_asyncPredictionSchedulingLock;
  os_unfair_lock_lock(&self->_asyncPredictionSchedulingLock);
  --self->_currentAsyncPredictionsInFlight;
  id v4 = [(MLDelegateModel *)self pendingPredictionQueue];
  unint64_t v5 = [v4 count];
  unint64_t v6 = [(MLDelegateModel *)self maxAsyncPredictionsInFlight];
  if (v6 - self->_currentAsyncPredictionsInFlight < v5) {
    unint64_t v5 = v6 - self->_currentAsyncPredictionsInFlight;
  }

  if (v5)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      id v8 = [(MLDelegateModel *)self pendingPredictionQueue];
      id v9 = [v8 objectAtIndexedSubscript:i];

      ++self->_currentAsyncPredictionsInFlight;
      id v10 = [v9 predictionRequest];
      id v11 = [v9 completionHandler];
      [(MLDelegateModel *)self _submitPredictionRequest:v10 completionHandler:v11];
    }
  }
  uint64_t v12 = [(MLDelegateModel *)self pendingPredictionQueue];
  objc_msgSend(v12, "removeObjectsInRange:", 0, v5);

  os_unfair_lock_unlock(p_asyncPredictionSchedulingLock);
}

- (void)_schedulePredictionRequest:(id)a3 completionHandler:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  p_asyncPredictionSchedulingLock = &self->_asyncPredictionSchedulingLock;
  os_unfair_lock_lock(&self->_asyncPredictionSchedulingLock);
  if (self->_currentAsyncPredictionsInFlight >= self->_maxAsyncPredictionsInFlight
    || ([(MLDelegateModel *)self pendingPredictionQueue],
        id v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 count],
        v8,
        v9))
  {
    id v10 = [[MLPendingPrediction alloc] initWithPredictionRequest:v12 completionHandler:v6];
    id v11 = [(MLDelegateModel *)self pendingPredictionQueue];
    [v11 addObject:v10];
  }
  else
  {
    ++self->_currentAsyncPredictionsInFlight;
    [(MLDelegateModel *)self _submitPredictionRequest:v12 completionHandler:v6];
  }
  os_unfair_lock_unlock(p_asyncPredictionSchedulingLock);
}

- (id)executionSchedule
{
  v2 = [(MLDelegateModel *)self internalEngine];
  unint64_t v3 = [v2 executionSchedule];

  return v3;
}

- (id)parameterValueForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(MLDelegateModel *)self internalEngine];
  id v8 = [v7 parameterValueForKey:v6 error:a4];

  return v8;
}

- (void)_predictionFromFeatures:(id)a3 usingState:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  [(MLModel *)self enableInstrumentsTracingIfNeeded];
  id v21 = 0;
  id v14 = [(MLDelegateModel *)self newRequestWithInputFeatures:v10 usingState:v11 options:v12 error:&v21];
  id v15 = v21;
  if (v14)
  {
    [(MLDelegateModel *)self _schedulePredictionRequest:v14 completionHandler:v13];
  }
  else
  {
    asyncPredictionQueue = self->_asyncPredictionQueue;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __80__MLDelegateModel__predictionFromFeatures_usingState_options_completionHandler___block_invoke;
    v17[3] = &unk_1E59A4F18;
    id v18 = v12;
    id v20 = v13;
    id v19 = v15;
    dispatch_async(asyncPredictionQueue, v17);
  }
}

void __80__MLDelegateModel__predictionFromFeatures_usingState_options_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) completionSyncPoint];
  if (v2) {
    [v2 notify];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)predictionFromFeatures:(id)a3 usingState:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  id v14 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)MEMORY[0x19F3C29E0]();
  [(MLDelegateModel *)self _predictionFromFeatures:v14 usingState:v10 options:v11 completionHandler:v12];
}

- (void)predictionFromFeatures:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)MEMORY[0x19F3C29E0]();
  id v11 = +[MLState emptyState];
  [(MLDelegateModel *)self _predictionFromFeatures:v12 usingState:v11 options:v8 completionHandler:v9];
}

- (void)_submitPredictionRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  asyncPredictionQueue = self->_asyncPredictionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__MLDelegateModel__submitPredictionRequest_completionHandler___block_invoke;
  block[3] = &unk_1E59A4F18;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(asyncPredictionQueue, block);
}

void __62__MLDelegateModel__submitPredictionRequest_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) predictionOptions];
  v3[0] = 0;
  v3[1] = v3;
  v3[2] = 0x3812000000;
  v3[3] = __Block_byref_object_copy__13604;
  v3[4] = __Block_byref_object_dispose__13605;
  v3[5] = 0;
  [*(id *)(a1 + 40) predictionEvent];
  objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) internalEngine];
  [(id)objc_claimAutoreleasedReturnValue() predictionTypeForKTrace];
  [*(id *)(a1 + 40) signpostID];
  [v2 parentSignpostID];
  [*(id *)(a1 + 40) nextPredictionRequestID];
  operator new();
}

void __62__MLDelegateModel__submitPredictionRequest_completionHandler___block_invoke_212(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) completionSyncPoint];
  id v7 = v6;
  if (v6) {
    [v6 notify];
  }
  [*(id *)(a1 + 40) _finishPredictionAndDispatchPendingPredictions];
  std::unique_ptr<ElapsedTimeRecorder>::reset[abi:ne180100]((id **)(*(void *)(*(void *)(a1 + 56) + 8) + 48));
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)submitPredictionRequest:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  [(MLModel *)self enableInstrumentsTracingIfNeeded];
  [(MLDelegateModel *)self _schedulePredictionRequest:v7 completionHandler:v6];
}

- (id)newRequestWithInputFeatures:(id)a3 usingState:(id)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (!v11)
  {
    id v14 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E58B000, v14, OS_LOG_TYPE_ERROR, "The input feature provider cannot be nil.", buf, 2u);
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The input feature provider cannot be nil."];
  }
  if (!v13)
  {
    id v15 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E58B000, v15, OS_LOG_TYPE_ERROR, "The options cannot be nil.", buf, 2u);
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The options cannot be nil."];
  }
  outputBackingsVerifier = self->_outputBackingsVerifier;
  v17 = [v13 outputBackings];
  LOBYTE(outputBackingsVerifier) = [(MLOutputBackingsVerifier *)outputBackingsVerifier verifyOutputBackings:v17 predictionUsesBatch:0 error:a6];

  if (outputBackingsVerifier)
  {
    id v18 = +[MLState emptyState];
    BOOL v19 = v18 == v12;

    if (v19)
    {
      objc_super v27 = [(MLDelegateModel *)self internalEngine];
      v26 = (void *)[v27 newRequestForModel:self inputFeatures:v11 options:v13 error:a6];
    }
    else
    {
      statefulModelEngine = self->_statefulModelEngine;
      if (!statefulModelEngine)
      {
        id v21 = +[MLLogging coreChannel];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v29 = (objc_class *)objc_opt_class();
          v30 = NSStringFromClass(v29);
          v31 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          v33 = v30;
          __int16 v34 = 2112;
          v35 = v31;
          _os_log_error_impl(&dword_19E58B000, v21, OS_LOG_TYPE_ERROR, "This model engine (%@) doesn't support stateful predictions to perform %@.", buf, 0x16u);
        }
        __int16 v22 = (void *)MEMORY[0x1E4F1CA00];
        id v23 = (objc_class *)objc_opt_class();
        uint64_t v24 = NSStringFromClass(v23);
        v25 = NSStringFromSelector(a2);
        [v22 raise:*MEMORY[0x1E4F1C3B8], @"This model engine (%@) doesn't support stateful predictions to perform %@.", v24, v25 format];

        statefulModelEngine = self->_statefulModelEngine;
      }
      v26 = (void *)[(MLStatefulModelEngine *)statefulModelEngine newRequestForModel:self inputFeatures:v11 usingState:v12 options:v13 error:a6];
    }
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (id)newRequestWithInputFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = +[MLState emptyState];
  id v11 = [(MLDelegateModel *)self newRequestWithInputFeatures:v8 usingState:v10 options:v9 error:a5];

  return v11;
}

- (id)_predictionsFromBatch:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The input batch feature provider cannot be nil."];
  }
  if (!v9)
  {
    id v9 = +[MLPredictionOptions defaultOptions];
  }
  outputBackingsVerifier = self->_outputBackingsVerifier;
  id v11 = [v9 outputBackings];
  LOBYTE(outputBackingsVerifier) = [(MLOutputBackingsVerifier *)outputBackingsVerifier verifyOutputBackings:v11 predictionUsesBatch:1 error:a5];

  if (outputBackingsVerifier)
  {
    [(MLModel *)self enableInstrumentsTracingIfNeeded];
    id v12 = [(MLDelegateModel *)self internalEngine];
    uint64_t v13 = [v12 predictionTypeForKTrace];

    unint64_t v14 = [(MLDelegateModel *)self signpostID];
    uint64_t v15 = [v9 parentSignpostID];
    kdebug_trace();
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __55__MLDelegateModel__predictionsFromBatch_options_error___block_invoke;
    aBlock[3] = &__block_descriptor_56_e5_v8__0l;
    aBlock[4] = v13;
    aBlock[5] = v14;
    aBlock[6] = v15;
    v16 = (void (**)(void))_Block_copy(aBlock);
    v17 = [(MLDelegateModel *)self internalEngine];
    id v18 = [v17 predictionsFromBatch:v8 options:v9 error:a5];

    v16[2](v16);
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

uint64_t __55__MLDelegateModel__predictionsFromBatch_options_error___block_invoke()
{
  return kdebug_trace();
}

- (id)predictionsFromBatch:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)MEMORY[0x19F3C29E0]();
  id v14 = 0;
  id v11 = [(MLDelegateModel *)self _predictionsFromBatch:v8 options:v9 error:&v14];
  id v12 = v14;
  if (a5 && !v11) {
    *a5 = v12;
  }

  return v11;
}

- (id)predictionFromFeatures:(id)a3 usingState:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void *)MEMORY[0x19F3C29E0]();
  id v17 = 0;
  id v14 = [(MLDelegateModel *)self _predictionFromFeatures:v10 usingState:v11 options:v12 error:&v17];
  id v15 = v17;
  if (a6 && !v14) {
    *a6 = v15;
  }

  return v14;
}

- (id)newStateWithClientBuffers:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!self->_statefulModelEngine)
  {
    id v6 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v31 = (objc_class *)objc_opt_class();
      v32 = NSStringFromClass(v31);
      v33 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      __int16 v45 = v32;
      __int16 v46 = 2112;
      uint64_t v47 = v33;
      _os_log_error_impl(&dword_19E58B000, v6, OS_LOG_TYPE_ERROR, "This model engine (%@) doesn't support stateful predictions to perform %@.", buf, 0x16u);
    }
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    id v10 = NSStringFromSelector(a2);
    [v7 raise:*MEMORY[0x1E4F1C3B8], @"This model engine (%@) doesn't support stateful predictions to perform %@.", v9, v10 format];
  }
  id v11 = [(MLModel *)self modelDescription];
  id v12 = [v11 stateDescriptionsByName];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v39 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = *(void *)(*((void *)&v38 + 1) + 8 * i);
        id v18 = [v5 objectForKeyedSubscript:v17];
        [(MLDelegateModel *)self _validateStateFeatureNamed:v17 backingMultiArray:v18];
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v14);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v19 = v5;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v35;
    uint64_t v22 = *MEMORY[0x1E4F1C3C8];
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v35 != v21) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void **)(*((void *)&v34 + 1) + 8 * j);
        v25 = [v13 objectForKeyedSubscript:v24];
        BOOL v26 = v25 == 0;

        if (v26)
        {
          objc_super v27 = +[MLLogging coreChannel];
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            __int16 v45 = v24;
            _os_log_error_impl(&dword_19E58B000, v27, OS_LOG_TYPE_ERROR, "The state feature named %@ in the client buffers is not declared in the state feature description", buf, 0xCu);
          }

          [MEMORY[0x1E4F1CA00] raise:v22, @"The state feature named %@ in the client buffers is not declared in the state feature description", v24 format];
        }
      }
      uint64_t v20 = [v19 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v20);
  }

  if ([v13 count])
  {
    uint64_t v28 = [(MLStatefulModelEngine *)self->_statefulModelEngine newStateWithClientBuffers:v19];
  }
  else
  {
    uint64_t v28 = +[MLState emptyState];
  }
  v29 = (void *)v28;

  return v29;
}

- (void)_validateStateFeatureNamed:(id)a3 backingMultiArray:(id)a4
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MLModel *)self modelDescription];
  id v9 = [v8 stateDescriptionsByName];

  id v10 = [v9 objectForKeyedSubscript:v6];
  id v11 = v10;
  if (!v10)
  {
    uint64_t v22 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v6;
      _os_log_error_impl(&dword_19E58B000, v22, OS_LOG_TYPE_ERROR, "The feature named %@ is not declared in the state feature description", buf, 0xCu);
    }
    id v23 = @"The feature named %@ is not declared in the state feature description";
    goto LABEL_15;
  }
  if ([v10 type] != 8)
  {
    uint64_t v22 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v6;
      _os_log_error_impl(&dword_19E58B000, v22, OS_LOG_TYPE_ERROR, "The feature named %@ is not MLFeatureTypeState", buf, 0xCu);
    }
    id v23 = @"The feature named %@ is not MLFeatureTypeState";
LABEL_15:

    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], v23, v6);
    goto LABEL_16;
  }
  if (v7)
  {
    id v12 = [MLState alloc];
    id v30 = v6;
    v31[0] = v7;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
    uint64_t v14 = [(MLState *)v12 initWithBackings:v13];

    uint64_t v15 = +[MLFeatureValue internalFeatureValueWithState:v14];
    v16 = [v11 stateConstraint];
    id v25 = 0;
    char v17 = [v16 isAllowedValue:v15 error:&v25];
    id v18 = v25;

    if ((v17 & 1) == 0)
    {
      id v19 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = [v18 localizedDescription];
        *(_DWORD *)buf = 138412546;
        id v27 = v6;
        __int16 v28 = 2112;
        v29 = v24;
        _os_log_error_impl(&dword_19E58B000, v19, OS_LOG_TYPE_ERROR, "The user specified backing multi array for state feature named %@ is not compatible. (Error: %@)", buf, 0x16u);
      }
      uint64_t v20 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v21 = [v18 localizedDescription];
      [v20 raise:*MEMORY[0x1E4F1C3C8], @"The user specified backing multi array for state feature named %@ is not compatible. (Error: %@)", v6, v21 format];
    }
  }
LABEL_16:
}

- (void)prepareWithCompletionHandler:(id)a3
{
  id v4 = a3;
  asyncPredictionQueue = self->_asyncPredictionQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__MLDelegateModel_prepareWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E59A4EC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(asyncPredictionQueue, v7);
}

void __48__MLDelegateModel_prepareWithCompletionHandler___block_invoke(uint64_t a1)
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 128));
  if (v2)
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v7();
  }
  else
  {
    unint64_t v3 = [*(id *)(a1 + 32) internalEngine];
    uint64_t v4 = [*(id *)(a1 + 32) maxAsyncPredictionsInFlight];
    id v8 = 0;
    int v5 = prepareEngine(v3, v4, (uint64_t)&v8);
    id v6 = v8;

    if (v5) {
      atomic_store(1u, (unsigned __int8 *)(*(void *)(a1 + 32) + 128));
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)pipeline
{
  unint64_t v3 = [(MLDelegateModel *)self internalEngine];
  int v4 = [v3 conformsToProtocol:&unk_1EF12B2D0];

  if (v4)
  {
    int v5 = [(MLDelegateModel *)self internalEngine];
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (id)regressor
{
  unint64_t v3 = [(MLDelegateModel *)self internalEngine];
  int v4 = [v3 conformsToProtocol:&unk_1EF121EC0];

  if (v4)
  {
    int v5 = [(MLDelegateModel *)self internalEngine];
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (id)classifier
{
  unint64_t v3 = [(MLDelegateModel *)self internalEngine];
  int v4 = [v3 conformsToProtocol:&unk_1EF11CB68];

  if (v4)
  {
    int v5 = [(MLDelegateModel *)self internalEngine];
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (id)updatable
{
  unint64_t v3 = [(MLDelegateModel *)self internalEngine];
  int v4 = [v3 conformsToProtocol:&unk_1EF1247D8];

  if (v4)
  {
    int v5 = [(MLDelegateModel *)self internalEngine];
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (id)writable
{
  unint64_t v3 = [(MLDelegateModel *)self internalEngine];
  int v4 = [v3 conformsToProtocol:&unk_1EF1246F0];

  if (v4)
  {
    int v5 = [(MLDelegateModel *)self internalEngine];
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (id)neuralNetwork
{
  unint64_t v3 = [(MLDelegateModel *)self internalEngine];
  int v4 = [v3 conformsToProtocol:&unk_1EF121E48];

  if (v4)
  {
    int v5 = [(MLDelegateModel *)self internalEngine];
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (id)program
{
  if ([(MLModeling *)self->_internalEngine conformsToProtocol:&unk_1EF12A6D8])
  {
    unint64_t v3 = [(MLDelegateModel *)self internalEngine];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

- (void)enableInstrumentsTracing
{
  id v2 = [(MLDelegateModel *)self internalEngine];
  [v2 enableInstrumentsTracing];
}

- (int)engine
{
  unint64_t v3 = [(MLDelegateModel *)self internalEngine];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    return 0x7FFFFFFF;
  }
  int v5 = [(MLDelegateModel *)self internalEngine];
  int v6 = [v5 engine];

  return v6;
}

@end