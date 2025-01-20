@interface MLPipeline
+ (BOOL)archivePipelineModelDetailsFrom:(const void *)a3 toArchive:(void *)a4 error:(id *)a5;
+ (BOOL)parseModelArchive:(void *)a3 subModelNames:(id *)a4 subModelArchiveNames:(id *)a5 error:(id *)a6;
+ (id)_compileSpecification:(void *)a3 blobMapping:(id)a4 toArchive:(void *)a5 options:(id)a6 error:(id *)a7;
+ (id)classLabelsForPipelineFromSubModelArray:(id)a3 predictedFeatureName:(id)a4;
+ (id)classLabelsForPipelineFromSubModelDescriptionArray:(id)a3 predictedFeatureName:(id)a4;
+ (id)compileSpecification:(void *)a3 blobMapping:(id)a4 toArchive:(void *)a5 options:(id)a6 error:(id *)a7;
+ (id)compileSpecification:(void *)a3 toArchive:(void *)a4 options:(id)a5 error:(id *)a6;
+ (id)compileWithModelsInPipeline:(const void *)a3 blobMapping:(id)a4 toArchive:(void *)a5 options:(id)a6 updatable:(BOOL)a7 osSizeTracking:(id)a8 error:(id *)a9;
+ (id)compiledVersionForSpecification:(void *)a3 options:(id)a4 error:(id *)a5;
+ (id)extractSubModelNamesFromArchive:(void *)a3 numModels:(unint64_t)a4;
+ (id)loadModelAssetDescriptionFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7;
+ (void)archiveCustomModelNames:(const void *)a3 to:(void *)a4;
+ (void)archivePipelineUpdateParameterForModels:(const void *)a3 to:(void *)a4 updatable:(BOOL)a5;
- (BOOL)supportsConcurrentSubmissions;
- (BOOL)writeToURL:(id)a3 error:(id *)a4;
- (MLPipeline)initWithModels:(id)a3 modelNames:(id)a4 description:(id)a5 configuration:(id)a6;
- (NSArray)modelNames;
- (NSArray)models;
- (id)executionSchedule;
- (id)initModelFromMetadataAndArchive:(void *)a3 versionInfo:(id)a4 description:(id)a5 configuration:(id)a6 error:(id *)a7;
- (id)parameterValueForKey:(id)a3 error:(id *)a4;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (id)predictionsFromBatch:(id)a3 options:(id)a4 error:(id *)a5;
- (unint64_t)predictionTypeForKTrace;
- (void)_submitPredictionRequestToSubmodel:(unint64_t)a3 input:(id)a4 options:(id)a5 completionHandler:(id)a6;
- (void)replaceModelAtIndex:(unint64_t)a3 with:(id)a4;
- (void)setModelNames:(id)a3;
- (void)setModels:(id)a3;
- (void)submitPredictionRequest:(id)a3 completionHandler:(id)a4;
- (void)updateParameterDescriptionsByKeyBasedOnSubModel;
@end

@implementation MLPipeline

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelNames, 0);

  objc_storeStrong((id *)&self->_models, 0);
}

- (void)setModelNames:(id)a3
{
}

- (NSArray)modelNames
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setModels:(id)a3
{
}

- (NSArray)models
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (id)executionSchedule
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    NSUInteger v20 = [(NSArray *)self->_models count];
    *(_DWORD *)buf = 134217984;
    NSUInteger v28 = v20;
    _os_log_debug_impl(&dword_19E58B000, v3, OS_LOG_TYPE_DEBUG, "Profiler: MLPipeline::executionSchedule %lu networks", buf, 0xCu);
  }

  v21 = objc_alloc_init(MLModelExecutionSchedule);
  v4 = [(MLModelEngine *)self configuration];
  BOOL v5 = ([v4 profilingOptions] & 1) == 0;

  if (!v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v8 = [(MLPipeline *)self models];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v23;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v8);
          }
          v12 = [*(id *)(*((void *)&v22 + 1) + 8 * v11) executionSchedule];
          v13 = [v12 modelExecutionSchedule];
          BOOL v14 = [v13 count] == 0;

          if (v14)
          {
            v15 = +[MLLogging coreChannel];
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl(&dword_19E58B000, v15, OS_LOG_TYPE_DEBUG, "Profiler: [schedule] Model in pipeline does not have a schedule", buf, 2u);
            }
          }
          else
          {
            v15 = [v12 modelExecutionSchedule];
            [v6 addEntriesFromDictionary:v15];
          }

          v16 = [v12 modelExecutionScheduleByModelStructurePath];
          BOOL v17 = [v16 count] == 0;

          if (!v17)
          {
            v18 = [v12 modelExecutionScheduleByModelStructurePath];
            [v7 addEntriesFromDictionary:v18];
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v9);
    }

    [(MLModelExecutionSchedule *)v21 setModelExecutionSchedule:v6];
    [(MLModelExecutionSchedule *)v21 setModelExecutionScheduleByModelStructurePath:v7];
  }

  return v21;
}

- (id)parameterValueForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = 0;
  id v8 = 0;
  while (1)
  {
    uint64_t v9 = [(MLPipeline *)self models];
    unint64_t v10 = [v9 count];

    if (v7 >= v10) {
      break;
    }
    uint64_t v11 = [(MLPipeline *)self models];
    v12 = [v11 objectAtIndexedSubscript:v7];

    v13 = [(MLPipeline *)self modelNames];
    BOOL v14 = [v13 objectAtIndexedSubscript:v7];

    v15 = [v6 deletingPrefixingScope:v14];
    id v20 = 0;
    v16 = [v12 parameterValueForKey:v15 error:&v20];
    id v17 = v20;

    if (v16)
    {
      if (v8)
      {
        if (a4)
        {
          +[MLModelErrorUtils parameterErrorWithUnderlyingError:0, @"Pipeline Model contains multiple models that have parameter for requested key %@. Use parameter scoping to disambiguate.", v6 format];
          char v18 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          char v18 = 0;
        }
        goto LABEL_9;
      }
      id v8 = v16;
    }
    char v18 = 1;
LABEL_9:

    ++v7;
    if ((v18 & 1) == 0)
    {

      id v8 = 0;
      goto LABEL_15;
    }
  }
  if (!v8 && a4)
  {
    +[MLModelErrorUtils parameterErrorWithUnderlyingError:0, @"Pipeline Model does not contain a model that has a parameter for requested key %@.", v6 format];
    id v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_15:

  return v8;
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = [(MLModelEngine *)self modelDescription];
  id v8 = [v7 modelURL];
  id v14 = 0;
  BOOL v9 = +[MLSaver copyModelAtURL:v8 toURL:v6 error:&v14];
  id v10 = v14;

  if (a4) {
    char v11 = v9;
  }
  else {
    char v11 = 1;
  }
  if ((v11 & 1) == 0)
  {
    v12 = [v6 path];
    *a4 = +[MLModelErrorUtils errorWithCode:6, v10, @"Failed to copy original model files to the new destionation: %@", v12 underlyingError format];
  }
  return v9;
}

- (void)replaceModelAtIndex:(unint64_t)a3 with:(id)a4
{
  id v8 = a4;
  id v6 = [(MLPipeline *)self models];
  unint64_t v7 = (void *)[v6 mutableCopy];

  [v7 setObject:v8 atIndexedSubscript:a3];
  [(MLPipeline *)self setModels:v7];
}

- (void)_submitPredictionRequestToSubmodel:(unint64_t)a3 input:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [(MLPipeline *)self models];
  id v14 = [v13 objectAtIndexedSubscript:a3];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __81__MLPipeline__submitPredictionRequestToSubmodel_input_options_completionHandler___block_invoke;
  v18[3] = &unk_1E59A4238;
  unint64_t v23 = a3;
  id v15 = v12;
  id v22 = v15;
  id v16 = v10;
  id v19 = v16;
  id v20 = self;
  id v17 = v11;
  id v21 = v17;
  [v14 predictionFromFeatures:v16 options:v17 completionHandler:v18];
}

void __81__MLPipeline__submitPredictionRequestToSubmodel_input_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v17 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v17)
  {
    unint64_t v7 = +[MLFeatureProviderUtils lazyProviderWithFeaturesProvidedBy:v17 addedToFeaturesProvidedBy:*(void *)(a1 + 32)];
    uint64_t v8 = *(void *)(a1 + 64);
    BOOL v9 = [*(id *)(a1 + 40) models];
    uint64_t v10 = [v9 count];

    if (v8 + 1 == v10)
    {
      id v11 = (void *)MEMORY[0x1E4F1CAD0];
      id v12 = [*(id *)(a1 + 40) modelDescription];
      v13 = [v12 outputDescriptionsByName];
      id v14 = [v13 allKeys];
      id v15 = [v11 setWithArray:v14];

      id v16 = +[MLFeatureProviderUtils providerWithSubsetOfFeaturesNamed:v15 providedBy:v7];
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else
    {
      [*(id *)(a1 + 40) _submitPredictionRequestToSubmodel:*(void *)(a1 + 64) + 1 input:v7 options:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
    }
  }
  else
  {
    unint64_t v7 = +[MLModelErrorUtils errorWithCode:0, v5, @"Failed to evaluate model %tu in pipeline", *(void *)(a1 + 64) underlyingError format];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)submitPredictionRequest:(id)a3 completionHandler:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  unint64_t v7 = [v10 predictionOptions];
  uint64_t v8 = (void *)[v7 copy];

  objc_msgSend(v8, "setParentSignpostID:", -[MLModelEngine signpostID](self, "signpostID"));
  BOOL v9 = [v10 inputFeatures];
  [(MLPipeline *)self _submitPredictionRequestToSubmodel:0 input:v9 options:v8 completionHandler:v6];
}

- (BOOL)supportsConcurrentSubmissions
{
  return 1;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  long long v25 = v10;
  id v11 = (void *)[v9 copy];
  objc_msgSend(v11, "setParentSignpostID:", -[MLModelEngine signpostID](self, "signpostID"));
  for (unint64_t i = 0; ; ++i)
  {
    if (i >= [(NSArray *)self->_models count])
    {
      char v18 = (void *)MEMORY[0x1E4F1CAD0];
      id v19 = [(MLModelEngine *)self modelDescription];
      id v20 = [v19 outputDescriptionsByName];
      id v21 = [v20 allKeys];
      id v15 = [v18 setWithArray:v21];

      id v22 = +[MLFeatureProviderUtils providerWithSubsetOfFeaturesNamed:v15 providedBy:v10];
      goto LABEL_13;
    }
    v13 = [(NSArray *)self->_models objectAtIndexedSubscript:i];
    id v26 = 0;
    id v14 = [v13 predictionFromFeatures:v10 options:v11 error:&v26];
    id v15 = v26;

    if (!v14 || v15 != 0) {
      break;
    }
    uint64_t v17 = +[MLFeatureProviderUtils lazyProviderWithFeaturesProvidedBy:v14 addedToFeaturesProvidedBy:v10];

    id v10 = (id)v17;
  }
  if (a5)
  {
    unint64_t v23 = [NSNumber numberWithUnsignedInteger:i];
    *a5 = +[MLModelErrorUtils errorWithCode:0, v15, @"Failed to evaluate model %@ in pipeline", v23 underlyingError format];
  }
  id v22 = 0;
LABEL_13:

  return v22;
}

- (id)predictionsFromBatch:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  unint64_t v11 = 0;
  long long v25 = v10;
  while (1)
  {
    if (v11 >= [(NSArray *)self->_models count])
    {
      uint64_t v17 = (void *)MEMORY[0x1E4F1CAD0];
      char v18 = [(MLModelEngine *)self modelDescription];
      id v19 = [v18 outputDescriptionsByName];
      id v20 = [v19 allKeys];
      id v14 = [v17 setWithArray:v20];

      id v21 = +[MLBatchProviderUtils batchWithSubsetOfFeaturesNamed:v14 fromBatch:v10];
      goto LABEL_18;
    }
    id v12 = [(NSArray *)self->_models objectAtIndexedSubscript:v11];
    id v27 = 0;
    v13 = [v12 predictionsFromBatch:v10 options:v9 error:&v27];
    id v14 = v27;

    if (!v13 || v14 != 0) {
      break;
    }
    id v26 = 0;
    uint64_t v16 = +[MLBatchProviderUtils lazyBatchWithFeaturesInBatch:v13 addedToBatch:v10 error:&v26];
    id v14 = v26;

    if (v14)
    {
      if (!a5) {
        goto LABEL_17;
      }
      id v22 = [NSNumber numberWithUnsignedInteger:v11];
      unint64_t v23 = +[MLModelErrorUtils errorWithCode:0, v14, @"Failed to carry forward results for model %@ in pipeline", v22 underlyingError format];
      goto LABEL_15;
    }

    ++v11;
    id v10 = (id)v16;
  }
  if (a5)
  {
    id v22 = [NSNumber numberWithUnsignedInteger:v11];
    unint64_t v23 = +[MLModelErrorUtils errorWithCode:0, v14, @"Failed to evaluate model %@ in pipeline", v22 underlyingError format];
    uint64_t v16 = (uint64_t)v10;
LABEL_15:
    *a5 = v23;

    goto LABEL_17;
  }
  uint64_t v16 = (uint64_t)v10;
LABEL_17:

  id v21 = 0;
  id v10 = (id)v16;
LABEL_18:

  return v21;
}

- (unint64_t)predictionTypeForKTrace
{
  return 3;
}

- (MLPipeline)initWithModels:(id)a3 modelNames:(id)a4 description:(id)a5 configuration:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v10 count])
  {
    v27.receiver = self;
    v27.super_class = (Class)MLPipeline;
    id v14 = [(MLModelEngine *)&v27 initWithDescription:v12 configuration:v13];
    if (v14)
    {
      uint64_t v15 = [v10 copy];
      models = v14->_models;
      v14->_models = (NSArray *)v15;

      uint64_t v17 = [v11 copy];
      modelNames = v14->_modelNames;
      v14->_modelNames = (NSArray *)v17;

      id v19 = objc_opt_class();
      id v20 = [(MLModelEngine *)v14 modelDescription];
      id v21 = [v20 predictedFeatureName];
      id v22 = [v19 classLabelsForPipelineFromSubModelArray:v10 predictedFeatureName:v21];
      unint64_t v23 = [(MLModelEngine *)v14 modelDescription];
      [v23 setClassLabels:v22];

      [(MLPipeline *)v14 updateParameterDescriptionsByKeyBasedOnSubModel];
    }
    self = v14;
    long long v24 = self;
  }
  else
  {
    long long v25 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E58B000, v25, OS_LOG_TYPE_ERROR, "Pipeline model must have at least 1 submodel.", buf, 2u);
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Pipeline model must have at least 1 submodel."];
    long long v24 = 0;
  }

  return v24;
}

- (id)initModelFromMetadataAndArchive:(void *)a3 versionInfo:(id)a4 description:(id)a5 configuration:(id)a6 error:(id *)a7
{
  v46.receiver = self;
  v46.super_class = (Class)MLPipeline;
  id v37 = a6;
  id v9 = -[MLModelEngine initWithDescription:configuration:](&v46, sel_initWithDescription_configuration_, a5);
  p_isa = (id *)&v9->super.super.isa;
  if (v9)
  {
    v38 = v9;
    id v45 = 0;
    id v44 = 0;
    char v11 = [(id)objc_opt_class() parseModelArchive:a3 subModelNames:&v45 subModelArchiveNames:&v44 error:a7];
    id v33 = v45;
    id v12 = v45;
    id v13 = v44;
    if ((v11 & 1) == 0)
    {

LABEL_14:
      v31 = 0;
      goto LABEL_15;
    }
    v34 = v13;
    unint64_t v14 = [v12 count];
    uint64_t v15 = (void *)[v37 copy];
    uint64_t v16 = [v15 modelDisplayName];
    [v15 setParentModelName:v16];

    id obj = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v14];
    if (v14)
    {
      uint64_t v17 = 0;
      BOOL v18 = 1;
      while (1)
      {
        id v19 = objc_msgSend(v12, "objectAtIndexedSubscript:", v17, v33);
        id v20 = [v34 objectAtIndexedSubscript:v17];
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v20 UTF8String]);
        id v21 = IArchive::nestedArchive(a3, (uint64_t)__p);
        _MLModelInputArchiver::_MLModelInputArchiver((_MLModelInputArchiver *)v41, (const IArchive *)v21);
        if (v40 < 0) {
          operator delete(__p[0]);
        }
        id v22 = [v37 parameters];
        unint64_t v23 = +[MLParameterUtils deScopeParameters:v22 byDeletingPrefixingScope:v19];
        [v15 setParameters:v23];

        [v15 setModelDisplayName:v19];
        long long v24 = +[MLLoader loadModelFromArchive:v41 configuration:v15 error:a7];
        if (!v24) {
          break;
        }
        long long v25 = [(MLModelEngine *)v38 modelPath];
        [v24 setModelPath:v25 modelName:v19];

        [obj addObject:v24];
        std::__tree<std::__value_type<std::string,IArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,IArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,IArchive>>>::destroy(v43);
        if (v42) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v42);
        }

        BOOL v18 = ++v17 < v14;
        p_isa = (id *)&v38->super.super.isa;
        if (v14 == v17) {
          goto LABEL_11;
        }
      }
      std::__tree<std::__value_type<std::string,IArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,IArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,IArchive>>>::destroy(v43);
      if (v42) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v42);
      }

      p_isa = (id *)&v38->super.super.isa;
      if (v18) {
        goto LABEL_14;
      }
    }
    else
    {
LABEL_11:
      objc_storeStrong(p_isa + 4, obj);
      objc_storeStrong(p_isa + 5, v33);
      id v26 = objc_opt_class();
      objc_super v27 = [p_isa modelDescription];
      NSUInteger v28 = [v27 predictedFeatureName];
      uint64_t v29 = [v26 classLabelsForPipelineFromSubModelArray:obj predictedFeatureName:v28];
      v30 = [p_isa modelDescription];
      [v30 setClassLabels:v29];

      [p_isa updateParameterDescriptionsByKeyBasedOnSubModel];
    }
  }
  v31 = p_isa;
LABEL_15:

  return v31;
}

- (void)updateParameterDescriptionsByKeyBasedOnSubModel
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  unint64_t v23 = 0;
  long long v24 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  while (1)
  {
    v2 = [(MLPipeline *)self models];
    BOOL v3 = v23 < [v2 count];

    if (!v3) {
      break;
    }
    v4 = [(MLPipeline *)self models];
    id v5 = [v4 objectAtIndexedSubscript:v23];

    id v6 = [(MLPipeline *)self modelNames];
    unint64_t v7 = [v6 objectAtIndexedSubscript:v23];

    id v8 = [v5 modelDescription];
    id v9 = [v8 parameterDescriptionsByKey];
    BOOL v10 = [v9 count] == 0;

    if (!v10)
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      char v11 = [v5 modelDescription];
      id v12 = [v11 parameterDescriptionsByKey];

      uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v26;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v26 != v14) {
              objc_enumerationMutation(v12);
            }
            uint64_t v16 = *(void **)(*((void *)&v25 + 1) + 8 * v15);
            uint64_t v17 = [v5 modelDescription];
            BOOL v18 = [v17 parameterDescriptionsByKey];
            id v19 = [v18 objectForKeyedSubscript:v16];
            id v20 = [v16 scopedTo:v7];
            [v24 setObject:v19 forKeyedSubscript:v20];

            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v13);
      }
    }
    ++v23;
  }
  if ([v24 count])
  {
    id v21 = [(MLModelEngine *)self modelDescription];
    [v21 setParameterDescriptionsByKey:v24];
  }
}

+ (id)classLabelsForPipelineFromSubModelArray:(id)a3 predictedFeatureName:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "modelDescription", (void)v16);
        [v8 addObject:v13];
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [a1 classLabelsForPipelineFromSubModelDescriptionArray:v8 predictedFeatureName:v7];

  return v14;
}

+ (id)classLabelsForPipelineFromSubModelDescriptionArray:(id)a3 predictedFeatureName:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v31;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v31 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          id v12 = [v11 outputDescriptionsByName];
          uint64_t v13 = [v12 allKeys];
          int v14 = [v13 containsObject:v6];

          if (v14)
          {
            long long v17 = [v11 classLabels];
            goto LABEL_27;
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v15 = v5;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v16)
  {
    long long v17 = 0;
    uint64_t v18 = *(void *)v27;
    while (2)
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = *(void **)(*((void *)&v26 + 1) + 8 * j);
        uint64_t v21 = [v20 classLabels];
        BOOL v22 = v21 == 0;

        if (!v22)
        {
          if (v17)
          {

            unint64_t v23 = +[MLLogging coreChannel];
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19E58B000, v23, OS_LOG_TYPE_INFO, "This pipeline contains multiple sub-models with class labels. As a result, the classLabel property of the pipeline instance will not be populated.", buf, 2u);
            }

            goto LABEL_26;
          }
          long long v17 = [v20 classLabels];
        }
      }
      uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }
  else
  {
LABEL_26:
    long long v17 = 0;
  }
LABEL_27:

  return v17;
}

+ (BOOL)parseModelArchive:(void *)a3 subModelNames:(id *)a4 subModelArchiveNames:(id *)a5 error:(id *)a6
{
  v14[1] = *MEMORY[0x1E4F143B8];
  operator>>((uint64_t)a3);
  id v7 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    LOWORD(__p) = 0;
    _os_log_error_impl(&dword_19E58B000, v7, OS_LOG_TYPE_ERROR, "Failed to parse Pipeline model. Found 0 sub-models, model is expected to have at least 1 submodel.", (uint8_t *)&__p, 2u);
  }

  if (a6)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F28568];
    id v11 = [NSString stringWithFormat:@"Failed to parse Pipeline model. Found 0 sub-models, model is expected to have at least 1 submodel."];
    v14[0] = v11;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    *a6 = [v8 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v9];
  }
  return 0;
}

+ (id)extractSubModelNamesFromArchive:(void *)a3 numModels:(unint64_t)a4
{
  std::string::basic_string[abi:ne180100]<0>(&__p, "modelNames");
  int hasNestedArchive = IArchive::hasNestedArchive(a3, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  memset(v25, 0, sizeof(v25));
  if (hasNestedArchive)
  {
    std::string::basic_string[abi:ne180100]<0>(&v21, "modelNames");
    id v7 = (std::string::size_type *)IArchive::nestedArchive(a3, (uint64_t)&v21);
    std::string::size_type v8 = v7[1];
    __p.__r_.__value_.__r.__words[0] = *v7;
    __p.__r_.__value_.__l.__size_ = v8;
    if (v8) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
    }
    std::map<std::string,IArchive>::map[abi:ne180100]((uint64_t)&__p.__r_.__value_.__r.__words[2], v7 + 2);
    if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v21.__r_.__value_.__l.__data_);
    }
    _MLModelInputArchiver::_MLModelInputArchiver((_MLModelInputArchiver *)&v21, (const IArchive *)&__p);
    uint64_t v20 = 0;
    operator>>((uint64_t)&v21);
    BOOL v9 = a4 != 0;
    std::__tree<std::__value_type<std::string,IArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,IArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,IArchive>>>::destroy(v22);
    if (v21.__r_.__value_.__l.__size_) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v21.__r_.__value_.__l.__size_);
    }
    std::__tree<std::__value_type<std::string,IArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,IArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,IArchive>>>::destroy(v24);
    if (__p.__r_.__value_.__l.__size_) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)__p.__r_.__value_.__l.__size_);
    }
  }
  else
  {
    BOOL v9 = 1;
  }
  uint64_t v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a4];
  if (a4)
  {
    uint64_t v11 = 0;
    unint64_t v12 = 0;
    do
    {
      if (v9)
      {
        std::to_string(&v21, v12);
        uint64_t v13 = std::string::insert(&v21, 0, "model");
        long long v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
        __p.__r_.__value_.__r.__words[2] = v13->__r_.__value_.__r.__words[2];
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v14;
        v13->__r_.__value_.__l.__size_ = 0;
        v13->__r_.__value_.__r.__words[2] = 0;
        v13->__r_.__value_.__r.__words[0] = 0;
        if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v21.__r_.__value_.__l.__data_);
        }
      }
      else
      {
        id v15 = (long long *)(v25[0] + v11);
        if (*(char *)(v25[0] + v11 + 23) < 0)
        {
          std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v15, *((void *)v15 + 1));
        }
        else
        {
          long long v16 = *v15;
          __p.__r_.__value_.__r.__words[2] = *((void *)v15 + 2);
          *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v16;
        }
      }
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        p_p = &__p;
      }
      else {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      uint64_t v18 = [NSString stringWithUTF8String:p_p];
      [v10 addObject:v18];

      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      ++v12;
      v11 += 24;
    }
    while (a4 != v12);
  }
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v25;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);

  return v10;
}

+ (id)loadModelAssetDescriptionFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7
{
  id v10 = [[MLModelDescription alloc] initFromRawCompiledModelArchive:a3 error:a7];
  if (v10)
  {
    uint64_t v12 = 0;
    operator>>((uint64_t)a3);
    std::string::size_type v8 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E58B000, v8, OS_LOG_TYPE_ERROR, "Pipeline model must have at least 1 submodel.", buf, 2u);
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Pipeline model must have at least 1 submodel."];
  }

  return 0;
}

+ (id)compiledVersionForSpecification:(void *)a3 options:(id)a4 error:(id *)a5
{
  id v7 = a4;
  std::string::size_type v8 = +[MLVersionInfo versionInfoWithMajor:1 minor:0 patch:1 variant:@"generic"];
  uint64_t v9 = [v8 variantString];
  if (v9) {
    id v10 = (__CFString *)v9;
  }
  else {
    id v10 = &stru_1EF0E81D0;
  }
  uint64_t v11 = [MEMORY[0x1E4F28E78] stringWithString:v10];
  uint64_t v12 = *(void *)a3;
  int v13 = *(_DWORD *)(*(void *)a3 + 44);
  switch(v13)
  {
    case 200:
      long long v24 = v8;
      uint64_t v14 = *(void *)(*(void *)(v12 + 32) + 16);
      if (!v14) {
        operator new();
      }
      break;
    case 201:
      long long v24 = v8;
      uint64_t v14 = *(void *)(*(void *)(v12 + 32) + 16);
      if (!v14) {
        operator new();
      }
      break;
    case 202:
      long long v24 = v8;
      uint64_t v14 = *(void *)(v12 + 32);
      break;
    default:
      std::string v21 = 0;
      goto LABEL_26;
  }
  unint64_t v23 = v10;
  uint64_t v15 = *(unsigned int *)(v14 + 24);
  if ((int)v15 < 1)
  {
LABEL_22:
    std::string::size_type v8 = v24;
    std::string v21 = +[MLVersionInfo versionInfoWithMajor:minor:patch:variant:](MLVersionInfo, "versionInfoWithMajor:minor:patch:variant:", [v24 majorVersion], objc_msgSend(v24, "minorVersion"), objc_msgSend(v24, "patchVersion"), v11);
  }
  else
  {
    uint64_t v16 = 0;
    while (1)
    {
      std::allocate_shared[abi:ne180100]<CoreML::Specification::Model,std::allocator<CoreML::Specification::Model>,CoreML::Specification::Model const&,void>(&v26, *(const CoreML::Specification::Model **)(*(void *)(v14 + 32) + 8 * v16 + 8));
      id v25 = 0;
      long long v17 = +[MLCompiler compiledVersionForSpecification:&v26 options:v7 error:&v25];
      id v18 = v25;
      long long v19 = v18;
      if (v18)
      {
        if (a5) {
          *a5 = v18;
        }
      }
      else
      {
        uint64_t v20 = [v17 versionString];
        [v11 appendFormat:@".model%lluv%@", v16, v20];
      }
      if (v27) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v27);
      }

      if (v19) {
        break;
      }
      if (v15 == ++v16) {
        goto LABEL_22;
      }
    }
    std::string v21 = 0;
    std::string::size_type v8 = v24;
  }
  id v10 = v23;
LABEL_26:

  return v21;
}

+ (id)compileSpecification:(void *)a3 blobMapping:(id)a4 toArchive:(void *)a5 options:(id)a6 error:(id *)a7
{
  id v7 = [a1 _compileSpecification:a3 blobMapping:a4 toArchive:a5 options:a6 error:a7];

  return v7;
}

+ (id)compileSpecification:(void *)a3 toArchive:(void *)a4 options:(id)a5 error:(id *)a6
{
  id v6 = [a1 _compileSpecification:a3 blobMapping:0 toArchive:a4 options:a5 error:a6];

  return v6;
}

+ (id)_compileSpecification:(void *)a3 blobMapping:(id)a4 toArchive:(void *)a5 options:(id)a6 error:(id *)a7
{
  id v11 = a4;
  id v12 = a6;
  int v13 = *(unsigned __int8 *)(*(void *)a3 + 28);
  uint64_t v14 = *(uint64_t **)(*(void *)a3 + 16);
  if (!v14) {
    uint64_t v14 = &CoreML::Specification::_ModelDescription_default_instance_;
  }
  uint64_t v15 = (void *)v14[20];
  std::string::basic_string[abi:ne180100]<0>(__p, "mldb_token");
  if (v15) {
    uint64_t v16 = v15;
  }
  else {
    uint64_t v16 = &CoreML::Specification::_Metadata_default_instance_;
  }
  google::protobuf::Map<std::string,std::string>::InnerMap::FindHelper(v33, v16[5], (unsigned __int8 *)__p, 0);
  long long v17 = (void *)v33[0];
  if (v32 < 0)
  {
    operator delete(__p[0]);
    if (!v17) {
      goto LABEL_18;
    }
  }
  else if (!v33[0])
  {
    goto LABEL_18;
  }
  id v18 = NSString;
  std::string::basic_string[abi:ne180100]<0>(__p, "mldb_token");
  google::protobuf::Map<std::string,std::string>::InnerMap::FindHelper(v33, v16[5], (unsigned __int8 *)__p, 0);
  uint64_t v19 = v33[0];
  if (!v33[0])
  {
    LODWORD(v33[0]) = 3;
    v33[1] = "/Library/Caches/com.apple.xbs/Sources/CoreML/coremltools-internal/deps/protobuf/src/google/protobuf/map.h";
    int v34 = 1048;
    memset(&v35, 0, sizeof(v35));
    std::string::append(&v35, "CHECK failed: it != end(): ");
    google::protobuf::internal::LogMessage::Finish((google::protobuf::internal::LogMessage *)v33);
    if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v35.__r_.__value_.__l.__data_);
    }
  }
  uint64_t v20 = *(void *)(v19 + 24);
  uint64_t v23 = *(void *)(v20 + 24);
  uint64_t v21 = v20 + 24;
  uint64_t v22 = v23;
  if (*(char *)(v21 + 23) >= 0) {
    uint64_t v24 = v21;
  }
  else {
    uint64_t v24 = v22;
  }
  long long v17 = [v18 stringWithUTF8String:v24];
  if (v32 < 0) {
    operator delete(__p[0]);
  }
LABEL_18:
  uint64_t v25 = *(void *)a3;
  int v26 = *(_DWORD *)(*(void *)a3 + 44);
  if (v26 == 202)
  {
    long long v28 = *(uint64_t **)(v25 + 32);
LABEL_25:
    long long v29 = +[MLPipeline compileWithModelsInPipeline:v28 blobMapping:v11 toArchive:a5 options:v12 updatable:v13 != 0 osSizeTracking:v17 error:a7];
    goto LABEL_27;
  }
  if (v26 == 201 || v26 == 200)
  {
    long long v27 = *(uint64_t **)(*(void *)(v25 + 32) + 16);
    if (v27) {
      long long v28 = v27;
    }
    else {
      long long v28 = &CoreML::Specification::_Pipeline_default_instance_;
    }
    goto LABEL_25;
  }
  long long v29 = 0;
LABEL_27:

  return v29;
}

+ (id)compileWithModelsInPipeline:(const void *)a3 blobMapping:(id)a4 toArchive:(void *)a5 options:(id)a6 updatable:(BOOL)a7 osSizeTracking:(id)a8 error:(id *)a9
{
  BOOL v75 = a7;
  v93[1] = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v76 = a6;
  id v14 = a8;
  *(_OWORD *)v86 = 0u;
  *(_OWORD *)std::string __p = 0u;
  int v88 = 1065353216;
  v77 = v13;
  if (!v13) {
    goto LABEL_60;
  }
  *(_OWORD *)buf = 0uLL;
  long long v90 = 0uLL;
  LODWORD(v91) = 1065353216;
  std::__hash_table<std::shared_ptr<MIL::Builder::OperationBuilder>,std::hash<std::shared_ptr<MIL::Builder::OperationBuilder>>,std::equal_to<std::shared_ptr<MIL::Builder::OperationBuilder>>,std::allocator<std::shared_ptr<MIL::Builder::OperationBuilder>>>::__rehash<true>((uint64_t)buf, (unint64_t)(float)(unint64_t)*((int *)a3 + 6));
  if (*((int *)a3 + 6) >= 1)
  {
    unint64_t v15 = 0;
    while (1)
    {
      uint64_t v16 = *(unsigned int *)(*(void *)(*((void *)a3 + 4) + 8 * v15 + 8) + 44);
      long long v17 = +[MLModelTypeRegistry sharedInstance];
      uint64_t v18 = [v17 classForCompilingModelType:v16];

      if ([(id)v18 conformsToProtocol:&unk_1EF121330]) {
        break;
      }
LABEL_43:
      if ((uint64_t)++v15 >= *((int *)a3 + 6)) {
        goto LABEL_44;
      }
    }
    unint64_t v19 = *(void *)&buf[8];
    if (*(void *)&buf[8])
    {
      uint8x8_t v20 = (uint8x8_t)vcnt_s8(*(int8x8_t *)&buf[8]);
      v20.i16[0] = vaddlv_u8(v20);
      if (v20.u32[0] > 1uLL)
      {
        uint64_t v18 = v15;
        if (*(void *)&buf[8] <= v15) {
          uint64_t v18 = v15 % *(void *)&buf[8];
        }
      }
      else
      {
        uint64_t v18 = (*(void *)&buf[8] + 0x7FFFFFFFFFFFFFFFLL) & v15;
      }
      uint64_t v21 = *(uint64_t ***)(*(void *)buf + 8 * v18);
      if (v21)
      {
        for (uint64_t i = *v21; i; uint64_t i = (uint64_t *)*i)
        {
          unint64_t v23 = i[1];
          if (v23 == v15)
          {
            if (v15 == *((_DWORD *)i + 4)) {
              goto LABEL_43;
            }
          }
          else
          {
            if (v20.u32[0] > 1uLL)
            {
              if (v23 >= *(void *)&buf[8]) {
                v23 %= *(void *)&buf[8];
              }
            }
            else
            {
              v23 &= *(void *)&buf[8] - 1;
            }
            if (v23 != v18) {
              break;
            }
          }
        }
      }
    }
    uint64_t v24 = operator new(0x18uLL);
    *uint64_t v24 = 0;
    v24[1] = v15;
    *((_DWORD *)v24 + 4) = v15;
    float v25 = (float)(unint64_t)(*((void *)&v90 + 1) + 1);
    if (!v19 || (float)(*(float *)&v91 * (float)v19) < v25)
    {
      BOOL v26 = (v19 & (v19 - 1)) != 0;
      if (v19 < 3) {
        BOOL v26 = 1;
      }
      unint64_t v27 = v26 | (2 * v19);
      unint64_t v28 = vcvtps_u32_f32(v25 / *(float *)&v91);
      if (v27 <= v28) {
        size_t v29 = v28;
      }
      else {
        size_t v29 = v27;
      }
      std::__hash_table<std::shared_ptr<MIL::Builder::OperationBuilder>,std::hash<std::shared_ptr<MIL::Builder::OperationBuilder>>,std::equal_to<std::shared_ptr<MIL::Builder::OperationBuilder>>,std::allocator<std::shared_ptr<MIL::Builder::OperationBuilder>>>::__rehash<true>((uint64_t)buf, v29);
      unint64_t v19 = *(void *)&buf[8];
      if ((v19 & (v19 - 1)) != 0)
      {
        if (*(void *)&buf[8] <= v15) {
          uint64_t v18 = v15 % *(void *)&buf[8];
        }
        else {
          uint64_t v18 = v15;
        }
      }
      else
      {
        uint64_t v18 = (*(void *)&buf[8] + 0x7FFFFFFFFFFFFFFFLL) & v15;
      }
    }
    uint64_t v30 = *(void *)buf;
    long long v31 = *(void **)(*(void *)buf + 8 * v18);
    if (v31)
    {
      *uint64_t v24 = *v31;
    }
    else
    {
      *uint64_t v24 = v90;
      *(void *)&long long v90 = v24;
      *(void *)(v30 + 8 * v18) = &v90;
      if (!*v24)
      {
LABEL_42:
        ++*((void *)&v90 + 1);
        goto LABEL_43;
      }
      unint64_t v32 = *(void *)(*v24 + 8);
      if ((v19 & (v19 - 1)) != 0)
      {
        if (v32 >= v19) {
          v32 %= v19;
        }
      }
      else
      {
        v32 &= v19 - 1;
      }
      long long v31 = (void *)(*(void *)buf + 8 * v32);
    }
    void *v31 = v24;
    goto LABEL_42;
  }
LABEL_44:
  if (__p[1])
  {
    long long v33 = __p[0];
    if (__p[0])
    {
      do
      {
        int v34 = (void *)*v33;
        operator delete(v33);
        long long v33 = v34;
      }
      while (v34);
    }
    __p[0] = 0;
    std::string v35 = (char *)v86[1];
    if (v86[1])
    {
      uint64_t v36 = 0;
      do
        *((void *)v86[0] + (void)v36++) = 0;
      while (v35 != v36);
    }
    __p[1] = 0;
  }
  id v37 = *(void **)buf;
  *(void *)buf = 0;
  v38 = v86[0];
  v86[0] = v37;
  if (v38) {
    operator delete(v38);
  }
  unint64_t v39 = *(void *)&buf[8];
  *(void *)&uint8_t buf[8] = 0;
  *(_OWORD *)std::string __p = v90;
  int v88 = (int)v91;
  v86[1] = (void *)v39;
  if (*((void *)&v90 + 1))
  {
    unint64_t v40 = *(void *)(v90 + 8);
    if ((v39 & (v39 - 1)) != 0)
    {
      if (v40 >= v39) {
        v40 %= v39;
      }
    }
    else
    {
      v40 &= v39 - 1;
    }
    *((void *)v86[0] + v40) = __p;
    long long v90 = 0uLL;
  }
  std::__hash_table<MIL::Builder::Variable const*,std::hash<MIL::Builder::Variable const*>,std::equal_to<MIL::Builder::Variable const*>,std::allocator<MIL::Builder::Variable const*>>::~__hash_table((uint64_t)buf);
  if (!__p[1])
  {
    v62 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
      v72 = {;
    }
      v73 = [v72 componentsJoinedByString:@", "];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v73;
      _os_log_error_impl(&dword_19E58B000, v62, OS_LOG_TYPE_ERROR, "The 'BlobMapping' parameter is not empty. However, the model types %@ in the pipeline don't support 'BlobFileValue' syntax in the specification.", buf, 0xCu);
    }
    if (a9)
    {
      v65 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v92 = *MEMORY[0x1E4F28568];
      v67 = v66 = NSString;
      v68 = [v67 componentsJoinedByString:@", "];
      v69 = [v66 stringWithFormat:@"The 'BlobMapping' parameter is not empty. However, the model types %@ in the pipeline don't support 'BlobFileValue' syntax in the specification.", v68];
      v93[0] = v69;
      v70 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v93 forKeys:&v92 count:1];
      *a9 = [v65 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v70];
    }
  }
  else
  {
LABEL_60:
    uint64_t v41 = *((int *)a3 + 6);
    operator<<((uint64_t)a5, v41);
    if (v41)
    {
      unint64_t v42 = 0;
      while (1)
      {
        std::to_string(&v85, v42);
        v43 = std::string::insert(&v85, 0, "model");
        long long v44 = *(_OWORD *)&v43->__r_.__value_.__l.__data_;
        v83 = (std::__shared_weak_count *)v43->__r_.__value_.__r.__words[2];
        *(_OWORD *)v82 = v44;
        v43->__r_.__value_.__l.__size_ = 0;
        v43->__r_.__value_.__r.__words[2] = 0;
        v43->__r_.__value_.__r.__words[0] = 0;
        id v45 = OArchive::nestedArchive((char *)a5, (uint64_t)v82);
        buf[0] = *v45;
        uint64_t v46 = *((void *)v45 + 2);
        *(void *)&uint8_t buf[8] = *((void *)v45 + 1);
        *(void *)&long long v90 = v46;
        if (v46) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(v46 + 8), 1uLL, memory_order_relaxed);
        }
        std::map<std::string,OArchive>::map[abi:ne180100]((uint64_t)&v90 + 8, (void *)v45 + 3);
        if (SHIBYTE(v83) < 0) {
          operator delete(v82[0]);
        }
        if (SHIBYTE(v85.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v85.__r_.__value_.__l.__data_);
        }
        _MLModelOutputArchiver::_MLModelOutputArchiver((uint64_t)v82, (uint64_t)buf);
        std::allocate_shared[abi:ne180100]<CoreML::Specification::Model,std::allocator<CoreML::Specification::Model>,CoreML::Specification::Model const&,void>(&v80, *(const CoreML::Specification::Model **)(*((void *)a3 + 4) + 8 * (int)v42 + 8));
        if (v14)
        {
          uint64_t v47 = *((void *)v80 + 2);
          if (!v47) {
            operator new();
          }
          uint64_t v48 = *(void *)(v47 + 160);
          if (!v48) {
            operator new();
          }
          uint64_t v49 = [v14 UTF8String];
          std::string::basic_string[abi:ne180100]<0>(&v85, "mldb_token");
          v50 = google::protobuf::Map<std::string,std::string>::operator[](v48 + 24, (uint64_t)&v85);
          MEMORY[0x19F3C1430](v50, v49);
          if (SHIBYTE(v85.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v85.__r_.__value_.__l.__data_);
          }
        }
        if (v77 && v86[1])
        {
          uint8x8_t v51 = (uint8x8_t)vcnt_s8((int8x8_t)v86[1]);
          v51.i16[0] = vaddlv_u8(v51);
          if (v51.u32[0] > 1uLL)
          {
            unint64_t v52 = (int)v42;
            if (v86[1] <= (void *)(int)v42) {
              unint64_t v52 = (int)v42 % (unint64_t)v86[1];
            }
          }
          else
          {
            unint64_t v52 = ((unint64_t)v86[1] - 1) & (int)v42;
          }
          v53 = (uint64_t **)*((void *)v86[0] + v52);
          if (v53)
          {
            for (uint64_t j = *v53; j; uint64_t j = (uint64_t *)*j)
            {
              unint64_t v55 = j[1];
              if (v55 == (int)v42)
              {
                if (*((_DWORD *)j + 4) == v42)
                {
                  uint64_t v79 = 0;
                  v58 = (id *)&v79;
                  id v59 = +[MLCompiler compileSpecification:&v80 blobMapping:v77 toArchive:v82 options:v76 error:&v79];
                  goto LABEL_93;
                }
              }
              else
              {
                if (v51.u32[0] > 1uLL)
                {
                  if ((void *)v55 >= v86[1]) {
                    v55 %= (unint64_t)v86[1];
                  }
                }
                else
                {
                  v55 &= (unint64_t)v86[1] - 1;
                }
                if (v55 != v52) {
                  break;
                }
              }
            }
          }
        }
        uint64_t v78 = 0;
        v58 = (id *)&v78;
        id v56 = +[MLCompiler compileSpecification:&v80 toArchive:v82 options:v76 error:&v78];
LABEL_93:
        id v57 = *v58;
        if (v57) {
          break;
        }
        if (v81) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v81);
        }
        std::__tree<std::__value_type<std::string,OArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,OArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,OArchive>>>::destroy(v84);
        if (v83) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v83);
        }
        std::__tree<std::__value_type<std::string,OArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,OArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,OArchive>>>::destroy(v91);
        if ((void)v90) {
          std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v90);
        }
        if (++v42 == v41) {
          goto LABEL_101;
        }
      }
      v61 = v57;
      if (a9) {
        *a9 = v57;
      }
      if (v81) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v81);
      }

      std::__tree<std::__value_type<std::string,OArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,OArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,OArchive>>>::destroy(v84);
      if (v83) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v83);
      }
      std::__tree<std::__value_type<std::string,OArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,OArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,OArchive>>>::destroy(v91);
      if ((void)v90) {
        std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v90);
      }
    }
    else
    {
LABEL_101:
      +[MLPipeline archivePipelineUpdateParameterForModels:(char *)a3 + 16 to:a5 updatable:v75];
      +[MLPipeline archiveCustomModelNames:(char *)a3 + 40 to:a5];
      if ([a1 archivePipelineModelDetailsFrom:a3 toArchive:a5 error:a9])
      {
        v60 = +[MLCompilerResult resultWithArchive:a5];
        goto LABEL_116;
      }
    }
  }
  v60 = 0;
LABEL_116:
  std::__hash_table<MIL::Builder::Variable const*,std::hash<MIL::Builder::Variable const*>,std::equal_to<MIL::Builder::Variable const*>,std::allocator<MIL::Builder::Variable const*>>::~__hash_table((uint64_t)v86);

  return v60;
}

+ (BOOL)archivePipelineModelDetailsFrom:(const void *)a3 toArchive:(void *)a4 error:(id *)a5
{
  v17[0] = 0;
  v17[1] = 0;
  uint64_t v16 = (uint64_t *)v17;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v13);
  std::ostream::operator<<();
  std::stringbuf::str();
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[@"modelDimension" UTF8String]);
  uint64_t v18 = __p;
  id v7 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v16, __p, (_OWORD **)&v18);
  std::string::operator=((std::string *)((char *)v7 + 56), &__str);
  if (v11 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "PipelineModelDetails");
  BOOL v8 = +[MLReporterUtils archiveModelDetails:&v16 withName:__p toArchive:a4 error:a5];
  if (v11 < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
  v13[0] = *MEMORY[0x1E4FBA418];
  *(void *)((char *)v13 + *(void *)(v13[0] - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
  v13[1] = MEMORY[0x1E4FBA470] + 16;
  if (v14 < 0) {
    operator delete((void *)v13[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x19F3C1850](&v15);
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(v17[0]);
  return v8;
}

+ (void)archiveCustomModelNames:(const void *)a3 to:(void *)a4
{
  unint64_t v4 = *((int *)a3 + 2);
  if (v4)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "modelNames");
    id v7 = OArchive::nestedArchive((char *)a4, (uint64_t)__p);
    v13[0] = *v7;
    BOOL v8 = (std::__shared_weak_count *)*((void *)v7 + 2);
    uint64_t v14 = *((void *)v7 + 1);
    uint64_t v15 = v8;
    if (v8) {
      atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    std::map<std::string,OArchive>::map[abi:ne180100]((uint64_t)v16, (void *)v7 + 3);
    if (SHIBYTE(v11) < 0) {
      operator delete(__p[0]);
    }
    _MLModelOutputArchiver::_MLModelOutputArchiver((uint64_t)__p, (uint64_t)v13);
    operator<<((uint64_t)__p, v4);
    uint64_t v9 = 0;
    if (v4 <= 1) {
      unint64_t v4 = 1;
    }
    do
    {
      operator<<((uint64_t)__p, *(uint64_t **)(*((void *)a3 + 2) + (v9 >> 29) + 8));
      v9 += 0x100000000;
      --v4;
    }
    while (v4);
    std::__tree<std::__value_type<std::string,OArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,OArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,OArchive>>>::destroy(v12);
    if (v11) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v11);
    }
    std::__tree<std::__value_type<std::string,OArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,OArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,OArchive>>>::destroy(v16[1]);
    if (v15) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v15);
    }
  }
}

+ (void)archivePipelineUpdateParameterForModels:(const void *)a3 to:(void *)a4 updatable:(BOOL)a5
{
  if (a5)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "updateParameters");
    id v7 = OArchive::nestedArchive((char *)a4, (uint64_t)__p);
    if (v20 < 0) {
      operator delete(__p[0]);
    }
    (*(void (**)(void))(**((void **)v7 + 1) + 56))(*((void *)v7 + 1));
    v15[0] = *v7;
    BOOL v8 = (std::__shared_weak_count *)*((void *)v7 + 2);
    uint64_t v16 = *((void *)v7 + 1);
    long long v17 = v8;
    if (v8) {
      atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    std::map<std::string,OArchive>::map[abi:ne180100]((uint64_t)v18, (void *)v7 + 3);
    uint64_t v9 = *((int *)a3 + 2);
    if (v9)
    {
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      uint64_t v12 = *((int *)a3 + 2);
      do
      {
        v11 += *(unsigned __int8 *)(*(void *)(*((void *)a3 + 2) + (v10 >> 29) + 8) + 28);
        v10 += 0x100000000;
        --v12;
      }
      while (v12);
    }
    else
    {
      uint64_t v11 = 0;
    }
    operator<<((uint64_t)v15, v11);
    if (v9)
    {
      uint64_t v13 = 0;
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(unsigned char *)(*(void *)(*((void *)a3 + 2) + (v13 >> 29) + 8) + 28)) {
          operator<<((uint64_t)v15, i);
        }
        v13 += 0x100000000;
      }
    }
    std::__tree<std::__value_type<std::string,OArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,OArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,OArchive>>>::destroy(v18[1]);
    if (v17) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v17);
    }
  }
}

@end