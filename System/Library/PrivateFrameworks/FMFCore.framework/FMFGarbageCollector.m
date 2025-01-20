@interface FMFGarbageCollector
- (void)scheduleAccountVerificationWithNotification:(id)a3;
@end

@implementation FMFGarbageCollector

- (void)scheduleAccountVerificationWithNotification:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_21CB77A28(v3);

  swift_release();
}

@end