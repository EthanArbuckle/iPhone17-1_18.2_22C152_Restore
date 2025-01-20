@interface AXSHapticMusicEnabledSymbolLoc
@end

@implementation AXSHapticMusicEnabledSymbolLoc

void *__get_AXSHapticMusicEnabledSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  v2 = (void *)libAccessibilityLibraryCore_frameworkLibrary_0;
  uint64_t v10 = libAccessibilityLibraryCore_frameworkLibrary_0;
  if (!libAccessibilityLibraryCore_frameworkLibrary_0)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __libAccessibilityLibraryCore_block_invoke_0;
    v4[4] = &unk_1E6223890;
    v5 = &v7;
    v6 = v4;
    long long v11 = xmmword_1E6223A78;
    uint64_t v12 = 0;
    v8[3] = _sl_dlopen();
    libAccessibilityLibraryCore_frameworkLibrary_0 = *(void *)(v5[1] + 24);
    v2 = (void *)v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v2) {
    __get_AXSHapticMusicEnabledSymbolLoc_block_invoke_cold_1(v4);
  }
  if (v4[0]) {
    free(v4[0]);
  }
  result = dlsym(v2, "_AXSHapticMusicEnabled");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_AXSHapticMusicEnabledSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_AXSHapticMusicEnabledSymbolLoc_block_invoke_cold_1(void *a1)
{
  v2 = [MEMORY[0x1E4F28B00] currentHandler];
  v3 = [NSString stringWithUTF8String:"void *libAccessibilityLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"MAMusicHaptics.m", 15, @"%s", *a1);

  __break(1u);
}

@end