@interface CPLCloudKitCoordinator
+ (BOOL)enableTurboMode;
+ (BOOL)networkBehaviorShouldBeDiscretionaryForForegroundOperation:(BOOL)a3 upload:(BOOL)a4 metadata:(BOOL)a5;
+ (BOOL)shouldRegisterClient;
+ (BOOL)usesSandboxEnvironment;
+ (CPLCloudKitCoordinator)sharedCoordinator;
+ (NSString)executionIdentifier;
+ (id)_container;
+ (id)_containerOptionsIsZoneish:(BOOL)a3;
+ (id)_zoneishContainer;
+ (id)containerIsZoneish:(BOOL)a3;
+ (id)newOperationConfiguration;
+ (void)setEnableTurboMode:(BOOL)a3;
+ (void)setExecutionIdentifier:(id)a3;
+ (void)setShouldRegisterClient:(BOOL)a3;
- (CKContainer)container;
- (CKContainer)zoneishContainer;
- (CKDatabase)database;
- (CKDatabase)sharedDatabase;
- (CPLCloudKitCoordinator)init;
- (CPLCloudKitPushNotificationCenter)pushNotificationCenter;
- (id)_bestClientToReceivePushNotification:(id)a3;
- (id)_clientsInterestedToReceiveAPushNotificationForZoneID:(id)a3;
- (id)_defaultClient;
- (id)createGroupAllowsCellular:(BOOL)a3 allowsExpensiveNetwork:(BOOL)a4 foreground:(BOOL)a5 upload:(BOOL)a6 metadata:(BOOL)a7 forClient:(id)a8;
- (id)databaseForOperationType:(int64_t)a3 relativeToOperationType:(int64_t)a4 forClient:(id)a5;
- (id)newOperationConfiguration;
- (void)_addClient:(id)a3 interestedInZoneIDs:(id)a4;
- (void)_addClientInterestedInAllZones:(id)a3;
- (void)_addClientToInterestingZones:(id)a3;
- (void)_askNextClient:(id)a3 toProvideCKAssetWithRecordID:(id)a4 fieldName:(id)a5 recordType:(id)a6 signature:(id)a7 bestResponseYet:(unint64_t)a8 completionHandler:(id)a9;
- (void)_coordinatorWillBeUsed;
- (void)_coordinatorWontBeUsed;
- (void)_moveToBackgroundIfNecessary;
- (void)_moveToForeground;
- (void)_removeClient:(id)a3 interestedInSomeZones:(id)a4;
- (void)_removeClientFromInterestingZones:(id)a3;
- (void)_startWaitingForPushNotifications;
- (void)_stopWaitingForPushNotifications;
- (void)_waitForClients;
- (void)_waitForClientsIfNecessaryLocked;
- (void)associateMetric:(id)a3 forClient:(id)a4;
- (void)center:(id)a3 didReceivePushNotification:(id)a4;
- (void)coordinatorWontBeUsed;
- (void)fetchAccountInfoWithCompletionHandler:(id)a3;
- (void)getLastClientServedWithAPushNotificationWithCompletionHandler:(id)a3;
- (void)getStatusForClient:(id)a3 completionHandler:(id)a4;
- (void)noteClient:(id)a3 isIgnoringChangeInZoneID:(id)a4;
- (void)noteClient:(id)a3 isInForeground:(BOOL)a4;
- (void)provideCKAssetWithRecordID:(id)a3 fieldName:(id)a4 recordType:(id)a5 signature:(id)a6 completionHandler:(id)a7;
- (void)registerClient:(id)a3;
- (void)setPushNotificationCenter:(id)a3;
- (void)unregisterClient:(id)a3;
@end

@implementation CPLCloudKitCoordinator

+ (CPLCloudKitCoordinator)sharedCoordinator
{
  if (qword_1002CE688 != -1) {
    dispatch_once(&qword_1002CE688, &stru_100278678);
  }
  v2 = (void *)qword_1002CE680;
  return (CPLCloudKitCoordinator *)v2;
}

- (CPLCloudKitCoordinator)init
{
  v19.receiver = self;
  v19.super_class = (Class)CPLCloudKitCoordinator;
  v2 = [(CPLCloudKitCoordinator *)&v19 init];
  if (v2)
  {
    v3 = CPLCopyDefaultSerialQueueAttributes();
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.cpl.cloudkit.coordinator", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [(id)objc_opt_class() _container];
    container = v2->_container;
    v2->_container = (CKContainer *)v6;

    uint64_t v8 = [(id)objc_opt_class() _zoneishContainer];
    zoneishContainer = v2->_zoneishContainer;
    v2->_zoneishContainer = (CKContainer *)v8;

    uint64_t v10 = [(CKContainer *)v2->_container privateCloudDatabase];
    database = v2->_database;
    v2->_database = (CKDatabase *)v10;

    uint64_t v12 = [(CKContainer *)v2->_container sharedCloudDatabase];
    sharedDatabase = v2->_sharedDatabase;
    v2->_sharedDatabase = (CKDatabase *)v12;

    v14 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    clients = v2->_clients;
    v2->_clients = v14;

    v16 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    foregroundClients = v2->_foregroundClients;
    v2->_foregroundClients = v16;

    v2->_shouldForceDroppingPushNotifications = 1;
    [(CPLCloudKitCoordinator *)v2 _waitForClients];
  }
  return v2;
}

- (void)setPushNotificationCenter:(id)a3
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    if (self->_pushNotificationCenter) {
      sub_1001C8AA4((uint64_t)a2, (uint64_t)self);
    }
    id v8 = v6;
    objc_storeStrong((id *)&self->_pushNotificationCenter, a3);
    [(CPLCloudKitPushNotificationCenter *)self->_pushNotificationCenter setDelegate:self];
    id v6 = [(CPLCloudKitPushNotificationCenter *)self->_pushNotificationCenter setQueue:self->_queue];
    id v7 = v8;
  }
  _objc_release_x1(v6, v7);
}

+ (BOOL)usesSandboxEnvironment
{
  if (qword_1002CE698 != -1) {
    dispatch_once(&qword_1002CE698, &stru_100278698);
  }
  return byte_1002CE690;
}

+ (id)_containerOptionsIsZoneish:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_alloc_init((Class)CKContainerOptions);
  [v4 setUseZoneWidePCS:v3];
  [v4 setMmcsEncryptionSupport:3];
  [v4 setApplicationBundleIdentifierOverrideForContainerAccess:@"com.apple.photos.cloud"];
  [v4 setApplicationBundleIdentifierOverrideForNetworkAttribution:@"com.apple.photos.cloud"];
  [v4 setApplicationBundleIdentifierOverrideForPushTopicGeneration:@"com.apple.photos.cloud"];
  CPLCloudKitConfigurePhotosCapabilitiesOnContainerOptions(v4);
  return v4;
}

+ (id)containerIsZoneish:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(id)objc_opt_class() usesSandboxEnvironment]) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }
  id v6 = [objc_alloc((Class)CKContainerID) initWithContainerIdentifier:@"com.apple.photos.cloud" environment:v5];
  id v7 = [a1 _containerOptionsIsZoneish:v3];
  id v8 = [objc_alloc((Class)CKContainer) initWithContainerID:v6 options:v7];

  return v8;
}

+ (id)_container
{
  return _[a1 containerIsZoneish:0];
}

+ (id)_zoneishContainer
{
  return _[a1 containerIsZoneish:1];
}

- (void)_coordinatorWontBeUsed
{
  if (!_CPLSilentLogging)
  {
    BOOL v3 = sub_10005CE3C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Unregistering coordinator from system activities and notifications", buf, 2u);
    }
  }
  id v4 = [(CPLCloudKitCoordinator *)self container];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10005CE90;
  v6[3] = &unk_100275EA0;
  v6[4] = self;
  +[CPLCallObserver observeSyncCallOn:v4 selector:"unregisterFromUploadRequestsWithMachServiceName:" block:v6];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10005CEDC;
  v5[3] = &unk_100275EA0;
  v5[4] = self;
  +[CPLCallObserver observeSyncCallOn:self selector:"_stopWaitingForPushNotifications" block:v5];
}

- (void)_coordinatorWillBeUsed
{
  if (!self->_hasActivatedCoordinator)
  {
    self->_hasActivatedCoordinator = 1;
    if (!_CPLSilentLogging)
    {
      BOOL v3 = sub_10005CE3C();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Registering coordinator for system activities and notifications", buf, 2u);
      }
    }
    objc_initWeak(&location, self);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10005D194;
    v11[3] = &unk_1002786E8;
    objc_copyWeak(&v12, &location);
    id v4 = objc_retainBlock(v11);
    if (!_CPLSilentLogging)
    {
      uint64_t v5 = sub_10005CE3C();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v15 = @"com.apple.aps.photos.cloud.datarepair";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Registering for Asset upload requests with port %@", buf, 0xCu);
      }
    }
    container = self->_container;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10005D370;
    v9[3] = &unk_100276288;
    v9[4] = self;
    id v7 = v4;
    id v10 = v7;
    +[CPLCallObserver observeSyncCallOn:container selector:"registerForAssetUploadRequests:machServiceName:" block:v9];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10005D384;
    v8[3] = &unk_100275EA0;
    v8[4] = self;
    +[CPLCallObserver observeSyncCallOn:self selector:"_startWaitingForPushNotifications" block:v8];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (void)_waitForClientsIfNecessaryLocked
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (![(NSMutableSet *)self->_clients count])
  {
    unint64_t v3 = self->_waitingForClientsGeneration + 1;
    self->_waitingForClientsGeneration = v3;
    dispatch_time_t v4 = dispatch_time(0, 10000000000);
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10005D438;
    v6[3] = &unk_100275EC8;
    v6[4] = self;
    void v6[5] = v3;
    dispatch_after(v4, (dispatch_queue_t)queue, v6);
  }
}

- (void)_waitForClients
{
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10005D5C8;
  v6[3] = &unk_100275EA0;
  v6[4] = self;
  unint64_t v3 = v6;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000604E8;
  block[3] = &unk_100275DF8;
  id v8 = v3;
  dispatch_time_t v4 = queue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

- (void)coordinatorWontBeUsed
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005D644;
  block[3] = &unk_100275EA0;
  void block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (id)_defaultClient
{
  if ((unint64_t)[(NSMutableSet *)self->_clients count] >= 2)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    unint64_t v3 = self->_clientsInterestedInAllZones;
    id v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v17;
      uint64_t v7 = CPLLibraryIdentifierSystemLibrary;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v17 != v6) {
            objc_enumerationMutation(v3);
          }
          v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          id v10 = objc_msgSend(v9, "cloudKitClientIdentifier", (void)v16);
          unint64_t v11 = (unint64_t)v10;
          if (v10) {
            BOOL v12 = v7 == 0;
          }
          else {
            BOOL v12 = 1;
          }
          if (v12)
          {

            if (!(v11 | v7)) {
              goto LABEL_19;
            }
          }
          else
          {
            unsigned __int8 v13 = [v10 isEqual:v7];

            if (v13)
            {
LABEL_19:
              id v14 = v9;

              goto LABEL_20;
            }
          }
        }
        id v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
  }
  id v14 = [(NSMutableSet *)self->_clientsInterestedInAllZones anyObject];
LABEL_20:
  return v14;
}

- (void)_addClientInterestedInAllZones:(id)a3
{
  id v4 = a3;
  clientsInterestedInAllZones = self->_clientsInterestedInAllZones;
  id v8 = v4;
  if (!clientsInterestedInAllZones)
  {
    uint64_t v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    uint64_t v7 = self->_clientsInterestedInAllZones;
    self->_clientsInterestedInAllZones = v6;

    id v4 = v8;
    clientsInterestedInAllZones = self->_clientsInterestedInAllZones;
  }
  [(NSMutableSet *)clientsInterestedInAllZones addObject:v4];
}

- (void)_addClient:(id)a3 interestedInZoneIDs:(id)a4
{
  id v6 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = a4;
  id v7 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v24;
    p_clientsInterestedInSomeSharedZones = &self->_clientsInterestedInSomeSharedZones;
    p_clientsInterestedInSomePrivateZones = &self->_clientsInterestedInSomePrivateZones;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(obj);
        }
        unsigned __int8 v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v14 = [v13 ownerName];
        unsigned int v15 = [v14 isEqualToString:CKCurrentUserDefaultName];

        if (v15)
        {
          long long v16 = *p_clientsInterestedInSomePrivateZones;
          long long v17 = (void **)p_clientsInterestedInSomePrivateZones;
          if (*p_clientsInterestedInSomePrivateZones) {
            goto LABEL_11;
          }
        }
        else
        {
          long long v16 = *p_clientsInterestedInSomeSharedZones;
          long long v17 = (void **)p_clientsInterestedInSomeSharedZones;
          if (*p_clientsInterestedInSomeSharedZones) {
            goto LABEL_11;
          }
        }
        id v18 = objc_alloc_init((Class)NSMutableDictionary);
        long long v19 = *v17;
        *long long v17 = v18;

        long long v16 = *v17;
LABEL_11:
        id v20 = v16;
        id v21 = [v20 objectForKeyedSubscript:v13];
        if (!v21)
        {
          id v21 = objc_alloc_init((Class)NSMutableSet);
          [v20 setObject:v21 forKeyedSubscript:v13];
        }
        [v21 addObject:v6];
      }
      id v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v8);
  }
}

- (void)_removeClient:(id)a3 interestedInSomeZones:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = objc_alloc_init((Class)NSMutableArray);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10005DC04;
    v18[3] = &unk_100278710;
    id v19 = v5;
    id v8 = v7;
    id v20 = v8;
    [v6 enumerateKeysAndObjectsUsingBlock:v18];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v14 objects:v21 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        unsigned __int8 v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(v6, "removeObjectForKey:", *(void *)(*((void *)&v14 + 1) + 8 * (void)v13), (void)v14);
          unsigned __int8 v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v14 objects:v21 count:16];
      }
      while (v11);
    }
  }
}

- (void)_removeClientFromInterestingZones:(id)a3
{
  clientsInterestedInAllZones = self->_clientsInterestedInAllZones;
  id v5 = a3;
  [(NSMutableSet *)clientsInterestedInAllZones removeObject:v5];
  [(CPLCloudKitCoordinator *)self _removeClient:v5 interestedInSomeZones:self->_clientsInterestedInSomePrivateZones];
  [(CPLCloudKitCoordinator *)self _removeClient:v5 interestedInSomeZones:self->_clientsInterestedInSomeSharedZones];
}

- (void)_addClientToInterestingZones:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 interestingZoneIDsForCoordinator:self];
  id v6 = (id)v5;
  if (v5) {
    [(CPLCloudKitCoordinator *)self _addClient:v4 interestedInZoneIDs:v5];
  }
  else {
    [(CPLCloudKitCoordinator *)self _addClientInterestedInAllZones:v4];
  }
}

- (void)registerClient:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10005DEA0;
  v10[3] = &unk_100276018;
  v10[4] = self;
  id v11 = v4;
  id v6 = v10;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000604E8;
  block[3] = &unk_100275DF8;
  id v13 = v6;
  id v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

- (void)unregisterClient:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10005E01C;
  v10[3] = &unk_100276018;
  v10[4] = self;
  id v11 = v4;
  id v6 = v10;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000604E8;
  block[3] = &unk_100275DF8;
  id v13 = v6;
  id v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

- (void)_moveToBackgroundIfNecessary
{
  if (![(NSMutableSet *)self->_foregroundClients count])
  {
    dispatch_time_t v3 = dispatch_time(0, 3000000000);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005E19C;
    block[3] = &unk_100275EA0;
    void block[4] = self;
    dispatch_after(v3, (dispatch_queue_t)queue, block);
  }
}

- (void)_moveToForeground
{
  if ([(NSMutableSet *)self->_foregroundClients count]
    && ![(CPLCloudKitPushNotificationCenter *)self->_pushNotificationCenter clientIsForeground])
  {
    pushNotificationCenter = self->_pushNotificationCenter;
    [(CPLCloudKitPushNotificationCenter *)pushNotificationCenter setClientIsForeground:1];
  }
}

- (void)noteClient:(id)a3 isInForeground:(BOOL)a4
{
  id v6 = a3;
  queue = self->_queue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10005E380;
  v12[3] = &unk_100277780;
  v12[4] = self;
  id v13 = v6;
  BOOL v14 = a4;
  id v8 = v12;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000604E8;
  block[3] = &unk_100275DF8;
  id v16 = v8;
  dispatch_block_t v9 = queue;
  id v10 = v6;
  dispatch_block_t v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v9, v11);
}

+ (NSString)executionIdentifier
{
  return (NSString *)(id)qword_1002CE6A0;
}

+ (void)setExecutionIdentifier:(id)a3
{
  id v3 = [a3 copy];
  uint64_t v4 = qword_1002CE6A0;
  qword_1002CE6A0 = (uint64_t)v3;
  _objc_release_x1(v3, v4);
}

+ (id)newOperationConfiguration
{
  id v2 = objc_alloc_init((Class)CKOperationConfiguration);
  if (qword_1002CE6A0)
  {
    CFStringRef v5 = @"X-APPLE-CPL-EXECUTION";
    uint64_t v6 = qword_1002CE6A0;
    id v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
    [v2 setAdditionalRequestHTTPHeaders:v3];
  }
  return v2;
}

- (id)newOperationConfiguration
{
  return +[CPLCloudKitCoordinator newOperationConfiguration];
}

- (void)associateMetric:(id)a3 forClient:(id)a4
{
  id v5 = a3;
  id v6 = [(CPLCloudKitCoordinator *)self container];
  [v5 setContainer:v6];
}

+ (BOOL)enableTurboMode
{
  if ((byte_1002CE6A8 & 1) == 0)
  {
    id v2 = +[NSUserDefaults standardUserDefaults];
    byte_1002CE6A9 = [v2 BOOLForKey:@"CPLTurboMode"];

    byte_1002CE6A8 = 1;
  }
  return byte_1002CE6A9;
}

+ (void)setEnableTurboMode:(BOOL)a3
{
  byte_1002CE6A9 = a3;
  byte_1002CE6A8 = 1;
}

+ (BOOL)shouldRegisterClient
{
  if (byte_1002CE6AA == 1) {
    return byte_1002CE6AB != 0;
  }
  BOOL result = 1;
  byte_1002CE6AB = 1;
  byte_1002CE6AA = 1;
  return result;
}

+ (void)setShouldRegisterClient:(BOOL)a3
{
  byte_1002CE6AB = a3;
  byte_1002CE6AA = 1;
}

+ (BOOL)networkBehaviorShouldBeDiscretionaryForForegroundOperation:(BOOL)a3 upload:(BOOL)a4 metadata:(BOOL)a5
{
  if (a3) {
    return 0;
  }
  else {
    return objc_msgSend(a1, "enableTurboMode", v5, v6) ^ 1;
  }
}

- (id)createGroupAllowsCellular:(BOOL)a3 allowsExpensiveNetwork:(BOOL)a4 foreground:(BOOL)a5 upload:(BOOL)a6 metadata:(BOOL)a7 forClient:(id)a8
{
  BOOL v8 = a7;
  BOOL v9 = a6;
  BOOL v10 = a5;
  BOOL v11 = a4;
  BOOL v12 = a3;
  id v14 = a8;
  id v15 = objc_alloc_init((Class)CKOperationGroup);
  id v16 = [(CPLCloudKitCoordinator *)self newOperationConfiguration];
  long long v17 = [(CPLCloudKitCoordinator *)self container];
  [v16 setContainer:v17];

  [v16 setAllowsCellularAccess:v12];
  if (!v12) {
    [v16 setAllowsExpensiveNetworkAccess:v11];
  }
  objc_msgSend(v16, "setCPLDiscretionary:", objc_msgSend((id)objc_opt_class(), "networkBehaviorShouldBeDiscretionaryForForegroundOperation:upload:metadata:", v10, v9, v8));
  id v18 = [v14 defaultSourceBundleIdentifier];

  [v16 setApplicationBundleIdentifierOverrideForNetworkAttribution:v18];
  [v15 setDefaultConfiguration:v16];

  return v15;
}

- (id)databaseForOperationType:(int64_t)a3 relativeToOperationType:(int64_t)a4 forClient:(id)a5
{
  id v9 = a5;
  if (a3 == 1 || a3 == 3)
  {
    uint64_t v10 = 1;
  }
  else
  {
    if (!a3) {
      sub_1001C9114((uint64_t)a2, (uint64_t)self);
    }
    uint64_t v10 = 0;
  }
  if ((unint64_t)(a4 - 1) < 2)
  {
    if (v10) {
      [(CPLCloudKitCoordinator *)self database];
    }
    else {
    uint64_t v10 = [(CPLCloudKitCoordinator *)self sharedDatabase];
    }
  }
  else if ((unint64_t)(a4 - 3) >= 2)
  {
    if (!a4) {
      sub_1001C909C((uint64_t)a2, (uint64_t)self);
    }
  }
  else
  {
    BOOL v11 = [(CPLCloudKitCoordinator *)self zoneishContainer];
    BOOL v12 = v11;
    if (v10) {
      [v11 privateCloudDatabase];
    }
    else {
    uint64_t v10 = [v11 sharedCloudDatabase];
    }
  }
  return (id)v10;
}

- (void)getStatusForClient:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10005EBE8;
  v14[3] = &unk_100275D40;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v9 = v14;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000604E8;
  block[3] = &unk_100275DF8;
  id v18 = v9;
  uint64_t v10 = queue;
  id v11 = v7;
  id v12 = v6;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

- (void)getLastClientServedWithAPushNotificationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10005EE4C;
  v10[3] = &unk_100276210;
  v10[4] = self;
  id v11 = v4;
  id v6 = v10;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000604E8;
  block[3] = &unk_100275DF8;
  id v13 = v6;
  id v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

- (void)_askNextClient:(id)a3 toProvideCKAssetWithRecordID:(id)a4 fieldName:(id)a5 recordType:(id)a6 signature:(id)a7 bestResponseYet:(unint64_t)a8 completionHandler:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  id v21 = [v15 nextObject];
  if (v21)
  {
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10005F030;
    v28[3] = &unk_100278738;
    unint64_t v35 = a8;
    id v34 = v20;
    v28[4] = self;
    id v29 = v15;
    id v30 = v16;
    id v31 = v17;
    id v22 = v18;
    id v27 = v18;
    id v23 = v17;
    id v24 = v16;
    id v25 = v22;
    id v32 = v22;
    id v33 = v19;
    id v26 = v25;
    id v16 = v24;
    id v17 = v23;
    id v18 = v27;
    [v21 coordinator:self provideCKAssetWithRecordID:v30 fieldName:v31 recordType:v26 signature:v33 completionHandler:v28];
  }
  else
  {
    (*((void (**)(id, void, unint64_t))v20 + 2))(v20, 0, a8);
  }
}

- (void)provideCKAssetWithRecordID:(id)a3 fieldName:(id)a4 recordType:(id)a5 signature:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  queue = self->_queue;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10005F274;
  v26[3] = &unk_100278760;
  v26[4] = self;
  id v27 = v12;
  id v28 = v13;
  id v29 = v14;
  id v30 = v15;
  id v31 = v16;
  id v18 = v26;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000604E8;
  block[3] = &unk_100275DF8;
  id v33 = v18;
  id v19 = queue;
  id v20 = v16;
  id v21 = v15;
  id v22 = v14;
  id v23 = v13;
  id v24 = v12;
  dispatch_block_t v25 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v19, v25);
}

- (id)_clientsInterestedToReceiveAPushNotificationForZoneID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 ownerName];
  unsigned int v6 = [v5 isEqualToString:CKCurrentUserDefaultName];

  uint64_t v7 = 48;
  if (v6) {
    uint64_t v7 = 56;
  }
  id v8 = [*(id *)((char *)&self->super.isa + v7) objectForKeyedSubscript:v4];

  return v8;
}

- (id)_bestClientToReceivePushNotification:(id)a3
{
  id v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v4 recordZoneID], (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    unsigned int v6 = (void *)v5;
    uint64_t v7 = [(CPLCloudKitCoordinator *)self _clientsInterestedToReceiveAPushNotificationForZoneID:v5];
    id v8 = [v7 anyObject];

    if (v8) {
      goto LABEL_32;
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    dispatch_block_t v9 = self->_clientsInterestedInAllZones;
    id v10 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (!v10)
    {

LABEL_31:
      id v8 = [(CPLCloudKitCoordinator *)self _defaultClient];
      goto LABEL_32;
    }
    id v11 = v10;
    id v29 = v4;
    id v12 = 0;
    uint64_t v13 = *(void *)v31;
    uint64_t v14 = CPLLibraryIdentifierSystemLibrary;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v31 != v13) {
          objc_enumerationMutation(v9);
        }
        id v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if ([v16 isInterestedInZoneID:v6 forCoordinator:self])
        {
          id v8 = v16;

          uint64_t v17 = [v8 cloudKitClientIdentifier];
          id v18 = (void *)v17;
          if (v17) {
            BOOL v19 = v14 == 0;
          }
          else {
            BOOL v19 = 1;
          }
          if (v19)
          {
            uint64_t v20 = v17 | v14;

            id v12 = v8;
            if (!v20) {
              goto LABEL_20;
            }
          }
          else
          {
            unsigned __int8 v21 = [(id)v17 isEqual:v14];

            id v12 = v8;
            if (v21) {
              goto LABEL_20;
            }
          }
        }
      }
      id v11 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
      id v8 = v12;
    }
    while (v11);
LABEL_20:

    id v4 = v29;
    if (!v8) {
      goto LABEL_31;
    }
  }
  else
  {
    char v22 = objc_opt_respondsToSelector();
    uint64_t v23 = [(CPLCloudKitCoordinator *)self _defaultClient];
    id v8 = (id)v23;
    unsigned int v6 = 0;
    if ((v22 & 1) != 0 && !v23)
    {
      id v24 = [v4 databaseScope];
      if (v24 == (id)3)
      {
        clientsInterestedInSomeSharedZones = self->_clientsInterestedInSomeSharedZones;
      }
      else
      {
        if (v24 != (id)2)
        {
          unsigned int v6 = 0;
          id v8 = 0;
          goto LABEL_32;
        }
        clientsInterestedInSomeSharedZones = self->_clientsInterestedInSomePrivateZones;
      }
      id v26 = [(NSMutableDictionary *)clientsInterestedInSomeSharedZones allValues];
      id v27 = [v26 firstObject];
      id v8 = [v27 anyObject];

      unsigned int v6 = 0;
    }
  }
LABEL_32:

  return v8;
}

- (void)_startWaitingForPushNotifications
{
}

- (void)_stopWaitingForPushNotifications
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  pushNotificationCenter = self->_pushNotificationCenter;
  if (self->_shouldForceDroppingPushNotifications)
  {
    [(CPLCloudKitPushNotificationCenter *)pushNotificationCenter unregisterFromPushNotifications];
  }
  else
  {
    [(CPLCloudKitPushNotificationCenter *)pushNotificationCenter stopWaitingForPushNotifications];
  }
}

- (void)noteClient:(id)a3 isIgnoringChangeInZoneID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10005F810;
  v14[3] = &unk_1002760B0;
  id v15 = v6;
  id v16 = self;
  id v17 = v7;
  dispatch_block_t v9 = v14;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000604E8;
  block[3] = &unk_100275DF8;
  id v19 = v9;
  id v10 = queue;
  id v11 = v7;
  id v12 = v6;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

- (void)center:(id)a3 didReceivePushNotification:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(NSMutableSet *)self->_clients count] == (id)1)
  {
    id v6 = [(NSMutableSet *)self->_clients anyObject];
    if (!_CPLSilentLogging)
    {
      id v7 = sub_10005CE3C();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = [v6 cloudKitClientIdentifier];
        int v12 = 138543618;
        id v13 = v8;
        __int16 v14 = 2112;
        id v15 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Serving push notification to only client %{public}@: %@", (uint8_t *)&v12, 0x16u);
      }
    }
LABEL_12:
    [v6 coordinatorDidReceiveAPushNotification:self];
    goto LABEL_13;
  }
  id v6 = [(CPLCloudKitCoordinator *)self _bestClientToReceivePushNotification:v5];
  if (v6)
  {
    if (!_CPLSilentLogging)
    {
      dispatch_block_t v9 = sub_10005CE3C();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = [v6 cloudKitClientIdentifier];
        int v12 = 138543618;
        id v13 = v10;
        __int16 v14 = 2112;
        id v15 = v5;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Serving push notification to client %{public}@: %@", (uint8_t *)&v12, 0x16u);
      }
    }
    objc_storeStrong((id *)&self->_lastClientServedWithAPushNotification, v6);
    goto LABEL_12;
  }
  if (!_CPLSilentLogging)
  {
    id v11 = sub_10005CE3C();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Ignoring push notification as there is no client interested: %@", (uint8_t *)&v12, 0xCu);
    }
  }
LABEL_13:
}

- (void)fetchAccountInfoWithCompletionHandler:(id)a3
{
  id v4 = a3;
  container = self->_container;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005FCAC;
  v7[3] = &unk_100278800;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  +[CPLCallObserver observeAsyncCallOn:container selector:"accountStatusWithCompletionHandler:" block:v7];
}

- (CPLCloudKitPushNotificationCenter)pushNotificationCenter
{
  return self->_pushNotificationCenter;
}

- (CKDatabase)database
{
  return self->_database;
}

- (CKDatabase)sharedDatabase
{
  return self->_sharedDatabase;
}

- (CKContainer)container
{
  return self->_container;
}

- (CKContainer)zoneishContainer
{
  return self->_zoneishContainer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneishContainer, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_sharedDatabase, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_pushNotificationCenter, 0);
  objc_storeStrong((id *)&self->_lastClientServedWithAPushNotification, 0);
  objc_storeStrong((id *)&self->_clientsInterestedInSomePrivateZones, 0);
  objc_storeStrong((id *)&self->_clientsInterestedInSomeSharedZones, 0);
  objc_storeStrong((id *)&self->_clientsInterestedInAllZones, 0);
  objc_storeStrong((id *)&self->_foregroundClients, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end