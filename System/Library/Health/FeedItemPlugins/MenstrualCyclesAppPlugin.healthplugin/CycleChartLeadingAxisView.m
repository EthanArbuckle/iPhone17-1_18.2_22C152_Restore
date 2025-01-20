@interface CycleChartLeadingAxisView
- (_TtC24MenstrualCyclesAppPlugin25CycleChartLeadingAxisView)initWithCoder:(id)a3;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation CycleChartLeadingAxisView

- (_TtC24MenstrualCyclesAppPlugin25CycleChartLeadingAxisView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25CycleChartLeadingAxisView_role) = 0;
  id v4 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin25CycleChartLeadingAxisView *)sub_241633038();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_2415A7190();
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  sub_2415A7518(x, y, width, height);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25CycleChartLeadingAxisView_overhang));
}

@end