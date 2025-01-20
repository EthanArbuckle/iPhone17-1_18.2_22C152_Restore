@interface HDHearingTestDailyAnalyticsEvent
- (BOOL)isEventSubmissionIHAGated;
- (NSString)eventName;
- (_TtC19HealthHearingDaemon32HDHearingTestDailyAnalyticsEvent)init;
- (_TtC19HealthHearingDaemon32HDHearingTestDailyAnalyticsEvent)initWithProfile:(id)a3;
- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4;
@end

@implementation HDHearingTestDailyAnalyticsEvent

- (NSString)eventName
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_22617FD40();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BOOL)isEventSubmissionIHAGated
{
  return 0;
}

- (_TtC19HealthHearingDaemon32HDHearingTestDailyAnalyticsEvent)initWithProfile:(id)a3
{
  id v3 = a3;
  v4 = (_TtC19HealthHearingDaemon32HDHearingTestDailyAnalyticsEvent *)sub_22617C000(v3);

  return v4;
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  return sub_2261784F8(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id))sub_226177648);
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  return sub_2261784F8(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id))sub_226177CF0);
}

- (_TtC19HealthHearingDaemon32HDHearingTestDailyAnalyticsEvent)init
{
  result = (_TtC19HealthHearingDaemon32HDHearingTestDailyAnalyticsEvent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19HealthHearingDaemon32HDHearingTestDailyAnalyticsEvent_profile));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19HealthHearingDaemon32HDHearingTestDailyAnalyticsEvent_audiogramDataType));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19HealthHearingDaemon32HDHearingTestDailyAnalyticsEvent____lazy_storage___firstPartyAudiogramPredicate));
  id v3 = (char *)self + OBJC_IVAR____TtC19HealthHearingDaemon32HDHearingTestDailyAnalyticsEvent_oneYearAgo;
  uint64_t v4 = sub_22617FBE0();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end