@interface CycleChartsHeaderView
- (_TtC24MenstrualCyclesAppPlugin21CycleChartsHeaderView)init;
- (_TtC24MenstrualCyclesAppPlugin21CycleChartsHeaderView)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin21CycleChartsHeaderView)initWithFrame:(CGRect)a3;
@end

@implementation CycleChartsHeaderView

- (_TtC24MenstrualCyclesAppPlugin21CycleChartsHeaderView)init
{
  return (_TtC24MenstrualCyclesAppPlugin21CycleChartsHeaderView *)sub_241320ED0();
}

- (_TtC24MenstrualCyclesAppPlugin21CycleChartsHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_24132241C();
}

- (_TtC24MenstrualCyclesAppPlugin21CycleChartsHeaderView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  sub_24132286C((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin21CycleChartsHeaderView_activeCycle, (uint64_t (*)(void))sub_24124418C);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin21CycleChartsHeaderView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin21CycleChartsHeaderView_daysCountView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin21CycleChartsHeaderView_dateIntervalLabel);
}

@end