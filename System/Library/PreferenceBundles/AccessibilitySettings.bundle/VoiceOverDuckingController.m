@interface VoiceOverDuckingController
- (id)_specsForAudioDuckingMode;
- (id)_specsForVolume;
- (id)audioDuckingModeDescription;
- (id)audioDuckingVolumeDescription;
- (id)specifiers;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation VoiceOverDuckingController

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)VoiceOverDuckingController;
  [(VoiceOverDuckingController *)&v11 viewDidLoad];
  objc_initWeak(&location, self);
  v3 = +[AXSettings sharedInstance];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __41__VoiceOverDuckingController_viewDidLoad__block_invoke;
  v8[3] = &unk_208798;
  objc_copyWeak(&v9, &location);
  [v3 registerUpdateBlock:v8 forRetrieveSelector:"voiceOverMediaDuckingMode" withListener:self];

  objc_destroyWeak(&v9);
  v4 = +[AXSettings sharedInstance];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __41__VoiceOverDuckingController_viewDidLoad__block_invoke_2;
  v6[3] = &unk_208798;
  objc_copyWeak(&v7, &location);
  [v4 registerUpdateBlock:v6 forRetrieveSelector:"voiceOverMediaDuckingAmount" withListener:self];

  objc_destroyWeak(&v7);
  v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"updateMediaDuckingSpecifiers:" name:kAXSVoiceOverTouchVolumeChangedNotification object:0];

  objc_destroyWeak(&location);
}

void __41__VoiceOverDuckingController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateMediaDuckingSpecifiers:0];
}

void __41__VoiceOverDuckingController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateMediaDuckingSpecifiers:0];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = +[NSMutableArray array];
    v6 = [(VoiceOverDuckingController *)self _specsForAudioDuckingMode];
    [v5 addObjectsFromArray:v6];

    id v7 = [(VoiceOverDuckingController *)self _specsForVolume];
    [v5 addObjectsFromArray:v7];

    id v8 = [v5 copy];
    id v9 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v8;

    v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

- (id)_specsForAudioDuckingMode
{
  uint64_t v3 = +[NSMutableArray array];
  v4 = settingsLocString(@"AUDIO_DUCKING", @"VoiceOverSettings");
  v5 = +[PSSpecifier groupSpecifierWithName:v4];

  [v5 setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
  uint64_t v6 = PSIDKey;
  [v5 setProperty:@"DuckingModeGroup" forKey:PSIDKey];
  id v7 = [(VoiceOverDuckingController *)self audioDuckingModeDescription];
  [v5 setProperty:v7 forKey:PSFooterTextGroupKey];

  [v3 addObject:v5];
  id v8 = settingsLocString(@"AUDIO_DUCKING_OFF", @"VoiceOverSettings");
  id v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:0 set:0 get:0 detail:0 cell:3 edit:0];

  [v9 setProperty:&off_229DB0 forKey:@"DuckingModeValue"];
  [v9 setProperty:@"DuckingModeOffIdentifier" forKey:v6];
  v10 = settingsLocString(@"AUDIO_DUCKING_ONLY_SPEAKING", @"VoiceOverSettings");
  objc_super v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:0 set:0 get:0 detail:0 cell:3 edit:0];

  [v11 setProperty:&off_229DC8 forKey:@"DuckingModeValue"];
  [v11 setProperty:@"DuckingModeOnlySpeakingIdentifier" forKey:v6];
  v12 = settingsLocString(@"AUDIO_DUCKING_ALWAYS", @"VoiceOverSettings");
  v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:0 set:0 get:0 detail:0 cell:3 edit:0];

  [v13 setProperty:&off_229DE0 forKey:@"DuckingModeValue"];
  [v13 setProperty:@"DuckingModeAlwaysSpeakingIdentifier" forKey:v6];
  v14 = +[AXSettings sharedInstance];
  id v15 = [v14 voiceOverMediaDuckingMode];

  v16 = v9;
  if (v15)
  {
    v17 = +[AXSettings sharedInstance];
    v18 = (char *)[v17 voiceOverMediaDuckingMode];

    if (v18 == (unsigned char *)&dword_0 + 1) {
      v16 = v11;
    }
    else {
      v16 = v13;
    }
  }
  id v19 = v16;
  [v5 setProperty:v19 forKey:PSRadioGroupCheckedSpecifierKey];
  [v3 addObject:v9];
  [v3 addObject:v11];
  [v3 addObject:v13];

  return v3;
}

- (id)_specsForVolume
{
  uint64_t v3 = +[NSMutableArray array];
  v4 = +[AXSettings sharedInstance];
  id v5 = [v4 voiceOverMediaDuckingMode];

  if (v5)
  {
    uint64_t v6 = settingsLocString(@"DUCKING_AMOUNT", @"VoiceOverSettings");
    id v7 = +[PSSpecifier groupSpecifierWithName:v6];

    [v7 setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
    id v8 = [(VoiceOverDuckingController *)self audioDuckingVolumeDescription];
    [v7 setProperty:v8 forKey:PSFooterTextGroupKey];

    [v3 addObject:v7];
    id v9 = +[PSSpecifier preferenceSpecifierNamed:&stru_20F6B8 target:self set:0 get:0 detail:0 cell:-1 edit:0];
    [v9 setProperty:objc_opt_class() forKey:PSCellClassKey];
    [v3 addObject:v9];
  }

  return v3;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)VoiceOverDuckingController;
  id v6 = a4;
  [(VoiceOverDuckingController *)&v16 tableView:a3 didSelectRowAtIndexPath:v6];
  id v7 = objc_msgSend(v6, "section", v16.receiver, v16.super_class);

  id v8 = [(VoiceOverDuckingController *)self specifierAtIndex:[(VoiceOverDuckingController *)self indexOfGroup:v7]];
  id v9 = [v8 propertyForKey:PSIDKey];
  LODWORD(v6) = [v9 isEqualToString:@"DuckingModeGroup"];

  if (v6)
  {
    v10 = [v8 propertyForKey:PSRadioGroupCheckedSpecifierKey];
    objc_super v11 = [v10 propertyForKey:@"DuckingModeValue"];
    uint64_t v12 = (int)[v11 intValue];

    v13 = +[AXSettings sharedInstance];
    [v13 setVoiceOverMediaDuckingMode:v12];
  }
  v14 = [(VoiceOverDuckingController *)self specifierForID:@"DuckingModeGroup"];
  id v15 = [(VoiceOverDuckingController *)self audioDuckingModeDescription];
  [v14 setProperty:v15 forKey:PSFooterTextGroupKey];

  [(VoiceOverDuckingController *)self reloadSpecifier:v14 animated:1];
}

- (id)audioDuckingModeDescription
{
  v2 = settingsLocString(@"AUDIO_DUCKING_ALWAYS_FOOTER", @"VoiceOverSettings");
  uint64_t v3 = +[AXSettings sharedInstance];
  id v4 = [v3 voiceOverMediaDuckingMode];

  if (v4)
  {
    id v5 = +[AXSettings sharedInstance];
    id v6 = (char *)[v5 voiceOverMediaDuckingMode];

    if (v6 != (unsigned char *)&dword_0 + 1) {
      goto LABEL_6;
    }
    id v7 = @"AUDIO_DUCKING_ONLY_SPEAKING_FOOTER";
  }
  else
  {
    id v7 = @"AUDIO_DUCKING_OFF_FOOTER";
  }
  uint64_t v8 = settingsLocString(v7, @"VoiceOverSettings");

  v2 = (void *)v8;
LABEL_6:

  return v2;
}

- (id)audioDuckingVolumeDescription
{
  if (AXDeviceIsPhone())
  {
    v2 = @"AUDIO_DUCKING_VOLUME_FOOTER_IPHONE";
LABEL_7:
    settingsLocString(v2, @"VoiceOverSettings");
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (AXDeviceIsPad())
  {
    v2 = @"AUDIO_DUCKING_VOLUME_FOOTER_IPAD";
    goto LABEL_7;
  }
  if (AXDeviceIsRealityDevice())
  {
    v2 = @"AUDIO_DUCKING_VOLUME_FOOTER_REALITY_DEVICE";
    goto LABEL_7;
  }
  uint64_t v3 = &stru_20F6B8;
LABEL_8:

  return v3;
}

@end