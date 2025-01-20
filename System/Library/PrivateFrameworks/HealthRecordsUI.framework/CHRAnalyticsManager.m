@interface CHRAnalyticsManager
+ (CHRAnalyticsManager)shared;
- (CHRAnalyticsManager)init;
- (void)postOnboardingFunnelEventWithStep:(int64_t)a3 context:(int64_t)a4 gatewayUrl:(id)a5;
- (void)postPrivacyInteractionEventWithType:(int64_t)a3 context:(int64_t)a4 action:(BOOL)a5;
- (void)postUserInteractionEventWithType:(int64_t)a3 context:(int64_t)a4 action:(int64_t)a5 category:(id)a6 conceptIdentifier:(id)a7;
- (void)submitAndFlushQueuedEvents;
@end

@implementation CHRAnalyticsManager

+ (CHRAnalyticsManager)shared
{
  if (qword_1EBB6D840 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EBB6E968;
  return (CHRAnalyticsManager *)v2;
}

- (CHRAnalyticsManager)init
{
  return (CHRAnalyticsManager *)AnalyticsManager.init()();
}

- (void)submitAndFlushQueuedEvents
{
  v2 = self;
  sub_1C23CF3D4();
}

- (void)postOnboardingFunnelEventWithStep:(int64_t)a3 context:(int64_t)a4 gatewayUrl:(id)a5
{
  id v9 = a5;
  v10 = self;
  sub_1C23CCB04(a3, a4, a5);
}

- (void)postUserInteractionEventWithType:(int64_t)a3 context:(int64_t)a4 action:(int64_t)a5 category:(id)a6 conceptIdentifier:(id)a7
{
  id v13 = a6;
  id v14 = a7;
  v15 = self;
  sub_1C23CD050(a3, a4, a5, a6, a7);
}

- (void)postPrivacyInteractionEventWithType:(int64_t)a3 context:(int64_t)a4 action:(BOOL)a5
{
  v8 = self;
  sub_1C23CEB5C(a3, a4, a5);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHRAnalyticsManager_managerQueue);
}

@end