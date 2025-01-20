@interface ACXAvailableApplicationManager
+ (id)sharedApplicationManager;
- (ACXAvailableApplicationManager)init;
- (BOOL)_onQueue_infoMatchesCurrentLSDatabaseWithUUID:(id *)a3;
- (BOOL)_verifyInternalDataStructures;
- (BOOL)gizmoAppIsLocallyAvailableWithBundleID:(id)a3;
- (BOOL)systemAppIsAvailableWithBundleID:(id)a3 error:(id *)a4;
- (BOOL)trustChangeEvaluationPending;
- (NSDictionary)possibleCompanionDeletableSystemAppToWatchCounterpartsMap;
- (NSMutableDictionary)appList;
- (NSMutableDictionary)companionToWatchAppsBundleIDMap;
- (NSUUID)lastLSUUID;
- (NSUUID)ourDBUUID;
- (OS_dispatch_queue)stateQueue;
- (id)_alwaysIgnoredSystemAppBundleIDs;
- (id)_bundleIDsOfLocallyAvailableSystemApps;
- (id)_supplementalSystemAppBundleIDMappingForPreWatchOSSix;
- (id)_supplementalSystemAppBundleIDMappingForWatchOSSixAndLater;
- (id)_systemAppBundleIDMappingForPreWatchOSSix;
- (id)allAvailableApps;
- (id)allAvailablePlaceholders;
- (id)availableSystemAppWithBundleID:(id)a3 error:(id *)a4;
- (id)bundleIDsOfAvailableAppsExcludingSystemApps;
- (id)bundleIDsOfLocallyAvailableSystemApps;
- (id)bundleIDsOfLocallyAvailableSystemAppsForPreWatchOSSix;
- (id)companionBundleIDForLocallyAvailableSystemApp:(id)a3 error:(id *)a4;
- (id)gizmoAppBundleIDForCompanionAppBundleID:(id)a3;
- (id)gizmoAppBundleIDsForCompanionAppBundleIDs:(id)a3;
- (id)gizmoAppForCompanionAppBundleID:(id)a3;
- (id)gizmoAppWithBundleID:(id)a3;
- (id)infoForGizmoAppsWithBundleIDs:(id)a3;
- (id)locallyAvailableSystemAppBundleIDToCompanionBundleIDMapping;
- (id)locallyAvailableSystemAppBundleIDToCompanionBundleIDMappingForPreWatchOSSix;
- (unint64_t)lastSequenceNumber;
- (void)_onQueue_noteDatabaseRebuild;
- (void)_onQueue_noteNewApps:(id)a3 updatedApps:(id)a4 removedApps:(id)a5 transitioningAppBundleIDs:(id)a6;
- (void)_onQueue_noteTrustObtainedForApps:(id)a3 trustRemovedForApps:(id)a4;
- (void)_onQueue_reSyncWithLS;
- (void)_onQueue_writeAppListToDisk;
- (void)addGizmoBundleId:(id)a3 forCompanionBundleID:(id)a4 toMap:(id)a5;
- (void)applicationInstallsDidStart:(id)a3;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)applicationsInstalledWithAppRecords:(id)a3;
- (void)applicationsInstalledWithCompanionIdentifiers:(id)a3;
- (void)applicationsUninstalledWithAppRecords:(id)a3;
- (void)processApplication:(id)a3 withNewApps:(id)a4 updatedApps:(id)a5 transitioningAppBundleIDs:(id)a6;
- (void)processApplicationRemovalWithCompanionBundleID:(id)a3 removedApps:(id)a4;
- (void)profileTrustChanged;
- (void)setAppList:(id)a3;
- (void)setCompanionToWatchAppsBundleIDMap:(id)a3;
- (void)setLastLSUUID:(id)a3;
- (void)setLastSequenceNumber:(unint64_t)a3;
- (void)setOurDBUUID:(id)a3;
- (void)setTrustChangeEvaluationPending:(BOOL)a3;
@end

@implementation ACXAvailableApplicationManager

+ (id)sharedApplicationManager
{
  if (qword_1000A54F8 != -1) {
    dispatch_once(&qword_1000A54F8, &stru_10008CD08);
  }
  v2 = (void *)qword_1000A54F0;

  return v2;
}

- (ACXAvailableApplicationManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)ACXAvailableApplicationManager;
  v2 = [(ACXAvailableApplicationManager *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.appconduit.AvailableAppList", v3);
    stateQueue = v2->_stateQueue;
    v2->_stateQueue = (OS_dispatch_queue *)v4;

    v6 = [(ACXAvailableApplicationManager *)v2 stateQueue];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100009F18;
    v8[3] = &unk_10008CD30;
    v9 = v2;
    sub_100006BB8(v6, v8);
  }
  return v2;
}

- (BOOL)_verifyInternalDataStructures
{
  v3 = [(ACXAvailableApplicationManager *)self appList];
  id v4 = [v3 count];

  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v5 = [(ACXAvailableApplicationManager *)self companionToWatchAppsBundleIDMap];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000A948;
  v10[3] = &unk_10008CD58;
  v10[4] = &v11;
  [v5 enumerateKeysAndObjectsUsingBlock:v10];

  id v6 = (id)v12[3];
  if (v4 != v6 && (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3))
  {
    v7 = [(ACXAvailableApplicationManager *)self appList];
    v9 = [(ACXAvailableApplicationManager *)self companionToWatchAppsBundleIDMap];
    MOLogWrite();
  }
  _Block_object_dispose(&v11, 8);
  return v4 != v6;
}

- (void)_onQueue_writeAppListToDisk
{
  v23 = sub_100007CEC();
  v22 = [v23 URLByAppendingPathComponent:@"AvailableApps.plist" isDirectory:0];
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
    MOLogWrite();
  }
  v3 = objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v4 = [(ACXAvailableApplicationManager *)self appList];
  id v5 = [v4 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v26;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        objc_super v10 = [(ACXAvailableApplicationManager *)self appList];
        uint64_t v11 = [v10 objectForKeyedSubscript:v9];
        v12 = [v11 serialize];

        [v3 setObject:v12 forKeyedSubscript:v9];
      }
      id v6 = [v4 countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v6);
  }

  v29[0] = @"Version";
  v29[1] = @"AppList";
  v30[0] = &off_100097570;
  v30[1] = v3;
  v29[2] = @"LSUUID";
  uint64_t v13 = [(ACXAvailableApplicationManager *)self lastLSUUID];
  uint64_t v14 = [v13 UUIDString];
  v30[2] = v14;
  v29[3] = @"CompanionToWKBundleIDMap";
  v15 = [(ACXAvailableApplicationManager *)self companionToWatchAppsBundleIDMap];
  v30[3] = v15;
  v29[4] = @"OurDBUUID";
  v16 = [(ACXAvailableApplicationManager *)self ourDBUUID];
  v17 = [v16 UUIDString];
  v30[4] = v17;
  v29[5] = @"LastSequenceNumber";
  v18 = +[NSNumber numberWithUnsignedInteger:[(ACXAvailableApplicationManager *)self lastSequenceNumber]];
  v30[5] = v18;
  v19 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:6];

  id v24 = 0;
  LOBYTE(v14) = objc_msgSend(v19, "ACX_writeToURL:format:options:error:", v22, 200, 268435457, &v24);
  id v20 = v24;
  if ((v14 & 1) == 0 && (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3))
  {
    v21 = [v22 path];
    MOLogWrite();
  }
}

- (BOOL)_onQueue_infoMatchesCurrentLSDatabaseWithUUID:(id *)a3
{
  id v5 = +[LSApplicationWorkspace defaultWorkspace];
  id v16 = 0;
  id v17 = 0;
  [v5 getKnowledgeUUID:&v17 andSequenceNumber:&v16];
  id v6 = v17;
  id v7 = v16;

  if (a3) {
    *a3 = v6;
  }
  v8 = [(ACXAvailableApplicationManager *)self lastLSUUID];

  if (!v8)
  {
    if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7) {
      MOLogWrite();
    }
    goto LABEL_12;
  }
  uint64_t v9 = [(ACXAvailableApplicationManager *)self lastLSUUID];
  unsigned __int8 v10 = [v6 isEqual:v9];

  if ((v10 & 1) == 0)
  {
    if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7)
    {
      v12 = [(ACXAvailableApplicationManager *)self lastLSUUID];
      uint64_t v13 = [v12 UUIDString];
      v15 = [v6 UUIDString];
      MOLogWrite();
    }
LABEL_12:
    BOOL v11 = 0;
    goto LABEL_13;
  }
  BOOL v11 = 1;
LABEL_13:

  return v11;
}

- (void)_onQueue_noteDatabaseRebuild
{
  id v2 = +[ACXGizmoStateManager sharedStateManager];
  [v2 noteDatabaseRebuild];
}

- (void)_onQueue_noteNewApps:(id)a3 updatedApps:(id)a4 removedApps:(id)a5 transitioningAppBundleIDs:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = +[ACXGizmoStateManager sharedStateManager];
  [v13 noteNewApps:v12 updatedApps:v11 removedApps:v10 transitioningAppBundleIDs:v9];
}

- (void)_onQueue_noteTrustObtainedForApps:(id)a3 trustRemovedForApps:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[ACXGizmoStateManager sharedStateManager];
  [v7 noteTrustObtainedForApps:v6 trustRemovedForApps:v5];
}

- (void)_onQueue_reSyncWithLS
{
  v59 = objc_opt_new();
  v60 = objc_opt_new();
  v58 = objc_opt_new();
  unint64_t v3 = [(ACXAvailableApplicationManager *)self lastSequenceNumber];
  id v78 = 0;
  unsigned int v4 = [(ACXAvailableApplicationManager *)self _onQueue_infoMatchesCurrentLSDatabaseWithUUID:&v78];
  id v51 = v78;
  unsigned int v50 = v4;
  if (v4)
  {
    uint64_t v5 = v3 + 1;
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
      MOLogWrite();
    }
    v63 = [(ACXAvailableApplicationManager *)self appList];
  }
  else
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
      MOLogWrite();
    }
    id v6 = objc_opt_new();
    [(ACXAvailableApplicationManager *)self setAppList:v6];

    id v7 = objc_opt_new();
    [(ACXAvailableApplicationManager *)self setCompanionToWatchAppsBundleIDMap:v7];

    [(ACXAvailableApplicationManager *)self setLastLSUUID:0];
    v8 = objc_opt_new();
    [(ACXAvailableApplicationManager *)self setOurDBUUID:v8];

    [(ACXAvailableApplicationManager *)self setLastSequenceNumber:0];
    v63 = 0;
    uint64_t v5 = 1;
  }
  v62 = objc_opt_new();
  v61 = objc_opt_new();
  v65 = self;
  id v9 = [(ACXAvailableApplicationManager *)self _alwaysIgnoredSystemAppBundleIDs];
  +[LSApplicationRecord enumeratorWithOptions:0];
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = [v10 countByEnumeratingWithState:&v74 objects:v84 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v75;
    uint64_t v52 = *(void *)v75;
    id v53 = v10;
    do
    {
      uint64_t v14 = 0;
      id v54 = v12;
      do
      {
        if (*(void *)v75 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v74 + 1) + 8 * (void)v14);
        if (objc_msgSend(v15, "ACX_shouldBeTrackedByAppConduit"))
        {
          v66 = v15;
          if (![v15 isPlaceholder])
          {
            v18 = [v15 counterpartIdentifiers];
            id v17 = v18;
            if (!v18 || ![v18 count])
            {
LABEL_46:

              goto LABEL_47;
            }
            v56 = v16;
            v57 = v14;
            long long v72 = 0u;
            long long v73 = 0u;
            long long v70 = 0u;
            long long v71 = 0u;
            v55 = v17;
            id obj = v17;
            id v19 = [obj countByEnumeratingWithState:&v70 objects:v79 count:16];
            if (!v19) {
              goto LABEL_45;
            }
            id v20 = v19;
            uint64_t v21 = *(void *)v71;
            v22 = v66;
            while (2)
            {
              uint64_t v23 = 0;
LABEL_24:
              if (*(void *)v71 != v21) {
                objc_enumerationMutation(obj);
              }
              uint64_t v24 = *(void *)(*((void *)&v70 + 1) + 8 * v23);
              if (objc_msgSend(v9, "containsObject:", v24, v49)) {
                goto LABEL_43;
              }
              long long v25 = v9;
              long long v26 = [v63 objectForKeyedSubscript:v24];
              long long v27 = v26;
              if (v26)
              {
                id v28 = [v26 lsSequenceNumber];
                if (v28 == [v22 sequenceNumber])
                {
                  v29 = [v27 bundleIdentifier];
                  [v62 setObject:v27 forKeyedSubscript:v29];

                  id v30 = [v27 bundleIdentifier];
                  v31 = [v27 companionAppBundleID];
                  [(ACXAvailableApplicationManager *)v65 addGizmoBundleId:v30 forCompanionBundleID:v31 toMap:v61];

                  v22 = v66;
                  uint64_t v32 = v5;
                  break;
                }
                if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
                {
                  v49 = [v66 bundleIdentifier];
                  MOLogWrite();
                }
                uint64_t v32 = v5 + 1;
                id v39 = objc_alloc((Class)ACXApplication);
                v40 = [(ACXAvailableApplicationManager *)v65 ourDBUUID];
                v41 = v39;
                v22 = v66;
                id v30 = [v41 initWithApplicationRecord:v66 gizmoBundleIdentifier:v24 databaseUUID:v40 sequenceNumber:v5];

                if (v30)
                {
                  id v9 = v25;
                  if (sub_10000B8CC(v27, v30))
                  {
                    v42 = [v30 bundleIdentifier];
                    [v58 addObject:v42];
                  }
                  v43 = objc_msgSend(v30, "bundleIdentifier", v49);
                  [v62 setObject:v30 forKeyedSubscript:v43];

                  v44 = [v30 bundleIdentifier];
                  v45 = [v30 companionAppBundleID];
                  [(ACXAvailableApplicationManager *)v65 addGizmoBundleId:v44 forCompanionBundleID:v45 toMap:v61];

                  [v59 addObject:v30];
                  v22 = v66;
LABEL_42:

                  uint64_t v5 = v32;
LABEL_43:
                  if (v20 == (id)++v23)
                  {
                    id v20 = [obj countByEnumeratingWithState:&v70 objects:v79 count:16];
                    if (!v20)
                    {
LABEL_45:

                      uint64_t v13 = v52;
                      id v10 = v53;
                      id v12 = v54;
                      id v17 = v55;
                      id v16 = v56;
                      uint64_t v14 = v57;
                      goto LABEL_46;
                    }
                    continue;
                  }
                  goto LABEL_24;
                }
              }
              else
              {
                uint64_t v32 = v5 + 1;
                id v33 = objc_alloc((Class)ACXApplication);
                v34 = [(ACXAvailableApplicationManager *)v65 ourDBUUID];
                v35 = v33;
                v22 = v66;
                id v30 = [v35 initWithApplicationRecord:v66 gizmoBundleIdentifier:v24 databaseUUID:v34 sequenceNumber:v5];

                if (v30)
                {
                  v36 = [v30 bundleIdentifier];
                  uint64_t v37 = [v30 companionAppBundleID];
                  if (!v36) {
                    sub_10005B6D8();
                  }
                  v38 = (void *)v37;
                  if (!v37) {
                    sub_10005B704();
                  }
                  [v62 setObject:v30 forKeyedSubscript:v36];
                  [(ACXAvailableApplicationManager *)v65 addGizmoBundleId:v36 forCompanionBundleID:v38 toMap:v61];
                  [v60 addObject:v30];
                }
              }
              break;
            }
            id v9 = v25;
            goto LABEL_42;
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
          {
            id v17 = [v15 bundleIdentifier];
            *(_DWORD *)buf = 136315394;
            v81 = "-[ACXAvailableApplicationManager _onQueue_reSyncWithLS]";
            __int16 v82 = 2112;
            v83 = v17;
            _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: Unexpectedly received a placeholder for %@", buf, 0x16u);
            goto LABEL_46;
          }
        }
LABEL_47:
        uint64_t v14 = (char *)v14 + 1;
      }
      while (v14 != v12);
      id v12 = [v10 countByEnumeratingWithState:&v74 objects:v84 count:16];
    }
    while (v12);
  }

  if (v50)
  {
    v46 = objc_opt_new();
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472;
    v67[2] = sub_10000B9F0;
    v67[3] = &unk_10008CD80;
    id v68 = v62;
    id v47 = v46;
    id v69 = v47;
    [v63 enumerateKeysAndObjectsUsingBlock:v67];
    if ([v47 count] && (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5))
    {
      v49 = v47;
      MOLogWrite();
    }
    v5 += (uint64_t)objc_msgSend(v47, "count", v49);
    if ([v60 count] || objc_msgSend(v59, "count") || objc_msgSend(v47, "count")) {
      [(ACXAvailableApplicationManager *)v65 _onQueue_noteNewApps:v60 updatedApps:v59 removedApps:v47 transitioningAppBundleIDs:v58];
    }

    v48 = v65;
  }
  else
  {
    v48 = v65;
    [(ACXAvailableApplicationManager *)v65 _onQueue_noteDatabaseRebuild];
    id v47 = 0;
  }
  -[ACXAvailableApplicationManager setAppList:](v48, "setAppList:", v62, v49);
  [(ACXAvailableApplicationManager *)v48 setLastLSUUID:v51];
  [(ACXAvailableApplicationManager *)v48 setCompanionToWatchAppsBundleIDMap:v61];
  [(ACXAvailableApplicationManager *)v48 setLastSequenceNumber:v5 - 1];
  if ([(ACXAvailableApplicationManager *)v48 _onQueue_infoMatchesCurrentLSDatabaseWithUUID:0])
  {
    if (!v50 || [v60 count] || objc_msgSend(v59, "count") || objc_msgSend(v47, "count")) {
      [(ACXAvailableApplicationManager *)v48 _onQueue_writeAppListToDisk];
    }
  }
  else
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
      MOLogWrite();
    }
    [(ACXAvailableApplicationManager *)v48 _onQueue_reSyncWithLS];
  }
}

- (void)addGizmoBundleId:(id)a3 forCompanionBundleID:(id)a4 toMap:(id)a5
{
  id v12 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = [v8 objectForKeyedSubscript:v7];
  id v10 = [v9 mutableCopy];

  if (!v10) {
    id v10 = (id)objc_opt_new();
  }
  if (([v10 containsObject:v12] & 1) == 0)
  {
    [v10 addObject:v12];
    id v11 = [v10 copy];
    [v8 setObject:v11 forKeyedSubscript:v7];
  }
}

- (void)applicationsInstalledWithAppRecords:(id)a3
{
  id v4 = a3;
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    id v7 = v4;
    MOLogWrite();
  }
  uint64_t v5 = [(ACXAvailableApplicationManager *)self stateQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000BC24;
  v8[3] = &unk_10008CC28;
  void v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  sub_100006BB8(v5, v8);
}

- (void)applicationsInstalledWithCompanionIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  id v6 = objc_opt_new();
  uint64_t v23 = objc_opt_new();
  id v7 = objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v4;
  id v8 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v33;
    uint64_t v24 = *(void *)v33;
    do
    {
      id v11 = 0;
      id v25 = v9;
      do
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v32 + 1) + 8 * (void)v11);
        uint64_t v13 = objc_msgSend(v12, "bundleIdentifier", v22);
        if ([v12 isPlaceholder])
        {
          if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
          {
            v22 = v13;
            MOLogWrite();
          }
        }
        else
        {
          uint64_t v14 = [(ACXAvailableApplicationManager *)self ourDBUUID];
          v15 = +[ACXApplication gizmoApplicationsFromCompanionAppRecord:v12 databaseUUID:v14 startingSequenceNumber:(char *)[(ACXAvailableApplicationManager *)self lastSequenceNumber] + 1];

          if (v15)
          {
            id v16 = [(ACXAvailableApplicationManager *)self companionToWatchAppsBundleIDMap];
            [v16 setObject:0 forKeyedSubscript:v13];

            long long v30 = 0u;
            long long v31 = 0u;
            long long v28 = 0u;
            long long v29 = 0u;
            long long v27 = v15;
            id v17 = v15;
            id v18 = [v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
            if (v18)
            {
              id v19 = v18;
              uint64_t v20 = *(void *)v29;
              do
              {
                for (i = 0; i != v19; i = (char *)i + 1)
                {
                  if (*(void *)v29 != v20) {
                    objc_enumerationMutation(v17);
                  }
                  [(ACXAvailableApplicationManager *)self processApplication:*(void *)(*((void *)&v28 + 1) + 8 * i) withNewApps:v5 updatedApps:v6 transitioningAppBundleIDs:v7];
                }
                id v19 = [v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
              }
              while (v19);
            }

            -[ACXAvailableApplicationManager setLastSequenceNumber:](self, "setLastSequenceNumber:", (char *)[v17 count]+ -[ACXAvailableApplicationManager lastSequenceNumber](self, "lastSequenceNumber"));
            uint64_t v10 = v24;
            v15 = v27;
          }
          else
          {
            [(ACXAvailableApplicationManager *)self processApplicationRemovalWithCompanionBundleID:v13 removedApps:v23];
          }

          id v9 = v25;
        }

        id v11 = (char *)v11 + 1;
      }
      while (v11 != v9);
      id v9 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v9);
  }

  if ([v5 count] || objc_msgSend(v6, "count") || objc_msgSend(v23, "count"))
  {
    -[ACXAvailableApplicationManager _onQueue_noteNewApps:updatedApps:removedApps:transitioningAppBundleIDs:](self, "_onQueue_noteNewApps:updatedApps:removedApps:transitioningAppBundleIDs:", v5, v6, v23, v7, v22);
    [(ACXAvailableApplicationManager *)self _onQueue_writeAppListToDisk];
  }
}

- (void)processApplicationRemovalWithCompanionBundleID:(id)a3 removedApps:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ACXAvailableApplicationManager *)self companionToWatchAppsBundleIDMap];
  id v9 = [v8 objectForKeyedSubscript:v6];

  if (v9)
  {
    uint64_t v21 = v9;
    id v22 = v6;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v10 = v9;
    id v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v24;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
          {
            uint64_t v20 = *(void *)(*((void *)&v23 + 1) + 8 * i);
            MOLogWrite();
          }
          id v16 = [(ACXAvailableApplicationManager *)self appList];
          id v17 = [v16 objectForKeyedSubscript:v15];

          if (!v17) {
            sub_10005B730();
          }
          id v18 = [(ACXAvailableApplicationManager *)self appList];
          [v18 removeObjectForKey:v15];

          [v7 addObject:v17];
        }
        id v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v12);
    }

    id v19 = [(ACXAvailableApplicationManager *)self companionToWatchAppsBundleIDMap];
    id v6 = v22;
    [v19 setObject:0 forKeyedSubscript:v22];

    id v9 = v21;
  }
  else if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7)
  {
    MOLogWrite();
  }
}

- (void)processApplication:(id)a3 withNewApps:(id)a4 updatedApps:(id)a5 transitioningAppBundleIDs:(id)a6
{
  id v24 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (!v24) {
    sub_10005B75C();
  }
  uint64_t v13 = [v24 bundleIdentifier];
  if (!v13) {
    sub_10005B788();
  }
  uint64_t v14 = (void *)v13;
  uint64_t v15 = [v24 companionAppBundleID];
  if (!v15) {
    sub_10005B7B4();
  }
  id v16 = (void *)v15;
  id v17 = [(ACXAvailableApplicationManager *)self appList];
  id v18 = [v17 objectForKeyedSubscript:v14];

  if (v18)
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
    {
      long long v23 = v14;
      MOLogWrite();
    }
    id v19 = v11;
    if (sub_10000B8CC(v18, v24))
    {
      uint64_t v20 = [v24 bundleIdentifier];
      [v12 addObject:v20];

      id v19 = v11;
    }
  }
  else if (!qword_1000A5608 || (id v19 = v10, *(int *)(qword_1000A5608 + 44) >= 5))
  {
    long long v23 = v14;
    MOLogWrite();
    id v19 = v10;
  }
  uint64_t v21 = [(ACXAvailableApplicationManager *)self appList];
  [v21 setObject:v24 forKeyedSubscript:v14];

  id v22 = [(ACXAvailableApplicationManager *)self companionToWatchAppsBundleIDMap];
  [(ACXAvailableApplicationManager *)self addGizmoBundleId:v14 forCompanionBundleID:v16 toMap:v22];

  [v19 addObject:v24];
}

- (void)applicationsUninstalledWithAppRecords:(id)a3
{
  id v4 = a3;
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    id v7 = v4;
    MOLogWrite();
  }
  uint64_t v5 = [(ACXAvailableApplicationManager *)self stateQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000C4EC;
  v8[3] = &unk_10008CC28;
  void v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  sub_100006BB8(v5, v8);
}

- (void)profileTrustChanged
{
  unint64_t v3 = [(ACXAvailableApplicationManager *)self stateQueue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000C8D0;
  v4[3] = &unk_10008CD30;
  v4[4] = self;
  sub_100006BB8(v3, v4);
}

- (id)infoForGizmoAppsWithBundleIDs:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  id v6 = [(ACXAvailableApplicationManager *)self stateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000CE64;
  block[3] = &unk_10008CA40;
  id v12 = v4;
  uint64_t v13 = self;
  id v14 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_sync(v6, block);

  id v9 = [v7 copy];

  return v9;
}

- (id)gizmoAppWithBundleID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_10000D0EC;
  id v16 = sub_10000D0FC;
  id v17 = 0;
  uint64_t v5 = [(ACXAvailableApplicationManager *)self stateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D104;
  block[3] = &unk_10008CA18;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (BOOL)gizmoAppIsLocallyAvailableWithBundleID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v5 = [(ACXAvailableApplicationManager *)self stateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D27C;
  block[3] = &unk_10008CA18;
  id v9 = v4;
  id v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (id)allAvailableApps
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_10000D0EC;
  uint64_t v11 = sub_10000D0FC;
  id v12 = 0;
  unint64_t v3 = [(ACXAvailableApplicationManager *)self stateQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000D408;
  v6[3] = &unk_10008C950;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)bundleIDsOfAvailableAppsExcludingSystemApps
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_10000D0EC;
  uint64_t v11 = sub_10000D0FC;
  id v12 = (id)objc_opt_new();
  unint64_t v3 = [(ACXAvailableApplicationManager *)self stateQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000D59C;
  v6[3] = &unk_10008C9F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = [(id)v8[5] copy];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)allAvailablePlaceholders
{
  id v2 = objc_opt_new();
  unint64_t v3 = +[LSApplicationRecord enumeratorWithOptions:64];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v8, "isPlaceholder", v15))
        {
          uint64_t v9 = [v8 applicationState];
          unsigned int v10 = [v9 isDowngraded];

          if (!v10)
          {
            uint64_t v11 = [v8 bundleIdentifier];
            [v2 addObject:v11];
            goto LABEL_14;
          }
          if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
          {
            uint64_t v11 = [v8 bundleIdentifier];
            uint64_t v15 = v11;
            MOLogWrite();
LABEL_14:

            continue;
          }
        }
        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
        {
          id v12 = [v8 bundleIdentifier];
          *(_DWORD *)buf = 136315394;
          uint64_t v21 = "-[ACXAvailableApplicationManager allAvailablePlaceholders]";
          __int16 v22 = 2112;
          long long v23 = v12;
          _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: Unexpectedly received a non-placeholder for %@", buf, 0x16u);
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v5);
  }
  id v13 = objc_msgSend(v2, "copy", v15);

  return v13;
}

- (id)gizmoAppBundleIDForCompanionAppBundleID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_10000D0EC;
  long long v16 = sub_10000D0FC;
  id v17 = 0;
  id v5 = [(ACXAvailableApplicationManager *)self stateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000DA2C;
  block[3] = &unk_10008CA18;
  id v10 = v4;
  uint64_t v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)gizmoAppBundleIDsForCompanionAppBundleIDs:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableSet);
  id v6 = [(ACXAvailableApplicationManager *)self stateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000DBA4;
  block[3] = &unk_10008CA40;
  id v12 = v4;
  id v13 = self;
  id v14 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_sync(v6, block);

  id v9 = [v7 copy];

  return v9;
}

- (id)gizmoAppForCompanionAppBundleID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_10000D0EC;
  long long v16 = sub_10000D0FC;
  id v17 = 0;
  id v5 = [(ACXAvailableApplicationManager *)self stateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000DE68;
  block[3] = &unk_10008CA68;
  void block[4] = self;
  id v10 = v4;
  uint64_t v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)_alwaysIgnoredSystemAppBundleIDs
{
  return +[NSSet setWithObject:@"com.apple.NanoSettings"];
}

- (id)_supplementalSystemAppBundleIDMappingForWatchOSSixAndLater
{
  return +[NSDictionary dictionary];
}

- (id)_systemAppBundleIDMappingForPreWatchOSSix
{
  return &off_100097A30;
}

- (id)_supplementalSystemAppBundleIDMappingForPreWatchOSSix
{
  return &off_100097A58;
}

- (id)availableSystemAppWithBundleID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  long long v23 = sub_10000D0EC;
  id v24 = sub_10000D0FC;
  id v25 = 0;
  id v7 = [(ACXAvailableApplicationManager *)self possibleCompanionDeletableSystemAppToWatchCounterpartsMap];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000E110;
  v17[3] = &unk_10008CDF8;
  id v8 = v6;
  id v18 = v8;
  long long v19 = &v20;
  [v7 enumerateKeysAndObjectsUsingBlock:v17];

  uint64_t v12 = (void *)v21[5];
  if (v12)
  {
    id v13 = 0;
  }
  else
  {
    uint64_t v14 = sub_100007574((uint64_t)"-[ACXAvailableApplicationManager availableSystemAppWithBundleID:error:]", 836, @"ACXErrorDomain", 19, @"Could not locate an available system app with bundle ID %@", v9, v10, v11, (uint64_t)v8);
    id v13 = v14;
    uint64_t v12 = (void *)v21[5];
    if (a4 && !v12)
    {
      id v13 = v14;
      *a4 = v13;
      uint64_t v12 = (void *)v21[5];
    }
  }
  id v15 = v12;

  _Block_object_dispose(&v20, 8);

  return v15;
}

- (BOOL)systemAppIsAvailableWithBundleID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  id v7 = +[LSApplicationWorkspace defaultWorkspace];
  id v8 = [(ACXAvailableApplicationManager *)self possibleCompanionDeletableSystemAppToWatchCounterpartsMap];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000E3D4;
  v19[3] = &unk_10008CE20;
  id v9 = v6;
  id v20 = v9;
  id v10 = v7;
  id v21 = v10;
  uint64_t v22 = &v23;
  [v8 enumerateKeysAndObjectsUsingBlock:v19];

  if (*((unsigned char *)v24 + 24))
  {
    id v14 = 0;
    int v15 = 1;
  }
  else
  {
    long long v16 = sub_100007574((uint64_t)"-[ACXAvailableApplicationManager systemAppIsAvailableWithBundleID:error:]", 861, @"ACXErrorDomain", 19, @"Could not locate an available system app with bundle ID %@", v11, v12, v13, (uint64_t)v9);
    id v14 = v16;
    int v15 = *((unsigned __int8 *)v24 + 24);
    if (a4 && !*((unsigned char *)v24 + 24))
    {
      id v14 = v16;
      *a4 = v14;
      int v15 = *((unsigned __int8 *)v24 + 24);
    }
  }
  BOOL v17 = v15 != 0;

  _Block_object_dispose(&v23, 8);
  return v17;
}

- (id)companionBundleIDForLocallyAvailableSystemApp:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  char v26 = sub_10000D0EC;
  long long v27 = sub_10000D0FC;
  id v28 = 0;
  id v7 = +[LSApplicationWorkspace defaultWorkspace];
  id v8 = [(ACXAvailableApplicationManager *)self possibleCompanionDeletableSystemAppToWatchCounterpartsMap];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000E63C;
  v19[3] = &unk_10008CE20;
  id v9 = v6;
  id v20 = v9;
  id v10 = v7;
  id v21 = v10;
  uint64_t v22 = &v23;
  [v8 enumerateKeysAndObjectsUsingBlock:v19];

  id v14 = (void *)v24[5];
  if (v14)
  {
    id v15 = 0;
  }
  else
  {
    long long v16 = sub_100007574((uint64_t)"-[ACXAvailableApplicationManager companionBundleIDForLocallyAvailableSystemApp:error:]", 886, @"ACXErrorDomain", 19, @"Could not locate an available system app with bundle ID %@", v11, v12, v13, (uint64_t)v9);
    id v15 = v16;
    id v14 = (void *)v24[5];
    if (a4 && !v14)
    {
      id v15 = v16;
      *a4 = v15;
      id v14 = (void *)v24[5];
    }
  }
  id v17 = v14;

  _Block_object_dispose(&v23, 8);

  return v17;
}

- (id)_bundleIDsOfLocallyAvailableSystemApps
{
  unint64_t v3 = objc_opt_new();
  id v4 = +[LSApplicationWorkspace defaultWorkspace];
  id v5 = [(ACXAvailableApplicationManager *)self possibleCompanionDeletableSystemAppToWatchCounterpartsMap];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000E7C8;
  v11[3] = &unk_10008CE48;
  id v12 = v4;
  id v6 = v3;
  id v13 = v6;
  id v7 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v11];

  id v8 = v13;
  id v9 = v6;

  return v9;
}

- (id)bundleIDsOfLocallyAvailableSystemApps
{
  unint64_t v3 = [(ACXAvailableApplicationManager *)self _bundleIDsOfLocallyAvailableSystemApps];
  id v4 = [(ACXAvailableApplicationManager *)self _supplementalSystemAppBundleIDMappingForWatchOSSixAndLater];
  id v5 = [v4 allKeys];
  [v3 addObjectsFromArray:v5];

  id v6 = [v3 copy];

  return v6;
}

- (id)bundleIDsOfLocallyAvailableSystemAppsForPreWatchOSSix
{
  unint64_t v3 = objc_opt_new();
  id v4 = +[LSApplicationWorkspace defaultWorkspace];
  id v5 = [(ACXAvailableApplicationManager *)self _systemAppBundleIDMappingForPreWatchOSSix];
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  id v14 = sub_10000E9E8;
  id v15 = &unk_10008CE70;
  id v16 = v4;
  id v17 = v3;
  id v6 = v3;
  id v7 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:&v12];

  id v8 = [(ACXAvailableApplicationManager *)self _supplementalSystemAppBundleIDMappingForPreWatchOSSix];
  id v9 = [v8 allKeys];
  [v6 addObjectsFromArray:v9];

  id v10 = [v6 copy];

  return v10;
}

- (id)locallyAvailableSystemAppBundleIDToCompanionBundleIDMapping
{
  unint64_t v3 = objc_opt_new();
  id v4 = +[LSApplicationWorkspace defaultWorkspace];
  id v5 = [(ACXAvailableApplicationManager *)self possibleCompanionDeletableSystemAppToWatchCounterpartsMap];
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  id v12 = sub_10000EB50;
  uint64_t v13 = &unk_10008CE48;
  id v14 = v4;
  id v15 = v3;
  id v6 = v3;
  id v7 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:&v10];

  id v8 = objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

- (id)locallyAvailableSystemAppBundleIDToCompanionBundleIDMappingForPreWatchOSSix
{
  unint64_t v3 = objc_opt_new();
  id v4 = +[LSApplicationWorkspace defaultWorkspace];
  id v5 = [(ACXAvailableApplicationManager *)self _systemAppBundleIDMappingForPreWatchOSSix];
  uint64_t v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  uint64_t v13 = sub_10000ED9C;
  id v14 = &unk_10008CE70;
  id v15 = v4;
  id v16 = v3;
  id v6 = v3;
  id v7 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:&v11];

  id v8 = [(ACXAvailableApplicationManager *)self _supplementalSystemAppBundleIDMappingForPreWatchOSSix];
  [v6 addEntriesFromDictionary:v8];

  id v9 = [v6 copy];

  return v9;
}

- (NSDictionary)possibleCompanionDeletableSystemAppToWatchCounterpartsMap
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_10000D0EC;
  uint64_t v11 = sub_10000D0FC;
  id v12 = 0;
  unint64_t v3 = [(ACXAvailableApplicationManager *)self stateQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000EF2C;
  v6[3] = &unk_10008C9F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (void)applicationsDidInstall:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v16 = 0;
        uint64_t v11 = sub_1000098D8(v10, &v16);
        id v12 = v16;
        if (v11)
        {
          [v4 addObject:v11];
        }
        else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
        {
          uint64_t v13 = objc_msgSend(v10, "bundleIdentifier", v13, v14);
          id v14 = v12;
          MOLogWrite();
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  [(ACXAvailableApplicationManager *)self applicationsInstalledWithAppRecords:v4];
}

- (void)applicationsDidUninstall:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      id v12 = v9;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v11), "correspondingApplicationRecord", (void)v13);

        [v5 addObject:v9];
        uint64_t v11 = (char *)v11 + 1;
        id v12 = v9;
      }
      while (v8 != v11);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  [(ACXAvailableApplicationManager *)self applicationsUninstalledWithAppRecords:v5];
}

- (void)applicationInstallsDidStart:(id)a3
{
  id v3 = a3;
  long long v18 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "appState", v15, v16);
        if ([v10 isValid])
        {
          uint64_t v11 = [v9 appState];
          unsigned int v12 = [v11 isDowngraded];

          if (v12)
          {
            if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
            {
              long long v15 = [v9 bundleIdentifier];
              MOLogWrite();
            }
            id v19 = 0;
            long long v13 = sub_1000098D8(v9, &v19);
            id v14 = v19;
            if (v13)
            {
              [v18 addObject:v13];
            }
            else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
            {
              long long v15 = objc_msgSend(v9, "bundleIdentifier", v15);
              id v16 = v14;
              MOLogWrite();
            }
            goto LABEL_21;
          }
        }
        else
        {
        }
        if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7)
        {
          id v14 = [v9 bundleIdentifier];
          long long v15 = v14;
          MOLogWrite();
LABEL_21:

          continue;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }

  if ([v18 count]) {
    [(ACXAvailableApplicationManager *)self applicationsUninstalledWithAppRecords:v18];
  }
}

- (OS_dispatch_queue)stateQueue
{
  return self->_stateQueue;
}

- (NSUUID)lastLSUUID
{
  return self->_lastLSUUID;
}

- (void)setLastLSUUID:(id)a3
{
}

- (NSUUID)ourDBUUID
{
  return self->_ourDBUUID;
}

- (void)setOurDBUUID:(id)a3
{
}

- (unint64_t)lastSequenceNumber
{
  return self->_lastSequenceNumber;
}

- (void)setLastSequenceNumber:(unint64_t)a3
{
  self->_lastSequenceNumber = a3;
}

- (NSMutableDictionary)companionToWatchAppsBundleIDMap
{
  return self->_companionToWatchAppsBundleIDMap;
}

- (void)setCompanionToWatchAppsBundleIDMap:(id)a3
{
}

- (NSMutableDictionary)appList
{
  return self->_appList;
}

- (void)setAppList:(id)a3
{
}

- (BOOL)trustChangeEvaluationPending
{
  return self->_trustChangeEvaluationPending;
}

- (void)setTrustChangeEvaluationPending:(BOOL)a3
{
  self->_trustChangeEvaluationPending = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appList, 0);
  objc_storeStrong((id *)&self->_companionToWatchAppsBundleIDMap, 0);
  objc_storeStrong((id *)&self->_ourDBUUID, 0);
  objc_storeStrong((id *)&self->_lastLSUUID, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);

  objc_storeStrong((id *)&self->_possibleCompanionDeletableSystemAppToWatchCounterpartsMap, 0);
}

@end