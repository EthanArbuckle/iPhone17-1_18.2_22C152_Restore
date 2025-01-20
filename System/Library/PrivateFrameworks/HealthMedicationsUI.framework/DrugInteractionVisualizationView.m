@interface DrugInteractionVisualizationView
- (_TtC19HealthMedicationsUI32DrugInteractionVisualizationView)init;
- (_TtC19HealthMedicationsUI32DrugInteractionVisualizationView)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI32DrugInteractionVisualizationView)initWithFrame:(CGRect)a3;
@end

@implementation DrugInteractionVisualizationView

- (_TtC19HealthMedicationsUI32DrugInteractionVisualizationView)init
{
  v3 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI32DrugInteractionVisualizationView_visualizationConfig;
  uint64_t v4 = type metadata accessor for DrugInteractionVisualizationConfig(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI32DrugInteractionVisualizationView_subview) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI32DrugInteractionVisualizationView____lazy_storage___medicationView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI32DrugInteractionVisualizationView____lazy_storage___imageView) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DrugInteractionVisualizationView();
  return -[DrugInteractionVisualizationView initWithFrame:](&v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
}

- (_TtC19HealthMedicationsUI32DrugInteractionVisualizationView)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI32DrugInteractionVisualizationView_visualizationConfig;
  uint64_t v6 = type metadata accessor for DrugInteractionVisualizationConfig(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI32DrugInteractionVisualizationView_subview) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI32DrugInteractionVisualizationView____lazy_storage___medicationView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI32DrugInteractionVisualizationView____lazy_storage___imageView) = 0;
  id v7 = a3;

  result = (_TtC19HealthMedicationsUI32DrugInteractionVisualizationView *)sub_1C214B910();
  __break(1u);
  return result;
}

- (_TtC19HealthMedicationsUI32DrugInteractionVisualizationView)initWithFrame:(CGRect)a3
{
  result = (_TtC19HealthMedicationsUI32DrugInteractionVisualizationView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1C1F6C330((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI32DrugInteractionVisualizationView_visualizationConfig, (unint64_t *)&qword_1EA2C3AB8, (void (*)(uint64_t))type metadata accessor for DrugInteractionVisualizationConfig);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI32DrugInteractionVisualizationView_subview));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI32DrugInteractionVisualizationView____lazy_storage___medicationView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI32DrugInteractionVisualizationView____lazy_storage___imageView);
}

@end