@interface CARSettingsViewController
- (CARObserverHashTable)notificationSettingsObservers;
- (CARObserverHashTable)observers;
- (CARObserverHashTable)panels;
- (CARRootPanel)rootPanel;
- (CARSession)carSession;
- (CARSessionStatus)sessionStatus;
- (CARSettingsViewController)initWithSessionStatus:(id)a3;
- (CRPairedVehicleManager)pairedManager;
- (CRSSiriPreferences)siriPreferences;
- (CRSUIClusterThemeManager)clusterThemeManager;
- (CRVehicle)vehicle;
- (UNNotificationSystemSettings)currentNotificationSystemSettings;
- (id)loadWallpaperPreferences;
- (void)_pairedVehiclesDidChange:(id)a3;
- (void)addNotificationSettingsObserver:(id)a3;
- (void)addObserver:(id)a3;
- (void)addSiriPreferencesObserver:(id)a3;
- (void)carManagerRequestedDevicePicker:(id)a3;
- (void)deregisterPanel:(id)a3;
- (void)dismissPanel:(id)a3;
- (void)dismissPanel:(id)a3 completion:(id)a4;
- (void)invalidate;
- (void)popIfPanel:(id)a3;
- (void)popPanel;
- (void)popToRootPanel;
- (void)popToRootPanelIfHierarchyContainsPanel:(id)a3;
- (void)presentPanel:(id)a3;
- (void)pushPanel:(id)a3;
- (void)registerPanel:(id)a3;
- (void)removeNotificationSettingsObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)removeSiriPreferencesObserver:(id)a3;
- (void)saveVehicle:(id)a3;
- (void)sessionDidConnect:(id)a3;
- (void)setClusterThemeManager:(id)a3;
- (void)setCurrentNotificationSystemSettings:(id)a3;
- (void)setNotificationSettingsObservers:(id)a3;
- (void)setObservers:(id)a3;
- (void)setPairedManager:(id)a3;
- (void)setPanels:(id)a3;
- (void)setRootPanel:(id)a3;
- (void)setSessionStatus:(id)a3;
- (void)setSiriPreferences:(id)a3;
- (void)setVehicle:(id)a3;
- (void)userNotificationSettingsCenter:(id)a3 didUpdateNotificationSystemSettings:(id)a4;
@end

@implementation CARSettingsViewController

- (CARSettingsViewController)initWithSessionStatus:(id)a3
{
  id v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CARSettingsViewController;
  v6 = [(CARSettingsViewController *)&v27 init];
  if (v6)
  {
    v7 = (CARObserverHashTable *)[objc_alloc((Class)CARObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___CARSessionObserving];
    observers = v6->_observers;
    v6->_observers = v7;

    v9 = (CARObserverHashTable *)[objc_alloc((Class)CARObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___BSInvalidatable];
    panels = v6->_panels;
    v6->_panels = v9;

    v11 = (CARObserverHashTable *)[objc_alloc((Class)CARObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___CARNotificationSystemSettingsObserver];
    notificationSettingsObservers = v6->_notificationSettingsObservers;
    v6->_notificationSettingsObservers = v11;

    v13 = (CRSSiriPreferences *)objc_alloc_init((Class)CRSSiriPreferences);
    siriPreferences = v6->_siriPreferences;
    v6->_siriPreferences = v13;

    v15 = +[UNNotificationSettingsCenter currentNotificationSettingsCenter];
    uint64_t v16 = [v15 notificationSystemSettings];
    currentNotificationSystemSettings = v6->_currentNotificationSystemSettings;
    v6->_currentNotificationSystemSettings = (UNNotificationSystemSettings *)v16;

    v18 = +[UNNotificationSettingsCenter currentNotificationSettingsCenter];
    [v18 setDelegate:v6];

    objc_storeStrong((id *)&v6->_sessionStatus, a3);
    [(CARSessionStatus *)v6->_sessionStatus addSessionObserver:v6];
    v19 = (CRPairedVehicleManager *)objc_alloc_init((Class)CRPairedVehicleManager);
    pairedManager = v6->_pairedManager;
    v6->_pairedManager = v19;

    v21 = [[CARRootPanel alloc] initWithPanelController:v6];
    rootPanel = v6->_rootPanel;
    v6->_rootPanel = v21;

    [(CARSettingsViewController *)v6 pushViewController:v6->_rootPanel animated:0];
    v23 = +[CARSettingsAppDelegate sharedDelegate];
    v24 = [v23 carManager];
    [v24 addObserver:v6];

    v25 = +[NSDistributedNotificationCenter defaultCenter];
    [v25 addObserver:v6 selector:"_pairedVehiclesDidChange:" name:CRPairedVehiclesDidChangeNotification object:0];
  }
  return v6;
}

- (void)invalidate
{
  v3 = [(CARSettingsViewController *)self panels];
  [v3 invalidate];

  id v4 = [(CARSettingsViewController *)self clusterThemeManager];
  [v4 invalidate];
}

- (void)pushPanel:(id)a3
{
}

- (void)popIfPanel:(id)a3
{
  id v4 = a3;
  id v5 = [(CARSettingsViewController *)self topViewController];

  if (v5 == v4)
  {
    [(CARSettingsViewController *)self popPanel];
  }
}

- (void)popPanel
{
  id v2 = [(CARSettingsViewController *)self popViewControllerAnimated:1];
}

- (void)popToRootPanel
{
  id v2 = [(CARSettingsViewController *)self popToRootViewControllerAnimated:1];
}

- (void)popToRootPanelIfHierarchyContainsPanel:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(CARSettingsViewController *)self viewControllers];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        if (*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) == v4)
        {

          [(CARSettingsViewController *)self popToRootPanel];
          goto LABEL_11;
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

LABEL_11:
}

- (void)presentPanel:(id)a3
{
}

- (void)dismissPanel:(id)a3
{
}

- (void)dismissPanel:(id)a3 completion:(id)a4
{
  id v8 = a4;
  id v6 = a3;
  id v7 = [(CARSettingsViewController *)self presentedViewController];

  if (v7 == v6) {
    [(CARSettingsViewController *)self dismissViewControllerAnimated:1 completion:v8];
  }
}

- (void)registerPanel:(id)a3
{
  id v4 = a3;
  id v5 = [(CARSettingsViewController *)self panels];
  [v5 addObserver:v4];
}

- (void)deregisterPanel:(id)a3
{
  id v4 = a3;
  id v5 = [(CARSettingsViewController *)self panels];
  [v5 removeObserver:v4];
}

- (id)loadWallpaperPreferences
{
  v3 = [(CARSettingsViewController *)self vehicle];
  uint64_t v4 = [v3 clusterAssetIdentifier];
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = [(CARSettingsViewController *)self carSession];
    id v7 = [v6 configuration];
    unsigned int v8 = [v7 supportsVehicleData];

    if (v8)
    {
      v9 = (CRSUIClusterThemeManager *)objc_alloc_init((Class)CRSUIClusterThemeManager);
      clusterThemeManager = self->_clusterThemeManager;
      self->_clusterThemeManager = v9;

      id v11 = [objc_alloc((Class)CRSUIWallpaperPreferences) initWithDataProvider:self->_clusterThemeManager];
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v12 = objc_alloc((Class)CRSUIWallpaperPreferences);
  id v13 = objc_alloc_init((Class)CRSUISystemWallpaperProvider);
  id v11 = [v12 initWithDataProvider:v13];

LABEL_6:
  v14 = [(CARSettingsViewController *)self vehicle];
  [v11 setVehicle:v14];

  return v11;
}

- (CARSession)carSession
{
  id v2 = [(CARSettingsViewController *)self sessionStatus];
  v3 = [v2 currentSession];

  return (CARSession *)v3;
}

- (CRVehicle)vehicle
{
  vehicle = self->_vehicle;
  if (!vehicle)
  {
    uint64_t v4 = [(CARSettingsViewController *)self pairedManager];
    id v5 = [(CARSettingsViewController *)self carSession];
    id v6 = [v5 MFiCertificateSerialNumber];
    id v7 = [v4 vehicleForCertificateSerial:v6];
    unsigned int v8 = self->_vehicle;
    self->_vehicle = v7;

    vehicle = self->_vehicle;
  }

  return vehicle;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CARSettingsViewController *)self observers];
  [v5 addObserver:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CARSettingsViewController *)self observers];
  [v5 removeObserver:v4];
}

- (void)addSiriPreferencesObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CARSettingsViewController *)self siriPreferences];
  [v5 addObserver:v4];
}

- (void)removeSiriPreferencesObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CARSettingsViewController *)self siriPreferences];
  [v5 removeObserver:v4];
}

- (void)addNotificationSettingsObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CARSettingsViewController *)self notificationSettingsObservers];
  [v5 addObserver:v4];
}

- (void)removeNotificationSettingsObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CARSettingsViewController *)self notificationSettingsObservers];
  [v5 removeObserver:v4];
}

- (void)carManagerRequestedDevicePicker:(id)a3
{
  id v4 = [(CARSettingsViewController *)self rootPanel];
  id v5 = [v4 devicePickerSpecifier];

  if (v5)
  {
    id v6 = [(CARSettingsViewController *)self rootPanel];
    id v7 = [v6 navigationController];
    id v8 = [v7 popToRootViewControllerAnimated:0];

    id v11 = [(CARSettingsViewController *)self rootPanel];
    v9 = [v11 devicePickerSpecifier];
    long long v10 = [v9 actionBlock];
    ((void (**)(void, CARSettingsViewController *))v10)[2](v10, self);
  }
}

- (void)saveVehicle:(id)a3
{
  id v4 = a3;
  id v5 = [(CARSettingsViewController *)self pairedManager];
  [v5 saveVehicle:v4 completion:&stru_100092240];
}

- (void)sessionDidConnect:(id)a3
{
  id v4 = a3;
  id v5 = [(CARSettingsViewController *)self observers];
  [v5 sessionDidConnect:v4];
}

- (void)userNotificationSettingsCenter:(id)a3 didUpdateNotificationSystemSettings:(id)a4
{
  id v5 = a4;
  id v6 = [(CARSettingsViewController *)self currentNotificationSystemSettings];
  id v17 = [v6 copy];

  [(CARSettingsViewController *)self setCurrentNotificationSystemSettings:v5];
  id v7 = [v17 announcementSetting];
  id v8 = [(CARSettingsViewController *)self currentNotificationSystemSettings];
  id v9 = [v8 announcementSetting];

  if (v7 != v9)
  {
    long long v10 = [(CARSettingsViewController *)self notificationSettingsObservers];
    id v11 = [(CARSettingsViewController *)self currentNotificationSystemSettings];
    [v10 announceEnabledStateUpdated:[v11 announcementSetting]];
  }
  id v12 = [v17 announcementCarPlaySetting];
  id v13 = [(CARSettingsViewController *)self currentNotificationSystemSettings];
  id v14 = [v13 announcementCarPlaySetting];

  if (v12 != v14)
  {
    v15 = [(CARSettingsViewController *)self notificationSettingsObservers];
    uint64_t v16 = [(CARSettingsViewController *)self currentNotificationSystemSettings];
    [v15 announceCarPlaySettingUpdated:[v16 announcementCarPlaySetting]];
  }
}

- (void)_pairedVehiclesDidChange:(id)a3
{
  id v4 = [(CARSettingsViewController *)self pairedManager];
  id v5 = [(CARSettingsViewController *)self carSession];
  id v6 = [v5 MFiCertificateSerialNumber];
  id v9 = [v4 vehicleForCertificateSerial:v6];

  [(CARSettingsViewController *)self setVehicle:v9];
  id v7 = [(CARSettingsViewController *)self rootPanel];
  [v7 setVehicle:v9];

  id v8 = +[NSNotificationCenter defaultCenter];
  [v8 postNotificationName:@"CARSettingsPanelControllerVehicleDidChangeNotification" object:0];
}

- (CARSessionStatus)sessionStatus
{
  return self->_sessionStatus;
}

- (void)setSessionStatus:(id)a3
{
}

- (CRPairedVehicleManager)pairedManager
{
  return self->_pairedManager;
}

- (void)setPairedManager:(id)a3
{
}

- (void)setVehicle:(id)a3
{
}

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (CARRootPanel)rootPanel
{
  return self->_rootPanel;
}

- (void)setRootPanel:(id)a3
{
}

- (CARObserverHashTable)panels
{
  return self->_panels;
}

- (void)setPanels:(id)a3
{
}

- (CRSSiriPreferences)siriPreferences
{
  return self->_siriPreferences;
}

- (void)setSiriPreferences:(id)a3
{
}

- (CARObserverHashTable)notificationSettingsObservers
{
  return self->_notificationSettingsObservers;
}

- (void)setNotificationSettingsObservers:(id)a3
{
}

- (UNNotificationSystemSettings)currentNotificationSystemSettings
{
  return self->_currentNotificationSystemSettings;
}

- (void)setCurrentNotificationSystemSettings:(id)a3
{
}

- (CRSUIClusterThemeManager)clusterThemeManager
{
  return self->_clusterThemeManager;
}

- (void)setClusterThemeManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clusterThemeManager, 0);
  objc_storeStrong((id *)&self->_currentNotificationSystemSettings, 0);
  objc_storeStrong((id *)&self->_notificationSettingsObservers, 0);
  objc_storeStrong((id *)&self->_siriPreferences, 0);
  objc_storeStrong((id *)&self->_panels, 0);
  objc_storeStrong((id *)&self->_rootPanel, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_vehicle, 0);
  objc_storeStrong((id *)&self->_pairedManager, 0);

  objc_storeStrong((id *)&self->_sessionStatus, 0);
}

@end