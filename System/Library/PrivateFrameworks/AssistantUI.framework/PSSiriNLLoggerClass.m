@interface PSSiriNLLoggerClass
@end

@implementation PSSiriNLLoggerClass

Class __get_PSSiriNLLoggerClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!PeopleSuggesterLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __PeopleSuggesterLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_264692D20;
    uint64_t v5 = 0;
    PeopleSuggesterLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!PeopleSuggesterLibraryCore_frameworkLibrary) {
    __get_PSSiriNLLoggerClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("_PSSiriNLLogger");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __get_PSSiriNLLoggerClass_block_invoke_cold_2();
  }
  get_PSSiriNLLoggerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_PSSiriNLLoggerClass_block_invoke_cold_1(void *a1)
{
  v2 = [MEMORY[0x263F08690] currentHandler];
  v3 = [NSString stringWithUTF8String:"void *PeopleSuggesterLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AFUISiriViewController.m", 148, @"%s", *a1);

  __break(1u);
}

void __get_PSSiriNLLoggerClass_block_invoke_cold_2()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"Class get_PSSiriNLLoggerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AFUISiriViewController.m", 149, @"Unable to find class %s", "_PSSiriNLLogger");

  __break(1u);
}

@end