@interface MusicSettingsAudioQualityController
- (BOOL)cellularHighDataModeEnabled;
- (MusicSettingsAudioQualityController)init;
- (id)cellularDataEnabled;
- (id)deviceSupportsHiResLossless;
- (id)highBandwidthLabel;
- (id)stringsTable;
- (void)displayDowngradeAlertIfNeededWithCompletion:(id)a3;
- (void)setParentController:(id)a3;
- (void)setShowLosslessAudio:(id)a3 specifier:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation MusicSettingsAudioQualityController

- (MusicSettingsAudioQualityController)init
{
  v6.receiver = self;
  v6.super_class = (Class)MusicSettingsAudioQualityController;
  v2 = [(MusicSettingsAudioQualityController *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(MusicSettingsAudioQualityController *)v2 loadSpecifiersFromPlistName:@"MusicSettingsAudioQuality" target:v2];
    [(MusicSettingsAudioQualityController *)v3 setAllSpecifiers:v4];
  }
  return v3;
}

- (id)stringsTable
{
  return @"MusicSettings";
}

- (void)viewDidAppear:(BOOL)a3
{
  v21.receiver = self;
  v21.super_class = (Class)MusicSettingsAudioQualityController;
  [(MusicSettingsAudioQualityController *)&v21 viewDidAppear:a3];
  v20 = +[NSURL URLWithString:@"prefs:root=MUSIC&path=com.apple.Music:AudioQuality"];
  id v4 = objc_alloc((Class)_NSLocalizedStringResource);
  v5 = +[NSLocale currentLocale];
  objc_super v6 = +[NSBundle bundleForClass:objc_opt_class()];
  v7 = [v6 bundleURL];
  id v8 = [v4 initWithKey:@"APPS" table:@"MusicSettings" locale:v5 bundleURL:v7];

  id v9 = objc_alloc((Class)_NSLocalizedStringResource);
  v10 = +[NSLocale currentLocale];
  v11 = +[NSBundle bundleForClass:objc_opt_class()];
  v12 = [v11 bundleURL];
  id v13 = [v9 initWithKey:@"MUSIC" table:@"MusicSettings" locale:v10 bundleURL:v12];

  id v14 = objc_alloc((Class)_NSLocalizedStringResource);
  v15 = +[NSLocale currentLocale];
  v16 = +[NSBundle bundleForClass:objc_opt_class()];
  v17 = [v16 bundleURL];
  id v18 = [v14 initWithKey:@"AUDIO_QUALITY" table:@"MusicSettings" locale:v15 bundleURL:v17];

  v22[0] = v8;
  v22[1] = v13;
  v19 = +[NSArray arrayWithObjects:v22 count:2];
  [(MusicSettingsAudioQualityController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:@"com.apple.Music" title:v18 localizedNavigationComponents:v19 deepLink:v20];
}

- (void)setParentController:(id)a3
{
  id v4 = a3;
  id v5 = [(MusicSettingsAudioQualityController *)self parentViewController];
  v6.receiver = self;
  v6.super_class = (Class)MusicSettingsAudioQualityController;
  [(MusicSettingsAudioQualityController *)&v6 setParentController:v4];

  if (v4 && v5 != v4) {
    [(MusicSettingsAudioQualityController *)self reloadSpecifiers];
  }
}

- (BOOL)cellularHighDataModeEnabled
{
  v2 = (id *)&self->MusicSettingsListViewController_opaque[OBJC_IVAR___PSViewController__parentController];
  id WeakRetained = objc_loadWeakRetained(v2);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    return 0;
  }
  id v5 = objc_loadWeakRetained(v2);
  unsigned __int8 v6 = [v5 cellularHighDataModeEnabled];

  return v6;
}

- (void)setShowLosslessAudio:(id)a3 specifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MusicSettingsAudioQualityController *)self rootController];
  id v9 = v8;
  if (!v8) {
    id v8 = self;
  }
  [v8 setPreferenceValue:v7 specifier:v6];

  unsigned int v10 = [v7 BOOLValue];
  if (v10)
  {
    v11 = +[MPPlaybackUserDefaults standardUserDefaults];
    [v11 setPreferredMusicHighBandwidthResolution:48000];

    v12 = +[MPPlaybackUserDefaults standardUserDefaults];
    id v13 = v12;
    uint64_t v14 = 48000;
LABEL_11:
    [v12 setPreferredMusicDownloadResolution:v14];

    goto LABEL_12;
  }
  [(MusicSettingsAudioQualityController *)self displayDowngradeAlertIfNeededWithCompletion:&stru_187C8];
  v15 = +[MPPlaybackUserDefaults standardUserDefaults];
  id v16 = [v15 preferredMusicLowBandwidthResolution];

  if ((uint64_t)v16 >= 48000)
  {
    v17 = +[MPPlaybackUserDefaults standardUserDefaults];
    [v17 setPreferredMusicLowBandwidthResolution:256];
  }
  id v18 = +[MPPlaybackUserDefaults standardUserDefaults];
  id v19 = [v18 preferredMusicHighBandwidthResolution];

  if ((uint64_t)v19 >= 48000)
  {
    v20 = +[MPPlaybackUserDefaults standardUserDefaults];
    [v20 setPreferredMusicHighBandwidthResolution:256];
  }
  objc_super v21 = +[MPPlaybackUserDefaults standardUserDefaults];
  id v22 = [v21 preferredMusicDownloadResolution];

  if ((uint64_t)v22 >= 48000)
  {
    v12 = +[MPPlaybackUserDefaults standardUserDefaults];
    id v13 = v12;
    uint64_t v14 = 256;
    goto LABEL_11;
  }
LABEL_12:

  [(MusicSettingsAudioQualityController *)self updateVisibleSpecifiers];
}

- (id)cellularDataEnabled
{
  v2 = (id *)&self->MusicSettingsListViewController_opaque[OBJC_IVAR___PSViewController__parentController];
  id WeakRetained = objc_loadWeakRetained(v2);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = objc_loadWeakRetained(v2);
    id v6 = [v5 cellularDataEnabled];
  }
  else
  {
    id v6 = &__kCFBooleanFalse;
  }

  return v6;
}

- (id)deviceSupportsHiResLossless
{
  return &__kCFBooleanTrue;
}

- (id)highBandwidthLabel
{
  v3 = +[UIDevice currentDevice];
  unsigned int v4 = objc_msgSend(v3, "sf_isChinaRegionCellularDevice");

  unsigned int v5 = [(MusicSettingsAudioQualityController *)self cellularHighDataModeEnabled];
  id v6 = +[NSBundle bundleForClass:objc_opt_class()];
  id v7 = v6;
  CFStringRef v8 = @"FIVEG_AND_WIFI_STREAMING";
  if (v4) {
    CFStringRef v8 = @"FIVEG_AND_WLAN_STREAMING";
  }
  CFStringRef v9 = @"WLAN_STREAMING";
  if (!v4) {
    CFStringRef v9 = @"WIFI_STREAMING";
  }
  if (v5) {
    CFStringRef v10 = v8;
  }
  else {
    CFStringRef v10 = v9;
  }
  v11 = [v6 localizedStringForKey:v10 value:&stru_18CF0 table:@"MusicSettings"];

  return v11;
}

- (void)displayDowngradeAlertIfNeededWithCompletion:(id)a3
{
  unsigned int v4 = (void (**)(void))a3;
  unsigned int v5 = +[ML3MusicLibrary autoupdatingSharedLibrary];
  id v6 = +[ML3BitMaskPredicate predicateWithProperty:ML3TrackPropertyHLSAssetTraits mask:20 value:0];
  id v7 = +[ML3NegationPredicate predicateWithPredicate:v6];

  CFStringRef v8 = +[ML3ComparisonPredicate predicateWithProperty:ML3TrackPropertyHasNonPurgeableAsset value:&__kCFBooleanTrue comparison:1];
  v38[0] = v8;
  v38[1] = v7;
  CFStringRef v9 = +[NSArray arrayWithObjects:v38 count:2];
  CFStringRef v10 = +[ML3AllCompoundPredicate predicateMatchingPredicates:v9];
  v11 = +[ML3Track unrestrictedAllItemsQueryWithlibrary:v5 predicate:v10 orderingTerms:0];

  if ([v11 hasEntities])
  {
    v12 = +[UIDevice currentDevice];
    v29 = v11;
    unsigned int v13 = objc_msgSend(v12, "sf_isChinaRegionCellularDevice");

    uint64_t v14 = +[NSBundle bundleForClass:objc_opt_class()];
    v15 = objc_msgSend(v14, "localizedStringForKey:value:table:", @"LOSSLESS_DOWNGRADE_TITLE", &stru_18CF0);
    v31 = v7;
    id v16 = +[NSBundle bundleForClass:objc_opt_class()];
    v17 = v16;
    if (v13) {
      CFStringRef v18 = @"LOSSLESS_DOWNGRADE_WLAN_BODY";
    }
    else {
      CFStringRef v18 = @"LOSSLESS_DOWNGRADE_WIFI_BODY";
    }
    id v19 = objc_msgSend(v16, "localizedStringForKey:value:table:", v18, &stru_18CF0, @"MusicSettings", v29);
    v20 = +[UIAlertController alertControllerWithTitle:v15 message:v19 preferredStyle:1];

    objc_super v21 = +[NSBundle bundleForClass:objc_opt_class()];
    id v22 = [v21 localizedStringForKey:@"LOSSLESS_DOWNGRADE_ACTION_KEEP" value:&stru_18CF0 table:@"MusicSettings"];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_6A20;
    v36[3] = &unk_18658;
    v23 = v4;
    id v37 = v23;
    v24 = +[UIAlertAction actionWithTitle:v22 style:0 handler:v36];
    [v20 addAction:v24];

    v25 = +[NSBundle bundleForClass:objc_opt_class()];
    v26 = [v25 localizedStringForKey:@"LOSSLESS_DOWNGRADE_ACTION_REPLACE" value:&stru_18CF0 table:@"MusicSettings"];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_6A30;
    v32[3] = &unk_18840;
    v27 = v23;
    v11 = v30;
    id v35 = v27;
    id v33 = v30;
    id v34 = v5;
    v28 = +[UIAlertAction actionWithTitle:v26 style:1 handler:v32];
    [v20 addAction:v28];

    id v7 = v31;
    [(MusicSettingsAudioQualityController *)self presentViewController:v20 animated:1 completion:0];
  }
  else
  {
    v4[2](v4);
  }
}

@end