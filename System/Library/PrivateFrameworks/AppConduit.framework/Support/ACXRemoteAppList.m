@interface ACXRemoteAppList
+ (BOOL)supportsSecureCoding;
+ (id)remoteAppListForStorageBaseURL:(id)a3 delegate:(id)a4 queue:(id)a5;
- (ACXRemoteAppList)initWithCoder:(id)a3;
- (ACXRemoteAppList)initWithStorageBaseURL:(id)a3 delegate:(id)a4 queue:(id)a5;
- (ACXRemoteAppListCommunications)delegate;
- (BOOL)_onQueue_databaseIsSynced;
- (BOOL)applicationIsInstalledWithBundleID:(id)a3 error:(id *)a4;
- (BOOL)applicationIsInstalledWithCounterpartBundleID:(id)a3 error:(id *)a4;
- (BOOL)databaseIsSynced;
- (BOOL)performingResync;
- (BOOL)remoteIsConnected;
- (BOOL)startDatabaseSyncIfNeeded;
- (BOOL)syncPending;
- (NSDictionary)appInstallRecordsToFetch;
- (NSDictionary)appList;
- (NSMutableDictionary)attemptsPerBundleID;
- (NSMutableSet)observers;
- (NSSet)bundleIDsToFetch;
- (NSURL)storageBaseURL;
- (NSUUID)currentDBUUID;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)resyncThrottleTimer;
- (OS_dispatch_source)syncTimeout;
- (id)appBundleIDForCounterpartBundleID:(id)a3 error:(id *)a4;
- (id)applicationForBundleID:(id)a3 error:(id *)a4;
- (id)applicationWithCounterpartBundleID:(id)a3 error:(id *)a4;
- (id)bundleIDsTrackedWithError:(id *)a3;
- (id)resumeOnReconnect;
- (unint64_t)lastSequenceNumber;
- (unint64_t)resyncAttempts;
- (void)_initCommonReliabilityState;
- (void)_onQueue_acknowledgeAppEvents;
- (void)_onQueue_appsAdded:(id)a3;
- (void)_onQueue_appsRemoved:(id)a3;
- (void)_onQueue_appsUpdated:(id)a3;
- (void)_onQueue_databaseResynced;
- (void)_onQueue_fetchAppsForAppInstallRecords;
- (void)_onQueue_fetchOutstandingAppEvents;
- (void)_onQueue_fetchRemainingBundleIDs;
- (void)_onQueue_purgeSavedData;
- (void)_onQueue_reSync;
- (void)_onQueue_saveData;
- (void)_onQueue_startResyncThrottleTimer;
- (void)_onQueue_startSyncTimer;
- (void)_onQueue_stopResyncThrottleTimer;
- (void)_onQueue_stopSyncTimer;
- (void)_resetLastSequenceNumberTo:(unint64_t)a3;
- (void)_serializeToDisk;
- (void)addObserver:(id)a3 queue:(id)a4;
- (void)appsAdded:(id)a3 currentRemoteDBUUID:(id)a4 lastSequenceNumber:(unint64_t)a5;
- (void)appsRemoved:(id)a3 currentRemoteDBUUID:(id)a4 lastSequenceNumber:(unint64_t)a5;
- (void)encodeWithCoder:(id)a3;
- (void)getCurrentDBUUID:(id *)a3 sequenceNumber:(unint64_t *)a4;
- (void)remoteDeviceConnected;
- (void)remoteDeviceDisconnected;
- (void)removeObserver:(id)a3 queue:(id)a4;
- (void)reportAppEvents:(id)a3 forDBUUID:(id)a4 startingSequenceNumber:(unint64_t)a5;
- (void)reportCurrentDBUUID:(id)a3 lastSequenceNumber:(unint64_t)a4;
- (void)reportTotalSyncFailureForError:(id)a3;
- (void)setAppInstallRecordsToFetch:(id)a3;
- (void)setAppList:(id)a3;
- (void)setAttemptsPerBundleID:(id)a3;
- (void)setBundleIDsToFetch:(id)a3;
- (void)setCurrentDBUUID:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setLastSequenceNumber:(unint64_t)a3;
- (void)setObservers:(id)a3;
- (void)setPerformingResync:(BOOL)a3;
- (void)setRemoteIsConnected:(BOOL)a3;
- (void)setResumeOnReconnect:(id)a3;
- (void)setResyncAttempts:(unint64_t)a3;
- (void)setResyncThrottleTimer:(id)a3;
- (void)setStorageBaseURL:(id)a3;
- (void)setSyncPending:(BOOL)a3;
- (void)setSyncTimeout:(id)a3;
- (void)updateAppInfoWithRecords:(id)a3 currentRemoteDBUUID:(id)a4;
- (void)updateBundleIDList:(id)a3 currentRemoteDBUUID:(id)a4 lastSequenceNumber:(unint64_t)a5;
@end

@implementation ACXRemoteAppList

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_initCommonReliabilityState
{
  v3 = objc_opt_new();
  [(ACXRemoteAppList *)self setAttemptsPerBundleID:v3];

  [(ACXRemoteAppList *)self setResyncAttempts:0];
}

- (ACXRemoteAppList)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ACXRemoteAppList;
  v5 = [(ACXRemoteAppList *)&v20 init];
  if (!v5) {
    goto LABEL_6;
  }
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0);
  uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"appList"];
  appList = v5->_appList;
  v5->_appList = (NSDictionary *)v10;

  uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentDBUUID"];
  currentDBUUID = v5->_currentDBUUID;
  v5->_currentDBUUID = (NSUUID *)v12;

  v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastSequenceNumber"];
  v5->_lastSequenceNumber = (unint64_t)[v14 unsignedIntegerValue];

  v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AppListVersion"];
  v16 = v15;
  if (v15 && [v15 unsignedLongLongValue] != (id)3)
  {
    if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 3) {
      goto LABEL_13;
    }
LABEL_12:
    MOLogWrite();
LABEL_13:

    v18 = 0;
    goto LABEL_14;
  }
  v17 = [(ACXRemoteAppList *)v5 appList];

  if (!v17)
  {
    if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 3) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  [(ACXRemoteAppList *)v5 _initCommonReliabilityState];

LABEL_6:
  v18 = v5;
LABEL_14:

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  appList = self->_appList;
  id v6 = a3;
  [v6 encodeObject:appList forKey:@"appList"];
  [v6 encodeObject:self->_currentDBUUID forKey:@"currentDBUUID"];
  v5 = +[NSNumber numberWithUnsignedInteger:self->_lastSequenceNumber];
  [v6 encodeObject:v5 forKey:@"lastSequenceNumber"];

  [v6 encodeObject:&off_1000977E0 forKey:@"AppListVersion"];
}

- (ACXRemoteAppList)initWithStorageBaseURL:(id)a3 delegate:(id)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ACXRemoteAppList;
  uint64_t v12 = [(ACXRemoteAppList *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_storageBaseURL, a3);
    v14 = objc_opt_new();
    [(ACXRemoteAppList *)v13 setAppList:v14];

    [(ACXRemoteAppList *)v13 setDelegate:v10];
    [(ACXRemoteAppList *)v13 setDelegateQueue:v11];
    [(ACXRemoteAppList *)v13 _initCommonReliabilityState];
  }

  return v13;
}

- (void)_serializeToDisk
{
  v3 = [(ACXRemoteAppList *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003DEE0;
  block[3] = &unk_10008CD30;
  block[4] = self;
  dispatch_sync(v3, block);
}

+ (id)remoteAppListForStorageBaseURL:(id)a3 delegate:(id)a4 queue:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v7 URLByAppendingPathComponent:@"ACXRemoteAppList.plist" isDirectory:0];
  id v11 = [v10 path];
  id v54 = 0;
  uint64_t v12 = +[NSData dataWithContentsOfFile:v11 options:1 error:&v54];
  id v13 = v54;

  if (!v12)
  {
    objc_super v20 = [v13 domain];
    if (([v20 isEqualToString:NSCocoaErrorDomain] & 1) == 0)
    {

      goto LABEL_15;
    }
    id v21 = [v13 code];

    if (v21 != (id)260) {
      goto LABEL_15;
    }
    id v22 = [v7 URLByAppendingPathComponent:@"com.apple.AppConduit.ACXRemoteAppList.plist" isDirectory:0];

    id v10 = v22;
    id v55 = 0;
    v23 = +[NSDictionary ACX_dictionaryWithContentsOfURL:v10 options:0 error:&v55];
    id v24 = v55;
    v49 = v24;
    v50 = v23;
    if (v23)
    {
      v25 = [v23 objectForKeyedSubscript:@"AppListVersion"];
      objc_opt_class();
      id v26 = v25;
      if (objc_opt_isKindOfClass()) {
        id v27 = v26;
      }
      else {
        id v27 = 0;
      }

      v48 = v27;
      id v39 = [v27 unsignedLongLongValue];
      if (v39 == (id)1)
      {
        v40 = [v50 objectForKeyedSubscript:@"AppListData"];
        objc_opt_class();
        id v41 = v40;
        if (objc_opt_isKindOfClass()) {
          id v42 = v41;
        }
        else {
          id v42 = 0;
        }

        if (!v42)
        {
          if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
          {
            v44 = [v10 path];
            v45 = v44;
            MOLogWrite();
            goto LABEL_69;
          }
          id v42 = 0;
        }
LABEL_73:
        id v14 = v42;

        if (v14) {
          goto LABEL_3;
        }
LABEL_15:
        v29 = objc_msgSend(v13, "domain", v45, v46, v47);
        if ([v29 isEqualToString:NSCocoaErrorDomain])
        {
          id v30 = [v13 code];

          if (v30 == (id)260)
          {
LABEL_34:
            id v14 = 0;
            id v17 = 0;
            goto LABEL_42;
          }
        }
        else
        {
        }
        if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
        {
          v28 = [v10 path];
          v45 = v28;
          uint64_t v46 = (uint64_t)v13;
          MOLogWrite();
          id v14 = 0;
          id v17 = 0;
          goto LABEL_33;
        }
        goto LABEL_34;
      }
      id v43 = v39;
      if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 3)
      {
        id v42 = 0;
        goto LABEL_73;
      }
      v44 = [v10 path];
      uint64_t v46 = 1;
      v47 = v44;
      v45 = v43;
      MOLogWrite();
LABEL_69:

      goto LABEL_70;
    }
    v36 = v24;
    v37 = [v24 domain];
    if ([v37 isEqualToString:NSCocoaErrorDomain])
    {
      id v38 = [v36 code];

      if (v38 == (id)260) {
        goto LABEL_63;
      }
    }
    else
    {
    }
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      v44 = [v10 path];
      v45 = v44;
      uint64_t v46 = (uint64_t)v49;
      MOLogWrite();
      v48 = 0;
      goto LABEL_69;
    }
LABEL_63:
    v48 = 0;
LABEL_70:
    id v42 = 0;
    goto LABEL_73;
  }
  id v14 = (id)v12;
LABEL_3:
  id v51 = v7;
  id v15 = v9;
  id v16 = v8;
  id v53 = v13;
  id v17 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v14 error:&v53];
  id v18 = v53;

  if (v17)
  {
    if (v12)
    {
      id v19 = [v17 decodeObjectOfClass:objc_opt_class() forKey:NSKeyedArchiveRootObjectKey];
    }
    else
    {
      id v19 = [objc_alloc((Class)objc_opt_class()) initWithCoder:v17];
    }
    id v31 = v19;
    if (v19)
    {
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
      {
        v45 = objc_msgSend(v10, "path", v45, v46, v47);
        MOLogWrite();
      }
      objc_msgSend(v31, "setDelegate:", v16, v45);
      [v31 setDelegateQueue:v15];
      [v31 setStorageBaseURL:v51];
      if (v12)
      {
        id v13 = v18;
      }
      else
      {
        [v31 _serializeToDisk];
        v32 = +[NSFileManager defaultManager];
        id v52 = v18;
        uint64_t v33 = [v32 removeItemAtURL:v10 error:&v52];
        id v13 = v52;

        if ((v33 & 1) == 0 && (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)) {
          MOLogWrite();
        }
      }
      id v8 = v16;
      id v9 = v15;
      id v7 = v51;
      goto LABEL_46;
    }
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      v28 = objc_msgSend(v10, "path", v45, v46, v47);
      v45 = v28;
      MOLogWrite();
      goto LABEL_28;
    }
  }
  else
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      v28 = objc_msgSend(v10, "path", v45, v46, v47);
      v45 = v28;
      uint64_t v46 = (uint64_t)v18;
      MOLogWrite();
      id v17 = 0;
LABEL_28:
      id v13 = v18;
      id v8 = v16;
      id v9 = v15;
      id v7 = v51;
LABEL_33:

      goto LABEL_42;
    }
    id v17 = 0;
  }
  id v13 = v18;
  id v8 = v16;
  id v9 = v15;
  id v7 = v51;
LABEL_42:
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
    MOLogWrite();
  }
  v34 = +[NSFileManager defaultManager];
  [v34 removeItemAtURL:v10 error:0];

  id v31 = [objc_alloc((Class)objc_opt_class()) initWithStorageBaseURL:v7 delegate:v8 queue:v9];
LABEL_46:

  return v31;
}

- (OS_dispatch_queue)queue
{
  if (qword_1000A55C8 != -1) {
    dispatch_once(&qword_1000A55C8, &stru_10008DCD8);
  }
  v2 = (void *)qword_1000A55D0;

  return (OS_dispatch_queue *)v2;
}

- (BOOL)syncPending
{
  v2 = [(ACXRemoteAppList *)self syncTimeout];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_resetLastSequenceNumberTo:(unint64_t)a3
{
  v5 = [(ACXRemoteAppList *)self queue];
  dispatch_assert_queue_V2(v5);

  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
    MOLogWrite();
  }
  self->_lastSequenceNumber = a3;
}

- (void)setLastSequenceNumber:(unint64_t)a3
{
  v5 = [(ACXRemoteAppList *)self queue];
  dispatch_assert_queue_V2(v5);

  if (!a3 || self->_lastSequenceNumber < a3)
  {
    [(ACXRemoteAppList *)self _resetLastSequenceNumberTo:a3];
  }
}

- (void)setCurrentDBUUID:(id)a3
{
  id v4 = (NSUUID *)a3;
  v5 = [(ACXRemoteAppList *)self queue];
  dispatch_assert_queue_V2(v5);

  currentDBUUID = self->_currentDBUUID;
  if (((v4 != 0) == (currentDBUUID == 0)
     || ([(NSUUID *)currentDBUUID isEqual:v4] & 1) == 0)
    && (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5))
  {
    MOLogWrite();
  }
  id v7 = self->_currentDBUUID;
  self->_currentDBUUID = v4;
}

- (void)_onQueue_purgeSavedData
{
  BOOL v3 = [(ACXRemoteAppList *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(ACXRemoteAppList *)self storageBaseURL];
  id v5 = [v4 URLByAppendingPathComponent:@"ACXRemoteAppList.plist" isDirectory:0];

  if (v5)
  {
    id v6 = +[NSFileManager defaultManager];
    id v12 = 0;
    unsigned __int8 v7 = [v6 removeItemAtURL:v5 error:&v12];
    id v8 = v12;

    if ((v7 & 1) == 0)
    {
      id v9 = [v8 domain];
      if ([v9 isEqualToString:NSCocoaErrorDomain])
      {
        id v10 = [v8 code];

        if (v10 == (id)4) {
          goto LABEL_13;
        }
      }
      else
      {
      }
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
      {
        id v11 = [v5 path];
        MOLogWrite();
      }
    }
LABEL_13:

    goto LABEL_14;
  }
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
  {
    id v8 = [(ACXRemoteAppList *)self storageBaseURL];
    MOLogWrite();
    goto LABEL_13;
  }
LABEL_14:
}

- (void)_onQueue_saveData
{
  BOOL v3 = [(ACXRemoteAppList *)self queue];
  dispatch_assert_queue_V2(v3);

  if (![(ACXRemoteAppList *)self performingResync])
  {
    id v4 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
    [v4 setOutputFormat:200];
    [v4 encodeObject:self forKey:NSKeyedArchiveRootObjectKey];
    id v5 = [v4 encodedData];
    id v6 = [(ACXRemoteAppList *)self storageBaseURL];
    id v7 = [v6 URLByAppendingPathComponent:@"ACXRemoteAppList.plist" isDirectory:0];

    if (v7)
    {
      id v11 = 0;
      unsigned __int8 v8 = [v5 writeToURL:v7 options:268435457 error:&v11];
      id v9 = v11;
      if (v8)
      {
        if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 5) {
          goto LABEL_18;
        }
      }
      else if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 3)
      {
        goto LABEL_18;
      }
      id v10 = [v7 path];
      MOLogWrite();
    }
    else
    {
      if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 3) {
        goto LABEL_19;
      }
      id v9 = [(ACXRemoteAppList *)self storageBaseURL];
      MOLogWrite();
    }
LABEL_18:

LABEL_19:
    return;
  }
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
  {
    MOLogWrite();
  }
}

- (void)_onQueue_startSyncTimer
{
  BOOL v3 = [(ACXRemoteAppList *)self queue];
  dispatch_assert_queue_V2(v3);

  [(ACXRemoteAppList *)self _onQueue_stopSyncTimer];
  id v4 = (void *)os_transaction_create();
  id v5 = [(ACXRemoteAppList *)self queue];
  id v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v5);

  uint64_t v7 = 300 * [(ACXRemoteAppList *)self resyncAttempts] + 300;
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
    MOLogWrite();
  }
  dispatch_time_t v8 = dispatch_walltime(0, 1000000000 * v7);
  dispatch_source_set_timer(v6, v8, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10003EF30;
  handler[3] = &unk_10008CC28;
  id v9 = v6;
  id v16 = v9;
  id v10 = v4;
  id v17 = v10;
  dispatch_source_set_cancel_handler(v9, handler);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003EF8C;
  v12[3] = &unk_10008CC28;
  id v11 = v9;
  id v13 = v11;
  id v14 = self;
  dispatch_source_set_event_handler(v11, v12);
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
    MOLogWrite();
  }
  dispatch_resume(v11);
  [(ACXRemoteAppList *)self setSyncTimeout:v11];
}

- (void)_onQueue_stopSyncTimer
{
  BOOL v3 = [(ACXRemoteAppList *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(ACXRemoteAppList *)self syncTimeout];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
    {
      MOLogWrite();
      id v5 = v6;
    }
    dispatch_source_cancel(v5);
    id v4 = [(ACXRemoteAppList *)self setSyncTimeout:0];
    id v5 = v6;
  }

  _objc_release_x1(v4, v5);
}

- (void)_onQueue_startResyncThrottleTimer
{
  BOOL v3 = [(ACXRemoteAppList *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(ACXRemoteAppList *)self resyncThrottleTimer];

  if (v4)
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      MOLogWrite();
    }
  }
  else
  {
    id v5 = [(ACXRemoteAppList *)self queue];
    id v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v5);

    uint64_t v7 = 600 * [(ACXRemoteAppList *)self resyncAttempts] + 600;
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
      MOLogWrite();
    }
    dispatch_time_t v8 = dispatch_walltime(0, 1000000000 * v7);
    dispatch_source_set_timer(v6, v8, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10003F328;
    handler[3] = &unk_10008CD30;
    id v9 = v6;
    id v15 = v9;
    dispatch_source_set_cancel_handler(v9, handler);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10003F384;
    v11[3] = &unk_10008CC28;
    id v10 = v9;
    id v12 = v10;
    id v13 = self;
    dispatch_source_set_event_handler(v10, v11);
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
      MOLogWrite();
    }
    dispatch_resume(v10);
    [(ACXRemoteAppList *)self setResyncThrottleTimer:v10];
  }
}

- (void)_onQueue_stopResyncThrottleTimer
{
  BOOL v3 = [(ACXRemoteAppList *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(ACXRemoteAppList *)self resyncThrottleTimer];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
    {
      MOLogWrite();
      id v5 = v6;
    }
    dispatch_source_cancel(v5);
    id v4 = [(ACXRemoteAppList *)self setResyncThrottleTimer:0];
    id v5 = v6;
  }

  _objc_release_x1(v4, v5);
}

- (void)_onQueue_reSync
{
  BOOL v3 = [(ACXRemoteAppList *)self queue];
  dispatch_assert_queue_V2(v3);

  [(ACXRemoteAppList *)self _onQueue_stopResyncThrottleTimer];
  if (![(ACXRemoteAppList *)self remoteIsConnected])
  {
    if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 5) {
      return;
    }
    goto LABEL_8;
  }
  if ([(ACXRemoteAppList *)self syncPending])
  {
    if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 5) {
      return;
    }
LABEL_8:
    MOLogWrite();
    return;
  }
  id v4 = objc_opt_new();
  [(ACXRemoteAppList *)self setAttemptsPerBundleID:v4];

  [(ACXRemoteAppList *)self setResyncAttempts:(char *)[(ACXRemoteAppList *)self resyncAttempts] + 1];
  id v5 = objc_opt_new();
  [(ACXRemoteAppList *)self setAppList:v5];

  [(ACXRemoteAppList *)self setAppInstallRecordsToFetch:0];
  [(ACXRemoteAppList *)self setBundleIDsToFetch:0];
  [(ACXRemoteAppList *)self setPerformingResync:1];
  [(ACXRemoteAppList *)self _onQueue_purgeSavedData];
  [(ACXRemoteAppList *)self _onQueue_startSyncTimer];
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
    MOLogWrite();
  }
  id v6 = [(ACXRemoteAppList *)self delegateQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003F6B0;
  v7[3] = &unk_10008CD30;
  v7[4] = self;
  sub_100006BB8(v6, v7);
}

- (void)reportTotalSyncFailureForError:(id)a3
{
  id v4 = a3;
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
  {
    id v6 = v4;
    MOLogWrite();
  }
  id v5 = [(ACXRemoteAppList *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003F7CC;
  block[3] = &unk_10008CD30;
  block[4] = self;
  dispatch_sync(v5, block);
}

- (void)_onQueue_fetchRemainingBundleIDs
{
  BOOL v3 = [(ACXRemoteAppList *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(ACXRemoteAppList *)self remoteIsConnected])
  {
    if ([(ACXRemoteAppList *)self syncPending])
    {
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
      {
        MOLogWrite();
      }
    }
    else
    {
      id v24 = [(ACXRemoteAppList *)self bundleIDsToFetch];
      if ([v24 count])
      {
        id v5 = +[NSMutableSet setWithCapacity:5];
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v6 = v24;
        id v7 = [v6 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v7)
        {
          uint64_t v8 = *(void *)v32;
          uint64_t v9 = 5;
LABEL_19:
          uint64_t v10 = 0;
          while (1)
          {
            if (*(void *)v32 != v8) {
              objc_enumerationMutation(v6);
            }
            [v5 addObject:*(void *)(*((void *)&v31 + 1) + 8 * v10)];
            if (v9 - 1 == v10) {
              break;
            }
            if (v7 == (id)++v10)
            {
              id v7 = [v6 countByEnumeratingWithState:&v31 objects:v39 count:16];
              v9 -= v10;
              if (v7) {
                goto LABEL_19;
              }
              break;
            }
          }
        }

        id v11 = [v5 copy];
        if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
        {
          id v23 = v11;
          MOLogWrite();
        }
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v12 = v11;
        id v13 = [v12 countByEnumeratingWithState:&v27 objects:v38 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v28;
          do
          {
            for (i = 0; i != v13; i = (char *)i + 1)
            {
              if (*(void *)v28 != v14) {
                objc_enumerationMutation(v12);
              }
              uint64_t v16 = *(void *)(*((void *)&v27 + 1) + 8 * i);
              id v17 = [(ACXRemoteAppList *)self attemptsPerBundleID];
              id v18 = [v17 objectForKeyedSubscript:v16];
              BOOL v19 = v18 == 0;

              if (v19)
              {
                objc_super v20 = [(ACXRemoteAppList *)self attemptsPerBundleID];
                [v20 setObject:&off_1000977F8 forKeyedSubscript:v16];
              }
            }
            id v13 = [v12 countByEnumeratingWithState:&v27 objects:v38 count:16];
          }
          while (v13);
        }

        [(ACXRemoteAppList *)self _onQueue_startSyncTimer];
        id v21 = [(ACXRemoteAppList *)self delegateQueue];
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_10003FD48;
        v25[3] = &unk_10008CC28;
        v25[4] = self;
        id v26 = v12;
        id v22 = v12;
        sub_100006BB8(v21, v25);
      }
      else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
      {
        MOLogWrite();
      }
    }
  }
  else
  {
    id v4 = [(ACXRemoteAppList *)self resumeOnReconnect];

    if (!v4)
    {
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
        MOLogWrite();
      }
      objc_initWeak(&location, self);
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_10003FD04;
      v35[3] = &unk_10008DD00;
      objc_copyWeak(&v36, &location);
      [(ACXRemoteAppList *)self setResumeOnReconnect:v35];
      objc_destroyWeak(&v36);
      objc_destroyWeak(&location);
    }
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
      MOLogWrite();
    }
  }
}

- (void)_onQueue_fetchAppsForAppInstallRecords
{
  BOOL v3 = [(ACXRemoteAppList *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(ACXRemoteAppList *)self remoteIsConnected])
  {
    if ([(ACXRemoteAppList *)self syncPending])
    {
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
      {
        MOLogWrite();
      }
    }
    else
    {
      id v5 = [(ACXRemoteAppList *)self appInstallRecordsToFetch];
      id v6 = [v5 allKeys];

      if ([v6 count])
      {
        id v7 = [v6 count];
        if ((unint64_t)v7 >= 5) {
          uint64_t v8 = 5;
        }
        else {
          uint64_t v8 = (uint64_t)v7;
        }
        id v22 = objc_msgSend(v6, "subarrayWithRange:", 0, v8);
        uint64_t v9 = +[NSSet setWithArray:v22];
        if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
        {
          id v21 = v9;
          MOLogWrite();
        }
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v10 = v9;
        id v11 = [v10 countByEnumeratingWithState:&v25 objects:v32 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v26;
          do
          {
            for (i = 0; i != v11; i = (char *)i + 1)
            {
              if (*(void *)v26 != v12) {
                objc_enumerationMutation(v10);
              }
              uint64_t v14 = *(void *)(*((void *)&v25 + 1) + 8 * i);
              id v15 = [(ACXRemoteAppList *)self attemptsPerBundleID];
              uint64_t v16 = [v15 objectForKeyedSubscript:v14];
              BOOL v17 = v16 == 0;

              if (v17)
              {
                id v18 = [(ACXRemoteAppList *)self attemptsPerBundleID];
                [v18 setObject:&off_1000977F8 forKeyedSubscript:v14];
              }
            }
            id v11 = [v10 countByEnumeratingWithState:&v25 objects:v32 count:16];
          }
          while (v11);
        }

        [(ACXRemoteAppList *)self _onQueue_startSyncTimer];
        BOOL v19 = [(ACXRemoteAppList *)self delegateQueue];
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_100040264;
        v23[3] = &unk_10008CC28;
        v23[4] = self;
        id v24 = v10;
        id v20 = v10;
        sub_100006BB8(v19, v23);
      }
      else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
      {
        MOLogWrite();
      }
    }
  }
  else
  {
    id v4 = [(ACXRemoteAppList *)self resumeOnReconnect];

    if (!v4)
    {
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
        MOLogWrite();
      }
      objc_initWeak(&location, self);
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_100040220;
      v29[3] = &unk_10008DD00;
      objc_copyWeak(&v30, &location);
      [(ACXRemoteAppList *)self setResumeOnReconnect:v29];
      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);
    }
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
      MOLogWrite();
    }
  }
}

- (void)_onQueue_fetchOutstandingAppEvents
{
  BOOL v3 = [(ACXRemoteAppList *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(ACXRemoteAppList *)self remoteIsConnected])
  {
    if ([(ACXRemoteAppList *)self syncPending])
    {
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
      {
        MOLogWrite();
      }
    }
    else
    {
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
        MOLogWrite();
      }
      [(ACXRemoteAppList *)self _onQueue_startSyncTimer];
      id v5 = [(ACXRemoteAppList *)self delegateQueue];
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_10004055C;
      v6[3] = &unk_10008CD30;
      v6[4] = self;
      sub_100006BB8(v5, v6);
    }
  }
  else
  {
    id v4 = [(ACXRemoteAppList *)self resumeOnReconnect];

    if (!v4)
    {
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
        MOLogWrite();
      }
      objc_initWeak(&location, self);
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_100040518;
      v7[3] = &unk_10008DD00;
      objc_copyWeak(&v8, &location);
      [(ACXRemoteAppList *)self setResumeOnReconnect:v7];
      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
      MOLogWrite();
    }
  }
}

- (void)_onQueue_acknowledgeAppEvents
{
  BOOL v3 = [(ACXRemoteAppList *)self queue];
  dispatch_assert_queue_V2(v3);

  if ([(ACXRemoteAppList *)self remoteIsConnected])
  {
    id v4 = [(ACXRemoteAppList *)self currentDBUUID];
    unint64_t v5 = [(ACXRemoteAppList *)self lastSequenceNumber];
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
    {
      uint64_t v9 = v4;
      unint64_t v10 = v5;
      MOLogWrite();
    }
    id v6 = [(ACXRemoteAppList *)self delegateQueue];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100040820;
    v11[3] = &unk_10008CEB8;
    void v11[4] = self;
    id v12 = v4;
    unint64_t v13 = v5;
    id v7 = v4;
    sub_100006BB8(v6, v11);
  }
  else
  {
    id v8 = [(ACXRemoteAppList *)self resumeOnReconnect];

    if (!v8)
    {
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
        MOLogWrite();
      }
      objc_initWeak(&location, self);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1000407DC;
      v14[3] = &unk_10008DD00;
      objc_copyWeak(&v15, &location);
      [(ACXRemoteAppList *)self setResumeOnReconnect:v14];
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
      MOLogWrite();
    }
  }
}

- (void)_onQueue_appsAdded:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ACXRemoteAppList *)self queue];
  dispatch_assert_queue_V2(v5);

  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    id v13 = [v4 count];
    MOLogWrite();
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(ACXRemoteAppList *)self observers];
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v12 = [v11 queue];
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_100040A5C;
        v14[3] = &unk_10008CC28;
        void v14[4] = v11;
        id v15 = v4;
        sub_100006BB8(v12, v14);
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
}

- (void)_onQueue_appsUpdated:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ACXRemoteAppList *)self queue];
  dispatch_assert_queue_V2(v5);

  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    id v13 = [v4 count];
    MOLogWrite();
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(ACXRemoteAppList *)self observers];
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v12 = [v11 queue];
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_100040C98;
        v14[3] = &unk_10008CC28;
        void v14[4] = v11;
        id v15 = v4;
        sub_100006BB8(v12, v14);
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
}

- (void)_onQueue_appsRemoved:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ACXRemoteAppList *)self queue];
  dispatch_assert_queue_V2(v5);

  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    id v13 = [v4 count];
    MOLogWrite();
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(ACXRemoteAppList *)self observers];
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v12 = [v11 queue];
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_100040ED4;
        v14[3] = &unk_10008CC28;
        void v14[4] = v11;
        id v15 = v4;
        sub_100006BB8(v12, v14);
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
}

- (void)_onQueue_databaseResynced
{
  BOOL v3 = [(ACXRemoteAppList *)self queue];
  dispatch_assert_queue_V2(v3);

  [(ACXRemoteAppList *)self setResyncAttempts:0];
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
    MOLogWrite();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(ACXRemoteAppList *)self observers];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        unint64_t v10 = [v9 queue];
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_1000410E8;
        v11[3] = &unk_10008CD30;
        void v11[4] = v9;
        sub_100006BB8(v10, v11);
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)addObserver:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ACXRemoteAppList *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100041204;
  block[3] = &unk_10008CA40;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

- (void)removeObserver:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ACXRemoteAppList *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100041374;
  block[3] = &unk_10008CA40;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

- (void)remoteDeviceDisconnected
{
  BOOL v3 = [(ACXRemoteAppList *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000415B0;
  block[3] = &unk_10008CD30;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)remoteDeviceConnected
{
  BOOL v3 = [(ACXRemoteAppList *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000416AC;
  block[3] = &unk_10008CD30;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)reportCurrentDBUUID:(id)a3 lastSequenceNumber:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(ACXRemoteAppList *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100041848;
  block[3] = &unk_10008CEB8;
  block[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_sync(v7, block);
}

- (void)updateBundleIDList:(id)a3 currentRemoteDBUUID:(id)a4 lastSequenceNumber:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(ACXRemoteAppList *)self queue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100041B8C;
  v13[3] = &unk_10008CF30;
  v13[4] = self;
  id v14 = v9;
  id v15 = v8;
  unint64_t v16 = a5;
  id v11 = v8;
  id v12 = v9;
  dispatch_sync(v10, v13);
}

- (void)updateAppInfoWithRecords:(id)a3 currentRemoteDBUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ACXRemoteAppList *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100041D34;
  block[3] = &unk_10008CA40;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(v8, block);
}

- (void)reportAppEvents:(id)a3 forDBUUID:(id)a4 startingSequenceNumber:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(ACXRemoteAppList *)self queue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000428E4;
  v13[3] = &unk_10008CF30;
  v13[4] = self;
  id v14 = v9;
  id v15 = v8;
  unint64_t v16 = a5;
  id v11 = v8;
  id v12 = v9;
  dispatch_sync(v10, v13);
}

- (void)appsAdded:(id)a3 currentRemoteDBUUID:(id)a4 lastSequenceNumber:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(ACXRemoteAppList *)self queue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100042F6C;
  v13[3] = &unk_10008CF30;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(v10, v13);
}

- (void)appsRemoved:(id)a3 currentRemoteDBUUID:(id)a4 lastSequenceNumber:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(ACXRemoteAppList *)self queue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100043654;
  v13[3] = &unk_10008CF30;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a5;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(v10, v13);
}

- (BOOL)startDatabaseSyncIfNeeded
{
  v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  BOOL v3 = [(ACXRemoteAppList *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100043AC0;
  v5[3] = &unk_10008C950;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)_onQueue_databaseIsSynced
{
  BOOL v3 = [(ACXRemoteAppList *)self appList];
  if ([v3 count])
  {
    unsigned __int8 v4 = [(ACXRemoteAppList *)self performingResync];

    return v4 ^ 1;
  }
  else
  {

    return 0;
  }
}

- (BOOL)databaseIsSynced
{
  v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  BOOL v3 = [(ACXRemoteAppList *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100043CD8;
  v5[3] = &unk_10008C950;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (id)bundleIDsTrackedWithError:(id *)a3
{
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x3032000000;
  long long v19 = sub_100043EAC;
  id v20 = sub_100043EBC;
  id v21 = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = sub_100043EAC;
  id v14 = sub_100043EBC;
  id v15 = 0;
  id v5 = [(ACXRemoteAppList *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100043EC4;
  block[3] = &unk_10008DD28;
  block[4] = self;
  void block[5] = &v16;
  block[6] = &v10;
  dispatch_sync(v5, block);

  uint64_t v6 = (void *)v11[5];
  if (a3 && !v6)
  {
    *a3 = (id) v17[5];
    uint64_t v6 = (void *)v11[5];
  }
  id v7 = v6;
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);

  return v7;
}

- (id)applicationForBundleID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  long long v25 = sub_100043EAC;
  long long v26 = sub_100043EBC;
  id v27 = 0;
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x3032000000;
  long long v19 = sub_100043EAC;
  id v20 = sub_100043EBC;
  id v21 = 0;
  id v7 = [(ACXRemoteAppList *)self queue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10004414C;
  v12[3] = &unk_10008DD50;
  void v12[4] = self;
  id v14 = &v22;
  id v8 = v6;
  id v13 = v8;
  id v15 = &v16;
  dispatch_sync(v7, v12);

  char v9 = (void *)v17[5];
  if (a4 && !v9)
  {
    *a4 = (id) v23[5];
    char v9 = (void *)v17[5];
  }
  id v10 = v9;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

- (BOOL)applicationIsInstalledWithBundleID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = sub_100043EAC;
  uint64_t v24 = sub_100043EBC;
  id v25 = 0;
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  id v7 = [(ACXRemoteAppList *)self queue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100044418;
  v12[3] = &unk_10008DD50;
  void v12[4] = self;
  id v14 = &v20;
  id v8 = v6;
  id v13 = v8;
  id v15 = &v16;
  dispatch_sync(v7, v12);

  int v9 = *((unsigned __int8 *)v17 + 24);
  if (a4 && !*((unsigned char *)v17 + 24))
  {
    *a4 = (id) v21[5];
    int v9 = *((unsigned __int8 *)v17 + 24);
  }
  BOOL v10 = v9 != 0;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return v10;
}

- (id)applicationWithCounterpartBundleID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = sub_100043EAC;
  long long v26 = sub_100043EBC;
  id v27 = 0;
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x3032000000;
  char v19 = sub_100043EAC;
  uint64_t v20 = sub_100043EBC;
  id v21 = 0;
  id v7 = [(ACXRemoteAppList *)self queue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100044704;
  v12[3] = &unk_10008DD50;
  void v12[4] = self;
  id v14 = &v22;
  id v8 = v6;
  id v13 = v8;
  id v15 = &v16;
  dispatch_sync(v7, v12);

  int v9 = (void *)v17[5];
  if (a4 && !v9)
  {
    *a4 = (id) v23[5];
    int v9 = (void *)v17[5];
  }
  id v10 = v9;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

- (BOOL)applicationIsInstalledWithCounterpartBundleID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = sub_100043EAC;
  uint64_t v24 = sub_100043EBC;
  id v25 = 0;
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  id v7 = [(ACXRemoteAppList *)self queue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100044AA4;
  v12[3] = &unk_10008DD50;
  void v12[4] = self;
  id v14 = &v20;
  id v8 = v6;
  id v13 = v8;
  id v15 = &v16;
  dispatch_sync(v7, v12);

  int v9 = *((unsigned __int8 *)v17 + 24);
  if (a4 && !*((unsigned char *)v17 + 24))
  {
    *a4 = (id) v21[5];
    int v9 = *((unsigned __int8 *)v17 + 24);
  }
  BOOL v10 = v9 != 0;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return v10;
}

- (id)appBundleIDForCounterpartBundleID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = sub_100043EAC;
  long long v26 = sub_100043EBC;
  id v27 = 0;
  uint64_t v16 = 0;
  long long v17 = &v16;
  uint64_t v18 = 0x3032000000;
  char v19 = sub_100043EAC;
  uint64_t v20 = sub_100043EBC;
  id v21 = 0;
  id v7 = [(ACXRemoteAppList *)self queue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100044E70;
  v12[3] = &unk_10008DD50;
  void v12[4] = self;
  id v14 = &v22;
  id v8 = v6;
  id v13 = v8;
  id v15 = &v16;
  dispatch_sync(v7, v12);

  int v9 = (void *)v17[5];
  if (a4 && !v9)
  {
    *a4 = (id) v23[5];
    int v9 = (void *)v17[5];
  }
  id v10 = v9;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

- (void)getCurrentDBUUID:(id *)a3 sequenceNumber:(unint64_t *)a4
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = sub_100043EAC;
  long long v17 = sub_100043EBC;
  id v18 = 0;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  id v7 = [(ACXRemoteAppList *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000451D4;
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

- (NSDictionary)appList
{
  return self->_appList;
}

- (void)setAppList:(id)a3
{
}

- (NSUUID)currentDBUUID
{
  return self->_currentDBUUID;
}

- (unint64_t)lastSequenceNumber
{
  return self->_lastSequenceNumber;
}

- (NSURL)storageBaseURL
{
  return self->_storageBaseURL;
}

- (void)setStorageBaseURL:(id)a3
{
}

- (BOOL)remoteIsConnected
{
  return self->_remoteIsConnected;
}

- (void)setRemoteIsConnected:(BOOL)a3
{
  self->_remoteIsConnected = a3;
}

- (OS_dispatch_source)syncTimeout
{
  return self->_syncTimeout;
}

- (void)setSyncTimeout:(id)a3
{
}

- (OS_dispatch_source)resyncThrottleTimer
{
  return self->_resyncThrottleTimer;
}

- (void)setResyncThrottleTimer:(id)a3
{
}

- (ACXRemoteAppListCommunications)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ACXRemoteAppListCommunications *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (NSDictionary)appInstallRecordsToFetch
{
  return self->_appInstallRecordsToFetch;
}

- (void)setAppInstallRecordsToFetch:(id)a3
{
}

- (NSSet)bundleIDsToFetch
{
  return self->_bundleIDsToFetch;
}

- (void)setBundleIDsToFetch:(id)a3
{
}

- (BOOL)performingResync
{
  return self->_performingResync;
}

- (void)setPerformingResync:(BOOL)a3
{
  self->_performingResync = a3;
}

- (NSMutableSet)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (NSMutableDictionary)attemptsPerBundleID
{
  return self->_attemptsPerBundleID;
}

- (void)setAttemptsPerBundleID:(id)a3
{
}

- (unint64_t)resyncAttempts
{
  return self->_resyncAttempts;
}

- (void)setResyncAttempts:(unint64_t)a3
{
  self->_resyncAttempts = a3;
}

- (id)resumeOnReconnect
{
  return self->_resumeOnReconnect;
}

- (void)setResumeOnReconnect:(id)a3
{
}

- (void)setSyncPending:(BOOL)a3
{
  self->_syncPending = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resumeOnReconnect, 0);
  objc_storeStrong((id *)&self->_attemptsPerBundleID, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_bundleIDsToFetch, 0);
  objc_storeStrong((id *)&self->_appInstallRecordsToFetch, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_resyncThrottleTimer, 0);
  objc_storeStrong((id *)&self->_syncTimeout, 0);
  objc_storeStrong((id *)&self->_storageBaseURL, 0);
  objc_storeStrong((id *)&self->_currentDBUUID, 0);

  objc_storeStrong((id *)&self->_appList, 0);
}

@end