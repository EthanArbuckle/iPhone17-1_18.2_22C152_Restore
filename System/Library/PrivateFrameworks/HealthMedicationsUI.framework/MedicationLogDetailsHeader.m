@interface MedicationLogDetailsHeader
- (_TtC19HealthMedicationsUI26MedicationLogDetailsHeader)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI26MedicationLogDetailsHeader)initWithFrame:(CGRect)a3;
@end

@implementation MedicationLogDetailsHeader

- (_TtC19HealthMedicationsUI26MedicationLogDetailsHeader)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI26MedicationLogDetailsHeader____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI26MedicationLogDetailsHeader____lazy_storage___formStrengthLabel) = 0;
  v8 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI26MedicationLogDetailsHeader_item;
  v9 = (objc_class *)type metadata accessor for MedicationLogDetailsHeader();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((void *)v8 + 4) = 0;
  v12.receiver = self;
  v12.super_class = v9;
  v10 = -[MedicationLogDetailsHeader initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  sub_1C207263C();

  return v10;
}

- (_TtC19HealthMedicationsUI26MedicationLogDetailsHeader)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI26MedicationLogDetailsHeader____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI26MedicationLogDetailsHeader____lazy_storage___formStrengthLabel) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI26MedicationLogDetailsHeader_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  id v5 = a3;

  result = (_TtC19HealthMedicationsUI26MedicationLogDetailsHeader *)sub_1C214B910();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI26MedicationLogDetailsHeader____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI26MedicationLogDetailsHeader____lazy_storage___formStrengthLabel));
  sub_1C2073CA4((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI26MedicationLogDetailsHeader_item, (unint64_t *)&qword_1EBF0C300, (void (*)(uint64_t))sub_1C1F1CB5C);
}

@end