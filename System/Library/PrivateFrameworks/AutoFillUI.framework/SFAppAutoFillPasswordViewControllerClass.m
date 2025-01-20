@interface SFAppAutoFillPasswordViewControllerClass
@end

@implementation SFAppAutoFillPasswordViewControllerClass

Class __get_SFAppAutoFillPasswordViewControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!SafariServicesLibraryCore_frameworkLibrary_0)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __SafariServicesLibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_2652493F0;
    uint64_t v6 = 0;
    SafariServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!SafariServicesLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("_SFAppAutoFillPasswordViewController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)__get_SFAppAutoFillPasswordViewControllerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  get_SFAppAutoFillPasswordViewControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __get_SFAppAutoFillPasswordViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getSFSafariCreditCardStoreClass_block_invoke_cold_1(v0);
}

@end