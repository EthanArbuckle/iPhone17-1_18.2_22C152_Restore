@interface MLCRNNGPUDeviceOps
+ (id)deviceOpsWithForwardKernel:(id)a3 gradientKernel:(id)a4;
- (BOOL)batchFirst;
- (BOOL)isBidirectional;
- (BOOL)returnsSequences;
- (MLCRNNGPUDeviceOps)initWithForwardKernel:(id)a3 gradientKernel:(id)a4;
- (NSMutableArray)auxiliaryCenterWeightMemory;
- (NSMutableArray)auxiliaryMomentumMemory;
- (NSMutableArray)auxiliaryVelocityMemory;
- (NSMutableArray)auxiliaryWeightsMemory;
- (NSMutableArray)lstmDropoutForwardKernel;
- (NSMutableArray)lstmDropoutGradientKernel;
- (NSMutableArray)lstmDropoutSource;
- (NSMutableArray)lstmDropoutState;
- (NSMutableArray)rnnBuffers;
- (NSMutableArray)rnnCenterWeightMatrices;
- (NSMutableArray)rnnExportedBiasGradientMatrices;
- (NSMutableArray)rnnExportedBiasTerms;
- (NSMutableArray)rnnExportedHiddenWeightGradientMatrices;
- (NSMutableArray)rnnExportedInputWeightGradientMatrices;
- (NSMutableArray)rnnExportedWeightMatrices;
- (NSMutableArray)rnnMomentumMatrices;
- (NSMutableArray)rnnStackedLayersBufferResults;
- (NSMutableArray)rnnStackedLayersResults;
- (NSMutableArray)rnnTrainableStates;
- (NSMutableArray)rnnTrainableWeightGradients;
- (NSMutableArray)rnnTrainableWeights;
- (NSMutableArray)rnnVelocityMatrices;
- (float)lstmDropout;
- (id)biDirectionalGradientResult;
- (id)biDirectionalSumKernel;
- (id)forwardTimeGradientResult;
- (id)lstmMultiGPUChildOps;
- (id)reverseTimeGradientResult;
- (unint64_t)hiddenSize;
- (unint64_t)inputSize;
- (unint64_t)numLayers;
- (void)setAuxiliaryCenterWeightMemory:(id)a3;
- (void)setAuxiliaryMomentumMemory:(id)a3;
- (void)setAuxiliaryVelocityMemory:(id)a3;
- (void)setAuxiliaryWeightsMemory:(id)a3;
- (void)setBatchFirst:(BOOL)a3;
- (void)setBiDirectionalGradientResult:(id)a3;
- (void)setBiDirectionalSumKernel:(id)a3;
- (void)setForwardTimeGradientResult:(id)a3;
- (void)setHiddenSize:(unint64_t)a3;
- (void)setInputSize:(unint64_t)a3;
- (void)setIsBidirectional:(BOOL)a3;
- (void)setLstmDropout:(float)a3;
- (void)setLstmDropoutForwardKernel:(id)a3;
- (void)setLstmDropoutGradientKernel:(id)a3;
- (void)setLstmDropoutSource:(id)a3;
- (void)setLstmDropoutState:(id)a3;
- (void)setLstmMultiGPUChildOps:(id)a3;
- (void)setNumLayers:(unint64_t)a3;
- (void)setReturnsSequences:(BOOL)a3;
- (void)setReverseTimeGradientResult:(id)a3;
- (void)setRnnBuffers:(id)a3;
- (void)setRnnCenterWeightMatrices:(id)a3;
- (void)setRnnExportedBiasGradientMatrices:(id)a3;
- (void)setRnnExportedBiasTerms:(id)a3;
- (void)setRnnExportedHiddenWeightGradientMatrices:(id)a3;
- (void)setRnnExportedInputWeightGradientMatrices:(id)a3;
- (void)setRnnExportedWeightMatrices:(id)a3;
- (void)setRnnMomentumMatrices:(id)a3;
- (void)setRnnStackedLayersBufferResults:(id)a3;
- (void)setRnnStackedLayersResults:(id)a3;
- (void)setRnnTrainableStates:(id)a3;
- (void)setRnnTrainableWeightGradients:(id)a3;
- (void)setRnnTrainableWeights:(id)a3;
- (void)setRnnVelocityMatrices:(id)a3;
@end

@implementation MLCRNNGPUDeviceOps

+ (id)deviceOpsWithForwardKernel:(id)a3 gradientKernel:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithForwardKernel:v7 gradientKernel:v6];

  return v8;
}

- (MLCRNNGPUDeviceOps)initWithForwardKernel:(id)a3 gradientKernel:(id)a4
{
  v48.receiver = self;
  v48.super_class = (Class)MLCRNNGPUDeviceOps;
  v4 = [(MLCGPUDeviceOps *)&v48 initWithForwardKernel:a3 gradientKernel:a4 secondaryGradientKernel:0 forwardStatistics:0 gradientStatistics:0];
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E4F1CBF0];
    uint64_t v6 = [MEMORY[0x1E4F1CBF0] mutableCopy];
    rnnTrainableWeights = v4->_rnnTrainableWeights;
    v4->_rnnTrainableWeights = (NSMutableArray *)v6;

    uint64_t v8 = [v5 mutableCopy];
    rnnTrainableWeightGradients = v4->_rnnTrainableWeightGradients;
    v4->_rnnTrainableWeightGradients = (NSMutableArray *)v8;

    uint64_t v10 = [v5 mutableCopy];
    rnnTrainableStates = v4->_rnnTrainableStates;
    v4->_rnnTrainableStates = (NSMutableArray *)v10;

    uint64_t v12 = [v5 mutableCopy];
    rnnBuffers = v4->_rnnBuffers;
    v4->_rnnBuffers = (NSMutableArray *)v12;

    uint64_t v14 = [v5 mutableCopy];
    rnnExportedWeightMatrices = v4->_rnnExportedWeightMatrices;
    v4->_rnnExportedWeightMatrices = (NSMutableArray *)v14;

    uint64_t v16 = [v5 mutableCopy];
    rnnExportedBiasTerms = v4->_rnnExportedBiasTerms;
    v4->_rnnExportedBiasTerms = (NSMutableArray *)v16;

    uint64_t v18 = [v5 mutableCopy];
    rnnStackedLayersResults = v4->_rnnStackedLayersResults;
    v4->_rnnStackedLayersResults = (NSMutableArray *)v18;

    uint64_t v20 = [v5 mutableCopy];
    rnnStackedLayersBufferResults = v4->_rnnStackedLayersBufferResults;
    v4->_rnnStackedLayersBufferResults = (NSMutableArray *)v20;

    uint64_t v22 = [v5 mutableCopy];
    rnnMomentumMatrices = v4->_rnnMomentumMatrices;
    v4->_rnnMomentumMatrices = (NSMutableArray *)v22;

    uint64_t v24 = [v5 mutableCopy];
    rnnVelocityMatrices = v4->_rnnVelocityMatrices;
    v4->_rnnVelocityMatrices = (NSMutableArray *)v24;

    uint64_t v26 = [v5 mutableCopy];
    rnnCenterWeightMatrices = v4->_rnnCenterWeightMatrices;
    v4->_rnnCenterWeightMatrices = (NSMutableArray *)v26;

    uint64_t v28 = [v5 mutableCopy];
    rnnExportedInputWeightGradientMatrices = v4->_rnnExportedInputWeightGradientMatrices;
    v4->_rnnExportedInputWeightGradientMatrices = (NSMutableArray *)v28;

    uint64_t v30 = [v5 mutableCopy];
    rnnExportedHiddenWeightGradientMatrices = v4->_rnnExportedHiddenWeightGradientMatrices;
    v4->_rnnExportedHiddenWeightGradientMatrices = (NSMutableArray *)v30;

    uint64_t v32 = [v5 mutableCopy];
    rnnExportedBiasGradientMatrices = v4->_rnnExportedBiasGradientMatrices;
    v4->_rnnExportedBiasGradientMatrices = (NSMutableArray *)v32;

    v4->_isBidirectional = 0;
    v4->_batchFirst = 1;
    v4->_returnsSequences = 1;
    v4->_hiddenSize = 0;
    v4->_inputSize = 0;
    v4->_numLayers = 0;
    id forwardTimeGradientResult = v4->_forwardTimeGradientResult;
    v4->_id forwardTimeGradientResult = 0;

    id reverseTimeGradientResult = v4->_reverseTimeGradientResult;
    v4->_id reverseTimeGradientResult = 0;

    id biDirectionalGradientResult = v4->_biDirectionalGradientResult;
    v4->_id biDirectionalGradientResult = 0;

    id biDirectionalSumKernel = v4->_biDirectionalSumKernel;
    v4->_id biDirectionalSumKernel = 0;

    v4->_lstmDropout = 0.0;
    uint64_t v38 = [v5 mutableCopy];
    lstmDropoutForwardKernel = v4->_lstmDropoutForwardKernel;
    v4->_lstmDropoutForwardKernel = (NSMutableArray *)v38;

    uint64_t v40 = [v5 mutableCopy];
    lstmDropoutGradientKernel = v4->_lstmDropoutGradientKernel;
    v4->_lstmDropoutGradientKernel = (NSMutableArray *)v40;

    uint64_t v42 = [v5 mutableCopy];
    lstmDropoutSource = v4->_lstmDropoutSource;
    v4->_lstmDropoutSource = (NSMutableArray *)v42;

    uint64_t v44 = [v5 mutableCopy];
    lstmDropoutState = v4->_lstmDropoutState;
    v4->_lstmDropoutState = (NSMutableArray *)v44;

    id lstmMultiGPUChildOps = v4->_lstmMultiGPUChildOps;
    v4->_id lstmMultiGPUChildOps = 0;
  }
  return v4;
}

- (NSMutableArray)rnnTrainableWeights
{
  return self->_rnnTrainableWeights;
}

- (void)setRnnTrainableWeights:(id)a3
{
}

- (NSMutableArray)rnnTrainableWeightGradients
{
  return self->_rnnTrainableWeightGradients;
}

- (void)setRnnTrainableWeightGradients:(id)a3
{
}

- (NSMutableArray)rnnTrainableStates
{
  return self->_rnnTrainableStates;
}

- (void)setRnnTrainableStates:(id)a3
{
}

- (NSMutableArray)rnnBuffers
{
  return self->_rnnBuffers;
}

- (void)setRnnBuffers:(id)a3
{
}

- (NSMutableArray)rnnExportedWeightMatrices
{
  return self->_rnnExportedWeightMatrices;
}

- (void)setRnnExportedWeightMatrices:(id)a3
{
}

- (NSMutableArray)rnnExportedBiasTerms
{
  return self->_rnnExportedBiasTerms;
}

- (void)setRnnExportedBiasTerms:(id)a3
{
}

- (NSMutableArray)rnnStackedLayersResults
{
  return self->_rnnStackedLayersResults;
}

- (void)setRnnStackedLayersResults:(id)a3
{
}

- (NSMutableArray)rnnStackedLayersBufferResults
{
  return self->_rnnStackedLayersBufferResults;
}

- (void)setRnnStackedLayersBufferResults:(id)a3
{
}

- (NSMutableArray)rnnExportedInputWeightGradientMatrices
{
  return self->_rnnExportedInputWeightGradientMatrices;
}

- (void)setRnnExportedInputWeightGradientMatrices:(id)a3
{
}

- (NSMutableArray)rnnExportedHiddenWeightGradientMatrices
{
  return self->_rnnExportedHiddenWeightGradientMatrices;
}

- (void)setRnnExportedHiddenWeightGradientMatrices:(id)a3
{
}

- (NSMutableArray)rnnExportedBiasGradientMatrices
{
  return self->_rnnExportedBiasGradientMatrices;
}

- (void)setRnnExportedBiasGradientMatrices:(id)a3
{
}

- (NSMutableArray)rnnMomentumMatrices
{
  return self->_rnnMomentumMatrices;
}

- (void)setRnnMomentumMatrices:(id)a3
{
}

- (NSMutableArray)rnnVelocityMatrices
{
  return self->_rnnVelocityMatrices;
}

- (void)setRnnVelocityMatrices:(id)a3
{
}

- (NSMutableArray)rnnCenterWeightMatrices
{
  return self->_rnnCenterWeightMatrices;
}

- (void)setRnnCenterWeightMatrices:(id)a3
{
}

- (BOOL)isBidirectional
{
  return self->_isBidirectional;
}

- (void)setIsBidirectional:(BOOL)a3
{
  self->_isBidirectional = a3;
}

- (BOOL)batchFirst
{
  return self->_batchFirst;
}

- (void)setBatchFirst:(BOOL)a3
{
  self->_batchFirst = a3;
}

- (BOOL)returnsSequences
{
  return self->_returnsSequences;
}

- (void)setReturnsSequences:(BOOL)a3
{
  self->_returnsSequences = a3;
}

- (unint64_t)hiddenSize
{
  return self->_hiddenSize;
}

- (void)setHiddenSize:(unint64_t)a3
{
  self->_hiddenSize = a3;
}

- (unint64_t)inputSize
{
  return self->_inputSize;
}

- (void)setInputSize:(unint64_t)a3
{
  self->_inputSize = a3;
}

- (unint64_t)numLayers
{
  return self->_numLayers;
}

- (void)setNumLayers:(unint64_t)a3
{
  self->_numLayers = a3;
}

- (float)lstmDropout
{
  return self->_lstmDropout;
}

- (void)setLstmDropout:(float)a3
{
  self->_lstmDropout = a3;
}

- (id)forwardTimeGradientResult
{
  return self->_forwardTimeGradientResult;
}

- (void)setForwardTimeGradientResult:(id)a3
{
}

- (id)reverseTimeGradientResult
{
  return self->_reverseTimeGradientResult;
}

- (void)setReverseTimeGradientResult:(id)a3
{
}

- (id)biDirectionalGradientResult
{
  return self->_biDirectionalGradientResult;
}

- (void)setBiDirectionalGradientResult:(id)a3
{
}

- (id)biDirectionalSumKernel
{
  return self->_biDirectionalSumKernel;
}

- (void)setBiDirectionalSumKernel:(id)a3
{
}

- (NSMutableArray)lstmDropoutForwardKernel
{
  return self->_lstmDropoutForwardKernel;
}

- (void)setLstmDropoutForwardKernel:(id)a3
{
}

- (NSMutableArray)lstmDropoutGradientKernel
{
  return self->_lstmDropoutGradientKernel;
}

- (void)setLstmDropoutGradientKernel:(id)a3
{
}

- (NSMutableArray)lstmDropoutSource
{
  return self->_lstmDropoutSource;
}

- (void)setLstmDropoutSource:(id)a3
{
}

- (NSMutableArray)lstmDropoutState
{
  return self->_lstmDropoutState;
}

- (void)setLstmDropoutState:(id)a3
{
}

- (NSMutableArray)auxiliaryWeightsMemory
{
  return self->_auxiliaryWeightsMemory;
}

- (void)setAuxiliaryWeightsMemory:(id)a3
{
}

- (NSMutableArray)auxiliaryMomentumMemory
{
  return self->_auxiliaryMomentumMemory;
}

- (void)setAuxiliaryMomentumMemory:(id)a3
{
}

- (NSMutableArray)auxiliaryVelocityMemory
{
  return self->_auxiliaryVelocityMemory;
}

- (void)setAuxiliaryVelocityMemory:(id)a3
{
}

- (NSMutableArray)auxiliaryCenterWeightMemory
{
  return self->_auxiliaryCenterWeightMemory;
}

- (void)setAuxiliaryCenterWeightMemory:(id)a3
{
}

- (id)lstmMultiGPUChildOps
{
  return self->_lstmMultiGPUChildOps;
}

- (void)setLstmMultiGPUChildOps:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lstmMultiGPUChildOps, 0);
  objc_storeStrong((id *)&self->_auxiliaryCenterWeightMemory, 0);
  objc_storeStrong((id *)&self->_auxiliaryVelocityMemory, 0);
  objc_storeStrong((id *)&self->_auxiliaryMomentumMemory, 0);
  objc_storeStrong((id *)&self->_auxiliaryWeightsMemory, 0);
  objc_storeStrong((id *)&self->_lstmDropoutState, 0);
  objc_storeStrong((id *)&self->_lstmDropoutSource, 0);
  objc_storeStrong((id *)&self->_lstmDropoutGradientKernel, 0);
  objc_storeStrong((id *)&self->_lstmDropoutForwardKernel, 0);
  objc_storeStrong(&self->_biDirectionalSumKernel, 0);
  objc_storeStrong(&self->_biDirectionalGradientResult, 0);
  objc_storeStrong(&self->_reverseTimeGradientResult, 0);
  objc_storeStrong(&self->_forwardTimeGradientResult, 0);
  objc_storeStrong((id *)&self->_rnnCenterWeightMatrices, 0);
  objc_storeStrong((id *)&self->_rnnVelocityMatrices, 0);
  objc_storeStrong((id *)&self->_rnnMomentumMatrices, 0);
  objc_storeStrong((id *)&self->_rnnExportedBiasGradientMatrices, 0);
  objc_storeStrong((id *)&self->_rnnExportedHiddenWeightGradientMatrices, 0);
  objc_storeStrong((id *)&self->_rnnExportedInputWeightGradientMatrices, 0);
  objc_storeStrong((id *)&self->_rnnStackedLayersBufferResults, 0);
  objc_storeStrong((id *)&self->_rnnStackedLayersResults, 0);
  objc_storeStrong((id *)&self->_rnnExportedBiasTerms, 0);
  objc_storeStrong((id *)&self->_rnnExportedWeightMatrices, 0);
  objc_storeStrong((id *)&self->_rnnBuffers, 0);
  objc_storeStrong((id *)&self->_rnnTrainableStates, 0);
  objc_storeStrong((id *)&self->_rnnTrainableWeightGradients, 0);

  objc_storeStrong((id *)&self->_rnnTrainableWeights, 0);
}

@end