@interface MLNeuralNetworkMLComputeLayer
+ (id)adamOptimizerWithLearningRate:(double)a3 beta1:(double)a4 beta2:(double)a5 epsilon:(double)a6 timeStep:(unint64_t)a7;
+ (id)batchNormLayerWithFeatureChannels:(unint64_t)a3 varianceEpsilon:(float)a4 gamma:(id)a5 beta:(id)a6 mean:(id)a7 variance:(id)a8;
+ (id)categoricalCrossEntropyLossWithNumberOfClasses:(unint64_t)a3;
+ (id)concatNDLayerWithAxis:(unint64_t)a3;
+ (id)convolutionalLayerWithKernelHeight:(unint64_t)a3 kernelWidth:(unint64_t)a4 inputChannels:(unint64_t)a5 outputChannels:(unint64_t)a6 strideInX:(unint64_t)a7 strideInY:(unint64_t)a8 dilationRateInX:(unint64_t)a9 dilationRateInY:(unint64_t)a10 nGroups:(unint64_t)a11 weight:(id)a12 bias:(id)a13 paddingPolicy:(int)a14;
+ (id)fullyConnectedLayerWithKernelWidth:(unint64_t)a3 kernelHeight:(unint64_t)a4 inputChannels:(unint64_t)a5 outputChannels:(unint64_t)a6 weight:(id)a7 bias:(id)a8;
+ (id)leakyRelu;
+ (id)matMulLayerWithTransposesX:(BOOL)a3 transposesY:(BOOL)a4;
+ (id)meanSquaredErrorLoss;
+ (id)poolingLayerWithKernelWidth:(unint64_t)a3 kernelHeight:(unint64_t)a4 strideInX:(unint64_t)a5 strideInY:(unint64_t)a6 paddingPolicy:(int)a7 poolingType:(int)a8;
+ (id)relu;
+ (id)reluNLayerWithAlpha:(float)a3 beta:(float)a4;
+ (id)reshapeLayerWithChannelFirstOrderingAndTargetShape:(id)a3;
+ (id)sgdOptimizerWithLearningRate:(double)a3 momentum:(double)a4;
+ (id)sigmoid;
+ (id)softmax;
+ (id)transposeLayerWithAxes:(id)a3;
+ (id)uniDirectionalLSTMLayerWithInputSize:(unint64_t)a3 outputSize:(unint64_t)a4 inputWeightsData:(id)a5 recursionWeightsData:(id)a6 hasBias:(BOOL)a7 biasTermsData:(id)a8 sequenceOutput:(BOOL)a9 inputGateActivation:(id)a10 cellGateActivation:(id)a11 hiddenOutputActivation:(id)a12;
@end

@implementation MLNeuralNetworkMLComputeLayer

+ (id)adamOptimizerWithLearningRate:(double)a3 beta1:(double)a4 beta2:(double)a5 epsilon:(double)a6 timeStep:(unint64_t)a7
{
  double v9 = a5;
  double v10 = a4;
  *(float *)&a3 = a3;
  LODWORD(a4) = 1.0;
  LODWORD(a5) = 1.0;
  v11 = [MEMORY[0x1E4F30C48] descriptorWithLearningRate:0 gradientRescale:a3 regularizationType:a4 regularizationScale:a5];
  *(float *)&double v12 = v10;
  *(float *)&double v13 = v9;
  *(float *)&double v14 = a6;
  v15 = [MEMORY[0x1E4F30BD0] optimizerWithDescriptor:v11 beta1:a7 beta2:v12 epsilon:v13 timeStep:v14];

  return v15;
}

+ (id)sgdOptimizerWithLearningRate:(double)a3 momentum:(double)a4
{
  double v5 = a4;
  *(float *)&a3 = a3;
  LODWORD(a4) = 1.0;
  LODWORD(v4) = 1.0;
  v6 = [MEMORY[0x1E4F30C48] descriptorWithLearningRate:0 gradientRescale:a3 regularizationType:a4 regularizationScale:v4];
  *(float *)&double v7 = v5;
  v8 = [MEMORY[0x1E4F30C68] optimizerWithDescriptor:v6 momentumScale:0 usesNesterovMomentum:v7];

  return v8;
}

+ (id)meanSquaredErrorLoss
{
  LODWORD(v2) = 1.0;
  v3 = [MEMORY[0x1E4F30C28] descriptorWithType:1 reductionType:2 weight:1 labelSmoothing:v2 classCount:0.0];
  double v4 = [MEMORY[0x1E4F30C30] layerWithDescriptor:v3];

  return v4;
}

+ (id)categoricalCrossEntropyLossWithNumberOfClasses:(unint64_t)a3
{
  LODWORD(v3) = 1.0;
  double v4 = [MEMORY[0x1E4F30C28] descriptorWithType:2 reductionType:2 weight:a3 labelSmoothing:v3 classCount:0.0];
  double v5 = [MEMORY[0x1E4F30C30] layerWithDescriptor:v4];

  return v5;
}

+ (id)matMulLayerWithTransposesX:(BOOL)a3 transposesY:(BOOL)a4
{
  LODWORD(v4) = 1.0;
  double v5 = [MEMORY[0x1E4F30C38] descriptorWithAlpha:a3 transposesX:a4 transposesY:v4];
  v6 = [MEMORY[0x1E4F30C40] layerWithDescriptor:v5];

  return v6;
}

+ (id)reluNLayerWithAlpha:(float)a3 beta:(float)a4
{
  double v4 = objc_msgSend(MEMORY[0x1E4F30BC0], "descriptorWithType:a:b:", 10);
  double v5 = [MEMORY[0x1E4F30BC8] layerWithDescriptor:v4];

  return v5;
}

+ (id)leakyRelu
{
  LODWORD(v2) = 1036831949;
  double v3 = [MEMORY[0x1E4F30BC0] descriptorWithType:1 a:v2];
  double v4 = [MEMORY[0x1E4F30BC8] layerWithDescriptor:v3];

  return v4;
}

+ (id)relu
{
  double v2 = [MEMORY[0x1E4F30BC0] descriptorWithType:1 a:0.0];
  double v3 = [MEMORY[0x1E4F30BC8] layerWithDescriptor:v2];

  return v3;
}

+ (id)softmax
{
  return (id)[MEMORY[0x1E4F30C70] layerWithOperation:0];
}

+ (id)sigmoid
{
  double v2 = [MEMORY[0x1E4F30BC0] descriptorWithType:3];
  double v3 = [MEMORY[0x1E4F30BC8] layerWithDescriptor:v2];

  return v3;
}

+ (id)poolingLayerWithKernelWidth:(unint64_t)a3 kernelHeight:(unint64_t)a4 strideInX:(unint64_t)a5 strideInY:(unint64_t)a6 paddingPolicy:(int)a7 poolingType:(int)a8
{
  uint64_t v8 = *(void *)&a7;
  v27[2] = *MEMORY[0x1E4F143B8];
  if (a8 == 2)
  {
    v20 = (void *)MEMORY[0x1E4F30C50];
    double v13 = [NSNumber numberWithUnsignedInteger:a4];
    v25[0] = v13;
    double v14 = [NSNumber numberWithUnsignedInteger:a3];
    v25[1] = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
    v16 = [NSNumber numberWithUnsignedInteger:a6];
    v24[0] = v16;
    v17 = [NSNumber numberWithUnsignedInteger:a5];
    v24[1] = v17;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
    uint64_t v19 = [v20 averagePoolingDescriptorWithKernelSizes:v15 strides:v18 paddingPolicy:v8 paddingSizes:0 countIncludesPadding:0];
    goto LABEL_5;
  }
  if (a8 == 1)
  {
    double v12 = (void *)MEMORY[0x1E4F30C50];
    double v13 = [NSNumber numberWithUnsignedInteger:a4];
    v27[0] = v13;
    double v14 = [NSNumber numberWithUnsignedInteger:a3];
    v27[1] = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
    v16 = [NSNumber numberWithUnsignedInteger:a6];
    v26[0] = v16;
    v17 = [NSNumber numberWithUnsignedInteger:a5];
    v26[1] = v17;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    uint64_t v19 = [v12 maxPoolingDescriptorWithKernelSizes:v15 strides:v18 paddingPolicy:v8 paddingSizes:0];
LABEL_5:
    v21 = (void *)v19;

    goto LABEL_7;
  }
  v21 = 0;
LABEL_7:
  v22 = [MEMORY[0x1E4F30C58] layerWithDescriptor:v21];

  return v22;
}

+ (id)transposeLayerWithAxes:(id)a3
{
  return (id)[MEMORY[0x1E4F30C98] layerWithDimensions:a3];
}

+ (id)concatNDLayerWithAxis:(unint64_t)a3
{
  return (id)[MEMORY[0x1E4F30BE0] layerWithDimension:a3];
}

+ (id)reshapeLayerWithChannelFirstOrderingAndTargetShape:(id)a3
{
  return (id)[MEMORY[0x1E4F30C60] layerWithShape:a3];
}

+ (id)batchNormLayerWithFeatureChannels:(unint64_t)a3 varianceEpsilon:(float)a4 gamma:(id)a5 beta:(id)a6 mean:(id)a7 variance:(id)a8
{
  double v13 = (void *)MEMORY[0x1E4F30C78];
  id v14 = a8;
  id v15 = a6;
  id v16 = a5;
  v17 = [v13 tensorWithWidth:1 height:1 featureChannelCount:a3 batchSize:1 data:a7];
  v18 = [MEMORY[0x1E4F30C78] tensorWithWidth:1 height:1 featureChannelCount:a3 batchSize:1 data:v14];

  uint64_t v19 = [MEMORY[0x1E4F30C78] tensorWithWidth:1 height:1 featureChannelCount:a3 batchSize:1 data:v15];

  v20 = [MEMORY[0x1E4F30C78] tensorWithWidth:1 height:1 featureChannelCount:a3 batchSize:1 data:v16];

  *(float *)&double v21 = a4;
  v22 = [MEMORY[0x1E4F30BD8] layerWithFeatureChannelCount:a3 mean:v17 variance:v18 beta:v19 gamma:v20 varianceEpsilon:v21];

  return v22;
}

+ (id)uniDirectionalLSTMLayerWithInputSize:(unint64_t)a3 outputSize:(unint64_t)a4 inputWeightsData:(id)a5 recursionWeightsData:(id)a6 hasBias:(BOOL)a7 biasTermsData:(id)a8 sequenceOutput:(BOOL)a9 inputGateActivation:(id)a10 cellGateActivation:(id)a11 hiddenOutputActivation:(id)a12
{
  BOOL v13 = a7;
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  id v52 = a10;
  id v51 = a11;
  id v50 = a12;
  uint64_t v18 = [v15 count];
  if (v18 != [v16 count]) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"inputWeightsData.count (%tu) != recursionWeightsData.count (%tu)", objc_msgSend(v15, "count"), objc_msgSend(v16, "count"));
  }
  v48 = v16;
  if (v13)
  {
    uint64_t v19 = [v17 count];
    if (v19 != [v15 count]) {
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"biasTermsData.count (%tu) != inputWeightsData.count (%tu)", objc_msgSend(v17, "count"), objc_msgSend(v15, "count"), v16);
    }
  }
  BOOL v53 = v13;
  v20 = (void *)MEMORY[0x1E4F1CBF0];
  double v21 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  v22 = (void *)[v20 mutableCopy];
  v23 = (void *)[v20 mutableCopy];
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v24 = v15;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v64 objects:v71 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v65;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v65 != v27) {
          objc_enumerationMutation(v24);
        }
        v29 = [MEMORY[0x1E4F30C78] tensorWithWidth:1 height:1 featureChannelCount:a4 * a3 batchSize:1 data:*(void *)(*((void *)&v64 + 1) + 8 * i)];
        [v21 addObject:v29];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v64 objects:v71 count:16];
    }
    while (v26);
  }
  v49 = v24;

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v30 = v48;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v60 objects:v70 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v61;
    do
    {
      for (uint64_t j = 0; j != v32; ++j)
      {
        if (*(void *)v61 != v33) {
          objc_enumerationMutation(v30);
        }
        v35 = [MEMORY[0x1E4F30C78] tensorWithWidth:1 height:1 featureChannelCount:a4 * a4 batchSize:1 data:*(void *)(*((void *)&v60 + 1) + 8 * j)];
        [v22 addObject:v35];
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v60 objects:v70 count:16];
    }
    while (v32);
  }

  if (v53)
  {
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v36 = v17;
    uint64_t v37 = [v36 countByEnumeratingWithState:&v56 objects:v69 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v57;
      do
      {
        for (uint64_t k = 0; k != v38; ++k)
        {
          if (*(void *)v57 != v39) {
            objc_enumerationMutation(v36);
          }
          v41 = [MEMORY[0x1E4F30C78] tensorWithWidth:1 height:1 featureChannelCount:a4 batchSize:1 data:*(void *)(*((void *)&v56 + 1) + 8 * k)];
          [v23 addObject:v41];
        }
        uint64_t v38 = [v36 countByEnumeratingWithState:&v56 objects:v69 count:16];
      }
      while (v38);
    }
  }
  LOBYTE(v47) = a9;
  v42 = objc_msgSend(MEMORY[0x1E4F30C18], "descriptorWithInputSize:hiddenSize:layerCount:usesBiases:batchFirst:isBidirectional:returnsSequences:dropout:resultMode:", a3, a4, 1, 0.0, v47, 1);
  v43 = (void *)MEMORY[0x1E4F30C20];
  v68[0] = v52;
  v68[1] = v52;
  v68[2] = v51;
  v68[3] = v52;
  v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:4];
  v45 = [v43 layerWithDescriptor:v42 inputWeights:v21 hiddenWeights:v22 peepholeWeights:0 biases:v23 gateActivations:v44 outputResultActivation:v50];

  return v45;
}

+ (id)fullyConnectedLayerWithKernelWidth:(unint64_t)a3 kernelHeight:(unint64_t)a4 inputChannels:(unint64_t)a5 outputChannels:(unint64_t)a6 weight:(id)a7 bias:(id)a8
{
  id v13 = a8;
  id v14 = (void *)MEMORY[0x1E4F30C88];
  id v15 = a7;
  id v16 = [v14 convolutionWeightsDescriptorWithWidth:a3 height:a4 inputFeatureChannelCount:a5 outputFeatureChannelCount:a6 dataType:1];
  id v17 = [MEMORY[0x1E4F30C78] tensorWithDescriptor:v16 data:v15];

  if (v13)
  {
    uint64_t v18 = [MEMORY[0x1E4F30C88] convolutionBiasesDescriptorWithFeatureChannelCount:a6 dataType:1];
    uint64_t v19 = [MEMORY[0x1E4F30C78] tensorWithDescriptor:v18 data:v13];
  }
  else
  {
    uint64_t v19 = 0;
  }
  v20 = [MEMORY[0x1E4F30BE8] descriptorWithKernelWidth:a3 kernelHeight:a4 inputFeatureChannelCount:a5 outputFeatureChannelCount:a6];
  double v21 = [MEMORY[0x1E4F30C00] layerWithWeights:v17 biases:v19 descriptor:v20];

  return v21;
}

+ (id)convolutionalLayerWithKernelHeight:(unint64_t)a3 kernelWidth:(unint64_t)a4 inputChannels:(unint64_t)a5 outputChannels:(unint64_t)a6 strideInX:(unint64_t)a7 strideInY:(unint64_t)a8 dilationRateInX:(unint64_t)a9 dilationRateInY:(unint64_t)a10 nGroups:(unint64_t)a11 weight:(id)a12 bias:(id)a13 paddingPolicy:(int)a14
{
  v48[2] = *MEMORY[0x1E4F143B8];
  id v18 = a13;
  if (a11 <= 1) {
    unint64_t v19 = 1;
  }
  else {
    unint64_t v19 = a11;
  }
  unint64_t v20 = v19 * a5;
  double v21 = (void *)MEMORY[0x1E4F30C88];
  id v22 = a12;
  unint64_t v41 = v20;
  v45 = [v21 convolutionWeightsDescriptorWithWidth:a4 height:a3 inputFeatureChannelCount:v20 outputFeatureChannelCount:a6 dataType:1];
  v44 = objc_msgSend(MEMORY[0x1E4F30C78], "tensorWithDescriptor:data:");

  v43 = v18;
  unint64_t v38 = a6;
  if (v18)
  {
    v23 = [MEMORY[0x1E4F30C88] convolutionBiasesDescriptorWithFeatureChannelCount:a6 dataType:1];
    v42 = [MEMORY[0x1E4F30C78] tensorWithDescriptor:v23 data:v18];
  }
  else
  {
    v42 = 0;
  }
  uint64_t v37 = (void *)MEMORY[0x1E4F30BE8];
  id v24 = [NSNumber numberWithUnsignedInteger:a3];
  v48[0] = v24;
  uint64_t v25 = [NSNumber numberWithUnsignedInteger:a4];
  v48[1] = v25;
  uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:2];
  uint64_t v27 = [NSNumber numberWithUnsignedInteger:a8];
  v47[0] = v27;
  v28 = [NSNumber numberWithUnsignedInteger:a7];
  v47[1] = v28;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:2];
  id v30 = [NSNumber numberWithUnsignedInteger:a10];
  v46[0] = v30;
  uint64_t v31 = [NSNumber numberWithUnsignedInteger:a9];
  v46[1] = v31;
  uint64_t v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
  LODWORD(v36) = a14;
  uint64_t v33 = [v37 descriptorWithKernelSizes:v26 inputFeatureChannelCount:v41 outputFeatureChannelCount:v38 groupCount:a11 strides:v29 dilationRates:v32 paddingPolicy:v36 paddingSizes:&unk_1EF11A970];

  v34 = [MEMORY[0x1E4F30BF0] layerWithWeights:v44 biases:v42 descriptor:v33];

  return v34;
}

@end