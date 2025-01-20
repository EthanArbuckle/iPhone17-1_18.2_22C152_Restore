@interface DisplayUnscheduleAsync
@end

@implementation DisplayUnscheduleAsync

void ___DisplayUnscheduleAsync_block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 176)) {
    IONotificationPortSetDispatchQueue(*(IONotificationPortRef *)(*(void *)(a1 + 32) + 176), 0);
  }
}

@end