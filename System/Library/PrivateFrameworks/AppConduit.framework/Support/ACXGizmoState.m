@interface ACXGizmoState
- (ACXDevice)device;
- (ACXGizmoState)initWithDevice:(id)a3;
- (BOOL)_init_migrateSockPuppetSettings;
- (BOOL)_onQueue_cleanUpExpiredPendingUpdateStates;
- (BOOL)_onQueue_pendingInstallStateShouldBeIgnoredForApp:(id)a3 existingState:(id)a4 newState:(id)a5;
- (BOOL)_onQueue_setInstallStatusForApps:(id)a3 sendNotification:(BOOL)a4 withUpdatePredicate:(id)a5;
- (BOOL)_onQueue_updatePendingForCompanionApp:(id)a3;
- (BOOL)alwaysInstallApps;
- (BOOL)gizmoIsActivePairedDevice;
- (BOOL)hasCompletedInitialPairedSync;
- (BOOL)initiallyInstallAllApps;
- (BOOL)iterateInstallStatusAndClearNeedsReunionSyncWithIterator:(id)a3 completion:(id)a4;
- (BOOL)needsReunionSync;
- (BOOL)setInstallStatusForApps:(id)a3;
- (BOOL)setInstallStatusForApps:(id)a3 sendNotification:(BOOL)a4 withUpdatePredicate:(id)a5;
- (BOOL)updatePendingForCompanionApp:(id)a3;
- (NPSDomainAccessor)npsDomain;
- (NSDictionary)pendingApps;
- (NSMutableDictionary)appStates;
- (NSMutableSet)pendingAppUpdateStates;
- (OS_dispatch_queue)stateQueue;
- (OS_dispatch_source)cleanUpPendingUpdateStateTimer;
- (id)appStateForApp:(id)a3;
- (id)bundleIDsOfAllInstalledApps;
- (id)preferencesForApplicationWithIdentifier:(id)a3;
- (id)uniqueInstallIDForApp:(id)a3;
- (id)watchKitAppExecutableHashForBundleID:(id)a3;
- (int64_t)exportedAppStateForDeviceState:(unint64_t)a3;
- (unint64_t)installStatusForApp:(id)a3;
- (void)_init_loadState;
- (void)_onQueue_cancelPendingUpdateStateTimer;
- (void)_onQueue_cancelUpdatePendingForCompanionApp:(id)a3;
- (void)_onQueue_saveState;
- (void)_onQueue_setUpPendingUpdateStateTimer;
- (void)_onQueue_setUpdatePendingForCompanionApp:(id)a3;
- (void)_removeSockPuppetSettings;
- (void)cancelUpdatePendingForCompanionApp:(id)a3;
- (void)clearPendingInstallations;
- (void)dumpCurrentStateToLog;
- (void)initialPairedSyncComplete;
- (void)markInstalledAsPending;
- (void)noteNewApps:(id)a3 updatedApps:(id)a4 removedApps:(id)a5 transitioningAppBundleIDs:(id)a6 completion:(id)a7;
- (void)noteTrustAddedApps:(id)a3 trustRemovedApps:(id)a4 completion:(id)a5;
- (void)processNewStatusUpdates:(id)a3 updatedStatusUpdates:(id)a4 removedStatusUpdates:(id)a5 completion:(id)a6;
- (void)purgeInstallStatusForApps:(id)a3;
- (void)regenerateAllUniqueInstallIDs;
- (void)setAppStates:(id)a3;
- (void)setCleanUpPendingUpdateStateTimer:(id)a3;
- (void)setInstallStatus:(unint64_t)a3 forApp:(id)a4 companionBundleID:(id)a5;
- (void)setNeedsReunionSync:(BOOL)a3;
- (void)setUpdatePendingForCompanionApp:(id)a3;
- (void)setWatchKitAppExecutableHash:(id)a3 forApp:(id)a4;
@end

@implementation ACXGizmoState

- (ACXGizmoState)initWithDevice:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ACXGizmoState;
  v6 = [(ACXGizmoState *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.appconduit.GizmoStateQueue", v8);
    stateQueue = v7->_stateQueue;
    v7->_stateQueue = (OS_dispatch_queue *)v9;

    id v11 = objc_alloc((Class)NPSDomainAccessor);
    v12 = [(ACXGizmoState *)v7 device];
    v13 = [v12 nrDevice];
    v14 = (NPSDomainAccessor *)[v11 initWithDomain:@"com.apple.appconduitd.gizmostate" pairedDevice:v13];
    npsDomain = v7->_npsDomain;
    v7->_npsDomain = v14;

    [(ACXGizmoState *)v7 _init_loadState];
  }

  return v7;
}

- (BOOL)gizmoIsActivePairedDevice
{
  v2 = [(ACXGizmoState *)self device];
  unsigned __int8 v3 = [v2 isActivePairedDevice];

  return v3;
}

- (void)_init_loadState
{
  unsigned __int8 v3 = [(ACXGizmoState *)self npsDomain];
  id v4 = [v3 synchronize];

  char v67 = 0;
  id v5 = [(ACXGizmoState *)self npsDomain];
  uint64_t v6 = (uint64_t)[v5 integerForKey:@"AppStateVersion" keyExistsAndHasValidFormat:&v67];

  v7 = [(ACXGizmoState *)self npsDomain];
  self->_needsReunionSync = [v7 BOOLForKey:@"NeedsReunionSync"];

  v8 = [(ACXGizmoState *)self npsDomain];
  dispatch_queue_t v9 = [v8 objectForKey:@"CompletedInitialPairedSync"];

  v10 = [(ACXGizmoState *)self npsDomain];
  id v11 = [v10 objectForKey:@"ApplicationStates"];
  objc_opt_class();
  id v12 = v11;
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  if (v9 || !v13) {
    self->_hasCompletedInitialPairedSync = (sub_1000071C8(v9, 0) & 1) != 0
  }
                                        || [(ACXGizmoState *)self _init_migrateSockPuppetSettings];
  else {
    [(ACXGizmoState *)self initialPairedSyncComplete];
  }
  v14 = objc_opt_new();
  [(ACXGizmoState *)self setAppStates:v14];

  if (v13)
  {
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472;
    v66[2] = sub_100046144;
    v66[3] = &unk_10008DDA0;
    v66[4] = self;
    [v13 enumerateKeysAndObjectsUsingBlock:v66];
  }
  else
  {
    v15 = [(ACXGizmoState *)self npsDomain];
    v16 = [v15 objectForKey:@"ApplicationState"];
    objc_opt_class();
    id v17 = v16;
    if (objc_opt_isKindOfClass()) {
      id v18 = v17;
    }
    else {
      id v18 = 0;
    }

    id v19 = [v18 mutableCopy];
    if (v19)
    {
      if (!v67 || v6 <= 1)
      {
        v64[0] = _NSConcreteStackBlock;
        v64[1] = 3221225472;
        v64[2] = sub_10004628C;
        v64[3] = &unk_10008DDC8;
        id v20 = (id)objc_opt_new();
        id v65 = v20;
        [v19 enumerateKeysAndObjectsUsingBlock:v64];
        long long v62 = 0u;
        long long v63 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        id v21 = v20;
        id v22 = [v21 countByEnumeratingWithState:&v60 objects:v69 count:16];
        if (v22)
        {
          id v23 = v22;
          uint64_t v24 = *(void *)v61;
          do
          {
            for (i = 0; i != v23; i = (char *)i + 1)
            {
              if (*(void *)v61 != v24) {
                objc_enumerationMutation(v21);
              }
              uint64_t v26 = *(void *)(*((void *)&v60 + 1) + 8 * i);
              if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7)
              {
                id v47 = *(id *)(*((void *)&v60 + 1) + 8 * i);
                uint64_t v48 = 5;
                MOLogWrite();
              }
              objc_msgSend(v19, "setObject:forKeyedSubscript:", &off_100097810, v26, v47, v48);
            }
            id v23 = [v21 countByEnumeratingWithState:&v60 objects:v69 count:16];
          }
          while (v23);
        }

        id v13 = 0;
      }
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
        MOLogWrite();
      }
      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472;
      v59[2] = sub_1000462F0;
      v59[3] = &unk_10008DDC8;
      v59[4] = self;
      [v19 enumerateKeysAndObjectsUsingBlock:v59];
      v27 = [(ACXGizmoState *)self npsDomain];
      [v27 removeObjectForKey:@"ApplicationState"];

      v28 = [(ACXGizmoState *)self stateQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000463A8;
      block[3] = &unk_10008CD30;
      block[4] = self;
      dispatch_sync(v28, block);
    }
  }
  v29 = (NSMutableSet *)objc_opt_new();
  pendingAppUpdateStates = self->_pendingAppUpdateStates;
  self->_pendingAppUpdateStates = v29;

  v31 = [(ACXGizmoState *)self npsDomain];
  v32 = [v31 objectForKey:@"PendingAppUpdateStates"];

  objc_opt_class();
  if (sub_1000070BC(v32))
  {
    id v50 = v13;
    v51 = v9;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    v49 = v32;
    id v33 = v32;
    id v34 = [v33 countByEnumeratingWithState:&v54 objects:v68 count:16];
    if (v34)
    {
      id v35 = v34;
      uint64_t v36 = *(void *)v55;
      do
      {
        for (j = 0; j != v35; j = (char *)j + 1)
        {
          if (*(void *)v55 != v36) {
            objc_enumerationMutation(v33);
          }
          uint64_t v38 = *(void *)(*((void *)&v54 + 1) + 8 * (void)j);
          id v39 = objc_alloc((Class)NSKeyedUnarchiver);
          id v53 = 0;
          id v40 = [v39 initForReadingFromData:v38 error:&v53];
          id v41 = v53;
          if (v40)
          {
            v42 = [[ACXPendingAppUpdateState alloc] initWithCoder:v40];
            if (v42)
            {
              v43 = [(ACXGizmoState *)self pendingAppUpdateStates];
              [v43 addObject:v42];
            }
            else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
            {
              MOLogWrite();
            }
          }
          else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
          {
            id v47 = v41;
            MOLogWrite();
          }
        }
        id v35 = [v33 countByEnumeratingWithState:&v54 objects:v68 count:16];
      }
      while (v35);
    }

    id v13 = v50;
    dispatch_queue_t v9 = v51;
    v32 = v49;
  }
  v44 = [(ACXGizmoState *)self pendingAppUpdateStates];
  id v45 = [v44 count];

  if (v45)
  {
    v46 = [(ACXGizmoState *)self stateQueue];
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_1000463B0;
    v52[3] = &unk_10008CD30;
    v52[4] = self;
    sub_100006BB8(v46, v52);
  }
}

- (void)_onQueue_saveState
{
  unsigned __int8 v3 = [(ACXGizmoState *)self npsDomain];
  [v3 setInteger:2 forKey:@"AppStateVersion"];

  id v4 = objc_opt_new();
  id v5 = [(ACXGizmoState *)self appStates];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10004662C;
  v18[3] = &unk_10008DDF0;
  id v6 = v4;
  id v19 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v18];

  v7 = [(ACXGizmoState *)self npsDomain];
  [v7 setBool:self->_hasCompletedInitialPairedSync forKey:@"CompletedInitialPairedSync"];

  v8 = [(ACXGizmoState *)self npsDomain];
  [v8 setObject:v6 forKey:@"ApplicationStates"];

  dispatch_queue_t v9 = [(ACXGizmoState *)self npsDomain];
  [v9 setBool:self->_needsReunionSync forKey:@"NeedsReunionSync"];

  [(ACXGizmoState *)self _onQueue_cleanUpExpiredPendingUpdateStates];
  v10 = objc_opt_new();
  id v11 = [(ACXGizmoState *)self pendingAppUpdateStates];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100046764;
  v16[3] = &unk_10008DE18;
  id v12 = v10;
  id v17 = v12;
  [v11 enumerateObjectsUsingBlock:v16];

  id v13 = [(ACXGizmoState *)self npsDomain];
  [v13 setObject:v12 forKey:@"PendingAppUpdateStates"];

  v14 = [(ACXGizmoState *)self npsDomain];
  v15 = [v14 synchronize];

  if (v15 && (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)) {
    MOLogWrite();
  }
}

- (BOOL)alwaysInstallApps
{
  unsigned __int8 v3 = [(ACXGizmoState *)self npsDomain];
  id v4 = [v3 synchronize];

  id v5 = [(ACXGizmoState *)self npsDomain];
  LOBYTE(v3) = [v5 BOOLForKey:@"AlwaysInstall"];

  return (char)v3;
}

- (BOOL)initiallyInstallAllApps
{
  unsigned __int8 v3 = [(ACXGizmoState *)self npsDomain];
  id v4 = [v3 synchronize];

  id v5 = [(ACXGizmoState *)self npsDomain];
  LOBYTE(v3) = [v5 BOOLForKey:@"InitiallyInstallAllExistingApps"];

  return (char)v3;
}

- (BOOL)needsReunionSync
{
  v2 = self;
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  unsigned __int8 v3 = [(ACXGizmoState *)self stateQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100046A34;
  v5[3] = &unk_10008C950;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)setNeedsReunionSync:(BOOL)a3
{
  id v5 = [(ACXGizmoState *)self stateQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100046AE0;
  v6[3] = &unk_10008DE40;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_sync(v5, v6);
}

- (unint64_t)installStatusForApp:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  id v5 = [(ACXGizmoState *)self stateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100046CB0;
  block[3] = &unk_10008CA68;
  block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  unint64_t v7 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)uniqueInstallIDForApp:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_100046E78;
  v16 = sub_100046E88;
  id v17 = 0;
  id v5 = [(ACXGizmoState *)self stateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100046E90;
  block[3] = &unk_10008CA68;
  block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)appStateForApp:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_100046E78;
  v16 = sub_100046E88;
  id v17 = 0;
  id v5 = [(ACXGizmoState *)self stateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004705C;
  block[3] = &unk_10008CA18;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)regenerateAllUniqueInstallIDs
{
  unsigned __int8 v3 = [(ACXGizmoState *)self stateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004715C;
  block[3] = &unk_10008CD30;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)setInstallStatus:(unint64_t)a3 forApp:(id)a4 companionBundleID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(ACXGizmoState *)self stateQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100047294;
  v13[3] = &unk_10008CF30;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(v10, v13);
}

- (BOOL)setInstallStatusForApps:(id)a3
{
  return [(ACXGizmoState *)self setInstallStatusForApps:a3 sendNotification:1 withUpdatePredicate:0];
}

- (BOOL)_onQueue_setInstallStatusForApps:(id)a3 sendNotification:(BOOL)a4 withUpdatePredicate:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if ([v8 count])
  {
    uint64_t v22 = 0;
    id v23 = &v22;
    uint64_t v24 = 0x2020000000;
    char v25 = 0;
    id v10 = objc_opt_new();
    id v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    unint64_t v16 = sub_100047670;
    id v17 = &unk_10008DEA8;
    id v18 = self;
    id v20 = v9;
    id v21 = &v22;
    id v11 = v10;
    id v19 = v11;
    [v8 enumerateKeysAndObjectsUsingBlock:&v14];
    if ([(ACXGizmoState *)self gizmoIsActivePairedDevice]
      && *((unsigned char *)v23 + 24)
      && [v11 count])
    {
      if (v6)
      {
        if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
          MOLogWrite();
        }
        notify_post((const char *)[@"com.apple.sockpuppet.applications.updated" UTF8String]);
      }
      +[ACXDeviceConnectionClient messageAllObserversWithInstallStateUpdate:v11];
    }
    BOOL v12 = *((unsigned char *)v23 + 24) != 0;

    _Block_object_dispose(&v22, 8);
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)setInstallStatusForApps:(id)a3 sendNotification:(BOOL)a4 withUpdatePredicate:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  if ([v8 count])
  {
    id v10 = [(ACXGizmoState *)self stateQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100047B4C;
    block[3] = &unk_10008DED0;
    block[4] = self;
    id v14 = v8;
    BOOL v17 = a4;
    id v15 = v9;
    unint64_t v16 = &v18;
    dispatch_sync(v10, block);

    BOOL v11 = *((unsigned char *)v19 + 24) != 0;
  }
  else
  {
    BOOL v11 = 0;
  }
  _Block_object_dispose(&v18, 8);

  return v11;
}

- (BOOL)iterateInstallStatusAndClearNeedsReunionSyncWithIterator:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  BOOL v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  id v8 = [(ACXGizmoState *)self stateQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100047CC0;
  v12[3] = &unk_10008DF20;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v15 = &v16;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, v12);

  LOBYTE(v7) = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return (char)v7;
}

- (void)clearPendingInstallations
{
  unsigned __int8 v3 = [(ACXGizmoState *)self stateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100047F80;
  block[3] = &unk_10008CD30;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)markInstalledAsPending
{
  unsigned __int8 v3 = [(ACXGizmoState *)self stateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000481D0;
  block[3] = &unk_10008CD30;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)purgeInstallStatusForApps:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [(ACXGizmoState *)self stateQueue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100048454;
    v6[3] = &unk_10008CC28;
    v6[4] = self;
    id v7 = v4;
    dispatch_sync(v5, v6);
  }
}

- (NSDictionary)pendingApps
{
  unsigned __int8 v3 = objc_opt_new();
  id v4 = [(ACXGizmoState *)self stateQueue];
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  id v10 = sub_100048580;
  BOOL v11 = &unk_10008CC28;
  BOOL v12 = self;
  id v13 = v3;
  id v5 = v3;
  dispatch_sync(v4, &v8);

  id v6 = objc_msgSend(v5, "copy", v8, v9, v10, v11, v12);

  return (NSDictionary *)v6;
}

- (BOOL)_onQueue_cleanUpExpiredPendingUpdateStates
{
  unsigned __int8 v3 = [(ACXGizmoState *)self stateQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [(ACXGizmoState *)self pendingAppUpdateStates];
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v10 hasExpired])
        {
          if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
          {
            id v14 = v10;
            MOLogWrite();
          }
          objc_msgSend(v4, "addObject:", v10, v14);
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  id v11 = [v4 count];
  if (v11)
  {
    BOOL v12 = [(ACXGizmoState *)self pendingAppUpdateStates];
    [v12 minusSet:v4];

    notify_post((const char *)[@"com.apple.sockpuppet.applications.updated" UTF8String]);
  }

  return v11 != 0;
}

- (void)_onQueue_cancelPendingUpdateStateTimer
{
  unsigned __int8 v3 = [(ACXGizmoState *)self stateQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(ACXGizmoState *)self cleanUpPendingUpdateStateTimer];

  if (v4)
  {
    id v5 = [(ACXGizmoState *)self cleanUpPendingUpdateStateTimer];
    dispatch_source_cancel(v5);

    [(ACXGizmoState *)self setCleanUpPendingUpdateStateTimer:0];
  }
}

- (void)_onQueue_setUpPendingUpdateStateTimer
{
  unsigned __int8 v3 = [(ACXGizmoState *)self stateQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(ACXGizmoState *)self cleanUpPendingUpdateStateTimer];

  if (!v4)
  {
    id v5 = [(ACXGizmoState *)self stateQueue];
    id v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v5);

    dispatch_time_t v7 = dispatch_time(0, 3600000000000);
    dispatch_source_set_timer(v6, v7, 0x34630B8A000uLL, 0xDF8475800uLL);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100048A2C;
    handler[3] = &unk_10008CD30;
    handler[4] = self;
    dispatch_source_set_event_handler(v6, handler);
    dispatch_resume(v6);
    [(ACXGizmoState *)self setCleanUpPendingUpdateStateTimer:v6];
  }
}

- (BOOL)_onQueue_updatePendingForCompanionApp:(id)a3
{
  id v4 = a3;
  id v5 = [(ACXGizmoState *)self stateQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [[ACXPendingAppUpdateState alloc] initWithCompanionBundleID:v4];
  dispatch_time_t v7 = [(ACXGizmoState *)self pendingAppUpdateStates];
  LOBYTE(v4) = [v7 containsObject:v6];

  return (char)v4;
}

- (BOOL)updatePendingForCompanionApp:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  BOOL v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v5 = [(ACXGizmoState *)self stateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100048C50;
  block[3] = &unk_10008CA18;
  id v9 = v4;
  id v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (void)_onQueue_setUpdatePendingForCompanionApp:(id)a3
{
  id v7 = a3;
  id v4 = [(ACXGizmoState *)self stateQueue];
  dispatch_assert_queue_V2(v4);

  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
    MOLogWrite();
  }
  id v5 = [[ACXPendingAppUpdateState alloc] initWithCompanionBundleID:v7];
  id v6 = [(ACXGizmoState *)self pendingAppUpdateStates];
  [v6 addObject:v5];

  [(ACXGizmoState *)self _onQueue_saveState];
  notify_post((const char *)[@"com.apple.sockpuppet.applications.updated" UTF8String]);
  [(ACXGizmoState *)self _onQueue_setUpPendingUpdateStateTimer];
}

- (void)setUpdatePendingForCompanionApp:(id)a3
{
  id v4 = a3;
  id v5 = [(ACXGizmoState *)self stateQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100048E38;
  v7[3] = &unk_10008CC28;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  sub_100006BB8(v5, v7);
}

- (void)_onQueue_cancelUpdatePendingForCompanionApp:(id)a3
{
  id v10 = a3;
  id v4 = [(ACXGizmoState *)self stateQueue];
  dispatch_assert_queue_V2(v4);

  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
  {
    id v9 = v10;
    MOLogWrite();
  }
  id v5 = [[ACXPendingAppUpdateState alloc] initWithCompanionBundleID:v10];
  id v6 = [(ACXGizmoState *)self pendingAppUpdateStates];
  [v6 removeObject:v5];

  [(ACXGizmoState *)self _onQueue_saveState];
  id v7 = [(ACXGizmoState *)self pendingAppUpdateStates];
  id v8 = [v7 count];

  if (!v8) {
    [(ACXGizmoState *)self _onQueue_cancelPendingUpdateStateTimer];
  }
  notify_post((const char *)objc_msgSend(@"com.apple.sockpuppet.applications.updated", "UTF8String", v9));
}

- (void)cancelUpdatePendingForCompanionApp:(id)a3
{
  id v4 = a3;
  id v5 = [(ACXGizmoState *)self stateQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100049014;
  v7[3] = &unk_10008CC28;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  sub_100006BB8(v5, v7);
}

- (id)preferencesForApplicationWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = +[ACXAvailableApplicationManager sharedApplicationManager];
  id v7 = [v6 gizmoAppWithBundleID:v4];

  if (v7)
  {
    uint64_t v8 = [v7 teamID];
    id v9 = (void *)v8;
    id v10 = &stru_10008F348;
    if (v8) {
      id v10 = (__CFString *)v8;
    }
    uint64_t v11 = v10;

    BOOL v12 = +[NSString stringWithFormat:@"%@.%@", v11, v4];
    id v13 = objc_alloc((Class)NPSDomainAccessor);
    char v14 = [(ACXGizmoState *)self device];
    long long v15 = [v14 nrDevice];
    id v16 = [v13 initWithDomain:v12 pairedDevice:v15];

    if (v16)
    {
      v27 = v12;
      v28 = v11;
      long long v17 = objc_opt_new();

      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v18 = [v16 copyKeyList];
      id v19 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v19)
      {
        id v20 = v19;
        uint64_t v21 = *(void *)v30;
        do
        {
          for (i = 0; i != v20; i = (char *)i + 1)
          {
            if (*(void *)v30 != v21) {
              objc_enumerationMutation(v18);
            }
            uint64_t v23 = *(void *)(*((void *)&v29 + 1) + 8 * i);
            uint64_t v24 = [v16 objectForKey:v23];
            if (v24) {
              [v17 setObject:v24 forKeyedSubscript:v23];
            }
          }
          id v20 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
        }
        while (v20);
      }

      id v5 = v17;
      BOOL v12 = v27;
      uint64_t v11 = v28;
    }
  }
  id v25 = [v5 copy];

  return v25;
}

- (id)watchKitAppExecutableHashForBundleID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = sub_100046E78;
  id v16 = sub_100046E88;
  id v17 = 0;
  id v5 = [(ACXGizmoState *)self stateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000493C4;
  block[3] = &unk_10008CA18;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)setWatchKitAppExecutableHash:(id)a3 forApp:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ACXGizmoState *)self stateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100049518;
  block[3] = &unk_10008CA40;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(v8, block);
}

- (int64_t)exportedAppStateForDeviceState:(unint64_t)a3
{
  if (a3 < 8) {
    return qword_100067A78[a3];
  }
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
    MOLogWrite();
  }
  return 0;
}

- (void)dumpCurrentStateToLog
{
  unsigned __int8 v3 = [(ACXGizmoState *)self stateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004967C;
  block[3] = &unk_10008CD30;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (id)bundleIDsOfAllInstalledApps
{
  unsigned __int8 v3 = objc_opt_new();
  id v4 = [(ACXGizmoState *)self stateQueue];
  uint64_t v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  id v10 = sub_1000498FC;
  uint64_t v11 = &unk_10008CC28;
  id v12 = self;
  id v13 = v3;
  id v5 = v3;
  dispatch_sync(v4, &v8);

  id v6 = objc_msgSend(v5, "copy", v8, v9, v10, v11, v12);

  return v6;
}

- (void)noteNewApps:(id)a3 updatedApps:(id)a4 removedApps:(id)a5 transitioningAppBundleIDs:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  unsigned int v83 = [(ACXGizmoState *)self alwaysInstallApps];
  int v17 = [(ACXGizmoState *)self gizmoIsActivePairedDevice];
  v89 = objc_opt_new();
  v91 = objc_opt_new();
  v87 = objc_opt_new();
  id v18 = [(ACXGizmoState *)self device];
  v93 = [v18 osVersion];

  v92 = self;
  id v19 = [(ACXGizmoState *)self device];
  unsigned int v90 = [v19 supportsStandaloneApps];

  id v88 = v15;
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    id v20 = [(ACXGizmoState *)self device];
    v77 = [v20 idsDeviceIdentifier];
    uint64_t v78 = (int)sub_100008300(v17);
    MOLogWrite();
  }
  if (!v17)
  {
    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    id v56 = v13;
    id v68 = [v56 countByEnumeratingWithState:&v94 objects:v110 count:16];
    if (v68)
    {
      id v69 = v68;
      id v80 = v16;
      id v82 = v12;
      id v86 = v14;
      uint64_t v70 = *(void *)v95;
      do
      {
        for (i = 0; i != v69; i = (char *)i + 1)
        {
          if (*(void *)v95 != v70) {
            objc_enumerationMutation(v56);
          }
          v72 = *(void **)(*((void *)&v94 + 1) + 8 * i);
          if ((objc_msgSend(v72, "isSystemApp", v77, v78) & 1) == 0)
          {
            if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
            {
              v77 = [v72 bundleIdentifier];
              MOLogWrite();
            }
            v73 = objc_msgSend(v72, "companionAppBundleID", v77);
            v74 = +[ACXGizmoApplicationInstallStatusItem itemWithStatus:1 companionBundleID:v73];

            v75 = [v72 watchKitAppExecutableHash];
            [v74 setWatchAppExecutableHash:v75];

            v76 = [v72 bundleIdentifier];
            [v91 setObject:v74 forKeyedSubscript:v76];
          }
        }
        id v69 = [v56 countByEnumeratingWithState:&v94 objects:v110 count:16];
      }
      while (v69);
      id v16 = v80;
      id v12 = v82;
      id v14 = v86;
    }
    goto LABEL_129;
  }
  id v79 = v16;
  id v81 = v12;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  id v21 = v12;
  id v22 = [v21 countByEnumeratingWithState:&v106 objects:v113 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v107;
    uint64_t v84 = kACXSourceAppWatchApplicationStore;
    do
    {
      id v25 = 0;
      do
      {
        if (*(void *)v107 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void **)(*((void *)&v106 + 1) + 8 * (void)v25);
        if ((objc_msgSend(v26, "isSystemApp", v77, v78) & 1) == 0)
        {
          v27 = [v26 companionAppBundleID];
          [(ACXGizmoState *)v92 cancelUpdatePendingForCompanionApp:v27];

          if ([v26 isCompatibleWithOSVersion:v93])
          {
            if (([v26 isRuntimeCompatibleWithOSVersion:v93] & 1) == 0)
            {
              if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 5) {
                goto LABEL_36;
              }
              id v33 = [v26 bundleIdentifier];
              uint64_t v78 = [v26 watchKitVersion];
              v77 = v33;
              MOLogWrite();

              goto LABEL_26;
            }
            v28 = [(ACXGizmoState *)v92 device];
            id v29 = [v28 cpuType];
            long long v30 = [(ACXGizmoState *)v92 device];
            LOBYTE(v29) = objc_msgSend(v26, "isCompatibleWithCPUType:subtype:", v29, objc_msgSend(v30, "cpuSubtype"));

            if (v29)
            {
              if ([v26 isTrusted])
              {
                if ([v26 isEligibleForWatchAppInstall])
                {
                  long long v31 = [v26 sourceAppIdentifier];
                  unsigned int v32 = [v31 isEqualToString:v84];

                  if (v32)
                  {
                    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
                      goto LABEL_51;
                    }
LABEL_52:
                    uint64_t v38 = objc_msgSend(v26, "companionAppBundleID", v77);
                    id v34 = +[ACXGizmoApplicationInstallStatusItem itemWithStatus:1 companionBundleID:v38];

                    id v39 = [v26 watchKitAppExecutableHash];
                    [v34 setWatchAppExecutableHash:v39];

                    id v35 = [v26 bundleIdentifier];
                    [v89 setObject:v34 forKeyedSubscript:v35];
LABEL_37:

                    goto LABEL_38;
                  }
                  id v37 = [v26 autoInstallOverride];
                  if (v83)
                  {
                    if (v37 == (id)1)
                    {
                      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
                        goto LABEL_55;
                      }
LABEL_36:
                      id v34 = objc_msgSend(v26, "companionAppBundleID", v77);
                      id v35 = +[ACXGizmoApplicationInstallStatusItem itemWithStatus:5 companionBundleID:v34];
                      uint64_t v36 = [v26 bundleIdentifier];
                      [v89 setObject:v35 forKeyedSubscript:v36];

                      goto LABEL_37;
                    }
                    if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 5) {
                      goto LABEL_52;
                    }
LABEL_51:
                    v77 = [v26 bundleIdentifier];
                    MOLogWrite();

                    goto LABEL_52;
                  }
                  if (v37 == (id)2)
                  {
                    if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 5) {
                      goto LABEL_52;
                    }
                    goto LABEL_51;
                  }
                  if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 5) {
                    goto LABEL_36;
                  }
LABEL_55:
                  id v33 = [v26 bundleIdentifier];
                  v77 = v33;
                  MOLogWrite();
LABEL_26:

                  goto LABEL_36;
                }
                if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 5) {
                  goto LABEL_36;
                }
              }
              else if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 5)
              {
                goto LABEL_36;
              }
            }
            else if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 5)
            {
              goto LABEL_36;
            }
          }
          else if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 5)
          {
            goto LABEL_36;
          }
          v77 = [v26 bundleIdentifier];
          MOLogWrite();

          goto LABEL_36;
        }
LABEL_38:
        id v25 = (char *)v25 + 1;
      }
      while (v23 != v25);
      id v40 = [v21 countByEnumeratingWithState:&v106 objects:v113 count:16];
      id v23 = v40;
    }
    while (v40);
  }

  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  id v41 = v13;
  id v42 = [v41 countByEnumeratingWithState:&v102 objects:v112 count:16];
  id v15 = v88;
  if (!v42) {
    goto LABEL_98;
  }
  id v43 = v42;
  uint64_t v44 = *(void *)v103;
  do
  {
    id v45 = 0;
    do
    {
      if (*(void *)v103 != v44) {
        objc_enumerationMutation(v41);
      }
      v46 = *(void **)(*((void *)&v102 + 1) + 8 * (void)v45);
      if ((objc_msgSend(v46, "isSystemApp", v77) & 1) == 0)
      {
        if (v15)
        {
          id v47 = [v46 bundleIdentifier];
          unsigned int v48 = [v15 containsObject:v47];
        }
        else
        {
          unsigned int v48 = 0;
        }
        if (([v46 isCompatibleWithOSVersion:v93] & 1) == 0)
        {
          if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
          {
LABEL_82:
            v77 = [v46 bundleIdentifier];
            MOLogWrite();
          }
LABEL_83:
          v49 = objc_msgSend(v46, "companionAppBundleID", v77);
          id v50 = +[ACXGizmoApplicationInstallStatusItem itemWithStatus:4 companionBundleID:v49];
          v51 = [v46 bundleIdentifier];
          [v91 setObject:v50 forKeyedSubscript:v51];

LABEL_84:
          goto LABEL_85;
        }
        if (([v46 isTrusted] & 1) == 0)
        {
          if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
            goto LABEL_82;
          }
          goto LABEL_83;
        }
        if (([v46 isEligibleForWatchAppInstall] & 1) == 0)
        {
          if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
            goto LABEL_82;
          }
          goto LABEL_83;
        }
        if ([v46 autoInstallOverride] == (id)1
          && [(ACXGizmoState *)v92 gizmoIsActivePairedDevice])
        {
          if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
            goto LABEL_96;
          }
        }
        else
        {
          if (!v90
            || [v46 applicationMode] == (id)1
            || (([v46 isProfileValidated] | v48) & 1) != 0)
          {
            if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
            {
              v77 = [v46 bundleIdentifier];
              MOLogWrite();
            }
            v52 = objc_msgSend(v46, "companionAppBundleID", v77);
            v49 = +[ACXGizmoApplicationInstallStatusItem itemWithStatus:1 companionBundleID:v52];

            id v53 = [v46 watchKitAppExecutableHash];
            [v49 setWatchAppExecutableHash:v53];

            long long v54 = [v46 bundleIdentifier];
            [v91 setObject:v49 forKeyedSubscript:v54];

            id v15 = v88;
            goto LABEL_84;
          }
          if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
          {
LABEL_96:
            v49 = [v46 bundleIdentifier];
            v77 = v49;
            MOLogWrite();
            goto LABEL_84;
          }
        }
      }
LABEL_85:
      id v45 = (char *)v45 + 1;
    }
    while (v43 != v45);
    id v55 = [v41 countByEnumeratingWithState:&v102 objects:v112 count:16];
    id v43 = v55;
  }
  while (v55);
LABEL_98:

  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  id v56 = v14;
  id v57 = [v56 countByEnumeratingWithState:&v98 objects:v111 count:16];
  if (!v57) {
    goto LABEL_115;
  }
  id v58 = v57;
  id v85 = v14;
  id v59 = v13;
  uint64_t v60 = *(void *)v99;
  while (2)
  {
    uint64_t v61 = 0;
    while (2)
    {
      if (*(void *)v99 != v60) {
        objc_enumerationMutation(v56);
      }
      long long v62 = *(void **)(*((void *)&v98 + 1) + 8 * v61);
      if ((objc_msgSend(v62, "isSystemApp", v77) & 1) == 0)
      {
        if (!v90 || [v62 applicationMode] == (id)1)
        {
          long long v63 = [v62 companionAppBundleID];
          v64 = +[ACXGizmoApplicationInstallStatusItem itemWithStatus:4 companionBundleID:v63];
          id v65 = [v62 bundleIdentifier];
          [v87 setObject:v64 forKeyedSubscript:v65];

          id v15 = v88;
          v66 = [v62 companionAppBundleID];
          [(ACXGizmoState *)v92 cancelUpdatePendingForCompanionApp:v66];
          goto LABEL_107;
        }
        if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
        {
          v66 = [v62 bundleIdentifier];
          v77 = v66;
          MOLogWrite();
LABEL_107:
        }
      }
      if (v58 != (id)++v61) {
        continue;
      }
      break;
    }
    id v67 = [v56 countByEnumeratingWithState:&v98 objects:v111 count:16];
    id v58 = v67;
    if (v67) {
      continue;
    }
    break;
  }
  id v13 = v59;
  id v14 = v85;
LABEL_115:
  id v16 = v79;
  id v12 = v81;
LABEL_129:

  [(ACXGizmoState *)v92 processNewStatusUpdates:v89 updatedStatusUpdates:v91 removedStatusUpdates:v87 completion:v16];
}

- (BOOL)_onQueue_pendingInstallStateShouldBeIgnoredForApp:(id)a3 existingState:(id)a4 newState:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [v9 watchAppExecutableHash];
  uint64_t v11 = [v8 watchAppExecutableHash];
  id v12 = [v8 installStatus];

  id v13 = [v9 installStatus];
  if (v12 == (id)1 && v13 == (id)2 && v10 && v11 && [v10 isEqualToString:v11])
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
      MOLogWrite();
    }
    BOOL v14 = 1;
  }
  else
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
      MOLogWrite();
    }
    BOOL v14 = 0;
  }

  return v14;
}

- (void)processNewStatusUpdates:(id)a3 updatedStatusUpdates:(id)a4 removedStatusUpdates:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v10 count] || objc_msgSend(v11, "count") || objc_msgSend(v12, "count"))
  {
    BOOL v14 = [(ACXGizmoState *)self stateQueue];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10004AAE4;
    v15[3] = &unk_10008DFB8;
    v15[4] = self;
    id v16 = v10;
    id v17 = v11;
    id v18 = v12;
    id v19 = v13;
    sub_100006BB8(v14, v15);
  }
}

- (void)noteTrustAddedApps:(id)a3 trustRemovedApps:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v39 = a4;
  id v40 = a5;
  id v42 = self;
  unsigned int v9 = [(ACXGizmoState *)self alwaysInstallApps];
  id v10 = objc_opt_new();
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    id v11 = [(ACXGizmoState *)self device];
    uint64_t v36 = [v11 idsDeviceIdentifier];
    id v37 = (void *)(int)sub_100008300([(ACXGizmoState *)v42 gizmoIsActivePairedDevice]);
    MOLogWrite();
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v51 = 0u;
  long long v50 = 0u;
  id obj = v8;
  id v12 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v51;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v51 != v14) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        if (!v9)
        {
          if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
          {
            uint64_t v36 = objc_msgSend(*(id *)(*((void *)&v50 + 1) + 8 * i), "bundleIdentifier", v36, v37, v38, v39);
            MOLogWrite();
          }
          id v18 = objc_msgSend(v16, "companionAppBundleID", v36);
          id v23 = +[ACXGizmoApplicationInstallStatusItem itemWithStatus:5 companionBundleID:v18];
          goto LABEL_22;
        }
        id v17 = [(ACXGizmoState *)v42 device];
        id v18 = [v17 osVersion];

        if ([v16 isCompatibleWithOSVersion:v18])
        {
          if ([v16 isRuntimeCompatibleWithOSVersion:v18])
          {
            id v19 = [(ACXGizmoState *)v42 device];
            id v20 = [v19 cpuType];
            id v21 = [(ACXGizmoState *)v42 device];
            LOBYTE(v20) = objc_msgSend(v16, "isCompatibleWithCPUType:subtype:", v20, objc_msgSend(v21, "cpuSubtype"));

            if (v20)
            {
              if ([v16 isEligibleForWatchAppInstall])
              {
                if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
                {
                  uint64_t v36 = objc_msgSend(v16, "bundleIdentifier", v36);
                  MOLogWrite();
                }
                id v22 = objc_msgSend(v16, "companionAppBundleID", v36);
                id v23 = +[ACXGizmoApplicationInstallStatusItem itemWithStatus:1 companionBundleID:v22];

                uint64_t v24 = [v16 watchKitAppExecutableHash];
                [v23 setWatchAppExecutableHash:v24];

LABEL_22:
                id v25 = [v16 bundleIdentifier];
                [v10 setObject:v23 forKeyedSubscript:v25];
LABEL_23:

LABEL_36:
                goto LABEL_37;
              }
              if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
                goto LABEL_35;
              }
            }
            else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
            {
              goto LABEL_35;
            }
          }
          else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
          {
            id v23 = objc_msgSend(v16, "bundleIdentifier", v36);
            id v25 = [v16 watchKitVersion];
            id v37 = v25;
            uint64_t v38 = v18;
            uint64_t v36 = v23;
            MOLogWrite();
            goto LABEL_23;
          }
        }
        else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
        {
LABEL_35:
          id v23 = objc_msgSend(v16, "bundleIdentifier", v36);
          uint64_t v36 = v23;
          MOLogWrite();
          goto LABEL_36;
        }
LABEL_37:
      }
      id v13 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
    }
    while (v13);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v26 = v39;
  id v27 = [v26 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v47;
    do
    {
      for (j = 0; j != v28; j = (char *)j + 1)
      {
        if (*(void *)v47 != v29) {
          objc_enumerationMutation(v26);
        }
        long long v31 = *(void **)(*((void *)&v46 + 1) + 8 * (void)j);
        if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
        {
          uint64_t v36 = objc_msgSend(*(id *)(*((void *)&v46 + 1) + 8 * (void)j), "bundleIdentifier", v36);
          MOLogWrite();
        }
        unsigned int v32 = objc_msgSend(v31, "companionAppBundleID", v36);
        id v33 = +[ACXGizmoApplicationInstallStatusItem itemWithStatus:4 companionBundleID:v32];
        id v34 = [v31 bundleIdentifier];
        [v10 setObject:v33 forKeyedSubscript:v34];
      }
      id v28 = [v26 countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v28);
  }

  if ([v10 count])
  {
    id v35 = [(ACXGizmoState *)v42 stateQueue];
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_10004B6B4;
    v43[3] = &unk_10008CA90;
    v43[4] = v42;
    id v44 = v10;
    id v45 = v40;
    sub_100006BB8(v35, v43);
  }
}

- (BOOL)_init_migrateSockPuppetSettings
{
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  id v3 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.companionappd"];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 synchronize];
    id v6 = [v4 objectForKey:@"SPApplicationsDomain"];
    objc_opt_class();
    id v7 = v6;
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }

    if (v8)
    {
      id v10 = [v4 objectForKey:@"SPAlwaysInstallKey"];
      objc_opt_class();
      id v11 = v10;
      if (objc_opt_isKindOfClass()) {
        id v12 = v11;
      }
      else {
        id v12 = 0;
      }

      if ((objc_opt_respondsToSelector() & 1) != 0 && [v12 BOOLValue])
      {
        *((unsigned char *)v20 + 24) = 1;
        if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
          MOLogWrite();
        }
        uint64_t v13 = 1;
      }
      else
      {
        uint64_t v13 = 0;
      }
      uint64_t v14 = [(ACXGizmoState *)self npsDomain];
      [v14 setBool:v13 forKey:@"AlwaysInstall"];

      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
        MOLogWrite();
      }
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10004BCC8;
      v18[3] = &unk_10008DFE0;
      void v18[4] = self;
      v18[5] = &v19;
      [v8 enumerateKeysAndObjectsUsingBlock:v18];
      if (*((unsigned char *)v20 + 24))
      {
        self->_needsReunionSync = 1;
        id v15 = [(ACXGizmoState *)self stateQueue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10004BFC8;
        block[3] = &unk_10008CD30;
        block[4] = self;
        dispatch_sync(v15, block);
      }
      [(ACXGizmoState *)self _removeSockPuppetSettings];
      BOOL v9 = *((unsigned char *)v20 + 24) != 0;
    }
    else
    {
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
        MOLogWrite();
      }
      BOOL v9 = 0;
    }
  }
  else
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
      MOLogWrite();
    }
    BOOL v9 = 0;
  }

  _Block_object_dispose(&v19, 8);
  return v9;
}

- (void)_removeSockPuppetSettings
{
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
    MOLogWrite();
  }
  id v2 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.companionappd"];
  id v3 = v2;
  if (v2)
  {
    id v5 = v2;
    [v2 removeObjectForKey:@"SPApplicationsDomain"];
    [v5 removeObjectForKey:@"SPAlwaysInstallKey"];
    [v5 removeObjectForKey:@"appStateOwnedBySystem"];
    id v4 = [v5 synchronize];
LABEL_9:
    id v3 = v5;
    goto LABEL_10;
  }
  id v4 = (id)qword_1000A5608;
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
  {
    id v5 = 0;
    id v4 = (id)MOLogWrite();
    goto LABEL_9;
  }
LABEL_10:

  _objc_release_x1(v4, v3);
}

- (void)initialPairedSyncComplete
{
  self->_hasCompletedInitialPairedSync = 1;
  id v3 = [(ACXGizmoState *)self npsDomain];
  [v3 setBool:1 forKey:@"CompletedInitialPairedSync"];

  id v4 = [(ACXGizmoState *)self npsDomain];
  uint64_t v7 = [v4 synchronize];

  uint64_t v6 = v7;
  if (v7)
  {
    uint64_t v5 = qword_1000A5608;
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      uint64_t v5 = MOLogWrite();
      uint64_t v6 = v7;
    }
  }

  _objc_release_x1(v5, v6);
}

- (BOOL)hasCompletedInitialPairedSync
{
  return self->_hasCompletedInitialPairedSync;
}

- (ACXDevice)device
{
  return self->_device;
}

- (OS_dispatch_queue)stateQueue
{
  return self->_stateQueue;
}

- (NPSDomainAccessor)npsDomain
{
  return self->_npsDomain;
}

- (NSMutableDictionary)appStates
{
  return self->_appStates;
}

- (void)setAppStates:(id)a3
{
}

- (NSMutableSet)pendingAppUpdateStates
{
  return self->_pendingAppUpdateStates;
}

- (OS_dispatch_source)cleanUpPendingUpdateStateTimer
{
  return self->_cleanUpPendingUpdateStateTimer;
}

- (void)setCleanUpPendingUpdateStateTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cleanUpPendingUpdateStateTimer, 0);
  objc_storeStrong((id *)&self->_pendingAppUpdateStates, 0);
  objc_storeStrong((id *)&self->_appStates, 0);
  objc_storeStrong((id *)&self->_npsDomain, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end