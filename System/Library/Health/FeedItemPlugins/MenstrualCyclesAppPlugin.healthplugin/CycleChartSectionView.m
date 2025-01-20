@interface CycleChartSectionView
- (NSString)description;
- (_TtC24MenstrualCyclesAppPlugin21CycleChartSectionView)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin21CycleChartSectionView)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
@end

@implementation CycleChartSectionView

- (NSString)description
{
  v2 = self;
  sub_2412310DC();

  v3 = (void *)sub_241631CC8();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC24MenstrualCyclesAppPlugin21CycleChartSectionView)initWithFrame:(CGRect)a3
{
  return (_TtC24MenstrualCyclesAppPlugin21CycleChartSectionView *)sub_2412311C4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC24MenstrualCyclesAppPlugin21CycleChartSectionView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2412329E8();
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = self;
  sub_241231418(x, y, width, height);
}

- (void).cxx_destruct
{
  sub_241216F7C((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin21CycleChartSectionView_cycle);

  swift_release();
}

@end