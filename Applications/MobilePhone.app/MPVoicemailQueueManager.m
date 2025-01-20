@interface MPVoicemailQueueManager
+ (OS_dispatch_queue_serial)serialQueue;
- (MPVoicemailQueueManager)init;
@end

@implementation MPVoicemailQueueManager

+ (OS_dispatch_queue_serial)serialQueue
{
  return (OS_dispatch_queue_serial *)@objc static VoicemailActor.queue.getter((uint64_t)a1, (uint64_t)a2, &one-time initialization token for serialQueue, (void **)&static VoicemailQueueManager.serialQueue);
}

- (MPVoicemailQueueManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for VoicemailQueueManager();
  return [(MPVoicemailQueueManager *)&v3 init];
}

@end