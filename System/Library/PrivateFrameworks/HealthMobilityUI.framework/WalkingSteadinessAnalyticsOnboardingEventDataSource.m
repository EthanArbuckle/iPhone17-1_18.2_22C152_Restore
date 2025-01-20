@interface WalkingSteadinessAnalyticsOnboardingEventDataSource
- (_TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource)init;
- (id)acceptDefaultHeightWithError:(id *)a3;
- (id)acceptDefaultNotificationsWithError:(id *)a3;
- (id)acceptDefaultWeightWithError:(id *)a3;
- (id)activeWatchProductTypeWithError:(id *)a3;
- (id)ageWithError:(id *)a3;
- (id)biologicalSexWithError:(id *)a3;
- (id)featureVersionWithError:(id *)a3;
- (id)hasDefaultHeightWithError:(id *)a3;
- (id)hasDefaultWeightWithError:(id *)a3;
- (id)provenanceWithError:(id *)a3;
- (id)stepWithError:(id *)a3;
@end

@implementation WalkingSteadinessAnalyticsOnboardingEventDataSource

- (id)stepWithError:(id *)a3
{
  v3 = (void *)sub_1E0B06788();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)featureVersionWithError:(id *)a3
{
  sub_1E0B06B98();
  v3 = (void *)sub_1E0B06788();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)provenanceWithError:(id *)a3
{
  swift_bridgeObjectRetain();
  v3 = (void *)sub_1E0B06788();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)activeWatchProductTypeWithError:(id *)a3
{
  v4 = self;
  v5 = self;
  id v6 = objc_msgSend(v4, sel_activeWatchProductType);
  sub_1E0B06798();

  v7 = (void *)sub_1E0B06788();
  swift_bridgeObjectRelease();
  return v7;
}

- (id)hasDefaultHeightWithError:(id *)a3
{
  v4 = self;
  v5 = (void *)sub_1E0ADF908(a3);

  return v5;
}

- (id)hasDefaultWeightWithError:(id *)a3
{
  v4 = self;
  v5 = (void *)sub_1E0ADFA2C(a3);

  return v5;
}

- (id)acceptDefaultHeightWithError:(id *)a3
{
  v4 = self;
  v5 = (void *)sub_1E0ADFB50(a3);

  return v5;
}

- (id)acceptDefaultWeightWithError:(id *)a3
{
  v4 = self;
  v5 = (void *)sub_1E0ADFC78(a3);

  return v5;
}

- (id)acceptDefaultNotificationsWithError:(id *)a3
{
  if (*((unsigned char *)&self->super.isa
       + OBJC_IVAR____TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource_onboardingStep) == 3
    && *((unsigned char *)&self->super.isa
       + OBJC_IVAR____TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource_acceptDefaults) != 2)
  {
    v3 = (void *)sub_1E0B06848();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)ageWithError:(id *)a3
{
  v4 = self;
  id v5 = sub_1E0ADFE4C(a3);

  return v5;
}

- (id)biologicalSexWithError:(id *)a3
{
  v4 = self;
  id v5 = sub_1E0ADFEF8(a3);

  return v5;
}

- (_TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource)init
{
  result = (_TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16HealthMobilityUI51WalkingSteadinessAnalyticsOnboardingEventDataSource_healthStore));
  swift_bridgeObjectRelease();
}

@end