@interface ControlCenterSettingsViewController
- (ControlCenterSettingsViewController)initWithCoder:(id)a3;
- (ControlCenterSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didSetAccessWithinApps:(BOOL)a3;
- (void)resetToDefaultLayout;
- (void)viewDidLoad;
@end

@implementation ControlCenterSettingsViewController

- (void)viewDidLoad
{
  sub_9F50();
  sub_9F40();
  sub_9F30();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v3 = self;
  ControlCenterSettingsViewController.viewDidLoad()();
  swift_release();
}

- (void)didSetAccessWithinApps:(BOOL)a3
{
  BOOL v3 = a3;
  sub_9F50();
  sub_9F40();
  sub_9F30();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v5 = self;
  sub_9F40();
  sub_9F30();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v6 = [self sharedConnection];
  if (v6)
  {
    id v7 = v6;
    [v6 setBoolValue:v3 forSetting:MCFeatureControlCenterInAppsAllowed];
    swift_release();

    swift_release();
  }
  else
  {
    __break(1u);
  }
}

- (void)resetToDefaultLayout
{
  sub_9F50();
  sub_9F40();
  sub_9F30();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  sub_5274();

  swift_release();
}

- (ControlCenterSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  sub_9F50();
  sub_9F40();
  sub_9F30();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (a3)
  {
    sub_9F10();
    id v7 = a4;
    a3 = sub_9F00();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
  }
  v11.receiver = self;
  v11.super_class = (Class)ControlCenterSettingsViewController;
  v9 = [(ControlCenterSettingsViewController *)&v11 initWithNibName:a3 bundle:a4];
  swift_release();

  return v9;
}

- (ControlCenterSettingsViewController)initWithCoder:(id)a3
{
  sub_9F50();
  sub_9F40();
  sub_9F30();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v7.receiver = self;
  v7.super_class = (Class)ControlCenterSettingsViewController;
  v5 = [(ControlCenterSettingsViewController *)&v7 initWithCoder:a3];
  swift_release();
  return v5;
}

@end