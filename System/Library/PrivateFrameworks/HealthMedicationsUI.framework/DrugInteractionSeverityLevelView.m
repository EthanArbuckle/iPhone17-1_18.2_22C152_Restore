@interface DrugInteractionSeverityLevelView
- (_TtC19HealthMedicationsUI32DrugInteractionSeverityLevelView)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI32DrugInteractionSeverityLevelView)initWithFrame:(CGRect)a3;
@end

@implementation DrugInteractionSeverityLevelView

- (_TtC19HealthMedicationsUI32DrugInteractionSeverityLevelView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI32DrugInteractionSeverityLevelView_subview) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI32DrugInteractionSeverityLevelView____lazy_storage___severityLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI32DrugInteractionSeverityLevelView____lazy_storage___criticalSeverityButton) = 0;
  id v4 = a3;

  result = (_TtC19HealthMedicationsUI32DrugInteractionSeverityLevelView *)sub_1C214B910();
  __break(1u);
  return result;
}

- (_TtC19HealthMedicationsUI32DrugInteractionSeverityLevelView)initWithFrame:(CGRect)a3
{
  result = (_TtC19HealthMedicationsUI32DrugInteractionSeverityLevelView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI32DrugInteractionSeverityLevelView_subview));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI32DrugInteractionSeverityLevelView____lazy_storage___severityLabel));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI32DrugInteractionSeverityLevelView____lazy_storage___criticalSeverityButton);
}

@end