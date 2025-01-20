@interface MedicationView
- (_TtC27HealthMedicationsExperience14MedicationView)initWithCoder:(id)a3;
- (_TtC27HealthMedicationsExperience14MedicationView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setNeedsUpdateConstraints;
@end

@implementation MedicationView

- (_TtC27HealthMedicationsExperience14MedicationView)initWithFrame:(CGRect)a3
{
  return (_TtC27HealthMedicationsExperience14MedicationView *)MedicationView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC27HealthMedicationsExperience14MedicationView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C2AE8970();
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MedicationView(0);
  v2 = (char *)v5.receiver;
  [(MedicationView *)&v5 layoutSubviews];
  id v3 = &v2[OBJC_IVAR____TtC27HealthMedicationsExperience14MedicationView_circular];
  swift_beginAccess();
  if (*v3 == 1)
  {
    v4 = (char *)objc_msgSend(v2, sel_layer);
    objc_msgSend(v2, sel_bounds);
    objc_msgSend(v4, sel_setCornerRadius_, CGRectGetHeight(v6) * 0.5);

    v2 = v4;
  }
}

- (void)setNeedsUpdateConstraints
{
  v2 = self;
  sub_1C2AE5920();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC27HealthMedicationsExperience14MedicationView____lazy_storage___gradientBackground));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC27HealthMedicationsExperience14MedicationView____lazy_storage___gradientDefaultBackgroundColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC27HealthMedicationsExperience14MedicationView____lazy_storage___shapeView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC27HealthMedicationsExperience14MedicationView____lazy_storage___placeholderView));
  sub_1C2AE8900((uint64_t)self + OBJC_IVAR____TtC27HealthMedicationsExperience14MedicationView_config, &qword_1EA32B888, type metadata accessor for MedicationVisualizationConfig);
}

@end