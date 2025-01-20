@interface DisplayScheduleAsync
@end

@implementation DisplayScheduleAsync

void ___DisplayScheduleAsync_block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 176)) {
    IONotificationPortSetDispatchQueue(*(IONotificationPortRef *)(*(void *)(a1 + 32) + 176), *(dispatch_queue_t *)(*(void *)(a1 + 32) + 144));
  }
}

@end