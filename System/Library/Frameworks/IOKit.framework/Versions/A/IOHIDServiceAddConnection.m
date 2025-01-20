@interface IOHIDServiceAddConnection
@end

@implementation IOHIDServiceAddConnection

id ___IOHIDServiceAddConnection_block_invoke(uint64_t a1, uint64_t a2)
{
  return IOHIDServiceFilterClientNotification(a2, *(void *)(a1 + 32), 1);
}

@end