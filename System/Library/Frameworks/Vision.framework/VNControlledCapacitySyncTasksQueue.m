@interface VNControlledCapacitySyncTasksQueue
+ (id)dispatchQueueAttribute;
@end

@implementation VNControlledCapacitySyncTasksQueue

+ (id)dispatchQueueAttribute
{
  return dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
}

@end