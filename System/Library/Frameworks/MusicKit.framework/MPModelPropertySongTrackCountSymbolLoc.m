@interface MPModelPropertySongTrackCountSymbolLoc
@end

@implementation MPModelPropertySongTrackCountSymbolLoc

void *__get_MPModelPropertySongTrackCountSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)MediaPlayerLibrary_6();
  result = dlsym(v2, "_MPModelPropertySongTrackCount");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_MPModelPropertySongTrackCountSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end