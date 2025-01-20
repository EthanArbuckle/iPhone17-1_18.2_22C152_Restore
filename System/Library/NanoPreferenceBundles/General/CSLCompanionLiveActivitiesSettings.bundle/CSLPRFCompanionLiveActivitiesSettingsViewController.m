@interface CSLPRFCompanionLiveActivitiesSettingsViewController
- (CSLPRFCompanionLiveActivitiesSettingsViewController)initWithCoder:(id)a3;
- (CSLPRFCompanionLiveActivitiesSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation CSLPRFCompanionLiveActivitiesSettingsViewController

- (CSLPRFCompanionLiveActivitiesSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_155F0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (CSLPRFCompanionLiveActivitiesSettingsViewController *)sub_ADE0(v5, v7, a4);
}

- (CSLPRFCompanionLiveActivitiesSettingsViewController)initWithCoder:(id)a3
{
  return (CSLPRFCompanionLiveActivitiesSettingsViewController *)sub_AF98(a3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_B074();
}

- (void).cxx_destruct
{
  v3 = *(void **)&self->PSViewController_opaque[OBJC_IVAR___CSLPRFCompanionLiveActivitiesSettingsViewController_model];
}

@end