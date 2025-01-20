@interface FitnessSettingsController
- (PSSystemPolicyForApp)appPolicy;
- (id)_getFitnessPlusPersonalizationPrivacyPreference;
- (id)specifiers;
- (void)_presentActivitySharingPrivacy;
- (void)_presentFitnessPlusPrivacy;
- (void)_presentPrivacyWithIdentifier:(id)a3;
- (void)_setFitnessPlusPersonalizationPrivacyPreference:(id)a3;
- (void)setAppPolicy:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation FitnessSettingsController

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)FitnessSettingsController;
  [(FitnessSettingsController *)&v6 viewDidLoad];
  v3 = objc_alloc_init(CHSeymourPrivacyPreferenceProvider);
  seymourPrivacyPreferenceProvider = self->_seymourPrivacyPreferenceProvider;
  self->_seymourPrivacyPreferenceProvider = v3;

  hasOptedInForPersonalizationRecommendation = self->_hasOptedInForPersonalizationRecommendation;
  self->_hasOptedInForPersonalizationRecommendation = 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FitnessSettingsController;
  [(FitnessSettingsController *)&v6 viewWillAppear:a3];
  seymourPrivacyPreferenceProvider = self->_seymourPrivacyPreferenceProvider;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_299C;
  v5[3] = &unk_8418;
  v5[4] = self;
  [(CHSeymourPrivacyPreferenceProvider *)seymourPrivacyPreferenceProvider fetchPersonalizationPrivacyPreferenceWithCompletion:v5];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = +[NSMutableArray array];
    objc_super v6 = [(FitnessSettingsController *)self appPolicy];

    if (!v6)
    {
      id v7 = [objc_alloc((Class)PSSystemPolicyForApp) initWithBundleIdentifier:@"com.apple.Fitness"];
      [(FitnessSettingsController *)self setAppPolicy:v7];

      v8 = [(FitnessSettingsController *)self appPolicy];
      [v8 setDelegate:self];
    }
    v9 = [(FitnessSettingsController *)self appPolicy];
    v35 = [v9 specifiersForPolicyOptions:0x10000808001 force:0];

    [v5 addObjectsFromArray:v35];
    v10 = +[NSBundle bundleForClass:objc_opt_class()];
    v11 = [v10 localizedStringForKey:@"FITNESS_PLUS_PRIVACY_SECTION" value:&stru_87C8 table:@"Localizable"];
    v12 = +[PSSpecifier groupSpecifierWithName:v11];

    v13 = +[NSBundle bundleForClass:objc_opt_class()];
    v14 = [v13 localizedStringForKey:@"FITNESS_PLUS_PERSONALIZATION_PRIVACY_FOOTER" value:&stru_87C8 table:@"Localizable"];
    v34 = v12;
    [v12 setProperty:v14 forKey:PSFooterTextGroupKey];

    [v5 addObject:v12];
    id v15 = objc_alloc((Class)PSSpecifier);
    v16 = +[NSBundle bundleForClass:objc_opt_class()];
    v17 = [v16 localizedStringForKey:@"FITNESS_PLUS_PERSONALIZATION_PRIVACY_SWITCH" value:&stru_87C8 table:@"Localizable"];
    id v33 = [v15 initWithName:v17 target:self set:"_setFitnessPlusPersonalizationPrivacyPreference:" get:"_getFitnessPlusPersonalizationPrivacyPreference" detail:0 cell:6 edit:0];

    uint64_t v18 = PSAllowMultilineTitleKey;
    [v33 setObject:&__kCFBooleanTrue forKeyedSubscript:PSAllowMultilineTitleKey];
    [v5 addObject:v33];
    v19 = +[PSSpecifier emptyGroupSpecifier];
    [v5 addObject:v19];

    id v20 = objc_alloc((Class)PSSpecifier);
    v21 = +[NSBundle bundleForClass:objc_opt_class()];
    v22 = [v21 localizedStringForKey:@"PRIVACY_PRESENT_BUTTON" value:&stru_87C8 table:@"Localizable"];
    id v23 = [v20 initWithName:v22 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v23 setButtonAction:"_presentFitnessPlusPrivacy"];
    [v23 setObject:&__kCFBooleanTrue forKeyedSubscript:v18];
    [v5 addObject:v23];
    v24 = +[NSBundle bundleForClass:objc_opt_class()];
    v25 = [v24 localizedStringForKey:@"ACTIVITY_SHARING_PRIVACY_SECTION" value:&stru_87C8 table:@"Localizable"];
    v26 = +[PSSpecifier groupSpecifierWithName:v25];
    [v5 addObject:v26];

    id v27 = objc_alloc((Class)PSSpecifier);
    v28 = +[NSBundle bundleForClass:objc_opt_class()];
    v29 = [v28 localizedStringForKey:@"PRIVACY_PRESENT_BUTTON" value:&stru_87C8 table:@"Localizable"];
    id v30 = [v27 initWithName:v29 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v30 setButtonAction:"_presentActivitySharingPrivacy"];
    [v30 setObject:&__kCFBooleanTrue forKeyedSubscript:v18];
    [v5 addObject:v30];
    v31 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v5;

    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (void)_presentFitnessPlusPrivacy
{
}

- (void)_presentActivitySharingPrivacy
{
}

- (void)_presentPrivacyWithIdentifier:(id)a3
{
  id v4 = +[OBPrivacyPresenter presenterForPrivacySplashWithIdentifier:a3];
  [v4 setPresentingViewController:self];
  [v4 present];
}

- (id)_getFitnessPlusPersonalizationPrivacyPreference
{
  return self->_hasOptedInForPersonalizationRecommendation;
}

- (void)_setFitnessPlusPersonalizationPrivacyPreference:(id)a3
{
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
  objc_storeStrong((id *)&self->_appPolicy, 0);
  objc_storeStrong((id *)&self->_hasOptedInForPersonalizationRecommendation, 0);

  objc_storeStrong((id *)&self->_seymourPrivacyPreferenceProvider, 0);
}

@end