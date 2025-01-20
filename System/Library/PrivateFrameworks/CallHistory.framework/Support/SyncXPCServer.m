@interface SyncXPCServer
- (BOOL)canAccessListenerInterfaceSelector:(SEL)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CHConfigurationAggregator)configurationAggregator;
- (CHDataStoreMaintenanceController)dataStoreMaintenanceController;
- (CHFeatureFlags)featureFlags;
- (CHPushConnectionDelegate)pushDelegate;
- (CallHistoryDBClientHandle)database;
- (CallHistoryDBPrivacyPruner)dbPrivacyPruner;
- (CloudKit)cloudKit;
- (NSXPCListener)listener;
- (OS_dispatch_queue)queue;
- (SyncEngine)syncEngine;
- (SyncXPCServer)init;
- (TransactionLog)transactionLog;
- (os_unfair_lock_s)accessorLock;
- (void)activateCloudKit;
- (void)activateDataStoreMaintenance;
- (void)appendTransactions:(id)a3;
- (void)bootUp:(id)a3;
- (void)clearSyncToken:(id)a3;
- (void)configurationAggregator:(id)a3 didChangeConfiguration:(id)a4;
- (void)deactivateCloudKit;
- (void)deactivateDataStoreMaintenance;
- (void)dealloc;
- (void)moveCallsFromTempDatabase;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)resetCallTimers:(id)a3;
- (void)setCloudKit:(id)a3;
- (void)setPushDelegate:(id)a3;
- (void)setSyncEngine:(id)a3;
- (void)setTransactionLog:(id)a3;
- (void)sync:(id)a3;
- (void)updateCloudKitActivation;
- (void)updateDataStoreMaintenance;
@end

@implementation SyncXPCServer

- (SyncXPCServer)init
{
  v30.receiver = self;
  v30.super_class = (Class)SyncXPCServer;
  v2 = [(SyncXPCServer *)&v30 initWithDomain:"SyncXPCServer"];
  if (v2)
  {
    v3 = (CHFeatureFlags *)objc_alloc_init((Class)CHFeatureFlags);
    featureFlags = v2->_featureFlags;
    v2->_featureFlags = v3;

    v2->_accessorLock._os_unfair_lock_opaque = 0;
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.CallHistory.CallHistorySyncHelper.queue", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    v8 = objc_alloc_init(CHSystemConfiguration);
    id v9 = objc_alloc_init((Class)CHUserConfiguration);
    id v10 = objc_alloc((Class)CHConfigurationAggregator);
    v31[0] = v8;
    v31[1] = v9;
    v11 = +[NSArray arrayWithObjects:v31 count:2];
    v12 = (CHConfigurationAggregator *)[v10 initWithConfigurations:v11 queue:v2->_queue];
    configurationAggregator = v2->_configurationAggregator;
    v2->_configurationAggregator = v12;

    [(CHConfigurationAggregator *)v2->_configurationAggregator setDelegate:v2];
    uint64_t v14 = +[CallHistoryDBClientHandle createForServer];
    database = v2->_database;
    v2->_database = (CallHistoryDBClientHandle *)v14;

    v16 = [(CallHistoryDBClientHandle *)v2->_database manager];
    [v16 addObserver:v2 forKeyPath:kCallDBManagerDataStoreType options:5 context:&off_1000494D8];

    v17 = objc_alloc_init(CHInteraction);
    interactionManager = v2->_interactionManager;
    v2->_interactionManager = v17;

    v19 = [[MergeTransactions alloc] initWithDatabase:v2->_database andInteractionManager:v2->_interactionManager];
    merger = v2->_merger;
    v2->_merger = v19;

    v21 = [[CHIDSServiceDelegate alloc] initWithDatabase:v2->_database];
    idsService = v2->_idsService;
    v2->_idsService = v21;

    id v23 = objc_alloc((Class)NSXPCListener);
    v24 = (NSXPCListener *)[v23 initWithMachServiceName:kSyncHelperServiceIdentifier];
    listener = v2->_listener;
    v2->_listener = v24;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener resume];
    v26 = +[NSDistributedNotificationCenter defaultCenter];
    [v26 postNotificationName:@"kCallHistorySyncHelperReadyNotification" object:0 userInfo:0];

    v27 = [(SyncXPCServer *)v2 logHandle];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v29 = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Call History sync helper is ready", v29, 2u);
    }
  }
  return v2;
}

- (void)dealloc
{
  v3 = [(CallHistoryDBClientHandle *)self->_database manager];
  [v3 removeObserver:self forKeyPath:kCallDBManagerDataStoreType context:&off_1000494D8];

  v4.receiver = self;
  v4.super_class = (Class)SyncXPCServer;
  [(SyncXPCServer *)&v4 dealloc];
}

- (CloudKit)cloudKit
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  objc_super v4 = self->_cloudKit;
  os_unfair_lock_unlock(p_accessorLock);
  return v4;
}

- (void)setCloudKit:(id)a3
{
  v5 = (CloudKit *)a3;
  os_unfair_lock_lock(&self->_accessorLock);
  if (self->_cloudKit != v5) {
    objc_storeStrong((id *)&self->_cloudKit, a3);
  }
  os_unfair_lock_unlock(&self->_accessorLock);
}

- (SyncEngine)syncEngine
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  objc_super v4 = self->_syncEngine;
  os_unfair_lock_unlock(p_accessorLock);
  return v4;
}

- (void)setSyncEngine:(id)a3
{
  v5 = (SyncEngine *)a3;
  os_unfair_lock_lock(&self->_accessorLock);
  if (self->_syncEngine != v5) {
    objc_storeStrong((id *)&self->_syncEngine, a3);
  }
  os_unfair_lock_unlock(&self->_accessorLock);
}

- (TransactionLog)transactionLog
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  objc_super v4 = self->_transactionLog;
  os_unfair_lock_unlock(p_accessorLock);
  return v4;
}

- (void)setTransactionLog:(id)a3
{
  v5 = (TransactionLog *)a3;
  os_unfair_lock_lock(&self->_accessorLock);
  if (self->_transactionLog != v5) {
    objc_storeStrong((id *)&self->_transactionLog, a3);
  }
  os_unfair_lock_unlock(&self->_accessorLock);
}

- (void)activateCloudKit
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  if (!self->_cloudKit)
  {
    id v4 = 0;
    v5 = +[CloudKit create];
    cloudKit = self->_cloudKit;
    self->_cloudKit = v5;
    v7 = v5;

    v8 = [[TransactionLog alloc] initWithDescription:"TransactionLog-XPC"];
    transactionLog = self->_transactionLog;
    self->_transactionLog = v8;
    id v10 = v8;

    v11 = [SyncEngine alloc];
    v12 = objc_alloc_init(AutoSync);
    v13 = [(SyncEngine *)v11 initWithCloudKit:v7 withTransactionLog:v10 withAutoSync:v12];
    syncEngine = self->_syncEngine;
    self->_syncEngine = v13;

    v15 = objc_alloc_init(CHPushConnectionDelegate);
    pushDelegate = self->_pushDelegate;
    self->_pushDelegate = v15;
  }
  os_unfair_lock_unlock(p_accessorLock);
}

- (void)deactivateCloudKit
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  pushDelegate = self->_pushDelegate;
  self->_pushDelegate = 0;

  syncEngine = self->_syncEngine;
  self->_syncEngine = 0;

  transactionLog = self->_transactionLog;
  self->_transactionLog = 0;

  cloudKit = self->_cloudKit;
  self->_cloudKit = 0;

  os_unfair_lock_unlock(p_accessorLock);
}

- (void)updateCloudKitActivation
{
  v3 = [(SyncXPCServer *)self configurationAggregator];
  if ([v3 isCloudKitEnabled])
  {
    id v4 = [(SyncXPCServer *)self database];
    v5 = [v4 manager];
    unsigned int v6 = [v5 dataStoreType];

    if (v6 == 1)
    {
      v7 = [(SyncXPCServer *)self logHandle];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Data store changed to permanent; activating iCloud.",
          buf,
          2u);
      }

      [(SyncXPCServer *)self activateCloudKit];
      return;
    }
  }
  else
  {
  }
  v8 = [(SyncXPCServer *)self logHandle];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Data store changed to temporary; deactivating iCloud.",
      v9,
      2u);
  }

  [(SyncXPCServer *)self deactivateCloudKit];
}

- (void)activateDataStoreMaintenance
{
  obj = self;
  objc_sync_enter(obj);
  if ([(CHFeatureFlags *)obj->_featureFlags keepCallsEnabled])
  {
    v2 = obj;
    if (obj->_dataStoreMaintenanceController) {
      goto LABEL_7;
    }
    id v3 = objc_alloc_init((Class)CHUserConfiguration);
    id v4 = [CHDataStoreMaintenanceController alloc];
    dbPrivacyPruner = [(SyncXPCServer *)obj database];
    unsigned int v6 = [(CHDataStoreMaintenanceController *)v4 initWithDataStore:dbPrivacyPruner configuration:v3];
    dataStoreMaintenanceController = obj->_dataStoreMaintenanceController;
    obj->_dataStoreMaintenanceController = v6;
  }
  else
  {
    v2 = obj;
    if (obj->_dbPrivacyPruner) {
      goto LABEL_7;
    }
    v8 = [CallHistoryDBPrivacyPruner alloc];
    id v3 = [(SyncXPCServer *)obj database];
    id v9 = [(CallHistoryDBPrivacyPruner *)v8 initWithDBHandle:v3 interactionManager:obj->_interactionManager];
    dbPrivacyPruner = obj->_dbPrivacyPruner;
    obj->_dbPrivacyPruner = v9;
  }

  v2 = obj;
LABEL_7:
  objc_sync_exit(v2);
}

- (void)deactivateDataStoreMaintenance
{
  obj = self;
  objc_sync_enter(obj);
  dataStoreMaintenanceController = obj->_dataStoreMaintenanceController;
  obj->_dataStoreMaintenanceController = 0;

  dbPrivacyPruner = obj->_dbPrivacyPruner;
  obj->_dbPrivacyPruner = 0;

  objc_sync_exit(obj);
}

- (void)updateDataStoreMaintenance
{
  id v3 = [(SyncXPCServer *)self database];
  id v4 = [v3 manager];
  unsigned int v5 = [v4 dataStoreType];

  unsigned int v6 = [(SyncXPCServer *)self logHandle];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5 == 1)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Data store changed to permanent; activating data store maintenance.",
        buf,
        2u);
    }

    [(SyncXPCServer *)self activateDataStoreMaintenance];
  }
  else
  {
    if (v7)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Data store changed to temporary; deactivating data store maintenance.",
        v8,
        2u);
    }

    [(SyncXPCServer *)self deactivateDataStoreMaintenance];
  }
}

- (BOOL)canAccessListenerInterfaceSelector:(SEL)a3
{
  unsigned int v5 = [(SyncXPCServer *)self database];
  unsigned int v6 = [v5 manager];
  if ([v6 dataStoreType] == 1 || sel_isEqual(a3, "appendTransactions:"))
  {

    return 1;
  }
  BOOL isEqual = sel_isEqual(a3, "bootUp:");

  if (isEqual) {
    return 1;
  }
  id v9 = [(SyncXPCServer *)self logHandle];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = NSStringFromSelector(a3);
    v11 = +[NSXPCConnection currentConnection];
    int v12 = 138543618;
    v13 = v10;
    __int16 v14 = 2114;
    v15 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Device has not been unlocked since boot; rejecting access to %{public}@ from connection %{public}@",
      (uint8_t *)&v12,
      0x16u);
  }
  return 0;
}

- (void)bootUp:(id)a3
{
  unsigned int v5 = (void (**)(id, uint64_t))a3;
  if ([(SyncXPCServer *)self canAccessListenerInterfaceSelector:a2])
  {
    unsigned int v6 = [(CallHistoryDBClientHandle *)self->_database manager];
    [v6 createDataStore];

    BOOL v7 = [(CallHistoryDBClientHandle *)self->_database manager];
    unsigned int v8 = [v7 dataStoreType];

    if (v8 == 1) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = 2 * (v8 != 0);
    }
    id v10 = [(SyncXPCServer *)self logHandle];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = sub_10000DEB0(v9);
      int v12 = 138543362;
      v13 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "BootUp result: %{public}@", (uint8_t *)&v12, 0xCu);
    }
    v5[2](v5, v9);
  }
}

- (void)moveCallsFromTempDatabase
{
  if ([(SyncXPCServer *)self canAccessListenerInterfaceSelector:a2])
  {
    id v3 = [(CallHistoryDBClientHandle *)self->_database manager];
    [v3 moveCallsFromTempDatabase];
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  unsigned int v6 = [(SyncXPCServer *)self logHandle];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v15 = [v5 processIdentifier];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Accepting new connection from pid %d", buf, 8u);
  }

  BOOL v7 = [v5 valueForEntitlement:@"com.apple.CallHistory.sync.allow"];
  if (!v7)
  {
    unsigned int v8 = [(SyncXPCServer *)self logHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10002EBAC(v8);
    }
    goto LABEL_14;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    unsigned int v8 = [(SyncXPCServer *)self logHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int v12 = "Entitlement is not a BOOLean";
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v12, buf, 2u);
    }
LABEL_14:
    BOOL v11 = 0;
    goto LABEL_15;
  }
  if (([v7 BOOLValue] & 1) == 0)
  {
    unsigned int v8 = [(SyncXPCServer *)self logHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int v12 = "Entitlement found but expected value YES";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  unsigned int v8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SyncProtocol];
  uint64_t v9 = objc_opt_class();
  id v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, objc_opt_class(), 0);
  [v8 setClasses:v10 forSelector:"appendTransactions:" argumentIndex:0 ofReply:0];
  [v5 setExportedInterface:v8];
  [v5 setExportedObject:self];
  [v5 resume];

  BOOL v11 = 1;
LABEL_15:

  return v11;
}

- (void)appendTransactions:(id)a3
{
  id v5 = a3;
  if ([(SyncXPCServer *)self canAccessListenerInterfaceSelector:a2])
  {
    unsigned int v6 = [(SyncXPCServer *)self logHandle];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134217984;
      id v14 = [v5 count];
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Appending %lu transactions", (uint8_t *)&v13, 0xCu);
    }

    if (v5 && [v5 count])
    {
      BOOL v7 = DeserializeTransactions();
      HandleInteractionsForDeserializedTransactions();
      [(CHIDSServiceDelegate *)self->_idsService update:v5];
      if ([(CHFeatureFlags *)self->_featureFlags callHistorySearchEnabled])
      {
        unsigned int v8 = +[CHSpotlightIndexManager sharedInstance];
        [v8 indexTransactions:v5];
      }
      uint64_t v9 = [(SyncXPCServer *)self cloudKit];
      unsigned __int8 v10 = [v9 isActive];

      if (v10)
      {
        BOOL v11 = [(SyncXPCServer *)self transactionLog];
        [v11 append:v5];
      }
      else
      {
        BOOL v11 = [(SyncXPCServer *)self logHandle];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          id v12 = [v5 count];
          int v13 = 134217984;
          id v14 = v12;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Dropping %lu transactions because no iCloud account is active", (uint8_t *)&v13, 0xCu);
        }
      }
    }
    else
    {
      BOOL v7 = [(SyncXPCServer *)self logHandle];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No transactions!", (uint8_t *)&v13, 2u);
      }
    }
  }
}

- (void)sync:(id)a3
{
  id v5 = a3;
  if ([(SyncXPCServer *)self canAccessListenerInterfaceSelector:a2])
  {
    unsigned int v6 = [(SyncXPCServer *)self syncEngine];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100015354;
    v7[3] = &unk_1000494E8;
    v7[4] = self;
    id v8 = v5;
    [v6 begin:v7];
  }
}

- (void)clearSyncToken:(id)a3
{
}

- (void)resetCallTimers:(id)a3
{
  id v5 = (void (**)(id, id))a3;
  if ([(SyncXPCServer *)self canAccessListenerInterfaceSelector:a2]) {
    v5[2](v5, [(CallHistoryDBClientHandle *)self->_database resetAllTimers]);
  }
}

- (void)configurationAggregator:(id)a3 didChangeConfiguration:(id)a4
{
  id v5 = [(SyncXPCServer *)self queue];
  dispatch_assert_queue_V2(v5);

  [(SyncXPCServer *)self updateCloudKitActivation];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = [(SyncXPCServer *)self logHandle];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v20 = v10;
    __int16 v21 = 2114;
    id v22 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received a key-value observing notification for key path (%{public}@), object (%{public}@).", buf, 0x16u);
  }

  if (a6 == &off_1000494D8)
  {
    id v14 = [v12 objectForKeyedSubscript:NSKeyValueChangeKindKey];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v14 unsignedIntegerValue] == (id)1)
    {
      unsigned int v15 = [(SyncXPCServer *)self database];
      id v16 = [v15 manager];

      if (v16 == v11)
      {
        if ([v10 isEqualToString:kCallDBManagerDataStoreType])
        {
          v17 = [(SyncXPCServer *)self queue];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100015720;
          block[3] = &unk_100048BC8;
          block[4] = self;
          dispatch_async(v17, block);
        }
      }
    }
  }
}

- (CHFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (CHConfigurationAggregator)configurationAggregator
{
  return self->_configurationAggregator;
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CallHistoryDBClientHandle)database
{
  return self->_database;
}

- (CallHistoryDBPrivacyPruner)dbPrivacyPruner
{
  return (CallHistoryDBPrivacyPruner *)objc_getProperty(self, a2, 96, 1);
}

- (CHDataStoreMaintenanceController)dataStoreMaintenanceController
{
  return (CHDataStoreMaintenanceController *)objc_getProperty(self, a2, 104, 1);
}

- (CHPushConnectionDelegate)pushDelegate
{
  return self->_pushDelegate;
}

- (void)setPushDelegate:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_pushDelegate, 0);
  objc_storeStrong((id *)&self->_dataStoreMaintenanceController, 0);
  objc_storeStrong((id *)&self->_dbPrivacyPruner, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_configurationAggregator, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_transactionLog, 0);
  objc_storeStrong((id *)&self->_syncEngine, 0);
  objc_storeStrong((id *)&self->_cloudKit, 0);
  objc_storeStrong((id *)&self->_interactionManager, 0);
  objc_storeStrong((id *)&self->_merger, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
}

@end