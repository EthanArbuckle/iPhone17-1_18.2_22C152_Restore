@interface VSCopyLanguageIdentifierForLocaleSymbolLoc
@end

@implementation VSCopyLanguageIdentifierForLocaleSymbolLoc

void *__get_VSCopyLanguageIdentifierForLocaleSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!VoiceServicesLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x263EF8330];
    v5[2] = 3221225472;
    v5[3] = __VoiceServicesLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_2644090A8;
    uint64_t v7 = 0;
    VoiceServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    v3 = (void *)v5[0];
    v2 = (void *)VoiceServicesLibraryCore_frameworkLibrary;
    if (VoiceServicesLibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  v2 = (void *)VoiceServicesLibraryCore_frameworkLibrary;
LABEL_5:
  result = dlsym(v2, "_VSCopyLanguageIdentifierForLocale");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_VSCopyLanguageIdentifierForLocaleSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end