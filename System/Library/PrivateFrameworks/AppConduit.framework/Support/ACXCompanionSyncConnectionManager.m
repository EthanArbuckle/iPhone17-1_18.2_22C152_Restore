@interface ACXCompanionSyncConnectionManager
+ (id)sharedConnectionManager;
- (ACXCompanionSyncConnectionManager)init;
- (ACXIDSMessaging)currentMessagingService;
- (ACXIDSMessaging)legacyMessagingService;
- (NSMutableDictionary)connectionMap;
- (OS_dispatch_queue)internalQueue;
- (id)connectionForActivePairedDevice;
- (id)connectionForDevice:(id)a3;
- (void)devicesAreNoLongerConnected:(id)a3;
- (void)devicesAreNowConnected:(id)a3;
- (void)incomingMessage:(id)a3 fromDevice:(id)a4;
- (void)newDevices:(id)a3 removedDevices:(id)a4;
@end

@implementation ACXCompanionSyncConnectionManager

+ (id)sharedConnectionManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000175E4;
  block[3] = &unk_10008CBD8;
  block[4] = a1;
  if (qword_1000A5568 != -1) {
    dispatch_once(&qword_1000A5568, block);
  }
  v2 = (void *)qword_1000A5560;

  return v2;
}

- (ACXCompanionSyncConnectionManager)init
{
  v16.receiver = self;
  v16.super_class = (Class)ACXCompanionSyncConnectionManager;
  v2 = [(ACXCompanionSyncConnectionManager *)&v16 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.appconduit.CompanionSyncConnectionManager", v3);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = objc_opt_new();
    connectionMap = v2->_connectionMap;
    v2->_connectionMap = (NSMutableDictionary *)v6;

    uint64_t v8 = +[ACXIDSMessaging messagerWithIDSServiceName:@"com.apple.private.alloy.appsyncconduit"];
    legacyMessagingService = v2->_legacyMessagingService;
    v2->_legacyMessagingService = (ACXIDSMessaging *)v8;

    uint64_t v10 = +[ACXIDSMessaging messagerWithIDSServiceName:@"com.apple.private.alloy.appsyncconduit.v2"];
    currentMessagingService = v2->_currentMessagingService;
    v2->_currentMessagingService = (ACXIDSMessaging *)v10;

    v12 = +[ACXDeviceManager sharedManager];
    [v12 setLegacyMessagingService:v2->_legacyMessagingService currentMessagingService:v2->_currentMessagingService];
    [v12 setDelegate:v2];
    v13 = [(ACXCompanionSyncConnectionManager *)v2 legacyMessagingService];
    [v13 setDeviceManager:v12 delegate:v2];

    v14 = [(ACXCompanionSyncConnectionManager *)v2 currentMessagingService];
    [v14 setDeviceManager:v12 delegate:v2];
  }
  return v2;
}

- (id)connectionForActivePairedDevice
{
  v3 = +[ACXDeviceManager sharedManager];
  dispatch_queue_t v4 = [v3 currentActivePairedDevice];

  if (v4)
  {
    v5 = [(ACXCompanionSyncConnectionManager *)self connectionForDevice:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)connectionForDevice:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_100017938;
  objc_super v16 = sub_100017948;
  id v17 = 0;
  v5 = [(ACXCompanionSyncConnectionManager *)self internalQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017950;
  block[3] = &unk_10008CA18;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)incomingMessage:(id)a3 fromDevice:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = +[ACXDeviceManager sharedManager];
  uint64_t v8 = [v7 deviceForIDSIdentifier:v6];

  if (v8)
  {
    v9 = [(ACXCompanionSyncConnectionManager *)self connectionForDevice:v8];
    id v10 = v9;
    if (v9)
    {
      [v9 handleIncomingMessage:v11];
    }
    else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      MOLogWrite();
    }
  }
  else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
  {
    MOLogWrite();
  }
}

- (void)newDevices:(id)a3 removedDevices:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v58 objects:v63 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v59;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v59 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
        {
          uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v58 + 1) + 8 * i), "idsDeviceIdentifier", v34, v36);
          [v11 pairingID];
          v36 = v34 = v12;
          MOLogWrite();
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v58 objects:v63 count:16];
    }
    while (v8);
  }
  v46 = v6;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = v5;
  id v50 = [obj countByEnumeratingWithState:&v54 objects:v62 count:16];
  if (v50)
  {
    uint64_t v49 = *(void *)v55;
    do
    {
      for (j = 0; j != v50; j = (char *)j + 1)
      {
        if (*(void *)v55 != v49) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v54 + 1) + 8 * (void)j);
        v15 = objc_msgSend(v14, "productType", v34, v36);
        objc_super v16 = [v14 osVersion];
        id v17 = [v14 osBuildVersion];
        v18 = [v14 watchSize];
        if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
        {
          v52 = [v14 idsDeviceIdentifier];
          v51 = [v14 pairingID];
          v53 = [v14 messager];
          v19 = [v53 serviceName];
          v20 = v18;
          v21 = v16;
          v22 = v15;
          int v23 = sub_100008300((int)[v14 isActivePairedDevice]);
          v24 = v17;
          int v25 = sub_100008300((int)[v14 isConnected]);
          int v26 = sub_100008300((int)[v14 supportsStandaloneApps]);
          uint64_t v27 = v25;
          id v17 = v24;
          uint64_t v44 = v27;
          uint64_t v45 = v26;
          uint64_t v28 = v23;
          v15 = v22;
          objc_super v16 = v21;
          v18 = v20;
          v42 = v19;
          uint64_t v43 = v28;
          v40 = v16;
          v41 = v24;
          v38 = v15;
          v39 = v20;
          v35 = v52;
          v37 = v51;
          MOLogWrite();
        }
        if (objc_msgSend(v14, "isActivePairedDevice", v35, v37, v38, v39, v40, v41, v42, v43, v44, v45, v46))
        {
          v29 = [(ACXCompanionSyncConnectionManager *)self connectionForDevice:v14];
          if ([v14 isReachable])
          {
            [v14 idsDeviceIdentifier];
            v31 = v30 = v18;
            v32 = [v14 pairingID];
            v33 = +[NSString stringWithFormat:@"device %@ (pairing ID %@) appeared", v31, v32];

            v18 = v30;
            [v29 performReunionSyncWithReason:v33];
          }
        }
      }
      id v50 = [obj countByEnumeratingWithState:&v54 objects:v62 count:16];
    }
    while (v50);
  }
}

- (void)devicesAreNowConnected:(id)a3
{
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = a3;
  id v27 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v27)
  {
    uint64_t v26 = *(void *)v31;
    do
    {
      for (i = 0; i != v27; i = (char *)i + 1)
      {
        if (*(void *)v31 != v26) {
          objc_enumerationMutation(obj);
        }
        id v4 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v5 = objc_msgSend(v4, "productType", v16, v17, v18, v19, v20, v21, v22, v23, v24);
        id v6 = [v4 osVersion];
        id v7 = [v4 osBuildVersion];
        id v8 = [v4 watchSize];
        if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
        {
          v29 = [v4 idsDeviceIdentifier];
          uint64_t v28 = [v4 pairingID];
          uint64_t v9 = v8;
          id v10 = v7;
          id v11 = v6;
          uint64_t v12 = v5;
          int v13 = sub_100008300((int)[v4 supportsStandaloneApps]);
          uint64_t v14 = [v4 messager];
          int v23 = [v14 serviceName];
          uint64_t v24 = (int)sub_100008300((int)[v4 isActivePairedDevice]);
          uint64_t v15 = v13;
          id v5 = v12;
          id v6 = v11;
          id v7 = v10;
          id v8 = v9;
          v21 = v7;
          uint64_t v22 = v15;
          v19 = v9;
          v20 = v6;
          id v17 = v28;
          v18 = v5;
          objc_super v16 = v29;
          MOLogWrite();
        }
      }
      id v27 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v27);
  }
}

- (void)devicesAreNoLongerConnected:(id)a3
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = a3;
  id v3 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
        {
          id v8 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "idsDeviceIdentifier", v11, v12, v13, v14);
          uint64_t v9 = [v7 pairingID];
          id v10 = [v7 messager];
          int v13 = [v10 serviceName];
          uint64_t v14 = (int)sub_100008300((int)[v7 isActivePairedDevice]);
          id v11 = v8;
          uint64_t v12 = v9;
          MOLogWrite();
        }
      }
      id v4 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (NSMutableDictionary)connectionMap
{
  return self->_connectionMap;
}

- (ACXIDSMessaging)legacyMessagingService
{
  return self->_legacyMessagingService;
}

- (ACXIDSMessaging)currentMessagingService
{
  return self->_currentMessagingService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentMessagingService, 0);
  objc_storeStrong((id *)&self->_legacyMessagingService, 0);
  objc_storeStrong((id *)&self->_connectionMap, 0);

  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end