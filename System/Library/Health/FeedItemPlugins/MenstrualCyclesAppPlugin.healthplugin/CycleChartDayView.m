@interface CycleChartDayView
- (NSString)description;
- (_TtC24MenstrualCyclesAppPlugin17CycleChartDayView)initWithCoder:(id)a3;
- (void)drawRect:(CGRect)a3;
@end

@implementation CycleChartDayView

- (NSString)description
{
  v2 = self;
  sub_241625818();

  v3 = (void *)sub_241631CC8();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC24MenstrualCyclesAppPlugin17CycleChartDayView)initWithCoder:(id)a3
{
  result = (_TtC24MenstrualCyclesAppPlugin17CycleChartDayView *)sub_241633038();
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
  sub_241625924(x, y, width, height);
}

- (void).cxx_destruct
{
  sub_2416263FC((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17CycleChartDayView_cycle, type metadata accessor for CycleChartCycle);
  v3 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17CycleChartDayView_dayIndex;
  uint64_t v4 = sub_241631AC8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_2416263FC((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin17CycleChartDayView_day, (uint64_t (*)(void))type metadata accessor for CycleChartDay);

  swift_release();
}

@end