@interface CycleChartLeadingAxisHeaderFooterView
- (_TtC24MenstrualCyclesAppPlugin37CycleChartLeadingAxisHeaderFooterView)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin37CycleChartLeadingAxisHeaderFooterView)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
@end

@implementation CycleChartLeadingAxisHeaderFooterView

- (_TtC24MenstrualCyclesAppPlugin37CycleChartLeadingAxisHeaderFooterView)initWithFrame:(CGRect)a3
{
  return (_TtC24MenstrualCyclesAppPlugin37CycleChartLeadingAxisHeaderFooterView *)sub_2411FEF54(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC24MenstrualCyclesAppPlugin37CycleChartLeadingAxisHeaderFooterView)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37CycleChartLeadingAxisHeaderFooterView_header;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  v4[32] = 1;
  v5 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37CycleChartLeadingAxisHeaderFooterView_footer;
  *(void *)v5 = 0;
  *((void *)v5 + 1) = 0;
  v5[16] = 1;
  id v6 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin37CycleChartLeadingAxisHeaderFooterView *)sub_241633038();
  __break(1u);
  return result;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = self;
  sub_2411FF1B8(x, y, width, height);
}

@end