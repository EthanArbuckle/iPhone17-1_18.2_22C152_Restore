@interface CycleChart
- (_TtC24MenstrualCyclesAppPlugin10CycleChart)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin10CycleChart)initWithFrame:(CGRect)a3;
@end

@implementation CycleChart

- (_TtC24MenstrualCyclesAppPlugin10CycleChart)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t ObjectType = swift_getObjectType();
  v8 = (_TtC24MenstrualCyclesAppPlugin10CycleChart *)(*(uint64_t (**)(void, double, double, double, double))(ObjectType + 112))(MEMORY[0x263F8EE78], x, y, width, height);
  swift_deallocPartialClassInstance();
  return v8;
}

- (_TtC24MenstrualCyclesAppPlugin10CycleChart)initWithCoder:(id)a3
{
  result = (_TtC24MenstrualCyclesAppPlugin10CycleChart *)sub_241633038();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end