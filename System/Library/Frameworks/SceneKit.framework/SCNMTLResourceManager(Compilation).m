@interface SCNMTLResourceManager(Compilation)
@end

@implementation SCNMTLResourceManager(Compilation)

- (void)renderResourceForProgramDesc:()Compilation renderPassDescriptor:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: Metal renderer does not support nil vertex function name", v1, 2u);
}

- (void)renderResourceForProgramDesc:()Compilation renderPassDescriptor:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)renderResourceForProgramDesc:()Compilation renderPassDescriptor:.cold.3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Unreachable code: Metal renderer does not support other shaders than Metal", v1, 2u);
}

- (void)renderResourceForProgramDesc:()Compilation renderPassDescriptor:.cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_newComputeDescriptorForPipelineDesc:()Compilation library:.cold.1()
{
  OUTLINED_FUNCTION_3_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: Failed to find compute function '%@'", v2, v3, v4, v5, v6);
}

- (void)_newComputeDescriptorForPipelineDesc:()Compilation library:.cold.2()
{
  OUTLINED_FUNCTION_4_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_1_0(&dword_20B249000, v0, v1, "Error: Failed to create compute function '%@', error: %@");
}

- (void)_configureComputePipeline:()Compilation withDescriptor:.cold.1()
{
  OUTLINED_FUNCTION_3_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: Failed creating ComputePipelineState, error: %@", v2, v3, v4, v5, v6);
}

- (void)_computePipelineStateForKernel:()Compilation constants:constantsHash:threadGroupSizeIsMultipleOfThreadExecutionWidth:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)computePipelineStateForKernel:()Compilation withStageDescriptor:stageDescriptorUpdateBlock:constants:constantsHash:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)colorMatchingComputePipelineStateForBiPlanarPixelBufferWithFormatType:()Compilation pixelBufferYCbCrMatrix:pixelBufferColorPrimaries:pixelBufferTransferFunction:sourceColorSpace:destinationColorSpace:renderContext:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1_0(&dword_20B249000, a2, a3, "Error: Could not create color space from %@ and %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

- (void)colorMatchingComputePipelineStateForBiPlanarPixelBufferWithFormatType:()Compilation pixelBufferYCbCrMatrix:pixelBufferColorPrimaries:pixelBufferTransferFunction:sourceColorSpace:destinationColorSpace:renderContext:.cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)colorMatchingComputePipelineStateForBiPlanarPixelBufferWithFormatType:()Compilation pixelBufferYCbCrMatrix:pixelBufferColorPrimaries:pixelBufferTransferFunction:sourceColorSpace:destinationColorSpace:renderContext:.cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end