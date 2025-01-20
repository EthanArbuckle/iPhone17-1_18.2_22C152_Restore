@interface ANEDeviceInfoClass
@end

@implementation ANEDeviceInfoClass

Class __get_ANEDeviceInfoClass_block_invoke(uint64_t a1)
{
  if (!AppleNeuralEngineLibraryCore())
  {
    v3 = (void *)abort_report_np();
    free(v3);
  }
  Class result = objc_getClass("_ANEDeviceInfo");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_ANEDeviceInfoClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v4 = __get_ANEDeviceInfoClass_block_invoke_cold_1();
    return (Class)__getMGGetBoolAnswerSymbolLoc_block_invoke(v4);
  }
  return result;
}

id __get_ANEDeviceInfoClass_block_invoke_cold_1()
{
  v0 = (AXBaseSettings *)abort_report_np();
  return [(AXBaseSettings *)v0 domainNameForPreferenceKey:v2];
}

@end