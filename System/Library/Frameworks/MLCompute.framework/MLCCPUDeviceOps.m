@interface MLCCPUDeviceOps
+ (id)deviceOpsWithType:(int)a3 params:(id)a4 inDeltaData:(id)a5 outDeltaData:(id)a6;
+ (id)deviceOpsWithType:(int)a3 params:(id)a4 inDeltaData:(id)a5 outDeltaData:(id)a6 betaDeltaData:(id)a7 gammaDeltaData:(id)a8 betaMomentumData:(id)a9 gammaMomentumData:(id)a10;
+ (id)deviceOpsWithType:(int)a3 params:(id)a4 inDeltaData:(id)a5 outDeltaData:(id)a6 weightsDeltaData:(id)a7 biasDeltaData:(id)a8 weightsMomentumData:(id)a9 biasMomentumData:(id)a10;
- (BOOL)binaryOperation;
- (BOOL)computeWeightsAndBiasOnly;
- (BOOL)hasBias;
- (BOOL)inferenceOnly;
- (BOOL)isFusedBNNSFilter;
- (BOOL)leftIsAWeight;
- (BOOL)rightIsAWeight;
- (BOOL)scaleGradientByFrequency;
- (BOOL)transposeX;
- (BOOL)transposeY;
- (BOOL)useSourceGradientDeviceMemoryForResultGradientTensor;
- (BOOL)useSourceGradientDeviceMemoryForSecondaryResultGradientTensor;
- (MLCCPUDeviceOps)initWithType:(int)a3 params:(id)a4 inDeltaData:(id)a5 outDeltaData:(id)a6 betaDeltaData:(id)a7 gammaDeltaData:(id)a8 betaMomentumData:(id)a9 gammaMomentumData:(id)a10;
- (MLCCPUDeviceOps)initWithType:(int)a3 params:(id)a4 inDeltaData:(id)a5 outDeltaData:(id)a6 weightsDeltaData:(id)a7 biasDeltaData:(id)a8 weightsMomentumData:(id)a9 biasMomentumData:(id)a10;
- (MLCCPUDeviceOps)initWithType:(int)a3 params:(id)a4 inDeltaData:(id)a5 outDeltaData:(id)a6 weightsDeltaData:(id)a7 biasDeltaData:(id)a8 weightsMomentumData:(id)a9 biasMomentumData:(id)a10 betaDeltaData:(id)a11 gammaDeltaData:(id)a12 betaMomentumData:(id)a13 gammaMomentumData:(id)a14;
- (MLCTensor)movingMean;
- (MLCTensor)movingVariance;
- (NSArray)embeddingParams;
- (NSArray)inDeltaData;
- (NSArray)outDeltaData;
- (NSData)arithmeticParamsData;
- (NSData)betaDeltaData;
- (NSData)betaDeltaDataBytes;
- (NSData)biasDeltaData;
- (NSData)biasDeltaDataBytes;
- (NSData)fusedPrimitiveParams;
- (NSData)gammaDeltaData;
- (NSData)gammaDeltaDataBytes;
- (NSData)params;
- (NSData)poolingIndicesBuffer;
- (NSData)weightsDeltaData;
- (NSData)weightsDeltaDataBytes;
- (NSMutableArray)betaMomentumData;
- (NSMutableArray)betaMomentumDataBytes;
- (NSMutableArray)biasDeltaDataBytesArray;
- (NSMutableArray)biasMomentumData;
- (NSMutableArray)biasMomentumDataBytes;
- (NSMutableArray)biasMomentumDataBytesArray;
- (NSMutableArray)gammaMomentumData;
- (NSMutableArray)gammaMomentumDataBytes;
- (NSMutableArray)weightsDeltaDataBytesArray;
- (NSMutableArray)weightsMomentumData;
- (NSMutableArray)weightsMomentumDataBytes;
- (NSMutableArray)weightsMomentumDataBytesArray;
- (NSNumber)paddingIndex;
- (_MLCCPULayer)layer;
- (float)lossWeight;
- (int)deviceOpType;
- (int)paddingPolicy;
- (int)scatterReduceType;
- (unint64_t)resultDataOffset;
- (unint64_t)resultStride;
- (unint64_t)scatterGatherDimension;
- (unint64_t)secondarySourceDataOffset;
- (unint64_t)softmaxDimension;
- (unint64_t)sourceDataOffset;
- (unint64_t)sourceStride;
- (unint64_t)sourceStrideSecondary;
- (unint64_t)sourceStrideTertiary;
- (unint64_t)tertiarySourceDataOffset;
- (void)BNNSFilter;
- (void)dealloc;
- (void)setArithmeticParamsData:(id)a3;
- (void)setBNNSFilter:(void *)a3;
- (void)setBetaDeltaData:(id)a3;
- (void)setBetaDeltaDataBytes:(id)a3;
- (void)setBetaMomentumData:(id)a3;
- (void)setBetaMomentumDataBytes:(id)a3;
- (void)setBiasDeltaDataBytes:(id)a3;
- (void)setBiasDeltaDataBytesArray:(id)a3;
- (void)setBiasMomentumDataBytes:(id)a3;
- (void)setBiasMomentumDataBytesArray:(id)a3;
- (void)setBinaryOperation:(BOOL)a3;
- (void)setComputeWeightsAndBiasOnly:(BOOL)a3;
- (void)setEmbeddingParams:(id)a3;
- (void)setFusedPrimitiveParams:(id)a3;
- (void)setGammaDeltaData:(id)a3;
- (void)setGammaDeltaDataBytes:(id)a3;
- (void)setGammaMomentumData:(id)a3;
- (void)setGammaMomentumDataBytes:(id)a3;
- (void)setHasBias:(BOOL)a3;
- (void)setInferenceOnly:(BOOL)a3;
- (void)setIsFusedBNNSFilter:(BOOL)a3;
- (void)setLayer:(id)a3;
- (void)setLeftIsAWeight:(BOOL)a3;
- (void)setLossWeight:(float)a3;
- (void)setMovingMean:(id)a3;
- (void)setMovingVariance:(id)a3;
- (void)setPaddingIndex:(id)a3;
- (void)setPaddingPolicy:(int)a3;
- (void)setPoolingIndicesBuffer:(id)a3;
- (void)setResultDataOffset:(unint64_t)a3;
- (void)setResultStride:(unint64_t)a3;
- (void)setRightIsAWeight:(BOOL)a3;
- (void)setScaleGradientByFrequency:(BOOL)a3;
- (void)setScatterGatherDimension:(unint64_t)a3;
- (void)setScatterReduceType:(int)a3;
- (void)setSecondarySourceDataOffset:(unint64_t)a3;
- (void)setSoftmaxDimension:(unint64_t)a3;
- (void)setSourceDataOffset:(unint64_t)a3;
- (void)setSourceStride:(unint64_t)a3;
- (void)setSourceStrideSecondary:(unint64_t)a3;
- (void)setSourceStrideTertiary:(unint64_t)a3;
- (void)setTertiarySourceDataOffset:(unint64_t)a3;
- (void)setTransposeX:(BOOL)a3;
- (void)setTransposeY:(BOOL)a3;
- (void)setUseSourceGradientDeviceMemoryForResultGradientTensor:(BOOL)a3;
- (void)setUseSourceGradientDeviceMemoryForSecondaryResultGradientTensor:(BOOL)a3;
- (void)setWeightsDeltaDataBytes:(id)a3;
- (void)setWeightsDeltaDataBytesArray:(id)a3;
- (void)setWeightsMomentumDataBytes:(id)a3;
- (void)setWeightsMomentumDataBytesArray:(id)a3;
@end

@implementation MLCCPUDeviceOps

+ (id)deviceOpsWithType:(int)a3 params:(id)a4 inDeltaData:(id)a5 outDeltaData:(id)a6
{
  return (id)[a1 deviceOpsWithType:*(void *)&a3 params:a4 inDeltaData:a5 outDeltaData:a6 weightsDeltaData:0 biasDeltaData:0 weightsMomentumData:0 biasMomentumData:0];
}

+ (id)deviceOpsWithType:(int)a3 params:(id)a4 inDeltaData:(id)a5 outDeltaData:(id)a6 weightsDeltaData:(id)a7 biasDeltaData:(id)a8 weightsMomentumData:(id)a9 biasMomentumData:(id)a10
{
  uint64_t v15 = *(void *)&a3;
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  v24 = (void *)[objc_alloc((Class)a1) initWithType:v15 params:v23 inDeltaData:v22 outDeltaData:v21 weightsDeltaData:v20 biasDeltaData:v19 weightsMomentumData:v18 biasMomentumData:v17];

  return v24;
}

+ (id)deviceOpsWithType:(int)a3 params:(id)a4 inDeltaData:(id)a5 outDeltaData:(id)a6 betaDeltaData:(id)a7 gammaDeltaData:(id)a8 betaMomentumData:(id)a9 gammaMomentumData:(id)a10
{
  uint64_t v15 = *(void *)&a3;
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  v24 = (void *)[objc_alloc((Class)a1) initWithType:v15 params:v23 inDeltaData:v22 outDeltaData:v21 betaDeltaData:v20 gammaDeltaData:v19 betaMomentumData:v18 gammaMomentumData:v17];

  return v24;
}

- (MLCCPUDeviceOps)initWithType:(int)a3 params:(id)a4 inDeltaData:(id)a5 outDeltaData:(id)a6 betaDeltaData:(id)a7 gammaDeltaData:(id)a8 betaMomentumData:(id)a9 gammaMomentumData:(id)a10
{
  return [(MLCCPUDeviceOps *)self initWithType:*(void *)&a3 params:a4 inDeltaData:a5 outDeltaData:a6 weightsDeltaData:0 biasDeltaData:0 weightsMomentumData:0 biasMomentumData:0 betaDeltaData:a7 gammaDeltaData:a8 betaMomentumData:a9 gammaMomentumData:a10];
}

- (MLCCPUDeviceOps)initWithType:(int)a3 params:(id)a4 inDeltaData:(id)a5 outDeltaData:(id)a6 weightsDeltaData:(id)a7 biasDeltaData:(id)a8 weightsMomentumData:(id)a9 biasMomentumData:(id)a10
{
  return [(MLCCPUDeviceOps *)self initWithType:*(void *)&a3 params:a4 inDeltaData:a5 outDeltaData:a6 weightsDeltaData:a7 biasDeltaData:a8 weightsMomentumData:a9 biasMomentumData:a10 betaDeltaData:0 gammaDeltaData:0 betaMomentumData:0 gammaMomentumData:0];
}

- (MLCCPUDeviceOps)initWithType:(int)a3 params:(id)a4 inDeltaData:(id)a5 outDeltaData:(id)a6 weightsDeltaData:(id)a7 biasDeltaData:(id)a8 weightsMomentumData:(id)a9 biasMomentumData:(id)a10 betaDeltaData:(id)a11 gammaDeltaData:(id)a12 betaMomentumData:(id)a13 gammaMomentumData:(id)a14
{
  id v50 = a4;
  id v18 = a5;
  id v19 = a6;
  id v49 = a7;
  id v48 = a8;
  id v20 = v18;
  id v47 = a9;
  id v46 = a10;
  id v45 = a11;
  id v44 = a12;
  id v43 = a13;
  id v42 = a14;
  v51.receiver = self;
  v51.super_class = (Class)MLCCPUDeviceOps;
  id v21 = [(MLCDeviceOps *)&v51 initWithSource:0 secondarySource:0 result:0 batchSize:1];
  id v22 = v21;
  if (v21)
  {
    v21->_deviceOpType = a3;
    objc_storeStrong((id *)&v21->_params, a4);
    fusedPrimitiveParams = v22->_fusedPrimitiveParams;
    v22->_fusedPrimitiveParams = 0;

    if (v20)
    {
      v24 = [MEMORY[0x1E4F1C978] arrayWithArray:v20];
    }
    else
    {
      v24 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v22->_inDeltaData, v24);
    if (v20) {

    }
    if (v19)
    {
      v25 = [MEMORY[0x1E4F1C978] arrayWithArray:v19];
    }
    else
    {
      v25 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v22->_outDeltaData, v25);
    if (v19) {

    }
    objc_storeStrong((id *)&v22->_weightsDeltaData, a7);
    objc_storeStrong((id *)&v22->_biasDeltaData, a8);
    objc_storeStrong((id *)&v22->_betaDeltaData, a11);
    objc_storeStrong((id *)&v22->_gammaDeltaData, a12);
    objc_storeStrong((id *)&v22->_weightsMomentumData, a9);
    objc_storeStrong((id *)&v22->_biasMomentumData, a10);
    objc_storeStrong((id *)&v22->_betaMomentumData, a13);
    objc_storeStrong((id *)&v22->_gammaMomentumData, a14);
    poolingIndicesBuffer = v22->_poolingIndicesBuffer;
    v22->_poolingIndicesBuffer = 0;

    movingMean = v22->_movingMean;
    v22->_movingMean = 0;

    movingVariance = v22->_movingVariance;
    v22->_movingVariance = 0;

    v22->_sourceStride = 0;
    v22->_sourceStrideSecondary = 0;
    v22->_sourceStrideTertiary = 0;
    v22->_resultStride = 0;
    v22->_sourceDataOffset = 0;
    v22->_secondarySourceDataOffset = 0;
    v22->_tertiarySourceDataOffset = 0;
    v22->_resultDataOffset = 0;
    v22->_BNNSFilter = 0;
    v22->_isFusedBNNSFilter = 0;
    weightsDeltaDataBytes = v22->_weightsDeltaDataBytes;
    v22->_weightsDeltaDataBytes = 0;

    biasDeltaDataBytes = v22->_biasDeltaDataBytes;
    v22->_biasDeltaDataBytes = 0;

    v22->_computeWeightsAndBiasOnly = 0;
    betaDeltaDataBytes = v22->_betaDeltaDataBytes;
    v22->_betaDeltaDataBytes = 0;

    gammaDeltaDataBytes = v22->_gammaDeltaDataBytes;
    v22->_gammaDeltaDataBytes = 0;

    weightsMomentumDataBytes = v22->_weightsMomentumDataBytes;
    v22->_weightsMomentumDataBytes = 0;

    biasMomentumDataBytes = v22->_biasMomentumDataBytes;
    v22->_biasMomentumDataBytes = 0;

    betaMomentumDataBytes = v22->_betaMomentumDataBytes;
    v22->_betaMomentumDataBytes = 0;

    gammaMomentumDataBytes = v22->_gammaMomentumDataBytes;
    v22->_gammaMomentumDataBytes = 0;

    v22->_binaryOperation = 0;
    v22->_paddingPolicy = 0;
    v22->_useSourceGradientDeviceMemoryForResultGradientTensor = 0;
    v22->_useSourceGradientDeviceMemoryForSecondaryResultGradientTensor = 0;
    v22->_inferenceOnly = 0;
    arithmeticParamsData = v22->_arithmeticParamsData;
    v22->_arithmeticParamsData = 0;
  }
  return v22;
}

- (void)dealloc
{
  v3 = [(MLCCPUDeviceOps *)self layer];

  if (v3) {
    goto LABEL_4;
  }
  if ([(MLCCPUDeviceOps *)self BNNSFilter])
  {
    BNNSFilterDestroy([(MLCCPUDeviceOps *)self BNNSFilter]);
LABEL_4:
    [(MLCCPUDeviceOps *)self setBNNSFilter:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)MLCCPUDeviceOps;
  [(MLCCPUDeviceOps *)&v4 dealloc];
}

- (_MLCCPULayer)layer
{
  return self->_layer;
}

- (void)setLayer:(id)a3
{
}

- (int)deviceOpType
{
  return self->_deviceOpType;
}

- (unint64_t)sourceStride
{
  return self->_sourceStride;
}

- (void)setSourceStride:(unint64_t)a3
{
  self->_sourceStride = a3;
}

- (unint64_t)sourceStrideSecondary
{
  return self->_sourceStrideSecondary;
}

- (void)setSourceStrideSecondary:(unint64_t)a3
{
  self->_sourceStrideSecondary = a3;
}

- (unint64_t)sourceStrideTertiary
{
  return self->_sourceStrideTertiary;
}

- (void)setSourceStrideTertiary:(unint64_t)a3
{
  self->_sourceStrideTertiary = a3;
}

- (unint64_t)resultStride
{
  return self->_resultStride;
}

- (void)setResultStride:(unint64_t)a3
{
  self->_resultStride = a3;
}

- (unint64_t)sourceDataOffset
{
  return self->_sourceDataOffset;
}

- (void)setSourceDataOffset:(unint64_t)a3
{
  self->_sourceDataOffset = a3;
}

- (unint64_t)secondarySourceDataOffset
{
  return self->_secondarySourceDataOffset;
}

- (void)setSecondarySourceDataOffset:(unint64_t)a3
{
  self->_secondarySourceDataOffset = a3;
}

- (unint64_t)tertiarySourceDataOffset
{
  return self->_tertiarySourceDataOffset;
}

- (void)setTertiarySourceDataOffset:(unint64_t)a3
{
  self->_tertiarySourceDataOffset = a3;
}

- (unint64_t)resultDataOffset
{
  return self->_resultDataOffset;
}

- (void)setResultDataOffset:(unint64_t)a3
{
  self->_resultDataOffset = a3;
}

- (BOOL)inferenceOnly
{
  return self->_inferenceOnly;
}

- (void)setInferenceOnly:(BOOL)a3
{
  self->_inferenceOnly = a3;
}

- (NSData)params
{
  return self->_params;
}

- (NSData)fusedPrimitiveParams
{
  return self->_fusedPrimitiveParams;
}

- (void)setFusedPrimitiveParams:(id)a3
{
}

- (NSArray)inDeltaData
{
  return self->_inDeltaData;
}

- (NSArray)outDeltaData
{
  return self->_outDeltaData;
}

- (NSData)weightsDeltaData
{
  return self->_weightsDeltaData;
}

- (NSData)biasDeltaData
{
  return self->_biasDeltaData;
}

- (NSMutableArray)weightsMomentumData
{
  return self->_weightsMomentumData;
}

- (NSMutableArray)biasMomentumData
{
  return self->_biasMomentumData;
}

- (BOOL)computeWeightsAndBiasOnly
{
  return self->_computeWeightsAndBiasOnly;
}

- (void)setComputeWeightsAndBiasOnly:(BOOL)a3
{
  self->_computeWeightsAndBiasOnly = a3;
}

- (NSData)betaDeltaData
{
  return self->_betaDeltaData;
}

- (void)setBetaDeltaData:(id)a3
{
}

- (NSData)gammaDeltaData
{
  return self->_gammaDeltaData;
}

- (void)setGammaDeltaData:(id)a3
{
}

- (NSMutableArray)betaMomentumData
{
  return self->_betaMomentumData;
}

- (void)setBetaMomentumData:(id)a3
{
}

- (NSMutableArray)gammaMomentumData
{
  return self->_gammaMomentumData;
}

- (void)setGammaMomentumData:(id)a3
{
}

- (MLCTensor)movingMean
{
  return self->_movingMean;
}

- (void)setMovingMean:(id)a3
{
}

- (MLCTensor)movingVariance
{
  return self->_movingVariance;
}

- (void)setMovingVariance:(id)a3
{
}

- (void)BNNSFilter
{
  return self->_BNNSFilter;
}

- (void)setBNNSFilter:(void *)a3
{
  self->_BNNSFilter = a3;
}

- (BOOL)isFusedBNNSFilter
{
  return self->_isFusedBNNSFilter;
}

- (void)setIsFusedBNNSFilter:(BOOL)a3
{
  self->_isFusedBNNSFilter = a3;
}

- (NSData)poolingIndicesBuffer
{
  return self->_poolingIndicesBuffer;
}

- (void)setPoolingIndicesBuffer:(id)a3
{
}

- (int)paddingPolicy
{
  return self->_paddingPolicy;
}

- (void)setPaddingPolicy:(int)a3
{
  self->_paddingPolicy = a3;
}

- (BOOL)useSourceGradientDeviceMemoryForResultGradientTensor
{
  return self->_useSourceGradientDeviceMemoryForResultGradientTensor;
}

- (void)setUseSourceGradientDeviceMemoryForResultGradientTensor:(BOOL)a3
{
  self->_useSourceGradientDeviceMemoryForResultGradientTensor = a3;
}

- (BOOL)useSourceGradientDeviceMemoryForSecondaryResultGradientTensor
{
  return self->_useSourceGradientDeviceMemoryForSecondaryResultGradientTensor;
}

- (void)setUseSourceGradientDeviceMemoryForSecondaryResultGradientTensor:(BOOL)a3
{
  self->_useSourceGradientDeviceMemoryForSecondaryResultGradientTensor = a3;
}

- (float)lossWeight
{
  return self->_lossWeight;
}

- (void)setLossWeight:(float)a3
{
  self->_lossWeight = a3;
}

- (BOOL)binaryOperation
{
  return self->_binaryOperation;
}

- (void)setBinaryOperation:(BOOL)a3
{
  self->_binaryOperation = a3;
}

- (BOOL)hasBias
{
  return self->_hasBias;
}

- (void)setHasBias:(BOOL)a3
{
  self->_hasBias = a3;
}

- (unint64_t)softmaxDimension
{
  return self->_softmaxDimension;
}

- (void)setSoftmaxDimension:(unint64_t)a3
{
  self->_softmaxDimension = a3;
}

- (BOOL)transposeX
{
  return self->_transposeX;
}

- (void)setTransposeX:(BOOL)a3
{
  self->_transposeX = a3;
}

- (BOOL)transposeY
{
  return self->_transposeY;
}

- (void)setTransposeY:(BOOL)a3
{
  self->_transposeY = a3;
}

- (BOOL)leftIsAWeight
{
  return self->_leftIsAWeight;
}

- (void)setLeftIsAWeight:(BOOL)a3
{
  self->_leftIsAWeight = a3;
}

- (BOOL)rightIsAWeight
{
  return self->_rightIsAWeight;
}

- (void)setRightIsAWeight:(BOOL)a3
{
  self->_rightIsAWeight = a3;
}

- (NSNumber)paddingIndex
{
  return self->_paddingIndex;
}

- (void)setPaddingIndex:(id)a3
{
}

- (NSArray)embeddingParams
{
  return self->_embeddingParams;
}

- (void)setEmbeddingParams:(id)a3
{
}

- (BOOL)scaleGradientByFrequency
{
  return self->_scaleGradientByFrequency;
}

- (void)setScaleGradientByFrequency:(BOOL)a3
{
  self->_scaleGradientByFrequency = a3;
}

- (unint64_t)scatterGatherDimension
{
  return self->_scatterGatherDimension;
}

- (void)setScatterGatherDimension:(unint64_t)a3
{
  self->_scatterGatherDimension = a3;
}

- (int)scatterReduceType
{
  return self->_scatterReduceType;
}

- (void)setScatterReduceType:(int)a3
{
  self->_scatterReduceType = a3;
}

- (NSData)arithmeticParamsData
{
  return self->_arithmeticParamsData;
}

- (void)setArithmeticParamsData:(id)a3
{
}

- (NSData)weightsDeltaDataBytes
{
  return self->_weightsDeltaDataBytes;
}

- (void)setWeightsDeltaDataBytes:(id)a3
{
}

- (NSData)biasDeltaDataBytes
{
  return self->_biasDeltaDataBytes;
}

- (void)setBiasDeltaDataBytes:(id)a3
{
}

- (NSMutableArray)weightsDeltaDataBytesArray
{
  return self->_weightsDeltaDataBytesArray;
}

- (void)setWeightsDeltaDataBytesArray:(id)a3
{
}

- (NSMutableArray)biasDeltaDataBytesArray
{
  return self->_biasDeltaDataBytesArray;
}

- (void)setBiasDeltaDataBytesArray:(id)a3
{
}

- (NSData)betaDeltaDataBytes
{
  return self->_betaDeltaDataBytes;
}

- (void)setBetaDeltaDataBytes:(id)a3
{
}

- (NSData)gammaDeltaDataBytes
{
  return self->_gammaDeltaDataBytes;
}

- (void)setGammaDeltaDataBytes:(id)a3
{
}

- (NSMutableArray)weightsMomentumDataBytes
{
  return self->_weightsMomentumDataBytes;
}

- (void)setWeightsMomentumDataBytes:(id)a3
{
}

- (NSMutableArray)biasMomentumDataBytes
{
  return self->_biasMomentumDataBytes;
}

- (void)setBiasMomentumDataBytes:(id)a3
{
}

- (NSMutableArray)weightsMomentumDataBytesArray
{
  return self->_weightsMomentumDataBytesArray;
}

- (void)setWeightsMomentumDataBytesArray:(id)a3
{
}

- (NSMutableArray)biasMomentumDataBytesArray
{
  return self->_biasMomentumDataBytesArray;
}

- (void)setBiasMomentumDataBytesArray:(id)a3
{
}

- (NSMutableArray)betaMomentumDataBytes
{
  return self->_betaMomentumDataBytes;
}

- (void)setBetaMomentumDataBytes:(id)a3
{
}

- (NSMutableArray)gammaMomentumDataBytes
{
  return self->_gammaMomentumDataBytes;
}

- (void)setGammaMomentumDataBytes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gammaMomentumDataBytes, 0);
  objc_storeStrong((id *)&self->_betaMomentumDataBytes, 0);
  objc_storeStrong((id *)&self->_biasMomentumDataBytesArray, 0);
  objc_storeStrong((id *)&self->_weightsMomentumDataBytesArray, 0);
  objc_storeStrong((id *)&self->_biasMomentumDataBytes, 0);
  objc_storeStrong((id *)&self->_weightsMomentumDataBytes, 0);
  objc_storeStrong((id *)&self->_gammaDeltaDataBytes, 0);
  objc_storeStrong((id *)&self->_betaDeltaDataBytes, 0);
  objc_storeStrong((id *)&self->_biasDeltaDataBytesArray, 0);
  objc_storeStrong((id *)&self->_weightsDeltaDataBytesArray, 0);
  objc_storeStrong((id *)&self->_biasDeltaDataBytes, 0);
  objc_storeStrong((id *)&self->_weightsDeltaDataBytes, 0);
  objc_storeStrong((id *)&self->_arithmeticParamsData, 0);
  objc_storeStrong((id *)&self->_embeddingParams, 0);
  objc_storeStrong((id *)&self->_paddingIndex, 0);
  objc_storeStrong((id *)&self->_poolingIndicesBuffer, 0);
  objc_storeStrong((id *)&self->_movingVariance, 0);
  objc_storeStrong((id *)&self->_movingMean, 0);
  objc_storeStrong((id *)&self->_gammaMomentumData, 0);
  objc_storeStrong((id *)&self->_betaMomentumData, 0);
  objc_storeStrong((id *)&self->_gammaDeltaData, 0);
  objc_storeStrong((id *)&self->_betaDeltaData, 0);
  objc_storeStrong((id *)&self->_biasMomentumData, 0);
  objc_storeStrong((id *)&self->_weightsMomentumData, 0);
  objc_storeStrong((id *)&self->_biasDeltaData, 0);
  objc_storeStrong((id *)&self->_weightsDeltaData, 0);
  objc_storeStrong((id *)&self->_outDeltaData, 0);
  objc_storeStrong((id *)&self->_inDeltaData, 0);
  objc_storeStrong((id *)&self->_fusedPrimitiveParams, 0);
  objc_storeStrong((id *)&self->_params, 0);

  objc_storeStrong((id *)&self->_layer, 0);
}

@end