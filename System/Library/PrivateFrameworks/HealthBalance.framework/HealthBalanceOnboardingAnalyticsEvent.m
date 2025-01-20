@interface HealthBalanceOnboardingAnalyticsEvent
- (BOOL)isEventSubmissionIHAGated;
- (NSString)eventName;
- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
@end

@implementation HealthBalanceOnboardingAnalyticsEvent

- (BOOL)isEventSubmissionIHAGated
{
  return 0;
}

- (NSString)eventName
{
  v2 = (void *)sub_250E24C30();

  return (NSString *)v2;
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v4 = a3;
  swift_retain();
  HealthBalanceOnboardingAnalyticsEvent.makeUnrestrictedEventPayload(with:)(v4);
  swift_release();

  v5 = (void *)sub_250E24B40();
  swift_bridgeObjectRelease();

  return v5;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v4 = a3;
  swift_retain();
  sub_250DEF1A0(v4);
  swift_release();

  v5 = (void *)sub_250E24B40();
  swift_bridgeObjectRelease();

  return v5;
}

@end