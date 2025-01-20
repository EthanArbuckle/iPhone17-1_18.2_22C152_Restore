@interface MPMusicPlayerMediaItemProxyClass
@end

@implementation MPMusicPlayerMediaItemProxyClass

Class __get_MPMusicPlayerMediaItemProxyClass_block_invoke(uint64_t a1)
{
  MediaPlayerLibrary_3();
  Class result = objc_getClass("_MPMusicPlayerMediaItemProxy");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_MPMusicPlayerMediaItemProxyClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __get_MPMusicPlayerMediaItemProxyClass_block_invoke_cold_1();
    return (Class)__MediaPlayerLibraryCore_block_invoke_10();
  }
  return result;
}

uint64_t __get_MPMusicPlayerMediaItemProxyClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getMPModelObjectMediaItemClass_block_invoke_cold_1(v0);
}

@end