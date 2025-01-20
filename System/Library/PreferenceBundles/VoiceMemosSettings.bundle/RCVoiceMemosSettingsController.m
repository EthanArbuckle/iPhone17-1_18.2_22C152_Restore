@interface RCVoiceMemosSettingsController
- (PSSystemPolicyForApp)appPolicy;
- (id)specifiers;
- (void)_updateSettingsPage;
- (void)dealloc;
- (void)setAppPolicy:(id)a3;
- (void)setPreferenceValue:(id)a3 specifier:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation RCVoiceMemosSettingsController

- (id)specifiers
{
  v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v36 = OBJC_IVAR___PSListController__specifiers;
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_2DC0;
    v38[3] = &unk_4178;
    v38[4] = self;
    v4 = objc_retainBlock(v38);
    v5 = RCLocalizedFrameworkString();
    [(RCVoiceMemosSettingsController *)self setTitle:v5];

    id v6 = objc_alloc((Class)PSSystemPolicyForApp);
    id v7 = [v6 initWithBundleIdentifier:RCVoiceMemosBundleID];
    [(RCVoiceMemosSettingsController *)self setAppPolicy:v7];

    v8 = [(RCVoiceMemosSettingsController *)self appPolicy];
    v9 = [v8 specifiers];
    id v10 = [v9 mutableCopy];

    v11 = RCLocalizedFrameworkString();
    uint64_t v12 = +[PSSpecifier groupSpecifierWithID:@"Voice Memos Settings" name:v11];

    v37 = (void *)v12;
    [v10 addObject:v12];
    v13 = RCLocalizedFrameworkString();
    uint64_t v14 = objc_opt_class();
    v35 = v4;
    v15 = (void (**)(char *, void *, uint64_t, uint64_t, const __CFString *, _UNKNOWN **))(v4 + 16);
    v16 = (*((void (**)(char *, void *, uint64_t, uint64_t, const __CFString *, _UNKNOWN **))v4 + 2))(v4, v13, 2, v14, @"RCVoiceMemosRecentlyDeletedWindowKey", &off_4500);

    v17 = RCLocalizedFrameworkString();
    v40[0] = v17;
    v18 = RCLocalizedFrameworkString();
    v40[1] = v18;
    v19 = RCLocalizedFrameworkString();
    v40[2] = v19;
    v20 = RCLocalizedFrameworkString();
    v40[3] = v20;
    v21 = RCLocalizedFrameworkString();
    v40[4] = v21;
    v22 = +[NSArray arrayWithObjects:v40 count:5];

    [v16 setValues:&off_45B0 titles:v22];
    [v10 addObject:v16];
    v23 = RCLocalizedFrameworkString();
    uint64_t v24 = objc_opt_class();
    v25 = (*v15)(v35, v23, 2, v24, @"RCVoiceMemosAudioQualityKey", &off_4518);

    v26 = RCLocalizedFrameworkString();
    v39[0] = v26;
    v27 = RCLocalizedFrameworkString();
    v39[1] = v27;
    v28 = +[NSArray arrayWithObjects:v39 count:2];

    [v25 setValues:&off_45C8 titles:v28];
    [v10 addObject:v25];
    v29 = RCLocalizedFrameworkString();
    v30 = (*v15)(v35, v29, 6, 0, @"RCVoiceMemosUseLocationBasedNaming", &__kCFBooleanTrue);

    [v30 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
    [v10 addObject:v30];
    if (RCStereoRecordingIsAvailable())
    {
      v31 = RCLocalizedFrameworkString();
      v32 = (*((void (**)(char *, void *, uint64_t, void, const __CFString *, void *))v35 + 2))(v35, v31, 6, 0, @"RCVoiceMemosStereoRecordingKey", &__kCFBooleanFalse);

      [v10 addObject:v32];
    }
    v33 = *(void **)&self->PSListController_opaque[v36];
    *(void *)&self->PSListController_opaque[v36] = v10;

    v3 = *(void **)&self->PSListController_opaque[v36];
  }

  return v3;
}

- (void)setPreferenceValue:(id)a3 specifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)RCVoiceMemosSettingsController;
  id v6 = a4;
  [(RCVoiceMemosSettingsController *)&v7 setPreferenceValue:a3 specifier:v6];
  -[RCVoiceMemosSettingsController reloadSpecifier:](self, "reloadSpecifier:", v6, v7.receiver, v7.super_class);
}

- (void)viewDidAppear:(BOOL)a3
{
  v18.receiver = self;
  v18.super_class = (Class)RCVoiceMemosSettingsController;
  [(RCVoiceMemosSettingsController *)&v18 viewDidAppear:a3];
  v4 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.Apps/com.apple.VoiceMemos"];
  id v5 = objc_alloc((Class)_NSLocalizedStringResource);
  id v6 = +[NSLocale currentLocale];
  uint64_t v7 = RCVoiceMemosFrameworkBundleID;
  v8 = +[NSBundle bundleWithIdentifier:RCVoiceMemosFrameworkBundleID];
  v9 = [v8 bundleURL];
  id v10 = [v5 initWithKey:@"VOICE_MEMOS_APP_NAME" table:0 locale:v6 bundleURL:v9];

  id v11 = objc_alloc((Class)_NSLocalizedStringResource);
  uint64_t v12 = +[NSLocale currentLocale];
  v13 = +[NSBundle bundleWithIdentifier:v7];
  uint64_t v14 = [v13 bundleURL];
  id v15 = [v11 initWithKey:@"SETTINGS_NAVIGATION_DONATION_SUBTITLE" table:0 locale:v12 bundleURL:v14];

  uint64_t v16 = RCVoiceMemosBundleID;
  id v19 = v15;
  v17 = +[NSArray arrayWithObjects:&v19 count:1];
  [(RCVoiceMemosSettingsController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:v16 title:v10 localizedNavigationComponents:v17 deepLink:v4];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)RCVoiceMemosSettingsController;
  [(RCVoiceMemosSettingsController *)&v4 viewDidLoad];
  v3 = +[NSDistributedNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_updateSettingsPage" name:RCVoiceMemosSettingsDidChangeNotification object:0];
}

- (void)_updateSettingsPage
{
}

- (void)dealloc
{
  v3 = +[NSDistributedNotificationCenter defaultCenter];
  [v3 removeObserver:self name:RCVoiceMemosSettingsDidChangeNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)RCVoiceMemosSettingsController;
  [(RCVoiceMemosSettingsController *)&v4 dealloc];
}

- (PSSystemPolicyForApp)appPolicy
{
  return self->_appPolicy;
}

- (void)setAppPolicy:(id)a3
{
}

- (void).cxx_destruct
{
}

@end