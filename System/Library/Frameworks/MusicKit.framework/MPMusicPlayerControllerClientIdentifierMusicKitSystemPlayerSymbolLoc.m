@interface MPMusicPlayerControllerClientIdentifierMusicKitSystemPlayerSymbolLoc
@end

@implementation MPMusicPlayerControllerClientIdentifierMusicKitSystemPlayerSymbolLoc

void *__get_MPMusicPlayerControllerClientIdentifierMusicKitSystemPlayerSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)MediaPlayerLibrary_9();
  result = dlsym(v2, "_MPMusicPlayerControllerClientIdentifierMusicKitSystemPlayer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_MPMusicPlayerControllerClientIdentifierMusicKitSystemPlayerSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                           + 24);
  return result;
}

@end