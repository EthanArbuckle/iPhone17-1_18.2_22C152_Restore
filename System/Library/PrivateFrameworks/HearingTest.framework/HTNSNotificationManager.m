@interface HTNSNotificationManager
- (_TtC11HearingTest23HTNSNotificationManager)init;
- (void)activateArbitrationBlocking;
- (void)deactivateArbitrationBlocking;
- (void)dealloc;
- (void)notifyTestResumed;
@end

@implementation HTNSNotificationManager

- (_TtC11HearingTest23HTNSNotificationManager)init
{
  return (_TtC11HearingTest23HTNSNotificationManager *)sub_2512F91B8();
}

- (void)dealloc
{
  v2 = self;
  sub_2512F93A0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11HearingTest23HTNSNotificationManager_audioRoutingControl));
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11HearingTest23HTNSNotificationManager_accessoryManager);
}

- (void)deactivateArbitrationBlocking
{
  v2 = self;
  sub_2512F9538(0);
}

- (void)activateArbitrationBlocking
{
  v2 = self;
  sub_2512F9538(1);
}

- (void)notifyTestResumed
{
  v2 = self;
  sub_2512F9FFC();
}

@end