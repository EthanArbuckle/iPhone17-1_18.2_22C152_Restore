@interface LTTranslatorClass
@end

@implementation LTTranslatorClass

void __get_LTTranslatorClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("_LTTranslator");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_LTTranslatorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __get_LTTranslatorClass_block_invoke_cold_1();
    TranslationLibrary();
  }
}

uint64_t __get_LTTranslatorClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __get_LTInstallRequestClass_block_invoke_cold_1(v0);
}

@end