@interface TransferSeqTagMLFHelper
- (BOOL)loadModelLayersFromWeights:(id)a3 labelSize:(unint64_t)a4 embeddingDimension:(int64_t)a5 modelLayers:(void *)a6;
- (NSDictionary)trainingParameters;
- (TransferSeqTagMLFHelper)initWithTraininingParameters:(id)a3;
- (__CFDictionary)doSeqTagTrainingAndEvalFromData:(void *)a3 batchedLabels:(void *)a4 batchedPaddedLabelDatasets:(void *)a5 labelArray:(void *)a6 embeddingRef:(void *)a7 modeLayerList:(void *)a8 trainingGraph:(id)a9 inferenceGraph:(id)a10 scalarParams:(void *)a11 inputPlaceholders:(void *)a12 targetLabelPlaceholders:(id)a13 targetLabelWeightsPlaceholders:(id)a14 trainingLogger:(id)a15;
- (float)evaluateMontrealModelOnData:(void *)a3 evalLabels:(void *)a4 evalEmbeddingsCache:(void *)a5 embeddingRef:(void *)a6 montrealModel:(void *)a7 labelArray:(void *)a8 trainingLogger:(id)a9 dataTypeString:()basic_string<char predictedLabels:()std:(std::allocator<char>> *)a10 :char_traits<char>;
- (float)showF1ResultsMatrix:(void *)a3 labelCounts:()map<int perLabelResults:()int trainingLogger:()std:(std:(int>>> *)a4 :(void *)a5 allocator<std:(id)a6 :()basic_string<char pair<const)int :()std:(std::allocator<char>> *)a7 :char_traits<char> less<int> dataTypeString:;
- (id)createConvLayerFromData:(unint64_t)a3 width:(unint64_t)a4 inputChannels:(unint64_t)a5 outputChannels:(unint64_t)a6 strideInX:(unint64_t)a7 strideInY:(unint64_t)a8 kernelWeight:(id)a9 kernelBias:(id)a10;
- (id)createConvLayerWithKernelHeight:(unint64_t)a3 width:(unint64_t)a4 inputChannels:(unint64_t)a5 outputChannels:(unint64_t)a6 strideInX:(unint64_t)a7 strideInY:(unint64_t)a8;
- (id)createDataWithFloatValue:(float)a3 count:(unint64_t)a4;
- (id)createFullyConnectedLayer:(unint64_t)a3 outputSize:(unint64_t)a4;
- (id)createFullyConnectedLayerFromData:(unint64_t)a3 outputSize:(unint64_t)a4 weightData:(id)a5 biasData:(id)a6;
- (id)createGraphObjectFromLayers:(void *)a3 graphObject:(id)a4 inputPlaceholders:(void *)a5;
- (id)createInferenceGraphFromGraphObject:(id)a3 inputPlaceholders:(void *)a4 scalarWeights:(void *)a5 finalLayerTensor:(id)a6 device:(id)a7;
- (id)createLSTM:(unint64_t)a3 outputSize:(unint64_t)a4;
- (id)createLSTMFromWeights:(unint64_t)a3 outputSize:(unint64_t)a4 inputWeights:(id)a5 hiddenWeights:(id)a6 biasTerms:(id)a7;
- (id)createNSDataWithFloatValue:(float)a3 count:(unint64_t)a4;
- (id)createTrainingGraphFromGraphObject:(id)a3 inputPlaceholders:(void *)a4 scalarWeights:(void *)a5 targetLabels:(id)a6 targeLabelWeights:(id)a7 device:(id)a8;
- (id)findMaxIndexWithData:(id)a3 batchSize:(unint64_t)a4 sequenceLength:(unint64_t)a5 numClasses:(unint64_t)a6;
- (id)getModelLayerWeights:(vector<void *);
- (void)createGraphObjectAndLayersFromInputPlaceholders:(void *)a3 scalarWeights:(void *)a4 labelSize:(unint64_t)a5 embeddingDimension:(int64_t)a6 graphObject:(id)a7 graphLayerList:(void *)a8;
- (void)dealloc;
- (void)evaluateInferenceGraphWithInputTensorData:(void *)a3 batchedInputSentences:(void *)a4 batchedLabels:(void *)a5 inferenceGraph:(id)a6 inputPlaceholders:(void *)a7 scalarParams:(void *)a8 labelArray:(void *)a9 dataTypeString:()basic_string<char trainingLogger:()std:(std::allocator<char>> *)a10 :char_traits<char> predictedLabels:;
- (void)executeInferenceGraph:(id)a3 inputsDictionary:(id)a4 batchSize:(int)a5 maxLength:(int)a6 labelSize:(int)a7 predictedLabels:(void *)a8;
- (void)flattenBatchOfOneHotSequences:(void *)a3 flattenedBatch:(void *)a4;
- (void)getEmbeddingsForSequenceData:(void *)a3 batchSize:(int)a4 maxLength:(int)a5 embeddingRef:(void *)a6 inputTensorDataItems:(void *)a7;
- (void)getInputEmbeddingsAndTargetTensorsForSequenceData:(void *)a3 seqLabels:(void *)a4 batchSize:(int)a5 maxLength:(int)a6 numClasses:(int)a7 embeddingRef:(void *)a8 inputTensorDataItems:(void *)a9 targetTensorData:(id *)a10 targetWeightTensorData:(id *)a11;
- (void)getMaxIndicesFromOneHotVectors:(void *)a3 maxIndicesBatch:(void *)a4;
- (void)getNSSequenceFromStdSequence:(void *)a3 nsSentences:(id)a4 nsSeqLengths:(id)a5 maxLength:(int)a6;
- (void)labelIdsToString:(void *)a3 labelArray:(void *)a4 labelStrings:(void *)a5;
- (void)printLstmWeights:(id)a3;
- (void)removeBatchingFromDataAndLabels:(void *)a3 batchedLabels:(void *)a4 inputSentences:(void *)a5 inputLabels:(void *)a6 maxLength:(int)a7;
- (void)trainAndSaveSeqTagModelFromData:(void *)a3 batchedLabels:(void *)a4 labelArray:(void *)a5 embeddingRef:(void *)a6 trainedModelDict:(__CFDictionary *)a7 trainingLogger:(id)a8;
@end

@implementation TransferSeqTagMLFHelper

- (TransferSeqTagMLFHelper)initWithTraininingParameters:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TransferSeqTagMLFHelper;
  v4 = [(TransferSeqTagMLFHelper *)&v6 init];
  if (v4) {
    v4->_trainingParameters = (NSDictionary *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TransferSeqTagMLFHelper;
  [(TransferSeqTagMLFHelper *)&v3 dealloc];
}

- (id)createDataWithFloatValue:(float)a3 count:(unint64_t)a4
{
  unint64_t v6 = 4 * a4;
  v7 = (float *)malloc_type_malloc(4 * a4, 0x9597EF01uLL);
  if (a4)
  {
    uint64_t v8 = 0;
    do
      v7[v8++] = a3;
    while (a4 > v8);
  }
  v9 = (void *)[MEMORY[0x1E4F1CA58] dataWithBytesNoCopy:v7 length:v6 freeWhenDone:1];
  MLCTensorDataClass = (void *)getMLCTensorDataClass();
  uint64_t v11 = [v9 mutableBytes];
  uint64_t v12 = [v9 length];

  return (id)[MLCTensorDataClass dataWithBytesNoCopy:v11 length:v12];
}

- (id)createNSDataWithFloatValue:(float)a3 count:(unint64_t)a4
{
  unint64_t v6 = 4 * a4;
  v7 = (float *)malloc_type_malloc(4 * a4, 0x39B910BEuLL);
  uint64_t v8 = v7;
  if (a4)
  {
    uint64_t v9 = 0;
    do
      v7[v9++] = a3;
    while (a4 > v9);
  }
  v10 = (void *)MEMORY[0x1E4F1C9B8];

  return (id)[v10 dataWithBytesNoCopy:v8 length:v6 freeWhenDone:1];
}

- (id)createLSTMFromWeights:(unint64_t)a3 outputSize:(unint64_t)a4 inputWeights:(id)a5 hiddenWeights:(id)a6 biasTerms:(id)a7
{
  v29[4] = *MEMORY[0x1E4F143B8];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3052000000;
  v26 = __Block_byref_object_copy__159;
  v27 = __Block_byref_object_dispose__160;
  uint64_t v12 = (void *)getMLCLSTMDescriptorClass(void)::softClass;
  uint64_t v28 = getMLCLSTMDescriptorClass(void)::softClass;
  if (!getMLCLSTMDescriptorClass(void)::softClass)
  {
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    v20 = ___ZL25getMLCLSTMDescriptorClassv_block_invoke;
    v21 = &unk_1E574B6F0;
    v22 = &v23;
    ___ZL25getMLCLSTMDescriptorClassv_block_invoke((uint64_t)&v18);
    uint64_t v12 = (void *)v24[5];
  }
  _Block_object_dispose(&v23, 8);
  uint64_t v13 = [v12 descriptorWithInputSize:a3 hiddenSize:a4 layerCount:1 usesBiases:1 isBidirectional:1 dropout:0.0];
  uint64_t v14 = [(id)getMLCActivationDescriptorClass() descriptorWithType:3];
  uint64_t v15 = [(id)getMLCActivationDescriptorClass() descriptorWithType:5];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3052000000;
  v26 = __Block_byref_object_copy__159;
  v27 = __Block_byref_object_dispose__160;
  v16 = (void *)getMLCLSTMLayerClass(void)::softClass;
  uint64_t v28 = getMLCLSTMLayerClass(void)::softClass;
  if (!getMLCLSTMLayerClass(void)::softClass)
  {
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    v20 = ___ZL20getMLCLSTMLayerClassv_block_invoke;
    v21 = &unk_1E574B6F0;
    v22 = &v23;
    ___ZL20getMLCLSTMLayerClassv_block_invoke((uint64_t)&v18);
    v16 = (void *)v24[5];
  }
  _Block_object_dispose(&v23, 8);
  v29[0] = v14;
  v29[1] = v14;
  v29[2] = v15;
  v29[3] = v14;
  return (id)objc_msgSend(v16, "layerWithDescriptor:inputWeights:hiddenWeights:peepholeWeights:biases:gateActivations:outputResultActivation:", v13, a5, a6, 0, a7, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v29, 4), v15);
}

- (id)createLSTM:(unint64_t)a3 outputSize:(unint64_t)a4
{
  v7 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:8];
  uint64_t v8 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:8];
  uint64_t v9 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:8];
  uint64_t v10 = 0;
  unint64_t v14 = a3;
  unint64_t v11 = a4 * a3;
  do
  {
    objc_msgSend(v7, "setObject:atIndexedSubscript:", objc_msgSend((id)getMLCTensorClass(), "tensorWithWidth:height:featureChannelCount:batchSize:randomInitializerType:", 1, 1, v11, 1, 2), v10);
    objc_msgSend(v8, "setObject:atIndexedSubscript:", objc_msgSend((id)getMLCTensorClass(), "tensorWithWidth:height:featureChannelCount:batchSize:randomInitializerType:", 1, 1, a4 * a4, 1, 2), v10);
    if ((v10 & 0x7FFFFFFFFFFFFFFBLL) == 1) {
      *(float *)&double v12 = 1.0;
    }
    else {
      *(float *)&double v12 = 0.0;
    }
    objc_msgSend(v9, "setObject:atIndexedSubscript:", objc_msgSend((id)getMLCTensorClass(), "tensorWithWidth:height:featureChannelCount:batchSize:data:", 1, 1, a4, 1, -[TransferSeqTagMLFHelper createDataWithFloatValue:count:](self, "createDataWithFloatValue:count:", a4, v12)), v10++);
  }
  while (v10 != 8);

  return [(TransferSeqTagMLFHelper *)self createLSTMFromWeights:v14 outputSize:a4 inputWeights:v7 hiddenWeights:v8 biasTerms:v9];
}

- (id)createConvLayerFromData:(unint64_t)a3 width:(unint64_t)a4 inputChannels:(unint64_t)a5 outputChannels:(unint64_t)a6 strideInX:(unint64_t)a7 strideInY:(unint64_t)a8 kernelWeight:(id)a9 kernelBias:(id)a10
{
  v26[2] = *MEMORY[0x1E4F143B8];
  uint64_t v14 = [(id)getMLCTensorDescriptorClass() convolutionWeightsDescriptorWithWidth:a4 height:a3 inputFeatureChannelCount:a5 outputFeatureChannelCount:a6 dataType:1];
  MLCTensorClass = (void *)getMLCTensorClass();
  uint64_t v16 = objc_msgSend(MLCTensorClass, "tensorWithDescriptor:data:", v14, objc_msgSend((id)getMLCTensorDataClass(), "dataWithBytesNoCopy:length:", objc_msgSend(a9, "mutableBytes"), objc_msgSend(a9, "length")));
  v17 = (void *)getMLCTensorClass();
  uint64_t v18 = objc_msgSend(v17, "tensorWithWidth:height:featureChannelCount:batchSize:data:", 1, 1, a6, 1, objc_msgSend((id)getMLCTensorDataClass(), "dataWithBytesNoCopy:length:", objc_msgSend(a10, "mutableBytes"), objc_msgSend(a10, "length")));
  MLCConvolutionDescriptorClass = (void *)getMLCConvolutionDescriptorClass();
  v26[0] = [NSNumber numberWithUnsignedInteger:a3];
  v26[1] = [NSNumber numberWithUnsignedInteger:a4];
  uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  v25[0] = [NSNumber numberWithUnsignedInteger:a8];
  v25[1] = [NSNumber numberWithUnsignedInteger:a7];
  LODWORD(v22) = 0;
  return (id)objc_msgSend((id)getMLCConvolutionLayerClass(), "layerWithWeights:biases:descriptor:", v16, v18, objc_msgSend(MLCConvolutionDescriptorClass, "descriptorWithKernelSizes:inputFeatureChannelCount:outputFeatureChannelCount:groupCount:strides:dilationRates:paddingPolicy:paddingSizes:", v20, a5, a6, 1, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v25, 2), &unk_1EE3B81D8, v22, &unk_1EE3B81F0));
}

- (id)createConvLayerWithKernelHeight:(unint64_t)a3 width:(unint64_t)a4 inputChannels:(unint64_t)a5 outputChannels:(unint64_t)a6 strideInX:(unint64_t)a7 strideInY:(unint64_t)a8
{
  v23[2] = *MEMORY[0x1E4F143B8];
  uint64_t v15 = [(id)getMLCTensorDescriptorClass() convolutionWeightsDescriptorWithWidth:a4 height:a3 inputFeatureChannelCount:a5 outputFeatureChannelCount:a6 dataType:1];
  uint64_t v16 = [(id)getMLCTensorClass() tensorWithDescriptor:v15 randomInitializerType:2];
  uint64_t v17 = objc_msgSend((id)getMLCTensorClass(), "tensorWithWidth:height:featureChannelCount:batchSize:data:", 1, 1, a6, 1, -[TransferSeqTagMLFHelper createDataWithFloatValue:count:](self, "createDataWithFloatValue:count:", a6, 0.0));
  MLCConvolutionDescriptorClass = (void *)getMLCConvolutionDescriptorClass();
  v23[0] = [NSNumber numberWithUnsignedInteger:a3];
  v23[1] = [NSNumber numberWithUnsignedInteger:a4];
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  v22[0] = [NSNumber numberWithUnsignedInteger:a8];
  v22[1] = [NSNumber numberWithUnsignedInteger:a7];
  LODWORD(v21) = 0;
  return (id)objc_msgSend((id)getMLCConvolutionLayerClass(), "layerWithWeights:biases:descriptor:", v16, v17, objc_msgSend(MLCConvolutionDescriptorClass, "descriptorWithKernelSizes:inputFeatureChannelCount:outputFeatureChannelCount:groupCount:strides:dilationRates:paddingPolicy:paddingSizes:", v19, a5, a6, 1, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v22, 2), &unk_1EE3B8208, v21, &unk_1EE3B8220));
}

- (id)createFullyConnectedLayerFromData:(unint64_t)a3 outputSize:(unint64_t)a4 weightData:(id)a5 biasData:(id)a6
{
  return [(TransferSeqTagMLFHelper *)self createConvLayerFromData:1 width:1 inputChannels:a3 outputChannels:a4 strideInX:1 strideInY:1 kernelWeight:a5 kernelBias:a6];
}

- (id)createFullyConnectedLayer:(unint64_t)a3 outputSize:(unint64_t)a4
{
  return [(TransferSeqTagMLFHelper *)self createConvLayerWithKernelHeight:1 width:1 inputChannels:a3 outputChannels:a4 strideInX:1 strideInY:1];
}

- (void)removeBatchingFromDataAndLabels:(void *)a3 batchedLabels:(void *)a4 inputSentences:(void *)a5 inputLabels:(void *)a6 maxLength:(int)a7
{
  uint64_t v7 = *(void *)a3;
  uint64_t v8 = *((void *)a3 + 1);
  if (v8 != *(void *)a3)
  {
    unint64_t v13 = 0;
    do
    {
      uint64_t v14 = *(void *)(v7 + 24 * v13);
      if (*(void *)(v7 + 24 * v13 + 8) != v14)
      {
        uint64_t v15 = 0;
        unint64_t v16 = 0;
        do
        {
          uint64_t v17 = *(long long **)(v14 + v15);
          int v18 = -1431655765 * ((*(void *)(v14 + v15 + 8) - (void)v17) >> 3);
          if (v18 >= a7) {
            int v18 = a7;
          }
          unint64_t v19 = v18;
          memset(&v23, 0, sizeof(v23));
          std::vector<std::string>::__init_with_size[abi:ne180100]<std::__wrap_iter<std::string*>,std::__wrap_iter<std::string*>>(&v23, v17, (long long *)((char *)v17 + 24 * v18), v18);
          std::vector<std::vector<std::string>>::push_back[abi:ne180100]((uint64_t *)a5, (uint64_t)&v23);
          v24 = &v23;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v24);
          uint64_t v20 = *(void *)(*(void *)(*(void *)a4 + 24 * v13) + v15);
          memset(&v23, 0, sizeof(v23));
          std::vector<std::vector<int>>::__init_with_size[abi:ne180100]<std::__wrap_iter<std::vector<int>*>,std::__wrap_iter<std::vector<int>*>>(&v23, v20, v20 + 24 * (int)v19, v19);
          std::vector<std::vector<std::vector<int>>>::push_back[abi:ne180100]((uint64_t *)a6, (uint64_t)&v23);
          v24 = &v23;
          std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v24);
          ++v16;
          uint64_t v7 = *(void *)a3;
          uint64_t v21 = (uint64_t *)(*(void *)a3 + 24 * v13);
          uint64_t v14 = *v21;
          v15 += 24;
        }
        while (0xAAAAAAAAAAAAAAABLL * ((v21[1] - *v21) >> 3) > v16);
        uint64_t v8 = *((void *)a3 + 1);
      }
      ++v13;
    }
    while (0xAAAAAAAAAAAAAAABLL * ((v8 - v7) >> 3) > v13);
  }
}

- (void)getNSSequenceFromStdSequence:(void *)a3 nsSentences:(id)a4 nsSeqLengths:(id)a5 maxLength:(int)a6
{
  id v16 = a4;
  if (*((void *)a3 + 1) != *(void *)a3)
  {
    unint64_t v8 = 0;
    unint64_t v9 = a6;
    do
    {
      uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v16);
      uint64_t v11 = *(void *)(*(void *)a3 + 24 * v8);
      if (*(void *)(*(void *)a3 + 24 * v8 + 8) != v11)
      {
        uint64_t v12 = 0;
        unint64_t v13 = 0;
        do
        {
          objc_msgSend(v10, "addObject:", objc_msgSend(NSString, "stringWithUTF8String:"));
          ++v13;
          v12 += 24;
        }
        while (0xAAAAAAAAAAAAAAABLL
              * ((uint64_t)(*(void *)(*(void *)a3 + 24 * v8 + 8) - *(void *)(*(void *)a3 + 24 * v8)) >> 3) > v13);
      }
      [v16 addObject:v10];
      unint64_t v14 = 0xAAAAAAAAAAAAAAABLL
          * ((uint64_t)(*(void *)(*(void *)a3 + 24 * v8 + 8) - *(void *)(*(void *)a3 + 24 * v8)) >> 3);
      if (v14 <= v9) {
        uint64_t v15 = v14;
      }
      else {
        uint64_t v15 = a6;
      }
      objc_msgSend(a5, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", v15));
      ++v8;
    }
    while (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3) > v8);
  }
}

- (void)flattenBatchOfOneHotSequences:(void *)a3 flattenedBatch:(void *)a4
{
  *((void *)a4 + 1) = *(void *)a4;
  uint64_t v5 = *(void *)a3;
  uint64_t v4 = *((void *)a3 + 1);
  if (v4 != *(void *)a3)
  {
    unint64_t v7 = 0;
    uint64_t v23 = (*(void *)(*(void *)v5 + 8) - **(void **)v5) >> 2;
    do
    {
      if ((int)v23 >= 1)
      {
        uint64_t v8 = 0;
        do
        {
          __p = 0;
          v26 = 0;
          v27 = 0;
          uint64_t v9 = *(void *)(*(void *)a3 + 24 * v7);
          if (*(void *)(*(void *)a3 + 24 * v7 + 8) == v9)
          {
            uint64_t v10 = 0;
            uint64_t v22 = 0;
          }
          else
          {
            uint64_t v10 = 0;
            unint64_t v11 = 0;
            do
            {
              uint64_t v12 = *(void *)(v9 + 24 * v11);
              if (v10 >= v27)
              {
                unint64_t v13 = __p;
                uint64_t v14 = v10 - __p;
                unint64_t v15 = v14 + 1;
                if ((unint64_t)(v14 + 1) >> 62) {
                  std::vector<CoreNLP::NLAttributedToken>::__throw_length_error[abi:ne180100]();
                }
                uint64_t v16 = (char *)v27 - (char *)__p;
                if (((char *)v27 - (char *)__p) >> 1 > v15) {
                  unint64_t v15 = v16 >> 1;
                }
                if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFFCLL) {
                  unint64_t v17 = 0x3FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v17 = v15;
                }
                if (v17)
                {
                  int v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v27, v17);
                  unint64_t v13 = __p;
                  uint64_t v10 = v26;
                }
                else
                {
                  int v18 = 0;
                }
                unint64_t v19 = (int *)&v18[4 * v14];
                *unint64_t v19 = *(_DWORD *)(v12 + 4 * v8);
                uint64_t v20 = v19 + 1;
                while (v10 != v13)
                {
                  int v21 = *--v10;
                  *--unint64_t v19 = v21;
                }
                __p = v19;
                v27 = (int *)&v18[4 * v17];
                if (v13) {
                  operator delete(v13);
                }
                uint64_t v10 = v20;
              }
              else
              {
                *v10++ = *(_DWORD *)(v12 + 4 * v8);
              }
              v26 = v10;
              ++v11;
              uint64_t v9 = *(void *)(*(void *)a3 + 24 * v7);
            }
            while (0xAAAAAAAAAAAAAAABLL * ((*(void *)(*(void *)a3 + 24 * v7 + 8) - v9) >> 3) > v11);
            uint64_t v22 = __p;
          }
          std::vector<float>::__insert_with_size[abi:ne180100]<std::__wrap_iter<int *>,std::__wrap_iter<int *>>((uint64_t)a4, *((char **)a4 + 1), v22, v10, v10 - v22);
          if (__p) {
            operator delete(__p);
          }
          ++v8;
        }
        while (v8 != v23);
        uint64_t v5 = *(void *)a3;
        uint64_t v4 = *((void *)a3 + 1);
      }
      ++v7;
    }
    while (0xAAAAAAAAAAAAAAABLL * ((v4 - v5) >> 3) > v7);
  }
}

- (id)findMaxIndexWithData:(id)a3 batchSize:(unint64_t)a4 sequenceLength:(unint64_t)a5 numClasses:(unint64_t)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  size_t v25 = 8 * a4 * a5;
  v26 = (char *)malloc_type_malloc(v25, 0xE01A531DuLL);
  uint64_t v10 = [a3 bytes];
  unint64_t v27 = a4;
  if (a4)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    unint64_t v13 = 8 * a5;
    unint64_t v14 = 4 * a5;
    do
    {
      if (a5)
      {
        bzero((char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * a5);
        memset_pattern16((char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), &unk_193172320, 4 * a5);
      }
      if (a6)
      {
        uint64_t v15 = 0;
        uint64_t v16 = (float *)v11;
        do
        {
          unint64_t v17 = v16;
          int v18 = (float *)((char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
          unint64_t v19 = (size_t *)((char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
          for (unint64_t i = a5; i; --i)
          {
            if (*v17 > *v18)
            {
              *int v18 = *v17;
              *unint64_t v19 = v15;
            }
            ++v19;
            ++v18;
            ++v17;
          }
          ++v15;
          uint64_t v16 = (float *)((char *)v16 + v14);
        }
        while (v15 != a6);
      }
      if (a5) {
        memcpy(&v26[v13 * v12], (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * a5);
      }
      ++v12;
      v11 += 4 * a6 * a5;
    }
    while (v12 != v27);
  }
  int v21 = (void *)MEMORY[0x1E4F1C9B8];
  size_t v23 = v25;
  uint64_t v22 = v26;

  return (id)[v21 dataWithBytesNoCopy:v22 length:v23 freeWhenDone:1];
}

- (void)getMaxIndicesFromOneHotVectors:(void *)a3 maxIndicesBatch:(void *)a4
{
  uint64_t v4 = *(void *)a3;
  if (*((void *)a3 + 1) != *(void *)a3)
  {
    unint64_t v6 = 0;
    do
    {
      __p = 0;
      v36 = 0;
      v37 = 0;
      uint64_t v8 = (uint64_t *)(v4 + 24 * v6);
      uint64_t v7 = *v8;
      if (v8[1] != *v8)
      {
        unint64_t v9 = 0;
        do
        {
          v32 = 0;
          v33 = 0;
          uint64_t v34 = 0;
          std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&v32, *(const void **)(v7 + 24 * v9), *(void *)(v7 + 24 * v9 + 8), (uint64_t)(*(void *)(v7 + 24 * v9 + 8) - *(void *)(v7 + 24 * v9)) >> 2);
          uint64_t v10 = (char *)v32 + 4;
          BOOL v11 = v32 == v33 || v10 == v33;
          uint64_t v12 = v32;
          if (!v11)
          {
            int v13 = *(_DWORD *)v32;
            uint64_t v12 = v32;
            unint64_t v14 = (char *)v32 + 4;
            do
            {
              int v16 = *(_DWORD *)v14;
              v14 += 4;
              int v15 = v16;
              BOOL v17 = v13 < v16;
              if (v13 <= v16) {
                int v13 = v15;
              }
              if (v17) {
                uint64_t v12 = v10;
              }
              uint64_t v10 = v14;
            }
            while (v14 != v33);
          }
          unint64_t v18 = (unint64_t)(v12 - (unsigned char *)v32) >> 2;
          unint64_t v19 = v36;
          if (v36 >= v37)
          {
            int v21 = (char *)__p;
            uint64_t v22 = (v36 - (unsigned char *)__p) >> 2;
            unint64_t v23 = v22 + 1;
            if ((unint64_t)(v22 + 1) >> 62) {
              std::vector<CoreNLP::NLAttributedToken>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v24 = v37 - (unsigned char *)__p;
            if ((v37 - (unsigned char *)__p) >> 1 > v23) {
              unint64_t v23 = v24 >> 1;
            }
            if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v25 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v25 = v23;
            }
            if (v25)
            {
              v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v37, v25);
              int v21 = (char *)__p;
              unint64_t v19 = v36;
            }
            else
            {
              v26 = 0;
            }
            unint64_t v27 = &v26[4 * v22];
            *(_DWORD *)unint64_t v27 = v18;
            uint64_t v20 = v27 + 4;
            while (v19 != v21)
            {
              int v28 = *((_DWORD *)v19 - 1);
              v19 -= 4;
              *((_DWORD *)v27 - 1) = v28;
              v27 -= 4;
            }
            __p = v27;
            v36 = v20;
            v37 = &v26[4 * v25];
            if (v21) {
              operator delete(v21);
            }
          }
          else
          {
            *(_DWORD *)v36 = v18;
            uint64_t v20 = v19 + 4;
          }
          v36 = v20;
          if (v32)
          {
            v33 = (char *)v32;
            operator delete(v32);
          }
          ++v9;
          uint64_t v7 = *(void *)(*(void *)a3 + 24 * v6);
        }
        while (0xAAAAAAAAAAAAAAABLL * ((*(void *)(*(void *)a3 + 24 * v6 + 8) - v7) >> 3) > v9);
      }
      unint64_t v29 = *((void *)a4 + 1);
      if (v29 >= *((void *)a4 + 2))
      {
        uint64_t v30 = std::vector<std::vector<int>>::__push_back_slow_path<std::vector<int> const&>((uint64_t *)a4, (uint64_t)&__p);
      }
      else
      {
        std::vector<std::vector<int>>::__construct_one_at_end[abi:ne180100]<std::vector<int> const&>((uint64_t)a4, (uint64_t)&__p);
        uint64_t v30 = v29 + 24;
      }
      *((void *)a4 + 1) = v30;
      if (__p)
      {
        v36 = (char *)__p;
        operator delete(__p);
      }
      ++v6;
      uint64_t v4 = *(void *)a3;
    }
    while (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3) > v6);
  }
}

- (void)printLstmWeights:(id)a3
{
  v36[3] = *MEMORY[0x1E4F143B8];
  BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
  if (v4) {
    -[TransferSeqTagMLFHelper printLstmWeights:].cold.6(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  if (objc_msgSend((id)objc_msgSend(a3, "inputWeights"), "count"))
  {
    unint64_t v12 = 0;
    unint64_t v27 = &v35;
    int v13 = MEMORY[0x1E4F14500];
    do
    {
      v36[0] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "inputWeights", v27), "objectAtIndexedSubscript:", v12), "data");
      v36[1] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "hiddenWeights"), "objectAtIndexedSubscript:", v12), "data");
      v36[2] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "biases"), "objectAtIndexedSubscript:", v12), "data");
      unint64_t v14 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:3];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[TransferSeqTagMLFHelper printLstmWeights:].cold.5(&v28, v29);
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        [(TransferSeqTagMLFHelper *)v34 printLstmWeights:v27];
      }
      if ([v14 count])
      {
        unint64_t v15 = 0;
        do
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
            [(TransferSeqTagMLFHelper *)v32 printLstmWeights:&v33];
          }
          int v16 = (void *)[v14 objectAtIndexedSubscript:v15];
          if ((unint64_t)[v16 length] >= 4)
          {
            unint64_t v17 = 0;
            do
            {
              uint64_t v18 = [v16 bytes];
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
                -[TransferSeqTagMLFHelper printLstmWeights:](v18, v17, buf, &v31);
              }
              ++v17;
            }
            while (v17 < (unint64_t)[v16 length] >> 2);
          }
          ++v15;
        }
        while ([v14 count] > v15);
      }
      ++v12;
    }
    while (v12 < objc_msgSend((id)objc_msgSend(a3, "inputWeights"), "count"));
  }
  BOOL v19 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
  if (v19) {
    -[TransferSeqTagMLFHelper printLstmWeights:](v19, v20, v21, v22, v23, v24, v25, v26);
  }
}

- (void)getEmbeddingsForSequenceData:(void *)a3 batchSize:(int)a4 maxLength:(int)a5 embeddingRef:(void *)a6 inputTensorDataItems:(void *)a7
{
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = *(void *)&a4;
  uint64_t v13 = a4;
  unint64_t v14 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:a4];
  -[TransferSeqTagMLFHelper getNSSequenceFromStdSequence:nsSentences:nsSeqLengths:maxLength:](self, "getNSSequenceFromStdSequence:nsSentences:nsSeqLengths:maxLength:", a3, v14, [MEMORY[0x1E4F1CA48] arrayWithCapacity:v13], v9);
  unint64_t Dimension = (unint64_t)NLStringEmbeddingGetDimension((CoreNLP *)a6, v15);
  LODWORD(__p[0]) = 0;
  std::vector<float>::vector(&v21, (int)v9 * (uint64_t)(int)v10 * Dimension, __p);
  int v19 = 0;
  std::vector<float>::vector(__p, Dimension, &v19);
  NLStringEmbeddingFillWordVectorsWithShape((CoreNLP *)a6, v14, v10, v9, v21, 0, (uint64_t)__p[0], 1);
  unint64_t v17 = malloc_type_malloc(v22 - (unsigned char *)v21, 0x100004052888210uLL);
  memcpy(v17, v21, v22 - (unsigned char *)v21);
  uint64_t v18 = (void *)[MEMORY[0x1E4F1CA58] dataWithBytesNoCopy:v17 length:v22 - (unsigned char *)v21 freeWhenDone:1];
  **(void **)a7 = objc_msgSend((id)getMLCTensorDataClass(), "dataWithBytesNoCopy:length:", objc_msgSend(v18, "mutableBytes"), objc_msgSend(v18, "length"));
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v21)
  {
    uint64_t v22 = v21;
    operator delete(v21);
  }
}

- (void)getInputEmbeddingsAndTargetTensorsForSequenceData:(void *)a3 seqLabels:(void *)a4 batchSize:(int)a5 maxLength:(int)a6 numClasses:(int)a7 embeddingRef:(void *)a8 inputTensorDataItems:(void *)a9 targetTensorData:(id *)a10 targetWeightTensorData:(id *)a11
{
  [(TransferSeqTagMLFHelper *)self getEmbeddingsForSequenceData:a3 batchSize:*(void *)&a5 maxLength:*(void *)&a6 embeddingRef:a8 inputTensorDataItems:a9];
  uint64_t v35 = 0;
  v36 = 0;
  unint64_t v37 = 0;
  LODWORD(__x.__begin_) = 1;
  std::vector<int>::vector(&v34, a7, (const std::vector<int>::value_type *)&__x);
  v30[0] = 0;
  std::vector<int>::vector(&__x, a7, v30);
  uint64_t v16 = *(void *)a3;
  if (*((void *)a3 + 1) != *(void *)a3)
  {
    uint64_t v17 = 0;
    unint64_t v18 = 0;
    do
    {
      *(void *)uint64_t v30 = 0;
      uint64_t v31 = 0;
      uint64_t v32 = 0;
      std::vector<std::vector<int>>::assign((uint64_t *)v30, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v16 + v17 + 8) - *(void *)(v16 + v17)) >> 3), (uint64_t)&v34);
      std::vector<std::vector<int>>::resize((uint64_t *)v30, a6, (uint64_t)&__x);
      int v19 = v36;
      if ((unint64_t)v36 >= v37)
      {
        uint64_t v20 = std::vector<std::vector<std::vector<int>>>::__push_back_slow_path<std::vector<std::vector<int>> const&>(&v35, (uint64_t *)v30);
      }
      else
      {
        void *v36 = 0;
        v19[1] = 0;
        v19[2] = 0;
        std::vector<std::vector<int>>::__init_with_size[abi:ne180100]<std::vector<int>*,std::vector<int>*>(v19, *(uint64_t *)v30, v31, 0xAAAAAAAAAAAAAAABLL * ((v31 - *(void *)v30) >> 3));
        uint64_t v20 = (uint64_t)(v19 + 3);
      }
      v36 = (void *)v20;
      __p = v30;
      std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
      ++v18;
      uint64_t v16 = *(void *)a3;
      v17 += 24;
    }
    while (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3) > v18);
  }
  *(void *)uint64_t v30 = 0;
  uint64_t v31 = 0;
  uint64_t v32 = 0;
  [(TransferSeqTagMLFHelper *)self flattenBatchOfOneHotSequences:a4 flattenedBatch:v30];
  uint64_t v21 = v31 - *(void *)v30;
  uint64_t v22 = malloc_type_malloc(v31 - *(void *)v30, 0x54A998BBuLL);
  memcpy(v22, *(const void **)v30, v31 - *(void *)v30);
  uint64_t v23 = (void *)[MEMORY[0x1E4F1CA58] dataWithBytesNoCopy:v22 length:v21 freeWhenDone:1];
  *a10 = (id)objc_msgSend((id)getMLCTensorDataClass(), "dataWithBytesNoCopy:length:", objc_msgSend(v23, "mutableBytes"), objc_msgSend(v23, "length"));
  __p = 0;
  char v28 = 0;
  uint64_t v29 = 0;
  [(TransferSeqTagMLFHelper *)self flattenBatchOfOneHotSequences:&v35 flattenedBatch:&__p];
  int64_t v24 = v28 - (unsigned char *)__p;
  uint64_t v25 = malloc_type_malloc(v28 - (unsigned char *)__p, 0x558BA8AFuLL);
  memcpy(v25, __p, v28 - (unsigned char *)__p);
  uint64_t v26 = (void *)[MEMORY[0x1E4F1CA58] dataWithBytesNoCopy:v25 length:v24 freeWhenDone:1];
  *a11 = (id)objc_msgSend((id)getMLCTensorDataClass(), "dataWithBytesNoCopy:length:", objc_msgSend(v26, "mutableBytes"), objc_msgSend(v26, "length"));
  if (__p)
  {
    char v28 = __p;
    operator delete(__p);
  }
  if (*(void *)v30)
  {
    uint64_t v31 = *(void *)v30;
    operator delete(*(void **)v30);
  }
  if (__x.__begin_)
  {
    __x.__end_ = __x.__begin_;
    operator delete(__x.__begin_);
  }
  if (v34.__begin_)
  {
    v34.__end_ = v34.__begin_;
    operator delete(v34.__begin_);
  }
  v34.__begin_ = (std::vector<int>::pointer)&v35;
  std::vector<std::vector<std::vector<int>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v34);
}

- (id)getModelLayerWeights:(vector<void *)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = *a3->var0;
  uint64_t v5 = (void *)*((void *)a3->var0 + 1);
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA58], "data", v4);
  uint64_t v8 = (void *)[MEMORY[0x1E4F1CA58] data];
  uint64_t v9 = (void *)[MEMORY[0x1E4F1CA58] data];
  uint64_t v10 = (void *)[MEMORY[0x1E4F1CA58] data];
  uint64_t v11 = (void *)[MEMORY[0x1E4F1CA58] data];
  unint64_t v12 = (void *)[MEMORY[0x1E4F1CA58] data];
  for (uint64_t i = 0; i != 4; ++i)
  {
    objc_msgSend(v7, "appendData:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "biases"), "objectAtIndexedSubscript:", i), "data"));
    objc_msgSend(v8, "appendData:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "inputWeights"), "objectAtIndexedSubscript:", i), "data"));
    objc_msgSend(v9, "appendData:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "hiddenWeights"), "objectAtIndexedSubscript:", i), "data"));
    objc_msgSend(v10, "appendData:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "biases"), "objectAtIndexedSubscript:", i + 4), "data"));
    objc_msgSend(v11, "appendData:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "inputWeights"), "objectAtIndexedSubscript:", i + 4), "data"));
    objc_msgSend(v12, "appendData:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "hiddenWeights"), "objectAtIndexedSubscript:", i + 4), "data"));
  }
  unint64_t v14 = (unint64_t)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "biases"), "objectAtIndexedSubscript:", 0), "data"), "length") >> 1;
  memset(v18, 0, sizeof(v18));
  bzero(__src, 0x2C0uLL);
  __src[0] = 6;
  __src[15] |= 0x80uLL;
  LODWORD(__src[16]) = v14;
  if ((v14 & 0x80000000) == 0) {
    int v15 = v14;
  }
  else {
    int v15 = v14 + 1;
  }
  LODWORD(__src[32]) = v15 >> 1;
  __src[56] = [v8 bytes];
  __src[57] = [v9 bytes];
  __src[72] = [v7 bytes];
  __src[58] = [v11 bytes];
  __src[59] = [v12 bytes];
  __src[74] = [v10 bytes];
  std::string::basic_string[abi:ne180100]<0>(&v19, "lstm");
  memcpy(v21, __src, sizeof(v21));
  std::vector<std::pair<std::string,MRLNeuralNetworkNodeParameter>>::push_back[abi:ne180100](v18, &v19);
  if (v20 < 0) {
    operator delete((void *)v19);
  }
  bzero(__src, 0x2C0uLL);
  __src[0] = 0;
  __src[7] = 4;
  LODWORD(__src[16]) = v14;
  LODWORD(__src[32]) = (unint64_t)(int)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "biases"), "data"), "length") >> 2;
  __src[56] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "weights"), "data"), "bytes");
  __src[72] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "biases"), "data"), "bytes");
  std::string::basic_string[abi:ne180100]<0>(&v19, "softmax");
  memcpy(v21, __src, sizeof(v21));
  std::vector<std::pair<std::string,MRLNeuralNetworkNodeParameter>>::push_back[abi:ne180100](v18, &v19);
  if (v20 < 0) {
    operator delete((void *)v19);
  }
  operator new();
}

- (BOOL)loadModelLayersFromWeights:(id)a3 labelSize:(unint64_t)a4 embeddingDimension:(int64_t)a5 modelLayers:(void *)a6
{
  int v6 = a5;
  v56 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:8];
  v55 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:8];
  uint64_t v8 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:8];
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  if (v6 >= 0) {
    int v11 = v6;
  }
  else {
    int v11 = v6 + 1;
  }
  int v52 = v6;
  uint64_t v12 = (v11 >> 1) * v6;
  uint64_t v13 = ((v11 >> 1) * (v11 >> 1));
  uint64_t v57 = (uint64_t)v11 >> 1;
  do
  {
    unint64_t v14 = (void *)[MEMORY[0x1E4F1CA48] array];
    for (uint64_t i = 0; i != 3; ++i)
      objc_msgSend(v14, "addObject:", objc_msgSend(a3, "objectAtIndexedSubscript:", v9 + i));
    MLCTensorClass = (void *)getMLCTensorClass();
    objc_msgSend(v56, "setObject:atIndexedSubscript:", objc_msgSend(MLCTensorClass, "tensorWithWidth:height:featureChannelCount:batchSize:data:", 1, 1, v12, 1, objc_msgSend((id)getMLCTensorDataClass(), "dataWithBytesNoCopy:length:", objc_msgSend((id)objc_msgSend(v14, "objectAtIndexedSubscript:", 0), "mutableBytes"), objc_msgSend((id)objc_msgSend(v14, "objectAtIndexedSubscript:", 0), "length"))), v10);
    uint64_t v17 = (void *)getMLCTensorClass();
    objc_msgSend(v55, "setObject:atIndexedSubscript:", objc_msgSend(v17, "tensorWithWidth:height:featureChannelCount:batchSize:data:", 1, 1, v13, 1, objc_msgSend((id)getMLCTensorDataClass(), "dataWithBytesNoCopy:length:", objc_msgSend((id)objc_msgSend(v14, "objectAtIndexedSubscript:", 1), "mutableBytes"), objc_msgSend((id)objc_msgSend(v14, "objectAtIndexedSubscript:", 1), "length"))), v10);
    unint64_t v18 = (void *)getMLCTensorClass();
    objc_msgSend(v8, "setObject:atIndexedSubscript:", objc_msgSend(v18, "tensorWithWidth:height:featureChannelCount:batchSize:data:", 1, 1, v57, 1, objc_msgSend((id)getMLCTensorDataClass(), "dataWithBytesNoCopy:length:", objc_msgSend((id)objc_msgSend(v14, "objectAtIndexedSubscript:", 2), "mutableBytes"), objc_msgSend((id)objc_msgSend(v14, "objectAtIndexedSubscript:", 2), "length"))), v10++);
    v9 += 3;
  }
  while (v10 != 8);
  id v19 = [(TransferSeqTagMLFHelper *)self createLSTMFromWeights:v52 outputSize:v57 inputWeights:v56 hiddenWeights:v55 biasTerms:v8];
  uint64_t v20 = [v19 descriptor];
  BOOL v21 = v20 != 0;
  if (v20)
  {
    unint64_t v22 = *((void *)a6 + 2);
    uint64_t v23 = (void *)*((void *)a6 + 1);
    if ((unint64_t)v23 >= v22)
    {
      uint64_t v25 = ((uint64_t)v23 - *(void *)a6) >> 3;
      if ((unint64_t)(v25 + 1) >> 61) {
        goto LABEL_46;
      }
      uint64_t v26 = v22 - *(void *)a6;
      uint64_t v27 = v26 >> 2;
      if (v26 >> 2 <= (unint64_t)(v25 + 1)) {
        uint64_t v27 = v25 + 1;
      }
      if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v28 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v28 = v27;
      }
      if (v28) {
        uint64_t v29 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a6 + 16, v28);
      }
      else {
        uint64_t v29 = 0;
      }
      uint64_t v30 = &v29[8 * v25];
      uint64_t v31 = &v29[8 * v28];
      *(void *)uint64_t v30 = v19;
      int64_t v24 = v30 + 8;
      uint64_t v33 = *(char **)a6;
      uint64_t v32 = (char *)*((void *)a6 + 1);
      if (v32 != *(char **)a6)
      {
        do
        {
          uint64_t v34 = *((void *)v32 - 1);
          v32 -= 8;
          *((void *)v30 - 1) = v34;
          v30 -= 8;
        }
        while (v32 != v33);
        uint64_t v32 = *(char **)a6;
      }
      *(void *)a6 = v30;
      *((void *)a6 + 1) = v24;
      *((void *)a6 + 2) = v31;
      if (v32) {
        operator delete(v32);
      }
    }
    else
    {
      *uint64_t v23 = v19;
      int64_t v24 = v23 + 1;
    }
    *((void *)a6 + 1) = v24;
  }
  uint64_t v35 = (void *)[MEMORY[0x1E4F1CA48] array];
  objc_msgSend(v35, "addObject:", objc_msgSend(a3, "objectAtIndexedSubscript:", 24));
  objc_msgSend(v35, "addObject:", objc_msgSend(a3, "objectAtIndexedSubscript:", 25));
  id v36 = -[TransferSeqTagMLFHelper createFullyConnectedLayerFromData:outputSize:weightData:biasData:](self, "createFullyConnectedLayerFromData:outputSize:weightData:biasData:", 2 * (int)v57, a4, [v35 objectAtIndexedSubscript:0], objc_msgSend(v35, "objectAtIndexedSubscript:", 1));
  if ([v36 descriptor])
  {
    unint64_t v37 = *((void *)a6 + 2);
    v38 = (void *)*((void *)a6 + 1);
    if ((unint64_t)v38 < v37)
    {
      void *v38 = v36;
      v39 = v38 + 1;
LABEL_44:
      *((void *)a6 + 1) = v39;
      return v21;
    }
    uint64_t v40 = ((uint64_t)v38 - *(void *)a6) >> 3;
    if (!((unint64_t)(v40 + 1) >> 61))
    {
      uint64_t v41 = v37 - *(void *)a6;
      uint64_t v42 = v41 >> 2;
      if (v41 >> 2 <= (unint64_t)(v40 + 1)) {
        uint64_t v42 = v40 + 1;
      }
      if ((unint64_t)v41 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v43 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v43 = v42;
      }
      if (v43) {
        v44 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a6 + 16, v43);
      }
      else {
        v44 = 0;
      }
      v45 = &v44[8 * v40];
      v46 = &v44[8 * v43];
      *(void *)v45 = v36;
      v39 = v45 + 8;
      v48 = *(char **)a6;
      v47 = (char *)*((void *)a6 + 1);
      if (v47 != *(char **)a6)
      {
        do
        {
          uint64_t v49 = *((void *)v47 - 1);
          v47 -= 8;
          *((void *)v45 - 1) = v49;
          v45 -= 8;
        }
        while (v47 != v48);
        v47 = *(char **)a6;
      }
      *(void *)a6 = v45;
      *((void *)a6 + 1) = v39;
      *((void *)a6 + 2) = v46;
      if (v47) {
        operator delete(v47);
      }
      goto LABEL_44;
    }
LABEL_46:
    std::vector<CoreNLP::NLAttributedToken>::__throw_length_error[abi:ne180100]();
  }
  return 0;
}

- (id)createGraphObjectFromLayers:(void *)a3 graphObject:(id)a4 inputPlaceholders:(void *)a5
{
  __p = 0;
  int v5 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  do
  {
    uint64_t v36 = 0;
    unint64_t v37 = &v36;
    uint64_t v38 = 0x3052000000;
    v39 = __Block_byref_object_copy__159;
    uint64_t v40 = __Block_byref_object_dispose__160;
    int v6 = (void *)getMLCArithmeticLayerClass(void)::softClass;
    uint64_t v41 = getMLCArithmeticLayerClass(void)::softClass;
    if (!getMLCArithmeticLayerClass(void)::softClass)
    {
      uint64_t v31 = MEMORY[0x1E4F143A8];
      uint64_t v32 = 3221225472;
      uint64_t v33 = ___ZL26getMLCArithmeticLayerClassv_block_invoke;
      uint64_t v34 = &unk_1E574B6F0;
      uint64_t v35 = &v36;
      ___ZL26getMLCArithmeticLayerClassv_block_invoke((uint64_t)&v31);
      int v6 = (void *)v37[5];
    }
    _Block_object_dispose(&v36, 8);
    uint64_t v7 = [v6 layerWithOperation:2];
    uint64_t v8 = v7;
    if (v29 >= v30)
    {
      uint64_t v10 = v29 - __p;
      if ((unint64_t)(v10 + 1) >> 61) {
        std::vector<CoreNLP::NLAttributedToken>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v11 = ((char *)v30 - (char *)__p) >> 2;
      if (v11 <= v10 + 1) {
        unint64_t v11 = v10 + 1;
      }
      if ((unint64_t)((char *)v30 - (char *)__p) >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v12 = v11;
      }
      if (v12) {
        uint64_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v30, v12);
      }
      else {
        uint64_t v13 = 0;
      }
      unint64_t v14 = (uint64_t *)&v13[8 * v10];
      *unint64_t v14 = v8;
      uint64_t v9 = v14 + 1;
      int v15 = v29;
      if (v29 != __p)
      {
        do
        {
          uint64_t v16 = *--v15;
          *--unint64_t v14 = v16;
        }
        while (v15 != __p);
        int v15 = __p;
      }
      __p = v14;
      uint64_t v30 = (uint64_t *)&v13[8 * v12];
      if (v15) {
        operator delete(v15);
      }
    }
    else
    {
      *uint64_t v29 = v7;
      uint64_t v9 = v29 + 1;
    }
    uint64_t v29 = v9;
    ++v5;
  }
  while (v5 != 3);
  uint64_t v17 = **(void **)a5;
  uint64_t v18 = **(void **)a3;
  unsigned int v19 = time(0);
  srand(v19);
  int v20 = rand();
  uint64_t v36 = 0;
  unint64_t v37 = &v36;
  uint64_t v38 = 0x3052000000;
  v39 = __Block_byref_object_copy__159;
  uint64_t v40 = __Block_byref_object_dispose__160;
  BOOL v21 = (void *)getMLCDropoutLayerClass(void)::softClass;
  uint64_t v41 = getMLCDropoutLayerClass(void)::softClass;
  if (!getMLCDropoutLayerClass(void)::softClass)
  {
    uint64_t v31 = MEMORY[0x1E4F143A8];
    uint64_t v32 = 3221225472;
    uint64_t v33 = ___ZL23getMLCDropoutLayerClassv_block_invoke;
    uint64_t v34 = &unk_1E574B6F0;
    uint64_t v35 = &v36;
    ___ZL23getMLCDropoutLayerClassv_block_invoke((uint64_t)&v31);
    BOOL v21 = (void *)v37[5];
  }
  _Block_object_dispose(&v36, 8);
  LODWORD(v22) = 1045220557;
  uint64_t v23 = objc_msgSend(a4, "nodeWithLayer:source:", *(void *)(*(void *)a3 + 8), objc_msgSend(a4, "nodeWithLayer:source:", objc_msgSend(v21, "layerWithRate:seed:", v20, v22), objc_msgSend(a4, "nodeWithLayer:source:", v18, v17)));
  if (__p) {
    operator delete(__p);
  }
  return v23;
}

- (void)createGraphObjectAndLayersFromInputPlaceholders:(void *)a3 scalarWeights:(void *)a4 labelSize:(unint64_t)a5 embeddingDimension:(int64_t)a6 graphObject:(id)a7 graphLayerList:(void *)a8
{
  int v9 = a6;
  uint64_t v11 = *(void *)a4;
  if (*((void *)a4 + 1) != *(void *)a4)
  {
    unint64_t v13 = 0;
    unint64_t v14 = (char *)a8 + 16;
    int v15 = (void *)*((void *)a8 + 1);
    do
    {
      uint64_t v16 = *(void *)(v11 + 8 * v13);
      if ((unint64_t)v15 >= *v14)
      {
        uint64_t v17 = ((uint64_t)v15 - *(void *)a8) >> 3;
        if ((unint64_t)(v17 + 1) >> 61) {
          goto LABEL_72;
        }
        uint64_t v18 = *v14 - *(void *)a8;
        uint64_t v19 = v18 >> 2;
        if (v18 >> 2 <= (unint64_t)(v17 + 1)) {
          uint64_t v19 = v17 + 1;
        }
        if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v20 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v20 = v19;
        }
        if (v20) {
          BOOL v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a8 + 16, v20);
        }
        else {
          BOOL v21 = 0;
        }
        double v22 = &v21[8 * v17];
        *(void *)double v22 = v16;
        int v15 = v22 + 8;
        int64_t v24 = *(char **)a8;
        uint64_t v23 = (char *)*((void *)a8 + 1);
        if (v23 != *(char **)a8)
        {
          do
          {
            uint64_t v25 = *((void *)v23 - 1);
            v23 -= 8;
            *((void *)v22 - 1) = v25;
            v22 -= 8;
          }
          while (v23 != v24);
          uint64_t v23 = *(char **)a8;
        }
        *(void *)a8 = v22;
        *((void *)a8 + 1) = v15;
        *((void *)a8 + 2) = &v21[8 * v20];
        if (v23) {
          operator delete(v23);
        }
      }
      else
      {
        *v15++ = v16;
      }
      *((void *)a8 + 1) = v15;
      ++v13;
      uint64_t v11 = *(void *)a4;
    }
    while (v13 < (uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 3);
  }
  if (v9 >= 0) {
    int v26 = v9;
  }
  else {
    int v26 = v9 + 1;
  }
  id v27 = [(TransferSeqTagMLFHelper *)self createLSTM:v9 outputSize:(uint64_t)v26 >> 1];
  id v28 = v27;
  unint64_t v29 = *((void *)a8 + 2);
  uint64_t v30 = (void *)*((void *)a8 + 1);
  if ((unint64_t)v30 >= v29)
  {
    uint64_t v32 = ((uint64_t)v30 - *(void *)a8) >> 3;
    if ((unint64_t)(v32 + 1) >> 61) {
      goto LABEL_72;
    }
    uint64_t v33 = v29 - *(void *)a8;
    uint64_t v34 = v33 >> 2;
    if (v33 >> 2 <= (unint64_t)(v32 + 1)) {
      uint64_t v34 = v32 + 1;
    }
    if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v35 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v35 = v34;
    }
    if (v35) {
      uint64_t v36 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a8 + 16, v35);
    }
    else {
      uint64_t v36 = 0;
    }
    unint64_t v37 = &v36[8 * v32];
    uint64_t v38 = &v36[8 * v35];
    *(void *)unint64_t v37 = v28;
    uint64_t v31 = v37 + 8;
    uint64_t v40 = *(char **)a8;
    v39 = (char *)*((void *)a8 + 1);
    if (v39 != *(char **)a8)
    {
      do
      {
        uint64_t v41 = *((void *)v39 - 1);
        v39 -= 8;
        *((void *)v37 - 1) = v41;
        v37 -= 8;
      }
      while (v39 != v40);
      v39 = *(char **)a8;
    }
    *(void *)a8 = v37;
    *((void *)a8 + 1) = v31;
    *((void *)a8 + 2) = v38;
    if (v39) {
      operator delete(v39);
    }
  }
  else
  {
    *uint64_t v30 = v27;
    uint64_t v31 = v30 + 1;
  }
  *((void *)a8 + 1) = v31;
  id v42 = [(TransferSeqTagMLFHelper *)self createFullyConnectedLayer:(int)(v26 & 0xFFFFFFFE) outputSize:a5];
  id v43 = v42;
  v45 = (void *)*((void *)a8 + 1);
  unint64_t v44 = *((void *)a8 + 2);
  if ((unint64_t)v45 >= v44)
  {
    uint64_t v47 = ((uint64_t)v45 - *(void *)a8) >> 3;
    if ((unint64_t)(v47 + 1) >> 61) {
      goto LABEL_72;
    }
    uint64_t v48 = v44 - *(void *)a8;
    uint64_t v49 = v48 >> 2;
    if (v48 >> 2 <= (unint64_t)(v47 + 1)) {
      uint64_t v49 = v47 + 1;
    }
    if ((unint64_t)v48 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v50 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v50 = v49;
    }
    if (v50) {
      v51 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a8 + 16, v50);
    }
    else {
      v51 = 0;
    }
    int v52 = &v51[8 * v47];
    v53 = &v51[8 * v50];
    *(void *)int v52 = v43;
    v46 = v52 + 8;
    v55 = *(char **)a8;
    v54 = (char *)*((void *)a8 + 1);
    if (v54 != *(char **)a8)
    {
      do
      {
        uint64_t v56 = *((void *)v54 - 1);
        v54 -= 8;
        *((void *)v52 - 1) = v56;
        v52 -= 8;
      }
      while (v54 != v55);
      v54 = *(char **)a8;
    }
    *(void *)a8 = v52;
    *((void *)a8 + 1) = v46;
    *((void *)a8 + 2) = v53;
    if (v54) {
      operator delete(v54);
    }
  }
  else
  {
    void *v45 = v42;
    v46 = v45 + 1;
  }
  *((void *)a8 + 1) = v46;
  id v57 = [(TransferSeqTagMLFHelper *)self createGraphObjectFromLayers:a8 graphObject:a7 inputPlaceholders:a3];
  id v58 = v57;
  v60 = (void *)*((void *)a8 + 1);
  unint64_t v59 = *((void *)a8 + 2);
  if ((unint64_t)v60 < v59)
  {
    void *v60 = v57;
    v61 = v60 + 1;
    goto LABEL_71;
  }
  uint64_t v62 = ((uint64_t)v60 - *(void *)a8) >> 3;
  if ((unint64_t)(v62 + 1) >> 61) {
LABEL_72:
  }
    std::vector<CoreNLP::NLAttributedToken>::__throw_length_error[abi:ne180100]();
  uint64_t v63 = v59 - *(void *)a8;
  uint64_t v64 = v63 >> 2;
  if (v63 >> 2 <= (unint64_t)(v62 + 1)) {
    uint64_t v64 = v62 + 1;
  }
  if ((unint64_t)v63 >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v65 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v65 = v64;
  }
  if (v65) {
    v66 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)a8 + 16, v65);
  }
  else {
    v66 = 0;
  }
  v67 = &v66[8 * v62];
  v68 = &v66[8 * v65];
  *(void *)v67 = v58;
  v61 = v67 + 8;
  v70 = *(char **)a8;
  v69 = (char *)*((void *)a8 + 1);
  if (v69 != *(char **)a8)
  {
    do
    {
      uint64_t v71 = *((void *)v69 - 1);
      v69 -= 8;
      *((void *)v67 - 1) = v71;
      v67 -= 8;
    }
    while (v69 != v70);
    v69 = *(char **)a8;
  }
  *(void *)a8 = v67;
  *((void *)a8 + 1) = v61;
  *((void *)a8 + 2) = v68;
  if (v69) {
    operator delete(v69);
  }
LABEL_71:
  *((void *)a8 + 1) = v61;
}

- (id)createTrainingGraphFromGraphObject:(id)a3 inputPlaceholders:(void *)a4 scalarWeights:(void *)a5 targetLabels:(id)a6 targeLabelWeights:(id)a7 device:(id)a8
{
  v55[1] = *MEMORY[0x1E4F143B8];
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3052000000;
  uint64_t v48 = __Block_byref_object_copy__159;
  uint64_t v49 = __Block_byref_object_dispose__160;
  unint64_t v12 = (void *)getMLCLossDescriptorClass(void)::softClass;
  uint64_t v50 = getMLCLossDescriptorClass(void)::softClass;
  if (!getMLCLossDescriptorClass(void)::softClass)
  {
    uint64_t v40 = MEMORY[0x1E4F143A8];
    uint64_t v41 = 3221225472;
    id v42 = ___ZL25getMLCLossDescriptorClassv_block_invoke;
    id v43 = &unk_1E574B6F0;
    unint64_t v44 = &v45;
    ___ZL25getMLCLossDescriptorClassv_block_invoke((uint64_t)&v40);
    unint64_t v12 = (void *)v46[5];
  }
  id v36 = a8;
  _Block_object_dispose(&v45, 8);
  uint64_t v13 = [v12 descriptorWithType:2 reductionType:2];
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3052000000;
  uint64_t v48 = __Block_byref_object_copy__159;
  uint64_t v49 = __Block_byref_object_dispose__160;
  unint64_t v14 = (void *)getMLCLossLayerClass(void)::softClass;
  uint64_t v50 = getMLCLossLayerClass(void)::softClass;
  if (!getMLCLossLayerClass(void)::softClass)
  {
    uint64_t v40 = MEMORY[0x1E4F143A8];
    uint64_t v41 = 3221225472;
    id v42 = ___ZL20getMLCLossLayerClassv_block_invoke;
    id v43 = &unk_1E574B6F0;
    unint64_t v44 = &v45;
    ___ZL20getMLCLossLayerClassv_block_invoke((uint64_t)&v40);
    unint64_t v14 = (void *)v46[5];
  }
  _Block_object_dispose(&v45, 8);
  uint64_t v15 = [v14 layerWithDescriptor:v13];
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3052000000;
  uint64_t v48 = __Block_byref_object_copy__159;
  uint64_t v49 = __Block_byref_object_dispose__160;
  uint64_t v16 = (void *)getMLCOptimizerDescriptorClass(void)::softClass;
  uint64_t v50 = getMLCOptimizerDescriptorClass(void)::softClass;
  if (!getMLCOptimizerDescriptorClass(void)::softClass)
  {
    uint64_t v40 = MEMORY[0x1E4F143A8];
    uint64_t v41 = 3221225472;
    id v42 = ___ZL30getMLCOptimizerDescriptorClassv_block_invoke;
    id v43 = &unk_1E574B6F0;
    unint64_t v44 = &v45;
    ___ZL30getMLCOptimizerDescriptorClassv_block_invoke((uint64_t)&v40);
    uint64_t v16 = (void *)v46[5];
  }
  _Block_object_dispose(&v45, 8);
  LODWORD(v17) = 970045207;
  LODWORD(v18) = 1.0;
  LODWORD(v19) = 1.0;
  uint64_t v20 = [v16 descriptorWithLearningRate:0 gradientRescale:v17 regularizationType:v18 regularizationScale:v19];
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3052000000;
  uint64_t v48 = __Block_byref_object_copy__159;
  uint64_t v49 = __Block_byref_object_dispose__160;
  BOOL v21 = (void *)getMLCAdamOptimizerClass(void)::softClass;
  uint64_t v50 = getMLCAdamOptimizerClass(void)::softClass;
  if (!getMLCAdamOptimizerClass(void)::softClass)
  {
    uint64_t v40 = MEMORY[0x1E4F143A8];
    uint64_t v41 = 3221225472;
    id v42 = ___ZL24getMLCAdamOptimizerClassv_block_invoke;
    id v43 = &unk_1E574B6F0;
    unint64_t v44 = &v45;
    ___ZL24getMLCAdamOptimizerClassv_block_invoke((uint64_t)&v40);
    BOOL v21 = (void *)v46[5];
  }
  _Block_object_dispose(&v45, 8);
  LODWORD(v22) = 1063675494;
  LODWORD(v23) = 1065336439;
  LODWORD(v24) = 841731191;
  uint64_t v25 = [v21 optimizerWithDescriptor:v20 beta1:1 beta2:v22 epsilon:v23 timeStep:v24];
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3052000000;
  uint64_t v48 = __Block_byref_object_copy__159;
  uint64_t v49 = __Block_byref_object_dispose__160;
  int v26 = (void *)getMLCTrainingGraphClass(void)::softClass;
  uint64_t v50 = getMLCTrainingGraphClass(void)::softClass;
  if (!getMLCTrainingGraphClass(void)::softClass)
  {
    uint64_t v40 = MEMORY[0x1E4F143A8];
    uint64_t v41 = 3221225472;
    id v42 = ___ZL24getMLCTrainingGraphClassv_block_invoke;
    id v43 = &unk_1E574B6F0;
    unint64_t v44 = &v45;
    ___ZL24getMLCTrainingGraphClassv_block_invoke((uint64_t)&v40);
    int v26 = (void *)v46[5];
  }
  _Block_object_dispose(&v45, 8);
  v55[0] = a3;
  v39 = objc_msgSend(v26, "graphWithGraphObjects:lossLayer:optimizer:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v55, 1), v15, v25);
  id v27 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v28 = *(void *)a4;
  if (*((void *)a4 + 1) != *(void *)a4)
  {
    unint64_t v29 = 0;
    do
    {
      objc_msgSend(v27, "setObject:forKey:", *(void *)(v28 + 8 * v29), objc_msgSend(*(id *)(v28 + 8 * v29), "label"));
      ++v29;
      uint64_t v28 = *(void *)a4;
    }
    while (v29 < (uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 3);
  }
  uint64_t v30 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
  uint64_t v31 = *(void *)a5;
  if (*((void *)a5 + 1) != *(void *)a5)
  {
    unint64_t v32 = 0;
    do
    {
      objc_msgSend(v27, "setObject:forKey:", *(void *)(v31 + 8 * v32), objc_msgSend(*(id *)(v31 + 8 * v32), "label"));
      uint64_t v45 = 0;
      v46 = &v45;
      uint64_t v47 = 0x3052000000;
      uint64_t v48 = __Block_byref_object_copy__159;
      uint64_t v49 = __Block_byref_object_dispose__160;
      uint64_t v33 = (void *)getMLCTensorParameterClass(void)::softClass;
      uint64_t v50 = getMLCTensorParameterClass(void)::softClass;
      if (!getMLCTensorParameterClass(void)::softClass)
      {
        uint64_t v40 = MEMORY[0x1E4F143A8];
        uint64_t v41 = 3221225472;
        id v42 = ___ZL26getMLCTensorParameterClassv_block_invoke;
        id v43 = &unk_1E574B6F0;
        unint64_t v44 = &v45;
        ___ZL26getMLCTensorParameterClassv_block_invoke((uint64_t)&v40);
        uint64_t v33 = (void *)v46[5];
      }
      _Block_object_dispose(&v45, 8);
      objc_msgSend(v30, "addObject:", objc_msgSend(v33, "parameterWithTensor:optimizerData:", *(void *)(*(void *)a5 + 8 * v32++), 0));
      uint64_t v31 = *(void *)a5;
    }
    while (v32 < (uint64_t)(*((void *)a5 + 1) - *(void *)a5) >> 3);
  }
  uint64_t v53 = [a6 label];
  id v54 = a6;
  uint64_t v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
  uint64_t v51 = [a7 label];
  id v52 = a7;
  objc_msgSend(v39, "addInputs:lossLabels:lossLabelWeights:", v27, v34, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1));
  if (*((void *)a5 + 1) != *(void *)a5) {
    [v39 setTrainingTensorParameters:v30];
  }
  [v39 compileWithOptions:0 device:v36];
  return v39;
}

- (id)createInferenceGraphFromGraphObject:(id)a3 inputPlaceholders:(void *)a4 scalarWeights:(void *)a5 finalLayerTensor:(id)a6 device:(id)a7
{
  v34[1] = *MEMORY[0x1E4F143B8];
  uint64_t v28 = 0;
  unint64_t v29 = &v28;
  uint64_t v30 = 0x3052000000;
  uint64_t v31 = __Block_byref_object_copy__159;
  unint64_t v32 = __Block_byref_object_dispose__160;
  unint64_t v12 = (void *)getMLCSoftmaxLayerClass(void)::softClass;
  uint64_t v33 = getMLCSoftmaxLayerClass(void)::softClass;
  if (!getMLCSoftmaxLayerClass(void)::softClass)
  {
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    uint64_t v25 = ___ZL23getMLCSoftmaxLayerClassv_block_invoke;
    int v26 = &unk_1E574B6F0;
    id v27 = &v28;
    ___ZL23getMLCSoftmaxLayerClassv_block_invoke((uint64_t)&v23);
    unint64_t v12 = (void *)v29[5];
  }
  _Block_object_dispose(&v28, 8);
  uint64_t v13 = [v12 layerWithOperation:0];
  uint64_t v28 = 0;
  unint64_t v29 = &v28;
  uint64_t v30 = 0x3052000000;
  uint64_t v31 = __Block_byref_object_copy__159;
  unint64_t v32 = __Block_byref_object_dispose__160;
  unint64_t v14 = (void *)getMLCInferenceGraphClass(void)::softClass;
  uint64_t v33 = getMLCInferenceGraphClass(void)::softClass;
  if (!getMLCInferenceGraphClass(void)::softClass)
  {
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    uint64_t v25 = ___ZL25getMLCInferenceGraphClassv_block_invoke;
    int v26 = &unk_1E574B6F0;
    id v27 = &v28;
    ___ZL25getMLCInferenceGraphClassv_block_invoke((uint64_t)&v23);
    unint64_t v14 = (void *)v29[5];
  }
  _Block_object_dispose(&v28, 8);
  v34[0] = a3;
  uint64_t v15 = objc_msgSend(v14, "graphWithGraphObjects:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v34, 1));
  if (![v15 nodeWithLayer:v13 source:a6])
  {
    uint64_t v16 = [NSString stringWithFormat:@"Error creating inference graph"];
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", @"Infrastructure Error", v16, 0), "raise");
  }
  double v17 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v18 = *(void *)a4;
  if (*((void *)a4 + 1) != *(void *)a4)
  {
    unint64_t v19 = 0;
    do
    {
      objc_msgSend(v17, "setObject:forKey:", *(void *)(v18 + 8 * v19), objc_msgSend(*(id *)(v18 + 8 * v19), "label"));
      ++v19;
      uint64_t v18 = *(void *)a4;
    }
    while (v19 < (uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 3);
  }
  uint64_t v20 = *(void *)a5;
  if (*((void *)a5 + 1) != *(void *)a5)
  {
    unint64_t v21 = 0;
    do
    {
      objc_msgSend(v17, "setObject:forKey:", *(void *)(v20 + 8 * v21), objc_msgSend(*(id *)(v20 + 8 * v21), "label"));
      ++v21;
      uint64_t v20 = *(void *)a5;
    }
    while (v21 < (uint64_t)(*((void *)a5 + 1) - *(void *)a5) >> 3);
  }
  [v15 addInputs:v17];
  [v15 compileWithOptions:0 device:a7];
  return v15;
}

- (void)trainAndSaveSeqTagModelFromData:(void *)a3 batchedLabels:(void *)a4 labelArray:(void *)a5 embeddingRef:(void *)a6 trainedModelDict:(__CFDictionary *)a7 trainingLogger:(id)a8
{
  v139[4] = *MEMORY[0x1E4F143B8];
  uint64_t v13 = *(void *)a5;
  uint64_t v12 = *((void *)a5 + 1);
  char v125 = 0;
  v122 = 0;
  v123 = 0;
  v124 = 0;
  v119 = 0;
  v120 = 0;
  uint64_t v121 = 0;
  __p = 0;
  v117 = 0;
  unint64_t v118 = 0;
  v113 = 0;
  v114 = 0;
  uint64_t v115 = 0;
  uint64_t v111 = 0;
  uint64_t v112 = 0;
  unint64_t Dimension = NLStringEmbeddingGetDimension((CoreNLP *)a6, (void *)a2);
  v100 = self;
  id v14 = [(NSDictionary *)self->_trainingParameters objectForKeyedSubscript:@"maxLength"];
  if (v14) {
    uint64_t v103 = [v14 intValue];
  }
  else {
    uint64_t v103 = 50;
  }
  id v15 = [(NSDictionary *)self->_trainingParameters objectForKeyedSubscript:@"batchSize"];
  if (v15) {
    int v102 = [v15 intValue];
  }
  else {
    int v102 = 32;
  }
  id v16 = [(NSDictionary *)self->_trainingParameters objectForKeyedSubscript:kNLModelTrainerModelDeviceTypeKey];
  if (v16) {
    int v17 = [v16 intValue];
  }
  else {
    int v17 = 2;
  }
  *(void *)std::vector<int> __x = 0;
  v133 = (uint64_t **)__x;
  unint64_t v134 = 0x3052000000;
  v135 = __Block_byref_object_copy__159;
  v136 = __Block_byref_object_dispose__160;
  uint64_t v18 = (uint64_t *)getMLCDeviceClass(void)::softClass;
  uint64_t v137 = getMLCDeviceClass(void)::softClass;
  if (!getMLCDeviceClass(void)::softClass)
  {
    v127 = (uint64_t *)MEMORY[0x1E4F143A8];
    unint64_t v128 = 3221225472;
    v129 = ___ZL17getMLCDeviceClassv_block_invoke;
    v130 = &unk_1E574B6F0;
    v131 = __x;
    ___ZL17getMLCDeviceClassv_block_invoke((uint64_t)&v127);
    uint64_t v18 = v133[5];
  }
  uint64_t v93 = v13;
  uint64_t v94 = v12;
  _Block_object_dispose(__x, 8);
  if (v17 <= 3) {
    uint64_t v19 = v17;
  }
  else {
    uint64_t v19 = 2;
  }
  uint64_t v96 = [v18 deviceWithType:v19];
  v91 = a7;
  v92 = (uint64_t *)a5;
  uint64_t v108 = 0;
  v109 = 0;
  unint64_t v110 = 0;
  std::vector<int>::size_type v20 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a5 + 1) - *(void *)a5) >> 3);
  __x[0] = 0;
  std::vector<int>::vector(&v107, v20, __x);
  uint64_t v21 = *(void *)a4;
  if (*((void *)a4 + 1) != *(void *)a4)
  {
    unint64_t v22 = 0;
    do
    {
      *(void *)std::vector<int> __x = 0;
      v133 = 0;
      unint64_t v134 = 0;
      if (*(void *)(v21 + 24 * v22 + 8) != *(void *)(v21 + 24 * v22))
      {
        unint64_t v23 = 0;
        do
        {
          v127 = 0;
          unint64_t v128 = 0;
          v129 = 0;
          uint64_t v25 = (uint64_t *)(*(void *)(v21 + 24 * v22) + 24 * v23);
          uint64_t v24 = *v25;
          if (v25[1] != *v25)
          {
            uint64_t v26 = 0;
            unint64_t v27 = 0;
            do
            {
              CFMutableArrayRef theArray = 0;
              uint64_t v105 = 0;
              uint64_t v106 = 0;
              std::vector<std::vector<int>>::__init_with_size[abi:ne180100]<std::vector<int>*,std::vector<int>*>(&theArray, *(void *)(v24 + v26), *(void *)(v24 + v26 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v24 + v26 + 8) - *(void *)(v24 + v26)) >> 3));
              std::vector<std::vector<int>>::resize((uint64_t *)&theArray, (int)v103, (uint64_t)&v107);
              uint64_t v28 = (uint64_t *)v128;
              if (v128 >= (unint64_t)v129)
              {
                unint64_t v29 = (uint64_t *)std::vector<std::vector<std::vector<int>>>::__push_back_slow_path<std::vector<std::vector<int>> const&>((uint64_t *)&v127, (uint64_t *)&theArray);
              }
              else
              {
                *(void *)unint64_t v128 = 0;
                v28[1] = 0;
                v28[2] = 0;
                std::vector<std::vector<int>>::__init_with_size[abi:ne180100]<std::vector<int>*,std::vector<int>*>(v28, (uint64_t)theArray, v105, 0xAAAAAAAAAAAAAAABLL * ((v105 - (uint64_t)theArray) >> 3));
                unint64_t v29 = v28 + 3;
              }
              unint64_t v128 = (unint64_t)v29;
              p_CFMutableArrayRef theArray = &theArray;
              std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_theArray);
              ++v27;
              uint64_t v24 = *(void *)(*(void *)(*(void *)a4 + 24 * v22) + 24 * v23);
              v26 += 24;
            }
            while (0xAAAAAAAAAAAAAAABLL
                  * ((*(void *)(*(void *)(*(void *)a4 + 24 * v22) + 24 * v23 + 8) - v24) >> 3) > v27);
          }
          uint64_t v30 = v133;
          if ((unint64_t)v133 >= v134)
          {
            uint64_t v31 = (uint64_t **)std::vector<std::vector<std::vector<std::vector<int>>>>::__push_back_slow_path<std::vector<std::vector<std::vector<int>>> const&>((uint64_t *)__x, &v127);
          }
          else
          {
            *v133 = 0;
            v30[1] = 0;
            std::vector<int>::value_type v30[2] = 0;
            std::vector<std::vector<std::vector<int>>>::__init_with_size[abi:ne180100]<std::vector<std::vector<int>>*,std::vector<std::vector<int>>*>(v30, v127, (uint64_t *)v128, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v128 - (void)v127) >> 3));
            uint64_t v31 = v30 + 3;
          }
          v133 = v31;
          CFMutableArrayRef theArray = (CFMutableArrayRef)&v127;
          std::vector<std::vector<std::vector<int>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&theArray);
          ++v23;
          uint64_t v21 = *(void *)a4;
        }
        while (0xAAAAAAAAAAAAAAABLL
              * ((uint64_t)(*(void *)(*(void *)a4 + 24 * v22 + 8) - *(void *)(*(void *)a4 + 24 * v22)) >> 3) > v23);
      }
      unint64_t v32 = v109;
      if ((unint64_t)v109 >= v110)
      {
        uint64_t v33 = std::vector<std::vector<std::vector<std::vector<std::vector<int>>>>>::__push_back_slow_path<std::vector<std::vector<std::vector<std::vector<int>>>> const&>(&v108, (uint64_t ***)__x);
      }
      else
      {
        void *v109 = 0;
        v32[1] = 0;
        v32[2] = 0;
        std::vector<std::vector<std::vector<std::vector<int>>>>::__init_with_size[abi:ne180100]<std::vector<std::vector<std::vector<int>>>*,std::vector<std::vector<std::vector<int>>>*>(v32, *(uint64_t ***)__x, v133, 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v133 - *(void *)__x) >> 3));
        uint64_t v33 = (uint64_t)(v32 + 3);
      }
      v109 = (void *)v33;
      v127 = (uint64_t *)__x;
      std::vector<std::vector<std::vector<std::vector<int>>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v127);
      ++v22;
      uint64_t v21 = *(void *)a4;
    }
    while (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 3) > v22);
  }
  uint64_t v34 = v117;
  if ((unint64_t)v117 >= v118)
  {
    uint64_t v38 = (v117 - (unsigned char *)__p) >> 3;
    uint64_t v37 = v93;
    uint64_t v36 = v94;
    if ((unint64_t)(v38 + 1) >> 61) {
      std::vector<CoreNLP::NLAttributedToken>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v39 = (uint64_t)(v118 - (void)__p) >> 2;
    if (v39 <= v38 + 1) {
      unint64_t v39 = v38 + 1;
    }
    if (v118 - (unint64_t)__p >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v40 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v40 = v39;
    }
    if (v40) {
      uint64_t v41 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v118, v40);
    }
    else {
      uint64_t v41 = 0;
    }
    id v42 = &v41[8 * v38];
    id v43 = &v41[8 * v40];
    *(void *)id v42 = 0;
    unint64_t v35 = v42 + 8;
    uint64_t v45 = (char *)__p;
    unint64_t v44 = v117;
    if (v117 != __p)
    {
      do
      {
        uint64_t v46 = *((void *)v44 - 1);
        v44 -= 8;
        *((void *)v42 - 1) = v46;
        v42 -= 8;
      }
      while (v44 != v45);
      unint64_t v44 = (char *)__p;
    }
    __p = v42;
    v117 = v35;
    unint64_t v118 = (unint64_t)v43;
    if (v44) {
      operator delete(v44);
    }
  }
  else
  {
    *(void *)v117 = 0;
    unint64_t v35 = v34 + 8;
    uint64_t v37 = v93;
    uint64_t v36 = v94;
  }
  v117 = v35;
  unint64_t v95 = 0xAAAAAAAAAAAAAAABLL * ((v36 - v37) >> 3);
  -[TransferSeqTagMLFHelper getInputEmbeddingsAndTargetTensorsForSequenceData:seqLabels:batchSize:maxLength:numClasses:embeddingRef:inputTensorDataItems:targetTensorData:targetWeightTensorData:](v100, "getInputEmbeddingsAndTargetTensorsForSequenceData:seqLabels:batchSize:maxLength:numClasses:embeddingRef:inputTensorDataItems:targetTensorData:targetWeightTensorData:", &__p, &v112, &v111);
  uint64_t v47 = (void *)[MEMORY[0x1E4F1CA48] array];
  if (v102 >= 1)
  {
    int v48 = v102;
    do
    {
      objc_msgSend(v47, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", v103));
      --v48;
    }
    while (v48);
  }
  if (v117 != __p)
  {
    unint64_t v49 = 0;
    do
    {
      MLCTensorDescriptorClass = (void *)getMLCTensorDescriptorClass();
      v139[0] = [NSNumber numberWithInt:v102];
      v139[1] = [NSNumber numberWithLong:Dimension];
      v139[2] = &unk_1EE3B81C0;
      v139[3] = [NSNumber numberWithInt:v103];
      uint64_t v51 = objc_msgSend(MLCTensorDescriptorClass, "descriptorWithShape:sequenceLengths:sortedSequences:dataType:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v139, 4), v47, 1, 1);
      uint64_t v52 = [(id)getMLCTensorClass() tensorWithDescriptor:v51 data:*((void *)__p + v49)];
      uint64_t v53 = v52;
      id v54 = v123;
      if (v123 >= (uint64_t *)v124)
      {
        uint64_t v56 = ((char *)v123 - (unsigned char *)v122) >> 3;
        if ((unint64_t)(v56 + 1) >> 61) {
          std::vector<CoreNLP::NLAttributedToken>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v57 = (v124 - (unsigned char *)v122) >> 2;
        if (v57 <= v56 + 1) {
          unint64_t v57 = v56 + 1;
        }
        if ((unint64_t)(v124 - (unsigned char *)v122) >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v58 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v58 = v57;
        }
        if (v58) {
          unint64_t v59 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v124, v58);
        }
        else {
          unint64_t v59 = 0;
        }
        v60 = (uint64_t *)&v59[8 * v56];
        uint64_t *v60 = v53;
        v55 = v60 + 1;
        uint64_t v62 = (char *)v122;
        v61 = (char *)v123;
        if (v123 != v122)
        {
          do
          {
            uint64_t v63 = *((void *)v61 - 1);
            v61 -= 8;
            *--v60 = v63;
          }
          while (v61 != v62);
          v61 = (char *)v122;
        }
        v122 = v60;
        v123 = v55;
        v124 = &v59[8 * v58];
        if (v61) {
          operator delete(v61);
        }
      }
      else
      {
        uint64_t *v123 = v52;
        v55 = v54 + 1;
      }
      v123 = v55;
      ++v49;
    }
    while (v49 < (v117 - (unsigned char *)__p) >> 3);
  }
  uint64_t v64 = (void *)getMLCTensorDescriptorClass();
  v138[0] = [NSNumber numberWithInt:v102];
  v138[1] = [NSNumber numberWithInt:v95];
  v138[2] = &unk_1EE3B81C0;
  v138[3] = [NSNumber numberWithInt:v103];
  uint64_t v65 = objc_msgSend(v64, "descriptorWithShape:sequenceLengths:sortedSequences:dataType:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v138, 4), v47, 1, 1);
  uint64_t v66 = [(id)getMLCTensorClass() tensorWithDescriptor:v65 data:v112];
  uint64_t v67 = [(id)getMLCTensorClass() tensorWithDescriptor:v65 data:v111];
  *(void *)std::vector<int> __x = 0;
  v133 = (uint64_t **)__x;
  unint64_t v134 = 0x3052000000;
  v135 = __Block_byref_object_copy__159;
  v136 = __Block_byref_object_dispose__160;
  uint64_t v137 = getMLCGraphClass(void)::softClass;
  if (!getMLCGraphClass(void)::softClass)
  {
    v127 = (uint64_t *)MEMORY[0x1E4F143A8];
    unint64_t v128 = 3221225472;
    v129 = ___ZL16getMLCGraphClassv_block_invoke;
    v130 = &unk_1E574B6F0;
    v131 = __x;
    ___ZL16getMLCGraphClassv_block_invoke((uint64_t)&v127);
  }
  _Block_object_dispose(__x, 8);
  id v68 = (id)objc_opt_new();
  [(TransferSeqTagMLFHelper *)v100 createGraphObjectAndLayersFromInputPlaceholders:&v122 scalarWeights:&v119 labelSize:(int)v95 embeddingDimension:Dimension graphObject:v68 graphLayerList:&v113];
  uint64_t v69 = *(v114 - 1);
  uint64_t v70 = [(TransferSeqTagMLFHelper *)v100 createTrainingGraphFromGraphObject:v68 inputPlaceholders:&v122 scalarWeights:&v119 targetLabels:v66 targeLabelWeights:v67 device:v96];
  if (!v70)
  {
    uint64_t v71 = [NSString stringWithFormat:@"Unsupported Hardware: Training graph creation failed."];
    (*((void (**)(id, uint64_t, char *))a8 + 2))(a8, v71, &v125);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", @"Infrastructure Error", v71, 0), "raise");
  }
  uint64_t v72 = [(TransferSeqTagMLFHelper *)v100 createInferenceGraphFromGraphObject:v68 inputPlaceholders:&v122 scalarWeights:&v119 finalLayerTensor:v69 device:v96];
  if (!v72)
  {
    uint64_t v73 = [NSString stringWithFormat:@"Unsupported Hardware: Inference graph creation failed."];
    (*((void (**)(id, uint64_t, char *))a8 + 2))(a8, v73, &v125);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", @"Infrastructure Error", v73, 0), "raise");
  }
  (*((void (**)(id, uint64_t, char *))a8 + 2))(a8, [NSString stringWithFormat:@"Training graph initialization complete."], &v125);
  *(void *)std::vector<int> __x = 0;
  *(void *)std::vector<int> __x = [(TransferSeqTagMLFHelper *)v100 doSeqTagTrainingAndEvalFromData:a3 batchedLabels:a4 batchedPaddedLabelDatasets:&v108 labelArray:v92 embeddingRef:a6 modeLayerList:&v113 trainingGraph:v70 inferenceGraph:v72 scalarParams:&v119 inputPlaceholders:&v122 targetLabelPlaceholders:v66 targetLabelWeightsPlaceholders:v67 trainingLogger:a8];
  if (*(void *)__x)
  {
    (*((void (**)(id, uint64_t, char *))a8 + 2))(a8, [NSString stringWithFormat:@"Saving Trained Model Weights"], &v125);
    Mutable = (uint64_t *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    v127 = Mutable;
    v75 = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
    CFMutableArrayRef theArray = v75;
    uint64_t v76 = *v92;
    if (v92[1] != *v92)
    {
      uint64_t v77 = 0;
      unint64_t v78 = 0;
      do
      {
        v79 = (const char *)(v76 + v77);
        if (*(char *)(v76 + v77 + 23) < 0) {
          v79 = *(const char **)v79;
        }
        CFStringRef v80 = CFStringCreateWithCString(0, v79, 0x8000100u);
        v75 = theArray;
        CFArrayAppendValue(theArray, v80);
        CFRelease(v80);
        ++v78;
        uint64_t v76 = *v92;
        v77 += 24;
      }
      while (0xAAAAAAAAAAAAAAABLL * ((v92[1] - *v92) >> 3) > v78);
      Mutable = v127;
    }
    CFDictionaryAddValue((CFMutableDictionaryRef)Mutable, kNLModelSampleDataLabelTypesArrayKey, v75);
    id v81 = [(NSDictionary *)v100->_trainingParameters objectForKeyedSubscript:kNLModelTrainerEmbeddingArchitectureKey];
    id v82 = [(NSDictionary *)v100->_trainingParameters objectForKeyedSubscript:kNLModelTrainerLanguageKey];
    CFDictionaryAddValue((CFMutableDictionaryRef)Mutable, kNLModelTrainerEmbeddingArchitectureKey, v81);
    CFDictionaryAddValue((CFMutableDictionaryRef)Mutable, kNLModelTrainerLanguageKey, v82);
    if ([(NSDictionary *)v100->_trainingParameters objectForKeyedSubscript:kNLModelTrainerMultilingualEmbeddingLocaleIdentifierKey])
    {
      CFDictionaryAddValue((CFMutableDictionaryRef)Mutable, kNLModelTrainerMultilingualEmbeddingLocaleIdentifierKey, [(NSDictionary *)v100->_trainingParameters objectForKeyedSubscript:kNLModelTrainerMultilingualEmbeddingLocaleIdentifierKey]);
    }
    v83 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    CFDictionaryAddValue(v83, kNLModelTrainerModelMetadataKey, Mutable);
    v84 = *(uint64_t ***)__x;
    if (CFDictionaryContainsKey(*(CFDictionaryRef *)__x, kNLModelTrainerModelDataArrayKey))
    {
      v85 = (const void *)kNLModelTrainerModelDataArrayKey;
      Value = CFDictionaryGetValue((CFDictionaryRef)v84, kNLModelTrainerModelDataArrayKey);
      CFDictionaryAddValue(v83, v85, Value);
    }
    if (CFDictionaryContainsKey((CFDictionaryRef)v84, kNLModelPredictedTrainingLabelsKey))
    {
      v87 = (const void *)kNLModelPredictedTrainingLabelsKey;
      v88 = CFDictionaryGetValue((CFDictionaryRef)v84, kNLModelPredictedTrainingLabelsKey);
      CFDictionaryAddValue(v83, v87, v88);
    }
    if (CFDictionaryContainsKey((CFDictionaryRef)v84, kNLModelPredictedValidationLabelsKey))
    {
      v89 = (const void *)kNLModelPredictedValidationLabelsKey;
      v90 = CFDictionaryGetValue((CFDictionaryRef)v84, kNLModelPredictedValidationLabelsKey);
      CFDictionaryAddValue(v83, v89, v90);
    }
    *v91 = v83;
    if (v75) {
      CFRelease(v75);
    }
    if (Mutable) {
      CFRelease(Mutable);
    }
    if (v84) {
      CFRelease(v84);
    }
  }
  if (v107.__begin_)
  {
    v107.__end_ = v107.__begin_;
    operator delete(v107.__begin_);
  }
  *(void *)std::vector<int> __x = &v108;
  std::vector<std::vector<std::vector<std::vector<std::vector<int>>>>>::__destroy_vector::operator()[abi:ne180100]((void ***)__x);
  if (v113)
  {
    v114 = v113;
    operator delete(v113);
  }
  if (__p)
  {
    v117 = (char *)__p;
    operator delete(__p);
  }
  if (v119)
  {
    v120 = v119;
    operator delete(v119);
  }
  if (v122)
  {
    v123 = (uint64_t *)v122;
    operator delete(v122);
  }
}

- (__CFDictionary)doSeqTagTrainingAndEvalFromData:(void *)a3 batchedLabels:(void *)a4 batchedPaddedLabelDatasets:(void *)a5 labelArray:(void *)a6 embeddingRef:(void *)a7 modeLayerList:(void *)a8 trainingGraph:(id)a9 inferenceGraph:(id)a10 scalarParams:(void *)a11 inputPlaceholders:(void *)a12 targetLabelPlaceholders:(id)a13 targetLabelWeightsPlaceholders:(id)a14 trainingLogger:(id)a15
{
  uint64_t v195 = *MEMORY[0x1E4F143B8];
  theDict = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  uint64_t v20 = *(void *)a6;
  uint64_t v19 = *((void *)a6 + 1);
  v132 = a6;
  uint64_t v137 = (CoreNLP *)a7;
  unint64_t Dimension = (unint64_t)NLStringEmbeddingGetDimension((CoreNLP *)a7, v21);
  char v188 = 0;
  id v23 = [(NSDictionary *)self->_trainingParameters objectForKeyedSubscript:kNLModelTrainerMaxIterationNumberKey];
  if (v23) {
    unsigned int v24 = [v23 unsignedIntValue];
  }
  else {
    unsigned int v24 = 20;
  }
  id v25 = [(NSDictionary *)self->_trainingParameters objectForKeyedSubscript:@"maxLength"];
  if (v25) {
    int v26 = [v25 intValue];
  }
  else {
    int v26 = 50;
  }
  uint64_t v27 = *(void *)a3 + 24;
  uint64_t v28 = **(uint64_t ***)a3;
  uint64_t v30 = *v28;
  uint64_t v29 = v28[1];
  uint64_t v185 = 0;
  uint64_t v186 = 0;
  uint64_t v187 = 0;
  memset(v184, 0, sizeof(v184));
  unsigned int v135 = v26;
  -[TransferSeqTagMLFHelper removeBatchingFromDataAndLabels:batchedLabels:inputSentences:inputLabels:maxLength:](self, "removeBatchingFromDataAndLabels:batchedLabels:inputSentences:inputLabels:maxLength:", v27, *(void *)a4 + 24, &v185, v184);
  memset(v183, 0, sizeof(v183));
  v138 = self;
  [(TransferSeqTagMLFHelper *)self getMaxIndicesFromOneHotVectors:v184 maxIndicesBatch:v183];
  v181 = 0;
  v180 = 0;
  unint64_t v182 = 0;
  v178 = 0;
  v177 = 0;
  unint64_t v179 = 0;
  v175 = 0;
  v174 = 0;
  unint64_t v176 = 0;
  BOOL v31 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
  if (v31) {
    -[TransferSeqTagMLFHelper doSeqTagTrainingAndEvalFromData:batchedLabels:batchedPaddedLabelDatasets:labelArray:embeddingRef:modeLayerList:trainingGraph:inferenceGraph:scalarParams:inputPlaceholders:targetLabelPlaceholders:targetLabelWeightsPlaceholders:trainingLogger:].cold.4(v31, v32, v33, v34, v35, v36, v37, v38);
  }
  uint64_t v141 = v29;
  uint64_t v39 = v185;
  if (v186 != v185)
  {
    uint64_t v40 = 0;
    unint64_t v41 = 0;
    do
    {
      uint64_t v42 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v39 + v40 + 8) - *(void *)(v39 + v40)) >> 3);
      LODWORD(__p) = 0;
      std::vector<float>::vector(&v170, (int)v42 * Dimension, &__p);
      LODWORD(v162) = 0;
      std::vector<float>::vector(&__p, Dimension, &v162);
      v163 = 0;
      v162 = 0;
      uint64_t v164 = 0;
      v163 = (long long ***)std::vector<std::vector<std::string>>::__push_back_slow_path<std::vector<std::string> const&>((uint64_t *)&v162, (long long **)(v185 + v40));
      CFArrayRef v43 = applesauce::CF::details::make_CFArrayRef<std::vector<std::string>>(&v162);
      v159 = v43;
      NLStringEmbeddingFillWordVectorsWithShape(v137, v43, 1, v42, v170, 0, (uint64_t)__p, 2);
      unint64_t v44 = v175;
      if ((unint64_t)v175 >= v176)
      {
        uint64_t v45 = std::vector<std::vector<float>>::__push_back_slow_path<std::vector<float> const&>((uint64_t *)&v174, (uint64_t)&v170);
      }
      else
      {
        void *v175 = 0;
        v44[1] = 0;
        v44[2] = 0;
        std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(v44, v170, (uint64_t)v171, (v171 - (unsigned char *)v170) >> 2);
        uint64_t v45 = (uint64_t)(v44 + 3);
      }
      v175 = (void *)v45;
      if (v43) {
        CFRelease(v43);
      }
      v159 = &v162;
      std::vector<std::vector<std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v159);
      if (__p)
      {
        p_p = __p;
        operator delete(__p);
      }
      if (v170)
      {
        v171 = v170;
        operator delete(v170);
      }
      ++v41;
      uint64_t v39 = v185;
      v40 += 24;
    }
    while (0xAAAAAAAAAAAAAAABLL * ((v186 - v185) >> 3) > v41);
  }
  v170 = 0;
  v171 = &v170;
  uint64_t v172 = 0x2020000000;
  uint64_t v173 = 0;
  __p = 0;
  p_p = &__p;
  uint64_t v168 = 0x2020000000;
  char v169 = 0;
  uint64_t v46 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v47 = *(void *)a11;
  if (*((void *)a11 + 1) != *(void *)a11)
  {
    unint64_t v48 = 0;
    do
    {
      unint64_t v49 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithData:", objc_msgSend(*(id *)(v47 + 8 * v48), "data"));
      objc_msgSend(v46, "setObject:forKey:", objc_msgSend((id)getMLCTensorDataClass(), "dataWithBytesNoCopy:length:", objc_msgSend(v49, "mutableBytes"), objc_msgSend(v49, "length")), objc_msgSend(*(id *)(*(void *)a11 + 8 * v48++), "label"));
      uint64_t v47 = *(void *)a11;
    }
    while (v48 < (uint64_t)(*((void *)a11 + 1) - *(void *)a11) >> 3);
  }
  (*((void (**)(id, uint64_t, char *))a15 + 2))(a15, [NSString stringWithFormat:@"Beginning training"], &v188);
  if (v24)
  {
    uint64_t v140 = 0;
    v129 = 0;
    unsigned int v134 = -1431655765 * ((unint64_t)(v19 - v20) >> 3);
    unint64_t v133 = 0xAAAAAAAAAAAAAAABLL * ((v141 - v30) >> 3);
    float v50 = NAN;
    do
    {
      v162 = 0;
      v163 = &v162;
      uint64_t v164 = 0x2020000000;
      int v165 = 0;
      dsema = dispatch_semaphore_create(0);
      uint64_t v51 = *(uint64_t ***)a3;
      if (*(void *)(*(void *)a3 + 8) != **(void **)a3)
      {
        unint64_t v52 = 0;
        do
        {
          v159 = 0;
          v160 = 0;
          v161 = 0;
          v145[0] = 0;
          v189 = 0;
          uint64_t v54 = *(void *)a12;
          uint64_t v53 = *((void *)a12 + 1);
          if (v140)
          {
            if (v53 != v54)
            {
              v55 = 0;
              unint64_t v56 = 0;
              do
              {
                uint64_t v57 = *(void *)(v180[3 * v52] + 8 * v56);
                if (v55 >= v161)
                {
                  uint64_t v58 = (v55 - (unsigned char *)v159) >> 3;
                  if ((unint64_t)(v58 + 1) >> 61) {
                    std::vector<CoreNLP::NLAttributedToken>::__throw_length_error[abi:ne180100]();
                  }
                  unint64_t v59 = (v161 - (unsigned char *)v159) >> 2;
                  if (v59 <= v58 + 1) {
                    unint64_t v59 = v58 + 1;
                  }
                  if ((unint64_t)(v161 - (unsigned char *)v159) >= 0x7FFFFFFFFFFFFFF8) {
                    unint64_t v60 = 0x1FFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v60 = v59;
                  }
                  if (v60) {
                    v61 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v161, v60);
                  }
                  else {
                    v61 = 0;
                  }
                  uint64_t v62 = &v61[8 * v58];
                  *(void *)uint64_t v62 = v57;
                  v55 = v62 + 8;
                  uint64_t v64 = (char *)v159;
                  uint64_t v63 = v160;
                  if (v160 != v159)
                  {
                    do
                    {
                      uint64_t v65 = *((void *)v63 - 1);
                      v63 -= 8;
                      *((void *)v62 - 1) = v65;
                      v62 -= 8;
                    }
                    while (v63 != v64);
                    uint64_t v63 = (char *)v159;
                  }
                  v159 = v62;
                  v160 = v55;
                  v161 = &v61[8 * v60];
                  if (v63) {
                    operator delete(v63);
                  }
                }
                else
                {
                  *(void *)v55 = v57;
                  v55 += 8;
                }
                v160 = v55;
                ++v56;
              }
              while (v56 < (uint64_t)(*((void *)a12 + 1) - *(void *)a12) >> 3);
            }
            uint64_t v66 = (char *)v177 + 16 * v52;
            v145[0] = *(long long ***)v66;
            v189 = (uint8_t *)*((void *)v66 + 1);
          }
          else
          {
            if (v53 != v54)
            {
              uint64_t v67 = 0;
              unint64_t v68 = 0;
              do
              {
                if (v67 >= v161)
                {
                  uint64_t v69 = (v67 - (unsigned char *)v159) >> 3;
                  if ((unint64_t)(v69 + 1) >> 61) {
                    std::vector<CoreNLP::NLAttributedToken>::__throw_length_error[abi:ne180100]();
                  }
                  unint64_t v70 = (v161 - (unsigned char *)v159) >> 2;
                  if (v70 <= v69 + 1) {
                    unint64_t v70 = v69 + 1;
                  }
                  if ((unint64_t)(v161 - (unsigned char *)v159) >= 0x7FFFFFFFFFFFFFF8) {
                    unint64_t v71 = 0x1FFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v71 = v70;
                  }
                  if (v71) {
                    uint64_t v72 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v161, v71);
                  }
                  else {
                    uint64_t v72 = 0;
                  }
                  uint64_t v73 = &v72[8 * v69];
                  *(void *)uint64_t v73 = 0;
                  uint64_t v67 = v73 + 8;
                  v75 = (char *)v159;
                  v74 = v160;
                  if (v160 != v159)
                  {
                    do
                    {
                      uint64_t v76 = *((void *)v74 - 1);
                      v74 -= 8;
                      *((void *)v73 - 1) = v76;
                      v73 -= 8;
                    }
                    while (v74 != v75);
                    v74 = (char *)v159;
                  }
                  v159 = v73;
                  v160 = v67;
                  v161 = &v72[8 * v71];
                  if (v74) {
                    operator delete(v74);
                  }
                }
                else
                {
                  *(void *)uint64_t v67 = 0;
                  v67 += 8;
                }
                v160 = v67;
                ++v68;
              }
              while (v68 < (uint64_t)(*((void *)a12 + 1) - *(void *)a12) >> 3);
              uint64_t v51 = *(uint64_t ***)a3;
            }
            [(TransferSeqTagMLFHelper *)v138 getInputEmbeddingsAndTargetTensorsForSequenceData:&(*v51)[3 * v52] seqLabels:**(void **)a5 + 24 * v52 batchSize:v133 maxLength:v135 numClasses:v134 embeddingRef:v137 inputTensorDataItems:&v159 targetTensorData:v145 targetWeightTensorData:&v189];
            memset(buf, 0, sizeof(buf));
            if (*((void *)a12 + 1) != *(void *)a12)
            {
              uint64_t v77 = 0;
              unint64_t v78 = 0;
              do
              {
                v79 = v159;
                if ((unint64_t)v77 >= *(void *)&buf[16])
                {
                  uint64_t v80 = ((uint64_t)v77 - *(void *)buf) >> 3;
                  if ((unint64_t)(v80 + 1) >> 61) {
                    std::vector<CoreNLP::NLAttributedToken>::__throw_length_error[abi:ne180100]();
                  }
                  unint64_t v81 = (uint64_t)(*(void *)&buf[16] - *(void *)buf) >> 2;
                  if (v81 <= v80 + 1) {
                    unint64_t v81 = v80 + 1;
                  }
                  if (*(void *)&buf[16] - *(void *)buf >= 0x7FFFFFFFFFFFFFF8uLL) {
                    unint64_t v82 = 0x1FFFFFFFFFFFFFFFLL;
                  }
                  else {
                    unint64_t v82 = v81;
                  }
                  if (v82) {
                    v83 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&buf[16], v82);
                  }
                  else {
                    v83 = 0;
                  }
                  v84 = &v83[8 * v80];
                  *(void *)v84 = v79[v78];
                  uint64_t v77 = v84 + 8;
                  v86 = *(char **)buf;
                  v85 = *(char **)&buf[8];
                  if (*(void *)&buf[8] != *(void *)buf)
                  {
                    do
                    {
                      uint64_t v87 = *((void *)v85 - 1);
                      v85 -= 8;
                      *((void *)v84 - 1) = v87;
                      v84 -= 8;
                    }
                    while (v85 != v86);
                    v85 = *(char **)buf;
                  }
                  *(void *)buf = v84;
                  *(void *)&buf[8] = v77;
                  *(void *)&buf[16] = &v83[8 * v82];
                  if (v85) {
                    operator delete(v85);
                  }
                }
                else
                {
                  *v77++ = *((void *)v159 + v78);
                }
                *(void *)&buf[8] = v77;
                ++v78;
              }
              while (v78 < (uint64_t)(*((void *)a12 + 1) - *(void *)a12) >> 3);
            }
            v88 = v181;
            if ((unint64_t)v181 >= v182)
            {
              uint64_t v89 = std::vector<std::vector<MLCTensorData *>>::__push_back_slow_path<std::vector<MLCTensorData *> const&>((uint64_t *)&v180, (uint64_t)buf);
            }
            else
            {
              void *v181 = 0;
              v88[1] = 0;
              v88[2] = 0;
              std::vector<MLCTensorData *>::__init_with_size[abi:ne180100]<MLCTensorData **,MLCTensorData **>(v88, *(const void **)buf, *(uint64_t *)&buf[8], (uint64_t)(*(void *)&buf[8] - *(void *)buf) >> 3);
              uint64_t v89 = (uint64_t)(v88 + 3);
            }
            v181 = (void *)v89;
            v90 = v145[0];
            v91 = (void **)v189;
            v92 = v178;
            if ((unint64_t)v178 >= v179)
            {
              int64_t v94 = ((unsigned char *)v178 - (unsigned char *)v177) >> 4;
              unint64_t v95 = v94 + 1;
              if ((unint64_t)(v94 + 1) >> 60) {
                std::vector<CoreNLP::NLAttributedToken>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v96 = v179 - (void)v177;
              if ((uint64_t)(v179 - (void)v177) >> 3 > v95) {
                unint64_t v95 = v96 >> 3;
              }
              if ((unint64_t)v96 >= 0x7FFFFFFFFFFFFFF0) {
                unint64_t v97 = 0xFFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v97 = v95;
              }
              if (v97) {
                v98 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<float,unsigned long>>>((uint64_t)&v179, v97);
              }
              else {
                v98 = 0;
              }
              v99 = (long long ***)&v98[16 * v94];
              *v99 = v90;
              v99[1] = (long long **)v91;
              v100 = (char *)v178;
              v101 = (char *)v177;
              int v102 = v99;
              if (v178 != v177)
              {
                do
                {
                  *((_OWORD *)v102 - 1) = *((_OWORD *)v100 - 1);
                  v102 -= 2;
                  v100 -= 16;
                }
                while (v100 != v101);
                v100 = (char *)v177;
              }
              uint64_t v93 = v99 + 2;
              v177 = v102;
              v178 = v99 + 2;
              unint64_t v179 = (unint64_t)&v98[16 * v97];
              if (v100) {
                operator delete(v100);
              }
            }
            else
            {
              *(long long ***)v178 = v145[0];
              v92[1] = v91;
              uint64_t v93 = v92 + 2;
            }
            v178 = v93;
            if (*(void *)buf)
            {
              *(void *)&buf[8] = *(void *)buf;
              operator delete(*(void **)buf);
            }
          }
          uint64_t v103 = (void *)MEMORY[0x1996F94B0]();
          uint64_t v104 = *(void *)a12;
          if (*((void *)a12 + 1) != *(void *)a12)
          {
            unint64_t v105 = 0;
            do
            {
              objc_msgSend(v46, "setObject:forKey:", *((void *)v159 + v105), objc_msgSend(*(id *)(v104 + 8 * v105), "label"));
              ++v105;
              uint64_t v104 = *(void *)a12;
            }
            while (v105 < (uint64_t)(*((void *)a12 + 1) - *(void *)a12) >> 3);
          }
          uint64_t v192 = [a13 label];
          v193 = v145[0];
          uint64_t v106 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v193 forKeys:&v192 count:1];
          uint64_t v190 = [a14 label];
          v191 = (void **)v189;
          uint64_t v107 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v191 forKeys:&v190 count:1];
          v157[0] = MEMORY[0x1E4F143A8];
          v157[1] = 3221225472;
          v157[2] = __268__TransferSeqTagMLFHelper_doSeqTagTrainingAndEvalFromData_batchedLabels_batchedPaddedLabelDatasets_labelArray_embeddingRef_modeLayerList_trainingGraph_inferenceGraph_scalarParams_inputPlaceholders_targetLabelPlaceholders_targetLabelWeightsPlaceholders_trainingLogger___block_invoke;
          v157[3] = &unk_1E574C1C8;
          v157[6] = &__p;
          v157[7] = &v162;
          v157[8] = v52;
          v157[9] = a3;
          int v158 = 0;
          v157[5] = &v170;
          v157[4] = dsema;
          [a9 executeWithInputsData:v46 lossLabelsData:v106 lossLabelWeightsData:v107 batchSize:(int)v133 options:0 completionHandler:v157];
          v160 = (char *)v159;
          if (v159)
          {
            v160 = (char *)v159;
            operator delete(v159);
          }
          ++v52;
          uint64_t v51 = *(uint64_t ***)a3;
        }
        while (v52 < 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(*(void *)a3 + 8) - **(void **)a3) >> 3));
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
        -[TransferSeqTagMLFHelper doSeqTagTrainingAndEvalFromData:batchedLabels:batchedPaddedLabelDatasets:labelArray:embeddingRef:modeLayerList:trainingGraph:inferenceGraph:scalarParams:inputPlaceholders:targetLabelPlaceholders:targetLabelWeightsPlaceholders:trainingLogger:](&v155, v156);
      }
      dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
        -[TransferSeqTagMLFHelper doSeqTagTrainingAndEvalFromData:batchedLabels:batchedPaddedLabelDatasets:labelArray:embeddingRef:modeLayerList:trainingGraph:inferenceGraph:scalarParams:inputPlaceholders:targetLabelPlaceholders:targetLabelWeightsPlaceholders:trainingLogger:](&v153, v154);
      }
      [a9 synchronizeUpdates];
      dispatch_release(dsema);
      float v108 = *((float *)v163 + 6);
      uint64_t v110 = **(void **)a3;
      uint64_t v109 = *(void *)(*(void *)a3 + 8);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
        -[TransferSeqTagMLFHelper doSeqTagTrainingAndEvalFromData:batchedLabels:batchedPaddedLabelDatasets:labelArray:embeddingRef:modeLayerList:trainingGraph:inferenceGraph:scalarParams:inputPlaceholders:targetLabelPlaceholders:targetLabelWeightsPlaceholders:trainingLogger:](&v151, v152);
      }
      (*((void (**)(id, uint64_t, char *))a15 + 2))(a15, objc_msgSend(NSString, "stringWithFormat:", @"Completed epoch number = [%d] Total Training Loss = %f", (v140 + 1), (float)(v108 / (float)(0xAAAAAAAAAAAAAAABLL * ((v109 - v110) >> 3)))), &v188);
      v148 = 0;
      v149 = 0;
      uint64_t v150 = 0;
      std::vector<void *>::__init_with_size[abi:ne180100]<void **,void **>(&v148, *(const void **)a8, *((void *)a8 + 1), (uint64_t)(*((void *)a8 + 1) - *(void *)a8) >> 3);
      id v111 = [(TransferSeqTagMLFHelper *)v138 getModelLayerWeights:&v148];
      if (v148)
      {
        v149 = v148;
        operator delete(v148);
      }
      v159 = 0;
      v160 = 0;
      v161 = 0;
      if (v140 == v24 - 1)
      {
        memset(buf, 0, sizeof(buf));
        uint64_t v112 = *(uint64_t **)a3;
        uint64_t v113 = *(void *)a5;
        std::string::basic_string[abi:ne180100]<0>(v146, "Training");
        [(TransferSeqTagMLFHelper *)v138 evaluateInferenceGraphWithInputTensorData:&v180 batchedInputSentences:v112 batchedLabels:v113 inferenceGraph:a10 inputPlaceholders:a12 scalarParams:a11 labelArray:v132 dataTypeString:v146 trainingLogger:a15 predictedLabels:buf];
        if (v147 < 0) {
          operator delete(v146[0]);
        }
        memset(v145, 0, sizeof(v145));
        [(TransferSeqTagMLFHelper *)v138 labelIdsToString:buf labelArray:v132 labelStrings:v145];
        v114 = (void **)applesauce::CF::details::make_CFArrayRef<std::vector<std::string>>(v145);
        v189 = (uint8_t *)v114;
        CFDictionaryAddValue(theDict, kNLModelPredictedTrainingLabelsKey, v114);
        if (v114) {
          CFRelease(v114);
        }
        v189 = (uint8_t *)v145;
        std::vector<std::vector<std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v189);
        v145[0] = (long long **)buf;
        std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)v145);
      }
      CoreNLP::MontrealModel::MontrealModel((CoreNLP::MontrealModel *)v145, (const __CFData *)[v111 objectAtIndexedSubscript:0]);
      std::string::basic_string[abi:ne180100]<0>(v143, "Validation");
      [(TransferSeqTagMLFHelper *)v138 evaluateMontrealModelOnData:&v185 evalLabels:v183 evalEmbeddingsCache:&v174 embeddingRef:v137 montrealModel:v145 labelArray:v132 trainingLogger:a15 dataTypeString:v143 predictedLabels:&v159];
      float v116 = v115;
      if (v144 < 0) {
        operator delete(v143[0]);
      }
      if (v116 > v50)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218240;
          *(double *)&uint8_t buf[4] = v50;
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = v116;
          _os_log_debug_impl(&dword_193078000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "\nValidation f-1 improved from %f to %f", buf, 0x16u);
        }
        memset(buf, 0, sizeof(buf));
        [(TransferSeqTagMLFHelper *)v138 labelIdsToString:&v159 labelArray:v132 labelStrings:buf];
        v117 = (void **)applesauce::CF::details::make_CFArrayRef<std::vector<std::string>>((long long ***)buf);
        v189 = (uint8_t *)v117;
        if (CFDictionaryContainsKey(theDict, kNLModelPredictedValidationLabelsKey)) {
          CFDictionaryReplaceValue(theDict, kNLModelPredictedValidationLabelsKey, v117);
        }
        else {
          CFDictionaryAddValue(theDict, kNLModelPredictedValidationLabelsKey, v117);
        }
        if (v117) {
          CFRelease(v117);
        }
        v189 = buf;
        std::vector<std::vector<std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v189);
        float v50 = v116;
        v129 = v111;
      }
      else
      {
        id v111 = v129;
      }
      CoreNLP::MontrealModel::~MontrealModel((CoreNLP::MontrealModel *)v145);
      *(void *)buf = &v159;
      std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
      _Block_object_dispose(&v162, 8);
      ++v140;
    }
    while (v140 != v24);
  }
  else
  {
    id v111 = 0;
  }
  CFDictionaryAddValue(theDict, kNLModelTrainerModelDataArrayKey, v111);
  uint64_t v118 = (uint64_t)v180;
  v119 = v181;
  if (v181 != v180)
  {
    v120 = v181;
    do
    {
      v122 = (void *)*(v120 - 3);
      v120 -= 3;
      uint64_t v121 = v122;
      if (v122)
      {
        *(v119 - 2) = v121;
        operator delete(v121);
      }
      v119 = v120;
    }
    while (v120 != (void *)v118);
  }
  v181 = (void *)v118;
  v178 = v177;
  uint64_t v123 = (uint64_t)v174;
  v124 = v175;
  if (v175 != v174)
  {
    char v125 = v175;
    do
    {
      v127 = (void *)*(v125 - 3);
      v125 -= 3;
      v126 = v127;
      if (v127)
      {
        *(v124 - 2) = v126;
        operator delete(v126);
      }
      v124 = v125;
    }
    while (v125 != (void *)v123);
  }
  v175 = (void *)v123;
  (*((void (**)(id, uint64_t, char *))a15 + 2))(a15, [NSString stringWithFormat:@"Finished Training"], &v188);
  _Block_object_dispose(&__p, 8);
  _Block_object_dispose(&v170, 8);
  v170 = &v174;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v170);
  if (v177)
  {
    v178 = v177;
    operator delete(v177);
  }
  v170 = &v180;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v170);
  v170 = v183;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v170);
  v170 = v184;
  std::vector<std::vector<std::vector<int>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v170);
  v170 = &v185;
  std::vector<std::vector<std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v170);
  return theDict;
}

void __268__TransferSeqTagMLFHelper_doSeqTagTrainingAndEvalFromData_batchedLabels_batchedPaddedLabelDatasets_labelArray_embeddingRef_modeLayerList_trainingGraph_inferenceGraph_scalarParams_inputPlaceholders_targetLabelPlaceholders_targetLabelWeightsPlaceholders_trainingLogger___block_invoke(uint64_t a1, void *a2, double a3)
{
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 24)
                                                              + a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  uint64_t v4 = (float *)objc_msgSend((id)objc_msgSend(a2, "data"), "bytes");
  int v5 = v4;
  if (v4) {
    *(float *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *v4
  }
                                                               + *(float *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                          + 24);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    __268__TransferSeqTagMLFHelper_doSeqTagTrainingAndEvalFromData_batchedLabels_batchedPaddedLabelDatasets_labelArray_embeddingRef_modeLayerList_trainingGraph_inferenceGraph_scalarParams_inputPlaceholders_targetLabelPlaceholders_targetLabelWeightsPlaceholders_trainingLogger___block_invoke_cold_1(a1, v5);
  }
  if (*(void *)(a1 + 64) == 0xAAAAAAAAAAAAAAABLL
                             * ((uint64_t)(*(void *)(**(void **)(a1 + 72) + 24 * *(unsigned int *)(a1 + 80) + 8)
                                        - *(void *)(**(void **)(a1 + 72) + 24 * *(unsigned int *)(a1 + 80))) >> 3)
                             - 1)
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)labelIdsToString:(void *)a3 labelArray:(void *)a4 labelStrings:(void *)a5
{
  uint64_t v5 = *(void *)a3;
  if (*((void *)a3 + 1) != *(void *)a3)
  {
    unint64_t v9 = 0;
    do
    {
      uint64_t v18 = 0;
      uint64_t v19 = 0;
      unint64_t v20 = 0;
      uint64_t v11 = (uint64_t *)(v5 + 24 * v9);
      uint64_t v10 = *v11;
      if (v11[1] != *v11)
      {
        uint64_t v12 = 0;
        unint64_t v13 = 0;
        do
        {
          uint64_t v14 = *(void *)a4 + 24 * *(int *)(v10 + 4 * v13);
          if ((unint64_t)v12 >= v20)
          {
            uint64_t v12 = (std::string *)std::vector<std::string>::__push_back_slow_path<std::string const&>((uint64_t *)&v18, (long long *)v14);
          }
          else
          {
            if (*(char *)(v14 + 23) < 0)
            {
              std::string::__init_copy_ctor_external(v12, *(const std::string::value_type **)v14, *(void *)(v14 + 8));
            }
            else
            {
              long long v15 = *(_OWORD *)v14;
              v12->__r_.__value_.__r.__words[2] = *(void *)(v14 + 16);
              *(_OWORD *)&v12->__r_.__value_.__l.__data_ = v15;
            }
            ++v12;
          }
          uint64_t v19 = v12;
          ++v13;
          uint64_t v10 = *(void *)(*(void *)a3 + 24 * v9);
        }
        while (v13 < (*(void *)(*(void *)a3 + 24 * v9 + 8) - v10) >> 2);
      }
      unint64_t v16 = *((void *)a5 + 1);
      if (v16 >= *((void *)a5 + 2))
      {
        uint64_t v17 = std::vector<std::vector<std::string>>::__push_back_slow_path<std::vector<std::string> const&>((uint64_t *)a5, &v18);
      }
      else
      {
        std::vector<std::vector<std::string>>::__construct_one_at_end[abi:ne180100]<std::vector<std::string> const&>((uint64_t)a5, &v18);
        uint64_t v17 = v16 + 24;
      }
      *((void *)a5 + 1) = v17;
      uint64_t v21 = &v18;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v21);
      ++v9;
      uint64_t v5 = *(void *)a3;
    }
    while (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3) > v9);
  }
}

- (float)showF1ResultsMatrix:(void *)a3 labelCounts:()map<int perLabelResults:()int trainingLogger:()std:(std:(int>>> *)a4 :(void *)a5 allocator<std:(id)a6 :()basic_string<char pair<const)int :()std:(std::allocator<char>> *)a7 :char_traits<char> less<int> dataTypeString:
{
  int v10 = -1431655765 * ((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3);
  v37[0] = 0;
  std::vector<std::pair<float,float>>::vector(__p, v10, v37);
  char v35 = 0;
  (*((void (**)(id, uint64_t, char *))a6 + 2))(a6, [NSString stringWithFormat:@"\t\t Count \t\tLabel \t\t Prec \t\t Rec \t\t F-1"], &v35);
  int v34 = 0;
  if (v10 < 1)
  {
    float v13 = 0.0;
    float v12 = 0.0;
    float v11 = 0.0;
  }
  else
  {
    float v11 = 0.0;
    float v12 = 0.0;
    float v13 = 0.0;
    do
    {
      int v14 = 0;
      int v15 = 0;
      for (int i = 0; i < v10; ++i)
      {
        v37[0] = &v34;
        unint64_t v16 = std::__tree<std::__value_type<CoreNLP::NLTagSchemeType,std::map<NLLanguageID,CoreNLP::AbstractModel *>>,std::__map_value_compare<CoreNLP::NLTagSchemeType,std::__value_type<CoreNLP::NLTagSchemeType,std::map<NLLanguageID,CoreNLP::AbstractModel *>>,std::less<CoreNLP::NLTagSchemeType>,true>,std::allocator<std::__value_type<CoreNLP::NLTagSchemeType,std::map<NLLanguageID,CoreNLP::AbstractModel *>>>>::__emplace_unique_key_args<CoreNLP::NLTagSchemeType,std::piecewise_construct_t const&,std::tuple<CoreNLP::NLTagSchemeType const&>,std::tuple<>>((uint64_t **)a5, &v34, (uint64_t)&std::piecewise_construct, v37);
        v37[0] = &i;
        int v17 = *((_DWORD *)std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(v16 + 5, &i, (uint64_t)&std::piecewise_construct, v37)+ 8);
        v37[0] = &i;
        uint64_t v18 = std::__tree<std::__value_type<CoreNLP::NLTagSchemeType,std::map<NLLanguageID,CoreNLP::AbstractModel *>>,std::__map_value_compare<CoreNLP::NLTagSchemeType,std::__value_type<CoreNLP::NLTagSchemeType,std::map<NLLanguageID,CoreNLP::AbstractModel *>>,std::less<CoreNLP::NLTagSchemeType>,true>,std::allocator<std::__value_type<CoreNLP::NLTagSchemeType,std::map<NLLanguageID,CoreNLP::AbstractModel *>>>>::__emplace_unique_key_args<CoreNLP::NLTagSchemeType,std::piecewise_construct_t const&,std::tuple<CoreNLP::NLTagSchemeType const&>,std::tuple<>>((uint64_t **)a5, &i, (uint64_t)&std::piecewise_construct, v37);
        v37[0] = &v34;
        v15 += v17;
        v14 += *((_DWORD *)std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(v18 + 5, &v34, (uint64_t)&std::piecewise_construct, v37)+ 8);
      }
      float v19 = 0.0;
      float v20 = 0.0;
      if (v15)
      {
        v37[0] = &v34;
        uint64_t v21 = std::__tree<std::__value_type<CoreNLP::NLTagSchemeType,std::map<NLLanguageID,CoreNLP::AbstractModel *>>,std::__map_value_compare<CoreNLP::NLTagSchemeType,std::__value_type<CoreNLP::NLTagSchemeType,std::map<NLLanguageID,CoreNLP::AbstractModel *>>,std::less<CoreNLP::NLTagSchemeType>,true>,std::allocator<std::__value_type<CoreNLP::NLTagSchemeType,std::map<NLLanguageID,CoreNLP::AbstractModel *>>>>::__emplace_unique_key_args<CoreNLP::NLTagSchemeType,std::piecewise_construct_t const&,std::tuple<CoreNLP::NLTagSchemeType const&>,std::tuple<>>((uint64_t **)a5, &v34, (uint64_t)&std::piecewise_construct, v37);
        v37[0] = &v34;
        float v20 = (float)*((int *)std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(v21 + 5, &v34, (uint64_t)&std::piecewise_construct, v37)+ 8)/ (float)v15;
      }
      if (v14)
      {
        v37[0] = &v34;
        unint64_t v22 = std::__tree<std::__value_type<CoreNLP::NLTagSchemeType,std::map<NLLanguageID,CoreNLP::AbstractModel *>>,std::__map_value_compare<CoreNLP::NLTagSchemeType,std::__value_type<CoreNLP::NLTagSchemeType,std::map<NLLanguageID,CoreNLP::AbstractModel *>>,std::less<CoreNLP::NLTagSchemeType>,true>,std::allocator<std::__value_type<CoreNLP::NLTagSchemeType,std::map<NLLanguageID,CoreNLP::AbstractModel *>>>>::__emplace_unique_key_args<CoreNLP::NLTagSchemeType,std::piecewise_construct_t const&,std::tuple<CoreNLP::NLTagSchemeType const&>,std::tuple<>>((uint64_t **)a5, &v34, (uint64_t)&std::piecewise_construct, v37);
        v37[0] = &v34;
        float v19 = (float)*((int *)std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(v22 + 5, &v34, (uint64_t)&std::piecewise_construct, v37)+ 8)/ (float)v14;
      }
      id v23 = (float *)((char *)__p[0] + 8 * v34);
      *id v23 = v20;
      v23[1] = v19;
      unsigned int v24 = NSString;
      v37[0] = &v34;
      id v25 = std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t **)a4, &v34, (uint64_t)&std::piecewise_construct, v37);
      uint64_t v26 = *(void *)a3 + 24 * v34;
      if (*(char *)(v26 + 23) < 0) {
        uint64_t v26 = *(void *)v26;
      }
      float v27 = (float)(v20 + v19) * 0.5;
      (*((void (**)(id, uint64_t, char *))a6 + 2))(a6, objc_msgSend(v24, "stringWithFormat:", @"\t\t %d \t\t%s \t\t %4.2f \t\t %4.2f \t\t %4.2f", *((unsigned int *)v25 + 8), v26, v20, v19, v27), &v35);
      float v13 = v13 + v27;
      float v12 = v12 + v20;
      float v11 = v11 + v19;
      ++v34;
    }
    while (v34 < v10);
  }
  float v28 = v13 / (float)v10;
  var0 = a7;
  if (*((char *)&a7->var0.var0.var0.var1 + 23) < 0) {
    var0 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a7->var0.var0.var0.var1.var0;
  }
  (*((void (**)(id, uint64_t, char *))a6 + 2))(a6, objc_msgSend(NSString, "stringWithFormat:", @"Macro-average Precision = %4.2f Recall = %4.2f %s F-1 Score = %4.2f", (float)(v12 / (float)v10), (float)(v11 / (float)v10), var0, v28), &v35);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return v28;
}

- (float)evaluateMontrealModelOnData:(void *)a3 evalLabels:(void *)a4 evalEmbeddingsCache:(void *)a5 embeddingRef:(void *)a6 montrealModel:(void *)a7 labelArray:(void *)a8 trainingLogger:(id)a9 dataTypeString:()basic_string<char predictedLabels:()std:(std::allocator<char>> *)a10 :char_traits<char>
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  v84[0] = 0;
  v84[1] = 0;
  v82[1] = 0;
  v83 = (uint64_t *)v84;
  unint64_t v81 = (uint64_t *)v82;
  v82[0] = 0;
  LODWORD(v85) = 0;
  if (*((void *)a8 + 1) != *(void *)a8)
  {
    do
    {
      *(void *)buf = &v85;
      *((_DWORD *)std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(&v81, (int *)&v85, (uint64_t)&std::piecewise_construct, (unsigned int **)buf)+ 8) = 0;
      int v80 = 0;
      if (*((void *)a8 + 1) == *(void *)a8) {
        break;
      }
      do
      {
        *(void *)buf = &v85;
        float v12 = std::__tree<std::__value_type<CoreNLP::NLTagSchemeType,std::map<NLLanguageID,CoreNLP::AbstractModel *>>,std::__map_value_compare<CoreNLP::NLTagSchemeType,std::__value_type<CoreNLP::NLTagSchemeType,std::map<NLLanguageID,CoreNLP::AbstractModel *>>,std::less<CoreNLP::NLTagSchemeType>,true>,std::allocator<std::__value_type<CoreNLP::NLTagSchemeType,std::map<NLLanguageID,CoreNLP::AbstractModel *>>>>::__emplace_unique_key_args<CoreNLP::NLTagSchemeType,std::piecewise_construct_t const&,std::tuple<CoreNLP::NLTagSchemeType const&>,std::tuple<>>(&v83, (int *)&v85, (uint64_t)&std::piecewise_construct, (_DWORD **)buf);
        *(void *)buf = &v80;
        *((_DWORD *)std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(v12 + 5, &v80, (uint64_t)&std::piecewise_construct, (unsigned int **)buf)+ 8) = 0;
        unint64_t v13 = ++v80;
        unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a8 + 1) - *(void *)a8) >> 3);
      }
      while (v14 > v13);
      unint64_t v15 = (int)v85 + 1;
      LODWORD(v85) = v85 + 1;
    }
    while (v14 > v15);
  }
  char v79 = 0;
  unint64_t v16 = (void (**)(id, uint64_t, unsigned char *))a9;
  uint64_t v17 = (*((uint64_t (**)(id, uint64_t, char *))a9 + 2))(a9, objc_msgSend(NSString, "stringWithFormat:", @"Begin Validation...", a4, a5, a6), &v79);
  if (*((void *)a3 + 1) != *(void *)a3)
  {
    uint64_t v69 = self;
    unint64_t v18 = 0;
    float v19 = 0.0;
    float v20 = 0.0;
    uint64_t v21 = (CoreNLP::MontrealModel *)a7;
    while (1)
    {
      context = (void *)MEMORY[0x1996F94B0](v17);
      memset(buf, 0, sizeof(buf));
      unint64_t v22 = 0xAAAAAAAAAAAAAAABLL
          * ((uint64_t)(*(void *)(*(void *)a3 + 24 * v18 + 8) - *(void *)(*(void *)a3 + 24 * v18)) >> 3);
      CoreNLP::MontrealModel::setInput(v21, 1, (int)v22, *(void **)(*(void *)a5 + 24 * v18), 0);
      CoreNLP::MontrealModel::predict(v21);
      id v23 = (float *)CoreNLP::MontrealModel::output(v21, 0);
      uint64_t v24 = CoreNLP::MontrealModel::outputSize(v21);
      if ((int)v22 >= 1)
      {
        int v25 = 0;
        unint64_t v26 = v24 << 32;
        uint64_t v27 = 4 * (int)v24;
        do
        {
          float v28 = v23;
          if (v26 >> 33)
          {
            float v29 = *v23;
            uint64_t v30 = 4;
            float v28 = v23;
            do
            {
              if (v29 < v23[(unint64_t)v30 / 4])
              {
                float v29 = v23[(unint64_t)v30 / 4];
                float v28 = &v23[(unint64_t)v30 / 4];
              }
              v30 += 4;
            }
            while (v27 != v30);
          }
          unint64_t v31 = (unint64_t)((char *)v28 - (char *)v23) >> 2;
          uint64_t v32 = *(char **)&buf[8];
          if (*(void *)&buf[8] >= *(void *)&buf[16])
          {
            int v34 = *(char **)buf;
            uint64_t v35 = (uint64_t)(*(void *)&buf[8] - *(void *)buf) >> 2;
            unint64_t v36 = v35 + 1;
            if ((unint64_t)(v35 + 1) >> 62) {
              std::vector<CoreNLP::NLAttributedToken>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v37 = *(void *)&buf[16] - *(void *)buf;
            if ((uint64_t)(*(void *)&buf[16] - *(void *)buf) >> 1 > v36) {
              unint64_t v36 = v37 >> 1;
            }
            if ((unint64_t)v37 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v38 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v38 = v36;
            }
            if (v38)
            {
              uint64_t v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&buf[16], v38);
              int v34 = *(char **)buf;
              uint64_t v32 = *(char **)&buf[8];
            }
            else
            {
              uint64_t v39 = 0;
            }
            uint64_t v40 = &v39[4 * v35];
            *(_DWORD *)uint64_t v40 = v31;
            uint64_t v33 = v40 + 4;
            while (v32 != v34)
            {
              int v41 = *((_DWORD *)v32 - 1);
              v32 -= 4;
              *((_DWORD *)v40 - 1) = v41;
              v40 -= 4;
            }
            *(void *)buf = v40;
            *(void *)&buf[8] = v33;
            *(void *)&buf[16] = &v39[4 * v38];
            if (v34) {
              operator delete(v34);
            }
          }
          else
          {
            **(_DWORD **)&buf[8] = v31;
            uint64_t v33 = v32 + 4;
          }
          id v23 = (float *)((char *)v23 + v27);
          *(void *)&buf[8] = v33;
          ++v25;
        }
        while (v25 != v22);
      }
      unint64_t v42 = v89[1];
      if (v42 >= v89[2])
      {
        uint64_t v43 = std::vector<std::vector<int>>::__push_back_slow_path<std::vector<int> const&>(v89, (uint64_t)buf);
        uint64_t v21 = (CoreNLP::MontrealModel *)a7;
      }
      else
      {
        std::vector<std::vector<int>>::__construct_one_at_end[abi:ne180100]<std::vector<int> const&>((uint64_t)v89, (uint64_t)buf);
        uint64_t v21 = (CoreNLP::MontrealModel *)a7;
        uint64_t v43 = v42 + 24;
      }
      v89[1] = v43;
      unint64_t v44 = (*(void *)(*(void *)a3 + 24 * v18 + 8) - *(void *)(*(void *)a3 + 24 * v18)) / 24;
      if (*(void *)(*(void *)a3 + 24 * v18 + 8) == *(void *)(*(void *)a3 + 24 * v18))
      {
        unint64_t v46 = 0;
      }
      else
      {
        uint64_t v45 = 0;
        unint64_t v46 = 0;
        if (v44 <= 1) {
          uint64_t v47 = 1;
        }
        else {
          uint64_t v47 = (*(void *)(*(void *)a3 + 24 * v18 + 8) - *(void *)(*(void *)a3 + 24 * v18)) / 24;
        }
        char v48 = 1;
        do
        {
          int v80 = 0;
          int v80 = *(_DWORD *)(*(void *)(*(void *)a4 + 24 * v18) + 4 * v45);
          int v49 = *(_DWORD *)(*(void *)buf + 4 * v45);
          v85 = &v80;
          float v50 = std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(&v81, &v80, (uint64_t)&std::piecewise_construct, (unsigned int **)&v85);
          ++*((_DWORD *)v50 + 8);
          BOOL v51 = v80 == v49;
          int v78 = v80;
          v85 = &v78;
          unint64_t v52 = std::__tree<std::__value_type<CoreNLP::NLTagSchemeType,std::map<NLLanguageID,CoreNLP::AbstractModel *>>,std::__map_value_compare<CoreNLP::NLTagSchemeType,std::__value_type<CoreNLP::NLTagSchemeType,std::map<NLLanguageID,CoreNLP::AbstractModel *>>,std::less<CoreNLP::NLTagSchemeType>,true>,std::allocator<std::__value_type<CoreNLP::NLTagSchemeType,std::map<NLLanguageID,CoreNLP::AbstractModel *>>>>::__emplace_unique_key_args<CoreNLP::NLTagSchemeType,std::piecewise_construct_t const&,std::tuple<CoreNLP::NLTagSchemeType const&>,std::tuple<>>(&v83, &v78, (uint64_t)&std::piecewise_construct, &v85);
          int v77 = v49;
          v85 = &v77;
          uint64_t v53 = std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(v52 + 5, &v77, (uint64_t)&std::piecewise_construct, (unsigned int **)&v85);
          v46 += v51;
          v48 &= v51;
          ++*((_DWORD *)v53 + 8);
          ++v45;
        }
        while (v47 != v45);
        uint64_t v21 = (CoreNLP::MontrealModel *)a7;
        if ((v48 & 1) == 0) {
          goto LABEL_44;
        }
      }
      float v19 = v19 + 1.0;
LABEL_44:
      if (*(void *)buf)
      {
        *(void *)&buf[8] = *(void *)buf;
        operator delete(*(void **)buf);
      }
      float v20 = v20 + (float)((float)v46 / (float)v44);
      ++v18;
      unint64_t v54 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3);
      if (v54 <= v18)
      {
        unint64_t v16 = (void (**)(id, uint64_t, unsigned char *))a9;
        self = v69;
        goto LABEL_49;
      }
    }
  }
  unint64_t v54 = 0;
  float v20 = 0.0;
  float v19 = 0.0;
LABEL_49:
  v55 = a10;
  var0 = a10;
  if (*((char *)&a10->var0.var0.var0.var1 + 23) < 0) {
    var0 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a10->var0.var0.var0.var1.var0;
  }
  v16[2](v16, objc_msgSend(NSString, "stringWithFormat:", @"%s data prediction completed.\n", var0), &v79);
  std::map<int,int>::map[abi:ne180100](v76, (uint64_t)&v81);
  if (*((char *)&a10->var0.var0.var0.var1 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v75, a10->var0.var0.var0.var1.var0, a10->var0.var0.var0.var1.var1);
  }
  else {
    std::string v75 = (std::string)a10->var0.var0;
  }
  [(TransferSeqTagMLFHelper *)self showF1ResultsMatrix:a8 labelCounts:v76 perLabelResults:&v83 trainingLogger:v16 dataTypeString:&v75];
  float v58 = v57;
  float v59 = v20 / (float)v54;
  if (SHIBYTE(v75.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v75.__r_.__value_.__l.__data_);
  }
  std::__tree<std::__value_type<NLLanguageID,__CFString const*>,std::__map_value_compare<NLLanguageID,std::__value_type<NLLanguageID,__CFString const*>,std::less<NLLanguageID>,true>,std::allocator<std::__value_type<NLLanguageID,__CFString const*>>>::destroy((uint64_t)v76, (void *)v76[1]);
  v16[2](v16, [NSString stringWithFormat:@"Average Tag Accuracy = %4.2f, Average Instance Accuracy = %4.2f \n", v59, (float)(v19 / (float)v54)], &v79);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    if (*((char *)&a10->var0.var0.var0.var1 + 23) < 0) {
      v55 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a10->var0.var0.var0.var1.var0;
    }
    *(_DWORD *)buf = 134218498;
    *(double *)&uint8_t buf[4] = v59;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v55;
    *(_WORD *)&buf[22] = 2048;
    double v87 = v58;
    _os_log_debug_impl(&dword_193078000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Montreal Average Tag Accuracy = %4.2f, %s F-1 score = %4.2f \n", buf, 0x20u);
  }
  BOOL v60 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
  if (v60) {
    -[TransferSeqTagMLFHelper evaluateMontrealModelOnData:evalLabels:evalEmbeddingsCache:embeddingRef:montrealModel:labelArray:trainingLogger:dataTypeString:predictedLabels:](v60, v61, v62, v63, v64, v65, v66, v67);
  }
  std::__tree<std::__value_type<NLLanguageID,__CFString const*>,std::__map_value_compare<NLLanguageID,std::__value_type<NLLanguageID,__CFString const*>,std::less<NLLanguageID>,true>,std::allocator<std::__value_type<NLLanguageID,__CFString const*>>>::destroy((uint64_t)&v81, v82[0]);
  std::__tree<std::__value_type<NLLanguageID,std::map<long,__CFString const*>>,std::__map_value_compare<NLLanguageID,std::__value_type<NLLanguageID,std::map<long,__CFString const*>>,std::less<NLLanguageID>,true>,std::allocator<std::__value_type<NLLanguageID,std::map<long,__CFString const*>>>>::destroy((uint64_t)&v83, v84[0]);
  return v58;
}

- (void)evaluateInferenceGraphWithInputTensorData:(void *)a3 batchedInputSentences:(void *)a4 batchedLabels:(void *)a5 inferenceGraph:(id)a6 inputPlaceholders:(void *)a7 scalarParams:(void *)a8 labelArray:(void *)a9 dataTypeString:()basic_string<char trainingLogger:()std:(std::allocator<char>> *)a10 :char_traits<char> predictedLabels:
{
  unint64_t v13 = self;
  unint64_t v14 = a9;
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v15 = [(NSDictionary *)self->_trainingParameters objectForKeyedSubscript:@"maxLength"];
  if (v15) {
    uint64_t v72 = [v15 intValue];
  }
  else {
    uint64_t v72 = 30;
  }
  id v16 = [(NSDictionary *)v13->_trainingParameters objectForKeyedSubscript:@"batchSize"];
  if (v16) {
    unsigned int v75 = [v16 intValue];
  }
  else {
    unsigned int v75 = 32;
  }
  v91[0] = 0;
  v91[1] = 0;
  v89[1] = 0;
  v90 = (uint64_t *)v91;
  uint64_t v88 = (uint64_t *)v89;
  v89[0] = 0;
  LODWORD(v86[0]) = 0;
  if (*((void *)a9 + 1) != *(void *)a9)
  {
    do
    {
      *(void *)buf = v86;
      *((_DWORD *)std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(&v88, (int *)v86, (uint64_t)&std::piecewise_construct, (unsigned int **)buf)+ 8) = 0;
      LODWORD(__p) = 0;
      if (*((void *)a9 + 1) == *(void *)a9) {
        break;
      }
      do
      {
        *(void *)buf = v86;
        uint64_t v17 = std::__tree<std::__value_type<CoreNLP::NLTagSchemeType,std::map<NLLanguageID,CoreNLP::AbstractModel *>>,std::__map_value_compare<CoreNLP::NLTagSchemeType,std::__value_type<CoreNLP::NLTagSchemeType,std::map<NLLanguageID,CoreNLP::AbstractModel *>>,std::less<CoreNLP::NLTagSchemeType>,true>,std::allocator<std::__value_type<CoreNLP::NLTagSchemeType,std::map<NLLanguageID,CoreNLP::AbstractModel *>>>>::__emplace_unique_key_args<CoreNLP::NLTagSchemeType,std::piecewise_construct_t const&,std::tuple<CoreNLP::NLTagSchemeType const&>,std::tuple<>>(&v90, (int *)v86, (uint64_t)&std::piecewise_construct, (_DWORD **)buf);
        *(void *)buf = &__p;
        *((_DWORD *)std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(v17 + 5, (int *)&__p, (uint64_t)&std::piecewise_construct, (unsigned int **)buf)+ 8) = 0;
        unint64_t v18 = (int)__p + 1;
        LODWORD(__p) = __p + 1;
        unint64_t v19 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a9 + 1) - *(void *)a9) >> 3);
      }
      while (v19 > v18);
      unint64_t v20 = SLODWORD(v86[0]) + 1;
      ++LODWORD(v86[0]);
    }
    while (v19 > v20);
  }
  char v87 = 0;
  (*(void (**)(uint64_t, uint64_t, char *))(v98 + 16))(v98, [NSString stringWithFormat:@"Begin Validation..."], &v87);
  char v79 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v21 = *(void *)a8;
  if (*((void *)a8 + 1) != *(void *)a8)
  {
    unint64_t v22 = 0;
    do
    {
      objc_msgSend(v79, "setObject:forKey:", objc_msgSend(*(id *)(v21 + 8 * v22), "data"), objc_msgSend(*(id *)(*(void *)a8 + 8 * v22), "label"));
      ++v22;
      uint64_t v21 = *(void *)a8;
    }
    while (v22 < (uint64_t)(*((void *)a8 + 1) - *(void *)a8) >> 3);
  }
  if (*((void *)a3 + 1) != *(void *)a3)
  {
    unint64_t v23 = 0;
    int v24 = v75;
    float v25 = (float)(int)v75;
    if (v75 <= 1) {
      int v24 = 1;
    }
    uint64_t v77 = v24;
    float v26 = 0.0;
    float v27 = 0.0;
    unint64_t v70 = v13;
    unint64_t v68 = a3;
    uint64_t v69 = a7;
    while (1)
    {
      context = (void *)MEMORY[0x1996F94B0]();
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
        -[TransferSeqTagMLFHelper evaluateInferenceGraphWithInputTensorData:batchedInputSentences:batchedLabels:inferenceGraph:inputPlaceholders:scalarParams:labelArray:dataTypeString:trainingLogger:predictedLabels:](v95, v23, &v96);
      }
      memset(buf, 0, sizeof(buf));
      memset(v86, 0, sizeof(v86));
      uint64_t v28 = *(void *)a7;
      if (*((void *)a7 + 1) != *(void *)a7)
      {
        unint64_t v29 = 0;
        do
        {
          objc_msgSend(v79, "setObject:forKey:", *(void *)(*(void *)(*(void *)a3 + 24 * v23) + 8 * v29), objc_msgSend(*(id *)(v28 + 8 * v29), "label"));
          ++v29;
          uint64_t v28 = *(void *)a7;
        }
        while (v29 < (uint64_t)(*((void *)a7 + 1) - *(void *)a7) >> 3);
      }
      [(TransferSeqTagMLFHelper *)v13 executeInferenceGraph:a6 inputsDictionary:v79 batchSize:v75 maxLength:v72 labelSize:-1431655765 * ((v14[1] - *v14) >> 3) predictedLabels:buf];
      [(TransferSeqTagMLFHelper *)v13 getMaxIndicesFromOneHotVectors:*(void *)a5 + 24 * v23 maxIndicesBatch:v86];
      if (v75) {
        break;
      }
      float v31 = 0.0;
LABEL_40:
      __p = v86;
      std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
      v86[0] = (void **)buf;
      std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100](v86);
      float v26 = v26 / v25;
      float v27 = v27 + (float)(v31 / v25);
      ++v23;
      a3 = v68;
      a7 = v69;
      unint64_t v14 = a9;
      unint64_t v13 = v70;
      if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v68[1] - *v68) >> 3) <= v23) {
        goto LABEL_43;
      }
    }
    uint64_t v30 = 0;
    float v31 = 0.0;
    unint64_t v76 = v23;
    while (1)
    {
      if (0xAAAAAAAAAAAAAAABLL
         * ((uint64_t)(*(void *)(*(void *)(*(void *)a4 + 24 * v23) + 24 * v30 + 8)
                    - *(void *)(*(void *)(*(void *)a4 + 24 * v23) + 24 * v30)) >> 3) >= (int)v72)
        unint64_t v32 = (int)v72;
      else {
        unint64_t v32 = 0xAAAAAAAAAAAAAAABLL
      }
            * ((uint64_t)(*(void *)(*(void *)(*(void *)a4 + 24 * v23) + 24 * v30 + 8)
                       - *(void *)(*(void *)(*(void *)a4 + 24 * v23) + 24 * v30)) >> 3);
      uint64_t v33 = *(const void **)(*(void *)buf + 24 * v30);
      v84 = 0;
      uint64_t v85 = 0;
      __p = 0;
      std::vector<int>::__init_with_size[abi:ne180100]<std::__wrap_iter<int *>,std::__wrap_iter<int *>>(&__p, v33, (uint64_t)v33 + 4 * v32, v32);
      std::vector<std::vector<int>>::push_back[abi:ne180100](v99, (uint64_t)&__p);
      if (__p)
      {
        v84 = __p;
        operator delete(__p);
      }
      if (v32)
      {
        uint64_t v34 = 0;
        unint64_t v35 = 0;
        char v36 = 1;
        do
        {
          int v38 = *(_DWORD *)(*(void *)(*(void *)buf + 24 * v30) + 4 * v34);
          LODWORD(__p) = *((_DWORD *)v86[0][3 * v30] + v34);
          int v37 = (int)__p;
          p_p = &__p;
          uint64_t v39 = std::__tree<std::__value_type<CoreNLP::NLTagSchemeType,std::map<NLLanguageID,CoreNLP::AbstractModel *>>,std::__map_value_compare<CoreNLP::NLTagSchemeType,std::__value_type<CoreNLP::NLTagSchemeType,std::map<NLLanguageID,CoreNLP::AbstractModel *>>,std::less<CoreNLP::NLTagSchemeType>,true>,std::allocator<std::__value_type<CoreNLP::NLTagSchemeType,std::map<NLLanguageID,CoreNLP::AbstractModel *>>>>::__emplace_unique_key_args<CoreNLP::NLTagSchemeType,std::piecewise_construct_t const&,std::tuple<CoreNLP::NLTagSchemeType const&>,std::tuple<>>(&v90, (int *)&__p, (uint64_t)&std::piecewise_construct, (_DWORD **)&p_p);
          int v82 = v38;
          p_p = (void **)&v82;
          uint64_t v40 = std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(v39 + 5, &v82, (uint64_t)&std::piecewise_construct, (unsigned int **)&p_p);
          ++*((_DWORD *)v40 + 8);
          LODWORD(__p) = v37;
          p_p = &__p;
          int v41 = std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(&v88, (int *)&__p, (uint64_t)&std::piecewise_construct, (unsigned int **)&p_p);
          v35 += v37 == v38;
          v36 &= v37 == v38;
          ++*((_DWORD *)v41 + 8);
          ++v34;
        }
        while (v32 != v34);
        float v31 = v31 + (float)((float)v35 / (float)v32);
        unint64_t v23 = v76;
        if ((v36 & 1) == 0) {
          goto LABEL_37;
        }
      }
      else
      {
        float v31 = v31 + (float)(0.0 / (float)0);
      }
      float v26 = v26 + 1.0;
LABEL_37:
      if (++v30 == v77) {
        goto LABEL_40;
      }
    }
  }
  float v27 = 0.0;
  float v26 = 0.0;
LABEL_43:
  uint64_t v43 = *(void *)a5;
  uint64_t v42 = *((void *)a5 + 1);
  BOOL v44 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
  if (v44) {
    -[TransferSeqTagMLFHelper evaluateInferenceGraphWithInputTensorData:batchedInputSentences:batchedLabels:inferenceGraph:inputPlaceholders:scalarParams:labelArray:dataTypeString:trainingLogger:predictedLabels:](v44, v45, v46, v47, v48, v49, v50, v51);
  }
  unint64_t v52 = a10;
  var0 = a10;
  if (*((char *)&a10->var0.var0.var0.var1 + 23) < 0) {
    var0 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a10->var0.var0.var0.var1.var0;
  }
  (*(void (**)(uint64_t, uint64_t, char *))(v98 + 16))(v98, objc_msgSend(NSString, "stringWithFormat:", @"%s data prediction completed.\n", var0), &v87);
  std::map<int,int>::map[abi:ne180100](v81, (uint64_t)&v88);
  if (*((char *)&a10->var0.var0.var0.var1 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v80, a10->var0.var0.var0.var1.var0, a10->var0.var0.var0.var1.var1);
  }
  else {
    std::string v80 = (std::string)a10->var0.var0;
  }
  [(TransferSeqTagMLFHelper *)v13 showF1ResultsMatrix:v14 labelCounts:v81 perLabelResults:&v90 trainingLogger:v98 dataTypeString:&v80];
  float v55 = v54;
  float v56 = (float)(0xAAAAAAAAAAAAAAABLL * ((v42 - v43) >> 3));
  float v57 = v27 / v56;
  float v58 = v26 / v56;
  if (SHIBYTE(v80.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v80.__r_.__value_.__l.__data_);
  }
  std::__tree<std::__value_type<NLLanguageID,__CFString const*>,std::__map_value_compare<NLLanguageID,std::__value_type<NLLanguageID,__CFString const*>,std::less<NLLanguageID>,true>,std::allocator<std::__value_type<NLLanguageID,__CFString const*>>>::destroy((uint64_t)v81, (void *)v81[1]);
  double v59 = v57;
  (*(void (**)(uint64_t, uint64_t, char *))(v98 + 16))(v98, [NSString stringWithFormat:@"Average Tag Accuracy = %4.2f, Instance Accuracy = %4.2f \n", *(void *)&v59, v58], &v87);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    if (*((char *)&a10->var0.var0.var0.var1 + 23) < 0) {
      unint64_t v52 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a10->var0.var0.var0.var1.var0;
    }
    *(_DWORD *)buf = 134218498;
    *(double *)&uint8_t buf[4] = v59;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = v52;
    *(_WORD *)&buf[22] = 2048;
    double v94 = v55;
    _os_log_debug_impl(&dword_193078000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "MLF Average Tag Accuracy = %4.2f , %s F-1 Score = %4.2f\n", buf, 0x20u);
  }
  BOOL v60 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
  if (v60) {
    -[TransferSeqTagMLFHelper evaluateInferenceGraphWithInputTensorData:batchedInputSentences:batchedLabels:inferenceGraph:inputPlaceholders:scalarParams:labelArray:dataTypeString:trainingLogger:predictedLabels:](v60, v61, v62, v63, v64, v65, v66, v67);
  }
  std::__tree<std::__value_type<NLLanguageID,__CFString const*>,std::__map_value_compare<NLLanguageID,std::__value_type<NLLanguageID,__CFString const*>,std::less<NLLanguageID>,true>,std::allocator<std::__value_type<NLLanguageID,__CFString const*>>>::destroy((uint64_t)&v88, v89[0]);
  std::__tree<std::__value_type<NLLanguageID,std::map<long,__CFString const*>>,std::__map_value_compare<NLLanguageID,std::__value_type<NLLanguageID,std::map<long,__CFString const*>>,std::less<NLLanguageID>,true>,std::allocator<std::__value_type<NLLanguageID,std::map<long,__CFString const*>>>>::destroy((uint64_t)&v90, v91[0]);
}

- (void)executeInferenceGraph:(id)a3 inputsDictionary:(id)a4 batchSize:(int)a5 maxLength:(int)a6 labelSize:(int)a7 predictedLabels:(void *)a8
{
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x4812000000;
  v12[3] = __Block_byref_object_copy__2;
  v12[4] = __Block_byref_object_dispose__2;
  v12[5] = "";
  unint64_t v14 = 0;
  uint64_t v15 = 0;
  __p = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __112__TransferSeqTagMLFHelper_executeInferenceGraph_inputsDictionary_batchSize_maxLength_labelSize_predictedLabels___block_invoke;
  v8[3] = &unk_1E574C1F0;
  int v9 = a5;
  int v10 = a6;
  int v11 = a7;
  v8[4] = self;
  v8[5] = v12;
  v8[6] = a8;
  [a3 executeWithInputsData:a4 batchSize:a5 options:2 completionHandler:v8];
  _Block_object_dispose(v12, 8);
  if (__p)
  {
    unint64_t v14 = __p;
    operator delete(__p);
  }
}

uint64_t __112__TransferSeqTagMLFHelper_executeInferenceGraph_inputsDictionary_batchSize_maxLength_labelSize_predictedLabels___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "findMaxIndexWithData:batchSize:sequenceLength:numClasses:", objc_msgSend(a2, "data"), *(int *)(a1 + 56), *(int *)(a1 + 60), *(int *)(a1 + 64));
  if (*(_DWORD *)(a1 + 56))
  {
    uint64_t v4 = (void *)result;
    unint64_t v5 = 0;
    do
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 56) = *(void *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                              + 48);
      if (*(_DWORD *)(a1 + 60))
      {
        unint64_t v6 = 0;
        do
        {
          uint64_t v7 = *(void *)([v4 bytes] + 8 * (v6 + v5 * *(int *)(a1 + 60)));
          uint64_t v8 = *(void **)(*(void *)(a1 + 40) + 8);
          int v9 = (char *)v8[7];
          unint64_t v10 = v8[8];
          if ((unint64_t)v9 >= v10)
          {
            float v12 = (char *)v8[6];
            uint64_t v13 = (v9 - v12) >> 2;
            if ((unint64_t)(v13 + 1) >> 62) {
              std::vector<CoreNLP::NLAttributedToken>::__throw_length_error[abi:ne180100]();
            }
            unint64_t v14 = v10 - (void)v12;
            unint64_t v15 = (uint64_t)(v10 - (void)v12) >> 1;
            if (v15 <= v13 + 1) {
              unint64_t v15 = v13 + 1;
            }
            if (v14 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v16 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v16 = v15;
            }
            if (v16)
            {
              uint64_t v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)(v8 + 8), v16);
              float v12 = (char *)v8[6];
              int v9 = (char *)v8[7];
            }
            else
            {
              uint64_t v17 = 0;
            }
            unint64_t v18 = &v17[4 * v13];
            *(_DWORD *)unint64_t v18 = v7;
            int v11 = v18 + 4;
            while (v9 != v12)
            {
              int v19 = *((_DWORD *)v9 - 1);
              v9 -= 4;
              *((_DWORD *)v18 - 1) = v19;
              v18 -= 4;
            }
            v8[6] = v18;
            void v8[7] = v11;
            v8[8] = &v17[4 * v16];
            if (v12) {
              operator delete(v12);
            }
          }
          else
          {
            *(_DWORD *)int v9 = v7;
            int v11 = v9 + 4;
          }
          void v8[7] = v11;
          ++v6;
        }
        while (v6 < *(int *)(a1 + 60));
      }
      unint64_t v20 = *(uint64_t **)(a1 + 48);
      uint64_t v21 = *(void *)(*(void *)(a1 + 40) + 8) + 48;
      unint64_t v22 = v20[1];
      if (v22 >= v20[2])
      {
        uint64_t result = std::vector<std::vector<int>>::__push_back_slow_path<std::vector<int> const&>(v20, v21);
      }
      else
      {
        std::vector<std::vector<int>>::__construct_one_at_end[abi:ne180100]<std::vector<int> const&>((uint64_t)v20, v21);
        uint64_t result = v22 + 24;
      }
      v20[1] = result;
      ++v5;
    }
    while (v5 < *(int *)(a1 + 56));
  }
  return result;
}

- (NSDictionary)trainingParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)printLstmWeights:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_193078000, MEMORY[0x1E4F14500], a3, "\n=============================================\n", a5, a6, a7, a8, 0);
}

- (double)printLstmWeights:(uint8_t *)buf .cold.2(uint64_t a1, uint64_t a2, uint8_t *buf, double *a4)
{
  double v4 = *(float *)(a1 + 4 * a2);
  *(_DWORD *)buf = 134217984;
  *a4 = v4;
  _os_log_debug_impl(&dword_193078000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "\t%f", buf, 0xCu);
  return result;
}

- (void)printLstmWeights:(uint64_t *)a3 .cold.3(uint8_t *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend(&unk_1EE3B8238, "objectAtIndexedSubscript:", a2), "UTF8String");
  *(_DWORD *)a1 = 136315138;
  *a3 = v5;
  _os_log_debug_impl(&dword_193078000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "\nW_type:%s\n", a1, 0xCu);
}

- (void)printLstmWeights:(_DWORD *)a3 .cold.4(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_debug_impl(&dword_193078000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Gate#:%d\n", buf, 8u);
}

- (void)printLstmWeights:(unsigned char *)a1 .cold.5(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_2_0(a1, a2);
  OUTLINED_FUNCTION_1_2(&dword_193078000, MEMORY[0x1E4F14500], v2, "\n====================\n", v3);
}

- (void)printLstmWeights:(uint64_t)a3 .cold.6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_193078000, MEMORY[0x1E4F14500], a3, "\n===============LSTM Weights==================\n", a5, a6, a7, a8, 0);
}

- (void)createTrainingGraphFromGraphObject:(void *)a1 inputPlaceholders:scalarWeights:targetLabels:targeLabelWeights:device:.cold.1(void *a1)
{
  objc_begin_catch(a1);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    OUTLINED_FUNCTION_0_0(&dword_193078000, MEMORY[0x1E4F14500], v1, "\nError creating Training Graph", v2, v3, v4, v5, 0);
  }
  objc_end_catch();
}

- (void)createInferenceGraphFromGraphObject:(void *)a1 inputPlaceholders:scalarWeights:finalLayerTensor:device:.cold.1(void *a1)
{
  objc_begin_catch(a1);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    OUTLINED_FUNCTION_0_0(&dword_193078000, MEMORY[0x1E4F14500], v1, "\nError creating Inference Graph", v2, v3, v4, v5, 0);
  }
  objc_end_catch();
}

- (void)doSeqTagTrainingAndEvalFromData:(unsigned char *)a1 batchedLabels:(unsigned char *)a2 batchedPaddedLabelDatasets:labelArray:embeddingRef:modeLayerList:trainingGraph:inferenceGraph:scalarParams:inputPlaceholders:targetLabelPlaceholders:targetLabelWeightsPlaceholders:trainingLogger:.cold.1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_2_0(a1, a2);
  OUTLINED_FUNCTION_1_2(&dword_193078000, MEMORY[0x1E4F14500], v2, "\n=========================================================================================\n", v3);
}

- (void)doSeqTagTrainingAndEvalFromData:(unsigned char *)a1 batchedLabels:(unsigned char *)a2 batchedPaddedLabelDatasets:labelArray:embeddingRef:modeLayerList:trainingGraph:inferenceGraph:scalarParams:inputPlaceholders:targetLabelPlaceholders:targetLabelWeightsPlaceholders:trainingLogger:.cold.2(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_2_0(a1, a2);
  OUTLINED_FUNCTION_1_2(&dword_193078000, MEMORY[0x1E4F14500], v2, "\nLast batch completed", v3);
}

- (void)doSeqTagTrainingAndEvalFromData:(unsigned char *)a1 batchedLabels:(unsigned char *)a2 batchedPaddedLabelDatasets:labelArray:embeddingRef:modeLayerList:trainingGraph:inferenceGraph:scalarParams:inputPlaceholders:targetLabelPlaceholders:targetLabelWeightsPlaceholders:trainingLogger:.cold.3(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_2_0(a1, a2);
  OUTLINED_FUNCTION_1_2(&dword_193078000, MEMORY[0x1E4F14500], v2, "\nWaiting for completion of the last batch", v3);
}

- (void)doSeqTagTrainingAndEvalFromData:(uint64_t)a3 batchedLabels:(uint64_t)a4 batchedPaddedLabelDatasets:(uint64_t)a5 labelArray:(uint64_t)a6 embeddingRef:(uint64_t)a7 modeLayerList:(uint64_t)a8 trainingGraph:inferenceGraph:scalarParams:inputPlaceholders:targetLabelPlaceholders:targetLabelWeightsPlaceholders:trainingLogger:.cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

double __268__TransferSeqTagMLFHelper_doSeqTagTrainingAndEvalFromData_batchedLabels_batchedPaddedLabelDatasets_labelArray_embeddingRef_modeLayerList_trainingGraph_inferenceGraph_scalarParams_inputPlaceholders_targetLabelPlaceholders_targetLabelWeightsPlaceholders_trainingLogger___block_invoke_cold_1(uint64_t a1, float *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 64);
  double v3 = *a2;
  v5[0] = 67109376;
  v5[1] = v2;
  __int16 v6 = 2048;
  double v7 = v3;
  _os_log_debug_impl(&dword_193078000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "\nBatch No.: [%d]. Loss = %4.2f", (uint8_t *)v5, 0x12u);
  return result;
}

- (void)evaluateMontrealModelOnData:(uint64_t)a3 evalLabels:(uint64_t)a4 evalEmbeddingsCache:(uint64_t)a5 embeddingRef:(uint64_t)a6 montrealModel:(uint64_t)a7 labelArray:(uint64_t)a8 trainingLogger:dataTypeString:predictedLabels:.cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_193078000, MEMORY[0x1E4F14500], a3, "\n=========================================================================================\n", a5, a6, a7, a8, 0);
}

- (void)evaluateInferenceGraphWithInputTensorData:(uint64_t)a3 batchedInputSentences:(uint64_t)a4 batchedLabels:(uint64_t)a5 inferenceGraph:(uint64_t)a6 inputPlaceholders:(uint64_t)a7 scalarParams:(uint64_t)a8 labelArray:dataTypeString:trainingLogger:predictedLabels:.cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_193078000, MEMORY[0x1E4F14500], a3, "=========================================================================================\n", a5, a6, a7, a8, 0);
}

- (void)evaluateInferenceGraphWithInputTensorData:(_DWORD *)a3 batchedInputSentences:batchedLabels:inferenceGraph:inputPlaceholders:scalarParams:labelArray:dataTypeString:trainingLogger:predictedLabels:.cold.3(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_debug_impl(&dword_193078000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Eval Batch No.: [%d]. \n", buf, 8u);
}

@end