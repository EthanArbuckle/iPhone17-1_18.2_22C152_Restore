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
  return (OS_dispatch_queue_serial *)sub_100056FB4((uint64_t)a1, (uint64_t)a2, &qword_1000A0E90, (void **)&qword_1000A2E48);
}

@end