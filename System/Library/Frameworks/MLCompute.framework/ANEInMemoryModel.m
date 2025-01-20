@interface ANEInMemoryModel
@end

@implementation ANEInMemoryModel

void *__softLinkClass_ANEInMemoryModel_block_invoke()
{
  if (AppleNeuralEngineLibrary_onceToken_1 != -1) {
    dispatch_once(&AppleNeuralEngineLibrary_onceToken_1, &__block_literal_global_189);
  }
  result = dlsym((void *)AppleNeuralEngineLibrary_frameworkLibrary_1, "OBJC_CLASS_$__ANEInMemoryModel");
  softLinkClass_ANEInMemoryModel_softLinkClass_ANEInMemoryModel = (uint64_t)result;
  return result;
}

@end