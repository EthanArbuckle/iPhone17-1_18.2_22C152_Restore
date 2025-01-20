@interface MedicationLogDetailsTimePickerCell
- (_TtC19HealthMedicationsUI34MedicationLogDetailsTimePickerCell)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI34MedicationLogDetailsTimePickerCell)initWithFrame:(CGRect)a3;
@end

@implementation MedicationLogDetailsTimePickerCell

- (_TtC19HealthMedicationsUI34MedicationLogDetailsTimePickerCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI34MedicationLogDetailsTimePickerCell *)sub_1C1F31C98(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI34MedicationLogDetailsTimePickerCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI34MedicationLogDetailsTimePickerCell____lazy_storage___pickerView) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI34MedicationLogDetailsTimePickerCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  id v5 = a3;

  result = (_TtC19HealthMedicationsUI34MedicationLogDetailsTimePickerCell *)sub_1C214B910();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI34MedicationLogDetailsTimePickerCell____lazy_storage___pickerView));
  sub_1C1F32CC0((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI34MedicationLogDetailsTimePickerCell_item, (unint64_t *)&qword_1EBF0C300, (void (*)(uint64_t))sub_1C1F1CB5C);
}

@end