@interface ACXLaunchServicesWatcher
+ (id)sharedWatcher;
- (ACXLaunchServicesWatcher)init;
- (BOOL)_onQueue_clearApplicationEventsForDBUUID:(id)a3 endingSequenceNumber:(unint64_t)a4 error:(id *)a5;
- (BOOL)_onQueue_enumerateApplicationsForBundleIDs:(id)a3 error:(id *)a4 enumerator:(id)a5;
- (BOOL)_onQueue_infoMatchesCurrentLSDatabaseWithUUID:(id *)a3;
- (BOOL)clearApplicationEventsForDBUUID:(id)a3 endingSequenceNumber:(unint64_t)a4 error:(id *)a5;
- (BOOL)enumerateApplicationsForBundleIDs:(id)a3 currentDBUUID:(id *)a4 currentLastSequenceNumber:(unint64_t *)a5 error:(id *)a6 enumerator:(id)a7;
- (NSMutableArray)eventQueue;
- (NSMutableDictionary)appList;
- (NSUUID)lastLSUUID;
- (NSUUID)ourDBUUID;
- (OS_dispatch_queue)stateQueue;
- (id)_onQueue_applicationForAppRecord:(id)a3 error:(id *)a4;
- (id)allInstalledBundleIDsInDatabaseWithUUID:(id *)a3 lastSequenceNumber:(unint64_t *)a4;
- (id)applicationForAppRecord:(id)a3 currentLastSequenceNumber:(unint64_t *)a4 error:(id *)a5;
- (id)applicationsForAppRecords:(id)a3 currentDBUUID:(id *)a4 currentLastSequenceNumber:(unint64_t *)a5 error:(id *)a6;
- (unint64_t)eventQueueStartSequenceNumber;
- (unint64_t)lastSequenceNumber;
- (void)_onQueue_addAppEvent:(id)a3;
- (void)_onQueue_noteDatabaseRebuild;
- (void)_onQueue_noteNewApps:(id)a3 updatedApps:(id)a4 removedApps:(id)a5 forDBUUID:(id)a6 endingSequenceNumber:(unint64_t)a7;
- (void)_onQueue_reSyncWithLS;
- (void)_onQueue_writeAppListToDisk;
- (void)applicationInstallsDidStart:(id)a3;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)applicationsInstalledWithAppRecords:(id)a3;
- (void)applicationsUninstalledWithAppRecords:(id)a3;
- (void)enumerateApplicationEventsReturningDBUUID:(id *)a3 startingSequenceNumber:(unint64_t *)a4 withBlock:(id)a5;
- (void)fetchDatabaseUUID:(id *)a3 andCurrentLastSequenceNumber:(unint64_t *)a4;
- (void)setAppList:(id)a3;
- (void)setEventQueue:(id)a3;
- (void)setEventQueueStartSequenceNumber:(unint64_t)a3;
- (void)setLastLSUUID:(id)a3;
- (void)setLastSequenceNumber:(unint64_t)a3;
- (void)setOurDBUUID:(id)a3;
@end

@implementation ACXLaunchServicesWatcher

+ (id)sharedWatcher
{
  if (qword_1000A55A0 != -1) {
    dispatch_once(&qword_1000A55A0, &stru_10008D8E8);
  }
  v2 = (void *)qword_1000A5598;

  return v2;
}

- (ACXLaunchServicesWatcher)init
{
  v10.receiver = self;
  v10.super_class = (Class)ACXLaunchServicesWatcher;
  v2 = [(ACXLaunchServicesWatcher *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.appconduit.LSWatcher", v3);
    stateQueue = v2->_stateQueue;
    v2->_stateQueue = (OS_dispatch_queue *)v4;

    v6 = [(ACXLaunchServicesWatcher *)v2 stateQueue];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100031D50;
    v8[3] = &unk_10008CD30;
    v9 = v2;
    sub_100006BB8(v6, v8);
  }
  return v2;
}

- (void)_onQueue_writeAppListToDisk
{
  v27 = sub_100007CEC();
  v3 = [v27 URLByAppendingPathComponent:@"AvailableCompanionApps.plist" isDirectory:0];
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    dispatch_queue_t v4 = [(ACXLaunchServicesWatcher *)self lastLSUUID];
    v25 = [(ACXLaunchServicesWatcher *)self ourDBUUID];
    unint64_t v26 = [(ACXLaunchServicesWatcher *)self lastSequenceNumber];
    v23 = v4;
    MOLogWrite();
  }
  v5 = objc_opt_new();
  v6 = [(ACXLaunchServicesWatcher *)self appList];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100032D00;
  v33[3] = &unk_10008D938;
  id v7 = v5;
  id v34 = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:v33];

  v8 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v9 = [(ACXLaunchServicesWatcher *)self eventQueue];
  id v10 = [v9 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v30;
    do
    {
      v13 = 0;
      do
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * (void)v13), "dictionaryRepresentation", v23, v25, v26);
        [v8 addObject:v14];

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v11);
  }

  v35[0] = @"Version";
  v35[1] = @"AppList";
  v36[0] = &off_100097768;
  v36[1] = v7;
  v35[2] = @"LSUUID";
  v15 = [(ACXLaunchServicesWatcher *)self lastLSUUID];
  v16 = [v15 UUIDString];
  v36[2] = v16;
  v35[3] = @"OurDBUUID";
  v17 = [(ACXLaunchServicesWatcher *)self ourDBUUID];
  v18 = [v17 UUIDString];
  v36[3] = v18;
  v35[4] = @"LastSequenceNumber";
  v19 = +[NSNumber numberWithUnsignedInteger:[(ACXLaunchServicesWatcher *)self lastSequenceNumber]];
  v36[4] = v19;
  v36[5] = v8;
  v35[5] = @"AppEvents";
  v35[6] = @"AppEventsStartSequenceNumber";
  uint64_t v20 = +[NSNumber numberWithUnsignedInteger:[(ACXLaunchServicesWatcher *)self eventQueueStartSequenceNumber]];
  v36[6] = v20;
  v21 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:7];

  id v28 = 0;
  LOBYTE(v20) = objc_msgSend(v21, "ACX_writeToURL:format:options:error:", v3, 200, 268435457, &v28);
  id v22 = v28;
  if ((v20 & 1) == 0 && (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3))
  {
    v24 = objc_msgSend(v3, "path", v23, v25);
    MOLogWrite();
  }
}

- (BOOL)_onQueue_infoMatchesCurrentLSDatabaseWithUUID:(id *)a3
{
  v5 = +[LSApplicationWorkspace defaultWorkspace];
  id v16 = 0;
  id v17 = 0;
  [v5 getKnowledgeUUID:&v17 andSequenceNumber:&v16];
  id v6 = v17;
  id v7 = v16;

  if (a3) {
    *a3 = v6;
  }
  v8 = [(ACXLaunchServicesWatcher *)self lastLSUUID];

  if (!v8)
  {
    if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7) {
      MOLogWrite();
    }
    goto LABEL_12;
  }
  v9 = [(ACXLaunchServicesWatcher *)self lastLSUUID];
  unsigned __int8 v10 = [v6 isEqual:v9];

  if ((v10 & 1) == 0)
  {
    if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7)
    {
      uint64_t v12 = [(ACXLaunchServicesWatcher *)self lastLSUUID];
      v13 = [v12 UUIDString];
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

- (id)_onQueue_applicationForAppRecord:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(ACXLaunchServicesWatcher *)self appList];
  v8 = [v6 bundleIdentifier];
  v9 = [v7 objectForKeyedSubscript:v8];

  if (v9)
  {
    unsigned __int8 v10 = [v6 databaseUUID];
    BOOL v11 = [(ACXLaunchServicesWatcher *)self lastLSUUID];
    unsigned __int8 v12 = [v10 isEqual:v11];

    if (v12)
    {
      id v14 = [v9 lsSequenceNumber];
      if (v14 == [v6 sequenceNumber])
      {
        v15 = [ACXCompanionApplication alloc];
        id v16 = [(ACXLaunchServicesWatcher *)self ourDBUUID];
        id v17 = -[ACXCompanionApplication initWithApplicationRecord:databaseUUID:sequenceNumber:](v15, "initWithApplicationRecord:databaseUUID:sequenceNumber:", v6, v16, [v9 acxSequenceNumber]);

        if (v17)
        {
          id v19 = 0;
          goto LABEL_14;
        }
        sub_100007710((uint64_t)"-[ACXLaunchServicesWatcher _onQueue_applicationForAppRecord:error:]", 307, @"ACXErrorDomain", 1, 0, 0, @"Failed to create app object instance for %@", v18, (uint64_t)v6);
        id v19 = (id)objc_claimAutoreleasedReturnValue();
        if (!a4) {
          goto LABEL_13;
        }
LABEL_11:
        id v19 = v19;
        id v17 = 0;
        *a4 = v19;
        goto LABEL_14;
      }
      uint64_t v25 = (uint64_t)v14;
      id v22 = @"Sequence number of app record is different from what were expecting (expecting %lu; got %lu)";
      uint64_t v23 = 300;
    }
    else
    {
      id v22 = @"LS database UUID is different from what we were expecting; triggering rebuild.";
      uint64_t v23 = 292;
    }
    sub_100007710((uint64_t)"-[ACXLaunchServicesWatcher _onQueue_applicationForAppRecord:error:]", v23, @"ACXErrorDomain", 43, 0, 0, v22, v13, v25);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v20 = [v6 bundleIdentifier];
    sub_100007710((uint64_t)"-[ACXLaunchServicesWatcher _onQueue_applicationForAppRecord:error:]", 286, @"ACXErrorDomain", 43, 0, 0, @"No sequence number record found for app %@", v21, (uint64_t)v20);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  [(ACXLaunchServicesWatcher *)self _onQueue_reSyncWithLS];
  if (a4) {
    goto LABEL_11;
  }
LABEL_13:
  id v17 = 0;
LABEL_14:

  return v17;
}

- (id)applicationForAppRecord:(id)a3 currentLastSequenceNumber:(unint64_t *)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v25 = 0;
  unint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = sub_100033350;
  long long v29 = sub_100033360;
  id v30 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_100033350;
  uint64_t v23 = sub_100033360;
  id v24 = 0;
  v9 = [(ACXLaunchServicesWatcher *)self stateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100033368;
  block[3] = &unk_10008D960;
  id v16 = &v25;
  block[4] = self;
  id v10 = v8;
  id v17 = &v19;
  uint64_t v18 = a4;
  id v15 = v10;
  dispatch_sync(v9, block);

  BOOL v11 = (void *)v26[5];
  if (a5 && !v11)
  {
    *a5 = (id) v20[5];
    BOOL v11 = (void *)v26[5];
  }
  id v12 = v11;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v12;
}

- (id)applicationsForAppRecords:(id)a3 currentDBUUID:(id *)a4 currentLastSequenceNumber:(unint64_t *)a5 error:(id *)a6
{
  id v10 = a3;
  BOOL v11 = objc_opt_new();
  uint64_t v28 = 0;
  long long v29 = &v28;
  uint64_t v30 = 0x3032000000;
  long long v31 = sub_100033350;
  long long v32 = sub_100033360;
  id v33 = 0;
  id v12 = [(ACXLaunchServicesWatcher *)self stateQueue];
  uint64_t v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  uint64_t v20 = sub_1000335B4;
  uint64_t v21 = &unk_10008D988;
  id v13 = v10;
  id v22 = v13;
  uint64_t v23 = self;
  id v14 = v11;
  id v24 = v14;
  uint64_t v25 = &v28;
  unint64_t v26 = a5;
  uint64_t v27 = a4;
  dispatch_sync(v12, &v18);

  if (a6)
  {
    id v15 = (void *)v29[5];
    if (v15)
    {
      *a6 = v15;

      id v14 = 0;
    }
  }
  id v16 = objc_msgSend(v14, "copy", v18, v19, v20, v21);

  _Block_object_dispose(&v28, 8);

  return v16;
}

- (BOOL)_onQueue_enumerateApplicationsForBundleIDs:(id)a3 error:(id *)a4 enumerator:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(id, void *))a5;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v7;
  id v9 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v9)
  {
    id v10 = v9;
    unint64_t v26 = a4;
    id v11 = 0;
    uint64_t v12 = *(void *)v32;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v32 != v12) {
        objc_enumerationMutation(obj);
      }
      uint64_t v14 = *(void *)(*((void *)&v31 + 1) + 8 * v13);
      id v15 = objc_alloc((Class)LSApplicationRecord);
      id v30 = v11;
      id v16 = [v15 initWithBundleIdentifier:v14 allowPlaceholder:0 error:&v30];
      id v17 = v30;

      if (!v16) {
        break;
      }
      uint64_t v19 = [v16 applicationState];
      unsigned __int8 v20 = [v19 isInstalled];

      if ((v20 & 1) == 0)
      {
        sub_100007710((uint64_t)"-[ACXLaunchServicesWatcher _onQueue_enumerateApplicationsForBundleIDs:error:enumerator:]", 379, @"ACXErrorDomain", 43, 0, 0, @"Failed to fetch valid applicationState for LSApplicationRecord for %@", v21, v14);
        goto LABEL_16;
      }
      id v29 = v17;
      id v22 = [(ACXLaunchServicesWatcher *)self _onQueue_applicationForAppRecord:v16 error:&v29];
      id v11 = v29;

      if (!v22) {
        goto LABEL_17;
      }
      v8[2](v8, v22);

      if (v10 == (id)++v13)
      {
        id v10 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_13;
      }
    }
    sub_100007710((uint64_t)"-[ACXLaunchServicesWatcher _onQueue_enumerateApplicationsForBundleIDs:error:enumerator:]", 376, @"ACXErrorDomain", 43, v17, 0, @"Failed to fetch valid LSApplicationRecord for %@", v18, v14);
LABEL_16:
    id v11 = (id)objc_claimAutoreleasedReturnValue();

LABEL_17:
    uint64_t v23 = obj;

    if (v26)
    {
      id v11 = v11;
      BOOL v24 = 0;
      *unint64_t v26 = v11;
    }
    else
    {
      BOOL v24 = 0;
    }
    goto LABEL_20;
  }
  id v11 = 0;
LABEL_13:
  uint64_t v23 = obj;

  BOOL v24 = 1;
LABEL_20:

  return v24;
}

- (BOOL)enumerateApplicationsForBundleIDs:(id)a3 currentDBUUID:(id *)a4 currentLastSequenceNumber:(unint64_t *)a5 error:(id *)a6 enumerator:(id)a7
{
  id v11 = a3;
  id v12 = a7;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 0;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = sub_100033350;
  v40 = sub_100033360;
  id v41 = 0;
  uint64_t v30 = 0;
  long long v31 = &v30;
  uint64_t v32 = 0x3032000000;
  long long v33 = sub_100033350;
  long long v34 = sub_100033360;
  id v35 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  uint64_t v13 = [(ACXLaunchServicesWatcher *)self stateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100033C50;
  block[3] = &unk_10008D9B0;
  id v22 = &v42;
  block[4] = self;
  id v14 = v11;
  id v20 = v14;
  id v15 = v12;
  id v21 = v15;
  uint64_t v23 = &v36;
  BOOL v24 = &v30;
  uint64_t v25 = &v26;
  dispatch_sync(v13, block);

  if (*((unsigned char *)v43 + 24))
  {
    *a4 = (id) v31[5];
    *a5 = v27[3];
  }
  else if (a6)
  {
    *a6 = (id) v37[5];
  }
  char v16 = *((unsigned char *)v43 + 24);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

  return v16;
}

- (void)_onQueue_addAppEvent:(id)a3
{
  id v18 = a3;
  dispatch_queue_t v4 = [(ACXLaunchServicesWatcher *)self eventQueue];
  if (v4)
  {
    v5 = v4;
    if ((unint64_t)[v4 count] >= 0xF)
    {
      id v6 = (char *)[v5 count] - 14;
      objc_msgSend(v5, "removeObjectsInRange:", 0, v6);
      id v7 = [v5 objectAtIndexedSubscript:0];
      id v8 = [v7 sequenceNumber];

      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
      {
        char v16 = v6;
        id v17 = v8;
        MOLogWrite();
      }
      -[ACXLaunchServicesWatcher setEventQueueStartSequenceNumber:](self, "setEventQueueStartSequenceNumber:", v8, v16, v17);
    }
  }
  else
  {
    v5 = objc_opt_new();
    [(ACXLaunchServicesWatcher *)self setEventQueue:v5];
  }
  id v9 = [v18 bundleID];
  id v10 = [v5 count];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = 0;
    while (1)
    {
      uint64_t v13 = [v5 objectAtIndexedSubscript:v12];
      id v14 = [v13 bundleID];
      unsigned int v15 = [v14 isEqualToString:v9];

      if (v15) {
        break;
      }

      if (v11 == (id)++v12) {
        goto LABEL_14;
      }
    }
    [v5 removeObjectAtIndex:v12];
  }
LABEL_14:
  [v5 addObject:v18];
}

- (BOOL)_onQueue_clearApplicationEventsForDBUUID:(id)a3 endingSequenceNumber:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [(ACXLaunchServicesWatcher *)self eventQueue];
  id v10 = [(ACXLaunchServicesWatcher *)self ourDBUUID];
  unsigned __int8 v11 = [v10 isEqual:v8];

  if ((v11 & 1) == 0)
  {
    id v20 = sub_100007710((uint64_t)"-[ACXLaunchServicesWatcher _onQueue_clearApplicationEventsForDBUUID:endingSequenceNumber:error:]", 462, @"ACXErrorDomain", 43, 0, 0, @"Database UUIDs did not match", v12, v28);
    goto LABEL_40;
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v13 = v9;
  id v14 = (char *)[v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v14)
  {
    unsigned int v15 = v14;
    uint64_t v32 = v9;
    long long v33 = a5;
    char v16 = 0;
    uint64_t v17 = *(void *)v35;
    while (2)
    {
      id v18 = 0;
      uint64_t v19 = &v15[(void)v16];
      do
      {
        if (*(void *)v35 != v17) {
          objc_enumerationMutation(v13);
        }
        if ((unint64_t)[*(id *)(*((void *)&v34 + 1) + 8 * (void)v18) sequenceNumber] > a4)
        {
          uint64_t v19 = &v18[(void)v16];
          goto LABEL_13;
        }
        ++v18;
      }
      while (v15 != v18);
      unsigned int v15 = (char *)[v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
      char v16 = v19;
      if (v15) {
        continue;
      }
      break;
    }
LABEL_13:

    id v9 = v32;
    a5 = v33;
    if (v19)
    {
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
      {
        unint64_t v28 = (unint64_t)v19;
        MOLogWrite();
      }
      objc_msgSend(v13, "removeObjectsInRange:", 0, v19, v28);
      int v21 = 1;
      goto LABEL_23;
    }
  }
  else
  {
  }
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
    MOLogWrite();
  }
  int v21 = 0;
LABEL_23:
  unint64_t v22 = a4 + 1;
  unint64_t v23 = [(ACXLaunchServicesWatcher *)self lastSequenceNumber];
  unint64_t v24 = v23 + 1;
  if (a4 + 1 > v23 + 1)
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
    {
      unint64_t v28 = a4;
      unint64_t v30 = v23;
      MOLogWrite();
    }
    unint64_t v22 = v24;
  }
  unint64_t v25 = [(ACXLaunchServicesWatcher *)self eventQueueStartSequenceNumber];
  if (v25 == v22)
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
    {
      unint64_t v29 = v22;
      MOLogWrite();
    }
    if (!v21) {
      goto LABEL_39;
    }
  }
  else
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
    {
      unint64_t v29 = v25;
      unint64_t v31 = v22;
      MOLogWrite();
    }
    -[ACXLaunchServicesWatcher setEventQueueStartSequenceNumber:](self, "setEventQueueStartSequenceNumber:", v22, v29, v31);
  }
  [(ACXLaunchServicesWatcher *)self _onQueue_writeAppListToDisk];
LABEL_39:
  id v20 = 0;
LABEL_40:
  if (a5) {
    char v26 = v11;
  }
  else {
    char v26 = 1;
  }
  if ((v26 & 1) == 0) {
    *a5 = v20;
  }

  return v11;
}

- (BOOL)clearApplicationEventsForDBUUID:(id)a3 endingSequenceNumber:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v25 = 0;
  char v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  unint64_t v22 = sub_100033350;
  unint64_t v23 = sub_100033360;
  id v24 = 0;
  id v9 = [(ACXLaunchServicesWatcher *)self stateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100034398;
  block[3] = &unk_10008D960;
  char v16 = &v25;
  block[4] = self;
  id v10 = v8;
  uint64_t v17 = &v19;
  unint64_t v18 = a4;
  id v15 = v10;
  dispatch_sync(v9, block);

  int v11 = *((unsigned __int8 *)v26 + 24);
  if (a5 && !*((unsigned char *)v26 + 24))
  {
    *a5 = (id) v20[5];
    int v11 = *((unsigned __int8 *)v26 + 24);
  }
  BOOL v12 = v11 != 0;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v12;
}

- (void)enumerateApplicationEventsReturningDBUUID:(id *)a3 startingSequenceNumber:(unint64_t *)a4 withBlock:(id)a5
{
  id v8 = a5;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  unint64_t v22 = sub_100033350;
  unint64_t v23 = sub_100033360;
  id v24 = 0;
  uint64_t v15 = 0;
  char v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  id v9 = [(ACXLaunchServicesWatcher *)self stateQueue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000345A8;
  v11[3] = &unk_10008D9D8;
  v11[4] = self;
  id v12 = v8;
  id v13 = &v19;
  id v14 = &v15;
  id v10 = v8;
  dispatch_sync(v9, v11);

  *a3 = (id) v20[5];
  *a4 = v16[3];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
}

- (void)fetchDatabaseUUID:(id *)a3 andCurrentLastSequenceNumber:(unint64_t *)a4
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  char v16 = sub_100033350;
  uint64_t v17 = sub_100033360;
  id v18 = 0;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  id v7 = [(ACXLaunchServicesWatcher *)self stateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100034834;
  block[3] = &unk_10008DA00;
  block[4] = self;
  void block[5] = &v13;
  block[6] = &v9;
  dispatch_sync(v7, block);

  *a3 = (id) v14[5];
  *a4 = v10[3];
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
}

- (id)allInstalledBundleIDsInDatabaseWithUUID:(id *)a3 lastSequenceNumber:(unint64_t *)a4
{
  uint64_t v21 = 0;
  unint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_100033350;
  uint64_t v25 = sub_100033360;
  id v26 = 0;
  uint64_t v15 = 0;
  char v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_100033350;
  uint64_t v19 = sub_100033360;
  id v20 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  id v7 = [(ACXLaunchServicesWatcher *)self stateQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100034A60;
  v10[3] = &unk_10008DA28;
  v10[4] = self;
  v10[5] = &v21;
  v10[6] = &v15;
  v10[7] = &v11;
  dispatch_sync(v7, v10);

  *a3 = (id) v16[5];
  *a4 = v12[3];
  id v8 = (id)v22[5];
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);

  return v8;
}

- (void)_onQueue_noteDatabaseRebuild
{
  id v3 = +[ACXCompanionSyncConnectionManager sharedConnectionManager];
  v2 = [v3 connectionForActivePairedDevice];
  [v2 noteCompanionAppDatabaseRebuild];
}

- (void)_onQueue_noteNewApps:(id)a3 updatedApps:(id)a4 removedApps:(id)a5 forDBUUID:(id)a6 endingSequenceNumber:(unint64_t)a7
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v16 = +[ACXCompanionSyncConnectionManager sharedConnectionManager];
  uint64_t v15 = [v16 connectionForActivePairedDevice];
  [v15 noteNewCompanionApps:v14 updatedApps:v13 removedApps:v12 forDBUUID:v11 endingSequenceNumber:a7];
}

- (void)_onQueue_reSyncWithLS
{
  v48 = objc_opt_new();
  v49 = objc_opt_new();
  v51 = objc_opt_new();
  unint64_t v3 = [(ACXLaunchServicesWatcher *)self lastSequenceNumber];
  id v68 = 0;
  v58 = self;
  LODWORD(self) = [(ACXLaunchServicesWatcher *)self _onQueue_infoMatchesCurrentLSDatabaseWithUUID:&v68];
  id v4 = v68;
  v5 = &qword_1000A5608;
  int v47 = (int)self;
  id v46 = v4;
  if (self)
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
    {
      [(ACXLaunchServicesWatcher *)v58 ourDBUUID];
      char v45 = v43 = v4;
      MOLogWrite();
    }
    uint64_t v54 = v3 + 1;
    v59 = [(ACXLaunchServicesWatcher *)v58 appList];
  }
  else
  {
    [(ACXLaunchServicesWatcher *)v58 setAppList:0];
    [(ACXLaunchServicesWatcher *)v58 setLastLSUUID:v4];
    id v6 = objc_opt_new();
    [(ACXLaunchServicesWatcher *)v58 setOurDBUUID:v6];

    [(ACXLaunchServicesWatcher *)v58 setEventQueue:0];
    [(ACXLaunchServicesWatcher *)v58 setEventQueueStartSequenceNumber:0];
    [(ACXLaunchServicesWatcher *)v58 setLastSequenceNumber:0];
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
    {
      v43 = [(ACXLaunchServicesWatcher *)v58 ourDBUUID];
      MOLogWrite();
    }
    v59 = 0;
    uint64_t v54 = 1;
  }
  v50 = [(ACXLaunchServicesWatcher *)v58 ourDBUUID];
  +[LSApplicationRecord enumeratorWithOptions:0];
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = [v7 countByEnumeratingWithState:&v64 objects:v74 count:16];
  id v53 = v7;
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v65;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v65 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v64 + 1) + 8 * (void)v11);
        if (([v12 isPlaceholder] & 1) == 0
          && ![v12 isSystemPlaceholder])
        {
          if (!objc_msgSend(v12, "ACX_shouldBeTrackedByLaunchServicesWatcher")) {
            goto LABEL_19;
          }
          id v14 = [v12 bundleIdentifier];
          uint64_t v15 = [v59 objectForKeyedSubscript:v14];
          v56 = v15;
          if (v15)
          {
            id v16 = v15;
            id v17 = [v15 lsSequenceNumber];
            if (v17 == [v12 sequenceNumber])
            {
              [v51 setObject:v16 forKeyedSubscript:v14];
LABEL_41:
              id v7 = v53;

              goto LABEL_19;
            }
            id v18 = v5;
            if (!*v5 || *(int *)(*v5 + 44) >= 5)
            {
              uint64_t v44 = v14;
LABEL_31:
              MOLogWrite();
            }
          }
          else
          {
            id v18 = v5;
            if (!*v5 || *(int *)(*v5 + 44) >= 5)
            {
              uint64_t v44 = v14;
              goto LABEL_31;
            }
          }
          id v20 = [[ACXCompanionApplication alloc] initWithApplicationRecord:v12 databaseUUID:v50 sequenceNumber:v54];
          if (v20)
          {
            if (v56) {
              uint64_t v21 = v48;
            }
            else {
              uint64_t v21 = v49;
            }
            objc_msgSend(v21, "addObject:", v20, v44);
            v52 = [[ACXAppEventRecord alloc] initWithRecordType:0 bundleID:v14 sequenceNumber:v54];
            [(ACXLaunchServicesWatcher *)v58 _onQueue_addAppEvent:v52];
            unint64_t v22 = [ACXLaunchServicesWatcherSequenceRecord alloc];
            id v23 = [v12 sequenceNumber];
            id v24 = [(ACXCompanionApplication *)v20 counterpartIdentifiers];
            uint64_t v25 = [(ACXLaunchServicesWatcherSequenceRecord *)v22 initWithLSSequenceNumber:v23 acxSequenceNumber:v54 counterpartIdentifiers:v24];
            [v51 setObject:v25 forKeyedSubscript:v14];

            v5 = &qword_1000A5608;
            ++v54;
          }
          else
          {
            v5 = v18;
            if (!*v18 || *(int *)(*v18 + 44) >= 3)
            {
              uint64_t v44 = v14;
              MOLogWrite();
            }
          }

          goto LABEL_41;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
        {
          uint64_t v19 = [v12 bundleIdentifier];
          *(_DWORD *)buf = 136315394;
          v71 = "-[ACXLaunchServicesWatcher _onQueue_reSyncWithLS]";
          __int16 v72 = 2112;
          v73 = v19;
          _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "%s: Unexpectedly received a placeholder for %@", buf, 0x16u);
        }
LABEL_19:
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v26 = [v7 countByEnumeratingWithState:&v64 objects:v74 count:16];
      id v9 = v26;
    }
    while (v26);
  }

  if (v47)
  {
    uint64_t v27 = [v59 allKeys];
    id v28 = [v27 mutableCopy];

    unint64_t v29 = [v51 allKeys];
    [v28 removeObjectsInArray:v29];

    v57 = objc_opt_new();
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id obj = v28;
    id v30 = [obj countByEnumeratingWithState:&v60 objects:v69 count:16];
    uint64_t v31 = v54;
    if (v30)
    {
      id v32 = v30;
      uint64_t v33 = *(void *)v61;
      do
      {
        for (i = 0; i != v32; i = (char *)i + 1)
        {
          if (*(void *)v61 != v33) {
            objc_enumerationMutation(obj);
          }
          uint64_t v35 = *(void *)(*((void *)&v60 + 1) + 8 * i);
          long long v36 = [[ACXAppEventRecord alloc] initWithRecordType:1 bundleID:v35 sequenceNumber:(char *)i + v31];
          [(ACXLaunchServicesWatcher *)v58 _onQueue_addAppEvent:v36];
          [v59 objectForKeyedSubscript:v35];
          uint64_t v38 = v37 = v31;
          uint64_t v39 = [v38 counterpartIdentifiers];

          if (v39) {
            v40 = (void *)v39;
          }
          else {
            v40 = &__NSArray0__struct;
          }
          objc_msgSend(v57, "setObject:forKeyedSubscript:", v40, v35, v44);

          uint64_t v31 = v37;
        }
        id v32 = [obj countByEnumeratingWithState:&v60 objects:v69 count:16];
        uint64_t v31 = (uint64_t)i + v37;
      }
      while (v32);
      v5 = &qword_1000A5608;
    }

    id v41 = v46;
    if ([v57 count] && (!*v5 || *(int *)(*v5 + 44) >= 5))
    {
      uint64_t v44 = objc_msgSend(v57, "allKeys", v44);
      MOLogWrite();
    }
    if (objc_msgSend(v49, "count", v44) || objc_msgSend(v48, "count") || objc_msgSend(v57, "count"))
    {
      uint64_t v42 = [(ACXLaunchServicesWatcher *)v58 ourDBUUID];
      [(ACXLaunchServicesWatcher *)v58 _onQueue_noteNewApps:v49 updatedApps:v48 removedApps:v57 forDBUUID:v42 endingSequenceNumber:v31 - 1];
    }
    id v7 = v53;
  }
  else
  {
    [(ACXLaunchServicesWatcher *)v58 _onQueue_noteDatabaseRebuild];
    v57 = 0;
    id v41 = v46;
    uint64_t v31 = v54;
  }
  -[ACXLaunchServicesWatcher setAppList:](v58, "setAppList:", v51, v44);
  [(ACXLaunchServicesWatcher *)v58 setLastSequenceNumber:v31 - 1];
  if ([(ACXLaunchServicesWatcher *)v58 _onQueue_infoMatchesCurrentLSDatabaseWithUUID:0])
  {
    if (!v47 || [v49 count] || objc_msgSend(v48, "count") || objc_msgSend(v57, "count")) {
      [(ACXLaunchServicesWatcher *)v58 _onQueue_writeAppListToDisk];
    }
  }
  else
  {
    if (!*v5 || *(int *)(*v5 + 44) >= 3) {
      MOLogWrite();
    }
    [(ACXLaunchServicesWatcher *)v58 _onQueue_reSyncWithLS];
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
  v5 = [(ACXLaunchServicesWatcher *)self stateQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003556C;
  v8[3] = &unk_10008CC28;
  void v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  sub_100006BB8(v5, v8);
}

- (void)applicationsUninstalledWithAppRecords:(id)a3
{
  id v4 = a3;
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    id v7 = v4;
    MOLogWrite();
  }
  v5 = [(ACXLaunchServicesWatcher *)self stateQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100035C20;
  v8[3] = &unk_10008CC28;
  void v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  sub_100006BB8(v5, v8);
}

- (void)applicationsDidInstall:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    id v17 = self;
    id v9 = 0;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        id v12 = v9;
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v6);
        }
        id v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v18 = 0;
        id v9 = sub_1000098D8(v13, &v18);
        id v14 = v18;

        if (v9)
        {
          [v5 addObject:v9];
        }
        else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
        {
          uint64_t v15 = objc_msgSend(v13, "bundleIdentifier", v15, v16);
          id v16 = v14;
          MOLogWrite();
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);

    self = v17;
  }

  [(ACXLaunchServicesWatcher *)self applicationsInstalledWithAppRecords:v5];
}

- (void)applicationsDidUninstall:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v14;
    do
    {
      id v11 = 0;
      id v12 = v9;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v6);
        }
        id v9 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v11), "correspondingApplicationRecord", (void)v13);

        [v5 addObject:v9];
        id v11 = (char *)v11 + 1;
        id v12 = v9;
      }
      while (v8 != v11);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  [(ACXLaunchServicesWatcher *)self applicationsUninstalledWithAppRecords:v5];
}

- (void)applicationInstallsDidStart:(id)a3
{
  id v3 = a3;
  id v18 = objc_opt_new();
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
        id v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "appState", v15, v16);
        if ([v10 isValid])
        {
          id v11 = [v9 appState];
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
    [(ACXLaunchServicesWatcher *)self applicationsUninstalledWithAppRecords:v18];
  }
}

- (OS_dispatch_queue)stateQueue
{
  return self->_stateQueue;
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

- (NSUUID)lastLSUUID
{
  return self->_lastLSUUID;
}

- (void)setLastLSUUID:(id)a3
{
}

- (NSMutableDictionary)appList
{
  return self->_appList;
}

- (void)setAppList:(id)a3
{
}

- (NSMutableArray)eventQueue
{
  return self->_eventQueue;
}

- (void)setEventQueue:(id)a3
{
}

- (unint64_t)eventQueueStartSequenceNumber
{
  return self->_eventQueueStartSequenceNumber;
}

- (void)setEventQueueStartSequenceNumber:(unint64_t)a3
{
  self->_eventQueueStartSequenceNumber = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_appList, 0);
  objc_storeStrong((id *)&self->_lastLSUUID, 0);
  objc_storeStrong((id *)&self->_ourDBUUID, 0);

  objc_storeStrong((id *)&self->_stateQueue, 0);
}

@end