@interface HearingAidController
- (CXCallObserver)callObserver;
- (HearingAidController)init;
- (NSLock)deviceUpdateLock;
- (NSMutableArray)availableDevices;
- (id)accessibilityPreferenceForSpecifier:(id)a3;
- (id)bluetoothAvailable;
- (id)hearingAidComplaince:(id)a3;
- (id)specifiers;
- (id)valueForSpecifier:(id)a3;
- (void)_handleAvailableDevicesChanged:(id)a3;
- (void)_updateHACSwitchSettingWithStatus:(BOOL)a3;
- (void)accessibilitySetPreference:(id)a3 specifier:(id)a4;
- (void)beginSearching;
- (void)bluetoothPowerDidChange:(id)a3;
- (void)callObserver:(id)a3 callChanged:(id)a4;
- (void)dealloc;
- (void)displayPairingFailureAlertForDevice:(id)a3;
- (void)hearingServerDidDie:(id)a3;
- (void)refreshAvailableDevices;
- (void)setAvailableDevices:(id)a3;
- (void)setBluetoothAvailability:(BOOL)a3;
- (void)setBluetoothAvailable:(id)a3;
- (void)setCallObserver:(id)a3;
- (void)setDeviceUpdateLock:(id)a3;
- (void)setHearingAidCompliance:(id)a3 specifier:(id)a4;
- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateBluetoothAvailability;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewHearingAidDetailsWithSpecifier:(id)a3;
- (void)willBecomeActive;
- (void)willResignActive;
@end

@implementation HearingAidController

- (HearingAidController)init
{
  v3.receiver = self;
  v3.super_class = (Class)HearingAidController;
  return [(HearingAidController *)&v3 init];
}

- (void)dealloc
{
  objc_super v3 = +[AXHAServer sharedInstance];
  [v3 sendMessagesPriorityDefault];

  v4 = +[AXHAServer sharedInstance];
  [v4 unregisterUpdateListener:self];

  v5 = +[AXHAServer sharedInstance];
  [v5 setDelegate:0];

  v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:self];

  [(CXCallObserver *)self->_callObserver setDelegate:0 queue:0];
  v7.receiver = self;
  v7.super_class = (Class)HearingAidController;
  [(HearingAidController *)&v7 dealloc];
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)HearingAidController;
  [(HearingAidController *)&v11 viewDidLoad];
  objc_super v3 = +[NSMutableArray array];
  [(HearingAidController *)self setAvailableDevices:v3];

  v4 = +[AXHAServer sharedInstance];
  [v4 sendMessagesPriorityHigh];

  v5 = +[AXHAServer sharedInstance];
  [v5 startServerWithDelegate:self];

  [(HearingAidController *)self updateBluetoothAvailability];
  v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"bluetoothAvailabilityDidChange:" name:BluetoothAvailabilityChangedNotification object:0];

  objc_super v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"bluetoothAvailabilityDidChange:" name:BluetoothPowerChangedNotification object:0];

  v8 = +[NSNotificationCenter defaultCenter];
  [v8 addObserver:self selector:"bluetoothAvailabilityDidChange:" name:BluetoothDenylistStateChangedNotification object:0];

  v9 = (CXCallObserver *)objc_opt_new();
  callObserver = self->_callObserver;
  self->_callObserver = v9;

  [(CXCallObserver *)self->_callObserver setDelegate:self queue:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v17.receiver = self;
  v17.super_class = (Class)HearingAidController;
  [(HearingAidController *)&v17 viewDidAppear:a3];
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = sub_22BDC;
  v15 = sub_22BEC;
  id v16 = +[NSMutableArray array];
  v4 = [(HearingAidController *)self availableDevices];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_22BF4;
  v10[3] = &unk_3CF28;
  v10[4] = &v11;
  [v4 enumerateObjectsUsingBlock:v10];

  [(HearingAidController *)self removeContiguousSpecifiers:v12[5] animated:1];
  v5 = [(HearingAidController *)self availableDevices];
  [v5 removeObjectsInArray:v12[5]];

  v6 = [(HearingAidController *)self availableDevices];
  if (![v6 count])
  {
    objc_super v7 = [(HearingAidController *)self specifierForID:@"PLACEHOLDER"];

    if (v7) {
      goto LABEL_4;
    }
    v8 = hearingSettingsLocString(@"SearchingPlaceholder", @"HearingAidSettings");
    v6 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:0 get:"valueForSpecifier:" detail:objc_opt_class() cell:4 edit:0];

    [v6 setProperty:objc_opt_class() forKey:PSCellClassKey];
    [v6 setIdentifier:@"PLACEHOLDER"];
    v9 = +[NSNumber numberWithBool:0];
    [v6 setProperty:v9 forKey:PSEnabledKey];

    [(HearingAidController *)self insertSpecifier:v6 atIndex:1 animated:0];
  }

LABEL_4:
  [(HearingAidController *)self updateBluetoothAvailability];
  [(HearingAidController *)self beginSearching];
  _Block_object_dispose(&v11, 8);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HearingAidController;
  [(HearingAidController *)&v6 viewDidDisappear:a3];
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  v5 = +[AXHAServer sharedInstance];
  [v5 unregisterUpdateListener:self];
}

- (void)willBecomeActive
{
  v4.receiver = self;
  v4.super_class = (Class)HearingAidController;
  [(HearingAidController *)&v4 willBecomeActive];
  objc_super v3 = +[AXHAServer sharedInstance];
  [v3 sendMessagesPriorityHigh];

  [(HearingAidController *)self updateBluetoothAvailability];
  [(HearingAidController *)self beginSearching];
}

- (void)willResignActive
{
  v6.receiver = self;
  v6.super_class = (Class)HearingAidController;
  [(HearingAidController *)&v6 willResignActive];
  objc_super v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  objc_super v4 = +[AXHAServer sharedInstance];
  [v4 sendMessagesPriorityDefault];

  v5 = +[AXHAServer sharedInstance];
  [v5 unregisterUpdateListener:self];
}

- (id)specifiers
{
  objc_super v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (v3) {
    goto LABEL_43;
  }
  uint64_t v50 = OBJC_IVAR___PSListController__specifiers;
  objc_super v4 = [(HearingAidController *)self loadSpecifiersFromPlistName:@"HearingAidSettings" target:self];
  id v5 = [v4 mutableCopy];

  +[NSMutableArray array];
  v52 = v51 = self;
  if (self->_bluetoothAvailable)
  {
    objc_super v6 = [(HearingAidController *)self availableDevices];
    id v7 = [v6 count];

    if (v7)
    {
      v8 = [(HearingAidController *)self availableDevices];
      v57[0] = _NSConcreteStackBlock;
      v57[1] = 3221225472;
      v57[2] = sub_235F0;
      v57[3] = &unk_3CF50;
      id v58 = v5;
      [v8 enumerateObjectsUsingBlock:v57];
    }
    else
    {
      uint64_t v13 = hearingSettingsLocString(@"SearchingPlaceholder", @"HearingAidSettings");
      v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:self set:0 get:"valueForSpecifier:" detail:objc_opt_class() cell:4 edit:0];

      [v14 setProperty:objc_opt_class() forKey:PSCellClassKey];
      [v14 setIdentifier:@"PLACEHOLDER"];
      v15 = +[NSNumber numberWithBool:0];
      [v14 setProperty:v15 forKey:PSEnabledKey];

      [v5 insertObject:v14 atIndex:1];
    }
    v10 = hearingSettingsLocString(@"MFiEducationFooter", @"HearingAidSettings");
    id v16 = +[HUHearingAidSettings sharedInstance];
    objc_super v17 = [v16 pairedHearingAids];

    if (!v17) {
      goto LABEL_26;
    }
    v18 = (const void *)_AXSTripleClickCopyOptions();
    int v19 = _AXSTripleClickContainsOption();
    if (v18) {
      CFRelease(v18);
    }
    if (+[HCUtilities deviceHasHomeButton])
    {
      v20 = @"HearingAidFooterText";
    }
    else
    {
      v20 = [@"HearingAidFooterText" stringByAppendingString:@"_NHB"];
      if (+[HCUtilities deviceIsPad])
      {
        uint64_t v21 = [(__CFString *)v20 stringByAppendingString:@"_IPAD"];

        v20 = (__CFString *)v21;
      }
    }
    if (v19) {
      v22 = v20;
    }
    else {
      v22 = @"HearingAidFooterText_Off";
    }
    v23 = hearingSettingsLocString(v22, @"HearingAidSettings");

    v24 = +[HUHearingAidSettings sharedInstance];
    unsigned int v25 = [v24 isiCloudPaired];

    if (v25)
    {
      if (+[HCUtilities deviceIsPhone])
      {
        v26 = @"HearingAidFooterText_iCloud_iPhone";
LABEL_24:
        uint64_t v27 = hearingSettingsLocString(v26, @"HearingAidSettings");

        v23 = (void *)v27;
        goto LABEL_25;
      }
      if (+[HCUtilities deviceIsPad])
      {
        v26 = @"HearingAidFooterText_iCloud_iPad";
        goto LABEL_24;
      }
      if (+[HCUtilities deviceIsPod])
      {
        v26 = @"HearingAidFooterText_iCloud_iPod";
        goto LABEL_24;
      }
    }
LABEL_25:

    v10 = v23;
LABEL_26:
    v28 = [v5 firstObject];
    uint64_t v49 = PSFooterTextGroupKey;
    objc_msgSend(v28, "setProperty:forKey:", v10);

    goto LABEL_27;
  }
  v9 = hearingSettingsLocString(@"BluetoothDisabledTitle", @"HearingAidSettings");
  v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:"setBluetoothAvailable:" get:"bluetoothAvailable" detail:0 cell:6 edit:0];

  [v10 setProperty:@"HEARING_AID_BLUETOOTH" forKey:PSIDKey];
  [v5 insertObject:v10 atIndex:1];
  uint64_t v11 = [v5 firstObject];
  v12 = hearingSettingsLocString(@"BluetoothDisabledDescription", @"HearingAidSettings");
  uint64_t v49 = PSFooterTextGroupKey;
  objc_msgSend(v11, "setProperty:forKey:", v12);

LABEL_27:
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v29 = v5;
  id v30 = [v29 countByEnumeratingWithState:&v53 objects:v59 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v54;
    uint64_t v33 = PSAllowMultilineTitleKey;
    uint64_t v34 = PSKeyNameKey;
    do
    {
      for (i = 0; i != v31; i = (char *)i + 1)
      {
        if (*(void *)v54 != v32) {
          objc_enumerationMutation(v29);
        }
        v36 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        [v36 setProperty:&__kCFBooleanTrue forKey:v33];
        v37 = [v36 properties];
        v38 = [v37 objectForKey:v34];

        if (([v38 hasPrefix:@"HearingAudioRouting"] & 1) != 0
          || ([v38 hasPrefix:@"HearingAidRingtone"] & 1) != 0
          || ([v38 hasPrefix:@"HearingMultidevice"] & 1) != 0
          || [v38 hasPrefix:@"HearingAidSystemSounds"])
        {
          v39 = +[HUHearingAidSettings sharedInstance];
          v40 = [v39 pairedHearingAids];

          if (!v40) {
            [v52 addObject:v36];
          }
        }
      }
      id v31 = [v29 countByEnumeratingWithState:&v53 objects:v59 count:16];
    }
    while (v31);
  }

  if (+[HCUtilities deviceIsPhone])
  {
    v41 = hearingSettingsLocString(@"HearingAidCompliance", @"HearingAidSettings");
    v42 = +[PSSpecifier groupSpecifierWithName:v41];

    v43 = hearingSettingsLocString(@"HearingAidComplianceInstructions", @"HearingAidSettings");
    [v42 setProperty:v43 forKey:v49];

    [v29 addObject:v42];
    v44 = hearingSettingsLocString(@"HearingAidCompliance", @"HearingAidSettings");
    v45 = +[PSSpecifier preferenceSpecifierNamed:v44 target:v51 set:"setHearingAidCompliance:specifier:" get:"hearingAidComplaince:" detail:0 cell:6 edit:0];

    [v45 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
    [v45 setProperty:@"HEARING_AID_COMPLIANCE" forKey:PSIDKey];
    [v29 addObject:v45];
  }
  [v29 removeObjectsInArray:v52];
  id v46 = [v29 copy];
  v47 = *(void **)&v51->PSListController_opaque[v50];
  *(void *)&v51->PSListController_opaque[v50] = v46;

  objc_super v3 = *(void **)&v51->PSListController_opaque[v50];
LABEL_43:

  return v3;
}

- (id)hearingAidComplaince:(id)a3
{
  uint64_t v3 = AXHACHearingAidComplianceEnabled();

  return +[NSNumber numberWithUnsignedChar:v3];
}

- (void)setHearingAidCompliance:(id)a3 specifier:(id)a4
{
  [a3 BOOLValue];
  AXHACHearingAidComplianceSetEnabled();
  if (a3)
  {
    if (_AXSEarpieceNoiseCancellationEnabled())
    {
      id v6 = objc_alloc_init((Class)PSConfirmationSpecifier);
      if ((+[HCUtilities deviceIsPad] & 1) == 0)
      {
        id v7 = hearingSettingsLocString(@"HearingAlertButtonTitle", @"HearingAidSettings");
        [v6 setTitle:v7];
      }
      v8 = hearingSettingsLocString(@"NoiseCancellationHacToggleMessage", @"HearingAidSettings");
      [v6 setPrompt:v8];

      v9 = hearingSettingsLocString(@"HearingAlertButtonTitle", @"HearingAidSettings");
      [v6 setOkButton:v9];

      [(HearingAidController *)self showConfirmationViewForSpecifier:v6];
    }
    _AXSEarpieceNoiseCancellationSetEnabled();
  }
}

- (id)bluetoothAvailable
{
  return +[NSNumber numberWithBool:self->_bluetoothAvailable];
}

- (void)setBluetoothAvailable:(id)a3
{
  if ([a3 BOOLValue])
  {
    objc_super v4 = +[BluetoothManager sharedInstance];
    [v4 setPowered:1];

    id v5 = +[BluetoothManager sharedInstance];
    [v5 setDenylistEnabled:0];

    [(HearingAidController *)self setBluetoothAvailability:1];
  }
}

- (void)setBluetoothAvailability:(BOOL)a3
{
  self->_bluetoothAvailable = a3;
  AXPerformBlockOnMainThread();
  [(HearingAidController *)self beginSearching];
}

- (id)valueForSpecifier:(id)a3
{
  return [a3 propertyForKey:PSValueKey];
}

- (id)accessibilityPreferenceForSpecifier:(id)a3
{
  uint64_t v3 = [a3 properties];
  objc_super v4 = [v3 objectForKey:PSKeyNameKey];

  if ([v4 isEqualToString:@"HearingAidCompliance"])
  {
    uint64_t v5 = +[NSNumber numberWithBool:AXHACHearingAidComplianceEnabled() != 0];
LABEL_5:
    id v6 = (void *)v5;
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"HearingAidRingtone"])
  {
    uint64_t v5 = +[NSNumber numberWithUnsignedChar:_AXSHearingAidRingtoneStreamingEnabled()];
    goto LABEL_5;
  }
  if ([v4 isEqualToString:@"HearingMultideviceSettings"])
  {
    id v7 = +[HUHearingAidSettings sharedInstance];
    id v8 = [v7 multideviceSettingsEnabled];
LABEL_12:
    id v6 = +[NSNumber numberWithBool:v8];

    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"HearingMultideviceAudio"])
  {
    id v7 = +[HUHearingAidSettings sharedInstance];
    id v8 = [v7 multideviceAudioEnabled];
    goto LABEL_12;
  }
  if ([v4 isEqualToString:@"HearingAidSystemSounds"])
  {
    id v7 = +[HUHearingAidSettings sharedInstance];
    id v8 = [v7 shouldStreamSystemSounds];
    goto LABEL_12;
  }
  id v6 = 0;
LABEL_13:

  return v6;
}

- (void)accessibilitySetPreference:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = [a4 properties];
  id v11 = [v7 objectForKey:PSKeyNameKey];

  id v8 = [v6 BOOLValue];
  if ([v11 isEqualToString:@"HearingAidCompliance"])
  {
    AXHACHearingAidComplianceSetEnabled();
    if (v8) {
      _AXSEarpieceNoiseCancellationSetEnabled();
    }
    v9 = [(HearingAidController *)self parentController];
    [v9 reload];
  }
  else
  {
    if ([v11 isEqualToString:@"HearingAidRingtone"])
    {
      _AXSHearingAidRingtoneStreamingSetEnabled();
      goto LABEL_14;
    }
    if ([v11 isEqualToString:@"HearingMultideviceSettings"])
    {
      v10 = +[HUHearingAidSettings sharedInstance];
      [v10 setMultideviceSettingsEnabled:v8];
    }
    else if ([v11 isEqualToString:@"HearingMultideviceAudio"])
    {
      v10 = +[HUHearingAidSettings sharedInstance];
      [v10 setMultideviceAudioEnabled:v8];
    }
    else
    {
      if (![v11 isEqualToString:@"HearingAidSystemSounds"]) {
        goto LABEL_14;
      }
      v10 = +[HUHearingAidSettings sharedInstance];
      [v10 setShouldStreamSystemSounds:v8];
    }
  }
LABEL_14:
}

- (void)refreshAvailableDevices
{
  uint64_t v3 = [(HearingAidController *)self deviceUpdateLock];

  if (!v3)
  {
    id v4 = objc_alloc_init((Class)NSLock);
    [(HearingAidController *)self setDeviceUpdateLock:v4];
  }
  if (self->_bluetoothAvailable)
  {
    objc_initWeak(&location, self);
    uint64_t v5 = +[HUHearingAidSettings sharedInstance];
    id v6 = [v5 pairedHearingAids];

    if (v6)
    {
      id v7 = +[AXHAServer sharedInstance];
      id v8 = objc_loadWeakRetained(&location);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_23E80;
      v16[3] = &unk_3CFB8;
      objc_copyWeak(&v17, &location);
      [v7 registerListener:v8 forPropertyUpdateHandler:v16];

      objc_destroyWeak(&v17);
    }
    v9 = +[AXHAServer sharedInstance];
    id v10 = objc_loadWeakRetained(&location);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_23F30;
    v14[3] = &unk_3CE98;
    objc_copyWeak(&v15, &location);
    [v9 registerListener:v10 forAvailableDeviceHandler:v14];

    id v11 = +[AXHAServer sharedInstance];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_24048;
    v12[3] = &unk_3CFB8;
    objc_copyWeak(&v13, &location);
    [v11 registerListener:self forControlMessageHandler:v12];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

- (void)_handleAvailableDevicesChanged:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    +[NSMutableArray array];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_24A10;
    v19[3] = &unk_3D070;
    v19[4] = self;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v20 = v5;
    [v4 enumerateObjectsUsingBlock:v19];
    if (![v5 count])
    {
LABEL_12:

      goto LABEL_13;
    }
    id v6 = [(HearingAidController *)self availableDevices];
    if ([v6 count])
    {
      id v7 = [(HearingAidController *)self availableDevices];
      id v8 = [v7 objectAtIndex:0];
      id v9 = [(HearingAidController *)self indexOfSpecifier:v8];

      if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        id v10 = [(HearingAidController *)self availableDevices];
        [(HearingAidController *)self replaceContiguousSpecifiers:v10 withSpecifiers:v5 animated:1];

LABEL_11:
        v18 = [(HearingAidController *)self availableDevices];
        [v18 setArray:v5];

        goto LABEL_12;
      }
    }
    else
    {
    }
    id v17 = [(HearingAidController *)self availableDevices];
    [(HearingAidController *)self removeContiguousSpecifiers:v17 animated:0];

    [(HearingAidController *)self insertContiguousSpecifiers:v5 atIndex:1 animated:0];
    [(HearingAidController *)self removeSpecifierID:@"PLACEHOLDER" animated:0];
    goto LABEL_11;
  }
  id v11 = [(HearingAidController *)self availableDevices];
  [(HearingAidController *)self removeContiguousSpecifiers:v11 animated:0];

  v12 = [(HearingAidController *)self specifierForID:@"PLACEHOLDER"];

  if (!v12)
  {
    id v13 = hearingSettingsLocString(@"SearchingPlaceholder", @"HearingAidSettings");
    v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:self set:0 get:"valueForSpecifier:" detail:objc_opt_class() cell:4 edit:0];

    [v14 setProperty:objc_opt_class() forKey:PSCellClassKey];
    [v14 setIdentifier:@"PLACEHOLDER"];
    id v15 = +[NSNumber numberWithBool:0];
    [v14 setProperty:v15 forKey:PSEnabledKey];

    [(HearingAidController *)self insertSpecifier:v14 atIndex:1 animated:0];
  }
  id v16 = [(HearingAidController *)self availableDevices];
  [v16 removeAllObjects];

LABEL_13:
}

- (void)beginSearching
{
  if (!self->_pairingManager)
  {
    uint64_t v3 = (CBPeripheralManager *)[objc_alloc((Class)CBPeripheralManager) initWithDelegate:self queue:0];
    pairingManager = self->_pairingManager;
    self->_pairingManager = v3;
  }
  if (self->_bluetoothAvailable)
  {
    [(HearingAidController *)self refreshAvailableDevices];
  }
}

- (void)viewHearingAidDetailsWithSpecifier:(id)a3
{
  id v4 = *(objc_class **)((char *)a3 + OBJC_IVAR___PSSpecifier_detailControllerClass);
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  if (!v6) {
    id v6 = objc_alloc_init((Class)PSDetailController);
  }
  id v8 = v6;
  id v7 = [(HearingAidController *)self rootController];
  [v8 setRootController:v7];

  [v8 setParentController:self];
  [v8 setSpecifier:v5];

  [(HearingAidController *)self showController:v8 animate:1];
}

- (void)displayPairingFailureAlertForDevice:(id)a3
{
  id v4 = a3;
  if ([v4 isPaired] && (objc_msgSend(v4, "isBluetoothPaired") & 1) == 0)
  {
    id v5 = +[HUHearingAidSettings sharedInstance];
    id v6 = [v5 pairedHearingAids];
    if (v6)
    {
      pairingAlertController = self->_pairingAlertController;

      if (!pairingAlertController)
      {
        id v8 = hearingSettingsLocString(@"HearingPairingFailureTitle", @"HearingAidSettings");
        id v9 = hearingSettingsLocString(@"HearingPairingFailureMessage", @"HearingAidSettings");
        id v10 = +[UIAlertController alertControllerWithTitle:v8 message:v9 preferredStyle:1];
        id v11 = self->_pairingAlertController;
        self->_pairingAlertController = v10;

        v12 = self->_pairingAlertController;
        id v13 = hearingSettingsLocString(@"HearingAlertButtonTitle", @"HearingAidSettings");
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_24F30;
        v15[3] = &unk_3CC98;
        v15[4] = self;
        v14 = +[UIAlertAction actionWithTitle:v13 style:0 handler:v15];
        [(UIAlertController *)v12 addAction:v14];

        [(HearingAidController *)self presentViewController:self->_pairingAlertController animated:1 completion:&stru_3D090];
      }
    }
    else
    {
    }
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v24.receiver = self;
  v24.super_class = (Class)HearingAidController;
  id v7 = a3;
  [(HearingAidController *)&v24 tableView:v7 didSelectRowAtIndexPath:v6];
  id v8 = [v7 cellForRowAtIndexPath:v6];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [v8 device];
    if (([v9 isPaired] & 1) == 0)
    {
      [v9 connect];
      [v9 setKeepInSync:1];
      [v9 setValue:&__kCFBooleanTrue forProperty:0x4000000];
      v12 = [(HearingAidController *)self availableDevices];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_25294;
      v22[3] = &unk_3CBD8;
      id v23 = v8;
      [v12 enumerateObjectsUsingBlock:v22];

      if (+[HCUtilities deviceHasHomeButton])
      {
        id v13 = @"HearingAidFooterText";
      }
      else
      {
        id v13 = [@"HearingAidFooterText" stringByAppendingString:@"_NHB"];
        if (+[HCUtilities deviceIsPad])
        {
          uint64_t v14 = [(__CFString *)v13 stringByAppendingString:@"_IPAD"];

          id v13 = (__CFString *)v14;
        }
      }
      id v15 = hearingSettingsLocString(v13, @"HearingAidSettings");
      id v16 = [(HearingAidController *)self specifierAtIndex:0];
      [v16 setProperty:v15 forKey:PSFooterTextGroupKey];
      [(HearingAidController *)self reloadSpecifier:v16];

      goto LABEL_12;
    }
    id v10 = +[HUHearingAidSettings sharedInstance];
    if ([v10 isiCloudPaired])
    {
      id v11 = +[HUHearingAidSettings sharedInstance];
      if (![v11 isPairedWithFakeHearingAids])
      {
        int v19 = +[AXHAServer sharedInstance];
        unsigned int v20 = [v19 hearingAidReachable];

        if (v20)
        {
          uint64_t v21 = +[AXHAServer sharedInstance];
          [v21 requestHearingAidConnectionWithReason:4];

          [(HearingAidController *)self displayPairingFailureAlertForDevice:v9];
        }
        goto LABEL_12;
      }
    }
LABEL_12:
    id v17 = [(HearingAidController *)self indexForIndexPath:v6];
    v18 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndex:v17];
    [(HearingAidController *)self viewHearingAidDetailsWithSpecifier:v18];
  }
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  id v5 = [(HearingAidController *)self indexForIndexPath:a4];
  id v6 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndex:v5];
  [(HearingAidController *)self viewHearingAidDetailsWithSpecifier:v6];
}

- (void)bluetoothPowerDidChange:(id)a3
{
  id v7 = a3;
  id v4 = [v7 object];
  if ([v4 powered])
  {
    id v5 = [v7 object];
    unsigned __int8 v6 = [v5 denylistEnabled];

    if ((v6 & 1) == 0) {
      [(HearingAidController *)self beginSearching];
    }
  }
  else
  {
  }
}

- (void)updateBluetoothAvailability
{
  id v8 = +[BluetoothManager sharedInstance];
  if ([v8 available])
  {
    if ([v8 powered])
    {
      id v3 = (id)([v8 denylistEnabled] ^ 1);
      goto LABEL_7;
    }
  }
  else
  {
    id v4 = SCDynamicStoreCreate(0, @"com.apple.settings.hearing", 0, 0);
    if (v4)
    {
      id v5 = v4;
      unsigned __int8 v6 = (void *)SCDynamicStoreCopyValue(v4, @"com.apple.MobileBluetooth");
      id v7 = [v6 objectForKey:@"Powered"];
      id v3 = [v7 BOOLValue];
      CFRelease(v5);

      goto LABEL_7;
    }
  }
  id v3 = 0;
LABEL_7:
  [(HearingAidController *)self setBluetoothAvailability:v3];
}

- (void)hearingServerDidDie:(id)a3
{
  id v4 = +[AXHAServer sharedInstance];
  [v4 startServerWithDelegate:self];
}

- (void)callObserver:(id)a3 callChanged:(id)a4
{
  id v5 = a4;
  HAInitializeLogging();
  unsigned __int8 v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Call: connected %d, ended %d", [v5 hasConnected], objc_msgSend(v5, "hasEnded"));
  id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %@", "-[HearingAidController callObserver:callChanged:]", 726, v6);
  id v8 = (void *)HAEngineeringLog;
  if (os_log_type_enabled(HAEngineeringLog, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v7;
    id v10 = v8;
    *(_DWORD *)buf = 136446210;
    id v12 = [v9 UTF8String];
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  -[HearingAidController _updateHACSwitchSettingWithStatus:](self, "_updateHACSwitchSettingWithStatus:", [v5 hasEnded]);
}

- (void)_updateHACSwitchSettingWithStatus:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(HearingAidController *)self specifierForID:@"HEARING_AID_COMPLIANCE"];
  id v5 = +[NSNumber numberWithBool:v3];
  [v6 setProperty:v5 forKey:PSEnabledKey];

  [(HearingAidController *)self reloadSpecifier:v6];
}

- (NSMutableArray)availableDevices
{
  return self->_availableDevices;
}

- (void)setAvailableDevices:(id)a3
{
}

- (NSLock)deviceUpdateLock
{
  return self->deviceUpdateLock;
}

- (void)setDeviceUpdateLock:(id)a3
{
}

- (CXCallObserver)callObserver
{
  return self->_callObserver;
}

- (void)setCallObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callObserver, 0);
  objc_storeStrong((id *)&self->deviceUpdateLock, 0);
  objc_storeStrong((id *)&self->_pairingAlertController, 0);
  objc_storeStrong((id *)&self->_compressingAlertController, 0);
  objc_storeStrong((id *)&self->_pairingManager, 0);

  objc_storeStrong((id *)&self->_availableDevices, 0);
}

@end