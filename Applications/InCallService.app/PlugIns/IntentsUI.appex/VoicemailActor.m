@interface VoicemailActor
+ (OS_dispatch_queue_serial)MPVoicemailSerialDispatchQueue;
@end

@implementation VoicemailActor

+ (OS_dispatch_queue_serial)MPVoicemailSerialDispatchQueue
{
  return (OS_dispatch_queue_serial *)sub_100056FB4((uint64_t)a1, (uint64_t)a2, &qword_1000A0E88, (void **)&qword_1000A2E40);
}

@end