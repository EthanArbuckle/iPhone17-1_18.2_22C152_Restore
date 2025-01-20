@interface CRSettingsController
- (BOOL)_showsCarPlayInternalSettingsUI;
- (BOOL)storedVehicles:(id)a3 containsMatchForDiscoveredVehicle:(id)a4;
- (BOOL)suppressNextReloadForPairedVehicleChanged;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (CARRadiosAvailabilityPrompt)radiosPowerPrompt;
- (CARVehicleDiscoverer)vehicleDiscoverer;
- (CRCarPlayPreferences)carplayPreferences;
- (CRFeatureAvailability)featureAvailability;
- (CRPairedVehicleManager)vehicleManager;
- (NSMutableArray)storedCarsSpecifiers;
- (UIImage)headerImage;
- (double)heightForHeaderInTableView:(id)a3;
- (id)_specifierForIndexPath:(id)a3;
- (id)specifierForDiscoveredVehicle:(id)a3;
- (id)specifierForStoredVehicle:(id)a3;
- (id)specifiers;
- (id)statusForDiscoveredVehicleSpecifier:(id)a3;
- (id)statusForStoredVehicleSpecifier:(id)a3;
- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4;
- (id)viewForHeaderInTableView:(id)a3;
- (void)_setSpecifier:(id)a3 shouldShowActivity:(BOOL)a4;
- (void)_showActivityOnOtherCarsGroup:(BOOL)a3;
- (void)_updateOtherCarsGroupNameForSpecifier:(id)a3;
- (void)_updateSpecifierForVehicle:(id)a3;
- (void)dealloc;
- (void)handleCarPlayAllowedDidChange;
- (void)handlePairedVehiclesChanged:(id)a3;
- (void)pairAccessorySpecifier:(id)a3;
- (void)pairVehicle:(id)a3;
- (void)setCarplayPreferences:(id)a3;
- (void)setFeatureAvailability:(id)a3;
- (void)setHeaderImage:(id)a3;
- (void)setRadiosPowerPrompt:(id)a3;
- (void)setStoredCarsSpecifiers:(id)a3;
- (void)setSuppressNextReloadForPairedVehicleChanged:(BOOL)a3;
- (void)setVehicleDiscoverer:(id)a3;
- (void)setVehicleManager:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5;
- (void)unpairVehicle:(id)a3;
- (void)vehicleDiscoverer:(id)a3 changedWirelessDiscoveryState:(BOOL)a4;
- (void)vehicleDiscoverer:(id)a3 didDiscoverVehicle:(id)a4;
- (void)vehicleDiscoverer:(id)a3 didRemoveVehicle:(id)a4;
- (void)vehicleDiscoverer:(id)a3 didUpdateVehicle:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CRSettingsController

- (void)dealloc
{
  v3 = [(CRSettingsController *)self carplayPreferences];
  [v3 setPreferencesDelegate:0];

  v4 = +[NSDistributedNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)CRSettingsController;
  [(CRSettingsController *)&v5 dealloc];
}

- (void)pairVehicle:(id)a3
{
  id v4 = a3;
  [v4 setPairingStatus:2];
  objc_initWeak(&location, self);
  objc_super v5 = [(CRSettingsController *)self vehicleManager];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_5C40;
  v7[3] = &unk_24868;
  id v6 = v4;
  id v8 = v6;
  [v5 saveVehicle:v6 completion:v7];

  objc_destroyWeak(&location);
}

- (void)unpairVehicle:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  objc_super v5 = [(CRSettingsController *)self vehicleManager];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_5EA0;
  v7[3] = &unk_248B8;
  id v6 = v4;
  id v8 = v6;
  [v5 removeVehicle:v6 completion:v7];

  objc_destroyWeak(&location);
}

- (void)pairAccessorySpecifier:(id)a3
{
  id v4 = [a3 userInfo];
  objc_super v5 = [v4 accessory];
  if (v5)
  {
    id v6 = [v4 accessory];
    v7 = +[CRVehicle vehicleForMessagingVehicle:v6];

    if (v7) {
      [(CRSettingsController *)self pairVehicle:v7];
    }
  }
  else
  {
    id v8 = [(CRSettingsController *)self vehicleDiscoverer];
    unsigned __int8 v9 = [v8 bluetoothPairVehicle:v4];

    if ((v9 & 1) == 0)
    {
      v10 = CarGeneralLogging();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_14CD8(v10);
      }
    }
    [(CRSettingsController *)self _updateSpecifierForVehicle:v4];
  }
}

- (void)vehicleDiscoverer:(id)a3 changedWirelessDiscoveryState:(BOOL)a4
{
}

- (void)vehicleDiscoverer:(id)a3 didDiscoverVehicle:(id)a4
{
  id v5 = a4;
  id v6 = CarGeneralLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "vehicle discovered %@", buf, 0xCu);
  }

  v7 = [(CRSettingsController *)self specifierForDiscoveredVehicle:v5];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = [(CRSettingsController *)self specifiers];
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = [*(id *)(*((void *)&v16 + 1) + 8 * (void)v12) name];
        v14 = [v7 name];
        unsigned __int8 v15 = [v13 isEqual:v14];

        if (v15)
        {

          goto LABEL_13;
        }
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  [(CRSettingsController *)self addSpecifier:v7 animated:1];
LABEL_13:
}

- (void)vehicleDiscoverer:(id)a3 didUpdateVehicle:(id)a4
{
  id v5 = a4;
  id v6 = CarGeneralLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "vehicle updated %@", (uint8_t *)&v7, 0xCu);
  }

  [(CRSettingsController *)self _updateSpecifierForVehicle:v5];
}

- (void)vehicleDiscoverer:(id)a3 didRemoveVehicle:(id)a4
{
  id v5 = a4;
  id v6 = CarGeneralLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "vehicle removed %@", buf, 0xCu);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v7 = [(CRSettingsController *)self specifiers];
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v13 = [v12 userInfo];
        unsigned int v14 = [v13 isEqual:v5];

        if (v14) {
          [(CRSettingsController *)self removeSpecifier:v12 animated:1];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

- (void)handlePairedVehiclesChanged:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6590;
  block[3] = &unk_24818;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (double)heightForHeaderInTableView:(id)a3
{
  id v4 = a3;
  id v5 = [(CRSettingsController *)self headerImage];

  if (v5)
  {
    id v6 = [(CRSettingsController *)self headerImage];
    [v6 size];
    double v8 = v7;
    id v9 = [(CRSettingsController *)self headerImage];
    [v9 size];
    double v11 = v8 / v10;

    [v4 bounds];
    double v13 = v12;
    double v14 = *(double *)&qword_2DD40;
    if (*(double *)&qword_2DD40 == -1.0)
    {
      long long v15 = +[UIScreen mainScreen];
      [v15 scale];
      qword_2DD40 = v16;

      double v14 = *(double *)&qword_2DD40;
    }
    double v17 = round(v14 * 0.5);
    double v18 = v17 / v14 + v17 / v14 + v11 * v13;
  }
  else
  {
    double v18 = UITableViewAutomaticDimension;
  }

  return v18;
}

- (id)viewForHeaderInTableView:(id)a3
{
  id v4 = objc_alloc_init((Class)UIView);
  id v5 = +[UIColor tableSeparatorDarkColor];
  [v4 setBackgroundColor:v5];

  id v6 = objc_alloc((Class)UIImageView);
  double v7 = [(CRSettingsController *)self headerImage];
  id v8 = [v6 initWithImage:v7];

  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v4 addSubview:v8];
  id v9 = _NSDictionaryOfVariableBindings(@"imageView", v8, 0);
  double v10 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[imageView]|" options:0 metrics:0 views:v9];
  +[NSLayoutConstraint activateConstraints:v10];

  CFStringRef v19 = @"separator";
  double v11 = *(double *)&qword_2DD40;
  if (*(double *)&qword_2DD40 == -1.0)
  {
    double v12 = +[UIScreen mainScreen];
    [v12 scale];
    qword_2DD40 = v13;

    double v11 = *(double *)&qword_2DD40;
  }
  double v14 = +[NSNumber numberWithDouble:round(v11 * 0.5) / v11];
  v20 = v14;
  long long v15 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  uint64_t v16 = _NSDictionaryOfVariableBindings(@"imageView", v8, 0, v19);
  double v17 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-(separator)-[imageView]-(separator)-|", 0, v15, v16);
  +[NSLayoutConstraint activateConstraints:v17];

  return v4;
}

- (BOOL)_showsCarPlayInternalSettingsUI
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"CARHideInternalCarPlaySettings", @"com.apple.carplay.internal", &keyExistsAndHasValidFormat);
  int v3 = keyExistsAndHasValidFormat;
  BOOL result = CRIsInternalInstall();
  if (v3) {
    BOOL v5 = AppBooleanValue == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5) {
    return 0;
  }
  return result;
}

- (id)specifierForStoredVehicle:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 displayName];
  id v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:objc_opt_class() cell:1 edit:0];

  double v7 = [v4 identifier];
  id v8 = [v7 UUIDString];
  id v9 = +[NSString stringWithFormat:@"stored-%@", v8];
  [v6 setIdentifier:v9];

  double v10 = [CRVehicleSettingManager alloc];
  double v11 = [(CRSettingsController *)self vehicleManager];
  double v12 = [(CRSettingsController *)self featureAvailability];
  uint64_t v13 = [(CRVehicleSettingManager *)v10 initWithPairedVehicleManager:v11 featureAvailability:v12 vehicle:v4];

  [v6 setUserInfo:v13];
  [v6 setProperty:&__kCFBooleanTrue forKey:@"isStoredVehicle"];
  double v14 = [v4 displayName];
  [v6 setProperty:v14 forKey:PSTitleKey];

  if ([(CRSettingsController *)self _showsCarPlayInternalSettingsUI])
  {
    if (qword_2E000 != -1) {
      dispatch_once(&qword_2E000, &stru_248D8);
    }
    long long v15 = +[NSMutableString string];
    uint64_t v16 = [v4 lastConnectedDate];

    if (v16)
    {
      double v17 = (void *)qword_2DFF8;
      double v18 = [v4 lastConnectedDate];
      CFStringRef v19 = [v17 stringFromDate:v18];
      [v15 appendString:v19];
    }
    if ([v15 length])
    {
      v20 = [v4 vehicleModelName];
      id v21 = [v20 length];

      if (v21)
      {
        [v15 appendString:@" • "];
        id v22 = [v4 vehicleModelName];
        [v15 appendString:v22];
      }
    }
    if ([v15 length])
    {
      [v6 setProperty:objc_opt_class() forKey:PSCellClassKey];
      v23 = [@"[Internal] " stringByAppendingString:v15];
      [v6 setProperty:v23 forKey:PSTableCellSubtitleTextKey];
    }
  }

  return v6;
}

- (id)statusForStoredVehicleSpecifier:(id)a3
{
  return 0;
}

- (id)specifierForDiscoveredVehicle:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 displayName];
  id v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:"statusForDiscoveredVehicleSpecifier:" detail:0 cell:4 edit:0];

  double v7 = [v4 identifier];
  id v8 = +[NSString stringWithFormat:@"connected-%@", v7];
  [v6 setIdentifier:v8];

  [v6 setUserInfo:v4];
  [v6 setButtonAction:"pairAccessorySpecifier:"];

  return v6;
}

- (id)statusForDiscoveredVehicleSpecifier:(id)a3
{
  id v3 = a3;
  if (CRSettingsDebugUIEnabled())
  {
    id v4 = [v3 userInfo];
    BOOL v5 = [v4 debugConnectionStatusDescription];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)storedVehicles:(id)a3 containsMatchForDiscoveredVehicle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v22;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v12, "certificateSerialNumber", (void)v21);
        double v14 = [v6 accessory];
        long long v15 = [v14 certificateSerialNumber];

        if (v13 && [v13 isEqualToData:v15])
        {

LABEL_17:
          BOOL v19 = 1;
          goto LABEL_18;
        }
        uint64_t v16 = [v12 bluetoothAddress];
        if (v16)
        {
          double v17 = [v6 bluetoothAddress];
          unsigned int v18 = [v16 isEqualToString:v17];
        }
        else
        {
          unsigned int v18 = 0;
        }

        if (v18) {
          goto LABEL_17;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      BOOL v19 = 0;
      if (v9) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v19 = 0;
  }
LABEL_18:

  return v19;
}

- (id)specifiers
{
  id v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v56 = OBJC_IVAR___PSListController__specifiers;
    id v4 = +[NSBundle bundleForClass:objc_opt_class()];
    id v5 = [v4 localizedStringForKey:@"CARPLAY_NAVIGATION_TITLE" value:&stru_24F60 table:@"Localizable"];
    [(CRSettingsController *)self setTitle:v5];

    v57 = +[NSMutableArray array];
    id v6 = [(CRSettingsController *)self carplayPreferences];

    if (!v6)
    {
      id v7 = objc_alloc_init((Class)CRCarPlayPreferences);
      [(CRSettingsController *)self setCarplayPreferences:v7];
      [v7 setPreferencesDelegate:self];
      [(CRSettingsController *)self handleCarPlayAllowedDidChange];
    }
    id v8 = [(CRSettingsController *)self featureAvailability];

    if (!v8)
    {
      id v9 = objc_alloc_init((Class)CRFeatureAvailability);
      [(CRSettingsController *)self setFeatureAvailability:v9];
    }
    uint64_t v10 = [(CRSettingsController *)self carplayPreferences];
    unsigned int v11 = [v10 isWirelessCarPlayEnabled];

    char v54 = v11;
    if (v11)
    {
      double v12 = [(CRSettingsController *)self radiosPowerPrompt];

      if (!v12)
      {
        uint64_t v13 = objc_alloc_init(CARRadiosAvailabilityPrompt);
        [(CRSettingsController *)self setRadiosPowerPrompt:v13];
      }
      double v14 = +[NSBundle bundleForClass:objc_opt_class()];
      long long v15 = +[UIImage imageNamed:@"SiriWheel" inBundle:v14];
      [(CRSettingsController *)self setHeaderImage:v15];

      uint64_t v16 = +[PSSpecifier emptyGroupSpecifier];
      double v17 = +[NSBundle bundleForClass:objc_opt_class()];
      unsigned int v18 = [v17 localizedStringForKey:@"WIRELESS_SETUP_FOOTER" value:&stru_24F60 table:@"Localizable"];
      [v16 setProperty:v18 forKey:PSFooterTextGroupKey];

      [v57 addObject:v16];
    }
    BOOL v19 = +[NSMutableArray array];
    v58 = +[NSMutableArray array];
    v20 = [(CRSettingsController *)self vehicleDiscoverer];

    if (!v20)
    {
      long long v21 = objc_alloc_init(CARVehicleDiscoverer);
      [(CRSettingsController *)self setVehicleDiscoverer:v21];
      [(CARVehicleDiscoverer *)v21 setDiscoveryDelegate:self];
    }
    long long v22 = [(CRSettingsController *)self vehicleManager];

    if (!v22)
    {
      id v23 = objc_alloc_init((Class)CRPairedVehicleManager);
      [(CRSettingsController *)self setVehicleManager:v23];
      long long v24 = +[NSDistributedNotificationCenter defaultCenter];
      [v24 addObserver:self selector:"handlePairedVehiclesChanged:" name:CRPairedVehiclesDidChangeNotification object:0];

      [(CRSettingsController *)self setSuppressNextReloadForPairedVehicleChanged:0];
    }
    dispatch_semaphore_t v25 = dispatch_semaphore_create(0);
    uint64_t v71 = 0;
    v72 = &v71;
    uint64_t v73 = 0x3032000000;
    v74 = sub_7954;
    v75 = sub_7964;
    id v76 = 0;
    v26 = [(CRSettingsController *)self vehicleManager];
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472;
    v68[2] = sub_796C;
    v68[3] = &unk_24900;
    v70 = &v71;
    dispatch_semaphore_t dsema = v25;
    dispatch_semaphore_t v69 = dsema;
    [v26 fetchAllVehiclesWithCompletion:v68];

    dispatch_time_t v27 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(dsema, v27);
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v28 = (id)v72[5];
    id v29 = [v28 countByEnumeratingWithState:&v64 objects:v80 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v65;
      do
      {
        for (i = 0; i != v29; i = (char *)i + 1)
        {
          if (*(void *)v65 != v30) {
            objc_enumerationMutation(v28);
          }
          v32 = [(CRSettingsController *)self specifierForStoredVehicle:*(void *)(*((void *)&v64 + 1) + 8 * i)];
          [v19 addObject:v32];
        }
        id v29 = [v28 countByEnumeratingWithState:&v64 objects:v80 count:16];
      }
      while (v29);
    }

    [(CRSettingsController *)self setStoredCarsSpecifiers:v19];
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    v33 = [(CRSettingsController *)self vehicleDiscoverer];
    v34 = [v33 discoveredVehicles];

    id v35 = [v34 countByEnumeratingWithState:&v60 objects:v79 count:16];
    if (v35)
    {
      uint64_t v36 = *(void *)v61;
      do
      {
        for (j = 0; j != v35; j = (char *)j + 1)
        {
          if (*(void *)v61 != v36) {
            objc_enumerationMutation(v34);
          }
          uint64_t v38 = *(void *)(*((void *)&v60 + 1) + 8 * (void)j);
          v39 = CarGeneralLogging();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v78 = v38;
            _os_log_impl(&dword_0, v39, OS_LOG_TYPE_DEFAULT, "Found vehicle : %@", buf, 0xCu);
          }

          if (![(CRSettingsController *)self storedVehicles:v72[5] containsMatchForDiscoveredVehicle:v38])
          {
            v40 = [(CRSettingsController *)self specifierForDiscoveredVehicle:v38];
            [v58 addObject:v40];
          }
        }
        id v35 = [v34 countByEnumeratingWithState:&v60 objects:v79 count:16];
      }
      while (v35);
    }

    uint64_t v41 = v56;
    v42 = (char *)[v19 count];
    if (v42)
    {
      v43 = +[NSBundle bundleForClass:objc_opt_class()];
      if (v42 == (unsigned char *)&dword_0 + 1) {
        [v43 localizedStringForKey:@"MY_CARS_SINGULAR" value:&stru_24F60 table:@"Localizable"];
      }
      else {
      v44 = [v43 localizedStringForKey:@"MY_CARS_PLURAL" value:&stru_24F60 table:@"Localizable"];
      }
      v45 = +[PSSpecifier groupSpecifierWithID:@"MY_CARS" name:v44];
      [v57 addObject:v45];

      uint64_t v41 = v56;
    }
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = sub_79CC;
    v59[3] = &unk_24928;
    v59[4] = self;
    v46 = [v19 sortedArrayUsingComparator:v59];
    [v57 addObjectsFromArray:v46];
    if ((v54 & 1) != 0 || [v58 count])
    {
      v47 = +[PSSpecifier groupSpecifierWithID:@"OTHER_CARS"];
      [(CRSettingsController *)self _updateOtherCarsGroupNameForSpecifier:v47];
      v48 = (objc_class *)objc_opt_class();
      v49 = NSStringFromClass(v48);
      [v47 setProperty:v49 forKey:PSHeaderCellClassGroupKey];

      [v57 addObject:v47];
      [v57 addObjectsFromArray:v58];

      uint64_t v41 = v56;
    }
    v50 = (void **)&self->PSListController_opaque[v41];
    v51 = *v50;
    *v50 = v57;
    id v52 = v57;

    _Block_object_dispose(&v71, 8);
    id v3 = *v50;
  }

  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRSettingsController;
  [(CRSettingsController *)&v6 viewWillAppear:a3];
  id v4 = [(CRSettingsController *)self vehicleDiscoverer];
  [v4 startWirelessDiscovery];

  id v5 = [(CRSettingsController *)self radiosPowerPrompt];
  [v5 setPresentingController:self];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CRSettingsController;
  [(CRSettingsController *)&v4 viewDidAppear:a3];
  [(CRSettingsController *)self _car_emitNavigationEvent:@"CARPLAY_NAVIGATION_TITLE" navigationComponents:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRSettingsController;
  [(CRSettingsController *)&v6 viewWillDisappear:a3];
  objc_super v4 = [(CRSettingsController *)self vehicleDiscoverer];
  [v4 stopWirelessDiscovery];

  id v5 = [(CRSettingsController *)self radiosPowerPrompt];
  [v5 setPresentingController:0];
}

- (void)_updateOtherCarsGroupNameForSpecifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CRSettingsController *)self storedCarsSpecifiers];
  id v6 = [v5 count];
  id v7 = +[NSBundle bundleForClass:objc_opt_class()];
  id v8 = v7;
  if (v6) {
    CFStringRef v9 = @"OTHER_CARS";
  }
  else {
    CFStringRef v9 = @"AVAILABLE_CARS";
  }
  id v11 = [v7 localizedStringForKey:v9 value:&stru_24F60 table:@"Localizable"];

  [v4 setName:v11];
  uint64_t v10 = [v4 propertyForKey:PSHeaderViewKey];

  [v10 setTitle:v11];
}

- (void)_showActivityOnOtherCarsGroup:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CRSettingsController *)self specifierForID:@"OTHER_CARS"];
  id v5 = [v4 propertyForKey:PSHeaderViewKey];
  id v6 = CarGeneralLogging();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v7) {
      sub_14D1C(v6);
    }

    [v5 startAnimating];
  }
  else
  {
    if (v7) {
      sub_14D60(v6);
    }

    [v5 stopAnimating];
  }
}

- (id)_specifierForIndexPath:(id)a3
{
  id v4 = [(CRSettingsController *)self indexForIndexPath:a3];
  id v5 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];

  return [v5 objectAtIndex:v4];
}

- (void)_updateSpecifierForVehicle:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(CRSettingsController *)self specifiers];
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = [v10 userInfo];
        unsigned int v12 = [v11 isEqual:v4];

        if (v12)
        {
          uint64_t v13 = [v4 displayName];
          [v10 setName:v13];

          -[CRSettingsController _setSpecifier:shouldShowActivity:](self, "_setSpecifier:shouldShowActivity:", v10, [v4 isConnecting]);
          [(CRSettingsController *)self reloadSpecifier:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (void)_setSpecifier:(id)a3 shouldShowActivity:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [a3 propertyForKey:PSTableCellKey];
  if (v5)
  {
    id v8 = v5;
    id v6 = [v5 accessoryView];

    if (v4)
    {
      id v5 = v8;
      if (v6) {
        goto LABEL_8;
      }
      id v7 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
      [v7 startAnimating];
      [v8 setAccessoryView:v7];
    }
    else
    {
      id v5 = v8;
      if (!v6) {
        goto LABEL_8;
      }
      [v8 setAccessoryView:0];
    }
    id v5 = v8;
  }
LABEL_8:
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  BOOL v4 = [(CRSettingsController *)self _specifierForIndexPath:a4];
  id v5 = [v4 propertyForKey:@"isStoredVehicle"];
  unsigned __int8 v6 = [v5 BOOLValue];

  return v6;
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  BOOL v4 = [(CRSettingsController *)self _specifierForIndexPath:a4];
  id v5 = [v4 propertyForKey:@"isStoredVehicle"];
  unsigned int v6 = [v5 BOOLValue];

  if (v6)
  {
    id v7 = +[NSBundle bundleForClass:objc_opt_class()];
    id v8 = [v7 localizedStringForKey:@"FORGET" value:&stru_24F60 table:@"Localizable"];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1)
  {
    block[9] = v5;
    block[10] = v6;
    id v8 = [(CRSettingsController *)self _specifierForIndexPath:a5];
    CFStringRef v9 = [v8 userInfo];
    uint64_t v10 = [v9 vehicle];

    [(CRSettingsController *)self setSuppressNextReloadForPairedVehicleChanged:1];
    [(CRSettingsController *)self unpairVehicle:v10];
    [(CRSettingsController *)self removeSpecifier:v8 animated:1];
    id v11 = [(CRSettingsController *)self storedCarsSpecifiers];
    [v11 removeObject:v8];

    unsigned int v12 = [(CRSettingsController *)self specifierForID:@"OTHER_CARS"];
    [(CRSettingsController *)self _updateOtherCarsGroupNameForSpecifier:v12];

    dispatch_time_t v13 = dispatch_time(0, 300000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_8318;
    block[3] = &unk_24818;
    block[4] = self;
    dispatch_after(v13, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v9 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v9;
    id v7 = [(CRSettingsController *)self vehicleDiscoverer];
    unsigned int v8 = [v7 isWirelessDiscovering];

    if (v8) {
      [v6 startAnimating];
    }
    else {
      [v6 stopAnimating];
    }
  }

  _objc_release_x1();
}

- (void)handleCarPlayAllowedDidChange
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_843C;
  block[3] = &unk_24818;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (CRCarPlayPreferences)carplayPreferences
{
  return self->_carplayPreferences;
}

- (void)setCarplayPreferences:(id)a3
{
}

- (CRFeatureAvailability)featureAvailability
{
  return self->_featureAvailability;
}

- (void)setFeatureAvailability:(id)a3
{
}

- (CRPairedVehicleManager)vehicleManager
{
  return self->_vehicleManager;
}

- (void)setVehicleManager:(id)a3
{
}

- (CARVehicleDiscoverer)vehicleDiscoverer
{
  return self->_vehicleDiscoverer;
}

- (void)setVehicleDiscoverer:(id)a3
{
}

- (CARRadiosAvailabilityPrompt)radiosPowerPrompt
{
  return self->_radiosPowerPrompt;
}

- (void)setRadiosPowerPrompt:(id)a3
{
}

- (NSMutableArray)storedCarsSpecifiers
{
  return self->_storedCarsSpecifiers;
}

- (void)setStoredCarsSpecifiers:(id)a3
{
}

- (UIImage)headerImage
{
  return self->_headerImage;
}

- (void)setHeaderImage:(id)a3
{
}

- (BOOL)suppressNextReloadForPairedVehicleChanged
{
  return self->_suppressNextReloadForPairedVehicleChanged;
}

- (void)setSuppressNextReloadForPairedVehicleChanged:(BOOL)a3
{
  self->_suppressNextReloadForPairedVehicleChanged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerImage, 0);
  objc_storeStrong((id *)&self->_storedCarsSpecifiers, 0);
  objc_storeStrong((id *)&self->_radiosPowerPrompt, 0);
  objc_storeStrong((id *)&self->_vehicleDiscoverer, 0);
  objc_storeStrong((id *)&self->_vehicleManager, 0);
  objc_storeStrong((id *)&self->_featureAvailability, 0);

  objc_storeStrong((id *)&self->_carplayPreferences, 0);
}

@end