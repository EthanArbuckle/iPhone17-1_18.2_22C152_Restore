@interface MPMusicPlayerControllerQueueDidChangeNotificationSymbolLoc
@end

@implementation MPMusicPlayerControllerQueueDidChangeNotificationSymbolLoc

void *__get_MPMusicPlayerControllerQueueDidChangeNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)MediaPlayerLibrary_9();
  result = dlsym(v2, "_MPMusicPlayerControllerQueueDidChangeNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_MPMusicPlayerControllerQueueDidChangeNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                 + 24);
  return result;
}

@end