@interface SecurelyCodableWorkPlan
+ (BOOL)supportsSecureCoding;
- (_TtC19HealthOrchestration23SecurelyCodableWorkPlan)init;
- (_TtC19HealthOrchestration23SecurelyCodableWorkPlan)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SecurelyCodableWorkPlan

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2511719E0(v4);
}

- (_TtC19HealthOrchestration23SecurelyCodableWorkPlan)initWithCoder:(id)a3
{
  return (_TtC19HealthOrchestration23SecurelyCodableWorkPlan *)SecurelyCodableWorkPlan.init(coder:)(a3);
}

- (_TtC19HealthOrchestration23SecurelyCodableWorkPlan)init
{
  result = (_TtC19HealthOrchestration23SecurelyCodableWorkPlan *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_251150EE4(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC19HealthOrchestration23SecurelyCodableWorkPlan_encodedContextDescriptor), *(void *)&self->identifier[OBJC_IVAR____TtC19HealthOrchestration23SecurelyCodableWorkPlan_encodedContextDescriptor]);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC19HealthOrchestration23SecurelyCodableWorkPlan_payload);
  unint64_t v4 = *(void *)&self->identifier[OBJC_IVAR____TtC19HealthOrchestration23SecurelyCodableWorkPlan_payload];

  sub_251150EE4(v3, v4);
}

@end