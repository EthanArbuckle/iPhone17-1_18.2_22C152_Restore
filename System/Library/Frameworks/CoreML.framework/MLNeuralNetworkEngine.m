@interface MLNeuralNetworkEngine
+ (Class)containerClass;
+ (id)loadModelAssetDescriptionFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7;
+ (id)loadModelFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7;
+ (id)neuralNetworkFromContainer:(id)a3 configuration:(id)a4 error:(id *)a5;
+ (id)neuralNetworkFromContainer:(id)a3 error:(id *)a4;
+ (int)gpuEngine;
+ (int)gpuPrecision;
- ($C4732ECC957FA13B9B3DF4A51A95735B)network;
- (BOOL)_addCompiledNetworkOrProgramToPlan:(void *)a3 error:(id *)a4;
- (BOOL)_addNetworkToPlan:(void *)a3 error:(id *)a4;
- (BOOL)_espressoOutputShapeForFeatureName:(id)a3 matchesShapeOfMLMultiArray:(id)a4;
- (BOOL)_handleAddNetworkToPlanStatus:(int)a3 error:(id *)a4;
- (BOOL)_matchEngineToOptions:(id)a3 error:(id *)a4;
- (BOOL)_setMultiArrayOutputBacking:(id)a3 forOutputFeatureName:(id)a4 toEbuf:(id *)a5 error:(id *)a6;
- (BOOL)_setMultipleBuffersOnPlan:(void *)a3 error:(id *)a4;
- (BOOL)_setupContextAndPlanWithConfiguration:(id)a3 priority:(int)a4 error:(id *)a5;
- (BOOL)_setupContextAndPlanWithConfiguration:(id)a3 usingCPU:(BOOL)a4 priority:(int)a5 error:(id *)a6;
- (BOOL)_setupContextAndPlanWithConfiguration:(id)a3 usingCPU:(BOOL)a4 priority:(int)a5 reshapeWithContainer:(BOOL)a6 error:(id *)a7;
- (BOOL)_setupContextAndPlanWithForceCPU:(BOOL)a3 priority:(int)a4 error:(id *)a5;
- (BOOL)bindDirectlyInputFeatureNamed:(id)a3 pixelBuffer:(__CVBuffer *)a4 cleanUpBlocks:(id)a5 boundDirectly:(BOOL *)a6 error:(id *)a7;
- (BOOL)bindDynamicOutputBuffers:(const void *)a3 error:(id *)a4;
- (BOOL)bindInputFeatureNamed:(id)a3 convertingMultiArray:(id)a4 bufferIndex:(unint64_t)a5 error:(id *)a6;
- (BOOL)bindInputFeatureNamed:(id)a3 featureValue:(id)a4 bufferIndex:(unint64_t)a5 cleanUpBlocks:(id)a6 boundDirectly:(BOOL *)a7 error:(id *)a8;
- (BOOL)bindInputFeatureNamed:(id)a3 pixelBuffer:(__CVBuffer *)a4 cleanUpBlocks:(id)a5 error:(id *)a6;
- (BOOL)bindInputFeatures:(id)a3 bufferIndex:(unint64_t)a4 cleanUpBlocks:(id)a5 directlyBoundFeatureNames:(id *)a6 error:(id *)a7;
- (BOOL)bindInputsAndOutputs:(id)a3 cleanUpBlocks:(id)a4 bufferIndex:(unint64_t)a5 options:(id)a6 error:(id *)a7;
- (BOOL)bindOutputBuffers:(const void *)a3 outputBackings:(id)a4 automaticOutputBackingMode:(id)a5 directlyBoundOutputFeatureNames:(id *)a6 error:(id *)a7;
- (BOOL)collectParametersFromContainer:(id)a3 configuration:(id)a4 error:(id *)a5;
- (BOOL)copyEbuf:(id *)a3 ofPixelType:(unint64_t)a4 toPixelBuffer:(__CVBuffer *)a5 error:(id *)a6;
- (BOOL)copyImagePreprocessingParametersTo:(void *)a3 error:(id *)a4;
- (BOOL)executePlan:(void *)a3 error:(id *)a4;
- (BOOL)hardwareFallbackDetected;
- (BOOL)hasBidirectionalLayer;
- (BOOL)hasOptionalInputSequenceConcat;
- (BOOL)isANEPathForbidden;
- (BOOL)isEspressoBiasPreprocessingShared;
- (BOOL)isGPUPathForbidden;
- (BOOL)lockPixelBuffer:(__CVBuffer *)a3 cleanUpBlocks:(id)a4 error:(id *)a5;
- (BOOL)modelIsEncrypted;
- (BOOL)modelIsMIL;
- (BOOL)ndArrayInterpretation;
- (BOOL)opacifyAndPermutePixelBuffer:(__CVBuffer *)a3 bufferContainsBGRA:(BOOL)a4 error:(id *)a5;
- (BOOL)rebuildPlan:(BOOL)a3 error:(id *)a4;
- (BOOL)rebuildPlan:(id *)a3;
- (BOOL)recordsPredictionEvent;
- (BOOL)resetSizes:(id)a3 error:(id *)a4;
- (BOOL)resetSizesNoAutoRelease:(id)a3 error:(id *)a4;
- (BOOL)resetSizesWithEspressoConfigurations:(id)a3 error:(id *)a4;
- (BOOL)sequenceConcatConsumesOptionalInputNamed:(id)a3;
- (BOOL)setEspressoBlobShapes:(void *)a3 widths:(void *)a4 heights:(void *)a5 ks:(void *)a6 batches:(void *)a7 sequences:(void *)a8 ranks:(void *)a9 error:(id *)a10;
- (BOOL)transferOneComponent16HalfPixelBuffer:(__CVBuffer *)a3 toPixelBuffer:(__CVBuffer *)a4 withScale:(float)a5 bias:(float)a6;
- (BOOL)transferPixelBuffer:(__CVBuffer *)a3 toPixelBuffer:(__CVBuffer *)a4;
- (BOOL)tryToSetOutputBacking:(id)a3 forFeatureName:(id)a4 toEbuf:(id *)a5 reportPointerFlags:(int *)a6 error:(id *)a7;
- (BOOL)updateDynamicOutputBlobIndicatorCacheAndReturnError:(id *)a3;
- (BOOL)usingCPU;
- (BOOL)usingEspressoConfigurations;
- (EspressoProfilingNetworkInfo)espressoProfileInfo;
- (MLFeatureProviderConformer)inputFeatureConformer;
- (MLNeuralNetworkEngine)initWithContainer:(id)a3 configuration:(id)a4 error:(id *)a5;
- (MLNeuralNetworkEngine)initWithContainer:(id)a3 error:(id *)a4;
- (MLPixelBufferPool)pixelBufferPool;
- (MLVersionInfo)compilerVersionInfo;
- (MLVersionInfo)modelVersionInfo;
- (NSArray)classLabels;
- (NSArray)inputLayers;
- (NSArray)outputLayers;
- (NSDictionary)defaultOptionalValues;
- (NSDictionary)espressoInputShapes;
- (NSDictionary)espressoInputStrides;
- (NSDictionary)imagePreprocessingParameters;
- (NSDictionary)optionalInputTypes;
- (NSMutableDictionary)inputBlobNameToLastBackingMode;
- (NSMutableDictionary)outputBlobNameToLastBackingMode;
- (NSString)activeFunction;
- (NSString)classScoreVectorName;
- (NSString)modelFilePath;
- (OS_dispatch_queue)espressoQueue;
- (OS_dispatch_queue)predictionsQueue;
- (OS_dispatch_semaphore)bufferSemaphore;
- (OS_dispatch_semaphore)submitSemaphore;
- (__CVBuffer)_pixelBufferFromEbuf:(id *)a3 description:(id)a4 error:(id *)a5;
- (__CVBuffer)copyPixelBufferByApplyingImagePreprocessing:(const vimage2espresso_param *)a3 toPixelBuffer:(__CVBuffer *)a4;
- (__CVBuffer)copyPixelBufferByApplyingImagePreprocessingForFeatureNamed:(id)a3 toPixelBuffer:(__CVBuffer *)a4;
- (__CVBuffer)copyPixelBufferFromPixelBuffer:(__CVBuffer *)a3 usingPixelFormat:(unsigned int)a4;
- (__CVBuffer)pixelBufferFromOutputBacking:(id)a3 forFeature:(id)a4;
- (id).cxx_construct;
- (id)addClassifierInformationToOutput:(id)a3 options:(id)a4 error:(id *)a5;
- (id)availableOutputBlobList;
- (id)classify:(id)a3 options:(id)a4 error:(id *)a5;
- (id)completeOutputBackings:(id)a3 automaticOutputBackingMode:(id)a4 error:(id *)a5;
- (id)convertPredictionToClassifierResult:(id)a3 withOptions:(id)a4 error:(id *)a5;
- (id)evaluate:(id)a3 error:(id *)a4;
- (id)evaluateBatch:(id)a3 options:(id)a4 error:(id *)a5;
- (id)evaluateInputs:(id)a3 bufferIndex:(unint64_t)a4 options:(id)a5 error:(id *)a6;
- (id)evaluateInputs:(id)a3 options:(id)a4 error:(id *)a5;
- (id)evaluateInputs:(id)a3 options:(id)a4 verifyInputs:(BOOL)a5 error:(id *)a6;
- (id)executionSchedule;
- (id)imageFeatureValueFromEbuf:(id *)a3 backingCVPixelBuffer:(__CVBuffer *)a4 description:(id)a5 error:(id *)a6;
- (id)imageFeatureValueFromPixelBuffer:(__CVBuffer *)a3 usingPixelFormat:(unsigned int)a4;
- (id)multiArrayFeatureValueFromEbuf:(id *)a3 backingMultiArray:(id)a4 description:(id)a5 outputName:(id)a6 error:(id *)a7;
- (id)outputBackingMultiArrayForFeatureName:(id)a3;
- (id)parameterValueForKey:(id)a3 error:(id *)a4;
- (id)pixelBufferBackedMultiArrayWithShape:(id)a3;
- (id)populateOutputs:(unint64_t)a3 outputBackings:(id)a4 directlyBoundOutputFeatureNames:(id)a5 error:(id *)a6;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (id)predictionsFromBatch:(id)a3 options:(id)a4 error:(id *)a5;
- (id)probabilityDictionarySharedKeySet;
- (id)regress:(id)a3 options:(id)a4 error:(id *)a5;
- (id)sortBatchByShape:(id)a3 withMap:(id *)a4 error:(id *)a5;
- (id)verifyInputs:(id)a3 error:(id *)a4;
- (int)_espressoDeviceForConfiguration:(id)a3 error:(id *)a4;
- (int)engine;
- (int)precision;
- (int)priority;
- (int)qos;
- (int)sequenceNamed:(id)a3;
- (int64_t)inputBindStateForFeatureValue:(id)a3 error:(id *)a4;
- (unint64_t)numInputs;
- (unint64_t)numOutputs;
- (unint64_t)obtainBuffer;
- (unint64_t)predictionTypeForKTrace;
- (unint64_t)supportFromEspressoLayerInfo:(id)a3;
- (unint64_t)supportFromEspressoPlatform:(int)a3;
- (void)_deallocContextAndPlan;
- (void)context;
- (void)dealloc;
- (void)dumpTestVectorsToPath:(id)a3;
- (void)enableInstrumentsTracing;
- (void)plan;
- (void)populateMultiArrayShape:(id *)a3 strides:(id *)a4 forEbuf:(id *)a5 featureDescription:(id)a6 ndArrayInterpretation:(BOOL)a7;
- (void)prepareBlobNamed:(id)a3 forNewBlobBackingMode:(int64_t)a4 bindMode:(int)a5;
- (void)releaseBuffer:(unint64_t)a3;
- (void)setActiveFunction:(id)a3;
- (void)setBufferSemaphore:(id)a3;
- (void)setClassLabels:(id)a3;
- (void)setClassScoreVectorName:(id)a3;
- (void)setContext:(void *)a3;
- (void)setDefaultOptionalValues:(id)a3;
- (void)setEngine:(int)a3;
- (void)setEspressoInputShapes:(id)a3;
- (void)setEspressoInputStrides:(id)a3;
- (void)setEspressoProfileInfo:(id)a3;
- (void)setEspressoQueue:(id)a3;
- (void)setHardwareFallbackDetected:(BOOL)a3;
- (void)setHasBidirectionalLayer:(BOOL)a3;
- (void)setHasOptionalInputSequenceConcat:(BOOL)a3;
- (void)setImagePreprocessingParameters:(id)a3;
- (void)setIsANEPathForbidden:(BOOL)a3;
- (void)setIsEspressoBiasPreprocessingShared:(BOOL)a3;
- (void)setIsGPUPathForbidden:(BOOL)a3;
- (void)setModelFilePath:(id)a3;
- (void)setModelIsMIL:(BOOL)a3;
- (void)setNdArrayInterpretation:(BOOL)a3;
- (void)setNetwork:(id)a3;
- (void)setPlan:(void *)a3;
- (void)setPrecision:(int)a3;
- (void)setPredictionsQueue:(id)a3;
- (void)setPriority:(int)a3;
- (void)setProbabilityDictionarySharedKeySet:(id)a3;
- (void)setQos:(int)a3;
- (void)setSubmitSemaphore:(id)a3;
- (void)setUsingCPU:(BOOL)a3;
@end

@implementation MLNeuralNetworkEngine

- (BOOL)_setupContextAndPlanWithConfiguration:(id)a3 usingCPU:(BOOL)a4 priority:(int)a5 reshapeWithContainer:(BOOL)a6 error:(id *)a7
{
  BOOL v119 = a6;
  uint64_t v8 = a4;
  v141[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  kdebug_trace();
  if (self->_numOutputs)
  {
    espresso_context_destroy();
    self->_numOutputs = 0;
  }
  if (self->_numInputs)
  {
    espresso_plan_destroy();
    self->_numInputs = 0;
  }
  if ((v8 & 1) != 0
    || ![v10 computeUnits]
    || [v10 computeUnits] == 3 && BYTE1(self->_compilerOutput))
  {
    goto LABEL_14;
  }
  uint64_t v11 = [v10 computeUnits];
  if (v11 != 3)
  {
    if (!HIBYTE(self->_transferSession)) {
      goto LABEL_204;
    }
LABEL_14:
    v12 = (char *)&self->_transferSession + 3;
    BYTE3(self->_transferSession) = 1;
LABEL_15:
    *(_DWORD *)&self->_hardwareFallbackDetected = 0;
    HIDWORD(self->_compilerOutput) = 65568;
    goto LABEL_16;
  }
  uint64_t v8 = +[MLInternalSettings globalSettings];
  if (([(id)v8 restrictNeuralNetworksFromUsingANE] & 1) != 0 || HIBYTE(self->_transferSession))
  {
    v12 = (char *)&self->_transferSession + 3;
    BYTE3(self->_transferSession) = 1;
LABEL_209:

    goto LABEL_210;
  }
LABEL_204:
  v114 = +[MLInternalSettings globalSettings];
  char v115 = [v114 restrictNeuralNetworksToUseCPUOnly];
  if ((v115 & 1) != 0 || !LOBYTE(self->_compilerOutput))
  {
    v12 = (char *)&self->_transferSession + 3;
    BYTE3(self->_transferSession) = v115;
  }
  else
  {
    v12 = (char *)&self->_transferSession + 3;
    BYTE3(self->_transferSession) = BYTE1(self->_compilerOutput);
  }

  if (v11 == 3) {
    goto LABEL_209;
  }
LABEL_210:
  if (*v12) {
    goto LABEL_15;
  }
  v116 = +[MLInternalSettings globalSettings];
  if (([v116 restrictNeuralNetworksFromUsingANE] & 1) != 0 || objc_msgSend(v10, "computeUnits") == 1)
  {
  }
  else
  {
    int v117 = BYTE1(self->_compilerOutput);

    if (!v117)
    {
      *(_DWORD *)&self->_hardwareFallbackDetected = 10007;
      HIDWORD(self->_compilerOutput) = 65552;
      goto LABEL_16;
    }
  }
  if ([v10 computeUnits] == 3)
  {
    *(_DWORD *)&self->_hardwareFallbackDetected = 0;
    HIDWORD(self->_compilerOutput) = 65568;
    unsigned char *v12 = 1;
  }
  else
  {
    *(_DWORD *)&self->_hardwareFallbackDetected = [(id)objc_opt_class() gpuEngine];
    HIDWORD(self->_compilerOutput) = [(id)objc_opt_class() gpuPrecision];
  }
LABEL_16:
  if ([(MLNeuralNetworkEngine *)self _espressoDeviceForConfiguration:v10 error:a7] == -1)goto LABEL_202; {
  unint64_t context = espresso_create_context();
  }
  self->_numOutputs = context;
  if (!context)
  {
    if (*(_DWORD *)&self->_hardwareFallbackDetected != 10007
      || ([v10 computeUnits] != 3
        ? (*(_DWORD *)&self->_hardwareFallbackDetected = [(id)objc_opt_class() gpuEngine],
           HIDWORD(self->_compilerOutput) = [(id)objc_opt_class() gpuPrecision])
        : (*(_DWORD *)&self->_hardwareFallbackDetected = 0, HIDWORD(self->_compilerOutput) = 65568, unsigned char *v12 = 1),
          unint64_t v14 = espresso_create_context(),
          (self->_numOutputs = v14) == 0))
    {
      *(_DWORD *)&self->_hardwareFallbackDetected = 0;
      HIDWORD(self->_compilerOutput) = 65568;
      unsigned char *v12 = 1;
      self->_numOutputs = espresso_create_context();
    }
  }
  if ([v10 computeUnits] == 3)
  {
    uint64_t v15 = espresso_context_set_int_option();
    if (v15)
    {
      v16 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v15;
        _os_log_error_impl(&dword_19E58B000, v16, OS_LOG_TYPE_ERROR, "Failed to configure the model to use CPU and NeuralEngine due to error code: %d.", buf, 8u);
      }

      if (a7)
      {
        v17 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v140 = *MEMORY[0x1E4F28568];
        v18 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to configure the model to use CPU and NeuralEngine due to error code: %d.", v15);
        v141[0] = v18;
        v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v141 forKeys:&v140 count:1];
        *a7 = [v17 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v19];

        goto LABEL_30;
      }
LABEL_202:
      BOOL v20 = 0;
      goto LABEL_203;
    }
  }
  if ([v10 allowLowPrecisionAccumulationOnGPU])
  {
    Espresso::get_internal_context((uint64_t *)buf, (Espresso *)self->_numOutputs, v21);
    v22 = *(std::__shared_weak_count **)&buf[8];
    *(_DWORD *)(*(void *)buf + 68) = 1;
    if (v22) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v22);
    }
  }
  if ([v10 enableTestVectorMode]) {
    espresso_enable_test_vector_mode();
  }
  [(MLNeuralNetworkEngine *)self modelIsEncrypted];
  self->_numInputs = espresso_create_plan();
  *(_DWORD *)&self->_isGPUPathForbidden = a5;
  if (*(_DWORD *)&self->_hardwareFallbackDetected == 10007)
  {
    espresso_plan_set_priority();
  }
  else
  {
    v23 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_19E58B000, v23, OS_LOG_TYPE_DEBUG, "Unable to set priority when the backend is not ANE", buf, 2u);
    }
  }
  if (![(MLNeuralNetworkEngine *)self _setMultipleBuffersOnPlan:self->_numInputs error:a7]|| ![(MLNeuralNetworkEngine *)self _addNetworkToPlan:self->_numInputs error:a7])
  {
    goto LABEL_202;
  }
  v24 = [(MLModelEngine *)self configuration];
  v18 = [v24 modelDisplayName];

  if (v18)
  {
    if ([v18 length])
    {
      if ([v10 allowsInstrumentation])
      {
        id v25 = v18;
        [v25 UTF8String];
        int v26 = espresso_network_set_tracing_name();
        if (v26)
        {
          v27 = +[MLLogging coreChannel];
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = v25;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v26;
            _os_log_error_impl(&dword_19E58B000, v27, OS_LOG_TYPE_ERROR, "Unable to set tracing name ('%@') to the underlying inference engine due to error: %d.", buf, 0x12u);
          }
        }
      }
    }
  }
  if (!v119) {
    goto LABEL_189;
  }
  v118 = v18;
  memset(buf, 0, sizeof(buf));
  __p = 0;
  v137 = 0;
  unint64_t v138 = 0;
  v133 = 0;
  v134 = 0;
  unint64_t v135 = 0;
  v130 = 0;
  v131 = 0;
  unint64_t v132 = 0;
  v127 = 0;
  v128 = 0;
  unint64_t v129 = 0;
  v124 = 0;
  v125 = 0;
  unint64_t v126 = 0;
  v121 = 0;
  v122 = 0;
  unint64_t v123 = 0;
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, _BlobShape>, void *>>> *)self->_currentBlobShapes.__tree_.__begin_node_;
  if (begin_node != &self->_currentBlobShapes.__tree_.__pair1_)
  {
    do
    {
      left = begin_node + 4;
      if (SHIBYTE(begin_node[6].__value_.__left_) < 0) {
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, _BlobShape>, void *>>> *)left->__value_.__left_;
      }
      uint64_t v30 = *(void *)&buf[8];
      if (*(void *)&buf[8] >= *(void *)&buf[16])
      {
        uint64_t v32 = (uint64_t)(*(void *)&buf[8] - *(void *)buf) >> 3;
        if ((unint64_t)(v32 + 1) >> 61) {
          std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v33 = (uint64_t)(*(void *)&buf[16] - *(void *)buf) >> 2;
        if (v33 <= v32 + 1) {
          unint64_t v33 = v32 + 1;
        }
        if (*(void *)&buf[16] - *(void *)buf >= 0x7FFFFFFFFFFFFFF8uLL) {
          unint64_t v34 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v34 = v33;
        }
        if (v34) {
          unint64_t v34 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v34);
        }
        else {
          uint64_t v35 = 0;
        }
        v36 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, _BlobShape>, void *>>> **)(v34 + 8 * v32);
        *v36 = left;
        v31 = v36 + 1;
        v38 = *(char **)buf;
        v37 = *(char **)&buf[8];
        if (*(void *)&buf[8] != *(void *)buf)
        {
          do
          {
            v39 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, _BlobShape>, void *>>> *)*((void *)v37 - 1);
            v37 -= 8;
            *--v36 = v39;
          }
          while (v37 != v38);
          v37 = *(char **)buf;
        }
        *(void *)buf = v36;
        *(void *)&buf[8] = v31;
        *(void *)&buf[16] = v34 + 8 * v35;
        if (v37) {
          operator delete(v37);
        }
      }
      else
      {
        **(void **)&buf[8] = left;
        v31 = (void *)(v30 + 8);
      }
      *(void *)&buf[8] = v31;
      v40 = v137;
      if ((unint64_t)v137 >= v138)
      {
        v42 = (char *)__p;
        uint64_t v43 = (v137 - (unsigned char *)__p) >> 2;
        unint64_t v44 = v43 + 1;
        if ((unint64_t)(v43 + 1) >> 62) {
          goto LABEL_219;
        }
        uint64_t v45 = v138 - (void)__p;
        if ((uint64_t)(v138 - (void)__p) >> 1 > v44) {
          unint64_t v44 = v45 >> 1;
        }
        if ((unint64_t)v45 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v46 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v46 = v44;
        }
        if (v46)
        {
          unint64_t v46 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v46);
          v42 = (char *)__p;
          v40 = v137;
        }
        else
        {
          uint64_t v47 = 0;
        }
        v48 = (char *)(v46 + 4 * v43);
        *(_DWORD *)v48 = begin_node[7].__value_.__left_;
        v41 = v48 + 4;
        while (v40 != v42)
        {
          int v49 = *((_DWORD *)v40 - 1);
          v40 -= 4;
          *((_DWORD *)v48 - 1) = v49;
          v48 -= 4;
        }
        __p = v48;
        v137 = v41;
        unint64_t v138 = v46 + 4 * v47;
        if (v42) {
          operator delete(v42);
        }
      }
      else
      {
        *(_DWORD *)v137 = begin_node[7].__value_.__left_;
        v41 = v40 + 4;
      }
      v137 = v41;
      v50 = v134;
      if ((unint64_t)v134 >= v135)
      {
        v52 = (char *)v133;
        uint64_t v53 = (v134 - (unsigned char *)v133) >> 2;
        unint64_t v54 = v53 + 1;
        if ((unint64_t)(v53 + 1) >> 62) {
          goto LABEL_219;
        }
        uint64_t v55 = v135 - (void)v133;
        if ((uint64_t)(v135 - (void)v133) >> 1 > v54) {
          unint64_t v54 = v55 >> 1;
        }
        if ((unint64_t)v55 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v56 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v56 = v54;
        }
        if (v56)
        {
          unint64_t v56 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v56);
          v52 = (char *)v133;
          v50 = v134;
        }
        else
        {
          uint64_t v57 = 0;
        }
        v58 = (char *)(v56 + 4 * v53);
        *(_DWORD *)v58 = HIDWORD(begin_node[7].__value_.__left_);
        v51 = v58 + 4;
        while (v50 != v52)
        {
          int v59 = *((_DWORD *)v50 - 1);
          v50 -= 4;
          *((_DWORD *)v58 - 1) = v59;
          v58 -= 4;
        }
        v133 = v58;
        v134 = v51;
        unint64_t v135 = v56 + 4 * v57;
        if (v52) {
          operator delete(v52);
        }
      }
      else
      {
        *(_DWORD *)v134 = HIDWORD(begin_node[7].__value_.__left_);
        v51 = v50 + 4;
      }
      v134 = v51;
      v60 = v131;
      if ((unint64_t)v131 >= v132)
      {
        v62 = (char *)v130;
        uint64_t v63 = (v131 - (unsigned char *)v130) >> 2;
        unint64_t v64 = v63 + 1;
        if ((unint64_t)(v63 + 1) >> 62) {
          goto LABEL_219;
        }
        uint64_t v65 = v132 - (void)v130;
        if ((uint64_t)(v132 - (void)v130) >> 1 > v64) {
          unint64_t v64 = v65 >> 1;
        }
        if ((unint64_t)v65 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v66 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v66 = v64;
        }
        if (v66)
        {
          unint64_t v66 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v66);
          v62 = (char *)v130;
          v60 = v131;
        }
        else
        {
          uint64_t v67 = 0;
        }
        v68 = (char *)(v66 + 4 * v63);
        *(_DWORD *)v68 = begin_node[8].__value_.__left_;
        v61 = v68 + 4;
        while (v60 != v62)
        {
          int v69 = *((_DWORD *)v60 - 1);
          v60 -= 4;
          *((_DWORD *)v68 - 1) = v69;
          v68 -= 4;
        }
        v130 = v68;
        v131 = v61;
        unint64_t v132 = v66 + 4 * v67;
        if (v62) {
          operator delete(v62);
        }
      }
      else
      {
        *(_DWORD *)v131 = begin_node[8].__value_.__left_;
        v61 = v60 + 4;
      }
      v131 = v61;
      v70 = v128;
      if ((unint64_t)v128 >= v129)
      {
        v72 = (char *)v127;
        uint64_t v73 = (v128 - (unsigned char *)v127) >> 2;
        unint64_t v74 = v73 + 1;
        if ((unint64_t)(v73 + 1) >> 62) {
          goto LABEL_219;
        }
        uint64_t v75 = v129 - (void)v127;
        if ((uint64_t)(v129 - (void)v127) >> 1 > v74) {
          unint64_t v74 = v75 >> 1;
        }
        if ((unint64_t)v75 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v76 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v76 = v74;
        }
        if (v76)
        {
          unint64_t v76 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v76);
          v72 = (char *)v127;
          v70 = v128;
        }
        else
        {
          uint64_t v77 = 0;
        }
        v78 = (char *)(v76 + 4 * v73);
        *(_DWORD *)v78 = HIDWORD(begin_node[8].__value_.__left_);
        v71 = v78 + 4;
        while (v70 != v72)
        {
          int v79 = *((_DWORD *)v70 - 1);
          v70 -= 4;
          *((_DWORD *)v78 - 1) = v79;
          v78 -= 4;
        }
        v127 = v78;
        v128 = v71;
        unint64_t v129 = v76 + 4 * v77;
        if (v72) {
          operator delete(v72);
        }
      }
      else
      {
        *(_DWORD *)v128 = HIDWORD(begin_node[8].__value_.__left_);
        v71 = v70 + 4;
      }
      v128 = v71;
      v80 = v125;
      if ((unint64_t)v125 >= v126)
      {
        v82 = (char *)v124;
        uint64_t v83 = (v125 - (unsigned char *)v124) >> 2;
        unint64_t v84 = v83 + 1;
        if ((unint64_t)(v83 + 1) >> 62) {
          goto LABEL_219;
        }
        uint64_t v85 = v126 - (void)v124;
        if ((uint64_t)(v126 - (void)v124) >> 1 > v84) {
          unint64_t v84 = v85 >> 1;
        }
        if ((unint64_t)v85 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v86 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v86 = v84;
        }
        if (v86)
        {
          unint64_t v86 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v86);
          v82 = (char *)v124;
          v80 = v125;
        }
        else
        {
          uint64_t v87 = 0;
        }
        v88 = (char *)(v86 + 4 * v83);
        *(_DWORD *)v88 = begin_node[9].__value_.__left_;
        v81 = v88 + 4;
        while (v80 != v82)
        {
          int v89 = *((_DWORD *)v80 - 1);
          v80 -= 4;
          *((_DWORD *)v88 - 1) = v89;
          v88 -= 4;
        }
        v124 = v88;
        v125 = v81;
        unint64_t v126 = v86 + 4 * v87;
        if (v82) {
          operator delete(v82);
        }
      }
      else
      {
        *(_DWORD *)v125 = begin_node[9].__value_.__left_;
        v81 = v80 + 4;
      }
      v125 = v81;
      if (BYTE1(self->_transferSession))
      {
        v90 = v122;
        if ((unint64_t)v122 >= v123)
        {
          v92 = (char *)v121;
          uint64_t v93 = (v122 - (unsigned char *)v121) >> 2;
          unint64_t v94 = v93 + 1;
          if ((unint64_t)(v93 + 1) >> 62) {
LABEL_219:
          }
            std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
          uint64_t v95 = v123 - (void)v121;
          if ((uint64_t)(v123 - (void)v121) >> 1 > v94) {
            unint64_t v94 = v95 >> 1;
          }
          if ((unint64_t)v95 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v96 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v96 = v94;
          }
          if (v96)
          {
            unint64_t v96 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v96);
            v92 = (char *)v121;
            v90 = v122;
          }
          else
          {
            uint64_t v97 = 0;
          }
          v98 = (char *)(v96 + 4 * v93);
          *(_DWORD *)v98 = HIDWORD(begin_node[9].__value_.__left_);
          v91 = v98 + 4;
          while (v90 != v92)
          {
            int v99 = *((_DWORD *)v90 - 1);
            v90 -= 4;
            *((_DWORD *)v98 - 1) = v99;
            v98 -= 4;
          }
          v121 = v98;
          v122 = v91;
          unint64_t v123 = v96 + 4 * v97;
          if (v92) {
            operator delete(v92);
          }
        }
        else
        {
          *(_DWORD *)v122 = HIDWORD(begin_node[9].__value_.__left_);
          v91 = v90 + 4;
        }
        v122 = v91;
      }
      isa = (MLNeuralNetworkEngine *)begin_node[1].__value_.__left_;
      if (isa)
      {
        do
        {
          v101 = isa;
          isa = (MLNeuralNetworkEngine *)isa->super.super.isa;
        }
        while (isa);
      }
      else
      {
        do
        {
          v101 = (MLNeuralNetworkEngine *)begin_node[2].__value_.__left_;
          BOOL v102 = v101->super.super.isa == (Class)begin_node;
          begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, _BlobShape>, void *>>> *)v101;
        }
        while (!v102);
      }
      begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, _BlobShape>, void *>>> *)v101;
    }
    while (v101 != (MLNeuralNetworkEngine *)&self->_currentBlobShapes.__tree_.__pair1_);
  }
  BOOL v103 = [(MLNeuralNetworkEngine *)self setEspressoBlobShapes:buf widths:&__p heights:&v133 ks:&v130 batches:&v127 sequences:&v124 ranks:&v121 error:a7];
  v18 = v118;
  if (v121)
  {
    v122 = (char *)v121;
    operator delete(v121);
  }
  if (v124)
  {
    v125 = (char *)v124;
    operator delete(v124);
  }
  if (v127)
  {
    v128 = (char *)v127;
    operator delete(v127);
  }
  if (v130)
  {
    v131 = (char *)v130;
    operator delete(v130);
  }
  if (v133)
  {
    v134 = (char *)v133;
    operator delete(v133);
  }
  if (__p)
  {
    v137 = (char *)__p;
    operator delete(__p);
  }
  if (*(void *)buf)
  {
    *(void *)&buf[8] = *(void *)buf;
    operator delete(*(void **)buf);
  }
  if (v103)
  {
LABEL_189:
    v104 = [(MLNeuralNetworkEngine *)self inputBlobNameToLastBackingMode];
    [v104 removeAllObjects];

    v105 = [(MLNeuralNetworkEngine *)self outputBlobNameToLastBackingMode];
    [v105 removeAllObjects];

    v106 = [(MLModelEngine *)self configuration];
    BOOL v107 = ([v106 profilingOptions] & 1) == 0;

    if (!v107)
    {
      v108 = espresso_plan_static_profiling_info();
      [(MLNeuralNetworkEngine *)self setEspressoProfileInfo:v108];
    }
    memset(buf, 0, sizeof(buf));
    int additional_configuration_names = espresso_get_additional_configuration_names();
    v111 = *(void **)buf;
    v110 = *(void **)&buf[8];
    if (additional_configuration_names)
    {
      v112 = *(void **)buf;
      if (*(void *)&buf[8] != *(void *)buf)
      {
        do
        {
          if (*((char *)v110 - 1) < 0) {
            operator delete((void *)*(v110 - 3));
          }
          v110 -= 3;
        }
        while (v110 != v111);
        v112 = *(void **)buf;
      }
      *(void *)&buf[8] = v111;
      v110 = v111;
      v111 = v112;
    }
    for (; v111 != v110; v111 += 3)
      std::__tree<std::string>::__emplace_unique_key_args<std::string,std::string const&>((uint64_t **)&self->_flexibleShapesConfigNamesInNet, v111, (uint64_t)v111);
    MEMORY[0x19F3C1430](&self->_currentConfigurationName, &unk_19EC86ACE);
    BOOL v20 = [(MLNeuralNetworkEngine *)self rebuildPlan:a7];
    __p = buf;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
    goto LABEL_201;
  }
LABEL_30:
  BOOL v20 = 0;
LABEL_201:

LABEL_203:
  kdebug_trace();

  return v20;
}

- (BOOL)bindDynamicOutputBuffers:(const void *)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obj = self->_classScoreVectorName;
  uint64_t v5 = [(NSString *)obj countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v24;
    uint64_t v17 = *MEMORY[0x1E4F28568];
    char v7 = 1;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v24 != v6) {
        objc_enumerationMutation(obj);
      }
      id v9 = *(id *)(*((void *)&v23 + 1) + 8 * v8);
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v9 UTF8String]);
      *(void *)buf = __p;
      if (std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&self->_currentConfigurationName.__r_.var0, __p, (long long **)buf)[56]&& ([(MLNeuralNetworkEngine *)self prepareBlobNamed:v9 forNewBlobBackingMode:0x10000 bindMode:0x20000], std::map<std::string,std::string>::at((uint64_t)a3, __p), uint64_t v10 = espresso_network_bind_buffer(), v10))
      {
        uint64_t v11 = +[MLLogging coreChannel];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v10;
          _os_log_error_impl(&dword_19E58B000, v11, OS_LOG_TYPE_ERROR, "Unable to bind dynamic shape outputs with error code: %d.", buf, 8u);
        }

        if (a4)
        {
          v12 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v27 = v17;
          v13 = objc_msgSend(NSString, "stringWithFormat:", @"Unable to bind dynamic shape outputs with error code: %d.", v10);
          v28 = v13;
          unint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
          *a4 = [v12 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v14];
        }
        char v7 = 0;
        int v15 = 0;
      }
      else
      {
        int v15 = 1;
      }
      if (v22 < 0) {
        operator delete(__p[0]);
      }
      if (!v15) {
        break;
      }
      if (v5 == ++v8)
      {
        uint64_t v5 = [(NSString *)obj countByEnumeratingWithState:&v23 objects:v29 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    char v7 = 1;
  }

  return v7 & 1;
}

- (void)prepareBlobNamed:(id)a3 forNewBlobBackingMode:(int64_t)a4 bindMode:(int)a5
{
  id v12 = a3;
  if (a5 == 0x10000) {
    [(MLNeuralNetworkEngine *)self inputBlobNameToLastBackingMode];
  }
  else {
  uint64_t v8 = [(MLNeuralNetworkEngine *)self outputBlobNameToLastBackingMode];
  }
  id v9 = [v8 objectForKeyedSubscript:v12];
  uint64_t v10 = v9;
  if (v9 && [v9 integerValue] != a4)
  {
    [v12 UTF8String];
    espresso_network_unbind_buffer();
  }
  uint64_t v11 = [NSNumber numberWithInteger:a4];
  [v8 setObject:v11 forKeyedSubscript:v12];
}

- (NSMutableDictionary)outputBlobNameToLastBackingMode
{
  return (NSMutableDictionary *)self->_submitSemaphore;
}

- (NSMutableDictionary)inputBlobNameToLastBackingMode
{
  return (NSMutableDictionary *)self->_predictionsQueue;
}

- (BOOL)_handleAddNetworkToPlanStatus:(int)a3 error:(id *)a4
{
  uint64_t v4 = *(void *)&a3;
  v28[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (self->_OutputBlobIsDynamic.__tree_.__pair3_.__value_)
    {
      char v7 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v24) = v4;
        _os_log_error_impl(&dword_19E58B000, v7, OS_LOG_TYPE_ERROR, "Failed to build the model execution plan using in-memory model with error code: %d.", buf, 8u);
      }

      if (a4)
      {
        uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v27 = *MEMORY[0x1E4F28568];
        id v9 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to build the model execution plan using in-memory model with error code: %d.", v4);
        v28[0] = v9;
        uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
        uint64_t v11 = [v8 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v10];
LABEL_16:
        *a4 = v11;
      }
    }
    else
    {
      BOOL v12 = self->_context == 0;
      v13 = +[MLLogging coreChannel];
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
      if (v12)
      {
        if (v14)
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v24) = v4;
          _os_log_error_impl(&dword_19E58B000, v13, OS_LOG_TYPE_ERROR, "Failed to build the model execution plan with error code: %d.", buf, 8u);
        }

        if (a4)
        {
          v16 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v19 = *MEMORY[0x1E4F28568];
          id v9 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to build the model execution plan with error code: %d.", v4);
          BOOL v20 = v9;
          uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
          uint64_t v11 = [v16 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v10];
          goto LABEL_16;
        }
      }
      else
      {
        if (v14)
        {
          unint64_t context = self->_context;
          *(_DWORD *)buf = 138412546;
          long long v24 = context;
          __int16 v25 = 1024;
          int v26 = v4;
          _os_log_error_impl(&dword_19E58B000, v13, OS_LOG_TYPE_ERROR, "Failed to build the model execution plan using a model architecture file '%@' with error code: %d.", buf, 0x12u);
        }

        if (a4)
        {
          int v15 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v21 = *MEMORY[0x1E4F28568];
          id v9 = [NSString stringWithFormat:@"Failed to build the model execution plan using a model architecture file '%@' with error code: %d.", self->_context, v4];
          char v22 = v9;
          uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
          uint64_t v11 = [v15 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v10];
          goto LABEL_16;
        }
      }
    }
  }
  return v4 == 0;
}

- (BOOL)rebuildPlan:(BOOL)a3 error:(id *)a4
{
  BOOL v37 = a3;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v6 = self->_classLabels;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v42 objects:v52 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v43;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v43 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        [(MLNeuralNetworkEngine *)self network];
        id v11 = v10;
        [v11 UTF8String];
        uint64_t v12 = espresso_network_declare_input();
        if (v12)
        {
          int v26 = +[MLLogging coreChannel];
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            uint64_t v35 = [v11 UTF8String];
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = v35;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v12;
            _os_log_error_impl(&dword_19E58B000, v26, OS_LOG_TYPE_ERROR, "Error in declaring input %s with error %d.", buf, 0x12u);
          }

          if (a4)
          {
            uint64_t v27 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v49 = *MEMORY[0x1E4F28568];
            v28 = objc_msgSend(NSString, "stringWithFormat:", @"Error in declaring input %s with error %d.", objc_msgSend(v11, "UTF8String"), v12);
            v50 = v28;
            v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
            *a4 = [v27 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v29];
          }
          return 0;
        }
      }
      uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v42 objects:v52 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v13 = self->_classScoreVectorName;
  uint64_t v14 = [(NSString *)v13 countByEnumeratingWithState:&v38 objects:v48 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v39;
    while (2)
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v39 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = *(void **)(*((void *)&v38 + 1) + 8 * j);
        [(MLNeuralNetworkEngine *)self network];
        id v18 = v17;
        [v18 UTF8String];
        uint64_t v19 = espresso_network_declare_output();
        if (v19)
        {
          uint64_t v30 = +[MLLogging coreChannel];
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            uint64_t v36 = [v18 UTF8String];
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = v36;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v19;
            _os_log_error_impl(&dword_19E58B000, v30, OS_LOG_TYPE_ERROR, "Error in declaring output %s with error %d.", buf, 0x12u);
          }

          if (a4)
          {
            uint64_t v31 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v46 = *MEMORY[0x1E4F28568];
            uint64_t v32 = objc_msgSend(NSString, "stringWithFormat:", @"Error in declaring output %s with error %d.", objc_msgSend(v18, "UTF8String"), v19);
            uint64_t v47 = v32;
            unint64_t v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
            *a4 = [v31 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v33];
          }
          return 0;
        }
      }
      uint64_t v14 = [(NSString *)v13 countByEnumeratingWithState:&v38 objects:v48 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  Espresso::get_internal_network();
  BOOL v20 = [(MLNeuralNetworkEngine *)self copyImagePreprocessingParametersTo:*(void *)buf error:a4];
  if (*(void *)&buf[8]) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[8]);
  }
  if (!v20) {
    return 0;
  }
  [(MLNeuralNetworkEngine *)self plan];
  int v21 = espresso_plan_build();
  if (!v21) {
    return 1;
  }
  char v22 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v21;
    _os_log_error_impl(&dword_19E58B000, v22, OS_LOG_TYPE_ERROR, "Error plan build: %d.", buf, 8u);
  }

  if ([(MLNeuralNetworkEngine *)self engine] != 10007)
  {
    if (a4)
    {
      +[MLModelErrorUtils genericErrorWithFormat:@"Error in building plan."];
      BOOL v25 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      return v25;
    }
    return 0;
  }
  [(MLNeuralNetworkEngine *)self setIsANEPathForbidden:1];
  long long v23 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19E58B000, v23, OS_LOG_TYPE_INFO, "Hardware fall back after plan build failure.", buf, 2u);
  }

  [(MLNeuralNetworkEngine *)self setHardwareFallbackDetected:1];
  long long v24 = [(MLModelEngine *)self configuration];
  BOOL v25 = [(MLNeuralNetworkEngine *)self _setupContextAndPlanWithConfiguration:v24 usingCPU:0 priority:[(MLNeuralNetworkEngine *)self priority] reshapeWithContainer:v37 error:a4];

  return v25;
}

- ($C4732ECC957FA13B9B3DF4A51A95735B)network
{
  p_compilerVersionInfo = &self->_compilerVersionInfo;
  compilerVersionInfo = self->_compilerVersionInfo;
  uint64_t v4 = p_compilerVersionInfo[1];
  result.var1 = (int)v4;
  result.var0 = compilerVersionInfo;
  return result;
}

- (BOOL)copyImagePreprocessingParametersTo:(void *)a3 error:(id *)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  memset(&v51, 0, sizeof(v51));
  if ([(MLNeuralNetworkEngine *)self isEspressoBiasPreprocessingShared])
  {
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    uint64_t v6 = [(MLNeuralNetworkEngine *)self inputLayers];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v47 objects:v56 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v48;
      id v9 = (char *)a3 + 232;
      uint64_t v10 = (char *)a3 + 240;
      id v11 = (uint64_t **)((char *)a3 + 328);
      __asm { FMOV            V9.2S, #1.0 }
      obuint64_t j = v6;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v48 != v8) {
            objc_enumerationMutation(obj);
          }
          std::string::basic_string[abi:ne180100]<0>(&buf, (char *)[*(id *)(*((void *)&v47 + 1) + 8 * i) UTF8String]);
          id v18 = (char *)std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)v9, &buf);
          if (v10 == v18 || !v18[56])
          {
            if (SHIBYTE(v51.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v51.__r_.__value_.__l.__data_);
            }
            std::string v51 = buf;
            uint64_t v6 = obj;
            goto LABEL_31;
          }
          std::string::basic_string[abi:ne180100]<0>(__p, (char *)[@"placeHolderInputName" UTF8String]);
          uint64_t v19 = (void **)std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::__find_equal<std::string>((uint64_t)&self->_params, &p_buf, __p);
          BOOL v20 = (char *)*v19;
          if (!*v19)
          {
            int v21 = (uint64_t **)v19;
            BOOL v20 = (char *)operator new(0x88uLL);
            *((_OWORD *)v20 + 2) = *(_OWORD *)__p;
            *((void *)v20 + 6) = v46;
            __p[1] = 0;
            uint64_t v46 = 0;
            __p[0] = 0;
            *((_DWORD *)v20 + 14) = 1065353216;
            *(void *)(v20 + 76) = 0;
            *(void *)(v20 + 68) = 0;
            *((_DWORD *)v20 + 21) = 0;
            *(void *)(v20 + 60) = 0x100000000;
            *((_DWORD *)v20 + 32) = 0;
            *((void *)v20 + 14) = 0;
            *((void *)v20 + 15) = 0;
            *((void *)v20 + 11) = 0;
            *((void *)v20 + 12) = 0;
            *((void *)v20 + 13) = _D9;
            std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__insert_node_at((uint64_t **)&self->_params, (uint64_t)p_buf, v21, (uint64_t *)v20);
          }
          p_std::string buf = &buf;
          char v22 = std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v11, &buf, (long long **)&p_buf);
          *(_OWORD *)(v22 + 56) = *(_OWORD *)(v20 + 56);
          long long v23 = *(_OWORD *)(v20 + 72);
          long long v24 = *(_OWORD *)(v20 + 88);
          long long v25 = *(_OWORD *)(v20 + 104);
          *(_OWORD *)(v22 + 116) = *(_OWORD *)(v20 + 116);
          *(_OWORD *)(v22 + 104) = v25;
          *(_OWORD *)(v22 + 88) = v24;
          *(_OWORD *)(v22 + 72) = v23;
          if (SHIBYTE(v46) < 0) {
            operator delete(__p[0]);
          }
          if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(buf.__r_.__value_.__l.__data_);
          }
        }
        uint64_t v6 = obj;
        uint64_t v7 = [obj countByEnumeratingWithState:&v47 objects:v56 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_31:
  }
  else
  {
    begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, Espresso::vimage2espresso_param>, void *>>> *)self->_params.__tree_.__begin_node_;
    if (begin_node != &self->_params.__tree_.__pair1_)
    {
      while (1)
      {
        uint64_t v27 = std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)a3 + 232, &begin_node[4].__value_.__left_);
        if ((char *)a3 + 240 == v27 || !v27[56]) {
          break;
        }
        buf.__r_.__value_.__r.__words[0] = (std::string::size_type)&begin_node[4];
        v28 = std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)a3 + 41, &begin_node[4].__value_.__left_, (long long **)&buf);
        *(_OWORD *)(v28 + 56) = *(_OWORD *)&begin_node[7].__value_.__left_;
        long long v29 = *(_OWORD *)&begin_node[9].__value_.__left_;
        long long v30 = *(_OWORD *)&begin_node[11].__value_.__left_;
        long long v31 = *(_OWORD *)&begin_node[13].__value_.__left_;
        *(_OWORD *)(v28 + 116) = *(_OWORD *)((char *)&begin_node[14].__value_.__left_ + 4);
        *(_OWORD *)(v28 + 104) = v31;
        *(_OWORD *)(v28 + 88) = v30;
        *(_OWORD *)(v28 + 72) = v29;
        left = (MLNeuralNetworkEngine *)begin_node[1].__value_.__left_;
        if (left)
        {
          do
          {
            unint64_t v33 = left;
            left = (MLNeuralNetworkEngine *)left->super.super.isa;
          }
          while (left);
        }
        else
        {
          do
          {
            unint64_t v33 = (MLNeuralNetworkEngine *)begin_node[2].__value_.__left_;
            _ZF = v33->super.super.isa == (Class)begin_node;
            begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, Espresso::vimage2espresso_param>, void *>>> *)v33;
          }
          while (!_ZF);
        }
        begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, Espresso::vimage2espresso_param>, void *>>> *)v33;
        if (v33 == (MLNeuralNetworkEngine *)&self->_params.__tree_.__pair1_) {
          goto LABEL_33;
        }
      }
      std::string::operator=(&v51, (const std::string *)&begin_node[4]);
    }
  }
LABEL_33:
  char v34 = HIBYTE(v51.__r_.__value_.__r.__words[2]);
  if ((v51.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(v51.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = v51.__r_.__value_.__l.__size_;
  }
  if (size)
  {
    uint64_t v36 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      long long v42 = &v51;
      if ((v51.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        long long v42 = (std::string *)v51.__r_.__value_.__r.__words[0];
      }
      LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v42;
      _os_log_error_impl(&dword_19E58B000, v36, OS_LOG_TYPE_ERROR, "Error in passing image pre-processing parameters for %s to network.", (uint8_t *)&buf, 0xCu);
    }

    char v34 = HIBYTE(v51.__r_.__value_.__r.__words[2]);
    if (a4)
    {
      BOOL v37 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v53 = *MEMORY[0x1E4F28568];
      long long v38 = &v51;
      if ((v51.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        long long v38 = (std::string *)v51.__r_.__value_.__r.__words[0];
      }
      long long v39 = objc_msgSend(NSString, "stringWithFormat:", @"Error in passing image pre-processing parameters for %s to network.", v38);
      unint64_t v54 = v39;
      long long v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
      *a4 = [v37 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v40];

      char v34 = HIBYTE(v51.__r_.__value_.__r.__words[2]);
    }
  }
  if (v34 < 0) {
    operator delete(v51.__r_.__value_.__l.__data_);
  }
  return size == 0;
}

- (BOOL)isEspressoBiasPreprocessingShared
{
  return BYTE4(self->_transferSession);
}

- (BOOL)rebuildPlan:(id *)a3
{
  return [(MLNeuralNetworkEngine *)self rebuildPlan:0 error:a3];
}

- (int)_espressoDeviceForConfiguration:(id)a3 error:(id *)a4
{
  return -3;
}

- (BOOL)modelIsEncrypted
{
  return BYTE6(self->_transferSession);
}

- (BOOL)_setMultipleBuffersOnPlan:(void *)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)_addNetworkToPlan:(void *)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (self->_OutputBlobIsDynamic.__tree_.__pair3_.__value_)
  {
    return -[MLNeuralNetworkEngine _addCompiledNetworkOrProgramToPlan:error:](self, "_addCompiledNetworkOrProgramToPlan:error:", a3);
  }
  else
  {
    unint64_t context = self->_context;
    if (context)
    {
      objc_msgSend(context, "UTF8String", a3);
      uint64_t v8 = espresso_plan_add_network();
      return [(MLNeuralNetworkEngine *)self _handleAddNetworkToPlanStatus:v8 error:a4];
    }
    else
    {
      id v9 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v13 = 0;
        _os_log_error_impl(&dword_19E58B000, v9, OS_LOG_TYPE_ERROR, "The model file path was not specified.", v13, 2u);
      }

      if (a4)
      {
        uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v14 = *MEMORY[0x1E4F28568];
        id v11 = [NSString stringWithFormat:@"The model file path was not specified."];
        v15[0] = v11;
        uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
        *a4 = [v10 errorWithDomain:@"com.apple.CoreML" code:3 userInfo:v12];
      }
      return 0;
    }
  }
}

- (id)populateOutputs:(unint64_t)a3 outputBackings:(id)a4 directlyBoundOutputFeatureNames:(id)a5 error:(id *)a6
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v41 = a4;
  id v42 = a5;
  unint64_t v10 = [(MLModelEngine *)self signpostID];
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __94__MLNeuralNetworkEngine_populateOutputs_outputBackings_directlyBoundOutputFeatureNames_error___block_invoke;
  aBlock[3] = &__block_descriptor_40_e5_v8__0l;
  aBlock[4] = v10;
  BOOL v37 = (void (**)(void))_Block_copy(aBlock);
  long long v40 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:self->_modelVersionInfo];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  obuint64_t j = self->_classScoreVectorName;
  uint64_t v11 = [(NSString *)obj countByEnumeratingWithState:&v50 objects:v59 count:16];
  if (v11)
  {
    id v38 = *(id *)v51;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(id *)v51 != v38) {
        objc_enumerationMutation(obj);
      }
      id v13 = *(id *)(*((void *)&v50 + 1) + 8 * v12);
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v13 UTF8String]);
      uint64_t v14 = *(void *)std::map<std::string,std::string>::at((uint64_t)self->_outputBuffers.__begin_ + 24 * a3, __p);
      uint64_t v15 = [(MLModelEngine *)self modelDescription];
      v16 = [v15 outputDescriptionsByName];
      uint64_t v17 = [v16 objectForKeyedSubscript:v13];

      id v18 = [v41 objectForKeyedSubscript:v13];
      char v19 = [v42 containsObject:v13];
      if (v17 && [v17 type] == 4)
      {
        uint64_t v20 = v18 != 0;
        if (v18) {
          char v21 = v19;
        }
        else {
          char v21 = 1;
        }
        if ((v21 & 1) == 0)
        {
          CFTypeID v22 = CFGetTypeID(v18);
          if (v22 != CVPixelBufferGetTypeID()) {
            goto LABEL_47;
          }
LABEL_22:
          uint64_t v24 = [(MLNeuralNetworkEngine *)self imageFeatureValueFromEbuf:v14 backingCVPixelBuffer:v18 description:v17 error:a6];
          goto LABEL_30;
        }
      }
      else
      {
        if (v18) {
          char v23 = v19;
        }
        else {
          char v23 = 1;
        }
        if (v18) {
          uint64_t v20 = 4;
        }
        else {
          uint64_t v20 = 3;
        }
        if ((v23 & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
LABEL_47:
            uint64_t v32 = +[MLLogging coreChannel];
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)std::string buf = 138412290;
              *(void *)&uint8_t buf[4] = v13;
              _os_log_error_impl(&dword_19E58B000, v32, OS_LOG_TYPE_ERROR, "The specified output backing object is not compatible with the output feature named '%@'.", buf, 0xCu);
            }

            if (a6)
            {
              unint64_t v33 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v56 = *MEMORY[0x1E4F28568];
              char v34 = [NSString stringWithFormat:@"The specified output backing object is not compatible with the output feature named '%@'.", v13, 296];
              uint64_t v57 = v34;
              uint64_t v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
              *a6 = [v33 errorWithDomain:@"com.apple.CoreML" code:1 userInfo:v35];
            }
LABEL_51:

            if (v49 < 0) {
              operator delete(__p[0]);
            }
            long long v39 = 0;
            goto LABEL_54;
          }
LABEL_24:
          uint64_t v24 = [(MLNeuralNetworkEngine *)self multiArrayFeatureValueFromEbuf:v14 backingMultiArray:v18 description:v17 outputName:v13 error:a6];
          goto LABEL_30;
        }
      }
      switch(v20)
      {
        case 0:
          goto LABEL_22;
        case 1:
          long long v25 = [v17 imageConstraint];
          uint64_t v26 = [v25 pixelType];

          if (v26 != 10
            && v26 != 40
            && ![(MLNeuralNetworkEngine *)self opacifyAndPermutePixelBuffer:v18 bufferContainsBGRA:v26 == 30 error:a6])
          {
            goto LABEL_51;
          }
          uint64_t v24 = +[MLFeatureValue featureValueWithPixelBuffer:v18];
          break;
        case 3:
          goto LABEL_24;
        case 4:
          uint64_t v24 = +[MLFeatureValue featureValueWithMultiArray:v18];
          break;
        default:
          goto LABEL_51;
      }
LABEL_30:
      uint64_t v27 = (void *)v24;
      if (!v24) {
        goto LABEL_51;
      }
      [v40 setObject:v24 forKeyedSubscript:v13];

      if (v49 < 0) {
        operator delete(__p[0]);
      }
      if (v11 == ++v12)
      {
        uint64_t v11 = [(NSString *)obj countByEnumeratingWithState:&v50 objects:v59 count:16];
        if (v11) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  long long v39 = [[MLDictionaryFeatureProvider alloc] initWithFeatureValueDictionary:v40];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  obuint64_t j = self->_classScoreVectorName;
  uint64_t v28 = [(NSString *)obj countByEnumeratingWithState:&v44 objects:v55 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v45 != v29) {
          objc_enumerationMutation(obj);
        }
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)[*(id *)(*((void *)&v44 + 1) + 8 * i) UTF8String]);
        long long v31 = *(void ***)std::map<std::string,std::string>::at((uint64_t)self->_outputBuffers.__begin_ + 24 * a3, __p);
        *(void *)std::string buf = __p;
        if (std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&self->_currentConfigurationName.__r_.var0, __p, (long long **)buf)[56])free(*v31); {
        if (v49 < 0)
        }
          operator delete(__p[0]);
      }
      uint64_t v28 = [(NSString *)obj countByEnumeratingWithState:&v44 objects:v55 count:16];
    }
    while (v28);
  }
LABEL_54:

  v37[2](v37);

  return v39;
}

uint64_t __94__MLNeuralNetworkEngine_populateOutputs_outputBackings_directlyBoundOutputFeatureNames_error___block_invoke()
{
  return kdebug_trace();
}

- (void)populateMultiArrayShape:(id *)a3 strides:(id *)a4 forEbuf:(id *)a5 featureDescription:(id)a6 ndArrayInterpretation:(BOOL)a7
{
  v61[5] = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  id v11 = v10;
  long long v45 = v10;
  if (!v10)
  {
    long long v48 = 0;
    if (a7) {
      goto LABEL_3;
    }
LABEL_10:
    uint64_t v24 = [NSNumber numberWithUnsignedLong:a5->var8];
    v61[0] = v24;
    long long v25 = [NSNumber numberWithUnsignedLong:a5->var7];
    v61[1] = v25;
    uint64_t v26 = [NSNumber numberWithUnsignedLong:a5->var6];
    v61[2] = v26;
    uint64_t v27 = [NSNumber numberWithUnsignedLong:a5->var5];
    v61[3] = v27;
    uint64_t v28 = [NSNumber numberWithUnsignedLong:a5->var4];
    v61[4] = v28;
    uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:5];

    id v50 = 0;
    id v51 = 0;
    +[MLDataConversionUtils populateShapeAndStrideFor:v45 inputShape:v29 outputShape:&v51 outputStrides:&v50 error:0];
    id v22 = v51;
    id v23 = v50;

    goto LABEL_15;
  }
  uint64_t v12 = [v10 multiArrayConstraint];
  long long v48 = [v12 shapeConstraint];

  if (!a7) {
    goto LABEL_10;
  }
LABEL_3:
  id v13 = [(MLNeuralNetworkEngine *)self modelVersionInfo];
  uint64_t v14 = [v13 majorVersion];
  if (v11 && v14 <= 4 && v48)
  {
    uint64_t v15 = [v48 type];

    if (v15 != 1)
    {
      unint64_t var7 = a5->var7;
      unint64_t var8 = a5->var8;
      unint64_t var5 = a5->var5;
      unint64_t var6 = a5->var6;
      unint64_t var4 = a5->var4;
      uint64_t v55 = 0;
      uint64_t v56 = &v55;
      uint64_t v57 = 0x3032000000;
      v58 = __Block_byref_object_copy__3093;
      int v59 = __Block_byref_object_dispose__3094;
      id v60 = 0;
      char v21 = [v48 shapeSet];
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __106__MLNeuralNetworkEngine_populateMultiArrayShape_strides_forEbuf_featureDescription_ndArrayInterpretation___block_invoke;
      v49[3] = &unk_1E59A3D80;
      v49[4] = &v55;
      v49[5] = var8 * var7 * var6 * var5 * var4;
      [v21 enumerateObjectsUsingBlock:v49];

      id v22 = (id)v56[5];
      if (v22)
      {
        id v23 = +[MLDataConversionUtils stridesForShape:v22];
      }
      else
      {
        id v23 = 0;
      }
      _Block_object_dispose(&v55, 8);

LABEL_15:
      if (v22) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
  }
  else
  {
  }
  espresso_buffer_unpack_tensor_shape();
  long long v30 = [NSNumber numberWithUnsignedLong:a5->var4];
  unint64_t v54 = v30;
  id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];

  if (v22)
  {
    id v23 = +[MLDataConversionUtils stridesForShape:v22];
    goto LABEL_21;
  }
  id v23 = 0;
LABEL_20:
  long long v31 = [NSNumber numberWithUnsignedLong:a5->var8];
  v53[0] = v31;
  uint64_t v32 = [NSNumber numberWithUnsignedLong:a5->var7];
  v53[1] = v32;
  unint64_t v33 = [NSNumber numberWithUnsignedLong:a5->var6];
  v53[2] = v33;
  char v34 = [NSNumber numberWithUnsignedLong:a5->var5];
  v53[3] = v34;
  uint64_t v35 = [NSNumber numberWithUnsignedLong:a5->var4];
  v53[4] = v35;
  id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:5];

  uint64_t v36 = [NSNumber numberWithUnsignedLong:a5->var13];
  v52[0] = v36;
  BOOL v37 = [NSNumber numberWithUnsignedLong:a5->var12];
  v52[1] = v37;
  id v38 = [NSNumber numberWithUnsignedLong:a5->var11];
  v52[2] = v38;
  long long v39 = [NSNumber numberWithUnsignedLong:a5->var10];
  v52[3] = v39;
  long long v40 = [NSNumber numberWithUnsignedLong:a5->var9];
  v52[4] = v40;
  id v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:5];

  uint64_t v42 = [v41 mutableCopy];
  id v23 = (id)v42;
LABEL_21:
  if (a3)
  {
    id v43 = v22;
    *a3 = v43;

    id v22 = 0;
  }
  if (a4)
  {
    id v44 = v23;
    *a4 = v44;

    id v23 = 0;
  }
}

- (MLNeuralNetworkEngine)initWithContainer:(id)a3 configuration:(id)a4 error:(id *)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (uint64_t **)a3;
  id v44 = a4;
  long long v45 = v8;
  id v9 = [v8 modelDescription];
  v46.receiver = self;
  v46.super_class = (Class)MLNeuralNetworkEngine;
  id v10 = [(MLModelEngine *)&v46 initWithDescription:v9 configuration:v44];

  if (v10)
  {
    id v11 = [v8 modelDescription];
    id v12 = [v11 inputDescriptionsByName];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v47 objects:buf count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v48;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v48 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v17 = [v13 objectForKeyedSubscript:*(void *)(*((void *)&v47 + 1) + 8 * i)];
          BOOL v18 = [v17 type] == 8;

          if (v18)
          {

            unint64_t v33 = +[MLLogging coreChannel];
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)std::string buf = 0;
              _os_log_error_impl(&dword_19E58B000, v33, OS_LOG_TYPE_ERROR, "The model uses stateful prediction, but this model engine doesn't support it.", buf, 2u);
            }

            if (a5)
            {
              char v34 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v51 = *MEMORY[0x1E4F28568];
              uint64_t v35 = [NSString stringWithFormat:@"The model uses stateful prediction, but this model engine doesn't support it."];
              long long v52 = v35;
              uint64_t v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
              *a5 = [v34 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v36];
            }
            uint64_t v32 = 0;
            goto LABEL_27;
          }
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v47 objects:buf count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    char v19 = v44;
    if (![v10 collectParametersFromContainer:v8 configuration:v44 error:a5]
      || (objc_msgSend(v10, "_setupContextAndPlanWithConfiguration:priority:error:", v44, objc_msgSend(v10, "priority"), a5) & 1) == 0)
    {
      uint64_t v32 = 0;
      goto LABEL_28;
    }
    char v21 = v8 + 1;
    uint64_t v20 = (uint64_t **)v8[1];
    id v43 = v8 + 2;
    if (v20 != v8 + 2)
    {
      id v41 = v8 + 7;
      uint64_t v42 = v8 + 4;
      long long v39 = v8 + 13;
      long long v40 = v8 + 10;
      id v38 = v8 + 16;
      do
      {
        *(void *)std::string buf = v20 + 4;
        int v22 = *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v21, v20 + 4, (long long **)buf)+ 14);
        *(void *)std::string buf = v20 + 4;
        int v23 = *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v42, v20 + 4, (long long **)buf)+ 14);
        *(void *)std::string buf = v20 + 4;
        int v24 = *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v41, v20 + 4, (long long **)buf)+ 14);
        *(void *)std::string buf = v20 + 4;
        int v25 = *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v40, v20 + 4, (long long **)buf)+ 14);
        *(void *)std::string buf = v20 + 4;
        int v26 = *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v39, v20 + 4, (long long **)buf)+ 14);
        *(void *)std::string buf = v20 + 4;
        int v27 = *((_DWORD *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v38, v20 + 4, (long long **)buf)+ 14);
        *(void *)std::string buf = v20 + 4;
        uint64_t v28 = std::__tree<std::__value_type<std::string,_BlobShape>,std::__map_value_compare<std::string,std::__value_type<std::string,_BlobShape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,_BlobShape>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)v10 + 13, v20 + 4, (long long **)buf);
        *((_DWORD *)v28 + 14) = v22;
        *((_DWORD *)v28 + 15) = v23;
        *((_DWORD *)v28 + 16) = v24;
        *((_DWORD *)v28 + 17) = v25;
        *((_DWORD *)v28 + 18) = v26;
        *((_DWORD *)v28 + 19) = v27;
        uint64_t v29 = v20[1];
        if (v29)
        {
          do
          {
            long long v30 = (uint64_t **)v29;
            uint64_t v29 = (uint64_t *)*v29;
          }
          while (v29);
        }
        else
        {
          do
          {
            long long v30 = (uint64_t **)v20[2];
            BOOL v31 = *v30 == (uint64_t *)v20;
            uint64_t v20 = v30;
          }
          while (!v31);
        }
        uint64_t v20 = v30;
        uint64_t v8 = v45;
      }
      while (v30 != v43);
    }
  }
  uint64_t v32 = (MLNeuralNetworkEngine *)v10;
LABEL_27:
  char v19 = v44;
LABEL_28:

  return v32;
}

- (BOOL)_matchEngineToOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 predictionUsesCPU]) {
    goto LABEL_9;
  }
  uint64_t v8 = +[MLInternalSettings globalSettings];
  if ([v8 restrictNeuralNetworksToUseCPUOnly])
  {
LABEL_8:

    goto LABEL_9;
  }
  id v9 = [(MLModelEngine *)self configuration];
  if (![v9 computeUnits])
  {

    goto LABEL_8;
  }
  if (LOBYTE(self->_compilerOutput))
  {
    int v10 = BYTE1(self->_compilerOutput);

    if (!v10) {
      goto LABEL_19;
    }
LABEL_9:
    uint64_t v11 = 1;
    char v12 = 1;
    if (!BYTE3(self->_transferSession)) {
      goto LABEL_13;
    }
    goto LABEL_10;
  }

LABEL_19:
  uint64_t v11 = 0;
LABEL_10:
  if (BYTE3(self->_transferSession)) {
    char v12 = v11 ^ 1;
  }
  else {
    char v12 = 0;
  }
LABEL_13:
  if ((v12 & 1) != 0 || v13 != [(MLNeuralNetworkEngine *)self priority])
  {
    [(MLNeuralNetworkEngine *)self _deallocContextAndPlan];
    BOOL v14 = [(MLNeuralNetworkEngine *)self _setupContextAndPlanWithForceCPU:v11 priority:v13 error:a4];
  }
  else
  {
    BOOL v14 = 1;
  }

  return v14;
}

- (int)priority
{
  return *(_DWORD *)&self->_isGPUPathForbidden;
}

- (BOOL)_setupContextAndPlanWithConfiguration:(id)a3 usingCPU:(BOOL)a4 priority:(int)a5 error:(id *)a6
{
  return [(MLNeuralNetworkEngine *)self _setupContextAndPlanWithConfiguration:a3 usingCPU:a4 priority:*(void *)&a5 reshapeWithContainer:0 error:a6];
}

- (BOOL)_setupContextAndPlanWithConfiguration:(id)a3 priority:(int)a4 error:(id *)a5
{
  return [(MLNeuralNetworkEngine *)self _setupContextAndPlanWithConfiguration:a3 usingCPU:0 priority:*(void *)&a4 error:a5];
}

- (id)multiArrayFeatureValueFromEbuf:(id *)a3 backingMultiArray:(id)a4 description:(id)a5 outputName:(id)a6 error:(id *)a7
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v43 = a4;
  id v12 = a5;
  id v42 = a6;
  id v45 = 0;
  id v46 = 0;
  [(MLNeuralNetworkEngine *)self populateMultiArrayShape:&v46 strides:&v45 forEbuf:a3 featureDescription:v12 ndArrayInterpretation:BYTE1(self->_transferSession)];
  id v13 = v46;
  id v14 = v45;
  uint64_t v15 = [[MLMultiArray alloc] initWithDataPointer:a3->var0 shape:v13 dataType:65568 strides:v14 deallocator:0 error:a7];
  id v41 = v13;
  if (!v15)
  {
    id v26 = 0;
    goto LABEL_27;
  }
  v16 = [(MLNeuralNetworkEngine *)self activeFunction];
  uint64_t v17 = [NSString stringWithUTF8String:"main"];
  int v18 = [v16 isEqualToString:v17];

  uint64_t v19 = 65600;
  if (v18) {
    uint64_t v20 = 65600;
  }
  else {
    uint64_t v20 = 65568;
  }
  if (v12)
  {
    char v21 = [v12 multiArrayConstraint];
    BOOL v22 = v21 == 0;

    if (!v22)
    {
      int v23 = [v12 multiArrayConstraint];
      uint64_t v24 = [v23 dataType];
      if ((unint64_t)(v24 - 65552) <= 0x30 && ((1 << (v24 - 16)) & 0x1000000010001) != 0
        || v24 == 131104)
      {
        uint64_t v19 = [v23 dataType];
      }
      else
      {
        BOOL v37 = +[MLLogging coreChannel];
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          uint64_t v39 = [v23 dataType];
          *(_DWORD *)std::string buf = 134217984;
          uint64_t v48 = v39;
          _os_log_error_impl(&dword_19E58B000, v37, OS_LOG_TYPE_ERROR, "Model description's MLMultiArrayConstraint states unknown data type (%ld), which should never happen, but the framework falls back to use Double.", buf, 0xCu);
        }
      }
      uint64_t v20 = v19;
    }
  }
  if (v43)
  {
    int v25 = (MLMultiArray *)v43;
  }
  else
  {
    int v27 = [MLMultiArray alloc];
    uint64_t v28 = [(MLMultiArray *)v15 shape];
    int v25 = [(MLMultiArray *)v27 initWithShape:v28 dataType:v20 error:a7];

    if (!v25)
    {
LABEL_25:
      id v26 = 0;
      goto LABEL_26;
    }
  }
  if (![(MLMultiArray *)v15 copyIntoMultiArray:v25 error:a7]) {
    goto LABEL_25;
  }
  uint64_t v29 = +[MLFeatureValue featureValueWithMultiArray:v25];
  if (BYTE1(self->_transferSession))
  {
    id v30 = [(MLNeuralNetworkEngine *)self modelVersionInfo];
    uint64_t v31 = [v30 majorVersion];
    if (!v12 || v31 < 5)
    {
LABEL_22:

      goto LABEL_23;
    }
    uint64_t v32 = [v12 multiArrayConstraint];
    BOOL v33 = v32 == 0;

    if (!v33)
    {
      char v34 = [v12 multiArrayConstraint];
      id v44 = 0;
      char v35 = [v34 isAllowedValue:v29 isNeuralNetworkInputOrOutput:1 usingRank5Mapping:0 featureName:v42 error:&v44];
      id v30 = v44;

      if ((v35 & 1) == 0)
      {
        id v38 = +[MLLogging coreChannel];
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          long long v40 = [v30 localizedDescription];
          *(_DWORD *)std::string buf = 138412546;
          uint64_t v48 = (uint64_t)v42;
          __int16 v49 = 2112;
          long long v50 = v40;
          _os_log_error_impl(&dword_19E58B000, v38, OS_LOG_TYPE_ERROR, "Invalid shape for output feature '%@'. (Underlying error: %@)", buf, 0x16u);
        }
        if (a7)
        {
          *a7 = +[MLModelErrorUtils errorWithCode:1, v30, @"Invalid shape for output feature '%@'.", v42 underlyingError format];
        }

        id v26 = 0;
        goto LABEL_24;
      }
      goto LABEL_22;
    }
  }
LABEL_23:
  id v26 = v29;
LABEL_24:

LABEL_26:
LABEL_27:

  return v26;
}

- (MLVersionInfo)modelVersionInfo
{
  return (MLVersionInfo *)self->_espressoInputShapes;
}

- (NSString)activeFunction
{
  return (NSString *)&self->_defaultOptionalValues->super.isa;
}

+ (id)loadModelFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  kdebug_trace();
  uint64_t v15 = objc_msgSend((id)objc_msgSend(a1, "containerClass"), "containerFromCompiledArchive:modelVersionInfo:compilerVersionInfo:configuration:error:", a3, v12, v13, v14, a7);
  if (v15) {
    v16 = (void *)[objc_alloc((Class)a1) initWithContainer:v15 configuration:v14 error:a7];
  }
  else {
    v16 = 0;
  }

  kdebug_trace();

  return v16;
}

void __62__MLNeuralNetworkEngine_predictionFromFeatures_options_error___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x19F3C29E0]();
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  obuint64_t j = *(id *)(v5 + 40);
  char v6 = [v3 _matchEngineToOptions:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  if (v6)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    id v28 = *(id *)(v10 + 40);
    uint64_t v11 = [v7 evaluateInputs:v9 options:v8 error:&v28];
    objc_storeStrong((id *)(v10 + 40), v28);
    uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
  else
  {
    uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
    id v13 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = 0;
  }

  uint64_t v15 = [*(id *)(a1 + 32) classLabels];
  if (v15)
  {
    uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);

    if (v16)
    {
      uint64_t v17 = [*(id *)(a1 + 32) signpostID];
      kdebug_trace();
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __62__MLNeuralNetworkEngine_predictionFromFeatures_options_error___block_invoke_2;
      aBlock[3] = &__block_descriptor_40_e5_v8__0l;
      aBlock[4] = v17;
      int v18 = (void (**)(void))_Block_copy(aBlock);
      uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      uint64_t v20 = *(void **)(a1 + 32);
      uint64_t v21 = *(void *)(a1 + 40);
      uint64_t v22 = *(void *)(*(void *)(a1 + 56) + 8);
      id v26 = *(id *)(v22 + 40);
      uint64_t v23 = [v20 addClassifierInformationToOutput:v19 options:v21 error:&v26];
      objc_storeStrong((id *)(v22 + 40), v26);
      uint64_t v24 = *(void *)(*(void *)(a1 + 64) + 8);
      int v25 = *(void **)(v24 + 40);
      *(void *)(v24 + 40) = v23;

      v18[2](v18);
    }
  }
}

- (id)evaluateInputs:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(MLNeuralNetworkEngine *)self activeFunction];
  uint64_t v11 = [NSString stringWithUTF8String:"main"];
  unsigned int v12 = [v10 isEqualToString:v11];
  if (v8) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0;
  }

  uint64_t v14 = [(MLNeuralNetworkEngine *)self evaluateInputs:v8 options:v9 verifyInputs:v13 error:a5];

  return v14;
}

- (id)evaluateInputs:(id)a3 options:(id)a4 verifyInputs:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  kdebug_trace();
  id v12 = v10;
  uint64_t v13 = v12;
  if (v7)
  {
    uint64_t v14 = [(MLNeuralNetworkEngine *)self verifyInputs:v12 error:a6];

    id v15 = (id)v14;
    if (!v14) {
      goto LABEL_7;
    }
  }
  else
  {
    id v15 = v12;
    if (!v12)
    {
LABEL_6:
      unint64_t v16 = [(MLNeuralNetworkEngine *)self obtainBuffer];
      uint64_t v30 = 0;
      uint64_t v31 = &v30;
      uint64_t v32 = 0x3032000000;
      BOOL v33 = __Block_byref_object_copy__3093;
      char v34 = __Block_byref_object_dispose__3094;
      id v35 = 0;
      modelFilePath = self->_modelFilePath;
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      uint64_t v22 = __67__MLNeuralNetworkEngine_evaluateInputs_options_verifyInputs_error___block_invoke_182;
      uint64_t v23 = &unk_1E59A3D30;
      int v27 = &v30;
      uint64_t v24 = self;
      id v15 = v15;
      id v25 = v15;
      unint64_t v28 = v16;
      id v26 = v11;
      uint64_t v29 = a6;
      dispatch_sync(modelFilePath, &v20);
      -[MLNeuralNetworkEngine releaseBuffer:](self, "releaseBuffer:", v16, v20, v21, v22, v23, v24);
      id v18 = (id)v31[5];

      _Block_object_dispose(&v30, 8);
      goto LABEL_8;
    }
  }
  if ([(MLNeuralNetworkEngine *)self resetSizes:v15 error:a6]) {
    goto LABEL_6;
  }
LABEL_7:
  id v18 = 0;
LABEL_8:

  kdebug_trace();

  return v18;
}

- (id)verifyInputs:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = [(MLModelEngine *)self signpostID];
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__MLNeuralNetworkEngine_verifyInputs_error___block_invoke;
  aBlock[3] = &__block_descriptor_40_e5_v8__0l;
  aBlock[4] = v7;
  id v8 = (void (**)(void))_Block_copy(aBlock);
  id v9 = [(MLNeuralNetworkEngine *)self inputFeatureConformer];

  if (v9)
  {
    id v10 = [(MLNeuralNetworkEngine *)self inputFeatureConformer];
    id v11 = [v10 conformFeatures:v6 error:a4];
  }
  else
  {
    id v11 = v6;
  }
  v8[2](v8);

  return v11;
}

- (MLFeatureProviderConformer)inputFeatureConformer
{
  return (MLFeatureProviderConformer *)objc_getProperty(self, a2, 448, 1);
}

uint64_t __44__MLNeuralNetworkEngine_verifyInputs_error___block_invoke()
{
  return kdebug_trace();
}

- (BOOL)resetSizes:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = kdebug_trace();
  id v8 = (void *)MEMORY[0x19F3C29E0](v7);
  if (![(MLNeuralNetworkEngine *)self usingEspressoConfigurations])
  {
    id v10 = 0;
    goto LABEL_5;
  }
  id v15 = 0;
  BOOL v9 = [(MLNeuralNetworkEngine *)self resetSizesWithEspressoConfigurations:v6 error:&v15];
  id v10 = v15;
  if (!v9)
  {
LABEL_5:
    id v14 = v10;
    BOOL v11 = [(MLNeuralNetworkEngine *)self resetSizesNoAutoRelease:v6 error:&v14];
    id v12 = v14;

    id v10 = v12;
    goto LABEL_6;
  }
  BOOL v11 = 1;
LABEL_6:
  if (a4 && v10) {
    *a4 = v10;
  }

  kdebug_trace();
  return v11;
}

- (BOOL)usingEspressoConfigurations
{
  return self->_flexibleShapesConfigNamesInNet.__tree_.__pair3_.__value_ != 0;
}

- (void)releaseBuffer:(unint64_t)a3
{
  uint64_t v4 = self;
  objc_sync_enter(v4);
  *(unint64_t *)((char *)v4->_bufferAvailable.__begin_ + ((a3 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << a3;
  objc_sync_exit(v4);

  probabilityDictionarySharedKeySet = v4->_probabilityDictionarySharedKeySet;

  dispatch_semaphore_signal(probabilityDictionarySharedKeySet);
}

- (unint64_t)obtainBuffer
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_probabilityDictionarySharedKeySet, 0xFFFFFFFFFFFFFFFFLL);
  v3 = self;
  objc_sync_enter(v3);
  begin = (uint64_t *)v3->_bufferAvailable.__begin_;
  uint64_t v5 = *begin;
  if (*begin)
  {
    unint64_t v6 = 0;
    uint64_t v7 = -2;
LABEL_6:
    uint64_t *begin = v5 & v7;
    goto LABEL_7;
  }
  if ((v5 & 2) != 0)
  {
    uint64_t v7 = -3;
    unint64_t v6 = 1;
    goto LABEL_6;
  }
  unint64_t v6 = 3;
LABEL_7:
  objc_sync_exit(v3);

  return v6;
}

- (NSArray)classLabels
{
  return *(NSArray **)&self->_engine;
}

void __67__MLNeuralNetworkEngine_evaluateInputs_options_verifyInputs_error___block_invoke_182(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) evaluateInputs:*(void *)(a1 + 40) bufferIndex:*(void *)(a1 + 64) options:*(void *)(a1 + 48) error:*(void *)(a1 + 72)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (unint64_t)predictionTypeForKTrace
{
  return 41;
}

- (BOOL)recordsPredictionEvent
{
  uint64_t v2 = [(MLNeuralNetworkEngine *)self activeFunction];
  uint64_t v3 = [NSString stringWithUTF8String:"main"];
  char v4 = [v2 isEqualToString:v3];

  return v4;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v27 = 0;
  unint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__3093;
  uint64_t v31 = __Block_byref_object_dispose__3094;
  id v32 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__3093;
  id v25 = __Block_byref_object_dispose__3094;
  id v26 = 0;
  bufferSemaphore = self->_bufferSemaphore;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__MLNeuralNetworkEngine_predictionFromFeatures_options_error___block_invoke;
  block[3] = &unk_1E59A3E48;
  block[4] = self;
  id v11 = v9;
  id v17 = v11;
  uint64_t v19 = &v21;
  uint64_t v20 = &v27;
  id v12 = v8;
  id v18 = v12;
  dispatch_sync(bufferSemaphore, block);
  if (a5)
  {
    uint64_t v13 = (void *)v22[5];
    if (v13) {
      *a5 = v13;
    }
  }
  id v14 = (id)v28[5];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v14;
}

- (id)evaluateInputs:(id)a3 bufferIndex:(unint64_t)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v37 = 0;
  BOOL v13 = [(MLNeuralNetworkEngine *)self bindInputFeatures:v10 bufferIndex:a4 cleanUpBlocks:v12 directlyBoundFeatureNames:&v37 error:a6];
  id v14 = v37;
  if (!v13
    || ![(MLNeuralNetworkEngine *)self updateDynamicOutputBlobIndicatorCacheAndReturnError:a6])
  {
    id v27 = 0;
    goto LABEL_24;
  }
  id v15 = [v11 outputBackings];
  unint64_t v16 = [v11 automaticOutputBackingMode];
  id v17 = [(MLNeuralNetworkEngine *)self completeOutputBackings:v15 automaticOutputBackingMode:v16 error:a6];

  if (v17)
  {
    id v18 = v11;
    uint64_t v30 = v11;
    begin = (char *)self->_outputBuffers.__begin_;
    uint64_t v20 = [v18 automaticOutputBackingMode];
    id v36 = 0;
    BOOL v21 = [(MLNeuralNetworkEngine *)self bindOutputBuffers:&begin[24 * a4] outputBackings:v17 automaticOutputBackingMode:v20 directlyBoundOutputFeatureNames:&v36 error:a6];
    id v31 = v36;

    id v11 = v30;
    if (v21)
    {
      if (![(MLNeuralNetworkEngine *)self executePlan:[(MLNeuralNetworkEngine *)self plan] error:a6])goto LABEL_22; {
      long long v34 = 0u;
      }
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      uint64_t v29 = v17;
      uint64_t v22 = [v12 reverseObjectEnumerator];
      uint64_t v23 = [v22 countByEnumeratingWithState:&v32 objects:v38 count:16];
      if (v23)
      {
        uint64_t v24 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v33 != v24) {
              objc_enumerationMutation(v22);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v32 + 1) + 8 * i) + 16))();
          }
          uint64_t v23 = [v22 countByEnumeratingWithState:&v32 objects:v38 count:16];
        }
        while (v23);
      }

      id v17 = v29;
      if ([(MLNeuralNetworkEngine *)self bindDynamicOutputBuffers:(char *)self->_outputBuffers.__begin_ + 24 * a4 error:a6])
      {
        id v11 = v30;
        id v26 = [(MLNeuralNetworkEngine *)self populateOutputs:a4 outputBackings:v29 directlyBoundOutputFeatureNames:v31 error:a6];
        if (v26
          && [v30 hasDirectBindingExpectations]
          && ([v30 validateExpectationsWithDirectlyBoundInputs:v14 outputs:v31 error:a6] & 1) == 0)
        {
          id v27 = 0;
        }
        else
        {
          id v27 = v26;
        }
      }
      else
      {
LABEL_22:
        id v27 = 0;
        id v11 = v30;
      }
      goto LABEL_23;
    }
  }
  else
  {
    id v31 = 0;
  }
  id v27 = 0;
LABEL_23:

LABEL_24:

  return v27;
}

- (void)plan
{
  return (void *)self->_numInputs;
}

- (BOOL)updateDynamicOutputBlobIndicatorCacheAndReturnError:(id *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = self->_classScoreVectorName;
  uint64_t v5 = [(NSString *)obj countByEnumeratingWithState:&v20 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v21;
    uint64_t v16 = *MEMORY[0x1E4F28568];
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(id *)(*((void *)&v20 + 1) + 8 * v7);
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v8 UTF8String]);
        uint64_t is_dynamic = espresso_blob_is_dynamic();
        if (is_dynamic)
        {
          id v10 = +[MLLogging coreChannel];
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)std::string buf = 138412546;
            *(void *)&uint8_t buf[4] = v8;
            __int16 v27 = 1024;
            int v28 = is_dynamic;
            _os_log_error_impl(&dword_19E58B000, v10, OS_LOG_TYPE_ERROR, "Failed to determine whether the output feature named '%@' has a dynamic shape with error: %d.", buf, 0x12u);
          }

          if (a3)
          {
            id v11 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v24 = v16;
            id v12 = [NSString stringWithFormat:@"Failed to determine whether the output feature named '%@' has a dynamic shape with error: %d.", v8, is_dynamic];
            id v25 = v12;
            BOOL v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
            *a3 = [v11 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v13];
          }
        }
        else
        {
          *(void *)std::string buf = __p;
          std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&self->_currentConfigurationName.__r_.var0, __p, (long long **)buf)[56] = 0;
        }
        if (v19 < 0) {
          operator delete(__p[0]);
        }
        if (is_dynamic)
        {
          BOOL v14 = 0;
          goto LABEL_19;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSString *)obj countByEnumeratingWithState:&v20 objects:v29 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 1;
LABEL_19:

  return v14;
}

- (BOOL)executePlan:(void *)a3 error:(id *)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [(MLNeuralNetworkEngine *)self submitSemaphore];
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);

  kdebug_trace();
  uint64_t v7 = espresso_plan_execute_sync();
  if (v7)
  {
    id v8 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::string buf = 67109120;
      int v15 = v7;
      _os_log_error_impl(&dword_19E58B000, v8, OS_LOG_TYPE_ERROR, "Unable to compute the prediction using a neural network model. It can be an invalid input data or broken/unsupported model (error code: %d).", buf, 8u);
    }

    if (a4)
    {
      id v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F28568];
      id v10 = objc_msgSend(NSString, "stringWithFormat:", @"Unable to compute the prediction using a neural network model. It can be an invalid input data or broken/unsupported model (error code: %d).", v7);
      v17[0] = v10;
      id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
      *a4 = [v9 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v11];
    }
  }
  kdebug_trace();
  id v12 = [(MLNeuralNetworkEngine *)self submitSemaphore];
  dispatch_semaphore_signal(v12);

  return v7 == 0;
}

- (OS_dispatch_semaphore)submitSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 408, 1);
}

- (BOOL)bindOutputBuffers:(const void *)a3 outputBackings:(id)a4 automaticOutputBackingMode:(id)a5 directlyBoundOutputFeatureNames:(id *)a6 error:(id *)a7
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v50 = a4;
  id v44 = a5;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  obuint64_t j = self->_classScoreVectorName;
  uint64_t v9 = [(NSString *)obj countByEnumeratingWithState:&v55 objects:v68 count:16];
  if (!v9)
  {
    int v29 = 0;
    id v45 = 0;
    goto LABEL_54;
  }
  id v45 = 0;
  uint64_t v49 = *(void *)v56;
  uint64_t v46 = *MEMORY[0x1E4F28568];
  do
  {
    uint64_t v10 = 0;
    do
    {
      if (*(void *)v56 != v49) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(id *)(*((void *)&v55 + 1) + 8 * v10);
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v11 UTF8String]);
      *(void *)std::string buf = __p;
      if (std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&self->_currentConfigurationName.__r_.var0, __p, (long long **)buf)[56])
      {
        id v12 = [v50 objectForKeyedSubscript:v11];
        BOOL v13 = v12 == 0;

        if (v13)
        {
          int v29 = 3;
          goto LABEL_41;
        }
        BOOL v14 = +[MLLogging coreChannel];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)std::string buf = 138412290;
          *(void *)&uint8_t buf[4] = v11;
          _os_log_error_impl(&dword_19E58B000, v14, OS_LOG_TYPE_ERROR, "Output backings cannot be used for a dynamic output feature named '%@'.", buf, 0xCu);
        }

        if (!a7)
        {
          int v29 = 1;
          goto LABEL_41;
        }
        int v15 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v66 = v46;
        uint64_t v16 = [NSString stringWithFormat:@"Output backings cannot be used for a dynamic output feature named '%@'.", v11];
        uint64_t v67 = v16;
        id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
        *a7 = [v15 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v17];
        goto LABEL_39;
      }
      uint64_t v16 = [v50 objectForKeyedSubscript:v11];
      id v18 = [(MLModelEngine *)self modelDescription];
      char v19 = [v18 outputDescriptionsByName];
      id v17 = [v19 objectForKeyedSubscript:v11];

      long long v20 = [(MLNeuralNetworkEngine *)self activeFunction];
      long long v21 = [NSString stringWithUTF8String:"main"];
      int v22 = [v20 isEqualToString:v21];

      if (v22)
      {
        long long v23 = [(MLNeuralNetworkEngine *)self pixelBufferFromOutputBacking:v16 forFeature:v17];
        if (v23)
        {
          if (CVPixelBufferGetPixelFormatType(v23) == 1278226536)
          {
            [(MLNeuralNetworkEngine *)self prepareBlobNamed:v11 forNewBlobBackingMode:-1 bindMode:0x20000];
            id v24 = v11;
            [v24 UTF8String];
            int v25 = espresso_network_bind_cvpixelbuffer();
            if (!v25)
            {
              long long v40 = v45;
              if (!v45) {
                long long v40 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
              }
              id v45 = v40;
              [v40 addObject:v24];
              int v29 = 3;
              goto LABEL_40;
            }
            id v26 = +[MLLogging coreChannel];
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)std::string buf = 138412546;
              *(void *)&uint8_t buf[4] = v24;
              __int16 v64 = 1024;
              int v65 = v25;
              _os_log_impl(&dword_19E58B000, v26, OS_LOG_TYPE_INFO, "Performance warning: Failed to directly bind output pixel buffer for output feature named '%@' with error: %i. Continuing with non-direct output binding.", buf, 0x12u);
            }
          }
        }
      }
      unsigned int v52 = 0x10000;
      uint64_t v27 = *(void *)std::map<std::string,std::string>::at((uint64_t)a3, __p);
      if (![(MLNeuralNetworkEngine *)self tryToSetOutputBacking:v16 forFeatureName:v11 toEbuf:v27 reportPointerFlags:&v52 error:a7])goto LABEL_39; {
      if (v52 == 0x10000)
      }
      {
        uint64_t v30 = [v44 objectForKeyedSubscript:v11];
        int v31 = [v30 isEqual:@"MLAutomaticOutputBackingModeForced"];

        if (v31)
        {
          long long v32 = +[MLLogging coreChannel];
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)std::string buf = 138412290;
            *(void *)&uint8_t buf[4] = v11;
            _os_log_error_impl(&dword_19E58B000, v32, OS_LOG_TYPE_ERROR, "Forced automatic output backings was requested but we couldn't bind the fabricate output buffer for feature named '%@'.", buf, 0xCu);
          }

          if (!a7) {
            goto LABEL_39;
          }
          long long v33 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v61 = v46;
          long long v34 = [NSString stringWithFormat:@"Forced automatic output backings was requested but we couldn't bind the fabricate output buffer for feature named '%@'.", v11];
          v62 = v34;
          long long v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
          id v36 = [v33 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v35];
          goto LABEL_38;
        }
        *(void *)(v27 + 160) = 0;
        *(_OWORD *)(v27 + 128) = 0u;
        *(_OWORD *)(v27 + 144) = 0u;
        *(_OWORD *)(v27 + 96) = 0u;
        *(_OWORD *)(v27 + 112) = 0u;
        *(_OWORD *)(v27 + 64) = 0u;
        *(_OWORD *)(v27 + 80) = 0u;
        *(_OWORD *)(v27 + 32) = 0u;
        *(_OWORD *)(v27 + 48) = 0u;
        *(_OWORD *)uint64_t v27 = 0u;
        *(_OWORD *)(v27 + 16) = 0u;
      }
      else if (v52 == 0x20000)
      {
        int v28 = v45;
        if (!v45) {
          int v28 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
        }
        id v45 = v28;
        [v28 addObject:v11];
      }
      [(MLNeuralNetworkEngine *)self prepareBlobNamed:v11 forNewBlobBackingMode:v52 bindMode:0x20000];
      uint64_t v37 = espresso_network_bind_buffer();
      if (!v37)
      {
        int v29 = 0;
        goto LABEL_40;
      }
      id v38 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)std::string buf = 138412546;
        *(void *)&uint8_t buf[4] = v11;
        __int16 v64 = 1024;
        int v65 = v37;
        _os_log_error_impl(&dword_19E58B000, v38, OS_LOG_TYPE_ERROR, "Failed to bind output feature named '%@' with error: %d.", buf, 0x12u);
      }

      if (a7)
      {
        uint64_t v39 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v59 = v46;
        long long v34 = [NSString stringWithFormat:@"Failed to bind output feature named '%@' with error: %d.", v11, v37];
        id v60 = v34;
        long long v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
        id v36 = [v39 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v35];
LABEL_38:
        *a7 = v36;
      }
LABEL_39:
      int v29 = 1;
LABEL_40:

LABEL_41:
      if (v54 < 0) {
        operator delete(__p[0]);
      }
      if (v29 != 3 && v29) {
        goto LABEL_54;
      }
      ++v10;
    }
    while (v9 != v10);
    uint64_t v41 = [(NSString *)obj countByEnumeratingWithState:&v55 objects:v68 count:16];
    uint64_t v9 = v41;
  }
  while (v41);
  int v29 = 0;
LABEL_54:

  if (a6 && !v29) {
    *a6 = v45;
  }

  return v29 == 0;
}

- (BOOL)bindInputFeatures:(id)a3 bufferIndex:(unint64_t)a4 cleanUpBlocks:(id)a5 directlyBoundFeatureNames:(id *)a6 error:(id *)a7
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v29 = a5;
  uint64_t v30 = v8;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v9 = [v8 featureNames];
  obuint64_t j = v9;
  uint64_t v10 = 0;
  id v11 = 0;
  uint64_t v12 = [v9 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v34;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v16 = (void *)MEMORY[0x19F3C29E0]();
        id v17 = [v30 featureValueForName:v15];
        char v32 = 0;
        id v31 = v11;
        BOOL v18 = [(MLNeuralNetworkEngine *)self bindInputFeatureNamed:v15 featureValue:v17 bufferIndex:a4 cleanUpBlocks:v29 boundDirectly:&v32 error:&v31];
        id v19 = v31;

        id v11 = v19;
        if (v32) {
          BOOL v20 = v18;
        }
        else {
          BOOL v20 = 0;
        }
        if (v20)
        {
          if (!v10) {
            uint64_t v10 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
          }
          [v10 addObject:v15];
        }

        if (!v18)
        {

          if (a7)
          {
            id v11 = v19;
            BOOL v22 = 0;
            *a7 = v11;
          }
          else
          {
            BOOL v22 = 0;
          }
          goto LABEL_25;
        }
      }
      uint64_t v9 = obj;
      uint64_t v12 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  if (a6)
  {
    if (v10) {
      long long v21 = v10;
    }
    else {
      long long v21 = (void *)MEMORY[0x1E4F1CBF0];
    }
    *a6 = v21;
  }
  BOOL v22 = 1;
LABEL_25:

  return v22;
}

- (BOOL)collectParametersFromContainer:(id)a3 configuration:(id)a4 error:(id *)a5
{
  uint64_t v187 = *MEMORY[0x1E4F143B8];
  id v149 = a3;
  id v148 = a4;
  v152 = self;
  if ([v148 computeUnits] && objc_msgSend(v148, "computeUnits") != 3)
  {
    int v8 = [(MLNeuralNetworkEngine *)self _espressoDeviceForConfiguration:v148 error:a5];
    if (a5 && v8 == -1) {
      *a5 = 0;
    }
    [(id)objc_opt_class() gpuEngine];
    uint64_t context = espresso_create_context();
    LOBYTE(self->_compilerOutput) = context == 0;
    if (context) {
      espresso_context_destroy();
    }
  }
  else
  {
    LOBYTE(self->_compilerOutput) = 1;
  }
  if (([v148 computeUnits] == 2 || objc_msgSend(v148, "computeUnits") == 3)
    && (+[MLNeuralEngineComputeDeviceRegistry sharedRegistry](MLNeuralEngineComputeDeviceRegistry, "sharedRegistry"), uint64_t v10 = objc_claimAutoreleasedReturnValue(), [v10 registeredAndAccessibleComputeDevices], v11 = objc_claimAutoreleasedReturnValue(), v12 = objc_msgSend(v11, "count"), v11, v10, v12))
  {
    uint64_t v13 = espresso_create_context();
    BOOL v14 = self;
    BYTE1(self->_compilerOutput) = v13 == 0;
    if (v13) {
      espresso_context_destroy();
    }
  }
  else
  {
    BOOL v14 = self;
    BYTE1(self->_compilerOutput) = 1;
  }
  BYTE2(v14->_transferSession) = [v149 modelIsMIL];
  uint64_t v15 = [v149 activeFunction];
  defaultOptionalValues = v14->_defaultOptionalValues;
  v14->_defaultOptionalValues = (NSDictionary *)v15;

  BYTE6(v14->_transferSession) = [v149 modelIsEncrypted];
  uint64_t v17 = [v149 modelFilePath];
  BOOL v18 = v14->_context;
  v14->_uint64_t context = (void *)v17;

  uint64_t v19 = [v149 inputLayerNames];
  classLabels = v14->_classLabels;
  v14->_classLabels = (NSArray *)v19;

  uint64_t v21 = [v149 outputLayerNames];
  classScoreVectorName = v14->_classScoreVectorName;
  v14->_classScoreVectorName = (NSString *)v21;

  v14->_espressoInputStrides = (NSDictionary *)[(NSArray *)v14->_classLabels count];
  v14->_modelVersionInfo = (MLVersionInfo *)[(NSString *)v14->_classScoreVectorName count];
  uint64_t v23 = [v149 imagePreprocessingParams];
  inputLayers = v14->_inputLayers;
  v14->_inputLayers = (NSArray *)v23;

  uint64_t v25 = [v149 classScoreVectorName];
  id v26 = *(void **)&v14->_priority;
  *(void *)&v14->_priority = v25;

  uint64_t v27 = [v149 classLabels];
  int v28 = *(void **)&v14->_engine;
  *(void *)&v14->_engine = v27;

  uint64_t v29 = [v149 optionalInputDefaultValues];
  inputFeatureConformer = v14->_inputFeatureConformer;
  v14->_inputFeatureConformer = (MLFeatureProviderConformer *)v29;

  if (*(void *)&v14->_engine)
  {
    uint64_t v31 = +[MLProbabilityDictionary sharedKeySetForLabels:](MLProbabilityDictionary, "sharedKeySetForLabels:");
    plan = v14->_plan;
    v14->_plan = (void *)v31;
  }
  else
  {
    plan = v14->_plan;
    v14->_plan = 0;
  }

  espresso_tmp_enable_montreal();
  [v149 imageParameters];
  v181[0] = 0;
  v181[1] = 0;
  v179[1] = 0;
  v180 = v181;
  v178 = v179;
  v179[0] = 0;
  v177[0] = 0;
  v177[1] = 0;
  v175[1] = 0;
  v176 = v177;
  v174 = v175;
  v175[0] = 0;
  v173[0] = 0;
  v173[1] = 0;
  v171[1] = 0;
  v172 = v173;
  v170 = v171;
  v171[0] = 0;
  v169[0] = 0;
  v169[1] = 0;
  v168 = v169;
  long long v166 = 0u;
  long long v167 = 0u;
  long long v164 = 0u;
  long long v165 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  char v33 = 0;
  uint64_t v34 = [obj countByEnumeratingWithState:&v164 objects:v186 count:16];
  if (v34)
  {
    uint64_t v35 = *(void *)v165;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v165 != v35) {
          objc_enumerationMutation(obj);
        }
        uint64_t v37 = *(void **)(*((void *)&v164 + 1) + 8 * i);
        uint64_t v38 = [obj objectForKeyedSubscript:v37];
        uint64_t v39 = [v38 objectAtIndexedSubscript:0];
        char v40 = [v39 BOOLValue];
        id v41 = v37;
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v41 UTF8String]);
        p_p = &__p;
        *((unsigned char *)std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)&v180, &__p, (_OWORD **)&p_p)+ 56) = v40;
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }

        id v42 = [v38 objectAtIndexedSubscript:1];
        char v43 = [v42 BOOLValue];
        id v44 = v41;
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v44 UTF8String]);
        p_p = &__p;
        *((unsigned char *)std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)&v178, &__p, (_OWORD **)&p_p)+ 56) = v43;
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }

        id v45 = [v38 objectAtIndexedSubscript:2];
        [v45 floatValue];
        int v47 = v46;
        id v48 = v44;
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v48 UTF8String]);
        p_p = &__p;
        *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)&v176, &__p, (_OWORD **)&p_p)+ 14) = v47;
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }

        uint64_t v49 = [v38 objectAtIndexedSubscript:3];
        [v49 floatValue];
        int v51 = v50;
        id v52 = v48;
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v52 UTF8String]);
        p_p = &__p;
        *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)&v174, &__p, (_OWORD **)&p_p)+ 14) = v51;
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }

        long long v53 = [v38 objectAtIndexedSubscript:4];
        [v53 floatValue];
        int v55 = v54;
        id v56 = v52;
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v56 UTF8String]);
        p_p = &__p;
        *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)&v172, &__p, (_OWORD **)&p_p)+ 14) = v55;
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }

        long long v57 = [v38 objectAtIndexedSubscript:5];
        [v57 floatValue];
        int v59 = v58;
        id v60 = v56;
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v60 UTF8String]);
        p_p = &__p;
        *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)&v170, &__p, (_OWORD **)&p_p)+ 14) = v59;
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }

        uint64_t v61 = [v38 objectAtIndexedSubscript:6];
        [v61 floatValue];
        int v63 = v62;
        std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v60 UTF8String]);
        p_p = &__p;
        *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)&v168, &__p, (_OWORD **)&p_p)+ 14) = v63;
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }

        BOOL v64 = (unint64_t)[v38 count] > 7;
        v33 |= v64;
      }
      uint64_t v34 = [obj countByEnumeratingWithState:&v164 objects:v186 count:16];
    }
    while (v34);
  }

  int v65 = (uint64_t *)v168;
  if (v168 != v169)
  {
    do
    {
      if (*((char *)v65 + 55) < 0) {
        std::string::__init_copy_ctor_external(&__p, (const std::string::value_type *)v65[4], v65[5]);
      }
      else {
        std::string __p = *(std::string *)(v65 + 4);
      }
      int v66 = *(_DWORD *)std::map<std::string,std::string>::at((uint64_t)&v168, &__p);
      p_params = (uint64_t **)&v152->_params;
      p_p = &__p;
      *((_DWORD *)std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&v152->_params, &__p, (long long **)&p_p)+ 14) = v66;
      uint64_t v68 = *std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::__find_equal<std::string>((uint64_t)&v180, &p_p, &__p);
      if (!v68) {
        std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
      }
      int v69 = *(unsigned __int8 *)(v68 + 56);
      p_p = &__p;
      *((_DWORD *)std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(p_params, &__p, (long long **)&p_p)+ 17) = v69;
      p_p = &__p;
      *((_DWORD *)std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(p_params, &__p, (long long **)&p_p)+ 15) = 0;
      p_p = &__p;
      *((_DWORD *)std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(p_params, &__p, (long long **)&p_p)+ 16) = 1;
      int v70 = *(_DWORD *)std::map<std::string,std::string>::at((uint64_t)&v174, &__p);
      p_p = &__p;
      *((_DWORD *)std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(p_params, &__p, (long long **)&p_p)+ 19) = v70;
      p_p = &__p;
      if (std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&v180, &__p, (long long **)&p_p)[56])
      {
        int v71 = *(_DWORD *)std::map<std::string,std::string>::at((uint64_t)&v172, &__p);
        p_p = &__p;
        *((_DWORD *)std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(p_params, &__p, (long long **)&p_p)+ 18) = v71;
        int v72 = *(_DWORD *)std::map<std::string,std::string>::at((uint64_t)&v176, &__p);
      }
      else
      {
        int v73 = *(_DWORD *)std::map<std::string,std::string>::at((uint64_t)&v176, &__p);
        p_p = &__p;
        *((_DWORD *)std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(p_params, &__p, (long long **)&p_p)+ 18) = v73;
        int v72 = *(_DWORD *)std::map<std::string,std::string>::at((uint64_t)&v172, &__p);
      }
      p_p = &__p;
      *((_DWORD *)std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(p_params, &__p, (long long **)&p_p)+ 20) = v72;
      p_p = &__p;
      if (std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&v178, &__p, (long long **)&p_p)[56])
      {
        int v74 = *(_DWORD *)std::map<std::string,std::string>::at((uint64_t)&v170, &__p);
        p_p = &__p;
        *((_DWORD *)std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(p_params, &__p, (long long **)&p_p)+ 18) = v74;
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      uint64_t v75 = (char *)v65[1];
      if (v75)
      {
        do
        {
          unint64_t v76 = (char **)v75;
          uint64_t v75 = *(char **)v75;
        }
        while (v75);
      }
      else
      {
        do
        {
          unint64_t v76 = (char **)v65[2];
          BOOL v77 = *v76 == (char *)v65;
          int v65 = (uint64_t *)v76;
        }
        while (!v77);
      }
      int v65 = (uint64_t *)v76;
    }
    while (v76 != v169);
  }
  dispatch_semaphore_t v78 = dispatch_semaphore_create(2);
  id probabilityDictionarySharedKeySet = v152->_probabilityDictionarySharedKeySet;
  v152->_id probabilityDictionarySharedKeySet = v78;

  v80 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v81 = dispatch_queue_create("com.apple.CoreMLBatchProcessingQueue", v80);
  modelFilePath = v152->_modelFilePath;
  v152->_modelFilePath = (NSString *)&v81->isa;

  uint64_t v83 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v84 = dispatch_queue_create("com.apple.CoreMLNNProcessingQueue", v83);
  bufferSemaphore = v152->_bufferSemaphore;
  v152->_bufferSemaphore = (OS_dispatch_semaphore *)v84;

  p_begin = (void **)&v152->_bufferAvailable.__begin_;
  unint64_t size = v152->_bufferAvailable.__size_;
  if (size > 1)
  {
    v152->_bufferAvailable.__size_ = 2;
  }
  else
  {
    unint64_t value = v152->_bufferAvailable.__cap_alloc_.__value_;
    unint64_t v89 = 2 - size;
    if (value << 6 < 2 - size || size > (value << 6) - (2 - size))
    {
      memset(&__p, 0, sizeof(__p));
      uint64_t v92 = value << 7;
      if (value << 7 <= 0x40) {
        uint64_t v92 = 64;
      }
      if (value << 6 >= 0x3FFFFFFFFFFFFFFFLL) {
        unint64_t v93 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v93 = v92;
      }
      std::vector<BOOL>::reserve(&__p.__r_.__value_.__l.__data_, v93);
      uint64_t v95 = *p_begin;
      uint64_t v94 = v152->_bufferAvailable.__size_;
      __p.__r_.__value_.__l.__size_ = v94 + v89;
      v90 = (void *)__p.__r_.__value_.__r.__words[0];
      if (v94 < 1)
      {
        LODWORD(v91) = 0;
      }
      else
      {
        uint64_t v96 = v94 >> 6;
        if ((unint64_t)(v94 + 63) >= 0x7F) {
          memmove(__p.__r_.__value_.__l.__data_, v95, 8 * v96);
        }
        uint64_t v91 = v94 - (v96 << 6);
        v90 += v96;
        if (v91 < 1) {
          LODWORD(v91) = 0;
        }
        else {
          void *v90 = *v90 & ~(0xFFFFFFFFFFFFFFFFLL >> -(char)v91) | *((void *)v95 + v96) & (0xFFFFFFFFFFFFFFFFLL >> -(char)v91);
        }
        uint64_t v95 = *p_begin;
      }
      *p_begin = (void *)__p.__r_.__value_.__r.__words[0];
      __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v95;
      long long v97 = *(_OWORD *)&v152->_bufferAvailable.__size_;
      *(_OWORD *)&v152->_bufferAvailable.__size_ = *(_OWORD *)&__p.__r_.__value_.__r.__words[1];
      *(_OWORD *)&__p.__r_.__value_.__r.__words[1] = v97;
      if (v95) {
        operator delete(v95);
      }
    }
    else
    {
      v90 = *p_begin;
      LODWORD(v91) = size & 0x3F;
      v152->_bufferAvailable.__size_ = 2;
    }
    __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v90;
    LODWORD(__p.__r_.__value_.__r.__words[1]) = v91;
    std::__fill_n[abi:ne180100]<true,std::vector<BOOL>>(&__p, v89);
  }
  dispatch_semaphore_t v98 = dispatch_semaphore_create(1);
  espressoQueue = v152->_espressoQueue;
  v152->_espressoQueue = (OS_dispatch_queue *)v98;

  BYTE4(v152->_transferSession) = v33 & 1;
  std::vector<std::map<std::string,espresso_buffer_t *>>::resize((char ***)&v152->_inputBuffers);
  uint64_t v100 = 0;
  char v101 = 1;
  do
  {
    char v150 = v101;
    long long v162 = 0u;
    long long v163 = 0u;
    long long v160 = 0u;
    long long v161 = 0u;
    v154 = v152->_classLabels;
    uint64_t v102 = [(NSArray *)v154 countByEnumeratingWithState:&v160 objects:v185 count:16];
    if (v102)
    {
      uint64_t v103 = *(void *)v161;
      do
      {
        for (uint64_t j = 0; j != v102; ++j)
        {
          if (*(void *)v161 != v103) {
            objc_enumerationMutation(v154);
          }
          id v105 = *(id *)(*((void *)&v160 + 1) + 8 * j);
          v106 = malloc_type_malloc(0xA8uLL, 0x10800403DA0D3ADuLL);
          begin = v152->_inputBuffers.__begin_;
          id v108 = v105;
          std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v108 UTF8String]);
          p_p = &__p;
          *((void *)std::__tree<std::__value_type<std::string,espresso_buffer_t *>,std::__map_value_compare<std::string,std::__value_type<std::string,espresso_buffer_t *>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,espresso_buffer_t *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)begin + 24 * v100, &__p, (_OWORD **)&p_p)+ 7) = v106;
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__p.__r_.__value_.__l.__data_);
          }
        }
        uint64_t v102 = [(NSArray *)v154 countByEnumeratingWithState:&v160 objects:v185 count:16];
      }
      while (v102);
    }

    char v101 = 0;
    uint64_t v100 = 1;
  }
  while ((v150 & 1) != 0);
  std::vector<std::map<std::string,espresso_buffer_t *>>::resize((char ***)&v152->_outputBuffers);
  uint64_t v109 = 0;
  char v110 = 1;
  do
  {
    char v151 = v110;
    long long v158 = 0u;
    long long v159 = 0u;
    long long v156 = 0u;
    long long v157 = 0u;
    v155 = v152->_classScoreVectorName;
    uint64_t v111 = [(NSString *)v155 countByEnumeratingWithState:&v156 objects:v184 count:16];
    if (v111)
    {
      uint64_t v112 = *(void *)v157;
      do
      {
        for (uint64_t k = 0; k != v111; ++k)
        {
          if (*(void *)v157 != v112) {
            objc_enumerationMutation(v155);
          }
          id v114 = *(id *)(*((void *)&v156 + 1) + 8 * k);
          char v115 = malloc_type_malloc(0xA8uLL, 0x10800403DA0D3ADuLL);
          v116 = v152->_outputBuffers.__begin_;
          id v117 = v114;
          std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v117 UTF8String]);
          p_p = &__p;
          *((void *)std::__tree<std::__value_type<std::string,espresso_buffer_t *>,std::__map_value_compare<std::string,std::__value_type<std::string,espresso_buffer_t *>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,espresso_buffer_t *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)v116 + 24 * v109, &__p, (_OWORD **)&p_p)+ 7) = v115;
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__p.__r_.__value_.__l.__data_);
          }
        }
        uint64_t v111 = [(NSString *)v155 countByEnumeratingWithState:&v156 objects:v184 count:16];
      }
      while (v111);
    }

    char v110 = 0;
    uint64_t v109 = 1;
  }
  while ((v151 & 1) != 0);
  HIBYTE(v152->_transferSession) = [v149 hasOptionalInputSequenceConcat];
  BYTE5(v152->_transferSession) = [v149 hasBidirectionalLayer];
  v118 = [v149 optionalInputTypes];
  uint64_t v119 = [v118 copy];
  outputBlobNameToLastBackingMode = v152->_outputBlobNameToLastBackingMode;
  v152->_outputBlobNameToLastBackingMode = (NSMutableDictionary *)v119;

  BYTE1(v152->_transferSession) = [v149 ndArrayInterpretation];
  uint64_t v121 = [v149 modelVersionInfo];
  espressoInputShapes = v152->_espressoInputShapes;
  v152->_espressoInputShapes = (NSDictionary *)v121;

  uint64_t v123 = [v149 compilerVersionInfo];
  pixelBufferPool = v152->_pixelBufferPool;
  v152->_pixelBufferPool = (MLPixelBufferPool *)v123;

  BOOL v125 = !LOBYTE(v152->_compilerOutput) && ([v148 allowBackgroundGPUCompute] & 1) != 0;
  *(_DWORD *)&v152->_isEspressoBiasPreprocessingShared = v125;
  unint64_t v126 = +[MLPredictionOptions defaultOptions];

  v128 = (OS_dispatch_queue *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  predictionsQueue = v152->_predictionsQueue;
  v152->_predictionsQueue = v128;

  v130 = (OS_dispatch_semaphore *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  submitSemaphore = v152->_submitSemaphore;
  v152->_submitSemaphore = v130;

  unint64_t v132 = objc_alloc_init(MLPixelBufferPool);
  optionalInputTypes = v152->_optionalInputTypes;
  v152->_optionalInputTypes = (NSDictionary *)v132;

  uint64_t v134 = [v149 compilerOutput];
  unint64_t v135 = (void *)v152->_OutputBlobIsDynamic.__tree_.__pair3_.__value_;
  v152->_OutputBlobIsDynamic.__tree_.__pair3_.__value_ = v134;

  v136 = [v149 modelDescription];
  v137 = [v136 inputDescriptionsByName];
  BOOL v138 = v137 == 0;

  if (!v138)
  {
    v139 = [MLFeatureProviderConformer alloc];
    uint64_t v140 = [v136 inputDescriptionsByName];
    v141 = [v140 allValues];
    v142 = [v149 optionalInputDefaultValues];
    int v143 = [v149 ndArrayInterpretation];
    v144 = [v149 optionalInputTypes];
    uint64_t v145 = [(MLFeatureProviderConformer *)v139 initWithFeatureDescriptions:v141 defaultValues:v142 usingRank5Mapping:v143 ^ 1u optionalInputTypes:v144 passthroughStateFeatures:0];
    espressoProfileInfo = v152->_espressoProfileInfo;
    v152->_espressoProfileInfo = (EspressoProfilingNetworkInfo *)v145;
  }
  std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v169[0]);
  std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v171[0]);
  std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v173[0]);
  std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v175[0]);
  std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v177[0]);
  std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v179[0]);
  std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy(v181[0]);

  return 1;
}

+ (int)gpuEngine
{
  return 5;
}

- (id)completeOutputBackings:(id)a3 automaticOutputBackingMode:(id)a4 error:(id *)a5
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v49 = a4;
  int v50 = v7;
  int v47 = (void *)[v7 mutableCopy];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  obuint64_t j = self->_classScoreVectorName;
  uint64_t v8 = [(NSString *)obj countByEnumeratingWithState:&v60 objects:v70 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v61;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v61 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(id *)(*((void *)&v60 + 1) + 8 * i);
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v11 UTF8String]);
        *(void *)std::string buf = __p;
        if (std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&self->_currentConfigurationName.__r_.var0, __p, (long long **)buf)[56])goto LABEL_29; {
        uint64_t v12 = [v50 objectForKeyedSubscript:v11];
        }
        BOOL v13 = v12 == 0;

        if (!v13) {
          goto LABEL_29;
        }
        BOOL v14 = [v49 objectForKeyedSubscript:v11];
        char v15 = [v14 isEqual:@"MLAutomaticOutputBackingModeDisabled"];

        if (v15) {
          goto LABEL_29;
        }
        uint64_t v16 = [(MLNeuralNetworkEngine *)self activeFunction];
        uint64_t v17 = [NSString stringWithUTF8String:"main"];
        char v18 = [v16 isEqualToString:v17];

        if (v18)
        {
          uint64_t v19 = [(MLModelEngine *)self modelDescription];
          BOOL v20 = [v19 outputDescriptionsByName];
          uint64_t v21 = [v20 objectForKeyedSubscript:v11];

          BOOL v22 = [v21 multiArrayConstraint];
          id v48 = [v21 imageConstraint];
          if (v22)
          {
            uint64_t v23 = [(MLNeuralNetworkEngine *)self outputBackingMultiArrayForFeatureName:v11];
            if (v23)
            {
              id v24 = +[MLFeatureValue featureValueWithMultiArray:v23];
              char v25 = [v21 isAllowedValue:v24];

              if (v25) {
                goto LABEL_23;
              }
            }
            goto LABEL_28;
          }
          if (!v48)
          {
            uint64_t v23 = 0;
LABEL_23:

LABEL_24:
            [v47 setObject:v23 forKeyedSubscript:v11];
            goto LABEL_30;
          }
          uint64_t v57 = 0;
          [v11 UTF8String];
          int blob_shape = espresso_network_query_blob_shape();
          if (blob_shape)
          {
            uint64_t v23 = +[MLLogging coreChannel];
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              uint64_t v27 = __p;
              if (v59 < 0) {
                uint64_t v27 = (void **)__p[0];
              }
              *(_DWORD *)std::string buf = 136315394;
              *(void *)&uint8_t buf[4] = v27;
              __int16 buf_12 = 1024;
              int buf_14 = blob_shape;
              int v28 = v23;
              uint64_t v29 = "Failed to get the output shape for feature: %s to fabricate the output backing buffer (err: %d). Thi"
                    "s is not expected but we go on without output backing.";
              uint32_t v30 = 18;
LABEL_27:
              _os_log_error_impl(&dword_19E58B000, v28, OS_LOG_TYPE_ERROR, v29, buf, v30);
            }
          }
          else
          {
            uint64_t v23 = +[MLLogging coreChannel];
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)std::string buf = 134217984;
              *(void *)&uint8_t buf[4] = v57;
              int v28 = v23;
              uint64_t v29 = "The output shape's rank is %lu but it only supports rank-4 for image output. Proceeding without output backing.";
              uint32_t v30 = 12;
              goto LABEL_27;
            }
          }
LABEL_28:

LABEL_29:
          uint64_t v23 = 0;
          goto LABEL_30;
        }
        uint64_t v23 = [(MLNeuralNetworkEngine *)self outputBackingMultiArrayForFeatureName:v11];
        if (v23) {
          goto LABEL_24;
        }
LABEL_30:

        if (v59 < 0) {
          operator delete(__p[0]);
        }
      }
      uint64_t v8 = [(NSString *)obj countByEnumeratingWithState:&v60 objects:v70 count:16];
    }
    while (v8);
  }

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  obja = self->_classScoreVectorName;
  uint64_t v31 = [(NSString *)obja countByEnumeratingWithState:&v53 objects:v66 count:16];
  if (v31)
  {
    uint64_t v32 = *(void *)v54;
    while (2)
    {
      for (uint64_t j = 0; j != v31; ++j)
      {
        if (*(void *)v54 != v32) {
          objc_enumerationMutation(obja);
        }
        uint64_t v34 = *(void *)(*((void *)&v53 + 1) + 8 * j);
        uint64_t v35 = [v49 objectForKeyedSubscript:v34];
        if ([v35 isEqual:@"MLAutomaticOutputBackingModeForced"])
        {
          long long v36 = [v47 objectForKeyedSubscript:v34];
          BOOL v37 = v36 == 0;

          if (v37)
          {
            char v40 = +[MLLogging coreChannel];
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)std::string buf = 138412290;
              *(void *)&uint8_t buf[4] = v34;
              _os_log_error_impl(&dword_19E58B000, v40, OS_LOG_TYPE_ERROR, "Forced automatic output backings was requested but we couldn't fabricate the output buffer for feature named '%@'.", buf, 0xCu);
            }

            if (a5)
            {
              id v42 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v64 = *MEMORY[0x1E4F28568];
              char v43 = [NSString stringWithFormat:@"Forced automatic output backings was requested but we couldn't fabricate the output buffer for feature named '%@'.", v34];
              int v65 = v43;
              id v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v65 forKeys:&v64 count:1];
              *a5 = [v42 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v44];
            }
            id v39 = 0;
            uint64_t v38 = v47;
            goto LABEL_51;
          }
        }
        else
        {
        }
      }
      uint64_t v31 = [(NSString *)obja countByEnumeratingWithState:&v53 objects:v66 count:16];
      if (v31) {
        continue;
      }
      break;
    }
  }

  uint64_t v38 = v47;
  id v39 = v47;
LABEL_51:

  return v39;
}

- (BOOL)resetSizesNoAutoRelease:(id)a3 error:(id *)a4
{
  uint64_t v215 = *MEMORY[0x1E4F143B8];
  id v164 = a3;
  [v164 featureNames];
  v198 = 0;
  long long v194 = 0u;
  long long v195 = 0u;
  long long v196 = 0u;
  long long v197 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v194 objects:v214 count:16];
  if (!v4)
  {

    goto LABEL_88;
  }
  uint64_t v165 = 0;
  uint64_t v166 = 0;
  char v158 = 0;
  char v161 = 0;
  uint64_t v162 = *(void *)v195;
  uint64_t v156 = *MEMORY[0x1E4F28568];
LABEL_3:
  uint64_t v5 = 0;
  uint64_t v163 = v4;
  while (1)
  {
    if (*(void *)v195 != v162) {
      objc_enumerationMutation(obj);
    }
    uint64_t v171 = v5;
    id v6 = *(id *)(*((void *)&v194 + 1) + 8 * v5);
    std::string::basic_string[abi:ne180100]<0>(v211, (char *)[v6 UTF8String]);
    *(void *)&long long buf = v211;
    v172 = std::__tree<std::__value_type<std::string,_BlobShape>,std::__map_value_compare<std::string,std::__value_type<std::string,_BlobShape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,_BlobShape>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)&self->_currentBlobShapes, v211, (long long **)&buf);
    v173 = [v164 featureValueForName:v6];
    if ([v173 type] != 4)
    {
      BOOL v13 = [v173 multiArrayValue];
      v177 = [v13 shape];

      uint64_t v14 = [v177 count];
      uint64_t v15 = v14;
      if (BYTE1(self->_transferSession))
      {
        if (v14)
        {
          int v157 = v14;
          if ((int)v14 < 1)
          {
            int v11 = 1;
            int v174 = 1;
            int v175 = 1;
            unsigned int v176 = 1;
            unsigned int v12 = 1;
          }
          else
          {
            uint64_t v16 = 0;
            uint64_t v17 = (v14 - 1);
            uint64_t v18 = (int)v14 - 5;
            uint64_t v167 = (v14 - 4);
            uint64_t v168 = (v14 - 3);
            uint64_t v169 = (v14 - 2);
            unsigned int v12 = 1;
            int v175 = 1;
            unsigned int v176 = 1;
            int v174 = 1;
            int v11 = 1;
            do
            {
              if (!v16)
              {
                uint64_t v19 = [v177 objectAtIndexedSubscript:v17];
                int v175 = [v19 integerValue];
              }
              if (!(v17 - v169 + v16))
              {
                BOOL v20 = [v177 objectAtIndexedSubscript:v169];
                int v174 = [v20 integerValue];
              }
              if (!(v17 - v168 + v16))
              {
                uint64_t v21 = [v177 objectAtIndexedSubscript:v168];
                int v11 = [v21 integerValue];
              }
              if (!(v17 - v167 + v16))
              {
                BOOL v22 = [v177 objectAtIndexedSubscript:v167];
                unsigned int v12 = [v22 integerValue];
              }
              if (v17 + v16 <= v18)
              {
                uint64_t v23 = objc_msgSend(v177, "objectAtIndexedSubscript:");
                int v24 = [v23 integerValue];

                v176 *= v24;
              }
              --v16;
            }
            while (v17 + v16 + 1 > 0);
          }
          if (*((_DWORD *)v172 + 19) != v157)
          {
            if (!v198) {
              operator new();
            }
            *((_DWORD *)v172 + 19) = v157;
          }
LABEL_50:

          goto LABEL_51;
        }
        uint32_t v30 = +[MLLogging coreChannel];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 134217984;
          *(void *)((char *)&buf + 4) = 0;
          _os_log_error_impl(&dword_19E58B000, v30, OS_LOG_TYPE_ERROR, "Incorrect input number of dimensions %lul (must be 1 or greater).", (uint8_t *)&buf, 0xCu);
        }

        if (!a4)
        {
LABEL_38:

          int v32 = 0;
          goto LABEL_69;
        }
        uint64_t v31 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v207 = v156;
        uint64_t v27 = objc_msgSend(NSString, "stringWithFormat:", @"Incorrect input number of dimensions %lul (must be 1 or greater).", 0);
        v208 = v27;
        int v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v208 forKeys:&v207 count:1];
        uint64_t v29 = [v31 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v28];
      }
      else
      {
        if ((unint64_t)(v14 - 6) >= 0xFFFFFFFFFFFFFFFBLL)
        {
          switch(v14)
          {
            case 1:
              char v33 = [v177 objectAtIndexedSubscript:0];
              int v11 = [v33 integerValue];

              unsigned int v12 = 1;
              int v175 = 1;
              unsigned int v176 = 1;
              int v174 = 1;
              goto LABEL_50;
            case 2:
            case 4:
              break;
            case 3:
              uint64_t v34 = [(MLModelEngine *)self modelDescription];
              if (!v34) {
                goto LABEL_49;
              }
              uint64_t v35 = [(MLModelEngine *)self modelDescription];
              long long v36 = [v35 inputDescriptionsByName];
              BOOL v37 = [v36 objectForKeyedSubscript:v6];
              uint64_t v38 = [v37 multiArrayConstraint];
              id v39 = [v38 shape];
              BOOL v40 = [v39 count] == 3;

              if (v40)
              {
                id v41 = [v177 objectAtIndexedSubscript:0];
                int v11 = [v41 integerValue];

                id v42 = [v177 objectAtIndexedSubscript:1];
                LODWORD(v41) = [v42 integerValue];

                char v43 = [v177 objectAtIndexedSubscript:2];
                int v44 = [v43 integerValue];

                int v174 = (int)v41;
                int v175 = v44;
                unsigned int v176 = 1;
                unsigned int v12 = 1;
              }
              else
              {
LABEL_49:
                int v51 = [v177 objectAtIndexedSubscript:2];
                int v11 = [v51 integerValue];

                id v52 = [v177 objectAtIndexedSubscript:1];
                unsigned int v12 = [v52 integerValue];

                long long v53 = [v177 objectAtIndexedSubscript:0];
                unsigned int v176 = [v53 integerValue];

                int v174 = 1;
                int v175 = 1;
              }
              goto LABEL_50;
            default:
              id v45 = [v177 objectAtIndexedSubscript:2];
              int v11 = [v45 integerValue];

              int v46 = [v177 objectAtIndexedSubscript:4];
              int v47 = [v46 integerValue];

              id v48 = [v177 objectAtIndexedSubscript:3];
              LODWORD(v46) = [v48 integerValue];

              id v49 = [v177 objectAtIndexedSubscript:1];
              unsigned int v12 = [v49 integerValue];

              int v50 = [v177 objectAtIndexedSubscript:0];
              LODWORD(v49) = [v50 integerValue];

              int v174 = (int)v46;
              int v175 = v47;
              unsigned int v176 = v49;
              goto LABEL_50;
          }
        }
        char v25 = +[MLLogging coreChannel];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 134217984;
          *(void *)((char *)&buf + 4) = v15;
          _os_log_error_impl(&dword_19E58B000, v25, OS_LOG_TYPE_ERROR, "Incorrect input number of dimensions %lul (must be 1, 3, or 5 dimensions).", (uint8_t *)&buf, 0xCu);
        }

        if (!a4) {
          goto LABEL_38;
        }
        id v26 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v209 = v156;
        uint64_t v27 = [NSString stringWithFormat:@"Incorrect input number of dimensions %lul (must be 1, 3, or 5 dimensions).", v15];
        v210 = v27;
        int v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v210 forKeys:&v209 count:1];
        uint64_t v29 = [v26 errorWithDomain:@"com.apple.CoreML" code:1 userInfo:v28];
      }
      *a4 = v29;

      goto LABEL_38;
    }
    id v7 = (__CVBuffer *)[v173 imageBufferValue];
    int Width = CVPixelBufferGetWidth(v7);
    int Height = CVPixelBufferGetHeight(v7);
    OSType PixelFormatType = CVPixelBufferGetPixelFormatType(v7);
    int v174 = Height;
    int v175 = Width;
    if (PixelFormatType == 1278226536 || PixelFormatType == 1278226488)
    {
      int v11 = 1;
      unsigned int v176 = 1;
      unsigned int v12 = 1;
    }
    else
    {
      unsigned int v176 = 1;
      int v11 = 3;
      unsigned int v12 = 1;
    }
LABEL_51:
    long long v54 = v172;
    if (*((_DWORD *)v172 + 14) != v175
      || *((_DWORD *)v172 + 15) != v174
      || *((_DWORD *)v172 + 16) != v11
      || *((_DWORD *)v172 + 18) != v176)
    {
      if (!v198) {
        operator new();
      }
      long long v54 = v172;
      *((_DWORD *)v172 + 14) = v175;
      *((_DWORD *)v172 + 15) = v174;
      *((_DWORD *)v172 + 16) = v11;
      char v158 = 1;
      char v161 = 1;
      *((_DWORD *)v172 + 18) = v176;
    }
    if (*((_DWORD *)v54 + 17) != v12)
    {
      if (!v198) {
        operator new();
      }
      *((_DWORD *)v172 + 17) = v12;
      char v161 = 1;
    }
    uint64_t v55 = v12 <= v165 ? v165 : v12;
    uint64_t v165 = v55;
    uint64_t v56 = v176 <= v166 ? v166 : v176;
    uint64_t v166 = v56;
    int v32 = 1;
LABEL_69:

    if (SHIBYTE(v213) < 0) {
      operator delete(*(void **)v211);
    }
    if (!v32) {
      break;
    }
    uint64_t v5 = v171 + 1;
    if (v171 + 1 == v163)
    {
      uint64_t v4 = [obj countByEnumeratingWithState:&v194 objects:v214 count:16];
      if (!v4)
      {

        if (v165 >= 0x191 && !BYTE3(self->_transferSession) && !BYTE1(self->_transferSession))
        {
          v154 = +[MLLogging coreChannel];
          if (os_log_type_enabled(v154, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v211 = 67109376;
            *(_DWORD *)&v211[4] = v165;
            LOWORD(v212) = 1024;
            *(_DWORD *)((char *)&v212 + 2) = 400;
            _os_log_error_impl(&dword_19E58B000, v154, OS_LOG_TYPE_ERROR, "Cannot evaluate a batch of size %d on GPU, which is larger than maximum of %d.", v211, 0xEu);
          }

          if (!a4) {
            goto LABEL_86;
          }
          v155 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v205 = v156;
          char v59 = [NSString stringWithFormat:@"Cannot evaluate a batch of size %d on GPU, which is larger than maximum of %d.", v165, 400];
          v206 = v59;
          long long v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v206 forKeys:&v205 count:1];
          long long v61 = [v155 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v60];
LABEL_83:
          *a4 = v61;

          goto LABEL_85;
        }
        if (v166 >= 0x2329 && BYTE5(self->_transferSession))
        {
          uint64_t v57 = +[MLLogging coreChannel];
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v211 = 67109376;
            *(_DWORD *)&v211[4] = v166;
            LOWORD(v212) = 1024;
            *(_DWORD *)((char *)&v212 + 2) = 9000;
            _os_log_error_impl(&dword_19E58B000, v57, OS_LOG_TYPE_ERROR, "Cannot evaluate a sequence of length %d, which is longer than maximum of %d for bidirectional models.", v211, 0xEu);
          }

          if (!a4) {
            goto LABEL_86;
          }
          int v58 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v203 = v156;
          char v59 = [NSString stringWithFormat:@"Cannot evaluate a sequence of length %d, which is longer than maximum of %d for bidirectional models.", v166, 9000];
          v204 = v59;
          long long v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v204 forKeys:&v203 count:1];
          long long v61 = [v58 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v60];
          goto LABEL_83;
        }
        if (v161)
        {
          *(void *)v211 = 0;
          v212 = 0;
          unint64_t v213 = 0;
          long long buf = 0uLL;
          unint64_t v202 = 0;
          std::string __p = 0;
          v192 = 0;
          unint64_t v193 = 0;
          v188 = 0;
          v189 = 0;
          unint64_t v190 = 0;
          v185 = 0;
          v186 = 0;
          unint64_t v187 = 0;
          v182 = 0;
          v183 = 0;
          unint64_t v184 = 0;
          v179 = 0;
          v180 = 0;
          unint64_t v181 = 0;
          begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, _BlobShape>, void *>>> *)self->_currentBlobShapes.__tree_.__begin_node_;
          if (begin_node != &self->_currentBlobShapes.__tree_.__pair1_)
          {
            while (1)
            {
              left = begin_node + 4;
              if (SHIBYTE(begin_node[6].__value_.__left_) < 0) {
                left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, _BlobShape>, void *>>> *)left->__value_.__left_;
              }
              uint64_t v67 = v212;
              if ((unint64_t)v212 >= v213)
              {
                uint64_t v69 = ((uint64_t)v212 - *(void *)v211) >> 3;
                if ((unint64_t)(v69 + 1) >> 61) {
                  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
                }
                unint64_t v70 = (uint64_t)(v213 - *(void *)v211) >> 2;
                if (v70 <= v69 + 1) {
                  unint64_t v70 = v69 + 1;
                }
                if (v213 - *(void *)v211 >= 0x7FFFFFFFFFFFFFF8) {
                  unint64_t v71 = 0x1FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v71 = v70;
                }
                if (v71) {
                  unint64_t v71 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<_KDInterval>>(v71);
                }
                else {
                  uint64_t v72 = 0;
                }
                int v73 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, _BlobShape>, void *>>> **)(v71 + 8 * v69);
                *int v73 = left;
                uint64_t v68 = v73 + 1;
                uint64_t v75 = *(__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, _BlobShape>, void *>>> ***)v211;
                int v74 = v212;
                if (v212 != *(__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, _BlobShape>, void *>>> ***)v211)
                {
                  do
                  {
                    unint64_t v76 = *--v74;
                    *--int v73 = v76;
                  }
                  while (v74 != v75);
                  int v74 = *(__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, _BlobShape>, void *>>> ***)v211;
                }
                *(void *)v211 = v73;
                v212 = v68;
                unint64_t v213 = v71 + 8 * v72;
                if (v74) {
                  operator delete(v74);
                }
              }
              else
              {
                *v212 = left;
                uint64_t v68 = v67 + 1;
              }
              v212 = v68;
              BOOL v77 = (char *)*((void *)&buf + 1);
              if (*((void *)&buf + 1) >= v202)
              {
                int v79 = (char *)buf;
                uint64_t v80 = (uint64_t)(*((void *)&buf + 1) - buf) >> 2;
                unint64_t v81 = v80 + 1;
                if ((unint64_t)(v80 + 1) >> 62) {
                  goto LABEL_270;
                }
                uint64_t v82 = v202 - buf;
                if ((uint64_t)(v202 - buf) >> 1 > v81) {
                  unint64_t v81 = v82 >> 1;
                }
                if ((unint64_t)v82 >= 0x7FFFFFFFFFFFFFFCLL) {
                  unint64_t v83 = 0x3FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v83 = v81;
                }
                if (v83)
                {
                  unint64_t v83 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v83);
                  BOOL v77 = (char *)*((void *)&buf + 1);
                  int v79 = (char *)buf;
                }
                else
                {
                  uint64_t v84 = 0;
                }
                uint64_t v85 = (_DWORD *)(v83 + 4 * v80);
                *uint64_t v85 = begin_node[7].__value_.__left_;
                dispatch_semaphore_t v78 = v85 + 1;
                while (v77 != v79)
                {
                  int v86 = *((_DWORD *)v77 - 1);
                  v77 -= 4;
                  *--uint64_t v85 = v86;
                }
                *(void *)&long long buf = v85;
                *((void *)&buf + 1) = v78;
                unint64_t v202 = v83 + 4 * v84;
                if (v79) {
                  operator delete(v79);
                }
              }
              else
              {
                **((_DWORD **)&buf + 1) = begin_node[7].__value_.__left_;
                dispatch_semaphore_t v78 = v77 + 4;
              }
              *((void *)&buf + 1) = v78;
              uint64_t v87 = v192;
              if ((unint64_t)v192 >= v193)
              {
                unint64_t v89 = (char *)__p;
                uint64_t v90 = (v192 - (unsigned char *)__p) >> 2;
                unint64_t v91 = v90 + 1;
                if ((unint64_t)(v90 + 1) >> 62) {
                  goto LABEL_270;
                }
                uint64_t v92 = v193 - (void)__p;
                if ((uint64_t)(v193 - (void)__p) >> 1 > v91) {
                  unint64_t v91 = v92 >> 1;
                }
                if ((unint64_t)v92 >= 0x7FFFFFFFFFFFFFFCLL) {
                  unint64_t v93 = 0x3FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v93 = v91;
                }
                if (v93)
                {
                  unint64_t v93 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v93);
                  unint64_t v89 = (char *)__p;
                  uint64_t v87 = v192;
                }
                else
                {
                  uint64_t v94 = 0;
                }
                uint64_t v95 = (char *)(v93 + 4 * v90);
                *(_DWORD *)uint64_t v95 = HIDWORD(begin_node[7].__value_.__left_);
                v88 = v95 + 4;
                while (v87 != v89)
                {
                  int v96 = *((_DWORD *)v87 - 1);
                  v87 -= 4;
                  *((_DWORD *)v95 - 1) = v96;
                  v95 -= 4;
                }
                std::string __p = v95;
                v192 = v88;
                unint64_t v193 = v93 + 4 * v94;
                if (v89) {
                  operator delete(v89);
                }
              }
              else
              {
                *(_DWORD *)v192 = HIDWORD(begin_node[7].__value_.__left_);
                v88 = v87 + 4;
              }
              v192 = v88;
              long long v97 = v189;
              if ((unint64_t)v189 >= v190)
              {
                int v99 = (char *)v188;
                uint64_t v100 = (v189 - (unsigned char *)v188) >> 2;
                unint64_t v101 = v100 + 1;
                if ((unint64_t)(v100 + 1) >> 62) {
                  goto LABEL_270;
                }
                uint64_t v102 = v190 - (void)v188;
                if ((uint64_t)(v190 - (void)v188) >> 1 > v101) {
                  unint64_t v101 = v102 >> 1;
                }
                if ((unint64_t)v102 >= 0x7FFFFFFFFFFFFFFCLL) {
                  unint64_t v103 = 0x3FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v103 = v101;
                }
                if (v103)
                {
                  unint64_t v103 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v103);
                  int v99 = (char *)v188;
                  long long v97 = v189;
                }
                else
                {
                  uint64_t v104 = 0;
                }
                id v105 = (char *)(v103 + 4 * v100);
                *(_DWORD *)id v105 = begin_node[8].__value_.__left_;
                dispatch_semaphore_t v98 = v105 + 4;
                while (v97 != v99)
                {
                  int v106 = *((_DWORD *)v97 - 1);
                  v97 -= 4;
                  *((_DWORD *)v105 - 1) = v106;
                  v105 -= 4;
                }
                v188 = v105;
                v189 = v98;
                unint64_t v190 = v103 + 4 * v104;
                if (v99) {
                  operator delete(v99);
                }
              }
              else
              {
                *(_DWORD *)v189 = begin_node[8].__value_.__left_;
                dispatch_semaphore_t v98 = v97 + 4;
              }
              v189 = v98;
              BOOL v107 = v186;
              if ((unint64_t)v186 >= v187)
              {
                uint64_t v109 = (char *)v185;
                uint64_t v110 = (v186 - (unsigned char *)v185) >> 2;
                unint64_t v111 = v110 + 1;
                if ((unint64_t)(v110 + 1) >> 62) {
                  goto LABEL_270;
                }
                uint64_t v112 = v187 - (void)v185;
                if ((uint64_t)(v187 - (void)v185) >> 1 > v111) {
                  unint64_t v111 = v112 >> 1;
                }
                if ((unint64_t)v112 >= 0x7FFFFFFFFFFFFFFCLL) {
                  unint64_t v113 = 0x3FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v113 = v111;
                }
                if (v113)
                {
                  unint64_t v113 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v113);
                  uint64_t v109 = (char *)v185;
                  BOOL v107 = v186;
                }
                else
                {
                  uint64_t v114 = 0;
                }
                char v115 = (char *)(v113 + 4 * v110);
                *(_DWORD *)char v115 = HIDWORD(begin_node[8].__value_.__left_);
                id v108 = v115 + 4;
                while (v107 != v109)
                {
                  int v116 = *((_DWORD *)v107 - 1);
                  v107 -= 4;
                  *((_DWORD *)v115 - 1) = v116;
                  v115 -= 4;
                }
                v185 = v115;
                v186 = v108;
                unint64_t v187 = v113 + 4 * v114;
                if (v109) {
                  operator delete(v109);
                }
              }
              else
              {
                *(_DWORD *)v186 = HIDWORD(begin_node[8].__value_.__left_);
                id v108 = v107 + 4;
              }
              v186 = v108;
              id v117 = v183;
              if ((unint64_t)v183 >= v184)
              {
                uint64_t v119 = (char *)v182;
                uint64_t v120 = (v183 - (unsigned char *)v182) >> 2;
                unint64_t v121 = v120 + 1;
                if ((unint64_t)(v120 + 1) >> 62) {
                  goto LABEL_270;
                }
                uint64_t v122 = v184 - (void)v182;
                if ((uint64_t)(v184 - (void)v182) >> 1 > v121) {
                  unint64_t v121 = v122 >> 1;
                }
                if ((unint64_t)v122 >= 0x7FFFFFFFFFFFFFFCLL) {
                  unint64_t v123 = 0x3FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v123 = v121;
                }
                if (v123)
                {
                  unint64_t v123 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v123);
                  uint64_t v119 = (char *)v182;
                  id v117 = v183;
                }
                else
                {
                  uint64_t v124 = 0;
                }
                BOOL v125 = (char *)(v123 + 4 * v120);
                *(_DWORD *)BOOL v125 = begin_node[9].__value_.__left_;
                v118 = v125 + 4;
                while (v117 != v119)
                {
                  int v126 = *((_DWORD *)v117 - 1);
                  v117 -= 4;
                  *((_DWORD *)v125 - 1) = v126;
                  v125 -= 4;
                }
                v182 = v125;
                v183 = v118;
                unint64_t v184 = v123 + 4 * v124;
                if (v119) {
                  operator delete(v119);
                }
              }
              else
              {
                *(_DWORD *)v183 = begin_node[9].__value_.__left_;
                v118 = v117 + 4;
              }
              v183 = v118;
              if (BYTE1(self->_transferSession)) {
                break;
              }
              if (BYTE2(self->_transferSession))
              {
                unint64_t v129 = v180;
                if ((unint64_t)v180 < v181)
                {
                  *(_DWORD *)v180 = 5;
                  v128 = v129 + 4;
LABEL_202:
                  v130 = v128;
LABEL_229:
                  v180 = v130;
                  goto LABEL_230;
                }
                v131 = (char *)v179;
                uint64_t v137 = (v180 - (unsigned char *)v179) >> 2;
                unint64_t v138 = v137 + 1;
                if ((unint64_t)(v137 + 1) >> 62) {
                  std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
                }
                uint64_t v139 = v181 - (void)v179;
                if ((uint64_t)(v181 - (void)v179) >> 1 > v138) {
                  unint64_t v138 = v139 >> 1;
                }
                if ((unint64_t)v139 >= 0x7FFFFFFFFFFFFFFCLL) {
                  unint64_t v135 = 0x3FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v135 = v138;
                }
                if (v135)
                {
                  unint64_t v135 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v135);
                  v131 = (char *)v179;
                  unint64_t v129 = v180;
                }
                else
                {
                  uint64_t v136 = 0;
                }
                uint64_t v140 = (char *)(v135 + 4 * v137);
                *(_DWORD *)uint64_t v140 = 5;
                v130 = v140 + 4;
                while (v129 != v131)
                {
                  int v142 = *((_DWORD *)v129 - 1);
                  v129 -= 4;
                  *((_DWORD *)v140 - 1) = v142;
                  v140 -= 4;
                }
LABEL_227:
                v179 = v140;
                v180 = v130;
                unint64_t v181 = v135 + 4 * v136;
                if (v131) {
                  operator delete(v131);
                }
                goto LABEL_229;
              }
LABEL_230:
              isa = (MLNeuralNetworkEngine *)begin_node[1].__value_.__left_;
              if (isa)
              {
                do
                {
                  v144 = isa;
                  isa = (MLNeuralNetworkEngine *)isa->super.super.isa;
                }
                while (isa);
              }
              else
              {
                do
                {
                  v144 = (MLNeuralNetworkEngine *)begin_node[2].__value_.__left_;
                  BOOL v145 = v144->super.super.isa == (Class)begin_node;
                  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, _BlobShape>, void *>>> *)v144;
                }
                while (!v145);
              }
              begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, _BlobShape>, void *>>> *)v144;
              if (v144 == (MLNeuralNetworkEngine *)&self->_currentBlobShapes.__tree_.__pair1_) {
                goto LABEL_236;
              }
            }
            v127 = v180;
            if ((unint64_t)v180 < v181)
            {
              *(_DWORD *)v180 = HIDWORD(begin_node[9].__value_.__left_);
              v128 = v127 + 4;
              goto LABEL_202;
            }
            v131 = (char *)v179;
            uint64_t v132 = (v180 - (unsigned char *)v179) >> 2;
            unint64_t v133 = v132 + 1;
            if ((unint64_t)(v132 + 1) >> 62) {
LABEL_270:
            }
              std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
            uint64_t v134 = v181 - (void)v179;
            if ((uint64_t)(v181 - (void)v179) >> 1 > v133) {
              unint64_t v133 = v134 >> 1;
            }
            if ((unint64_t)v134 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v135 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v135 = v133;
            }
            if (v135)
            {
              unint64_t v135 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v135);
              v131 = (char *)v179;
              v127 = v180;
            }
            else
            {
              uint64_t v136 = 0;
            }
            uint64_t v140 = (char *)(v135 + 4 * v132);
            *(_DWORD *)uint64_t v140 = HIDWORD(begin_node[9].__value_.__left_);
            v130 = v140 + 4;
            while (v127 != v131)
            {
              int v141 = *((_DWORD *)v127 - 1);
              v127 -= 4;
              *((_DWORD *)v140 - 1) = v141;
              v140 -= 4;
            }
            goto LABEL_227;
          }
LABEL_236:
          if (v158)
          {
            BYTE1(self->_compilerOutput) = 1;
            if (*(_DWORD *)&self->_hardwareFallbackDetected == 10007)
            {
              v146 = [(MLModelEngine *)self configuration];
              [(MLNeuralNetworkEngine *)self _setupContextAndPlanWithConfiguration:v146 usingCPU:0 priority:[(MLNeuralNetworkEngine *)self priority] reshapeWithContainer:1 error:a4];
            }
          }
          std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy((char *)self->_flexibleShapesConfigNamesInNet.__tree_.__pair1_.__value_.__left_);
          self->_flexibleShapesConfigNamesInNet.__tree_.__begin_node_ = &self->_flexibleShapesConfigNamesInNet.__tree_.__pair1_;
          self->_flexibleShapesConfigNamesInNet.__tree_.__pair3_.__value_ = 0;
          self->_flexibleShapesConfigNamesInNet.__tree_.__pair1_.__value_.__left_ = 0;
          MEMORY[0x19F3C1430](&self->_currentConfigurationName, &unk_19EC86ACE);
          [(MLNeuralNetworkEngine *)self plan];
          if (espresso_plan_get_phase() == 1
            && ([(MLNeuralNetworkEngine *)self plan], espresso_plan_build_clean()))
          {
            v147 = +[MLLogging coreChannel];
            if (os_log_type_enabled(v147, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v178 = 0;
              _os_log_error_impl(&dword_19E58B000, v147, OS_LOG_TYPE_ERROR, "Failure in setting up to dynamically allocate for sequence size.", v178, 2u);
            }

            p_currentBlobShapes = &self->_currentBlobShapes;
            if (a4)
            {
              id v149 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v199 = v156;
              char v150 = [NSString stringWithFormat:@"Failure in setting up to dynamically allocate for sequence size."];
              v200 = v150;
              char v151 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v200 forKeys:&v199 count:1];
              *a4 = [v149 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v151];

              p_currentBlobShapes = &self->_currentBlobShapes;
            }
          }
          else
          {
            BOOL v152 = [(MLNeuralNetworkEngine *)self setEspressoBlobShapes:v211 widths:&buf heights:&__p ks:&v188 batches:&v185 sequences:&v182 ranks:&v179 error:a4];
            p_currentBlobShapes = &self->_currentBlobShapes;
            if (v152)
            {
              char v153 = 1;
LABEL_250:
              if (v179)
              {
                v180 = (char *)v179;
                operator delete(v179);
              }
              if (v182)
              {
                v183 = (char *)v182;
                operator delete(v182);
              }
              if (v185)
              {
                v186 = (char *)v185;
                operator delete(v185);
              }
              if (v188)
              {
                v189 = (char *)v188;
                operator delete(v188);
              }
              if (__p)
              {
                v192 = (char *)__p;
                operator delete(__p);
              }
              if ((void)buf)
              {
                *((void *)&buf + 1) = buf;
                operator delete((void *)buf);
              }
              if (*(void *)v211)
              {
                v212 = *(__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, _BlobShape>, void *>>> ***)v211;
                operator delete(*(void **)v211);
              }
              if ((v153 & 1) == 0) {
                goto LABEL_86;
              }
              uint64_t v63 = 1;
              goto LABEL_89;
            }
          }
          char v153 = 0;
          if (v198
            && p_currentBlobShapes != (map<std::string, _BlobShape, std::less<std::string>, std::allocator<std::pair<const std::string, _BlobShape>>> *)v198)
          {
            std::__tree<std::__value_type<std::string,_BlobShape>,std::__map_value_compare<std::string,std::__value_type<std::string,_BlobShape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,_BlobShape>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<std::string,_BlobShape>,std::__tree_node<std::__value_type<std::string,_BlobShape>,void *> *,long>>(p_currentBlobShapes, v198->super.super.isa, &v198->super._signpostID);
            char v153 = 0;
          }
          goto LABEL_250;
        }
LABEL_88:
        uint64_t v63 = 0;
LABEL_89:
        if (!espresso_plan_get_phase()
          && ![(MLNeuralNetworkEngine *)self rebuildPlan:v63 error:a4])
        {
          if (v198
            && &self->_currentBlobShapes != (map<std::string, _BlobShape, std::less<std::string>, std::allocator<std::pair<const std::string, _BlobShape>>> *)v198)
          {
            std::__tree<std::__value_type<std::string,_BlobShape>,std::__map_value_compare<std::string,std::__value_type<std::string,_BlobShape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,_BlobShape>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<std::string,_BlobShape>,std::__tree_node<std::__value_type<std::string,_BlobShape>,void *> *,long>>(&self->_currentBlobShapes.__tree_.__begin_node_, v198->super.super.isa, &v198->super._signpostID);
          }
          goto LABEL_86;
        }
        BOOL v62 = 1;
        goto LABEL_92;
      }
      goto LABEL_3;
    }
  }
  char v59 = obj;
LABEL_85:

LABEL_86:
  BOOL v62 = 0;
LABEL_92:
  std::unique_ptr<std::map<std::string,_BlobShape>>::reset[abi:ne180100]((uint64_t *)&v198, 0);

  return v62;
}

- (BOOL)bindInputFeatureNamed:(id)a3 featureValue:(id)a4 bufferIndex:(unint64_t)a5 cleanUpBlocks:(id)a6 boundDirectly:(BOOL *)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = v14;
  int64_t v17 = 0;
  BOOL v33 = 0;
  uint32_t v30 = v16;
  while (1)
  {
    switch(v17)
    {
      case 0:
        int64_t v17 = [(MLNeuralNetworkEngine *)self inputBindStateForFeatureValue:v16 error:a8];
        continue;
      case 1:
      case 2:
        if (a7 && v17 == 1) {
          *a7 = v33;
        }

        return v17 == 1;
      case 3:
        unint64_t v19 = [(MLModelEngine *)self signpostID];
        kdebug_trace();
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __106__MLNeuralNetworkEngine_bindInputFeatureNamed_featureValue_bufferIndex_cleanUpBlocks_boundDirectly_error___block_invoke;
        aBlock[3] = &__block_descriptor_40_e5_v8__0l;
        aBlock[4] = v19;
        BOOL v20 = (void (**)(void))_Block_copy(aBlock);
        uint64_t v21 = -[MLNeuralNetworkEngine imageFeatureValueFromPixelBuffer:usingPixelFormat:](self, "imageFeatureValueFromPixelBuffer:usingPixelFormat:", [v16 imageBufferValue], 1111970369);

        v20[2](v20);
        int64_t v17 = 0;
        id v16 = (id)v21;
        continue;
      case 4:
      case 5:
        BOOL v18 = -[MLNeuralNetworkEngine bindInputFeatureNamed:pixelBuffer:cleanUpBlocks:error:](self, "bindInputFeatureNamed:pixelBuffer:cleanUpBlocks:error:", v13, [v16 imageBufferValue], v15, a8);
        goto LABEL_8;
      case 6:
        goto LABEL_7;
      case 7:
        unint64_t v22 = [(MLModelEngine *)self signpostID];
        kdebug_trace();
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __106__MLNeuralNetworkEngine_bindInputFeatureNamed_featureValue_bufferIndex_cleanUpBlocks_boundDirectly_error___block_invoke_2;
        v31[3] = &__block_descriptor_40_e5_v8__0l;
        v31[4] = v22;
        uint64_t v23 = (void (**)(void))_Block_copy(v31);
        uint64_t v24 = -[MLNeuralNetworkEngine imageFeatureValueFromPixelBuffer:usingPixelFormat:](self, "imageFeatureValueFromPixelBuffer:usingPixelFormat:", [v16 imageBufferValue], 1278226536);

        v23[2](v23);
        id v16 = (id)v24;
LABEL_7:
        BOOL v18 = -[MLNeuralNetworkEngine bindDirectlyInputFeatureNamed:pixelBuffer:cleanUpBlocks:boundDirectly:error:](self, "bindDirectlyInputFeatureNamed:pixelBuffer:cleanUpBlocks:boundDirectly:error:", v13, [v16 imageBufferValue], v15, &v33, a8);
LABEL_8:
        if (v18) {
          int64_t v17 = 1;
        }
        else {
          int64_t v17 = 2;
        }
        continue;
      case 8:
        char v25 = [v16 multiArrayValue];
        BOOL v26 = -[MLNeuralNetworkEngine bindDirectlyInputFeatureNamed:pixelBuffer:cleanUpBlocks:boundDirectly:error:](self, "bindDirectlyInputFeatureNamed:pixelBuffer:cleanUpBlocks:boundDirectly:error:", v13, [v25 pixelBuffer], v15, &v33, a8);

        int64_t v17 = 1;
        if (!v26) {
          goto LABEL_12;
        }
        continue;
      case 9:
      case 10:
      case 11:
      case 12:
LABEL_12:
        uint64_t v27 = [v16 multiArrayValue];
        if ([(MLNeuralNetworkEngine *)self bindInputFeatureNamed:v13 convertingMultiArray:v27 bufferIndex:a5 error:a8])
        {
          int64_t v17 = 1;
        }
        else
        {
          int64_t v17 = 2;
        }

        break;
      default:
        continue;
    }
  }
}

- (int64_t)inputBindStateForFeatureValue:(id)a3 error:(id *)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (!v5)
  {
LABEL_16:
    int64_t v12 = 2;
    goto LABEL_42;
  }
  uint64_t v7 = [v5 type];
  uint64_t v8 = v7;
  if (v7 == 5)
  {
    id v13 = [v6 multiArrayValue];
    uint64_t v14 = [v13 dataType];
    uint64_t v15 = v14;
    if (v14 > 65599)
    {
      if (v14 == 65600)
      {
        int64_t v12 = 10;
        goto LABEL_41;
      }
      if (v14 == 131104)
      {
        int64_t v12 = 11;
        goto LABEL_41;
      }
    }
    else
    {
      if (v14 == 65552)
      {
        if ([v13 pixelBuffer]
          && CVPixelBufferGetIOSurface((CVPixelBufferRef)[v13 pixelBuffer]))
        {
          int64_t v12 = 8;
        }
        else
        {
          int64_t v12 = 9;
        }
        goto LABEL_41;
      }
      if (v14 == 65568)
      {
        int64_t v12 = 12;
LABEL_41:

        goto LABEL_42;
      }
    }
    BOOL v26 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)id v39 = v15;
      _os_log_error_impl(&dword_19E58B000, v26, OS_LOG_TYPE_ERROR, "Invalid multi-array data type: %08x.", buf, 8u);
    }

    if (a4)
    {
      uint64_t v27 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v34 = *MEMORY[0x1E4F28568];
      int v28 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid multi-array data type: %08x.", v15);
      uint64_t v35 = v28;
      uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
      *a4 = [v27 errorWithDomain:@"com.apple.CoreML" code:1 userInfo:v29];
    }
    int64_t v12 = 2;
    goto LABEL_41;
  }
  if (v7 != 4)
  {
    id v16 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v31 = +[MLFeatureTypeUtils descriptionForType:v8];
      *(_DWORD *)long long buf = 138412290;
      *(void *)id v39 = v31;
      _os_log_error_impl(&dword_19E58B000, v16, OS_LOG_TYPE_ERROR, "Unsupported input feature type: %@", buf, 0xCu);
    }
    if (a4)
    {
      int64_t v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v32 = *MEMORY[0x1E4F28568];
      BOOL v18 = NSString;
      unint64_t v19 = +[MLFeatureTypeUtils descriptionForType:v8];
      BOOL v20 = [v18 stringWithFormat:@"Unsupported input feature type: %@", v19];
      BOOL v33 = v20;
      uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
      *a4 = [v17 errorWithDomain:@"com.apple.CoreML" code:1 userInfo:v21];
    }
    goto LABEL_16;
  }
  uint64_t v9 = (__CVBuffer *)[v6 imageBufferValue];
  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(v9);
  unsigned int v11 = PixelFormatType;
  if (PixelFormatType <= 1278226487)
  {
    if (PixelFormatType == 32)
    {
      int64_t v12 = 3;
      goto LABEL_42;
    }
    if (PixelFormatType == 1111970369)
    {
      int64_t v12 = 4;
      goto LABEL_42;
    }
    goto LABEL_25;
  }
  if (PixelFormatType == 1278226488)
  {
    int64_t v12 = 5;
    goto LABEL_42;
  }
  if (PixelFormatType != 1278226536)
  {
LABEL_25:
    unint64_t v22 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 67109888;
      *(_DWORD *)id v39 = HIBYTE(v11);
      *(_WORD *)&v39[4] = 1024;
      *(_DWORD *)&v39[6] = BYTE2(v11);
      __int16 v40 = 1024;
      int v41 = BYTE1(v11);
      __int16 v42 = 1024;
      int v43 = v11;
    }

    if (a4)
    {
      uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v24 = v36 = *MEMORY[0x1E4F28568];
      BOOL v37 = v24;
      char v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
      *a4 = [v23 errorWithDomain:@"com.apple.CoreML" code:1 userInfo:v25];
    }
    goto LABEL_16;
  }
  if (CVPixelBufferGetIOSurface(v9)) {
    int64_t v12 = 6;
  }
  else {
    int64_t v12 = 7;
  }
LABEL_42:

  return v12;
}

- (BOOL)bindInputFeatureNamed:(id)a3 convertingMultiArray:(id)a4 bufferIndex:(unint64_t)a5 error:(id *)a6
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  id v39 = a4;
  [(MLNeuralNetworkEngine *)self prepareBlobNamed:v38 forNewBlobBackingMode:0x10000 bindMode:0x10000];
  begin = self->_inputBuffers.__begin_;
  id v10 = v38;
  std::string::basic_string[abi:ne180100]<0>(buf, (char *)[v10 UTF8String]);
  __int16 v42 = buf;
  unsigned int v11 = (void *)*((void *)std::__tree<std::__value_type<std::string,espresso_buffer_t *>,std::__map_value_compare<std::string,std::__value_type<std::string,espresso_buffer_t *>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,espresso_buffer_t *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)begin + 24 * a5, buf, &v42)+ 7);
  if (v50 < 0) {
    operator delete(*(void **)buf);
  }
  id v41 = v10;
  [v41 UTF8String];
  uint64_t v12 = espresso_network_bind_buffer();
  if (!v12)
  {
    if (BYTE1(self->_transferSession))
    {
      int64_t v17 = [v39 shape];
      BOOL v18 = [MEMORY[0x1E4F1CA48] arrayWithArray:v17];
      unint64_t v19 = 0;
      uint64_t v20 = 1;
      uint64_t v21 = -1;
      while (v19 < [v17 count])
      {
        unint64_t v22 = [NSNumber numberWithInt:v20];
        objc_msgSend(v18, "setObject:atIndexedSubscript:", v22, v21 + objc_msgSend(v17, "count"));

        uint64_t v23 = objc_msgSend(v17, "objectAtIndexedSubscript:", v21 + objc_msgSend(v17, "count"));
        int v24 = [v23 integerValue];

        uint64_t v20 = (v20 * v24);
        ++v19;
        --v21;
      }
      BOOL v26 = [[MLMultiArray alloc] initWithDataPointer:*v11 shape:v17 dataType:65568 strides:v18 deallocator:0 error:a6];
    }
    else
    {
      uint64_t v27 = [NSNumber numberWithUnsignedLong:v11[14]];
      v44[0] = v27;
      int v28 = [NSNumber numberWithUnsignedLong:v11[13]];
      v44[1] = v28;
      uint64_t v29 = [NSNumber numberWithUnsignedLong:v11[12]];
      v44[2] = v29;
      uint32_t v30 = [NSNumber numberWithUnsignedLong:v11[11]];
      v44[3] = v30;
      uint64_t v31 = [NSNumber numberWithUnsignedLong:v11[10]];
      v44[4] = v31;
      int64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:5];

      uint64_t v32 = [NSNumber numberWithUnsignedLong:v11[19]];
      v43[0] = v32;
      BOOL v33 = [NSNumber numberWithUnsignedLong:v11[18]];
      v43[1] = v33;
      uint64_t v34 = [NSNumber numberWithUnsignedLong:v11[17]];
      v43[2] = v34;
      uint64_t v35 = [NSNumber numberWithUnsignedLong:v11[16]];
      v43[3] = v35;
      uint64_t v36 = [NSNumber numberWithUnsignedLong:v11[15]];
      v43[4] = v36;
      BOOL v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:5];

      BOOL v26 = [[MLMultiArray alloc] initWithDataPointer:*v11 shape:v17 dataType:65568 strides:v18 deallocator:0 error:a6];
    }
    uint64_t v15 = v26;

    if (v15)
    {
      [(MLModelEngine *)self signpostID];
      kdebug_trace();
      char v25 = [v39 copyIntoMultiArray:v15 error:a6];
      kdebug_trace();
LABEL_18:

      goto LABEL_19;
    }
LABEL_17:
    char v25 = 0;
    goto LABEL_18;
  }
  id v13 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412546;
    *(void *)&uint8_t buf[4] = v41;
    __int16 v48 = 1024;
    int v49 = v12;
    _os_log_error_impl(&dword_19E58B000, v13, OS_LOG_TYPE_ERROR, "Failed to bind the input feature named '%@' to the underlying inference engine due to an error: %d.", buf, 0x12u);
  }

  if (a6)
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v45 = *MEMORY[0x1E4F28568];
    uint64_t v15 = [NSString stringWithFormat:@"Failed to bind the input feature named '%@' to the underlying inference engine due to an error: %d.", v41, v12];
    int v46 = v15;
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
    *a6 = [v14 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v16];

    goto LABEL_17;
  }
  char v25 = 0;
LABEL_19:

  return v25;
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 12) = 0;
  *((void *)self + 11) = 0;
  *((void *)self + 10) = (char *)self + 88;
  *((void *)self + 15) = 0;
  *((void *)self + 14) = 0;
  *((void *)self + 13) = (char *)self + 112;
  *((void *)self + 17) = 0;
  *((void *)self + 18) = 0;
  *((void *)self + 16) = 0;
  *((void *)self + 21) = 0;
  *((void *)self + 20) = 0;
  *((void *)self + 19) = (char *)self + 160;
  *(_OWORD *)((char *)self + 184) = 0uLL;
  *((void *)self + 22) = 0;
  *((void *)self + 27) = 0;
  *((void *)self + 26) = 0;
  *((void *)self + 25) = (char *)self + 208;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultOptionalValues, 0);
  objc_storeStrong((id *)&self->_pixelBufferPool, 0);
  objc_storeStrong((id *)&self->_inputFeatureConformer, 0);
  objc_storeStrong((id *)&self->_optionalInputTypes, 0);
  objc_storeStrong((id *)&self->_espressoProfileInfo, 0);
  objc_storeStrong((id *)&self->_outputBlobNameToLastBackingMode, 0);
  objc_storeStrong((id *)&self->_inputBlobNameToLastBackingMode, 0);
  objc_storeStrong((id *)&self->_submitSemaphore, 0);
  objc_storeStrong((id *)&self->_predictionsQueue, 0);
  objc_storeStrong((id *)&self->_espressoQueue, 0);
  objc_storeStrong((id *)&self->_bufferSemaphore, 0);
  objc_storeStrong((id *)&self->_modelFilePath, 0);
  objc_storeStrong(&self->_probabilityDictionarySharedKeySet, 0);
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong(&self->_plan, 0);
  objc_storeStrong((id *)&self->_espressoInputShapes, 0);
  objc_storeStrong((id *)&self->_imagePreprocessingParameters, 0);
  objc_storeStrong((id *)&self->_outputLayers, 0);
  objc_storeStrong((id *)&self->_inputLayers, 0);
  objc_storeStrong((id *)&self->_classScoreVectorName, 0);
  objc_storeStrong((id *)&self->_classLabels, 0);
  objc_storeStrong((id *)&self->_priority, 0);
  objc_storeStrong((id *)&self->_engine, 0);
  objc_storeStrong((id *)&self->_OutputBlobIsDynamic.__tree_.__pair3_, 0);
  std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy((char *)self->_currentConfigurationName.var0);
  if (*((char *)&self->_currentConfigurationName.__r_.__value_.var0.__l + 23) < 0) {
    operator delete(self->_currentConfigurationName.__r_.__value_.var0.__l.__data_);
  }
  std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy((char *)self->_flexibleShapesConfigNamesInNet.__tree_.__pair1_.__value_.__left_);
  begin = self->_bufferAvailable.__begin_;
  if (begin) {
    operator delete(begin);
  }
  std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy((char *)self->_currentBlobShapes.__tree_.__pair1_.__value_.__left_);
  std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy((char *)self->_params.__tree_.__pair1_.__value_.__left_);
  p_outputBuffers = &self->_outputBuffers;
  std::vector<std::map<std::string,espresso_buffer_t *>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_outputBuffers);
  p_outputBuffers = &self->_inputBuffers;
  std::vector<std::map<std::string,espresso_buffer_t *>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_outputBuffers);
}

- (void)setActiveFunction:(id)a3
{
}

- (MLVersionInfo)compilerVersionInfo
{
  return (MLVersionInfo *)self->_pixelBufferPool;
}

- (void)setDefaultOptionalValues:(id)a3
{
}

- (NSDictionary)defaultOptionalValues
{
  return (NSDictionary *)self->_inputFeatureConformer;
}

- (void)setNetwork:(id)a3
{
  *($C4732ECC957FA13B9B3DF4A51A95735B *)&self->_compilerVersionInfo = a3;
}

- (MLPixelBufferPool)pixelBufferPool
{
  return (MLPixelBufferPool *)self->_optionalInputTypes;
}

- (NSDictionary)optionalInputTypes
{
  return &self->_outputBlobNameToLastBackingMode->super;
}

- (void)setEspressoProfileInfo:(id)a3
{
}

- (EspressoProfilingNetworkInfo)espressoProfileInfo
{
  return (EspressoProfilingNetworkInfo *)self->_inputBlobNameToLastBackingMode;
}

- (void)setIsANEPathForbidden:(BOOL)a3
{
  BYTE1(self->_compilerOutput) = a3;
}

- (BOOL)isANEPathForbidden
{
  return BYTE1(self->_compilerOutput) & 1;
}

- (void)setIsGPUPathForbidden:(BOOL)a3
{
  LOBYTE(self->_compilerOutput) = a3;
}

- (BOOL)isGPUPathForbidden
{
  return (uint64_t)self->_compilerOutput & 1;
}

- (void)setSubmitSemaphore:(id)a3
{
}

- (void)setPredictionsQueue:(id)a3
{
}

- (OS_dispatch_queue)predictionsQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 400, 1);
}

- (void)setEspressoQueue:(id)a3
{
}

- (OS_dispatch_queue)espressoQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 392, 1);
}

- (void)setBufferSemaphore:(id)a3
{
}

- (OS_dispatch_semaphore)bufferSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 384, 1);
}

- (void)setHasOptionalInputSequenceConcat:(BOOL)a3
{
  HIBYTE(self->_transferSession) = a3;
}

- (BOOL)hasOptionalInputSequenceConcat
{
  return HIBYTE(self->_transferSession);
}

- (void)setHasBidirectionalLayer:(BOOL)a3
{
  BYTE5(self->_transferSession) = a3;
}

- (BOOL)hasBidirectionalLayer
{
  return BYTE5(self->_transferSession);
}

- (void)setModelFilePath:(id)a3
{
}

- (NSString)modelFilePath
{
  return (NSString *)self->_context;
}

- (void)setProbabilityDictionarySharedKeySet:(id)a3
{
}

- (id)probabilityDictionarySharedKeySet
{
  return self->_plan;
}

- (void)setIsEspressoBiasPreprocessingShared:(BOOL)a3
{
  BYTE4(self->_transferSession) = a3;
}

- (void)setPriority:(int)a3
{
  *(_DWORD *)&self->_isGPUPathForbidden = a3;
}

- (void)setContext:(void *)a3
{
  self->_numOutputs = (unint64_t)a3;
}

- (void)context
{
  return (void *)self->_numOutputs;
}

- (void)setQos:(int)a3
{
  *(_DWORD *)&self->_isEspressoBiasPreprocessingShared = a3;
}

- (int)qos
{
  return *(_DWORD *)&self->_isEspressoBiasPreprocessingShared;
}

- (void)setEngine:(int)a3
{
  *(_DWORD *)&self->_hardwareFallbackDetected = a3;
}

- (int)engine
{
  return *(_DWORD *)&self->_hardwareFallbackDetected;
}

- (void)setPrecision:(int)a3
{
  HIDWORD(self->_compilerOutput) = a3;
}

- (int)precision
{
  return HIDWORD(self->_compilerOutput);
}

- (void)setPlan:(void *)a3
{
  self->_numInputs = (unint64_t)a3;
}

- (void)setUsingCPU:(BOOL)a3
{
  BYTE3(self->_transferSession) = a3;
}

- (BOOL)usingCPU
{
  return BYTE3(self->_transferSession);
}

- (unint64_t)numOutputs
{
  return (unint64_t)self->_modelVersionInfo;
}

- (unint64_t)numInputs
{
  return (unint64_t)self->_espressoInputStrides;
}

- (void)setModelIsMIL:(BOOL)a3
{
  BYTE2(self->_transferSession) = a3;
}

- (BOOL)modelIsMIL
{
  return BYTE2(self->_transferSession);
}

- (void)setNdArrayInterpretation:(BOOL)a3
{
  BYTE1(self->_transferSession) = a3;
}

- (BOOL)ndArrayInterpretation
{
  return BYTE1(self->_transferSession);
}

- (void)setEspressoInputStrides:(id)a3
{
}

- (NSDictionary)espressoInputStrides
{
  return self->_imagePreprocessingParameters;
}

- (void)setEspressoInputShapes:(id)a3
{
}

- (NSDictionary)espressoInputShapes
{
  return (NSDictionary *)self->_outputLayers;
}

- (void)setImagePreprocessingParameters:(id)a3
{
}

- (NSDictionary)imagePreprocessingParameters
{
  return (NSDictionary *)self->_inputLayers;
}

- (void)setHardwareFallbackDetected:(BOOL)a3
{
  LOBYTE(self->_transferSession) = a3;
}

- (BOOL)hardwareFallbackDetected
{
  return (BOOL)self->_transferSession;
}

- (NSArray)outputLayers
{
  return (NSArray *)self->_classScoreVectorName;
}

- (NSArray)inputLayers
{
  return self->_classLabels;
}

- (void)setClassScoreVectorName:(id)a3
{
}

- (NSString)classScoreVectorName
{
  return *(NSString **)&self->_priority;
}

- (void)setClassLabels:(id)a3
{
}

- (void)enableInstrumentsTracing
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(MLNeuralNetworkEngine *)self network];
  Espresso::get_internal_network();
  uint64_t v3 = [(MLModelEngine *)self configuration];
  uint64_t v4 = [v3 modelDisplayName];
  if (v4)
  {
    id v5 = [v3 modelDisplayName];
  }
  else
  {
    id v5 = &stru_1EF0E81D0;
  }

  id v6 = +[MLLogging coreChannel];
  uint64_t v7 = +[MLLogging coreChannel];
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_DWORD *)long long buf = 134218754;
    unint64_t v12 = [(MLModelEngine *)self signpostID];
    __int16 v13 = 2082;
    uint64_t v14 = [(__CFString *)v5 UTF8String];
    __int16 v15 = 2048;
    id v16 = self;
    __int16 v17 = 2048;
    uint64_t v18 = v9;
    _os_signpost_emit_with_name_impl(&dword_19E58B000, v6, OS_SIGNPOST_EVENT, v8, "MLModel_Net_Discover", "Model-signpost-id:%lluModel-name:%{public}sModel-address:%lluEspresso-network-id:%llu", buf, 0x2Au);
  }

  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
}

- (id)executionSchedule
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_debug_impl(&dword_19E58B000, v2, OS_LOG_TYPE_DEBUG, "Profiler: MLNeuralNetworkEngine::executionSchedule", buf, 2u);
  }

  long long v53 = objc_alloc_init(MLModelExecutionSchedule);
  uint64_t v3 = [(MLModelEngine *)self configuration];
  BOOL v4 = ([v3 profilingOptions] & 1) == 0;

  if (!v4)
  {
    id v58 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v55 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v5 = [(MLModelEngine *)self configuration];
    id v54 = [v5 modelDisplayName];

    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v6 = [(MLNeuralNetworkEngine *)self espressoProfileInfo];
    obuint64_t j = [v6 layers];

    uint64_t v7 = [obj countByEnumeratingWithState:&v64 objects:v76 count:16];
    if (v7)
    {
      uint64_t v60 = 0;
      uint64_t v57 = *(void *)v65;
      do
      {
        uint64_t v8 = 0;
        uint64_t v59 = v7;
        do
        {
          if (*(void *)v65 != v57) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void **)(*((void *)&v64 + 1) + 8 * v8);
          objc_msgSend(v9, "selected_runtime_engine");
          Espresso::platform_to_string();
          id v10 = +[MLLogging coreChannel];
          os_signpost_id_t v11 = [(MLModelEngine *)self signpostID];
          if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            uint64_t v12 = [v54 UTF8String];
            id v13 = [v9 name];
            uint64_t v14 = [v13 UTF8String];
            p_p = &__p;
            if (v63 < 0) {
              p_p = __p;
            }
            *(_DWORD *)long long buf = 136315650;
            uint64_t v71 = v12;
            __int16 v72 = 2080;
            uint64_t v73 = v14;
            __int16 v74 = 2080;
            uint64_t v75 = p_p;
            _os_signpost_emit_with_name_impl(&dword_19E58B000, v10, OS_SIGNPOST_EVENT, v11, "Model Layer Info", "model-name:%slayer-name:%splatform:%s", buf, 0x20u);
          }
          id v16 = [v9 name];
          __int16 v17 = objc_msgSend(v9, "debug_name");
          BOOL v18 = [v17 length] == 0;

          if (v18)
          {
            uint64_t v20 = 0;
          }
          else
          {
            uint64_t v19 = objc_msgSend(v9, "debug_name");

            if ([(MLNeuralNetworkEngine *)self modelIsMIL])
            {
              uint64_t v20 = objc_msgSend(v9, "debug_name");
              uint64_t v21 = objc_msgSend(v9, "debug_name");
              unint64_t v22 = [v21 componentsSeparatedByString:@":"];

              if ([v22 count] == 3)
              {
                uint64_t v23 = NSString;
                int v24 = objc_msgSend(v9, "main_engine_support");
                char v25 = [v24 type];
                BOOL v26 = [v22 objectAtIndexedSubscript:1];
                uint64_t v27 = [v22 objectAtIndexedSubscript:2];
                id v16 = [v23 stringWithFormat:@"%@:%@:%@", v25, v26, v27];

                int v28 = NSString;
                uint64_t v29 = [v22 objectAtIndexedSubscript:1];
                uint32_t v30 = [v22 objectAtIndexedSubscript:2];
                uint64_t v31 = [v28 stringWithFormat:@"%@:%@", v29, v30];

                uint64_t v20 = (void *)v31;
              }
              else
              {
                id v16 = v19;
              }
            }
            else
            {
              uint64_t v20 = 0;
              id v16 = v19;
            }
          }
          unint64_t v32 = [(MLNeuralNetworkEngine *)self supportFromEspressoLayerInfo:v9];
          unint64_t v33 = -[MLNeuralNetworkEngine supportFromEspressoPlatform:](self, "supportFromEspressoPlatform:", objc_msgSend(v9, "selected_runtime_engine"));
          if (v32)
          {
            unint64_t v34 = v33;
            if (v33)
            {
              uint64_t v35 = [MLLayerExecutionSchedule alloc];
              uint64_t v36 = objc_msgSend(v9, "main_engine_support");
              BOOL v37 = [v36 type];
              id v38 = [(MLLayerExecutionSchedule *)v35 initWithComputeUnits:v34 layerName:v16 layerError:0 layerTypeName:v37 supportedComputeUnits:v32 layerIndex:v60 supportMessages:NAN computeTimeRatio:MEMORY[0x1E4F1CC08]];

              id v39 = [(MLModelEngine *)self modelPath];
              __int16 v40 = [v39 scopedModelNames];

              id v41 = [MLLayerPath alloc];
              __int16 v42 = [(MLModelEngine *)self modelPath];
              int v43 = [v42 scopedModelNames];
              uint64_t v44 = [(MLLayerPath *)v41 initWithScopedModelAndLayerName:v43 layerName:v16];

              [v58 setObject:v38 forKeyedSubscript:v44];
              uint64_t v68 = v44;
              uint64_t v69 = v38;
              uint64_t v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v69 forKeys:&v68 count:1];
              [v58 addEntriesFromDictionary:v45];

              if ([v20 length]) {
                int v46 = v20;
              }
              else {
                int v46 = v16;
              }
              id v47 = v46;
              __int16 v48 = [[MLModelStructurePath alloc] initWithNeuralNetworkLayerName:v47 scopedModelNames:v40];
              [v55 setObject:v38 forKeyedSubscript:v48];

              ++v60;
            }
          }

          if (v63 < 0) {
            operator delete(__p);
          }
          ++v8;
        }
        while (v59 != v8);
        uint64_t v7 = [obj countByEnumeratingWithState:&v64 objects:v76 count:16];
      }
      while (v7);
    }

    [(MLModelExecutionSchedule *)v53 setModelExecutionSchedule:v58];
    [(MLModelExecutionSchedule *)v53 setModelExecutionScheduleByModelStructurePath:v55];
    int v49 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v51 = [(MLModelExecutionSchedule *)v53 modelExecutionSchedule];
      uint64_t v52 = [v51 count];
      *(_DWORD *)long long buf = 134217984;
      uint64_t v71 = v52;
      _os_log_debug_impl(&dword_19E58B000, v49, OS_LOG_TYPE_DEBUG, "Profiler: MLNeuralNetworkEngine::executionSchedule %lu layers", buf, 0xCu);
    }
  }

  return v53;
}

- (unint64_t)supportFromEspressoPlatform:(int)a3
{
  unint64_t result = 2;
  if (a3 > 49999)
  {
    if ((a3 - 50000) <= 8 && ((1 << (a3 - 80)) & 0x125) != 0 || a3 == 90000) {
      return result;
    }
    return a3 == 100000;
  }
  if (a3 <= 10006)
  {
    if (a3 && a3 != 100)
    {
      if (a3 != 10006) {
        return 0;
      }
      return 4;
    }
    return 1;
  }
  if (a3 == 10007 || a3 == 10008) {
    return 4;
  }
  if (a3 != 20000) {
    return 0;
  }
  return result;
}

- (unint64_t)supportFromEspressoLayerInfo:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  BOOL v4 = objc_msgSend(v3, "per_platform_support", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (!v5)
  {

LABEL_21:
    BOOL v26 = objc_msgSend(v3, "main_engine_support");
    uint64_t v27 = [v26 type];
    LODWORD(v6) = [v27 isEqualToString:@"context_transfer"];

    unint64_t v6 = v6;
    goto LABEL_22;
  }
  unint64_t v6 = 0;
  uint64_t v7 = *(void *)v30;
  do
  {
    uint64_t v8 = 0;
    do
    {
      if (*(void *)v30 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void **)(*((void *)&v29 + 1) + 8 * v8);
      id v10 = objc_msgSend(v3, "per_platform_support");
      os_signpost_id_t v11 = [v10 objectForKeyedSubscript:v9];
      char v12 = [v11 supported];

      if (v12)
      {
        id v13 = [&unk_1EF11A088 stringValue];
        int v14 = [v9 isEqualToString:v13];

        if (v14) {
          goto LABEL_10;
        }
        __int16 v15 = [&unk_1EF11A0A0 stringValue];
        int v16 = [v9 isEqualToString:v15];

        if (v16
          || ([&unk_1EF11A0B8 stringValue],
              __int16 v17 = objc_claimAutoreleasedReturnValue(),
              int v18 = [v9 isEqualToString:v17],
              v17,
              v18))
        {
LABEL_10:
          v6 |= 2uLL;
        }
        else
        {
          uint64_t v19 = [&unk_1EF11A0D0 stringValue];
          int v20 = [v9 isEqualToString:v19];

          if (v20
            || ([&unk_1EF11A0E8 stringValue],
                uint64_t v21 = objc_claimAutoreleasedReturnValue(),
                int v22 = [v9 isEqualToString:v21],
                v21,
                v22))
          {
            v6 |= 4uLL;
          }
          else
          {
            uint64_t v23 = [&unk_1EF11A100 stringValue];
            unsigned int v24 = [v9 isEqualToString:v23];

            v6 |= v24;
          }
        }
      }
      ++v8;
    }
    while (v5 != v8);
    uint64_t v25 = [v4 countByEnumeratingWithState:&v29 objects:v33 count:16];
    uint64_t v5 = v25;
  }
  while (v25);

  if (!v6) {
    goto LABEL_21;
  }
LABEL_22:

  return v6;
}

- (id)parameterValueForKey:(id)a3 error:(id *)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t v6 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    id v14 = v5;
    _os_log_error_impl(&dword_19E58B000, v6, OS_LOG_TYPE_ERROR, "This neural network model does not have a parameter for requested key '%@'. Note: only updatable neural network models can provide parameter values and these values are only accessible in the context of an MLUpdateTask completion or progress handler.", buf, 0xCu);
  }

  if (a4)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F28568];
    uint64_t v8 = [NSString stringWithFormat:@"This neural network model does not have a parameter for requested key '%@'. Note: only updatable neural network models can provide parameter values and these values are only accessible in the context of an MLUpdateTask completion or progress handler.", v5];
    char v12 = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    *a4 = [v7 errorWithDomain:@"com.apple.CoreML" code:7 userInfo:v9];
  }
  return 0;
}

- (void)dumpTestVectorsToPath:(id)a3
{
  id v4 = a3;
  id v5 = [(MLModelEngine *)self configuration];
  char v6 = [v5 enableTestVectorMode];

  if (v6)
  {
    [(MLNeuralNetworkEngine *)self network];
    [v4 UTF8String];
    espresso_network_dump_test_vector();
  }
  else
  {
    uint64_t v7 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_debug_impl(&dword_19E58B000, v7, OS_LOG_TYPE_DEBUG, "Called dumpTestVectors but configuration didn't specify enableTestVectorMode.", v8, 2u);
    }
  }
}

- (id)predictionsFromBatch:(id)a3 options:(id)a4 error:(id *)a5
{
  v56[1] = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  id v6 = a4;
  uint64_t v50 = 0;
  uint64_t v51 = &v50;
  uint64_t v52 = 0x2020000000;
  int v53 = 0;
  uint64_t v46 = 0;
  id v47 = &v46;
  uint64_t v48 = 0x2020000000;
  int v49 = 0;
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = [v6 copy];

    uint64_t v9 = (void *)v8;
  }
  else
  {
    uint64_t v9 = +[MLPredictionOptions defaultOptions];
  }
  [v9 setOutputBackings:MEMORY[0x1E4F1CC08]];
  BOOL v37 = v9;
  bufferSemaphore = self->_bufferSemaphore;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__MLNeuralNetworkEngine_predictionsFromBatch_options_error___block_invoke;
  block[3] = &unk_1E59A5228;
  block[4] = self;
  void block[5] = &v46;
  block[6] = &v50;
  dispatch_sync(bufferSemaphore, block);
  if (*((_DWORD *)v47 + 6))
  {
    uint64_t v11 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_19E58B000, v11, OS_LOG_TYPE_ERROR, "Failed to check the availability of plan submit.", buf, 2u);
    }

    if (a5)
    {
      char v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v55 = *MEMORY[0x1E4F28568];
      id v13 = [NSString stringWithFormat:@"Failed to check the availability of plan submit."];
      v56[0] = v13;
      uint64_t v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:&v55 count:1];
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", @"com.apple.CoreML", 0);
      id v14 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:

      goto LABEL_17;
    }
    id v14 = 0;
  }
  else
  {
    if (*((_DWORD *)v51 + 6) && !BYTE3(self->_transferSession) && ![v9 predictionUsesCPU])
    {
      id v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v33, "count"));
      for (unint64_t i = 0; i < [v33 count]; ++i)
      {
        int v18 = [MEMORY[0x1E4F1CA98] null];
        [v13 setObject:v18 atIndexedSubscript:i];
      }
      id v43 = 0;
      uint64_t v19 = [(MLNeuralNetworkEngine *)self sortBatchByShape:v33 withMap:&v43 error:a5];
      id v20 = v43;
      id v14 = 0;
      uint64_t v34 = v19;
      uint64_t v35 = v20;
      if (v19 && v20)
      {
        if (a5 && *a5)
        {
          id v14 = 0;
        }
        else
        {
          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          uint64_t v21 = [v19 allKeys];
          obuint64_t j = v21;
          uint64_t v22 = [v21 countByEnumeratingWithState:&v39 objects:v54 count:16];
          if (v22)
          {
            uint64_t v23 = *(void *)v40;
            do
            {
              for (uint64_t j = 0; j != v22; ++j)
              {
                if (*(void *)v40 != v23) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v25 = *(void *)(*((void *)&v39 + 1) + 8 * j);
                BOOL v26 = [v34 objectForKey:v25];
                uint64_t v27 = [v35 objectForKey:v25];
                int v28 = [(MLNeuralNetworkEngine *)self evaluateBatch:v26 options:v37 error:a5];
                for (uint64_t k = 0; k < [v28 count]; ++k)
                {
                  long long v30 = [v28 featuresAtIndex:k];
                  long long v31 = [v27 objectAtIndexedSubscript:k];
                  objc_msgSend(v13, "setObject:atIndexedSubscript:", v30, objc_msgSend(v31, "unsignedIntegerValue"));
                }
              }
              uint64_t v21 = obj;
              uint64_t v22 = [obj countByEnumeratingWithState:&v39 objects:v54 count:16];
            }
            while (v22);
          }

          id v14 = [[MLArrayBatchProvider alloc] initWithFeatureProviderArray:v13];
        }
      }

      goto LABEL_9;
    }
    uint64_t v15 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19E58B000, v15, OS_LOG_TYPE_INFO, "This model is not suitable for faster batch prediction, so it is falling back on a for-loop-based approach.", buf, 2u);
    }

    id v14 = +[MLModel predictionsFromLoopingOverBatch:v33 model:self options:v9 error:a5];
  }
LABEL_17:
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);

  return v14;
}

uint64_t __60__MLNeuralNetworkEngine_predictionsFromBatch_options_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) plan];
  uint64_t result = espresso_plan_can_use_submit();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __62__MLNeuralNetworkEngine_predictionFromFeatures_options_error___block_invoke_2()
{
  return kdebug_trace();
}

- (id)evaluateBatch:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  kdebug_trace();
  uint64_t v38 = 0;
  long long v39 = &v38;
  uint64_t v40 = 0x3032000000;
  long long v41 = __Block_byref_object_copy__3093;
  long long v42 = __Block_byref_object_dispose__3094;
  id v43 = 0;
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  uint64_t v10 = [v8 count];
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v10];
  if (v10)
  {
    uint64_t v12 = v10;
    do
    {
      id v13 = [MEMORY[0x1E4F1CA98] null];
      [v11 addObject:v13];

      --v12;
    }
    while (v12);
  }
  bufferSemaphore = self->_bufferSemaphore;
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  unsigned int v24 = __53__MLNeuralNetworkEngine_evaluateBatch_options_error___block_invoke_2;
  uint64_t v25 = &unk_1E59A3E20;
  BOOL v26 = self;
  id v15 = v9;
  id v27 = v15;
  long long v32 = a5;
  id v16 = v8;
  id v28 = v16;
  long long v30 = &v34;
  uint64_t v33 = v10;
  long long v31 = &v38;
  id v17 = v11;
  id v29 = v17;
  dispatch_sync(bufferSemaphore, &v22);
  if (a5)
  {
    int v18 = (void *)v39[5];
    if (v18) {
      *a5 = v18;
    }
  }
  if (*((unsigned char *)v35 + 24))
  {
    uint64_t v19 = 0;
  }
  else
  {
    id v20 = [MLArrayBatchProvider alloc];
    uint64_t v19 = -[MLArrayBatchProvider initWithFeatureProviderArray:](v20, "initWithFeatureProviderArray:", v17, v22, v23, v24, v25, v26, v27, v28);
  }

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);

  kdebug_trace();

  return v19;
}

void __53__MLNeuralNetworkEngine_evaluateBatch_options_error___block_invoke_2(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) _matchEngineToOptions:*(void *)(a1 + 40) error:*(void *)(a1 + 80)])
  {
    uint64_t v2 = *(void **)(a1 + 32);
    id v3 = [*(id *)(a1 + 48) featuresAtIndex:0];
    uint64_t v4 = [v2 verifyInputs:v3 error:*(void *)(a1 + 80)];

    id v15 = (void *)v4;
    if (v4)
    {
      if ([*(id *)(a1 + 32) resetSizes:v4 error:*(void *)(a1 + 80)])
      {
        id v5 = dispatch_group_create();
        if (*(void *)(a1 + 88))
        {
          unint64_t v6 = 0;
          do
          {
            if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
              break;
            }
            v25[0] = 0;
            v25[1] = v25;
            v25[2] = 0x2020000000;
            uint64_t v26 = 0;
            uint64_t v26 = [*(id *)(a1 + 32) obtainBuffer];
            *(void *)&long long buf = 0;
            *((void *)&buf + 1) = &buf;
            uint64_t v28 = 0x3032000000;
            id v29 = __Block_byref_object_copy__3093;
            long long v30 = __Block_byref_object_dispose__3094;
            id v31 = 0;
            dispatch_group_enter(v5);
            uint64_t v7 = [*(id *)(a1 + 32) espressoQueue];
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __53__MLNeuralNetworkEngine_evaluateBatch_options_error___block_invoke_314;
            block[3] = &unk_1E59A3DF8;
            block[4] = *(void *)(a1 + 32);
            id v17 = *(id *)(a1 + 48);
            p_long long buf = &buf;
            int8x16_t v22 = vextq_s8(*(int8x16_t *)(a1 + 64), *(int8x16_t *)(a1 + 64), 8uLL);
            uint64_t v23 = v25;
            unint64_t v24 = v6;
            int v18 = v5;
            id v19 = *(id *)(a1 + 40);
            id v20 = *(id *)(a1 + 56);
            dispatch_async(v7, block);

            _Block_object_dispose(&buf, 8);
            _Block_object_dispose(v25, 8);
            ++v6;
          }
          while (v6 < *(void *)(a1 + 88));
        }
        dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
      }
      else
      {
        uint64_t v11 = +[MLLogging coreChannel];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          id v14 = [**(id **)(a1 + 80) localizedDescription];
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v14;
          _os_log_error_impl(&dword_19E58B000, v11, OS_LOG_TYPE_ERROR, "Unable to reset sizes for an element of a batch computation. (Underlying error: %@)", (uint8_t *)&buf, 0xCu);
        }
        uint64_t v12 = *(void **)(a1 + 80);
        if (v12)
        {
          **(void **)(a1 + 80) = +[MLModelErrorUtils errorWithCode:0 underlyingError:*v12 format:@"Unable to reset sizes for an element of a batch computation."];
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
      }
    }
    else
    {
      id v8 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v13 = [**(id **)(a1 + 80) localizedDescription];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v13;
        _os_log_error_impl(&dword_19E58B000, v8, OS_LOG_TYPE_ERROR, "Unable to verify the first input of the batch. (Underlying error: %@)", (uint8_t *)&buf, 0xCu);
      }
      id v9 = *(void **)(a1 + 80);
      uint64_t v10 = 0;
      if (!v9) {
        goto LABEL_19;
      }
      **(void **)(a1 + 80) = +[MLModelErrorUtils errorWithCode:0 underlyingError:*v9 format:@"Unable to verify the first input of the batch."];
    }
    uint64_t v10 = v15;
LABEL_19:
  }
}

uint64_t __53__MLNeuralNetworkEngine_evaluateBatch_options_error___block_invoke_314(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) featuresAtIndex:*(void *)(a1 + 104)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 72) + 8);
  obuint64_t j = *(id *)(v4 + 40);
  id v5 = [v2 verifyInputs:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);

  unint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  if (!v5 || v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), v6);
    uint64_t v25 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v29 = *(void *)(a1 + 104);
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v29;
      _os_log_error_impl(&dword_19E58B000, v25, OS_LOG_TYPE_ERROR, "Failed to validate %tu-th input feature provider in batch computation.", (uint8_t *)&buf, 0xCu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
    [*(id *)(a1 + 32) releaseBuffer:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24)];
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
  else
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
    uint64_t v10 = *(void *)(a1 + 56);
    uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8);
    id v39 = *(id *)(v11 + 40);
    char v12 = [v8 bindInputsAndOutputs:v5 cleanUpBlocks:v7 bufferIndex:v9 options:v10 error:&v39];
    objc_storeStrong((id *)(v11 + 40), v39);
    if (v12)
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v42 = 0x2020000000;
      int v43 = 0;
      id v13 = [*(id *)(a1 + 32) submitSemaphore];
      dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);

      kdebug_trace();
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __53__MLNeuralNetworkEngine_evaluateBatch_options_error___block_invoke_318;
      aBlock[3] = &unk_1E59A3DD0;
      aBlock[4] = *(void *)(a1 + 32);
      uint64_t v14 = *(void *)(a1 + 96);
      p_long long buf = &buf;
      uint64_t v36 = v14;
      id v15 = *(id *)(a1 + 48);
      uint64_t v16 = *(void *)(a1 + 80);
      id v31 = v15;
      uint64_t v37 = v16;
      id v32 = v7;
      id v33 = *(id *)(a1 + 56);
      id v17 = *(id *)(a1 + 64);
      uint64_t v18 = *(void *)(a1 + 104);
      id v34 = v17;
      uint64_t v38 = v18;
      id v19 = _Block_copy(aBlock);
      [*(id *)(a1 + 32) plan];
      id v20 = [*(id *)(a1 + 32) espressoQueue];
      *(_DWORD *)(*((void *)&buf + 1) + 24) = espresso_plan_submit();

      kdebug_trace();
      uint64_t v21 = [*(id *)(a1 + 32) submitSemaphore];
      dispatch_semaphore_signal(v21);

      if (*(_DWORD *)(*((void *)&buf + 1) + 24))
      {
        NSLog(&cfstr_ErrorCallingPl_0.isa);
        uint64_t v22 = +[MLModelErrorUtils genericErrorWithFormat:@"Error calling plan submit for batch processing."];
        uint64_t v23 = *(void *)(*(void *)(a1 + 80) + 8);
        unint64_t v24 = *(void **)(v23 + 40);
        *(void *)(v23 + 40) = v22;

        [*(id *)(a1 + 32) releaseBuffer:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24)];
        dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
      }

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      uint64_t v26 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_error_impl(&dword_19E58B000, v26, OS_LOG_TYPE_ERROR, "Failed to bind input / output features in batch computation.", (uint8_t *)&buf, 2u);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
      id v27 = [MEMORY[0x1E4F1CA98] null];
      [*(id *)(a1 + 64) setObject:v27 atIndexedSubscript:*(void *)(a1 + 104)];

      [*(id *)(a1 + 32) releaseBuffer:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24)];
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), *(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
    }
  }
  return kdebug_trace();
}

uint64_t __53__MLNeuralNetworkEngine_evaluateBatch_options_error___block_invoke_318(uint64_t a1, uint64_t a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  if (!*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    if (a2)
    {
      [*(id *)(a1 + 32) releaseBuffer:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)];
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
      uint64_t v4 = +[MLModelErrorUtils genericErrorWithFormat:@"Error calling plan submit."];
      uint64_t v5 = *(void *)(*(void *)(a1 + 88) + 8);
      unint64_t v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v4;

      return kdebug_trace();
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v7 = [*(id *)(a1 + 48) reverseObjectEnumerator];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v28;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v28 != v9) {
            objc_enumerationMutation(v7);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v27 + 1) + 8 * v10++) + 16))();
        }
        while (v8 != v10);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v8);
    }

    uint64_t v11 = *(void **)(a1 + 32);
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
    id v26 = 0;
    id v13 = [v11 populateOutputs:v12 outputBackings:MEMORY[0x1E4F1CC08] directlyBoundOutputFeatureNames:0 error:&v26];
    id v14 = v26;
    id v15 = v26;
    if (v13) {
      BOOL v16 = v15 == 0;
    }
    else {
      BOOL v16 = 0;
    }
    if (v16)
    {
      uint64_t v18 = [*(id *)(a1 + 32) classLabels];
      BOOL v19 = v18 == 0;

      if (!v19)
      {
        id v20 = *(void **)(a1 + 32);
        uint64_t v21 = *(void *)(a1 + 56);
        id v25 = 0;
        uint64_t v22 = [v20 addClassifierInformationToOutput:v13 options:v21 error:&v25];
        id v23 = v25;
        id v17 = v25;

        if (!v22 || v17)
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), v23);
          dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
          id v13 = (void *)v22;
          [*(id *)(a1 + 32) releaseBuffer:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)];
          goto LABEL_22;
        }
        id v13 = (void *)v22;
      }
      [*(id *)(a1 + 64) setObject:v13 atIndexedSubscript:*(void *)(a1 + 96)];
      [*(id *)(a1 + 32) releaseBuffer:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)];
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
      id v17 = 0;
    }
    else
    {
      id v17 = v15;
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), v14);
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
      [*(id *)(a1 + 32) releaseBuffer:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)];
    }
LABEL_22:
  }
  return kdebug_trace();
}

- (BOOL)setEspressoBlobShapes:(void *)a3 widths:(void *)a4 heights:(void *)a5 ks:(void *)a6 batches:(void *)a7 sequences:(void *)a8 ranks:(void *)a9 error:(id *)a10
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (*(_WORD *)((char *)&self->_transferSession + 1))
  {
    [(MLNeuralNetworkEngine *)self network];
    uint64_t v18 = *(void *)a8;
    uint64_t v17 = espresso_network_change_input_blob_shapes_seq_rank();
  }
  else
  {
    [(MLNeuralNetworkEngine *)self network];
    uint64_t v18 = *(void *)a8;
    uint64_t v17 = espresso_network_change_input_blob_shapes_seq();
  }
  uint64_t v11 = v17;
  if (!v17) {
    return 1;
  }
  uint64_t v12 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 67109120;
    int v22 = v11;
    _os_log_error_impl(&dword_19E58B000, v12, OS_LOG_TYPE_ERROR, "Error in dynamically resizing for sequence length (error: %d).", buf, 8u);
  }

  if (a10)
  {
    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F28568];
    id v14 = objc_msgSend(NSString, "stringWithFormat:", @"Error in dynamically resizing for sequence length (error: %d).", v11);
    id v20 = v14;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    *a10 = [v13 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v15];
  }
  return 0;
}

- (BOOL)resetSizesWithEspressoConfigurations:(id)a3 error:(id *)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  CoreML::MLNeuralNetworkUtilities::hashFeatureProviderToConfigurationName(&v29, v6, BYTE1(self->_transferSession), self->_pixelBufferPool);
  id v7 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::string, void *>>> *)std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&self->_flexibleShapesConfigNamesInNet, &v29);
  uint64_t v8 = +[MLNeuralNetworkCompiler iOS18CompilerVersionInfo];
  if (&self->_flexibleShapesConfigNamesInNet.__tree_.__pair1_ == v7)
  {
    uint64_t v9 = [(MLNeuralNetworkEngine *)self compilerVersionInfo];
    char v10 = [v9 olderThan:v8];

    if ((v10 & 1) == 0)
    {
      CoreML::MLNeuralNetworkUtilities::encodeConfigurationName(__p, (const void **)&v29.__r_.__value_.__l.__data_);
      id v7 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::string, void *>>> *)std::__tree<std::__value_type<std::string,BOOL>,std::__map_value_compare<std::string,std::__value_type<std::string,BOOL>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,BOOL>>>::find<std::string>((uint64_t)&self->_flexibleShapesConfigNamesInNet, __p);
      if (v37 < 0) {
        operator delete(*(void **)__p);
      }
    }
  }
  if (v7 == &self->_flexibleShapesConfigNamesInNet.__tree_.__pair1_) {
    goto LABEL_34;
  }
  p_left = (const void **)&v7[4].__value_.__left_;
  uint64_t left_high = HIBYTE(v7[6].__value_.__left_);
  if ((left_high & 0x80u) == 0) {
    left = (void *)HIBYTE(v7[6].__value_.__left_);
  }
  else {
    left = v7[5].__value_.__left_;
  }
  unint64_t size = *((unsigned __int8 *)&self->_currentConfigurationName.__r_.__value_.var0.__l + 23);
  int v15 = (char)size;
  if ((size & 0x80u) != 0) {
    unint64_t size = self->_currentConfigurationName.__r_.__value_.var0.__l.__size_;
  }
  if (left == (void *)size)
  {
    if (v15 >= 0) {
      p_currentConfigurationName = &self->_currentConfigurationName;
    }
    else {
      p_currentConfigurationName = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)self->_currentConfigurationName.__r_.__value_.var0.__l.__data_;
    }
    if ((left_high & 0x80) != 0)
    {
      if (memcmp(*p_left, p_currentConfigurationName, (size_t)v7[5].__value_.__left_)) {
        goto LABEL_22;
      }
    }
    else if (HIBYTE(v7[6].__value_.__left_))
    {
      uint64_t v17 = v7 + 4;
      while (LOBYTE(v17->__value_.__left_) == p_currentConfigurationName->__r_.__value_.var0.__s.__data_[0])
      {
        uint64_t v17 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::string, void *>>> *)((char *)v17 + 1);
        p_currentConfigurationName = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)((char *)p_currentConfigurationName + 1);
        if (!--left_high) {
          goto LABEL_37;
        }
      }
      goto LABEL_22;
    }
LABEL_37:
    LOBYTE(a4) = 1;
    goto LABEL_38;
  }
LABEL_22:
  [(MLNeuralNetworkEngine *)self plan];
  uint64_t v18 = espresso_plan_build_clean();
  if (v18)
  {
    uint64_t v19 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::string __p = 67109120;
      *(_DWORD *)&__p[4] = v18;
      _os_log_error_impl(&dword_19E58B000, v19, OS_LOG_TYPE_ERROR, "Failed to reset the current plan in order to reshape the input features (Error: %d).", __p, 8u);
    }

    if (a4)
    {
      id v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v32 = *MEMORY[0x1E4F28568];
      uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to reset the current plan in order to reshape the input features (Error: %d).", v18);
      id v33 = v21;
      int v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
      uint64_t v23 = [v20 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v22];
LABEL_33:
      *a4 = v23;

LABEL_34:
      LOBYTE(a4) = 0;
      goto LABEL_38;
    }
    goto LABEL_38;
  }
  uint64_t v24 = espresso_network_select_configuration();
  if (!v24)
  {
    if (![(MLNeuralNetworkEngine *)self rebuildPlan:a4]) {
      goto LABEL_34;
    }
    std::string::operator=((std::string *)&self->_currentConfigurationName, (const std::string *)&v7[4]);
    goto LABEL_37;
  }
  id v25 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    long long v28 = v7 + 4;
    if (SHIBYTE(v7[6].__value_.__left_) < 0) {
      long long v28 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::string, void *>>> *)*p_left;
    }
    *(_DWORD *)std::string __p = 136315394;
    *(void *)&__p[4] = v28;
    __int16 v35 = 1024;
    int v36 = v24;
    _os_log_error_impl(&dword_19E58B000, v25, OS_LOG_TYPE_ERROR, "Unable to select network configuration for: %s (Error: %d).", __p, 0x12u);
  }

  if (a4)
  {
    id v26 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v30 = *MEMORY[0x1E4F28568];
    if (SHIBYTE(v7[6].__value_.__left_) < 0) {
      p_left = (const void **)*p_left;
    }
    uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"Unable to select network configuration for: %s (Error: %d).", p_left, v24);
    id v31 = v21;
    int v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    uint64_t v23 = [v26 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v22];
    goto LABEL_33;
  }
LABEL_38:

  if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v29.__r_.__value_.__l.__data_);
  }

  return (char)a4;
}

- (id)sortBatchByShape:(id)a3 withMap:(id *)a4 error:(id *)a5
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v68 = a3;
  kdebug_trace();
  id v67 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([v68 count])
  {
    id v6 = [v68 featuresAtIndex:0];
    long long v65 = [v6 featureNames];

    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    id v7 = [(MLModelEngine *)self modelDescription];
    uint64_t v8 = [v7 inputDescriptionsByName];
    uint64_t v9 = [v8 allKeys];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v82 objects:v89 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v83;
LABEL_4:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v83 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v82 + 1) + 8 * v12);
        id v14 = [(MLModelEngine *)self modelDescription];
        int v15 = [v14 inputDescriptionsByName];
        BOOL v16 = [v15 objectForKeyedSubscript:v13];
        if ([v16 isOptional])
        {
        }
        else
        {
          char v17 = [v65 containsObject:v13];

          if (v17)
          {
            id v69 = v13;

            if (!v69) {
              goto LABEL_24;
            }
            for (uint64_t i = 0; i < [v68 count]; ++i)
            {
              uint64_t v21 = [v68 featuresAtIndex:i];
              int v22 = [v21 featureValueForName:v69];
              uint64_t v23 = objc_msgSend(v22, "getFeatureSize:ndArrayMode:", a5, -[MLNeuralNetworkEngine ndArrayInterpretation](self, "ndArrayInterpretation"));
              uint64_t v24 = v23;
              if (!v23 || a5 && *a5)
              {

                id v19 = 0;
                goto LABEL_53;
              }
              id v25 = [v67 objectForKey:v23];
              BOOL v26 = v25 == 0;

              if (v26)
              {
                id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                std::string v29 = [NSNumber numberWithInteger:i];
                [v27 addObject:v29];

                [v67 setObject:v27 forKey:v24];
              }
              else
              {
                id v27 = [v67 objectForKey:v24];
                long long v28 = [NSNumber numberWithInteger:i];
                [v27 addObject:v28];
              }
            }
            id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            long long v72 = 0u;
            long long v73 = 0u;
            long long v70 = 0u;
            long long v71 = 0u;
            uint64_t v56 = [v67 allKeys];
            uint64_t v57 = [v56 countByEnumeratingWithState:&v70 objects:v86 count:16];
            if (v57)
            {
              uint64_t v58 = *(void *)v71;
              do
              {
                for (uint64_t j = 0; j != v57; ++j)
                {
                  if (*(void *)v71 != v58) {
                    objc_enumerationMutation(v56);
                  }
                  uint64_t v60 = *(void *)(*((void *)&v70 + 1) + 8 * j);
                  long long v61 = [v67 objectForKey:v60];
                  BOOL v62 = +[MLBatchProviderUtils lazyBatchIndexIntoBatch:v68 indices:v61 error:a5];

                  [v19 setObject:v62 forKey:v60];
                }
                uint64_t v57 = [v56 countByEnumeratingWithState:&v70 objects:v86 count:16];
              }
              while (v57);
            }

            id v54 = v67;
            uint64_t v55 = a4;
LABEL_52:
            *uint64_t v55 = v54;
LABEL_53:

            goto LABEL_54;
          }
        }
        if (v10 == ++v12)
        {
          uint64_t v10 = [v9 countByEnumeratingWithState:&v82 objects:v89 count:16];
          if (v10) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

LABEL_24:
    if (a5)
    {
      id v69 = [MEMORY[0x1E4F28E78] stringWithString:@"None of the features required to evaulate this model are produced by the feature provider which is first among the batch of input feature providers.\n"];
      [v69 appendString:@"The model requires these input features:\n"];
      long long v80 = 0u;
      long long v81 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      uint64_t v30 = [(MLModelEngine *)self modelDescription];
      id v31 = [v30 inputDescriptionsByName];
      uint64_t v32 = [v31 allKeys];

      uint64_t v33 = [v32 countByEnumeratingWithState:&v78 objects:v88 count:16];
      if (v33)
      {
        uint64_t v34 = *(void *)v79;
        do
        {
          for (uint64_t k = 0; k != v33; ++k)
          {
            if (*(void *)v79 != v34) {
              objc_enumerationMutation(v32);
            }
            uint64_t v36 = *(void *)(*((void *)&v78 + 1) + 8 * k);
            char v37 = [(MLModelEngine *)self modelDescription];
            uint64_t v38 = [v37 inputDescriptionsByName];
            id v39 = [v38 objectForKeyedSubscript:v36];
            char v40 = [v39 isOptional];

            if ((v40 & 1) == 0)
            {
              long long v41 = [(MLModelEngine *)self modelDescription];
              uint64_t v42 = [v41 inputDescriptionsByName];
              int v43 = [v42 objectForKeyedSubscript:v36];

              uint64_t v44 = [v43 description];
              [v69 appendFormat:@"    %@\n", v44];
            }
          }
          uint64_t v33 = [v32 countByEnumeratingWithState:&v78 objects:v88 count:16];
        }
        while (v33);
      }

      [v69 appendString:@"The first batch input feature provider provides these input features:\n"];
      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      id v45 = v65;
      uint64_t v46 = [v45 countByEnumeratingWithState:&v74 objects:v87 count:16];
      if (v46)
      {
        uint64_t v47 = *(void *)v75;
        do
        {
          for (uint64_t m = 0; m != v46; ++m)
          {
            if (*(void *)v75 != v47) {
              objc_enumerationMutation(v45);
            }
            uint64_t v49 = *(void *)(*((void *)&v74 + 1) + 8 * m);
            uint64_t v50 = [(MLModelEngine *)self modelDescription];
            uint64_t v51 = [v50 inputDescriptionsByName];
            uint64_t v52 = [v51 objectForKeyedSubscript:v49];

            int v53 = [v52 description];
            [v69 appendFormat:@"    %@\n", v53];
          }
          uint64_t v46 = [v45 countByEnumeratingWithState:&v74 objects:v87 count:16];
        }
        while (v46);
      }

      [v69 appendString:@"Ensure that each of the batch input feature providers provides all the input features with types matching those required to evaluate the model."];
      id v54 = +[MLModelErrorUtils genericErrorWithFormat:@"%@", v69];
      id v19 = 0;
      uint64_t v55 = a5;
      goto LABEL_52;
    }
    id v19 = 0;
LABEL_54:

    uint64_t v18 = v67;
  }
  else
  {
    uint64_t v18 = v67;
    *a4 = v67;
    id v19 = (id)MEMORY[0x1E4F1CC08];
  }

  kdebug_trace();

  return v19;
}

- (void)dealloc
{
  [(MLNeuralNetworkEngine *)self _deallocContextAndPlan];
  begin = self->_inputBuffers.__begin_;
  end = self->_inputBuffers.__end_;
  if (end != begin)
  {
    unint64_t v5 = 0;
    do
    {
      id v6 = &begin[24 * v5];
      uint64_t v9 = (void *)*v6;
      id v7 = v6 + 1;
      uint64_t v8 = v9;
      if (v9 != v7)
      {
        do
        {
          uint64_t v10 = (void *)v8[7];
          if (v10) {
            free(v10);
          }
          uint64_t v11 = (void *)v8[1];
          if (v11)
          {
            do
            {
              uint64_t v12 = v11;
              uint64_t v11 = (void *)*v11;
            }
            while (v11);
          }
          else
          {
            do
            {
              uint64_t v12 = (void *)v8[2];
              BOOL v13 = *v12 == (void)v8;
              uint64_t v8 = v12;
            }
            while (!v13);
          }
          uint64_t v8 = v12;
        }
        while (v12 != v7);
        begin = self->_inputBuffers.__begin_;
        end = self->_inputBuffers.__end_;
      }
      ++v5;
    }
    while (v5 < 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3));
  }
  int v15 = self->_outputBuffers.__begin_;
  id v14 = self->_outputBuffers.__end_;
  if (v14 != v15)
  {
    unint64_t v16 = 0;
    do
    {
      char v17 = &v15[24 * v16];
      id v20 = (void *)*v17;
      uint64_t v18 = v17 + 1;
      id v19 = v20;
      if (v20 != v18)
      {
        do
        {
          uint64_t v21 = (void *)v19[7];
          if (v21) {
            free(v21);
          }
          int v22 = (void *)v19[1];
          if (v22)
          {
            do
            {
              uint64_t v23 = v22;
              int v22 = (void *)*v22;
            }
            while (v22);
          }
          else
          {
            do
            {
              uint64_t v23 = (void *)v19[2];
              BOOL v13 = *v23 == (void)v19;
              id v19 = v23;
            }
            while (!v13);
          }
          id v19 = v23;
        }
        while (v23 != v18);
        int v15 = self->_outputBuffers.__begin_;
        id v14 = self->_outputBuffers.__end_;
      }
      ++v16;
    }
    while (v16 < 0xAAAAAAAAAAAAAAABLL * ((v14 - v15) >> 3));
  }
  left = (OpaqueVTPixelTransferSession *)self->_OutputBlobIsDynamic.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    VTPixelTransferSessionInvalidate(left);
    CFRelease(self->_OutputBlobIsDynamic.__tree_.__pair1_.__value_.__left_);
  }
  v25.receiver = self;
  v25.super_class = (Class)MLNeuralNetworkEngine;
  [(MLNeuralNetworkEngine *)&v25 dealloc];
}

- (void)_deallocContextAndPlan
{
  if (self->_numInputs)
  {
    espresso_plan_destroy();
    self->_numInputs = 0;
  }
  if (self->_numOutputs)
  {
    espresso_context_destroy();
    self->_numOutputs = 0;
  }
}

- (__CVBuffer)_pixelBufferFromEbuf:(id *)a3 description:(id)a4 error:(id *)a5
{
  v46[3] = *MEMORY[0x1E4F143B8];
  id v34 = a4;
  kdebug_trace();
  id v7 = [MLMultiArray alloc];
  var0 = a3->var0;
  v46[0] = [NSNumber numberWithUnsignedLong:a3->var6];
  uint64_t v33 = (void *)v46[0];
  uint64_t v32 = [NSNumber numberWithUnsignedLong:a3->var5];
  v46[1] = v32;
  uint64_t v9 = [NSNumber numberWithUnsignedLong:a3->var4];
  v46[2] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:3];
  uint64_t v11 = [NSNumber numberWithUnsignedLong:a3->var11];
  v45[0] = v11;
  uint64_t v12 = [NSNumber numberWithUnsignedLong:a3->var10];
  v45[1] = v12;
  BOOL v13 = [NSNumber numberWithUnsignedLong:a3->var9];
  v45[2] = v13;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:3];
  int v15 = var0;
  unint64_t v16 = a5;
  char v17 = [(MLMultiArray *)v7 initWithDataPointer:v15 shape:v10 dataType:65568 strides:v14 deallocator:0 error:a5];

  if (v17)
  {
    uint64_t v18 = [v34 imageConstraint];
    uint64_t v19 = [v18 pixelType];

    if (v19 <= 19)
    {
      if (!v19)
      {
        id v22 = 0;
        id v20 = +[MLMultiArray pixelBufferBGRA8FromMultiArrayCHW:v17 channelOrderIsBGR:0 error:a5];
        goto LABEL_23;
      }
      if (v19 != 10) {
        goto LABEL_20;
      }
      uint64_t v38 = 0;
      id v20 = +[MLMultiArray pixelBufferGray8FromMultiArrayHW:v17 error:&v38];
      uint64_t v21 = v38;
    }
    else
    {
      switch(v19)
      {
        case 20:
          uint64_t v36 = 0;
          id v20 = +[MLMultiArray pixelBufferBGRA8FromMultiArrayCHW:v17 channelOrderIsBGR:0 error:&v36];
          uint64_t v21 = v36;
          break;
        case 30:
          char v37 = 0;
          id v20 = +[MLMultiArray pixelBufferBGRA8FromMultiArrayCHW:v17 channelOrderIsBGR:1 error:&v37];
          uint64_t v21 = v37;
          break;
        case 40:
          __int16 v35 = 0;
          id v20 = +[MLMultiArray pixelBufferGray16HalfFromMultiArrayHW:v17 error:&v35];
          uint64_t v21 = v35;
          break;
        default:
LABEL_20:
          objc_super v25 = +[MLLogging coreChannel];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 134217984;
            uint64_t v40 = v19;
            _os_log_error_impl(&dword_19E58B000, v25, OS_LOG_TYPE_ERROR, "MLImagePixelType %tu is not supported.", buf, 0xCu);
          }

          BOOL v26 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v43 = *MEMORY[0x1E4F28568];
          id v27 = objc_msgSend(NSString, "stringWithFormat:", @"MLImagePixelType %tu is not supported.", v19);
          uint64_t v44 = v27;
          long long v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
          id v22 = [v26 errorWithDomain:@"com.apple.CoreML" code:1 userInfo:v28];

          id v20 = 0;
          if (!v22) {
            goto LABEL_23;
          }
          goto LABEL_14;
      }
    }
    id v22 = v21;
    if (v22)
    {
LABEL_14:
      uint64_t v23 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v30 = [v34 name];
        id v31 = [v22 localizedDescription];
        *(_DWORD *)long long buf = 138412546;
        uint64_t v40 = (uint64_t)v30;
        __int16 v41 = 2112;
        uint64_t v42 = v31;
        _os_log_error_impl(&dword_19E58B000, v23, OS_LOG_TYPE_ERROR, "Failed to convert the output feature named '%@' to a pixel buffer. (Underlying error: %@)", buf, 0x16u);
      }
      if (v16)
      {
        uint64_t v24 = [v34 name];
        id *v16 = +[MLModelErrorUtils errorWithCode:1, v22, @"Failed to convert the output feature named '%@' to a pixel buffer.", v24 underlyingError format];
      }
      id v20 = 0;
    }
LABEL_23:

    goto LABEL_24;
  }
  id v20 = 0;
LABEL_24:

  kdebug_trace();
  return v20;
}

- (id)imageFeatureValueFromEbuf:(id *)a3 backingCVPixelBuffer:(__CVBuffer *)a4 description:(id)a5 error:(id *)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  kdebug_trace();
  uint64_t v11 = [v10 imageConstraint];

  if (v11)
  {
    if (a3->var7 <= 1 && a3->var8 < 2)
    {
      uint64_t v24 = [v10 imageConstraint];
      objc_super v25 = [v24 sizeConstraint];
      int v15 = [v25 allowedImageSizeClosestToPixelsWide:a3->var4 pixelsHigh:a3->var5 preferDownScaling:1 preferInputAspectRatio:1];

      uint64_t v26 = [v15 pixelsWide];
      uint64_t v27 = [v15 pixelsHigh];
      long long v28 = [v10 imageConstraint];
      uint64_t v29 = [v28 pixelType];

      BOOL v30 = v29 == 40 || v29 == 10;
      uint64_t v31 = 3;
      if (v30) {
        uint64_t v31 = 1;
      }
      if (a3->var4 != v26 || a3->var5 != v27 || a3->var6 != v31)
      {
        uint64_t v32 = +[MLLogging coreChannel];
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_19E58B000, v32, OS_LOG_TYPE_INFO, "WARNING: The computed output shape does not match any output shape allowed in the model's description. Please update the model description.", buf, 2u);
        }
      }
      if (a4)
      {
        if (![(MLNeuralNetworkEngine *)self copyEbuf:a3 ofPixelType:v29 toPixelBuffer:a4 error:a6])goto LABEL_13; {
        CFRetain(a4);
        }
      }
      else
      {
        a4 = [(MLNeuralNetworkEngine *)self _pixelBufferFromEbuf:a3 description:v10 error:a6];
        if (!a4) {
          goto LABEL_13;
        }
      }
      id v22 = +[MLFeatureValue featureValueWithPixelBuffer:a4];
      CFRelease(a4);
      goto LABEL_14;
    }
    uint64_t v12 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v33 = [v10 name];
      *(_DWORD *)long long buf = 138412290;
      uint64_t v40 = v33;
      _os_log_error_impl(&dword_19E58B000, v12, OS_LOG_TYPE_ERROR, "Batch or sequence image output is unsupported for image output feature named '%@'.", buf, 0xCu);
    }
    if (a6)
    {
      BOOL v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v35 = *MEMORY[0x1E4F28568];
      id v14 = NSString;
      int v15 = [v10 name];
      unint64_t v16 = [v14 stringWithFormat:@"Batch or sequence image output is unsupported for image output feature named '%@'.", v15];
      uint64_t v36 = v16;
      char v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
      uint64_t v18 = [v13 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v17];
LABEL_12:
      *a6 = v18;

LABEL_13:
      id v22 = 0;
LABEL_14:

      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v19 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v34 = [v10 name];
      *(_DWORD *)long long buf = 138412290;
      uint64_t v40 = v34;
      _os_log_error_impl(&dword_19E58B000, v19, OS_LOG_TYPE_ERROR, "Image output feature named '%@' is missing width, height, and pixel info in its description.", buf, 0xCu);
    }
    if (a6)
    {
      id v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v37 = *MEMORY[0x1E4F28568];
      uint64_t v21 = NSString;
      int v15 = [v10 name];
      unint64_t v16 = [v21 stringWithFormat:@"Image output feature named '%@' is missing width, height, and pixel info in its description.", v15];
      uint64_t v38 = v16;
      char v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
      uint64_t v18 = [v20 errorWithDomain:@"com.apple.CoreML" code:1 userInfo:v17];
      goto LABEL_12;
    }
  }
  id v22 = 0;
LABEL_16:
  kdebug_trace();

  return v22;
}

- (BOOL)copyEbuf:(id *)a3 ofPixelType:(unint64_t)a4 toPixelBuffer:(__CVBuffer *)a5 error:(id *)a6
{
  v24[3] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = [MLMultiArray alloc];
  var0 = a3->var0;
  v24[0] = [NSNumber numberWithUnsignedLong:a3->var6];
  id v22 = (void *)v24[0];
  uint64_t v21 = [NSNumber numberWithUnsignedLong:a3->var5];
  v24[1] = v21;
  id v10 = [NSNumber numberWithUnsignedLong:a3->var4];
  v24[2] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:3];
  uint64_t v12 = [NSNumber numberWithUnsignedLong:a3->var11];
  v23[0] = v12;
  BOOL v13 = [NSNumber numberWithUnsignedLong:a3->var10];
  v23[1] = v13;
  id v14 = [NSNumber numberWithUnsignedLong:a3->var9];
  v23[2] = v14;
  int v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];
  unint64_t v16 = [(MLMultiArray *)v8 initWithDataPointer:var0 shape:v11 dataType:65568 strides:v15 deallocator:0 error:a6];

  if (v16) {
    BOOL v17 = [(MLMultiArray *)v16 renderToCVPixelBuffer:a5 channelOrderIsBGR:a4 == 30 error:a6];
  }
  else {
    BOOL v17 = 0;
  }

  return v17;
}

- (id)outputBackingMultiArrayForFeatureName:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(MLNeuralNetworkEngine *)self activeFunction];
  id v6 = [NSString stringWithUTF8String:"main"];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    uint64_t v8 = [(MLModelEngine *)self modelDescription];
    uint64_t v9 = [v8 outputDescriptionsByName];
    id v10 = [v9 objectForKeyedSubscript:v4];

    uint64_t v11 = [v10 multiArrayConstraint];

    if (!v11)
    {
LABEL_9:
      BOOL v17 = 0;
      goto LABEL_10;
    }
    uint64_t v12 = [v10 multiArrayConstraint];
    uint64_t v13 = [v12 dataType];
  }
  else
  {
    id v10 = 0;
    uint64_t v13 = 65568;
  }
  v23[1] = 0;
  id v14 = v4;
  [v14 UTF8String];
  int blob_shape = espresso_network_query_blob_shape();
  if (blob_shape)
  {
    unint64_t v16 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      *(void *)&uint8_t buf[4] = [v14 UTF8String];
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = blob_shape;
      _os_log_error_impl(&dword_19E58B000, v16, OS_LOG_TYPE_ERROR, "Failed to get the output shape for feature: %s to fabricate the output backing buffer (err: %d). This is not expected but we go on without output backing.", buf, 0x12u);
    }

    goto LABEL_9;
  }
  if (!is_mul_ok(1uLL, (unsigned __int16)v13 >> 3)
    || (BOOL v17 = 0, (unsigned __int16)((unsigned __int16)v13 >> 3) >= 0x80uLL))
  {
    uint64_t v37 = 0;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    memset(buf, 0, sizeof(buf));
    int v19 = espresso_buffer_pack_tensor_shape();
    if (v19)
    {
      id v20 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uint64_t v24 = 136315394;
        uint64_t v25 = [v14 UTF8String];
        __int16 v26 = 1024;
        int v27 = v19;
        _os_log_error_impl(&dword_19E58B000, v20, OS_LOG_TYPE_ERROR, "Failed to pack tensor shape for feature: %s to fabricate the output backing buffer (err: %d). This is not expected but we go on without output backing.", v24, 0x12u);
      }
      BOOL v17 = 0;
    }
    else
    {
      v23[0] = 0;
      [(MLNeuralNetworkEngine *)self populateMultiArrayShape:v23 strides:0 forEbuf:buf featureDescription:v10 ndArrayInterpretation:BYTE1(self->_transferSession)];
      id v20 = v23[0];
      if (v13 == 65552)
      {
        uint64_t v21 = [(MLNeuralNetworkEngine *)self pixelBufferBackedMultiArrayWithShape:v20];
      }
      else
      {
        id v22 = [MLMultiArray alloc];
        uint64_t v21 = [(MLMultiArray *)v22 initWithShape:v20 dataType:v13 storageOrder:0 bufferAlignment:*MEMORY[0x1E4F14B00]];
      }
      BOOL v17 = (void *)v21;
    }
  }
LABEL_10:

  return v17;
}

- (id)pixelBufferBackedMultiArrayWithShape:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0;
  int v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 1;
  uint64_t v14 = 0;
  int v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 1;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__MLNeuralNetworkEngine_pixelBufferBackedMultiArrayWithShape___block_invoke;
  v10[3] = &unk_1E59A3DA8;
  id v5 = v4;
  id v11 = v5;
  uint64_t v12 = &v18;
  uint64_t v13 = &v14;
  [v5 enumerateObjectsUsingBlock:v10];
  id v6 = [(MLNeuralNetworkEngine *)self pixelBufferPool];
  int v7 = (__CVBuffer *)objc_msgSend(v6, "createPixelBufferWithSize:pixelFormatType:error:", 1278226536, 0, (double)(unint64_t)v19[3], (double)(unint64_t)v15[3]);

  if (v7)
  {
    uint64_t v8 = [[MLMultiArray alloc] initWithPixelBuffer:v7 shape:v5];
    CVPixelBufferRelease(v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v8;
}

void __62__MLNeuralNetworkEngine_pixelBufferBackedMultiArrayWithShape___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  if (a3 + 1 == [*(id *)(a1 + 32) count])
  {
    uint64_t v5 = [v8 unsignedIntValue];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  else
  {
    unsigned int v7 = [v8 unsignedIntValue];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v5 = *(void *)(v6 + 24) * v7;
  }
  *(void *)(v6 + 24) = v5;
}

void __106__MLNeuralNetworkEngine_populateMultiArrayShape_strides_forEbuf_featureDescription_ndArrayInterpretation___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 1;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __106__MLNeuralNetworkEngine_populateMultiArrayShape_strides_forEbuf_featureDescription_ndArrayInterpretation___block_invoke_2;
  v8[3] = &unk_1E59A3D58;
  v8[4] = &v9;
  [v7 enumerateObjectsUsingBlock:v8];
  if (*(void *)(a1 + 40) == v10[3])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
  _Block_object_dispose(&v9, 8);
}

void __106__MLNeuralNetworkEngine_populateMultiArrayShape_strides_forEbuf_featureDescription_ndArrayInterpretation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  id v5 = v3;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4 * [v3 unsignedIntValue];
}

- (BOOL)tryToSetOutputBacking:(id)a3 forFeatureName:(id)a4 toEbuf:(id *)a5 reportPointerFlags:(int *)a6 error:(id *)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  if (v12)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v12;
      int v15 = [(MLNeuralNetworkEngine *)self activeFunction];
      uint64_t v16 = [NSString stringWithUTF8String:"main"];
      int v17 = [v15 isEqualToString:v16];

      if (v17)
      {
        uint64_t v18 = [(MLModelEngine *)self modelDescription];
        uint64_t v19 = [v18 outputDescriptionsByName];
        uint64_t v20 = [(id)v19 objectForKeyedSubscript:v13];

        uint64_t v21 = +[MLFeatureValue featureValueWithMultiArray:v14];
        LOBYTE(v19) = [v20 isAllowedValue:v21];

        if ((v19 & 1) == 0)
        {
          uint64_t v25 = +[MLLogging coreChannel];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            long long v32 = [v20 name];
            *(_DWORD *)long long buf = 138412290;
            long long v36 = v32;
            _os_log_error_impl(&dword_19E58B000, v25, OS_LOG_TYPE_ERROR, "Output backing for feature named '%@' is not compatible with the model's output feature description.", buf, 0xCu);
          }
          if (a7)
          {
            __int16 v26 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v33 = *MEMORY[0x1E4F28568];
            int v27 = NSString;
            long long v28 = [v20 name];
            long long v29 = [v27 stringWithFormat:@"Output backing for feature named '%@' is not compatible with the model's output feature description.", v28];
            long long v34 = v29;
            long long v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
            *a7 = [v26 errorWithDomain:@"com.apple.CoreML" code:1 userInfo:v30];
          }
          goto LABEL_17;
        }
      }
      if (!-[MLNeuralNetworkEngine _espressoOutputShapeForFeatureName:matchesShapeOfMLMultiArray:](self, "_espressoOutputShapeForFeatureName:matchesShapeOfMLMultiArray:", v13, v14)|| [v14 dataType] != 65568|| (id v22 = v14, v23 = objc_msgSend(v22, "mutableBytes"), v23 % *MEMORY[0x1E4F14B00]))
      {
        *a6 = 0x10000;
        BOOL v24 = 1;
LABEL_18:

        goto LABEL_19;
      }
      if ([(MLNeuralNetworkEngine *)self _setMultiArrayOutputBacking:v22 forOutputFeatureName:v13 toEbuf:a5 error:a7])
      {
        *a6 = 0x20000;

        goto LABEL_11;
      }
LABEL_17:
      BOOL v24 = 0;
      goto LABEL_18;
    }
  }
  *a6 = 0x10000;
LABEL_11:
  BOOL v24 = 1;
LABEL_19:

  return v24;
}

- (BOOL)_espressoOutputShapeForFeatureName:(id)a3 matchesShapeOfMLMultiArray:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v45 = 0;
  id v36 = v5;
  [v36 UTF8String];
  if (espresso_network_query_blob_shape()) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v45 == 0;
  }
  if (v7)
  {
    BOOL v8 = 0;
  }
  else
  {
    id v37 = v6;
    uint64_t v9 = 0;
    id v10 = &__s1[8 * v45];
    uint64_t v11 = 8 * v45;
    while (*(void *)&__s1[v9] != 1)
    {
      v9 += 8;
      if (v11 == v9)
      {
        id v12 = &__s1[8 * v45];
        goto LABEL_11;
      }
    }
    id v12 = &__s1[v9];
LABEL_11:
    uint64_t v13 = (v12 - __s1) >> 3;
    if (v13 != v45)
    {
      id v14 = &__s1[8 * v13 + 8];
      if (v14 == (void *)v10)
      {
        id v10 = &__s1[8 * v13];
      }
      else
      {
        uint64_t v15 = v11 - 8 * v13 - 8;
        id v10 = &__s1[8 * v13];
        do
        {
          if (*v14 != 1)
          {
            *(void *)id v10 = *v14;
            v10 += 8;
          }
          ++v14;
          v15 -= 8;
        }
        while (v15);
      }
    }
    std::string __p = 0;
    uint64_t v43 = 0;
    uint64_t v44 = 0;
    uint64_t v16 = [v6 shape];
    std::vector<unsigned long>::reserve(&__p, [v16 count]);

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    int v17 = [v6 shape];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v38 objects:v46 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v39 != v19) {
            objc_enumerationMutation(v17);
          }
          uint64_t v21 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          if ([v21 unsignedIntValue] != 1)
          {
            unsigned int v22 = [v21 unsignedIntValue];
            uint64_t v23 = v22;
            BOOL v24 = v43;
            if (v43 >= v44)
            {
              __int16 v26 = (char *)__p;
              uint64_t v27 = (v43 - (unsigned char *)__p) >> 3;
              unint64_t v28 = v27 + 1;
              if ((unint64_t)(v27 + 1) >> 61) {
                std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v29 = v44 - (unsigned char *)__p;
              if ((v44 - (unsigned char *)__p) >> 2 > v28) {
                unint64_t v28 = v29 >> 2;
              }
              if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v30 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v30 = v28;
              }
              if (v30)
              {
                long long v31 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v44, v30);
                __int16 v26 = (char *)__p;
                BOOL v24 = v43;
              }
              else
              {
                long long v31 = 0;
              }
              long long v32 = &v31[8 * v27];
              *(void *)long long v32 = v23;
              uint64_t v25 = v32 + 8;
              while (v24 != v26)
              {
                uint64_t v33 = *((void *)v24 - 1);
                v24 -= 8;
                *((void *)v32 - 1) = v33;
                v32 -= 8;
              }
              std::string __p = v32;
              uint64_t v43 = v25;
              uint64_t v44 = &v31[8 * v30];
              if (v26) {
                operator delete(v26);
              }
            }
            else
            {
              *(void *)uint64_t v43 = v22;
              uint64_t v25 = v24 + 8;
            }
            uint64_t v43 = v25;
          }
        }
        uint64_t v18 = [v17 countByEnumeratingWithState:&v38 objects:v46 count:16];
      }
      while (v18);
    }

    long long v34 = (char *)__p;
    BOOL v8 = v10 - __s1 == v43 - (unsigned char *)__p && memcmp(__s1, __p, v10 - __s1) == 0;
    id v6 = v37;
    if (v34)
    {
      uint64_t v43 = v34;
      operator delete(v34);
    }
  }

  return v8;
}

- (BOOL)_setMultiArrayOutputBacking:(id)a3 forOutputFeatureName:(id)a4 toEbuf:(id *)a5 error:(id *)a6
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v69 = a4;
  *(_OWORD *)&a5->var0 = 0u;
  *(_OWORD *)a5->var2 = 0u;
  *(_OWORD *)&a5->var2[2] = 0u;
  *(_OWORD *)a5->var3 = 0u;
  *(_OWORD *)&a5->var3[2] = 0u;
  *(_OWORD *)&a5->unint64_t var4 = 0u;
  *(_OWORD *)&a5->unint64_t var6 = 0u;
  *(_OWORD *)&a5->unint64_t var8 = 0u;
  *(_OWORD *)&a5->var10 = 0u;
  *(_OWORD *)&a5->var12 = 0u;
  *(void *)&a5->var14 = 0;
  id v9 = v8;
  id v10 = (void *)[v9 mutableBytes];
  uint64_t v11 = 0;
  a5->var0 = v10;
  v88[0] = xmmword_19EC7B820;
  v88[1] = xmmword_19EC7B830;
  uint64_t v89 = 112;
  v86[0] = xmmword_19EC7B840;
  v86[1] = xmmword_19EC7B850;
  uint64_t v87 = 152;
  do
  {
    *(void **)((char *)&a5->var0 + *(void *)((char *)v88 + v11)) = (void *)1;
    *(void **)((char *)&a5->var0 + *(void *)((char *)v86 + v11)) = 0;
    v11 += 8;
  }
  while (v11 != 40);
  long long v74 = 0;
  id v12 = v69;
  [v12 UTF8String];
  uint64_t blob_shape = espresso_network_query_blob_shape();
  if (blob_shape) {
    BOOL v14 = 1;
  }
  else {
    BOOL v14 = v74 == 0;
  }
  if (v14)
  {
    uint64_t v15 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LODWORD(__p[0]) = 67109120;
      HIDWORD(__p[0]) = blob_shape;
      _os_log_error_impl(&dword_19E58B000, v15, OS_LOG_TYPE_ERROR, "Failed to get the output shape due to an error: %d. The framework could not validate the output backing's shape.", (uint8_t *)__p, 8u);
    }

    if (a6)
    {
      uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v84 = *MEMORY[0x1E4F28568];
      int v17 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to get the output shape due to an error: %d. The framework could not validate the output backing's shape.", blob_shape);
      long long v85 = v17;
      uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v85 forKeys:&v84 count:1];
      *a6 = [v16 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v18];
    }
    goto LABEL_17;
  }
  uint64_t v19 = espresso_buffer_pack_tensor_shape();
  uint64_t v20 = v19;
  if (v19)
  {
    uint64_t v21 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      LODWORD(__p[0]) = 134218240;
      *(void **)((char *)__p + 4) = v74;
      WORD2(__p[1]) = 1024;
      *(_DWORD *)((char *)&__p[1] + 6) = v20;
      _os_log_error_impl(&dword_19E58B000, v21, OS_LOG_TYPE_ERROR, "Failed to configure the indernal buffer to use the output shape of rank %zu due to an error: %d", (uint8_t *)__p, 0x12u);
    }

    if (a6)
    {
      unsigned int v22 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v82 = *MEMORY[0x1E4F28568];
      uint64_t v23 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to configure the indernal buffer to use the output shape of rank %zu due to an error: %d", v74, v20);
      long long v83 = v23;
      BOOL v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
      *a6 = [v22 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v24];
    }
LABEL_17:
    BOOL v25 = 0;
    goto LABEL_18;
  }
  memset(__p, 0, 24);
  uint64_t v27 = [v9 shape];
  std::vector<unsigned long>::reserve(__p, [v27 count]);

  unint64_t v28 = [v9 shape];
  uint64_t v29 = [v28 count];

  while (v29)
  {
    unint64_t v30 = [v9 shape];
    long long v31 = [v30 objectAtIndexedSubscript:--v29];
    BOOL v32 = [v31 unsignedIntValue] == 1;

    if (!v32)
    {
      uint64_t v33 = (char *)__p[1];
      if (__p[1] >= __p[2])
      {
        long long v35 = (char *)__p[0];
        int64_t v36 = ((char *)__p[1] - (char *)__p[0]) >> 3;
        unint64_t v37 = v36 + 1;
        if ((unint64_t)(v36 + 1) >> 61) {
          std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
        }
        int64_t v38 = (char *)__p[2] - (char *)__p[0];
        if (((char *)__p[2] - (char *)__p[0]) >> 2 > v37) {
          unint64_t v37 = v38 >> 2;
        }
        if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v39 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v39 = v37;
        }
        if (v39)
        {
          long long v40 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&__p[2], v39);
          long long v35 = (char *)__p[0];
          uint64_t v33 = (char *)__p[1];
        }
        else
        {
          long long v40 = 0;
        }
        long long v41 = (uint64_t *)&v40[8 * v36];
        uint64_t *v41 = v29;
        long long v34 = v41 + 1;
        while (v33 != v35)
        {
          uint64_t v42 = *((void *)v33 - 1);
          v33 -= 8;
          *--long long v41 = v42;
        }
        __p[0] = v41;
        __p[1] = v34;
        __p[2] = &v40[8 * v39];
        if (v35) {
          operator delete(v35);
        }
      }
      else
      {
        *(void *)__p[1] = v29;
        long long v34 = v33 + 8;
      }
      __p[1] = v34;
    }
  }
  long long v71 = 0;
  long long v72 = 0;
  long long v73 = 0;
  std::vector<unsigned long>::reserve(&v71, 5uLL);
  for (uint64_t i = 0; i != 5; ++i)
  {
    if (*(void **)((char *)&a5->var0 + *((void *)v88 + i)) != (void *)1)
    {
      uint64_t v44 = v72;
      if (v72 >= v73)
      {
        uint64_t v46 = (char *)v71;
        uint64_t v47 = (v72 - (unsigned char *)v71) >> 3;
        unint64_t v48 = v47 + 1;
        if ((unint64_t)(v47 + 1) >> 61) {
          std::vector<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v49 = v73 - (unsigned char *)v71;
        if ((v73 - (unsigned char *)v71) >> 2 > v48) {
          unint64_t v48 = v49 >> 2;
        }
        if ((unint64_t)v49 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v50 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v50 = v48;
        }
        if (v50)
        {
          uint64_t v51 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v73, v50);
          uint64_t v46 = (char *)v71;
          uint64_t v44 = v72;
        }
        else
        {
          uint64_t v51 = 0;
        }
        uint64_t v52 = &v51[8 * v47];
        *(void *)uint64_t v52 = i;
        uint64_t v45 = v52 + 8;
        while (v44 != v46)
        {
          uint64_t v53 = *((void *)v44 - 1);
          v44 -= 8;
          *((void *)v52 - 1) = v53;
          v52 -= 8;
        }
        long long v71 = v52;
        long long v72 = v45;
        long long v73 = &v51[8 * v50];
        if (v46) {
          operator delete(v46);
        }
      }
      else
      {
        *(void *)long long v72 = i;
        uint64_t v45 = v44 + 8;
      }
      long long v72 = v45;
    }
  }
  id v54 = __p[0];
  BOOL v25 = (char *)__p[1] - (char *)__p[0] == v72 - (unsigned char *)v71;
  if ((char *)__p[1] - (char *)__p[0] == v72 - (unsigned char *)v71)
  {
    if (__p[1] != __p[0])
    {
      unint64_t v55 = 0;
      do
      {
        uint64_t v56 = *((void *)v71 + v55);
        uint64_t v57 = v54[v55];
        uint64_t v58 = [v9 strides];
        uint64_t v59 = [v58 objectAtIndexedSubscript:v57];
        *(void **)((char *)&a5->var0 + *((void *)v86 + v56)) = (void *)[v59 unsignedIntValue];

        ++v55;
        id v54 = __p[0];
      }
      while (v55 < ((char *)__p[1] - (char *)__p[0]) >> 3);
    }
    uint64_t v60 = 0;
    uint64_t v61 = 1;
    do
    {
      uint64_t v62 = *(void *)((char *)v86 + v60);
      uint64_t v63 = *(uint64_t *)((char *)&a5->var0 + v62);
      if (!v63)
      {
        *(void **)((char *)&a5->var0 + v62) = (void *)v61;
        uint64_t v63 = v61;
      }
      uint64_t v61 = v63 * *(uint64_t *)((char *)&a5->var0 + *(void *)((char *)v88 + v60));
      v60 += 8;
    }
    while (v60 != 40);
  }
  else
  {
    long long v64 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 134218240;
      int64_t v78 = ((char *)__p[1] - (char *)__p[0]) >> 3;
      __int16 v79 = 2048;
      uint64_t v80 = (v72 - (unsigned char *)v71) >> 3;
      _os_log_error_impl(&dword_19E58B000, v64, OS_LOG_TYPE_ERROR, "The output backing MLMultiArray's shape (shape.count = %zu) doesn't match to expected output shape (shape.count = %zu) even after squeezed. This is most likely a framework programming error.", buf, 0x16u);
    }

    if (a6)
    {
      long long v66 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v75 = *MEMORY[0x1E4F28568];
      id v67 = objc_msgSend(NSString, "stringWithFormat:", @"The output backing MLMultiArray's shape (shape.count = %zu) doesn't match to expected output shape (shape.count = %zu) even after squeezed. This is most likely a framework programming error.", ((char *)__p[1] - (char *)__p[0]) >> 3, (v72 - (unsigned char *)v71) >> 3);
      long long v76 = v67;
      id v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
      *a6 = [v66 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v68];
    }
  }
  if (v71)
  {
    long long v72 = (char *)v71;
    operator delete(v71);
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
LABEL_18:

  return v25;
}

- (BOOL)bindInputFeatureNamed:(id)a3 pixelBuffer:(__CVBuffer *)a4 cleanUpBlocks:(id)a5 error:(id *)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if ([(MLNeuralNetworkEngine *)self lockPixelBuffer:a4 cleanUpBlocks:a5 error:a6])
  {
    OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a4);
    CVPixelBufferGetBaseAddress(a4);
    CVPixelBufferGetWidth(a4);
    CVPixelBufferGetHeight(a4);
    CVPixelBufferGetBytesPerRow(a4);
    id v12 = [(MLModelEngine *)self modelDescription];
    uint64_t v13 = [v12 inputDescriptionsByName];
    BOOL v14 = [v13 objectForKeyedSubscript:v10];

    uint64_t v29 = v14;
    uint64_t v15 = [v14 imageConstraint];
    [v15 pixelType];

    if ([(MLNeuralNetworkEngine *)self modelIsMIL]) {
      operator new();
    }
    [(MLNeuralNetworkEngine *)self prepareBlobNamed:v10 forNewBlobBackingMode:0x20000 bindMode:0x10000];
    if (PixelFormatType == 1111970369)
    {
      [v10 UTF8String];
      uint64_t v16 = espresso_network_bind_input_vimagebuffer_bgra8();
    }
    else
    {
      if (PixelFormatType != 1278226488)
      {
        uint64_t v23 = +[MLLogging coreChannel];
        uint64_t v18 = v14;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 67109888;
          uint64_t v24 = HIBYTE(PixelFormatType);
          OSType v33 = HIBYTE(PixelFormatType);
          uint64_t v25 = BYTE2(PixelFormatType);
          __int16 v34 = 1024;
          uint64_t v27 = BYTE1(PixelFormatType);
          uint64_t v26 = PixelFormatType;
          int v35 = BYTE2(PixelFormatType);
          __int16 v36 = 1024;
          int v37 = BYTE1(PixelFormatType);
          __int16 v38 = 1024;
          int v39 = PixelFormatType;
          _os_log_error_impl(&dword_19E58B000, v23, OS_LOG_TYPE_ERROR, "Unexpected pixel format type %c%c%c%c.", buf, 0x1Au);
        }
        else
        {
          uint64_t v24 = HIBYTE(PixelFormatType);
          uint64_t v25 = BYTE2(PixelFormatType);
          uint64_t v26 = PixelFormatType;
          uint64_t v27 = BYTE1(PixelFormatType);
        }

        objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"Unexpected pixel format type %c%c%c%c.", v24, v25, v27, v26);
        goto LABEL_17;
      }
      [v10 UTF8String];
      uint64_t v16 = espresso_network_bind_input_vimagebuffer_planar8();
    }
    uint64_t v17 = v16;
    uint64_t v18 = v14;
    if (v16)
    {
      uint64_t v19 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 67109120;
        OSType v33 = v17;
        _os_log_error_impl(&dword_19E58B000, v19, OS_LOG_TYPE_ERROR, "Failed to bind image using vImage framework with error: %d.", buf, 8u);
      }

      if (a6)
      {
        uint64_t v20 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v30 = *MEMORY[0x1E4F28568];
        uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to bind image using vImage framework with error: %d.", v17);
        long long v31 = v21;
        unsigned int v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
        uint64_t v18 = v29;
        *a6 = [v20 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v22];

        LOBYTE(a6) = 0;
      }
      goto LABEL_18;
    }
LABEL_17:
    LOBYTE(a6) = 1;
LABEL_18:

    goto LABEL_19;
  }
  LOBYTE(a6) = 0;
LABEL_19:

  return (char)a6;
}

- (BOOL)lockPixelBuffer:(__CVBuffer *)a3 cleanUpBlocks:(id)a4 error:(id *)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  [(MLModelEngine *)self signpostID];
  kdebug_trace();
  uint64_t v9 = CVPixelBufferLockBaseAddress(a3, 1uLL);
  if (v9)
  {
    id v10 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 67109120;
      int v20 = v9;
      _os_log_error_impl(&dword_19E58B000, v10, OS_LOG_TYPE_ERROR, "Failed to access the source frame buffer due to CoreVideo error: %d.", buf, 8u);
    }

    if (a5)
    {
      uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = *MEMORY[0x1E4F28568];
      id v12 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to access the source frame buffer due to CoreVideo error: %d.", v9);
      uint64_t v18 = v12;
      uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      *a5 = [v11 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v13];
    }
    kdebug_trace();
  }
  else
  {
    CVPixelBufferGetBaseAddress(a3);
    kdebug_trace();
    CVPixelBufferRetain(a3);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __61__MLNeuralNetworkEngine_lockPixelBuffer_cleanUpBlocks_error___block_invoke;
    aBlock[3] = &__block_descriptor_40_e5_v8__0l;
    aBlock[4] = a3;
    BOOL v14 = _Block_copy(aBlock);
    [v8 addObject:v14];
  }
  return v9 == 0;
}

void __61__MLNeuralNetworkEngine_lockPixelBuffer_cleanUpBlocks_error___block_invoke(uint64_t a1)
{
  CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(a1 + 32), 1uLL);
  uint64_t v2 = *(__CVBuffer **)(a1 + 32);

  CVPixelBufferRelease(v2);
}

- (BOOL)transferOneComponent16HalfPixelBuffer:(__CVBuffer *)a3 toPixelBuffer:(__CVBuffer *)a4 withScale:(float)a5 bias:(float)a6
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  unint64_t v10 = [(MLModelEngine *)self signpostID];
  kdebug_trace();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __92__MLNeuralNetworkEngine_transferOneComponent16HalfPixelBuffer_toPixelBuffer_withScale_bias___block_invoke;
  aBlock[3] = &__block_descriptor_40_e5_v8__0l;
  aBlock[4] = v10;
  uint64_t v11 = (void (**)(void))_Block_copy(aBlock);
  CVReturn v12 = CVPixelBufferLockBaseAddress(a3, 1uLL);
  if (v12)
  {
    uint64_t v13 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v12;
      _os_log_error_impl(&dword_19E58B000, v13, OS_LOG_TYPE_ERROR, "Failed to apply the image preprocessing on OneComponent16Half pixel buffer because it was unable to access the source frame buffer due to CoreVideo error: %d.", buf, 8u);
    }

LABEL_9:
    BOOL v16 = 0;
    goto LABEL_10;
  }
  CVReturn v14 = CVPixelBufferLockBaseAddress(a4, 0);
  if (v14)
  {
    uint64_t v15 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v14;
      _os_log_error_impl(&dword_19E58B000, v15, OS_LOG_TYPE_ERROR, "Failed to apply the image preprocessing on OneComponent16Half pixel buffer because it was unable to access the destination frame buffer due to CoreVideo error: %d.", buf, 8u);
    }

    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    goto LABEL_9;
  }
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  size_t v21 = CVPixelBufferGetWidth(a4);
  size_t v22 = CVPixelBufferGetHeight(a4);
  size_t v23 = CVPixelBufferGetBytesPerRow(a4);
  *(void *)long long buf = 0x2000000000000;
  size_t v33 = Width;
  size_t v34 = Height;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v38 = 1;
  size_t v39 = BytesPerRow >> 1;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v43 = 0;
  long long v45 = 0u;
  long long v46 = 0u;
  int v44 = 65552;
  int v47 = 0x20000;
  size_t v48 = v21;
  size_t v49 = v22;
  long long v52 = 0u;
  long long v51 = 0u;
  long long v50 = 0u;
  uint64_t v53 = 1;
  size_t v54 = v23 >> 1;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  uint64_t v58 = 0;
  int v59 = 65552;
  uint64_t v61 = 0;
  uint64_t v60 = 0;
  uint64_t v62 = 0;
  uint64_t v63 = 0x1400000000;
  float v64 = a5;
  float v65 = a6;
  long long v66 = 0u;
  long long v67 = 0u;
  uint64_t v68 = 0;
  uint64_t v24 = (void *)MEMORY[0x19F3BFF70](buf, 0);
  BaseAddress = CVPixelBufferGetBaseAddress(a3);
  uint64_t v26 = CVPixelBufferGetBaseAddress(a4);
  int v27 = BNNSFilterApply(v24, BaseAddress, v26);
  BOOL v16 = v27 == 0;
  if (v27)
  {
    unint64_t v28 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v30 = 67109120;
      int v31 = v27;
      _os_log_error_impl(&dword_19E58B000, v28, OS_LOG_TYPE_ERROR, "Failed to apply the image preprocessing (scale and bias) due to BNNS error: %d.", v30, 8u);
    }
  }
  BNNSFilterDestroy(v24);
  CVPixelBufferUnlockBaseAddress(a4, 0);
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
LABEL_10:
  v11[2](v11);

  return v16;
}

uint64_t __92__MLNeuralNetworkEngine_transferOneComponent16HalfPixelBuffer_toPixelBuffer_withScale_bias___block_invoke()
{
  return kdebug_trace();
}

- (__CVBuffer)copyPixelBufferByApplyingImagePreprocessing:(const vimage2espresso_param *)a3 toPixelBuffer:(__CVBuffer *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a4);
  if (PixelFormatType != 1278226536)
  {
    id v8 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 67109888;
      uint64_t v9 = BYTE3(PixelFormatType);
      unsigned int v21 = BYTE3(PixelFormatType);
      uint64_t v10 = BYTE2(PixelFormatType);
      __int16 v22 = 1024;
      uint64_t v12 = BYTE1(PixelFormatType);
      uint64_t v11 = PixelFormatType;
      int v23 = BYTE2(PixelFormatType);
      __int16 v24 = 1024;
      int v25 = BYTE1(PixelFormatType);
      __int16 v26 = 1024;
      int v27 = PixelFormatType;
      _os_log_error_impl(&dword_19E58B000, v8, OS_LOG_TYPE_ERROR, "Only pixel buffers with OneComponent16Half format can use the direct binding path, but the pixel buffer's pixel format type is %c%c%c%c. This is a logic error.", buf, 0x1Au);
    }
    else
    {
      uint64_t v9 = BYTE3(PixelFormatType);
      uint64_t v10 = BYTE2(PixelFormatType);
      uint64_t v11 = PixelFormatType;
      uint64_t v12 = BYTE1(PixelFormatType);
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Only pixel buffers with OneComponent16Half format can use the direct binding path, but the pixel buffer's pixel format type is %c%c%c%c. This is a logic error.", v9, v10, v12, v11 format];
  }
  if (a3->var0 == 1.0 && a3->var4 == 0.0) {
    return CVPixelBufferRetain(a4);
  }
  size_t Width = CVPixelBufferGetWidth(a4);
  size_t Height = CVPixelBufferGetHeight(a4);
  BOOL v16 = [(MLNeuralNetworkEngine *)self pixelBufferPool];
  uint64_t v13 = (__CVBuffer *)objc_msgSend(v16, "createPixelBufferWithSize:pixelFormatType:error:", PixelFormatType, 0, (double)Width, (double)Height);

  if (v13)
  {
    *(float *)&double v17 = a3->var0;
    *(float *)&double v18 = a3->var4;
    if (![(MLNeuralNetworkEngine *)self transferOneComponent16HalfPixelBuffer:a4 toPixelBuffer:v13 withScale:v17 bias:v18])
    {
      CVPixelBufferRelease(v13);
      return 0;
    }
  }
  return v13;
}

- (__CVBuffer)copyPixelBufferByApplyingImagePreprocessingForFeatureNamed:(id)a3 toPixelBuffer:(__CVBuffer *)a4
{
  id v6 = a3;
  [(MLNeuralNetworkEngine *)self network];
  Espresso::get_internal_network();
  BOOL v7 = __p;
  if (v18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  }
  id v8 = v6;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v8 UTF8String]);
  uint64_t v9 = (char *)(v7 + 42);
  uint64_t v10 = (void *)v7[42];
  if (!v10) {
    goto LABEL_10;
  }
  uint64_t v11 = (char *)(v7 + 42);
  do
  {
    BOOL v12 = google::protobuf::Map<std::string,std::string>::InnerMap::KeyCompare::operator()(v10 + 4, &__p);
    uint64_t v13 = v10 + 1;
    if (!v12)
    {
      uint64_t v13 = v10;
      uint64_t v11 = (char *)v10;
    }
    uint64_t v10 = (void *)*v13;
  }
  while (*v13);
  if (v11 == v9
    || google::protobuf::Map<std::string,std::string>::InnerMap::KeyCompare::operator()(&__p, (void *)v11 + 4))
  {
LABEL_10:
    uint64_t v11 = v9;
  }
  if (v19 < 0) {
    operator delete(__p);
  }
  if (v9 == v11) {
    CVReturn v14 = CVPixelBufferRetain(a4);
  }
  else {
    CVReturn v14 = [(MLNeuralNetworkEngine *)self copyPixelBufferByApplyingImagePreprocessing:v11 + 56 toPixelBuffer:a4];
  }
  uint64_t v15 = v14;

  return v15;
}

- (BOOL)bindDirectlyInputFeatureNamed:(id)a3 pixelBuffer:(__CVBuffer *)a4 cleanUpBlocks:(id)a5 boundDirectly:(BOOL *)a6 error:(id *)a7
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  CVReturn v14 = [(MLNeuralNetworkEngine *)self copyPixelBufferByApplyingImagePreprocessingForFeatureNamed:v12 toPixelBuffer:a4];
  if (v14)
  {
    if (a6) {
      *a6 = v14 == a4;
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __101__MLNeuralNetworkEngine_bindDirectlyInputFeatureNamed_pixelBuffer_cleanUpBlocks_boundDirectly_error___block_invoke;
    aBlock[3] = &__block_descriptor_40_e5_v8__0l;
    aBlock[4] = v14;
    uint64_t v15 = _Block_copy(aBlock);
    [v13 addObject:v15];

    [(MLNeuralNetworkEngine *)self prepareBlobNamed:v12 forNewBlobBackingMode:-1 bindMode:0x10000];
    id v16 = v12;
    [v16 UTF8String];
    uint64_t v17 = espresso_network_bind_cvpixelbuffer();
    if (!v17)
    {
      LOBYTE(a7) = 1;
      goto LABEL_15;
    }
    double v18 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412546;
      id v30 = v16;
      __int16 v31 = 1024;
      int v32 = v17;
      _os_log_error_impl(&dword_19E58B000, v18, OS_LOG_TYPE_ERROR, "Failed to bind pixel buffer directly to the feature named '%@' due to error: %d.", buf, 0x12u);
    }

    if (a7)
    {
      char v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v27 = *MEMORY[0x1E4F28568];
      int v20 = [NSString stringWithFormat:@"Failed to bind pixel buffer directly to the feature named '%@' due to error: %d.", v16, v17];
      uint64_t v28 = v20;
      unsigned int v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      __int16 v22 = [v19 errorWithDomain:@"com.apple.CoreML" code:1 userInfo:v21];
LABEL_13:
      *a7 = v22;

      LOBYTE(a7) = 0;
    }
  }
  else
  {
    int v23 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v30 = v12;
      _os_log_error_impl(&dword_19E58B000, v23, OS_LOG_TYPE_ERROR, "Failed to apply image preprocessing parameters to pixel buffer for the feature named '%@'.", buf, 0xCu);
    }

    if (a7)
    {
      __int16 v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v33 = *MEMORY[0x1E4F28568];
      int v20 = [NSString stringWithFormat:@"Failed to apply image preprocessing parameters to pixel buffer for the feature named '%@'.", v12];
      v34[0] = v20;
      unsigned int v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
      __int16 v22 = [v24 errorWithDomain:@"com.apple.CoreML" code:1 userInfo:v21];
      goto LABEL_13;
    }
  }
LABEL_15:

  return (char)a7;
}

void __101__MLNeuralNetworkEngine_bindDirectlyInputFeatureNamed_pixelBuffer_cleanUpBlocks_boundDirectly_error___block_invoke(uint64_t a1)
{
}

uint64_t __106__MLNeuralNetworkEngine_bindInputFeatureNamed_featureValue_bufferIndex_cleanUpBlocks_boundDirectly_error___block_invoke()
{
  return kdebug_trace();
}

uint64_t __106__MLNeuralNetworkEngine_bindInputFeatureNamed_featureValue_bufferIndex_cleanUpBlocks_boundDirectly_error___block_invoke_2()
{
  return kdebug_trace();
}

- (BOOL)bindInputsAndOutputs:(id)a3 cleanUpBlocks:(id)a4 bufferIndex:(unint64_t)a5 options:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  BOOL v13 = [(MLNeuralNetworkEngine *)self bindInputFeatures:v11 bufferIndex:a5 cleanUpBlocks:v12 directlyBoundFeatureNames:0 error:a7]&& [(MLNeuralNetworkEngine *)self bindOutputBuffers:(char *)self->_outputBuffers.__begin_ + 24 * a5 outputBackings:MEMORY[0x1E4F1CC08] automaticOutputBackingMode:MEMORY[0x1E4F1CC08] directlyBoundOutputFeatureNames:0 error:a7];

  return v13;
}

- (id)evaluate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = (void *)MEMORY[0x19F3C29E0]();
  id v8 = +[MLPredictionOptions defaultOptions];
  id v12 = 0;
  uint64_t v9 = [(MLNeuralNetworkEngine *)self evaluateInputs:v6 options:v8 error:&v12];
  id v10 = v12;

  if (a4 && v10) {
    *a4 = v10;
  }

  return v9;
}

- (BOOL)_addCompiledNetworkOrProgramToPlan:(void *)a3 error:(id *)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  unint64_t value = (void *)self->_OutputBlobIsDynamic.__tree_.__pair3_.__value_;
  if (!value)
  {
LABEL_11:
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The in-memory compiled model is neither ML Program nor NNv1. This is a logic error."];
    uint64_t v12 = 0;
    return -[MLNeuralNetworkEngine _handleAddNetworkToPlanStatus:error:](self, "_handleAddNetworkToPlanStatus:error:", v12, a4, v18);
  }
  [value program];
  if (v21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v21);
  }
  if (!*(void *)buf)
  {
    id v11 = (void *)self->_OutputBlobIsDynamic.__tree_.__pair3_.__value_;
    if (v11)
    {
      [v11 network];
      if (v21) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v21);
      }
    }
    goto LABEL_11;
  }
  BOOL v7 = [NSString stringWithUTF8String:"main"];
  id v8 = [(MLNeuralNetworkEngine *)self activeFunction];
  char v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    id v10 = (void *)self->_OutputBlobIsDynamic.__tree_.__pair3_.__value_;
    if (v10) {
      [v10 program];
    }
    else {
      char v19 = 0;
    }
    uint64_t v12 = espresso_plan_add_cpp_net_from_mil_program_and_reload();
    if (v19) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v19);
    }
    return -[MLNeuralNetworkEngine _handleAddNetworkToPlanStatus:error:](self, "_handleAddNetworkToPlanStatus:error:", v12, a4, v18);
  }
  BOOL v13 = +[MLLogging coreChannel];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    _os_log_error_impl(&dword_19E58B000, v13, OS_LOG_TYPE_ERROR, "In-memory ML Program with non-main function is not supported.", buf, 2u);
  }

  if (a4)
  {
    CVReturn v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F28568];
    uint64_t v15 = [NSString stringWithFormat:@"In-memory ML Program with non-main function is not supported."];
    v23[0] = v15;
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    *a4 = [v14 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v16];
  }
  return 0;
}

- (BOOL)_setupContextAndPlanWithForceCPU:(BOOL)a3 priority:(int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  BOOL v7 = a3;
  char v9 = [(MLModelEngine *)self configuration];
  LOBYTE(a5) = [(MLNeuralNetworkEngine *)self _setupContextAndPlanWithConfiguration:v9 usingCPU:v7 priority:v6 error:a5];

  return (char)a5;
}

- (MLNeuralNetworkEngine)initWithContainer:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = objc_alloc_init(MLModelConfiguration);
  id v8 = [(MLNeuralNetworkEngine *)self initWithContainer:v6 configuration:v7 error:a4];

  return v8;
}

- (BOOL)opacifyAndPermutePixelBuffer:(__CVBuffer *)a3 bufferContainsBGRA:(BOOL)a4 error:(id *)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = CVPixelBufferLockBaseAddress(a3, 0);
  if (v8)
  {
    char v9 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LODWORD(dest.data) = 67109120;
      HIDWORD(dest.data) = v8;
      _os_log_error_impl(&dword_19E58B000, v9, OS_LOG_TYPE_ERROR, "Failed to output BGRA / ARGB pixel buffer because it was unable to access the underlying frame buffer due to CoreVideo error: %d.", (uint8_t *)&dest, 8u);
    }

    if (a5)
    {
      id v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F28568];
      id v11 = objc_msgSend(NSString, "stringWithFormat:", @"Failed to output BGRA / ARGB pixel buffer because it was unable to access the underlying frame buffer due to CoreVideo error: %d.", v8);
      v17[0] = v11;
      uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
      *a5 = [v10 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v12];
    }
  }
  else
  {
    dest.width = CVPixelBufferGetWidth(a3);
    dest.height = CVPixelBufferGetHeight(a3);
    dest.rowBytes = CVPixelBufferGetBytesPerRow(a3);
    dest.data = CVPixelBufferGetBaseAddress(a3);
    if (!a4)
    {
      *(_DWORD *)permuteMap = 50331906;
      vImagePermuteChannels_ARGB8888(&dest, &dest, permuteMap, 0);
    }
    *(_DWORD *)permuteMap = -16777216;
    vImageOverwriteChannelsWithPixel_ARGB8888(permuteMap, &dest, &dest, 1u, 0);
    CVPixelBufferUnlockBaseAddress(a3, 0);
  }
  return v8 == 0;
}

- (__CVBuffer)pixelBufferFromOutputBacking:(id)a3 forFeature:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = v6;
  if (!v5) {
    goto LABEL_12;
  }
  if ([v6 type] != 5)
  {
    if ([v7 type] != 4)
    {
LABEL_12:
      uint64_t v8 = 0;
      goto LABEL_13;
    }
    CFTypeID v9 = CFGetTypeID(v5);
    uint64_t v8 = (__CVBuffer *)v5;
    if (v9 == CVPixelBufferGetTypeID()) {
      goto LABEL_13;
    }
    id v10 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = [v7 name];
      int v14 = 138412290;
      uint64_t v15 = v11;
      _os_log_error_impl(&dword_19E58B000, v10, OS_LOG_TYPE_ERROR, "The output backing for feature named '%@' must be CVPixelBuffer, but it is not. It will fail when the inference engine populates the backing with the prediction.", (uint8_t *)&v14, 0xCu);
    }
LABEL_11:

    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v10 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      BOOL v13 = [v7 name];
      int v14 = 138412546;
      uint64_t v15 = v13;
      __int16 v16 = 2080;
      ClassName = object_getClassName(v5);
      _os_log_error_impl(&dword_19E58B000, v10, OS_LOG_TYPE_ERROR, "The type of output backing for feature named '%@' is '%s', which is not MLMultiArray. It will fail when the inference engine populates the backing with the prediction.", (uint8_t *)&v14, 0x16u);
    }
    goto LABEL_11;
  }
  uint64_t v8 = (__CVBuffer *)[v5 pixelBuffer];
LABEL_13:

  return v8;
}

- (BOOL)transferPixelBuffer:(__CVBuffer *)a3 toPixelBuffer:(__CVBuffer *)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  p_pair1 = &self->_OutputBlobIsDynamic.__tree_.__pair1_;
  left = (OpaqueVTPixelTransferSession *)self->_OutputBlobIsDynamic.__tree_.__pair1_.__value_.__left_;
  if (!left)
  {
    OSStatus v20 = VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (VTPixelTransferSessionRef *)p_pair1);
    if (v20)
    {
      OSStatus v21 = v20;
      uint64_t v12 = +[MLLogging coreChannel];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v23 = 67109120;
        LODWORD(v24) = v21;
        uint64_t v17 = "Failed to initialize VTPixelTransferSession with error %i.";
        uint64_t v18 = v12;
        uint32_t v19 = 8;
LABEL_17:
        _os_log_error_impl(&dword_19E58B000, v18, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v23, v19);
      }
LABEL_12:

      return 0;
    }
    left = (OpaqueVTPixelTransferSession *)p_pair1->__value_.__left_;
  }
  OSStatus v8 = VTPixelTransferSessionTransferImage(left, a3, a4);
  if (v8)
  {
    OSStatus v9 = v8;
    OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    OSType v11 = CVPixelBufferGetPixelFormatType(a4);
    uint64_t v12 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(a3);
      IOSurfaceRef v14 = CVPixelBufferGetIOSurface(a4);
      uint64_t v15 = "YES";
      int v23 = 136317698;
      if (IOSurface) {
        __int16 v16 = "YES";
      }
      else {
        __int16 v16 = "NO";
      }
      __int16 v24 = v16;
      __int16 v25 = 1024;
      OSType v26 = HIBYTE(PixelFormatType);
      __int16 v27 = 1024;
      int v28 = BYTE2(PixelFormatType);
      if (!v14) {
        uint64_t v15 = "NO";
      }
      __int16 v29 = 1024;
      int v30 = BYTE1(PixelFormatType);
      __int16 v31 = 1024;
      int v32 = PixelFormatType;
      __int16 v33 = 2080;
      size_t v34 = v15;
      __int16 v35 = 1024;
      OSType v36 = HIBYTE(v11);
      __int16 v37 = 1024;
      int v38 = BYTE2(v11);
      __int16 v39 = 1024;
      int v40 = BYTE1(v11);
      __int16 v41 = 1024;
      int v42 = v11;
      __int16 v43 = 1024;
      OSStatus v44 = v9;
      uint64_t v17 = "Failed to transfer a pixel buffer (IOSurface-backed: %s, format: %c%c%c%c) to destination pixel buffer [IOSu"
            "rface-backed: %s: format: %c%c%c%c] with error %i.";
      uint64_t v18 = v12;
      uint32_t v19 = 76;
      goto LABEL_17;
    }
    goto LABEL_12;
  }
  return 1;
}

- (__CVBuffer)copyPixelBufferFromPixelBuffer:(__CVBuffer *)a3 usingPixelFormat:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  double Width = (double)CVPixelBufferGetWidth(a3);
  double Height = (double)CVPixelBufferGetHeight(a3);
  OSStatus v9 = [(MLNeuralNetworkEngine *)self pixelBufferPool];
  id v10 = (__CVBuffer *)objc_msgSend(v9, "createPixelBufferWithSize:pixelFormatType:error:", v4, 0, Width, Height);

  if (!v10) {
    return 0;
  }
  if ([(MLNeuralNetworkEngine *)self transferPixelBuffer:a3 toPixelBuffer:v10]) {
    return v10;
  }
  return 0;
}

- (id)imageFeatureValueFromPixelBuffer:(__CVBuffer *)a3 usingPixelFormat:(unsigned int)a4
{
  uint64_t v4 = [(MLNeuralNetworkEngine *)self copyPixelBufferFromPixelBuffer:a3 usingPixelFormat:*(void *)&a4];
  if (v4)
  {
    id v5 = +[MLFeatureValue featureValueWithPixelBuffer:v4];
    CVPixelBufferRelease(v4);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)availableOutputBlobList
{
  [(MLNeuralNetworkEngine *)self network];
  Espresso::get_internal_network();
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  for (uint64_t i = *(uint64_t **)(v9 + 152); i; uint64_t i = (uint64_t *)*i)
  {
    if (*((char *)i + 39) < 0)
    {
      if (i[3])
      {
LABEL_6:
        id v4 = [NSString alloc];
        id v5 = i + 2;
        if (*((char *)i + 39) < 0) {
          id v5 = (void *)*v5;
        }
        id v6 = (void *)[v4 initWithUTF8String:v5];
        [v2 addObject:v6];
      }
    }
    else if (*((unsigned char *)i + 39))
    {
      goto LABEL_6;
    }
  }
  BOOL v7 = (void *)[v2 copy];

  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }

  return v7;
}

- (id)regress:(id)a3 options:(id)a4 error:(id *)a5
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(MLModelEngine *)self modelDescription];
  OSType v11 = [v10 predictedFeatureName];

  if (v11)
  {
    uint64_t v12 = [(MLNeuralNetworkEngine *)self predictionFromFeatures:v8 options:v9 error:a5];
    if (v12)
    {
      BOOL v13 = [(MLModelEngine *)self modelDescription];
      IOSurfaceRef v14 = [v13 predictedFeatureName];
      uint64_t v15 = [v12 featureValueForName:v14];

      __int16 v16 = [v15 multiArrayValue];
      uint64_t v17 = +[MLRegressorResult resultWithValue:v16];
    }
    else
    {
      uint64_t v17 = 0;
    }
  }
  else
  {
    uint64_t v18 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v23 = 0;
      _os_log_error_impl(&dword_19E58B000, v18, OS_LOG_TYPE_ERROR, "Unable to use this model as a regressor because the model description doesn't specify a predicted feature name.", v23, 2u);
    }

    if (a5)
    {
      uint32_t v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v24 = *MEMORY[0x1E4F28568];
      OSStatus v20 = [NSString stringWithFormat:@"Unable to use this model as a regressor because the model description doesn't specify a predicted feature name."];
      v25[0] = v20;
      OSStatus v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
      *a5 = [v19 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v21];
    }
    uint64_t v17 = 0;
  }

  return v17;
}

- (id)classify:(id)a3 options:(id)a4 error:(id *)a5
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  kdebug_trace();
  id v10 = [(MLModelEngine *)self modelDescription];
  OSType v11 = [v10 predictedFeatureName];

  if (v11)
  {
    uint64_t v12 = [(MLNeuralNetworkEngine *)self classLabels];

    if (v12)
    {
      BOOL v13 = [(MLNeuralNetworkEngine *)self predictionFromFeatures:v8 options:v9 error:a5];
      if (v13)
      {
        a5 = [(MLNeuralNetworkEngine *)self convertPredictionToClassifierResult:v13 withOptions:v9 error:a5];
      }
      else
      {
        a5 = 0;
      }

      goto LABEL_16;
    }
    uint64_t v18 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v23 = 0;
      _os_log_error_impl(&dword_19E58B000, v18, OS_LOG_TYPE_ERROR, "Unable to use this model as a classifier because the model doesn't have class labels.", v23, 2u);
    }

    if (a5)
    {
      uint32_t v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v24 = *MEMORY[0x1E4F28568];
      OSStatus v20 = [NSString stringWithFormat:@"Unable to use this model as a classifier because the model doesn't have class labels."];
      __int16 v25 = v20;
      OSStatus v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      *a5 = [v19 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v21];

      goto LABEL_13;
    }
  }
  else
  {
    IOSurfaceRef v14 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v23 = 0;
      _os_log_error_impl(&dword_19E58B000, v14, OS_LOG_TYPE_ERROR, "Unable to use this model as a classifier because the model description doesn't specify a predicted feature name.", v23, 2u);
    }

    if (a5)
    {
      uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v26 = *MEMORY[0x1E4F28568];
      __int16 v16 = [NSString stringWithFormat:@"Unable to use this model as a classifier because the model description doesn't specify a predicted feature name."];
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

- (id)addClassifierInformationToOutput:(id)a3 options:(id)a4 error:(id *)a5
{
  id v6 = [(MLNeuralNetworkEngine *)self convertPredictionToClassifierResult:a3 withOptions:a4 error:a5];
  BOOL v7 = [(MLModelEngine *)self modelDescription];
  id v8 = [v7 predictedClassFeatureDescription];
  id v9 = [(MLModelEngine *)self modelDescription];
  id v10 = [v9 classProbabilityFeatureDescription];
  OSType v11 = [v6 asFeatureDictionaryWithPredictedClassDescription:v8 classProbabilityDescription:v10];

  return v11;
}

- (id)convertPredictionToClassifierResult:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  v119[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v110 = a4;
  if (!v8)
  {
LABEL_17:
    __int16 v33 = 0;
    goto LABEL_111;
  }
  id v9 = [(MLNeuralNetworkEngine *)self classLabels];
  uint64_t v10 = [v9 count];

  if (!v10)
  {
    __int16 v31 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_19E58B000, v31, OS_LOG_TYPE_ERROR, "Unable to construct a classification result because the classifier model doesn't declare the class labels.", buf, 2u);
    }

    if (a5)
    {
      int v32 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v118 = *MEMORY[0x1E4F28568];
      id v109 = [NSString stringWithFormat:@"Unable to construct a classification result because the classifier model doesn't declare the class labels."];
      v119[0] = v109;
      id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v119 forKeys:&v118 count:1];
      [v32 errorWithDomain:@"com.apple.CoreML" code:0 userInfo:v17];
      __int16 v33 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_109;
    }
    goto LABEL_17;
  }
  unint64_t v11 = [v110 classifyTopK];
  uint64_t v12 = [(MLNeuralNetworkEngine *)self classLabels];
  unint64_t v13 = [v12 count];

  if (v11 > v13)
  {
    IOSurfaceRef v14 = [(MLNeuralNetworkEngine *)self classLabels];
    unint64_t v11 = [v14 count];
  }
  uint64_t v15 = [(MLNeuralNetworkEngine *)self classScoreVectorName];
  __int16 v16 = [v8 featureValueForName:v15];

  id v109 = v16;
  if (!v16)
  {
    size_t v34 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      long long v85 = [(MLNeuralNetworkEngine *)self classScoreVectorName];
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v85;
      _os_log_error_impl(&dword_19E58B000, v34, OS_LOG_TYPE_ERROR, "Unable to construct a classification result because the model doesn't report a class score vector named '%@'.", buf, 0xCu);
    }
    if (a5)
    {
      __int16 v35 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v116 = *MEMORY[0x1E4F28568];
      OSType v36 = NSString;
      id v17 = [(MLNeuralNetworkEngine *)self classScoreVectorName];
      id v107 = [v36 stringWithFormat:@"Unable to construct a classification result because the model doesn't report a class score vector named '%@'.", v17];
      id v117 = v107;
      int v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v117 forKeys:&v116 count:1];
      id v37 = [v35 errorWithDomain:@"com.apple.CoreML" code:1 userInfo:v30];
LABEL_26:
      __int16 v33 = 0;
      *a5 = v37;
      goto LABEL_107;
    }
    id v109 = 0;
LABEL_32:
    __int16 v33 = 0;
    goto LABEL_110;
  }
  if ([v16 type] != 5)
  {
    int v38 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      int v86 = [(MLNeuralNetworkEngine *)self classScoreVectorName];
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v86;
      _os_log_error_impl(&dword_19E58B000, v38, OS_LOG_TYPE_ERROR, "Unable to construct a classification result because the class score vector named '%@' is not MLMultiArray.", buf, 0xCu);
    }
    if (a5)
    {
      __int16 v39 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v114 = *MEMORY[0x1E4F28568];
      int v40 = NSString;
      id v17 = [(MLNeuralNetworkEngine *)self classScoreVectorName];
      id v107 = [v40 stringWithFormat:@"Unable to construct a classification result because the class score vector named '%@' is not MLMultiArray.", v17];
      id v115 = v107;
      int v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v115 forKeys:&v114 count:1];
      id v37 = [v39 errorWithDomain:@"com.apple.CoreML" code:1 userInfo:v30];
      goto LABEL_26;
    }
    goto LABEL_32;
  }
  id v17 = [v109 multiArrayValue];
  uint64_t v18 = [v17 count];
  uint32_t v19 = [(MLNeuralNetworkEngine *)self classLabels];
  uint64_t v20 = [v19 count];

  if (v18 != v20)
  {
    __int16 v41 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      uint64_t v87 = [v17 count];
      v88 = [(MLNeuralNetworkEngine *)self classLabels];
      *(_DWORD *)long long buf = 134218240;
      *(void *)&uint8_t buf[4] = v87;
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(void *)&buf[14] = [v88 count];
      _os_log_error_impl(&dword_19E58B000, v41, OS_LOG_TYPE_ERROR, "Unable to construct a classification result because the class score vector's size (=%zd) doesn't match the number of classes (= %tu).", buf, 0x16u);
    }
    if (a5)
    {
      int v42 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v112 = *MEMORY[0x1E4F28568];
      __int16 v43 = NSString;
      uint64_t v44 = [v17 count];
      id v107 = [(MLNeuralNetworkEngine *)self classLabels];
      objc_msgSend(v43, "stringWithFormat:", @"Unable to construct a classification result because the class score vector's size (=%zd) doesn't match the number of classes (= %tu).", v44, objc_msgSend(v107, "count"));
      int v30 = (MLProbabilityDictionary *)objc_claimAutoreleasedReturnValue();
      unint64_t v113 = v30;
      uint64_t v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v113 forKeys:&v112 count:1];
      *a5 = [v42 errorWithDomain:@"com.apple.CoreML" code:1 userInfo:v45];

      __int16 v33 = 0;
      goto LABEL_107;
    }
    __int16 v33 = 0;
    goto LABEL_109;
  }
  id v21 = v17;
  id v108 = v21;
  if ([v21 dataType] != 65600)
  {
    uint64_t v22 = [MLMultiArray alloc];
    int v23 = [v108 shape];
    uint64_t v24 = [(MLMultiArray *)v22 initWithShape:v23 dataType:65600 error:a5];

    id v107 = v24;
    if (![v108 vectorizeIntoMultiArray:v24 storageOrder:0 error:a5])
    {
      __int16 v33 = 0;
      goto LABEL_108;
    }
    id v21 = v107;
  }
  id v107 = v21;
  uint64_t v25 = [v107 bytes];
  uint64_t v26 = [(MLNeuralNetworkEngine *)self classLabels];
  uint64_t v27 = [v26 count];

  if (v11 == v27)
  {
    int v28 = [MLProbabilityDictionary alloc];
    __int16 v29 = [(MLNeuralNetworkEngine *)self probabilityDictionarySharedKeySet];
    int v30 = [(MLProbabilityDictionary *)v28 initWithSharedKeySet:v29 probabilities:v25];

    goto LABEL_106;
  }
  long long v46 = [(MLNeuralNetworkEngine *)self classLabels];
  std::vector<unsigned long>::vector(buf, [v46 count]);

  size_t v48 = *(uint64_t **)buf;
  int v47 = *(uint64_t **)&buf[8];
  if (*(void *)buf != *(void *)&buf[8])
  {
    uint64_t v49 = 0;
    long long v50 = *(uint64_t **)buf;
    do
      *v50++ = v49++;
    while (v50 != v47);
  }
  long long v51 = &v48[v11];
  if (v51 == v47) {
    goto LABEL_101;
  }
  while (1)
  {
    unint64_t v52 = v47 - v48;
    if (v52 < 2) {
      goto LABEL_101;
    }
    if (v52 == 3)
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MLNeuralNetworkEngine convertPredictionToClassifierResult:withOptions:error:]::$_0 &,std::__wrap_iter<unsigned long *>>(v48, v48 + 1, v47 - 1, v25);
      goto LABEL_101;
    }
    if (v52 == 2)
    {
      uint64_t v89 = *(v47 - 1);
      uint64_t v90 = *v48;
      if (*(double *)(v25 + 8 * (int)v89) > *(double *)(v25 + (*v48 << 32 >> 29)))
      {
        uint64_t *v48 = v89;
        *(v47 - 1) = v90;
      }
      goto LABEL_101;
    }
    if ((char *)v47 - (char *)v48 <= 63)
    {
      if (v47 - 1 == v48) {
        goto LABEL_101;
      }
      while (1)
      {
        unint64_t v91 = v47;
        if (v48 == v47) {
          goto LABEL_98;
        }
        uint64_t v92 = v48 + 1;
        if (v48 + 1 != v47) {
          break;
        }
LABEL_100:
        if (++v48 == v47 - 1) {
          goto LABEL_101;
        }
      }
      uint64_t v93 = *v48;
      unint64_t v91 = v48;
      uint64_t v94 = v48 + 1;
      do
      {
        uint64_t v96 = *v94++;
        int v95 = v96;
        if (*(double *)(v25 + 8 * (int)v96) > *(double *)(v25 + 8 * (int)v93))
        {
          LODWORD(v93) = v95;
          unint64_t v91 = v92;
        }
        uint64_t v92 = v94;
      }
      while (v94 != v47);
LABEL_98:
      if (v91 != v48)
      {
        uint64_t v97 = *v48;
        uint64_t *v48 = *v91;
        uint64_t *v91 = v97;
      }
      goto LABEL_100;
    }
    uint64_t v53 = &v48[v52 >> 1];
    size_t v54 = v47 - 1;
    int v55 = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[MLNeuralNetworkEngine convertPredictionToClassifierResult:withOptions:error:]::$_0 &,std::__wrap_iter<unsigned long *>>(v48, v53, v47 - 1, v25);
    uint64_t v56 = *v48;
    double v57 = *(double *)(v25 + (*v48 << 32 >> 29));
    double v58 = *(double *)(v25 + (*v53 << 32 >> 29));
    if (v57 <= v58) {
      break;
    }
LABEL_47:
    uint64_t v63 = v48 + 1;
    if (v48 + 1 >= v54)
    {
      long long v66 = v48 + 1;
    }
    else
    {
      float v64 = v48 + 1;
      while (1)
      {
        double v65 = *(double *)(v25 + (*v53 << 32 >> 29));
        do
        {
          long long v66 = v64;
          uint64_t v68 = *v64++;
          uint64_t v67 = v68;
        }
        while (*(double *)(v25 + 8 * (int)v68) > v65);
        do
        {
          uint64_t v70 = *--v54;
          uint64_t v69 = v70;
        }
        while (*(double *)(v25 + 8 * (int)v70) <= v65);
        if (v66 >= v54) {
          break;
        }
        *long long v66 = v69;
        *size_t v54 = v67;
        ++v55;
        if (v53 == v66) {
          uint64_t v53 = v54;
        }
      }
    }
    if (v66 != v53)
    {
      uint64_t v71 = *v66;
      if (*(double *)(v25 + (*v53 << 32 >> 29)) > *(double *)(v25 + (*v66 << 32 >> 29)))
      {
        *long long v66 = *v53;
        *uint64_t v53 = v71;
        ++v55;
      }
    }
    if (v66 == v51) {
      goto LABEL_101;
    }
    if (!v55)
    {
      if (v66 <= v51)
      {
        long long v77 = v66 + 1;
        while (v77 != v47)
        {
          double v78 = *(double *)(v25 + (*v77 << 32 >> 29));
          double v79 = *(double *)(v25 + (*(v77++ - 1) << 32 >> 29));
          if (v78 > v79) {
            goto LABEL_62;
          }
        }
      }
      else
      {
        while (v63 != v66)
        {
          double v73 = *(double *)(v25 + (*v63 << 32 >> 29));
          double v74 = *(double *)(v25 + (*(v63++ - 1) << 32 >> 29));
          if (v73 > v74) {
            goto LABEL_62;
          }
        }
      }
      goto LABEL_101;
    }
LABEL_62:
    if (v66 <= v51)
    {
      long long v72 = v66 + 1;
    }
    else
    {
      int v47 = v66;
      long long v72 = v48;
    }
LABEL_85:
    size_t v48 = v72;
    if (v47 == v51) {
      goto LABEL_101;
    }
  }
  int v59 = v47 - 2;
  while (v59 != v48)
  {
    uint64_t v60 = v59;
    uint64_t v62 = *v59--;
    uint64_t v61 = v62;
    if (*(double *)(v25 + 8 * (int)v62) > v58)
    {
      uint64_t *v48 = v61;
      uint64_t *v60 = v56;
      ++v55;
      size_t v54 = v60;
      goto LABEL_47;
    }
  }
  uint64_t v75 = v48 + 1;
  if (v57 > *(double *)(v25 + (*v54 << 32 >> 29)))
  {
LABEL_78:
    if (v75 == v54) {
      goto LABEL_101;
    }
    while (1)
    {
      double v80 = *(double *)(v25 + (*v48 << 32 >> 29));
      do
      {
        long long v72 = v75;
        uint64_t v82 = *v75++;
        uint64_t v81 = v82;
      }
      while (v80 <= *(double *)(v25 + 8 * (int)v82));
      do
      {
        uint64_t v84 = *--v54;
        uint64_t v83 = v84;
      }
      while (v80 > *(double *)(v25 + 8 * (int)v84));
      if (v72 >= v54) {
        break;
      }
      uint64_t *v72 = v83;
      *size_t v54 = v81;
    }
    if (v72 > v51) {
      goto LABEL_101;
    }
    goto LABEL_85;
  }
  while (v75 != v54)
  {
    uint64_t v76 = *v75;
    if (v57 > *(double *)(v25 + (*v75 << 32 >> 29)))
    {
      *v75++ = *v54;
      *size_t v54 = v76;
      goto LABEL_78;
    }
    ++v75;
  }
LABEL_101:
  dispatch_semaphore_t v98 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v11];
  v106[1] = v106;
  MEMORY[0x1F4188790](v98);
  uint64_t v100 = (char *)v106 - ((v99 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v11)
  {
    uint64_t v101 = 0;
    uint64_t v102 = *(void *)buf;
    do
    {
      unint64_t v103 = [*(id *)&self->_engine objectAtIndexedSubscript:*(void *)(v102 + 8 * v101)];
      [v98 setObject:v103 atIndexedSubscript:v101];

      uint64_t v102 = *(void *)buf;
      *(void *)&v100[8 * v101] = *(void *)(v25 + 8 * *(void *)(*(void *)buf + 8 * v101));
      ++v101;
    }
    while (v11 != v101);
  }
  int v30 = [[MLProbabilityDictionary alloc] initWithLabels:v98 probabilities:v100];

  if (*(void *)buf)
  {
    *(void *)&uint8_t buf[8] = *(void *)buf;
    operator delete(*(void **)buf);
  }
LABEL_106:
  uint64_t v104 = [(MLProbabilityDictionary *)v30 classLabelOfMaxProbability];
  __int16 v33 = +[MLClassifierResult resultWithClassProbability:v30 additionalFeatures:v8 classLabelOfMaxProbability:v104];

  id v17 = v108;
LABEL_107:

  id v108 = v17;
LABEL_108:

  id v17 = v108;
LABEL_109:

LABEL_110:
LABEL_111:

  return v33;
}

- (int)sequenceNamed:(id)a3
{
  id v4 = a3;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v4 UTF8String]);
  p_currentBlobShapes = (uint64_t **)&self->_currentBlobShapes;
  id v6 = (void **)std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::__find_equal<std::string>((uint64_t)p_currentBlobShapes, &v15, __p);
  BOOL v7 = *v6;
  if (!*v6)
  {
    id v8 = (uint64_t **)v6;
    BOOL v7 = operator new(0x50uLL);
    *((_OWORD *)v7 + 2) = *(_OWORD *)__p;
    uint64_t v10 = v14;
    uint64_t v9 = v15;
    __p[1] = 0;
    uint64_t v14 = 0;
    __p[0] = 0;
    *((void *)v7 + 6) = v10;
    *((void *)v7 + 7) = 0;
    *((void *)v7 + 8) = 0;
    *((void *)v7 + 9) = 0;
    std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__insert_node_at(p_currentBlobShapes, v9, v8, (uint64_t *)v7);
  }
  int v11 = *((_DWORD *)v7 + 18);
  if (SHIBYTE(v14) < 0) {
    operator delete(__p[0]);
  }

  return v11;
}

- (BOOL)sequenceConcatConsumesOptionalInputNamed:(id)a3
{
  id v4 = a3;
  id v5 = [(MLNeuralNetworkEngine *)self optionalInputTypes];
  id v6 = [v5 objectForKeyedSubscript:v4];
  char v7 = [v6 isEqual:&unk_1EF11A070];

  return v7;
}

+ (id)loadModelAssetDescriptionFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = objc_msgSend((id)objc_msgSend(a1, "containerClass"), "containerFromCompiledArchive:modelVersionInfo:compilerVersionInfo:configuration:error:", a3, v12, v13, v14, a7);
  if (v15)
  {
    __int16 v16 = [MLModelAssetDescription alloc];
    id v17 = [v15 modelDescription];
    uint64_t v18 = [(MLModelAssetDescription *)v16 initWithModelDescription:v17];
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

+ (id)neuralNetworkFromContainer:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void *)[objc_alloc((Class)a1) initWithContainer:v8 configuration:v9 error:a5];

  return v10;
}

+ (id)neuralNetworkFromContainer:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(MLModelConfiguration);
  char v7 = +[MLNeuralNetworkEngine neuralNetworkFromContainer:v5 configuration:v6 error:a4];

  return v7;
}

+ (Class)containerClass
{
  return (Class)objc_opt_class();
}

+ (int)gpuPrecision
{
  return 65552;
}

@end