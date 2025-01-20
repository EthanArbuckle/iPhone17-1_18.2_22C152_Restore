@interface CSLPRFCompanionAutoLaunchSettingsViewController
- (id)createConfiguration;
- (void)viewDidLoad;
@end

@implementation CSLPRFCompanionAutoLaunchSettingsViewController

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)CSLPRFCompanionAutoLaunchSettingsViewController;
  [(CSLPRFCompanionAutoLaunchSettingsViewController *)&v11 viewDidLoad];
  v3 = [(CSLPRFCompanionAutoLaunchSettingsViewController *)self createConfiguration];
  v4 = [[_TtC27CompanionAutoLaunchSettings41CompanionAutoLaunchSettingsViewController alloc] initWithConfiguration:v3];
  [(CSLPRFCompanionAutoLaunchSettingsViewController *)self addChildViewController:v4];
  v5 = [(CompanionAutoLaunchSettingsViewController *)v4 view];
  v6 = [(CSLPRFCompanionAutoLaunchSettingsViewController *)self view];
  [v6 bounds];
  objc_msgSend(v5, "setFrame:");

  [v5 setAutoresizingMask:18];
  v7 = [(CSLPRFCompanionAutoLaunchSettingsViewController *)self view];
  [v7 addSubview:v5];

  [(CompanionAutoLaunchSettingsViewController *)v4 didMoveToParentViewController:self];
  v8 = +[NSBundle bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"AUTO_LAUNCH_TITLE" value:&stru_37048 table:@"CompanionAutoLaunchSettings"];
  v10 = [(CSLPRFCompanionAutoLaunchSettingsViewController *)self navigationItem];
  [v10 setTitle:v9];
}

- (id)createConfiguration
{
  v2 = BPSGetActiveSetupCompletedDevice();
  v3 = objc_alloc_init(_TtC27CompanionAutoLaunchSettings40CompanionAutoLaunchSettingsConfiguration);
  if (v2)
  {
    v4 = [v2 valueForProperty:NRDevicePropertyIsAltAccount];
    -[CompanionAutoLaunchSettingsConfiguration setIsTinker:](v3, "setIsTinker:", [v4 BOOLValue]);

    id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"E553D9C1-2587-4142-B286-C556E89F51F3"];
    -[CompanionAutoLaunchSettingsConfiguration setSupportsDepth:](v3, "setSupportsDepth:", [v2 supportsCapability:v5]);

    [(CompanionAutoLaunchSettingsConfiguration *)v3 setDepthAutoLaunchVersion:+[CSLPRFDepthAutoLaunchAppSetting preferredVersion]];
  }

  return v3;
}

@end