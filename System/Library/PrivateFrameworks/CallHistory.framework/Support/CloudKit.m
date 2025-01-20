@interface CloudKit
+ (id)create;
- (BOOL)isAccountActive;
- (CHSHCKContainerUserDefaults)containerUserDefaults;
- (CKContainer)container;
- (CKDatabase)database;
- (CKRecordZone)transactionRecordZone;
- (CKServerChangeToken)previousServerChangeToken;
- (CloudKit)init;
- (NSString)operationIdentifier;
- (id)containerUserDefaultsObjectForKey:(id)a3;
- (id)createRecord:(id)a3;
- (void)addRecord:(id)a3 withInsertAndUpdate:(id)a4 withDelete:(id)a5;
- (void)createRecordZoneWithAttemptCount:(unsigned int)a3 completionHandler:(id)a4;
- (void)createRecordZoneWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)deleteAndRecreateRecordZone:(id)a3;
- (void)fetchTransactionRecordZoneWithCompletion:(id)a3;
- (void)getUpdatesWithQualityOfService:(int64_t)a3 withCallback:(id)a4;
- (void)getUpdatesWithRetryCount:(unsigned int)a3 withQualityOfService:(int64_t)a4 withCallback:(id)a5;
- (void)handleCKAccountChangedNotification:(id)a3;
- (void)handlePartialUploadFailure:(id)a3 withUploadRecordsToSave:(id)a4 withRecordsToDelete:(id)a5 withRetryCount:(unsigned int)a6 withCallback:(id)a7;
- (void)performInitialSyncIfNeeded;
- (void)queryAccountStatus;
- (void)queryAccountStatusWithRetryCount:(unsigned int)a3;
- (void)registerForNotifications;
- (void)removeLegacyUserDefaults;
- (void)resolveUploadConflicts:(id)a3 withInsertAndUpdateRecords:(id)a4;
- (void)retryCloudKitOperationForError:(id)a3 withRetryCount:(unsigned int)a4 withCallback:(id)a5;
- (void)setAccountActive:(BOOL)a3;
- (void)setContainerUserDefaults:(id)a3;
- (void)setContainerUserDefaultsObject:(id)a3 forKey:(id)a4;
- (void)setPreviousServerChangeToken:(id)a3;
- (void)setupSubscription;
- (void)setupSubscriptionWithRetryCount:(unsigned int)a3;
- (void)upload:(id)a3 withCallback:(id)a4;
- (void)upload:(id)a3 withRetryCount:(unsigned int)a4 withCallback:(id)a5;
- (void)uploadRecordsToSave:(id)a3 withRecordsToDelete:(id)a4 withRetryCount:(unsigned int)a5 withCallback:(id)a6;
@end

@implementation CloudKit

+ (id)create
{
  if (NSClassFromString(@"CKContainer"))
  {
    v2 = objc_alloc_init(CloudKit);
  }
  else
  {
    v3 = +[CHLogServer sharedInstance];
    v4 = [v3 logHandleForDomain:"CloudKit"];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Did not find CloudKit framework, disabling iCloud syncing", v6, 2u);
    }

    v2 = 0;
  }
  return v2;
}

- (CloudKit)init
{
  v15.receiver = self;
  v15.super_class = (Class)CloudKit;
  v2 = [(CloudKit *)&v15 initWithName:"CloudKit"];
  v3 = v2;
  if (v2)
  {
    v2->_accountActive = 0;
    v4 = +[NSUUID UUID];
    uint64_t v5 = [v4 UUIDString];
    operationIdentifier = v3->_operationIdentifier;
    v3->_operationIdentifier = (NSString *)v5;

    uint64_t v7 = +[CKContainer chsh_secureContainer];
    container = v3->_container;
    v3->_container = (CKContainer *)v7;

    uint64_t v9 = +[CKRecordZone chsh_transactionRecordZone];
    transactionRecordZone = v3->_transactionRecordZone;
    v3->_transactionRecordZone = (CKRecordZone *)v9;

    v11 = [(CKContainer *)v3->_container containerIdentifier];
    if ([v11 length])
    {
      v12 = [[CHSHCKContainerUserDefaults alloc] initWithContainerIdentifier:v11];
      p_super = &v3->_containerUserDefaults->super;
      v3->_containerUserDefaults = v12;
    }
    else
    {
      p_super = [(CloudKit *)v3 logHandle];
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
        sub_10002D4D0(v3, p_super);
      }
    }

    [(CloudKit *)v3 registerForNotifications];
    [(CloudKit *)v3 queryAccountStatus];
  }
  return v3;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CloudKit;
  [(CloudKit *)&v4 dealloc];
}

- (void)registerForNotifications
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"handleCKAccountChangedNotification:" name:CKAccountChangedNotification object:0];
}

- (BOOL)isAccountActive
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000039F8;
  v4[3] = &unk_100048BF0;
  v4[4] = self;
  v4[5] = &v5;
  [(CloudKit *)self executeSync:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setAccountActive:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100003A84;
  v3[3] = &unk_100048C18;
  v3[4] = self;
  BOOL v4 = a3;
  [(CloudKit *)self execute:v3];
}

- (CKDatabase)database
{
  char v2 = [(CloudKit *)self container];
  id v3 = [v2 privateCloudDatabase];

  return (CKDatabase *)v3;
}

- (CKServerChangeToken)previousServerChangeToken
{
  id v3 = [(CloudKit *)self containerUserDefaults];
  BOOL v4 = [v3 previousServerChangeTokenData];

  if (v4)
  {
    id v9 = 0;
    uint64_t v5 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v9];
    id v6 = v9;
    if (!v5)
    {
      uint64_t v7 = [(CloudKit *)self logHandle];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10002D55C((uint64_t)v4);
      }
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (CKServerChangeToken *)v5;
}

- (void)setPreviousServerChangeToken:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = 0;
    uint64_t v5 = +[NSKeyedArchiver archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v9];
    id v6 = v9;
    if (v5)
    {
      uint64_t v7 = [(CloudKit *)self containerUserDefaults];
      [v7 setPreviousServerChangeTokenData:v5];
    }
    else
    {
      uint64_t v7 = [(CloudKit *)self logHandle];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10002D5CC((uint64_t)v4);
      }
    }
  }
  else
  {
    char v8 = [(CloudKit *)self containerUserDefaults];
    [v8 setPreviousServerChangeTokenData:0];
  }
}

- (void)queryAccountStatus
{
}

- (void)queryAccountStatusWithRetryCount:(unsigned int)a3
{
  uint64_t v5 = +[ACAccountStore ch_sharedAccountStore];
  id v6 = objc_msgSend(v5, "aa_primaryAppleAccount");
  unsigned int v7 = objc_msgSend(v6, "aa_isManagedAppleID");

  char v8 = [(CloudKit *)self logHandle];
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Managed Apple ID detected; disabling CloudKit sync",
        buf,
        2u);
    }

    [(CloudKit *)self setAccountActive:0];
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v14 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Requesting account status; attempt %d",
        buf,
        8u);
    }

    v10 = [(CloudKit *)self container];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100003F2C;
    v11[3] = &unk_100048C90;
    v11[4] = self;
    unsigned int v12 = a3;
    [v10 accountInfoWithCompletionHandler:v11];
  }
}

- (void)createRecordZoneWithCompletionHandler:(id)a3
{
}

- (void)createRecordZoneWithAttemptCount:(unsigned int)a3 completionHandler:(id)a4
{
  id v6 = a4;
  unsigned int v7 = [(CloudKit *)self logHandle];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    char v8 = [(CloudKit *)self transactionRecordZone];
    BOOL v9 = [v8 zoneID];
    v10 = [v9 zoneName];
    *(_DWORD *)buf = 138543618;
    v18 = v10;
    __int16 v19 = 1024;
    unsigned int v20 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Creating record zone %{public}@; attempt %d",
      buf,
      0x12u);
  }
  v11 = [(CloudKit *)self database];
  unsigned int v12 = [(CloudKit *)self transactionRecordZone];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000046B4;
  v14[3] = &unk_100048CE0;
  v14[4] = self;
  id v15 = v6;
  unsigned int v16 = a3;
  id v13 = v6;
  [v11 saveRecordZone:v12 completionHandler:v14];
}

- (void)getUpdatesWithQualityOfService:(int64_t)a3 withCallback:(id)a4
{
}

- (void)getUpdatesWithRetryCount:(unsigned int)a3 withQualityOfService:(int64_t)a4 withCallback:(id)a5
{
  id v8 = a5;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = sub_100004BB0;
  v26[4] = sub_100004BC0;
  id v27 = objc_alloc_init((Class)NSMutableArray);
  id v9 = objc_alloc((Class)CKFetchRecordChangesOperation);
  v10 = [(CloudKit *)self transactionRecordZone];
  v11 = [v10 zoneID];
  unsigned int v12 = [(CloudKit *)self previousServerChangeToken];
  id v13 = [v9 initWithRecordZoneID:v11 previousServerChangeToken:v12];

  objc_initWeak(&location, v13);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100004BC8;
  v20[3] = &unk_100048D58;
  v20[4] = self;
  v23[1] = (id)a4;
  id v14 = v8;
  id v21 = v14;
  unsigned int v24 = a3;
  objc_copyWeak(v23, &location);
  v22 = v26;
  [v13 setFetchRecordChangesCompletionBlock:v20];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100005158;
  v19[3] = &unk_100048D80;
  v19[4] = self;
  v19[5] = v26;
  [v13 setRecordChangedBlock:v19];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000054B0;
  v18[3] = &unk_100048DA8;
  v18[4] = self;
  v18[5] = v26;
  [v13 setRecordWithIDWasDeletedBlock:v18];
  [v13 setFetchAllChanges:0];
  [v13 setQualityOfService:17];
  if (a4 >= 25)
  {
    id v15 = [v13 configuration];
    [v15 setDiscretionaryNetworkBehavior:0];
  }
  unsigned int v16 = [(CloudKit *)self logHandle];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v29 = a4;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Fetching record changes with QoS (%ld)...", buf, 0xCu);
  }

  v17 = [(CloudKit *)self database];
  [v17 addOperation:v13];

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);

  _Block_object_dispose(v26, 8);
}

- (void)upload:(id)a3 withCallback:(id)a4
{
}

- (void)upload:(id)a3 withRetryCount:(unsigned int)a4 withCallback:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  v10 = [(CloudKit *)self logHandle];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v28 = [v8 count];
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Processing %lu transactions", buf, 0xCu);
  }

  id v11 = objc_alloc_init((Class)NSMutableArray);
  id v12 = objc_alloc_init((Class)NSMutableArray);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v13 = v8;
  id v14 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v24;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (objc_msgSend(v18, "transactionType", (void)v23) != (id)3)
        {
          __int16 v19 = [(CloudKit *)self createRecord:v18];
          if (v19) {
            [(CloudKit *)self addRecord:v19 withInsertAndUpdate:v11 withDelete:v12];
          }
        }
      }
      id v15 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v15);
  }

  unsigned int v20 = [(CloudKit *)self logHandle];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = [v11 count];
    id v22 = [v12 count];
    *(_DWORD *)buf = 134218240;
    id v28 = v21;
    __int16 v29 = 2048;
    id v30 = v22;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Inserting or updating %lu records and deleting %lu records.", buf, 0x16u);
  }

  [(CloudKit *)self uploadRecordsToSave:v11 withRecordsToDelete:v12 withRetryCount:v6 withCallback:v9];
}

- (void)uploadRecordsToSave:(id)a3 withRecordsToDelete:(id)a4 withRetryCount:(unsigned int)a5 withCallback:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  char v34 = 0;
  id v13 = [(CloudKit *)self logHandle];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = [v10 count];
    id v15 = [v11 count];
    *(_DWORD *)buf = 134218240;
    id v36 = v14;
    __int16 v37 = 2048;
    id v38 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Modifying %lu insert and update records %lu delete records", buf, 0x16u);
  }

  id v16 = [objc_alloc((Class)CKModifyRecordsOperation) initWithRecordsToSave:v10 recordIDsToDelete:v11];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100005C94;
  v32[3] = &unk_100048DD0;
  v32[4] = self;
  [v16 setPerRecordProgressBlock:v32];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100005D7C;
  v31[3] = &unk_100048DF8;
  v31[4] = self;
  v31[5] = v33;
  [v16 setPerRecordCompletionBlock:v31];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100006114;
  v25[3] = &unk_100048E70;
  __int16 v29 = v33;
  v25[4] = self;
  id v17 = v10;
  id v26 = v17;
  id v18 = v11;
  id v27 = v18;
  unsigned int v30 = a5;
  id v19 = v12;
  id v28 = v19;
  [v16 setModifyRecordsCompletionBlock:v25];
  [v16 setQualityOfService:17];
  unsigned int v20 = [v16 configuration];
  [v20 setDiscretionaryNetworkBehavior:0];

  id v21 = [(CloudKit *)self logHandle];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Modifying records...", buf, 2u);
  }

  id v22 = [(CloudKit *)self database];
  [v22 addOperation:v16];

  ct_green_tea_logger_create_static();
  long long v23 = getCTGreenTeaOsLogHandle();
  long long v24 = v23;
  if (v23 && os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Transmit over iCloud", buf, 2u);
  }

  _Block_object_dispose(v33, 8);
}

- (void)handlePartialUploadFailure:(id)a3 withUploadRecordsToSave:(id)a4 withRecordsToDelete:(id)a5 withRetryCount:(unsigned int)a6 withCallback:(id)a7
{
  id v11 = a3;
  id v50 = a4;
  id v49 = a5;
  id v12 = a7;
  id v13 = objc_opt_new();
  id v14 = [v11 userInfo];
  id v15 = [v14 objectForKeyedSubscript:CKPartialErrorsByItemIDKey];

  v54 = self;
  id v16 = [(CloudKit *)self logHandle];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v72 = [v15 count];
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Partial failure modifying %lu records", buf, 0xCu);
  }
  v52 = v13;

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v17 = v15;
  id v18 = [v17 countByEnumeratingWithState:&v66 objects:v75 count:16];
  v48 = (void (**)(void, void))v12;
  if (!v18)
  {
    id v51 = 0;
    goto LABEL_32;
  }
  id v19 = v18;
  id v51 = 0;
  uint64_t v20 = *(void *)v67;
  do
  {
    id v21 = 0;
    do
    {
      if (*(void *)v67 != v20) {
        objc_enumerationMutation(v17);
      }
      id v22 = *(void **)(*((void *)&v66 + 1) + 8 * (void)v21);
      long long v23 = [v17 objectForKey:v22];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v24 = v22;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v25 = [v23 domain];
          unsigned __int8 v26 = [v25 isEqualToString:CKErrorDomain];

          if (v26)
          {
            if ([v23 code] == (id)14)
            {
              id v27 = [(CloudKit *)v54 logHandle];
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                id v28 = [v24 recordName];
                *(_DWORD *)buf = 138543362;
                id v72 = v28;
                _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Adding record %{public}@ to conflict list", buf, 0xCu);
              }
              [v13 addObject:v24];
              goto LABEL_18;
            }
            if ([v23 code] == (id)7)
            {
              if (!v51)
              {
                unsigned int v30 = [(CloudKit *)v54 logHandle];
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                {
                  v31 = [v24 recordName];
                  *(_DWORD *)buf = 138543362;
                  id v72 = v31;
                  _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Partial failure was rate limited for record %{public}@, will retry", buf, 0xCu);
                }
                id v51 = v23;
              }
              goto LABEL_18;
            }
            if ([v23 code] != (id)22)
            {
              __int16 v29 = [(CloudKit *)v54 logHandle];
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                v32 = [v24 recordName];
                *(_DWORD *)buf = 138543618;
                id v72 = v32;
                __int16 v73 = 2114;
                v74 = v23;
                _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Partial failure for record %{public}@: %{public}@", buf, 0x16u);
              }
              goto LABEL_17;
            }
          }
          else
          {
            __int16 v29 = [(CloudKit *)v54 logHandle];
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              id v72 = v11;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Partial failure error is not CloudKit: %{public}@", buf, 0xCu);
            }
LABEL_17:
          }
        }
LABEL_18:
      }
      id v21 = (char *)v21 + 1;
    }
    while (v19 != v21);
    id v33 = [v17 countByEnumeratingWithState:&v66 objects:v75 count:16];
    id v19 = v33;
  }
  while (v33);
LABEL_32:

  if ([v13 count])
  {
    id v53 = v11;
    [(CloudKit *)v54 resolveUploadConflicts:v13 withInsertAndUpdateRecords:v50];
    long long v65 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v62 = 0u;
    id v34 = v50;
    id v35 = [v34 countByEnumeratingWithState:&v62 objects:v70 count:16];
    if (v35)
    {
      id v36 = v35;
      uint64_t v37 = *(void *)v63;
      do
      {
        for (i = 0; i != v36; i = (char *)i + 1)
        {
          if (*(void *)v63 != v37) {
            objc_enumerationMutation(v34);
          }
          v39 = *(void **)(*((void *)&v62 + 1) + 8 * i);
          v40 = [(CloudKit *)v54 logHandle];
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            v41 = [v39 recordID];
            v42 = [v41 recordName];
            *(_DWORD *)buf = 138543362;
            id v72 = v42;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "insert/update %{public}@", buf, 0xCu);
          }
        }
        id v36 = [v34 countByEnumeratingWithState:&v62 objects:v70 count:16];
      }
      while (v36);
    }

    v44 = v48;
    v43 = v49;
    [(CloudKit *)v54 uploadRecordsToSave:v34 withRecordsToDelete:v49 withRetryCount:a6 withCallback:v48];
    id v13 = v52;
    id v11 = v53;
    v45 = v51;
  }
  else
  {
    v45 = v51;
    if (v51)
    {
      v55[0] = _NSConcreteStackBlock;
      v55[1] = 3221225472;
      v55[2] = sub_100006C68;
      v55[3] = &unk_100048E98;
      v55[4] = v54;
      id v56 = v50;
      v43 = v49;
      id v57 = v49;
      unsigned int v61 = a6;
      v44 = v48;
      v60 = v48;
      id v58 = v51;
      id v59 = v11;
      v45 = v51;
      [(CloudKit *)v54 retryCloudKitOperationForError:v58 withRetryCount:a6 + 1 withCallback:v55];
    }
    else
    {
      v46 = [(CloudKit *)v54 logHandle];
      v44 = v48;
      v43 = v49;
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
        sub_10002DB4C(v46);
      }

      ((void (**)(void, id))v48)[2](v48, v11);
    }
  }
}

- (void)resolveUploadConflicts:(id)a3 withInsertAndUpdateRecords:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CloudKit *)self logHandle];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    CFStringRef v46 = (const __CFString *)[v6 count];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Resolving %lu conflicting records", buf, 0xCu);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v9 = v6;
  id v40 = [v9 countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v40)
  {
    uint64_t v39 = *(void *)v42;
    CFStringRef v11 = @"type";
    *(void *)&long long v10 = 138543618;
    long long v35 = v10;
    id v36 = v9;
    uint64_t v37 = self;
    do
    {
      id v12 = 0;
      do
      {
        CFStringRef v13 = v11;
        if (*(void *)v42 != v39) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v41 + 1) + 8 * (void)v12);
        if (!objc_msgSend(v7, "count", v35)) {
          goto LABEL_19;
        }
        uint64_t v15 = 0;
        while (1)
        {
          id v16 = [v7 objectAtIndexedSubscript:v15];
          id v17 = [v16 recordID];
          unsigned __int8 v18 = [v17 isEqual:v14];

          if (v18) {
            break;
          }

          if (++v15 >= (unint64_t)[v7 count]) {
            goto LABEL_19;
          }
        }
        if (v16)
        {
          id v19 = [v16 encryptedValuesByKey];
          uint64_t v20 = [v19 objectForKeyedSubscript:@"encryptedData"];

          if (v20)
          {
            id v38 = v20;
            CFStringRef v11 = v13;
            id v21 = [v16 objectForKeyedSubscript:v13];
            if (v21)
            {
              id v22 = [(CloudKit *)self transactionRecordZone];
              long long v23 = [v22 zoneID];
              id v24 = +[CKRecord chsh_transactionRecordWithZoneID:v23];

              long long v25 = [v24 encryptedValuesByKey];
              [v25 setObject:v38 forKeyedSubscript:@"encryptedData"];

              unsigned __int8 v26 = [v16 objectForKeyedSubscript:@"syncOperationIdentifier"];
              id v27 = [v24 valuesByKey];
              [v27 setObject:v26 forKeyedSubscript:@"syncOperationIdentifier"];

              id v28 = [v24 valuesByKey];
              [v28 setObject:v21 forKeyedSubscript:@"type"];

              id v29 = objc_alloc((Class)CKReference);
              unsigned int v30 = [v16 recordID];
              id v31 = [v29 initWithRecordID:v30 action:1];
              [v24 setObject:v31 forKeyedSubscript:@"parentTransaction"];

              self = v37;
              v32 = [(CloudKit *)v37 logHandle];
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v35;
                CFStringRef v46 = (const __CFString *)v24;
                __int16 v47 = 2114;
                v48 = v16;
                _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Created a reference between record %{public}@ and parent record %{public}@", buf, 0x16u);
              }

              [v7 replaceObjectAtIndex:v15 withObject:v24];
              id v9 = v36;
              CFStringRef v11 = v13;
            }
            else
            {
              id v24 = [(CloudKit *)self logHandle];
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                CFStringRef v46 = v13;
                _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Missing %{public}@ key in parent record", buf, 0xCu);
              }
            }

            uint64_t v20 = v38;
          }
          else
          {
            id v21 = [(CloudKit *)self logHandle];
            CFStringRef v11 = v13;
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              CFStringRef v46 = @"encryptedData";
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Missing %{public}@ key in parent record", buf, 0xCu);
            }
          }
        }
        else
        {
LABEL_19:
          id v16 = [(CloudKit *)self logHandle];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            id v33 = [v14 recordName];
            *(_DWORD *)buf = 138543362;
            CFStringRef v46 = v33;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Could not find original record %{public}@ to resolve conflict", buf, 0xCu);
          }
          CFStringRef v11 = v13;
        }

        id v12 = (char *)v12 + 1;
      }
      while (v12 != v40);
      id v34 = [v9 countByEnumeratingWithState:&v41 objects:v49 count:16];
      id v40 = v34;
    }
    while (v34);
  }
}

- (id)createRecord:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 record];
  id v33 = 0;
  id v6 = +[CHRecentCall unarchivedObjectFromData:v5 error:&v33];
  id v7 = v33;

  if (v6)
  {
    id v8 = [v6 uniqueId];
    if ([v8 length])
    {
      id v9 = [v6 serviceProvider];
      if (([v9 isEqualToString:@"com.apple.FaceTime"] & 1) != 0
        || [v9 isEqualToString:@"com.apple.Telephony"])
      {
        long long v10 = +[CHRecentCallPb protoRecentCallWithRecentCall:v6];
        [v10 setLocalParticipantUUID:0];
        [v10 setOutgoingLocalParticipantUUID:0];
        uint64_t v11 = [v10 data];
        id v12 = (void *)v11;
        if (v11)
        {
          id v31 = (void *)v11;
          id v32 = v7;
          if ([v4 transactionType])
          {
            CFStringRef v13 = [(CloudKit *)self transactionRecordZone];
            id v14 = [v13 zoneID];
            uint64_t v15 = +[CKRecord chsh_transactionRecordWithZoneID:v14];

            id v16 = [(CloudKit *)self logHandle];
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              log = v16;
              id v17 = +[CHTransaction toString:](CHTransaction, "toString:", [v4 transactionType]);
              unsigned __int8 v18 = [v15 recordID];
              id v19 = [v18 recordName];
              *(_DWORD *)buf = 138543874;
              long long v35 = v17;
              __int16 v36 = 2114;
              uint64_t v37 = v19;
              __int16 v38 = 2114;
              uint64_t v39 = v8;
              _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Created %{public}@ record with identifier %{public}@ for parent record with identifier %{public}@", buf, 0x20u);

              id v16 = log;
            }
          }
          else
          {
            id v21 = objc_alloc((Class)CKRecordID);
            id v22 = [(CloudKit *)self transactionRecordZone];
            long long v23 = [v22 zoneID];
            id v16 = [v21 initWithRecordName:v8 zoneID:v23];

            uint64_t v15 = +[CKRecord chsh_transactionRecordWithRecordID:v16];
            id v24 = [(CloudKit *)self logHandle];
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              long long v35 = v8;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Created insert transaction record for call with UUID %{public}@", buf, 0xCu);
            }
          }
          id v12 = v31;

          long long v25 = [v15 encryptedValuesByKey];
          [v25 setObject:v31 forKeyedSubscript:@"encryptedData"];

          unsigned __int8 v26 = [(CloudKit *)self operationIdentifier];
          id v27 = [v15 valuesByKey];
          [v27 setObject:v26 forKeyedSubscript:@"syncOperationIdentifier"];

          uint64_t v20 = +[CHTransaction toString:](CHTransaction, "toString:", [v4 transactionType]);
          id v28 = [v15 valuesByKey];
          [v28 setObject:v20 forKeyedSubscript:@"type"];

          id v7 = v32;
        }
        else
        {
          uint64_t v20 = [(CloudKit *)self logHandle];
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            sub_10002DC68();
          }
          uint64_t v15 = 0;
        }
      }
      else
      {
        long long v10 = [(CloudKit *)self logHandle];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_10002DCD0();
        }
        uint64_t v15 = 0;
      }
    }
    else
    {
      id v9 = [(CloudKit *)self logHandle];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v35 = v6;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Cancelling transaction record creation; could not obtain a unique identifier from call %@",
          buf,
          0xCu);
      }
      uint64_t v15 = 0;
    }
  }
  else
  {
    if (!v7)
    {
      uint64_t v15 = 0;
      goto LABEL_31;
    }
    id v8 = [(CloudKit *)self logHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10002DC00();
    }
    uint64_t v15 = 0;
  }

LABEL_31:
  return v15;
}

- (void)addRecord:(id)a3 withInsertAndUpdate:(id)a4 withDelete:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 encryptedValuesByKey];
  id v12 = [v11 objectForKeyedSubscript:@"encryptedData"];

  if ([v12 length])
  {
    CFStringRef v13 = [[CHRecentCallPb alloc] initWithData:v12];
    id v14 = v13;
    if (!v13)
    {
      uint64_t v15 = [(CloudKit *)self logHandle];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_10002DDB0();
      }
      goto LABEL_58;
    }
    uint64_t v15 = [(CHRecentCallPb *)v13 uniqueId];
    if ([v15 length])
    {
      id v16 = [v8 objectForKeyedSubscript:@"type"];
      if ([v16 length])
      {
        long long v64 = v12;
        long long v65 = v14;
        id v17 = +[CHTransaction toString:0];
        unsigned __int8 v18 = [v16 isEqualToString:v17];

        long long v66 = v16;
        long long v67 = v10;
        if ((v18 & 1) == 0)
        {
          id v19 = objc_alloc((Class)CKRecordID);
          uint64_t v20 = [(CloudKit *)self transactionRecordZone];
          id v21 = [v20 zoneID];
          id v22 = [v19 initWithRecordName:v15 zoneID:v21];

          id v23 = [objc_alloc((Class)CKReference) initWithRecordID:v22 action:1];
          [v8 setObject:v23 forKeyedSubscript:@"parentTransaction"];
          id v24 = [(CloudKit *)self logHandle];
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            long long v25 = [v8 recordID];
            *(_DWORD *)buf = 138543618;
            uint64_t v80 = (uint64_t)v25;
            __int16 v81 = 2114;
            id v82 = v22;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Created a reference between record %{public}@ and parent record %{public}@", buf, 0x16u);
          }
          id v16 = v66;
          id v10 = v67;
        }
        unsigned __int8 v26 = +[CHTransaction toString:2];
        unsigned int v27 = [v16 isEqualToString:v26];

        if (v27)
        {
          long long v63 = v8;
          long long v68 = +[NSMutableArray array];
          long long v73 = 0u;
          long long v74 = 0u;
          long long v75 = 0u;
          long long v76 = 0u;
          id v62 = v9;
          id v28 = v9;
          id v29 = [v28 countByEnumeratingWithState:&v73 objects:v78 count:16];
          if (v29)
          {
            id v30 = v29;
            uint64_t v31 = *(void *)v74;
            do
            {
              for (i = 0; i != v30; i = (char *)i + 1)
              {
                if (*(void *)v74 != v31) {
                  objc_enumerationMutation(v28);
                }
                id v33 = *(void **)(*((void *)&v73 + 1) + 8 * i);
                id v34 = objc_msgSend(v33, "recordID", v62);
                long long v35 = [v34 recordName];
                unsigned int v36 = [v35 isEqualToString:v15];

                if (v36)
                {
                  uint64_t v37 = [(CloudKit *)self logHandle];
                  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543362;
                    uint64_t v80 = (uint64_t)v15;
                    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Removing record %{public}@ since we are deleting it", buf, 0xCu);
                  }

                  [v68 addObject:v33];
                }
              }
              id v30 = [v28 countByEnumeratingWithState:&v73 objects:v78 count:16];
            }
            while (v30);
          }

          [v28 removeObjectsInArray:v68];
          id v8 = v63;
          __int16 v38 = [v63 objectForKeyedSubscript:@"parentTransaction"];
          long long v69 = 0u;
          long long v70 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          id v39 = v67;
          id v40 = [v39 countByEnumeratingWithState:&v69 objects:v77 count:16];
          if (v40)
          {
            id v41 = v40;
            uint64_t v42 = *(void *)v70;
            while (2)
            {
              for (j = 0; j != v41; j = (char *)j + 1)
              {
                if (*(void *)v70 != v42) {
                  objc_enumerationMutation(v39);
                }
                long long v44 = *(void **)(*((void *)&v69 + 1) + 8 * (void)j);
                v45 = objc_msgSend(v38, "recordID", v62);
                LODWORD(v44) = [v44 isEqual:v45];

                if (v44)
                {
                  id v57 = [(CloudKit *)self logHandle];
                  id v12 = v64;
                  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
                  {
                    id v58 = [v38 recordID];
                    *(_DWORD *)buf = 138543362;
                    uint64_t v80 = (uint64_t)v58;
                    _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "Found existing delete transaction record for identifier %{public}@", buf, 0xCu);
                  }
                  goto LABEL_52;
                }
              }
              id v41 = [v39 countByEnumeratingWithState:&v69 objects:v77 count:16];
              if (v41) {
                continue;
              }
              break;
            }
          }

          uint64_t v46 = [v38 recordID];
          __int16 v47 = [(CloudKit *)self logHandle];
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v80 = v46;
            _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Deleting record with identifier %{public}@", buf, 0xCu);
          }

          [v39 addObject:v46];
          id v39 = (id)v46;
          id v12 = v64;
LABEL_52:
          id v16 = v66;

          id v9 = v62;
          id v10 = v67;
        }
        else
        {
          id v49 = +[CHTransaction toString:0];
          unsigned int v50 = [v16 isEqualToString:v49];

          if (v50)
          {
            if ([v9 count])
            {
              uint64_t v51 = 0;
              while (1)
              {
                v52 = [v9 objectAtIndexedSubscript:v51];
                id v53 = [v52 recordID];
                v54 = [v8 recordID];
                unsigned int v55 = [v53 isEqual:v54];

                if (v55) {
                  break;
                }

                if (++v51 >= (unint64_t)[v9 count]) {
                  goto LABEL_46;
                }
              }
              unsigned int v61 = [(CloudKit *)self logHandle];
              id v16 = v66;
              if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543618;
                uint64_t v80 = (uint64_t)v52;
                __int16 v81 = 2114;
                id v82 = v8;
                _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Replacing record %{public}@ with record %{public}@", buf, 0x16u);
              }

              [v9 replaceObjectAtIndex:v51 withObject:v8];
              id v12 = v64;
              id v10 = v67;
            }
            else
            {
LABEL_46:
              id v56 = [(CloudKit *)self logHandle];
              if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v80 = (uint64_t)v8;
                _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "Adding record %{public}@", buf, 0xCu);
              }

              [v9 addObject:v8];
              id v12 = v64;
              id v16 = v66;
              id v10 = v67;
            }
            goto LABEL_57;
          }
          id v59 = +[CHTransaction toString:1];
          unsigned int v60 = [v16 isEqualToString:v59];

          if (v60) {
            [v9 addObject:v8];
          }
          id v12 = v64;
        }
        id v14 = v65;
      }
      else
      {
        v48 = [(CloudKit *)self logHandle];
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
          sub_10002DE80();
        }
      }
    }
    else
    {
      id v16 = [(CloudKit *)self logHandle];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10002DE18();
      }
    }
LABEL_57:

LABEL_58:
    goto LABEL_59;
  }
  id v14 = [(CloudKit *)self logHandle];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_10002DD38();
  }
LABEL_59:
}

- (void)deleteAndRecreateRecordZone:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CloudKit *)self logHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(CloudKit *)self transactionRecordZone];
    id v7 = [v6 zoneID];
    id v8 = [v7 zoneName];
    *(_DWORD *)buf = 138543362;
    id v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Deleting and recreating CKRecordZone %{public}@", buf, 0xCu);
  }
  id v9 = [(CloudKit *)self database];
  id v10 = [(CloudKit *)self transactionRecordZone];
  uint64_t v11 = [v10 zoneID];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000080F4;
  v13[3] = &unk_100048EE8;
  v13[4] = self;
  id v14 = v4;
  id v12 = v4;
  [v9 deleteRecordZoneWithID:v11 completionHandler:v13];
}

- (void)performInitialSyncIfNeeded
{
  id v3 = [(CloudKit *)self previousServerChangeToken];

  id v4 = [(CloudKit *)self logHandle];
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Found previous change token, no need to perform initial sync", buf, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Did not find previous change token, fetching initial changes from iCloud", v6, 2u);
    }

    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 postNotificationName:@"kCallHistoryFetchChangesNotification" object:0 userInfo:0];
  }
}

- (void)setupSubscription
{
  id v3 = [(CloudKit *)self containerUserDefaults];
  id v4 = [v3 transactionRecordZoneSubscriptionCreationDate];

  if (v4 && ([v4 timeIntervalSinceNow], v5 < 172800.0))
  {
    id v6 = [(CloudKit *)self logHandle];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Not attempting to create subscription, it was created on %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    id v6 = +[NSDate date];
    id v7 = [(CloudKit *)self containerUserDefaults];
    [v7 setTransactionRecordZoneSubscriptionCreationDate:v6];

    id v8 = [(CloudKit *)self logHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      id v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Set Transactions record zone subscription creation date to %{public}@", (uint8_t *)&v9, 0xCu);
    }

    [(CloudKit *)self setupSubscriptionWithRetryCount:0];
  }
}

- (void)fetchTransactionRecordZoneWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  double v5 = [(CloudKit *)self transactionRecordZone];
  id v6 = [v5 zoneID];

  id v7 = [(CloudKit *)self containerUserDefaults];
  id v8 = [v7 transactionRecordZoneFetchDate];

  if (v8 && ([v8 timeIntervalSinceNow], v9 >= 604800.0))
  {
    uint64_t v11 = [(CloudKit *)self logHandle];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v16 = v6;
      __int16 v17 = 2114;
      unsigned __int8 v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Fetched record zone with identifier %{public}@ on %{public}@", buf, 0x16u);
    }

    v4[2](v4, 1);
  }
  else
  {
    id v10 = [(CloudKit *)self database];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000882C;
    v12[3] = &unk_100048F10;
    v12[4] = self;
    id v14 = v4;
    id v13 = v6;
    [v10 fetchRecordZoneWithID:v13 completionHandler:v12];
  }
}

- (void)setupSubscriptionWithRetryCount:(unsigned int)a3
{
  id v5 = objc_alloc((Class)CKRecordZoneSubscription);
  id v6 = [(CloudKit *)self transactionRecordZone];
  id v7 = [v6 zoneID];
  id v8 = [v5 initWithZoneID:v7 subscriptionID:@"CallHistorySubscription"];

  id v9 = objc_alloc((Class)CKModifySubscriptionsOperation);
  id v10 = +[NSArray arrayWithObject:v8];
  id v11 = [v9 initWithSubscriptionsToSave:v10 subscriptionIDsToDelete:0];

  [v11 setQualityOfService:17];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100008D54;
  v15[3] = &unk_100048F38;
  unsigned int v16 = a3;
  v15[4] = self;
  [v11 setModifySubscriptionsCompletionBlock:v15];
  id v12 = [(CloudKit *)self logHandle];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Modifying subscription...", v14, 2u);
  }

  id v13 = [(CloudKit *)self database];
  [v13 addOperation:v11];
}

- (void)retryCloudKitOperationForError:(id)a3 withRetryCount:(unsigned int)a4 withCallback:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void))a5;
  id v10 = [(CloudKit *)self logHandle];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = +[CKPrettyError descriptionForError:v8];
    *(_DWORD *)buf = 138543362;
    *(void *)id v34 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Operation failed: %{public}@ ", buf, 0xCu);
  }
  id v12 = [v8 domain];
  unsigned __int8 v13 = [v12 isEqualToString:CKErrorDomain];

  if ((v13 & 1) == 0) {
    goto LABEL_8;
  }
  if (a4 >= 5)
  {
    id v14 = [(CloudKit *)self logHandle];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10002E05C(v14);
    }

    goto LABEL_8;
  }
  unint64_t v15 = (unint64_t)[v8 code];
  if (v15 > 0x19 || ((1 << v15) & 0x29000F8) == 0)
  {
LABEL_8:
    v9[2](v9, 0);
    goto LABEL_20;
  }
  unsigned int v16 = [v8 userInfo];
  __int16 v17 = [v16 objectForKeyedSubscript:CKErrorRetryAfterKey];

  if (!v17)
  {
    __int16 v17 = [&off_10004B6F0 objectAtIndexedSubscript:a4];
    unsigned __int8 v18 = [(CloudKit *)self logHandle];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)id v34 = CKErrorRetryAfterKey;
      *(_WORD *)&v34[8] = 2114;
      *(void *)&v34[10] = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Missing %{public}@ key, defaulting to %{public}@", buf, 0x16u);
    }
  }
  signed int v19 = [v17 intValue];
  signed int v20 = [v17 intValue];
  signed int v21 = [v17 intValue];
  id v22 = [(CloudKit *)self logHandle];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = v21 % 60;
    uint64_t v24 = v20 / 60 % 60;
    uint64_t v25 = v19 / 3600;
    unsigned int v26 = [v17 intValue];
    *(_DWORD *)buf = 67110146;
    unsigned int v27 = "s";
    *(_DWORD *)id v34 = a4;
    *(_WORD *)&v34[4] = 2048;
    if (v26 == 1) {
      unsigned int v27 = "";
    }
    *(void *)&v34[6] = v25;
    *(_WORD *)&v34[14] = 2048;
    *(void *)&v34[16] = v24;
    __int16 v35 = 2048;
    uint64_t v36 = v23;
    __int16 v37 = 2080;
    __int16 v38 = v27;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Retrying attempt %u after %lu hours %lu minutes and %lu second%s", buf, 0x30u);
  }

  id v28 = sub_100010BEC(v17);
  dispatch_time_t v29 = dispatch_time(0, 1000000000 * (int)[v17 intValue]);
  id v30 = [(CloudKit *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009378;
  block[3] = &unk_100048F60;
  id v32 = v9;
  dispatch_after(v29, v30, block);

LABEL_20:
}

- (void)handleCKAccountChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(CloudKit *)self logHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543618;
    id v8 = (id)objc_opt_class();
    __int16 v9 = 2114;
    id v10 = v4;
    id v6 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ is handling %{public}@", (uint8_t *)&v7, 0x16u);
  }
  [(CloudKit *)self queryAccountStatus];
}

- (id)containerUserDefaultsObjectForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(CloudKit *)self container];
  id v6 = [v5 containerIdentifier];

  if (v6)
  {
    int v7 = +[NSUserDefaults standardUserDefaults];
    id v8 = [v7 dictionaryForKey:v6];

    __int16 v9 = [v8 objectForKeyedSubscript:v4];
  }
  else
  {
    id v10 = [(CloudKit *)self logHandle];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10002D4D0(self, v10);
    }

    __int16 v9 = 0;
  }

  return v9;
}

- (void)setContainerUserDefaultsObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CloudKit *)self container];
  __int16 v9 = [v8 containerIdentifier];

  if (v9)
  {
    id v10 = +[NSUserDefaults standardUserDefaults];
    id v11 = [v10 dictionaryForKey:v9];
    id v12 = [v11 mutableCopy];

    if (!v12)
    {
      id v12 = +[NSMutableDictionary dictionary];
    }
    [v12 setObject:v6 forKeyedSubscript:v7];
    unsigned __int8 v13 = +[NSUserDefaults standardUserDefaults];
    [v13 setObject:v12 forKey:v9];
  }
  else
  {
    id v14 = [(CloudKit *)self logHandle];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10002D4D0(self, v14);
    }
  }
}

- (void)removeLegacyUserDefaults
{
  id v2 = +[NSUserDefaults standardUserDefaults];
  [v2 removeObjectForKey:@"CallHistorySubscriptionCreationDate"];
  [v2 removeObjectForKey:@"ChangeToken"];
  [v2 removeObjectForKey:@"CallHistoryDeviceCount"];
  [v2 removeObjectForKey:@"CallHistoryDeviceCountLastQueryDate"];
}

- (NSString)operationIdentifier
{
  return self->_operationIdentifier;
}

- (CKContainer)container
{
  return self->_container;
}

- (CHSHCKContainerUserDefaults)containerUserDefaults
{
  return self->_containerUserDefaults;
}

- (void)setContainerUserDefaults:(id)a3
{
}

- (CKRecordZone)transactionRecordZone
{
  return self->_transactionRecordZone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionRecordZone, 0);
  objc_storeStrong((id *)&self->_containerUserDefaults, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_operationIdentifier, 0);
}

@end