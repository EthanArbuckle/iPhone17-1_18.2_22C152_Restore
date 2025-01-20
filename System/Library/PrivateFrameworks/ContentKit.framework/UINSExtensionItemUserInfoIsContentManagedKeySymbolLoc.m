@interface UINSExtensionItemUserInfoIsContentManagedKeySymbolLoc
@end

@implementation UINSExtensionItemUserInfoIsContentManagedKeySymbolLoc

void *__get_UINSExtensionItemUserInfoIsContentManagedKeySymbolLoc_block_invoke(void *a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!UIKitLibraryCore_frameworkLibrary)
  {
    v5[1] = (void *)MEMORY[0x263EF8330];
    v5[2] = (void *)3221225472;
    v5[3] = __UIKitLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_26428ABA0;
    uint64_t v7 = 0;
    UIKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  v2 = (void *)UIKitLibraryCore_frameworkLibrary;
  if (!UIKitLibraryCore_frameworkLibrary)
  {
    a1 = [MEMORY[0x263F08690] currentHandler];
    v2 = [NSString stringWithUTF8String:"void *UIKitLibrary(void)"];
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v2, @"WFNSExtensionItemContentItem.m", 26, @"%s", v5[0]);

    __break(1u);
    goto LABEL_7;
  }
  v3 = v5[0];
  if (v5[0]) {
LABEL_7:
  }
    free(v3);
  result = dlsym(v2, "_UINSExtensionItemUserInfoIsContentManagedKey");
  *(void *)(*(void *)(a1[4] + 8) + 24) = result;
  get_UINSExtensionItemUserInfoIsContentManagedKeySymbolLoc_ptr = *(void *)(*(void *)(a1[4] + 8) + 24);
  return result;
}

@end