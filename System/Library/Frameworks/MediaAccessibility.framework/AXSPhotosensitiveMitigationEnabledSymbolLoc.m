@interface AXSPhotosensitiveMitigationEnabledSymbolLoc
@end

@implementation AXSPhotosensitiveMitigationEnabledSymbolLoc

void *__get_AXSPhotosensitiveMitigationEnabledSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  v2 = (void *)libAccessibilityLibraryCore_frameworkLibrary;
  uint64_t v10 = libAccessibilityLibraryCore_frameworkLibrary;
  if (!libAccessibilityLibraryCore_frameworkLibrary)
  {
    v4[1] = (void *)MEMORY[0x1E4F143A8];
    v4[2] = (void *)3221225472;
    v4[3] = __libAccessibilityLibraryCore_block_invoke;
    v4[4] = &unk_1E6223890;
    v5 = &v7;
    v6 = v4;
    long long v11 = xmmword_1E6223870;
    uint64_t v12 = 0;
    v8[3] = _sl_dlopen();
    libAccessibilityLibraryCore_frameworkLibrary = *(void *)(v5[1] + 24);
    v2 = (void *)v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v2) {
    __get_AXSPhotosensitiveMitigationEnabledSymbolLoc_block_invoke_cold_1(v4);
  }
  if (v4[0]) {
    free(v4[0]);
  }
  result = dlsym(v2, "_AXSPhotosensitiveMitigationEnabled");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_AXSPhotosensitiveMitigationEnabledSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_AXSPhotosensitiveMitigationEnabledSymbolLoc_block_invoke_cold_1(void *a1)
{
  v2 = [MEMORY[0x1E4F28B00] currentHandler];
  v3 = [NSString stringWithUTF8String:"void *libAccessibilityLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"MAVideoAccommodations.m", 12, @"%s", *a1);

  __break(1u);
}

@end