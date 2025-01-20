@interface HealthBalanceAppLaunchAnalyticsEvent
- (BOOL)isEventSubmissionIHAGated;
- (NSString)eventName;
- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
@end

@implementation HealthBalanceAppLaunchAnalyticsEvent

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
  id v5 = a3;
  swift_retain();
  id v6 = objc_msgSend(v5, sel_environmentDataSource);
  char v7 = self->needsOnboarding[0];
  unsigned __int8 v11 = self->source[0];
  unint64_t v8 = sub_250DEFCE8(v6, v7, &v11);

  sub_250DED5D4(v8);
  swift_release();

  swift_bridgeObjectRelease();
  v9 = (void *)sub_250E24B40();
  swift_bridgeObjectRelease();

  return v9;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v4 = a3;
  swift_retain();
  sub_250DF081C(v4);
  swift_release();

  id v5 = (void *)sub_250E24B40();
  swift_bridgeObjectRelease();

  return v5;
}

@end