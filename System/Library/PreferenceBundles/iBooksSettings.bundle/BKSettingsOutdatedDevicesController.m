@interface BKSettingsOutdatedDevicesController
- (BKSettingsOutdatedDevicesController)initWithDelegate:(id)a3 iOSRequiredVersion:(id)a4 macOSRequiredVersion:(id)a5;
- (BKSettingsOutdatedDevicesControllerDelegate)delegate;
- (BOOL)_isOutdatedDevice:(id)a3;
- (BOOL)_isUpdatableDevice:(id)a3;
- (BOOL)isLoadingDevices;
- (NSArray)deviceSpecifiers;
- (NSString)iOSRequiredVersion;
- (NSString)macOSRequiredVersion;
- (PSSpecifier)groupSpecifier;
- (PSSpecifier)spinnerSpecifier;
- (UIView)tableHeaderView;
- (id)_imageURLForDevice:(id)a3;
- (id)_specifiersForDevices:(id)a3 flagNonUpdatable:(BOOL)a4;
- (id)specifiers;
- (unint64_t)numberOfDevices;
- (void)_loadDevices;
- (void)refresh;
- (void)setDelegate:(id)a3;
- (void)setDeviceSpecifiers:(id)a3;
- (void)setGroupSpecifier:(id)a3;
- (void)setIsLoadingDevices:(BOOL)a3;
- (void)setSpinnerSpecifier:(id)a3;
- (void)setTableHeaderView:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation BKSettingsOutdatedDevicesController

- (BKSettingsOutdatedDevicesController)initWithDelegate:(id)a3 iOSRequiredVersion:(id)a4 macOSRequiredVersion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)BKSettingsOutdatedDevicesController;
  v11 = [(BKSettingsOutdatedDevicesController *)&v19 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v8);
    v13 = (NSString *)[v9 copy];
    iOSRequiredVersion = v12->_iOSRequiredVersion;
    v12->_iOSRequiredVersion = v13;

    v15 = (NSString *)[v10 copy];
    macOSRequiredVersion = v12->_macOSRequiredVersion;
    v12->_macOSRequiredVersion = v15;

    deviceSpecifiers = v12->_deviceSpecifiers;
    v12->_deviceSpecifiers = (NSArray *)&__NSArray0__struct;
  }
  return v12;
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)BKSettingsOutdatedDevicesController;
  [(BKSettingsOutdatedDevicesController *)&v11 viewDidLoad];
  id v3 = objc_alloc((Class)UITextView);
  v4 = [(BKSettingsOutdatedDevicesController *)self view];
  [v4 bounds];
  id v5 = objc_msgSend(v3, "initWithFrame:");

  v6 = BKSettingsBundle();
  v7 = [v6 localizedStringForKey:@"To sync changes to your library on the following devices, you\\U2019 need to update them with iOS 12, macOS 10.14, or later:", &stru_18CA0, @"Settings" value table];
  [v5 setText:v7];

  id v8 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCallout];
  [v5 setFont:v8];

  id v9 = +[UIColor systemGrayColor];
  [v5 setTextColor:v9];

  [v5 setTextAlignment:1];
  objc_msgSend(v5, "setTextContainerInset:", 40.0, 40.0, 40.0, 40.0);
  [v5 setEditable:0];
  [v5 setBackgroundColor:0];
  [v5 setAutoresizingMask:2];
  [(BKSettingsOutdatedDevicesController *)self setTableHeaderView:v5];
  id v10 = [(BKSettingsOutdatedDevicesController *)self table];
  [v10 setTableHeaderView:v5];
}

- (void)viewWillLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)BKSettingsOutdatedDevicesController;
  [(BKSettingsOutdatedDevicesController *)&v4 viewWillLayoutSubviews];
  id v3 = [(BKSettingsOutdatedDevicesController *)self tableHeaderView];
  [v3 sizeToFit];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  objc_super v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    v6 = +[PSSpecifier groupSpecifierWithID:@"Devices"];
    [(BKSettingsOutdatedDevicesController *)self setGroupSpecifier:v6];

    v7 = [(BKSettingsOutdatedDevicesController *)self groupSpecifier];
    [v5 addObject:v7];

    if ([(BKSettingsOutdatedDevicesController *)self isLoadingDevices]
      && ([(BKSettingsOutdatedDevicesController *)self deviceSpecifiers],
          id v8 = objc_claimAutoreleasedReturnValue(),
          id v9 = [v8 count],
          v8,
          !v9))
    {
      objc_super v11 = +[PSSpecifier preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:15 edit:0];
      [(BKSettingsOutdatedDevicesController *)self setSpinnerSpecifier:v11];

      v12 = [(BKSettingsOutdatedDevicesController *)self spinnerSpecifier];
      [v12 setProperty:objc_opt_class() forKey:PSCellClassKey];

      id v10 = [(BKSettingsOutdatedDevicesController *)self spinnerSpecifier];
      [v5 addObject:v10];
    }
    else
    {
      id v10 = [(BKSettingsOutdatedDevicesController *)self deviceSpecifiers];
      [v5 addObjectsFromArray:v10];
    }

    id v13 = [v5 copy];
    v14 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v13;

    objc_super v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (unint64_t)numberOfDevices
{
  v2 = [(BKSettingsOutdatedDevicesController *)self deviceSpecifiers];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (void)refresh
{
  if (![(BKSettingsOutdatedDevicesController *)self isLoadingDevices])
  {
    [(BKSettingsOutdatedDevicesController *)self _loadDevices];
  }
}

- (id)_specifiersForDevices:(id)a3 flagNonUpdatable:(BOOL)a4
{
  BOOL v39 = a4;
  id v5 = a3;
  v6 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v40 objects:v44 count:16];
  id obj = v7;
  if (!v8) {
    goto LABEL_15;
  }
  id v9 = v8;
  uint64_t v38 = *(void *)v41;
  uint64_t v37 = PSCellClassKey;
  uint64_t v35 = PSTitleKey;
  uint64_t v36 = PSTableCellHeightKey;
  uint64_t v34 = PSLazyIconLoading;
  char v30 = 1;
  uint64_t v33 = PSLazyIconURL;
  uint64_t v32 = PSTableCellSubtitleTextKey;
  uint64_t v10 = PSTableCellSubtitleColorKey;
  v29 = v6;
  do
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(void *)v41 != v38) {
        objc_enumerationMutation(obj);
      }
      v12 = *(void **)(*((void *)&v40 + 1) + 8 * i);
      id v13 = [v12 objectForKeyedSubscript:@"name"];
      v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:0 set:0 get:0 detail:0 cell:4 edit:0];

      [v14 setProperty:objc_opt_class() forKey:v37];
      v15 = [UIApp preferredContentSizeCategory];
      BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v15);
      double v17 = 58.0;
      if (IsAccessibilityCategory) {
        double v17 = UITableViewAutomaticDimension;
      }
      v18 = +[NSNumber numberWithDouble:v17];
      [v14 setProperty:v18 forKey:v36];

      objc_super v19 = [v12 objectForKeyedSubscript:@"name"];
      [v14 setProperty:v19 forKey:v35];

      [v14 setProperty:&__kCFBooleanTrue forKey:v34];
      v20 = [(BKSettingsOutdatedDevicesController *)self _imageURLForDevice:v12];
      [v14 setProperty:v20 forKey:v33];
      [v14 setUserInfo:v12];
      v21 = [v12 objectForKeyedSubscript:@"modelDisplayName"];
      v22 = +[UIColor systemGrayColor];
      if (v39 && ![(BKSettingsOutdatedDevicesController *)self _isUpdatableDevice:v12])
      {
        uint64_t v23 = [v21 stringByAppendingString:@"*"];

        uint64_t v24 = +[UIColor systemRedColor];

        char v30 = 0;
        v21 = (void *)v23;
        v22 = (void *)v24;
        v6 = v29;
      }
      [v14 setProperty:v21 forKey:v32];
      [v14 setProperty:v22 forKey:v10];
      [v6 addObject:v14];
    }
    id v9 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
  }
  while (v9);

  if ((v30 & 1) == 0)
  {
    BKSettingsBundle();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    v25 = [v7 localizedStringForKey:@"*Device can\\U2019t be updated." value:&stru_18CA0 table:@"Settings"];
    v26 = [(BKSettingsOutdatedDevicesController *)self groupSpecifier];
    [v26 setObject:v25 forKeyedSubscript:PSFooterTextGroupKey];

    v6 = v29;
LABEL_15:
  }
  id v27 = [v6 copy];

  return v27;
}

- (BOOL)_isUpdatableDevice:(id)a3
{
  return 1;
}

- (id)_imageURLForDevice:(id)a3
{
  id v3 = a3;
  objc_super v4 = [v3 objectForKeyedSubscript:@"modelSmallPhotoURL1x"];
  id v5 = [v3 objectForKeyedSubscript:@"modelSmallPhotoURL2x"];
  v6 = [v3 objectForKeyedSubscript:@"modelSmallPhotoURL3x"];

  id v7 = +[UIScreen mainScreen];
  [v7 scale];
  double v9 = v8;

  if (v5) {
    uint64_t v10 = v5;
  }
  else {
    uint64_t v10 = v4;
  }
  if (v9 < 2.0) {
    uint64_t v10 = v4;
  }
  if (v5) {
    objc_super v11 = v5;
  }
  else {
    objc_super v11 = v4;
  }
  if (v6) {
    objc_super v11 = v6;
  }
  if (v9 >= 3.0) {
    uint64_t v10 = v11;
  }
  id v12 = v10;
  id v13 = +[NSURL URLWithString:v12];

  return v13;
}

- (void)_loadDevices
{
  [(BKSettingsOutdatedDevicesController *)self setIsLoadingDevices:1];
  id v3 = +[BUAccountsProvider sharedProvider];
  objc_super v4 = [v3 primaryAppleAccount];

  objc_initWeak(&location, self);
  id v5 = [objc_alloc((Class)AADeviceListRequest) initWithAccount:v4];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_57E0;
  v6[3] = &unk_18768;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  [v5 performRequestWithHandler:v6];
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
}

- (BOOL)_isOutdatedDevice:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"swVersion"];
  if ([v5 length]
    && (v6 = (char *)[v5 rangeOfString:@";"], v6 != (char *)0x7FFFFFFFFFFFFFFFLL))
  {
    double v8 = [v5 substringFromIndex:v6 + 1];
    if (_isSupportedIOSDevice(v4)) {
      [(BKSettingsOutdatedDevicesController *)self iOSRequiredVersion];
    }
    else {
    double v9 = [(BKSettingsOutdatedDevicesController *)self macOSRequiredVersion];
    }
    BOOL v7 = [v8 length]
      && [v9 length]
      && [v9 compare:v8 options:64] == (char *)&dword_0 + 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BKSettingsOutdatedDevicesControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BKSettingsOutdatedDevicesControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)iOSRequiredVersion
{
  return self->_iOSRequiredVersion;
}

- (NSString)macOSRequiredVersion
{
  return self->_macOSRequiredVersion;
}

- (PSSpecifier)groupSpecifier
{
  return self->_groupSpecifier;
}

- (void)setGroupSpecifier:(id)a3
{
}

- (PSSpecifier)spinnerSpecifier
{
  return self->_spinnerSpecifier;
}

- (void)setSpinnerSpecifier:(id)a3
{
}

- (NSArray)deviceSpecifiers
{
  return self->_deviceSpecifiers;
}

- (void)setDeviceSpecifiers:(id)a3
{
}

- (UIView)tableHeaderView
{
  return self->_tableHeaderView;
}

- (void)setTableHeaderView:(id)a3
{
}

- (BOOL)isLoadingDevices
{
  return self->_isLoadingDevices;
}

- (void)setIsLoadingDevices:(BOOL)a3
{
  self->_isLoadingDevices = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableHeaderView, 0);
  objc_storeStrong((id *)&self->_deviceSpecifiers, 0);
  objc_storeStrong((id *)&self->_spinnerSpecifier, 0);
  objc_storeStrong((id *)&self->_groupSpecifier, 0);
  objc_storeStrong((id *)&self->_macOSRequiredVersion, 0);
  objc_storeStrong((id *)&self->_iOSRequiredVersion, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end