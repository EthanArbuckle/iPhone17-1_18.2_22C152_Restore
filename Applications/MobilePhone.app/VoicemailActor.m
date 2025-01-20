@interface VoicemailActor
+ (OS_dispatch_queue_serial)MPVoicemailSerialDispatchQueue;
@end

@implementation VoicemailActor

+ (OS_dispatch_queue_serial)MPVoicemailSerialDispatchQueue
{
  return (OS_dispatch_queue_serial *)@objc static VoicemailActor.queue.getter((uint64_t)a1, (uint64_t)a2, &one-time initialization token for queue, (void **)&static VoicemailActor.queue);
}

@end