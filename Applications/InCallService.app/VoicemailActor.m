@interface VoicemailActor
+ (OS_dispatch_queue_serial)MPVoicemailSerialDispatchQueue;
@end

@implementation VoicemailActor

+ (OS_dispatch_queue_serial)MPVoicemailSerialDispatchQueue
{
  sub_10018B558();
  v2 = (void *)qword_10032CD40;

  return (OS_dispatch_queue_serial *)v2;
}

@end