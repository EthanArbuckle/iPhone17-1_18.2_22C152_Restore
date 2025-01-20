@interface IntrinsicsSymbolLoc
@end

@implementation IntrinsicsSymbolLoc

void *__getkCVAFaceTracking_IntrinsicsSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)AppleCVALibrary();
  result = dlsym(v2, "kCVAFaceTracking_Intrinsics");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCVAFaceTracking_IntrinsicsSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkCVAFaceTracking_IntrinsicsSymbolLoc_block_invoke_0(uint64_t a1)
{
  v2 = (void *)AppleCVALibrary_0();
  result = dlsym(v2, "kCVAFaceTracking_Intrinsics");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCVAFaceTracking_IntrinsicsSymbolLoc_ptr_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end