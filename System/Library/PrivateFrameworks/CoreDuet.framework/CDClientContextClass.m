@interface CDClientContextClass
@end

@implementation CDClientContextClass

Class __get_CDClientContextClass_block_invoke(uint64_t a1)
{
  CoreDuetContextLibraryCore();
  Class result = objc_getClass("_CDClientContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_CDClientContextClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end