@interface MedicationLogDetailsUnitCell
- (_TtC19HealthMedicationsUI28MedicationLogDetailsUnitCell)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI28MedicationLogDetailsUnitCell)initWithFrame:(CGRect)a3;
@end

@implementation MedicationLogDetailsUnitCell

- (_TtC19HealthMedicationsUI28MedicationLogDetailsUnitCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI28MedicationLogDetailsUnitCell *)sub_1C1FC56E8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI28MedicationLogDetailsUnitCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationLogDetailsUnitCell____lazy_storage___unitView) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationLogDetailsUnitCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  id v5 = a3;

  result = (_TtC19HealthMedicationsUI28MedicationLogDetailsUnitCell *)sub_1C214B910();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationLogDetailsUnitCell____lazy_storage___unitView));
  sub_1C1FC7744((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationLogDetailsUnitCell_item, (unint64_t *)&qword_1EBF0C300, (uint64_t (*)(uint64_t))sub_1C1F1CB5C);
}

@end