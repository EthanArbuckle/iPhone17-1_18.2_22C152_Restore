@interface HMDNetworkObserver
+ (id)supportedEventClasses;
- (BOOL)started;
- (BOOL)wifiAssociated;
- (HMDCurrentResidentDeviceDataSource)currentHomeDataSource;
- (HMDEventCountersManager)countersManager;
- (HMDLogEventDailyScheduler)dailyScheduler;
- (HMDNetworkObserver)initWithLogEventDispatcher:(id)a3 countersManager:(id)a4 dailyScheduler:(id)a5 currentHomeDataSource:(id)a6 dateProvider:(id)a7;
- (HMDNetworkObserver)initWithLogEventDispatcher:(id)a3 countersManager:(id)a4 dailyScheduler:(id)a5 currentHomeDataSource:(id)a6 dateProvider:(id)a7 wifiManager:(id)a8 notificationCenter:(id)a9 changeDebounceTimer:(id)a10 tickBlock:(id)a11;
- (HMFTimer)changeDebounceTimer;
- (HMFWiFiManager)wifiManager;
- (HMFWifiNetworkAssociation)networkAssociation;
- (HMMDateProvider)dateProvider;
- (HMMLogEventDispatching)logEventDispatcher;
- (NSMutableDictionary)topSessionErrors;
- (NSMutableDictionary)topWriteErrors;
- (NSNotificationCenter)notificationCenter;
- (id)_keyOfLargestCountInHistogram:(id)a3;
- (id)counterGroupForName:(id)a3 homeUUID:(id)a4 date:(id)a5;
- (id)logEventForHomeWithUUID:(id)a3 associatedWithDate:(id)a4;
- (id)tickBlock;
- (os_unfair_lock_s)networkAssociationLock;
- (unint64_t)collectionStartSeconds;
- (unint64_t)numAPChanges;
- (unint64_t)numGatewayChanges;
- (unint64_t)numReadErrors;
- (unint64_t)numReadWrites;
- (unint64_t)numWifiAssociations;
- (unint64_t)numWifiDisassociations;
- (unint64_t)numWriteErrors;
- (void)_clearNonPersistentCounters;
- (void)_handleAccessorySessionEvent:(id)a3;
- (void)_handleCurrentNetworkChangedNotification:(id)a3;
- (void)_handleReadWriteLogEvent:(id)a3;
- (void)_incrementError:(id)a3 forHistogram:(id)a4 byValue:(unint64_t)a5;
- (void)checkNetworkChange;
- (void)deleteCountersAfterDate:(id)a3;
- (void)deleteCountersBeforeDate:(id)a3;
- (void)didReceiveEventFromDispatcher:(id)a3;
- (void)runDailyTask;
- (void)setNetworkAssociationLock:(os_unfair_lock_s)a3;
- (void)setWifiAssociated:(BOOL)a3;
- (void)start;
- (void)stop;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDNetworkObserver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeDebounceTimer, 0);
  objc_storeStrong(&self->_tickBlock, 0);
  objc_storeStrong((id *)&self->_topSessionErrors, 0);
  objc_storeStrong((id *)&self->_topWriteErrors, 0);
  objc_storeStrong((id *)&self->_networkAssociation, 0);
  objc_destroyWeak((id *)&self->_dailyScheduler);
  objc_destroyWeak((id *)&self->_dateProvider);
  objc_destroyWeak((id *)&self->_currentHomeDataSource);
  objc_destroyWeak((id *)&self->_notificationCenter);
  objc_destroyWeak((id *)&self->_wifiManager);
  objc_destroyWeak((id *)&self->_countersManager);
  objc_destroyWeak((id *)&self->_logEventDispatcher);
}

- (HMFTimer)changeDebounceTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 168, 1);
}

- (id)tickBlock
{
  return self->_tickBlock;
}

- (BOOL)started
{
  return self->_started;
}

- (NSMutableDictionary)topSessionErrors
{
  return self->_topSessionErrors;
}

- (NSMutableDictionary)topWriteErrors
{
  return self->_topWriteErrors;
}

- (unint64_t)numWriteErrors
{
  return self->_numWriteErrors;
}

- (unint64_t)numReadErrors
{
  return self->_numReadErrors;
}

- (unint64_t)numReadWrites
{
  return self->_numReadWrites;
}

- (unint64_t)numGatewayChanges
{
  return self->_numGatewayChanges;
}

- (unint64_t)numAPChanges
{
  return self->_numAPChanges;
}

- (unint64_t)numWifiDisassociations
{
  return self->_numWifiDisassociations;
}

- (unint64_t)numWifiAssociations
{
  return self->_numWifiAssociations;
}

- (unint64_t)collectionStartSeconds
{
  return self->_collectionStartSeconds;
}

- (void)setWifiAssociated:(BOOL)a3
{
  self->_wifiAssociated = a3;
}

- (BOOL)wifiAssociated
{
  return self->_wifiAssociated;
}

- (HMFWifiNetworkAssociation)networkAssociation
{
  return self->_networkAssociation;
}

- (void)setNetworkAssociationLock:(os_unfair_lock_s)a3
{
  self->_networkAssociationLock = a3;
}

- (os_unfair_lock_s)networkAssociationLock
{
  return self->_networkAssociationLock;
}

- (HMDLogEventDailyScheduler)dailyScheduler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dailyScheduler);
  return (HMDLogEventDailyScheduler *)WeakRetained;
}

- (HMMDateProvider)dateProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dateProvider);
  return (HMMDateProvider *)WeakRetained;
}

- (HMDCurrentResidentDeviceDataSource)currentHomeDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentHomeDataSource);
  return (HMDCurrentResidentDeviceDataSource *)WeakRetained;
}

- (NSNotificationCenter)notificationCenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_notificationCenter);
  return (NSNotificationCenter *)WeakRetained;
}

- (HMFWiFiManager)wifiManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wifiManager);
  return (HMFWiFiManager *)WeakRetained;
}

- (HMDEventCountersManager)countersManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_countersManager);
  return (HMDEventCountersManager *)WeakRetained;
}

- (HMMLogEventDispatching)logEventDispatcher
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_logEventDispatcher);
  return (HMMLogEventDispatching *)WeakRetained;
}

- (void)timerDidFire:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDNetworkObserver *)self changeDebounceTimer];

  if (v5 == v4)
  {
    [(HMDNetworkObserver *)self checkNetworkChange];
  }
}

- (void)checkNetworkChange
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  v3 = [(HMDNetworkObserver *)self wifiManager];
  id v4 = [v3 currentNetworkAssociation];

  id v5 = (void *)MEMORY[0x230FBD990]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = HMFGetLogIdentifier();
    v9 = [v4 SSID];
    v10 = [v4 MACAddress];
    v11 = [v4 BSSID];
    v12 = [v4 gatewayIPAddress];
    v13 = [v4 gatewayMACAddress];
    int v28 = 138544642;
    v29 = v8;
    __int16 v30 = 2112;
    v31 = v9;
    __int16 v32 = 2112;
    v33 = v10;
    __int16 v34 = 2112;
    v35 = v11;
    __int16 v36 = 2112;
    v37 = v12;
    __int16 v38 = 2112;
    v39 = v13;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Network Change Detected.  New Network SSID %@ Local MAC %@, BSSID %@, gatewayIP %@,  gatewayMac %@", (uint8_t *)&v28, 0x3Eu);
  }
  v14 = [(HMDNetworkObserver *)v6 countersManager];
  v15 = [(HMDNetworkObserver *)v6 dateProvider];
  v16 = [v15 startOfCurrentDay];
  v17 = +[HMDDateCounterGroupSpecifier specifierWithGroupName:@"NetworkStatusEventGroup" date:v16];
  v18 = [v14 objectForKeyedSubscript:v17];

  if (v4)
  {
    v19 = [v4 SSID];

    if (v19)
    {
      if (!v6->_wifiAssociated)
      {
        [v18 incrementEventCounterForEventName:@"WifiAssociationCount"];
        ++v6->_numWifiAssociations;
      }
      v6->_wifiAssociated = 1;
      v20 = [v4 BSSID];
      v21 = [(HMDNetworkObserver *)v6 networkAssociation];
      v22 = [v21 BSSID];
      char v23 = [v20 isEqualToAddress:v22];

      if ((v23 & 1) == 0)
      {
        [v18 incrementEventCounterForEventName:@"APChangeCount"];
        ++v6->_numAPChanges;
      }
      v24 = [v4 gatewayMACAddress];
      v25 = [(HMDNetworkObserver *)v6 networkAssociation];
      v26 = [v25 gatewayMACAddress];
      char v27 = [v24 isEqualToAddress:v26];

      if ((v27 & 1) == 0)
      {
        [v18 incrementEventCounterForEventName:@"GatewayChangeCount"];
        ++v6->_numGatewayChanges;
      }
      os_unfair_lock_lock_with_options();
      objc_storeStrong((id *)&v6->_networkAssociation, v4);
      os_unfair_lock_unlock(&v6->_networkAssociationLock);
    }
  }
}

- (void)deleteCountersAfterDate:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDNetworkObserver *)self countersManager];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__HMDNetworkObserver_deleteCountersAfterDate___block_invoke;
  v7[3] = &unk_264A26DA0;
  id v8 = v4;
  id v6 = v4;
  [v5 removeCounterGroupsBasedOnPredicate:v7];
}

uint64_t __46__HMDNetworkObserver_deleteCountersAfterDate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  id v6 = [v5 groupName];
  if (v5)
  {
    v7 = [v5 date];
    if ([v7 compare:*(void *)(a1 + 32)] == 1)
    {
      if (([v6 isEqual:@"NetworkStatusEventGroup"] & 1) != 0
        || ([v6 isEqual:@"ReadWriteErrorEventGroup"] & 1) != 0)
      {
        uint64_t v8 = 1;
      }
      else
      {
        uint64_t v8 = [v6 isEqual:@"AccessorySessionErrorGroup"];
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)deleteCountersBeforeDate:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDNetworkObserver *)self countersManager];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__HMDNetworkObserver_deleteCountersBeforeDate___block_invoke;
  v7[3] = &unk_264A26DA0;
  id v8 = v4;
  id v6 = v4;
  [v5 removeCounterGroupsBasedOnPredicate:v7];
}

uint64_t __47__HMDNetworkObserver_deleteCountersBeforeDate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  id v6 = [v5 groupName];
  if (v5)
  {
    v7 = [v5 date];
    if ([v7 compare:*(void *)(a1 + 32)] == -1)
    {
      if (([v6 isEqual:@"NetworkStatusEventGroup"] & 1) != 0
        || ([v6 isEqual:@"ReadWriteErrorEventGroup"] & 1) != 0)
      {
        uint64_t v8 = 1;
      }
      else
      {
        uint64_t v8 = [v6 isEqual:@"AccessorySessionErrorGroup"];
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)logEventForHomeWithUUID:(id)a3 associatedWithDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDNetworkObserver *)self currentHomeDataSource];
  v9 = [v8 homeUUIDForCurrentResidentDevice];
  int v10 = objc_msgSend(v6, "hmf_isEqualToUUID:", v9);

  if (v10)
  {
    v11 = [(HMDNetworkObserver *)self countersManager];
    v12 = +[HMDDateCounterGroupSpecifier specifierWithGroupName:@"NetworkStatusEventGroup" date:v7];
    v13 = [v11 objectForKeyedSubscript:v12];

    v14 = [(HMDNetworkObserver *)self counterGroupForName:@"ReadWriteErrorEventGroup" homeUUID:v6 date:v7];
    v15 = [(HMDNetworkObserver *)self counterGroupForName:@"AccessorySessionErrorGroup" homeUUID:v6 date:v7];
    uint64_t v40 = [v13 fetchEventCounterForEventName:@"WifiAssociationCount"];
    uint64_t v39 = [v13 fetchEventCounterForEventName:@"WifiDissociationCount"];
    uint64_t v38 = [v13 fetchEventCounterForEventName:@"APChangeCount"];
    uint64_t v37 = [v13 fetchEventCounterForEventName:@"GatewayChangeCount"];
    uint64_t v36 = [v13 fetchEventCounterForEventName:@"ReadWriteCount"];
    uint64_t v34 = [v13 fetchEventCounterForEventName:@"ReadErrorCount"];
    uint64_t v33 = [v13 fetchEventCounterForEventName:@"WriteErrorCount"];
    v44[0] = 0;
    v42 = v14;
    [v14 maxCounterName:v44];
    id v35 = v44[0];
    id v43 = 0;
    [v15 maxCounterName:&v43];
    id v16 = v43;
    v41 = v15;
    uint64_t v32 = [v15 fetchEventCounterForEventName:v16];
    p_networkAssociationLock = &self->_networkAssociationLock;
    os_unfair_lock_lock_with_options();
    if (!self->_networkAssociation)
    {
      v18 = [(HMDNetworkObserver *)self wifiManager];
      v19 = [v18 currentNetworkAssociation];
      networkAssociation = self->_networkAssociation;
      self->_networkAssociation = v19;
    }
    v21 = [(HMDNetworkObserver *)self networkAssociation];
    v22 = [v21 BSSID];
    char v23 = [v22 formattedString];
    v24 = [v23 substringToIndex:8];

    v25 = [(HMDNetworkObserver *)self networkAssociation];
    v26 = [v25 SSID];

    char v27 = [(HMDNetworkObserver *)self networkAssociation];
    int v28 = [v27 gatewayMACAddress];
    v29 = [v28 formattedString];

    os_unfair_lock_unlock(p_networkAssociationLock);
    __int16 v30 = -[HMDNetworkStabilityLogEvent initWithHomeUUID:numWifiAssociations:wifiDisassociations:apChanges:gatewayChanges:numReadWrites:numReadErrors:numWriteErrors:topReadWriteError:topSessionError:numSessionErrors:apOUI:ssid:gatewayMACAddress:localHourOfDay:collectionDurationMinutes:]([HMDNetworkStabilityLogEvent alloc], "initWithHomeUUID:numWifiAssociations:wifiDisassociations:apChanges:gatewayChanges:numReadWrites:numReadErrors:numWriteErrors:topReadWriteError:topSessionError:numSessionErrors:apOUI:ssid:gatewayMACAddress:localHourOfDay:collectionDurationMinutes:", v6, v40, v39, v38, v37, v36, v34, v33, v35, v16, v32, v24, v26, v29, 0,
            0);
  }
  else
  {
    __int16 v30 = 0;
  }

  return v30;
}

- (void)runDailyTask
{
  id v3 = [(HMDNetworkObserver *)self topWriteErrors];
  int v28 = [(HMDNetworkObserver *)self _keyOfLargestCountInHistogram:v3];

  id v4 = [(HMDNetworkObserver *)self topSessionErrors];
  uint64_t v5 = [(HMDNetworkObserver *)self _keyOfLargestCountInHistogram:v4];

  v24 = (void *)v5;
  if (v5)
  {
    id v6 = [(HMDNetworkObserver *)self topSessionErrors];
    id v7 = [v6 objectForKeyedSubscript:v5];
    uint64_t v5 = [v7 unsignedIntValue];
  }
  os_unfair_lock_lock_with_options();
  if (!self->_networkAssociation)
  {
    uint64_t v8 = [(HMDNetworkObserver *)self wifiManager];
    v9 = [v8 currentNetworkAssociation];
    networkAssociation = self->_networkAssociation;
    self->_networkAssociation = v9;
  }
  v11 = [(HMDNetworkObserver *)self networkAssociation];
  v12 = [v11 BSSID];
  v13 = [v12 formattedString];
  char v27 = [v13 substringToIndex:8];

  v14 = [(HMDNetworkObserver *)self networkAssociation];
  v26 = [v14 SSID];

  v15 = [(HMDNetworkObserver *)self networkAssociation];
  id v16 = [v15 gatewayMACAddress];
  v25 = [v16 formattedString];

  os_unfair_lock_unlock(&self->_networkAssociationLock);
  v17 = [(HMDNetworkObserver *)self dateProvider];
  v18 = [(HMDNetworkObserver *)self currentHomeDataSource];
  char v23 = [v18 homeUUIDForCurrentResidentDevice];

  v19 = [(HMDNetworkObserver *)self tickBlock];
  unint64_t v22 = (unint64_t)(double)((v19[2]() - self->_collectionStartSeconds) / 0x3C);

  v20 = -[HMDNetworkStabilityLogEvent initWithHomeUUID:numWifiAssociations:wifiDisassociations:apChanges:gatewayChanges:numReadWrites:numReadErrors:numWriteErrors:topReadWriteError:topSessionError:numSessionErrors:apOUI:ssid:gatewayMACAddress:localHourOfDay:collectionDurationMinutes:]([HMDNetworkStabilityLogEvent alloc], "initWithHomeUUID:numWifiAssociations:wifiDisassociations:apChanges:gatewayChanges:numReadWrites:numReadErrors:numWriteErrors:topReadWriteError:topSessionError:numSessionErrors:apOUI:ssid:gatewayMACAddress:localHourOfDay:collectionDurationMinutes:", v23, -[HMDNetworkObserver numWifiAssociations](self, "numWifiAssociations"), -[HMDNetworkObserver numWifiDisassociations](self, "numWifiDisassociations"), -[HMDNetworkObserver numAPChanges](self, "numAPChanges"), -[HMDNetworkObserver numGatewayChanges](self, "numGatewayChanges"), -[HMDNetworkObserver numReadWrites](self, "numReadWrites"), -[HMDNetworkObserver numReadErrors](self, "numReadErrors"), -[HMDNetworkObserver numWriteErrors](self, "numWriteErrors"), v28, v24, v5, v27, v26, v25, [v17 localHourOfDay],
          v22);
  if (v20)
  {
    v21 = [(HMDNetworkObserver *)self logEventDispatcher];
    [v21 submitLogEvent:v20];
  }
  [(HMDNetworkObserver *)self _clearNonPersistentCounters];
}

- (void)didReceiveEventFromDispatcher:(id)a3
{
  id v9 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v9;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  if (v5)
  {
    [(HMDNetworkObserver *)self _handleReadWriteLogEvent:v5];
  }
  else
  {
    id v6 = v9;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
    id v8 = v7;

    if (!v8) {
      goto LABEL_12;
    }
    [(HMDNetworkObserver *)self _handleAccessorySessionEvent:v8];
  }

LABEL_12:
}

- (void)_handleAccessorySessionEvent:(id)a3
{
  id v14 = a3;
  id v4 = [v14 topErrorDomain];

  if (v4)
  {
    id v5 = [v14 homeUUID];
    id v6 = [(HMDNetworkObserver *)self dateProvider];
    id v7 = [v6 startOfCurrentDay];
    id v8 = [(HMDNetworkObserver *)self counterGroupForName:@"AccessorySessionErrorGroup" homeUUID:v5 date:v7];

    id v9 = (void *)MEMORY[0x263F087E8];
    int v10 = [v14 topErrorDomain];
    v11 = objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, objc_msgSend(v14, "topErrorCode"), 0);
    v12 = +[HMDLogEventErrorEventsAnalyzer eventCounterNameForError:v11];

    objc_msgSend(v8, "incrementEventCounterForEventName:withValue:", v12, objc_msgSend(v14, "sessionFailures"));
    v13 = [(HMDNetworkObserver *)self topSessionErrors];
    -[HMDNetworkObserver _incrementError:forHistogram:byValue:](self, "_incrementError:forHistogram:byValue:", v12, v13, [v14 sessionFailures]);
  }
}

- (void)_handleReadWriteLogEvent:(id)a3
{
  id v18 = a3;
  id v4 = [(HMDNetworkObserver *)self dateProvider];
  id v5 = [v4 startOfCurrentDay];

  id v6 = [v18 homeUUID];
  id v7 = [(HMDNetworkObserver *)self countersManager];
  id v8 = +[HMDDateCounterGroupSpecifier specifierWithGroupName:@"NetworkStatusEventGroup" date:v5];
  id v9 = [v7 objectForKeyedSubscript:v8];

  int v10 = [(HMDNetworkObserver *)self counterGroupForName:@"ReadWriteErrorEventGroup" homeUUID:v6 date:v5];
  [v9 incrementEventCounterForEventName:@"ReadWriteCount"];
  ++self->_numReadWrites;
  v11 = [v18 error];

  if (v11)
  {
    int v12 = [v18 isWriteOperation];
    if (v12) {
      v13 = @"WriteErrorCount";
    }
    else {
      v13 = @"ReadErrorCount";
    }
    if (v12) {
      uint64_t v14 = 136;
    }
    else {
      uint64_t v14 = 128;
    }
    [v9 incrementEventCounterForEventName:v13];
    ++*(Class *)((char *)&self->super.isa + v14);
    v15 = [v18 error];
    id v16 = +[HMDLogEventErrorEventsAnalyzer eventCounterNameForError:v15];

    [v10 incrementEventCounterForEventName:v16];
    v17 = [(HMDNetworkObserver *)self topWriteErrors];
    [(HMDNetworkObserver *)self _incrementError:v16 forHistogram:v17 byValue:1];
  }
}

- (void)_clearNonPersistentCounters
{
  self->_numWriteErrors = 0;
  *(_OWORD *)&self->_numReadWrites = 0u;
  *(_OWORD *)&self->_numAPChanges = 0u;
  *(_OWORD *)&self->_numWifiAssociations = 0u;
  id v3 = [(HMDNetworkObserver *)self tickBlock];
  self->_collectionStartSeconds = v3[2]();

  id v4 = [(HMDNetworkObserver *)self topWriteErrors];
  [v4 removeAllObjects];

  id v5 = [(HMDNetworkObserver *)self topSessionErrors];
  [v5 removeAllObjects];
}

- (id)_keyOfLargestCountInHistogram:(id)a3
{
  id v3 = a3;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  int v10 = __Block_byref_object_copy__77810;
  v11 = __Block_byref_object_dispose__77811;
  id v12 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__HMDNetworkObserver__keyOfLargestCountInHistogram___block_invoke;
  v6[3] = &unk_264A26D78;
  v6[4] = v13;
  v6[5] = &v7;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(v13, 8);
  return v4;
}

void __52__HMDNetworkObserver__keyOfLargestCountInHistogram___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) < (unint64_t)[v6 unsignedIntValue])
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v6 unsignedIntValue];
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

- (void)_incrementError:(id)a3 forHistogram:(id)a4 byValue:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];
  id v11 = v9;
  if (v9) {
    objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(v9, "unsignedLongValue") + a5);
  }
  else {
  int v10 = [NSNumber numberWithUnsignedInteger:a5];
  }
  [v7 setObject:v10 forKeyedSubscript:v8];
}

- (void)_handleCurrentNetworkChangedNotification:(id)a3
{
  id v4 = [(HMDNetworkObserver *)self wifiManager];
  id v12 = [v4 currentNetworkAssociation];

  id v5 = [(HMDNetworkObserver *)self countersManager];
  id v6 = [(HMDNetworkObserver *)self dateProvider];
  id v7 = [v6 startOfCurrentDay];
  id v8 = +[HMDDateCounterGroupSpecifier specifierWithGroupName:@"NetworkStatusEventGroup" date:v7];
  uint64_t v9 = [v5 objectForKeyedSubscript:v8];

  if (v12 && ([v12 SSID], int v10 = objc_claimAutoreleasedReturnValue(), v10, v10))
  {
    id v11 = [(HMDNetworkObserver *)self changeDebounceTimer];
    [v11 resume];
  }
  else if (self->_wifiAssociated)
  {
    self->_wifiAssociated = 0;
    [v9 incrementEventCounterForEventName:@"WifiDissociationCount"];
    ++self->_numWifiDisassociations;
  }
}

- (id)counterGroupForName:(id)a3 homeUUID:(id)a4 date:(id)a5
{
  if (a4)
  {
    id v8 = a5;
    id v9 = a4;
    id v10 = a3;
    id v11 = [(HMDNetworkObserver *)self countersManager];
    id v12 = +[HMDHouseholdDataEventCounterGroupSpecifier specifierWithGroupName:v10 homeUUID:v9 date:v8];

    v13 = [v11 objectForKeyedSubscript:v12];
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (void)stop
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (self->_started)
  {
    id v3 = (void *)MEMORY[0x230FBD990]();
    id v4 = self;
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      int v10 = 138543362;
      id v11 = v6;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Stopping", (uint8_t *)&v10, 0xCu);
    }
    id v7 = [(HMDNetworkObserver *)v4 changeDebounceTimer];
    [v7 suspend];

    id v8 = [(HMDNetworkObserver *)v4 logEventDispatcher];
    [v8 removeObserver:v4];

    id v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 removeObserver:v4 name:*MEMORY[0x263F424E8] object:0];

    self->_started = 0;
  }
}

- (void)start
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (!self->_started)
  {
    id v3 = (void *)MEMORY[0x230FBD990]();
    id v4 = self;
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = HMFGetLogIdentifier();
      int v14 = 138543362;
      v15 = v6;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting", (uint8_t *)&v14, 0xCu);
    }
    uint64_t v7 = *MEMORY[0x263F424E8];
    id v8 = [MEMORY[0x263F089F8] notificationWithName:*MEMORY[0x263F424E8] object:0];
    [(HMDNetworkObserver *)v4 _handleCurrentNetworkChangedNotification:v8];

    id v9 = [(HMDNetworkObserver *)v4 logEventDispatcher];
    int v10 = [(id)objc_opt_class() supportedEventClasses];
    [v9 addObserver:v4 forEventClasses:v10];

    id v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 addObserver:v4 selector:sel__handleCurrentNetworkChangedNotification_ name:v7 object:0];

    uint64_t v12 = [(HMDNetworkObserver *)v4 tickBlock];
    v4->_collectionStartSeconds = v12[2]();

    self->_started = 1;
    v13 = [(HMDNetworkObserver *)v4 dailyScheduler];
    [v13 registerDailyTaskRunner:v4];
  }
}

- (HMDNetworkObserver)initWithLogEventDispatcher:(id)a3 countersManager:(id)a4 dailyScheduler:(id)a5 currentHomeDataSource:(id)a6 dateProvider:(id)a7 wifiManager:(id)a8 notificationCenter:(id)a9 changeDebounceTimer:(id)a10 tickBlock:(id)a11
{
  id v16 = a3;
  id v17 = a4;
  id obj = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v33 = a10;
  id v22 = a11;
  v35.receiver = self;
  v35.super_class = (Class)HMDNetworkObserver;
  char v23 = [(HMDNetworkObserver *)&v35 init];
  v24 = v23;
  if (v23)
  {
    objc_storeWeak((id *)&v23->_logEventDispatcher, v16);
    objc_storeWeak((id *)&v24->_countersManager, v17);
    objc_storeWeak((id *)&v24->_wifiManager, v20);
    objc_storeWeak((id *)&v24->_notificationCenter, v21);
    v24->_wifiAssociated = 0;
    objc_storeWeak((id *)&v24->_currentHomeDataSource, v18);
    objc_storeWeak((id *)&v24->_dateProvider, v19);
    objc_storeWeak((id *)&v24->_dailyScheduler, obj);
    v25 = _Block_copy(v22);
    id tickBlock = v24->_tickBlock;
    v24->_id tickBlock = v25;

    v24->_networkAssociationLock._os_unfair_lock_opaque = 0;
    *(_OWORD *)&v24->_numWifiAssociations = 0u;
    *(_OWORD *)&v24->_numAPChanges = 0u;
    *(_OWORD *)&v24->_numReadWrites = 0u;
    v24->_numWriteErrors = 0;
    objc_storeStrong((id *)&v24->_changeDebounceTimer, a10);
    [(HMFTimer *)v24->_changeDebounceTimer setDelegate:v24];
    char v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    topWriteErrors = v24->_topWriteErrors;
    v24->_topWriteErrors = v27;

    v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    topSessionErrors = v24->_topSessionErrors;
    v24->_topSessionErrors = v29;

    v24->_started = 0;
  }

  return v24;
}

- (HMDNetworkObserver)initWithLogEventDispatcher:(id)a3 countersManager:(id)a4 dailyScheduler:(id)a5 currentHomeDataSource:(id)a6 dateProvider:(id)a7
{
  uint64_t v12 = (void *)MEMORY[0x263F42680];
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = [v12 sharedManager];
  id v19 = [MEMORY[0x263F08A00] defaultCenter];
  id v20 = (void *)[objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:0 options:1.0];
  id v21 = [(HMDNetworkObserver *)self initWithLogEventDispatcher:v17 countersManager:v16 dailyScheduler:v15 currentHomeDataSource:v14 dateProvider:v13 wifiManager:v18 notificationCenter:v19 changeDebounceTimer:v20 tickBlock:&__block_literal_global_42_77825];

  return v21;
}

__uint64_t __115__HMDNetworkObserver_initWithLogEventDispatcher_countersManager_dailyScheduler_currentHomeDataSource_dateProvider___block_invoke()
{
  return clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 0x3B9ACA00;
}

+ (id)supportedEventClasses
{
  if (supportedEventClasses_onceToken_77830 != -1) {
    dispatch_once(&supportedEventClasses_onceToken_77830, &__block_literal_global_77831);
  }
  v2 = (void *)supportedEventClasses_supportedEventClasses_77832;
  return v2;
}

void __43__HMDNetworkObserver_supportedEventClasses__block_invoke()
{
  v2[2] = *MEMORY[0x263EF8340];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:2];
  v1 = (void *)supportedEventClasses_supportedEventClasses_77832;
  supportedEventClasses_supportedEventClasses_77832 = v0;
}

@end