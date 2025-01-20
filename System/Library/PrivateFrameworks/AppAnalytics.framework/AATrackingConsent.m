@interface AATrackingConsent
+ (AATrackingConsent)shared;
- (AATrackingConsent)init;
- (void)allow;
- (void)pop;
- (void)push;
@end

@implementation AATrackingConsent

- (AATrackingConsent)init
{
  return (AATrackingConsent *)sub_1A90AA1DC();
}

+ (AATrackingConsent)shared
{
  if (qword_1EB688E00 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EB688DF0;

  return (AATrackingConsent *)v2;
}

- (void)push
{
}

- (void)pop
{
}

- (void)allow
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AATrackingConsent_consented);
  v3 = (unsigned char *)(v2 + 16);
  v4 = (os_unfair_lock_s *)(v2 + 20);
  v5 = self;
  os_unfair_lock_lock(v4);
  sub_1A90CB3AC(v3);
  os_unfair_lock_unlock(v4);
}

- (void).cxx_destruct
{
  swift_release();
}

@end