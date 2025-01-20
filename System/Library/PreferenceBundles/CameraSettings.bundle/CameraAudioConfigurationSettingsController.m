@interface CameraAudioConfigurationSettingsController
+ (id)titleForSelectedAudioConfiguration;
- (id)specifiers;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation CameraAudioConfigurationSettingsController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->super.PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (v4) {
    goto LABEL_23;
  }
  v5 = +[CameraSettingsBaseController capabilities];
  id v6 = objc_alloc_init((Class)NSMutableArray);
  v7 = +[PSSpecifier groupSpecifierWithID:@"AudioConfigurationGroupSpecifierID"];
  [v7 setProperty:@"AudioConfigurationGroupSpecifierID" forKey:PSIDKey];
  [v7 setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
  v8 = sub_E464(@"CAM_AUDIO_CONFIGURATION_CINEMATIC");
  v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:0 get:0 detail:0 cell:3 edit:0];

  uint64_t v10 = PSValueKey;
  [v9 setProperty:&off_24820 forKey:PSValueKey];
  v11 = sub_E464(@"CAM_AUDIO_CONFIGURATION_STEREO");
  v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:0 get:0 detail:0 cell:3 edit:0];

  [v12 setProperty:&off_24838 forKey:v10];
  v13 = sub_E464(@"CAM_AUDIO_CONFIGURATION_MONO");
  v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:self set:0 get:0 detail:0 cell:3 edit:0];

  [v14 setProperty:&off_24850 forKey:v10];
  [v6 addObject:v7];
  if ([v5 isCinematicAudioSupported]) {
    [v6 addObject:v9];
  }
  if ([v5 isStereoAudioRecordingSupported]) {
    [v6 addObject:v12];
  }
  [v6 addObject:v14];
  if ([v5 isCinematicAudioSupported])
  {
    if ([v5 isCinematicModeSupported]) {
      v15 = @"CAM_AUDIO_CONFIGURATION_CINEMATIC_FOOTER";
    }
    else {
      v15 = @"CAM_AUDIO_CONFIGURATION_NO_CINEMATIC_FOOTER";
    }
    v16 = sub_E464(v15);
    [v7 setProperty:v16 forKey:PSFooterTextGroupKey];
  }
  v17 = (char *)[(id)objc_opt_class() selectedAudioConfigurationForCapabilities:v5];
  v18 = v17;
  v19 = v14;
  if (v17 == (unsigned char *)&dword_0 + 1) {
    goto LABEL_16;
  }
  if (v17 == (unsigned char *)&dword_0 + 3)
  {
    v19 = v9;
    goto LABEL_16;
  }
  v19 = v12;
  if (v17 == (unsigned char *)&dword_0 + 2)
  {
LABEL_16:
    id v20 = v19;
    goto LABEL_17;
  }
  id v20 = 0;
LABEL_17:
  v36 = v20;
  [v7 setProperty:v20 forKey:PSRadioGroupCheckedSpecifierKey];
  v37 = v9;
  if ([v5 isMixAudioWithOthersSupported])
  {
    +[PSSpecifier groupSpecifierWithID:@"AllowAudioPlaybackGroupID"];
    v21 = v35 = v7;
    v22 = sub_E464(@"CAM_VIDEO_RECORDING_MIX_AUDIO_WITH_OTHERS_FOOTER");
    [v21 setProperty:v22 forKey:PSFooterTextGroupKey];

    sub_E464(@"CAM_VIDEO_RECORDING_MIX_AUDIO_WITH_OTHERS_TITLE");
    v24 = v23 = v12;
    v25 = +[PSSpecifier preferenceSpecifierNamed:v24 target:self set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:0 cell:6 edit:0];

    v12 = v23;
    [v25 setObject:@"com.apple.camera" forKeyedSubscript:PSDefaultsKey];
    [v25 setObject:CAMUserPreferenceMixAudioWithOthers forKeyedSubscript:PSKeyNameKey];
    [v25 setObject:&__kCFBooleanTrue forKeyedSubscript:PSDefaultValueKey];
    [v6 addObject:v21];
    [v6 addObject:v25];

    v9 = v37;
    v7 = v35;
  }
  unsigned int v26 = [v5 isWindRemovalSupported];
  if (v18 != (unsigned char *)&dword_0 + 1 && v26)
  {
    v27 = +[PSSpecifier groupSpecifierWithID:@"WindRemovalGroupSpecifierID"];
    v28 = sub_E464(@"CAM_AUDIO_WIND_REMOVAL_FOOTER");
    [v27 setProperty:v28 forKey:PSFooterTextGroupKey];

    sub_E464(@"CAM_AUDIO_WIND_REMOVAL_TITLE");
    v30 = v29 = v12;
    v31 = +[PSSpecifier preferenceSpecifierNamed:v30 target:self set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:0 cell:6 edit:0];

    v12 = v29;
    [v31 setObject:@"com.apple.camera" forKeyedSubscript:PSDefaultsKey];
    [v31 setObject:CAMUserPreferenceAudioWindRemoval forKeyedSubscript:PSKeyNameKey];
    [v31 setObject:&__kCFBooleanTrue forKeyedSubscript:PSDefaultValueKey];
    [v6 addObject:v27];
    [v6 addObject:v31];

    v9 = v37;
  }
  [(id)objc_opt_class() allowMultilineTitlesForSpecifiers:v6];
  id v32 = [v6 copy];
  v33 = *(void **)&self->super.PSListController_opaque[v3];
  *(void *)&self->super.PSListController_opaque[v3] = v32;

  v4 = *(void **)&self->super.PSListController_opaque[v3];
LABEL_23:

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CameraAudioConfigurationSettingsController;
  [(CameraAudioConfigurationSettingsController *)&v13 tableView:a3 didSelectRowAtIndexPath:v6];
  v7 = [(CameraAudioConfigurationSettingsController *)self specifierForID:@"AudioConfigurationGroupSpecifierID"];
  if (v7)
  {
    v8 = [(CameraAudioConfigurationSettingsController *)self indexPathForSpecifier:v7];
    uint64_t v9 = (uint64_t)[v8 section];
  }
  else
  {
    uint64_t v9 = -1;
  }
  if ([v6 section] == (id)v9)
  {
    uint64_t v10 = [(CameraAudioConfigurationSettingsController *)self specifierAtIndexPath:v6];
    v11 = [v10 propertyForKey:PSValueKey];
    id v12 = [v11 integerValue];
    CFPreferencesSetAppValue(CAMUserPreferenceAudioConfiguration, +[NSNumber numberWithUnsignedInteger:v12], @"com.apple.camera");
    CFPreferencesAppSynchronize(@"com.apple.camera");
    [(CameraSettingsBaseController *)self reloadSpecifiers];
  }
}

+ (id)titleForSelectedAudioConfiguration
{
  v2 = +[CameraSettingsBaseController capabilities];
  unint64_t v3 = (unint64_t)[(id)objc_opt_class() selectedAudioConfigurationForCapabilities:v2] - 1;
  if (v3 > 2)
  {
    v4 = &stru_20A70;
  }
  else
  {
    sub_E464(off_208E8[v3]);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

@end