@interface MedicationOnboardingHeaderCell
- (_TtC19HealthMedicationsUI30MedicationOnboardingHeaderCell)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI30MedicationOnboardingHeaderCell)initWithFrame:(CGRect)a3;
@end

@implementation MedicationOnboardingHeaderCell

- (_TtC19HealthMedicationsUI30MedicationOnboardingHeaderCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI30MedicationOnboardingHeaderCell_headerView) = 0;
  v8 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI30MedicationOnboardingHeaderCell_item;
  v9 = (objc_class *)type metadata accessor for MedicationOnboardingHeaderCell();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((void *)v8 + 4) = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[MedicationOnboardingHeaderCell initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC19HealthMedicationsUI30MedicationOnboardingHeaderCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI30MedicationOnboardingHeaderCell_headerView) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI30MedicationOnboardingHeaderCell_item;
  v6 = (objc_class *)type metadata accessor for MedicationOnboardingHeaderCell();
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((void *)v5 + 4) = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(MedicationOnboardingHeaderCell *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI30MedicationOnboardingHeaderCell_headerView));
  v3 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI30MedicationOnboardingHeaderCell_item;

  sub_1C1F374E4((uint64_t)v3);
}

@end