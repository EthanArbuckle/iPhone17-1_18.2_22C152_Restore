@interface InteractionDetailEducationView
- (_TtC19HealthMedicationsUI30InteractionDetailEducationView)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI30InteractionDetailEducationView)initWithFrame:(CGRect)a3;
@end

@implementation InteractionDetailEducationView

- (_TtC19HealthMedicationsUI30InteractionDetailEducationView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI30InteractionDetailEducationView____lazy_storage___severityLevelView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI30InteractionDetailEducationView____lazy_storage___interactionContentLabel) = 0;
  id v4 = a3;

  result = (_TtC19HealthMedicationsUI30InteractionDetailEducationView *)sub_1C214B910();
  __break(1u);
  return result;
}

- (_TtC19HealthMedicationsUI30InteractionDetailEducationView)initWithFrame:(CGRect)a3
{
  result = (_TtC19HealthMedicationsUI30InteractionDetailEducationView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI30InteractionDetailEducationView____lazy_storage___severityLevelView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI30InteractionDetailEducationView____lazy_storage___interactionContentLabel);
}

@end