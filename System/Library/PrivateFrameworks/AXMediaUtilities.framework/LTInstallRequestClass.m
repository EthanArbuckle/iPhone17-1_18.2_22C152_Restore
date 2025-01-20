@interface LTInstallRequestClass
@end

@implementation LTInstallRequestClass

Class __get_LTInstallRequestClass_block_invoke(uint64_t a1)
{
  TranslationLibrary();
  Class result = objc_getClass("_LTInstallRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_LTInstallRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __get_LTInstallRequestClass_block_invoke_cold_1();
    return (Class)__get_LTTextTranslationRequestClass_block_invoke(v3);
  }
  return result;
}

uint64_t __get_LTInstallRequestClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __get_LTTextTranslationRequestClass_block_invoke_cold_1(v0);
}

@end