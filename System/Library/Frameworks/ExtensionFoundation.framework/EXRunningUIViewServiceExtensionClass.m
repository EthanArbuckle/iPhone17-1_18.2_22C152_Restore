@interface EXRunningUIViewServiceExtensionClass
@end

@implementation EXRunningUIViewServiceExtensionClass

void __get_EXRunningUIViewServiceExtensionClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("_EXRunningUIViewServiceExtension");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_EXRunningUIViewServiceExtensionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __get_EXRunningUIViewServiceExtensionClass_block_invoke_cold_1();
    ExtensionKitLibrary();
  }
}

uint64_t __get_EXRunningUIViewServiceExtensionClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __get_EXRunningUIKitSceneHostedExtensionClass_block_invoke_cold_1(v0);
}

@end