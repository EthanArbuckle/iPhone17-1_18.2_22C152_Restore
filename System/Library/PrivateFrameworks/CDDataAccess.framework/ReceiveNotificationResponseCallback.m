@interface ReceiveNotificationResponseCallback
@end

@implementation ReceiveNotificationResponseCallback

uint64_t ___ReceiveNotificationResponseCallback_block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], a1[5], a1[6]);
}

@end