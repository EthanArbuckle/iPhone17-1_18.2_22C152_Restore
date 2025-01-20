@interface STKMessagesObjCStoreFacadeClass
@end

@implementation STKMessagesObjCStoreFacadeClass

Class __get_STKMessagesObjCStoreFacadeClass_block_invoke(uint64_t a1)
{
  StickersLibraryCore();
  Class result = objc_getClass("_STKMessagesObjCStoreFacade");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_STKMessagesObjCStoreFacadeClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end