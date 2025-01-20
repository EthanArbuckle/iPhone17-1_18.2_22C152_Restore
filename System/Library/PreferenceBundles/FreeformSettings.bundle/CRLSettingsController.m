@interface CRLSettingsController
- (id)p_alignmentGuidesSpecifiers;
- (id)p_appAnalyticsResetUserIdentifierSpecifiers;
- (id)p_linkListSpecifierWithTitle:(id)a3 userDefaultKey:(id)a4 values:(id)a5 titles:(id)a6 shortTitles:(id)a7 rowIdentifier:(id)a8;
- (id)p_mathPaperSpecifiers;
- (id)p_pencilSpecifiers;
- (id)p_snapToGridSpecifiers;
- (id)p_switchSpecifierWithTitle:(id)a3 userDefaultKey:(id)a4 rowIdentifier:(id)a5;
- (id)p_systemPolicy;
- (id)p_systemPolicySpecifiers;
- (id)specifiers;
- (void)p_emitNavigationEventForRoot;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation CRLSettingsController

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CRLSettingsController;
  [(CRLSettingsController *)&v4 viewDidAppear:a3];
  [(CRLSettingsController *)self p_emitNavigationEventForRoot];
}

- (void)p_emitNavigationEventForRoot
{
  id v9 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.Apps/com.apple.freeform"];
  id v3 = objc_alloc((Class)_NSLocalizedStringResource);
  objc_super v4 = +[NSLocale currentLocale];
  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [v5 bundleURL];
  id v7 = [v3 initWithKey:@"Freeform" table:@"SettingsStrings" locale:v4 bundleURL:v6];

  v8 = CRLAppBundleIdentifier();
  [(CRLSettingsController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:v8 title:v7 localizedNavigationComponents:&__NSArray0__struct deepLink:v9];
}

- (id)specifiers
{
  id v3 = +[NSMutableArray array];
  objc_super v4 = [(CRLSettingsController *)self p_systemPolicySpecifiers];
  [v3 addObjectsFromArray:v4];

  if (_os_feature_enabled_impl())
  {
    v5 = [(CRLSettingsController *)self p_snapToGridSpecifiers];
    [v3 addObjectsFromArray:v5];
  }
  v6 = [(CRLSettingsController *)self p_alignmentGuidesSpecifiers];
  [v3 addObjectsFromArray:v6];

  id v7 = [(CRLSettingsController *)self p_pencilSpecifiers];
  [v3 addObjectsFromArray:v7];

  if (_os_feature_enabled_impl())
  {
    v8 = [(CRLSettingsController *)self p_mathPaperSpecifiers];
    [v3 addObjectsFromArray:v8];
  }
  if (_os_feature_enabled_impl())
  {
    id v9 = [(CRLSettingsController *)self p_appAnalyticsResetUserIdentifierSpecifiers];
    [v3 addObjectsFromArray:v9];
  }
  uint64_t v10 = OBJC_IVAR___PSListController__specifiers;
  v11 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] = v3;
  id v12 = v3;

  id v13 = *(id *)&self->PSListController_opaque[v10];
  return v13;
}

- (id)p_systemPolicy
{
  systemPolicy = self->_systemPolicy;
  if (!systemPolicy)
  {
    id v4 = objc_alloc((Class)PSSystemPolicyForApp);
    v5 = CRLAppBundleIdentifier();
    v6 = (PSSystemPolicyForApp *)[v4 initWithBundleIdentifier:v5];
    id v7 = self->_systemPolicy;
    self->_systemPolicy = v6;

    [(PSSystemPolicyForApp *)self->_systemPolicy setDelegate:self];
    systemPolicy = self->_systemPolicy;
  }

  return systemPolicy;
}

- (id)p_systemPolicySpecifiers
{
  v2 = [(CRLSettingsController *)self p_systemPolicy];
  id v3 = [v2 specifiersForPolicyOptions:-134348803 force:0];

  return v3;
}

- (id)p_mathPaperSpecifiers
{
  v2 = +[PSSpecifier groupSpecifierWithID:@"Math Results"];
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"Math Results" value:0 table:@"SettingsStrings"];

  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"Insert Results" value:0 table:@"SettingsStrings"];
  v17[0] = v6;
  id v7 = +[NSBundle bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"Suggest Results" value:0 table:@"SettingsStrings"];
  v17[1] = v8;
  id v9 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v10 = [v9 localizedStringForKey:@"Off" value:0 table:@"SettingsStrings"];
  v17[2] = v10;
  v11 = +[NSArray arrayWithObjects:v17 count:3];

  id v12 = [(CRLSettingsController *)self p_linkListSpecifierWithTitle:v4 userDefaultKey:@"CRLMathRecognitionMode" values:&off_4D90 titles:v11 shortTitles:0 rowIdentifier:@"MATH_HINTS"];
  v16[0] = v2;
  v16[1] = v12;
  id v13 = +[NSArray arrayWithObjects:v16 count:2];

  return v13;
}

- (id)p_snapToGridSpecifiers
{
  id v3 = +[PSSpecifier groupSpecifierWithID:@"Snap to Grid"];
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"Snap to Grid" value:0 table:@"SettingsStrings"];

  v6 = [(CRLSettingsController *)self p_switchSpecifierWithTitle:v5 userDefaultKey:@"CRLSnapToGrid" rowIdentifier:@"SNAP_TO_GRID"];
  v9[0] = v3;
  v9[1] = v6;
  id v7 = +[NSArray arrayWithObjects:v9 count:2];

  return v7;
}

- (id)p_alignmentGuidesSpecifiers
{
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"Alignment Guides" value:0 table:@"SettingsStrings"];

  v5 = +[PSSpecifier groupSpecifierWithName:v4];
  v6 = +[NSBundle bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"Center Guides" value:0 table:@"SettingsStrings"];

  v8 = [(CRLSettingsController *)self p_switchSpecifierWithTitle:v7 userDefaultKey:@"CRLDisplayCenterGuides" rowIdentifier:@"CENTER_GUIDES"];
  id v9 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v10 = [v9 localizedStringForKey:@"Edge Guides" value:0 table:@"SettingsStrings"];

  v11 = [(CRLSettingsController *)self p_switchSpecifierWithTitle:v10 userDefaultKey:@"CRLDisplayEdgeGuides" rowIdentifier:@"EDGE_GUIDES"];
  id v12 = +[NSBundle bundleForClass:objc_opt_class()];
  id v13 = [v12 localizedStringForKey:@"Spacing Guides" value:0 table:@"SettingsStrings"];

  v14 = [(CRLSettingsController *)self p_switchSpecifierWithTitle:v13 userDefaultKey:@"CRLDisplaySpacingGuides" rowIdentifier:@"SPACING_GUIDES"];
  v17[0] = v5;
  v17[1] = v8;
  v17[2] = v11;
  void v17[3] = v14;
  v15 = +[NSArray arrayWithObjects:v17 count:4];

  return v15;
}

- (id)p_pencilSpecifiers
{
  if (MGGetBoolAnswer())
  {
    id v3 = +[NSBundle bundleForClass:objc_opt_class()];
    id v4 = [v3 localizedStringForKey:@"Apple Pencil" value:0 table:@"SettingsStrings"];

    v5 = +[PSSpecifier groupSpecifierWithName:v4];
    v6 = +[NSBundle bundleForClass:objc_opt_class()];
    id v7 = [v6 localizedStringForKey:@"Use Apple Pencil for selecting objects and scrolling the board." value:0 table:@"SettingsStrings"];

    [v5 setObject:v7 forKeyedSubscript:PSFooterTextGroupKey];
    v8 = +[NSBundle bundleForClass:objc_opt_class()];
    id v9 = [v8 localizedStringForKey:@"Select and Scroll" value:0 table:@"SettingsStrings"];

    uint64_t v10 = [(CRLSettingsController *)self p_switchSpecifierWithTitle:v9 userDefaultKey:@"CRLSelectAndScrollWithApplePencil" rowIdentifier:@"SELECT_AND_SCROLL"];
    v13[0] = v5;
    v13[1] = v10;
    v11 = +[NSArray arrayWithObjects:v13 count:2];
  }
  else
  {
    v11 = &__NSArray0__struct;
  }

  return v11;
}

- (id)p_appAnalyticsResetUserIdentifierSpecifiers
{
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"Privacy" value:0 table:@"SettingsStrings"];

  v5 = +[PSSpecifier groupSpecifierWithName:v4];
  v6 = +[NSBundle bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"Turn on to reset the identifier used by Freeform to report statistics to Apple. The identifier will be reset the next time you open the app. To stop reporting statistics, turn off sharing device analytics in Privacy & Security > Analytics & Improvements.", 0, @"SettingsStrings" value table];

  [v5 setObject:v7 forKeyedSubscript:PSFooterTextGroupKey];
  v8 = +[NSBundle bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"Reset Identifier" value:0 table:@"SettingsStrings"];

  uint64_t v10 = [(CRLSettingsController *)self p_switchSpecifierWithTitle:v9 userDefaultKey:@"CRLAppAnalyticsResetIdentifier" rowIdentifier:@"RESET_IDENTIFIER"];
  v13[0] = v5;
  v13[1] = v10;
  v11 = +[NSArray arrayWithObjects:v13 count:2];

  return v11;
}

- (id)p_switchSpecifierWithTitle:(id)a3 userDefaultKey:(id)a4 rowIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = +[PSSpecifier preferenceSpecifierNamed:a3 target:self set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:0 cell:6 edit:0];
  [v10 setIdentifier:v8];

  id v11 = [v9 copy];
  [v10 setObject:v11 forKeyedSubscript:PSKeyNameKey];

  id v12 = +[CRLUserDefaults defaultDefaults];
  id v13 = [v12 objectForKeyedSubscript:v9];

  [v10 setObject:v13 forKeyedSubscript:PSDefaultValueKey];
  v14 = CRLAppBundleIdentifier();
  [v10 setObject:v14 forKeyedSubscript:PSDefaultsKey];

  return v10;
}

- (id)p_linkListSpecifierWithTitle:(id)a3 userDefaultKey:(id)a4 values:(id)a5 titles:(id)a6 shortTitles:(id)a7 rowIdentifier:(id)a8
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  v19 = +[PSSpecifier preferenceSpecifierNamed:v18 target:self set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:objc_opt_class() cell:2 edit:0];

  [v19 setIdentifier:v13];
  id v20 = [v17 copy];
  [v19 setObject:v20 forKeyedSubscript:PSKeyNameKey];

  v21 = +[CRLUserDefaults defaultDefaults];
  v22 = [v21 objectForKeyedSubscript:v17];

  [v19 setObject:v22 forKeyedSubscript:PSDefaultValueKey];
  v23 = CRLAppBundleIdentifier();
  [v19 setObject:v23 forKeyedSubscript:PSDefaultsKey];

  [v19 setValues:v16 titles:v15 shortTitles:v14 usingLocalizedTitleSorting:0];

  return v19;
}

- (void).cxx_destruct
{
}

@end