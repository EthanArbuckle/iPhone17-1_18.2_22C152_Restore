@interface AFibBurdenOnboardingErrorAnalyticsEvent
- (BOOL)isEventSubmissionIHAGated;
- (NSString)eventName;
- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
@end

@implementation AFibBurdenOnboardingErrorAnalyticsEvent

- (BOOL)isEventSubmissionIHAGated
{
  return 1;
}

- (NSString)eventName
{
  v2 = (void *)sub_240BB6DA0();

  return (NSString *)v2;
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  sub_240AB7F9C(MEMORY[0x263F8EE78]);
  v4 = (void *)sub_240BB6D20();
  swift_bridgeObjectRelease();

  return v4;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v4 = a3;
  swift_retain();
  sub_240AE5328(v4);
  swift_release();

  v5 = (void *)sub_240BB6D20();
  swift_bridgeObjectRelease();

  return v5;
}

@end