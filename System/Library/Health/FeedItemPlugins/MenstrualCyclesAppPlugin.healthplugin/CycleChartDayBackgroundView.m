@interface CycleChartDayBackgroundView
- (NSString)description;
- (_TtC24MenstrualCyclesAppPlugin27CycleChartDayBackgroundView)initWithCoder:(id)a3;
- (void)drawRect:(CGRect)a3;
@end

@implementation CycleChartDayBackgroundView

- (NSString)description
{
  v2 = self;
  sub_2415F4080();

  v3 = (void *)sub_241631CC8();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC24MenstrualCyclesAppPlugin27CycleChartDayBackgroundView)initWithCoder:(id)a3
{
  result = (_TtC24MenstrualCyclesAppPlugin27CycleChartDayBackgroundView *)sub_241633038();
  __break(1u);
  return result;
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  sub_2415F437C(x, y, width, height);
}

- (void).cxx_destruct
{
  sub_2412328C4((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27CycleChartDayBackgroundView_cycle);
  v3 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27CycleChartDayBackgroundView_dayIndex;
  uint64_t v4 = sub_241631AC8();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end