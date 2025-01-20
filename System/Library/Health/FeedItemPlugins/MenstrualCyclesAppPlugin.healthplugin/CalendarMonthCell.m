@interface CalendarMonthCell
- (NSArray)ax_flowDays;
- (NSArray)ax_spottingDays;
- (NSDate)ax_month;
- (_TtC24MenstrualCyclesAppPlugin17CalendarMonthCell)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin17CalendarMonthCell)initWithFrame:(CGRect)a3;
- (void)setAx_flowDays:(id)a3;
- (void)setAx_spottingDays:(id)a3;
@end

@implementation CalendarMonthCell

- (NSDate)ax_month
{
  sub_241524A6C(0, &qword_26B0130C0, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v14 - v4;
  v6 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17CalendarMonthCell_viewModel;
  swift_beginAccess();
  uint64_t v7 = type metadata accessor for CompactCalendarMonthViewModel(0);
  int v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 1, v7);
  uint64_t v9 = sub_24162B718();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = v10;
  if (v8)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v5, 1, 1, v9);
    v12 = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v5, v6, v9);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v5, 0, 1, v9);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v5, 1, v9) == 1)
    {
      v12 = 0;
    }
    else
    {
      v12 = (void *)sub_24162B668();
      (*(void (**)(char *, uint64_t))(v11 + 8))(v5, v9);
    }
  }

  return (NSDate *)v12;
}

- (NSArray)ax_spottingDays
{
  return (NSArray *)sub_241521CA8();
}

- (void)setAx_spottingDays:(id)a3
{
}

- (NSArray)ax_flowDays
{
  return (NSArray *)sub_241521CA8();
}

- (void)setAx_flowDays:(id)a3
{
}

- (_TtC24MenstrualCyclesAppPlugin17CalendarMonthCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17CalendarMonthCell_calendarView) = 0;
  uint64_t v9 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17CalendarMonthCell_viewModel;
  uint64_t v10 = type metadata accessor for CompactCalendarMonthViewModel(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  uint64_t v11 = (objc_class *)MEMORY[0x263F8EE78];
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17CalendarMonthCell_ax_spottingDays) = (Class)MEMORY[0x263F8EE78];
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17CalendarMonthCell_ax_flowDays) = v11;
  v14.receiver = self;
  v14.super_class = ObjectType;
  v12 = -[CalendarMonthCell initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  [(CalendarMonthCell *)v12 setMaximumContentSizeCategory:*MEMORY[0x263F83420]];
  return v12;
}

- (_TtC24MenstrualCyclesAppPlugin17CalendarMonthCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17CalendarMonthCell_calendarView) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17CalendarMonthCell_viewModel;
  uint64_t v6 = type metadata accessor for CompactCalendarMonthViewModel(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = (objc_class *)MEMORY[0x263F8EE78];
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17CalendarMonthCell_ax_spottingDays) = (Class)MEMORY[0x263F8EE78];
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17CalendarMonthCell_ax_flowDays) = v7;
  id v8 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin17CalendarMonthCell *)sub_241633038();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17CalendarMonthCell_calendarView));
  sub_241527C30((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17CalendarMonthCell_viewModel, &qword_268CFFB38, type metadata accessor for CompactCalendarMonthViewModel, MEMORY[0x263F8D8F0]);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end