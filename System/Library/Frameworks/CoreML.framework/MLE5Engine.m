@interface MLE5Engine
+ (Class)containerClass;
+ (id)loadModelAssetDescriptionFromCompiledArchive:(_MLModelInputArchiver *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7;
+ (id)loadModelFromCompiledArchive:(_MLModelInputArchiver *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7;
- (BOOL)_cleanUpAndReconfigureStream:(id)a3 forInputFeatures:(id)a4 error:(id *)a5;
- (BOOL)_validateStreamReuse:(BOOL)a3 expectation:(id)a4 error:(id *)a5;
- (BOOL)prepareWithConcurrencyHint:(int64_t)a3 error:(id *)a4;
- (BOOL)supportsConcurrentSubmissions;
- (MLE5Engine)initWithContainer:(id)a3 configuration:(id)a4 error:(id *)a5;
- (MLE5Engine)initWithProgramLibrary:(id)a3 modelDescription:(id)a4 configuration:(id)a5 functionName:(id)a6 classProbabilitiesFeatureName:(id)a7 optionalInputDefaultValues:(id)a8 compilerVersionInfo:(id)a9;
- (MLE5ExecutionStreamOperationPool)operationPool;
- (MLE5ExecutionStreamPool)streamPool;
- (MLE5ProgramLibrary)programLibrary;
- (MLFeatureProviderConformer)inputFeatureConformer;
- (MLFeatureProviderConformer)stateFeatureConformer;
- (MLVersionInfo)compilerVersionInfo;
- (NSString)classProbabilitiesFeatureName;
- (NSString)functionName;
- (NSString)serializedMILText;
- (OS_dispatch_semaphore)batchMaxInFlightSem;
- (double)_totalRuntimeInMilliSecondsFromE5AnalyticsDictionary:(id)a3;
- (id)_classProbabilitiesInOutputFeatures:(id)a3 error:(id *)a4;
- (id)_classifierResultFromOutputFeatures:(id)a3 classifyTopK:(unint64_t)a4 error:(id *)a5;
- (id)_conformInputFeatures:(id)a3 error:(id *)a4;
- (id)_conformState:(id)a3 error:(id *)a4;
- (id)_newRequestForModel:(id)a3 inputFeatures:(id)a4 usingState:(id)a5 options:(id)a6 error:(id *)a7;
- (id)_outputFeaturesByAddingClassifierResultTo:(id)a3 classifyTopK:(unint64_t)a4 error:(id *)a5;
- (id)_postProcessingForOutputs:(id)a3 options:(id)a4 error:(id *)a5;
- (id)_predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (id)_predictionFromFeatures:(id)a3 stream:(id)a4 options:(id)a5 error:(id *)a6;
- (id)_predictionFromFeatures:(id)a3 usingState:(id)a4 options:(id)a5 error:(id *)a6;
- (id)_probabilityDictionaryWithMultiArray:(id)a3 classifyTopK:(int64_t)a4;
- (id)_trimQuotesFromBackendName:(id)a3;
- (id)classLabels;
- (id)classLabelsSharedKey;
- (id)classify:(id)a3 options:(id)a4 error:(id *)a5;
- (id)evaluateFunction:(id)a3 arguments:(id)a4 error:(id *)a5;
- (id)executionSchedule;
- (id)newContextAndReturnError:(id *)a3;
- (id)newRequestForModel:(id)a3 inputFeatures:(id)a4 options:(id)a5 error:(id *)a6;
- (id)newStateForFeatureNamed:(id)a3 initializerBlock:(id)a4;
- (id)newStateWithClientBuffers:(id)a3;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (id)predictionFromFeatures:(id)a3 usingState:(id)a4 options:(id)a5 error:(id *)a6;
- (id)predictionsFromBatch:(id)a3 options:(id)a4 error:(id *)a5;
- (unint64_t)_extractSupportFromBackendDict:(id)a3;
- (unint64_t)_extractSupportedComputeUnitFromString:(id)a3;
- (unint64_t)predictionTypeForKTrace;
- (void)_cleanUpStream:(id)a3;
- (void)_predictionFromFeatures:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)enableInstrumentsTracing;
- (void)submitPredictionRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation MLE5Engine

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_programLibrary, 0);
  objc_storeStrong((id *)&self->_compilerVersionInfo, 0);
  objc_storeStrong((id *)&self->_batchMaxInFlightSem, 0);
  objc_storeStrong((id *)&self->_stateFeatureConformer, 0);
  objc_storeStrong((id *)&self->_inputFeatureConformer, 0);
  objc_storeStrong(&self->_classLabelsSharedKey, 0);
  objc_storeStrong((id *)&self->_classProbabilitiesFeatureName, 0);
  objc_storeStrong((id *)&self->_functionName, 0);
  objc_storeStrong((id *)&self->_operationPool, 0);

  objc_storeStrong((id *)&self->_streamPool, 0);
}

+ (id)loadModelFromCompiledArchive:(_MLModelInputArchiver *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [[MLProgramE5Container alloc] initWithCompiledArchive:a3 modelVersionInfo:v12 compilerVersionInfo:v13 error:a7];
  if (!v15) {
    goto LABEL_19;
  }
  if ([v14 experimentalMLE5EngineUsage] == 1)
  {
    v16 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v24 = 0;
      _os_log_error_impl(&dword_19E58B000, v16, OS_LOG_TYPE_ERROR, "MLE5Engine is disabled through the configuration.", v24, 2u);
    }

    if (a7)
    {
      v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v27 = *MEMORY[0x1E4F28568];
      v18 = [NSString stringWithFormat:@"MLE5Engine is disabled through the configuration."];
      v28[0] = v18;
      v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
      v20 = [v17 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v19];
LABEL_18:
      *a7 = v20;

LABEL_19:
      a7 = 0;
      goto LABEL_20;
    }
    goto LABEL_20;
  }
  if (([v14 profilingOptions] & 1) == 0)
  {
LABEL_8:
    a7 = (id *)[objc_alloc((Class)a1) initWithContainer:v15 configuration:v14 error:a7];
    goto LABEL_20;
  }
  if (e5rtWouldUseBackwardCompatibilityPath(void)::onceToken != -1) {
    dispatch_once(&e5rtWouldUseBackwardCompatibilityPath(void)::onceToken, &__block_literal_global_344);
  }
  if (e5rtWouldUseBackwardCompatibilityPath(void)::chipID <= 32773)
  {
    if (e5rtWouldUseBackwardCompatibilityPath(void)::chipID
      && e5rtWouldUseBackwardCompatibilityPath(void)::chipID != 28672)
    {
      goto LABEL_8;
    }
  }
  else if (((unint64_t)(e5rtWouldUseBackwardCompatibilityPath(void)::chipID - 32774) > 0x2A {
          || ((1 << (e5rtWouldUseBackwardCompatibilityPath(void)::chipID - 6)) & 0x40204008801) == 0)
  }
         && e5rtWouldUseBackwardCompatibilityPath(void)::chipID != 33537)
  {
    goto LABEL_8;
  }
  v21 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v24 = 0;
    _os_log_error_impl(&dword_19E58B000, v21, OS_LOG_TYPE_ERROR, "MLE5Engine does not support profiling options on the current device.", v24, 2u);
  }

  if (a7)
  {
    v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = *MEMORY[0x1E4F28568];
    v18 = [NSString stringWithFormat:@"MLE5Engine does not support profiling options on the current device."];
    v26 = v18;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    v20 = [v22 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v19];
    goto LABEL_18;
  }
LABEL_20:

  return a7;
}

- (MLE5Engine)initWithContainer:(id)a3 configuration:(id)a4 error:(id *)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v22 = 0;
  id v23 = 0;
  v10 = [v8 modelAssetDescription];
  BOOL v11 = +[MLProgramE5Container deduceFunctionNameToCompute:&v23 modelDescription:&v22 fromConfiguration:v9 modelAssetDescription:v10 error:a5];
  id v12 = v23;
  id v13 = v22;

  if (v11)
  {
    id v14 = [[MLE5ProgramLibrary alloc] initWithContainer:v8 configuration:v9 error:a5];
    v15 = v14;
    if (v14)
    {
      if ([(MLE5ProgramLibrary *)v14 prepareAndReturnError:a5])
      {
        v16 = [v8 classScoreVectorNameOfFunctionNamed:v12];
        v17 = [v8 optionalInputDefaultValuesForFunctionNamed:v12];
        v18 = [v8 compilerVersionInfo];
        self = [(MLE5Engine *)self initWithProgramLibrary:v15 modelDescription:v13 configuration:v9 functionName:v12 classProbabilitiesFeatureName:v16 optionalInputDefaultValues:v17 compilerVersionInfo:v18];

        v19 = self;
LABEL_10:

LABEL_12:
        goto LABEL_13;
      }
      if (_os_feature_enabled_impl())
      {
        v16 = +[MLLogging coreChannel];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        {
          v21 = [(MLE5ProgramLibrary *)v15 modelDisplayName];
          *(_DWORD *)buf = 138412290;
          uint64_t v25 = v21;
          _os_log_fault_impl(&dword_19E58B000, v16, OS_LOG_TYPE_FAULT, "On-Device model specialization failed. MLModel will fall back to the legacy engine. (Model Display Name: %@.)", buf, 0xCu);
        }
        v19 = 0;
        goto LABEL_10;
      }
    }
    v19 = 0;
    goto LABEL_12;
  }
  v19 = 0;
LABEL_13:

  return v19;
}

- (MLE5ProgramLibrary)programLibrary
{
  return self->_programLibrary;
}

- (MLVersionInfo)compilerVersionInfo
{
  return self->_compilerVersionInfo;
}

- (OS_dispatch_semaphore)batchMaxInFlightSem
{
  return self->_batchMaxInFlightSem;
}

- (MLFeatureProviderConformer)stateFeatureConformer
{
  return (MLFeatureProviderConformer *)objc_getProperty(self, a2, 80, 1);
}

- (MLFeatureProviderConformer)inputFeatureConformer
{
  return (MLFeatureProviderConformer *)objc_getProperty(self, a2, 72, 1);
}

- (id)classLabelsSharedKey
{
  return objc_getProperty(self, a2, 64, 1);
}

- (NSString)classProbabilitiesFeatureName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)functionName
{
  return self->_functionName;
}

- (MLE5ExecutionStreamOperationPool)operationPool
{
  return (MLE5ExecutionStreamOperationPool *)objc_getProperty(self, a2, 40, 1);
}

- (MLE5ExecutionStreamPool)streamPool
{
  return (MLE5ExecutionStreamPool *)objc_getProperty(self, a2, 32, 1);
}

- (id)newStateForFeatureNamed:(id)a3 initializerBlock:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MLE5Engine *)self programLibrary];
  id v9 = [(MLE5Engine *)self functionName];
  v23[0] = v6;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  id v20 = 0;
  BOOL v11 = (void *)[v8 newStateForFunctionNamed:v9 stateNames:v10 clientBuffers:MEMORY[0x1E4F1CC08] error:&v20];
  id v12 = v20;

  if (!v11)
  {
    id v13 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v17 = [v12 localizedDescription];
      *(_DWORD *)buf = 138412290;
      id v22 = v17;
      _os_log_error_impl(&dword_19E58B000, v13, OS_LOG_TYPE_ERROR, "Failed to create state with error: %@", buf, 0xCu);
    }
    id v14 = (void *)MEMORY[0x1E4F1CA00];
    v15 = [v12 localizedDescription];
    [v14 raise:*MEMORY[0x1E4F1C3B8], @"Failed to create state with error: %@", v15 format];
  }
  if (v7)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __55__MLE5Engine_newStateForFeatureNamed_initializerBlock___block_invoke;
    v18[3] = &unk_1E59A54A0;
    id v19 = v7;
    [v11 getMultiArrayForStateNamed:v6 handler:v18];
  }
  return v11;
}

uint64_t __55__MLE5Engine_newStateForFeatureNamed_initializerBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enableInstrumentsTracing
{
  v4.receiver = self;
  v4.super_class = (Class)MLE5Engine;
  [(MLModelEngine *)&v4 enableInstrumentsTracing];
  v3 = [(MLE5Engine *)self streamPool];
  [v3 enableInstrumentsTracing];
}

- (id)executionSchedule
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  v3 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    objc_super v4 = [(MLModelEngine *)self modelDescription];
    v5 = [v4 modelURL];
    *(_DWORD *)buf = 138412290;
    v101 = v5;
    _os_log_impl(&dword_19E58B000, v3, OS_LOG_TYPE_INFO, "The client requested MLE5Engine to report the segmentation analytics of the model: %@. ", buf, 0xCu);
  }
  id v6 = [(MLE5Engine *)self programLibrary];
  id v94 = 0;
  v56 = [v6 segmentationAnalyticsAndReturnError:&v94];
  id v71 = v94;

  if (v56)
  {
    -[MLE5Engine _totalRuntimeInMilliSecondsFromE5AnalyticsDictionary:](self, "_totalRuntimeInMilliSecondsFromE5AnalyticsDictionary:");
    double v8 = v7;
    v55 = objc_alloc_init(MLModelExecutionSchedule);
    os_log_t log = (os_log_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v58 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v92 = 0u;
    long long v93 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    obuint64_t j = v56;
    uint64_t v67 = [obj countByEnumeratingWithState:&v90 objects:v99 count:16];
    if (v67)
    {
      uint64_t v65 = *MEMORY[0x1E4F61440];
      uint64_t v66 = *(void *)v91;
      uint64_t v63 = *MEMORY[0x1E4F61450];
      uint64_t v64 = *MEMORY[0x1E4F61428];
      uint64_t v60 = *MEMORY[0x1E4F61438];
      uint64_t v61 = *MEMORY[0x1E4F61458];
      uint64_t v68 = *MEMORY[0x1E4F61430];
      uint64_t v59 = *MEMORY[0x1E4F61448];
      uint64_t v57 = *MEMORY[0x1E4F1C3B8];
      do
      {
        for (uint64_t i = 0; i != v67; ++i)
        {
          if (*(void *)v91 != v66) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v90 + 1) + 8 * i);
          v10 = [obj objectForKeyedSubscript:v9];
          v76 = [v10 objectForKeyedSubscript:v65];

          BOOL v11 = [obj objectForKeyedSubscript:v9];
          v77 = [v11 objectForKeyedSubscript:v64];
          v79 = v11;
          id v12 = [v11 objectForKeyedSubscript:v63];
          unint64_t v13 = [(MLE5Engine *)self _extractSupportFromBackendDict:v77];
          unint64_t v14 = [(MLE5Engine *)self _extractSupportedComputeUnitFromString:v12];
          if (v14)
          {
            v15 = [v11 objectForKeyedSubscript:v61];
            v70 = v12;
            id v80 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            long long v88 = 0u;
            long long v89 = 0u;
            long long v86 = 0u;
            long long v87 = 0u;
            id v16 = v15;
            uint64_t v17 = [v16 countByEnumeratingWithState:&v86 objects:v98 count:16];
            unint64_t v73 = v14;
            unint64_t v18 = v14 | v13;
            if (v17)
            {
              uint64_t v19 = *(void *)v87;
              do
              {
                for (uint64_t j = 0; j != v17; ++j)
                {
                  if (*(void *)v87 != v19) {
                    objc_enumerationMutation(v16);
                  }
                  uint64_t v21 = *(void *)(*((void *)&v86 + 1) + 8 * j);
                  unint64_t v22 = [(MLE5Engine *)self _extractSupportedComputeUnitFromString:v21];
                  if ((v22 & v18) == 0)
                  {
                    id v23 = [v16 objectForKeyedSubscript:v21];
                    v24 = [NSNumber numberWithUnsignedInteger:v22];
                    [v80 setObject:v23 forKeyedSubscript:v24];
                  }
                }
                uint64_t v17 = [v16 countByEnumeratingWithState:&v86 objects:v98 count:16];
              }
              while (v17);
            }

            uint64_t v25 = [v79 objectForKeyedSubscript:v60];
            id v26 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            long long v84 = 0u;
            long long v85 = 0u;
            long long v82 = 0u;
            long long v83 = 0u;
            id v27 = v25;
            uint64_t v28 = [v27 countByEnumeratingWithState:&v82 objects:v97 count:16];
            if (v28)
            {
              uint64_t v29 = *(void *)v83;
              do
              {
                for (uint64_t k = 0; k != v28; ++k)
                {
                  if (*(void *)v83 != v29) {
                    objc_enumerationMutation(v27);
                  }
                  uint64_t v31 = *(void *)(*((void *)&v82 + 1) + 8 * k);
                  unint64_t v32 = [(MLE5Engine *)self _extractSupportedComputeUnitFromString:v31];
                  v33 = [v27 objectForKeyedSubscript:v31];
                  v34 = [NSNumber numberWithUnsignedInteger:v32];
                  [v26 setObject:v33 forKeyedSubscript:v34];
                }
                uint64_t v28 = [v27 countByEnumeratingWithState:&v82 objects:v97 count:16];
              }
              while (v28);
            }

            v35 = [(MLE5Engine *)self _trimQuotesFromBackendName:v70];
            v69 = [v27 objectForKeyedSubscript:v35];
            double v36 = 0.0;
            if (v8 > 0.0)
            {
              [v69 doubleValue];
              double v36 = v37 / v8;
            }
            v38 = [MLLayerExecutionSchedule alloc];
            v39 = [v79 objectForKeyedSubscript:v68];
            v40 = [v79 objectForKeyedSubscript:v59];
            v72 = -[MLLayerExecutionSchedule initWithComputeUnits:layerName:layerError:layerTypeName:supportedComputeUnits:layerIndex:supportMessages:computeTimeRatio:](v38, "initWithComputeUnits:layerName:layerError:layerTypeName:supportedComputeUnits:layerIndex:supportMessages:computeTimeRatio:", v73, v39, 0, v40, v18, [v76 integerValue], v36, v80);

            v41 = [(MLModelEngine *)self modelPath];
            v74 = [v41 scopedModelNames];

            v42 = [MLLayerPath alloc];
            v43 = [v79 objectForKeyedSubscript:v68];
            v44 = [(MLLayerPath *)v42 initWithScopedModelAndLayerName:v74 layerName:v43];

            v95 = v44;
            v96 = v72;
            v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v96 forKeys:&v95 count:1];
            [log addEntriesFromDictionary:v45];

            v46 = [NSString stringWithUTF8String:"OpPath"];
            v47 = [v79 objectForKeyedSubscript:v46];

            if ([v47 count])
            {
              v48 = [MLModelStructurePath alloc];
              id v81 = v71;
              v49 = [(MLModelStructurePath *)v48 initWithMLProgramOperationPathComponents:v47 scopedModelNames:v74 error:&v81];
              id v50 = v81;

              if (v49)
              {
                [v58 setObject:v72 forKeyedSubscript:v49];
              }
              else
              {
                v51 = +[MLLogging coreChannel];
                if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v101 = v47;
                  __int16 v102 = 2112;
                  id v103 = v50;
                  _os_log_error_impl(&dword_19E58B000, v51, OS_LOG_TYPE_ERROR, "Failed to construct ModelStructurePath from path components=%@, error=%@", buf, 0x16u);
                }

                [MEMORY[0x1E4F1CA00] raise:v57, @"Failed to construct ModelStructurePath from path components=%@, error=%@", v47, v50 format];
                v49 = 0;
              }
            }
            else
            {
              v49 = 0;
              id v50 = v71;
            }

            id v71 = v50;
            id v12 = v70;
          }
        }
        uint64_t v67 = [obj countByEnumeratingWithState:&v90 objects:v99 count:16];
      }
      while (v67);
    }

    [(MLModelExecutionSchedule *)v55 setModelExecutionSchedule:log];
    [(MLModelExecutionSchedule *)v55 setModelExecutionScheduleByModelStructurePath:v58];
  }
  else
  {
    os_log_t log = +[MLLogging coreChannel];
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      v53 = [(MLModelEngine *)self modelDescription];
      v54 = [v53 modelURL];
      *(_DWORD *)buf = 138412546;
      v101 = v54;
      __int16 v102 = 2112;
      id v103 = v71;
      _os_log_error_impl(&dword_19E58B000, log, OS_LOG_TYPE_ERROR, "MLE5Engine failed to get segmentation analytics of the model: %@, error =%@", buf, 0x16u);
    }
    v55 = 0;
  }

  return v55;
}

- (double)_totalRuntimeInMilliSecondsFromE5AnalyticsDictionary:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  unint64_t v18 = v3;
  if (v3)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    obuint64_t j = v3;
    uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v22;
      uint64_t v6 = *MEMORY[0x1E4F61450];
      uint64_t v7 = *MEMORY[0x1E4F61438];
      double v8 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v22 != v5) {
            objc_enumerationMutation(obj);
          }
          v10 = [obj objectForKeyedSubscript:*(void *)(*((void *)&v21 + 1) + 8 * i)];
          BOOL v11 = [v10 objectForKeyedSubscript:v6];
          id v12 = [v10 objectForKeyedSubscript:v7];
          unint64_t v13 = [(MLE5Engine *)self _trimQuotesFromBackendName:v11];
          unint64_t v14 = [v12 objectForKeyedSubscript:v13];
          [v14 doubleValue];
          double v16 = v15;

          double v8 = v8 + v16;
        }
        uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v4);
    }
    else
    {
      double v8 = 0.0;
    }
  }
  else
  {
    double v8 = 0.0;
  }

  return v8;
}

- (id)_trimQuotesFromBackendName:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"\""];
  uint64_t v5 = [v3 stringByTrimmingCharactersInSet:v4];

  return v5;
}

- (unint64_t)_extractSupportFromBackendDict:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = a3;
  unint64_t v5 = 0;
  uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v5 |= -[MLE5Engine _extractSupportedComputeUnitFromString:](self, "_extractSupportedComputeUnitFromString:", *(void *)(*((void *)&v10 + 1) + 8 * v8++), (void)v10);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v5;
}

- (unint64_t)_extractSupportedComputeUnitFromString:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (([v3 containsString:@"classic_cpu"] & 1) != 0
    || ([v3 containsString:@"mlc"] & 1) != 0)
  {
    goto LABEL_3;
  }
  if ([v3 containsString:@"mps_graph"])
  {
    unint64_t v4 = 2;
    goto LABEL_4;
  }
  if ([v3 containsString:@"ane"])
  {
    unint64_t v4 = 4;
    goto LABEL_4;
  }
  if (([v3 containsString:@"bnns"] & 1) != 0
    || ([v3 containsString:@"e5_minimal_cpu"] & 1) != 0)
  {
LABEL_3:
    unint64_t v4 = 1;
  }
  else
  {
    uint64_t v6 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_error_impl(&dword_19E58B000, v6, OS_LOG_TYPE_ERROR, "Internal error, unsupported backend with name=%@.", (uint8_t *)&v7, 0xCu);
    }

    unint64_t v4 = 0;
  }
LABEL_4:

  return v4;
}

- (id)_classProbabilitiesInOutputFeatures:(id)a3 error:(id *)a4
{
  v59[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [(MLE5Engine *)self classProbabilitiesFeatureName];
  id v8 = [v6 featureValueForName:v7];

  if (v8)
  {
    if ([v8 type] == 5)
    {
      id v9 = [v8 multiArrayValue];
      uint64_t v10 = [v9 count];
      long long v11 = [(MLE5Engine *)self classLabels];
      uint64_t v12 = [v11 count];

      if (v10 == v12)
      {
        if ([v9 dataType] == 65552
          || [v9 dataType] == 65568
          || [v9 dataType] == 65600)
        {
          id v9 = v9;
          a4 = (id *)v9;
LABEL_21:

          goto LABEL_22;
        }
        v34 = +[MLLogging coreChannel];
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          v45 = [(MLE5Engine *)self classProbabilitiesFeatureName];
          *(_DWORD *)buf = 138412290;
          v51 = v45;
          _os_log_error_impl(&dword_19E58B000, v34, OS_LOG_TYPE_ERROR, "Class probability feature named %@ must be a MLMultiArray of Float16, Float32 or Float64.", buf, 0xCu);
        }
        if (!a4) {
          goto LABEL_21;
        }
        v35 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v46 = *MEMORY[0x1E4F28568];
        double v36 = NSString;
        double v37 = [(MLE5Engine *)self classProbabilitiesFeatureName];
        v38 = [v36 stringWithFormat:@"Class probability feature named %@ must be a MLMultiArray of Float16, Float32 or Float64.", v37];
        v47 = v38;
        v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
        *a4 = [v35 errorWithDomain:@"com.apple.CoreML" code:1 userInfo:v39];
      }
      else
      {
        long long v24 = +[MLLogging coreChannel];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v42 = [(MLE5Engine *)self classProbabilitiesFeatureName];
          uint64_t v43 = [v9 count];
          v44 = [(MLE5Engine *)self classLabels];
          *(_DWORD *)buf = 138412802;
          v51 = v42;
          __int16 v52 = 2048;
          uint64_t v53 = v43;
          __int16 v54 = 2048;
          uint64_t v55 = [v44 count];
          _os_log_error_impl(&dword_19E58B000, v24, OS_LOG_TYPE_ERROR, "Class probability feature named %@ has %tu classes, but there are %zd class labels.", buf, 0x20u);
        }
        if (!a4) {
          goto LABEL_21;
        }
        uint64_t v25 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v48 = *MEMORY[0x1E4F28568];
        uint64_t v26 = NSString;
        id v27 = [(MLE5Engine *)self classProbabilitiesFeatureName];
        uint64_t v28 = [v9 count];
        uint64_t v29 = [(MLE5Engine *)self classLabels];
        v30 = [v26 stringWithFormat:@"Class probability feature named %@ has %tu classes, but there are %zd class labels.", v27, v28, objc_msgSend(v29, "count")];
        v49 = v30;
        uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
        *a4 = [v25 errorWithDomain:@"com.apple.CoreML" code:1 userInfo:v31];
      }
LABEL_20:
      a4 = 0;
      goto LABEL_21;
    }
    unint64_t v18 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v40 = [(MLE5Engine *)self classProbabilitiesFeatureName];
      v41 = +[MLFeatureTypeUtils descriptionForType:](MLFeatureTypeUtils, "descriptionForType:", [v8 type]);
      *(_DWORD *)buf = 138412546;
      v51 = v40;
      __int16 v52 = 2112;
      uint64_t v53 = (uint64_t)v41;
      _os_log_error_impl(&dword_19E58B000, v18, OS_LOG_TYPE_ERROR, "Output feature named %@ is supposed to be a MLMultiArray representing class probabilities but it is %@.", buf, 0x16u);
    }
    if (a4)
    {
      uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v56 = *MEMORY[0x1E4F28568];
      id v20 = NSString;
      id v9 = [(MLE5Engine *)self classProbabilitiesFeatureName];
      long long v21 = +[MLFeatureTypeUtils descriptionForType:](MLFeatureTypeUtils, "descriptionForType:", [v8 type]);
      long long v22 = [v20 stringWithFormat:@"Output feature named %@ is supposed to be a MLMultiArray representing class probabilities but it is %@.", v9, v21];
      uint64_t v57 = v22;
      long long v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
      *a4 = [v19 errorWithDomain:@"com.apple.CoreML" code:1 userInfo:v23];

      goto LABEL_20;
    }
  }
  else
  {
    long long v13 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v33 = [(MLE5Engine *)self classProbabilitiesFeatureName];
      *(_DWORD *)buf = 138412290;
      v51 = v33;
      _os_log_error_impl(&dword_19E58B000, v13, OS_LOG_TYPE_ERROR, "There is no output feature named %@.", buf, 0xCu);
    }
    if (a4)
    {
      unint64_t v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v58 = *MEMORY[0x1E4F28568];
      uint64_t v15 = NSString;
      id v9 = [(MLE5Engine *)self classProbabilitiesFeatureName];
      double v16 = [v15 stringWithFormat:@"There is no output feature named %@.", v9];
      v59[0] = v16;
      uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:&v58 count:1];
      *a4 = [v14 errorWithDomain:@"com.apple.CoreML" code:1 userInfo:v17];

      goto LABEL_20;
    }
  }
LABEL_22:

  return a4;
}

- (id)_probabilityDictionaryWithMultiArray:(id)a3 classifyTopK:(int64_t)a4
{
  id v6 = a3;
  int v7 = [(MLE5Engine *)self classLabels];
  std::vector<unsigned long>::vector(&__p, [v7 count]);

  id v9 = __p;
  id v8 = v27;
  if (__p != v27)
  {
    uint64_t v10 = 0;
    long long v11 = __p;
    do
      *v11++ = v10++;
    while (v11 != v8);
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __64__MLE5Engine__probabilityDictionaryWithMultiArray_classifyTopK___block_invoke;
  v21[3] = &unk_1E59A4B30;
  id v12 = v6;
  id v22 = v12;
  long long v23 = v9;
  long long v24 = &v9[a4];
  uint64_t v25 = v8;
  [v12 getBytesWithHandler:v21];
  long long v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a4];
  unint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a4];
  if (a4)
  {
    int64_t v15 = 8 * a4;
    do
    {
      double v16 = [(MLE5Engine *)self classLabels];
      uint64_t v17 = [v16 objectAtIndexedSubscript:*v9];
      [v13 addObject:v17];

      unint64_t v18 = [v12 objectAtIndexedSubscript:*v9];
      [v14 addObject:v18];

      ++v9;
      v15 -= 8;
    }
    while (v15);
  }
  uint64_t v19 = [[MLProbabilityDictionary alloc] initWithLabels:v13 probabilityArray:v14];

  if (__p)
  {
    id v27 = __p;
    operator delete(__p);
  }

  return v19;
}

uint64_t __64__MLE5Engine__probabilityDictionaryWithMultiArray_classifyTopK___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) dataType];
  if (result == 65568)
  {
    id v6 = *(uint64_t **)(a1 + 48);
    unint64_t v5 = *(uint64_t **)(a1 + 56);
    if (v6 == v5) {
      return result;
    }
    int v7 = *(uint64_t **)(a1 + 40);
    while (1)
    {
      unint64_t v8 = v5 - v7;
      if (v8 < 2) {
        return result;
      }
      if (v8 == 3)
      {
        return _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZZ64__MLE5Engine__probabilityDictionaryWithMultiArray_classifyTopK__EUb_E3__0NS_11__wrap_iterIPmEEEEjT1_S7_S7_T0_(v7, v7 + 1, v5 - 1, a2);
      }
      if (v8 == 2) {
        break;
      }
      if ((char *)v5 - (char *)v7 <= 63)
      {
        if (v5 - 1 == v7) {
          return result;
        }
        while (2)
        {
          v76 = v5;
          if (v7 == v5)
          {
LABEL_121:
            if (v76 != v7)
            {
              uint64_t v82 = *v7;
              *int v7 = *v76;
              uint64_t *v76 = v82;
            }
          }
          else
          {
            v77 = v7 + 1;
            if (v7 + 1 != v5)
            {
              uint64_t v78 = *v7;
              v76 = v7;
              v79 = v7 + 1;
              do
              {
                uint64_t v81 = *v79++;
                uint64_t v80 = v81;
                if (*(float *)(a2 + 4 * v81) > *(float *)(a2 + 4 * v78))
                {
                  uint64_t v78 = v80;
                  v76 = v77;
                }
                v77 = v79;
              }
              while (v79 != v5);
              goto LABEL_121;
            }
          }
          if (++v7 == v5 - 1) {
            return result;
          }
          continue;
        }
      }
      id v9 = &v7[v8 >> 1];
      uint64_t v10 = v5 - 1;
      uint64_t result = _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZZ64__MLE5Engine__probabilityDictionaryWithMultiArray_classifyTopK__EUb_E3__0NS_11__wrap_iterIPmEEEEjT1_S7_S7_T0_(v7, v9, v5 - 1, a2);
      uint64_t v11 = *v7;
      float v12 = *(float *)(a2 + 4 * *v7);
      float v13 = *(float *)(a2 + 4 * *v9);
      if (v12 > v13)
      {
LABEL_13:
        unint64_t v18 = v7 + 1;
        if (v7 + 1 >= v10)
        {
          long long v21 = v7 + 1;
        }
        else
        {
          uint64_t v19 = v7 + 1;
          while (1)
          {
            float v20 = *(float *)(a2 + 4 * *v9);
            do
            {
              long long v21 = v19;
              uint64_t v23 = *v19++;
              uint64_t v22 = v23;
            }
            while (*(float *)(a2 + 4 * v23) > v20);
            do
            {
              uint64_t v25 = *--v10;
              uint64_t v24 = v25;
            }
            while (*(float *)(a2 + 4 * v25) <= v20);
            if (v21 >= v10) {
              break;
            }
            uint64_t *v21 = v24;
            uint64_t *v10 = v22;
            uint64_t result = (result + 1);
            if (v9 == v21) {
              id v9 = v10;
            }
          }
        }
        if (v21 != v9)
        {
          uint64_t v26 = *v21;
          if (*(float *)(a2 + 4 * *v9) > *(float *)(a2 + 4 * *v21))
          {
            uint64_t *v21 = *v9;
            *id v9 = v26;
            uint64_t result = (result + 1);
          }
        }
        if (v21 == v6) {
          return result;
        }
        if (!result)
        {
          if (v21 <= v6)
          {
            unint64_t v32 = v21 + 1;
            while (v32 != v5)
            {
              float v33 = *(float *)(a2 + 4 * *v32);
              float v34 = *(float *)(a2 + 4 * *(v32++ - 1));
              if (v33 > v34) {
                goto LABEL_28;
              }
            }
          }
          else
          {
            while (v18 != v21)
            {
              float v28 = *(float *)(a2 + 4 * *v18);
              float v29 = *(float *)(a2 + 4 * *(v18++ - 1));
              if (v28 > v29) {
                goto LABEL_28;
              }
            }
          }
          return result;
        }
LABEL_28:
        if (v21 <= v6)
        {
          id v27 = v21 + 1;
        }
        else
        {
          unint64_t v5 = v21;
          id v27 = v7;
        }
      }
      else
      {
        unint64_t v14 = v5 - 2;
        while (v14 != v7)
        {
          int64_t v15 = v14;
          uint64_t v17 = *v14--;
          uint64_t v16 = v17;
          if (*(float *)(a2 + 4 * v17) > v13)
          {
            *int v7 = v16;
            uint64_t *v15 = v11;
            uint64_t result = (result + 1);
            uint64_t v10 = v15;
            goto LABEL_13;
          }
        }
        v30 = v7 + 1;
        if (v12 <= *(float *)(a2 + 4 * *v10))
        {
          while (v30 != v10)
          {
            uint64_t v31 = *v30;
            if (v12 > *(float *)(a2 + 4 * *v30))
            {
              *v30++ = *v10;
              uint64_t *v10 = v31;
              goto LABEL_44;
            }
            ++v30;
          }
          return result;
        }
LABEL_44:
        if (v30 == v10) {
          return result;
        }
        while (1)
        {
          float v35 = *(float *)(a2 + 4 * *v7);
          do
          {
            id v27 = v30;
            uint64_t v37 = *v30++;
            uint64_t v36 = v37;
          }
          while (v35 <= *(float *)(a2 + 4 * v37));
          do
          {
            uint64_t v39 = *--v10;
            uint64_t v38 = v39;
          }
          while (v35 > *(float *)(a2 + 4 * v39));
          if (v27 >= v10) {
            break;
          }
          *id v27 = v38;
          uint64_t *v10 = v36;
        }
        if (v27 > v6) {
          return result;
        }
      }
      int v7 = v27;
      if (v5 == v6) {
        return result;
      }
    }
    uint64_t v74 = *(v5 - 1);
    uint64_t v75 = *v7;
    if (*(float *)(a2 + 4 * v74) <= *(float *)(a2 + 4 * *v7)) {
      return result;
    }
LABEL_129:
    *int v7 = v74;
    *(v5 - 1) = v75;
    return result;
  }
  uint64_t result = [*(id *)(a1 + 32) dataType];
  if (result != 65600)
  {
    unint64_t v73 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
    {
      v90[0] = 0;
      _os_log_error_impl(&dword_19E58B000, v73, OS_LOG_TYPE_ERROR, "MLMultiArray for class probabilities must be Float64 or Float32.", (uint8_t *)v90, 2u);
    }

    return [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"MLMultiArray for class probabilities must be Float64 or Float32."];
  }
  v40 = *(uint64_t **)(a1 + 48);
  unint64_t v5 = *(uint64_t **)(a1 + 56);
  if (v40 == v5) {
    return result;
  }
  int v7 = *(uint64_t **)(a1 + 40);
LABEL_56:
  unint64_t v41 = v5 - v7;
  if (v41 < 2) {
    return result;
  }
  if (v41 == 3)
  {
    return std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MLTreeEnsembleClassifier _buildClassificationClasses:topk:error:]::$_1 &,std::__wrap_iter<unsigned long *>>(v7, v7 + 1, v5 - 1, a2);
  }
  if (v41 == 2)
  {
    uint64_t v74 = *(v5 - 1);
    uint64_t v75 = *v7;
    if (*(double *)(a2 + 8 * v74) <= *(double *)(a2 + 8 * *v7)) {
      return result;
    }
    goto LABEL_129;
  }
  if ((char *)v5 - (char *)v7 <= 63)
  {
    if (v5 - 1 == v7) {
      return result;
    }
    while (1)
    {
      long long v83 = v5;
      if (v7 == v5) {
        goto LABEL_137;
      }
      long long v84 = v7 + 1;
      if (v7 + 1 != v5) {
        break;
      }
LABEL_139:
      if (++v7 == v5 - 1) {
        return result;
      }
    }
    uint64_t v85 = *v7;
    long long v83 = v7;
    long long v86 = v7 + 1;
    do
    {
      uint64_t v88 = *v86++;
      uint64_t v87 = v88;
      if (*(double *)(a2 + 8 * v88) > *(double *)(a2 + 8 * v85))
      {
        uint64_t v85 = v87;
        long long v83 = v84;
      }
      long long v84 = v86;
    }
    while (v86 != v5);
LABEL_137:
    if (v83 != v7)
    {
      uint64_t v89 = *v7;
      *int v7 = *v83;
      *long long v83 = v89;
    }
    goto LABEL_139;
  }
  v42 = &v7[v41 >> 1];
  uint64_t v43 = v5 - 1;
  uint64_t result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MLTreeEnsembleClassifier _buildClassificationClasses:topk:error:]::$_1 &,std::__wrap_iter<unsigned long *>>(v7, v42, v5 - 1, a2);
  uint64_t v44 = *v7;
  double v45 = *(double *)(a2 + 8 * *v7);
  double v46 = *(double *)(a2 + 8 * *v42);
  if (v45 > v46) {
    goto LABEL_65;
  }
  v47 = v5 - 2;
  while (v47 != v7)
  {
    uint64_t v48 = v47;
    uint64_t v50 = *v47--;
    uint64_t v49 = v50;
    if (*(double *)(a2 + 8 * v50) > v46)
    {
      *int v7 = v49;
      uint64_t *v48 = v44;
      uint64_t result = (result + 1);
      uint64_t v43 = v48;
LABEL_65:
      v51 = v7 + 1;
      if (v7 + 1 >= v43)
      {
        __int16 v54 = v7 + 1;
      }
      else
      {
        __int16 v52 = v7 + 1;
        while (1)
        {
          double v53 = *(double *)(a2 + 8 * *v42);
          do
          {
            __int16 v54 = v52;
            uint64_t v56 = *v52++;
            uint64_t v55 = v56;
          }
          while (*(double *)(a2 + 8 * v56) > v53);
          do
          {
            uint64_t v58 = *--v43;
            uint64_t v57 = v58;
          }
          while (*(double *)(a2 + 8 * v58) <= v53);
          if (v54 >= v43) {
            break;
          }
          uint64_t *v54 = v57;
          uint64_t *v43 = v55;
          uint64_t result = (result + 1);
          if (v42 == v54) {
            v42 = v43;
          }
        }
      }
      if (v54 != v42)
      {
        uint64_t v59 = *v54;
        if (*(double *)(a2 + 8 * *v42) > *(double *)(a2 + 8 * *v54))
        {
          uint64_t *v54 = *v42;
          uint64_t *v42 = v59;
          uint64_t result = (result + 1);
        }
      }
      if (v54 == v40) {
        return result;
      }
      if (!result)
      {
        if (v54 <= v40)
        {
          uint64_t v65 = v54 + 1;
          do
          {
            if (v65 == v5) {
              return result;
            }
            double v66 = *(double *)(a2 + 8 * *v65);
            double v67 = *(double *)(a2 + 8 * *(v65++ - 1));
          }
          while (v66 <= v67);
        }
        else
        {
          do
          {
            if (v51 == v54) {
              return result;
            }
            double v61 = *(double *)(a2 + 8 * *v51);
            double v62 = *(double *)(a2 + 8 * *(v51++ - 1));
          }
          while (v61 <= v62);
        }
      }
      if (v54 <= v40)
      {
        uint64_t v60 = v54 + 1;
      }
      else
      {
        unint64_t v5 = v54;
        uint64_t v60 = v7;
      }
LABEL_103:
      int v7 = v60;
      if (v5 == v40) {
        return result;
      }
      goto LABEL_56;
    }
  }
  uint64_t v63 = v7 + 1;
  if (v45 <= *(double *)(a2 + 8 * *v43))
  {
    while (1)
    {
      if (v63 == v43) {
        return result;
      }
      uint64_t v64 = *v63;
      if (v45 > *(double *)(a2 + 8 * *v63)) {
        break;
      }
      ++v63;
    }
    *v63++ = *v43;
    uint64_t *v43 = v64;
  }
  if (v63 != v43)
  {
    while (1)
    {
      double v68 = *(double *)(a2 + 8 * *v7);
      do
      {
        uint64_t v60 = v63;
        uint64_t v70 = *v63++;
        uint64_t v69 = v70;
      }
      while (v68 <= *(double *)(a2 + 8 * v70));
      do
      {
        uint64_t v72 = *--v43;
        uint64_t v71 = v72;
      }
      while (v68 > *(double *)(a2 + 8 * v72));
      if (v60 >= v43) {
        break;
      }
      *uint64_t v60 = v71;
      uint64_t *v43 = v69;
    }
    if (v60 <= v40) {
      goto LABEL_103;
    }
  }
  return result;
}

- (id)_classifierResultFromOutputFeatures:(id)a3 classifyTopK:(unint64_t)a4 error:(id *)a5
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = [(MLE5Engine *)self _classProbabilitiesInOutputFeatures:v8 error:a5];
  if (v9)
  {
    uint64_t v10 = [(MLE5Engine *)self classLabels];
    unint64_t v11 = [v10 count];
    if (v11 >= a4) {
      unint64_t v12 = a4;
    }
    else {
      unint64_t v12 = v11;
    }

    if (v12)
    {
      float v13 = [(MLE5Engine *)self classLabels];
      uint64_t v14 = [v13 count];

      if (v12 == v14)
      {
        int64_t v15 = [MLProbabilityDictionary alloc];
        uint64_t v16 = [(MLE5Engine *)self classLabelsSharedKey];
        uint64_t v17 = [(MLProbabilityDictionary *)v15 initWithSharedKeySet:v16 probabilityMultiArray:v9];
      }
      else
      {
        uint64_t v17 = [(MLE5Engine *)self _probabilityDictionaryWithMultiArray:v9 classifyTopK:v12];
      }
      uint64_t v23 = [(MLProbabilityDictionary *)v17 classLabelOfMaxProbability];
      uint64_t v22 = +[MLClassifierResult resultWithClassProbability:v17 additionalFeatures:v8 classLabelOfMaxProbability:v23];

      goto LABEL_15;
    }
    unint64_t v18 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v25 = 0;
      _os_log_error_impl(&dword_19E58B000, v18, OS_LOG_TYPE_ERROR, "There must be at least one class to return.", v25, 2u);
    }

    if (a5)
    {
      uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v26 = *MEMORY[0x1E4F28568];
      float v20 = [NSString stringWithFormat:@"There must be at least one class to return."];
      v27[0] = v20;
      long long v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
      *a5 = [v19 errorWithDomain:@"com.apple.CoreML" code:1 userInfo:v21];
    }
  }
  uint64_t v22 = 0;
LABEL_15:

  return v22;
}

- (id)classify:(id)a3 options:(id)a4 error:(id *)a5
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  kdebug_trace();
  uint64_t v10 = [(MLModelEngine *)self modelDescription];
  unint64_t v11 = [v10 predictedFeatureName];

  if (v11)
  {
    unint64_t v12 = [(MLE5Engine *)self classLabels];

    if (v12)
    {
      float v13 = [(MLE5Engine *)self predictionFromFeatures:v8 options:v9 error:a5];
      if (v13)
      {
        -[MLE5Engine _classifierResultFromOutputFeatures:classifyTopK:error:](self, "_classifierResultFromOutputFeatures:classifyTopK:error:", v13, [v9 classifyTopK], a5);
        a5 = (id *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        a5 = 0;
      }

      goto LABEL_16;
    }
    unint64_t v18 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v23 = 0;
      _os_log_error_impl(&dword_19E58B000, v18, OS_LOG_TYPE_ERROR, "Unable to classify the input because the model description doesn't have class labels.", v23, 2u);
    }

    if (a5)
    {
      uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v24 = *MEMORY[0x1E4F28568];
      float v20 = [NSString stringWithFormat:@"Unable to classify the input because the model description doesn't have class labels."];
      uint64_t v25 = v20;
      long long v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      *a5 = [v19 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v21];

      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v14 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v23 = 0;
      _os_log_error_impl(&dword_19E58B000, v14, OS_LOG_TYPE_ERROR, "Unable to classify the input because the model description doesn't have predictedFeatureName property.", v23, 2u);
    }

    if (a5)
    {
      int64_t v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v26 = *MEMORY[0x1E4F28568];
      uint64_t v16 = [NSString stringWithFormat:@"Unable to classify the input because the model description doesn't have predictedFeatureName property."];
      v27[0] = v16;
      uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
      *a5 = [v15 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v17];

LABEL_13:
      a5 = 0;
    }
  }
LABEL_16:
  kdebug_trace();

  return a5;
}

- (id)classLabels
{
  v2 = [(MLModelEngine *)self modelDescription];
  id v3 = [v2 classLabels];

  return v3;
}

- (id)newContextAndReturnError:(id *)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  unint64_t v4 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v9 = 0;
    _os_log_error_impl(&dword_19E58B000, v4, OS_LOG_TYPE_ERROR, "The implementation doesn't support model training.", v9, 2u);
  }

  if (a3)
  {
    unint64_t v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F28568];
    id v6 = [NSString stringWithFormat:@"The implementation doesn't support model training."];
    v11[0] = v6;
    int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    *a3 = [v5 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v7];
  }
  return 0;
}

- (id)evaluateFunction:(id)a3 arguments:(id)a4 error:(id *)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [NSString stringWithUTF8String:"main"];
  char v11 = [v8 isEqualToString:v10];

  if ((v11 & 1) == 0)
  {
    unint64_t v12 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v25 = v8;
      __int16 v26 = 2080;
      id v27 = "main";
      _os_log_error_impl(&dword_19E58B000, v12, OS_LOG_TYPE_ERROR, "Unable to evaluate the function named %@ because the implementation supports only %s function.", buf, 0x16u);
    }

    if (a5)
    {
      float v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v22 = *MEMORY[0x1E4F28568];
      uint64_t v14 = [NSString stringWithFormat:@"Unable to evaluate the function named %@ because the implementation supports only %s function.", v8, "main"];
      uint64_t v23 = v14;
      int64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      *a5 = [v13 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v15];
    }
  }
  uint64_t v16 = (void *)MEMORY[0x19F3C29E0]();
  uint64_t v17 = +[MLPredictionOptions defaultOptions];
  id v21 = 0;
  unint64_t v18 = [(MLE5Engine *)self _predictionFromFeatures:v9 options:v17 error:&v21];
  id v19 = v21;

  if (a5 && !v18) {
    *a5 = v19;
  }

  return v18;
}

- (NSString)serializedMILText
{
  v2 = [(MLE5Engine *)self programLibrary];
  id v3 = [v2 serializedMILText];

  return (NSString *)v3;
}

- (id)newStateWithClientBuffers:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(MLModelEngine *)self modelDescription];
  id v6 = [v5 stateDescriptionsByName];

  int v7 = [(MLE5Engine *)self programLibrary];
  id v8 = [(MLE5Engine *)self functionName];
  id v9 = [v6 allKeys];
  id v17 = 0;
  uint64_t v10 = (void *)[v7 newStateForFunctionNamed:v8 stateNames:v9 clientBuffers:v4 error:&v17];
  id v11 = v17;

  if (!v10)
  {
    unint64_t v12 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = [v11 localizedDescription];
      *(_DWORD *)buf = 138412290;
      id v19 = v16;
      _os_log_error_impl(&dword_19E58B000, v12, OS_LOG_TYPE_ERROR, "Failed to create state with error: %@", buf, 0xCu);
    }
    float v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = [v11 localizedDescription];
    [v13 raise:*MEMORY[0x1E4F1C3B8], @"Failed to create state with error: %@", v14 format];
  }
  return v10;
}

- (id)_outputFeaturesByAddingClassifierResultTo:(id)a3 classifyTopK:(unint64_t)a4 error:(id *)a5
{
  id v6 = [(MLE5Engine *)self _classifierResultFromOutputFeatures:a3 classifyTopK:a4 error:a5];
  if (v6)
  {
    int v7 = [(MLModelEngine *)self modelDescription];
    id v8 = [v7 predictedClassFeatureDescription];
    id v9 = [(MLModelEngine *)self modelDescription];
    uint64_t v10 = [v9 classProbabilityFeatureDescription];
    id v11 = [v6 asFeatureDictionaryWithPredictedClassDescription:v8 classProbabilityDescription:v10];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void)_cleanUpStream:(id)a3
{
}

- (id)_postProcessingForOutputs:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(MLE5Engine *)self classLabels];

  if (v8 && v10)
  {
    kdebug_trace();
    uint64_t v11 = -[MLE5Engine _outputFeaturesByAddingClassifierResultTo:classifyTopK:error:](self, "_outputFeaturesByAddingClassifierResultTo:classifyTopK:error:", v8, [v9 classifyTopK], a5);

    kdebug_trace();
    id v8 = (id)v11;
  }

  return v8;
}

- (id)predictionsFromBatch:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v25 = a4;
  __int16 v26 = v7;
  uint64_t v8 = [v7 count];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v8];
  if (v8)
  {
    uint64_t v10 = v8;
    do
    {
      uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
      [v9 addObject:v11];

      --v10;
    }
    while (v10);
  }
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000;
  uint64_t v38 = __Block_byref_object_copy__16978;
  uint64_t v39 = __Block_byref_object_dispose__16979;
  id v40 = 0;
  unint64_t v12 = [(MLE5Engine *)self batchMaxInFlightSem];
  float v13 = dispatch_group_create();
  uint64_t v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v24 = dispatch_queue_create("com.apple.coreml.MLE5BatchPredictionQueue", v14);

  if (v8)
  {
    uint64_t v15 = 0;
    while (1)
    {
      uint64_t v16 = [v26 featuresAtIndex:v15];
      id v17 = [(MLE5Engine *)self inputFeatureConformer];
      unint64_t v18 = (id *)(v36 + 5);
      obuint64_t j = (id)v36[5];
      id v19 = [v17 conformFeatures:v16 error:&obj];
      objc_storeStrong(v18, obj);

      if (!v19) {
        break;
      }
      dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_group_enter(v13);
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      void v27[2] = __49__MLE5Engine_predictionsFromBatch_options_error___block_invoke;
      v27[3] = &unk_1E59A4B08;
      uint64_t v28 = v24;
      unint64_t v32 = &v35;
      id v29 = v9;
      uint64_t v33 = v15;
      v30 = v13;
      uint64_t v31 = v12;
      [(MLE5Engine *)self _predictionFromFeatures:v19 options:v25 completionHandler:v27];

      if (v8 == ++v15) {
        goto LABEL_10;
      }
    }
  }
LABEL_10:
  dispatch_group_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v20 = (void *)v36[5];
  if (v20)
  {
    id v21 = 0;
    if (a5) {
      *a5 = v20;
    }
  }
  else
  {
    id v21 = [[MLArrayBatchProvider alloc] initWithFeatureProviderArray:v9];
  }

  _Block_object_dispose(&v35, 8);

  return v21;
}

void __49__MLE5Engine_predictionsFromBatch_options_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__MLE5Engine_predictionsFromBatch_options_error___block_invoke_2;
  block[3] = &unk_1E59A4AE0;
  uint64_t v18 = *(void *)(a1 + 64);
  id v13 = v5;
  id v14 = v6;
  id v7 = *(NSObject **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 72);
  id v15 = v8;
  uint64_t v19 = v9;
  id v16 = *(id *)(a1 + 48);
  id v17 = *(id *)(a1 + 56);
  id v10 = v6;
  id v11 = v5;
  dispatch_sync(v7, block);
}

intptr_t __49__MLE5Engine_predictionsFromBatch_options_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    [*(id *)(a1 + 48) setObject:v2 atIndexedSubscript:*(void *)(a1 + 80)];
  }
  else
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v5 = *(void *)(v3 + 40);
    id v4 = (id *)(v3 + 40);
    if (!v5) {
      objc_storeStrong(v4, *(id *)(a1 + 40));
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
  id v6 = *(NSObject **)(a1 + 64);

  return dispatch_semaphore_signal(v6);
}

- (void)_predictionFromFeatures:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, id))a5;
  id v11 = [(MLE5Engine *)self streamPool];
  unint64_t v12 = [v11 takeOut];

  uint64_t v13 = [v12 reusableForAsyncSubmissionForInputFeatures:v8 options:v9];
  id v14 = [v9 e5rtStreamReuseExpectation];
  id v29 = 0;
  BOOL v15 = [(MLE5Engine *)self _validateStreamReuse:v13 expectation:v14 error:&v29];
  id v16 = v29;

  if (v15)
  {
    if ((v13 & 1) == 0)
    {
      id v28 = v16;
      BOOL v17 = [(MLE5Engine *)self _cleanUpAndReconfigureStream:v12 forInputFeatures:v8 error:&v28];
      id v18 = v28;

      if (!v17)
      {
        uint64_t v22 = [(MLE5Engine *)self streamPool];
        [v22 putBack:v12];

        id v16 = v18;
        v10[2](v10, 0, v18);
        goto LABEL_10;
      }
      id v16 = v18;
    }
    id v27 = v16;
    char v19 = [v12 prepareAsyncSubmissionForInputFeatures:v8 options:v9 error:&v27];
    id v20 = v27;

    if (v19)
    {
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      void v23[2] = __64__MLE5Engine__predictionFromFeatures_options_completionHandler___block_invoke;
      v23[3] = &unk_1E59A4AB8;
      v23[4] = self;
      id v24 = v9;
      id v25 = v12;
      __int16 v26 = v10;
      [v25 submitWithCompletionHandler:v23];

      id v16 = v20;
    }
    else
    {
      [(MLE5Engine *)self _cleanUpStream:v12];
      id v21 = [(MLE5Engine *)self streamPool];
      [v21 putBack:v12];

      id v16 = v20;
      v10[2](v10, 0, v20);
    }
  }
  else
  {
    [(MLE5Engine *)self _cleanUpStream:v12];
    v10[2](v10, 0, v16);
  }
LABEL_10:
}

void __64__MLE5Engine__predictionFromFeatures_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v21 = v6;
  id v9 = [v7 _postProcessingForOutputs:v5 options:v8 error:&v21];
  id v10 = v21;

  if (v9)
  {
    if ([*(id *)(a1 + 40) hasDirectBindingExpectations])
    {
      id v11 = [*(id *)(a1 + 48) operations];
      unint64_t v12 = [v11 objectAtIndexedSubscript:0];

      uint64_t v13 = [v12 directlyBoundInputFeatureNames];
      id v14 = [v12 directlyBoundOutputFeatureNames];
      BOOL v15 = *(void **)(a1 + 40);
      id v20 = v10;
      char v16 = [v15 validateExpectationsWithDirectlyBoundInputs:v13 outputs:v14 error:&v20];
      id v17 = v20;

      if ((v16 & 1) == 0)
      {

        id v9 = 0;
      }

      id v10 = v17;
    }
    id v18 = v9;
  }
  else
  {
    id v18 = 0;
  }
  char v19 = [*(id *)(a1 + 32) streamPool];
  [v19 putBack:*(void *)(a1 + 48)];

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)submitPredictionRequest:(id)a3 completionHandler:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x19F3C29E0]();
  uint64_t v8 = [v10 inputFeatures];
  id v9 = [v10 predictionOptions];
  [(MLE5Engine *)self _predictionFromFeatures:v8 options:v9 completionHandler:v6];
}

- (id)_newRequestForModel:(id)a3 inputFeatures:(id)a4 usingState:(id)a5 options:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  BOOL v15 = [(MLE5Engine *)self _conformInputFeatures:a4 error:a7];
  if (!v15) {
    goto LABEL_6;
  }
  id v16 = +[MLState emptyState];

  if (v16 != v13)
  {
    id v17 = [(MLE5Engine *)self _conformState:v13 error:a7];
    if (v17)
    {
      uint64_t v18 = +[MLFeatureProviderUtils lazyProviderWithFeaturesProvidedBy:v17 addedToFeaturesProvidedBy:v15];

      BOOL v15 = (void *)v18;
      goto LABEL_5;
    }
LABEL_6:
    id v19 = 0;
    goto LABEL_7;
  }
LABEL_5:
  v21.receiver = self;
  v21.super_class = (Class)MLE5Engine;
  id v19 = [(MLModelEngine *)&v21 newRequestForModel:v12 inputFeatures:v15 options:v14 error:a7];
LABEL_7:

  return v19;
}

- (id)newRequestForModel:(id)a3 inputFeatures:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = +[MLState emptyState];
  id v14 = [(MLE5Engine *)self _newRequestForModel:v10 inputFeatures:v11 usingState:v13 options:v12 error:a6];

  return v14;
}

- (id)_predictionFromFeatures:(id)a3 stream:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  if (![v10 executeForInputFeatures:a3 options:v11 error:a6])
  {
    id v15 = 0;
    goto LABEL_7;
  }
  id v12 = [v10 operations];
  id v13 = [v12 objectAtIndexedSubscript:0];

  id v14 = [v13 outputFeatures];
  id v15 = [(MLE5Engine *)self _postProcessingForOutputs:v14 options:v11 error:a6];

  if (!v15
    || ![v11 hasDirectBindingExpectations]
    || ([v13 directlyBoundInputFeatureNames],
        id v16 = objc_claimAutoreleasedReturnValue(),
        [v13 directlyBoundOutputFeatureNames],
        id v17 = objc_claimAutoreleasedReturnValue(),
        char v18 = [v11 validateExpectationsWithDirectlyBoundInputs:v16 outputs:v17 error:a6],
        v17,
        v16,
        (v18 & 1) != 0))
  {

LABEL_7:
    id v15 = v15;
    id v19 = v15;
    goto LABEL_8;
  }

  id v19 = 0;
LABEL_8:

  return v19;
}

- (id)_predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(MLE5Engine *)self streamPool];
  id v11 = [v10 takeOut];

  uint64_t v12 = [v11 reusableForSyncPredictionForInputFeatures:v8 options:v9];
  id v13 = [v9 e5rtStreamReuseExpectation];
  BOOL v14 = [(MLE5Engine *)self _validateStreamReuse:v12 expectation:v13 error:a5];

  if (v14)
  {
    if ((v12 & 1) != 0
      || [(MLE5Engine *)self _cleanUpAndReconfigureStream:v11 forInputFeatures:v8 error:a5])
    {
      id v15 = [(MLE5Engine *)self _predictionFromFeatures:v8 stream:v11 options:v9 error:a5];
      id v16 = [(MLE5Engine *)self streamPool];
      [v16 putBack:v11];
    }
    else
    {
      id v16 = [(MLE5Engine *)self streamPool];
      [v16 putBack:v11];
      id v15 = 0;
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (BOOL)_cleanUpAndReconfigureStream:(id)a3 forInputFeatures:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  [(MLE5Engine *)self _cleanUpStream:v8];
  id v10 = [(MLE5Engine *)self operationPool];
  LOBYTE(a5) = [v8 setupOperationForInputFeatures:v9 operationPool:v10 error:a5];

  return (char)a5;
}

- (BOOL)_validateStreamReuse:(BOOL)a3 expectation:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  v24[1] = *MEMORY[0x1E4F143B8];
  id v7 = (__CFString *)a4;
  id v8 = v7;
  if (v7 == @"MLE5EngineStreamReuseExpectationNever" && v6)
  {
    id v16 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v20 = 0;
      _os_log_error_impl(&dword_19E58B000, v16, OS_LOG_TYPE_ERROR, "MLE5Engine unexpectedly reused the E5 stream.", v20, 2u);
    }

    if (!a5) {
      goto LABEL_17;
    }
    char v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    id v13 = [NSString stringWithFormat:@"MLE5Engine unexpectedly reused the E5 stream."];
    v24[0] = v13;
    BOOL v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    id v15 = [v18 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v14];
LABEL_16:
    *a5 = v15;

LABEL_17:
    BOOL v10 = 0;
    goto LABEL_18;
  }
  BOOL v10 = 1;
  if (v7 == @"MLE5EngineStreamReuseExpectationAlways" && !v6)
  {
    id v11 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v20 = 0;
      _os_log_error_impl(&dword_19E58B000, v11, OS_LOG_TYPE_ERROR, "MLE5Engine unexpectedly didn't reuse the E5 stream.", v20, 2u);
    }

    if (!a5) {
      goto LABEL_17;
    }
    uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v21 = *MEMORY[0x1E4F28568];
    id v13 = [NSString stringWithFormat:@"MLE5Engine unexpectedly didn't reuse the E5 stream."];
    uint64_t v22 = v13;
    BOOL v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    id v15 = [v12 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v14];
    goto LABEL_16;
  }
LABEL_18:

  return v10;
}

- (id)_conformState:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = [(MLModelEngine *)self signpostID];
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __34__MLE5Engine__conformState_error___block_invoke;
  aBlock[3] = &__block_descriptor_40_e5_v8__0l;
  aBlock[4] = v7;
  id v8 = (void (**)(void))_Block_copy(aBlock);
  id v9 = [v6 featureProviderRepresentation];
  BOOL v10 = [(MLE5Engine *)self stateFeatureConformer];

  if (v10)
  {
    id v11 = [(MLE5Engine *)self stateFeatureConformer];
    id v12 = [v11 conformFeatures:v9 error:a4];
  }
  else
  {
    id v12 = v9;
  }

  v8[2](v8);

  return v12;
}

uint64_t __34__MLE5Engine__conformState_error___block_invoke()
{
  return kdebug_trace();
}

- (id)_conformInputFeatures:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = [(MLModelEngine *)self signpostID];
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__MLE5Engine__conformInputFeatures_error___block_invoke;
  aBlock[3] = &__block_descriptor_40_e5_v8__0l;
  aBlock[4] = v7;
  id v8 = (void (**)(void))_Block_copy(aBlock);
  id v9 = [(MLE5Engine *)self inputFeatureConformer];

  if (v9)
  {
    BOOL v10 = [(MLE5Engine *)self inputFeatureConformer];
    id v11 = [v10 conformFeatures:v6 error:a4];
  }
  else
  {
    id v11 = v6;
  }
  v8[2](v8);

  return v11;
}

uint64_t __42__MLE5Engine__conformInputFeatures_error___block_invoke()
{
  return kdebug_trace();
}

- (id)_predictionFromFeatures:(id)a3 usingState:(id)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v12 usesCPUOnly])
  {
    id v13 = [(MLModelEngine *)self configuration];
    uint64_t v14 = [v13 computeUnits];

    if (v14)
    {
      id v15 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        id v16 = [(MLModelEngine *)self modelDescription];
        id v17 = [v16 modelURL];
        int v25 = 138412290;
        __int16 v26 = v17;
        _os_log_impl(&dword_19E58B000, v15, OS_LOG_TYPE_INFO, "MLPredictionOptions's usesCPUOnly property has been deprecated and ignored for the model: %@", (uint8_t *)&v25, 0xCu);
      }
    }
  }
  char v18 = [(MLE5Engine *)self _conformInputFeatures:v10 error:a6];
  if (!v18)
  {
    uint64_t v23 = 0;
    goto LABEL_14;
  }
  id v19 = +[MLState emptyState];
  BOOL v20 = v19 == v11;

  if (!v20)
  {
    uint64_t v21 = [(MLE5Engine *)self _conformState:v11 error:a6];
    if (!v21)
    {
      uint64_t v23 = 0;
      goto LABEL_13;
    }
    uint64_t v22 = +[MLFeatureProviderUtils lazyProviderWithFeaturesProvidedBy:v21 addedToFeaturesProvidedBy:v18];

    char v18 = (void *)v22;
  }
  uint64_t v23 = [(MLE5Engine *)self _predictionFromFeatures:v18 options:v12 error:a6];
LABEL_13:

LABEL_14:

  return v23;
}

- (id)predictionFromFeatures:(id)a3 usingState:(id)a4 options:(id)a5 error:(id *)a6
{
  id v6 = [(MLE5Engine *)self _predictionFromFeatures:a3 usingState:a4 options:a5 error:a6];

  return v6;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = +[MLState emptyState];
  id v11 = [(MLE5Engine *)self _predictionFromFeatures:v8 usingState:v10 options:v9 error:a5];

  return v11;
}

- (BOOL)prepareWithConcurrencyHint:(int64_t)a3 error:(id *)a4
{
  id v6 = [(MLE5Engine *)self operationPool];
  unint64_t v7 = v6;
  if (a3 <= 1) {
    int64_t v8 = 1;
  }
  else {
    int64_t v8 = a3;
  }
  char v9 = [v6 prepareWithInitialPoolSize:v8 error:a4];

  return v9;
}

- (unint64_t)predictionTypeForKTrace
{
  return 21;
}

- (BOOL)supportsConcurrentSubmissions
{
  return 1;
}

- (MLE5Engine)initWithProgramLibrary:(id)a3 modelDescription:(id)a4 configuration:(id)a5 functionName:(id)a6 classProbabilitiesFeatureName:(id)a7 optionalInputDefaultValues:(id)a8 compilerVersionInfo:(id)a9
{
  id v48 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v47 = a8;
  id v46 = a9;
  v49.receiver = self;
  v49.super_class = (Class)MLE5Engine;
  BOOL v20 = [(MLModelEngine *)&v49 initWithDescription:v16 configuration:v17];
  uint64_t v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_functionName, a6);
    uint64_t v22 = [[MLE5ExecutionStreamPool alloc] initWithModelConfiguration:v17 modelSignpostId:[(MLModelEngine *)v21 signpostID]];
    streamPool = v21->_streamPool;
    v21->_streamPool = v22;

    objc_storeStrong((id *)&v21->_compilerVersionInfo, a9);
    uint64_t v24 = +[MLE5ExecutionStreamOperationPoolFactory createPoolFromLibrary:v48 functionName:v18 modelDescription:v16 modelConfiguration:v17 modelSignpostId:[(MLModelEngine *)v21 signpostID] compilerVersionInfo:v21->_compilerVersionInfo];
    operationPool = v21->_operationPool;
    v21->_operationPool = (MLE5ExecutionStreamOperationPool *)v24;

    uint64_t v26 = [v19 copy];
    classProbabilitiesFeatureName = v21->_classProbabilitiesFeatureName;
    v21->_classProbabilitiesFeatureName = (NSString *)v26;

    objc_storeStrong((id *)&v21->_programLibrary, a3);
    id v28 = [v16 classLabels];
    if (v28)
    {
      uint64_t v29 = +[MLProbabilityDictionary sharedKeySetForLabels:v28];
      id classLabelsSharedKey = v21->_classLabelsSharedKey;
      v21->_id classLabelsSharedKey = (id)v29;
    }
    uint64_t v31 = [v16 inputDescriptionsByName];

    if (v31)
    {
      unint64_t v32 = [MLFeatureProviderConformer alloc];
      uint64_t v33 = [v16 inputDescriptionsByName];
      float v34 = [v33 allValues];
      uint64_t v35 = [(MLFeatureProviderConformer *)v32 initWithFeatureDescriptions:v34 defaultValues:v47 usingRank5Mapping:0 optionalInputTypes:MEMORY[0x1E4F1CC08] passthroughStateFeatures:1];
      inputFeatureConformer = v21->_inputFeatureConformer;
      v21->_inputFeatureConformer = (MLFeatureProviderConformer *)v35;
    }
    uint64_t v37 = [v16 stateDescriptionsByName];

    if (v37)
    {
      uint64_t v38 = [MLFeatureProviderConformer alloc];
      uint64_t v39 = [v16 stateDescriptionsByName];
      id v40 = [v39 allValues];
      uint64_t v41 = [(MLFeatureProviderConformer *)v38 initWithFeatureDescriptions:v40 defaultValues:MEMORY[0x1E4F1CC08] usingRank5Mapping:0 optionalInputTypes:MEMORY[0x1E4F1CC08] passthroughStateFeatures:0];
      stateFeatureConformer = v21->_stateFeatureConformer;
      v21->_stateFeatureConformer = (MLFeatureProviderConformer *)v41;
    }
    dispatch_semaphore_t v43 = dispatch_semaphore_create(+[MLModel maxPredictionsInFlight]);
    batchMaxInFlightSem = v21->_batchMaxInFlightSem;
    v21->_batchMaxInFlightSem = (OS_dispatch_semaphore *)v43;
  }
  return v21;
}

+ (id)loadModelAssetDescriptionFromCompiledArchive:(_MLModelInputArchiver *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7
{
  id v10 = a4;
  id v11 = a5;
  id v12 = [[MLProgramE5Container alloc] initWithCompiledArchive:a3 modelVersionInfo:v10 compilerVersionInfo:v11 error:a7];
  id v13 = v12;
  if (v12)
  {
    uint64_t v14 = [(MLProgramE5Container *)v12 modelAssetDescription];
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

+ (Class)containerClass
{
  return (Class)objc_opt_class();
}

@end