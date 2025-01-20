@interface FMIPGarbageCollector
- (void)scheduleAccountVerificationWithNotification:(id)a3;
@end

@implementation FMIPGarbageCollector

- (void)scheduleAccountVerificationWithNotification:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_1D43BC3C4(v3);

  swift_release();
}

@end