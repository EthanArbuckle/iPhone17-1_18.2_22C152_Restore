@interface MedicationLogDetailsTimePickerView
- (BOOL)textFieldShouldEndEditing:(id)a3;
- (_TtC19HealthMedicationsUI34MedicationLogDetailsTimePickerView)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI34MedicationLogDetailsTimePickerView)initWithFrame:(CGRect)a3;
- (void)logTimeChanged:(id)a3;
@end

@implementation MedicationLogDetailsTimePickerView

- (void)logTimeChanged:(id)a3
{
  uint64_t v5 = sub_1C2147AC0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (MEMORY[0x1C8754850]((char *)self + OBJC_IVAR____TtC19HealthMedicationsUI34MedicationLogDetailsTimePickerView_detailsDelegate))
  {
    id v9 = a3;
    v10 = self;
    id v11 = objc_msgSend(v9, sel_date);
    sub_1C2147A60();

    sub_1C207B29C((uint64_t)v8);
    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
}

- (_TtC19HealthMedicationsUI34MedicationLogDetailsTimePickerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(void *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC19HealthMedicationsUI34MedicationLogDetailsTimePickerView_detailsDelegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI34MedicationLogDetailsTimePickerView_viewModel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI34MedicationLogDetailsTimePickerView____lazy_storage___logTimePicker) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for MedicationLogDetailsTimePickerView();
  v8 = -[MedicationLogDetailsTimePickerView initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
  sub_1C1F326E8();

  return v8;
}

- (_TtC19HealthMedicationsUI34MedicationLogDetailsTimePickerView)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC19HealthMedicationsUI34MedicationLogDetailsTimePickerView_detailsDelegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI34MedicationLogDetailsTimePickerView_viewModel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI34MedicationLogDetailsTimePickerView____lazy_storage___logTimePicker) = 0;
  id v5 = a3;

  result = (_TtC19HealthMedicationsUI34MedicationLogDetailsTimePickerView *)sub_1C214B910();
  __break(1u);
  return result;
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

- (void).cxx_destruct
{
  sub_1C1F2E220((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI34MedicationLogDetailsTimePickerView_detailsDelegate);
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI34MedicationLogDetailsTimePickerView____lazy_storage___logTimePicker);
}

@end