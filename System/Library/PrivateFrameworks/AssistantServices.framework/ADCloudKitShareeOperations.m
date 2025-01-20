@interface ADCloudKitShareeOperations
- (ADCloudKitShareeOperations)initWithQueue:(id)a3 container:(id)a4 instanceContext:(id)a5;
- (id)serverChangeToken;
- (void)_fetchSharedZonesIfAny;
- (void)_setupMultiUserSharedZone:(id)a3;
- (void)_setupSharedDatabase;
- (void)_setupSharedDatabaseView;
- (void)_synchronizeSharedZones;
- (void)dealloc;
- (void)deleteShareForUser:(id)a3 markForReinvitation:(BOOL)a4 completion:(id)a5;
- (void)deleteZones:(id)a3;
- (void)fetchSharedZones;
- (void)fetchZones:(id)a3;
- (void)reset;
- (void)setServerChangeToken:(id)a3;
- (void)synchronizeSharedZones;
@end

@implementation ADCloudKitShareeOperations

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_sharedZoneUpdaters, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)synchronizeSharedZones
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012F120;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)deleteShareForUser:(id)a3 markForReinvitation:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10012F23C;
  v13[3] = &unk_10050C840;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

- (void)reset
{
  v3 = +[ADPreferences sharedPreferences];
  [v3 setCloudKitSharedDatabaseChangeToken:0];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012F5A8;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)setServerChangeToken:(id)a3
{
  id v3 = a3;
  id v7 = v3;
  if (!v3)
  {
    v4 = 0;
    goto LABEL_5;
  }
  v4 = objc_msgSend(v3, "ad_archiveTokenToDataWithExceptionBlock:", &stru_1005030C0);
  if (v4)
  {
LABEL_5:
    v5 = +[ADPreferences sharedPreferences];
    [v5 setCloudKitSharedDatabaseChangeToken:v4];

    v6 = +[ADPreferences sharedPreferences];
    [v6 synchronize];
  }
}

- (id)serverChangeToken
{
  v2 = +[ADPreferences sharedPreferences];
  id v3 = [v2 cloudKitSharedDatabaseChangeToken];

  v4 = +[CKServerChangeToken ad_unarchiveTokenFromData:v3 withExceptionBlock:&stru_1005030A0];

  return v4;
}

- (void)_synchronizeSharedZones
{
  id v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[ADCloudKitShareeOperations _synchronizeSharedZones]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  obj = self->_sharedZoneUpdaters;
  id v4 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = [(NSMutableDictionary *)self->_sharedZoneUpdaters objectForKey:*(void *)(*((void *)&v15 + 1) + 8 * (void)v7)];
        dispatch_time_t v9 = dispatch_time(0, 20000000000);
        queue = self->_queue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10012FCFC;
        block[3] = &unk_10050E138;
        id v14 = v8;
        id v11 = v8;
        dispatch_after(v9, queue, block);

        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
}

- (void)deleteZones:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      dispatch_time_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v14 + 1) + 8 * (void)v9) ownerName];
        [v4 addObject:v10];

        dispatch_time_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  if ([v4 count])
  {
    id v11 = +[ADMultiUserService sharedService];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10012FFCC;
    v12[3] = &unk_10050C610;
    id v13 = v4;
    [v11 removeUserWithShareOwnerNames:v13 completion:v12];
  }
}

- (void)fetchZones:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v43 = "-[ADCloudKitShareeOperations fetchZones:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v38;
    dispatch_time_t v9 = &HMAccessoryCategoryTypeAirPort_ptr;
    v10 = &unk_10050E160;
    v29 = self;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v37 + 1) + 8 * (void)v11);
        id v13 = [objc_alloc((Class)v9[274]) initWithZoneID:v12];
        sharedZoneUpdaters = self->_sharedZoneUpdaters;
        if (sharedZoneUpdaters
          && ([v12 ownerName],
              long long v15 = objc_claimAutoreleasedReturnValue(),
              [(NSMutableDictionary *)sharedZoneUpdaters objectForKey:v15],
              long long v16 = objc_claimAutoreleasedReturnValue(),
              v15,
              v16))
        {
          dispatch_time_t v17 = dispatch_time(0, 20000000000);
          queue = self->_queue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100130420;
          block[3] = v10;
          id v35 = v16;
          id v36 = v13;
          id v19 = v7;
          uint64_t v20 = v8;
          v21 = v10;
          v22 = v9;
          id v23 = v13;
          id v24 = v16;
          dispatch_after(v17, queue, block);

          dispatch_time_t v9 = v22;
          v10 = v21;
          uint64_t v8 = v20;
          id v7 = v19;
          self = v29;
        }
        else
        {
          dispatch_time_t v25 = dispatch_time(0, 20000000000);
          v26 = self->_queue;
          v32[0] = _NSConcreteStackBlock;
          v32[1] = 3221225472;
          v32[2] = sub_1001304B0;
          v32[3] = v10;
          v32[4] = self;
          id v33 = v13;
          id v24 = v13;
          dispatch_after(v25, v26, v32);
        }
        id v11 = (char *)v11 + 1;
      }
      while (v7 != v11);
      id v7 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v7);
  }

  dispatch_time_t v27 = dispatch_time(0, 20000000000);
  v28 = self->_queue;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1001304BC;
  v31[3] = &unk_10050E138;
  v31[4] = self;
  dispatch_after(v27, v28, v31);
}

- (void)_setupMultiUserSharedZone:(id)a3
{
  id v4 = a3;
  id v5 = +[NSString stringWithFormat:@"%@.%@.%@", @"com.apple.assistant.multiuser.shared", @"subscription", @"AssistantVoiceTriggerFileAssetRecord"];
  id v6 = +[NSString stringWithFormat:@"%@.%@.%@", @"com.apple.assistant.multiuser.shared", @"subscription", @"AssistantKeyValueRecord"];
  id v7 = objc_alloc_init(ADCloudKitMultiUserSharedDataStore);
  [(ADCloudKitMultiUserSharedDataStore *)v7 setDataStoreIsOnSharedDatabase:1];
  uint64_t v8 = [ADCloudKitRecordZoneInfo alloc];
  v23[0] = v5;
  v23[1] = v6;
  dispatch_time_t v9 = +[NSArray arrayWithObjects:v23 count:2];
  v10 = [(ADCloudKitRecordZoneInfo *)v8 initWithZone:v4 dataStore:v7 subscriptionNames:v9];

  id v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v20 = "-[ADCloudKitShareeOperations _setupMultiUserSharedZone:]";
    __int16 v21 = 2112;
    id v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s zone is (%@)", buf, 0x16u);
  }
  id v12 = [[ADCloudKitSharedZoneUpdater alloc] initWithQueue:self->_queue container:self->_container sharedZone:v10 zoneOwner:0 delegate:0];
  sharedZoneUpdaters = self->_sharedZoneUpdaters;
  if (!sharedZoneUpdaters)
  {
    long long v14 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    long long v15 = self->_sharedZoneUpdaters;
    self->_sharedZoneUpdaters = v14;

    sharedZoneUpdaters = self->_sharedZoneUpdaters;
  }
  long long v16 = [v4 zoneID];
  dispatch_time_t v17 = [v16 ownerName];
  [(NSMutableDictionary *)sharedZoneUpdaters setObject:v12 forKey:v17];

  long long v18 = +[ADCloudKitManager sharedManager];
  [v18 fetchChangesWithZoneInfo:v10 useSharedDatabase:1];
}

- (void)_fetchSharedZonesIfAny
{
  id v3 = [objc_alloc((Class)CKFetchDatabaseChangesOperation) initWithPreviousServerChangeToken:0];
  [v3 setFetchAllChanges:1];
  objc_initWeak(&location, v3);
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = sub_100130A4C;
  v13[4] = sub_100130A5C;
  id v14 = +[NSMutableArray array];
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = sub_100130A4C;
  v11[4] = sub_100130A5C;
  id v12 = +[NSMutableArray array];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100130A64;
  v9[3] = &unk_100503010;
  objc_copyWeak(&v10, &location);
  v9[4] = v13;
  [v3 setRecordZoneWithIDChangedBlock:v9];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100130B60;
  v7[3] = &unk_100503010;
  objc_copyWeak(&v8, &location);
  v7[4] = v11;
  [v3 setRecordZoneWithIDWasDeletedBlock:v7];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100130C5C;
  v6[3] = &unk_100503038;
  v6[4] = self;
  [v3 setChangeTokenUpdatedBlock:v6];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100130D28;
  v5[3] = &unk_100503060;
  v5[4] = self;
  v5[5] = v13;
  v5[6] = v11;
  [v3 setFetchDatabaseChangesCompletionBlock:v5];
  [v3 setQualityOfService:25];
  id v4 = [(CKContainer *)self->_container sharedCloudDatabase];
  [v4 addOperation:v3];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  _Block_object_dispose(v11, 8);

  _Block_object_dispose(v13, 8);
  objc_destroyWeak(&location);
}

- (void)fetchSharedZones
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100130F2C;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)_setupSharedDatabaseView
{
  id v3 = [objc_alloc((Class)CKDatabaseSubscription) initWithSubscriptionID:@"sharedZoneSubscription"];
  id v4 = objc_alloc_init((Class)CKNotificationInfo);
  [v4 setShouldSendContentAvailable:1];
  [v3 setNotificationInfo:v4];
  id v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v13 = "-[ADCloudKitShareeOperations _setupSharedDatabaseView]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  id v6 = objc_alloc((Class)CKModifySubscriptionsOperation);
  id v11 = v3;
  id v7 = +[NSArray arrayWithObjects:&v11 count:1];
  id v8 = [v6 initWithSubscriptionsToSave:v7 subscriptionIDsToDelete:0];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100131100;
  v10[3] = &unk_100502FE8;
  v10[4] = self;
  [v8 setModifySubscriptionsCompletionBlock:v10];
  [v8 setQualityOfService:17];
  dispatch_time_t v9 = [(CKContainer *)self->_container sharedCloudDatabase];
  [v9 addOperation:v8];
}

- (void)_setupSharedDatabase
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001312D0;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ADCloudKitShareeOperations;
  [(ADCloudKitShareeOperations *)&v4 dealloc];
}

- (ADCloudKitShareeOperations)initWithQueue:(id)a3 container:(id)a4 instanceContext:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (AFSupportsMultiUser())
  {
    v18.receiver = self;
    v18.super_class = (Class)ADCloudKitShareeOperations;
    id v12 = [(ADCloudKitShareeOperations *)&v18 init];
    id v13 = v12;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_queue, a3);
      objc_storeStrong((id *)&v13->_container, a4);
      if (v11)
      {
        id v14 = (AFInstanceContext *)v11;
      }
      else
      {
        id v14 = +[AFInstanceContext defaultContext];
      }
      instanceContext = v13->_instanceContext;
      v13->_instanceContext = v14;

      [(ADCloudKitShareeOperations *)v13 _setupSharedDatabase];
    }
    self = v13;
    long long v15 = self;
  }
  else
  {
    long long v15 = 0;
  }

  return v15;
}

@end