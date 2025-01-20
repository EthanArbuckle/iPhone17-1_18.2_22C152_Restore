@interface EAManager
+ (id)newPlistForAccessory:(id)a3;
+ (id)sharedManager;
+ (id)stringForClientID:(unsigned int)a3;
+ (void)_updatePlistWithAccessoryProtocolsInternal:(id)a3;
- (BOOL)_isProtocolContainedInWhitelist:(id)a3;
- (BOOL)closeSessionForConnectionID:(unsigned int)a3 sessionID:(unsigned __int16)a4 notifyApp:(BOOL)a5;
- (BOOL)fakedLocationDeviceFilteringSupport;
- (BOOL)isFakedLocationDeviceEnabled;
- (BOOL)openSessionForClientID:(unsigned int)a3 connetionID:(unsigned int)a4 protocolID:(unsigned __int8)a5 sessionID:(unsigned __int16 *)a6;
- (BOOL)sessionsOpenForDisplayIdentifer:(const char *)a3;
- (EAManager)init;
- (id).cxx_construct;
- (id)accessoryForConnectionID:(id)a3;
- (id)connectedAccessories;
- (id)connectedAccessoriesForEAClient:(unsigned int)a3;
- (id)connectionIDObjectForConnectionID:(unsigned int)a3;
- (id)sessionForAccessoryWithConnectionID:(unsigned int)a3 andSessionID:(unsigned __int16)a4;
- (id)valueForProperty:(id)a3 forAccessory:(unsigned int)a4;
- (unsigned)addClient:(unsigned int)a3 withAuditToken:(id *)a4 currentClientID:(unsigned int)a5 xpcConnection:(id)a6 eaProtocols:(id)a7 notifyOfAlreadyConnectedAccessories:(BOOL)a8 andBundleId:(id)a9;
- (unsigned)clientIDForDisplayIdentifier:(const char *)a3;
- (unsigned)generateClientID;
- (void)_dpServiceWithFirmwareVersionFound:(id)a3;
- (void)_shouldPostNoAppAlert:(id)a3;
- (void)_takeClientAssertionsForAccessoryConnection;
- (void)_takeClientAssertionsForAccessoryDisconnection;
- (void)_unregisteredClientAssertionTimerFired:(id)a3;
- (void)applicationStateChanged:(id)a3;
- (void)attachAccessory:(const IPodAccessoryDetails *)a3 forTransport:(void *)a4;
- (void)dealloc;
- (void)detachAccessory:(unsigned int)a3;
- (void)fakedLocationDeviceEphemerisMaxIntervalAvailable;
- (void)fakedLocationDeviceEphemerisRefreshIntervalAvailable;
- (void)fakedLocationDeviceEphemerisURLAvailable;
- (void)fakedLocationDeviceFilteringSupport:(BOOL)a3;
- (void)fakedLocationDeviceNMEAAvailable;
- (void)fakedLocationDevicePointDataAvailable;
- (void)fakedLocationDeviceSetFilter:(id)a3;
- (void)fakedLocationRequestGPSTime;
- (void)logAccessoryAttach:(id)a3 reason:(id)a4;
- (void)logAccessoryDetach:(id)a3 reason:(id)a4;
- (void)notifyEAClient:(id)a3 ofAccessoryEvent:(const char *)a4 accessory:(id)a5;
- (void)notifyEAClient:(id)a3 ofNotificationName:(const char *)a4 withPayload:(id)a5;
- (void)notifyEAClientsOfAccessoryConnection:(id)a3;
- (void)notifyEAClientsOfAccessoryDisconnection:(id)a3;
- (void)notifyEAClientsOfAccessoryEvent:(const char *)a3 accessory:(id)a4;
- (void)notifyEAClientsOfAccessoryPortPropertyChanged:(id)a3;
- (void)notifyEAClientsOfAccessoryReconnection:(id)a3;
- (void)notifyEAClientsOfAccessoryUpdated:(id)a3;
- (void)notifyEALocationClientsOfIAPLocationAccessoryNMEASentenceFilteringSupportChangedNotification:(id)a3;
- (void)notifyEALocationClientsOfIAPLocationDidReceiveEphemerisMaxIntervalNotification:(id)a3;
- (void)notifyEALocationClientsOfIAPLocationDidReceiveEphemerisRecommendedRefreshNotification:(id)a3;
- (void)notifyEALocationClientsOfIAPLocationDidReceiveEphemerisURLNotification:(id)a3;
- (void)notifyEALocationClientsOfIAPLocationDidReceiveLocationPointDataNotification:(id)a3;
- (void)notifyEALocationClientsOfIAPLocationDidReceiveNMEASentenceNotification:(id)a3;
- (void)notifyEALocationClientsOfIAPLocationDidRequestGPSTimeNotification:(id)a3;
- (void)openCompleteForSessionWithConnectionID:(unsigned int)a3 sessionID:(unsigned __int16)a4;
- (void)removeAllClients;
- (void)removeClientForXPCConnection:(id)a3;
- (void)reset;
- (void)sendToEALocationClientsNotification:(const char *)a3 withPayload:(id)a4;
- (void)setFakedLocationDeviceEnabled:(BOOL)a3 forClientID:(unsigned int)a4;
- (void)setFakedLocationDeviceFilteringSupport:(BOOL)a3;
- (void)takeProcessAssertionForBundleID:(id)a3;
- (void)updateAccessoryInfo:(const IPodAccessoryDetails *)a3;
- (void)updateAccessoryProtocols:(const IPodAccessoryDetails *)a3;
- (void)updateLocationSupport:(unsigned int)a3 isReady:(BOOL)a4;
- (void)updatePlistWithProtocolsForAccessory:(id)a3;
- (void)updateSpeakerEqIndex:(unsigned int)a3 eqIndex:(unsigned int)a4;
- (void)updateSpeakerMenu:(unsigned int)a3 withEqNames:(id)a4 andSelection:(unsigned int)a5;
- (void)updateValueFromApp:(id)a3;
- (void)updateValueFromIap:(id)a3 forPort:(id)a4 andPortPorperty:(id)a5 forAccessory:(unsigned int)a6;
- (void)updateValueFromIap:(id)a3 forPort:(id)a4 andPortPorperty:(id)a5 forAccessory:(unsigned int)a6 updateApp:(BOOL)a7;
@end

@implementation EAManager

- (EAManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)EAManager;
  v2 = [(EAManager *)&v4 init];
  if (!v2) {
    return v2;
  }
  result = (EAManager *)objc_alloc_init((Class)NSMutableDictionary);
  if ((((_BYTE)v2 + 8) & 7) == 0)
  {
    v2->_connectedAccessories = (NSMutableDictionary *)result;
    result = (EAManager *)objc_alloc_init((Class)NSLock);
    if ((((_BYTE)v2 + 40) & 7) == 0)
    {
      v2->_connectedAccessoriesLock = (NSLock *)result;
      result = (EAManager *)objc_alloc_init((Class)NSLock);
      if ((((_BYTE)v2 + 64) & 7) == 0)
      {
        v2->_clientLock = (NSLock *)result;
        signal(13, (void (__cdecl *)(int))1);
        result = objc_alloc_init(IAPApplicationStateMonitor);
        if ((((int)v2 + 72) & 7) == 0)
        {
          v2->_appStateMonitor = (IAPApplicationStateMonitor *)result;
          [(EAManager *)result setDelegate:v2];
          [(IAPApplicationStateMonitor *)v2->_appStateMonitor startObserving];
          [+[NSNotificationCenter defaultCenter] addObserver:v2 selector:"_dpServiceWithFirmwareVersionFound:" name:@"dpWithFwVer" object:0];
          return v2;
        }
      }
    }
  }
  __break(0x5516u);
  return result;
}

- (void)dealloc
{
  [+[NSNotificationCenter defaultCenter] removeObserver:self name:@"dpWithFwVer" object:0];
  if ((((_BYTE)self + 8) & 7) != 0) {
    goto LABEL_13;
  }

  if ((((_BYTE)self + 40) & 7) != 0) {
    goto LABEL_13;
  }

  if ((((_BYTE)self + 64) & 7) != 0) {
    goto LABEL_13;
  }

  begin_node = (EAManager *)0xAAAAAAAAAAAAAAAALL;
  if (((unint64_t)&self->_connectionIDMap & 7) != 0) {
    goto LABEL_13;
  }
  begin_node = (EAManager *)self->_connectionIDMap.__tree_.__begin_node_;
  if (((unint64_t)&self->_connectionIDMap.__tree_.__pair1_ & 7) != 0) {
    goto LABEL_13;
  }
  while (begin_node != (EAManager *)&self->_connectionIDMap.__tree_.__pair1_)
  {
    v3 = sub_100004C28((uint64_t *)&begin_node);
    if (!v3 || (v3 & 7) != 0 || ((unint64_t)(v3 + 1) & 7) != 0) {
      goto LABEL_13;
    }

    sub_10000B05C((uint64_t *)&begin_node);
  }
  sub_10000B13C((uint64_t)&self->_connectionIDMap);
  if ((((int)self + 72) & 7) != 0)
  {
LABEL_13:
    __break(0x5516u);
  }
  else
  {
    [(IAPApplicationStateMonitor *)self->_appStateMonitor stopObserving];

    self->_appStateMonitor = 0;
    v4.receiver = self;
    v4.super_class = (Class)EAManager;
    [(EAManager *)&v4 dealloc];
  }
}

+ (id)sharedManager
{
  id result = (id)qword_10013BAC0;
  if (!qword_10013BAC0)
  {
    v3 = opendir((const char *)&kEAPipePath);
    if (v3)
    {
      objc_super v4 = v3;
      *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v23 = v5;
      long long v24 = v5;
      long long v21 = v5;
      long long v22 = v5;
      long long v19 = v5;
      long long v20 = v5;
      long long v17 = v5;
      long long v18 = v5;
      long long v15 = v5;
      long long v16 = v5;
      long long v13 = v5;
      long long v14 = v5;
      long long v11 = v5;
      long long v12 = v5;
      *(_OWORD *)__str = v5;
      long long v10 = v5;
      v6 = readdir(v3);
      if (v6)
      {
        while ((v6 & 7) == 0)
        {
          d_name = v6->d_name;
          if (strncmp(v6->d_name, ".", 0x100uLL))
          {
            if (strncmp(d_name, "..", 0x100uLL))
            {
              snprintf(__str, 0x100uLL, "%s/%s", (const char *)&kEAPipePath, d_name);
              if (unlink(__str) == -1)
              {
                v8 = __error();
                if (!v8 || (v8 & 3) != 0) {
                  break;
                }
                NSLog(@"ERROR - %s:%s - %d couldn't delete %s errno = %d", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/EAManager.mm", "+[EAManager sharedManager]", 167, __str, *v8);
              }
            }
          }
          v6 = readdir(v4);
          if (!v6) {
            goto LABEL_12;
          }
        }
        __break(0x5516u);
      }
LABEL_12:
      closedir(v4);
    }
    id result = objc_alloc_init(EAManager);
    qword_10013BAC0 = (uint64_t)result;
  }
  return result;
}

+ (id)stringForClientID:(unsigned int)a3
{
  return +[NSString stringWithFormat:@"%d", *(void *)&a3];
}

+ (id)newPlistForAccessory:(id)a3
{
  id v3 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:a3];
  [v3 removeObjectForKey:@"EAManagerAccessorySessions"];
  [v3 removeObjectForKey:@"OptionalSDKProtocolsShownKey"];
  [v3 removeObjectForKey:IAPAppAccessoryConnectionTimeInSecKey];
  [v3 removeObjectForKey:IAPEASessionOpenedTimesKey];
  return v3;
}

- (unsigned)generateClientID
{
  p_clients = &self->_clients;
  unint64_t v3 = (unint64_t)&self->_clients & 7;
  while (1)
  {
    uint64_t v4 = arc4random_uniform(0xFFFFFFFF);
    if (v3) {
      break;
    }
    int v5 = v4;
    id v6 = [(NSMutableDictionary *)*p_clients objectForKey:+[EAManager stringForClientID:v4]];
    if (v5 && !v6)
    {
      LODWORD(v4) = v5;
      return v4;
    }
  }
  __break(0x5516u);
  return v4;
}

- (void)logAccessoryAttach:(id)a3 reason:(id)a4
{
  sub_1000EE49C(3u, @"%@", a4);
  uint64_t v5 = IAPAppAccessoryManufacturerKey;
  uint64_t v6 = IAPAppAccessoryModelNumberKey;
  +[IAPEventLogger LogMsg:WithDictionary:andKeys:](IAPEventLogger, "LogMsg:WithDictionary:andKeys:", 2, a3, +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", IAPAppAccessoryNameKey, IAPAppAccessoryManufacturerKey, IAPAppAccessoryModelNumberKey, IAPAppAccessoryFirmwareRevisionKey, IAPAppAccessoryHardwareRevisionKey, 0));
  +[IAPDataLogger PowerlogAccAttach:a3];
  if (sub_1000F1C94())
  {
    id v7 = [a3 valueForKey:v6];
    id v8 = [a3 valueForKey:v5];
    +[IAPDataLogger AggAccAttach:v7 WithManufacturer:v8];
  }
}

- (void)logAccessoryDetach:(id)a3 reason:(id)a4
{
  sub_1000EE49C(3u, @"%@", a4);
  id v5 = [a3 objectForKey:IAPAppAccessoryConnectionTimeInSecKey];
  +[IAPDataLogger PowerlogAccDetach:AndConnectionTime:](IAPDataLogger, "PowerlogAccDetach:AndConnectionTime:", a3, [v5 unsignedLongValue]);
  BOOL v6 = sub_1000F1C94();
  if (v5) {
    BOOL v7 = !v6;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    id v8 = [a3 valueForKey:IAPAppAccessoryModelNumberKey];
    id v9 = [a3 valueForKey:IAPAppAccessoryManufacturerKey];
    id v10 = [v5 unsignedLongValue];
    +[IAPDataLogger AggAccDetach:v8 WithManufacturer:v9 AndConnectionTime:v10];
  }
}

- (id)connectionIDObjectForConnectionID:(unsigned int)a3
{
  unsigned int v6 = a3;
  id v5 = (id)0xAAAAAAAAAAAAAAAALL;
  id result = &self->_connectionIDMap;
  if ((result & 7) != 0
    || (id result = (id)sub_10000B278((uint64_t)result, &v6),
        id v5 = result,
        ((unint64_t)&self->_connectionIDMap.__tree_.__pair1_ & 7) != 0))
  {
LABEL_10:
    __break(0x5516u);
    return result;
  }
  if (&self->_connectionIDMap.__tree_.__pair1_ != result)
  {
    id result = sub_100004C28((uint64_t *)&v5);
    if (result && (result & 7) == 0 && (((unint64_t)result + 8) & 7) == 0) {
      return (id)*((void *)result + 1);
    }
    goto LABEL_10;
  }
  return 0;
}

- (unsigned)addClient:(unsigned int)a3 withAuditToken:(id *)a4 currentClientID:(unsigned int)a5 xpcConnection:(id)a6 eaProtocols:(id)a7 notifyOfAlreadyConnectedAccessories:(BOOL)a8 andBundleId:(id)a9
{
  BOOL v46 = a8;
  p_clientLock = &self->_clientLock;
  if (((unint64_t)&self->_clientLock & 7) != 0) {
    goto LABEL_46;
  }
  [(NSLock *)self->_clientLock lock];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  p_clients = (id *)&self->_clients;
  if (((unint64_t)&self->_clients & 7) != 0) {
    goto LABEL_46;
  }
  v47 = self;
  unsigned int v49 = a5;
  id v15 = *p_clients;
  id v16 = [*p_clients countByEnumeratingWithState:&v60 objects:v66 count:16];
  if (!v16) {
    goto LABEL_18;
  }
  id v17 = v16;
  uint64_t v18 = *(void *)v61;
  while (2)
  {
    for (i = 0; i != v17; i = (char *)i + 1)
    {
      if (*(void *)v61 != v18) {
        objc_enumerationMutation(v15);
      }
      id v20 = [*p_clients objectForKey:*(void *)(*((void *)&v60 + 1) + 8 * i)];
      id v21 = v20;
      if (a9)
      {
        if (objc_msgSend(objc_msgSend(v20, "bundleId"), "isEqualToString:", a9))
        {
          sub_1000EE49C(3u, @"Found client by bundleID %@", a9);
LABEL_16:
          if (!v21) {
            goto LABEL_18;
          }
          NSLog(@"ERROR - %s:%s - %d already have client for mach port bundleID %@ and xpc connection %@", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/EAManager.mm", "-[EAManager addClient:withAuditToken:currentClientID:xpcConnection:eaProtocols:notifyOfAlreadyConnectedAccessories:andBundleId:]", 357, a9, a6);
          LODWORD(v22) = 0;
          goto LABEL_45;
        }
      }
      else if ([v20 xpcConnection] == a6)
      {
        sub_1000EE49C(3u, @"Found client by xpcConnection %@, bundleID is %@", a6, 0);
        goto LABEL_16;
      }
    }
    id v17 = [v15 countByEnumeratingWithState:&v60 objects:v66 count:16];
    if (v17) {
      continue;
    }
    break;
  }
LABEL_18:
  long long v23 = [IAPEAClient alloc];
  long long v24 = *(_OWORD *)&a4->var0[4];
  v59[0] = *(_OWORD *)a4->var0;
  v59[1] = v24;
  char v25 = a3;
  v26 = [(IAPEAClient *)v23 initWithCapabilities:a3 auditToken:v59 xpcConnection:a6 eaProtocols:a7 andBundleId:a9];
  id v27 = *p_clients;
  if (!*p_clients)
  {
    id v27 = objc_alloc_init((Class)NSMutableDictionary);
    id *p_clients = v27;
  }
  id v22 = (id)v49;
  id v28 = objc_msgSend(v27, "objectForKey:", +[EAManager stringForClientID:](EAManager, "stringForClientID:", v49));
  if (!v49 || v28) {
    id v22 = objc_msgSend(+[EAManager sharedManager](EAManager, "sharedManager"), "generateClientID");
  }
  [(IAPEAClient *)v26 setClientID:v22];
  objc_msgSend(*p_clients, "setObject:forKey:", v26, +[EAManager stringForClientID:](EAManager, "stringForClientID:", -[IAPEAClient clientID](v26, "clientID")));
  if (v46)
  {
    id v29 = objc_alloc_init((Class)NSMutableArray);
    if (((unint64_t)&v47->_connectedAccessoriesLock & 7) == 0)
    {
      v30 = v29;
      [(NSLock *)v47->_connectedAccessoriesLock lock];
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      p_connectedAccessories = (id *)&v47->_connectedAccessories;
      if (((unint64_t)&v47->_connectedAccessories & 7) == 0)
      {
        int v50 = (int)v22;
        v45 = p_clientLock;
        id v32 = *p_connectedAccessories;
        id v33 = [*p_connectedAccessories countByEnumeratingWithState:&v55 objects:v65 count:16];
        if (v33)
        {
          id v34 = v33;
          uint64_t v35 = *(void *)v56;
          do
          {
            for (j = 0; j != v34; j = (char *)j + 1)
            {
              if (*(void *)v56 != v35) {
                objc_enumerationMutation(v32);
              }
              id v37 = +[EAManager newPlistForAccessory:](EAManager, "newPlistForAccessory:", +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", [*p_connectedAccessories objectForKey:*(void *)(*((void *)&v55 + 1) + 8 * (void)j)]));
              [v30 addObject:v37];
            }
            id v34 = [v32 countByEnumeratingWithState:&v55 objects:v65 count:16];
          }
          while (v34);
        }
        [(NSLock *)v47->_connectedAccessoriesLock unlock];
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id v38 = [v30 countByEnumeratingWithState:&v51 objects:v64 count:16];
        char v25 = a3;
        if (v38)
        {
          id v39 = v38;
          uint64_t v40 = *(void *)v52;
          do
          {
            for (k = 0; k != v39; k = (char *)k + 1)
            {
              if (*(void *)v52 != v40) {
                objc_enumerationMutation(v30);
              }
              [(EAManager *)v47 notifyEAClient:v26 ofAccessoryEvent:"EAProtocolAccessoryConnected" accessory:*(void *)(*((void *)&v51 + 1) + 8 * (void)k)];
            }
            id v39 = [v30 countByEnumeratingWithState:&v51 objects:v64 count:16];
          }
          while (v39);
        }

        p_clientLock = v45;
        LODWORD(v22) = v50;
        goto LABEL_41;
      }
    }
LABEL_46:
    __break(0x5516u);
  }
LABEL_41:

  if ((v25 & 4) != 0)
  {
    uint64_t v42 = sub_1000E5F70();
    if (!v42 || (v42 & 7) != 0) {
      goto LABEL_46;
    }
    (*(void (**)(uint64_t, uint64_t))(*(void *)v42 + 160))(v42, 1);
  }
LABEL_45:
  [(NSLock *)*p_clientLock unlock];
  return v22;
}

- (void)removeClientForXPCConnection:(id)a3
{
  p_clientLock = &self->_clientLock;
  if (((unint64_t)&self->_clientLock & 7) != 0) {
    goto LABEL_38;
  }
  [(NSLock *)self->_clientLock lock];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  p_clients = (id *)&self->_clients;
  if (((unint64_t)&self->_clients & 7) != 0) {
    goto LABEL_38;
  }
  id v7 = *p_clients;
  id v8 = [*p_clients countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (!v8) {
    goto LABEL_36;
  }
  id v9 = v8;
  uint64_t v10 = *(void *)v37;
LABEL_5:
  uint64_t v11 = 0;
  while (1)
  {
    if (*(void *)v37 != v10) {
      objc_enumerationMutation(v7);
    }
    id v12 = [*p_clients objectForKey:*(void *)(*((void *)&v36 + 1) + 8 * v11)];
    if ([v12 xpcConnection] == a3) {
      break;
    }
    if (v9 == (id)++v11)
    {
      id v9 = [v7 countByEnumeratingWithState:&v36 objects:v42 count:16];
      if (!v9)
      {
LABEL_36:
        NSLog(@"Didn't find client to remove");
        NSLog(@"ERROR - %s:%s - %d couldn't find client for xpc client %hhx", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/EAManager.mm", "-[EAManager removeClientForXPCConnection:]", 416, a3);
        goto LABEL_37;
      }
      goto LABEL_5;
    }
  }
  NSLog(@"Found client to remove, client bundleID is %@", [v12 bundleId]);
  if (!v12) {
    goto LABEL_36;
  }
  unsigned int v27 = [v12 clientID];
  if ([v12 locationSupportedByClient])
  {
    [v12 setLocationSupportedByClient:0];
    self->_fakedLocationDeviceEnabled = 0;
  }
  if (([v12 capabilities] & 4) != 0)
  {
    uint64_t v13 = sub_1000E5F70();
    if (v13 && (v13 & 7) == 0)
    {
      (*(void (**)(uint64_t, void))(*(void *)v13 + 160))(v13, 0);
      goto LABEL_19;
    }
LABEL_38:
    __break(0x5516u);
  }
LABEL_19:
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  p_connectedAccessories = (id *)&self->_connectedAccessories;
  if (((unint64_t)&self->_connectedAccessories & 7) != 0) {
    goto LABEL_38;
  }
  long long v24 = &self->_clients;
  id obj = *p_connectedAccessories;
  id v15 = [*p_connectedAccessories countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v26 = *(void *)v33;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v33 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = p_connectedAccessories;
        id v19 = objc_msgSend(objc_msgSend(objc_msgSend(*p_connectedAccessories, "objectForKey:", *(void *)(*((void *)&v32 + 1) + 8 * i)), "objectForKey:", @"EAManagerAccessorySessions"), "sessionsForClientID:", v27);
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v20 = [v19 countByEnumeratingWithState:&v28 objects:v40 count:16];
        if (v20)
        {
          id v21 = v20;
          uint64_t v22 = *(void *)v29;
          do
          {
            for (j = 0; j != v21; j = (char *)j + 1)
            {
              if (*(void *)v29 != v22) {
                objc_enumerationMutation(v19);
              }
              -[EAManager closeSessionForConnectionID:sessionID:notifyApp:](self, "closeSessionForConnectionID:sessionID:notifyApp:", [*(id *)(*((void *)&v28 + 1) + 8 * (void)j) connectionID], objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * (void)j), "sessionID"), 0);
            }
            id v21 = [v19 countByEnumeratingWithState:&v28 objects:v40 count:16];
          }
          while (v21);
        }
        p_connectedAccessories = v18;
      }
      id v16 = [obj countByEnumeratingWithState:&v32 objects:v41 count:16];
    }
    while (v16);
  }
  [(NSMutableDictionary *)*v24 removeObjectForKey:+[EAManager stringForClientID:v27]];
  if (![(NSMutableDictionary *)*v24 count])
  {

    *long long v24 = 0;
  }
LABEL_37:
  [(NSLock *)*p_clientLock unlock];
}

- (void)removeAllClients
{
  p_clientLock = &self->_clientLock;
  if (((unint64_t)&self->_clientLock & 7) != 0
    || ([(NSLock *)self->_clientLock lock],
        long long v38 = 0u,
        long long v39 = 0u,
        long long v36 = 0u,
        long long v37 = 0u,
        p_clients = (id *)&self->_clients,
        ((unint64_t)&self->_clients & 7) != 0))
  {
LABEL_35:
    __break(0x5516u);
  }
  id obj = *p_clients;
  id v21 = [*p_clients countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v21)
  {
    p_connectedAccessories = (id *)&self->_connectedAccessories;
    uint64_t v19 = *(void *)v37;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v37 != v19) {
          objc_enumerationMutation(obj);
        }
        id v4 = [*p_clients objectForKey:*(void *)(*((void *)&v36 + 1) + 8 * v3)];
        unsigned int v25 = [v4 clientID];
        id v5 = (_xpc_connection_s *)[v4 xpcConnection];
        if (!v5) {
          goto LABEL_34;
        }
        xpc_connection_set_event_handler(v5, &stru_100121B00);
        if ([v4 locationSupportedByClient])
        {
          [v4 setLocationSupportedByClient:0];
          self->_fakedLocationDeviceEnabled = 0;
        }
        if (([v4 capabilities] & 4) != 0)
        {
          uint64_t v6 = sub_1000E5F70();
          if (!v6 || (v6 & 7) != 0) {
            goto LABEL_35;
          }
          (*(void (**)(uint64_t, void))(*(void *)v6 + 160))(v6, 0);
        }
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        if (((unint64_t)&self->_connectedAccessories & 7) != 0) {
          goto LABEL_35;
        }
        uint64_t v22 = v3;
        id v23 = *p_connectedAccessories;
        id v7 = [*p_connectedAccessories countByEnumeratingWithState:&v32 objects:v41 count:16];
        if (v7)
        {
          id v8 = v7;
          uint64_t v9 = *(void *)v33;
          do
          {
            for (i = 0; i != v8; i = (char *)i + 1)
            {
              if (*(void *)v33 != v9) {
                objc_enumerationMutation(v23);
              }
              id v11 = objc_msgSend(objc_msgSend(objc_msgSend(*p_connectedAccessories, "objectForKey:", *(void *)(*((void *)&v32 + 1) + 8 * i)), "objectForKey:", @"EAManagerAccessorySessions"), "sessionsForClientID:", v25);
              long long v28 = 0u;
              long long v29 = 0u;
              long long v30 = 0u;
              long long v31 = 0u;
              id v12 = [v11 countByEnumeratingWithState:&v28 objects:v40 count:16];
              if (v12)
              {
                id v13 = v12;
                uint64_t v14 = *(void *)v29;
                do
                {
                  for (j = 0; j != v13; j = (char *)j + 1)
                  {
                    if (*(void *)v29 != v14) {
                      objc_enumerationMutation(v11);
                    }
                    -[EAManager closeSessionForConnectionID:sessionID:notifyApp:](self, "closeSessionForConnectionID:sessionID:notifyApp:", [*(id *)(*((void *)&v28 + 1) + 8 * (void)j) connectionID], objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * (void)j), "sessionID"), 0);
                  }
                  id v13 = [v11 countByEnumeratingWithState:&v28 objects:v40 count:16];
                }
                while (v13);
              }
            }
            id v8 = [v23 countByEnumeratingWithState:&v32 objects:v41 count:16];
          }
          while (v8);
        }
        global_queue = dispatch_get_global_queue(0, 0);
        if (!global_queue)
        {
LABEL_34:
          __break(0x5510u);
          goto LABEL_35;
        }
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100005DAC;
        block[3] = &unk_100121B28;
        block[4] = self;
        unsigned int v27 = v25;
        dispatch_async(global_queue, block);
        ++v3;
      }
      while ((id)(v22 + 1) != v21);
      id v21 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v21);
  }
  [(NSLock *)*p_clientLock unlock];
}

- (unsigned)clientIDForDisplayIdentifier:(const char *)a3
{
  id v4 = [objc_alloc((Class)NSString) initWithCString:a3 encoding:4];
  p_clientLock = &self->_clientLock;
  if (((unint64_t)&self->_clientLock & 7) != 0
    || (uint64_t v6 = v4,
        [(NSLock *)self->_clientLock lock],
        long long v18 = 0u,
        long long v19 = 0u,
        long long v16 = 0u,
        long long v17 = 0u,
        p_clients = (id *)&self->_clients,
        ((unint64_t)&self->_clients & 7) != 0))
  {
    __break(0x5516u);
  }
  id v8 = *p_clients;
  id v9 = [*p_clients countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = objc_msgSend(*p_clients, "objectForKey:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        if (!objc_msgSend(objc_msgSend(v13, "bundleId"), "compare:options:", v6, 1))
        {
          unsigned int v14 = [v13 clientID];
          goto LABEL_13;
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  unsigned int v14 = 0;
LABEL_13:
  [(NSLock *)*p_clientLock unlock];

  return v14;
}

- (BOOL)sessionsOpenForDisplayIdentifer:(const char *)a3
{
  id v16 = [objc_alloc((Class)NSString) initWithCString:a3 encoding:4];
  if (((unint64_t)&self->_clientLock & 7) != 0
    || ([(NSLock *)self->_clientLock lock],
        long long v25 = 0u,
        long long v26 = 0u,
        long long v23 = 0u,
        long long v24 = 0u,
        p_clients = (id *)&self->_clients,
        ((unint64_t)&self->_clients & 7) != 0))
  {
LABEL_22:
    __break(0x5516u);
  }
  id obj = *p_clients;
  id v18 = [*p_clients countByEnumeratingWithState:&v23 objects:v28 count:16];
  int v4 = 0;
  if (v18)
  {
    uint64_t v15 = *(void *)v24;
    p_connectedAccessories = (id *)&self->_connectedAccessories;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(obj);
        }
        id v7 = [*p_clients objectForKey:*(void *)(*((void *)&v23 + 1) + 8 * i)];
        if (!objc_msgSend(v16, "caseInsensitiveCompare:", objc_msgSend(v7, "bundleId")))
        {
          long long v21 = 0u;
          long long v22 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          if (((unint64_t)&self->_connectedAccessories & 7) != 0) {
            goto LABEL_22;
          }
          id v8 = *p_connectedAccessories;
          id v9 = [*p_connectedAccessories countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v9)
          {
            id v10 = v9;
            uint64_t v11 = *(void *)v20;
            do
            {
              for (j = 0; j != v10; j = (char *)j + 1)
              {
                if (*(void *)v20 != v11) {
                  objc_enumerationMutation(v8);
                }
                if (objc_msgSend(objc_msgSend(objc_msgSend(*p_connectedAccessories, "objectForKey:", *(void *)(*((void *)&v19 + 1) + 8 * (void)j)), "objectForKey:", @"EAManagerAccessorySessions"), "sessionsForClientID:", objc_msgSend(v7, "clientID")))
                {
                  int v4 = 1;
                }
              }
              id v10 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
            }
            while (v10);
          }
        }
      }
      id v18 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v18);
  }

  [(NSLock *)self->_clientLock unlock];
  return v4 != 0;
}

- (void)attachAccessory:(const IPodAccessoryDetails *)a3 forTransport:(void *)a4
{
  if (!a3 || !a4) {
    return;
  }
  if ((a3 & 7) != 0) {
    goto LABEL_192;
  }
  if (((*((uint64_t (**)(const IPodAccessoryDetails *, SEL))a3->var0 + 6))(a3, a2) & 0x200) != 0)
  {
    uint64_t v5 = (*((uint64_t (**)(const IPodAccessoryDetails *))a3->var0 + 19))(a3);
    if (*(void *)(v5 + 16))
    {
      uint64_t v6 = (uint64_t *)v5;
      id v7 = objc_alloc_init((Class)NSMutableArray);
      uint64_t v9 = *v6;
      id v8 = v6 + 1;
      for (uint64_t i = v9; (void *)i != v8; sub_10000B05C(&i))
      {
        id v10 = sub_100004C28(&i);
        if (!v10) {
          goto LABEL_192;
        }
        if ((v10 & 7) != 0) {
          goto LABEL_192;
        }
        if ((((_BYTE)v10 + 8) & 7) != 0) {
          goto LABEL_192;
        }
        uint64_t v11 = v10 + 4;
        if (((unint64_t)(v10 + 4) & 7) != 0) {
          goto LABEL_192;
        }
        if (*v11)
        {
          id v12 = [objc_alloc((Class)NSString) initWithUTF8String:*v11];
          if (v12)
          {
            [v7 addObject:v12];
          }
          else
          {
            NSLog(@"ERROR - %s:%s - %d got an invalid UTF8 protocolString", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/EAManager.mm", "-[EAManager attachAccessory:forTransport:]", 547);
          }
        }
        else
        {
          NSLog(@"ERROR - %s:%s - %d got a NULL protocolString", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/EAManager.mm", "-[EAManager attachAccessory:forTransport:]", 552);
        }
      }
      id v13 = v7;
    }
    else
    {
      id v13 = 0;
    }
    long long v139 = 0u;
    long long v140 = 0u;
    long long v137 = 0u;
    long long v138 = 0u;
    id obj = v13;
    id v102 = [v13 countByEnumeratingWithState:&v137 objects:v144 count:16];
    if (!v102) {
      goto LABEL_55;
    }
    uint64_t v100 = *(void *)v138;
    p_clientLock = &self->_clientLock;
    uint64_t v107 = BKSApplicationStateKey;
LABEL_22:
    uint64_t v103 = 0;
    while (1)
    {
      if (*(void *)v138 != v100) {
        objc_enumerationMutation(obj);
      }
      id v106 = (id)SBSCopyDisplayIdentifiersForExternalAccessoryProtocol();
      long long v135 = 0u;
      long long v136 = 0u;
      long long v133 = 0u;
      long long v134 = 0u;
      id v115 = [v106 countByEnumeratingWithState:&v133 objects:v143 count:16];
      if (v115) {
        break;
      }
LABEL_53:

      if ((id)++v103 == v102)
      {
        id v102 = [obj countByEnumeratingWithState:&v137 objects:v144 count:16];
        if (!v102)
        {
LABEL_55:
          int v4 = obj;
          goto LABEL_56;
        }
        goto LABEL_22;
      }
    }
    uint64_t v113 = *(void *)v134;
LABEL_27:
    uint64_t v117 = 0;
    while (1)
    {
      if (*(void *)v134 != v113) {
        objc_enumerationMutation(v106);
      }
      if (((unint64_t)&self->_clientLock & 7) != 0) {
        goto LABEL_192;
      }
      unsigned int v14 = *(void **)(*((void *)&v133 + 1) + 8 * v117);
      [(NSLock *)self->_clientLock lock];
      long long v131 = 0u;
      long long v132 = 0u;
      long long v129 = 0u;
      long long v130 = 0u;
      clients = self->_clients;
      id v16 = [(NSMutableDictionary *)clients countByEnumeratingWithState:&v129 objects:v142 count:16];
      if (!v16) {
        break;
      }
      char v17 = 0;
      uint64_t v18 = *(void *)v130;
      do
      {
        for (j = 0; j != v16; j = (char *)j + 1)
        {
          if (*(void *)v130 != v18) {
            objc_enumerationMutation(clients);
          }
          if (!objc_msgSend(v14, "caseInsensitiveCompare:", objc_msgSend(-[NSMutableDictionary objectForKey:](self->_clients, "objectForKey:", *(void *)(*((void *)&v129 + 1) + 8 * (void)j)), "bundleId")))
          {
            NSLog(@"%s:%s-%d app %@ found in client list", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/EAManager.mm", "-[EAManager attachAccessory:forTransport:]", 570, v14);
            char v17 = 1;
          }
        }
        id v16 = [(NSMutableDictionary *)clients countByEnumeratingWithState:&v129 objects:v142 count:16];
      }
      while (v16);
      [(NSLock *)*p_clientLock unlock];
      if ((v17 & 1) == 0) {
        goto LABEL_43;
      }
LABEL_51:
      if ((id)++v117 == v115)
      {
        id v115 = [v106 countByEnumeratingWithState:&v133 objects:v143 count:16];
        if (!v115) {
          goto LABEL_53;
        }
        goto LABEL_27;
      }
    }
    [(NSLock *)*p_clientLock unlock];
LABEL_43:
    if (((unint64_t)&self->_appStateMonitor & 7) != 0) {
      goto LABEL_192;
    }
    if (objc_msgSend(objc_msgSend(-[IAPApplicationStateMonitor applicationInfoForBundleIDSync:](self->_appStateMonitor, "applicationInfoForBundleIDSync:", v14), "objectForKey:", v107), "unsignedIntValue") <= 3)
    {
      id v20 = +[LSApplicationProxy applicationProxyForIdentifier:v14];
      if (v20)
      {
        id v21 = [v20 UIBackgroundModes];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unsigned int v22 = [v21 containsObject:@"external-accessory"];
          sub_1000EE49C(3u, @"client '%@' supports background EA = %d, if true needs a process assertion\n", v14, v22);
          if (v22)
          {
            uint64_t v23 = sub_10005176C();
            if (!v23 || (v23 & 7) != 0) {
              goto LABEL_192;
            }
            (*(void (**)(uint64_t, id))(*(void *)v23 + 328))(v23, [v14 cStringUsingEncoding:4]);
          }
        }
      }
    }
    goto LABEL_51;
  }
  int v4 = 0;
LABEL_56:

  id v24 = objc_alloc_init((Class)NSMutableDictionary);
  unsigned int v111 = (*((uint64_t (**)(const IPodAccessoryDetails *))a3->var0 + 2))(a3);
  v118 = +[NSNumber numberWithUnsignedInteger:(*((unsigned int (**)(const IPodAccessoryDetails *))a3->var0 + 5))(a3)];
  p_connectedAccessoriesLock = &self->_connectedAccessoriesLock;
  if (((unint64_t)&self->_connectedAccessoriesLock & 7) != 0) {
    goto LABEL_192;
  }
  [(NSLock *)self->_connectedAccessoriesLock lock];
  p_connectedAccessories = &self->_connectedAccessories;
  if (((unint64_t)&self->_connectedAccessories & 7) != 0) {
    goto LABEL_192;
  }
  id v25 = [(NSMutableDictionary *)*p_connectedAccessories objectForKey:v118];
  [(NSLock *)*p_connectedAccessoriesLock unlock];
  if (v25)
  {
    id v26 = objc_msgSend(objc_msgSend(v25, "objectForKey:", @"EAManagerAccessorySessions"), "sessions");
    long long v127 = 0u;
    long long v128 = 0u;
    long long v125 = 0u;
    long long v126 = 0u;
    id v27 = [v26 countByEnumeratingWithState:&v125 objects:v141 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v126;
      do
      {
        for (k = 0; k != v27; k = (char *)k + 1)
        {
          if (*(void *)v126 != v28) {
            objc_enumerationMutation(v26);
          }
          long long v30 = *(void **)(*((void *)&v125 + 1) + 8 * (void)k);
          sub_1000EE49C(3u, @"Closing existing sessionID %d for re-identifying connectionID %u\n", [v30 sessionID], objc_msgSend(v30, "connectionID"));
          -[EAManager closeSessionForConnectionID:sessionID:notifyApp:](self, "closeSessionForConnectionID:sessionID:notifyApp:", [v30 connectionID], objc_msgSend(v30, "sessionID"), 0);
        }
        id v27 = [v26 countByEnumeratingWithState:&v125 objects:v141 count:16];
      }
      while (v27);
    }
  }

  uint64_t i = 0;
  uint64_t v123 = 0;
  uint64_t v124 = 0;
  sub_1000DB62C();
  int v31 = (*((uint64_t (**)(const IPodAccessoryDetails *))a3->var0 + 5))(a3);
  sub_1000DD5B4(v31, 9u, &i);
  if (i != v123)
  {
    if (!i) {
      goto LABEL_192;
    }
    if ((i & 7) != 0) {
      goto LABEL_192;
    }
    uint64_t v32 = *(void *)i;
    if (!*(void *)i) {
      goto LABEL_192;
    }
    if ((v32 & 7) != 0) {
      goto LABEL_192;
    }
    long long v33 = (_DWORD *)(v32 + 16);
    if ((v33 & 7) != 0) {
      goto LABEL_192;
    }
    if (*v33 > 7u) {
      goto LABEL_194;
    }
    long long v34 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
    [v24 setObject:v34 forKey:IAPAppAccessoryClassKey];
  }
  char v35 = (*((unsigned int (**)(const IPodAccessoryDetails *))a3->var0 + 6))(a3) >> 16;
  uint64_t v36 = (*((uint64_t (**)(const IPodAccessoryDetails *))a3->var0 + 13))(a3);
  if (!v36 || (v36 & 3) != 0) {
    goto LABEL_192;
  }
  unsigned int v112 = v35 & 2 | (v111 >> 11) & 4;
  if (sub_1000F1C10(v36 + 168))
  {
    sub_1000EE49C(3u, @"%s:%s-%d should be hiding accessory from Settings", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/EAManager.mm", "-[EAManager attachAccessory:forTransport:]", 651);
    v112 |= 0x100u;
  }
  id v37 = +[NSMutableDictionary dictionary];
  id v38 = +[NSMutableDictionary dictionary];
  if ((a4 & 7) != 0) {
    goto LABEL_192;
  }
  long long v39 = v38;
  if (!(*(unsigned int (**)(void *))(*(void *)a4 + 216))(a4)
    || (*(unsigned int (**)(void *))(*(void *)a4 + 216))(a4) == 1)
  {
    id v40 = +[NSMutableDictionary dictionary];
    uint64_t v41 = sub_10004BD48();
    uint64_t v42 = v41;
    if (!v41 || (v41 & 7) != 0) {
      goto LABEL_192;
    }
    objc_msgSend(v40, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (*(uint64_t (**)(uint64_t, void *))(*(void *)v41 + 184))(v41, a4)), kCFAccessoryPortPropertyIsConnected);
    v43 = +[NSNumber numberWithInt:0];
    [v40 setObject:v43 forKey:kCFAccessoryPortPropertyIsActive];
    if ((*(uint64_t (**)(uint64_t, void *, void))(*(void *)v42 + 152))(v42, a4, 0)) {
      uint64_t v44 = 1;
    }
    else {
      uint64_t v44 = (*(uint64_t (**)(uint64_t, void *))(*(void *)v42 + 168))(v42, a4);
    }
    v45 = +[NSNumber numberWithInt:v44];
    [v40 setObject:v45 forKey:kCFAccessoryPortPropertyVolumeControlIsSupported];
    if ([(NSNumber *)v45 BOOLValue])
    {
      uint64_t v46 = sub_10004BD48();
      if (!v46 || (v46 & 7) != 0) {
        goto LABEL_192;
      }
      *(float *)&double v47 = (float)(*(unsigned int (**)(uint64_t, void *))(*(void *)v46 + 104))(v46, a4)
                     / 255.0;
      v48 = +[NSNumber numberWithFloat:v47];
      [v40 setObject:v48 forKey:kCFAccessoryPortPropertyVolumeScalar];
    }
    [v39 setObject:v40 forKey:kCFAccessoryPortLineOut];
  }
  if (!(*(unsigned int (**)(void *))(*(void *)a4 + 216))(a4)
    || (*(unsigned int (**)(void *))(*(void *)a4 + 216))(a4) == 1)
  {
    id v49 = +[NSMutableDictionary dictionary];
    uint64_t v50 = sub_1000DDBC0();
    if (!v50) {
      goto LABEL_192;
    }
    if ((v50 & 7) != 0) {
      goto LABEL_192;
    }
    objc_msgSend(v49, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (*(uint64_t (**)(uint64_t, void *))(*(void *)v50 + 136))(v50, a4)), kCFAccessoryPortPropertyIsConnected);
    LODWORD(v120.tv_sec) = 0;
    uint64_t v51 = sub_1000DDBC0();
    if (!v51 || (v51 & 7) != 0) {
      goto LABEL_192;
    }
    uint64_t v52 = (*(uint64_t (**)(uint64_t, void *, timeval *))(*(void *)v51 + 120))(v51, a4, &v120);
    id v53 = +[NSMutableArray array];
    if (LODWORD(v120.tv_sec))
    {
      unint64_t v54 = 0;
      unint64_t v55 = 0;
      BOOL v57 = (v52 & 3) == 0 && v52 != 0;
      while (v54 <= ~v52)
      {
        if (!v57) {
          goto LABEL_192;
        }
        objc_msgSend(v53, "addObject:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(v52 + v54)));
        ++v55;
        v54 += 4;
        if (v55 >= LODWORD(v120.tv_sec)) {
          goto LABEL_109;
        }
      }
LABEL_193:
      __break(0x5513u);
    }
    if (v52) {
LABEL_109:
    }
      operator delete[]();
    [v49 setObject:v53 forKey:kCFAccessoryPortPropertySupportedSampleRatesInHz];
    long long v58 = +[NSNumber numberWithInt:0];
    [v49 setObject:v58 forKey:kCFAccessoryPortPropertyCurrentSampleRate];
    [v39 setObject:v49 forKey:kCFAccessoryPortUSBOut];
  }
  if ((*(unsigned int (**)(void *))(*(void *)a4 + 216))(a4)
    && (*(unsigned int (**)(void *))(*(void *)a4 + 216))(a4) != 1)
  {
    goto LABEL_121;
  }
  id v59 = +[NSMutableDictionary dictionary];
  uint64_t v60 = sub_10001DF64();
  if (!v60 || (v60 & 7) != 0) {
    goto LABEL_192;
  }
  unsigned int v61 = *(unsigned __int8 *)(v60 + 8);
  if (v61 >= 2)
  {
LABEL_194:
    __break(0x550Au);
    return;
  }
  long long v62 = +[NSNumber numberWithInt:v61 != 0];
  [v59 setObject:v62 forKey:kCFAccessoryPortPropertyIsConnected];
  uint64_t v63 = sub_1000E4458();
  if (!v63) {
    goto LABEL_192;
  }
  if ((v63 & 7) != 0) {
    goto LABEL_192;
  }
  objc_msgSend(v59, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (*(uint64_t (**)(uint64_t, void *))(*(void *)v63 + 168))(v63, a4)), kCFAccessoryPortPropertyFullDuplexIsSupported);
  uint64_t v64 = sub_1000E4458();
  if (!v64 || (v64 & 7) != 0) {
    goto LABEL_192;
  }
  objc_msgSend(v59, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (*(uint64_t (**)(uint64_t, void *))(*(void *)v64 + 176))(v64, a4)), kCFAccessoryPortPropertyIsVoiceSignalProcessingSupported);
  v65 = +[NSNumber numberWithInt:0];
  [v59 setObject:v65 forKey:kCFAccessoryPortPropertyIsActive];
  [v39 setObject:v59 forKey:kCFAccessoryPortLineIn];
LABEL_121:
  if ([v39 count]) {
    [v37 setObject:v39, +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%X", (*((uint64_t (**)(const IPodAccessoryDetails *))a3->var0 + 5))(a3)) forKey];
  }
  if ([v37 count]) {
    [v24 setObject:v37 forKey:IAPAppAccessoryPortsKey];
  }
  v66 = (unsigned __int8 *)(*((uint64_t (**)(const IPodAccessoryDetails *))a3->var0 + 13))(a3);
  if (v66)
  {
    (*(void (**)(void *, unsigned __int8 *))(*(void *)a4 + 336))(a4, v66);
    if ((v66 & 3) != 0) {
      goto LABEL_192;
    }
    CFStringRef v67 = +[NSString stringWithUTF8String:v66];
    v68 = v67 ? (__CFString *)v67 : &stru_10012A858;
    uint64_t v110 = IAPAppAccessoryNameKey;
    objc_msgSend(v24, "setObject:forKey:", v68);
    CFStringRef v69 = +[NSString stringWithUTF8String:v66 + 104];
    v70 = v69 ? (__CFString *)v69 : &stru_10012A858;
    uint64_t v108 = IAPAppAccessoryManufacturerKey;
    objc_msgSend(v24, "setObject:forKey:", v70);
    CFStringRef v71 = +[NSString stringWithUTF8String:v66 + 168];
    v72 = v71 ? (__CFString *)v71 : &stru_10012A858;
    [v24 setObject:v72 forKey:IAPAppAccessoryModelNumberKey];
    CFStringRef v73 = +[NSString stringWithUTF8String:v66 + 232];
    v74 = v73 ? (__CFString *)v73 : &stru_10012A858;
    [v24 setObject:v74 forKey:IAPAppAccessorySerialNumberKey];
    if (((unint64_t)(v66 + 64) & 3) != 0) {
      goto LABEL_192;
    }
    if (v66[64] != 255 || v66[65] != 255) {
      goto LABEL_144;
    }
    if ((v66 + 66)) {
      goto LABEL_192;
    }
    if (v66[66] == 255)
    {
      [v24 setObject:&stru_10012A858 forKey:IAPAppAccessoryFirmwareRevisionKey];
    }
    else
    {
LABEL_144:
      id v75 = objc_msgSend(+[IAPServer sharedIAPServer](IAPServer, "sharedIAPServer"), "dpFirmwareVersion");
      uint64_t v76 = v66[64];
      v77 = v66 + 66;
      uint64_t v78 = v66[65];
      if (v75)
      {
        if (v77) {
          goto LABEL_192;
        }
        uint64_t v79 = *v77;
        if (objc_msgSend(+[IAPServer sharedIAPServer](IAPServer, "sharedIAPServer"), "dpFirmwareVersion")) {
          CFStringRef v80 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @" (%@)", objc_msgSend(+[IAPServer sharedIAPServer](IAPServer, "sharedIAPServer"), "dpFirmwareVersion"));
        }
        else {
          CFStringRef v80 = &stru_10012A858;
        }
        v83 = +[NSString stringWithFormat:@"%d.%d.%d%@", v76, v78, v79, v80];
        if (v83) {
          CFStringRef v84 = (const __CFString *)v83;
        }
        else {
          CFStringRef v84 = &stru_10012A858;
        }
      }
      else
      {
        if ((v77 & 1) != 0 || ((unint64_t)(v66 + 296) & 3) != 0) {
          goto LABEL_192;
        }
        uint64_t v81 = v66[66];
        if (v66[296]) {
          CFStringRef v82 = +[NSString stringWithFormat:@" (%s)", v66 + 296];
        }
        else {
          CFStringRef v82 = &stru_10012A858;
        }
        v85 = +[NSString stringWithFormat:@"%d.%d.%d%@", v76, v78, v81, v82];
        if (v85) {
          CFStringRef v84 = (const __CFString *)v85;
        }
        else {
          CFStringRef v84 = &stru_10012A858;
        }
      }
      [v24 setObject:v84 forKey:IAPAppAccessoryFirmwareRevisionKey];
    }
    uint64_t v86 = v66[67];
    if (v86 != 255) {
      goto LABEL_166;
    }
    if (((unint64_t)(v66 + 68) & 3) != 0) {
      goto LABEL_192;
    }
    if (v66[68] == 255 && v66[69] == 255)
    {
      CFStringRef v88 = &stru_10012A858;
    }
    else
    {
LABEL_166:
      if ((((_BYTE)v66 + 68) & 3) != 0) {
        goto LABEL_192;
      }
      v87 = +[NSString stringWithFormat:@"%d.%d.%d", v86, v66[68], v66[69]];
      if (v87) {
        CFStringRef v88 = (const __CFString *)v87;
      }
      else {
        CFStringRef v88 = &stru_10012A858;
      }
    }
    [v24 setObject:v88 forKey:IAPAppAccessoryHardwareRevisionKey];
  }
  else
  {
    uint64_t v110 = IAPAppAccessoryNameKey;
    objc_msgSend(v24, "setObject:forKey:", &stru_10012A858);
    uint64_t v108 = IAPAppAccessoryManufacturerKey;
    objc_msgSend(v24, "setObject:forKey:", &stru_10012A858);
    [v24 setObject:&stru_10012A858 forKey:IAPAppAccessoryModelNumberKey];
    [v24 setObject:&stru_10012A858 forKey:IAPAppAccessorySerialNumberKey];
    [v24 setObject:&stru_10012A858 forKey:IAPAppAccessoryFirmwareRevisionKey];
    [v24 setObject:&stru_10012A858 forKey:IAPAppAccessoryHardwareRevisionKey];
  }
  if ((*((unsigned int (**)(const IPodAccessoryDetails *))a3->var0 + 4))(a3) == 15)
  {
    [v24 setObject:@"iPod Hi-Fi" forKey:v110];
    [v24 setObject:@"Apple" forKey:v108];
  }
  [v24 setObject:v118 forKey:IAPAppConnectionIDKey];
  [v24 setObject:objc_alloc_init(IAPSessionList) forKey:@"EAManagerAccessorySessions"];
  uint64_t v89 = (*((uint64_t (**)(const IPodAccessoryDetails *))a3->var0 + 7))(a3);
  if (v89)
  {
    v90 = +[NSString stringWithUTF8String:v89];
    if (v90) {
      CFStringRef v91 = (const __CFString *)v90;
    }
    else {
      CFStringRef v91 = &stru_10012A858;
    }
    [v24 setObject:v91 forKey:IAPAppAccessoryPreferredAppKey];
  }
  v92 = +[NSNumber numberWithUnsignedInt:v112];
  [v24 setObject:v92 forKey:IAPAppAccessoryCapabilitiesKey];
  WORD2(v121) = -21846;
  LODWORD(v121) = -1431655766;
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a4 + 192))(&v121);
  if (&v121 == (uint64_t *)-1 || (unint64_t)&v121 + 5 < 4) {
    goto LABEL_193;
  }
  v93 = +[NSString stringWithFormat:@"%02X:%02X:%02X:%02X:%02X:%02X", v121, BYTE1(v121), BYTE2(v121), BYTE3(v121), BYTE4(v121), BYTE5(v121)];
  [v24 setObject:v93 forKey:IAPAppAccessoryMacAddressKey];
  [(NSLock *)*p_connectedAccessoriesLock lock];
  p_connectionIDMap = &self->_connectionIDMap;
  if (((unint64_t)&self->_connectionIDMap & 7) != 0
    || (LODWORD(v120.tv_sec) = (*((uint64_t (**)(const IPodAccessoryDetails *))a3->var0 + 5))(a3),
        v95 = (EAManager *)sub_10000B278((uint64_t)p_connectionIDMap, &v120),
        ((unint64_t)&self->_connectionIDMap.__tree_.__pair1_ & 7) != 0))
  {
LABEL_192:
    __break(0x5516u);
    goto LABEL_193;
  }
  if (&self->_connectionIDMap.__tree_.__pair1_ == (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned int, NSNumber *>, void *> > > *)v95)
  {
    v96 = v118;
    LODWORD(v120.tv_sec) = (*((uint64_t (**)(const IPodAccessoryDetails *))a3->var0 + 5))(a3);
    sub_10000798C((uint64_t)p_connectionIDMap, (unsigned int *)&v120);
    *v97 = v96;
  }
  [(NSMutableDictionary *)*p_connectedAccessories setObject:v24 forKey:v118];
  [(NSLock *)*p_connectedAccessoriesLock unlock];
  [(EAManager *)self _takeClientAssertionsForAccessoryConnection];
  id v98 = +[EAManager newPlistForAccessory:v24];
  [(EAManager *)self notifyEAClientsOfAccessoryConnection:v98];
  sub_1000EE49C(3u, @"EA new accessory (%lu total) %@", [(NSMutableDictionary *)*p_connectedAccessories count], v24);
  v120.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&v120.tv_usec = 0xAAAAAAAAAAAAAAAALL;
  gettimeofday(&v120, 0);
  v99 = +[NSNumber numberWithLong:v120.tv_sec];
  [v24 setObject:v99 forKey:IAPAppAccessoryConnectionTimeInSecKey];
  if (v24
    && ((*((uint64_t (**)(const IPodAccessoryDetails *))a3->var0 + 6))(a3) & 0x200) == 0
    && (*((unsigned int (**)(const IPodAccessoryDetails *, void *))a3->var0 + 21))(a3, a4))
  {
    [(EAManager *)self logAccessoryAttach:v24 reason:@"Accessory attached"];
  }

  v120.tv_sec = (__darwin_time_t)&i;
  sub_10000B3B0((uint64_t **)&v120);
}

- (void)updateAccessoryProtocols:(const IPodAccessoryDetails *)a3
{
  p_connectedAccessoriesLock = &self->_connectedAccessoriesLock;
  if (((unint64_t)&self->_connectedAccessoriesLock & 7) == 0)
  {
    [(NSLock *)*p_connectedAccessoriesLock lock];
    if (a3)
    {
      if ((a3 & 7) == 0)
      {
        uint64_t v6 = +[NSNumber numberWithUnsignedInteger:(*((unsigned int (**)(const IPodAccessoryDetails *))a3->var0 + 5))(a3)];
        dword_10013BAC8 = (*((uint64_t (**)(const IPodAccessoryDetails *))a3->var0 + 5))(a3);
        if (((unint64_t)&self->_connectedAccessories & 7) == 0)
        {
          id v7 = [(NSMutableDictionary *)self->_connectedAccessories objectForKey:v6];
          if (!v7
            || (id v8 = v7, ((*((uint64_t (**)(const IPodAccessoryDetails *))a3->var0 + 6))(a3) & 0x200) == 0))
          {
            uint64_t v9 = *p_connectedAccessoriesLock;
            [(NSLock *)v9 unlock];
            return;
          }
          uint64_t v10 = (*((uint64_t (**)(const IPodAccessoryDetails *))a3->var0 + 19))(a3);
          if (*(void *)(v10 + 16))
          {
            uint64_t v11 = (uint64_t *)v10;
            id v12 = objc_alloc_init((Class)NSMutableDictionary);
            id v13 = objc_alloc_init((Class)NSMutableDictionary);
            if (v11[2])
            {
              unsigned int v14 = v11 + 1;
              id v26 = v11;
              id v27 = (uint64_t *)*v11;
              if (v27 != v11 + 1)
              {
                char v15 = 0;
                while (1)
                {
                  id v16 = objc_alloc((Class)NSNumber);
                  char v17 = sub_100004C28((uint64_t *)&v27);
                  if (!v17) {
                    goto LABEL_43;
                  }
                  if ((v17 & 7) != 0) {
                    goto LABEL_43;
                  }
                  id v18 = [v16 initWithUnsignedInt:*(unsigned __int8 *)v17];
                  long long v19 = sub_100004C28((uint64_t *)&v27);
                  if (!v19) {
                    goto LABEL_43;
                  }
                  if ((v19 & 7) != 0) {
                    goto LABEL_43;
                  }
                  if ((((_BYTE)v19 + 8) & 7) != 0) {
                    goto LABEL_43;
                  }
                  if (((unint64_t)(v19 + 4) & 7) != 0) {
                    goto LABEL_43;
                  }
                  uint64_t v20 = v19[4];
                  id v21 = sub_100004C28((uint64_t *)&v27);
                  if (!v21
                    || (v21 & 7) != 0
                    || (((_BYTE)v21 + 8) & 7) != 0
                    || ((unint64_t)(v21 + 5) & 7) != 0)
                  {
                    goto LABEL_43;
                  }
                  uint64_t v22 = *((unsigned int *)v21 + 10);
                  if (v22 >= 8) {
                    goto LABEL_44;
                  }
                  if (v20)
                  {
                    id v23 = [objc_alloc((Class)NSString) initWithUTF8String:v20];
                    if (v23)
                    {
                      id v24 = v23;
                      [v13 setObject:v18 forKey:v23];
                      objc_msgSend(v12, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v22), v24);

                      if (v22) {
                        char v15 = 1;
                      }
                    }
                    else
                    {
                      NSLog(@"ERROR - %s:%s - %d got an invalid UTF8 protocolString", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/EAManager.mm", "-[EAManager updateAccessoryProtocols:]", 872);
                    }
                  }
                  else
                  {
                    NSLog(@"ERROR - %s:%s - %d got a NULL protocolString", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/EAManager.mm", "-[EAManager updateAccessoryProtocols:]", 875);
                  }

                  sub_10000B05C((uint64_t *)&v27);
                  if (v27 == v14) {
                    goto LABEL_35;
                  }
                }
              }
              char v15 = 0;
LABEL_35:
              [(EAManager *)self performSelectorOnMainThread:"_shouldPostNoAppAlert:" withObject:v12 waitUntilDone:0];
              uint64_t v11 = v26;
            }
            else
            {
              char v15 = 0;
            }

            if (v11[2]) {
              [v8 setObject:v13 forKey:IAPAppAccessoryProtocolsKey];
            }

            if (v15) {
              objc_msgSend(v8, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(objc_msgSend(v8, "objectForKey:", IAPAppAccessoryCapabilitiesKey), "unsignedIntValue") | 1), IAPAppAccessoryCapabilitiesKey);
            }
          }
          [(EAManager *)self logAccessoryAttach:v8 reason:@"Accessory protocols updated"];
          id v25 = +[EAManager newPlistForAccessory:v8];
          [(NSLock *)self->_connectedAccessoriesLock unlock];
          if (v25)
          {
            [(EAManager *)self notifyEAClientsOfAccessoryReconnection:v25];
          }
          return;
        }
      }
    }
  }
LABEL_43:
  __break(0x5516u);
LABEL_44:
  __break(0x550Au);
}

- (void)updateAccessoryInfo:(const IPodAccessoryDetails *)a3
{
  id v29 = objc_alloc_init((Class)NSAutoreleasePool);
  if (!a3) {
    goto LABEL_44;
  }
  if ((a3 & 7) != 0) {
    goto LABEL_44;
  }
  uint64_t v5 = (*((uint64_t (**)(const IPodAccessoryDetails *))a3->var0 + 13))(a3);
  if (((unint64_t)&self->_connectedAccessoriesLock & 7) != 0) {
    goto LABEL_44;
  }
  uint64_t v6 = (unsigned __int8 *)v5;
  [(NSLock *)self->_connectedAccessoriesLock lock];
  id v7 = +[NSNumber numberWithUnsignedInteger:(*((unsigned int (**)(const IPodAccessoryDetails *))a3->var0 + 5))(a3)];
  if (((unint64_t)&self->_connectedAccessories & 7) != 0) {
    goto LABEL_44;
  }
  id v8 = [(NSMutableDictionary *)self->_connectedAccessories objectForKey:v7];
  if (v6) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9) {
    goto LABEL_39;
  }
  if ((v6 & 3) != 0) {
    goto LABEL_44;
  }
  uint64_t v10 = v8;
  CFStringRef v11 = +[NSString stringWithUTF8String:v6];
  id v12 = v11 ? (__CFString *)v11 : &stru_10012A858;
  [v10 setObject:v12 forKey:IAPAppAccessoryNameKey];
  CFStringRef v13 = +[NSString stringWithUTF8String:v6 + 104];
  unsigned int v14 = v13 ? (__CFString *)v13 : &stru_10012A858;
  [v10 setObject:v14 forKey:IAPAppAccessoryManufacturerKey];
  CFStringRef v15 = +[NSString stringWithUTF8String:v6 + 168];
  id v16 = v15 ? (__CFString *)v15 : &stru_10012A858;
  [v10 setObject:v16 forKey:IAPAppAccessoryModelNumberKey];
  CFStringRef v17 = +[NSString stringWithUTF8String:v6 + 232];
  id v18 = v17 ? (__CFString *)v17 : &stru_10012A858;
  [v10 setObject:v18 forKey:IAPAppAccessorySerialNumberKey];
  if (((unint64_t)(v6 + 64) & 3) != 0) {
    goto LABEL_44;
  }
  uint64_t v19 = v6[64];
  if (__PAIR64__(v6[65], v19) != 0xFF000000FFLL) {
    goto LABEL_47;
  }
  if ((v6 + 66)) {
    goto LABEL_44;
  }
  if (v6[66] == 255)
  {
    uint64_t v24 = IAPAppAccessoryFirmwareRevisionKey;
    CFStringRef v23 = &stru_10012A858;
  }
  else
  {
LABEL_47:
    if (((v6 + 66) & 1) != 0 || ((unint64_t)(v6 + 296) & 3) != 0) {
      goto LABEL_44;
    }
    uint64_t v20 = v6[65];
    uint64_t v21 = v6[66];
    uint64_t v22 = v6[296]
        ? +[NSString stringWithFormat:@" (%s)", v6 + 296]
        : (NSString *)&stru_10012A858;
    CFStringRef v23 = +[NSString stringWithFormat:@"%d.%d.%d%@", v19, v20, v21, v22];
    uint64_t v24 = IAPAppAccessoryFirmwareRevisionKey;
  }
  [v10 setObject:v23 forKey:v24];
  uint64_t v25 = v6[67];
  if (v25 != 255) {
    goto LABEL_36;
  }
  if (((unint64_t)(v6 + 68) & 3) != 0)
  {
LABEL_44:
    __break(0x5516u);
    return;
  }
  if (v6[68] == 255 && v6[69] == 255)
  {
    uint64_t v27 = IAPAppAccessoryHardwareRevisionKey;
    CFStringRef v26 = &stru_10012A858;
    goto LABEL_38;
  }
LABEL_36:
  if ((((_BYTE)v6 + 68) & 3) != 0) {
    goto LABEL_44;
  }
  CFStringRef v26 = +[NSString stringWithFormat:@"%d.%d.%d", v25, v6[68], v6[69]];
  uint64_t v27 = IAPAppAccessoryHardwareRevisionKey;
LABEL_38:
  [v10 setObject:v26 forKey:v27];
  sub_1000EE49C(3u, @"EA new accessory %@ updated", v10);
  [(EAManager *)self logAccessoryAttach:v10 reason:@"Accessory info updated"];
  id v28 = +[EAManager newPlistForAccessory:v10];
  [(EAManager *)self notifyEAClientsOfAccessoryUpdated:v28];

LABEL_39:
  [(NSLock *)self->_connectedAccessoriesLock unlock];
}

- (void)updateSpeakerMenu:(unsigned int)a3 withEqNames:(id)a4 andSelection:(unsigned int)a5
{
  p_connectedAccessoriesLock = &self->_connectedAccessoriesLock;
  if (((unint64_t)&self->_connectedAccessoriesLock & 7) != 0
    || (uint64_t v6 = *(void *)&a5,
        [(NSLock *)self->_connectedAccessoriesLock lock],
        ((unint64_t)&self->_connectedAccessories & 7) != 0))
  {
    __break(0x5516u);
  }
  else
  {
    id v10 = [(NSMutableDictionary *)self->_connectedAccessories objectForKey:+[NSNumber numberWithUnsignedInteger:a3]];
    if (v10)
    {
      CFStringRef v11 = v10;
      [v10 setObject:a4 forKey:EAAccessorySpeakerMenuEQNamesKey];
      id v12 = +[NSNumber numberWithUnsignedInt:v6];
      [v11 setObject:v12 forKey:EAAccessorySpeakerMenuEQIndexKey];
      id v14 = +[EAManager newPlistForAccessory:v11];
      [(NSLock *)*p_connectedAccessoriesLock unlock];
      if (v14)
      {
        [(EAManager *)self notifyEAClientsOfAccessoryReconnection:v14];
      }
    }
    else
    {
      CFStringRef v13 = *p_connectedAccessoriesLock;
      [(NSLock *)v13 unlock];
    }
  }
}

- (void)updateSpeakerEqIndex:(unsigned int)a3 eqIndex:(unsigned int)a4
{
  p_connectedAccessoriesLock = &self->_connectedAccessoriesLock;
  if (((unint64_t)&self->_connectedAccessoriesLock & 7) != 0) {
    goto LABEL_10;
  }
  uint64_t v5 = *(void *)&a4;
  [(NSLock *)self->_connectedAccessoriesLock lock];
  if (((unint64_t)&self->_connectedAccessories & 7) != 0) {
    goto LABEL_10;
  }
  id v8 = [(NSMutableDictionary *)self->_connectedAccessories objectForKey:+[NSNumber numberWithUnsignedInteger:a3]];
  if (v8)
  {
    BOOL v9 = v8;
    id v10 = +[NSNumber numberWithUnsignedInt:v5];
    [v9 setObject:v10 forKey:EAAccessorySpeakerMenuEQIndexKey];
  }
  [(NSLock *)*p_connectedAccessoriesLock unlock];
  uint64_t v11 = sub_1000DA680();
  if (!v11 || (v11 & 7) != 0)
  {
LABEL_10:
    __break(0x5516u);
  }
  else
  {
    id v12 = *(void (**)(void))(*(void *)v11 + 112);
    v12();
  }
}

- (void)updateLocationSupport:(unsigned int)a3 isReady:(BOOL)a4
{
  p_connectedAccessoriesLock = &self->_connectedAccessoriesLock;
  if (((unint64_t)&self->_connectedAccessoriesLock & 7) != 0
    || (BOOL v5 = a4,
        [(NSLock *)self->_connectedAccessoriesLock lock],
        ((unint64_t)&self->_connectedAccessories & 7) != 0))
  {
    __break(0x5516u);
  }
  else
  {
    id v8 = [(NSMutableDictionary *)self->_connectedAccessories objectForKey:+[NSNumber numberWithUnsignedInteger:a3]];
    if (v8
      && ((BOOL v9 = v8,
           uint64_t v10 = IAPAppAccessoryCapabilitiesKey,
           unint64_t v11 = (unint64_t)objc_msgSend(objc_msgSend(v8, "objectForKey:", IAPAppAccessoryCapabilitiesKey), "unsignedIntValue") & 0xFFFFFFF7, !v5)? (v12 = 0): (v12 = 8), objc_msgSend(v9, "setObject:forKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v11 | v12), v10), v5))
    {
      id v14 = +[EAManager newPlistForAccessory:v9];
      [(NSLock *)*p_connectedAccessoriesLock unlock];
      if (v14)
      {
        [(EAManager *)self notifyEAClientsOfAccessoryReconnection:v14];
      }
    }
    else
    {
      CFStringRef v13 = *p_connectedAccessoriesLock;
      [(NSLock *)v13 unlock];
    }
  }
}

- (void)updateValueFromIap:(id)a3 forPort:(id)a4 andPortPorperty:(id)a5 forAccessory:(unsigned int)a6
{
}

- (void)updateValueFromIap:(id)a3 forPort:(id)a4 andPortPorperty:(id)a5 forAccessory:(unsigned int)a6 updateApp:(BOOL)a7
{
  p_connectedAccessoriesLock = &self->_connectedAccessoriesLock;
  if (((unint64_t)&self->_connectedAccessoriesLock & 7) != 0
    || (BOOL v8 = a7,
        uint64_t v9 = *(void *)&a6,
        [(NSLock *)self->_connectedAccessoriesLock lock],
        id v14 = +[NSNumber numberWithUnsignedInteger:v9], ((unint64_t)&self->_connectedAccessories & 7) != 0))
  {
    __break(0x5516u);
  }
  else
  {
    CFStringRef v15 = v14;
    id v16 = [(NSMutableDictionary *)self->_connectedAccessories objectForKey:v14];
    if (v16)
    {
      CFStringRef v17 = v16;
      id v18 = +[NSString stringWithFormat:@"%X", v9];
      id v19 = objc_msgSend(objc_msgSend(objc_msgSend(v17, "objectForKey:", IAPAppAccessoryPortsKey), "objectForKey:", v18), "objectForKey:", a4);
      if (v19)
      {
        [v19 setObject:a3 forKey:a5];
        if (v8) {
          [(EAManager *)self notifyEAClientsOfAccessoryPortPropertyChanged:+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v15, IAPAppConnectionIDKey, v18, IAPAppAccessoryUIDKey, a4, IAPAppAccessoryPortKey, a5, IAPAppAccessoryPortPropertyKey, a3, IAPAppAccessoryPortPropertyValueKey, 0)];
        }
      }
      sub_1000EE49C(3u, @"EA accessory %@ port %@ portProperty %@ updated to %@", v18, a4, a5, a3);
    }
    uint64_t v20 = *p_connectedAccessoriesLock;
    [(NSLock *)v20 unlock];
  }
}

- (void)updateValueFromApp:(id)a3
{
  id v29 = objc_alloc_init((Class)NSAutoreleasePool);
  if (objc_msgSend(objc_msgSend(a3, "objectForKey:", IAPAppConnectionIDKey), "intValue"))
  {
    id v4 = [a3 objectForKey:IAPAppAccessoryPortKey];
    id v5 = [a3 objectForKey:IAPAppAccessoryPortPropertyKey];
    id v6 = [a3 objectForKey:IAPAppAccessoryPortPropertyValueKey];
    if ([v5 compare:kCFAccessoryPortPropertyCurrentSampleRate options:1])
    {
      if ([v5 compare:kCFAccessoryPortPropertyIsActive options:1])
      {
        if ([v5 compare:kCFAccessoryPortPropertyVolumeScalar options:1]
          || [v4 compare:kCFAccessoryPortLineOut options:1])
        {
          goto LABEL_53;
        }
        [v6 floatValue];
        float v8 = 1.0;
        if (v7 <= 1.0)
        {
          float v8 = v7;
          if (v7 < 0.0) {
            float v8 = 0.0;
          }
        }
        uint64_t v9 = sub_10002C0D4();
        if (!v9) {
          goto LABEL_53;
        }
        uint64_t v10 = (uint64_t)v9;
        uint64_t v11 = sub_10004BD48();
        if (v11 && (v11 & 7) == 0)
        {
          float v12 = v8 * 255.0;
          if ((float)(v8 * 255.0) > -1.0 && v12 < 4295000000.0)
          {
            sub_10004BFC4(v11, v10, v12, 0);
            goto LABEL_53;
          }
LABEL_57:
          __break(0x5505u);
          return;
        }
      }
      else if ([v4 compare:kCFAccessoryPortLineIn options:1])
      {
        if ([v4 compare:kCFAccessoryPortLineOut options:1]) {
          goto LABEL_53;
        }
        uint64_t v17 = sub_10001DF64();
        if (v17 && (v17 & 7) == 0)
        {
          uint64_t v18 = *(void *)(v17 + 16);
          if (!v18) {
            goto LABEL_53;
          }
          unsigned int v19 = [v6 intValue];
          uint64_t v20 = sub_1000E4458();
          BOOL v22 = (v20 & 7) == 0 && v20 != 0;
          if (v19)
          {
            if (v22)
            {
              (*(void (**)(uint64_t, uint64_t))(*(void *)v20 + 200))(v20, v18);
              goto LABEL_53;
            }
          }
          else if (v22)
          {
            (*(void (**)(uint64_t, uint64_t))(*(void *)v20 + 208))(v20, v18);
            goto LABEL_53;
          }
        }
      }
      else
      {
        uint64_t v23 = sub_10001DF64();
        if (v23 && (v23 & 7) == 0)
        {
          uint64_t v24 = *(void *)(v23 + 16);
          if (!v24) {
            goto LABEL_53;
          }
          unsigned int v25 = [v6 intValue];
          uint64_t v26 = sub_1000E4458();
          BOOL v28 = (v26 & 7) == 0 && v26 != 0;
          if (v25)
          {
            if (v28)
            {
              (*(void (**)(uint64_t, uint64_t))(*(void *)v26 + 184))(v26, v24);
              goto LABEL_53;
            }
          }
          else if (v28)
          {
            (*(void (**)(uint64_t, uint64_t))(*(void *)v26 + 192))(v26, v24);
            goto LABEL_53;
          }
        }
      }
    }
    else
    {
      uint64_t v13 = sub_10001C8FC();
      if (v13)
      {
        if ((v13 & 7) == 0)
        {
          uint64_t v14 = sub_10001CE30(v13);
          uint64_t v15 = sub_1000DDBC0();
          if (v15)
          {
            if ((v15 & 7) == 0)
            {
              if (!(*(unsigned int (**)(uint64_t, uint64_t))(*(void *)v15 + 136))(v15, v14)) {
                goto LABEL_53;
              }
              uint64_t v16 = sub_1000DDBC0();
              if (v16 && (v16 & 7) == 0)
              {
                (*(void (**)(uint64_t, uint64_t, id))(*(void *)v16 + 88))(v16, v14, [v6 intValue]);
                goto LABEL_53;
              }
            }
          }
        }
      }
    }
    __break(0x5516u);
    goto LABEL_57;
  }
LABEL_53:
}

- (id)valueForProperty:(id)a3 forAccessory:(unsigned int)a4
{
  id v4 = (id *)((char *)self + 40);
  if ((((unint64_t)self + 40) & 7) != 0
    || (float v7 = (id *)self,
        [*((id *)self + 5) lock],
        self = +[NSNumber numberWithUnsignedInteger:a4],
        ((unint64_t)(v7 + 1) & 7) != 0))
  {
    __break(0x5516u);
  }
  else
  {
    id v8 = objc_msgSend(objc_msgSend(v7[1], "objectForKey:", self), "objectForKey:", a3);
    [*v4 unlock];
    return v8;
  }
  return self;
}

- (void)detachAccessory:(unsigned int)a3
{
  unsigned int v23 = a3;
  id v5 = objc_alloc_init((Class)NSAutoreleasePool);
  if (((unint64_t)&self->_connectedAccessoriesLock & 7) != 0) {
    goto LABEL_19;
  }
  id v6 = v5;
  [(NSLock *)self->_connectedAccessoriesLock lock];
  float v7 = +[NSNumber numberWithUnsignedInteger:a3];
  if (((unint64_t)&self->_connectedAccessories & 7) != 0) {
    goto LABEL_19;
  }
  id v8 = v7;
  id v9 = [(NSMutableDictionary *)self->_connectedAccessories objectForKey:v7];
  [(NSLock *)self->_connectedAccessoriesLock unlock];
  if (v9)
  {
    [(EAManager *)self _takeClientAssertionsForAccessoryDisconnection];
    id v10 = +[EAManager newPlistForAccessory:v9];
    [(EAManager *)self notifyEAClientsOfAccessoryDisconnection:v10];
    sub_1000EE49C(3u, @"EA accessory with connectionID=%@ detached", v8);

    id v11 = objc_msgSend(objc_msgSend(v9, "objectForKey:", @"EAManagerAccessorySessions"), "sessions");
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v12 = [v11 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          -[EAManager closeSessionForConnectionID:sessionID:notifyApp:](self, "closeSessionForConnectionID:sessionID:notifyApp:", [*(id *)(*((void *)&v19 + 1) + 8 * i) connectionID], objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "sessionID"), 0);
        }
        id v13 = [v11 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v13);
    }
    [(EAManager *)self logAccessoryDetach:v9 reason:@"Accessory detached"];
    [(NSMutableDictionary *)self->_connectedAccessories removeObjectForKey:v8];
    if (![(NSMutableDictionary *)self->_connectedAccessories count]) {
      +[IAPSession resetSessionIDCounter];
    }
    uint64_t v18 = 0xAAAAAAAAAAAAAAAALL;
    uint64_t p_connectionIDMap = (uint64_t)&self->_connectionIDMap;
    if ((p_connectionIDMap & 7) == 0)
    {
      uint64_t v18 = sub_10000B278(p_connectionIDMap, &v23);
      uint64_t v17 = sub_100004C28(&v18);
      if (v17)
      {
        if ((v17 & 7) == 0 && ((unint64_t)(v17 + 1) & 7) == 0)
        {

          sub_10000BC30((uint64_t *)p_connectionIDMap, v18);
          goto LABEL_18;
        }
      }
    }
LABEL_19:
    __break(0x5516u);
  }
LABEL_18:
}

- (void)reset
{
  id v3 = objc_alloc_init((Class)NSAutoreleasePool);
  if (((unint64_t)&self->_connectedAccessories & 7) != 0) {
    __break(0x5516u);
  }
  id v4 = v3;
  id v5 = [(NSMutableDictionary *)self->_connectedAccessories allKeys];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[EAManager detachAccessory:](self, "detachAccessory:", [*(id *)(*((void *)&v10 + 1) + 8 * i) unsignedIntValue]);
      }
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)accessoryForConnectionID:(id)a3
{
  if ((((unint64_t)self + 8) & 7) == 0) {
    return [*((id *)self + 1) objectForKey:a3];
  }
  __break(0x5516u);
  return self;
}

- (id)sessionForAccessoryWithConnectionID:(unsigned int)a3 andSessionID:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id result = [(EAManager *)self connectionIDObjectForConnectionID:*(void *)&a3];
  if (result)
  {
    id v7 = objc_msgSend(-[EAManager accessoryForConnectionID:](self, "accessoryForConnectionID:", result), "objectForKey:", @"EAManagerAccessorySessions");
    return [v7 sessionWithSessionID:v4];
  }
  return result;
}

- (BOOL)openSessionForClientID:(unsigned int)a3 connetionID:(unsigned int)a4 protocolID:(unsigned __int8)a5 sessionID:(unsigned __int16 *)a6
{
  uint64_t v7 = a5;
  uint64_t v8 = *(void *)&a4;
  uint64_t v9 = *(void *)&a3;
  long long v11 = (IAPSessionBasic *)sub_1000DB62C();
  if (!v11 || (v11 & 7) != 0) {
    goto LABEL_31;
  }
  long long v11 = (IAPSessionBasic *)(*((uint64_t (**)(IAPSessionBasic *, uint64_t))v11->super.super.isa + 12))(v11, v8);
  if (!v11 || (v11 & 7) != 0) {
    goto LABEL_31;
  }
  int v13 = (*((uint64_t (**)(IAPSessionBasic *))v11->super.super.isa + 6))(v11);
  id v14 = objc_msgSend(-[EAManager accessoryForConnectionID:](self, "accessoryForConnectionID:", -[EAManager connectionIDObjectForConnectionID:](self, "connectionIDObjectForConnectionID:", v8)), "objectForKey:", @"EAManagerAccessorySessions");
  if ((v13 & 0x1000000) != 0)
  {
    sub_1000EE49C(3u, @"Supports multiple sessions per protocol");
    id v24 = objc_msgSend(objc_msgSend(v14, "sessionsWithProtocolID:", v7), "objectEnumerator");
    while (1)
    {
      id v25 = [v24 nextObject];
      if (!v25) {
        goto LABEL_19;
      }
      uint64_t v26 = v25;
      if (objc_msgSend(objc_msgSend(v25, "client"), "clientID") == v9)
      {
        sub_1000EE49C(3u, @"%s:%s found existing sessionID %d for protocol %d and client %@, not opening new one", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/EAManager.mm", "-[EAManager openSessionForClientID:connetionID:protocolID:sessionID:]", [v26 sessionID], objc_msgSend(v26, "protocolID"), objc_msgSend(objc_msgSend(v26, "client"), "bundleId"));
        goto LABEL_29;
      }
    }
  }
  sub_1000EE49C(3u, @"Doesn't support multiple sessions per protocol");
  long long v11 = (IAPSessionBasic *)[v14 sessionWithProtocolID:v7];
  if (!v11) {
    goto LABEL_19;
  }
  if (((unint64_t)&self->_clients & 7) != 0) {
    goto LABEL_31;
  }
  uint64_t v15 = v11;
  long long v11 = (IAPSessionBasic *)[(NSMutableDictionary *)self->_clients objectForKey:+[EAManager stringForClientID:[(IAPEAClient *)[(IAPSession *)v11 client] clientID]]];
  if (v11)
  {
    uint64_t v16 = v11;
    long long v11 = (IAPSessionBasic *)[(IAPSessionBasic *)v11 bundleId];
    if (v11)
    {
      if (((unint64_t)&self->_appStateMonitor & 7) != 0) {
        goto LABEL_31;
      }
      id v17 = -[IAPApplicationStateMonitor applicationInfoForBundleIDSync:](self->_appStateMonitor, "applicationInfoForBundleIDSync:", [v16 bundleId]);
      unsigned int v18 = objc_msgSend(objc_msgSend(v17, "objectForKey:", BKSApplicationStateKey), "unsignedIntValue");
      LOBYTE(v11) = 0;
      if (v18 <= 4 && ((1 << v18) & 0x16) != 0)
      {
        unsigned int v19 = -[EAManager closeSessionForConnectionID:sessionID:notifyApp:](self, "closeSessionForConnectionID:sessionID:notifyApp:", v8, [v15 sessionID], 1);
        long long v20 = "not ";
        if (v19) {
          long long v20 = "";
        }
        sub_1000EE49C(3u, @"session already found, replacing it was %ssuccessful", v20);
        if (!v19)
        {
LABEL_29:
          LOBYTE(v11) = 0;
          return (char)v11;
        }
LABEL_19:
        sub_1000EE49C(3u, @"%s:%s No session found for client ID %d and protocol %d, opening new one", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/EAManager.mm", "-[EAManager openSessionForClientID:connetionID:protocolID:sessionID:]", v9, v7);
        if (((unint64_t)&self->_clients & 7) == 0)
        {
          id v21 = [(NSMutableDictionary *)self->_clients objectForKey:+[EAManager stringForClientID:v9]];
          id v22 = [objc_alloc((Class)NSNumber) initWithUnsignedInt:v7];
          long long v11 = [[IAPSessionBasic alloc] initWithClient:v21 connectionID:v8 protocolID:v7 sessionID:a6];
          unsigned int v23 = v11;
          if (!v11)
          {
LABEL_24:

            LOBYTE(v11) = v23 != 0;
            return (char)v11;
          }
          if (a6 && (a6 & 1) == 0)
          {
            [v14 addSession:v11 withSessionID:*a6];

            goto LABEL_24;
          }
        }
LABEL_31:
        __break(0x5516u);
      }
    }
  }
  return (char)v11;
}

- (void)openCompleteForSessionWithConnectionID:(unsigned int)a3 sessionID:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = [(EAManager *)self connectionIDObjectForConnectionID:*(void *)&a3];
  if ((((int)self + 40) & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    id v7 = v6;
    [(NSLock *)self->_connectedAccessoriesLock lock];
    id v9 = objc_msgSend(objc_msgSend(-[EAManager accessoryForConnectionID:](self, "accessoryForConnectionID:", v7), "objectForKey:", @"EAManagerAccessorySessions"), "sessionWithSessionID:", v4);
    [(NSLock *)self->_connectedAccessoriesLock unlock];
    uint64_t v8 = v9;
    if (!v9)
    {
      NSLog(@"unknown session acked by accessory");
      uint64_t v8 = 0;
    }
  }
}

- (BOOL)closeSessionForConnectionID:(unsigned int)a3 sessionID:(unsigned __int16)a4 notifyApp:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = a4;
  uint64_t v7 = *(void *)&a3;
  xpc_object_t v9 = -[EAManager connectionIDObjectForConnectionID:](self, "connectionIDObjectForConnectionID:");
  p_connectedAccessoriesLock = &self->_connectedAccessoriesLock;
  if (((unint64_t)&self->_connectedAccessoriesLock & 7) != 0)
  {
    __break(0x5516u);
    goto LABEL_12;
  }
  xpc_object_t v11 = v9;
  [(NSLock *)self->_connectedAccessoriesLock lock];
  id v12 = [(EAManager *)self accessoryForConnectionID:v11];
  id v13 = [v12 objectForKey:@"EAManagerAccessorySessions"];
  id v14 = [v13 sessionWithSessionID:v6];
  uint64_t v15 = v14;
  if (v14)
  {
    [v14 closeDataPipes];
    [v13 removeSessionWithSessionID:v6];
  }
  else if (v12)
  {
    NSLog(@"ERROR - %s:%s - %d unable to find sessionID=0x%x for connectionID=0x%x", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/EAManager.mm", "-[EAManager closeSessionForConnectionID:sessionID:notifyApp:]", 1342, v6, v7);
  }
  [(NSLock *)*p_connectedAccessoriesLock unlock];
  if (!v5) {
    goto LABEL_10;
  }
  xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
  if (!v9
    || (uint64_t v16 = v9,
        xpc_dictionary_set_string(v9, "requestType", "eaNotifyAppOfSessionClose"),
        xpc_dictionary_set_uint64(v16, "connectionID", [v15 connectionID]),
        xpc_dictionary_set_uint64(v16, "eaSessionID", v6),
        (xpc_object_t v9 = objc_msgSend(objc_msgSend(v15, "client"), "xpcConnection")) == 0))
  {
LABEL_12:
    __break(0x5510u);
    return (char)v9;
  }
  xpc_connection_send_message((xpc_connection_t)v9, v16);
  xpc_release(v16);
LABEL_10:
  [v15 shuttingDownSession];

  LOBYTE(v9) = v15 != 0;
  return (char)v9;
}

- (id)connectedAccessories
{
  id result = objc_alloc_init((Class)NSMutableArray);
  if (((unint64_t)&self->_connectedAccessoriesLock & 7) != 0
    || (id v4 = result,
        id result = [(NSLock *)self->_connectedAccessoriesLock lock],
        ((unint64_t)&self->_connectedAccessories & 7) != 0))
  {
    __break(0x5516u);
  }
  else
  {
    objc_msgSend(v4, "addObjectsFromArray:", -[NSMutableDictionary allValues](self->_connectedAccessories, "allValues"));
    [(NSLock *)self->_connectedAccessoriesLock unlock];
    return v4;
  }
  return result;
}

- (id)connectedAccessoriesForEAClient:(unsigned int)a3
{
  id v5 = [(EAManager *)self connectedAccessories];
  id v6 = objc_alloc_init((Class)NSMutableArray);
  p_clientLock = &self->_clientLock;
  if (((unint64_t)&self->_clientLock & 7) != 0
    || (uint64_t v8 = v6,
        [(NSLock *)self->_clientLock lock],
        long long v28 = 0u,
        long long v29 = 0u,
        long long v26 = 0u,
        long long v27 = 0u,
        p_clients = (id *)&self->_clients,
        ((unint64_t)&self->_clients & 7) != 0))
  {
    __break(0x5516u);
  }
  id v10 = *p_clients;
  id v11 = [*p_clients countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v27;
LABEL_5:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v27 != v13) {
        objc_enumerationMutation(v10);
      }
      id v15 = [*p_clients objectForKey:*(void *)(*((void *)&v26 + 1) + 8 * v14)];
      if ([v15 clientID] == a3) {
        break;
      }
      if (v12 == (id)++v14)
      {
        id v12 = [v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
        if (v12) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    id v15 = 0;
  }
  [(NSLock *)*p_clientLock unlock];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v16 = [v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v17; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v5);
        }
        uint64_t v20 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        if ([v15 canSendConnectionEventForAccessory:v20]) {
          [v8 addObject:v20];
        }
      }
      id v17 = [v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v17);
  }
  sub_1000EE49C(3u, @"returning mutableConnectedAccessories %@", v8);
  return v8;
}

- (void)fakedLocationDeviceNMEAAvailable
{
  if (self->_fakedLocationDeviceEnabled >= 2u)
  {
    __break(0x550Au);
    -[EAManager notifyEALocationClientsOfIAPLocationDidReceiveNMEASentenceNotification:](self, "notifyEALocationClientsOfIAPLocationDidReceiveNMEASentenceNotification:");
  }
  else if (self->_fakedLocationDeviceEnabled)
  {
    [(EAManager *)self notifyEALocationClientsOfIAPLocationDidReceiveNMEASentenceNotification:0];
  }
}

- (void)fakedLocationDevicePointDataAvailable
{
  if (self->_fakedLocationDeviceEnabled >= 2u)
  {
    __break(0x550Au);
    -[EAManager notifyEALocationClientsOfIAPLocationDidReceiveLocationPointDataNotification:](self, "notifyEALocationClientsOfIAPLocationDidReceiveLocationPointDataNotification:");
  }
  else if (self->_fakedLocationDeviceEnabled)
  {
    [(EAManager *)self notifyEALocationClientsOfIAPLocationDidReceiveLocationPointDataNotification:0];
  }
}

- (void)fakedLocationDeviceEphemerisURLAvailable
{
  if (self->_fakedLocationDeviceEnabled >= 2u)
  {
    __break(0x550Au);
    -[EAManager notifyEALocationClientsOfIAPLocationDidReceiveEphemerisURLNotification:](self, "notifyEALocationClientsOfIAPLocationDidReceiveEphemerisURLNotification:");
  }
  else if (self->_fakedLocationDeviceEnabled)
  {
    [(EAManager *)self notifyEALocationClientsOfIAPLocationDidReceiveEphemerisURLNotification:0];
  }
}

- (void)fakedLocationDeviceEphemerisMaxIntervalAvailable
{
  if (self->_fakedLocationDeviceEnabled >= 2u)
  {
    __break(0x550Au);
    -[EAManager notifyEALocationClientsOfIAPLocationDidReceiveEphemerisMaxIntervalNotification:](self, "notifyEALocationClientsOfIAPLocationDidReceiveEphemerisMaxIntervalNotification:");
  }
  else if (self->_fakedLocationDeviceEnabled)
  {
    [(EAManager *)self notifyEALocationClientsOfIAPLocationDidReceiveEphemerisMaxIntervalNotification:0];
  }
}

- (void)fakedLocationDeviceEphemerisRefreshIntervalAvailable
{
  if (self->_fakedLocationDeviceEnabled >= 2u)
  {
    __break(0x550Au);
    -[EAManager notifyEALocationClientsOfIAPLocationDidReceiveEphemerisRecommendedRefreshNotification:](self, "notifyEALocationClientsOfIAPLocationDidReceiveEphemerisRecommendedRefreshNotification:");
  }
  else if (self->_fakedLocationDeviceEnabled)
  {
    [(EAManager *)self notifyEALocationClientsOfIAPLocationDidReceiveEphemerisRecommendedRefreshNotification:0];
  }
}

- (void)fakedLocationRequestGPSTime
{
  if (self->_fakedLocationDeviceEnabled >= 2u)
  {
    __break(0x550Au);
    -[EAManager notifyEALocationClientsOfIAPLocationDidRequestGPSTimeNotification:](self, "notifyEALocationClientsOfIAPLocationDidRequestGPSTimeNotification:");
  }
  else if (self->_fakedLocationDeviceEnabled)
  {
    [(EAManager *)self notifyEALocationClientsOfIAPLocationDidRequestGPSTimeNotification:0];
  }
}

- (void)fakedLocationDeviceSetFilter:(id)a3
{
  id v4 = [a3 objectAtIndex:0];
  uint64_t v5 = sub_1000E1AE8([v4 unsignedIntValue], 0);
  id v13 = objc_alloc_init((Class)NSAutoreleasePool);
  if (!v5) {
    goto LABEL_13;
  }
  if ((v5 & 7) != 0)
  {
LABEL_19:
    __break(0x5516u);
    return;
  }
  if ((*(unsigned int (**)(uint64_t))(*(void *)v5 + 176))(v5))
  {
    id v6 = +[NSString string];
    if ((unint64_t)[a3 count] >= 2)
    {
      uint64_t v7 = 1;
      while (1)
      {
        uint64_t v8 = (char *)[a3 count];
        xpc_object_t v9 = v8 - 1;
        if (!v8) {
          break;
        }
        id v10 = [a3 objectAtIndex:v7];
        if (v9 == (char *)v7) {
          id v11 = [(NSString *)v6 stringByAppendingString:v10];
        }
        else {
          id v11 = [(NSString *)v6 stringByAppendingFormat:@"%@,", v10];
        }
        id v6 = v11;
        BOOL v12 = __CFADD__(v7, 1);
        uint64_t v7 = (v7 + 1);
        if (v12) {
          goto LABEL_18;
        }
        if ((unint64_t)[a3 count] <= v7) {
          goto LABEL_12;
        }
      }
      __break(0x5515u);
LABEL_18:
      __break(0x5500u);
      goto LABEL_19;
    }
LABEL_12:
    (*(void (**)(uint64_t, uint64_t))(*(void *)v5 + 200))(v5, 1);
    (*(void (**)(uint64_t, const char *))(*(void *)v5 + 224))(v5, [(NSString *)v6 UTF8String]);
  }
  else
  {
LABEL_13:
    NSLog(@"trying to set filtering on an location accessory (%hhx) that either doesn't exist or doesn't support filtering", v4);
  }
}

- (void)fakedLocationDeviceFilteringSupport:(BOOL)a3
{
  unsigned int fakedLocationDeviceFilteringSupport = self->_fakedLocationDeviceFilteringSupport;
  if (fakedLocationDeviceFilteringSupport >= 2)
  {
    __break(0x550Au);
    [(EAManager *)self notifyEALocationClientsOfIAPLocationAccessoryNMEASentenceFilteringSupportChangedNotification:a3];
  }
  else if ((((fakedLocationDeviceFilteringSupport == 0) ^ a3) & 1) == 0)
  {
    self->_unsigned int fakedLocationDeviceFilteringSupport = a3;
    [(EAManager *)self notifyEALocationClientsOfIAPLocationAccessoryNMEASentenceFilteringSupportChangedNotification:0];
  }
}

- (BOOL)isFakedLocationDeviceEnabled
{
  unsigned int fakedLocationDeviceEnabled = self->_fakedLocationDeviceEnabled;
  if (fakedLocationDeviceEnabled >= 2) {
    __break(0x550Au);
  }
  else {
    LOBYTE(self) = fakedLocationDeviceEnabled != 0;
  }
  return (char)self;
}

- (void)setFakedLocationDeviceEnabled:(BOOL)a3 forClientID:(unsigned int)a4
{
  p_clientLock = &self->_clientLock;
  if (((unint64_t)&self->_clientLock & 7) != 0) {
    goto LABEL_28;
  }
  uint64_t v5 = *(void *)&a4;
  BOOL v6 = a3;
  [(NSLock *)self->_clientLock lock];
  unsigned int fakedLocationDeviceEnabled = self->_fakedLocationDeviceEnabled;
  if (fakedLocationDeviceEnabled >= 2) {
    goto LABEL_29;
  }
  if ((fakedLocationDeviceEnabled == 0) != v6
    && +[IAPEAClient clientIDForLocationClient] == v5)
  {
    goto LABEL_25;
  }
  if (((unint64_t)&self->_clients & 7) != 0) {
    goto LABEL_28;
  }
  id v9 = [(NSMutableDictionary *)self->_clients objectForKey:+[EAManager stringForClientID:v5]];
  if (!v9)
  {
    NSLog(@"ERROR - %s:%s - %d client 0x%x isn't registered", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/EAManager.mm", "-[EAManager setFakedLocationDeviceEnabled:forClientID:]", 1533, v5);
    goto LABEL_25;
  }
  [v9 setLocationSupportedByClient:v6];
  self->_unsigned int fakedLocationDeviceEnabled = v6;
  p_connectedAccessoriesLock = &self->_connectedAccessoriesLock;
  if (((unint64_t)&self->_connectedAccessoriesLock & 7) != 0
    || ([(NSLock *)self->_connectedAccessoriesLock lock],
        long long v25 = 0u,
        long long v26 = 0u,
        long long v23 = 0u,
        long long v24 = 0u,
        p_connectedAccessories = (id *)&self->_connectedAccessories,
        ((unint64_t)&self->_connectedAccessories & 7) != 0))
  {
LABEL_28:
    __break(0x5516u);
LABEL_29:
    __break(0x550Au);
  }
  id v12 = *p_connectedAccessories;
  id v13 = [*p_connectedAccessories countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v13) {
    goto LABEL_17;
  }
  id v14 = v13;
  uint64_t v15 = *(void *)v24;
  uint64_t v16 = IAPAppAccessoryCapabilitiesKey;
LABEL_11:
  uint64_t v17 = 0;
  while (1)
  {
    if (*(void *)v24 != v15) {
      objc_enumerationMutation(v12);
    }
    id v18 = [*p_connectedAccessories objectForKey:*(void *)(*((void *)&v23 + 1) + 8 * v17)];
    if ((objc_msgSend(objc_msgSend(v18, "objectForKey:", v16), "unsignedIntValue") & 8) != 0) {
      break;
    }
    if (v14 == (id)++v17)
    {
      id v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (!v14)
      {
LABEL_17:
        [(NSLock *)*p_connectedAccessoriesLock unlock];
        goto LABEL_25;
      }
      goto LABEL_11;
    }
  }
  id v19 = objc_msgSend(objc_msgSend(v18, "objectForKey:", IAPAppConnectionIDKey), "unsignedIntValue");
  [(NSLock *)*p_connectedAccessoriesLock unlock];
  if (v19)
  {
    uint64_t v20 = sub_1000E1AE8(v19, 0);
    if (v20)
    {
      uint64_t v21 = v20;
      if ((v20 & 7) == 0)
      {
        if ((*(unsigned int (**)(uint64_t))(*(void *)v20 + 128))(v20))
        {
          long long v22 = *(void (**)(uint64_t, uint64_t))(*(void *)v21 + 112);
          if (v6)
          {
            v22(v21, 3);
            (*(void (**)(uint64_t, uint64_t, void))(*(void *)v21 + 160))(v21, 1, 0);
          }
          else
          {
            v22(v21, 0);
            (*(void (**)(uint64_t, void, void))(*(void *)v21 + 160))(v21, 0, 0);
          }
        }
        goto LABEL_25;
      }
      goto LABEL_28;
    }
  }
LABEL_25:
  [(NSLock *)*p_clientLock unlock];
}

- (void)_shouldPostNoAppAlert:(id)a3
{
  if (!sub_1000F1A60((uint64_t)"com.apple.AppStore")) {
    return;
  }
  id v5 = objc_alloc_init((Class)NSAutoreleasePool);
  BOOL v6 = (void *)CFPreferencesCopyAppValue(@"OptionalSDKProtocolsShownKey", @"com.apple.iapd");
  id v7 = objc_alloc_init((Class)NSMutableArray);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v8 = [a3 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (!v8) {
    goto LABEL_41;
  }
  id v9 = v8;
  id v28 = v5;
  uint64_t v29 = 0;
  uint64_t v10 = *(void *)v35;
  do
  {
    for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v35 != v10) {
        objc_enumerationMutation(a3);
      }
      id v12 = *(void **)(*((void *)&v34 + 1) + 8 * i);
      if (![(EAManager *)self _isProtocolContainedInWhitelist:v12])
      {
        unsigned int v13 = objc_msgSend(objc_msgSend(a3, "objectForKey:", v12), "unsignedIntValue");
        if (v13 >= 8) {
          __break(0x550Au);
        }
        if (v13 - 1 <= 1)
        {
          id v14 = [v12 lowercaseString];
          if (v6 && (CFTypeID v15 = CFGetTypeID(v6), v15 != CFArrayGetTypeID()))
          {
            CFTypeID v16 = CFGetTypeID(v6);
            NSLog(@"ERROR - %s:%s - %d wrong typeID %d", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/EAManager.mm", "-[EAManager _shouldPostNoAppAlert:]", 1605, v16);
          }
          else
          {
            if (([v6 containsObject:v14] & 1) != 0
              || ([v7 containsObject:v14] & 1) != 0)
            {
              continue;
            }
            [v7 addObject:v14];
            LOBYTE(v29) = 1;
          }
          uint64_t v17 = (void *)SBSCopyDisplayIdentifiersForExternalAccessoryProtocol();
          id v18 = v17;
          if (!v17 || ![v17 count]) {
            BYTE4(v29) = 1;
          }
        }
      }
    }
    id v9 = [a3 countByEnumeratingWithState:&v34 objects:v39 count:16];
  }
  while (v9);
  if ((v29 & 0x100000000) == 0)
  {
    id v5 = v28;
    uint64_t v20 = &xpc_connection_cancel_ptr;
LABEL_27:
    if (v29)
    {
      id v21 = [v20[190] arrayWithArray:v6];
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v22 = [v7 countByEnumeratingWithState:&v30 objects:v38 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v31;
        do
        {
          for (j = 0; j != v23; j = (char *)j + 1)
          {
            if (*(void *)v31 != v24) {
              objc_enumerationMutation(v7);
            }
            [v21 addObject:*(void *)(*((void *)&v30 + 1) + 8 * (void)j)];
          }
          id v23 = [v7 countByEnumeratingWithState:&v30 objects:v38 count:16];
        }
        while (v23);
      }
      if ((v29 & 0x100000000) != 0)
      {
        long long v26 = +[NSNumber numberWithUnsignedInteger:dword_10013BAC8];
        if (((unint64_t)&self->_connectedAccessoriesLock & 7) != 0) {
          goto LABEL_46;
        }
        long long v27 = v26;
        [(NSLock *)self->_connectedAccessoriesLock lock];
        if (((unint64_t)&self->_connectedAccessories & 7) != 0) {
          goto LABEL_46;
        }
        objc_msgSend(-[NSMutableDictionary objectForKey:](self->_connectedAccessories, "objectForKey:", v27), "setObject:forKey:", v21, @"OptionalSDKProtocolsShownKey");
        [(NSLock *)self->_connectedAccessoriesLock unlock];
      }
      else
      {
        +[EAManager _updatePlistWithAccessoryProtocolsInternal:v21];
      }
      id v5 = v28;
    }
LABEL_41:
    if (v6) {
      CFRelease(v6);
    }

    return;
  }
  uint64_t v19 = sub_1000194D0();
  uint64_t v20 = &xpc_connection_cancel_ptr;
  if (v19 && (v19 & 7) == 0)
  {
    sub_10001B134(v19, dword_10013BAC8);
    id v5 = v28;
    goto LABEL_27;
  }
LABEL_46:
  __break(0x5516u);
}

- (void)applicationStateChanged:(id)a3
{
  id v5 = objc_msgSend(objc_msgSend(a3, "objectForKey:", BKSApplicationStateKey), "intValue");
  id v6 = [a3 objectForKey:BKSApplicationStateDisplayIDKey];
  id v7 = objc_msgSend(objc_msgSend(a3, "objectForKey:", BKSApplicationStateProcessIDKey), "intValue");
  id v8 = v7;
  CFStringRef v9 = @"running in the background";
  CFStringRef v10 = @"running the foreground";
  CFStringRef v11 = @"switching to other state";
  if (v5 == 1) {
    CFStringRef v11 = @"terminated";
  }
  if (v5 != 8) {
    CFStringRef v10 = v11;
  }
  if (v5 != 4) {
    CFStringRef v9 = v10;
  }
  unint64_t v12 = (unint64_t)v5;
  if (v5 == 2) {
    CFStringRef v13 = @"suspending";
  }
  else {
    CFStringRef v13 = v9;
  }
  sub_1000EE49C(3u, @"process %@ (pid %d) is now %@", v6, v7, v13);
  if (((unint64_t)&self->_clientLock & 7) != 0
    || ([(NSLock *)self->_clientLock lock],
        long long v77 = 0u,
        long long v78 = 0u,
        long long v75 = 0u,
        long long v76 = 0u,
        p_clients = (id *)&self->_clients,
        ((unint64_t)&self->_clients & 7) != 0))
  {
LABEL_70:
    __break(0x5516u);
  }
  id v15 = *p_clients;
  id v16 = [*p_clients countByEnumeratingWithState:&v75 objects:v83 count:16];
  if (v16)
  {
    id v17 = v16;
    p_connectedAccessories = (id *)&self->_connectedAccessories;
    unint64_t v52 = (unint64_t)&self->_connectedAccessories & 7;
    uint64_t v18 = *(void *)v76;
    p_connectedAccessoriesLock = &self->_connectedAccessoriesLock;
    id v50 = v8;
    uint64_t v48 = *(void *)v76;
    id v49 = v15;
    unsigned int v51 = v12;
    id v47 = v6;
    do
    {
      uint64_t v19 = 0;
      id v53 = v17;
      do
      {
        if (*(void *)v76 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = [*p_clients objectForKey:*(void *)(*((void *)&v75 + 1) + 8 * (void)v19)];
        if (objc_msgSend(v6, "caseInsensitiveCompare:", objc_msgSend(v20, "bundleId"))) {
          goto LABEL_23;
        }
        if ([v20 processID] != v8)
        {
          sub_1000EE49C(3u, @"%s:%s-%d terminated app %@ pid %d does not match cached pid %d", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/EAManager.mm", "-[EAManager applicationStateChanged:]", 1756, v6, v8, [v20 processID]);
          goto LABEL_23;
        }
        [v20 setApplicationState:v12];
        if (v12 == 2)
        {
          if (([v20 capabilities] & 0x10) != 0) {
            goto LABEL_23;
          }
LABEL_29:
          id v57 = v20;
          sub_1000EE49C(3u, @"closing sessions for process %@", v6);
          long long v73 = 0u;
          long long v74 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          if (v52) {
            goto LABEL_70;
          }
          unint64_t v54 = v19;
          id obj = *p_connectedAccessories;
          id v21 = [*p_connectedAccessories countByEnumeratingWithState:&v71 objects:v82 count:16];
          if (v21)
          {
            id v22 = v21;
            uint64_t v23 = *(void *)v72;
            do
            {
              for (uint64_t i = 0; i != v22; uint64_t i = (char *)i + 1)
              {
                if (*(void *)v72 != v23) {
                  objc_enumerationMutation(obj);
                }
                id v25 = objc_msgSend(objc_msgSend(objc_msgSend(*p_connectedAccessories, "objectForKey:", *(void *)(*((void *)&v71 + 1) + 8 * i)), "objectForKey:", @"EAManagerAccessorySessions"), "sessionsForClientID:", objc_msgSend(v20, "clientID"));
                long long v67 = 0u;
                long long v68 = 0u;
                long long v69 = 0u;
                long long v70 = 0u;
                id v26 = [v25 countByEnumeratingWithState:&v67 objects:v81 count:16];
                if (v26)
                {
                  id v27 = v26;
                  uint64_t v28 = *(void *)v68;
                  do
                  {
                    for (j = 0; j != v27; j = (char *)j + 1)
                    {
                      if (*(void *)v68 != v28) {
                        objc_enumerationMutation(v25);
                      }
                      -[EAManager closeSessionForConnectionID:sessionID:notifyApp:](self, "closeSessionForConnectionID:sessionID:notifyApp:", [*(id *)(*((void *)&v67 + 1) + 8 * (void)j) connectionID], objc_msgSend(*(id *)(*((void *)&v67 + 1) + 8 * (void)j), "sessionID"), 0);
                    }
                    id v27 = [v25 countByEnumeratingWithState:&v67 objects:v81 count:16];
                  }
                  while (v27);
                }
                id v20 = v57;
              }
              id v22 = [obj countByEnumeratingWithState:&v71 objects:v82 count:16];
            }
            while (v22);
          }
          unint64_t v12 = v51;
          id v6 = v47;
          uint64_t v18 = v48;
          p_clients = (id *)&self->_clients;
          id v8 = v50;
          id v15 = v49;
          id v17 = v53;
          uint64_t v19 = v54;
          if (v51 == 1) {
            goto LABEL_23;
          }
          if (([v20 capabilities] & 0x10) == 0
            && ([v20 capabilities] & 0x20) != 0)
          {
            [v20 setClientRequiresAccReset:1];
          }
LABEL_48:
          if (v12 != 8 && v12 != 4) {
            goto LABEL_23;
          }
          goto LABEL_50;
        }
        if (v12 != 4)
        {
          if (v12 == 1) {
            goto LABEL_29;
          }
          goto LABEL_48;
        }
        if (([v20 capabilities] & 0x20) == 0) {
          goto LABEL_29;
        }
LABEL_50:
        if ([v20 clientRequiresAccReset])
        {
          long long v30 = v20;
          id v31 = objc_alloc_init((Class)NSMutableArray);
          sub_1000EE49C(3u, @"%s:%s-%d reconnecting accessory for running process %@\n", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/EAManager.mm", "-[EAManager applicationStateChanged:]", 1729, v6);
          long long v32 = v30;
          [v30 setClientRequiresAccReset:0];
          if (((unint64_t)&self->_connectedAccessoriesLock & 7) != 0) {
            goto LABEL_70;
          }
          [(NSLock *)*p_connectedAccessoriesLock lock];
          id v33 = objc_alloc_init((Class)NSAutoreleasePool);
          long long v63 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          if (v52) {
            goto LABEL_70;
          }
          long long v34 = v33;
          unint64_t v55 = v19;
          id v35 = *p_connectedAccessories;
          id v36 = [*p_connectedAccessories countByEnumeratingWithState:&v63 objects:v80 count:16];
          if (v36)
          {
            id v37 = v36;
            uint64_t v38 = *(void *)v64;
            do
            {
              for (k = 0; k != v37; k = (char *)k + 1)
              {
                if (*(void *)v64 != v38) {
                  objc_enumerationMutation(v35);
                }
                id v40 = +[EAManager newPlistForAccessory:](EAManager, "newPlistForAccessory:", +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", [*p_connectedAccessories objectForKey:*(void *)(*((void *)&v63 + 1) + 8 * (void)k)]));
                [v31 addObject:v40];
              }
              id v37 = [v35 countByEnumeratingWithState:&v63 objects:v80 count:16];
            }
            while (v37);
          }

          [(NSLock *)*p_connectedAccessoriesLock unlock];
          long long v61 = 0u;
          long long v62 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          id v41 = [v31 countByEnumeratingWithState:&v59 objects:v79 count:16];
          id v17 = v53;
          uint64_t v18 = v48;
          if (v41)
          {
            id v42 = v41;
            uint64_t v43 = *(void *)v60;
            do
            {
              for (m = 0; m != v42; m = (char *)m + 1)
              {
                if (*(void *)v60 != v43) {
                  objc_enumerationMutation(v31);
                }
                [(EAManager *)self notifyEAClient:v32 ofAccessoryEvent:"EAProtocolAccessoryReconnected" accessory:*(void *)(*((void *)&v59 + 1) + 8 * (void)m)];
              }
              id v42 = [v31 countByEnumeratingWithState:&v59 objects:v79 count:16];
            }
            while (v42);
          }

          p_clients = (id *)&self->_clients;
          id v8 = v50;
          id v15 = v49;
          uint64_t v19 = v55;
          unint64_t v12 = v51;
        }
LABEL_23:
        uint64_t v19 = (char *)v19 + 1;
      }
      while (v19 != v17);
      id v45 = [v15 countByEnumeratingWithState:&v75 objects:v83 count:16];
      id v17 = v45;
    }
    while (v45);
  }
  [(NSLock *)self->_clientLock unlock];
}

- (void)takeProcessAssertionForBundleID:(id)a3
{
  id v4 = [[IAPEAUnregisteredClient alloc] initWithBundleId:a3];
  if (v4)
  {
    id v6 = v4;
    [(IAPEAUnregisteredClient *)v4 takeProcessAssertion:@"external-accessory.connect"];
    id v5 = objc_msgSend(objc_alloc((Class)NSTimer), "initWithFireDate:interval:target:selector:userInfo:repeats:", +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 10.0), self, "_unregisteredClientAssertionTimerFired:", v6, 0, 0.0);
    [+[NSRunLoop mainRunLoop] addTimer:v5 forMode:NSDefaultRunLoopMode];
  }
}

- (void)_dpServiceWithFirmwareVersionFound:(id)a3
{
  id v15 = objc_msgSend(+[IAPServer sharedIAPServer](IAPServer, "sharedIAPServer", a3), "dpFirmwareVersion");
  if (v15)
  {
    p_connectedAccessoriesLock = &self->_connectedAccessoriesLock;
    if (((unint64_t)&self->_connectedAccessoriesLock & 7) != 0
      || ([(NSLock *)self->_connectedAccessoriesLock lock],
          long long v18 = 0u,
          long long v19 = 0u,
          long long v16 = 0u,
          long long v17 = 0u,
          p_connectedAccessories = (id *)&self->_connectedAccessories,
          ((unint64_t)&self->_connectedAccessories & 7) != 0))
    {
      __break(0x5516u);
    }
    id v5 = *p_connectedAccessories;
    id v6 = [*p_connectedAccessories countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v17;
      uint64_t v9 = IAPAppAccessoryFirmwareRevisionKey;
      uint64_t v10 = IAPAppAccessoryManufacturerKey;
      do
      {
        for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          id v12 = [*p_connectedAccessories objectForKey:*(void *)(*((void *)&v16 + 1) + 8 * i)];
          id v13 = [v12 objectForKey:v9];
          if (!objc_msgSend(objc_msgSend(v12, "objectForKey:", v10), "compare:", @"Apple") {
            && [v13 rangeOfString:@" ("]
          }
          {
            [v12 setObject:objc_msgSend(v13, "stringByAppendingFormat:", @" (%@)", v15), v9 forKey];
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }
    [(NSLock *)*p_connectedAccessoriesLock unlock];
  }
}

- (void)_takeClientAssertionsForAccessoryConnection
{
  p_clientLock = &self->_clientLock;
  if (((unint64_t)&self->_clientLock & 7) != 0
    || ([(NSLock *)self->_clientLock lock],
        long long v13 = 0u,
        long long v14 = 0u,
        long long v11 = 0u,
        long long v12 = 0u,
        p_clients = (id *)&self->_clients,
        ((unint64_t)&self->_clients & 7) != 0))
  {
    __break(0x5516u);
  }
  id obj = *p_clients;
  id v4 = [*p_clients countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        NSLog(@"%s:%s-%d client %@\n", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/EAManager.mm", "-[EAManager _takeClientAssertionsForAccessoryConnection]", 1803, objc_msgSend(objc_msgSend(*p_clients, "objectForKey:", v8), "bundleId"));
        objc_msgSend(objc_msgSend(*p_clients, "objectForKey:", v8), "takeProcessAssertion:", @"external-accessory.connect");
      }
      id v5 = [obj countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  [(NSLock *)*p_clientLock unlock];
}

- (void)_takeClientAssertionsForAccessoryDisconnection
{
  p_clientLock = &self->_clientLock;
  if (((unint64_t)&self->_clientLock & 7) != 0
    || ([(NSLock *)self->_clientLock lock],
        long long v13 = 0u,
        long long v14 = 0u,
        long long v11 = 0u,
        long long v12 = 0u,
        p_clients = (id *)&self->_clients,
        ((unint64_t)&self->_clients & 7) != 0))
  {
    __break(0x5516u);
  }
  id v5 = *p_clients;
  id v6 = [*p_clients countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*p_clients, "objectForKey:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
        [v10 takeProcessAssertion:@"external-accessory.disconnect"];
        [v10 setClientRequiresAccReset:0];
      }
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  [(NSLock *)*p_clientLock unlock];
}

- (void)_unregisteredClientAssertionTimerFired:(id)a3
{
  id v3 = [a3 userInfo];
  [v3 releaseProcessAssertion];
  sub_1000EE49C(3u, @"%s::%s process assertion for unregistered client %@ should be released", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/EAManager.mm", "-[EAManager _unregisteredClientAssertionTimerFired:]", [v3 bundleId]);
}

- (BOOL)_isProtocolContainedInWhitelist:(id)a3
{
  if (![a3 caseInsensitiveCompare:@"com.apple.iPodOut"]) {
    return 1;
  }
  uint64_t v7 = 0;
  NSUInteger v4 = -[NSRegularExpression numberOfMatchesInString:options:range:](+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", IAPEAWhitelistedProtocolRegex, 1, &v7), "numberOfMatchesInString:options:range:", a3, 0, 0, [a3 length]);
  BOOL v5 = v4 != 0;
  if (v4) {
    sub_1000EE49C(3u, @"%s:%s found whitelisted protocol %@", "/Library/Caches/com.apple.xbs/Sources/iapd/iapd/EAManager.mm", "-[EAManager _isProtocolContainedInWhitelist:]", a3);
  }
  return v5;
}

- (void)updatePlistWithProtocolsForAccessory:(id)a3
{
  id v3 = [a3 objectForKey:@"OptionalSDKProtocolsShownKey"];
  +[EAManager _updatePlistWithAccessoryProtocolsInternal:v3];
}

+ (void)_updatePlistWithAccessoryProtocolsInternal:(id)a3
{
  if (a3)
  {
    CFPreferencesSetAppValue(@"OptionalSDKProtocolsShownKey", a3, @"com.apple.iapd");
    CFPreferencesSynchronize(@"com.apple.iapd", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  }
}

- (BOOL)fakedLocationDeviceFilteringSupport
{
  unsigned int fakedLocationDeviceFilteringSupport = self->_fakedLocationDeviceFilteringSupport;
  if (fakedLocationDeviceFilteringSupport >= 2) {
    __break(0x550Au);
  }
  else {
    LOBYTE(self) = fakedLocationDeviceFilteringSupport != 0;
  }
  return (char)self;
}

- (void)setFakedLocationDeviceFilteringSupport:(BOOL)a3
{
  self->_unsigned int fakedLocationDeviceFilteringSupport = a3;
}

- (void).cxx_destruct
{
  uint64_t p_connectionIDMap = (uint64_t)&self->_connectionIDMap;
  if ((p_connectionIDMap & 7) != 0) {
    __break(0x5516u);
  }
  else {
    sub_10000C538(p_connectionIDMap);
  }
}

- (id).cxx_construct
{
  id result = &self->_connectionIDMap;
  if ((result & 7) != 0)
  {
    __break(0x5516u);
  }
  else
  {
    sub_10000C500(result);
    return self;
  }
  return result;
}

- (void)notifyEAClient:(id)a3 ofAccessoryEvent:(const char *)a4 accessory:(id)a5
{
  unsigned int v8 = [a3 canSendConnectionEventForAccessory:a5];
  sub_1000EE49C(3u, @"eaClientToNotify bundle = %@, request = %s, canSendConnectionEvent = %d", [a3 bundleId], a4, v8);
  if (v8)
  {
    uint64_t v9 = +[NSPropertyListSerialization dataWithPropertyList:a5 format:200 options:0 error:0];
    xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
    if (a4
      && (long long v11 = v10) != 0
      && (xpc_dictionary_set_string(v10, "requestType", a4), (id v12 = [(NSData *)v9 bytes]) != 0)
      && (xpc_dictionary_set_data(v11, "EAProtocolAccessoryPlistData", v12, [(NSData *)v9 length]),
          (long long v13 = (_xpc_connection_s *)[a3 xpcConnection]) != 0))
    {
      xpc_connection_send_message(v13, v11);
      xpc_release(v11);
    }
    else
    {
      __break(0x5510u);
    }
  }
}

- (void)notifyEAClient:(id)a3 ofNotificationName:(const char *)a4 withPayload:(id)a5
{
  if (!a3 || !a4)
  {
    sub_1000EE49C(3u, @"%s: Received nil param. eaClientToNotify %@ notificationName %s", "-[EAManager(EAManagerClientExtensions) notifyEAClient:ofNotificationName:withPayload:]", a3, a4);
    return;
  }
  unsigned int v8 = [a3 canSendConnectionEventForAccessory:a5];
  sub_1000EE49C(3u, @"eaClientToNotify bundle = %@, request = %s, canSendConnectionEvent = %d", [a3 bundleId], a4, v8);
  if (!v8) {
    return;
  }
  if (a5) {
    uint64_t v9 = +[NSPropertyListSerialization dataWithPropertyList:a5 format:200 options:0 error:0];
  }
  else {
    uint64_t v9 = 0;
  }
  sub_1000EE49C(3u, @"eaClientToNotify bundle = %@, request = %s, notificationName = %s, notificationPayload=%@", [a3 bundleId], "kXPCACCNotificationKey", a4, a5);
  xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
  if (!v10) {
    goto LABEL_17;
  }
  long long v11 = v10;
  xpc_dictionary_set_string(v10, "requestType", "kXPCACCNotificationKey");
  xpc_dictionary_set_string(v11, "kXPCACCNotificationNameKey", a4);
  if (!v9) {
    goto LABEL_13;
  }
  id v12 = [(NSData *)v9 bytes];
  if (!v12)
  {
LABEL_17:
    __break(0x5510u);
    return;
  }
  xpc_dictionary_set_data(v11, "kXPCACCNotificationPlistData", v12, [(NSData *)v9 length]);
LABEL_13:
  long long v13 = (_xpc_connection_s *)[a3 xpcConnection];
  if (!v13) {
    goto LABEL_17;
  }
  xpc_connection_send_message(v13, v11);
  xpc_release(v11);
}

- (void)notifyEAClientsOfAccessoryEvent:(const char *)a3 accessory:(id)a4
{
  if (!self
    || (p_clientLock = &self->_clientLock, ((unint64_t)&self->_clientLock & 7) != 0)
    || ([(NSLock *)*p_clientLock lock],
        long long v16 = 0u,
        long long v17 = 0u,
        long long v14 = 0u,
        long long v15 = 0u,
        p_clients = (id *)&self->_clients,
        ((unint64_t)&self->_clients & 7) != 0))
  {
    __break(0x5516u);
  }
  id v9 = *p_clients;
  id v10 = [*p_clients countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        -[EAManager notifyEAClient:ofAccessoryEvent:accessory:](self, "notifyEAClient:ofAccessoryEvent:accessory:", objc_msgSend(*p_clients, "objectForKey:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14), a3, a4);
      }
      id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
  [(NSLock *)*p_clientLock unlock];
}

- (void)sendToEALocationClientsNotification:(const char *)a3 withPayload:(id)a4
{
  if (!self
    || (p_clientLock = &self->_clientLock, ((unint64_t)&self->_clientLock & 7) != 0)
    || ([(NSLock *)*p_clientLock lock],
        long long v17 = 0u,
        long long v18 = 0u,
        long long v15 = 0u,
        long long v16 = 0u,
        p_clients = (id *)&self->_clients,
        ((unint64_t)&self->_clients & 7) != 0))
  {
    __break(0x5516u);
  }
  id v9 = *p_clients;
  id v10 = [*p_clients countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = objc_msgSend(*p_clients, "objectForKey:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        if ([v14 locationSupportedByClient]) {
          [(EAManager *)self notifyEAClient:v14 ofNotificationName:a3 withPayload:a4];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
  [(NSLock *)*p_clientLock unlock];
}

- (void)notifyEAClientsOfAccessoryConnection:(id)a3
{
}

- (void)notifyEAClientsOfAccessoryDisconnection:(id)a3
{
}

- (void)notifyEAClientsOfAccessoryReconnection:(id)a3
{
}

- (void)notifyEAClientsOfAccessoryUpdated:(id)a3
{
}

- (void)notifyEAClientsOfAccessoryPortPropertyChanged:(id)a3
{
}

- (void)notifyEALocationClientsOfIAPLocationDidReceiveNMEASentenceNotification:(id)a3
{
  id v5 = [IAPLocationDidReceiveNMEASentenceNotification UTF8String];
  [(EAManager *)self sendToEALocationClientsNotification:v5 withPayload:a3];
}

- (void)notifyEALocationClientsOfIAPLocationDidReceiveLocationPointDataNotification:(id)a3
{
  id v5 = [IAPLocationDidReceiveLocationPointDataNotification UTF8String];
  [(EAManager *)self sendToEALocationClientsNotification:v5 withPayload:a3];
}

- (void)notifyEALocationClientsOfIAPLocationDidReceiveEphemerisURLNotification:(id)a3
{
  id v5 = [IAPLocationDidReceiveEphemerisURLNotification UTF8String];
  [(EAManager *)self sendToEALocationClientsNotification:v5 withPayload:a3];
}

- (void)notifyEALocationClientsOfIAPLocationDidReceiveEphemerisMaxIntervalNotification:(id)a3
{
  id v5 = [IAPLocationDidReceiveEphemerisMaxIntervalNotification UTF8String];
  [(EAManager *)self sendToEALocationClientsNotification:v5 withPayload:a3];
}

- (void)notifyEALocationClientsOfIAPLocationDidReceiveEphemerisRecommendedRefreshNotification:(id)a3
{
  id v5 = [IAPLocationDidReceiveEphemerisRecommendedRefreshNotification UTF8String];
  [(EAManager *)self sendToEALocationClientsNotification:v5 withPayload:a3];
}

- (void)notifyEALocationClientsOfIAPLocationDidRequestGPSTimeNotification:(id)a3
{
  id v5 = [IAPLocationDidRequestGPSTimeNotification UTF8String];
  [(EAManager *)self sendToEALocationClientsNotification:v5 withPayload:a3];
}

- (void)notifyEALocationClientsOfIAPLocationAccessoryNMEASentenceFilteringSupportChangedNotification:(id)a3
{
  id v5 = [IAPLocationAccessoryNMEASentenceFilteringSupportChangedNotification UTF8String];
  [(EAManager *)self sendToEALocationClientsNotification:v5 withPayload:a3];
}

@end