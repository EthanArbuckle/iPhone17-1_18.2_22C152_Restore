@interface MSSCellularDataSettingsController
+ (BOOL)shouldShowCellularDataSettings;
- (id)_labelForCellularData;
- (id)deepLinkURL;
- (id)paneTitleLocalizedResource;
- (id)pathComponentsLocalizedResource;
- (id)specifiers;
- (id)unlimitedUpdatesForSpecifier:(id)a3;
- (void)_validateUnlimitedUpdatesSpecifiers;
- (void)setUnlimitedUpdates:(id)a3 forSpecifier:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MSSCellularDataSettingsController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invocations, 0);
  objc_storeStrong((id *)&self->_unlimitedUpdatesSpecifiers, 0);
  objc_storeStrong((id *)&self->_cellularSpecifiers, 0);

  objc_storeStrong((id *)&self->_appPolicy, 0);
}

- (void)_validateUnlimitedUpdatesSpecifiers
{
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  char v8 = 0;
  invocations = self->_invocations;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1603C;
  v6[3] = &unk_28E98;
  v6[4] = v7;
  [(NSArray *)invocations enumerateObjectsUsingBlock:v6];
  [(MSSCellularDataSettingsController *)self beginUpdates];
  unlimitedUpdatesSpecifiers = self->_unlimitedUpdatesSpecifiers;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_16080;
  v5[3] = &unk_28EC0;
  v5[4] = self;
  v5[5] = v7;
  [(NSArray *)unlimitedUpdatesSpecifiers enumerateObjectsUsingBlock:v5];
  [(MSSCellularDataSettingsController *)self endUpdates];
  _Block_object_dispose(v7, 8);
}

- (void)setUnlimitedUpdates:(id)a3 forSpecifier:(id)a4
{
  id v4 = [a3 BOOLValue];

  _PLCPLSetAllowsUnlimitedSyncOverCellular(v4);
}

- (id)unlimitedUpdatesForSpecifier:(id)a3
{
  uint64_t v3 = PLCPLAllowsUnlimitedSyncOverCellular();

  return +[NSNumber numberWithBool:v3];
}

- (id)_labelForCellularData
{
  if (+[MSSCellularDataSettingsController shouldShowCellularDataSettings]&& (MGGetBoolAnswer() & 1) != 0)
  {
    return @"USE_CELLULAR_DATA_LABEL_WLAN";
  }
  else
  {
    return @"USE_CELLULAR_DATA_LABEL";
  }
}

- (id)pathComponentsLocalizedResource
{
  uint64_t v3 = +[MSSSettingsUtilities photosMainPaneLocalizedResource];
  v7[0] = v3;
  id v4 = [(MSSCellularDataSettingsController *)self paneTitleLocalizedResource];
  v7[1] = v4;
  v5 = +[NSArray arrayWithObjects:v7 count:2];

  return v5;
}

- (id)deepLinkURL
{
  v2 = +[NSString stringWithFormat:@"%@/%@/%@", @"settings-navigation://com.apple.Settings.Apps", @"com.apple.mobileslideshow", @"CellularDataGroup"];
  uint64_t v3 = +[NSURL URLWithString:v2];

  return v3;
}

- (id)paneTitleLocalizedResource
{
  id v3 = objc_alloc((Class)_NSLocalizedStringResource);
  id v4 = [(MSSCellularDataSettingsController *)self _labelForCellularData];
  v5 = +[NSLocale currentLocale];
  v6 = +[NSBundle bundleForClass:objc_opt_class()];
  v7 = [v6 bundleURL];
  id v8 = [v3 initWithKey:v4 table:@"Photos" locale:v5 bundleURL:v7];

  return v8;
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MSSCellularDataSettingsController;
  [(MSSCellularDataSettingsController *)&v7 viewDidAppear:a3];
  id v4 = [(MSSCellularDataSettingsController *)self paneTitleLocalizedResource];
  v5 = [(MSSCellularDataSettingsController *)self pathComponentsLocalizedResource];
  v6 = [(MSSCellularDataSettingsController *)self deepLinkURL];
  [(MSSCellularDataSettingsController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:@"com.apple.mobileslideshow" title:v4 localizedNavigationComponents:v5 deepLink:v6];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MSSCellularDataSettingsController;
  [(MSSCellularDataSettingsController *)&v4 viewWillAppear:a3];
  [(MSSCellularDataSettingsController *)self _validateUnlimitedUpdatesSpecifiers];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  objc_super v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = +[NSBundle bundleForClass:objc_opt_class()];
    int v6 = MGGetBoolAnswer();
    if (v6) {
      CFStringRef v7 = @"USE_CELLULAR_DATA_FOOTER_WLAN";
    }
    else {
      CFStringRef v7 = @"USE_CELLULAR_DATA_FOOTER";
    }
    if (v6) {
      CFStringRef v8 = @"UNLIMITED_UPLOADS_AND_DOWNLOADS_FOOTER_WLAN";
    }
    else {
      CFStringRef v8 = @"UNLIMITED_UPLOADS_AND_DOWNLOADS_FOOTER_WIFI";
    }
    v32 = [v5 localizedStringForKey:v7 value:&stru_29018 table:@"Photos"];
    v31 = +[PSSpecifier groupSpecifierWithID:@"UseCellularDataGroup"];
    uint64_t v9 = PSFooterTextGroupKey;
    [v31 setObject:v32 forKeyedSubscript:PSFooterTextGroupKey];
    v10 = (PSSystemPolicyForApp *)[objc_alloc((Class)PSSystemPolicyForApp) initWithBundleIdentifier:@"com.apple.mobileslideshow"];
    appPolicy = self->_appPolicy;
    self->_appPolicy = v10;

    v12 = +[NSMutableArray array];
    v13 = +[NSMutableArray array];
    v14 = [(PSSystemPolicyForApp *)self->_appPolicy specifiersForPolicyOptions:0x8000 force:0];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_168B0;
    v33[3] = &unk_28E70;
    id v34 = v12;
    v35 = self;
    id v36 = v13;
    id v29 = v13;
    id v30 = v12;
    [v14 enumerateObjectsUsingBlock:v33];

    v15 = (NSArray *)[v30 copy];
    cellularSpecifiers = self->_cellularSpecifiers;
    self->_cellularSpecifiers = v15;

    v17 = (NSArray *)[v29 copy];
    invocations = self->_invocations;
    self->_invocations = v17;

    v19 = [v5 localizedStringForKey:v8 value:&stru_29018 table:@"Photos"];
    v20 = +[PSSpecifier groupSpecifierWithID:@"AutomaticUploadsAndDownloadsGroup"];
    [v20 setObject:v19 forKeyedSubscript:v9];
    v21 = [v5 localizedStringForKey:@"UNLIMITED_UPLOADS_AND_DOWNLOADS_LABEL" value:&stru_29018 table:@"Photos"];
    v22 = +[PSSpecifier preferenceSpecifierNamed:v21 target:self set:"setUnlimitedUpdates:forSpecifier:" get:"unlimitedUpdatesForSpecifier:" detail:0 cell:6 edit:0];
    v37[0] = v20;
    v37[1] = v22;
    v23 = +[NSArray arrayWithObjects:v37 count:2];
    unlimitedUpdatesSpecifiers = self->_unlimitedUpdatesSpecifiers;
    self->_unlimitedUpdatesSpecifiers = v23;

    v25 = +[NSMutableArray array];
    [v25 addObject:v31];
    [v25 addObjectsFromArray:self->_cellularSpecifiers];
    [v25 addObjectsFromArray:self->_unlimitedUpdatesSpecifiers];
    id v26 = [v25 copy];
    v27 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v26;

    objc_super v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

+ (BOOL)shouldShowCellularDataSettings
{
  id v2 = [objc_alloc((Class)PSSystemPolicyForApp) initWithBundleIdentifier:@"com.apple.mobileslideshow"];
  uint64_t v3 = [v2 specifiersForPolicyOptions:0x8000 force:0];
  objc_super v4 = v3;
  if (v3) {
    BOOL v5 = [v3 count] != 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

@end