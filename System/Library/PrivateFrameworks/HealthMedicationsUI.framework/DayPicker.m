@interface DayPicker
- (_TtC19HealthMedicationsUI9DayPicker)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI9DayPicker)initWithFrame:(CGRect)a3;
- (void)didTapDay:(id)a3;
@end

@implementation DayPicker

- (_TtC19HealthMedicationsUI9DayPicker)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC19HealthMedicationsUI9DayPicker_dayViews) = (Class)MEMORY[0x1E4FBC860];
  id v4 = a3;

  result = (_TtC19HealthMedicationsUI9DayPicker *)sub_1C214B910();
  __break(1u);
  return result;
}

- (void)didTapDay:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C1F9668C(v4);
}

- (_TtC19HealthMedicationsUI9DayPicker)initWithFrame:(CGRect)a3
{
  result = (_TtC19HealthMedicationsUI9DayPicker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI9DayPicker_selectedDays;
  uint64_t v4 = sub_1C21496A0();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC19HealthMedicationsUI9DayPicker_disabledDays, v4);

  swift_bridgeObjectRelease();
}

@end