@interface MedicationDoseRecordAllCell
- (_TtC19HealthMedicationsUI27MedicationDoseRecordAllCell)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI27MedicationDoseRecordAllCell)initWithFrame:(CGRect)a3;
@end

@implementation MedicationDoseRecordAllCell

- (_TtC19HealthMedicationsUI27MedicationDoseRecordAllCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI27MedicationDoseRecordAllCell *)sub_1C2076484(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI27MedicationDoseRecordAllCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI27MedicationDoseRecordAllCell____lazy_storage___recordAllButton) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI27MedicationDoseRecordAllCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  id v5 = a3;

  result = (_TtC19HealthMedicationsUI27MedicationDoseRecordAllCell *)sub_1C214B910();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI27MedicationDoseRecordAllCell____lazy_storage___recordAllButton));
  sub_1C20779AC((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI27MedicationDoseRecordAllCell_item, (uint64_t (*)(void))sub_1C1F24488);
}

@end