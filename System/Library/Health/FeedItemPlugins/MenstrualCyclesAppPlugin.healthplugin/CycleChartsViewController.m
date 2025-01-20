@interface CycleChartsViewController
- (_TtC24MenstrualCyclesAppPlugin25CycleChartsViewController)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin25CycleChartsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)presentEditView;
- (void)viewDidLoad;
@end

@implementation CycleChartsViewController

- (_TtC24MenstrualCyclesAppPlugin25CycleChartsViewController)initWithCoder:(id)a3
{
  id v4 = a3;
  if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0 && sub_241633068()) {
    v5 = (objc_class *)sub_2411CA178(MEMORY[0x263F8EE78]);
  }
  else {
    v5 = (objc_class *)MEMORY[0x263F8EE88];
  }
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25CycleChartsViewController_subscriptions) = v5;

  result = (_TtC24MenstrualCyclesAppPlugin25CycleChartsViewController *)sub_241633038();
  __break(1u);
  return result;
}

- (void)loadView
{
  v2 = self;
  sub_2415E027C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_2415E0408();
}

- (void)presentEditView
{
  v2 = self;
  sub_2415E079C();
}

- (_TtC24MenstrualCyclesAppPlugin25CycleChartsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC24MenstrualCyclesAppPlugin25CycleChartsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25CycleChartsViewController_calendarCache));

  swift_bridgeObjectRelease();
}

@end