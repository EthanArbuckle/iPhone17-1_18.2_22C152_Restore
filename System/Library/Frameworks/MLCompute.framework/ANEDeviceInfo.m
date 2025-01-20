@interface ANEDeviceInfo
@end

@implementation ANEDeviceInfo

void *__softLinkClass_ANEDeviceInfo_block_invoke()
{
  if (AppleNeuralEngineLibrary_onceToken_0 != -1) {
    dispatch_once(&AppleNeuralEngineLibrary_onceToken_0, &__block_literal_global_102);
  }
  result = dlsym((void *)AppleNeuralEngineLibrary_frameworkLibrary_0, "OBJC_CLASS_$__ANEDeviceInfo");
  softLinkClass_ANEDeviceInfo_softLinkClass_ANEDeviceInfo = (uint64_t)result;
  return result;
}

void *__softLinkClass_ANEDeviceInfo_block_invoke_0()
{
  if (AppleNeuralEngineLibrary_onceToken_1 != -1) {
    dispatch_once(&AppleNeuralEngineLibrary_onceToken_1, &__block_literal_global_189);
  }
  result = dlsym((void *)AppleNeuralEngineLibrary_frameworkLibrary_1, "OBJC_CLASS_$__ANEDeviceInfo");
  softLinkClass_ANEDeviceInfo_softLinkClass_ANEDeviceInfo_0 = (uint64_t)result;
  return result;
}

void *__softLinkClass_ANEDeviceInfo_block_invoke_1()
{
  if (AppleNeuralEngineLibrary_onceToken_2 != -1) {
    dispatch_once(&AppleNeuralEngineLibrary_onceToken_2, &__block_literal_global_119);
  }
  result = dlsym((void *)AppleNeuralEngineLibrary_frameworkLibrary_2, "OBJC_CLASS_$__ANEDeviceInfo");
  softLinkClass_ANEDeviceInfo_softLinkClass_ANEDeviceInfo_1 = (uint64_t)result;
  return result;
}

@end