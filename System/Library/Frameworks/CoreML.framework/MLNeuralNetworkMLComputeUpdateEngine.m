@interface MLNeuralNetworkMLComputeUpdateEngine
+ (id)loadModelFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7;
- (BOOL)classifierOutputIsSigmoidOutput;
- (BOOL)continueWithUpdate;
- (BOOL)performTrainingWith:(id)a3 callBacks:(id)a4 numberOfEpochs:(unint64_t)a5 error:(id *)a6;
- (BOOL)writeToURL:(id)a3 error:(id *)a4;
- (MLNeuralNetworkMLComputeGraph)mlcGraph;
- (MLNeuralNetworkMLComputeUpdateEngine)initWithCompiledArchive:(void *)a3 nnContainer:(id)a4 configuration:(id)a5 error:(id *)a6;
- (MLParameterContainer)parameterContainer;
- (MLShufflingBatchProvider)shuffableTrainingData;
- (MLUpdateProgressHandlers)progressHandlers;
- (NSDictionary)classLabelToIndexMap;
- (NSString)lossTargetName;
- (OS_dispatch_queue)progressHandlersDispatchQueue;
- (float)finalLossValue;
- (id)loadLossTargetName:(void *)a3;
- (id)parameterValueForKey:(id)a3;
- (id)parameterValueForKey:(id)a3 error:(id *)a4;
- (id)performInferenceWith:(id)a3 outputNameToLayerMap:(id)a4 error:(id *)a5;
- (id)predictionsFromBatch:(id)a3 options:(id)a4 error:(id *)a5;
- (id)updateParameters;
- (unint64_t)batchSize;
- (unint64_t)predictionTypeForKTrace;
- (void)cancelUpdate;
- (void)resumeUpdate;
- (void)resumeUpdateWithParameters:(id)a3;
- (void)setBatchSize:(unint64_t)a3;
- (void)setClassifierOutputIsSigmoidOutput:(BOOL)a3;
- (void)setContinueWithUpdate:(BOOL)a3;
- (void)setFinalLossValue:(float)a3;
- (void)setMlcGraph:(id)a3;
- (void)setParameterContainer:(id)a3;
- (void)setProgressHandlers:(id)a3;
- (void)setProgressHandlersDispatchQueue:(id)a3;
- (void)setShuffableTrainingData:(id)a3;
- (void)setUpdateProgressHandlers:(id)a3 dispatchQueue:(id)a4;
- (void)updateLearningRateWithValue:(float)a3;
- (void)updateModelWithData:(id)a3;
@end

@implementation MLNeuralNetworkMLComputeUpdateEngine

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressHandlersDispatchQueue, 0);
  objc_storeStrong((id *)&self->_parameterContainer, 0);
  objc_storeStrong((id *)&self->_shuffableTrainingData, 0);
  objc_storeStrong((id *)&self->_lossTargetName, 0);
  objc_storeStrong((id *)&self->_classLabelToIndexMap, 0);
  objc_storeStrong((id *)&self->_classifierOutputIsSigmoidOutput, 0);

  objc_storeStrong((id *)&self->super.super._network.network_index, 0);
}

- (void)setMlcGraph:(id)a3
{
}

- (MLNeuralNetworkMLComputeGraph)mlcGraph
{
  return (MLNeuralNetworkMLComputeGraph *)self->_progressHandlersDispatchQueue;
}

- (void)setFinalLossValue:(float)a3
{
  *((float *)&self->super.super._network.plan + 1) = a3;
}

- (float)finalLossValue
{
  return *((float *)&self->super.super._network.plan + 1);
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_progressHandlers = (MLUpdateProgressHandlers *)a3;
}

- (unint64_t)batchSize
{
  return (unint64_t)self->_progressHandlers;
}

- (void)setProgressHandlersDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)progressHandlersDispatchQueue
{
  return (OS_dispatch_queue *)self->_parameterContainer;
}

- (void)setProgressHandlers:(id)a3
{
}

- (MLUpdateProgressHandlers)progressHandlers
{
  return (MLUpdateProgressHandlers *)self->_shuffableTrainingData;
}

- (void)setParameterContainer:(id)a3
{
}

- (MLParameterContainer)parameterContainer
{
  return (MLParameterContainer *)self->_lossTargetName;
}

- (void)setShuffableTrainingData:(id)a3
{
}

- (MLShufflingBatchProvider)shuffableTrainingData
{
  return (MLShufflingBatchProvider *)self->_classLabelToIndexMap;
}

- (void)setContinueWithUpdate:(BOOL)a3
{
  BYTE1(self->super.super._network.plan) = a3;
}

- (BOOL)continueWithUpdate
{
  return BYTE1(self->super.super._network.plan);
}

- (NSString)lossTargetName
{
  return *(NSString **)&self->_classifierOutputIsSigmoidOutput;
}

- (void)setClassifierOutputIsSigmoidOutput:(BOOL)a3
{
  LOBYTE(self->super.super._network.plan) = a3;
}

- (BOOL)classifierOutputIsSigmoidOutput
{
  return (BOOL)self->super.super._network.plan;
}

- (NSDictionary)classLabelToIndexMap
{
  return *(NSDictionary **)&self->super.super._network.network_index;
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(MLModelEngine *)self modelDescription];
  id v8 = [v7 modelURL];
  std::string::basic_string[abi:ne180100]<0>(&v42, (char *)[v8 fileSystemRepresentation]);
  IArchive::IArchive(&v26, (uint64_t)&v42, 0);
  if (SHIBYTE(v44) < 0) {
    operator delete(v42);
  }

  std::string::basic_string[abi:ne180100]<0>(&v42, "entireSpec");
  char hasNestedArchive = IArchive::hasNestedArchive(&v26, &v42);
  char v10 = hasNestedArchive;
  if ((SHIBYTE(v44) & 0x80000000) == 0)
  {
    if (hasNestedArchive) {
      goto LABEL_5;
    }
LABEL_10:
    if (a4)
    {
      +[MLModelErrorUtils IOErrorWithFormat:@"Internal error: failed to look up the archive."];
      BOOL v15 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v15 = 0;
    }
    goto LABEL_35;
  }
  operator delete(v42);
  if ((v10 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  CoreML::Specification::Model::Model((CoreML::Specification::Model *)v25);
  std::string::basic_string[abi:ne180100]<0>(&v42, "entireSpec");
  v11 = IArchive::nestedArchive(&v26, (uint64_t)&v42);
  if (SHIBYTE(v44) < 0) {
    operator delete(v42);
  }
  v12 = (std::__shared_weak_count *)(*(uint64_t (**)(void))(**(void **)(*(void *)v11 + 32) + 16))(*(void *)(*(void *)v11 + 32));
  v42 = &unk_1EF0DB2F8;
  v43 = &unk_1EF0DB2C8;
  v44 = v12;
  v45 = &unk_1EF0DB3A8;
  v46 = (char *)&v43;
  __int16 v47 = 0;
  uint64_t v48 = 0;
  uint64_t v49 = 0;
  uint64_t v51 = 0;
  int v50 = 0x2000;
  v32 = 0;
  uint64_t v33 = 0;
  v34 = &v42;
  *(void *)v35 = 0;
  *(void *)((char *)&v35[1] + 2) = 0;
  uint64_t v36 = 0x7FFFFFFFLL;
  uint64_t v37 = 0x647FFFFFFFLL;
  int v38 = 100;
  char v39 = 1;
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  google::protobuf::io::CodedInputStream::Refresh((google::protobuf::io::CodedInputStream *)&v32);
  LODWORD(v37) = 0x7FFFFFFF;
  uint64_t v13 = v33 + SHIDWORD(v36);
  uint64_t v33 = v13;
  int v14 = v35[0] - v36;
  if (v35[0] <= (int)v36) {
    int v14 = 0;
  }
  else {
    uint64_t v33 = v13 - v14;
  }
  HIDWORD(v36) = v14;
  if (google::protobuf::MessageLite::ParseFromCodedStream((google::protobuf::MessageLite *)v25, (google::protobuf::io::CodedInputStream *)&v32))
  {
    CoreML::Result::Result((CoreML::Result *)v23);
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, "unable to deserialize object");
    v23[0] = 5;
    std::operator+<char>();
    if (v31 < 0) {
      operator delete(__p);
    }
  }
  google::protobuf::io::CodedInputStream::~CodedInputStream((google::protobuf::io::CodedInputStream *)&v32);
  v42 = &unk_1EF0DB2F8;
  google::protobuf::io::CopyingInputStreamAdaptor::~CopyingInputStreamAdaptor((google::protobuf::io::CopyingInputStreamAdaptor *)&v45);
  if ((v23[0] & 0xFFFFFFEF) == 0)
  {
    v16 = [(MLNeuralNetworkMLComputeUpdateEngine *)self mlcGraph];
    char v17 = [v16 saveUpdatedWeightsTo:v25 error:a4];

    if (v17)
    {
      std::allocate_shared[abi:ne180100]<CoreML::Specification::Model,std::allocator<CoreML::Specification::Model>,CoreML::Specification::Model const&,void>((CoreML::Specification::Model **)&__p, (const CoreML::Specification::Model *)v25);
      std::string::basic_string[abi:ne180100]<0>(&v32, (char *)[v6 fileSystemRepresentation]);
      OArchive::OArchive((uint64_t)&v42, (uint64_t)&v32, 0);
      if (SHIBYTE(v34) < 0) {
        operator delete(v32);
      }
      v18 = +[MLCompilerOptions defaultOptions];
      [v18 setTrainWithMLCompute:1];
      id v22 = 0;
      v19 = +[MLCompiler compileSpecification:&__p toArchive:&v42 options:v18 error:&v22];
      id v20 = v22;
      BOOL v15 = v19 != 0;
      if (a4 && !v19)
      {
        *a4 = +[MLModelErrorUtils errorWithCode:3 underlyingError:v20 format:@"Internal error: failed to re-compile updated model."];
      }

      std::__tree<std::__value_type<std::string,OArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,OArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,OArchive>>>::destroy(v46);
      if (v44) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v44);
      }
      if (v30) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v30);
      }
      goto LABEL_32;
    }
    goto LABEL_31;
  }
  if (!a4)
  {
LABEL_31:
    BOOL v15 = 0;
    goto LABEL_32;
  }
  +[MLModelErrorUtils IOErrorWithFormat:@"Internal error: failed to unarchive the model."];
  BOOL v15 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_32:
  if (v24 < 0) {
    operator delete((void *)v23[1]);
  }
  CoreML::Specification::Model::~Model((CoreML::Specification::Model *)v25);
LABEL_35:
  std::__tree<std::__value_type<std::string,IArchive>,std::__map_value_compare<std::string,std::__value_type<std::string,IArchive>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,IArchive>>>::destroy(v28);
  if (v27) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v27);
  }

  return v15;
}

- (id)parameterValueForKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 hasGlobalScope])
  {
    v7 = [(MLNeuralNetworkMLComputeUpdateEngine *)self parameterContainer];
    id v8 = [v7 currentParameterValues];
    v9 = [v8 objectForKeyedSubscript:v6];

    if (v9) {
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  char v10 = +[MLParameterKey weights];
  int v11 = [v6 hasSameNameAsKey:v10];

  if (v11)
  {
    v12 = [(MLNeuralNetworkMLComputeUpdateEngine *)self mlcGraph];
    uint64_t v13 = [v6 scope];
    uint64_t v14 = [v12 getWeightsForLayerNamed:v13 error:a4];
LABEL_8:
    v9 = (void *)v14;

    goto LABEL_12;
  }
  BOOL v15 = +[MLParameterKey biases];
  int v16 = [v6 hasSameNameAsKey:v15];

  if (v16)
  {
    v12 = [(MLNeuralNetworkMLComputeUpdateEngine *)self mlcGraph];
    uint64_t v13 = [v6 scope];
    uint64_t v14 = [v12 getBiasesForLayerNamed:v13 error:a4];
    goto LABEL_8;
  }
LABEL_9:
  if (a4)
  {
    +[MLModelErrorUtils errorWithCode:7, @"Neural network model does not have a parameter for requested key %@.", v6 format];
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

- (id)parameterValueForKey:(id)a3
{
  v3 = [(MLNeuralNetworkMLComputeUpdateEngine *)self parameterValueForKey:a3 error:0];

  return v3;
}

- (id)loadLossTargetName:(void *)a3
{
  CoreML::Specification::LossLayer::LossLayer((CoreML::Specification::LossLayer *)v6, *(const CoreML::Specification::LossLayer **)(*((void *)a3 + 4) + 8));
  if (v8 == 10 || v8 == 11)
  {
    v3 = *(uint64_t **)(v7 + 24);
    if (*((char *)v3 + 23) < 0) {
      v3 = (uint64_t *)*v3;
    }
    v4 = [NSString stringWithUTF8String:v3];
  }
  else
  {
    v4 = 0;
  }
  CoreML::Specification::LossLayer::~LossLayer((CoreML::Specification::LossLayer *)v6);

  return v4;
}

- (id)performInferenceWith:(id)a3 outputNameToLayerMap:(id)a4 error:(id *)a5
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v37 = a4;
  uint64_t v40 = v8;
  if (!v8)
  {
    if (a5)
    {
      +[MLModelErrorUtils errorWithCode:6 format:@"Unable to perform inference. Input is nil."];
      v32 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_34;
    }
LABEL_30:
    v32 = 0;
    goto LABEL_34;
  }
  v35 = a5;
  v9 = [(MLNeuralNetworkMLComputeUpdateEngine *)self mlcGraph];
  char v10 = [v9 inferenceGraph];

  if (!v10)
  {
    if (a5)
    {
      +[MLModelErrorUtils errorWithCode:6 format:@"Unable to perform inference due to an internal error in inference graph creation."];
      v32 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_34;
    }
    goto LABEL_30;
  }
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__5959;
  v57 = __Block_byref_object_dispose__5960;
  id v58 = 0;
  uint64_t v38 = [v40 numberOfBatches];
  uint64_t v36 = [[MLStreamingInputDataSource alloc] initWithBatchSize:[(MLNeuralNetworkMLComputeUpdateEngine *)self batchSize]];
  if (!v38) {
    goto LABEL_29;
  }
  uint64_t v41 = self;
  uint64_t v11 = 0;
  char v39 = 0;
  do
  {
    v12 = (void *)MEMORY[0x19F3C29E0]();
    uint64_t v13 = (id *)(v54 + 5);
    id obj = (id)v54[5];
    uint64_t v14 = [v40 batchAtIndex:v11 error:&obj];
    objc_storeStrong(v13, obj);
    if (v14)
    {
      BOOL v15 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      int v16 = [(MLNeuralNetworkMLComputeUpdateEngine *)v41 mlcGraph];
      char v17 = [v16 mlcInputs];
      v18 = [v17 allKeys];

      uint64_t v19 = [v18 countByEnumeratingWithState:&v48 objects:v59 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v49;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v49 != v20) {
              objc_enumerationMutation(v18);
            }
            uint64_t v22 = *(void *)(*((void *)&v48 + 1) + 8 * i);
            v23 = [v14 objectForKeyedSubscript:v22];
            [v15 setObject:v23 forKeyedSubscript:v22];
          }
          uint64_t v19 = [v18 countByEnumeratingWithState:&v48 objects:v59 count:16];
        }
        while (v19);
      }

      uint64_t v24 = [v40 sizeOfBatchAtIndex:v11];
      v25 = [(MLNeuralNetworkMLComputeUpdateEngine *)v41 mlcGraph];
      uint64_t v26 = [v25 inferenceGraph];
      v27 = (void *)[v15 copy];
      v28 = [(MLNeuralNetworkMLComputeUpdateEngine *)v41 mlcGraph];
      uint64_t v29 = [v28 executionOptions];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __88__MLNeuralNetworkMLComputeUpdateEngine_performInferenceWith_outputNameToLayerMap_error___block_invoke;
      v42[3] = &unk_1E59A3FB8;
      v46 = &v53;
      id v43 = v37;
      v44 = v41;
      v45 = v36;
      uint64_t v47 = v24;
      LODWORD(v24) = [v26 executeWithInputsData:v27 batchSize:v24 options:v29 completionHandler:v42];

      if (v24 && !v54[5])
      {
        int v31 = 0;
      }
      else
      {
        uint64_t v30 = [[NSString alloc] initWithFormat:@"Error when performing inference"];

        int v31 = 2;
        char v39 = (void *)v30;
      }
    }
    else
    {
      int v31 = 2;
      BOOL v15 = v39;
      char v39 = objc_msgSend([NSString alloc], "initWithFormat:", @"Unable to get inference input for batch index: %lu", v11);
    }

    if (v31) {
      break;
    }
    ++v11;
  }
  while (v11 != v38);
  if (v39)
  {
    if (v35)
    {
      +[MLModelErrorUtils errorWithCode:6, v54[5], @"%@", v39 underlyingError format];
      v32 = 0;
      id *v35 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = 0;
    }
    uint64_t v33 = v36;
  }
  else
  {
LABEL_29:
    uint64_t v33 = v36;
    v32 = v36;
    char v39 = 0;
  }

  _Block_object_dispose(&v53, 8);
LABEL_34:

  return v32;
}

void __88__MLNeuralNetworkMLComputeUpdateEngine_performInferenceWith_outputNameToLayerMap_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  uint64_t v25 = a1;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    v5 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = *(id *)(v25 + 32);
    uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v6)
    {
      uint64_t v24 = *(void *)v28;
      do
      {
        uint64_t v26 = v6;
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v28 != v24) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          v9 = [*(id *)(v25 + 32) objectForKeyedSubscript:v8];
          char v10 = [*(id *)(v25 + 40) mlcGraph];
          uint64_t v11 = [v10 inferenceGraph];
          v12 = [v11 resultTensorsForLayer:v9];

          for (unint64_t j = 0; j < [v12 count]; ++j)
          {
            uint64_t v14 = [v12 objectAtIndexedSubscript:j];
            BOOL v15 = [v14 label];
            int v16 = [v15 isEqualToString:v8];

            if (v16)
            {
              char v17 = [v12 objectAtIndexedSubscript:j];
              [v17 synchronizeData];

              v18 = [v12 objectAtIndexedSubscript:j];
              uint64_t v19 = [v18 data];
              uint64_t v20 = [v12 objectAtIndexedSubscript:j];
              v21 = [v20 label];
              [v5 setObject:v19 forKeyedSubscript:v21];
            }
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v6);
    }

    [*(id *)(v25 + 48) appendBatchedTensors:v5 numberOfTensors:*(void *)(v25 + 64)];
  }
}

- (BOOL)performTrainingWith:(id)a3 callBacks:(id)a4 numberOfEpochs:(unint64_t)a5 error:(id *)a6
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v59 = a3;
  id v56 = a4;
  v62 = self;
  uint64_t v8 = [(MLNeuralNetworkMLComputeUpdateEngine *)self mlcGraph];
  v9 = [v8 trainingGraph];

  if (v9)
  {
    uint64_t v88 = 0;
    v89 = &v88;
    uint64_t v90 = 0x3032000000;
    v91 = __Block_byref_object_copy__5959;
    v92 = __Block_byref_object_dispose__5960;
    id v93 = 0;
    char v10 = [(MLNeuralNetworkMLComputeUpdateEngine *)v62 mlcGraph];
    char v53 = [v10 executionOptions];

    uint64_t v60 = [v59 numberOfBatches];
    if (a5)
    {
      uint64_t v55 = 0;
      int v12 = 0;
      while (1)
      {
        dsema = dispatch_semaphore_create(0);
        uint64_t v84 = 0;
        v85 = &v84;
        uint64_t v86 = 0x2020000000;
        int v87 = 0;
        if (v60)
        {
          uint64_t v13 = 0;
          while (1)
          {
            uint64_t v80 = 0;
            v81 = (float *)&v80;
            uint64_t v82 = 0x2020000000;
            int v83 = 0;
            uint64_t v14 = (void *)MEMORY[0x19F3C29E0]();
            BOOL v15 = (id *)(v89 + 5);
            id obj = (id)v89[5];
            int v16 = [v59 batchAtIndex:v13 error:&obj];
            objc_storeStrong(v15, obj);
            if (!a6 || v16)
            {
              context = (void *)MEMORY[0x19F3C29E0]();
              v18 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
              long long v77 = 0u;
              long long v78 = 0u;
              long long v75 = 0u;
              long long v76 = 0u;
              uint64_t v19 = [(MLNeuralNetworkMLComputeUpdateEngine *)v62 mlcGraph];
              uint64_t v20 = [v19 mlcInputs];
              v21 = [v20 allKeys];

              uint64_t v22 = [v21 countByEnumeratingWithState:&v75 objects:v95 count:16];
              if (v22)
              {
                uint64_t v23 = *(void *)v76;
                do
                {
                  for (uint64_t i = 0; i != v22; ++i)
                  {
                    if (*(void *)v76 != v23) {
                      objc_enumerationMutation(v21);
                    }
                    uint64_t v25 = *(void *)(*((void *)&v75 + 1) + 8 * i);
                    uint64_t v26 = [v16 objectForKeyedSubscript:v25];
                    [v18 setObject:v26 forKeyedSubscript:v25];
                  }
                  uint64_t v22 = [v21 countByEnumeratingWithState:&v75 objects:v95 count:16];
                }
                while (v22);
              }

              long long v27 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
              long long v73 = 0u;
              long long v74 = 0u;
              long long v71 = 0u;
              long long v72 = 0u;
              long long v28 = [(MLNeuralNetworkMLComputeUpdateEngine *)v62 mlcGraph];
              long long v29 = [v28 mlcLabels];
              long long v30 = [v29 allKeys];

              uint64_t v31 = [v30 countByEnumeratingWithState:&v71 objects:v94 count:16];
              if (v31)
              {
                uint64_t v32 = *(void *)v72;
                do
                {
                  for (uint64_t j = 0; j != v31; ++j)
                  {
                    if (*(void *)v72 != v32) {
                      objc_enumerationMutation(v30);
                    }
                    uint64_t v34 = *(void *)(*((void *)&v71 + 1) + 8 * j);
                    v35 = [v16 objectForKeyedSubscript:v34];
                    [v27 setObject:v35 forKeyedSubscript:v34];
                  }
                  uint64_t v31 = [v30 countByEnumeratingWithState:&v71 objects:v94 count:16];
                }
                while (v31);
              }

              uint64_t v36 = [v59 sizeOfBatchAtIndex:v13];
              id v37 = [(MLNeuralNetworkMLComputeUpdateEngine *)v62 mlcGraph];
              uint64_t v38 = [v37 trainingGraph];
              char v39 = [(MLNeuralNetworkMLComputeUpdateEngine *)v62 mlcGraph];
              uint64_t v40 = [v39 executionOptions];
              v64[0] = MEMORY[0x1E4F143A8];
              v64[1] = 3221225472;
              v64[2] = __91__MLNeuralNetworkMLComputeUpdateEngine_performTrainingWith_callBacks_numberOfEpochs_error___block_invoke;
              v64[3] = &unk_1E59A3F90;
              v66 = &v88;
              v67 = &v80;
              v68 = &v84;
              uint64_t v69 = v60;
              uint64_t v70 = v13;
              v65 = dsema;
              [v38 executeWithInputsData:v18 lossLabelsData:v27 lossLabelWeightsData:0 batchSize:v36 options:v40 completionHandler:v64];

              if (v13 == v60 - 1 && v55 == a5 - 1)
              {
                int v12 = *((_DWORD *)v85 + 6);
                v42 = [(MLNeuralNetworkMLComputeUpdateEngine *)v62 mlcGraph];
                id v43 = [v42 trainingGraph];
                [v43 synchronizeUpdates];
              }
              uint64_t v44 = [v56 objectForKeyedSubscript:@"Batch"];
              if (v44)
              {
                v45 = [v56 objectForKeyedSubscript:@"Batch"];
                int v46 = v45[2](v45, v13, v81[6]);

                LODWORD(v44) = v46 ^ 1;
                int v17 = v46 ^ 1;
              }
              else
              {
                int v17 = 0;
              }

              v61 |= v44;
            }
            else
            {
              +[MLModelErrorUtils errorWithCode:6, v89[5], @"Unable to get training input for batch index: %lu", v13 underlyingError format];
              int v61 = 0;
              *a6 = (id)objc_claimAutoreleasedReturnValue();
              int v17 = 1;
            }

            _Block_object_dispose(&v80, 8);
            if (v17) {
              break;
            }
            if (++v13 == v60) {
              goto LABEL_34;
            }
          }
          LODWORD(v48) = 1;
        }
        else
        {
LABEL_34:
          if ((v53 & 2) == 0) {
            dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
          }
          uint64_t v47 = (void *)MEMORY[0x19F3C29E0]();
          long long v48 = [v56 objectForKeyedSubscript:@"Epoch"];
          if (v48)
          {
            long long v49 = [v56 objectForKeyedSubscript:@"Epoch"];
            int v50 = v49[2](v49, v55, *((float *)v85 + 6));

            int v51 = v50 ^ 1;
            LODWORD(v48) = v50 ^ 1;
          }
          else
          {
            int v51 = 0;
          }
          v61 |= v51;
        }
        _Block_object_dispose(&v84, 8);

        if (v48) {
          break;
        }
        if (++v55 == a5) {
          goto LABEL_47;
        }
      }
    }
    else
    {
      int v12 = 0;
LABEL_47:
      if (v89[5])
      {
        if (a6)
        {
          +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6);
          LOBYTE(v61) = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          LOBYTE(v61) = 0;
        }
      }
      else
      {
        LODWORD(v11) = v12;
        [(MLNeuralNetworkMLComputeUpdateEngine *)v62 setFinalLossValue:v11];
        LOBYTE(v61) = 1;
      }
    }
    _Block_object_dispose(&v88, 8);
  }
  else if (a6)
  {
    +[MLModelErrorUtils errorWithCode:6 format:@"Unable to perform training due to an internal error in training graph creation."];
    LOBYTE(v61) = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    LOBYTE(v61) = 0;
  }

  return v61 & 1;
}

void __91__MLNeuralNetworkMLComputeUpdateEngine_performTrainingWith_callBacks_numberOfEpochs_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v6 = [a2 data];
    uint64_t v7 = (_DWORD *)[v6 bytes];

    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *v7;
    unint64_t v8 = *(void *)(a1 + 64);
    uint64_t v9 = *(void *)(a1 + 72);
    *(float *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = (float)(*(float *)(*(void *)(*(void *)(a1 + 48)
                                                                                              + 8)
                                                                                  + 24)
                                                                       / (float)v8)
                                                               + *(float *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                          + 24);
    if (v9 == v8 - 1) {
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    }
  }
}

- (void)updateLearningRateWithValue:(float)a3
{
  id v7 = [(MLNeuralNetworkMLComputeUpdateEngine *)self mlcGraph];
  v4 = [v7 trainingGraph];
  v5 = [v4 optimizer];
  *(float *)&double v6 = a3;
  [v5 setLearningRate:v6];
}

- (void)resumeUpdateWithParameters:(id)a3
{
  id v4 = a3;
  v5 = [(MLNeuralNetworkMLComputeUpdateEngine *)self parameterContainer];
  double v6 = +[MLParameterKey learningRate];
  id v7 = [v4 objectForKeyedSubscript:v6];
  unint64_t v8 = +[MLParameterKey learningRate];
  id v13 = 0;
  char v9 = [v5 setCurrentValue:v7 forKey:v8 error:&v13];
  id v10 = v13;

  if (v9)
  {
    [(MLNeuralNetworkMLComputeUpdateEngine *)self setContinueWithUpdate:1];
  }
  else
  {
    double v11 = [(MLNeuralNetworkMLComputeUpdateEngine *)self progressHandlers];
    int v12 = [(MLNeuralNetworkMLComputeUpdateEngine *)self progressHandlersDispatchQueue];
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
  v2 = [(MLNeuralNetworkMLComputeUpdateEngine *)self parameterContainer];
  v3 = [v2 currentParameterValues];

  return v3;
}

- (void)updateModelWithData:(id)a3
{
  v50[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__MLNeuralNetworkMLComputeUpdateEngine_updateModelWithData___block_invoke;
  aBlock[3] = &unk_1E59A3F68;
  aBlock[4] = self;
  v5 = _Block_copy(aBlock);
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __60__MLNeuralNetworkMLComputeUpdateEngine_updateModelWithData___block_invoke_2;
  v47[3] = &unk_1E59A3F68;
  v47[4] = self;
  id v43 = _Block_copy(v47);
  double v6 = +[MLParameterKey epochs];
  id v7 = [(MLNeuralNetworkMLComputeUpdateEngine *)self parameterValueForKey:v6];
  uint64_t v8 = [v7 unsignedIntegerValue];

  char v9 = +[MLParameterKey shuffle];
  id v10 = [(MLNeuralNetworkMLComputeUpdateEngine *)self parameterValueForKey:v9];
  int v11 = [v10 BOOLValue];

  if (!v11)
  {
    id v45 = 0;
    uint64_t v19 = +[MLDataConversionUtils mlComputeDataProviderFromBatchProvider:v4 batchSize:[(MLNeuralNetworkMLComputeUpdateEngine *)self batchSize] forPrediction:0 neuralNetworkEngine:self error:&v45];
    id v18 = v45;
    if (!v19) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v23 = [(MLNeuralNetworkMLComputeUpdateEngine *)self progressHandlers];
    BOOL v24 = ([v23 interestedEvents] & 1) == 0;

    if (!v24)
    {
      uint64_t v25 = [(MLNeuralNetworkMLComputeUpdateEngine *)self progressHandlers];
      uint64_t v26 = [(MLNeuralNetworkMLComputeUpdateEngine *)self updateParameters];
      long long v27 = [(MLNeuralNetworkMLComputeUpdateEngine *)self progressHandlersDispatchQueue];
      [v25 dispatchTrainingBeginProgressHandlerWithMetrics:MEMORY[0x1E4F1CC08] parameters:v26 onQueue:v27];

      long long v28 = +[MLParameterKey learningRate];
      long long v29 = [(MLNeuralNetworkMLComputeUpdateEngine *)self parameterValueForKey:v28];
      [v29 floatValue];
      int v31 = v30;

      LODWORD(v32) = v31;
      [(MLNeuralNetworkMLComputeUpdateEngine *)self updateLearningRateWithValue:v32];
    }
    if ([(MLNeuralNetworkMLComputeUpdateEngine *)self continueWithUpdate])
    {
      id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v33 = _Block_copy(v5);
      [v20 setObject:v33 forKeyedSubscript:@"Epoch"];

      uint64_t v34 = [(MLNeuralNetworkMLComputeUpdateEngine *)self progressHandlers];
      BOOL v35 = ([v34 interestedEvents] & 4) == 0;

      if (!v35)
      {
        uint64_t v36 = _Block_copy(v43);
        [v20 setObject:v36 forKeyedSubscript:@"Batch"];
      }
      id v44 = v18;
      BOOL v37 = [(MLNeuralNetworkMLComputeUpdateEngine *)self performTrainingWith:v19 callBacks:v20 numberOfEpochs:v8 error:&v44];
      id v22 = v44;

      if (!v37)
      {
        v21 = [(MLNeuralNetworkMLComputeUpdateEngine *)self progressHandlers];
        uint64_t v41 = [(MLNeuralNetworkMLComputeUpdateEngine *)self progressHandlersDispatchQueue];
        [v21 dispatchTrainingCompletionHandlerWithError:v22 onQueue:v41];
        goto LABEL_15;
      }
    }
    else
    {
      id v22 = v18;
    }
    uint64_t v38 = +[MLMetricKey lossValue];
    long long v49 = v38;
    char v39 = NSNumber;
    [(MLNeuralNetworkMLComputeUpdateEngine *)self finalLossValue];
    uint64_t v40 = objc_msgSend(v39, "numberWithFloat:");
    v50[0] = v40;
    id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:&v49 count:1];

    v21 = [(MLNeuralNetworkMLComputeUpdateEngine *)self progressHandlers];
    uint64_t v41 = [(MLNeuralNetworkMLComputeUpdateEngine *)self updateParameters];
    v42 = [(MLNeuralNetworkMLComputeUpdateEngine *)self progressHandlersDispatchQueue];
    [v21 dispatchTrainingCompletionHandlerWithMetrics:v20 parameters:v41 onQueue:v42];

LABEL_15:
    goto LABEL_16;
  }
  int v12 = [MLShufflingBatchProvider alloc];
  id v13 = +[MLParameterKey seed];
  uint64_t v14 = [(MLNeuralNetworkMLComputeUpdateEngine *)self parameterValueForKey:v13];
  BOOL v15 = [(MLShufflingBatchProvider *)v12 initWithBatchProvider:v4 seed:v14];
  [(MLNeuralNetworkMLComputeUpdateEngine *)self setShuffableTrainingData:v15];

  int v16 = [(MLNeuralNetworkMLComputeUpdateEngine *)self shuffableTrainingData];
  id v46 = 0;
  uint64_t v17 = +[MLDataConversionUtils mlComputeDataProviderFromBatchProvider:v16 batchSize:[(MLNeuralNetworkMLComputeUpdateEngine *)self batchSize] forPrediction:0 neuralNetworkEngine:self error:&v46];
  id v18 = v46;

  uint64_t v19 = (void *)v17;
  if (v17) {
    goto LABEL_5;
  }
LABEL_3:
  id v20 = [(MLNeuralNetworkMLComputeUpdateEngine *)self progressHandlers];
  v21 = [(MLNeuralNetworkMLComputeUpdateEngine *)self progressHandlersDispatchQueue];
  [v20 dispatchTrainingCompletionHandlerWithError:v18 onQueue:v21];
  id v22 = v18;
LABEL_16:
}

uint64_t __60__MLNeuralNetworkMLComputeUpdateEngine_updateModelWithData___block_invoke(uint64_t a1, uint64_t a2, float a3)
{
  double v6 = [*(id *)(a1 + 32) progressHandlers];
  char v7 = [v6 interestedEvents];

  if ((v7 & 2) != 0)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    char v9 = [NSNumber numberWithUnsignedInteger:a2];
    id v10 = +[MLMetricKey epochIndex];
    [v8 setObject:v9 forKeyedSubscript:v10];

    *(float *)&double v11 = a3;
    int v12 = [NSNumber numberWithFloat:v11];
    id v13 = +[MLMetricKey lossValue];
    [v8 setObject:v12 forKeyedSubscript:v13];

    uint64_t v14 = [*(id *)(a1 + 32) progressHandlers];
    BOOL v15 = [*(id *)(a1 + 32) updateParameters];
    int v16 = [*(id *)(a1 + 32) progressHandlersDispatchQueue];
    [v14 dispatchEpochEndProgressHandlerWithMetrics:v8 parameters:v15 onQueue:v16];

    uint64_t v17 = *(void **)(a1 + 32);
    id v18 = +[MLParameterKey learningRate];
    uint64_t v19 = [v17 parameterValueForKey:v18];
    [v19 floatValue];
    int v21 = v20;

    LODWORD(v22) = v21;
    [*(id *)(a1 + 32) updateLearningRateWithValue:v22];
  }
  uint64_t v23 = [*(id *)(a1 + 32) shuffableTrainingData];
  if (v23)
  {
    BOOL v24 = (void *)v23;
    uint64_t v25 = *(void **)(a1 + 32);
    uint64_t v26 = +[MLParameterKey shuffle];
    long long v27 = [v25 parameterValueForKey:v26];
    int v28 = [v27 BOOLValue];

    if (v28)
    {
      long long v29 = [*(id *)(a1 + 32) shuffableTrainingData];
      [v29 shuffle];
    }
  }
  int v30 = *(void **)(a1 + 32);

  return [v30 continueWithUpdate];
}

uint64_t __60__MLNeuralNetworkMLComputeUpdateEngine_updateModelWithData___block_invoke_2(uint64_t a1, uint64_t a2, float a3)
{
  double v6 = [MEMORY[0x1E4F1CA60] dictionary];
  char v7 = [NSNumber numberWithUnsignedInteger:a2];
  uint64_t v8 = +[MLMetricKey miniBatchIndex];
  [v6 setObject:v7 forKeyedSubscript:v8];

  *(float *)&double v9 = a3;
  id v10 = [NSNumber numberWithFloat:v9];
  double v11 = +[MLMetricKey lossValue];
  [v6 setObject:v10 forKeyedSubscript:v11];

  int v12 = [*(id *)(a1 + 32) progressHandlers];
  id v13 = [*(id *)(a1 + 32) updateParameters];
  uint64_t v14 = [*(id *)(a1 + 32) progressHandlersDispatchQueue];
  [v12 dispatchMiniBatchEndProgressHandlerWithMetrics:v6 parameters:v13 onQueue:v14];

  BOOL v15 = *(void **)(a1 + 32);
  int v16 = +[MLParameterKey learningRate];
  uint64_t v17 = [v15 parameterValueForKey:v16];
  [v17 floatValue];
  int v19 = v18;

  LODWORD(v20) = v19;
  [*(id *)(a1 + 32) updateLearningRateWithValue:v20];
  uint64_t v21 = [*(id *)(a1 + 32) continueWithUpdate];

  return v21;
}

- (void)setUpdateProgressHandlers:(id)a3 dispatchQueue:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  [(MLNeuralNetworkMLComputeUpdateEngine *)self setProgressHandlers:v7];
  [(MLNeuralNetworkMLComputeUpdateEngine *)self setProgressHandlersDispatchQueue:v6];
}

- (id)predictionsFromBatch:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v20 = 0;
  id v10 = +[MLDataConversionUtils mlComputeDataProviderFromBatchProvider:v8 batchSize:[(MLNeuralNetworkMLComputeUpdateEngine *)self batchSize] forPrediction:1 neuralNetworkEngine:self error:&v20];
  id v11 = v20;
  if (v10)
  {
    id v18 = v9;
    int v12 = [(MLNeuralNetworkMLComputeUpdateEngine *)self mlcGraph];
    id v13 = [v12 outputNameToLayerMap];
    id v19 = v11;
    uint64_t v14 = [(MLNeuralNetworkMLComputeUpdateEngine *)self performInferenceWith:v10 outputNameToLayerMap:v13 error:&v19];
    id v15 = v19;

    if (v14)
    {
      int v16 = +[MLDataConversionUtils batchProviderFromMLComputeDataProvider:v14 neuralNetworkEngine:self options:v18 error:a5];
    }
    else if (a5)
    {
      +[MLModelErrorUtils errorWithCode:6 underlyingError:v15 format:@"Failed to perform inference."];
      int v16 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int v16 = 0;
    }

    id v9 = v18;
  }
  else
  {
    if (a5)
    {
      +[MLModelErrorUtils errorWithCode:6 underlyingError:v11 format:@"Error creating data."];
      int v16 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int v16 = 0;
    }
    id v15 = v11;
  }

  return v16;
}

- (unint64_t)predictionTypeForKTrace
{
  return 0;
}

- (MLNeuralNetworkMLComputeUpdateEngine)initWithCompiledArchive:(void *)a3 nnContainer:(id)a4 configuration:(id)a5 error:(id *)a6
{
  BOOL v37 = a3;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v46.receiver = self;
  v46.super_class = (Class)MLNeuralNetworkMLComputeUpdateEngine;
  id v47 = 0;
  id v38 = a4;
  id v40 = a5;
  id v8 = -[MLNeuralNetworkEngine initWithContainer:configuration:error:](&v46, sel_initWithContainer_configuration_error_, v38);
  id v39 = v47;
  if (v8)
  {
    CoreML::Specification::NetworkUpdateParameters::NetworkUpdateParameters((CoreML::Specification::NetworkUpdateParameters *)v45);
    if (!+[MLNeuralNetworkUpdateUtils loadUpdateParameters:v45 fromCompiledArchive:v37 error:a6])goto LABEL_16; {
    id v9 = [(MLModelEngine *)v8 modelDescription];
    }
    uint64_t v10 = +[MLNeuralNetworkUpdateUtils loadParameterDescriptionsAndContainerFromUpdateParameters:v45 modelDescription:v9];
    lossTargetName = v8->_lossTargetName;
    v8->_lossTargetName = (NSString *)v10;

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    int v12 = [v40 parameters];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v41 objects:v48 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v42;
      while (2)
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v42 != v14) {
            objc_enumerationMutation(v12);
          }
          uint64_t v16 = *(void *)(*((void *)&v41 + 1) + 8 * v15);
          uint64_t v17 = [(MLNeuralNetworkMLComputeUpdateEngine *)v8 parameterContainer];
          id v18 = [v40 parameters];
          id v19 = [v18 objectForKeyedSubscript:v16];
          LOBYTE(v16) = [v17 setCurrentValue:v19 forKey:v16 error:a6];

          if ((v16 & 1) == 0)
          {

            goto LABEL_16;
          }
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v12 countByEnumeratingWithState:&v41 objects:v48 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    id v20 = [(MLNeuralNetworkEngine *)v8 classLabels];
    uint64_t v21 = +[MLNeuralNetworkUpdateUtils createClassLabelToIndexMapWith:v20];
    double v22 = *(void **)&v8->super.super._network.network_index;
    *(void *)&v8->super.super._network.network_index = v21;

    uint64_t v23 = [(MLNeuralNetworkMLComputeUpdateEngine *)v8 parameterContainer];
    BOOL v24 = [v23 currentParameterValues];
    uint64_t v25 = +[MLParameterKey miniBatchSize];
    uint64_t v26 = [v24 objectForKeyedSubscript:v25];
    v8->_progressHandlers = (MLUpdateProgressHandlers *)[v26 unsignedIntegerValue];

    BYTE1(v8->super.super._network.plan) = 1;
    uint64_t v27 = [(MLNeuralNetworkMLComputeUpdateEngine *)v8 loadLossTargetName:v45];
    int v28 = *(void **)&v8->_classifierOutputIsSigmoidOutput;
    *(void *)&v8->_classifierOutputIsSigmoidOutput = v27;

    long long v29 = [(MLModelEngine *)v8 modelDescription];
    uint64_t v30 = [(MLNeuralNetworkMLComputeUpdateEngine *)v8 batchSize];
    int v31 = [(MLNeuralNetworkEngine *)v8 classLabels];
    uint64_t v32 = +[MLNeuralNetworkMLComputeGraph graphFromCompiledArchive:modelDescription:batchSize:numberOfClasses:computeUnits:error:](MLNeuralNetworkMLComputeGraph, "graphFromCompiledArchive:modelDescription:batchSize:numberOfClasses:computeUnits:error:", v37, v29, v30, [v31 count], objc_msgSend(v40, "computeUnits"), a6);
    progressHandlersDispatchQueue = v8->_progressHandlersDispatchQueue;
    v8->_progressHandlersDispatchQueue = (OS_dispatch_queue *)v32;

    uint64_t v34 = v8->_progressHandlersDispatchQueue;
    if (v34)
    {
      LOBYTE(v8->super.super._network.plan) = [(OS_dispatch_queue *)v34 classifierOutputIsSigmoidOutput];
      BOOL v35 = v8;
    }
    else
    {
LABEL_16:
      BOOL v35 = 0;
    }
    CoreML::Specification::NetworkUpdateParameters::~NetworkUpdateParameters((CoreML::Specification::NetworkUpdateParameters *)v45);
  }
  else if (a6)
  {
    +[MLModelErrorUtils errorWithCode:6 underlyingError:v39 format:@"Error in initalizing container."];
    BOOL v35 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v35 = 0;
  }

  return v35;
}

+ (id)loadModelFromCompiledArchive:(void *)a3 modelVersionInfo:(id)a4 compilerVersionInfo:(id)a5 configuration:(id)a6 error:(id *)a7
{
  id v12 = a6;
  uint64_t v13 = +[MLNeuralNetworkV1Container containerFromCompiledArchive:a3 modelVersionInfo:a4 compilerVersionInfo:a5 configuration:v12 error:a7];
  if (v13) {
    uint64_t v14 = (void *)[objc_alloc((Class)a1) initWithCompiledArchive:a3 nnContainer:v13 configuration:v12 error:a7];
  }
  else {
    uint64_t v14 = 0;
  }

  return v14;
}

@end