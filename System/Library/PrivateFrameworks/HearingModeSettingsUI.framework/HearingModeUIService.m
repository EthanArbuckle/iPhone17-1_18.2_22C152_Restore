@interface HearingModeUIService
+ (BOOL)shouldShowFeatureForDevice:(id)a3;
- (BOOL)_getHearingAssist;
- (BOOL)_showOcclusionDetectionPlacard;
- (BOOL)shouldShowHearingAid;
- (BOOL)shouldShowHearingTest;
- (HMServiceClient)hmsClient;
- (HPMHeadphoneDevice)headphoneDevice;
- (HearingModeUIService)initWithDevice:(id)a3;
- (HearingModeUIService)initWithDeviceAddress:(id)a3;
- (HearingModeUIServiceDelegate)delegate;
- (id)_getHearingAssistPayload:(id)a3 device:(id)a4 inUsecase:(int64_t)a5;
- (id)_getOcclusionPayload:(id)a3 device:(id)a4 inUsecase:(int64_t)a5;
- (id)decoratedSpecifiers:(id)a3 btAddress:(id)a4;
- (id)enrollmentViewController;
- (id)getHearingAidLink:(id)a3;
- (id)getHearingAidMode;
- (id)getHearingAidModeString;
- (id)getHearingAidString:(id)a3;
- (id)occlusionDetectionSpecifiers;
- (id)specifiers;
- (id)tuningViewController;
- (void)_showOcclusionTutorial;
- (void)configHearingModeClient;
- (void)hearingTestTapped;
- (void)presentHearingAssistWelcomeFlow;
- (void)presentHearingTest;
- (void)setDelegate:(id)a3;
- (void)setHeadphoneDevice:(id)a3;
- (void)setHearingAidMode:(id)a3;
- (void)setHmsClient:(id)a3;
- (void)submitHADeviceAnalyticsWithEnrolled:(int64_t)a3;
- (void)userDidTapHearingHealthLearnMore:(id)a3;
@end

@implementation HearingModeUIService

+ (BOOL)shouldShowFeatureForDevice:(id)a3
{
  id v3 = a3;
  if (_os_feature_enabled_impl())
  {
    id v4 = v3;
    int v5 = [v4 hearingAidSupport];
    if (v5) {
      v6 = "YES";
    }
    else {
      v6 = "NO";
    }
    v7 = [v4 address];

    NSLog(&cfstr_HearingAidShou.isa, v6, v7, v6, "YES");
  }
  else
  {
    NSLog(&cfstr_HearingAidFeat.isa);
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (HearingModeUIService)initWithDevice:(id)a3
{
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)HearingModeUIService;
  v6 = [(HearingModeUIService *)&v24 init];
  if (v6)
  {
    NSLog(&cfstr_HearingAidHkCh.isa);
    [MEMORY[0x263F0A280] checkCurrentCountry];
    objc_storeStrong((id *)&v6->_device, a3);
    uint64_t v7 = [(BluetoothDevice *)v6->_device address];
    address = v6->_address;
    v6->_address = (NSString *)v7;

    v9 = objc_alloc_init(_TtC21HearingModeSettingsUI20HMHearingTestService);
    hearingTestService = v6->_hearingTestService;
    v6->_hearingTestService = v9;

    [(HearingModeUIService *)v6 configHearingModeClient];
    v11 = [(BluetoothDevice *)v6->_device address];
    v12 = [v11 stringByReplacingOccurrencesOfString:@":" withString:@"-"];

    v13 = [MEMORY[0x263F42950] shared];
    v14 = [v13 connectedHeadphones];
    uint64_t v15 = [v14 objectForKeyedSubscript:v12];
    headphoneDevice = v6->_headphoneDevice;
    v6->_headphoneDevice = (HPMHeadphoneDevice *)v15;

    v17 = [_TtC21HearingModeSettingsUI27HearingAssistFlowController alloc];
    v18 = v6->_headphoneDevice;
    v19 = [(HearingModeUIService *)v6 hmsClient];
    uint64_t v20 = [(HearingAssistFlowController *)v17 initWithDevice:v18 serviceClient:v19 flow:0];
    hearingAssistFlowController = v6->_hearingAssistFlowController;
    v6->_hearingAssistFlowController = (_TtC21HearingModeSettingsUI27HearingAssistFlowController *)v20;

    if (!v6->_headphoneDevice)
    {
      NSLog(&cfstr_HearingAidNoHe.isa);

      v22 = 0;
      goto LABEL_6;
    }
  }
  v22 = v6;
LABEL_6:

  return v22;
}

- (HearingModeUIService)initWithDeviceAddress:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HearingModeUIService;
  v6 = [(HearingModeUIService *)&v12 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_address, a3);
    v8 = [MEMORY[0x263F2B998] sharedInstance];
    uint64_t v9 = [v8 deviceFromAddressString:v5];
    device = v7->_device;
    v7->_device = (BluetoothDevice *)v9;
  }
  return v7;
}

- (id)occlusionDetectionSpecifiers
{
  if ([(HearingModeUIService *)self _showOcclusionDetectionPlacard])
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v4 = (void *)MEMORY[0x263F5FC40];
    id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v6 = [v5 localizedStringForKey:@"Occlusion Detection" value:&stru_2702152D0 table:0];
    uint64_t v7 = [v4 preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v7 setIdentifier:@"OCCLUSION_DETECTION_ID"];
    [v7 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
    v8 = [(HearingModeUIService *)self _getOcclusionPayload:self->_address device:self->_headphoneDevice inUsecase:1];
    [v7 setUserInfo:v8];

    id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
    [v9 addObject:v7];
    v10 = [(HearingModeUIService *)self decoratedSpecifiers:v9 btAddress:self->_address];
    v11 = (void *)MEMORY[0x263F5FC40];
    objc_super v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v13 = [v12 localizedStringForKey:@"More Information…" value:&stru_2702152D0 table:0];
    v14 = [v11 preferenceSpecifierNamed:v13 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v14 setButtonAction:sel__showOcclusionTutorial];
    [v3 addObjectsFromArray:v10];
    [v3 addObject:v14];
  }
  else
  {
    NSLog(&cfstr_OcclusionNotDe.isa);
    id v3 = 0;
  }
  return v3;
}

- (id)specifiers
{
  v38[1] = *MEMORY[0x263EF8340];
  BOOL v3 = [(HearingModeUIService *)self shouldShowHearingAid];
  BOOL v4 = +[HMHearingProtectionService shouldShowHearingProtectionForDevice:self->_address];
  BOOL v5 = [(HearingModeUIService *)self shouldShowHearingTest];
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (!v3 && !v4 && !v5)
  {
    NSLog(&cfstr_HearingAidRetu.isa);
    id v7 = v6;
    goto LABEL_13;
  }
  v8 = (void *)MEMORY[0x263F5FC40];
  id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"Hearing Health" value:&stru_2702152D0 table:0];
  v11 = [v8 preferenceSpecifierNamed:v10 target:self set:0 get:0 detail:0 cell:0 edit:0];

  objc_super v12 = [(HearingModeUIService *)self getHearingAidString:self->_address];
  [v11 setProperty:v12 forKey:*MEMORY[0x263F600F8]];
  v13 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v13);
  [v11 setProperty:v14 forKey:*MEMORY[0x263F600C0]];

  [v11 setProperty:v12 forKey:*MEMORY[0x263F600E8]];
  uint64_t v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v16 = [v15 localizedStringForKey:@"Learn more…" value:&stru_2702152D0 table:0];
  v40.location = [v12 rangeOfString:v16];
  v17 = NSStringFromRange(v40);
  [v11 setProperty:v17 forKey:*MEMORY[0x263F600D0]];

  v18 = [MEMORY[0x263F08D40] valueWithNonretainedObject:self];
  [v11 setProperty:v18 forKey:*MEMORY[0x263F600E0]];

  [v11 setProperty:@"userDidTapHearingHealthLearnMore:" forKey:*MEMORY[0x263F600C8]];
  [v11 setIdentifier:@"HEARING_GROUP_ID"];
  [v6 addObject:v11];
  if (v4)
  {
    v28 = +[HMHearingProtectionService getSpecifiersForDevice:self->_address device:self->_headphoneDevice];
    [v6 addObjectsFromArray:v28];

    if (!v3)
    {
LABEL_7:
      if (!v5) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if (!v3)
  {
    goto LABEL_7;
  }
  unsigned int v29 = [(BluetoothDevice *)self->_device hearingAidEnrolled];
  v30 = "NO";
  if (v29) {
    v30 = "YES";
  }
  NSLog(&cfstr_HearingAidEnro.isa, v30);
  v31 = (void *)MEMORY[0x263F5FC40];
  v32 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v33 = [v32 localizedStringForKey:@"Hearing Assistance" value:&stru_2702152D0 table:0];
  if (v29)
  {
    v34 = [v31 preferenceSpecifierNamed:v33 target:self set:0 get:sel_getHearingAidModeString detail:objc_opt_class() cell:2 edit:0];

    [v34 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
    v35 = [(HearingModeUIService *)self _getHearingAssistPayload:self->_address device:self->_headphoneDevice inUsecase:3];
    [v34 setUserInfo:v35];

    [v34 setIdentifier:@"HEARING_ASSIST_ID"];
  }
  else
  {
    v34 = [v31 preferenceSpecifierNamed:v33 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v34 setButtonAction:sel_presentHearingAssistWelcomeFlow];
    [v34 setIdentifier:@"HEARING_ASSIST_ID"];
    [v34 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
    v36 = [(HearingModeUIService *)self _getHearingAssistPayload:self->_address device:self->_headphoneDevice inUsecase:2];
    [v34 setUserInfo:v36];
  }
  [v6 addObject:v34];

  [(HearingModeUIService *)self submitHADeviceAnalyticsWithEnrolled:v29];
  if (!v5) {
    goto LABEL_9;
  }
LABEL_8:
  v19 = (void *)MEMORY[0x263F5FC40];
  uint64_t v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v21 = [v20 localizedStringForKey:@"Take a Hearing Test" value:&stru_2702152D0 table:0];
  v22 = [v19 preferenceSpecifierNamed:v21 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v22 setButtonAction:sel_hearingTestTapped];
  [v22 setIdentifier:@"HEARING_TEST_ID"];
  [v6 addObject:v22];

LABEL_9:
  if (IsAppleInternalBuild()
    && +[HearingAidUtils isHearingAidInternalEnabled])
  {
    v23 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Hearing Aid Internal" target:self set:0 get:0 detail:0 cell:0 edit:0];
    [v23 setIdentifier:@"HEARING_INTERNAL_GROUP_ID"];
    [v6 addObject:v23];
    objc_super v24 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Hearing Aid Internal" target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
    address = self->_address;
    v37 = @"bt-address";
    v38[0] = address;
    v26 = [NSDictionary dictionaryWithObjects:v38 forKeys:&v37 count:1];
    [v24 setUserInfo:v26];

    [v24 setIdentifier:@"HEARING_INTERNAL_ID"];
    [v6 addObject:v24];
  }
  id v7 = [(HearingModeUIService *)self decoratedSpecifiers:v6 btAddress:self->_address];

LABEL_13:
  return v7;
}

- (void)userDidTapHearingHealthLearnMore:(id)a3
{
  objc_msgSend(MEMORY[0x263F01880], "defaultWorkspace", a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v4 = NSURL;
  BOOL v5 = [(HearingModeUIService *)self getHearingAidLink:self->_address];
  id v6 = [v4 URLWithString:v5];
  [v7 openSensitiveURL:v6 withOptions:0];
}

- (BOOL)shouldShowHearingAid
{
  if (_os_feature_enabled_impl())
  {
    int v3 = [(BluetoothDevice *)self->_device hearingAidSupport];
    if (v3) {
      BOOL v4 = "YES";
    }
    else {
      BOOL v4 = "NO";
    }
    BOOL v5 = [(BluetoothDevice *)self->_device address];
    NSLog(&cfstr_HearingAidShou.isa, v4, v5, v4, "YES");
  }
  else
  {
    NSLog(&cfstr_HearingAidFeat.isa);
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (id)getHearingAidModeString
{
  BOOL v2 = [(HearingModeUIService *)self _getHearingAssist];
  int v3 = "Disabled";
  if (v2)
  {
    int v3 = "Enabled";
    BOOL v4 = @"On";
  }
  else
  {
    BOOL v4 = @"Off";
  }
  NSLog(&cfstr_HearingAidGetH.isa, v3);
  BOOL v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:v4 value:&stru_2702152D0 table:0];

  return v6;
}

- (id)getHearingAidMode
{
  BOOL v2 = [(HearingModeUIService *)self _getHearingAssist];
  int v3 = "Disabled";
  if (v2) {
    int v3 = "Enabled";
  }
  NSLog(&cfstr_HearingAidGetH.isa, v3);
  BOOL v4 = NSNumber;
  return (id)[v4 numberWithBool:v2];
}

- (void)setHearingAidMode:(id)a3
{
  uint64_t v4 = [a3 BOOLValue];
  BOOL v5 = "Disabled";
  if (v4) {
    BOOL v5 = "Enabled";
  }
  NSLog(&cfstr_HearingAidSetH.isa, v5);
  [(BluetoothDevice *)self->_device setHearingAidEnabled:v4];
  device = self->_device;
  [(BluetoothDevice *)device setListeningMode:3];
}

- (void)presentHearingAssistWelcomeFlow
{
  int v3 = [(HearingModeUIService *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v6 = [(HearingModeUIService *)self delegate];
    BOOL v5 = [(HearingAssistFlowController *)self->_hearingAssistFlowController flowContainerController];
    [v6 presentViewController:v5];
  }
}

- (BOOL)shouldShowHearingTest
{
  if (_os_feature_enabled_impl())
  {
    int v3 = [(BluetoothDevice *)self->_device hearingAidSupport];
    if (v3) {
      char v4 = "YES";
    }
    else {
      char v4 = "NO";
    }
    BOOL v5 = [(BluetoothDevice *)self->_device address];
    NSLog(&cfstr_HearingTestSho.isa, v4, v5, v4, "YES");
  }
  else
  {
    NSLog(&cfstr_HearingTestFea.isa);
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)presentHearingTest
{
  int v3 = [(HearingModeUIService *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v6 = [(HMHearingTestService *)self->_hearingTestService hearingTestViewController];
    BOOL v5 = [(HearingModeUIService *)self delegate];
    [v5 presentViewController:v6];
  }
}

- (id)enrollmentViewController
{
  id v3 = objc_alloc(MEMORY[0x263F47328]);
  char v4 = [(BluetoothDevice *)self->_device address];
  BOOL v5 = (void *)[v3 initWithDeviceAddress:v4 withAudiogramSample:0];

  id v6 = (void *)[objc_alloc(MEMORY[0x263F5B8E0]) initWithRootViewController:v5];
  return v6;
}

- (id)tuningViewController
{
  return 0;
}

- (HearingModeUIServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HearingModeUIServiceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HPMHeadphoneDevice)headphoneDevice
{
  return self->_headphoneDevice;
}

- (void)setHeadphoneDevice:(id)a3
{
}

- (HMServiceClient)hmsClient
{
  return self->_hmsClient;
}

- (void)setHmsClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hmsClient, 0);
  objc_storeStrong((id *)&self->_headphoneDevice, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hearingAssistFlowController, 0);
  objc_storeStrong((id *)&self->_hearingTestService, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)configHearingModeClient
{
  BOOL v2 = self;
  HearingModeUIService.configHearingModeClient()();
}

- (id)decoratedSpecifiers:(id)a3 btAddress:(id)a4
{
  uint64_t v5 = sub_25126C538();
  uint64_t v6 = sub_25126C488();
  uint64_t v8 = v7;
  id v9 = self;
  HearingModeUIService.decoratedSpecifiers(_:btAddress:)(v5, v6, v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v10 = (void *)sub_25126C528();
  swift_bridgeObjectRelease();
  return v10;
}

- (BOOL)_showOcclusionDetectionPlacard
{
  BOOL v2 = self;
  Swift::Bool v3 = HearingModeUIService._showOcclusionDetectionPlacard()();

  return v3;
}

- (id)_getOcclusionPayload:(id)a3 device:(id)a4 inUsecase:(int64_t)a5
{
  uint64_t v8 = sub_25126C488();
  uint64_t v10 = v9;
  id v11 = a4;
  objc_super v12 = self;
  _sSo20HearingModeUIServiceC0aB10SettingsUIE20_getOcclusionPayload_6device9inUsecaseSDySSypGSS_16HeadphoneManager0L6DeviceCSitF_0(v8, v10, v11, a5);

  swift_bridgeObjectRelease();
  v13 = (void *)sub_25126C3B8();
  swift_bridgeObjectRelease();
  return v13;
}

- (id)_getHearingAssistPayload:(id)a3 device:(id)a4 inUsecase:(int64_t)a5
{
  uint64_t v8 = sub_25126C488();
  uint64_t v10 = v9;
  id v11 = a4;
  objc_super v12 = self;
  HearingModeUIService._getHearingAssistPayload(_:device:inUsecase:)(v8, v10, v11, a5);

  swift_bridgeObjectRelease();
  v13 = (void *)sub_25126C3B8();
  swift_bridgeObjectRelease();
  return v13;
}

- (void)_showOcclusionTutorial
{
  BOOL v2 = self;
  HearingModeUIService._showOcclusionTutorial()();
}

- (void)hearingTestTapped
{
  BOOL v2 = self;
  HearingModeUIService.hearingTestTapped()();
}

- (BOOL)_getHearingAssist
{
  BOOL v2 = self;
  Swift::Bool Hearing = HearingModeUIService._getHearingAssist()();

  return Hearing;
}

- (void)submitHADeviceAnalyticsWithEnrolled:(int64_t)a3
{
  char v4 = self;
  HearingModeUIService.submitHADeviceAnalytics(enrolled:)(a3);
}

- (id)getHearingAidString:(id)a3
{
  uint64_t v4 = sub_25126C488();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  HearingModeUIService.getHearingAidString(_:)(v8);

  swift_bridgeObjectRelease();
  uint64_t v9 = (void *)sub_25126C458();
  swift_bridgeObjectRelease();
  return v9;
}

- (id)getHearingAidLink:(id)a3
{
  sub_25126C488();
  uint64_t v4 = self;
  _sSo20HearingModeUIServiceC0aB10SettingsUIE03getA7AidLinkyS2SF_0();

  swift_bridgeObjectRelease();
  uint64_t v5 = (void *)sub_25126C458();
  swift_bridgeObjectRelease();
  return v5;
}

@end