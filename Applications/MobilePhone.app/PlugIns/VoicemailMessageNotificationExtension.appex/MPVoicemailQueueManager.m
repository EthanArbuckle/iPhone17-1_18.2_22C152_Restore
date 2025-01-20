@interface MPVoicemailQueueManager
+ (OS_dispatch_queue_serial)serialQueue;
- (MPVoicemailQueueManager)init;
@end

@implementation MPVoicemailQueueManager

- (MPVoicemailQueueManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for VoicemailQueueManager();
  return [(MPVoicemailQueueManager *)&v3 init];
}

+ (OS_dispatch_queue_serial)serialQueue
{
  return (OS_dispatch_queue_serial *)sub_100016DEC((uint64_t)a1, (uint64_t)a2, &qword_100068438, (void **)&qword_10006A238);
}

@end