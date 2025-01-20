@interface MLCDeviceCPU(MLComputeEngineOptimizerUpdate)
@end

@implementation MLCDeviceCPU(MLComputeEngineOptimizerUpdate)

- (void)updateBatchNormalizationLayer:()MLComputeEngineOptimizerUpdate optimizer:betaParameter:gammaParameter:meanTensor:varianceTensor:arrayOfParams:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_8(&dword_1DD0C9000, v2, v3, "%@: Optimizer update for batch normalization layer with BNNS failed:%d", v4, v5, v6, v7, v8);
}

- (void)updateFullyConnectedLayer:()MLComputeEngineOptimizerUpdate optimizer:weightsParameter:biasesParameter:arrayOfParams:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_8(&dword_1DD0C9000, v2, v3, "%@: Optimizer update for fully connected layer with BNNS failed:%d", v4, v5, v6, v7, v8);
}

- (void)updateRNNLayer:()MLComputeEngineOptimizerUpdate optimizer:inputWeightsParameter:hiddenWeightsParameter:biasesParameter:arrayOfParams:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_8(&dword_1DD0C9000, v2, v3, "%@: Optimizer update for LSTM with BNNS failed:%d", v4, v5, v6, v7, v8);
}

- (void)updateMultiheadAttentionLayer:()MLComputeEngineOptimizerUpdate optimizer:weightsParameter:biasesParameter:arrayOfParams:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_8(&dword_1DD0C9000, v2, v3, "%@: Optimizer update for multi head attention layer with BNNS failed:%d", v4, v5, v6, v7, v8);
}

- (void)updateAllParametersWithOptimizer:()MLComputeEngineOptimizerUpdate arrayOfParameters:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_8(&dword_1DD0C9000, v2, v3, "%@: Optimizer update for all parameters with BNNS failed:%d", v4, v5, v6, v7, v8);
}

- (void)updateTensorParameter:()MLComputeEngineOptimizerUpdate optimizer:gradient:arrayOfParams:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_8(&dword_1DD0C9000, v2, v3, "%@: Optimizer update for tensor parameters with BNNS failed:%d", v4, v5, v6, v7, v8);
}

- (void)reloadParameterDataFromHostToDeviceMemoryForTensor:()MLComputeEngineOptimizerUpdate .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 data];
  int v6 = 134218240;
  uint64_t v7 = a2;
  __int16 v8 = 2048;
  uint64_t v9 = [v5 length];
  _os_log_error_impl(&dword_1DD0C9000, a3, OS_LOG_TYPE_ERROR, "Tensor size does not match expected size. Expected %lu size in bytes but tensor was %lu size in bytes", (uint8_t *)&v6, 0x16u);
}

@end