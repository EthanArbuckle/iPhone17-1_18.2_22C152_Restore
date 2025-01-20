@interface ANERequest
@end

@implementation ANERequest

void *__softLinkClass_ANERequest_block_invoke()
{
  if (AppleNeuralEngineLibrary_onceToken_1 != -1) {
    dispatch_once(&AppleNeuralEngineLibrary_onceToken_1, &__block_literal_global_189);
  }
  result = dlsym((void *)AppleNeuralEngineLibrary_frameworkLibrary_1, "OBJC_CLASS_$__ANERequest");
  softLinkClass_ANERequest_softLinkClass_ANERequest = (uint64_t)result;
  return result;
}

@end