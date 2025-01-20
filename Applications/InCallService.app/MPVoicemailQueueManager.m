@interface MPVoicemailQueueManager
+ (OS_dispatch_queue_serial)serialQueue;
- (MPVoicemailQueueManager)init;
@end

@implementation MPVoicemailQueueManager

- (MPVoicemailQueueManager)init
{
  return (MPVoicemailQueueManager *)sub_10018B6DC();
}

+ (OS_dispatch_queue_serial)serialQueue
{
  id v2 = sub_10018B798();

  return (OS_dispatch_queue_serial *)v2;
}

@end