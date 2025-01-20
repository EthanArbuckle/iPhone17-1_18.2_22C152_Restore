@interface InternalSettingsFeatureStateListViewController
- (_TtC18HealthExperienceUI46InternalSettingsFeatureStateListViewController)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI46InternalSettingsFeatureStateListViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation InternalSettingsFeatureStateListViewController

- (_TtC18HealthExperienceUI46InternalSettingsFeatureStateListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC18HealthExperienceUI46InternalSettingsFeatureStateListViewController *)InternalSettingsFeatureStateListViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC18HealthExperienceUI46InternalSettingsFeatureStateListViewController)initWithCoder:(id)a3
{
  result = (_TtC18HealthExperienceUI46InternalSettingsFeatureStateListViewController *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  InternalSettingsFeatureStateListViewController.viewDidLoad()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI46InternalSettingsFeatureStateListViewController_host));
}

@end