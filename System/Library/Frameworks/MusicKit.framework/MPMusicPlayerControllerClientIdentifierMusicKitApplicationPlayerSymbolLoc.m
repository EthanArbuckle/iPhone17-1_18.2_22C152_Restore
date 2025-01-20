@interface MPMusicPlayerControllerClientIdentifierMusicKitApplicationPlayerSymbolLoc
@end

@implementation MPMusicPlayerControllerClientIdentifierMusicKitApplicationPlayerSymbolLoc

void *__get_MPMusicPlayerControllerClientIdentifierMusicKitApplicationPlayerSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)MediaPlayerLibrary_9();
  result = dlsym(v2, "_MPMusicPlayerControllerClientIdentifierMusicKitApplicationPlayer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_MPMusicPlayerControllerClientIdentifierMusicKitApplicationPlayerSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                                + 24);
  return result;
}

@end