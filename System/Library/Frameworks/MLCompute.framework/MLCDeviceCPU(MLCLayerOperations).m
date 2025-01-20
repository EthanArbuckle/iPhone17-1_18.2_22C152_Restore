@interface MLCDeviceCPU(MLCLayerOperations)
@end

@implementation MLCDeviceCPU(MLCLayerOperations)

- (void)compileLayerDeviceOps:()MLCLayerOperations sourceTensors:resultTensor:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_8(&dword_1DD0C9000, v2, v3, "%@: NULL filter deviceOpTyp=%d", v4, v5, v6, v7, v8);
}

- (void)compileLayerDeviceOps:()MLCLayerOperations sourceTensors:resultTensor:.cold.2()
{
  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_8(&dword_1DD0C9000, v2, v3, "%@: Unsupported deviceOpTyp=%d", v4, v5, v6, v7, v8);
}

- (void)compileLayerDeviceOps:()MLCLayerOperations sourceTensors:resultTensor:.cold.3()
{
  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_8(&dword_1DD0C9000, v2, v3, "%@: -compileWithDevice:... failed. deviceOpType=%d", v4, v5, v6, v7, v8);
}

- (void)compileLayerDeviceOps:()MLCLayerOperations sourceTensors:resultTensor:.cold.17()
{
  OUTLINED_FUNCTION_6_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_8(&dword_1DD0C9000, v2, v3, "%@: -compileWithDevice:... failed. deviceOpTyp=%d", v4, v5, v6, v7, v8);
}

- (void)embeddingWeightsGradients:()MLCLayerOperations embeddingCount:embeddingDimension:.cold.1(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: -embeddingWeightsGradients:... failed. Can not malloc the size of weight table", v4, v5, v6, v7, v8);
}

- (void)allocateParameterGradientsForDeviceOps:()MLCLayerOperations parameters:.cold.1(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: -initWithDevice:... failed. Cannot allocate weight gradients for embedding layer", v4, v5, v6, v7, v8);
}

- (void)allocateParameterGradientsForDeviceOps:()MLCLayerOperations parameters:.cold.2(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: -initWithDevice:... failed. Cannot allocate weight gradients for convolution layer", v4, v5, v6, v7, v8);
}

- (void)allocateParameterGradientsForDeviceOps:()MLCLayerOperations parameters:.cold.3(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: -initWithDevice:... failed. Cannot allocate bias gradients for convolution layer", v4, v5, v6, v7, v8);
}

@end