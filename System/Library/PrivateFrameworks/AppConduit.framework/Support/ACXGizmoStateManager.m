@interface ACXGizmoStateManager
+ (id)sharedStateManager;
- (ACXGizmoStateManager)init;
- (NSMutableDictionary)stateMap;
- (OS_dispatch_queue)internalQueue;
- (id)stateForActivePairedDevice;
- (id)stateForDevice:(id)a3;
- (id)stateForPairingID:(id)a3;
- (void)noteDatabaseRebuild;
- (void)noteNewApps:(id)a3 updatedApps:(id)a4 removedApps:(id)a5 transitioningAppBundleIDs:(id)a6;
- (void)noteTrustObtainedForApps:(id)a3 trustRemovedForApps:(id)a4;
@end

@implementation ACXGizmoStateManager

+ (id)sharedStateManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001BE30;
  block[3] = &unk_10008CBD8;
  block[4] = a1;
  if (qword_1000A5590 != -1) {
    dispatch_once(&qword_1000A5590, block);
  }
  v2 = (void *)qword_1000A5588;

  return v2;
}

- (ACXGizmoStateManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)ACXGizmoStateManager;
  v2 = [(ACXGizmoStateManager *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.appconduit.GizmoStateManager", v3);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = objc_opt_new();
    stateMap = v2->_stateMap;
    v2->_stateMap = (NSMutableDictionary *)v6;
  }
  return v2;
}

- (id)stateForDevice:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x3032000000;
    v18 = sub_10001C07C;
    v19 = sub_10001C08C;
    id v20 = 0;
    uint64_t v6 = [v4 pairingID];
    v7 = [(ACXGizmoStateManager *)self internalQueue];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10001C094;
    v11[3] = &unk_10008D4D8;
    v14 = &v15;
    v11[4] = self;
    id v12 = v6;
    id v13 = v5;
    id v8 = v6;
    dispatch_sync(v7, v11);

    id v9 = (id)v16[5];
    _Block_object_dispose(&v15, 8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)stateForPairingID:(id)a3
{
  id v4 = a3;
  v5 = +[ACXDeviceManager sharedManager];
  uint64_t v6 = [v5 deviceForPairingID:v4];

  v7 = [(ACXGizmoStateManager *)self stateForDevice:v6];

  return v7;
}

- (id)stateForActivePairedDevice
{
  v3 = +[ACXDeviceManager sharedManager];
  id v4 = [v3 currentActivePairedDevice];
  v5 = [(ACXGizmoStateManager *)self stateForDevice:v4];

  return v5;
}

- (void)noteNewApps:(id)a3 updatedApps:(id)a4 removedApps:(id)a5 transitioningAppBundleIDs:(id)a6
{
  id v46 = a3;
  id v52 = a4;
  id v45 = a5;
  id v49 = a6;
  v10 = +[ACXDeviceManager sharedManager];
  v11 = [v10 allDevices];

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id obj = v11;
  id v12 = [obj countByEnumeratingWithState:&v64 objects:v70 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v65;
    v42 = v55;
    uint64_t v43 = *(void *)v65;
    v44 = self;
    do
    {
      uint64_t v15 = 0;
      id v47 = v13;
      do
      {
        if (*(void *)v65 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v64 + 1) + 8 * (void)v15);
        uint64_t v17 = -[ACXGizmoStateManager stateForDevice:](self, "stateForDevice:", v16, v41, v42);
        if ([v16 isActivePairedDevice])
        {
          v50 = v16;
          v51 = v15;
          v53 = objc_opt_new();
          v18 = objc_opt_new();
          long long v60 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          id v19 = v46;
          id v20 = [v19 countByEnumeratingWithState:&v60 objects:v69 count:16];
          if (v20)
          {
            id v21 = v20;
            uint64_t v22 = *(void *)v61;
            do
            {
              for (i = 0; i != v21; i = (char *)i + 1)
              {
                if (*(void *)v61 != v22) {
                  objc_enumerationMutation(v19);
                }
                v24 = *(void **)(*((void *)&v60 + 1) + 8 * i);
                v25 = objc_msgSend(v24, "bundleIdentifier", v41);
                v26 = [v17 watchKitAppExecutableHashForBundleID:v25];

                uint64_t v27 = [v24 watchKitAppExecutableHash];
                v28 = (void *)v27;
                if (v26) {
                  BOOL v29 = v27 == 0;
                }
                else {
                  BOOL v29 = 1;
                }
                if (v29 || ![v26 isEqualToString:v27])
                {
                  [v53 addObject:v24];
                }
                else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
                {
                  v41 = [v24 bundleIdentifier];
                  MOLogWrite();
                }
              }
              id v21 = [v19 countByEnumeratingWithState:&v60 objects:v69 count:16];
            }
            while (v21);
          }

          long long v58 = 0u;
          long long v59 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          id v30 = v52;
          id v31 = [v30 countByEnumeratingWithState:&v56 objects:v68 count:16];
          if (v31)
          {
            id v32 = v31;
            uint64_t v33 = *(void *)v57;
            do
            {
              for (j = 0; j != v32; j = (char *)j + 1)
              {
                if (*(void *)v57 != v33) {
                  objc_enumerationMutation(v30);
                }
                v35 = *(void **)(*((void *)&v56 + 1) + 8 * (void)j);
                v36 = objc_msgSend(v35, "bundleIdentifier", v41);
                v37 = [v17 watchKitAppExecutableHashForBundleID:v36];

                uint64_t v38 = [v35 watchKitAppExecutableHash];
                v39 = (void *)v38;
                if (v37) {
                  BOOL v40 = v38 == 0;
                }
                else {
                  BOOL v40 = 1;
                }
                if (v40 || ![v37 isEqualToString:v38])
                {
                  [v18 addObject:v35];
                }
                else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
                {
                  v41 = [v35 bundleIdentifier];
                  MOLogWrite();
                }
              }
              id v32 = [v30 countByEnumeratingWithState:&v56 objects:v68 count:16];
            }
            while (v32);
          }

          v54[0] = _NSConcreteStackBlock;
          v54[1] = 3221225472;
          v55[0] = sub_10001C784;
          v55[1] = &unk_10008CD30;
          v55[2] = v50;
          [v17 noteNewApps:v53 updatedApps:v18 removedApps:v45 transitioningAppBundleIDs:v49 completion:v54];

          uint64_t v14 = v43;
          self = v44;
          id v13 = v47;
          uint64_t v15 = v51;
        }
        else if ([v52 count])
        {
          [v17 noteNewApps:0 updatedApps:v52 removedApps:0 transitioningAppBundleIDs:v49 completion:0];
        }

        uint64_t v15 = (char *)v15 + 1;
      }
      while (v15 != v13);
      id v13 = [obj countByEnumeratingWithState:&v64 objects:v70 count:16];
    }
    while (v13);
  }
}

- (void)noteTrustObtainedForApps:(id)a3 trustRemovedForApps:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[ACXDeviceManager sharedManager];
  id v9 = [v8 currentActivePairedDevice];

  v10 = [(ACXGizmoStateManager *)self stateForDevice:v9];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10001C8FC;
  v12[3] = &unk_10008CD30;
  id v13 = v9;
  id v11 = v9;
  [v10 noteTrustAddedApps:v7 trustRemovedApps:v6 completion:v12];
}

- (void)noteDatabaseRebuild
{
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
    MOLogWrite();
  }
  notify_post((const char *)[@"com.apple.sockpuppet.applications.updated" UTF8String]);
  v2 = +[ACXCompanionSyncConnectionManager sharedConnectionManager];
  id v3 = [v2 connectionForActivePairedDevice];

  [v3 performReunionSyncWithReason:@"database updated"];
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (NSMutableDictionary)stateMap
{
  return self->_stateMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateMap, 0);

  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end