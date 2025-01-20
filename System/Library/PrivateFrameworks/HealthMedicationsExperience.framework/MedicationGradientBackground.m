@interface MedicationGradientBackground
- (_TtC27HealthMedicationsExperience28MedicationGradientBackground)initWithCoder:(id)a3;
- (_TtC27HealthMedicationsExperience28MedicationGradientBackground)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
@end

@implementation MedicationGradientBackground

- (_TtC27HealthMedicationsExperience28MedicationGradientBackground)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for MedicationGradientBackground();
  v7 = -[MedicationGradientBackground initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
  [(MedicationGradientBackground *)v7 setContentMode:3];
  [(MedicationGradientBackground *)v7 setClipsToBounds:1];

  return v7;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = self;
  sub_1C2B6B198(x, y, width, height);
}

- (_TtC27HealthMedicationsExperience28MedicationGradientBackground)initWithCoder:(id)a3
{
  result = (_TtC27HealthMedicationsExperience28MedicationGradientBackground *)sub_1C2B74990();
  __break(1u);
  return result;
}

@end