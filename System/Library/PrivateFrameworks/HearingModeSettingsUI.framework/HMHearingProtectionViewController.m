@interface HMHearingProtectionViewController
- (BOOL)isCurrentNoiseModeOffWithDevice:(id)a3;
- (BOOL)reduceLoudNoiseEnabled;
- (HPMHeadphoneDevice)headphoneDevice;
- (NSArray)aboutSpecifiers;
- (NSArray)lineSeparatorSpecifiers;
- (NSString)address;
- (id)getHeadphoneAudioSpecifierFooter;
- (id)getSafetyDeviceType;
- (id)reduceLoudNoiseEnabledString;
- (id)setupListenerWithDevice:(id)a3;
- (id)specifiers;
- (void)cancelFitTest;
- (void)jumpToHeadphoneSafety;
- (void)openSafetyInformation;
- (void)presentFitTestController:(id)a3;
- (void)setAddress:(id)a3;
- (void)setHeadphoneDevice:(id)a3;
- (void)setReduceLoudNoiseEnabled:(id)a3;
- (void)submitHPDeviceAnalyticsWithPid:(int64_t)a3 lsrValue:(BOOL)a4;
- (void)userDidTapLoudSoundReductionLink:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HMHearingProtectionViewController

- (id)specifiers
{
  v3 = objc_opt_new();
  v4 = [MEMORY[0x263F2B998] sharedInstance];
  v5 = [v4 deviceFromAddressString:self->_address];
  btDevice = self->_btDevice;
  self->_btDevice = v5;

  v7 = (void *)MEMORY[0x263F5FC40];
  v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"Environmental Noise" value:&stru_2702152D0 table:0];
  v10 = [v7 preferenceSpecifierNamed:v9 target:self set:0 get:0 detail:0 cell:0 edit:0];

  v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v12 = [v11 localizedStringForKey:@"Loud Sound Reduction can actively reduce your exposure to loud environmental sounds in Transparency and Adaptive modes. Loud Sound Reduction is not active in Off mode. Learn more…" value:&stru_2702152D0 table:0];

  uint64_t v38 = *MEMORY[0x263F600F8];
  objc_msgSend(v10, "setProperty:forKey:", v12);
  v13 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v13);
  [v10 setProperty:v14 forKey:*MEMORY[0x263F600C0]];

  [v10 setProperty:v12 forKey:*MEMORY[0x263F600E8]];
  v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v16 = [v15 localizedStringForKey:@"Learn more…" value:&stru_2702152D0 table:0];
  v40.location = [v12 rangeOfString:v16];
  v17 = NSStringFromRange(v40);
  [v10 setProperty:v17 forKey:*MEMORY[0x263F600D0]];

  v18 = [MEMORY[0x263F08D40] valueWithNonretainedObject:self];
  [v10 setProperty:v18 forKey:*MEMORY[0x263F600E0]];

  [v10 setProperty:@"userDidTapLoudSoundReductionLink:" forKey:*MEMORY[0x263F600C8]];
  [v3 addObject:v10];
  v19 = (void *)MEMORY[0x263F5FC40];
  v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v21 = [v20 localizedStringForKey:@"Loud Sound Reduction" value:&stru_2702152D0 table:0];
  v22 = [v19 preferenceSpecifierNamed:v21 target:self set:0 get:sel_reduceLoudNoiseEnabledString detail:0 cell:4 edit:0];

  [v22 setIdentifier:@"LSR_FEATURE_ID"];
  [v3 addObject:v22];
  v23 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"FIT_TEST_GROUP_ID"];
  v24 = (void *)MEMORY[0x263F5FC40];
  v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v26 = [v25 localizedStringForKey:@"Ear Tip Fit Test" value:&stru_2702152D0 table:0];
  v27 = [v24 preferenceSpecifierNamed:v26 target:self set:0 get:0 detail:0 cell:13 edit:0];

  v28 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v29 = [v28 localizedStringForKey:@"Test the fit of your AirPods Pro ear tips to determine which size provides the best protection and sound quality. Properly fitting and functioning AirPods are required for Hearing Protection to work as intended." value:&stru_2702152D0 table:0];
  [v23 setObject:v29 forKeyedSubscript:v38];

  [v27 setButtonAction:sel_presentFitTestController_];
  [v3 addObject:v23];
  [v3 addObject:v27];
  v30 = [(HMHearingProtectionViewController *)self aboutSpecifiers];
  [v3 addObjectsFromArray:v30];

  v31 = [(HMHearingProtectionViewController *)self lineSeparatorSpecifiers];
  [v3 addObjectsFromArray:v31];

  v32 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"HEADPHONE_SAFETY_GROUP_ID"];
  v33 = [(HMHearingProtectionViewController *)self getHeadphoneAudioSpecifierFooter];
  [v32 setObject:v33 forKeyedSubscript:v38];

  [v3 addObject:v32];
  v34 = (void *)MEMORY[0x263F5FC40];
  v35 = [(HMHearingProtectionViewController *)self getSafetyDeviceType];
  v36 = [v34 preferenceSpecifierNamed:v35 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v36 setButtonAction:sel_jumpToHeadphoneSafety];
  [v3 addObject:v36];
  objc_storeStrong((id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]), v3);

  return v3;
}

- (id)getHeadphoneAudioSpecifierFooter
{
  v2 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v5 = v4;
  if (v3 == 1) {
    v6 = @"Loud headphone audio can affect your hearing over time. Your iPad can analyze headphone audio and reduce any sound that is over a set decibel level.";
  }
  else {
    v6 = @"Loud headphone audio can affect your hearing over time. Your iPhone can analyze headphone audio and reduce any sound that is over a set decibel level.";
  }
  v7 = [v4 localizedStringForKey:v6 value:&stru_2702152D0 table:0];

  return v7;
}

- (id)getSafetyDeviceType
{
  v2 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v5 = v4;
  if (v3 == 1) {
    v6 = @"Headphone Safety on iPad";
  }
  else {
    v6 = @"Headphone Safety on iPhone";
  }
  v7 = [v4 localizedStringForKey:v6 value:&stru_2702152D0 table:0];

  return v7;
}

- (void)presentFitTestController:(id)a3
{
  v10 = objc_alloc_init(HMFitTestWelcomeController);
  [(HMFitTestWelcomeController *)v10 setCurrentDevice:self->_btDevice];
  v4 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelFitTest];
  v5 = [(HMFitTestWelcomeController *)v10 navigationItem];
  [v5 setLeftBarButtonItem:v4];

  v6 = (void *)[objc_alloc(MEMORY[0x263F5B8E0]) initWithRootViewController:v10];
  v7 = [v6 navigationBar];
  v8 = [MEMORY[0x263F825C8] systemBackgroundColor];
  [v7 setBackgroundColor:v8];

  v9 = [v6 navigationBar];
  [v9 _setHidesShadow:1];

  [v6 setModalPresentationStyle:2];
  [(HMHearingProtectionViewController *)self presentViewController:v6 animated:1 completion:0];
}

- (void)cancelFitTest
{
}

- (void)setReduceLoudNoiseEnabled:(id)a3
{
  uint64_t v4 = [a3 BOOLValue];
  v5 = "Off";
  if (v4) {
    v5 = "On";
  }
  NSLog(&cfstr_HearingProtect.isa, v5);
  id v6 = [MEMORY[0x263F47538] sharedInstance];
  [v6 setActiveHearingProtectionEnabled:v4 forAddress:self->_address];
}

- (BOOL)reduceLoudNoiseEnabled
{
  uint64_t v3 = [MEMORY[0x263F47538] sharedInstance];
  LOBYTE(self) = [v3 activeHearingProtectionEnabledForAddress:self->_address];

  return (char)self;
}

- (id)reduceLoudNoiseEnabledString
{
  BOOL v3 = [(HMHearingProtectionViewController *)self reduceLoudNoiseEnabled];
  BOOL v4 = v3;
  v5 = "Off";
  if (v3) {
    v5 = "On";
  }
  NSLog(&cfstr_HearingProtect_0.isa, v5);
  if (self->_headphoneDevice)
  {
    NSLog(&cfstr_HearingProtect_1.isa);
    BOOL v6 = [(HMHearingProtectionViewController *)self isCurrentNoiseModeOffWithDevice:self->_headphoneDevice];
    v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    if (v6)
    {
      v8 = @"Not Active";
      goto LABEL_10;
    }
    if (!v4) {
      goto LABEL_9;
    }
LABEL_7:
    v8 = @"On";
    goto LABEL_10;
  }
  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  if (v4) {
    goto LABEL_7;
  }
LABEL_9:
  v8 = @"Off";
LABEL_10:
  v9 = [v7 localizedStringForKey:v8 value:&stru_2702152D0 table:0];

  return v9;
}

- (void)jumpToHeadphoneSafety
{
  id v3 = [MEMORY[0x263F01880] defaultWorkspace];
  v2 = [NSURL URLWithString:@"prefs:root=Sounds&path=HEADPHONE_LEVEL_LIMIT_SETTING"];
  [v3 openSensitiveURL:v2 withOptions:0];
}

- (void)viewDidLoad
{
  id v3 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]) userInfo];
  BOOL v4 = [v3 objectForKeyedSubscript:@"bt-address"];
  address = self->_address;
  self->_address = v4;

  BOOL v6 = [(NSString *)self->_address stringByReplacingOccurrencesOfString:@":" withString:@"-"];
  v7 = [MEMORY[0x263F42950] shared];
  v8 = [v7 connectedHeadphones];
  v9 = [v8 objectForKeyedSubscript:v6];
  headphoneDevice = self->_headphoneDevice;
  self->_headphoneDevice = v9;

  if (self->_headphoneDevice)
  {
    NSLog(&cfstr_HearingProtect_2.isa);
    v11 = [(HMHearingProtectionViewController *)self setupListenerWithDevice:self->_headphoneDevice];
    id headphoneObserver = self->headphoneObserver;
    self->id headphoneObserver = v11;
  }
  v13.receiver = self;
  v13.super_class = (Class)HMHearingProtectionViewController;
  [(HMHearingProtectionViewController *)&v13 viewDidLoad];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HMHearingProtectionViewController;
  [(HMHearingProtectionViewController *)&v4 viewDidDisappear:a3];
  [(HMHearingProtectionViewController *)self submitHPDeviceAnalyticsWithPid:[(BluetoothDevice *)self->_btDevice productId] lsrValue:[(HMHearingProtectionViewController *)self reduceLoudNoiseEnabled]];
}

- (void)userDidTapLoudSoundReductionLink:(id)a3
{
  objc_msgSend(MEMORY[0x263F01880], "defaultWorkspace", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [NSURL URLWithString:@"https://support.apple.com/120850?cid=mc-ols-airpods-article_120850-settings_ui-08212024"];
  [v4 openSensitiveURL:v3 withOptions:0];
}

- (HPMHeadphoneDevice)headphoneDevice
{
  return self->_headphoneDevice;
}

- (void)setHeadphoneDevice:(id)a3
{
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_headphoneDevice, 0);
  objc_storeStrong(&self->headphoneObserver, 0);
  objc_storeStrong((id *)&self->_btDevice, 0);
}

- (BOOL)isCurrentNoiseModeOffWithDevice:(id)a3
{
  id v4 = a3;
  v5 = self;
  int v6 = sub_25126BD78();

  return v6 == 1;
}

- (void)submitHPDeviceAnalyticsWithPid:(int64_t)a3 lsrValue:(BOOL)a4
{
  id v5 = objc_allocWithZone((Class)sub_25126BC28());
  int v6 = self;
  id v9 = objc_msgSend(v5, sel_init);
  v7 = (void *)sub_25126C5F8();
  sub_25126BBD8();

  v8 = (void *)sub_25126C588();
  sub_25126BBD8();

  sub_25126BBE8();
}

- (id)setupListenerWithDevice:(id)a3
{
  id v4 = a3;
  id v5 = self;
  HMHearingProtectionViewController.setupListener(device:)(v13);

  uint64_t v6 = v14;
  if (v14)
  {
    v7 = __swift_project_boxed_opaque_existential_0(v13, v14);
    uint64_t v8 = *(void *)(v6 - 8);
    MEMORY[0x270FA5388](v7, v7);
    v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v8 + 16))(v10);
    v11 = (void *)sub_25126C938();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v6);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (NSArray)aboutSpecifiers
{
  return (NSArray *)sub_25123471C(self, (uint64_t)a2, (void (*)(void))HMHearingProtectionViewController.aboutSpecifiers.getter);
}

- (NSArray)lineSeparatorSpecifiers
{
  return (NSArray *)sub_25123471C(self, (uint64_t)a2, (void (*)(void))HMHearingProtectionViewController.lineSeparatorSpecifiers.getter);
}

- (void)openSafetyInformation
{
  v2 = self;
  HMHearingProtectionViewController.openSafetyInformation()();
}

@end