@interface BRKHandleNPSNotification
@end

@implementation BRKHandleNPSNotification

uint64_t ___BRKHandleNPSNotification_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleNPSNotification];
}

@end