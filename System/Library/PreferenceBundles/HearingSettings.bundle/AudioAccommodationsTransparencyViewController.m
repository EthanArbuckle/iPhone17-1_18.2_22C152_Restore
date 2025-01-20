@interface AudioAccommodationsTransparencyViewController
- (AudioAccommodationsTransparencyViewController)init;
- (BOOL)displayingInEnrollment;
- (id)beamformingEnabled:(id)a3;
- (id)customTransparencyEnabled:(id)a3;
- (id)specifiers;
- (id)transparencyAmplification:(id)a3;
- (id)transparencyBalance:(id)a3;
- (id)transparencyDeviceAddress;
- (id)transparencyListeningMode;
- (id)transparencyNoiseSuppression:(id)a3;
- (id)transparencyTone:(id)a3;
- (void)headphoneStateChangedNotification:(id)a3;
- (void)mediaServerDied;
- (void)registerNotifications;
- (void)setBeamformingEnabled:(id)a3 specifier:(id)a4;
- (void)setCustomTransparencyEnabled:(id)a3 specifier:(id)a4;
- (void)setDisplayingInEnrollment:(BOOL)a3;
- (void)setTransparencyAmplification:(id)a3 specifier:(id)a4;
- (void)setTransparencyBalance:(id)a3 specifier:(id)a4;
- (void)setTransparencyNoiseSuppression:(id)a3 specifier:(id)a4;
- (void)setTransparencyTone:(id)a3 specifier:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)willBecomeActive;
@end

@implementation AudioAccommodationsTransparencyViewController

- (AudioAccommodationsTransparencyViewController)init
{
  v11.receiver = self;
  v11.super_class = (Class)AudioAccommodationsTransparencyViewController;
  v2 = [(AudioAccommodationsTransparencyViewController *)&v11 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = +[PASettings sharedInstance];
    v5 = _NSConcreteStackBlock;
    uint64_t v6 = 3221225472;
    v7 = sub_B588;
    v8 = &unk_3C970;
    objc_copyWeak(&v9, &location);
    [v3 registerUpdateBlock:&v5 forRetrieveSelector:"transparencyCustomized" withListener:v2];

    [(AudioAccommodationsTransparencyViewController *)v2 registerNotifications];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)registerNotifications
{
  v3 = +[AVSystemController sharedAVSystemController];
  v14[0] = AVSystemController_HeadphoneJackIsConnectedDidChangeNotification;
  v14[1] = AVSystemController_ActiveAudioRouteDidChangeNotification;
  v14[2] = AVSystemController_ServerConnectionDiedNotification;
  v4 = +[NSArray arrayWithObjects:v14 count:3];
  [v3 setAttribute:v4 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];

  v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"headphoneStateChangedNotification:" name:AVSystemController_HeadphoneJackIsConnectedDidChangeNotification object:0];

  uint64_t v6 = +[NSNotificationCenter defaultCenter];
  v7 = +[AVAudioSession sharedInstance];
  [v6 addObserver:self selector:"headphoneStateChangedNotification:" name:AVAudioSessionRouteChangeNotification object:v7];

  v8 = +[NSNotificationCenter defaultCenter];
  uint64_t v9 = AVSystemController_ActiveAudioRouteDidChangeNotification;
  v10 = +[AVSystemController sharedAVSystemController];
  [v8 addObserver:self selector:"headphoneStateChangedNotification:" name:v9 object:v10];

  objc_super v11 = +[NSNotificationCenter defaultCenter];
  uint64_t v12 = AVSystemController_ServerConnectionDiedNotification;
  v13 = +[AVSystemController sharedAVSystemController];
  [v11 addObserver:self selector:"mediaServerDied" name:v12 object:v13];
}

- (void)mediaServerDied
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [(AudioAccommodationsTransparencyViewController *)self performSelector:"registerNotifications" withObject:0 afterDelay:2.0];

  [(AudioAccommodationsTransparencyViewController *)self headphoneStateChangedNotification:0];
}

- (void)headphoneStateChangedNotification:(id)a3
{
}

- (void)willBecomeActive
{
  v3.receiver = self;
  v3.super_class = (Class)AudioAccommodationsTransparencyViewController;
  [(AudioAccommodationsTransparencyViewController *)&v3 willBecomeActive];
  [(AudioAccommodationsTransparencyViewController *)self reloadSpecifiers];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AudioAccommodationsTransparencyViewController;
  [(AudioAccommodationsTransparencyViewController *)&v4 viewDidAppear:a3];
  [(AudioAccommodationsTransparencyViewController *)self reloadSpecifiers];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  objc_super v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    if (self->_displayingInEnrollment)
    {
      v5 = [(AudioAccommodationsTransparencyViewController *)self table];
      uint64_t v6 = +[UIColor clearColor];
      [v5 setBackgroundColor:v6];

      v7 = [(AudioAccommodationsTransparencyViewController *)self view];
      v8 = +[UIColor clearColor];
      [v7 setBackgroundColor:v8];
    }
    id v9 = [objc_allocWithZone((Class)NSMutableArray) init];
    v10 = +[PASettings sharedInstance];
    objc_super v11 = [(AudioAccommodationsTransparencyViewController *)self transparencyDeviceAddress];
    unsigned int v12 = [v10 transparencyCustomizedForAddress:v11];

    if (self->_displayingInEnrollment)
    {
      v13 = 0;
      v60 = 0;
      if (!v12) {
        goto LABEL_14;
      }
    }
    else
    {
      v14 = +[PSSpecifier emptyGroupSpecifier];
      v15 = paLocString();
      [v14 setProperty:v15 forKey:PSFooterTextGroupKey];

      v60 = v14;
      [v9 addObject:v14];
      v16 = paLocString();
      v13 = +[PSSpecifier preferenceSpecifierNamed:v16 target:self set:"setCustomTransparencyEnabled:specifier:" get:"customTransparencyEnabled:" detail:0 cell:6 edit:0];

      [v9 addObject:v13];
      if (!v12)
      {
LABEL_14:
        id v52 = [v9 copy];
        v53 = *(void **)&self->PSListController_opaque[v3];
        *(void *)&self->PSListController_opaque[v3] = v52;

        objc_super v4 = *(void **)&self->PSListController_opaque[v3];
        goto LABEL_15;
      }
    }
    v17 = paLocString();
    v18 = +[PSSpecifier groupSpecifierWithName:v17];

    [v9 addObject:v18];
    uint64_t v19 = +[UIColor systemGrayColor];
    v20 = +[UIImage _systemImageNamed:@"speaker.fill"];
    uint64_t v21 = [v20 imageWithTintColor:v19 renderingMode:1];

    v22 = +[UIImage _systemImageNamed:@"speaker.wave.3.fill"];
    v59 = (void *)v19;
    uint64_t v23 = [v22 imageWithTintColor:v19 renderingMode:1];

    v24 = +[PSSpecifier preferenceSpecifierNamed:&stru_3D6D8 target:self set:"setTransparencyAmplification:specifier:" get:"transparencyAmplification:" detail:0 cell:5 edit:0];

    uint64_t v25 = objc_opt_class();
    uint64_t v26 = PSCellClassKey;
    [v24 setProperty:v25 forKey:PSCellClassKey];
    v27 = +[NSNumber numberWithFloat:0.0];
    [v24 setProperty:v27 forKey:PSControlMinimumKey];

    LODWORD(v28) = 1.0;
    v29 = +[NSNumber numberWithFloat:v28];
    [v24 setProperty:v29 forKey:PSControlMaximumKey];

    v57 = (void *)v23;
    [v24 setProperty:v23 forKey:PSSliderRightImageKey];
    v58 = (void *)v21;
    [v24 setProperty:v21 forKey:PSSliderLeftImageKey];
    uint64_t v30 = PSEnabledKey;
    [v24 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
    [v24 setIdentifier:@"AAAmplificationSpecID"];
    [v9 addObject:v24];
    v31 = paLocString();
    v32 = +[PSSpecifier groupSpecifierWithName:v31];

    [v9 addObject:v32];
    v33 = +[PSSpecifier preferenceSpecifierNamed:&stru_3D6D8 target:self set:"setTransparencyBalance:specifier:" get:"transparencyBalance:" detail:0 cell:5 edit:0];

    uint64_t v34 = PSSliderIsContinuous;
    [v33 setProperty:&__kCFBooleanTrue forKey:PSSliderIsContinuous];
    [v33 setProperty:objc_opt_class() forKey:v26];
    [v33 setProperty:&__kCFBooleanTrue forKey:v30];
    [v33 setUserInfo:self];
    [v33 setIdentifier:@"AABalanceSpecID"];
    [v9 addObject:v33];
    v35 = paLocString();
    v36 = +[PSSpecifier groupSpecifierWithName:v35];

    [v9 addObject:v36];
    v13 = +[PSSpecifier preferenceSpecifierNamed:&stru_3D6D8 target:self set:"setTransparencyTone:specifier:" get:"transparencyTone:" detail:0 cell:5 edit:0];

    [v13 setProperty:&__kCFBooleanTrue forKey:v34];
    uint64_t v56 = v26;
    [v13 setProperty:objc_opt_class() forKey:v26];
    uint64_t v55 = v30;
    [v13 setProperty:&__kCFBooleanTrue forKey:v30];
    [v13 setUserInfo:self];
    [v13 setIdentifier:@"AAToneSpecID"];
    [v9 addObject:v13];
    v37 = paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
    unsigned int v38 = [v37 getAACPCapabilityInteger:6];

    PAInitializeLogging();
    v39 = +[NSString stringWithFormat:@"Found PSE device with version %lu", v38];
    v40 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %@", "-[AudioAccommodationsTransparencyViewController specifiers]", 189, v39);
    v41 = (void *)PAEngineeringLog;
    if (os_log_type_enabled(PAEngineeringLog, OS_LOG_TYPE_DEFAULT))
    {
      id v42 = v40;
      v43 = v41;
      *(_DWORD *)buf = 136446210;
      id v62 = [v42 UTF8String];
      _os_log_impl(&dword_0, v43, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    if (_os_feature_enabled_impl() && v38 >= 2)
    {
      v44 = paLocString();
      v45 = +[PSSpecifier groupSpecifierWithName:v44];

      v46 = paLocString();
      uint64_t v47 = PSFooterTextGroupKey;
      [v45 setProperty:v46 forKey:PSFooterTextGroupKey];

      [v9 addObject:v45];
      v48 = +[PSSpecifier preferenceSpecifierNamed:&stru_3D6D8 target:self set:"setTransparencyNoiseSuppression:specifier:" get:"transparencyNoiseSuppression:" detail:0 cell:5 edit:0];

      [v48 setProperty:&__kCFBooleanTrue forKey:v34];
      [v48 setProperty:objc_opt_class() forKey:v56];
      [v48 setProperty:&__kCFBooleanTrue forKey:v55];
      [v48 setUserInfo:self];
      [v9 addObject:v48];
      v49 = +[PSSpecifier emptyGroupSpecifier];

      v50 = paLocString();
      [v49 setProperty:v50 forKey:v47];

      [v9 addObject:v49];
      v51 = paLocString();
      v13 = +[PSSpecifier preferenceSpecifierNamed:v51 target:self set:"setBeamformingEnabled:specifier:" get:"beamformingEnabled:" detail:0 cell:6 edit:0];

      [v9 addObject:v13];
    }

    goto LABEL_14;
  }
LABEL_15:

  return v4;
}

- (void)setBeamformingEnabled:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v8 = +[PASettings sharedInstance];
  id v6 = [v5 BOOLValue];

  v7 = [(AudioAccommodationsTransparencyViewController *)self transparencyDeviceAddress];
  [v8 setTransparencyBeamforming:v6 forAddress:v7];
}

- (id)beamformingEnabled:(id)a3
{
  objc_super v4 = +[PASettings sharedInstance];
  id v5 = [(AudioAccommodationsTransparencyViewController *)self transparencyDeviceAddress];
  id v6 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 transparencyBeamformingForAddress:v5]);

  return v6;
}

- (void)setTransparencyNoiseSuppression:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v9 = +[PASettings sharedInstance];
  [v5 doubleValue];
  double v7 = v6;

  id v8 = [(AudioAccommodationsTransparencyViewController *)self transparencyDeviceAddress];
  [v9 setTransparencyNoiseSupressor:v8 forAddress:v7];
}

- (id)transparencyNoiseSuppression:(id)a3
{
  objc_super v4 = +[PASettings sharedInstance];
  id v5 = [(AudioAccommodationsTransparencyViewController *)self transparencyDeviceAddress];
  [v4 transparencyNoiseSupressorForAddress:v5];
  double v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

  return v6;
}

- (void)setCustomTransparencyEnabled:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v8 = +[PASettings sharedInstance];
  id v6 = [v5 BOOLValue];

  double v7 = [(AudioAccommodationsTransparencyViewController *)self transparencyDeviceAddress];
  [v8 setTransparencyCustomized:v6 forAddress:v7];
}

- (id)customTransparencyEnabled:(id)a3
{
  objc_super v4 = +[PASettings sharedInstance];
  id v5 = [(AudioAccommodationsTransparencyViewController *)self transparencyDeviceAddress];
  id v6 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 transparencyCustomizedForAddress:v5]);

  return v6;
}

- (id)transparencyDeviceAddress
{
  v2 = [(AudioAccommodationsTransparencyViewController *)self specifier];
  uint64_t v3 = [v2 userInfo];

  if (![v3 length])
  {
    objc_super v4 = paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
    uint64_t v5 = [v4 address];

    uint64_t v3 = (void *)v5;
  }

  return v3;
}

- (void)setTransparencyAmplification:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v9 = +[PASettings sharedInstance];
  [v5 doubleValue];
  double v7 = v6;

  id v8 = [(AudioAccommodationsTransparencyViewController *)self transparencyDeviceAddress];
  [v9 setTransparencyAmplification:v8 forAddress:v7];
}

- (id)transparencyAmplification:(id)a3
{
  objc_super v4 = +[PASettings sharedInstance];
  id v5 = [(AudioAccommodationsTransparencyViewController *)self transparencyDeviceAddress];
  [v4 transparencyAmplificationForAddress:v5];
  double v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

  return v6;
}

- (void)setTransparencyBalance:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v9 = +[PASettings sharedInstance];
  [v5 doubleValue];
  double v7 = v6;

  id v8 = [(AudioAccommodationsTransparencyViewController *)self transparencyDeviceAddress];
  [v9 setTransparencyBalance:v8 forAddress:v7];
}

- (id)transparencyBalance:(id)a3
{
  objc_super v4 = +[PASettings sharedInstance];
  id v5 = [(AudioAccommodationsTransparencyViewController *)self transparencyDeviceAddress];
  [v4 transparencyBalanceForAddress:v5];
  double v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

  return v6;
}

- (void)setTransparencyTone:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v9 = +[PASettings sharedInstance];
  [v5 doubleValue];
  double v7 = v6;

  id v8 = [(AudioAccommodationsTransparencyViewController *)self transparencyDeviceAddress];
  [v9 setTransparencyTone:v8 forAddress:v7];
}

- (id)transparencyTone:(id)a3
{
  objc_super v4 = +[PASettings sharedInstance];
  id v5 = [(AudioAccommodationsTransparencyViewController *)self transparencyDeviceAddress];
  [v4 transparencyToneForAddress:v5];
  double v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

  return v6;
}

- (id)transparencyListeningMode
{
  return 0;
}

- (BOOL)displayingInEnrollment
{
  return self->_displayingInEnrollment;
}

- (void)setDisplayingInEnrollment:(BOOL)a3
{
  self->_displayingInEnrollment = a3;
}

@end