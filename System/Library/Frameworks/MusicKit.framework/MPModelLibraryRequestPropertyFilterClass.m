@interface MPModelLibraryRequestPropertyFilterClass
@end

@implementation MPModelLibraryRequestPropertyFilterClass

Class __get_MPModelLibraryRequestPropertyFilterClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!MediaPlayerLibraryCore_frameworkLibrary_26)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __MediaPlayerLibraryCore_block_invoke_26;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_2644404D0;
    uint64_t v5 = 0;
    MediaPlayerLibraryCore_frameworkLibrary_26 = _sl_dlopen();
    if (!MediaPlayerLibraryCore_frameworkLibrary_26)
    {
      abort_report_np();
LABEL_8:
      __get_MPModelLibraryRequestPropertyFilterClass_block_invoke_cold_1();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("_MPModelLibraryRequestPropertyFilter");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  get_MPModelLibraryRequestPropertyFilterClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_MPModelLibraryRequestPropertyFilterClass_block_invoke_cold_1()
{
}

@end