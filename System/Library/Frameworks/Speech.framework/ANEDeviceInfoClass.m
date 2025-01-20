@interface ANEDeviceInfoClass
@end

@implementation ANEDeviceInfoClass

Class __get_ANEDeviceInfoClass_block_invoke(uint64_t a1)
{
  if (!AppleNeuralEngineLibraryCore_frameworkLibrary) {
    AppleNeuralEngineLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  Class result = objc_getClass("_ANEDeviceInfo");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_ANEDeviceInfoClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end