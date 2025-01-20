@interface AudioAccommodationsViewController
- (AudioAccommodationsViewController)init;
- (BOOL)currentRouteSupportsAudioAccomodations;
- (BOOL)hearingAssistEnabled;
- (BOOL)mediaEnabled;
- (BOOL)playingMedia;
- (id)currentTransparencyMode:(id)a3;
- (id)personalAudioEnabled:(id)a3;
- (id)personalAudioEnabledForType:(id)a3;
- (id)personalAudioLevel:(id)a3;
- (id)personalAudioShape:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)title;
- (void)_setShapeFooterForSpecifier:(id)a3;
- (void)confirmationViewAcceptedForSpecifier:(id)a3;
- (void)confirmationViewAlternateAcceptedForSpecifier:(id)a3;
- (void)confirmationViewCancelledForSpecifier:(id)a3;
- (void)headphoneStateChangedNotification:(id)a3;
- (void)levelSliderDidChange:(id)a3;
- (void)mediaServerDied;
- (void)registerNotifications;
- (void)reloadSpecifiers;
- (void)saveNewConfiguration;
- (void)setCurrentRouteSupportsAudioAccomodations:(BOOL)a3;
- (void)setHearingAssistEnabled:(BOOL)a3;
- (void)setMediaEnabled:(BOOL)a3;
- (void)setPersonalAudioEnabled:(id)a3 specifier:(id)a4;
- (void)setPersonalAudioEnabledForType:(id)a3 specifier:(id)a4;
- (void)setPlayingMedia:(BOOL)a3;
- (void)showAudioAccommodationsLearnMore;
- (void)showConfigurationConfirmationAndReload:(BOOL)a3;
- (void)showHeadphoneCheckConfirmationIfNeeded;
- (void)showHearingAssistConfirmationIfNeeded;
- (void)startPMEEnrollment:(id)a3;
- (void)stopPlayingSample;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)toggleSample:(id)a3;
- (void)updateHearingAssistStatus;
- (void)updateLevelAndShape;
- (void)updateShapeFooter;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)willBecomeActive;
- (void)willResignActive;
@end

@implementation AudioAccommodationsViewController

- (AudioAccommodationsViewController)init
{
  v15.receiver = self;
  v15.super_class = (Class)AudioAccommodationsViewController;
  v2 = [(AudioAccommodationsViewController *)&v15 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_CD20;
    v12[3] = &unk_3C970;
    objc_copyWeak(&v13, &location);
    v3 = objc_retainBlock(v12);
    v4 = +[PASettings sharedInstance];
    [v4 registerUpdateBlock:v3 forRetrieveSelector:"personalMediaConfiguration" withListener:v2];

    v5 = +[PASettings sharedInstance];
    [v5 registerUpdateBlock:v3 forRetrieveSelector:"configurationCameFromEnrollment" withListener:v2];

    v6 = +[PASettings sharedInstance];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_CDAC;
    v10[3] = &unk_3C970;
    objc_copyWeak(&v11, &location);
    [v6 registerUpdateBlock:v10 forRetrieveSelector:"personalAudioAccommodationTypes" withListener:v2];

    v7 = +[PASettings sharedInstance];
    [v7 personalAudioAccommodationTypes];
    v2->_mediaEnabled = compoundAttributeContainsAttribute();

    [(AudioAccommodationsViewController *)v2 registerNotifications];
    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v2 selector:"updateHearingAssistStatus" name:PAYodelConfigDidUpdate object:0];

    [(AudioAccommodationsViewController *)v2 updateHearingAssistStatus];
    objc_destroyWeak(&v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (id)title
{
  return (id)paLocString();
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

  v6 = +[NSNotificationCenter defaultCenter];
  v7 = +[AVAudioSession sharedInstance];
  [v6 addObserver:self selector:"headphoneStateChangedNotification:" name:AVAudioSessionRouteChangeNotification object:v7];

  v8 = +[NSNotificationCenter defaultCenter];
  uint64_t v9 = AVSystemController_ActiveAudioRouteDidChangeNotification;
  v10 = +[AVSystemController sharedAVSystemController];
  [v8 addObserver:self selector:"headphoneStateChangedNotification:" name:v9 object:v10];

  id v11 = +[NSNotificationCenter defaultCenter];
  uint64_t v12 = AVSystemController_ServerConnectionDiedNotification;
  id v13 = +[AVSystemController sharedAVSystemController];
  [v11 addObserver:self selector:"mediaServerDied" name:v12 object:v13];
}

- (void)mediaServerDied
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [(AudioAccommodationsViewController *)self performSelector:"registerNotifications" withObject:0 afterDelay:2.0];

  [(AudioAccommodationsViewController *)self headphoneStateChangedNotification:0];
}

- (void)headphoneStateChangedNotification:(id)a3
{
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AudioAccommodationsViewController;
  [(AudioAccommodationsViewController *)&v5 viewWillAppear:a3];
  [(AudioAccommodationsViewController *)self reloadSpecifiers];
  [(AudioAccommodationsViewController *)self updateLevelAndShape];
  v4 = +[PASettings sharedInstance];
  [v4 setCurrentEnrollmentProgress:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AudioAccommodationsViewController;
  [(AudioAccommodationsViewController *)&v4 viewDidDisappear:a3];
  [(AudioAccommodationsViewController *)self stopPlayingSample];
}

- (void)willResignActive
{
  v3.receiver = self;
  v3.super_class = (Class)AudioAccommodationsViewController;
  [(AudioAccommodationsViewController *)&v3 willResignActive];
  v2 = +[PASettings sharedInstance];
  [v2 setCurrentEnrollmentProgress:0];
}

- (void)willBecomeActive
{
  v5.receiver = self;
  v5.super_class = (Class)AudioAccommodationsViewController;
  [(AudioAccommodationsViewController *)&v5 willBecomeActive];
  objc_super v3 = +[PASettings sharedInstance];
  objc_super v4 = [(PersonalAudioEnrollmentViewController *)self->_enrollmentController enrollment];
  objc_msgSend(v3, "setCurrentEnrollmentProgress:", objc_msgSend(v4, "progress"));

  [(AudioAccommodationsViewController *)self reloadSpecifiers];
}

- (void)reloadSpecifiers
{
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  objc_super v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    [(AudioAccommodationsViewController *)self updateLevelAndShape];
    objc_super v5 = +[PASettings sharedInstance];
    unsigned int v6 = [v5 personalMediaEnabled];

    id v7 = [objc_allocWithZone((Class)NSMutableArray) init];
    v8 = +[PSSpecifier emptyGroupSpecifier];
    uint64_t v9 = +[PASettings sharedInstance];
    unsigned __int8 v10 = [v9 configurationCameFromUser];

    if (v10)
    {
      id v11 = paLocString();
      uint64_t v12 = PSFooterTextGroupKey;
      [v8 setProperty:v11 forKey:PSFooterTextGroupKey];

      if (!_os_feature_enabled_impl()) {
        goto LABEL_7;
      }
      id v13 = accessibilityHearingAidSupportBundle();
      v14 = [v13 localizedStringForKey:@"PersonalAudioSetupFooter" value:@"PersonalAudioSetupFooter" table:@"HearingProtection-Yodel"];
      [v8 setProperty:v14 forKey:v12];
    }
    else
    {
      id v13 = paLocString();
      uint64_t v12 = PSFooterTextGroupKey;
      [v8 setProperty:v13 forKey:PSFooterTextGroupKey];
    }

LABEL_7:
    [v7 addObject:v8];
    objc_super v15 = paLocString();
    v16 = +[PSSpecifier preferenceSpecifierNamed:v15 target:self set:"setPersonalAudioEnabled:specifier:" get:"personalAudioEnabled:" detail:0 cell:6 edit:0];

    [v16 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
    [v16 setIdentifier:@"AXPAEnableSpecID"];
    [v7 addObject:v16];
    v17 = +[PSSpecifier emptyGroupSpecifier];

    [v7 addObject:v17];
    v18 = paLocString();
    v19 = +[PSSpecifier preferenceSpecifierNamed:v18 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v19 setButtonAction:"startPMEEnrollment:"];
    [v19 setIdentifier:@"AXPAPersonalAudioSetupSpecID"];
    [v7 addObject:v19];
    if (v6)
    {
      uint64_t v79 = v12;
      v20 = +[PASettings sharedInstance];
      if ([v20 personalMediaEnabled])
      {

        goto LABEL_11;
      }
      v21 = +[PASettings sharedInstance];
      v22 = [v21 personalMediaConfiguration];

      if (v22)
      {
LABEL_11:
        v80 = v8;
        v23 = paLocString();
        v24 = +[PSSpecifier groupSpecifierWithName:v23];

        [(AudioAccommodationsViewController *)self _setShapeFooterForSpecifier:v24];
        uint64_t v78 = PSIsRadioGroupKey;
        objc_msgSend(v24, "setProperty:forKey:", &__kCFBooleanTrue);
        [v24 setIdentifier:@"AXPAShapeGroupSpecID"];
        v82 = v24;
        [v7 addObject:v24];
        v25 = +[PASettings sharedInstance];
        [v25 audiogramConfiguration];
        v27 = v26 = v7;

        v28 = v26;
        uint64_t v81 = v3;
        if (v27)
        {
          v29 = paLocString();
          v30 = +[PSSpecifier preferenceSpecifierNamed:v29 target:self set:0 get:0 detail:0 cell:3 edit:0];

          [v30 setProperty:&off_3FF18 forKey:@"AXPAShapePropertyKey"];
          [v26 addObject:v30];
          uint64_t v31 = PSRadioGroupCheckedSpecifierKey;
          if (self->_currentShape == 12) {
            [v24 setProperty:v30 forKey:PSRadioGroupCheckedSpecifierKey];
          }
          v19 = v30;
        }
        else
        {
          uint64_t v31 = PSRadioGroupCheckedSpecifierKey;
        }
        for (uint64_t i = 1; i != 4; ++i)
        {
          v33 = v19;
          v34 = paDescriptionForShape();
          v19 = +[PSSpecifier preferenceSpecifierNamed:v34 target:self set:0 get:0 detail:0 cell:3 edit:0];

          v35 = +[NSNumber numberWithUnsignedInteger:i];
          [v19 setProperty:v35 forKey:@"AXPAShapePropertyKey"];

          [v28 addObject:v19];
          if (i == self->_currentShape) {
            [v24 setProperty:v19 forKey:v31];
          }
        }
        v36 = +[PASettings sharedInstance];
        v37 = [v36 personalMediaConfiguration];
        v38 = (int *)[v37 level];

        if (v38 == &dword_C)
        {
          v39 = v28;
        }
        else
        {
          v40 = +[PSSpecifier emptyGroupSpecifier];
          v41 = paLocString();
          [v40 setProperty:v41 forKey:v79];

          [v28 addObject:v40];
          v42 = [(AudioAccommodationsViewController *)self view];
          [v42 bounds];
          LODWORD(v41) = +[HearingSettingsValueSliderCell shouldAppearAsListForWidth:CGRectGetWidth(v84)];

          if (v41)
          {
            v43 = +[PSSpecifier preferenceSpecifierNamed:&stru_3D6D8 target:self set:"levelSliderDidChange:" get:"personalAudioLevel:" detail:0 cell:5 edit:0];

            [v43 setProperty:&__kCFBooleanTrue forKey:PSSliderIsContinuous];
            [v43 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
            [v43 setProperty:objc_opt_class() forKey:PSCellClassKey];
            [v43 setIdentifier:@"AXPALevelSpecID"];
            [v43 setUserInfo:self];
            [v28 addObject:v43];
            v19 = v43;
            v44 = v40;
          }
          else
          {
            [v40 setProperty:&__kCFBooleanTrue forKey:v78];
            [v40 setIdentifier:@"AXPALevelGroupSpecID"];
            uint64_t v45 = 1;
            v44 = v40;
            do
            {
              v46 = v19;
              v47 = paDescriptionForLevel();
              v19 = +[PSSpecifier preferenceSpecifierNamed:v47 target:self set:0 get:0 detail:0 cell:3 edit:0];

              v48 = +[NSNumber numberWithUnsignedInteger:v45];
              [v19 setProperty:v48 forKey:@"AXPALevelPropertyKey"];

              [v28 addObject:v19];
              if (v45 == self->_currentLevel) {
                [v44 setProperty:v19 forKey:v31];
              }
              ++v45;
            }
            while (v45 != 4);
          }

          v39 = v28;
        }
        v49 = +[PSSpecifier emptyGroupSpecifier];

        [v39 addObject:v49];
        v50 = +[PASettings sharedInstance];
        [v50 currentEnrollmentProgress];

        if ([(AudioAccommodationsViewController *)self currentRouteSupportsAudioAccomodations])
        {
          v51 = +[HUUtilities sharedUtilities];
          uint64_t v52 = [v51 wirelessSplitterEnabled] ^ 1;
        }
        else
        {
          uint64_t v52 = 0;
        }
        v53 = +[PAStimulus musicStimulus];
        [v53 isPlaying];
        v54 = paLocString();
        v55 = +[PSSpecifier preferenceSpecifierNamed:v54 target:self set:0 get:0 detail:0 cell:13 edit:0];

        [v55 setButtonAction:"toggleSample:"];
        v56 = +[NSNumber numberWithBool:v52];
        [v55 setProperty:v56 forKey:PSEnabledKey];

        [v55 setIdentifier:@"AXPAPlaySampleSpecID"];
        [v28 addObject:v55];
        if ((v52 & 1) == 0)
        {
          v57 = +[PAStimulus musicStimulus];
          unsigned int v58 = [v57 isPlaying];

          if (v58) {
            [(AudioAccommodationsViewController *)self stopPlayingSample];
          }
        }
        v59 = paLocString();
        v60 = +[PSSpecifier groupSpecifierWithName:v59];

        v61 = +[PASettings sharedInstance];
        uint64_t v3 = v81;
        if ([v61 personalSoundVisible])
        {
          int v62 = paPairedDeviceSupportsTransparencyAccommodations();

          v63 = &AXFormatFloatWithPercentage_ptr;
          if (!v62) {
            goto LABEL_40;
          }
          v61 = paLocString();
          [v60 setProperty:v61 forKey:v79];
        }
        else
        {
          v63 = &AXFormatFloatWithPercentage_ptr;
        }

LABEL_40:
        [v28 addObject:v60];
        v64 = v63[192];
        v65 = paLocString();
        v66 = [v64 preferenceSpecifierNamed:v65 target:self set:"setPersonalAudioEnabledForType:specifier:" get:"personalAudioEnabledForType:" detail:0 cell:6 edit:0];

        [v66 setProperty:&off_3FF30 forKey:@"AXPATypePropertyKey"];
        [v28 addObject:v66];
        v67 = v63[192];
        v68 = paLocString();
        v19 = [v67 preferenceSpecifierNamed:v68 target:self set:"setPersonalAudioEnabledForType:specifier:" get:"personalAudioEnabledForType:" detail:0 cell:6 edit:0];

        id v7 = v28;
        [v19 setProperty:&off_3FF48 forKey:@"AXPATypePropertyKey"];
        [v28 addObject:v19];
        v69 = paAvailableBluetoothDevicesSupportingTransparencyAccommodations();
        v70 = +[PASettings sharedInstance];
        unsigned int v71 = [v70 personalSoundVisible];

        if (v71)
        {
          if ([v69 count] == (char *)&dword_0 + 1)
          {
            v72 = paLocString();
            v73 = +[PSSpecifier preferenceSpecifierNamed:v72 target:self set:0 get:"currentTransparencyMode:" detail:objc_opt_class() cell:2 edit:0];

            v74 = [v69 lastObject];
            v19 = [v74 address];
            [v73 setUserInfo:v19];
LABEL_45:

            [v28 addObject:v73];
            v19 = v73;
            goto LABEL_46;
          }
          if ((unint64_t)[v69 count] >= 2)
          {
            v74 = paLocString();
            v73 = +[PSSpecifier preferenceSpecifierNamed:v74 target:self set:0 get:"currentTransparencyMode:" detail:objc_opt_class() cell:2 edit:0];
            goto LABEL_45;
          }
        }
LABEL_46:
        v8 = v80;
      }
    }
    id v75 = [v7 copy];
    v76 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v75;

    objc_super v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (void)showAudioAccommodationsLearnMore
{
  v2 = (void *)UIApp;
  +[NSURL URLWithString:@"https://support.apple.com/ht211218?cid=mc-ols-audio-article_ht211218-ios_ui-06042020"];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 openURL:v3 withCompletionHandler:0];
}

- (void)updateLevelAndShape
{
  id v3 = +[PASettings sharedInstance];
  id v5 = [v3 personalMediaConfiguration];

  self->_currentLevel = (unint64_t)[v5 level];
  id v4 = [v5 shape];
  self->_currentShape = (unint64_t)v4;
  if (self->_currentLevel)
  {
    if (v4) {
      goto LABEL_3;
    }
  }
  else
  {
    self->_currentLevel = 1;
    if (self->_currentShape) {
      goto LABEL_3;
    }
  }
  self->_currentShape = 1;
LABEL_3:
}

- (void)_setShapeFooterForSpecifier:(id)a3
{
  id v3 = a3;
  paLocString();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setProperty:v4 forKey:PSFooterTextGroupKey];
}

- (void)updateShapeFooter
{
  id v3 = [(AudioAccommodationsViewController *)self specifierForID:@"AXPAShapeGroupSpecID"];
  [(AudioAccommodationsViewController *)self _setShapeFooterForSpecifier:v3];
  [(AudioAccommodationsViewController *)self reloadSpecifier:v3];
}

- (void)setPersonalAudioEnabled:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  unsigned int v6 = +[PASettings sharedInstance];
  id v7 = [v5 BOOLValue];

  [v6 setPersonalMediaEnabled:v7];
  [(AudioAccommodationsViewController *)self updateLevelAndShape];
  [(AudioAccommodationsViewController *)self saveNewConfiguration];
  [(AudioAccommodationsViewController *)self stopPlayingSample];

  [(AudioAccommodationsViewController *)self reloadSpecifiers];
}

- (id)personalAudioEnabled:(id)a3
{
  id v3 = +[PASettings sharedInstance];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 personalMediaEnabled]);

  return v4;
}

- (void)setPersonalAudioEnabledForType:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = [a4 propertyForKey:@"AXPATypePropertyKey"];
  [v7 unsignedIntegerValue];

  v8 = +[PASettings sharedInstance];
  [v8 personalAudioAccommodationTypes];

  LODWORD(v8) = [v6 BOOLValue];
  if (v8) {
    uint64_t v9 = compoundAttributeByAddingAttribute();
  }
  else {
    uint64_t v9 = compoundAttributeByRemovingAttribute();
  }
  uint64_t v10 = v9;
  self->_mediaEnabled = compoundAttributeContainsAttribute();
  id v11 = +[PASettings sharedInstance];
  [v11 setPersonalAudioAccommodationTypes:v10];
}

- (id)personalAudioEnabledForType:(id)a3
{
  id v3 = [a3 propertyForKey:@"AXPATypePropertyKey"];
  [v3 unsignedIntegerValue];

  id v4 = +[PASettings sharedInstance];
  [v4 personalAudioAccommodationTypes];
  id v5 = +[NSNumber numberWithBool:compoundAttributeContainsAttribute()];

  return v5;
}

- (id)currentTransparencyMode:(id)a3
{
  id v3 = paLocString();
  id v4 = +[PASettings sharedInstance];
  id v5 = paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
  id v6 = [v5 address];
  unsigned int v7 = [v4 transparencyCustomizedForAddress:v6];

  if (v7)
  {
    uint64_t v8 = paLocString();

    id v3 = (void *)v8;
  }

  return v3;
}

- (id)personalAudioShape:(id)a3
{
  id v4 = [a3 propertyForKey:@"AXPAShapePropertyKey"];
  id v5 = v4;
  if (v4)
  {
    id v6 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 unsignedIntegerValue] == self->_currentShape);
  }
  else
  {
    id v6 = &__kCFBooleanFalse;
  }

  return v6;
}

- (void)updateHearingAssistStatus
{
}

- (void)startPMEEnrollment:(id)a3
{
}

- (void)showHearingAssistConfirmationIfNeeded
{
  if ([(AudioAccommodationsViewController *)self hearingAssistEnabled])
  {
    id v13 = objc_alloc_init((Class)PSConfirmationSpecifier);
    id v3 = accessibilityHearingAidSupportBundle();
    id v4 = [v3 localizedStringForKey:@"PersonalAudioHearingAssistAlertTitle" value:@"PersonalAudioHearingAssistAlertTitle" table:@"HearingProtection-Yodel"];
    [v13 setTitle:v4];

    id v5 = accessibilityHearingAidSupportBundle();
    id v6 = [v5 localizedStringForKey:@"PersonalAudioHearingAssistAlertPrompt" value:@"PersonalAudioHearingAssistAlertPrompt" table:@"HearingProtection-Yodel"];
    [v13 setPrompt:v6];

    unsigned int v7 = paLocString();
    [v13 setOkButton:v7];

    [(AudioAccommodationsViewController *)self showConfirmationViewForSpecifier:v13 useAlert:1];
  }
  else
  {
    PAInitializeLogging();
    uint64_t v8 = +[NSString stringWithFormat:@"Hearing assist is not enabled. Starting enrollment."];
    uint64_t v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %@", "-[AudioAccommodationsViewController showHearingAssistConfirmationIfNeeded]", 494, v8);
    uint64_t v10 = (void *)PAEngineeringLog;
    if (os_log_type_enabled(PAEngineeringLog, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = v9;
      uint64_t v12 = v10;
      *(_DWORD *)buf = 136446210;
      id v15 = [v11 UTF8String];
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    [(AudioAccommodationsViewController *)self showHeadphoneCheckConfirmationIfNeeded];
  }
}

- (void)showHeadphoneCheckConfirmationIfNeeded
{
  if (+[HCUtilities isInternalInstall])
  {
    id v3 = +[PASettings sharedInstance];
    if ([v3 personalMediaAutomationSkipHeadphoneRequirement]) {
      BOOL v4 = _AXSAutomationEnabled() != 0;
    }
    else {
      BOOL v4 = 0;
    }
  }
  else
  {
    BOOL v4 = 0;
  }
  if ((paAnyRouteSupportsAudioAccommodations() & 1) != 0 || v4)
  {
    if (self->_playingMedia
      || (+[PAStimulus musicStimulus],
          uint64_t v9 = objc_claimAutoreleasedReturnValue(),
          unsigned int v10 = [v9 isPlaying],
          v9,
          v10))
    {
      id v11 = [(AudioAccommodationsViewController *)self specifierForID:@"AXPAPlaySampleSpecID"];
      [(AudioAccommodationsViewController *)self toggleSample:v11];
    }
    uint64_t v12 = objc_alloc_init(PersonalAudioEnrollmentViewController);
    enrollmentController = self->_enrollmentController;
    self->_enrollmentController = v12;

    [(PersonalAudioEnrollmentViewController *)self->_enrollmentController setModalPresentationStyle:-2];
    [(AudioAccommodationsViewController *)self presentViewController:self->_enrollmentController animated:1 completion:0];
    id v14 = +[HUUtilities sharedUtilities];
    [v14 pauseNowPlaying:1 withQueue:0 andCompletion:0];
  }
  else
  {
    id v14 = objc_alloc_init((Class)PSConfirmationSpecifier);
    id v5 = paLocString();
    [v14 setTitle:v5];

    id v6 = paLocString();
    [v14 setPrompt:v6];

    unsigned int v7 = paLocString();
    [v14 setOkButton:v7];

    uint64_t v8 = paLocString();
    [v14 setAlternateButton:v8];

    [(AudioAccommodationsViewController *)self showConfirmationViewForSpecifier:v14 useAlert:1];
  }
}

- (void)stopPlayingSample
{
  id v3 = +[PASettings sharedInstance];
  [v3 personalAudioAccommodationTypes];

  if (self->_mediaEnabled) {
    uint64_t v4 = compoundAttributeByAddingAttribute();
  }
  else {
    uint64_t v4 = compoundAttributeByRemovingAttribute();
  }
  uint64_t v5 = v4;
  id v6 = +[PASettings sharedInstance];
  [v6 setPersonalAudioAccommodationTypes:v5];

  unsigned int v7 = +[PAStimulus musicStimulus];
  [v7 stop];

  UIAccessibilityPostNotification(0x42Fu, &__kCFBooleanFalse);
}

- (void)toggleSample:(id)a3
{
  id v11 = a3;
  if (self->_playingMedia
    || (+[PAStimulus musicStimulus],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        unsigned int v5 = [v4 isPlaying],
        v4,
        v5))
  {
    self->_playingMedia = 0;
    [(AudioAccommodationsViewController *)self stopPlayingSample];
  }
  else
  {
    self->_playingMedia = 1;
    id v6 = +[PASettings sharedInstance];
    [v6 personalAudioAccommodationTypes];

    uint64_t v7 = compoundAttributeByAddingAttribute();
    uint64_t v8 = +[PASettings sharedInstance];
    [v8 setPersonalAudioAccommodationTypes:v7];

    uint64_t v9 = +[PAStimulus musicStimulus];
    [v9 play];

    UIAccessibilityPostNotification(0x42Fu, &__kCFBooleanTrue);
  }
  unsigned int v10 = paLocString();
  [v11 setName:v10];

  [(AudioAccommodationsViewController *)self reloadSpecifier:v11];
}

- (void)confirmationViewAcceptedForSpecifier:(id)a3
{
  [(AudioAccommodationsViewController *)self saveNewConfiguration];

  [(AudioAccommodationsViewController *)self reloadSpecifiers];
}

- (void)confirmationViewAlternateAcceptedForSpecifier:(id)a3
{
}

- (void)confirmationViewCancelledForSpecifier:(id)a3
{
  PAInitializeLogging();
  uint64_t v4 = +[NSString stringWithFormat:@"Alert cancelled"];
  unsigned int v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %@", "-[AudioAccommodationsViewController confirmationViewCancelledForSpecifier:]", 583, v4);
  id v6 = (void *)PAEngineeringLog;
  if (os_log_type_enabled(PAEngineeringLog, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v5;
    uint64_t v8 = v6;
    *(_DWORD *)buf = 136446210;
    id v10 = [v7 UTF8String];
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  [(AudioAccommodationsViewController *)self reloadSpecifiers];
}

- (void)showConfigurationConfirmationAndReload:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = +[PASettings sharedInstance];
  unsigned int v6 = [v5 configurationCameFromEnrollment];

  if (v6)
  {
    id v12 = objc_alloc_init((Class)PSConfirmationSpecifier);
    unsigned int v7 = +[HCUtilities deviceIsPad];
    uint64_t v8 = paLocString();
    if (v7) {
      [v12 setOkButton:v8];
    }
    else {
      [v12 setTitle:v8];
    }

    uint64_t v9 = paLocString();
    [v12 setPrompt:v9];

    id v10 = paLocString();
    [v12 setCancelButton:v10];

    id v11 = +[NSNumber numberWithBool:1];
    [v12 setProperty:v11 forKey:PSConfirmationDestructiveKey];

    [(AudioAccommodationsViewController *)self showConfirmationViewForSpecifier:v12];
  }
  else
  {
    [(AudioAccommodationsViewController *)self saveNewConfiguration];
    if (v3)
    {
      [(AudioAccommodationsViewController *)self reloadSpecifiers];
    }
  }
}

- (void)saveNewConfiguration
{
  id v8 = +[PAConfiguration configurationWithLevel:self->_currentLevel andShape:self->_currentShape];
  if (self->_currentShape == 12)
  {
    BOOL v3 = +[PASettings sharedInstance];
    uint64_t v4 = [v3 audiogramConfiguration];

    id v8 = (id)v4;
  }
  unsigned int v5 = +[PASettings sharedInstance];
  [v5 setPersonalMediaConfiguration:v8];

  unsigned int v6 = +[PASettings sharedInstance];
  [v6 setConfigurationCameFromEnrollment:0];

  unsigned int v7 = +[PASettings sharedInstance];
  [v7 setConfigurationCameFromUser:1];
}

- (id)personalAudioLevel:(id)a3
{
  return +[NSNumber numberWithUnsignedInteger:self->_currentLevel];
}

- (void)levelSliderDidChange:(id)a3
{
  [a3 floatValue];
  unint64_t v5 = 2;
  uint64_t v6 = 1;
  if (v4 > 0.5) {
    uint64_t v6 = 3;
  }
  if (v4 != 0.5) {
    unint64_t v5 = v6;
  }
  self->_currentLevel = v5;

  [(AudioAccommodationsViewController *)self showConfigurationConfirmationAndReload:0];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)AudioAccommodationsViewController;
  id v6 = a4;
  [(AudioAccommodationsViewController *)&v11 tableView:a3 didSelectRowAtIndexPath:v6];
  unsigned int v7 = -[AudioAccommodationsViewController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6, v11.receiver, v11.super_class);

  id v8 = [v7 propertyForKey:@"AXPAShapePropertyKey"];
  uint64_t v9 = [v7 propertyForKey:@"AXPALevelPropertyKey"];
  id v10 = v9;
  if (v8)
  {
    self->_currentShape = (unint64_t)[v8 unsignedIntegerValue];
    if (self->_currentLevel == 12) {
      self->_currentLevel = 1;
    }
    goto LABEL_6;
  }
  if (v9)
  {
    self->_currentLevel = (unint64_t)[v9 unsignedIntegerValue];
LABEL_6:
    [(AudioAccommodationsViewController *)self showConfigurationConfirmationAndReload:1];
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)AudioAccommodationsViewController;
  id v6 = a4;
  unsigned int v7 = [(AudioAccommodationsViewController *)&v12 tableView:a3 cellForRowAtIndexPath:v6];
  id v8 = -[AudioAccommodationsViewController specifierAtIndexPath:](self, "specifierAtIndexPath:", v6, v12.receiver, v12.super_class);

  uint64_t v9 = [v8 propertyForKey:PSIDKey];
  LODWORD(v6) = [v9 isEqualToString:@"AXPAEnableSpecID"];

  if (v6)
  {
    id v10 = [v7 textLabel];
    [v10 setNumberOfLines:0];
  }

  return v7;
}

- (BOOL)mediaEnabled
{
  return self->_mediaEnabled;
}

- (void)setMediaEnabled:(BOOL)a3
{
  self->_mediaEnabled = a3;
}

- (BOOL)playingMedia
{
  return self->_playingMedia;
}

- (void)setPlayingMedia:(BOOL)a3
{
  self->_playingMedia = a3;
}

- (BOOL)currentRouteSupportsAudioAccomodations
{
  return self->_currentRouteSupportsAudioAccomodations;
}

- (void)setCurrentRouteSupportsAudioAccomodations:(BOOL)a3
{
  self->_currentRouteSupportsAudioAccomodations = a3;
}

- (BOOL)hearingAssistEnabled
{
  return self->_hearingAssistEnabled;
}

- (void)setHearingAssistEnabled:(BOOL)a3
{
  self->_hearingAssistEnabled = a3;
}

- (void).cxx_destruct
{
}

@end