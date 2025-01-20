@interface AppIntentsUIKitBridgeLoaderClass
@end

@implementation AppIntentsUIKitBridgeLoaderClass

Class __get_AppIntentsUIKitBridgeLoaderClass_block_invoke(uint64_t a1)
{
  if (!_AppIntents_UIKitLibraryCore_frameworkLibrary) {
    _AppIntents_UIKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  Class result = objc_getClass("_AppIntentsUIKitBridgeLoader");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_AppIntentsUIKitBridgeLoaderClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end