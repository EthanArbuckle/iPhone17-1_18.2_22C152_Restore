@interface LTTranslatorClass
@end

@implementation LTTranslatorClass

void __get_LTTranslatorClass_block_invoke(uint64_t a1)
{
  TranslationLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("_LTTranslator");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_LTTranslatorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v2 = [MEMORY[0x263F08690] currentHandler];
    v3 = [NSString stringWithUTF8String:"Class get_LTTranslatorClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"WFTranslateTextAction.m", 19, @"Unable to find class %s", "_LTTranslator");

    __break(1u);
  }
}

Class __get_LTTranslatorClass_block_invoke_54084(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v6[0] = 0;
  if (!TranslationLibraryCore_frameworkLibrary_54087)
  {
    v6[1] = (void *)MEMORY[0x263EF8330];
    v6[2] = (void *)3221225472;
    v6[3] = __TranslationLibraryCore_block_invoke_54088;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_264E5E5D8;
    uint64_t v8 = 0;
    TranslationLibraryCore_frameworkLibrary_54087 = _sl_dlopen();
  }
  if (!TranslationLibraryCore_frameworkLibrary_54087)
  {
    v3 = [MEMORY[0x263F08690] currentHandler];
    v4 = [NSString stringWithUTF8String:"void *TranslationLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"WFTranslateTextLanguagePickerParameter.m", 20, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("_LTTranslator");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    v3 = [MEMORY[0x263F08690] currentHandler];
    v5 = [NSString stringWithUTF8String:"Class get_LTTranslatorClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"WFTranslateTextLanguagePickerParameter.m", 21, @"Unable to find class %s", "_LTTranslator");

LABEL_10:
    __break(1u);
  }
  get_LTTranslatorClass_softClass_54083 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end