@interface MedicationShapeView
- (_TtC27HealthMedicationsExperience19MedicationShapeView)initWithCoder:(id)a3;
- (_TtC27HealthMedicationsExperience19MedicationShapeView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MedicationShapeView

- (_TtC27HealthMedicationsExperience19MedicationShapeView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC27HealthMedicationsExperience19MedicationShapeView_shadowLayer) = 0;
  v8 = (char *)self + OBJC_IVAR____TtC27HealthMedicationsExperience19MedicationShapeView_config;
  uint64_t v9 = type metadata accessor for MedicationVisualizationConfig(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for MedicationShapeView();
  return -[MedicationShapeView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC27HealthMedicationsExperience19MedicationShapeView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC27HealthMedicationsExperience19MedicationShapeView_shadowLayer) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC27HealthMedicationsExperience19MedicationShapeView_config;
  uint64_t v6 = type metadata accessor for MedicationVisualizationConfig(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  id v7 = a3;

  result = (_TtC27HealthMedicationsExperience19MedicationShapeView *)sub_1C2B74990();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1C2B51DF4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC27HealthMedicationsExperience19MedicationShapeView_shadowLayer));
  sub_1C2B52FDC((uint64_t)self + OBJC_IVAR____TtC27HealthMedicationsExperience19MedicationShapeView_config, &qword_1EA32B888, (void (*)(uint64_t))type metadata accessor for MedicationVisualizationConfig);
}

@end