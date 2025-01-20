@interface HearingAidDetailController
- (AXRemoteHearingAidDevice)device;
- (BOOL)shouldShowCombinedStreamingVolume;
- (HearingAidDetailController)init;
- (NSTimer)hysteresisTimer;
- (_NSRange)programRangeForPresetId:(id)a3;
- (_NSRange)programsRange;
- (id)_combinedProgramSpecifiers;
- (id)_leftProgramSpecifiers;
- (id)_programSpecifiers;
- (id)_rightProgramSpecifiers;
- (id)_volumeSpecifiers;
- (id)bluetoothAvailable;
- (id)deviceSpecifiers;
- (id)independentAids:(id)a3;
- (id)programSpecsFromAvailablePrograms:(id)a3 withGroupSpec:(id)a4 forEar:(int)a5;
- (id)shouldStream:(id)a3;
- (id)specifierForKey:(id)a3;
- (id)specifiers;
- (void)_reloadProgramSpecifiers;
- (void)_setupListeners;
- (void)_updateLiveListenButtonForOneness;
- (void)_updatePrograms:(id)a3;
- (void)confirmationViewAcceptedForSpecifier:(id)a3;
- (void)dealloc;
- (void)forgetAid:(id)a3;
- (void)liveListenToggle:(id)a3;
- (void)pauseSoundRecognitionIfNecessary;
- (void)reloadSpecifiers;
- (void)restartSoundRecognitionIfNecessary;
- (void)selectCommonProgramsForLeftAndRightDevices;
- (void)setBluetoothAvailability:(BOOL)a3;
- (void)setDevice:(id)a3;
- (void)setHysteresisTimer:(id)a3;
- (void)setIndependentAids:(id)a3 specifier:(id)a4;
- (void)setShouldStream:(id)a3 specifier:(id)a4;
- (void)setSpecifier:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateAvailability;
- (void)updateBluetoothAvailability;
- (void)updateLiveListenCell:(id)a3;
- (void)updateLiveListenWithState:(BOOL)a3 andLevel:(double)a4;
- (void)updateView;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willBecomeActive;
- (void)willResignActive;
@end

@implementation HearingAidDetailController

- (HearingAidDetailController)init
{
  v5.receiver = self;
  v5.super_class = (Class)HearingAidDetailController;
  v2 = [(HearingAidDetailController *)&v5 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"updateAvailability" name:HUNearbyDevicesDidChangeNotification object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4 = [(HearingAidDetailController *)self device];
  [v4 setKeepInSync:0];

  objc_super v5 = +[AXHAServer sharedInstance];
  [v5 unregisterUpdateListener:self];

  [(HearingAidDetailController *)self setDevice:0];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v7.receiver = self;
  v7.super_class = (Class)HearingAidDetailController;
  [(HearingAidDetailController *)&v7 dealloc];
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)HearingAidDetailController;
  [(HearingAidDetailController *)&v7 viewDidLoad];
  [(HearingAidDetailController *)self updateBluetoothAvailability];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"bluetoothAvailabilityDidChange:" name:BluetoothAvailabilityChangedNotification object:0];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"bluetoothAvailabilityDidChange:" name:BluetoothPowerChangedNotification object:0];

  objc_super v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"bluetoothAvailabilityDidChange:" name:BluetoothDenylistStateChangedNotification object:0];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_FBC0, kAXSContinuityDisplayStateChangedNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HearingAidDetailController;
  [(HearingAidDetailController *)&v4 viewWillAppear:a3];
  [(HearingAidDetailController *)self _setupListeners];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HearingAidDetailController;
  [(HearingAidDetailController *)&v6 viewDidDisappear:a3];
  objc_super v4 = +[AXHAServer sharedInstance];
  [v4 unregisterUpdateListener:self];

  objc_super v5 = [(HearingAidDetailController *)self device];
  [v5 setKeepInSync:0];

  [(HearingAidDetailController *)self restartSoundRecognitionIfNecessary];
}

- (void)willBecomeActive
{
  v3.receiver = self;
  v3.super_class = (Class)HearingAidDetailController;
  [(HearingAidDetailController *)&v3 willBecomeActive];
  [(HearingAidDetailController *)self updateBluetoothAvailability];
  [(HearingAidDetailController *)self _setupListeners];
}

- (void)willResignActive
{
  v5.receiver = self;
  v5.super_class = (Class)HearingAidDetailController;
  [(HearingAidDetailController *)&v5 willResignActive];
  objc_super v3 = +[AXHAServer sharedInstance];
  [v3 unregisterUpdateListener:self];

  objc_super v4 = [(HearingAidDetailController *)self device];
  [v4 setKeepInSync:0];
}

- (void)_setupListeners
{
  location[1] = _NSConcreteStackBlock;
  location[2] = (id)3221225472;
  location[3] = sub_FF8C;
  location[4] = &unk_3C850;
  location[5] = self;
  AXPerformBlockOnMainThreadAfterDelay();
  objc_super v3 = [(HearingAidDetailController *)self device];
  [v3 setKeepInSync:1];
  objc_initWeak(location, self);
  objc_super v4 = +[AXHAServer sharedInstance];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_FF94;
  v11[3] = &unk_3CA98;
  objc_copyWeak(&v12, location);
  [v4 registerListener:self forLiveListenLevelsHandler:v11];

  objc_super v5 = +[AXHAServer sharedInstance];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_FFF4;
  v7[3] = &unk_3CB38;
  id v6 = v3;
  id v8 = v6;
  v9 = self;
  objc_copyWeak(&v10, location);
  [v5 registerListener:self forPropertyUpdateHandler:v7];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(location);
}

- (id)bluetoothAvailable
{
  return +[NSNumber numberWithBool:self->_bluetoothAvailable];
}

- (void)setBluetoothAvailability:(BOOL)a3
{
  if (self->_bluetoothAvailable != a3)
  {
    self->_bluetoothAvailable = a3;
    AXPerformBlockOnMainThread();
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
    objc_super v4 = SCDynamicStoreCreate(0, @"com.apple.settings.hearing", 0, 0);
    if (v4)
    {
      objc_super v5 = v4;
      id v6 = (void *)SCDynamicStoreCopyValue(v4, @"com.apple.MobileBluetooth");
      objc_super v7 = [v6 objectForKey:@"Powered"];
      id v3 = [v7 BOOLValue];
      CFRelease(v5);

      goto LABEL_7;
    }
  }
  id v3 = 0;
LABEL_7:
  [(HearingAidDetailController *)self setBluetoothAvailability:v3];
}

- (void)updateAvailability
{
  HAInitializeLogging();
  v2 = +[NSString stringWithFormat:@"Updating availability"];
  id v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %@", "-[HearingAidDetailController updateAvailability]", 236, v2);
  objc_super v4 = (void *)HAEngineeringLog;
  if (os_log_type_enabled(HAEngineeringLog, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v3;
    id v6 = v4;
    *(_DWORD *)buf = 136446210;
    id v8 = [v5 UTF8String];
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  AXPerformBlockOnMainThread();
}

- (void)reloadSpecifiers
{
}

- (void)setSpecifier:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HearingAidDetailController;
  [(HearingAidDetailController *)&v14 setSpecifier:v4];
  if (v4)
  {
    id v5 = [v4 userInfo];
    [(HearingAidDetailController *)self setDevice:v5];

    id v6 = [(HearingAidDetailController *)self device];
    [v6 setKeepInSync:1];

    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x3032000000;
    v12[3] = sub_10CCC;
    v12[4] = sub_10CDC;
    objc_super v7 = self;
    v13 = v7;
    id v8 = +[HUHearingAidSettings sharedInstance];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10CE4;
    v11[3] = &unk_3C998;
    void v11[4] = v12;
    [v8 registerUpdateBlock:v11 forRetrieveSelector:"shouldStreamToLeftAid" withListener:v7];

    v9 = +[HUHearingAidSettings sharedInstance];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10CFC;
    v10[3] = &unk_3C998;
    v10[4] = v12;
    [v9 registerUpdateBlock:v10 forRetrieveSelector:"shouldStreamToRightAid" withListener:v7];

    _Block_object_dispose(v12, 8);
  }
}

- (id)deviceSpecifiers
{
  id v3 = +[NSMutableArray array];
  id v4 = [(HearingAidDetailController *)self device];
  id v5 = [v4 name];
  id v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:-1 edit:0];

  [v6 setProperty:objc_opt_class() forKey:PSCellClassKey];
  objc_super v7 = [(HearingAidDetailController *)self device];
  +[AXHearingAidDetailCell heightRequiredForDevice:v7];
  *(float *)&double v8 = v8;
  v9 = +[NSNumber numberWithFloat:v8];
  [v6 setProperty:v9 forKey:PSTableCellHeightKey];

  [v6 setIdentifier:@"DetailCell"];
  id v10 = [(HearingAidDetailController *)self device];
  [v6 setUserInfo:v10];

  [v3 addObject:v6];

  return v3;
}

- (id)_programSpecifiers
{
  id v3 = +[NSMutableArray array];
  id v4 = [(HearingAidDetailController *)self device];
  unsigned int v5 = [v4 showCombinedPrograms];

  if (v5)
  {
    [(HearingAidDetailController *)self _combinedProgramSpecifiers];
  }
  else
  {
    id v6 = [(HearingAidDetailController *)self _leftProgramSpecifiers];
    [v3 addObjectsFromArray:v6];

    [(HearingAidDetailController *)self _rightProgramSpecifiers];
  objc_super v7 = };
  [v3 addObjectsFromArray:v7];

  return v3;
}

- (id)_volumeSpecifiers
{
  v177 = +[NSMutableArray array];
  uint64_t v3 = +[NSMutableArray array];
  uint64_t v4 = +[NSMutableArray array];
  uint64_t v5 = +[NSMutableArray array];
  id v6 = [(HearingAidDetailController *)self device];
  unsigned int v7 = [v6 propertyIsAvailable:0x4000000000 forEar:2];

  double v8 = [(HearingAidDetailController *)self device];
  unsigned int v9 = [v8 propertyIsAvailable:0x4000000000 forEar:4];

  id v10 = [(HearingAidDetailController *)self device];
  unsigned int v11 = [v10 propertyIsAvailable:64 forEar:2];

  id v12 = [(HearingAidDetailController *)self device];
  unsigned int v168 = [v12 propertyIsAvailable:64 forEar:4];

  v13 = [(HearingAidDetailController *)self device];
  if ([v13 propertyIsAvailable:0x2000000000 forEar:2])
  {
    LODWORD(v167) = 1;
  }
  else
  {
    objc_super v14 = [(HearingAidDetailController *)self device];
    LODWORD(v167) = [v14 propertyIsAvailable:0x2000000000 forEar:4];
  }
  v15 = [(HearingAidDetailController *)self device];
  v176 = (void *)v5;
  if ([v15 propertyIsAvailable:0x1000000000 forEar:2])
  {
    LODWORD(v166) = 1;
  }
  else
  {
    v16 = [(HearingAidDetailController *)self device];
    LODWORD(v166) = [v16 propertyIsAvailable:0x1000000000 forEar:4];
  }
  v17 = [(HearingAidDetailController *)self device];
  unsigned int v165 = [v17 propertyIsAvailable:128 forEar:2];

  v18 = [(HearingAidDetailController *)self device];
  unsigned int v164 = [v18 propertyIsAvailable:128 forEar:4];

  v19 = [(HearingAidDetailController *)self device];
  unsigned int v170 = [v19 propertyIsAvailable:0x80000000 forEar:2];

  v20 = [(HearingAidDetailController *)self device];
  unsigned int v172 = [v20 propertyIsAvailable:0x80000000 forEar:4];

  v21 = [(HearingAidDetailController *)self device];
  unsigned int v22 = [v21 leftAvailable];
  v23 = [(HearingAidDetailController *)self device];
  v174 = (void *)v3;
  v175 = (void *)v4;
  if (v22 != [v23 rightAvailable] && ((v7 | v9) & 1) != 0)
  {

LABEL_10:
    v24 = +[PSSpecifier preferenceSpecifierNamed:&stru_3D6D8 target:self set:0 get:0 detail:0 cell:5 edit:0];
    [v24 setProperty:@"MasterMixedVolume" forKey:PSIDKey];
    v25 = +[NSNumber numberWithFloat:0.0];
    [v24 setProperty:v25 forKey:PSControlMinimumKey];

    LODWORD(v26) = 1.0;
    v27 = +[NSNumber numberWithFloat:v26];
    [v24 setProperty:v27 forKey:PSControlMaximumKey];

    [v24 setProperty:kCFBooleanTrue forKey:PSEnabledKey];
    [v24 setProperty:objc_opt_class() forKey:PSCellClassKey];
    v28 = [(HearingAidDetailController *)self device];
    [v24 setUserInfo:v28];
    v29 = v174;
LABEL_11:
    v30 = v177;

    [v177 addObject:v24];
    goto LABEL_26;
  }
  v31 = +[HUHearingAidSettings sharedInstance];
  if (([v31 independentHearingAidSettings] & 1) == 0)
  {
    v32 = [(HearingAidDetailController *)self device];
    if ([v32 supportsCombinedVolumes])
    {
      v33 = [(HearingAidDetailController *)self device];
      char v34 = [v33 supportsCombinedVolumesForProperty:0x4000000000] & v7 & v9;

      if (v34) {
        goto LABEL_10;
      }
      if (!v7) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  if (!v7)
  {
LABEL_21:
    v24 = 0;
    goto LABEL_22;
  }
LABEL_19:
  v35 = [(HearingAidDetailController *)self device];
  unsigned int v36 = [v35 isLeftConnected];

  if (!v36) {
    goto LABEL_21;
  }
  v24 = +[PSSpecifier preferenceSpecifierNamed:&stru_3D6D8 target:self set:0 get:0 detail:0 cell:5 edit:0];
  [v24 setProperty:@"LeftMixedVolume" forKey:PSIDKey];
  v37 = +[NSNumber numberWithFloat:0.0];
  [v24 setProperty:v37 forKey:PSControlMinimumKey];

  LODWORD(v38) = 1.0;
  v39 = +[NSNumber numberWithFloat:v38];
  [v24 setProperty:v39 forKey:PSControlMaximumKey];

  [v24 setProperty:kCFBooleanTrue forKey:PSEnabledKey];
  [v24 setProperty:objc_opt_class() forKey:PSCellClassKey];
  v40 = [(HearingAidDetailController *)self device];
  [v24 setUserInfo:v40];

  [v177 addObject:v24];
LABEL_22:
  v29 = v174;
  if (v9)
  {
    v41 = [(HearingAidDetailController *)self device];
    unsigned int v42 = [v41 isRightConnected];

    if (v42)
    {
      v43 = +[PSSpecifier preferenceSpecifierNamed:&stru_3D6D8 target:self set:0 get:0 detail:0 cell:5 edit:0];

      [v43 setProperty:@"RightMixedVolume" forKey:PSIDKey];
      v44 = +[NSNumber numberWithFloat:0.0];
      [v43 setProperty:v44 forKey:PSControlMinimumKey];

      LODWORD(v45) = 1.0;
      v46 = +[NSNumber numberWithFloat:v45];
      [v43 setProperty:v46 forKey:PSControlMaximumKey];

      [v43 setProperty:kCFBooleanTrue forKey:PSEnabledKey];
      [v43 setProperty:objc_opt_class() forKey:PSCellClassKey];
      v28 = [(HearingAidDetailController *)self device];
      [v43 setUserInfo:v28];
      v24 = v43;
      goto LABEL_11;
    }
  }
  v30 = v177;
LABEL_26:
  if ([v30 count])
  {
    v47 = hearingLocString();
    v48 = +[PSSpecifier preferenceSpecifierNamed:v47 target:self set:0 get:0 detail:0 cell:0 edit:0];

    [v48 setIdentifier:@"MixedVolumesHeading"];
    [v30 insertObject:v48 atIndex:0];
    v24 = v48;
  }
  v49 = [(HearingAidDetailController *)self device];
  unsigned int v50 = [v49 leftAvailable];
  v51 = [(HearingAidDetailController *)self device];
  if (v50 != [v51 rightAvailable] && ((v11 | v168) & 1) != 0)
  {

LABEL_31:
    v52 = +[PSSpecifier preferenceSpecifierNamed:&stru_3D6D8 target:self set:0 get:0 detail:0 cell:5 edit:0];

    [v52 setProperty:@"MasterVolume" forKey:PSIDKey];
    v53 = +[NSNumber numberWithFloat:0.0];
    [v52 setProperty:v53 forKey:PSControlMinimumKey];

    LODWORD(v54) = 1.0;
    v55 = +[NSNumber numberWithFloat:v54];
    [v52 setProperty:v55 forKey:PSControlMaximumKey];

    [v52 setProperty:kCFBooleanTrue forKey:PSEnabledKey];
    [v52 setProperty:objc_opt_class() forKey:PSCellClassKey];
    v56 = [(HearingAidDetailController *)self device];
    [v52 setUserInfo:v56];
    int v57 = (int)v167;
LABEL_32:

    [v29 addObject:v52];
    v24 = v52;
    goto LABEL_45;
  }
  v58 = +[HUHearingAidSettings sharedInstance];
  if ([v58 independentHearingAidSettings])
  {
LABEL_39:

    if (!v11) {
      goto LABEL_42;
    }
    goto LABEL_40;
  }
  v59 = [(HearingAidDetailController *)self device];
  if (![v59 supportsCombinedVolumes])
  {

    v30 = v177;
    goto LABEL_39;
  }
  v60 = [(HearingAidDetailController *)self device];
  char v61 = [v60 supportsCombinedVolumesForProperty:64] & v11 & v168;

  v30 = v177;
  if (v61) {
    goto LABEL_31;
  }
  if (v11)
  {
LABEL_40:
    v62 = [(HearingAidDetailController *)self device];
    unsigned int v63 = [v62 isLeftConnected];

    if (v63)
    {
      v64 = +[PSSpecifier preferenceSpecifierNamed:&stru_3D6D8 target:self set:0 get:0 detail:0 cell:5 edit:0];

      [v64 setProperty:@"LeftVolume" forKey:PSIDKey];
      v65 = +[NSNumber numberWithFloat:0.0];
      [v64 setProperty:v65 forKey:PSControlMinimumKey];

      LODWORD(v66) = 1.0;
      v67 = +[NSNumber numberWithFloat:v66];
      [v64 setProperty:v67 forKey:PSControlMaximumKey];

      [v64 setProperty:kCFBooleanTrue forKey:PSEnabledKey];
      [v64 setProperty:objc_opt_class() forKey:PSCellClassKey];
      v68 = [(HearingAidDetailController *)self device];
      [v64 setUserInfo:v68];

      [v29 addObject:v64];
      v24 = v64;
    }
  }
LABEL_42:
  int v57 = (int)v167;
  if (v168)
  {
    v69 = [(HearingAidDetailController *)self device];
    unsigned int v70 = [v69 isRightConnected];

    if (v70)
    {
      v52 = +[PSSpecifier preferenceSpecifierNamed:&stru_3D6D8 target:self set:0 get:0 detail:0 cell:5 edit:0];

      [v52 setProperty:@"RightVolume" forKey:PSIDKey];
      v71 = +[NSNumber numberWithFloat:0.0];
      [v52 setProperty:v71 forKey:PSControlMinimumKey];

      LODWORD(v72) = 1.0;
      v73 = +[NSNumber numberWithFloat:v72];
      [v52 setProperty:v73 forKey:PSControlMaximumKey];

      [v52 setProperty:kCFBooleanTrue forKey:PSEnabledKey];
      [v52 setProperty:objc_opt_class() forKey:PSCellClassKey];
      v56 = [(HearingAidDetailController *)self device];
      [v52 setUserInfo:v56];
      goto LABEL_32;
    }
  }
LABEL_45:
  if ([v29 count])
  {
    v74 = hearingLocString();
    v75 = +[PSSpecifier preferenceSpecifierNamed:v74 target:self set:0 get:0 detail:0 cell:0 edit:0];

    [v75 setIdentifier:@"VolumesHeading"];
    [v29 insertObject:v75 atIndex:0];
    [v30 addObjectsFromArray:v29];
    v24 = v75;
  }
  v76 = [(HearingAidDetailController *)self device];
  unsigned int v77 = [v76 leftAvailable];
  v78 = [(HearingAidDetailController *)self device];
  if (v77 != [v78 rightAvailable] && ((v170 | v172) & 1) != 0)
  {

LABEL_50:
    v79 = +[PSSpecifier preferenceSpecifierNamed:&stru_3D6D8 target:self set:0 get:0 detail:0 cell:5 edit:0];

    [v79 setProperty:@"MasterSensitivity" forKey:PSIDKey];
    v80 = +[NSNumber numberWithFloat:0.0];
    [v79 setProperty:v80 forKey:PSControlMinimumKey];

    LODWORD(v81) = 1.0;
    v82 = +[NSNumber numberWithFloat:v81];
    [v79 setProperty:v82 forKey:PSControlMaximumKey];

    [v79 setProperty:kCFBooleanTrue forKey:PSEnabledKey];
    [v79 setProperty:objc_opt_class() forKey:PSCellClassKey];
    v83 = [(HearingAidDetailController *)self device];
    [v79 setUserInfo:v83];
    v84 = v175;
LABEL_51:

    [v84 addObject:v79];
    v24 = v79;
    goto LABEL_65;
  }
  v85 = +[HUHearingAidSettings sharedInstance];
  if ([v85 independentHearingAidSettings]) {
    goto LABEL_57;
  }
  v86 = [(HearingAidDetailController *)self device];
  if (![v86 supportsCombinedVolumes])
  {

    int v57 = (int)v167;
LABEL_57:

    goto LABEL_58;
  }
  v87 = [(HearingAidDetailController *)self device];
  char v88 = [v87 supportsCombinedVolumesForProperty:0x80000000] & v170 & v172;

  int v57 = (int)v167;
  if (v88) {
    goto LABEL_50;
  }
LABEL_58:
  if (v170)
  {
    v89 = [(HearingAidDetailController *)self device];
    unsigned int v90 = [v89 isLeftConnected];

    v84 = v175;
    if (v90)
    {
      v91 = +[PSSpecifier preferenceSpecifierNamed:&stru_3D6D8 target:self set:0 get:0 detail:0 cell:5 edit:0];

      [v91 setProperty:@"LeftSensitivity" forKey:PSIDKey];
      v92 = +[NSNumber numberWithFloat:0.0];
      [v91 setProperty:v92 forKey:PSControlMinimumKey];

      LODWORD(v93) = 1.0;
      v94 = +[NSNumber numberWithFloat:v93];
      [v91 setProperty:v94 forKey:PSControlMaximumKey];

      [v91 setProperty:kCFBooleanTrue forKey:PSEnabledKey];
      [v91 setProperty:objc_opt_class() forKey:PSCellClassKey];
      v95 = [(HearingAidDetailController *)self device];
      [v91 setUserInfo:v95];

      [v175 addObject:v91];
      v24 = v91;
    }
  }
  else
  {
    v84 = v175;
  }
  if (v172)
  {
    v96 = [(HearingAidDetailController *)self device];
    unsigned int v97 = [v96 isRightConnected];

    if (v97)
    {
      v79 = +[PSSpecifier preferenceSpecifierNamed:&stru_3D6D8 target:self set:0 get:0 detail:0 cell:5 edit:0];

      [v79 setProperty:@"RightSensitivity" forKey:PSIDKey];
      v98 = +[NSNumber numberWithFloat:0.0];
      [v79 setProperty:v98 forKey:PSControlMinimumKey];

      LODWORD(v99) = 1.0;
      v100 = +[NSNumber numberWithFloat:v99];
      [v79 setProperty:v100 forKey:PSControlMaximumKey];

      [v79 setProperty:kCFBooleanTrue forKey:PSEnabledKey];
      [v79 setProperty:objc_opt_class() forKey:PSCellClassKey];
      v83 = [(HearingAidDetailController *)self device];
      [v79 setUserInfo:v83];
      goto LABEL_51;
    }
  }
LABEL_65:
  if ([v84 count])
  {
    v101 = hearingLocString();
    v102 = +[PSSpecifier preferenceSpecifierNamed:v101 target:self set:0 get:0 detail:0 cell:0 edit:0];

    [v102 setIdentifier:@"SensitivityHeading"];
    [v30 addObject:v102];
    [v30 addObjectsFromArray:v84];
    v24 = v102;
  }
  int v103 = (int)v166;
  if ((v57 | v166) == 1)
  {
    v104 = +[PSSpecifier emptyGroupSpecifier];
    [v30 addObject:v104];

    if (v57)
    {
      v105 = +[PSSpecifier preferenceSpecifierNamed:&stru_3D6D8 target:self set:0 get:0 detail:0 cell:5 edit:0];

      [v105 setProperty:@"Treble" forKey:PSIDKey];
      v106 = +[NSNumber numberWithFloat:0.0];
      [v105 setProperty:v106 forKey:PSControlMinimumKey];

      LODWORD(v107) = 1.0;
      v108 = +[NSNumber numberWithFloat:v107];
      [v105 setProperty:v108 forKey:PSControlMaximumKey];

      [v105 setProperty:kCFBooleanTrue forKey:PSEnabledKey];
      [v105 setProperty:objc_opt_class() forKey:PSCellClassKey];
      v109 = [(HearingAidDetailController *)self device];
      [v105 setUserInfo:v109];

      int v103 = (int)v166;
      [v30 addObject:v105];
      v24 = v105;
    }
    if (v103)
    {
      v110 = +[PSSpecifier preferenceSpecifierNamed:&stru_3D6D8 target:self set:0 get:0 detail:0 cell:5 edit:0];

      [v110 setProperty:@"Bass" forKey:PSIDKey];
      v111 = +[NSNumber numberWithFloat:0.0];
      [v110 setProperty:v111 forKey:PSControlMinimumKey];

      LODWORD(v112) = 1.0;
      v113 = +[NSNumber numberWithFloat:v112];
      [v110 setProperty:v113 forKey:PSControlMaximumKey];

      [v110 setProperty:kCFBooleanTrue forKey:PSEnabledKey];
      [v110 setProperty:objc_opt_class() forKey:PSCellClassKey];
      v114 = [(HearingAidDetailController *)self device];
      [v110 setUserInfo:v114];

      [v30 addObject:v110];
      v24 = v110;
    }
  }
  v115 = [(HearingAidDetailController *)self device];
  unsigned int v116 = [v115 leftAvailable];
  v117 = [(HearingAidDetailController *)self device];
  if (v116 == [v117 rightAvailable])
  {
    unsigned __int8 v121 = [(HearingAidDetailController *)self shouldShowCombinedStreamingVolume];

    if ((v121 & 1) == 0) {
      goto LABEL_99;
    }
LABEL_79:
    v122 = +[PSSpecifier preferenceSpecifierNamed:&stru_3D6D8 target:self set:0 get:0 detail:0 cell:5 edit:0];

    [v122 setProperty:@"MasterStreamVolume" forKey:PSIDKey];
    v123 = +[NSNumber numberWithFloat:0.0];
    [v122 setProperty:v123 forKey:PSControlMinimumKey];

    LODWORD(v124) = 1.0;
    v125 = +[NSNumber numberWithFloat:v124];
    [v122 setProperty:v125 forKey:PSControlMaximumKey];

    [v122 setProperty:kCFBooleanTrue forKey:PSEnabledKey];
    [v122 setProperty:objc_opt_class() forKey:PSCellClassKey];
    v126 = [(HearingAidDetailController *)self device];
    [v122 setUserInfo:v126];

    v127 = v176;
    [v176 addObject:v122];
    v128 = [(HearingAidDetailController *)self device];
    v129 = [v128 rightSelectedStreamingProgram];
    v130 = [v129 name];

    if ([(__CFString *)v130 length])
    {
      v24 = v122;
      goto LABEL_114;
    }
    v131 = [(HearingAidDetailController *)self device];
    v132 = [v131 leftSelectedStreamingProgram];
    goto LABEL_111;
  }
  v118 = [(HearingAidDetailController *)self device];
  v119 = [v118 rightSelectedStreamingProgram];
  unsigned int v120 = [v119 isSelected];
  v171 = v119;
  if (v120)
  {
    v167 = [(HearingAidDetailController *)self device];
    v166 = [v167 rightSelectedStreamingProgram];
    if ([v166 isStreamOrMixingStream])
    {
      v163 = [(HearingAidDetailController *)self device];
      if ([v163 rightAvailable] && v164)
      {

        unsigned int v173 = 1;
LABEL_97:

        goto LABEL_98;
      }
      int v169 = 1;
    }
    else
    {
      int v169 = 0;
    }
  }
  else
  {
    int v169 = 0;
  }
  v133 = [(HearingAidDetailController *)self device];
  v134 = [v133 leftSelectedStreamingProgram];
  if ([v134 isSelected])
  {
    v135 = [(HearingAidDetailController *)self device];
    v136 = [v135 leftSelectedStreamingProgram];
    if ([v136 isStreamOrMixingStream])
    {
      v162 = v118;
      v137 = [(HearingAidDetailController *)self device];
      if ([v137 leftAvailable] & v165) {
        unsigned int v173 = 1;
      }
      else {
        unsigned int v173 = [(HearingAidDetailController *)self shouldShowCombinedStreamingVolume];
      }

      v118 = v162;
    }
    else
    {
      unsigned int v173 = [(HearingAidDetailController *)self shouldShowCombinedStreamingVolume];
    }

    v29 = v174;
    v84 = v175;
    if ((v169 & 1) == 0)
    {
LABEL_96:
      v30 = v177;
      v119 = v171;
      if (!v120) {
        goto LABEL_98;
      }
      goto LABEL_97;
    }
  }
  else
  {
    unsigned int v173 = [(HearingAidDetailController *)self shouldShowCombinedStreamingVolume];

    if (!v169) {
      goto LABEL_96;
    }
  }

  v30 = v177;
  v119 = v171;
  if (v120) {
    goto LABEL_97;
  }
LABEL_98:

  if (v173) {
    goto LABEL_79;
  }
LABEL_99:
  v138 = [(HearingAidDetailController *)self device];
  if (![v138 isLeftConnected])
  {
    v130 = 0;
LABEL_106:
    v127 = v176;

    goto LABEL_107;
  }
  v139 = [(HearingAidDetailController *)self device];
  v140 = [v139 leftSelectedStreamingProgram];
  if (([v140 isStreamOrMixingStream] & 1) == 0)
  {

    v130 = 0;
    goto LABEL_105;
  }
  v141 = [(HearingAidDetailController *)self device];
  v142 = [v141 leftSelectedStreamingProgram];
  unsigned int v143 = [v142 isSelected] & v165;

  if (v143 == 1)
  {
    v144 = +[PSSpecifier preferenceSpecifierNamed:&stru_3D6D8 target:self set:0 get:0 detail:0 cell:5 edit:0];

    [v144 setProperty:@"LeftStreamVolume" forKey:PSIDKey];
    v145 = +[NSNumber numberWithFloat:0.0];
    [v144 setProperty:v145 forKey:PSControlMinimumKey];

    LODWORD(v146) = 1.0;
    v147 = +[NSNumber numberWithFloat:v146];
    [v144 setProperty:v147 forKey:PSControlMaximumKey];

    [v144 setProperty:kCFBooleanTrue forKey:PSEnabledKey];
    [v144 setProperty:objc_opt_class() forKey:PSCellClassKey];
    v148 = [(HearingAidDetailController *)self device];
    [v144 setUserInfo:v148];

    [v176 addObject:v144];
    v138 = [(HearingAidDetailController *)self device];
    v139 = [v138 leftSelectedStreamingProgram];
    v130 = [v139 name];
    v24 = v144;
    v84 = v175;
LABEL_105:

    goto LABEL_106;
  }
  v130 = 0;
  v84 = v175;
  v127 = v176;
LABEL_107:
  v131 = [(HearingAidDetailController *)self device];
  if (![v131 isRightConnected])
  {
LABEL_113:

    goto LABEL_114;
  }
  v132 = [(HearingAidDetailController *)self device];
  v149 = [v132 rightSelectedStreamingProgram];
  if (![v149 isStreamOrMixingStream])
  {
LABEL_112:

    v127 = v176;
    goto LABEL_113;
  }
  v150 = [(HearingAidDetailController *)self device];
  v151 = [v150 rightSelectedStreamingProgram];
  unsigned int v152 = [v151 isSelected] & v164;

  if (v152 == 1)
  {
    v122 = +[PSSpecifier preferenceSpecifierNamed:&stru_3D6D8 target:self set:0 get:0 detail:0 cell:5 edit:0];

    [v122 setProperty:@"RightStreamVolume" forKey:PSIDKey];
    v153 = +[NSNumber numberWithFloat:0.0];
    [v122 setProperty:v153 forKey:PSControlMinimumKey];

    LODWORD(v154) = 1.0;
    v155 = +[NSNumber numberWithFloat:v154];
    [v122 setProperty:v155 forKey:PSControlMaximumKey];

    [v122 setProperty:kCFBooleanTrue forKey:PSEnabledKey];
    [v122 setProperty:objc_opt_class() forKey:PSCellClassKey];
    v156 = [(HearingAidDetailController *)self device];
    [v122 setUserInfo:v156];

    [v176 addObject:v122];
    v131 = [(HearingAidDetailController *)self device];
    v132 = [v131 rightSelectedStreamingProgram];
    v29 = v174;
    v84 = v175;
LABEL_111:
    [v132 name];
    v149 = v130;
    v130 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v24 = v122;
    goto LABEL_112;
  }
  v29 = v174;
  v84 = v175;
  v127 = v176;
LABEL_114:
  if ([v127 count])
  {
    if (![(__CFString *)v130 length])
    {

      v130 = &stru_3D6D8;
    }
    v157 = hearingLocString();
    v158 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v157, v130);

    v159 = +[PSSpecifier preferenceSpecifierNamed:v158 target:self set:0 get:0 detail:0 cell:0 edit:0];

    [v159 setIdentifier:@"StreamHeading"];
    [v30 addObject:v159];
    [v30 addObjectsFromArray:v127];

    v24 = v159;
  }
  id v160 = v30;

  return v160;
}

- (BOOL)shouldShowCombinedStreamingVolume
{
  uint64_t v5 = [(HearingAidDetailController *)self device];
  unsigned int v6 = [v5 propertyIsAvailable:128 forEar:2];

  unsigned int v7 = [(HearingAidDetailController *)self device];
  unsigned int v8 = [v7 propertyIsAvailable:128 forEar:4];

  unsigned int v9 = [(HearingAidDetailController *)self device];
  id v10 = [v9 rightSelectedStreamingProgram];
  unsigned int v11 = [v10 ear];
  unsigned int v31 = v6;
  unsigned int v29 = v8;
  if (v11 == 6
    && ([(HearingAidDetailController *)self device],
        v2 = objc_claimAutoreleasedReturnValue(),
        [v2 leftSelectedStreamingProgram],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        [v3 ear] == 6))
  {
    unsigned int v28 = 1;
  }
  else
  {
    id v12 = [(HearingAidDetailController *)self device];
    v13 = [v12 rightSelectedStreamingProgram];
    objc_super v14 = [(HearingAidDetailController *)self device];
    v15 = [v14 leftSelectedStreamingProgram];
    unsigned int v28 = [v13 isEqual:v15];

    if (v11 != 6) {
      goto LABEL_6;
    }
  }

LABEL_6:
  v16 = +[HUHearingAidSettings sharedInstance];
  if ([v16 independentHearingAidSettings])
  {
    unsigned __int8 v17 = 0;
  }
  else
  {
    v18 = [(HearingAidDetailController *)self device];
    if ([v18 showCombinedPrograms])
    {
      v19 = [(HearingAidDetailController *)self device];
      if (([v19 supportsCombinedVolumesForProperty:128] & v31 & v29 & v28) == 1)
      {
        v20 = [(HearingAidDetailController *)self device];
        v21 = [v20 leftSelectedStreamingProgram];
        if ([v21 isStreamOrMixingStream])
        {
          unsigned int v22 = [(HearingAidDetailController *)self device];
          v23 = [v22 rightSelectedStreamingProgram];
          if ([v23 isStreamOrMixingStream])
          {
            v24 = [(HearingAidDetailController *)self device];
            v25 = [v24 leftSelectedStreamingProgram];
            if ([v25 isSelected])
            {
              v30 = [(HearingAidDetailController *)self device];
              [v30 rightSelectedStreamingProgram];
              double v26 = v32 = v24;
              unsigned __int8 v17 = [v26 isSelected];

              v24 = v32;
            }
            else
            {
              unsigned __int8 v17 = 0;
            }
          }
          else
          {
            unsigned __int8 v17 = 0;
          }
        }
        else
        {
          unsigned __int8 v17 = 0;
        }
      }
      else
      {
        unsigned __int8 v17 = 0;
      }
    }
    else
    {
      unsigned __int8 v17 = 0;
    }
  }
  return v17;
}

- (id)_leftProgramSpecifiers
{
  uint64_t v3 = [(HearingAidDetailController *)self device];
  unsigned int v4 = [v3 isLeftConnected];

  if (v4)
  {
    uint64_t v5 = [(HearingAidDetailController *)self device];
    unsigned int v6 = [v5 leftPrograms];

    if ([v6 count])
    {
      unint64_t v7 = 0;
      do
      {
        unsigned int v8 = [v6 objectAtIndexedSubscript:v7];
        [v8 setEar:2];

        ++v7;
      }
      while ((unint64_t)[v6 count] > v7);
    }
    unsigned int v9 = hearingLocString();
    id v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:0 get:0 detail:0 cell:0 edit:0];

    [v10 setIdentifier:@"LeftProgramsHeader"];
    [v10 setProperty:@"LeftProgramsHeader" forKey:PSIDKey];
  }
  else
  {
    id v10 = 0;
    unsigned int v6 = 0;
  }
  unsigned int v11 = [(HearingAidDetailController *)self programSpecsFromAvailablePrograms:v6 withGroupSpec:v10 forEar:2];

  return v11;
}

- (id)_rightProgramSpecifiers
{
  uint64_t v3 = [(HearingAidDetailController *)self device];
  unsigned int v4 = [v3 isRightConnected];

  if (v4)
  {
    uint64_t v5 = [(HearingAidDetailController *)self device];
    unsigned int v6 = [v5 rightPrograms];

    if ([v6 count])
    {
      unint64_t v7 = 0;
      do
      {
        unsigned int v8 = [v6 objectAtIndexedSubscript:v7];
        [v8 setEar:4];

        ++v7;
      }
      while ((unint64_t)[v6 count] > v7);
    }
    unsigned int v9 = hearingLocString();
    id v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:0 get:0 detail:0 cell:0 edit:0];

    [v10 setIdentifier:@"RightProgramsHeader"];
    [v10 setProperty:@"RightProgramsHeader" forKey:PSIDKey];
  }
  else
  {
    id v10 = 0;
    unsigned int v6 = 0;
  }
  unsigned int v11 = [(HearingAidDetailController *)self programSpecsFromAvailablePrograms:v6 withGroupSpec:v10 forEar:4];

  return v11;
}

- (id)_combinedProgramSpecifiers
{
  uint64_t v3 = hearingLocString();
  unsigned int v4 = +[PSSpecifier preferenceSpecifierNamed:v3 target:self set:0 get:0 detail:0 cell:0 edit:0];

  [v4 setIdentifier:@"ProgramsHeader"];
  [v4 setProperty:@"ProgramsHeader" forKey:PSIDKey];
  uint64_t v5 = [(HearingAidDetailController *)self device];
  unsigned int v6 = [v5 combinedPrograms];

  unint64_t v7 = [(HearingAidDetailController *)self programSpecsFromAvailablePrograms:v6 withGroupSpec:v4 forEar:6];

  return v7;
}

- (id)programSpecsFromAvailablePrograms:(id)a3 withGroupSpec:(id)a4 forEar:(int)a5
{
  id v6 = a3;
  id v20 = a4;
  unint64_t v7 = +[NSMutableArray array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v6;
  id v8 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v25;
    uint64_t v11 = PSCellClassKey;
    uint64_t v12 = PSEnabledKey;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(obj);
        }
        objc_super v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (![v7 count]) {
          [v7 addObject:v20];
        }
        v15 = [v14 name];
        v16 = +[PSSpecifier preferenceSpecifierNamed:v15 target:self set:0 get:0 detail:0 cell:4 edit:0];

        [v16 setProperty:objc_opt_class() forKey:v11];
        unsigned __int8 v17 = +[NSNumber numberWithBool:1];
        [v16 setProperty:v17 forKey:v12];

        v18 = +[NSNumber numberWithUnsignedInt:a5];
        [v16 setProperty:v18 forKey:@"AXHAPresetEar"];

        [v16 setUserInfo:v14];
        [v7 addObject:v16];
      }
      id v9 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v9);
  }

  return v7;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  unsigned int v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (v4) {
    goto LABEL_43;
  }
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v6 = +[AXHAServer sharedInstance];
  unsigned int v7 = [v6 hearingAidReachable];

  HAInitializeLogging();
  id v8 = [(HearingAidDetailController *)self device];
  unsigned int v9 = [v8 didLoadRequiredProperties];
  uint64_t v10 = [(HearingAidDetailController *)self device];
  uint64_t v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"(%d, %d, %d)", v9, [v10 isPaired], v7);

  uint64_t v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %@", "-[HearingAidDetailController specifiers]", 678, v11);
  v13 = (void *)HAEngineeringLog;
  if (os_log_type_enabled(HAEngineeringLog, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = v12;
    v15 = v13;
    *(_DWORD *)buf = 136446210;
    id v71 = [v14 UTF8String];
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v16 = [(HearingAidDetailController *)self device];
  unsigned __int8 v17 = &AXFormatFloatWithPercentage_ptr;
  if (![v16 didLoadRequiredProperties]) {
    goto LABEL_9;
  }
  v18 = [(HearingAidDetailController *)self device];
  if (![v18 isPaired])
  {

LABEL_9:
    goto LABEL_10;
  }
  if (!v7)
  {
    double v38 = [(HearingAidDetailController *)self device];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      goto LABEL_26;
    }
LABEL_10:
    v19 = [(HearingAidDetailController *)self disconnectedSpecifiers];
    [v5 addObjectsFromArray:v19];
LABEL_11:

    goto LABEL_12;
  }

LABEL_26:
  v40 = [(HearingAidDetailController *)self deviceSpecifiers];
  [v5 addObjectsFromArray:v40];

  v41 = [(HearingAidDetailController *)self _volumeSpecifiers];
  [v5 addObjectsFromArray:v41];

  unsigned int v42 = [(HearingAidDetailController *)self _programSpecifiers];
  [v5 addObjectsFromArray:v42];

  if (self->_hearingAidStreamAvailable)
  {
    v43 = [sub_13F3C() server];
    unsigned __int8 v44 = [v43 hasActiveOrPendingCallOrFaceTime];

    if ((v44 & 1) == 0)
    {
      v19 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:0 edit:0];
      +[HCUtilities deviceIsPad];
      v69 = hearingLocString();
      objc_msgSend(v19, "setProperty:forKey:");
      [v5 addObject:v19];
      double v45 = hearingLocString();
      if (self->_isLiveListening)
      {
        uint64_t v46 = hearingLocString();

        double v45 = (void *)v46;
      }
      v47 = +[PSSpecifier preferenceSpecifierNamed:v45 target:self set:0 get:0 detail:0 cell:13 edit:0];
      [v47 setButtonAction:"liveListenToggle:"];
      [v47 setProperty:@"LiveListenButtonCell" forKey:PSKeyNameKey];
      v48 = [sub_13F3C() server];
      uint64_t v49 = [v48 isContinuitySessionActive] ^ 1;

      unsigned int v50 = +[NSNumber numberWithBool:v49];
      [v47 setProperty:v50 forKey:PSEnabledKey];

      [v5 addObject:v47];
      [(HearingAidDetailController *)self pauseSoundRecognitionIfNecessary];
      if (self->_isLiveListening)
      {
        v51 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:-1 edit:0];
        [v51 setProperty:objc_opt_class() forKey:PSCellClassKey];
        [v51 setIdentifier:@"LiveListeningCell"];
        [v5 addObject:v51];
      }
      unsigned __int8 v17 = &AXFormatFloatWithPercentage_ptr;
      goto LABEL_11;
    }
  }
LABEL_12:
  id v20 = [(HearingAidDetailController *)self device];
  unsigned int v21 = [v20 isPaired];
  if ((v21 ^ 1 | v7))
  {
    unsigned int v22 = v21;

    if (!v22) {
      goto LABEL_37;
    }
LABEL_16:
    v68 = +[PSSpecifier emptyGroupSpecifier];
    objc_msgSend(v5, "insertObject:atIndex:");
    long long v25 = [(HearingAidDetailController *)self device];
    unsigned int v26 = [v25 rightAvailable];

    if (v26)
    {
      long long v27 = hearingSettingsLocString(@"HearingAidStreamToggleRight", @"HearingAidDetailSettings");
      unsigned int v28 = +[PSSpecifier preferenceSpecifierNamed:v27 target:self set:"setShouldStream:specifier:" get:"shouldStream:" detail:0 cell:6 edit:0];

      [v28 setProperty:&off_3FF60 forKey:@"ear"];
      [v28 setProperty:@"RightStream" forKey:PSIDKey];
      [v5 insertObject:v28 atIndex:2];

      uint64_t v29 = 3;
    }
    else
    {
      uint64_t v29 = 2;
    }
    v30 = [(HearingAidDetailController *)self device];
    unsigned int v31 = [v30 leftAvailable];

    if (v31)
    {
      v32 = hearingSettingsLocString(@"HearingAidStreamToggleLeft", @"HearingAidDetailSettings");
      v33 = +[PSSpecifier preferenceSpecifierNamed:v32 target:self set:"setShouldStream:specifier:" get:"shouldStream:" detail:0 cell:6 edit:0];

      [v33 setProperty:&off_3FF78 forKey:@"ear"];
      [v33 setProperty:@"LeftStream" forKey:PSIDKey];
      [v5 insertObject:v33 atIndex:v29];

      ++v29;
    }
    char v34 = [(HearingAidDetailController *)self device];
    if (![v34 leftAvailable]) {
      goto LABEL_35;
    }
    v35 = [(HearingAidDetailController *)self device];
    unsigned int v36 = [v35 rightAvailable];

    if (v36)
    {
      v37 = [(HearingAidDetailController *)self device];
      if ([v37 supportsCombinedPresets])
      {

LABEL_34:
        double v54 = hearingSettingsLocString(@"HearingAidIndependenceTitle", @"HearingAidDetailSettings");
        char v34 = +[PSSpecifier preferenceSpecifierNamed:v54 target:self set:"setIndependentAids:specifier:" get:"independentAids:" detail:0 cell:6 edit:0];

        [v34 setIdentifier:@"Independence"];
        [v5 insertObject:v34 atIndex:v29];
LABEL_35:

        goto LABEL_36;
      }
      v52 = [(HearingAidDetailController *)self device];
      unsigned int v53 = [v52 supportsCombinedVolumes];

      if (v53) {
        goto LABEL_34;
      }
    }
LABEL_36:

    goto LABEL_37;
  }
  v23 = [(HearingAidDetailController *)self device];
  objc_opt_class();
  char v24 = objc_opt_isKindOfClass();

  if (v24) {
    goto LABEL_16;
  }
LABEL_37:
  if ([v17[155] isInternalInstall])
  {
    v55 = +[PSSpecifier emptyGroupSpecifier];
    [v5 addObject:v55];
    v56 = hearingSettingsLocString(@"AdvancedSettingsTitle", @"HearingAidDetailSettings");
    int v57 = +[PSSpecifier preferenceSpecifierNamed:v56 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

    [v57 setIdentifier:@"AdvancedSettings"];
    v58 = [(HearingAidDetailController *)self device];
    [v57 setUserInfo:v58];

    [v5 addObject:v57];
  }
  if (self->_bluetoothAvailable)
  {
    v59 = [(HearingAidDetailController *)self device];
    unsigned int v60 = [v59 isPaired];

    if (v60)
    {
      char v61 = +[PSSpecifier emptyGroupSpecifier];
      [v5 addObject:v61];
      v62 = hearingSettingsLocString(@"ForgetHearingAidTitle", @"HearingAidDetailSettings");
      unsigned int v63 = +[PSSpecifier preferenceSpecifierNamed:v62 target:self set:0 get:0 detail:0 cell:13 edit:0];

      [v63 setButtonAction:"forgetAid:"];
      [v5 addObject:v63];
    }
  }
  v64 = *(void **)&self->PSListController_opaque[v3];
  *(void *)&self->PSListController_opaque[v3] = v5;

  v65 = [(HearingAidDetailController *)self device];
  double v66 = [v65 name];
  [(HearingAidDetailController *)self setTitle:v66];

  unsigned int v4 = *(void **)&self->PSListController_opaque[v3];
LABEL_43:

  return v4;
}

- (void)_updateLiveListenButtonForOneness
{
  id v6 = [(HearingAidDetailController *)self specifierForID:@"LiveListenButtonCell"];
  uint64_t v3 = [sub_13F3C() server];
  uint64_t v4 = [v3 isContinuitySessionActive] ^ 1;

  id v5 = +[NSNumber numberWithBool:v4];
  [v6 setProperty:v5 forKey:PSEnabledKey];

  [(HearingAidDetailController *)self reloadSpecifier:v6];
}

- (void)selectCommonProgramsForLeftAndRightDevices
{
  uint64_t v3 = [(HearingAidDetailController *)self device];
  unsigned int v4 = [v3 showCombinedPrograms];

  if (v4)
  {
    id v5 = [(HearingAidDetailController *)self device];
    id v6 = [v5 leftSelectedProgram];

    unsigned int v7 = [(HearingAidDetailController *)self device];
    id v8 = [v7 rightSelectedProgram];

    unsigned int v9 = [(HearingAidDetailController *)self device];
    id v10 = [v9 leftSelectedStreamingProgram];

    uint64_t v11 = [(HearingAidDetailController *)self device];
    uint64_t v12 = [v11 rightSelectedStreamingProgram];

    LODWORD(v11) = [v6 index];
    if (v11 != [v8 index]
      || (unsigned int v13 = [v10 index], v13 != objc_msgSend(v12, "index")))
    {
      uint64_t v43 = 0;
      unsigned __int8 v44 = &v43;
      uint64_t v45 = 0x2020000000;
      char v46 = 0;
      uint64_t v39 = 0;
      v40 = &v39;
      uint64_t v41 = 0x2020000000;
      char v42 = 0;
      id v14 = [(HearingAidDetailController *)self device];
      v15 = [v14 rightPrograms];
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_14418;
      v31[3] = &unk_3CB60;
      v37 = &v39;
      id v16 = v6;
      id v32 = v16;
      id v17 = v8;
      id v33 = v17;
      char v34 = self;
      double v38 = &v43;
      id v18 = v22;
      id v35 = v18;
      id v19 = v12;
      id v36 = v19;
      [v15 enumerateObjectsUsingBlock:v31];

      *((unsigned char *)v44 + 24) = 0;
      *((unsigned char *)v40 + 24) = 0;
      id v20 = [(HearingAidDetailController *)self device];
      unsigned int v21 = [v20 leftPrograms];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_14580;
      v23[3] = &unk_3CB60;
      uint64_t v29 = &v39;
      id v24 = v17;
      id v25 = v16;
      unsigned int v26 = self;
      v30 = &v43;
      id v27 = v19;
      id v28 = v18;
      [v21 enumerateObjectsUsingBlock:v23];

      _Block_object_dispose(&v39, 8);
      _Block_object_dispose(&v43, 8);
      id v10 = v22;
    }
  }
}

- (void)updateView
{
  uint64_t v3 = [(HearingAidDetailController *)self device];
  unsigned int v4 = [v3 didLoadRequiredProperties];

  if (v4)
  {
    id v5 = [(HearingAidDetailController *)self device];
    [v5 setKeepInSync:1];

    uint64_t v6 = OBJC_IVAR___PSListController__specifiers;
    id v7 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] count];
    id v8 = [(HearingAidDetailController *)self device];
    unsigned int v9 = [v8 availableEars];
    unint64_t v10 = 3;
    if (v9 == 6) {
      unint64_t v10 = 6;
    }
    if ((unint64_t)v7 <= v10)
    {
    }
    else
    {
      uint64_t v11 = +[AXHAServer sharedInstance];
      unsigned __int8 v12 = [v11 hearingAidReachable];

      if (v12)
      {
        id v13 = [(HearingAidDetailController *)self indexOfSpecifierID:@"ProgramsHeader"];
        id v14 = [(HearingAidDetailController *)self indexOfSpecifierID:@"RightProgramsHeader"];
        id v15 = [(HearingAidDetailController *)self indexOfSpecifierID:@"LeftProgramsHeader"];
        id v16 = [(HearingAidDetailController *)self device];
        unsigned int v17 = [v16 showCombinedPrograms];

        if (v17 && v13 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          id v18 = [(HearingAidDetailController *)self _combinedProgramSpecifiers];
LABEL_9:
          [(HearingAidDetailController *)self _updatePrograms:v18];
LABEL_10:

LABEL_25:
          [(HearingAidDetailController *)self reloadSpecifierID:@"DetailCell"];
          long long v35 = 0u;
          long long v36 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          id v22 = *(id *)&self->PSListController_opaque[v6];
          id v23 = [v22 countByEnumeratingWithState:&v33 objects:v37 count:16];
          if (v23)
          {
            id v24 = v23;
            uint64_t v25 = *(void *)v34;
            uint64_t v26 = PSTableCellKey;
            do
            {
              for (i = 0; i != v24; i = (char *)i + 1)
              {
                if (*(void *)v34 != v25) {
                  objc_enumerationMutation(v22);
                }
                id v28 = *(void **)(*((void *)&v33 + 1) + 8 * i);
                if (v28)
                {
                  uint64_t v29 = [*(id *)(*((void *)&v33 + 1) + 8 * i) propertyForKey:v26];
                  objc_opt_class();
                  char isKindOfClass = objc_opt_isKindOfClass();

                  if (isKindOfClass)
                  {
                    unsigned int v31 = [v28 propertyForKey:v26];
                    [v31 updateValue];
                  }
                }
              }
              id v24 = [v22 countByEnumeratingWithState:&v33 objects:v37 count:16];
            }
            while (v24);
          }

          return;
        }
        id v19 = [(HearingAidDetailController *)self device];
        if (([v19 showCombinedPrograms] & 1) != 0 || v15 == (id)0x7FFFFFFFFFFFFFFFLL)
        {
        }
        else
        {

          if (v14 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            id v18 = +[NSMutableArray array];
            id v20 = [(HearingAidDetailController *)self _leftProgramSpecifiers];
            [v18 addObjectsFromArray:v20];

            unsigned int v21 = [(HearingAidDetailController *)self _rightProgramSpecifiers];
            [v18 addObjectsFromArray:v21];

            if (![v18 count]) {
              goto LABEL_10;
            }
            goto LABEL_9;
          }
        }
        [(HearingAidDetailController *)self reloadSpecifiers];
        goto LABEL_25;
      }
    }
    [(HearingAidDetailController *)self reloadSpecifiers];
  }
  else
  {
    [(HearingAidDetailController *)self reloadSpecifiers];
    id v32 = [(HearingAidDetailController *)self device];
    [v32 loadRequiredProperties];
  }
}

- (void)_updatePrograms:(id)a3
{
  id v4 = a3;
  id v5 = [(HearingAidDetailController *)self programsRange];
  id v7 = v6;
  if ([v4 count] == v6)
  {
    id v8 = [(HearingAidDetailController *)self device];
    unsigned int v9 = [v8 selectedPrograms];

    unint64_t v10 = objc_msgSend(*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers], "subarrayWithRange:", v5, v7);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_14C08;
    v12[3] = &unk_3CB88;
    id v13 = v9;
    id v14 = self;
    id v11 = v9;
    [v10 enumerateObjectsUsingBlock:v12];
  }
  else
  {
    -[HearingAidDetailController updateSpecifiersInRange:withSpecifiers:](self, "updateSpecifiersInRange:withSpecifiers:", v5, v7, v4);
  }
}

- (_NSRange)programRangeForPresetId:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  id v6 = [(HearingAidDetailController *)self specifierForID:v4];

  if (v6)
  {
    uint64_t v23 = -1;
    [(HearingAidDetailController *)self getGroup:&v23 row:0 ofSpecifier:v6];
    if (v23 != -1)
    {
      id v7 = -[HearingAidDetailController specifiersInGroup:](self, "specifiersInGroup:");
      [v5 addObjectsFromArray:v7];
    }
  }
  id v8 = [(HearingAidDetailController *)self specifiers];
  unsigned int v9 = (char *)[v8 count] - 2;

  if ((unint64_t)[v5 count] < 2)
  {
    NSUInteger v20 = 0;
  }
  else
  {
    uint64_t v10 = OBJC_IVAR___PSListController__specifiers;
    id v11 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
    unsigned __int8 v12 = [v5 objectAtIndex:0];
    id v13 = (char *)[v11 indexOfObject:v12];

    id v14 = *(void **)&self->PSListController_opaque[v10];
    id v15 = [v5 lastObject];
    id v16 = (char *)[v14 indexOfObject:v15];

    BOOL v18 = v13 != (char *)0x7FFFFFFFFFFFFFFFLL && v16 != (char *)0x7FFFFFFFFFFFFFFFLL;
    BOOL v19 = (uint64_t)v16 > (uint64_t)v13;
    if (v18 && v19) {
      NSUInteger v20 = v16 - v13;
    }
    else {
      NSUInteger v20 = 0;
    }
    if (v18 && v19) {
      unsigned int v9 = v13;
    }
  }

  NSUInteger v21 = (NSUInteger)v9;
  NSUInteger v22 = v20;
  result.length = v22;
  result.location = v21;
  return result;
}

- (_NSRange)programsRange
{
  uint64_t v3 = [(HearingAidDetailController *)self specifierForID:@"AdvancedSettings"];

  if (v3) {
    uint64_t v4 = -6;
  }
  else {
    uint64_t v4 = -4;
  }
  uint64_t v17 = 0;
  BOOL v18 = &v17;
  uint64_t v19 = 0x3010000000;
  NSUInteger v21 = 0;
  uint64_t v22 = 0;
  NSUInteger v20 = &unk_39B73;
  uint64_t v5 = OBJC_IVAR___PSListController__specifiers;
  NSUInteger v21 = (char *)[*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] count]
      + v4;
  uint64_t v22 = 0;
  id v6 = +[NSArray arrayWithObjects:@"ProgramsHeader", @"LeftProgramsHeader", @"RightProgramsHeader", 0];
  id v7 = [objc_alloc((Class)PSSpecifierGroupIndex) initWithSpecifiers:*(void *)&self->PSListController_opaque[v5]];
  id v8 = [(HearingAidDetailController *)self specifiersForIDs:v6];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_15014;
  v14[3] = &unk_3CBB0;
  v14[4] = self;
  id v9 = v7;
  id v15 = v9;
  id v16 = &v17;
  [v8 enumerateObjectsUsingBlock:v14];
  NSUInteger v10 = v18[4];
  NSUInteger v11 = v18[5];

  _Block_object_dispose(&v17, 8);
  NSUInteger v12 = v10;
  NSUInteger v13 = v11;
  result.length = v13;
  result.location = v12;
  return result;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)HearingAidDetailController;
  id v6 = a4;
  [(HearingAidDetailController *)&v14 tableView:a3 didSelectRowAtIndexPath:v6];
  id v7 = -[HearingAidDetailController indexForIndexPath:](self, "indexForIndexPath:", v6, v14.receiver, v14.super_class);

  if (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndex:v7];
    id v9 = [v8 userInfo];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      NSUInteger v11 = [v8 userInfo];
      objc_msgSend(v11, "setIsSelected:", objc_msgSend(v11, "isSelected") ^ 1);
      NSUInteger v12 = [(HearingAidDetailController *)self device];
      NSUInteger v13 = [v8 propertyForKey:@"AXHAPresetEar"];
      objc_msgSend(v12, "selectProgram:forEar:", v11, objc_msgSend(v13, "intValue"));

      [(HearingAidDetailController *)self _reloadProgramSpecifiers];
    }
  }
}

- (void)_reloadProgramSpecifiers
{
  uint64_t v3 = [(HearingAidDetailController *)self device];
  unsigned int v4 = [v3 showCombinedPrograms];

  if (v4)
  {
    id v5 = [(HearingAidDetailController *)self programsRange];
    uint64_t v7 = v6;
    id v8 = [(HearingAidDetailController *)self specifiers];
    id v9 = objc_msgSend(v8, "subarrayWithRange:", v5, v7);
    NSUInteger v10 = v9;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1542C;
    v22[3] = &unk_3CBD8;
    v22[4] = self;
    NSUInteger v11 = v22;
  }
  else
  {
    id v12 = [(HearingAidDetailController *)self programRangeForPresetId:@"LeftProgramsHeader"];
    uint64_t v14 = v13;
    id v15 = [(HearingAidDetailController *)self specifiers];
    id v16 = objc_msgSend(v15, "subarrayWithRange:", v12, v14);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_15438;
    v21[3] = &unk_3CBD8;
    v21[4] = self;
    [v16 enumerateObjectsUsingBlock:v21];

    id v17 = [(HearingAidDetailController *)self programRangeForPresetId:@"RightProgramsHeader"];
    uint64_t v19 = v18;
    id v8 = [(HearingAidDetailController *)self specifiers];
    id v9 = objc_msgSend(v8, "subarrayWithRange:", v17, v19);
    NSUInteger v10 = v9;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_15444;
    v20[3] = &unk_3CBD8;
    v20[4] = self;
    NSUInteger v11 = v20;
  }
  [v9 enumerateObjectsUsingBlock:v11];
}

- (id)specifierForKey:(id)a3
{
  id v4 = a3;
  [(HearingAidDetailController *)self specifiers];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    uint64_t v9 = PSKeyNameKey;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        NSUInteger v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "propertyForKey:", v9, (void)v16);
        unsigned int v13 = [v12 isEqualToString:v4];

        if (v13)
        {
          id v14 = v11;
          goto LABEL_11;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_11:

  return v14;
}

- (void)updateLiveListenWithState:(BOOL)a3 andLevel:(double)a4
{
  if (self->_isLiveListening != a3) {
    AXPerformBlockOnMainThread();
  }
}

- (void)updateLiveListenCell:(id)a3
{
  id v10 = a3;
  BOOL isLiveListening = self->_isLiveListening;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isLiveListening)
  {
    if (isKindOfClass)
    {
      id v6 = hearingLocString();
      [v10 setName:v6];

      [(HearingAidDetailController *)self reloadSpecifier:v10];
      id v7 = [(HearingAidDetailController *)self specifierForID:@"LiveListeningCell"];

      if (!v7)
      {
        uint64_t v8 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:-1 edit:0];
        [v8 setProperty:objc_opt_class() forKey:PSCellClassKey];
        [v8 setIdentifier:@"LiveListeningCell"];
        [(HearingAidDetailController *)self insertSpecifier:v8 afterSpecifier:v10 animated:0];
      }
    }
  }
  else if (isKindOfClass)
  {
    uint64_t v9 = hearingLocString();
    [v10 setName:v9];

    [(HearingAidDetailController *)self reloadSpecifier:v10];
    [(HearingAidDetailController *)self removeSpecifierID:@"LiveListeningCell" animated:0];
  }

  _objc_release_x1();
}

- (void)liveListenToggle:(id)a3
{
  BOOL isLiveListening = self->_isLiveListening;
  id v8 = a3;
  id v5 = +[AXHAServer sharedInstance];
  id v6 = v5;
  if (isLiveListening)
  {
    [v5 stopLiveListen];
    BOOL v7 = 0;
  }
  else
  {
    [v5 startLiveListen];
    BOOL v7 = 1;
  }

  self->_BOOL isLiveListening = v7;
  [(HearingAidDetailController *)self updateLiveListenCell:v8];
}

- (void)setIndependentAids:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v6 = +[HUHearingAidSettings sharedInstance];
  id v7 = [v5 BOOLValue];

  [v6 setIndependentHearingAidSettings:v7];
  [(HearingAidDetailController *)self selectCommonProgramsForLeftAndRightDevices];
  [(HearingAidDetailController *)self reloadSpecifiers];

  [(HearingAidDetailController *)self updateView];
}

- (id)independentAids:(id)a3
{
  uint64_t v3 = +[HUHearingAidSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 independentHearingAidSettings]);

  return v4;
}

- (void)setShouldStream:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = [a4 propertyForKey:@"ear"];
  unsigned int v8 = [v7 intValue];

  HAInitializeLogging();
  unsigned int v9 = [v6 BOOLValue];
  CFStringRef v10 = @"Disabling";
  if (v9) {
    CFStringRef v10 = @"Enabling";
  }
  CFStringRef v11 = @"right";
  if (v8 == 2) {
    CFStringRef v11 = @"left";
  }
  id v12 = +[NSString stringWithFormat:@"%@ streaming to %@ ear", v10, v11];
  unsigned int v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %@", "-[HearingAidDetailController setShouldStream:specifier:]", 1145, v12);
  id v14 = (void *)HAEngineeringLog;
  if (os_log_type_enabled(HAEngineeringLog, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = v13;
    long long v16 = v14;
    *(_DWORD *)buf = 136446210;
    id v26 = [v15 UTF8String];
    _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  if (v8 == 2)
  {
    long long v17 = +[HUHearingAidSettings sharedInstance];
    objc_msgSend(v17, "setShouldStreamToLeftAid:", objc_msgSend(v6, "BOOLValue"));

    long long v18 = [(HearingAidDetailController *)self device];
    if ((supportsBinauralStreamingForHearingAid() & 1) == 0)
    {
      unsigned int v19 = [v6 BOOLValue];

      if (!v19) {
        goto LABEL_16;
      }
      long long v18 = +[HUHearingAidSettings sharedInstance];
      [v18 setShouldStreamToRightAid:0];
    }
  }
  else
  {
    if (v8 != 4) {
      goto LABEL_16;
    }
    NSUInteger v20 = +[HUHearingAidSettings sharedInstance];
    objc_msgSend(v20, "setShouldStreamToRightAid:", objc_msgSend(v6, "BOOLValue"));

    long long v18 = [(HearingAidDetailController *)self device];
    if ((supportsBinauralStreamingForHearingAid() & 1) == 0)
    {
      unsigned int v21 = [v6 BOOLValue];

      if (!v21) {
        goto LABEL_16;
      }
      long long v18 = +[HUHearingAidSettings sharedInstance];
      [v18 setShouldStreamToLeftAid:0];
    }
  }

LABEL_16:
  uint64_t v22 = +[HUHearingAidSettings sharedInstance];
  if ([v22 shouldStreamToLeftAid])
  {
LABEL_19:

    goto LABEL_20;
  }
  uint64_t v23 = +[HUHearingAidSettings sharedInstance];
  unsigned __int8 v24 = [v23 shouldStreamToRightAid];

  if ((v24 & 1) == 0)
  {
    uint64_t v22 = +[AXHAServer sharedInstance];
    [v22 stopLiveListen];
    goto LABEL_19;
  }
LABEL_20:
}

- (id)shouldStream:(id)a3
{
  uint64_t v3 = [a3 propertyForKey:@"ear"];
  unsigned int v4 = [v3 intValue];

  if (v4 == 4)
  {
    id v5 = +[HUHearingAidSettings sharedInstance];
    id v6 = [v5 shouldStreamToRightAid];
    goto LABEL_5;
  }
  if (v4 == 2)
  {
    id v5 = +[HUHearingAidSettings sharedInstance];
    id v6 = [v5 shouldStreamToLeftAid];
LABEL_5:
    uint64_t v7 = (uint64_t)v6;

    goto LABEL_7;
  }
  uint64_t v7 = 1;
LABEL_7:

  return +[NSNumber numberWithBool:v7];
}

- (void)confirmationViewAcceptedForSpecifier:(id)a3
{
  unsigned int v4 = +[HUHearingAidSettings sharedInstance];
  [v4 setShouldStreamToRightAid:1];

  id v5 = +[HUHearingAidSettings sharedInstance];
  [v5 setShouldStreamToLeftAid:1];

  id v6 = +[HUHearingAidSettings sharedInstance];
  [v6 setPairedHearingAids:0];

  id v8 = [(HearingAidDetailController *)self navigationController];
  id v7 = [v8 popViewControllerAnimated:1];
}

- (void)forgetAid:(id)a3
{
  id v9 = objc_alloc_init((Class)PSConfirmationSpecifier);
  unsigned int v4 = hearingSettingsLocString(@"ForgetHearingAidOK", @"HearingAidDetailSettings");
  [v9 setTitle:v4];

  id v5 = hearingSettingsLocString(@"ForgetHearingAidPrompt", @"HearingAidDetailSettings");
  [v9 setPrompt:v5];

  id v6 = hearingSettingsLocString(@"ForgetHearingAidCancel", @"HearingAidDetailSettings");
  [v9 setCancelButton:v6];

  id v7 = hearingSettingsLocString(@"ForgetHearingAidOK", @"HearingAidDetailSettings");
  [v9 setOkButton:v7];

  id v8 = +[NSNumber numberWithBool:1];
  [v9 setProperty:v8 forKey:PSConfirmationDestructiveKey];

  [(HearingAidDetailController *)self showConfirmationViewForSpecifier:v9];
}

- (void)pauseSoundRecognitionIfNecessary
{
  uint64_t v3 = +[AXSDSettings sharedInstance];
  unsigned int v4 = (char *)[v3 soundDetectionState];

  if (v4 == (unsigned char *)&dword_0 + 2)
  {
    id v5 = AXLogUltron();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Pausing Sound Recognition for Live Listen UI", v7, 2u);
    }

    id v6 = +[AXSDSettings sharedInstance];
    [v6 setSoundDetectionState:1];

    self->_pausedSoundRecognition = 1;
  }
}

- (void)restartSoundRecognitionIfNecessary
{
  if (self->_pausedSoundRecognition)
  {
    uint64_t v3 = +[AXSDSettings sharedInstance];
    unsigned int v4 = (char *)[v3 soundDetectionState];

    if (v4 == (unsigned char *)&dword_0 + 1)
    {
      id v5 = AXLogUltron();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v7 = 0;
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Resuming Sound Recognition for Live Listen UI", v7, 2u);
      }

      id v6 = +[AXSDSettings sharedInstance];
      [v6 setSoundDetectionState:2];

      self->_pausedSoundRecognition = 0;
    }
  }
}

- (AXRemoteHearingAidDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (NSTimer)hysteresisTimer
{
  return self->_hysteresisTimer;
}

- (void)setHysteresisTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hysteresisTimer, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end