@interface HealthBalanceNotificationsAnalyticsEvent
- (BOOL)isEventSubmissionIHAGated;
- (NSString)eventName;
- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
@end

@implementation HealthBalanceNotificationsAnalyticsEvent

- (BOOL)isEventSubmissionIHAGated
{
  return 1;
}

- (NSString)eventName
{
  v2 = (void *)sub_250E24C30();

  return (NSString *)v2;
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  sub_250DE1810(MEMORY[0x263F8EE78]);
  v4 = (void *)sub_250E24B40();
  swift_bridgeObjectRelease();

  return v4;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v4 = a3;
  swift_retain();
  HealthBalanceNotificationsAnalyticsEvent.makeIHAGatedEventPayload(with:)(v4);
  swift_release();

  v5 = (void *)sub_250E24B40();
  swift_bridgeObjectRelease();

  return v5;
}

@end