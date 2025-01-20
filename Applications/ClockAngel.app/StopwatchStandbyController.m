@interface StopwatchStandbyController
- (_TtC10ClockAngel26StopwatchStandbyController)initWithCoder:(id)a3;
- (_TtC10ClockAngel26StopwatchStandbyController)initWithNibName:(id)a3 bundle:(id)a4;
@end

@implementation StopwatchStandbyController

- (_TtC10ClockAngel26StopwatchStandbyController)initWithCoder:(id)a3
{
  return (_TtC10ClockAngel26StopwatchStandbyController *)sub_10004DEF4(a3);
}

- (_TtC10ClockAngel26StopwatchStandbyController)initWithNibName:(id)a3 bundle:(id)a4
{
  return (_TtC10ClockAngel26StopwatchStandbyController *)sub_10004ED5C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t, uint64_t, void *))sub_10004DFE0);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel26StopwatchStandbyController_customTrailingLapView));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC10ClockAngel26StopwatchStandbyController_customTrailingTimeView);
}

@end