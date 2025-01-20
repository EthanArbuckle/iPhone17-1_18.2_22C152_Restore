@interface MedicationDoseLogHeaderView
- (_TtC19HealthMedicationsUI27MedicationDoseLogHeaderView)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI27MedicationDoseLogHeaderView)initWithFrame:(CGRect)a3;
@end

@implementation MedicationDoseLogHeaderView

- (_TtC19HealthMedicationsUI27MedicationDoseLogHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI27MedicationDoseLogHeaderView *)sub_1C1F50830(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI27MedicationDoseLogHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C1F52C58();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI27MedicationDoseLogHeaderView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI27MedicationDoseLogHeaderView____lazy_storage___dateLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI27MedicationDoseLogHeaderView____lazy_storage___countLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI27MedicationDoseLogHeaderView____lazy_storage___dateFormatter));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI27MedicationDoseLogHeaderView____lazy_storage___titleLabelToBottomAnchor));
  id v3 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI27MedicationDoseLogHeaderView_item;

  sub_1C1F374E4((uint64_t)v3);
}

@end