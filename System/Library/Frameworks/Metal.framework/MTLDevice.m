@interface MTLDevice
@end

@implementation MTLDevice

uint64_t __61___MTLDevice_newLibraryWithSource_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2, NSError *a3)
{
  if (a2 && a3) {
    _MTLCompilerWarningLog(a3);
  }
  v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v4();
}

void __48___MTLDevice_serializeRenderPipelineDescriptor___block_invoke(MTLPipelineLibrarySerializer::PipelineDescriptorSerializer *a1)
{
}

void __49___MTLDevice_serializeComputePipelineDescriptor___block_invoke(MTLPipelineLibrarySerializer::PipelineDescriptorSerializer *a1)
{
}

void __52___MTLDevice_serializeTileRenderPipelineDescriptor___block_invoke(MTLPipelineLibrarySerializer::PipelineDescriptorSerializer *a1)
{
}

void __52___MTLDevice_serializeMeshRenderPipelineDescriptor___block_invoke(MTLPipelineLibrarySerializer::PipelineDescriptorSerializer *a1)
{
}

void __49___MTLDevice_newLibraryWithSource_options_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = a2;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = a3;
  if ([*(id *)(a1 + 32) isCollectingLibraries])
  {
    v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (v5)
    {
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 440);
      MTLPipelineCollection::addLibrary(v6, v5);
    }
  }
}

uint64_t __52___MTLDevice_optionsForPipelineLibrarySerialization__block_invoke()
{
  uint64_t result = MTLGetEnvDefault("MTL_DUMP_PIPELINES_AS_METAL_SCRIPT", 0);
  -[_MTLDevice optionsForPipelineLibrarySerialization]::serializeMetalScript = result;
  return result;
}

void __71___MTLDevice__newDynamicLibraryWithDescriptor_computeDescriptor_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = a3;
  if (a2)
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = -[_MTLDynamicLibrary initWithLibrary:binaryData:device:error:]([_MTLDynamicLibrary alloc], "initWithLibrary:binaryData:device:error:", [*(id *)(a1 + 32) library], *(void *)(a2 + 24), *(void *)(a1 + 40), *(void *)(a1 + 64));
    if (*(void *)(a2 + 104))
    {
      v5 = [[MTLDebugInstrumentationData alloc] initWithData:*(void *)(a2 + 104)];
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setDebugInstrumentationData:v5];
    }
  }
}

uint64_t __68___MTLDevice_newComputePipelineStateWithFunction_completionHandler___block_invoke(uint64_t a1)
{
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v2();
}

uint64_t __76___MTLDevice_newComputePipelineStateWithFunction_options_completionHandler___block_invoke(uint64_t a1)
{
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v2();
}

void __65___MTLDevice_newLibraryWithStitchedDescriptor_completionHandler___block_invoke(void *a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1[4] + 440);
    if (v3) {
      MTLPipelineCollection::addStitchedLibrary(v3, a2);
    }
  }
  (*(void (**)(void))(a1[7] + 16))();
  v4 = (void *)a1[6];
}

uint64_t __69___MTLDevice_newRenderPipelineStateWithDescriptor_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __70___MTLDevice_newComputePipelineStateWithDescriptor_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __37___MTLDevice__rateLimitQueueCreation__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

uint64_t __44___MTLDevice_lookupRecompiledBinaryArchive___block_invoke()
{
  v3[5] = *MEMORY[0x1E4F143B8];
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier");
  if (result)
  {
    uint64_t v1 = result;
    if (MTLGetBaseCachePath(void)::onceToken != -1) {
      dispatch_once(&MTLGetBaseCachePath(void)::onceToken, &__block_literal_global_5);
    }
    v3[0] = MTLGetBaseCachePath(void)::result;
    v3[1] = @"com.apple.metalassetupgrader";
    v3[2] = @"recompiled";
    v3[3] = v1;
    v3[4] = @"archiveMapping.db";
    uint64_t result = stat((const char *)objc_msgSend((id)objc_msgSend(NSString, "pathWithComponents:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v3, 5)), "UTF8String"), &v2);
    if (!result) {
      operator new();
    }
  }
  return result;
}

uint64_t __39___MTLDevice_recordBinaryArchiveUsage___block_invoke()
{
  v1[2] = *MEMORY[0x1E4F143B8];
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier");
  if (result)
  {
    if (MTLGetShaderCachePath::onceToken != -1) {
      dispatch_once(&MTLGetShaderCachePath::onceToken, &__block_literal_global_4);
    }
    v1[0] = MTLGetShaderCachePath::result;
    v1[1] = @"archiveUsage.db";
    objc_msgSend(NSString, "pathWithComponents:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v1, 2));
    operator new();
  }
  return result;
}

void __26___MTLDevice_architecture__block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 552))
  {
    stat v2 = (void *)MEMORY[0x18530C9F0]();
    uint64_t v3 = (void *)[*(id *)(a1 + 32) targetDeviceArchitecture];
    *(void *)(*(void *)(a1 + 32) + 552) = -[MTLArchitecture initWithCPUType:cpuSubtype:]([MTLArchitecture alloc], "initWithCPUType:cpuSubtype:", [v3 cpuType], objc_msgSend(v3, "subType"));
  }
}

@end