@interface LastMenstrualPeriodViewController
- (_TtC24MenstrualCyclesAppPlugin33LastMenstrualPeriodViewController)init;
- (_TtC24MenstrualCyclesAppPlugin33LastMenstrualPeriodViewController)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin33LastMenstrualPeriodViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)confirmMenstrualCycle:(id)a3;
- (void)dismiss:(id)a3;
- (void)logMenstrualCycle:(id)a3;
- (void)viewDidLoad;
- (void)viewModelProviderDidUpdate:(id)a3;
@end

@implementation LastMenstrualPeriodViewController

- (_TtC24MenstrualCyclesAppPlugin33LastMenstrualPeriodViewController)init
{
  return [(LastMenstrualPeriodViewController *)self initWithNibName:0 bundle:0];
}

- (_TtC24MenstrualCyclesAppPlugin33LastMenstrualPeriodViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC24MenstrualCyclesAppPlugin33LastMenstrualPeriodViewController *)sub_2413BAEB0(v5, v7, a4);
}

- (_TtC24MenstrualCyclesAppPlugin33LastMenstrualPeriodViewController)initWithCoder:(id)a3
{
  return (_TtC24MenstrualCyclesAppPlugin33LastMenstrualPeriodViewController *)sub_2413BB000(a3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_2413BB0F4();
}

- (void)dismiss:(id)a3
{
}

- (void)logMenstrualCycle:(id)a3
{
}

- (void)confirmMenstrualCycle:(id)a3
{
}

- (void).cxx_destruct
{
  sub_2413BC6EC((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LastMenstrualPeriodViewController_eventHandler);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LastMenstrualPeriodViewController_dateRangeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LastMenstrualPeriodViewController_cycleView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LastMenstrualPeriodViewController_detailsLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LastMenstrualPeriodViewController_confirmCycleButton));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33LastMenstrualPeriodViewController_logLastCycleButton);
}

- (void)viewModelProviderDidUpdate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_2413BC3F4();
}

@end