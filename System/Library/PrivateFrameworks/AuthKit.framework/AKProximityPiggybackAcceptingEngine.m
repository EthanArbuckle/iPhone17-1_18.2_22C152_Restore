@interface AKProximityPiggybackAcceptingEngine
- (BOOL)isActivated;
- (id)matchHandler;
- (void)_discoveredPeripheral:(id)a3 withServiceID:(id)a4;
- (void)activate;
- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)invalidate;
- (void)prepareWithController:(id)a3 queue:(id)a4;
- (void)setMatchHandler:(id)a3;
@end

@implementation AKProximityPiggybackAcceptingEngine

- (void)prepareWithController:(id)a3 queue:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AKProximityPiggybackAcceptingEngine;
  [(AKProximityPiggybackEngine *)&v9 prepareWithController:a3 queue:a4];
  id v5 = objc_alloc((Class)CBCentralManager);
  v6 = [(AKProximityPiggybackEngine *)self queue];
  v7 = (CBCentralManager *)[v5 initWithDelegate:self queue:v6 options:0];
  centralManager = self->_centralManager;
  self->_centralManager = v7;
}

- (void)activate
{
  v3 = [(AKProximityPiggybackEngine *)self presenceSID];
  v4 = +[CBUUID UUIDWithNSUUID:v3];

  centralManager = self->_centralManager;
  v11 = v4;
  v6 = +[NSArray arrayWithObjects:&v11 count:1];
  v9[0] = CBManagerIsPrivilegedDaemonKey;
  v9[1] = CBCentralManagerScanOptionAllowDuplicatesKey;
  v9[2] = CBCentralManagerScanOptionActive;
  v9[3] = CBCentralManagerScanOptionScanWindow;
  v10[0] = &__kCFBooleanTrue;
  v10[1] = &__kCFBooleanFalse;
  v10[2] = &__kCFBooleanFalse;
  v10[3] = &off_10023B008;
  v9[4] = CBCentralManagerScanOptionScanInterval;
  v10[4] = &off_10023B020;
  v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:5];
  [(CBCentralManager *)centralManager scanForPeripheralsWithServices:v6 options:v7];

  v8.receiver = self;
  v8.super_class = (Class)AKProximityPiggybackAcceptingEngine;
  [(AKProximityPiggybackEngine *)&v8 activate];
}

- (void)invalidate
{
  centralManager = self->_centralManager;
  if (centralManager)
  {
    [(CBCentralManager *)centralManager stopScan];
    v4 = self->_centralManager;
    self->_centralManager = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)AKProximityPiggybackAcceptingEngine;
  [(AKProximityPiggybackEngine *)&v5 invalidate];
}

- (BOOL)isActivated
{
  return self->_centralManager != 0;
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  id v5 = [(AKProximityPiggybackEngine *)self controller];
  [v5 proximityEngine:self managerDidUpdateState:v4];
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = _AKLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413314;
    v33 = self;
    __int16 v34 = 2112;
    id v35 = v10;
    __int16 v36 = 2112;
    id v37 = v11;
    __int16 v38 = 2112;
    id v39 = v12;
    __int16 v40 = 2112;
    id v41 = v13;
    _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%@: Central manager (%@) discovered peripheral (%@) with advertisement data (%@) and RSSI (%@)", buf, 0x34u);
  }

  objc_opt_class();
  id v15 = [v12 objectForKeyedSubscript:CBAdvertisementDataServiceUUIDsKey];
  v25 = v13;
  v26 = v10;
  if (objc_opt_isKindOfClass()) {
    id v16 = v15;
  }
  else {
    id v16 = 0;
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v17 = v16;
  id v18 = [v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v28;
    do
    {
      v21 = 0;
      do
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v21);
        objc_opt_class();
        id v23 = v22;
        if (objc_opt_isKindOfClass()) {
          id v24 = v23;
        }
        else {
          id v24 = 0;
        }

        -[AKProximityPiggybackAcceptingEngine _discoveredPeripheral:withServiceID:](self, "_discoveredPeripheral:withServiceID:", v11, v24, v25, v26, (void)v27);
        v21 = (char *)v21 + 1;
      }
      while (v19 != v21);
      id v19 = [v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v19);
  }
}

- (void)_discoveredPeripheral:(id)a3 withServiceID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    objc_super v8 = [(AKProximityPiggybackEngine *)self presenceSID];
    objc_super v9 = [v8 UUIDString];

    id v10 = [v7 UUIDString];
    unsigned int v11 = [v9 isEqual:v10];
    id v12 = _AKLogSystem();
    uint64_t v13 = (uint64_t)v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v14 = [(AKProximityPiggybackEngine *)self presenceSID];
        int v16 = 138413314;
        id v17 = self;
        __int16 v18 = 2112;
        id v19 = v6;
        __int16 v20 = 2160;
        uint64_t v21 = 1752392040;
        __int16 v22 = 2112;
        id v23 = v14;
        __int16 v24 = 2112;
        id v25 = v7;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v13, OS_LOG_TYPE_DEFAULT, "%@: Discovered peripheral (%@) with matching presenceSID (%{mask.hash}@) and serviceID (%@)", (uint8_t *)&v16, 0x34u);
      }
      id v15 = [(AKProximityPiggybackAcceptingEngine *)self matchHandler];

      if (!v15) {
        goto LABEL_12;
      }
      uint64_t v13 = [(AKProximityPiggybackAcceptingEngine *)self matchHandler];
      (*(void (**)(void))(v13 + 16))();
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v16 = 138412802;
      id v17 = self;
      __int16 v18 = 2112;
      id v19 = v6;
      __int16 v20 = 2112;
      uint64_t v21 = (uint64_t)v7;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v13, OS_LOG_TYPE_DEBUG, "%@: Discovered peripheral (%@) with non-matching serviceID (%@)", (uint8_t *)&v16, 0x20u);
    }

LABEL_12:
    goto LABEL_13;
  }
  objc_super v9 = _AKLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100188450((uint64_t)self, (uint64_t)v6, v9);
  }
LABEL_13:
}

- (id)matchHandler
{
  return self->_matchHandler;
}

- (void)setMatchHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_matchHandler, 0);

  objc_storeStrong((id *)&self->_centralManager, 0);
}

@end