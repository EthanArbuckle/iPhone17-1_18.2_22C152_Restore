@interface CalendarMonthHeaderView
- (_TtC8HealthUI23CalendarMonthHeaderView)initWithCoder:(id)a3;
- (_TtC8HealthUI23CalendarMonthHeaderView)initWithFrame:(CGRect)a3;
- (void)applyLayoutAttributes:(id)a3;
@end

@implementation CalendarMonthHeaderView

- (_TtC8HealthUI23CalendarMonthHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC8HealthUI23CalendarMonthHeaderView *)CalendarMonthHeaderView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8HealthUI23CalendarMonthHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E0EA5D68();
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1E0EA598C((uint64_t)v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8HealthUI23CalendarMonthHeaderView_monthLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8HealthUI23CalendarMonthHeaderView_xPositionConstraint);
}

@end