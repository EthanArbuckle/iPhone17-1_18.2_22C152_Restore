@interface ScheduleDaySelector
- (_TtC15JournalSettings19ScheduleDaySelector)initWithCoder:(id)a3;
- (_TtC15JournalSettings19ScheduleDaySelector)initWithFrame:(CGRect)a3;
@end

@implementation ScheduleDaySelector

- (_TtC15JournalSettings19ScheduleDaySelector)initWithFrame:(CGRect)a3
{
  return (_TtC15JournalSettings19ScheduleDaySelector *)sub_52960(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15JournalSettings19ScheduleDaySelector)initWithCoder:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC15JournalSettings19ScheduleDaySelector_calendar;
  uint64_t v4 = sub_145450();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15JournalSettings19ScheduleDaySelector_daysStackView));
  v5 = (char *)self + OBJC_IVAR____TtC15JournalSettings19ScheduleDaySelector_delegate;

  sub_118B0((uint64_t)v5);
}

@end