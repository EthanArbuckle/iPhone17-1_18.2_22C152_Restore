@interface MTLFunctionInternal
@end

@implementation MTLFunctionInternal

uint64_t __77___MTLFunctionInternal_storeTrackingDataWithDescriptor_function_variantHash___block_invoke()
{
  uint64_t result = MTLGetEnvDefault("MTL_ENABLE_METAL_SCRIPT_COLLECTION", 0);
  -[_MTLFunctionInternal storeTrackingDataWithDescriptor:function:variantHash:]::enableMetalScriptCollection = result != 0;
  return result;
}

id __100___MTLFunctionInternal_newSpecializedFunctionWithDescriptor_destinationArchive_functionCache_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = a2;
  id result = a3;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

void __117___MTLFunctionInternal_newSpecializedFunctionWithDescriptor_destinationArchive_functionCache_sync_completionHandler___block_invoke(uint64_t a1, uint64_t a2, dispatch_data_t data, uint64_t a4)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v8 = *(void **)(a1 + 32);
  if (v8) {
    [v8 remoteInsertionEnd];
  }
  if (a2)
  {
    if (a4)
    {
      v9 = (__CFString *)[NSString stringWithUTF8String:a4];
      if (!v9) {
        v9 = (__CFString *)[NSString stringWithCString:a4 encoding:1];
      }
    }
    else
    {
      v9 = @"empty error message";
    }
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v9 forKey:*MEMORY[0x1E4F28568]];
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MTLLibraryErrorDomain" code:3 userInfo:v13];
    v15 = *(NSObject **)(a1 + 64);
    if (v15) {
      dispatch_release(v15);
    }
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
  else
  {
    size_t v27 = 0;
    buffer_ptr.var0.var0 = 0;
    v10 = dispatch_data_create_map(data, (const void **)&buffer_ptr, &v27);
    subrange = 0;
    if (*(unsigned char *)buffer_ptr.var0.var0)
    {
      size_t v12 = *(unsigned int *)(buffer_ptr.var0.var0 + 44);
      if (v12) {
        subrange = dispatch_data_create_subrange(data, *(unsigned int *)(buffer_ptr.var0.var0 + 40), v12);
      }
      else {
        subrange = 0;
      }
    }
    dispatch_release(v10);
    v19 = MTLLibraryBuilder::newLibraryWithData(*(void *)(*(void *)(*(void *)(a1 + 40) + 24) + 424), *(_MTLDevice **)(*(void *)(a1 + 40) + 24), subrange, *(void *)(a1 + 48), 0, v16, v17, v18);
    uint64_t v20 = [(_MTLLibrary *)v19 newFunctionWithName:*(void *)(a1 + 56)];
    *(unsigned char *)(v20 + 296) = *(unsigned char *)(*(void *)(a1 + 40) + 296);

    v21 = (void *)[*(id *)(a1 + 40) bitcodeData];
    v22 = dispatch_data_create((const void *)[v21 bytes], objc_msgSend(v21, "length"), 0, 0);
    v23 = [[MTLAirEntry alloc] initWithData:subrange bitcode:v22 airScript:*(void *)(a1 + 64)];
    dispatch_release(v22);
    dispatch_release(subrange);
    uint64_t v24 = *(void *)(a1 + 88);
    __n128 v25 = MTLHashKey::MTLHashKey((uint64_t)&buffer_ptr, a1 + 104);
    (*(void (**)(uint64_t, MTLHashKey *, MTLAirEntry *, __n128))(*(void *)v24 + 112))(v24, &buffer_ptr, v23, v25);
    MTLHashKey::~MTLHashKey(&buffer_ptr);
    v26 = *(NSObject **)(a1 + 64);
    if (*(void *)(v20 + 360))
    {
      if (v26) {
        dispatch_release(v26);
      }
    }
    else
    {
      *(void *)(v20 + 360) = v26;
    }
    [*(id *)(a1 + 40) storeTrackingDataWithDescriptor:*(void *)(a1 + 72) function:v20 variantHash:a1 + 104];
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();

    v14 = 0;
  }
}

void __60___MTLFunctionInternal_initializeStitchableFunctionMetadata__block_invoke_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
}

uint64_t __60___MTLFunctionInternal_initializeStitchableFunctionMetadata__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 371))
  {
    uint64_t v2 = result;
    v3 = (void *)[*(id *)(v1 + 24) compiler];
    uint64_t v4 = *(void *)(v2 + 32);
    uint64_t v5 = MEMORY[0x1E4F143A8];
    uint64_t v6 = 3221225472;
    v7 = __60___MTLFunctionInternal_initializeStitchableFunctionMetadata__block_invoke_2;
    v8 = &unk_1E5221210;
    uint64_t v9 = v4;
    id result = objc_msgSend(v3, "reflectionWithFunction:options:sync:completionHandler:");
    *(unsigned char *)(*(void *)(v2 + 32) + 371) = 1;
  }
  return result;
}

@end