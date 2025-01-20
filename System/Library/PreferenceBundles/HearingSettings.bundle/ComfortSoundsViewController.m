@interface ComfortSoundsViewController
- (BOOL)comfortSoundsStateAfterSample;
- (BOOL)playingMedia;
- (ComfortSoundsViewController)init;
- (id)comfortSoundLevel:(id)a3;
- (id)comfortSoundMixingLevel:(id)a3;
- (id)comfortSoundsEnabled:(id)a3;
- (id)mediaMixingEnabled:(id)a3;
- (id)selectedComfortSound:(id)a3;
- (id)soundGroupValue:(id)a3;
- (id)specifiers;
- (id)stopOnLockEnabled:(id)a3;
- (void)_updateComfortSoundsButtonForOneness;
- (void)dealloc;
- (void)setComfortSoundLevel:(id)a3 specifier:(id)a4;
- (void)setComfortSoundMixingLevel:(id)a3 specifier:(id)a4;
- (void)setComfortSoundsEnabled:(id)a3 specifier:(id)a4;
- (void)setComfortSoundsStateAfterSample:(BOOL)a3;
- (void)setMediaMixingEnabled:(id)a3 specifier:(id)a4;
- (void)setPlayingMedia:(BOOL)a3;
- (void)setStopOnLockEnabled:(id)a3 specifier:(id)a4;
- (void)stopPlayingSample;
- (void)toggleSample:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)willBecomeActive;
- (void)willResignActive;
@end

@implementation ComfortSoundsViewController

- (ComfortSoundsViewController)init
{
  v13.receiver = self;
  v13.super_class = (Class)ComfortSoundsViewController;
  v2 = [(ComfortSoundsViewController *)&v13 init];
  if (v2)
  {
    v3 = +[HUComfortSoundsSettings sharedInstance];
    v2->_comfortSoundsStateAfterSample = [v3 comfortSoundsEnabled];

    objc_initWeak(&location, v2);
    v4 = +[HUComfortSoundsSettings sharedInstance];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_6C10;
    v10[3] = &unk_3C970;
    objc_copyWeak(&v11, &location);
    [v4 registerUpdateBlock:v10 forRetrieveSelector:"selectedComfortSound" withListener:v2];

    v5 = +[HUComfortSoundsSettings sharedInstance];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_6CEC;
    v8[3] = &unk_3C970;
    objc_copyWeak(&v9, &location);
    [v5 registerUpdateBlock:v8 forRetrieveSelector:"comfortSoundsEnabled" withListener:v2];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_6E14, kAXSContinuityDisplayStateChangedNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)ComfortSoundsViewController;
  [(ComfortSoundsViewController *)&v4 dealloc];
}

- (void)willBecomeActive
{
  v3.receiver = self;
  v3.super_class = (Class)ComfortSoundsViewController;
  [(ComfortSoundsViewController *)&v3 willBecomeActive];
  [(ComfortSoundsViewController *)self reloadSpecifiers];
}

- (id)specifiers
{
  objc_super v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v44 = OBJC_IVAR___PSListController__specifiers;
    id v4 = [objc_allocWithZone((Class)NSMutableArray) init];
    v5 = +[PSSpecifier emptyGroupSpecifier];
    v6 = hearingLocString();
    uint64_t v42 = PSFooterTextGroupKey;
    objc_msgSend(v5, "setProperty:forKey:", v6);

    v43 = v5;
    [v4 addObject:v5];
    v7 = hearingLocString();
    v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:"setComfortSoundsEnabled:specifier:" get:"comfortSoundsEnabled:" detail:0 cell:6 edit:0];

    [v8 setIdentifier:@"CSFeatureToggleSpecID"];
    id v9 = [sub_75C0() server];
    uint64_t v10 = [v9 isContinuitySessionActive] ^ 1;

    id v11 = +[NSNumber numberWithBool:v10];
    [v8 setProperty:v11 forKey:PSEnabledKey];

    [v4 addObject:v8];
    v41 = +[PSSpecifier emptyGroupSpecifier];
    objc_msgSend(v4, "addObject:");
    v12 = hearingLocString();
    objc_super v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:0 get:"selectedComfortSound:" detail:objc_opt_class() cell:2 edit:0];

    [v13 setProperty:@"ComfortSoundSoundLabel" forKey:PSIDKey];
    [v4 addObject:v13];
    v14 = +[PSSpecifier emptyGroupSpecifier];

    [v4 addObject:v14];
    v15 = hearingLocString();
    v16 = +[HUComfortSoundsSettings sharedInstance];
    v17 = [v16 selectedComfortSound];
    v18 = [v17 localizedName];
    v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v18);
    v20 = +[PSSpecifier preferenceSpecifierNamed:v19 target:self set:"setComfortSoundLevel:specifier:" get:"comfortSoundLevel:" detail:0 cell:5 edit:0];

    uint64_t v21 = PSSliderIsContinuous;
    [v20 setProperty:&__kCFBooleanTrue forKey:PSSliderIsContinuous];
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = PSCellClassKey;
    [v20 setProperty:v22 forKey:PSCellClassKey];
    [v20 setIdentifier:@"CSRelativeVolumeSpecID"];
    [v20 setUserInfo:self];
    [v4 addObject:v20];
    v24 = +[PSSpecifier emptyGroupSpecifier];

    [v4 addObject:v24];
    v25 = hearingLocString();
    v26 = +[PSSpecifier preferenceSpecifierNamed:v25 target:self set:"setMediaMixingEnabled:specifier:" get:"mediaMixingEnabled:" detail:0 cell:6 edit:0];

    uint64_t v40 = PSAllowMultilineTitleKey;
    objc_msgSend(v26, "setProperty:forKey:", &__kCFBooleanTrue);
    [v26 setIdentifier:@"CSComfortSoundsMixingEnabled"];
    [v4 addObject:v26];
    v27 = hearingLocString();
    v28 = +[PSSpecifier preferenceSpecifierNamed:v27 target:self set:"setComfortSoundMixingLevel:specifier:" get:"comfortSoundMixingLevel:" detail:0 cell:5 edit:0];

    [v28 setProperty:&__kCFBooleanTrue forKey:v21];
    [v28 setProperty:objc_opt_class() forKey:v23];
    [v28 setIdentifier:@"CSMediaVolumeSpecID"];
    [v28 setUserInfo:self];
    [v4 addObject:v28];
    v29 = +[PAStimulus musicStimulus];
    [v29 isPlaying];
    v30 = paLocString();
    v31 = +[PSSpecifier preferenceSpecifierNamed:v30 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v31 setButtonAction:"toggleSample:"];
    [v31 setIdentifier:@"CSMediaToggleSpecID"];
    [v4 addObject:v31];
    v32 = hearingLocString();
    if ((+[HCUtilities deviceIsPad] & 1) != 0
      || +[HCUtilities deviceIsPod])
    {
      uint64_t v33 = hearingLocString();

      v32 = (void *)v33;
    }
    v34 = +[PSSpecifier emptyGroupSpecifier];

    [v34 setProperty:v32 forKey:v42];
    [v34 setIdentifier:@"CSMediaToggleSpecFooterID"];
    [v4 addObject:v34];
    v35 = hearingLocString();
    v36 = +[PSSpecifier preferenceSpecifierNamed:v35 target:self set:"setStopOnLockEnabled:specifier:" get:"stopOnLockEnabled:" detail:0 cell:6 edit:0];

    [v36 setProperty:&__kCFBooleanTrue forKey:v40];
    [v36 setIdentifier:@"CSComfortSoundsStopOnLockEnabled"];
    [v4 addObject:v36];
    id v37 = [v4 copy];
    v38 = *(void **)&self->PSListController_opaque[v44];
    *(void *)&self->PSListController_opaque[v44] = v37;

    objc_super v3 = *(void **)&self->PSListController_opaque[v44];
  }

  return v3;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ComfortSoundsViewController;
  [(ComfortSoundsViewController *)&v4 viewDidDisappear:a3];
  [(ComfortSoundsViewController *)self stopPlayingSample];
}

- (void)willResignActive
{
  v3.receiver = self;
  v3.super_class = (Class)ComfortSoundsViewController;
  [(ComfortSoundsViewController *)&v3 willResignActive];
  [(ComfortSoundsViewController *)self stopPlayingSample];
}

- (void)stopPlayingSample
{
  CSInitializeLogging();
  objc_super v3 = +[NSString stringWithFormat:@"Stopping sample %d - %d", self->_comfortSoundsStateAfterSample, self->_playingMedia];
  objc_super v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %@", "-[ComfortSoundsViewController stopPlayingSample]", 191, v3);
  v5 = (void *)CSEngineeringLog;
  if (os_log_type_enabled(CSEngineeringLog, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v4;
    v7 = v5;
    *(_DWORD *)buf = 136446210;
    id v14 = [v6 UTF8String];
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  if (self->_playingMedia)
  {
    v8 = +[HUComfortSoundsSettings sharedInstance];
    [v8 setComfortSoundsEnabled:self->_comfortSoundsStateAfterSample];

    id v9 = +[HUComfortSoundsSettings sharedInstance];
    [v9 setForceMixingBehavior:0];

    uint64_t v10 = +[PAStimulus musicStimulus];
    [v10 stop];

    self->_playingMedia = 0;
    self->_comfortSoundsStateAfterSample = 0;
    id v11 = [(ComfortSoundsViewController *)self specifierForID:@"CSMediaToggleSpecID"];
    v12 = paLocString();
    [v11 setName:v12];

    [(ComfortSoundsViewController *)self reloadSpecifier:v11];
    UIAccessibilityPostNotification(0x42Fu, &__kCFBooleanFalse);
  }
}

- (void)toggleSample:(id)a3
{
  id v11 = a3;
  if (self->_playingMedia
    || (+[PAStimulus musicStimulus],
        objc_super v4 = objc_claimAutoreleasedReturnValue(),
        unsigned int v5 = [v4 isPlaying],
        v4,
        v5))
  {
    [(ComfortSoundsViewController *)self stopPlayingSample];
  }
  else
  {
    self->_playingMedia = 1;
    id v6 = +[HUComfortSoundsSettings sharedInstance];
    self->_comfortSoundsStateAfterSample = [v6 comfortSoundsEnabled];

    v7 = +[HUComfortSoundsSettings sharedInstance];
    [v7 setComfortSoundsEnabled:1];

    v8 = +[HUComfortSoundsSettings sharedInstance];
    [v8 setForceMixingBehavior:1];

    id v9 = +[PAStimulus musicStimulus];
    [v9 play];

    UIAccessibilityPostNotification(0x42Fu, &__kCFBooleanTrue);
  }
  uint64_t v10 = paLocString();
  [v11 setName:v10];

  [(ComfortSoundsViewController *)self reloadSpecifier:v11];
}

- (void)setComfortSoundsEnabled:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  self->_comfortSoundsStateAfterSample = [v5 BOOLValue];
  uint64_t v6 = +[HUComfortSoundsSettings sharedInstance];
  objc_msgSend((id)v6, "setComfortSoundsEnabled:", objc_msgSend(v5, "BOOLValue"));

  LOBYTE(v6) = [v5 BOOLValue];
  if ((v6 & 1) == 0) {
    [(ComfortSoundsViewController *)self stopPlayingSample];
  }

  [(ComfortSoundsViewController *)self reloadSpecifiers];
}

- (id)comfortSoundsEnabled:(id)a3
{
  objc_super v3 = +[HUComfortSoundsSettings sharedInstance];
  objc_super v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 comfortSoundsEnabled]);

  return v4;
}

- (void)_updateComfortSoundsButtonForOneness
{
  id v6 = [(ComfortSoundsViewController *)self specifierForID:@"CSFeatureToggleSpecID"];
  objc_super v3 = [sub_75C0() server];
  uint64_t v4 = [v3 isContinuitySessionActive] ^ 1;

  id v5 = +[NSNumber numberWithBool:v4];
  [v6 setProperty:v5 forKey:PSEnabledKey];

  [(ComfortSoundsViewController *)self reloadSpecifier:v6];
}

- (void)setMediaMixingEnabled:(id)a3 specifier:(id)a4
{
  id v4 = a3;
  id v6 = +[HUComfortSoundsSettings sharedInstance];
  id v5 = [v4 BOOLValue];

  [v6 setMixesWithMedia:v5];
}

- (id)mediaMixingEnabled:(id)a3
{
  objc_super v3 = +[HUComfortSoundsSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 mixesWithMedia]);

  return v4;
}

- (void)setStopOnLockEnabled:(id)a3 specifier:(id)a4
{
  id v4 = a3;
  id v6 = +[HUComfortSoundsSettings sharedInstance];
  id v5 = [v4 BOOLValue];

  [v6 setStopsOnLock:v5];
}

- (id)stopOnLockEnabled:(id)a3
{
  objc_super v3 = +[HUComfortSoundsSettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 stopsOnLock]);

  return v4;
}

- (void)setComfortSoundLevel:(id)a3 specifier:(id)a4
{
  id v4 = a3;
  id v7 = +[HUComfortSoundsSettings sharedInstance];
  [v4 doubleValue];
  double v6 = v5;

  [v7 setRelativeVolume:v6];
}

- (id)comfortSoundLevel:(id)a3
{
  objc_super v3 = +[HUComfortSoundsSettings sharedInstance];
  [v3 relativeVolume];
  id v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

  return v4;
}

- (id)soundGroupValue:(id)a3
{
  id v3 = a3;
  id v4 = +[HUComfortSoundsSettings sharedInstance];
  double v5 = [v4 selectedComfortSound];

  double v6 = [v3 userInfo];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (id v7 = [v6 soundGroup], v7 == objc_msgSend(v5, "soundGroup")))
  {
    v8 = +[HUComfortSound defaultComfortSoundForGroup:](HUComfortSound, "defaultComfortSoundForGroup:", [v5 soundGroup]);
    if ([v8 isEqual:v5]
      || ([v8 localizedName],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          [v5 localizedName],
          id v11 = objc_claimAutoreleasedReturnValue(),
          unsigned int v12 = [v10 isEqualToString:v11],
          v11,
          v10,
          v12))
    {
      uint64_t v13 = hearingLocString();
    }
    else
    {
      uint64_t v13 = [v5 localizedName];
    }
    id v9 = (void *)v13;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)setComfortSoundMixingLevel:(id)a3 specifier:(id)a4
{
  id v4 = a3;
  id v7 = +[HUComfortSoundsSettings sharedInstance];
  [v4 doubleValue];
  double v6 = v5;

  [v7 setMediaVolume:v6];
}

- (id)comfortSoundMixingLevel:(id)a3
{
  id v3 = +[HUComfortSoundsSettings sharedInstance];
  [v3 mediaVolume];
  id v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

  return v4;
}

- (id)selectedComfortSound:(id)a3
{
  id v3 = +[HUComfortSoundsSettings sharedInstance];
  id v4 = [v3 selectedComfortSound];
  double v5 = [v4 localizedName];

  return v5;
}

- (BOOL)comfortSoundsStateAfterSample
{
  return self->_comfortSoundsStateAfterSample;
}

- (void)setComfortSoundsStateAfterSample:(BOOL)a3
{
  self->_comfortSoundsStateAfterSample = a3;
}

- (BOOL)playingMedia
{
  return self->_playingMedia;
}

- (void)setPlayingMedia:(BOOL)a3
{
  self->_playingMedia = a3;
}

@end