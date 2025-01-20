@interface EXRunningUISceneExtensionClass
@end

@implementation EXRunningUISceneExtensionClass

Class __get_EXRunningUISceneExtensionClass_block_invoke(uint64_t a1)
{
  ExtensionKitLibrary();
  Class result = objc_getClass("_EXRunningUISceneExtension");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_EXRunningUISceneExtensionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __get_EXRunningUISceneExtensionClass_block_invoke_cold_1();
    return (Class)OUTLINED_FUNCTION_0(v3);
  }
  return result;
}

uint64_t __get_EXRunningUISceneExtensionClass_block_invoke_cold_1()
{
  v0 = abort_report_np();
  return -[_EXExtensionIdentity(Configuration) connectionHandlerClass](v0);
}

@end