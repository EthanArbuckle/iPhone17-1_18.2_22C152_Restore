@interface VoicemailActor
+ (OS_dispatch_queue_serial)MPVoicemailSerialDispatchQueue;
@end

@implementation VoicemailActor

+ (OS_dispatch_queue_serial)MPVoicemailSerialDispatchQueue
{
  return (OS_dispatch_queue_serial *)sub_100016DEC((uint64_t)a1, (uint64_t)a2, &qword_100068430, (void **)&qword_10006A230);
}

@end