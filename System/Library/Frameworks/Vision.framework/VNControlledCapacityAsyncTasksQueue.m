@interface VNControlledCapacityAsyncTasksQueue
+ (id)dispatchQueueAttribute;
@end

@implementation VNControlledCapacityAsyncTasksQueue

+ (id)dispatchQueueAttribute
{
  return dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
}

@end