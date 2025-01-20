@interface TrackingProtectionPane
- (PSListController)parentListController;
- (id)_detailedSettingsWithOptions:(unint64_t)a3;
- (id)_loadRemoteContentSpecifier;
- (id)_preventTrackingSpecifiersWithOptions:(unint64_t)a3;
- (id)readPreferenceValue:(id)a3;
- (id)specifiers;
- (void)_mailPrivacyProtectionLearnMoreLinkTapped:(id)a3;
- (void)setParentListController:(id)a3;
- (void)setPreferenceValue:(id)a3 specifier:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TrackingProtectionPane

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)TrackingProtectionPane;
  [(TrackingProtectionPane *)&v5 viewDidLoad];
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"TRACKING_PROTECTION" value:&stru_39200 table:@"Preferences"];
  [(TrackingProtectionPane *)self setTitle:v4];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TrackingProtectionPane;
  [(TrackingProtectionPane *)&v5 viewDidAppear:a3];
  v4 = [(TrackingProtectionPane *)self parentController];
  [(TrackingProtectionPane *)self setParentListController:v4];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TrackingProtectionPane;
  [(TrackingProtectionPane *)&v5 viewWillDisappear:a3];
  v4 = [(TrackingProtectionPane *)self parentListController];
  [v4 reloadSpecifier:*(void *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__specifier]];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TrackingProtectionPane;
  [(TrackingProtectionPane *)&v4 viewDidDisappear:a3];
  [(TrackingProtectionPane *)self setParentListController:0];
}

- (id)readPreferenceValue:(id)a3
{
  id v3 = a3;
  objc_super v4 = +[NSUserDefaults em_userDefaults];
  unint64_t v5 = (unint64_t)[v4 integerForKey:EMUserDefaultLoadRemoteContentKey];

  v6 = [v3 identifier];
  unsigned int v7 = [v6 isEqualToString:@"justSayNoToTracking"];

  if (v7)
  {
    BOOL v8 = (v5 & 8) == 0;
    goto LABEL_5;
  }
  v9 = [v3 identifier];
  unsigned int v10 = [v9 isEqualToString:@"justALittleTrackingPlease"];

  if (v10)
  {
    BOOL v8 = (v5 & 4) == 0;
LABEL_5:
    uint64_t v11 = v8;
    goto LABEL_11;
  }
  v12 = [v3 identifier];
  unsigned int v13 = [v12 isEqualToString:@"blockRemoteContent"];

  if (v13) {
    uint64_t v11 = (v5 >> 1) & 1;
  }
  else {
    uint64_t v11 = 1;
  }
LABEL_11:
  v14 = +[NSNumber numberWithBool:v11];

  return v14;
}

- (void)setPreferenceValue:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector())
  {
    BOOL v8 = +[NSUserDefaults em_userDefaults];
    uint64_t v9 = EMUserDefaultLoadRemoteContentKey;
    unint64_t v10 = (unint64_t)[v8 integerForKey:EMUserDefaultLoadRemoteContentKey];
    unsigned int v11 = [v6 BOOLValue];
    v12 = [v7 identifier];
    unsigned int v13 = [v12 isEqualToString:@"justSayNoToTracking"];

    if (v13)
    {
      unint64_t v14 = v10 | 8;
      if (v11) {
        unint64_t v14 = 0;
      }
    }
    else
    {
      v15 = [v7 identifier];
      unsigned int v16 = [v15 isEqualToString:@"justALittleTrackingPlease"];

      if (v16)
      {
        unint64_t v14 = v10 | 4;
        if (v11) {
          unint64_t v14 = v10 & 0xFFFFFFFFFFFFFFFBLL;
        }
      }
      else
      {
        v17 = [v7 identifier];
        unsigned int v18 = [v17 isEqualToString:@"blockRemoteContent"];

        unint64_t v14 = v10 & 0xFFFFFFFFFFFFFFFDLL;
        if (v11) {
          unint64_t v14 = v10 | 2;
        }
        if (!v18) {
          unint64_t v14 = v10;
        }
      }
    }
    if ((v14 | 1) != v10)
    {
      [v8 setInteger:v14 | 1 forKey:v9];
      v19 = +[MFNanoBridgeSettingsManager sharedInstance];
      [v19 notifyMobileMailLoadRemoteImagesChanged];

      v20 = +[MFNanoBridgeSettingsManager sharedInstance];
      [v20 notifyMobileMailPrivacyProtectionChanged];

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_20548;
      block[3] = &unk_38F48;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  if (!*(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers])
  {
    objc_super v4 = +[NSUserDefaults em_userDefaults];
    id v5 = [v4 integerForKey:EMUserDefaultLoadRemoteContentKey];

    id v6 = +[MCProfileConnection sharedConnection];
    unsigned int v7 = [v6 isMailPrivacyProtectionAllowed];

    if (v7)
    {
      BOOL v8 = [(TrackingProtectionPane *)self _preventTrackingSpecifiersWithOptions:v5];
      v17[0] = v8;
      uint64_t v9 = [(TrackingProtectionPane *)self _detailedSettingsWithOptions:v5];
      v17[1] = v9;
      unint64_t v10 = +[NSArray arrayWithObjects:v17 count:2];
      uint64_t v11 = objc_msgSend(v10, "ef_flatten");
      v12 = *(void **)&self->PSListController_opaque[v3];
      *(void *)&self->PSListController_opaque[v3] = v11;
    }
    else
    {
      BOOL v8 = [(TrackingProtectionPane *)self _loadRemoteContentSpecifier];
      unsigned int v16 = v8;
      uint64_t v13 = +[NSArray arrayWithObjects:&v16 count:1];
      uint64_t v9 = *(void **)&self->PSListController_opaque[v3];
      *(void *)&self->PSListController_opaque[v3] = v13;
    }
  }
  unint64_t v14 = *(void **)&self->PSListController_opaque[v3];

  return v14;
}

- (id)_preventTrackingSpecifiersWithOptions:(unint64_t)a3
{
  objc_super v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"PROTECT_FROM_TRACKING" value:&stru_39200 table:@"Preferences"];
  id v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:0 cell:6 edit:0];

  [v6 setIdentifier:@"justSayNoToTracking"];
  [v6 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
  unsigned int v7 = +[NSBundle bundleForClass:objc_opt_class()];
  BOOL v8 = [v7 localizedStringForKey:@"TRACKING_PROTECTION_LEARN_MORE" value:&stru_39200 table:@"Preferences"];

  uint64_t v9 = +[NSBundle bundleForClass:objc_opt_class()];
  unint64_t v10 = [v9 localizedStringForKey:@"TRACKING_PROTECTION_EXPLANATION" value:&stru_39200 table:@"Preferences"];
  uint64_t v11 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v8);

  v12 = +[PSSpecifier groupSpecifierWithID:@"TRACKING_PROTECTION_EXPLANATION_FOOTER"];
  uint64_t v13 = (objc_class *)objc_opt_class();
  unint64_t v14 = NSStringFromClass(v13);
  [v12 setObject:v14 forKeyedSubscript:PSFooterCellClassGroupKey];

  [v12 setObject:v11 forKeyedSubscript:PSFooterHyperlinkViewTitleKey];
  v21.location = (NSUInteger)[v11 rangeOfString:v8];
  v15 = NSStringFromRange(v21);
  [v12 setObject:v15 forKeyedSubscript:PSFooterHyperlinkViewLinkRangeKey];

  unsigned int v16 = +[NSValue valueWithNonretainedObject:self];
  [v12 setObject:v16 forKeyedSubscript:PSFooterHyperlinkViewTargetKey];

  [v12 setObject:@"_mailPrivacyProtectionLearnMoreLinkTapped:" forKeyedSubscript:PSFooterHyperlinkViewActionKey];
  v19[0] = v12;
  v19[1] = v6;
  v17 = +[NSArray arrayWithObjects:v19 count:2];

  return v17;
}

- (void)_mailPrivacyProtectionLearnMoreLinkTapped:(id)a3
{
  id v4 = objc_alloc((Class)OBTextWelcomeController);
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"TRACKING_PROTECTION_PRIVACY_TITLE" value:&stru_39200 table:@"Preferences"];
  unsigned int v7 = +[NSBundle bundleForClass:objc_opt_class()];
  BOOL v8 = [v7 localizedStringForKey:@"TRACKING_PROTECTION_PRIVACY_TEXT" value:&stru_39200 table:@"Preferences"];
  id v9 = [v4 initWithTitle:v6 detailText:v8 symbolName:0];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v9);
  id v10 = objc_alloc((Class)UIBarButtonItem);
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  v17 = sub_20D48;
  unsigned int v18 = &unk_38F70;
  objc_copyWeak(&v19, &location);
  uint64_t v11 = +[UIAction actionWithHandler:&v15];
  id v12 = objc_msgSend(v10, "initWithBarButtonSystemItem:primaryAction:", 0, v11, v15, v16, v17, v18);
  uint64_t v13 = [v9 navigationItem];
  [v13 setRightBarButtonItem:v12];

  id v14 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v9];
  [(TrackingProtectionPane *)self presentViewController:v14 animated:1 completion:0];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (id)_detailedSettingsWithOptions:(unint64_t)a3
{
  if ((a3 & 8) != 0)
  {
    id v5 = +[NSBundle bundleForClass:objc_opt_class()];
    id v6 = [v5 localizedStringForKey:@"HIDE_IP_ADDRESS" value:&stru_39200 table:@"Preferences"];
    unsigned int v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:self set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:0 cell:6 edit:0];

    [v7 setIdentifier:@"justALittleTrackingPlease"];
    [v7 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
    BOOL v8 = +[PSSpecifier groupSpecifierWithID:0];
    v11[0] = v8;
    v11[1] = v7;
    id v9 = [(TrackingProtectionPane *)self _loadRemoteContentSpecifier];
    v11[2] = v9;
    uint64_t v3 = +[NSArray arrayWithObjects:v11 count:3];
  }
  else
  {
    uint64_t v3 = &__NSArray0__struct;
  }

  return v3;
}

- (id)_loadRemoteContentSpecifier
{
  uint64_t v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"BLOCK_REMOTE_CONTENT" value:&stru_39200 table:@"Preferences"];
  id v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:self set:"setPreferenceValue:specifier:" get:"readPreferenceValue:" detail:0 cell:6 edit:0];

  [v5 setIdentifier:@"blockRemoteContent"];
  [v5 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];

  return v5;
}

- (PSListController)parentListController
{
  return self->_parentListController;
}

- (void)setParentListController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end