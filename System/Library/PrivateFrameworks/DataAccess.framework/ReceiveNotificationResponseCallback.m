@interface ReceiveNotificationResponseCallback
@end

@implementation ReceiveNotificationResponseCallback

void ___ReceiveNotificationResponseCallback_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v2 = *(const void **)(a1 + 40);
  CFRelease(v2);
}

@end