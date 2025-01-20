@interface MLCRNNCPUDeviceOps
+ (id)deviceOpsWithType:(int)a3 params:(id)a4 inDeltaData:(id)a5 outDeltaData:(id)a6 weightsDeltaData:(id)a7 biasDeltaData:(id)a8 weightsMomentumData:(id)a9 biasMomentumData:(id)a10;
- (BOOL)batchFirst;
- (BOOL)biDirectional;
- (BOOL)hasPeephole;
- (BOOL)returnsSequences;
- (MLCRNNCPUDeviceOps)initWithType:(int)a3 params:(id)a4 inDeltaData:(id)a5 outDeltaData:(id)a6 weightsDeltaData:(id)a7 biasDeltaData:(id)a8 weightsMomentumData:(id)a9 biasMomentumData:(id)a10 betaDeltaData:(id)a11 gammaDeltaData:(id)a12 betaMomentumData:(id)a13 gammaMomentumData:(id)a14;
- (NSData)lstmDeltaParams;
- (NSData)trainingCache;
- (NSMutableArray)auxBiasTerms;
- (NSMutableArray)auxBiasTermsAccumulators;
- (NSMutableArray)bnnsDesc2DHiddenWeightAccumulators;
- (NSMutableArray)bnnsDesc2DHiddenWeightGrads;
- (NSMutableArray)bnnsDesc2DHiddenWeightParams;
- (NSMutableArray)bnnsDesc2DInputWeightAccumulators;
- (NSMutableArray)bnnsDesc2DInputWeightGrads;
- (NSMutableArray)bnnsDesc2DInputWeightParams;
- (NSMutableArray)bnnsHiddenWeightsDeltaPointers;
- (NSMutableArray)bnnsHiddenWeightsMomentumPointers;
- (NSMutableArray)bnnsInputWeightsDeltaPointers;
- (NSMutableArray)bnnsInputWeightsMomentumPointers;
- (NSMutableArray)combinedGateWeightsAndBias;
- (NSMutableArray)combinedInputsBuffer;
- (NSMutableArray)combinedOutputsBuffer;
- (NSMutableArray)hiddenWeightsDeltaPointers;
- (NSMutableArray)hiddenWeightsMomentumDataBytesArray;
- (NSMutableArray)hiddenWeightsMomentumDescData;
- (NSMutableArray)hiddenWeightsMomentumDescDataPointer;
- (NSMutableArray)inputWeightsDeltaPointers;
- (NSMutableArray)inputWeightsMomentumDataBytesArray;
- (NSMutableArray)inputWeightsMomentumDescData;
- (NSMutableArray)inputWeightsMomentumDescDataPointer;
- (NSMutableArray)parameterPointers;
- (NSMutableArray)weightAndBiasGateDeltaBuffers;
- (unint64_t)hiddenSize;
- (unint64_t)inputSize;
- (unint64_t)numAccumulatorsPerParameter;
- (unint64_t)numLayers;
- (unint64_t)numParametersForSingleLSTM;
- (void)dealloc;
- (void)setAuxBiasTerms:(id)a3;
- (void)setAuxBiasTermsAccumulators:(id)a3;
- (void)setBatchFirst:(BOOL)a3;
- (void)setBiDirectional:(BOOL)a3;
- (void)setBnnsDesc2DHiddenWeightAccumulators:(id)a3;
- (void)setBnnsDesc2DHiddenWeightGrads:(id)a3;
- (void)setBnnsDesc2DHiddenWeightParams:(id)a3;
- (void)setBnnsDesc2DInputWeightAccumulators:(id)a3;
- (void)setBnnsDesc2DInputWeightGrads:(id)a3;
- (void)setBnnsDesc2DInputWeightParams:(id)a3;
- (void)setBnnsHiddenWeightsDeltaPointers:(id)a3;
- (void)setBnnsHiddenWeightsMomentumPointers:(id)a3;
- (void)setBnnsInputWeightsDeltaPointers:(id)a3;
- (void)setBnnsInputWeightsMomentumPointers:(id)a3;
- (void)setCombinedGateWeightsAndBias:(id)a3;
- (void)setCombinedInputsBuffer:(id)a3;
- (void)setCombinedOutputsBuffer:(id)a3;
- (void)setHasPeephole:(BOOL)a3;
- (void)setHiddenSize:(unint64_t)a3;
- (void)setHiddenWeightsDeltaPointers:(id)a3;
- (void)setHiddenWeightsMomentumDataBytesArray:(id)a3;
- (void)setHiddenWeightsMomentumDescData:(id)a3;
- (void)setHiddenWeightsMomentumDescDataPointer:(id)a3;
- (void)setInputSize:(unint64_t)a3;
- (void)setInputWeightsDeltaPointers:(id)a3;
- (void)setInputWeightsMomentumDataBytesArray:(id)a3;
- (void)setInputWeightsMomentumDescData:(id)a3;
- (void)setInputWeightsMomentumDescDataPointer:(id)a3;
- (void)setLstmDeltaParams:(id)a3;
- (void)setNumAccumulatorsPerParameter:(unint64_t)a3;
- (void)setNumLayers:(unint64_t)a3;
- (void)setNumParametersForSingleLSTM:(unint64_t)a3;
- (void)setParameterPointers:(id)a3;
- (void)setReturnsSequences:(BOOL)a3;
- (void)setTrainingCache:(id)a3;
- (void)setWeightAndBiasGateDeltaBuffers:(id)a3;
@end

@implementation MLCRNNCPUDeviceOps

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
  v24 = (void *)[objc_alloc((Class)a1) initWithType:v15 params:v23 inDeltaData:v22 outDeltaData:v21 weightsDeltaData:v20 biasDeltaData:v19 weightsMomentumData:v18 biasMomentumData:v17 betaDeltaData:0 gammaDeltaData:0 betaMomentumData:0 gammaMomentumData:0];

  return v24;
}

- (MLCRNNCPUDeviceOps)initWithType:(int)a3 params:(id)a4 inDeltaData:(id)a5 outDeltaData:(id)a6 weightsDeltaData:(id)a7 biasDeltaData:(id)a8 weightsMomentumData:(id)a9 biasMomentumData:(id)a10 betaDeltaData:(id)a11 gammaDeltaData:(id)a12 betaMomentumData:(id)a13 gammaMomentumData:(id)a14
{
  v61.receiver = self;
  v61.super_class = (Class)MLCRNNCPUDeviceOps;
  v14 = [(MLCCPUDeviceOps *)&v61 initWithType:*(void *)&a3 params:a4 inDeltaData:a5 outDeltaData:a6 weightsDeltaData:a7 biasDeltaData:a8 weightsMomentumData:a9 biasMomentumData:a10 betaDeltaData:0 gammaDeltaData:0 betaMomentumData:0 gammaMomentumData:0];
  uint64_t v15 = v14;
  if (v14)
  {
    v14->_batchFirst = 0;
    v14->_hasPeephole = 0;
    v14->_returnsSequences = 1;
    v14->_biDirectional = 0;
    lstmDeltaParams = v14->_lstmDeltaParams;
    v14->_lstmDeltaParams = 0;

    trainingCache = v15->_trainingCache;
    v15->_trainingCache = 0;

    combinedGateWeightsAndBias = v15->_combinedGateWeightsAndBias;
    v15->_combinedGateWeightsAndBias = 0;

    combinedInputsBuffer = v15->_combinedInputsBuffer;
    v15->_combinedInputsBuffer = 0;

    combinedOutputsBuffer = v15->_combinedOutputsBuffer;
    v15->_combinedOutputsBuffer = 0;

    v15->_numLayers = 0;
    v15->_inputSize = 0;
    v15->_hiddenSize = 0;
    v15->_numAccumulatorsPerParameter = 0;
    v15->_numParametersForSingleLSTM = 0;
    id v21 = (void *)MEMORY[0x1E4F1CBF0];
    uint64_t v22 = [MEMORY[0x1E4F1CBF0] mutableCopy];
    weightAndBiasGateDeltaBuffers = v15->_weightAndBiasGateDeltaBuffers;
    v15->_weightAndBiasGateDeltaBuffers = (NSMutableArray *)v22;

    uint64_t v24 = [v21 mutableCopy];
    auxBiasTermsAccumulators = v15->_auxBiasTermsAccumulators;
    v15->_auxBiasTermsAccumulators = (NSMutableArray *)v24;

    uint64_t v26 = [v21 mutableCopy];
    auxBiasTerms = v15->_auxBiasTerms;
    v15->_auxBiasTerms = (NSMutableArray *)v26;

    uint64_t v28 = [v21 mutableCopy];
    inputWeightsDeltaPointers = v15->_inputWeightsDeltaPointers;
    v15->_inputWeightsDeltaPointers = (NSMutableArray *)v28;

    uint64_t v30 = [v21 mutableCopy];
    hiddenWeightsDeltaPointers = v15->_hiddenWeightsDeltaPointers;
    v15->_hiddenWeightsDeltaPointers = (NSMutableArray *)v30;

    uint64_t v32 = [v21 mutableCopy];
    bnnsInputWeightsDeltaPointers = v15->_bnnsInputWeightsDeltaPointers;
    v15->_bnnsInputWeightsDeltaPointers = (NSMutableArray *)v32;

    uint64_t v34 = [v21 mutableCopy];
    bnnsHiddenWeightsDeltaPointers = v15->_bnnsHiddenWeightsDeltaPointers;
    v15->_bnnsHiddenWeightsDeltaPointers = (NSMutableArray *)v34;

    uint64_t v36 = [v21 mutableCopy];
    inputWeightsMomentumDescData = v15->_inputWeightsMomentumDescData;
    v15->_inputWeightsMomentumDescData = (NSMutableArray *)v36;

    uint64_t v38 = [v21 mutableCopy];
    hiddenWeightsMomentumDescData = v15->_hiddenWeightsMomentumDescData;
    v15->_hiddenWeightsMomentumDescData = (NSMutableArray *)v38;

    uint64_t v40 = [v21 mutableCopy];
    bnnsInputWeightsMomentumPointers = v15->_bnnsInputWeightsMomentumPointers;
    v15->_bnnsInputWeightsMomentumPointers = (NSMutableArray *)v40;

    uint64_t v42 = [v21 mutableCopy];
    bnnsHiddenWeightsMomentumPointers = v15->_bnnsHiddenWeightsMomentumPointers;
    v15->_bnnsHiddenWeightsMomentumPointers = (NSMutableArray *)v42;

    uint64_t v44 = [v21 mutableCopy];
    inputWeightsMomentumDataBytesArray = v15->_inputWeightsMomentumDataBytesArray;
    v15->_inputWeightsMomentumDataBytesArray = (NSMutableArray *)v44;

    uint64_t v46 = [v21 mutableCopy];
    hiddenWeightsMomentumDataBytesArray = v15->_hiddenWeightsMomentumDataBytesArray;
    v15->_hiddenWeightsMomentumDataBytesArray = (NSMutableArray *)v46;

    uint64_t v48 = [v21 mutableCopy];
    bnnsDesc2DInputWeightParams = v15->_bnnsDesc2DInputWeightParams;
    v15->_bnnsDesc2DInputWeightParams = (NSMutableArray *)v48;

    uint64_t v50 = [v21 mutableCopy];
    bnnsDesc2DHiddenWeightParams = v15->_bnnsDesc2DHiddenWeightParams;
    v15->_bnnsDesc2DHiddenWeightParams = (NSMutableArray *)v50;

    uint64_t v52 = [v21 mutableCopy];
    bnnsDesc2DInputWeightGrads = v15->_bnnsDesc2DInputWeightGrads;
    v15->_bnnsDesc2DInputWeightGrads = (NSMutableArray *)v52;

    uint64_t v54 = [v21 mutableCopy];
    bnnsDesc2DHiddenWeightGrads = v15->_bnnsDesc2DHiddenWeightGrads;
    v15->_bnnsDesc2DHiddenWeightGrads = (NSMutableArray *)v54;

    uint64_t v56 = [v21 mutableCopy];
    bnnsDesc2DInputWeightAccumulators = v15->_bnnsDesc2DInputWeightAccumulators;
    v15->_bnnsDesc2DInputWeightAccumulators = (NSMutableArray *)v56;

    uint64_t v58 = [v21 mutableCopy];
    bnnsDesc2DHiddenWeightAccumulators = v15->_bnnsDesc2DHiddenWeightAccumulators;
    v15->_bnnsDesc2DHiddenWeightAccumulators = (NSMutableArray *)v58;
  }
  return v15;
}

- (void)dealloc
{
  v3 = [(MLCCPUDeviceOps *)self weightsMomentumData];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    unint64_t v5 = 0;
    do
    {
      v6 = [(MLCCPUDeviceOps *)self weightsMomentumData];
      id v7 = [v6 objectAtIndexedSubscript:v5];
      uint64_t v8 = [v7 bytes];

      v9 = *(void **)(v8 + 136);
      if (v9) {
        free(v9);
      }
      ++v5;
      v10 = [(MLCCPUDeviceOps *)self weightsMomentumData];
      unint64_t v11 = [v10 count];
    }
    while (v5 < v11);
  }
  v12.receiver = self;
  v12.super_class = (Class)MLCRNNCPUDeviceOps;
  [(MLCCPUDeviceOps *)&v12 dealloc];
}

- (BOOL)batchFirst
{
  return self->_batchFirst;
}

- (void)setBatchFirst:(BOOL)a3
{
  self->_batchFirst = a3;
}

- (BOOL)hasPeephole
{
  return self->_hasPeephole;
}

- (void)setHasPeephole:(BOOL)a3
{
  self->_hasPeephole = a3;
}

- (BOOL)returnsSequences
{
  return self->_returnsSequences;
}

- (void)setReturnsSequences:(BOOL)a3
{
  self->_returnsSequences = a3;
}

- (BOOL)biDirectional
{
  return self->_biDirectional;
}

- (void)setBiDirectional:(BOOL)a3
{
  self->_biDirectional = a3;
}

- (NSData)lstmDeltaParams
{
  return self->_lstmDeltaParams;
}

- (void)setLstmDeltaParams:(id)a3
{
}

- (NSMutableArray)weightAndBiasGateDeltaBuffers
{
  return self->_weightAndBiasGateDeltaBuffers;
}

- (void)setWeightAndBiasGateDeltaBuffers:(id)a3
{
}

- (NSMutableArray)inputWeightsDeltaPointers
{
  return self->_inputWeightsDeltaPointers;
}

- (void)setInputWeightsDeltaPointers:(id)a3
{
}

- (NSMutableArray)hiddenWeightsDeltaPointers
{
  return self->_hiddenWeightsDeltaPointers;
}

- (void)setHiddenWeightsDeltaPointers:(id)a3
{
}

- (NSMutableArray)bnnsInputWeightsDeltaPointers
{
  return self->_bnnsInputWeightsDeltaPointers;
}

- (void)setBnnsInputWeightsDeltaPointers:(id)a3
{
}

- (NSMutableArray)bnnsHiddenWeightsDeltaPointers
{
  return self->_bnnsHiddenWeightsDeltaPointers;
}

- (void)setBnnsHiddenWeightsDeltaPointers:(id)a3
{
}

- (NSMutableArray)inputWeightsMomentumDescData
{
  return self->_inputWeightsMomentumDescData;
}

- (void)setInputWeightsMomentumDescData:(id)a3
{
}

- (NSMutableArray)hiddenWeightsMomentumDescData
{
  return self->_hiddenWeightsMomentumDescData;
}

- (void)setHiddenWeightsMomentumDescData:(id)a3
{
}

- (NSMutableArray)inputWeightsMomentumDescDataPointer
{
  return self->_inputWeightsMomentumDescDataPointer;
}

- (void)setInputWeightsMomentumDescDataPointer:(id)a3
{
}

- (NSMutableArray)hiddenWeightsMomentumDescDataPointer
{
  return self->_hiddenWeightsMomentumDescDataPointer;
}

- (void)setHiddenWeightsMomentumDescDataPointer:(id)a3
{
}

- (NSMutableArray)bnnsInputWeightsMomentumPointers
{
  return self->_bnnsInputWeightsMomentumPointers;
}

- (void)setBnnsInputWeightsMomentumPointers:(id)a3
{
}

- (NSMutableArray)bnnsHiddenWeightsMomentumPointers
{
  return self->_bnnsHiddenWeightsMomentumPointers;
}

- (void)setBnnsHiddenWeightsMomentumPointers:(id)a3
{
}

- (NSMutableArray)bnnsDesc2DInputWeightParams
{
  return self->_bnnsDesc2DInputWeightParams;
}

- (void)setBnnsDesc2DInputWeightParams:(id)a3
{
}

- (NSMutableArray)bnnsDesc2DHiddenWeightParams
{
  return self->_bnnsDesc2DHiddenWeightParams;
}

- (void)setBnnsDesc2DHiddenWeightParams:(id)a3
{
}

- (NSMutableArray)bnnsDesc2DInputWeightGrads
{
  return self->_bnnsDesc2DInputWeightGrads;
}

- (void)setBnnsDesc2DInputWeightGrads:(id)a3
{
}

- (NSMutableArray)bnnsDesc2DHiddenWeightGrads
{
  return self->_bnnsDesc2DHiddenWeightGrads;
}

- (void)setBnnsDesc2DHiddenWeightGrads:(id)a3
{
}

- (NSMutableArray)bnnsDesc2DInputWeightAccumulators
{
  return self->_bnnsDesc2DInputWeightAccumulators;
}

- (void)setBnnsDesc2DInputWeightAccumulators:(id)a3
{
}

- (NSMutableArray)bnnsDesc2DHiddenWeightAccumulators
{
  return self->_bnnsDesc2DHiddenWeightAccumulators;
}

- (void)setBnnsDesc2DHiddenWeightAccumulators:(id)a3
{
}

- (NSMutableArray)inputWeightsMomentumDataBytesArray
{
  return self->_inputWeightsMomentumDataBytesArray;
}

- (void)setInputWeightsMomentumDataBytesArray:(id)a3
{
}

- (NSMutableArray)hiddenWeightsMomentumDataBytesArray
{
  return self->_hiddenWeightsMomentumDataBytesArray;
}

- (void)setHiddenWeightsMomentumDataBytesArray:(id)a3
{
}

- (NSData)trainingCache
{
  return self->_trainingCache;
}

- (void)setTrainingCache:(id)a3
{
}

- (NSMutableArray)combinedGateWeightsAndBias
{
  return self->_combinedGateWeightsAndBias;
}

- (void)setCombinedGateWeightsAndBias:(id)a3
{
}

- (NSMutableArray)auxBiasTerms
{
  return self->_auxBiasTerms;
}

- (void)setAuxBiasTerms:(id)a3
{
}

- (NSMutableArray)auxBiasTermsAccumulators
{
  return self->_auxBiasTermsAccumulators;
}

- (void)setAuxBiasTermsAccumulators:(id)a3
{
}

- (NSMutableArray)parameterPointers
{
  return self->_parameterPointers;
}

- (void)setParameterPointers:(id)a3
{
}

- (NSMutableArray)combinedInputsBuffer
{
  return self->_combinedInputsBuffer;
}

- (void)setCombinedInputsBuffer:(id)a3
{
}

- (NSMutableArray)combinedOutputsBuffer
{
  return self->_combinedOutputsBuffer;
}

- (void)setCombinedOutputsBuffer:(id)a3
{
}

- (unint64_t)numLayers
{
  return self->_numLayers;
}

- (void)setNumLayers:(unint64_t)a3
{
  self->_numLayers = a3;
}

- (unint64_t)inputSize
{
  return self->_inputSize;
}

- (void)setInputSize:(unint64_t)a3
{
  self->_inputSize = a3;
}

- (unint64_t)hiddenSize
{
  return self->_hiddenSize;
}

- (void)setHiddenSize:(unint64_t)a3
{
  self->_hiddenSize = a3;
}

- (unint64_t)numAccumulatorsPerParameter
{
  return self->_numAccumulatorsPerParameter;
}

- (void)setNumAccumulatorsPerParameter:(unint64_t)a3
{
  self->_numAccumulatorsPerParameter = a3;
}

- (unint64_t)numParametersForSingleLSTM
{
  return self->_numParametersForSingleLSTM;
}

- (void)setNumParametersForSingleLSTM:(unint64_t)a3
{
  self->_numParametersForSingleLSTM = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_combinedOutputsBuffer, 0);
  objc_storeStrong((id *)&self->_combinedInputsBuffer, 0);
  objc_storeStrong((id *)&self->_parameterPointers, 0);
  objc_storeStrong((id *)&self->_auxBiasTermsAccumulators, 0);
  objc_storeStrong((id *)&self->_auxBiasTerms, 0);
  objc_storeStrong((id *)&self->_combinedGateWeightsAndBias, 0);
  objc_storeStrong((id *)&self->_trainingCache, 0);
  objc_storeStrong((id *)&self->_hiddenWeightsMomentumDataBytesArray, 0);
  objc_storeStrong((id *)&self->_inputWeightsMomentumDataBytesArray, 0);
  objc_storeStrong((id *)&self->_bnnsDesc2DHiddenWeightAccumulators, 0);
  objc_storeStrong((id *)&self->_bnnsDesc2DInputWeightAccumulators, 0);
  objc_storeStrong((id *)&self->_bnnsDesc2DHiddenWeightGrads, 0);
  objc_storeStrong((id *)&self->_bnnsDesc2DInputWeightGrads, 0);
  objc_storeStrong((id *)&self->_bnnsDesc2DHiddenWeightParams, 0);
  objc_storeStrong((id *)&self->_bnnsDesc2DInputWeightParams, 0);
  objc_storeStrong((id *)&self->_bnnsHiddenWeightsMomentumPointers, 0);
  objc_storeStrong((id *)&self->_bnnsInputWeightsMomentumPointers, 0);
  objc_storeStrong((id *)&self->_hiddenWeightsMomentumDescDataPointer, 0);
  objc_storeStrong((id *)&self->_inputWeightsMomentumDescDataPointer, 0);
  objc_storeStrong((id *)&self->_hiddenWeightsMomentumDescData, 0);
  objc_storeStrong((id *)&self->_inputWeightsMomentumDescData, 0);
  objc_storeStrong((id *)&self->_bnnsHiddenWeightsDeltaPointers, 0);
  objc_storeStrong((id *)&self->_bnnsInputWeightsDeltaPointers, 0);
  objc_storeStrong((id *)&self->_hiddenWeightsDeltaPointers, 0);
  objc_storeStrong((id *)&self->_inputWeightsDeltaPointers, 0);
  objc_storeStrong((id *)&self->_weightAndBiasGateDeltaBuffers, 0);

  objc_storeStrong((id *)&self->_lstmDeltaParams, 0);
}

@end