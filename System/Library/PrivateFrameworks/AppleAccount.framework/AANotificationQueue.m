@interface AANotificationQueue
@end

@implementation AANotificationQueue

void ___AANotificationQueue_block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.appleaccount.notificationqueue", v2);
  v1 = (void *)_AANotificationQueue_queue;
  _AANotificationQueue_queue = (uint64_t)v0;
}

@end