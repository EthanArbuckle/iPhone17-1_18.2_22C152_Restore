@interface DayPickerDay
- (BOOL)isSelected;
- (_TtC19HealthMedicationsUI12DayPickerDay)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI12DayPickerDay)initWithFrame:(CGRect)a3;
- (id)accessibilityWeekday;
- (void)layoutSubviews;
- (void)setSelected:(BOOL)a3;
- (void)tintColorDidChange;
@end

@implementation DayPickerDay

- (_TtC19HealthMedicationsUI12DayPickerDay)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C1FF10C4();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1C1FF0AB8();
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DayPickerDay();
  id v2 = v3.receiver;
  [(DayPickerDay *)&v3 tintColorDidChange];
  sub_1C1FF075C();
}

- (BOOL)isSelected
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DayPickerDay();
  return [(DayPickerDay *)&v3 isSelected];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DayPickerDay();
  id v4 = v5.receiver;
  [(DayPickerDay *)&v5 setSelected:v3];
  sub_1C1FF075C();
}

- (id)accessibilityWeekday
{
  id v2 = self;
  id v3 = [(DayPickerDay *)v2 largeContentTitle];
  if (v3
    || (id v3 = objc_msgSend(*(id *)((char *)&v2->super.super.super.super.isa+ OBJC_IVAR____TtC19HealthMedicationsUI12DayPickerDay_dayLabel), sel_text)) != 0)
  {
    sub_1C214A5F0();

    id v4 = (void *)sub_1C214A5B0();
    swift_bridgeObjectRelease();
  }
  else
  {

    id v4 = 0;
  }

  return v4;
}

- (_TtC19HealthMedicationsUI12DayPickerDay)initWithFrame:(CGRect)a3
{
  result = (_TtC19HealthMedicationsUI12DayPickerDay *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI12DayPickerDay_day;
  uint64_t v4 = sub_1C21495D0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI12DayPickerDay_formatter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI12DayPickerDay_background));
  objc_super v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI12DayPickerDay_dayLabel);
}

@end