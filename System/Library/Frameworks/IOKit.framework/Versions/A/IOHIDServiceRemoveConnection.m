@interface IOHIDServiceRemoveConnection
@end

@implementation IOHIDServiceRemoveConnection

id ___IOHIDServiceRemoveConnection_block_invoke(uint64_t a1, uint64_t a2)
{
  return IOHIDServiceFilterClientNotification(a2, *(void *)(a1 + 32), 0);
}

@end