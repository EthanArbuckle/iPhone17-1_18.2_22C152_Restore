@interface MLCDeviceGPU(MLCEngineDispatch)
@end

@implementation MLCDeviceGPU(MLCEngineDispatch)

- (void)dispatchRNNForwardLayer:()MLCEngineDispatch sourceTensors:resultTensors:resultStateIsTemporary:forTraining:.cold.1(uint8_t *a1, SEL aSelector, void *a3, NSObject *a4)
{
  v7 = NSStringFromSelector(aSelector);
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_1DD0C9000, a4, OS_LOG_TYPE_ERROR, "%@: LSTM input tensor is not 3-dimensional with NTC layout", a1, 0xCu);
}

- (void)updateWithOptimizer:()MLCEngineDispatch arrayOfParams:commandBuffer:deviceParameter:source:gradient:result:momentumIndex:.cold.1(const char *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = NSStringFromSelector(a1);
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1DD0C9000, a2, OS_LOG_TYPE_ERROR, "%@: Unsupported optimizer type, only SGD, Adam and RMSProp optimizers are supported.", (uint8_t *)&v4, 0xCu);
}

- (void)updateAllParametersWithOptimizer:()MLCEngineDispatch arrayOfParameters:.cold.1(uint8_t *a1, SEL aSelector, void *a3, NSObject *a4)
{
  v7 = NSStringFromSelector(aSelector);
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_1DD0C9000, a4, OS_LOG_TYPE_ERROR, "%@: Unsupported optimizer type, only SGD, Adam and RMSProp optimizers are supported.", a1, 0xCu);
}

- (void)convertUpdatesToTensorDataForLayer:()MLCEngineDispatch .cold.1(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "-[MLCDeviceGPU(MLCEngineDispatch) convertUpdatesToTensorDataForLayer:]";
  OUTLINED_FUNCTION_0_7(&dword_1DD0C9000, (int)a2, a3, "%s: failed to convert weight gradient layout for a convolution layer", a1);
}

- (void)convertUpdatesToTensorDataForLayer:()MLCEngineDispatch .cold.2(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "-[MLCDeviceGPU(MLCEngineDispatch) convertUpdatesToTensorDataForLayer:]";
  OUTLINED_FUNCTION_0_7(&dword_1DD0C9000, (int)a2, a3, "%s: failed to convert weight layout from OIHW to IOHW for a convolution transpose layer", a1);
}

- (void)reloadParameterDataFromHostToDeviceMemoryForTensor:()MLCEngineDispatch .cold.1(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "-[MLCDeviceGPU(MLCEngineDispatch) reloadParameterDataFromHostToDeviceMemoryForTensor:]";
  OUTLINED_FUNCTION_0_7(&dword_1DD0C9000, (int)a2, a3, "%s: failed to convert weight layout for a convolution layer", a1);
}

@end