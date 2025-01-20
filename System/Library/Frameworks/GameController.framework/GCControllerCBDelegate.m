@interface GCControllerCBDelegate
- (CBCentralManager)centralManager;
- (GCControllerCBDelegate)init;
- (id)completionHandler;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6;
- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didRetrieveConnectedPeripherals:(id)a4;
- (void)centralManager:(id)a3 didRetrievePeripherals:(id)a4;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)fireCompletionHandler;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverDescriptorsForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverIncludedServicesForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverServices:(id)a4;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didUpdateValueForDescriptor:(id)a4 error:(id)a5;
- (void)setCentralManager:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)startScan;
- (void)startScanWithTimeout:(double)a3;
- (void)stopScan;
@end

@implementation GCControllerCBDelegate

- (GCControllerCBDelegate)init
{
  v8.receiver = self;
  v8.super_class = (Class)GCControllerCBDelegate;
  v2 = [(GCControllerCBDelegate *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    foundPeripherals = v2->_foundPeripherals;
    v2->_foundPeripherals = (NSMutableArray *)v3;

    uint64_t v5 = objc_opt_new();
    connectedPeripherals = v2->_connectedPeripherals;
    v2->_connectedPeripherals = (NSMutableArray *)v5;
  }
  return v2;
}

- (void)fireCompletionHandler
{
  uint64_t v3 = (void *)MEMORY[0x223C6E420](self->_completionHandler, a2);
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;

  if (v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __47__GCControllerCBDelegate_fireCompletionHandler__block_invoke;
    block[3] = &unk_26D22C018;
    id v6 = v3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

uint64_t __47__GCControllerCBDelegate_fireCompletionHandler__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)stopScan
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __34__GCControllerCBDelegate_stopScan__block_invoke;
  block[3] = &unk_26D22A8C0;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)s_cbDelegateQueue, block);
}

uint64_t __34__GCControllerCBDelegate_stopScan__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) stopScan];
  v2 = *(void **)(a1 + 32);

  return [v2 fireCompletionHandler];
}

- (void)startScan
{
}

- (void)startScanWithTimeout:(double)a3
{
  uint64_t v5 = unk_26D2DAA38(&off_26D2DAD40, "UUIDWithString:", @"1812");
  id v6 = +[NSArray arrayWithObject:v5];

  v7 = +[NSNumber numberWithBool:0];
  objc_super v8 = +[NSDictionary dictionaryWithObject:v7 forKey:CBCentralManagerScanOptionAllowDuplicatesKey];

  [(CBCentralManager *)self->_centralManager scanForPeripheralsWithServices:v6 options:v8];
  v9 = [(CBCentralManager *)self->_centralManager retrieveConnectedPeripheralsWithServices:v6];
  if ([v9 count])
  {
    v10 = +[NSNumber numberWithBool:1];
    v11 = +[NSDictionary dictionaryWithObject:v10 forKey:CBConnectPeripheralOptionNotifyOnDisconnectionKey];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v12 = v9;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          [(NSMutableArray *)self->_foundPeripherals addObject:v17];
          [(CBCentralManager *)self->_centralManager connectPeripheral:v17 options:v11];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v14);
    }
  }
  if (a3 > 0.0)
  {
    dispatch_time_t v18 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __47__GCControllerCBDelegate_startScanWithTimeout___block_invoke;
    block[3] = &unk_26D22A8C0;
    void block[4] = self;
    dispatch_after(v18, (dispatch_queue_t)s_cbDelegateQueue, block);
  }
}

uint64_t __47__GCControllerCBDelegate_startScanWithTimeout___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopScan];
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 2)
  {
    if (gc_isInternalBuild())
    {
      objc_super v8 = getGCLogger();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_220998000, v8, OS_LOG_TYPE_DEFAULT, "The platform doesn't support Bluetooth Low Energy.", buf, 2u);
      }
    }
    uint64_t v5 = s_cbDelegateQueue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __55__GCControllerCBDelegate_centralManagerDidUpdateState___block_invoke;
    v13[3] = &unk_26D22A8C0;
    v13[4] = self;
    id v6 = v13;
  }
  else if ([v4 state] == 3)
  {
    if (gc_isInternalBuild())
    {
      v9 = getGCLogger();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_220998000, v9, OS_LOG_TYPE_DEFAULT, "The app is not authorized to use Bluetooth Low Energy.", buf, 2u);
      }
    }
    uint64_t v5 = s_cbDelegateQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = __55__GCControllerCBDelegate_centralManagerDidUpdateState___block_invoke_102;
    v12[3] = &unk_26D22A8C0;
    v12[4] = self;
    id v6 = v12;
  }
  else
  {
    uint64_t v7 = [v4 state];
    uint64_t v5 = s_cbDelegateQueue;
    if (v7 > 4)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = __55__GCControllerCBDelegate_centralManagerDidUpdateState___block_invoke_3;
      v10[3] = &unk_26D22A8C0;
      v10[4] = self;
      id v6 = v10;
    }
    else
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = __55__GCControllerCBDelegate_centralManagerDidUpdateState___block_invoke_2;
      v11[3] = &unk_26D22A8C0;
      v11[4] = self;
      id v6 = v11;
    }
  }
  dispatch_async(v5, v6);
}

uint64_t __55__GCControllerCBDelegate_centralManagerDidUpdateState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) fireCompletionHandler];
}

uint64_t __55__GCControllerCBDelegate_centralManagerDidUpdateState___block_invoke_102(uint64_t a1)
{
  return [*(id *)(a1 + 32) fireCompletionHandler];
}

uint64_t __55__GCControllerCBDelegate_centralManagerDidUpdateState___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) fireCompletionHandler];
}

uint64_t __55__GCControllerCBDelegate_centralManagerDidUpdateState___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) startScan];
}

- (void)centralManager:(id)a3 didRetrievePeripherals:(id)a4
{
  id v4 = a4;
  if (gc_isInternalBuild())
  {
    uint64_t v5 = getGCLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_220998000, v5, OS_LOG_TYPE_DEFAULT, "centralManager: didRetrievePeripherals:%@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)centralManager:(id)a3 didRetrieveConnectedPeripherals:(id)a4
{
  id v4 = a4;
  if (gc_isInternalBuild())
  {
    uint64_t v5 = getGCLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_220998000, v5, OS_LOG_TYPE_DEFAULT, "centralManager: didRetrieveConnectedPeripherals:%@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  if (gc_isInternalBuild())
  {
    v16 = getGCLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412802;
      id v18 = v10;
      __int16 v19 = 2112;
      id v20 = v11;
      __int16 v21 = 2112;
      id v22 = v12;
      _os_log_impl(&dword_220998000, v16, OS_LOG_TYPE_DEFAULT, "centralManager: didDiscoverPeripheral:%@ advertisementData:%@ RSSI:%@", (uint8_t *)&v17, 0x20u);
    }
  }
  [(NSMutableArray *)self->_foundPeripherals addObject:v10];
  uint64_t v14 = +[NSNumber numberWithBool:1];
  uint64_t v15 = +[NSDictionary dictionaryWithObject:v14 forKey:CBConnectPeripheralOptionNotifyOnDisconnectionKey];

  [v13 connectPeripheral:v10 options:v15];
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v5 = a4;
  if (gc_isInternalBuild())
  {
    id v11 = getGCLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v5;
      _os_log_impl(&dword_220998000, v11, OS_LOG_TYPE_DEFAULT, "centralManager: didConnectPeripheral:%@", buf, 0xCu);
    }
  }
  [(NSMutableArray *)self->_connectedPeripherals addObject:v5];
  [v5 setDelegate:self];
  int v6 = unk_26D2DAA38(&off_26D2DAD40, "UUIDWithString:", @"1812");
  id v7 = unk_26D2DAA38(&off_26D2DAD40, "UUIDWithString:", @"180A", v6);
  v12[1] = v7;
  objc_super v8 = unk_26D2DAA38(&off_26D2DAD40, "UUIDWithString:", @"180F");
  v12[2] = v8;
  v9 = unk_26D2DAA38(&off_26D2DAD40, "UUIDWithString:", @"7d74f4bd-c74a-4431-862c-cce884371592");
  v12[3] = v9;
  id v10 = +[NSArray arrayWithObjects:v12 count:4];

  [v5 discoverServices:v10];
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v4 = a3;
  if (gc_isInternalBuild())
  {
    id v11 = getGCLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [v4 services];
      *(_DWORD *)buf = 138412290;
      __int16 v19 = v12;
      _os_log_impl(&dword_220998000, v11, OS_LOG_TYPE_DEFAULT, "peripheral: didDiscoverServices: -> %@", buf, 0xCu);
    }
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = objc_msgSend(v4, "services", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        [v4 discoverIncludedServices:0 forService:v10];
        [v4 discoverCharacteristics:0 forService:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void)peripheral:(id)a3 didDiscoverIncludedServicesForService:(id)a4 error:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  if (gc_isInternalBuild())
  {
    long long v13 = getGCLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      long long v14 = [v7 includedServices];
      *(_DWORD *)buf = 138412290;
      __int16 v21 = v14;
      _os_log_impl(&dword_220998000, v13, OS_LOG_TYPE_DEFAULT, "peripheral: didDiscoverIncludedServicesForService: -> %@", buf, 0xCu);
    }
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = objc_msgSend(v7, "includedServices", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        [v6 discoverCharacteristics:0 forService:*(void *)(*((void *)&v15 + 1) + 8 * v12++)];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  if (gc_isInternalBuild())
  {
    v36 = getGCLogger();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = [v7 UUID];
      v38 = [v37 data];
      v39 = [v7 UUID];
      *(_DWORD *)buf = 138412546;
      v50 = v38;
      __int16 v51 = 2112;
      uint64_t v52 = (uint64_t)v39;
      _os_log_impl(&dword_220998000, v36, OS_LOG_TYPE_DEFAULT, "peripheral: didDiscoverCharacteristicsForService:(%@) '%@'", buf, 0x16u);
    }
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = [v7 characteristics];
  uint64_t v8 = [obj countByEnumeratingWithState:&v45 objects:v55 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v46;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v46 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v45 + 1) + 8 * v11);
        long long v13 = [v7 UUID];
        long long v14 = unk_26D2DAA38(&off_26D2DAD40, "UUIDWithString:", @"180F");
        int v15 = [v13 isEqual:v14];

        if (v15)
        {
          if (gc_isInternalBuild())
          {
            long long v16 = getGCLogger();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              v41 = [v12 UUID];
              long long v17 = [v41 data];
              long long v18 = [v12 UUID];
              *(_DWORD *)buf = 138412546;
              v50 = v17;
              __int16 v51 = 2112;
              uint64_t v52 = (uint64_t)v18;
              __int16 v19 = v16;
              id v20 = "=battery=: (%@) %@ ";
              goto LABEL_27;
            }
LABEL_28:
          }
LABEL_17:
          [v6 readValueForCharacteristic:v12];
          goto LABEL_18;
        }
        __int16 v21 = [v7 UUID];
        id v22 = unk_26D2DAA38(&off_26D2DAD40, "UUIDWithString:", @"180A");
        int v23 = [v21 isEqual:v22];

        if (v23)
        {
          if (!gc_isInternalBuild()) {
            goto LABEL_17;
          }
          long long v16 = getGCLogger();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_28;
          }
          v41 = [v12 UUID];
          long long v17 = [v41 data];
          long long v18 = [v12 UUID];
          *(_DWORD *)buf = 138412546;
          v50 = v17;
          __int16 v51 = 2112;
          uint64_t v52 = (uint64_t)v18;
          __int16 v19 = v16;
          id v20 = "=device info=: (%@) %@ ";
LABEL_27:
          _os_log_impl(&dword_220998000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0x16u);

          goto LABEL_28;
        }
        v24 = [v7 UUID];
        v25 = unk_26D2DAA38(&off_26D2DAD40, "UUIDWithString:", @"1812");
        int v26 = [v24 isEqual:v25];

        int isInternalBuild = gc_isInternalBuild();
        if (v26)
        {
          if (!isInternalBuild) {
            goto LABEL_17;
          }
          long long v16 = getGCLogger();
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_28;
          }
          v41 = [v12 UUID];
          long long v17 = [v41 data];
          long long v18 = [v12 UUID];
          *(_DWORD *)buf = 138412546;
          v50 = v17;
          __int16 v51 = 2112;
          uint64_t v52 = (uint64_t)v18;
          __int16 v19 = v16;
          id v20 = "=hid=: (%@) %@ ";
          goto LABEL_27;
        }
        if (isInternalBuild)
        {
          v32 = getGCLogger();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            v43 = [v12 UUID];
            v33 = [v43 data];
            uint64_t v40 = [v12 properties];
            v34 = [v12 UUID];
            *(_DWORD *)buf = 138412802;
            v50 = v33;
            __int16 v51 = 2048;
            uint64_t v52 = v40;
            __int16 v53 = 2112;
            v54 = v34;
            _os_log_impl(&dword_220998000, v32, OS_LOG_TYPE_DEFAULT, "=misc=: (%@:0x%lx) %@ ", buf, 0x20u);
          }
        }
        if (gc_isInternalBuild())
        {
          v28 = getGCLogger();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            v29 = [v12 value];
            id v30 = objc_alloc((Class)&off_26D2B6E68);
            v42 = [v12 value];
            v31 = (void *)[v30 initWithData:v42 encoding:4];
            *(_DWORD *)buf = 138412546;
            v50 = v29;
            __int16 v51 = 2112;
            uint64_t v52 = (uint64_t)v31;
            _os_log_impl(&dword_220998000, v28, OS_LOG_TYPE_DEFAULT, "(%@) '%@'", buf, 0x16u);
          }
        }
LABEL_18:
        [v6 discoverDescriptorsForCharacteristic:v12];
        ++v11;
      }
      while (v9 != v11);
      uint64_t v35 = [obj countByEnumeratingWithState:&v45 objects:v55 count:16];
      uint64_t v9 = v35;
    }
    while (v35);
  }
}

- (void)peripheral:(id)a3 didDiscoverDescriptorsForCharacteristic:(id)a4 error:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  if (gc_isInternalBuild())
  {
    long long v13 = getGCLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      long long v14 = [v7 UUID];
      *(_DWORD *)buf = 138412290;
      __int16 v21 = v14;
      _os_log_impl(&dword_220998000, v13, OS_LOG_TYPE_DEFAULT, "peripheral: didDiscoverDescriptorsForCharacteristic:%@ error:", buf, 0xCu);
    }
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = objc_msgSend(v7, "descriptors", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        [v6 readValueForDescriptor:*(void *)(*((void *)&v15 + 1) + 8 * v12++)];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v5 = a4;
  if (gc_isInternalBuild())
  {
    uint64_t v11 = getGCLogger();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v5 UUID];
      long long v13 = [v12 data];
      long long v14 = [v5 UUID];
      int v21 = 138412546;
      double v22 = *(double *)&v13;
      __int16 v23 = 2112;
      v24 = v14;
      _os_log_impl(&dword_220998000, v11, OS_LOG_TYPE_DEFAULT, "peripheral: didUpdateValueForCharacteristic:(%@) '%@'", (uint8_t *)&v21, 0x16u);
    }
  }
  id v6 = [v5 UUID];
  id v7 = unk_26D2DAA38(&off_26D2DAD40, "UUIDWithString:", @"2A19");
  int v8 = [v6 isEqual:v7];

  if (v8)
  {
    uint64_t v9 = [v5 value];
    uint64_t v10 = (unsigned __int16 *)[v9 bytes];
    if (gc_isInternalBuild())
    {
      long long v15 = getGCLogger();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        double v16 = (double)(int)__rev16(*v10);
        int v21 = 134217984;
        double v22 = v16;
        _os_log_impl(&dword_220998000, v15, OS_LOG_TYPE_DEFAULT, "battery level: %02.1f%%", (uint8_t *)&v21, 0xCu);
      }
    }
    if (!gc_isInternalBuild()) {
      goto LABEL_5;
    }
    long long v17 = getGCLogger();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412290;
      double v22 = *(double *)&v9;
      _os_log_impl(&dword_220998000, v17, OS_LOG_TYPE_DEFAULT, "(%@)", (uint8_t *)&v21, 0xCu);
    }
    goto LABEL_18;
  }
  if (!gc_isInternalBuild()) {
    goto LABEL_7;
  }
  uint64_t v9 = getGCLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    long long v17 = [v5 value];
    id v18 = objc_alloc((Class)&off_26D2B6E68);
    __int16 v19 = [v5 value];
    id v20 = (void *)[v18 initWithData:v19 encoding:4];
    int v21 = 138412546;
    double v22 = *(double *)&v17;
    __int16 v23 = 2112;
    v24 = v20;
    _os_log_impl(&dword_220998000, v9, OS_LOG_TYPE_DEFAULT, "(%@) '%@'", (uint8_t *)&v21, 0x16u);

LABEL_18:
  }
LABEL_5:

LABEL_7:
}

- (void)peripheral:(id)a3 didUpdateValueForDescriptor:(id)a4 error:(id)a5
{
  id v5 = a4;
  if (gc_isInternalBuild())
  {
    long long v17 = getGCLogger();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = [v5 UUID];
      __int16 v19 = [v18 data];
      id v20 = [v5 UUID];
      *(_DWORD *)buf = 138412546;
      *(void *)v25 = v19;
      *(_WORD *)&v25[8] = 2112;
      *(void *)int v26 = v20;
      _os_log_impl(&dword_220998000, v17, OS_LOG_TYPE_DEFAULT, "peripheral: didUpdateValueForDescriptor:(%@) '%@'", buf, 0x16u);
    }
  }
  id v6 = [v5 UUID];
  id v7 = unk_26D2DAA38(&off_26D2DAD40, "UUIDWithString:", @"2908");
  int v8 = [v6 isEqual:v7];

  if (v8)
  {
    uint64_t v9 = [v5 value];
    uint64_t v10 = [v9 bytes];
    if ([v9 length])
    {
      unint64_t v11 = 0;
      do
      {
        if (gc_isInternalBuild())
        {
          uint64_t v12 = getGCLogger();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            int v21 = *(unsigned __int8 *)(v10 + v11 + 1) - 1;
            int v22 = *(unsigned __int8 *)(v10 + v11);
            __int16 v23 = [v5 characteristic];
            long long v13 = [v23 UUID];
            *(_DWORD *)buf = 67109634;
            *(_DWORD *)v25 = v22;
            *(_WORD *)&v25[4] = 1024;
            *(_DWORD *)&v25[6] = v21;
            *(_WORD *)int v26 = 2112;
            *(void *)&v26[2] = v13;
            _os_log_impl(&dword_220998000, v12, OS_LOG_TYPE_DEFAULT, "Found HID report 0x%02x of type %d on char %@", buf, 0x18u);
          }
        }
        v11 += 2;
      }
      while ([v9 length] > v11);
    }
LABEL_14:

    goto LABEL_15;
  }
  if (gc_isInternalBuild())
  {
    uint64_t v9 = getGCLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      long long v14 = [v5 characteristic];
      long long v15 = [v14 UUID];
      double v16 = [v5 value];
      *(_DWORD *)buf = 138412546;
      *(void *)v25 = v15;
      *(_WORD *)&v25[8] = 2112;
      *(void *)int v26 = v16;
      _os_log_impl(&dword_220998000, v9, OS_LOG_TYPE_DEFAULT, "on (%@): %@", buf, 0x16u);
    }
    goto LABEL_14;
  }
LABEL_15:
}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (gc_isInternalBuild())
  {
    uint64_t v9 = getGCLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      id v11 = v7;
      __int16 v12 = 2112;
      id v13 = v8;
      _os_log_impl(&dword_220998000, v9, OS_LOG_TYPE_DEFAULT, "centralManager: didFailToConnectPeripheral:%@ error:%@", (uint8_t *)&v10, 0x16u);
    }
  }
  [(NSMutableArray *)self->_foundPeripherals removeObject:v7];
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (gc_isInternalBuild())
  {
    uint64_t v9 = getGCLogger();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      id v11 = v7;
      __int16 v12 = 2112;
      id v13 = v8;
      _os_log_impl(&dword_220998000, v9, OS_LOG_TYPE_DEFAULT, "centralManager: didDisconnectPeripheral:%@ error:%@", (uint8_t *)&v10, 0x16u);
    }
  }
  [(NSMutableArray *)self->_connectedPeripherals removeObject:v7];
}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (void)setCentralManager:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_connectedPeripherals, 0);

  objc_storeStrong((id *)&self->_foundPeripherals, 0);
}

@end