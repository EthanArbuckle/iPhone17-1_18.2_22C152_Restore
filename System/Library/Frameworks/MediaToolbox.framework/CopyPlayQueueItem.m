@interface CopyPlayQueueItem
@end

@implementation CopyPlayQueueItem

uint64_t __playerairplay_CopyPlayQueueItem_block_invoke(uint64_t a1)
{
  return playqueue_copyCurrentClientPlayQueueItemAndCurrentMediaControlPlayListItem(*(void *)(*(void *)(a1 + 40) + 32), *(void *)(*(void *)(a1 + 32) + 8) + 24, 0);
}

@end