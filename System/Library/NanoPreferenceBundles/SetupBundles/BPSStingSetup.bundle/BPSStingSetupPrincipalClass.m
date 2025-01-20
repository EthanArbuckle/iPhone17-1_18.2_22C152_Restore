@interface BPSStingSetupPrincipalClass
+ (BOOL)controllerNeedsToRunForBuddyControllerDelegate:(id)a3;
+ (BOOL)skipControllerForExpressMode:(id)a3;
+ (id)_stingConfigForDevice:(id)a3;
+ (id)expressModeSettingsString:(id)a3;
- (BPSStingSetupOptInViewController)firstController;
- (BPSStingSetupPrincipalClass)init;
- (id)viewController;
- (void)miniFlowStepComplete:(id)a3;
- (void)setFirstController:(id)a3;
@end

@implementation BPSStingSetupPrincipalClass

- (BPSStingSetupPrincipalClass)init
{
  v6.receiver = self;
  v6.super_class = (Class)BPSStingSetupPrincipalClass;
  v2 = [(BPSStingSetupPrincipalClass *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(BPSStingSetupOptInViewController);
    firstController = v2->_firstController;
    v2->_firstController = v3;

    [(BPSStingSetupOptInViewController *)v2->_firstController setMiniFlowDelegate:v2];
  }
  return v2;
}

+ (BOOL)controllerNeedsToRunForBuddyControllerDelegate:(id)a3
{
  id v3 = a3;
  v4 = +[NRPairedDeviceRegistry sharedInstance];
  v5 = +[NRPairedDeviceRegistry activeDeviceSelectorBlock];
  objc_super v6 = [v4 getAllDevicesWithArchivedAltAccountDevicesMatching:v5];
  v7 = [v6 firstObject];

  id v8 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"15BF559D-D50B-44FE-AC84-DFBA323EC985"];
  unsigned int v9 = [v7 supportsCapability:v8];

  if (v9)
  {
    v10 = +[BPSStingSetupPrincipalClass _stingConfigForDevice:v7];
    v11 = [v3 setupFlowUserInfo];
    uint64_t v12 = [v11 objectForKeyedSubscript:BPSPairingDeviceRestoredFrom];

    v13 = [v3 setupFlowUserInfo];
    uint64_t v14 = [v13 objectForKeyedSubscript:BPSPairingBackupRestoredFrom];

    v15 = bps_setup_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 67109632;
      *(_DWORD *)v22 = v10 == 0;
      *(_WORD *)&v22[4] = 1024;
      *(_DWORD *)&v22[6] = v14 != 0;
      __int16 v23 = 1024;
      BOOL v24 = v12 != 0;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "controllerNeedsToRunForBuddyControllerDelegate - StingConfig: %{BOOL}d restoredFromBackup: %{BOOL}d restoredFromDevice: %{BOOL}d", (uint8_t *)&v21, 0x14u);
    }
    uint64_t v16 = v14 | v12;

    if (v10) {
      BOOL v17 = v16 == 0;
    }
    else {
      BOOL v17 = 1;
    }
    char v18 = !v17;
    if (!v17)
    {
      v19 = bps_setup_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 138412290;
        *(void *)v22 = v10;
        _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "Skipping Sting Controller, Found existing setting: %@", (uint8_t *)&v21, 0xCu);
      }
    }
    LOBYTE(v9) = v18 ^ 1;
  }
  return v9;
}

+ (BOOL)skipControllerForExpressMode:(id)a3
{
  id v3 = +[BPSStingSetupPrincipalClass _stingConfigForDevice:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

+ (id)expressModeSettingsString:(id)a3
{
  id v3 = +[BPSStingSetupPrincipalClass _stingConfigForDevice:a3];
  BOOL v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"STING_SETUP_TITLE" value:&stru_C4E0 table:@"Localizable-N199"];
  objc_super v6 = [v3 objectForKey:@"action"];
  v7 = +[NSString stringWithFormat:@"%@ %@", v5, v6];

  return v7;
}

+ (id)_stingConfigForDevice:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.Carousel" pairedDevice:v3];

  id v5 = [v4 synchronize];
  objc_super v6 = [v4 objectForKey:@"StingSettingsConfiguration"];

  return v6;
}

- (id)viewController
{
  return self->_firstController;
}

- (void)miniFlowStepComplete:(id)a3
{
  id v4 = [(BPSStingSetupPrincipalClass *)self delegate];
  [v4 buddyControllerDone:self];
}

- (BPSStingSetupOptInViewController)firstController
{
  return self->_firstController;
}

- (void)setFirstController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end