@interface MedicationLogDetailsTimeView
- (BOOL)textFieldShouldEndEditing:(id)a3;
- (_TtC19HealthMedicationsUI28MedicationLogDetailsTimeView)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI28MedicationLogDetailsTimeView)initWithFrame:(CGRect)a3;
@end

@implementation MedicationLogDetailsTimeView

- (_TtC19HealthMedicationsUI28MedicationLogDetailsTimeView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationLogDetailsTimeView____lazy_storage___timeFormatter) = 0;
  v8 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationLogDetailsTimeView_logDate;
  uint64_t v9 = sub_1C2147AC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationLogDetailsTimeView_viewModel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationLogDetailsTimeView____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationLogDetailsTimeView____lazy_storage___logTimeLabel) = 0;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for MedicationLogDetailsTimeView(0);
  v10 = -[MedicationLogDetailsTimeView initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  sub_1C201561C();

  return v10;
}

- (_TtC19HealthMedicationsUI28MedicationLogDetailsTimeView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationLogDetailsTimeView____lazy_storage___timeFormatter) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationLogDetailsTimeView_logDate;
  uint64_t v6 = sub_1C2147AC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationLogDetailsTimeView_viewModel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationLogDetailsTimeView____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationLogDetailsTimeView____lazy_storage___logTimeLabel) = 0;
  id v7 = a3;

  result = (_TtC19HealthMedicationsUI28MedicationLogDetailsTimeView *)sub_1C214B910();
  __break(1u);
  return result;
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationLogDetailsTimeView____lazy_storage___timeFormatter));
  sub_1C2015FB4((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationLogDetailsTimeView_logDate, &qword_1EBF0B1F0, MEMORY[0x1E4F27928]);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationLogDetailsTimeView____lazy_storage___titleLabel));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationLogDetailsTimeView____lazy_storage___logTimeLabel);
}

@end