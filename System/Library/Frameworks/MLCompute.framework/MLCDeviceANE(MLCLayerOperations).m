@interface MLCDeviceANE(MLCLayerOperations)
@end

@implementation MLCDeviceANE(MLCLayerOperations)

- (void)convolutionTransposeLayerWithDescriptor:()MLCLayerOperations weights:biasTerms:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: unimplemented", v4, v5, v6, v7, v8);
}

- (void)lossLayerWithDescriptor:()MLCLayerOperations .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: unsupported", v4, v5, v6, v7, v8);
}

- (void)partitionInferenceGraph:()MLCLayerOperations startAtLayerIndex:aneDevice:secondaryDevice:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: graphLayerList is either nil or empty", v4, v5, v6, v7, v8);
}

- (void)partitionInferenceGraph:()MLCLayerOperations startAtLayerIndex:aneDevice:secondaryDevice:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: ANE and secondary devices must be provided", v4, v5, v6, v7, v8);
}

- (void)partitionInferenceGraph:()MLCLayerOperations startAtLayerIndex:aneDevice:secondaryDevice:.cold.3(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "canMergeANESubgraphs";
  _os_log_error_impl(&dword_1DD0C9000, log, OS_LOG_TYPE_ERROR, "%s: Graph has been partitioned incorrectly", buf, 0xCu);
}

- (void)partitionInferenceGraph:()MLCLayerOperations startAtLayerIndex:aneDevice:secondaryDevice:.cold.4()
{
  OUTLINED_FUNCTION_6_0();
  v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: Cannot build ANE subgraph from a layer = %@", v4, v5, v6, v7, v8);
}

- (void)updateTensorsForFusedLayers:()MLCLayerOperations ofInferenceGraph:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: no plist builder instance found", v4, v5, v6, v7, v8);
}

- (void)updateTensorsForFusedLayers:()MLCLayerOperations ofInferenceGraph:.cold.2()
{
  OUTLINED_FUNCTION_6_0();
  v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: failed to compute liveInputs of a graph with rootLayer  = %@", v4, v5, v6, v7, v8);
}

- (void)updateTensorsForFusedLayers:()MLCLayerOperations ofInferenceGraph:.cold.3()
{
  OUTLINED_FUNCTION_6_0();
  v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: tensor = %@ was not defined by any layer and cannot be used as liveout", v4, v5, v6, v7, v8);
}

- (void)updateTensorsForFusedLayers:()MLCLayerOperations ofInferenceGraph:.cold.4()
{
  OUTLINED_FUNCTION_6_0();
  v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: failed to build the ANEC IR network and procedure for layer=%@", v4, v5, v6, v7, v8);
}

- (void)compileLayerDeviceOps:()MLCLayerOperations sourceTensors:resultTensor:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v2 = NSStringFromSelector(v1);
  [v0 deviceOpType];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8(&dword_1DD0C9000, v3, v4, "%@: unsupported deviceOpType=%d", v5, v6, v7, v8, 2u);
}

- (void)compileLayerDeviceOps:()MLCLayerOperations sourceTensors:resultTensor:.cold.2()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v2 = NSStringFromSelector(v1);
  [v0 deviceOpType];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8(&dword_1DD0C9000, v3, v4, "%@: failed to compile a layer. deviceOpType=%d", v5, v6, v7, v8, 2u);
}

@end