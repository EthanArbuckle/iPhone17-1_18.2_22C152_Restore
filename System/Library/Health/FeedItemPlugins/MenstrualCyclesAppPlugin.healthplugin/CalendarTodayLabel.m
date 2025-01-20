@interface CalendarTodayLabel
- (_TtC24MenstrualCyclesAppPlugin18CalendarTodayLabel)initWithCoder:(id)a3;
@end

@implementation CalendarTodayLabel

- (_TtC24MenstrualCyclesAppPlugin18CalendarTodayLabel)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin18CalendarTodayLabel_ring;
  id v6 = objc_allocWithZone(MEMORY[0x263F15880]);
  id v7 = a3;
  id v8 = objc_msgSend(v6, sel_init);
  if (qword_268CF9180 != -1) {
    swift_once();
  }
  objc_msgSend(v8, sel_setLineWidth_, *(double *)&qword_268CFA638);
  objc_msgSend(v8, sel_setFillColor_, 0);
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)v8;

  result = (_TtC24MenstrualCyclesAppPlugin18CalendarTodayLabel *)sub_241633038();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin18CalendarTodayLabel_ring));
}

@end