@interface SleepingWristTemperatureHelpTileViewController
- (_TtC24MenstrualCyclesAppPlugin46SleepingWristTemperatureHelpTileViewController)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin46SleepingWristTemperatureHelpTileViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)viewDidLoad;
@end

@implementation SleepingWristTemperatureHelpTileViewController

- (void)loadView
{
  v2 = self;
  id v3 = sub_24142BA48();
  [(SleepingWristTemperatureHelpTileViewController *)v2 setView:v3];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SleepingWristTemperatureHelpTileViewController();
  v2 = v4.receiver;
  [(SleepingWristTemperatureHelpTileViewController *)&v4 viewDidLoad];
  uint64_t v3 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46SleepingWristTemperatureHelpTileViewController_didSubmitAnalyticsEventForView;
  if ((v2[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46SleepingWristTemperatureHelpTileViewController_didSubmitAnalyticsEventForView] & 1) == 0)
  {
    sub_24142C1E0(0);
    v2[v3] = 1;
  }
}

- (_TtC24MenstrualCyclesAppPlugin46SleepingWristTemperatureHelpTileViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC24MenstrualCyclesAppPlugin46SleepingWristTemperatureHelpTileViewController *)sub_24142C8B8(v5, v7, a4);
}

- (_TtC24MenstrualCyclesAppPlugin46SleepingWristTemperatureHelpTileViewController)initWithCoder:(id)a3
{
  return (_TtC24MenstrualCyclesAppPlugin46SleepingWristTemperatureHelpTileViewController *)sub_24142CA38(a3);
}

- (void).cxx_destruct
{
  sub_24125DCE8((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46SleepingWristTemperatureHelpTileViewController_context);
  sub_24142CF7C((uint64_t)self+ OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46SleepingWristTemperatureHelpTileViewController_configuration);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46SleepingWristTemperatureHelpTileViewController____lazy_storage___sleepStore));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin46SleepingWristTemperatureHelpTileViewController____lazy_storage___tileView);
}

@end