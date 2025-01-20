@interface SpotlightExtrasClass
@end

@implementation SpotlightExtrasClass

Class __getSFSearchResult_SpotlightExtrasClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!SpotlightServicesLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __SpotlightServicesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E5D0A160;
    uint64_t v5 = 0;
    SpotlightServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SpotlightServicesLibraryCore_frameworkLibrary) {
    __getSFSearchResult_SpotlightExtrasClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("SFSearchResult_SpotlightExtras");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getSFSearchResult_SpotlightExtrasClass_block_invoke_cold_2();
  }
  getSFSearchResult_SpotlightExtrasClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __getSFSearchResult_SpotlightExtrasClass_block_invoke_cold_1(void *a1)
{
  v2 = [MEMORY[0x1E4F28B00] currentHandler];
  v3 = [NSString stringWithUTF8String:"void *SpotlightServicesLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"ATXSearchFeedbackListener.m", 46, @"%s", *a1);

  __break(1u);
}

void __getSFSearchResult_SpotlightExtrasClass_block_invoke_cold_2()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"Class getSFSearchResult_SpotlightExtrasClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"ATXSearchFeedbackListener.m", 47, @"Unable to find class %s", "SFSearchResult_SpotlightExtras");

  __break(1u);
}

@end