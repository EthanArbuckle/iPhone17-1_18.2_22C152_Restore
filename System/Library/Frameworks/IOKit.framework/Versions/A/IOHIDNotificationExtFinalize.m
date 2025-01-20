@interface IOHIDNotificationExtFinalize
@end

@implementation IOHIDNotificationExtFinalize

uint64_t ____IOHIDNotificationExtFinalize_block_invoke(uint64_t a1)
{
  return _IOHIDObjectInternalRelease(*(const void **)(a1 + 32));
}

@end