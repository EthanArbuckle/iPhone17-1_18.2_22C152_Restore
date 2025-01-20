@interface MapsSettingsEVRoutingController
- (BOOL)hasInstalledApplications;
- (MapsSettingsEVRoutingController)delegate;
- (MapsSettingsEVRoutingController)init;
- (NSArray)applications;
- (NSMutableArray)disabledAppIdentifiers;
- (VGOEMApplicationFinder)applicationFinder;
- (id)_extensionEnabled:(id)a3;
- (id)applicationForIdentifier:(id)a3;
- (id)specifiers;
- (unint64_t)electricVehicleCount;
- (void)OEMAppsUpdated:(id)a3;
- (void)_consumeUpdatedGarage:(id)a3;
- (void)_saveState;
- (void)_setExtensionEnabled:(id)a3 specifier:(id)a4;
- (void)dealloc;
- (void)setApplications:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisabledAppIdentifiers:(id)a3;
- (void)setElectricVehicleCount:(unint64_t)a3;
- (void)virtualGarageDidUpdate:(id)a3;
@end

@implementation MapsSettingsEVRoutingController

- (MapsSettingsEVRoutingController)init
{
  v12.receiver = self;
  v12.super_class = (Class)MapsSettingsEVRoutingController;
  v2 = [(MapsSettingsEVRoutingController *)&v12 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    applicationFinder = v2->_applicationFinder;
    v2->_applicationFinder = (VGOEMApplicationFinder *)v3;

    [(VGOEMApplicationFinder *)v2->_applicationFinder setDelegate:v2];
    [(VGOEMApplicationFinder *)v2->_applicationFinder findOEMApplications];
    v5 = +[VGVirtualGarageService sharedService];
    [v5 openForClient:v2];

    v6 = +[VGVirtualGarageService sharedService];
    [v6 registerObserver:v2];

    objc_initWeak(&location, v2);
    v7 = +[VGVirtualGarageService sharedService];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_13158;
    v9[3] = &unk_72460;
    objc_copyWeak(&v10, &location);
    [v7 virtualGarageGetGarageWithReply:v9];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = +[VGVirtualGarageService sharedService];
  [v3 unregisterObserver:self];

  v4 = +[VGVirtualGarageService sharedService];
  [v4 closeForClient:self];

  v5.receiver = self;
  v5.super_class = (Class)MapsSettingsEVRoutingController;
  [(MapsSettingsEVRoutingController *)&v5 dealloc];
}

- (void)setApplications:(id)a3
{
  id v4 = a3;
  applications = self->_applications;
  unint64_t v12 = (unint64_t)v4;
  id v6 = applications;
  if (v12 | (unint64_t)v6)
  {
    v7 = v6;
    unsigned __int8 v8 = [(id)v12 isEqual:v6];

    if ((v8 & 1) == 0)
    {
      v9 = [(id)v12 sortedArrayUsingComparator:&stru_724A0];
      id v10 = self->_applications;
      self->_applications = v9;

      v11 = [(MapsSettingsEVRoutingController *)self delegate];
      [v11 didUpdateEVApplications:self->_applications];

      if ([(MapsSettingsEVRoutingController *)self isViewLoaded]) {
        [(MapsSettingsEVRoutingController *)self reloadSpecifiers];
      }
    }
  }

  _objc_release_x1();
}

- (void)setElectricVehicleCount:(unint64_t)a3
{
  if (self->_electricVehicleCount != a3)
  {
    self->_electricVehicleCount = a3;
    objc_super v5 = [(MapsSettingsEVRoutingController *)self delegate];
    [v5 didUpdateElectricVehicleCount:a3];

    if ([(MapsSettingsEVRoutingController *)self isViewLoaded])
    {
      [(MapsSettingsEVRoutingController *)self reloadSpecifiers];
    }
  }
}

- (BOOL)hasInstalledApplications
{
  v2 = [(MapsSettingsEVRoutingController *)self applications];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)specifiers
{
  uint64_t v3 = objc_opt_new();
  id v4 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
  objc_super v5 = [v4 localizedStringForKey:@"EV Routing Extensions Group Title [Settings]" value:@"localized string not found" table:0];
  id v6 = (void *)v3;
  v7 = +[PSSpecifier preferenceSpecifierNamed:v5 target:0 set:0 get:0 detail:0 cell:0 edit:0];

  unsigned __int8 v8 = +[NSBundle bundleForClass:NSClassFromString(@"MapsSettingsController")];
  v9 = [v8 localizedStringForKey:@"EV Routing Extensions Footer [Settings]" value:@"localized string not found" table:0];
  [v7 setProperty:v9 forKey:PSFooterTextGroupKey];

  v22 = v7;
  [v6 addObject:v7];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = [(MapsSettingsEVRoutingController *)self applications];
  id v10 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v24 = PSIconImageKey;
    uint64_t v25 = *(void *)v27;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        v13 = v6;
        if (*(void *)v27 != v25) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v15 = [v14 identifier];
        v16 = [v14 applicationRecord];
        v17 = [v16 localizedName];
        v18 = +[PSSpecifier preferenceSpecifierNamed:v17 target:self set:"_setExtensionEnabled:specifier:" get:"_extensionEnabled:" detail:0 cell:6 edit:0];

        v19 = +[UIScreen mainScreen];
        [v19 scale];
        v20 = +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v15, 0);

        [v18 setProperty:v20 forKey:v24];
        [v18 setIdentifier:v15];
        id v6 = v13;
        [v13 addObject:v18];
      }
      id v11 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v11);
  }

  [(MapsSettingsEVRoutingController *)self setSpecifiers:v6];

  return v6;
}

- (NSMutableArray)disabledAppIdentifiers
{
  disabledAppIdentifiers = self->_disabledAppIdentifiers;
  if (!disabledAppIdentifiers)
  {
    id v4 = GEOConfigGetString();
    objc_super v5 = [v4 componentsSeparatedByString:@","];
    id v6 = (NSMutableArray *)[v5 mutableCopy];
    v7 = self->_disabledAppIdentifiers;
    self->_disabledAppIdentifiers = v6;

    disabledAppIdentifiers = self->_disabledAppIdentifiers;
  }

  return disabledAppIdentifiers;
}

- (void)_saveState
{
  id v3 = [(MapsSettingsEVRoutingController *)self disabledAppIdentifiers];
  v2 = [v3 componentsJoinedByString:@","];
  GEOConfigSetString();
}

- (void)_setExtensionEnabled:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  v7 = [a4 identifier];
  unsigned __int8 v8 = MAPSGetVirtualGarageLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412546;
    v13 = v7;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Setting application %@, enabled: %@", (uint8_t *)&v12, 0x16u);
  }

  unsigned int v9 = [v6 BOOLValue];
  id v10 = [(MapsSettingsEVRoutingController *)self disabledAppIdentifiers];
  id v11 = v10;
  if (v9) {
    [v10 removeObject:v7];
  }
  else {
    [v10 addObject:v7];
  }

  [(MapsSettingsEVRoutingController *)self _saveState];
}

- (id)_extensionEnabled:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(MapsSettingsEVRoutingController *)self disabledAppIdentifiers];
  id v6 = [v4 identifier];

  v7 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v5 containsObject:v6] ^ 1);

  return v7;
}

- (id)applicationForIdentifier:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  objc_super v5 = [(MapsSettingsEVRoutingController *)self applications];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        unsigned int v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 identifier];
        unsigned __int8 v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)OEMAppsUpdated:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_13D1C;
  v4[3] = &unk_724C8;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)_consumeUpdatedGarage:(id)a3
{
  id v5 = [a3 vehicles];
  id v4 = MapsFilter(v5, &stru_72508);
  -[MapsSettingsEVRoutingController setElectricVehicleCount:](self, "setElectricVehicleCount:", [v4 count]);
}

- (void)virtualGarageDidUpdate:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_13E38;
  v4[3] = &unk_724C8;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (unint64_t)electricVehicleCount
{
  return self->_electricVehicleCount;
}

- (MapsSettingsEVRoutingController)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MapsSettingsEVRoutingController *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (VGOEMApplicationFinder)applicationFinder
{
  return self->_applicationFinder;
}

- (NSArray)applications
{
  return self->_applications;
}

- (void)setDisabledAppIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledAppIdentifiers, 0);
  objc_storeStrong((id *)&self->_applications, 0);
  objc_storeStrong((id *)&self->_applicationFinder, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end