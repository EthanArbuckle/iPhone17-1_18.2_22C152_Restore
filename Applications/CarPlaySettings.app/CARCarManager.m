@interface CARCarManager
- (BOOL)stopTrackingInRangeNotification;
- (CAFCar)currentCar;
- (CAFCarManager)carManager;
- (CARCarManager)init;
- (CARObserverHashTable)observers;
- (NSDate)checkInRangeDevicesStartDate;
- (NSString)accountName;
- (id)avatarImageAsNotificationIcon;
- (void)_observeASCs;
- (void)_postInRangeNotificationIfNeeded;
- (void)_postNotification:(id)a3 isFallback:(BOOL)a4;
- (void)_stopObservingASCs;
- (void)_stopObservingPairedDevicesASCs;
- (void)accessoryDidUpdate:(id)a3 receivedAllValues:(BOOL)a4;
- (void)addObserver:(id)a3;
- (void)carDidUpdateAccessories:(id)a3;
- (void)carManager:(id)a3 didUpdateCurrentCar:(id)a4;
- (void)dealloc;
- (void)openSettingsURL:(id)a3;
- (void)pairedDevicesInformationService:(id)a3 didUpdatePairedDeviceList:(id)a4;
- (void)removeObserver:(id)a3;
- (void)setCarManager:(id)a3;
- (void)setCheckInRangeDevicesStartDate:(id)a3;
- (void)setCurrentCar:(id)a3;
- (void)setObservers:(id)a3;
- (void)setStopTrackingInRangeNotification:(BOOL)a3;
@end

@implementation CARCarManager

- (CARCarManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)CARCarManager;
  v2 = [(CARCarManager *)&v10 init];
  if (v2)
  {
    v3 = sub_100021030();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[Settings] CarManager init", v9, 2u);
    }

    v4 = (CARObserverHashTable *)[objc_alloc((Class)CARObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___CARCarManagerObserver];
    observers = v2->_observers;
    v2->_observers = v4;

    v6 = (CAFCarManager *)objc_alloc_init((Class)CAFCarManager);
    carManager = v2->_carManager;
    v2->_carManager = v6;

    [(CAFCarManager *)v2->_carManager registerObserver:v2];
  }
  return v2;
}

- (void)dealloc
{
  [(CARCarManager *)self _stopObservingASCs];
  v3.receiver = self;
  v3.super_class = (Class)CARCarManager;
  [(CARCarManager *)&v3 dealloc];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  v5 = [(CARCarManager *)self observers];
  [v5 addObserver:v4];

  v6 = [(CARCarManager *)self observers];
  v7 = [(CARCarManager *)self currentCar];
  [v6 carManager:self didUpdateCurrentCar:v7];

  id v10 = [(CARCarManager *)self observers];
  v8 = [(CARCarManager *)self currentCar];
  v9 = [v8 pairedDevices];
  [v10 carManager:self didUpdatePairedDevices:v9];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CARCarManager *)self observers];
  [v5 removeObserver:v4];
}

- (void)setStopTrackingInRangeNotification:(BOOL)a3
{
  if (a3) {
    [(CARCarManager *)self _stopObservingPairedDevicesASCs];
  }
}

- (void)carManager:(id)a3 didUpdateCurrentCar:(id)a4
{
  id v5 = a4;
  v6 = sub_100021030();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[Settings] CarManager current car updated", v14, 2u);
  }

  [(CARCarManager *)self setStopTrackingInRangeNotification:0];
  v7 = +[NSDate date];
  [(CARCarManager *)self setCheckInRangeDevicesStartDate:v7];

  [(CARCarManager *)self _stopObservingASCs];
  [(CARCarManager *)self setCurrentCar:v5];
  v8 = [(CARCarManager *)self currentCar];
  v9 = [v8 pairedDevices];
  unsigned int v10 = [v9 receivedAllValues];

  if (v10)
  {
    v11 = +[CARSettingsAppDelegate sharedDelegate];
    v12 = [v11 signpostManager];
    [v12 emitInstantOnIfNeeded];
  }
  [(CARCarManager *)self _observeASCs];
  v13 = [(CARCarManager *)self observers];
  [v13 carManager:self didUpdateCurrentCar:v5];
}

- (void)carDidUpdateAccessories:(id)a3
{
  id v4 = a3;
  [(CARCarManager *)self _observeASCs];
  id v5 = [v4 pairedDevices];

  LODWORD(v4) = [v5 receivedAllValues];
  if (v4)
  {
    id v7 = +[CARSettingsAppDelegate sharedDelegate];
    v6 = [v7 signpostManager];
    [v6 emitInstantOnIfNeeded];
  }
}

- (void)accessoryDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v5 = sub_100021030();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Settings] CarManager accessory updated", v16, 2u);
  }

  [(CARCarManager *)self _observeASCs];
  v6 = [(CARCarManager *)self currentCar];
  id v7 = [v6 pairedDevices];

  if (v7)
  {
    v8 = [(CARCarManager *)self observers];
    v9 = [(CARCarManager *)self currentCar];
    unsigned int v10 = [v9 pairedDevices];
    [v8 carManager:self didUpdatePairedDevices:v10];
  }
  v11 = [(CARCarManager *)self currentCar];
  v12 = [v11 pairedDevices];
  unsigned int v13 = [v12 receivedAllValues];

  if (v13)
  {
    v14 = +[CARSettingsAppDelegate sharedDelegate];
    v15 = [v14 signpostManager];
    [v15 emitInstantOnIfNeeded];
  }
}

- (void)pairedDevicesInformationService:(id)a3 didUpdatePairedDeviceList:(id)a4
{
  id v5 = a3;
  v6 = sub_100021030();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[Settings] CarManager paired device list updated", v10, 2u);
  }

  id v7 = [(CARCarManager *)self observers];
  v8 = [v5 car];

  v9 = [v8 pairedDevices];
  [v7 carManager:self didUpdatePairedDevices:v9];

  [(CARCarManager *)self _postInRangeNotificationIfNeeded];
}

- (void)openSettingsURL:(id)a3
{
  if ([a3 isDevicePickerURL])
  {
    id v4 = [(CARCarManager *)self observers];
    [v4 carManagerRequestedDevicePicker:self];
  }
}

- (void)_observeASCs
{
  objc_super v3 = [(CARCarManager *)self currentCar];
  [v3 registerObserver:self];

  id v4 = [(CARCarManager *)self currentCar];
  id v5 = [v4 pairedDevices];
  [v5 registerObserver:self];

  id v8 = [(CARCarManager *)self currentCar];
  v6 = [v8 pairedDevices];
  id v7 = [v6 pairedDevicesInformation];
  [v7 registerObserver:self];
}

- (void)_stopObservingPairedDevicesASCs
{
  objc_super v3 = sub_100021030();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[Settings] Paired Devices ASCs are not tracked by CarManager anymore", v9, 2u);
  }

  id v4 = [(CARCarManager *)self currentCar];
  id v5 = [v4 pairedDevices];
  v6 = [v5 pairedDevicesInformation];
  [v6 unregisterObserver:self];

  id v7 = [(CARCarManager *)self currentCar];
  id v8 = [v7 pairedDevices];
  [v8 unregisterObserver:self];
}

- (void)_stopObservingASCs
{
  [(CARCarManager *)self _stopObservingPairedDevicesASCs];
  id v3 = [(CARCarManager *)self currentCar];
  [v3 unregisterObserver:self];
}

- (void)_postInRangeNotificationIfNeeded
{
  if ([(CARCarManager *)self stopTrackingInRangeNotification])
  {
    id v3 = sub_100021030();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v4 = "[Settings] InRange notification is not tracked anymore";
      id v5 = v3;
      uint32_t v6 = 2;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v4, buf, v6);
      goto LABEL_44;
    }
    goto LABEL_44;
  }
  id v7 = +[NSDate date];
  id v8 = [(CARCarManager *)self checkInRangeDevicesStartDate];
  [v7 timeIntervalSinceDate:v8];
  double v10 = v9;

  if (v10 <= 60.0)
  {
    v11 = +[CARSettingsAppDelegate sharedDelegate];
    v12 = [v11 carManager];
    unsigned int v13 = [v12 currentCar];
    id v3 = [v13 pairedDevices];

    if (!v3)
    {
      v24 = sub_100021030();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v25 = "[Settings] CarManager can't process InRange notification, pairedDevices is nil";
LABEL_25:
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v25, buf, 2u);
      }
LABEL_43:

      goto LABEL_44;
    }
    v38 = self;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v14 = [v3 pairedDevicesInformation];
    v15 = [v14 pairedDeviceList];

    id v16 = [v15 countByEnumeratingWithState:&v43 objects:v52 count:16];
    if (!v16) {
      goto LABEL_19;
    }
    id v17 = v16;
    uint64_t v18 = *(void *)v44;
LABEL_11:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v44 != v18) {
        objc_enumerationMutation(v15);
      }
      v20 = *(void **)(*((void *)&v43 + 1) + 8 * v19);
      v21 = sub_100021030();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = [v20 name];
        [v20 state];
        v23 = NSStringFromPairedDeviceState();
        *(_DWORD *)buf = 138412546;
        double v49 = *(double *)&v22;
        __int16 v50 = 2114;
        v51 = v23;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[Settings] Device: %@=%{public}@", buf, 0x16u);
      }
      if ([v20 state] == 1) {
        break;
      }
      if (v17 == (id)++v19)
      {
        id v17 = [v15 countByEnumeratingWithState:&v43 objects:v52 count:16];
        if (v17) {
          goto LABEL_11;
        }
LABEL_19:

        v24 = sub_100021030();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v25 = "[Settings] CarManager no InRange devices available";
          goto LABEL_25;
        }
        goto LABEL_43;
      }
    }

    v26 = v38;
    uint64_t v27 = [(CARCarManager *)v38 accountName];
    if (v27)
    {
      v24 = v27;
      v28 = v38;
      v29 = v24;
      uint64_t v30 = 0;
    }
    else
    {
      v31 = sub_100021030();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "[Settings] CarManager Unable to retrieve account name, will use device name.", buf, 2u);
      }

      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      v32 = [v3 pairedDevicesInformation];
      v33 = [v32 pairedDeviceList];

      v24 = [v33 countByEnumeratingWithState:&v39 objects:v47 count:16];
      if (v24)
      {
        uint64_t v34 = *(void *)v40;
        while (2)
        {
          for (i = 0; i != v24; i = ((char *)i + 1))
          {
            if (*(void *)v40 != v34) {
              objc_enumerationMutation(v33);
            }
            v36 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            if ([v36 state] == 2)
            {
              v24 = [v36 name];
              goto LABEL_38;
            }
          }
          v24 = [v33 countByEnumeratingWithState:&v39 objects:v47 count:16];
          if (v24) {
            continue;
          }
          break;
        }
LABEL_38:
        v26 = v38;
      }

      if (![v24 length])
      {
        v37 = sub_100021030();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "[Settings] CarManager empty device name not able to present notification.", buf, 2u);
        }

        goto LABEL_42;
      }
      v28 = v26;
      v29 = v24;
      uint64_t v30 = 1;
    }
    [(CARCarManager *)v28 _postNotification:v29 isFallback:v30];
LABEL_42:
    [(CARCarManager *)v26 setStopTrackingInRangeNotification:1];
    goto LABEL_43;
  }
  [(CARCarManager *)self setStopTrackingInRangeNotification:1];
  id v3 = sub_100021030();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349056;
    double v49 = v10;
    id v4 = "[Settings] Stop tracking InRange notification (%{public}f)";
    id v5 = v3;
    uint32_t v6 = 12;
    goto LABEL_7;
  }
LABEL_44:
}

- (void)_postNotification:(id)a3 isFallback:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = sub_100021030();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[Settings] Posting notification", buf, 2u);
  }

  id v8 = objc_alloc_init((Class)UNMutableNotificationContent);
  [v8 setCategoryIdentifier:@"CarPlaySettings"];
  if (v4)
  {
    double v9 = sub_1000210C8(@"INRANGE_NOTIFICATION_TITLE_FALLBACK_%@");
    double v10 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v6);
    [v8 setTitle:v10];
  }
  else
  {
    v11 = sub_1000210C8(@"INRANGE_NOTIFICATION_TITLE_%@");
    v12 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11, v6);
    [v8 setTitle:v12];

    double v9 = [(CARCarManager *)self avatarImageAsNotificationIcon];
    if (v9) {
      [v8 setIcon:v9];
    }
  }

  unsigned int v13 = sub_1000210C8(@"INRANGE_NOTIFICATION_SUBTITLE");
  [v8 setSubtitle:v13];

  v14 = +[UNNotificationSound defaultSound];
  [v8 setSound:v14];

  v15 = +[NSBundle mainBundle];
  id v16 = [v15 bundleIdentifier];
  [v8 setDefaultActionBundleIdentifier:v16];

  id v17 = [objc_alloc((Class)NSURL) initWithString:@"carplaysettings://?devicePicker"];
  [v8 setDefaultActionURL:v17];

  uint64_t v18 = +[NSUUID UUID];
  uint64_t v19 = [v18 UUIDString];
  v20 = +[UNNotificationRequest requestWithIdentifier:v19 content:v8 trigger:0 destinations:8];

  v21 = +[UNUserNotificationCenter currentNotificationCenter];
  [v21 addNotificationRequest:v20 withCompletionHandler:0];
}

- (CAFCar)currentCar
{
  return self->_currentCar;
}

- (void)setCurrentCar:(id)a3
{
}

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (BOOL)stopTrackingInRangeNotification
{
  return self->_stopTrackingInRangeNotification;
}

- (CAFCarManager)carManager
{
  return self->_carManager;
}

- (void)setCarManager:(id)a3
{
}

- (NSDate)checkInRangeDevicesStartDate
{
  return self->_checkInRangeDevicesStartDate;
}

- (void)setCheckInRangeDevicesStartDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkInRangeDevicesStartDate, 0);
  objc_storeStrong((id *)&self->_carManager, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_currentCar, 0);
}

- (NSString)accountName
{
  id v3 = objc_allocWithZone((Class)type metadata accessor for CAFUIAccountManager());
  BOOL v4 = self;
  id v5 = [v3 init];
  (*(void (**)(void))((swift_isaMask & *v5) + 0x68))();
  uint64_t v7 = v6;

  if (v7)
  {
    NSString v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }

  return (NSString *)v8;
}

- (id)avatarImageAsNotificationIcon
{
  v2 = _sSo13CARCarManagerC15CarPlaySettingsE29avatarImageAsNotificationIconSo014UNNotificationJ0CSgyF_0();

  return v2;
}

@end