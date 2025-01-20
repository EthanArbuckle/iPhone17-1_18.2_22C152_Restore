@interface RelativeWeekdayWithMonthAndDayFormatter
- (_TtC24MenstrualCyclesAppPlugin39RelativeWeekdayWithMonthAndDayFormatter)init;
- (_TtC24MenstrualCyclesAppPlugin39RelativeWeekdayWithMonthAndDayFormatter)initWithCoder:(id)a3;
- (id)stringFromDate:(id)a3;
@end

@implementation RelativeWeekdayWithMonthAndDayFormatter

- (_TtC24MenstrualCyclesAppPlugin39RelativeWeekdayWithMonthAndDayFormatter)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin39RelativeWeekdayWithMonthAndDayFormatter____lazy_storage___relativeDateFormatter) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin39RelativeWeekdayWithMonthAndDayFormatter____lazy_storage___nonRelativeDateFormatter) = 0;
  id v4 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin39RelativeWeekdayWithMonthAndDayFormatter *)sub_241633038();
  __break(1u);
  return result;
}

- (id)stringFromDate:(id)a3
{
  uint64_t v4 = sub_24162B718();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162B6A8();
  v8 = self;
  sub_2412E8CC8();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v9 = (void *)sub_241631CC8();
  swift_bridgeObjectRelease();

  return v9;
}

- (_TtC24MenstrualCyclesAppPlugin39RelativeWeekdayWithMonthAndDayFormatter)init
{
  result = (_TtC24MenstrualCyclesAppPlugin39RelativeWeekdayWithMonthAndDayFormatter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin39RelativeWeekdayWithMonthAndDayFormatter____lazy_storage___relativeDateFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin39RelativeWeekdayWithMonthAndDayFormatter____lazy_storage___nonRelativeDateFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin39RelativeWeekdayWithMonthAndDayFormatter_weekdayFormatter));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin39RelativeWeekdayWithMonthAndDayFormatter_monthAndDayFormatter);
}

@end