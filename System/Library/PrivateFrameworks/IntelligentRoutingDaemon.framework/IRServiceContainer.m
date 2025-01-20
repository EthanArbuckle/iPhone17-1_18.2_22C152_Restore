@interface IRServiceContainer
+ (BOOL)deleteDatabaseWithPersistenceManager:(id)a3;
+ (id)createServiceWithClientIdentifier:(id)a3 serviceIdentifier:(id)a4 parameters:(id)a5 persistenceManager:(id)a6;
+ (id)exportDatabaseWithPersistenceManager:(id)a3;
+ (id)getServiceTokensForClientIdentifier:(id)a3 persistenceManager:(id)a4;
+ (id)getServicesWithPersistenceManager:(id)a3;
+ (void)deleteServiceWithToken:(id)a3 persistenceManager:(id)a4;
- (IRAVOutputContextController)audioAVOutputContextController;
- (IRAVOutputDeviceProvider)avOutputDeviceProvider;
- (IRBiomeProvider)biomeProvider;
- (IRDisplayMonitor)displayMonitor;
- (IRMiLoProvider)miloProvider;
- (IRPersistenceManager)persistenceManager;
- (IRPolicyManager)policyManager;
- (IRProximityProvider)proximityProvider;
- (IRRapportProvider)rapportProvider;
- (IRServiceContainer)initWithServiceIdentifier:(id)a3 delegate:(id)a4 avOutputDeviceProvider:(id)a5 biomeProvider:(id)a6 rapportProvider:(id)a7 proximityProvider:(id)a8 persistenceManager:(id)a9 displayMonitor:(id)a10 audioAVOutputContextController:(id)a11 isLowLatencyMiLo:(BOOL)a12;
- (IRServiceContainerDelegate)delegate;
- (IRServiceLogPrefix)serviceLogPrefix;
- (IRServiceStore)serviceStore;
- (NSString)serviceIdentifier;
- (OS_dispatch_queue)queue;
- (id)getStatistics;
- (id)requestCurrentContextWithBundleID:(id)a3;
- (int64_t)getUpdateMode;
- (void)_refreshServiceWithDate:(id)a3;
- (void)addEvent:(id)a3 forCandidate:(id)a4;
- (void)clearStatistics;
- (void)dbCleanupWithDateIntervalOfMiLoPredictionsToDiscard:(id)a3;
- (void)dealloc;
- (void)deallocSync;
- (void)deleteCandidate:(id)a3;
- (void)policyManager:(id)a3 didSpotOnLocationCompleteForClientIds:(id)a4 withError:(id)a5;
- (void)policyManager:(id)a3 didUpdateBundlesWithSignificantInteractionPattern:(id)a4;
- (void)policyManager:(id)a3 didUpdateContexts:(id)a4 withReason:(id)a5;
- (void)requestUpdatedBundlesWithSignificantInteraction;
- (void)restartLowLatencyMiLo:(BOOL)a3;
- (void)run;
- (void)setAudioAVOutputContextController:(id)a3;
- (void)setAvOutputDeviceProvider:(id)a3;
- (void)setBiomeProvider:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayMonitor:(id)a3;
- (void)setMiloProvider:(id)a3;
- (void)setPersistenceManager:(id)a3;
- (void)setPolicyManager:(id)a3;
- (void)setProximityProvider:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRapportProvider:(id)a3;
- (void)setServiceIdentifier:(id)a3;
- (void)setServiceLogPrefix:(id)a3;
- (void)setServiceStore:(id)a3;
- (void)setSpotOnLocationWithParameters:(id)a3 andClientID:(id)a4;
- (void)setUpdateMode:(int64_t)a3;
- (void)updateCandidates:(id)a3;
@end

@implementation IRServiceContainer

void __36__IRServiceContainer_setUpdateMode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  v5 = (void *)*MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
  {
    v6 = NSNumber;
    uint64_t v7 = *(void *)(a1 + 32);
    v8 = v5;
    v9 = [v6 numberWithInteger:v7];
    int v11 = 136315650;
    v12 = "#service-container, ";
    __int16 v13 = 2112;
    v14 = v4;
    __int16 v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_25418E000, v8, OS_LOG_TYPE_INFO, "%s[%@], Setting service mode to: %@", (uint8_t *)&v11, 0x20u);
  }
  v10 = [v3 policyManager];
  [v10 setUpdateMode:*(void *)(a1 + 32)];
}

void __35__IRServiceContainer_getUpdateMode__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = [a2 policyManager];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 mode];

  v4 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  v5 = (void *)*MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
  {
    v6 = NSNumber;
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    v8 = v5;
    v9 = [v6 numberWithInteger:v7];
    int v10 = 136315650;
    int v11 = "#service-container, ";
    __int16 v12 = 2112;
    __int16 v13 = v4;
    __int16 v14 = 2112;
    __int16 v15 = v9;
    _os_log_impl(&dword_25418E000, v8, OS_LOG_TYPE_INFO, "%s[%@], Getting service mode: %@", (uint8_t *)&v10, 0x20u);
  }
}

- (IRPolicyManager)policyManager
{
  return self->_policyManager;
}

void __25__IRServiceContainer_run__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  v4 = *MEMORY[0x263F500A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F500A0], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    v8 = "#service-container, ";
    __int16 v9 = 2112;
    int v10 = v3;
    _os_log_impl(&dword_25418E000, v4, OS_LOG_TYPE_DEFAULT, "%s[%@], Running service", (uint8_t *)&v7, 0x16u);
  }

  v5 = [MEMORY[0x263EFF910] date];
  [v2 _refreshServiceWithDate:v5];

  v6 = [v2 policyManager];
  [v6 run];
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)_refreshServiceWithDate:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(IRServiceContainer *)self serviceStore];
  v6 = [v5 fetchService];

  if (!v6)
  {
    int v10 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
    __int16 v12 = *MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315394;
      __int16 v14 = "#service-container, ";
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      _os_log_impl(&dword_25418E000, v12, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - Service not in DB] Cant initialize a new service container, service identifier does not exist in DB", (uint8_t *)&v13, 0x16u);
    }
    int v7 = 0;
    goto LABEL_8;
  }
  int v7 = (void *)[v6 copyWithReplacementLastSeenDate:v4];

  v8 = [(IRServiceContainer *)self serviceStore];
  char v9 = [v8 updateService:v7];

  if ((v9 & 1) == 0)
  {
    int v10 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
    uint64_t v11 = *MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315650;
      __int16 v14 = "#service-container, ";
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl(&dword_25418E000, v11, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - Service container update during refresh] Could not update service during refresh: %@", (uint8_t *)&v13, 0x20u);
    }
LABEL_8:
  }
}

- (IRServiceStore)serviceStore
{
  return self->_serviceStore;
}

- (void)policyManager:(id)a3 didUpdateContexts:(id)a4 withReason:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  char v9 = [(IRServiceContainer *)self queue];
  dispatch_assert_queue_V2(v9);

  id v10 = [(IRServiceContainer *)self delegate];
  [v10 serviceContainer:self didUpdateContexts:v8 withReason:v7];
}

- (IRServiceContainerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IRServiceContainerDelegate *)WeakRetained;
}

- (void)setUpdateMode:(int64_t)a3
{
  v5 = [(IRServiceContainer *)self queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __36__IRServiceContainer_setUpdateMode___block_invoke;
  v6[3] = &__block_descriptor_40_e28_v16__0__IRServiceContainer_8l;
  v6[4] = a3;
  IRDispatchAsyncWithStrongSelf(v5, self, v6);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)run
{
  id v3 = [(IRServiceContainer *)self queue];
  IRDispatchAsyncWithStrongSelf(v3, self, &__block_literal_global_37);
}

- (int64_t)getUpdateMode
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  id v3 = [(IRServiceContainer *)self queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35__IRServiceContainer_getUpdateMode__block_invoke;
  v6[3] = &unk_26539FA28;
  v6[4] = &v7;
  IRDispatchAsyncAndWaitWithStrongSelf(v3, self, v6);

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (IRServiceContainer)initWithServiceIdentifier:(id)a3 delegate:(id)a4 avOutputDeviceProvider:(id)a5 biomeProvider:(id)a6 rapportProvider:(id)a7 proximityProvider:(id)a8 persistenceManager:(id)a9 displayMonitor:(id)a10 audioAVOutputContextController:(id)a11 isLowLatencyMiLo:(BOOL)a12
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a8;
  id v24 = a9;
  id v25 = a10;
  id v26 = a11;
  v58.receiver = self;
  v58.super_class = (Class)IRServiceContainer;
  v27 = [(IRServiceContainer *)&v58 init];
  v28 = v27;
  v54 = v23;
  if (!v27) {
    goto LABEL_6;
  }
  [(IRServiceContainer *)v27 setServiceIdentifier:v18];
  id v53 = v19;
  [(IRServiceContainer *)v28 setDelegate:v19];
  id v52 = v20;
  [(IRServiceContainer *)v28 setAvOutputDeviceProvider:v20];
  id v51 = v21;
  [(IRServiceContainer *)v28 setBiomeProvider:v21];
  [(IRServiceContainer *)v28 setRapportProvider:v22];
  [(IRServiceContainer *)v28 setPersistenceManager:v24];
  [(IRServiceContainer *)v28 setProximityProvider:v23];
  [(IRServiceContainer *)v28 setDisplayMonitor:v25];
  [(IRServiceContainer *)v28 setAudioAVOutputContextController:v26];
  id v29 = [NSString stringWithFormat:@"%@.%@", @"com.apple.intelligentroutingd.serviceContainer", v18];
  v30 = (const char *)[v29 UTF8String];
  v31 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v32 = dispatch_queue_create(v30, v31);
  [(IRServiceContainer *)v28 setQueue:v32];

  v33 = [(IRServiceContainer *)v28 persistenceManager];
  LOBYTE(v32) = [v33 connectToStore];

  if ((v32 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR)) {
      -[IRServiceContainer initWithServiceIdentifier:delegate:avOutputDeviceProvider:biomeProvider:rapportProvider:proximityProvider:persistenceManager:displayMonitor:audioAVOutputContextController:isLowLatencyMiLo:]();
    }
    goto LABEL_13;
  }
  v34 = [IRServiceStore alloc];
  uint64_t v35 = [(IRServiceContainer *)v28 persistenceManager];
  v36 = [(IRServiceContainer *)v28 serviceIdentifier];
  v37 = [(IRServiceStore *)v34 initWithPersistenceManager:v35 serviceIdentifier:v36];
  [(IRServiceContainer *)v28 setServiceStore:v37];

  v38 = [(IRServiceContainer *)v28 serviceStore];
  LOBYTE(v35) = [v38 injectStatisticsRelationship];

  if ((v35 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR)) {
      -[IRServiceContainer initWithServiceIdentifier:delegate:avOutputDeviceProvider:biomeProvider:rapportProvider:proximityProvider:persistenceManager:displayMonitor:audioAVOutputContextController:isLowLatencyMiLo:]();
    }
    goto LABEL_13;
  }
  v39 = [(IRServiceContainer *)v28 serviceStore];
  v40 = [v39 fetchService];

  if (!v40)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR)) {
      -[IRServiceContainer initWithServiceIdentifier:delegate:avOutputDeviceProvider:biomeProvider:rapportProvider:proximityProvider:persistenceManager:displayMonitor:audioAVOutputContextController:isLowLatencyMiLo:]();
    }
LABEL_13:
    v49 = 0;
    id v20 = v52;
    id v19 = v53;
    id v21 = v51;
    goto LABEL_14;
  }
  v41 = objc_alloc_init(IRServiceLogPrefix);
  [(IRServiceContainer *)v28 setServiceLogPrefix:v41];

  v42 = [v40 serviceIdentifier];
  v43 = [(IRServiceContainer *)v28 serviceLogPrefix];
  [v43 setPrefix:v42];

  v44 = [(IRServiceContainer *)v28 queue];
  v45 = (const void *)*MEMORY[0x263F50120];
  v46 = [(IRServiceContainer *)v28 serviceLogPrefix];
  dispatch_queue_set_specific(v44, v45, v46, 0);

  v47 = [(IRServiceContainer *)v28 queue];
  v55[0] = MEMORY[0x263EF8330];
  v55[1] = 3221225472;
  v55[2] = __210__IRServiceContainer_initWithServiceIdentifier_delegate_avOutputDeviceProvider_biomeProvider_rapportProvider_proximityProvider_persistenceManager_displayMonitor_audioAVOutputContextController_isLowLatencyMiLo___block_invoke;
  v55[3] = &unk_26539F920;
  id v56 = v40;
  BOOL v57 = a12;
  id v48 = v40;
  IRDispatchSyncWithStrongSelf(v47, v28, v55);

  id v20 = v52;
  id v19 = v53;
  id v21 = v51;
LABEL_6:
  v49 = v28;
LABEL_14:

  return v49;
}

void __210__IRServiceContainer_initWithServiceIdentifier_delegate_avOutputDeviceProvider_biomeProvider_rapportProvider_proximityProvider_persistenceManager_displayMonitor_audioAVOutputContextController_isLowLatencyMiLo___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int64_t v4 = [IRMiLoProvider alloc];
  v5 = [v3 queue];
  v6 = [(IRMiLoProvider *)v4 initWithQueue:v5];
  [v3 setMiloProvider:v6];

  uint64_t v7 = [IRPolicyManager alloc];
  uint64_t v18 = *(void *)(a1 + 32);
  id v19 = v7;
  id v20 = [v3 queue];
  id v8 = [v3 avOutputDeviceProvider];
  uint64_t v9 = [v3 biomeProvider];
  uint64_t v10 = [v3 miloProvider];
  uint64_t v11 = [v3 rapportProvider];
  __int16 v12 = [v3 proximityProvider];
  int v13 = [v3 serviceStore];
  __int16 v14 = [v3 displayMonitor];
  __int16 v15 = [v3 audioAVOutputContextController];
  LOBYTE(v17) = *(unsigned char *)(a1 + 40);
  uint64_t v16 = [(IRPolicyManager *)v19 initWithService:v18 queue:v20 delegate:v3 avOutputDeviceProvider:v8 biomeProvider:v9 miloProvider:v10 rapportProvider:v11 proximityProvider:v12 serviceStore:v13 displayMonitor:v14 audioAVOutputContextController:v15 isLowLatencyMiLo:v17];
  [v3 setPolicyManager:v16];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)IRServiceContainer;
  [(IRServiceContainer *)&v2 dealloc];
}

- (void)deallocSync
{
  id v3 = [(IRServiceContainer *)self queue];
  IRDispatchSyncWithStrongSelf(v3, self, &__block_literal_global_3);
}

void __33__IRServiceContainer_deallocSync__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = (const void **)MEMORY[0x263F50120];
  int64_t v4 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  v5 = *MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    uint64_t v9 = "#service-container, ";
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl(&dword_25418E000, v5, OS_LOG_TYPE_INFO, "%s[%@], Sync deallocation", (uint8_t *)&v8, 0x16u);
  }

  v6 = [v2 policyManager];
  [v6 deallocSync];

  uint64_t v7 = [v2 queue];
  dispatch_queue_set_specific(v7, *v3, 0, 0);
}

+ (id)createServiceWithClientIdentifier:(id)a3 serviceIdentifier:(id)a4 parameters:(id)a5 persistenceManager:(id)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  int v13 = (os_log_t *)MEMORY[0x263F50090];
  __int16 v14 = *MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 138412546;
    id v28 = v9;
    __int16 v29 = 2112;
    id v30 = v11;
    _os_log_impl(&dword_25418E000, v14, OS_LOG_TYPE_DEFAULT, "#service-container, Creating a service for client: %@, with parameters = %@", (uint8_t *)&v27, 0x16u);
  }
  if ((objc_msgSend(MEMORY[0x263F500F8], "isServicePackageSupported:", objc_msgSend(v11, "servicePackage")) & 1) == 0)
  {
    if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR)) {
      +[IRServiceContainer createServiceWithClientIdentifier:serviceIdentifier:parameters:persistenceManager:]();
    }
    goto LABEL_13;
  }
  if (([v12 connectToStore] & 1) == 0)
  {
    if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR)) {
      +[IRServiceContainer createServiceWithClientIdentifier:serviceIdentifier:parameters:persistenceManager:]();
    }
LABEL_13:
    id v25 = 0;
    goto LABEL_18;
  }
  __int16 v15 = [MEMORY[0x263EFF910] date];
  uint64_t v16 = +[IRServiceDO serviceDOWithLastSeenDate:clientIdentifier:serviceIdentifier:servicePackage:](IRServiceDO, "serviceDOWithLastSeenDate:clientIdentifier:serviceIdentifier:servicePackage:", v15, v9, v10, [v11 servicePackage]);

  uint64_t v17 = [IRServiceStore alloc];
  uint64_t v18 = [v16 serviceIdentifier];
  id v19 = [(IRServiceStore *)v17 initWithPersistenceManager:v12 serviceIdentifier:v18];

  if ([(IRServiceStore *)v19 addService:v16])
  {
    id v20 = (void *)*MEMORY[0x263F500A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F500A0], OS_LOG_TYPE_DEFAULT))
    {
      id v21 = v20;
      id v22 = [v16 serviceIdentifier];
      int v27 = 138412290;
      id v28 = v22;
      _os_log_impl(&dword_25418E000, v21, OS_LOG_TYPE_DEFAULT, "#service-container, Service created: %@", (uint8_t *)&v27, 0xCu);
    }
    id v23 = objc_alloc(MEMORY[0x263F50100]);
    id v24 = [v16 serviceIdentifier];
    id v25 = objc_msgSend(v23, "initWithServiceIdentifier:servicePackage:", v24, objc_msgSend(v11, "servicePackage"));
  }
  else
  {
    if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR)) {
      +[IRServiceContainer createServiceWithClientIdentifier:serviceIdentifier:parameters:persistenceManager:]();
    }
    id v25 = 0;
  }

LABEL_18:

  return v25;
}

+ (void)deleteServiceWithToken:(id)a3 persistenceManager:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = [a3 serviceIdentifier];
  uint64_t v7 = *MEMORY[0x263F500A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F500A0], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl(&dword_25418E000, v7, OS_LOG_TYPE_DEFAULT, "#service-container, [%@]: Trying to delete service", (uint8_t *)&v9, 0xCu);
  }
  if ([v5 connectToStore])
  {
    if (!+[IRMiLoProvider deleteServiceWithToken:v6]
      && os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR))
    {
      +[IRServiceContainer deleteServiceWithToken:persistenceManager:]();
    }
    int v8 = [[IRServiceStore alloc] initWithPersistenceManager:v5 serviceIdentifier:v6];
    if (![(IRServiceStore *)v8 deleteService]
      && os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR))
    {
      +[IRServiceContainer deleteServiceWithToken:persistenceManager:]();
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR))
  {
    +[IRServiceContainer deleteServiceWithToken:persistenceManager:]();
  }
}

+ (id)exportDatabaseWithPersistenceManager:(id)a3
{
  v108[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  int64_t v4 = *MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_25418E000, v4, OS_LOG_TYPE_DEFAULT, "#service-container, Trying to export DB", buf, 2u);
  }
  if ([v3 connectToStore])
  {
    id v5 = [MEMORY[0x263F08850] userLibraryDirectoryPath];
    v6 = [v3 persistenceStore];
    uint64_t v7 = [v6 url];

    uint64_t v8 = [NSString stringWithFormat:@"%@/%@", v5, @"/Logs/intelligentroutingd/intelligentroutingexport"];
    uint64_t v107 = *MEMORY[0x263F08078];
    v108[0] = &unk_2703AF050;
    v88 = [NSDictionary dictionaryWithObjects:v108 forKeys:&v107 count:1];
    int v9 = [MEMORY[0x263F08850] defaultManager];
    char v10 = [v9 fileExistsAtPath:v8 isDirectory:0];

    if ((v10 & 1) == 0)
    {
      uint64_t v11 = [MEMORY[0x263F08850] defaultManager];
      id v100 = 0;
      id v12 = (void *)v8;
      char v13 = [v11 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:v88 error:&v100];
      id v14 = v100;

      if ((v13 & 1) == 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR))
        {
          v45 = v12;
          +[IRServiceContainer exportDatabaseWithPersistenceManager:]();
          id v41 = 0;
        }
        else
        {
          id v41 = 0;
          v45 = v12;
        }
LABEL_48:

        goto LABEL_49;
      }

      uint64_t v8 = (uint64_t)v12;
    }
    __int16 v15 = NSURL;
    uint64_t v16 = NSString;
    v82 = v7;
    v83 = v5;
    uint64_t v17 = [v7 lastPathComponent];
    v81 = (void *)v8;
    uint64_t v18 = [v16 stringWithFormat:@"%@/%@", v8, v17];
    id v19 = [v15 fileURLWithPath:v18 isDirectory:0];

    id v20 = NSURL;
    id v21 = [v19 path];
    id v22 = [v21 stringByAppendingString:@"-wal"];
    uint64_t v23 = [v20 fileURLWithPath:v22 isDirectory:0];

    id v24 = NSURL;
    id v25 = [v19 path];
    id v26 = [v25 stringByAppendingString:@"-shm"];
    uint64_t v27 = [v24 fileURLWithPath:v26 isDirectory:0];

    v84 = (void *)v27;
    v85 = (void *)v23;
    v86 = v19;
    objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v19, v23, v27, 0);
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v28 = [obj countByEnumeratingWithState:&v96 objects:v106 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      id v30 = 0;
      uint64_t v31 = *(void *)v97;
      while (2)
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v97 != v31) {
            objc_enumerationMutation(obj);
          }
          v33 = *(void **)(*((void *)&v96 + 1) + 8 * i);
          v34 = [MEMORY[0x263F08850] defaultManager];
          uint64_t v35 = [v33 path];
          int v36 = [v34 fileExistsAtPath:v35];

          if (v36)
          {
            v37 = [MEMORY[0x263F08850] defaultManager];
            v38 = [v33 path];
            id v95 = v30;
            char v39 = [v37 removeItemAtPath:v38 error:&v95];
            id v40 = v95;

            if ((v39 & 1) == 0)
            {
              v42 = (void *)*MEMORY[0x263F50090];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR)) {
                +[IRServiceContainer exportDatabaseWithPersistenceManager:(uint64_t)v40];
              }
              id v41 = 0;
              id v14 = v86;
              v43 = obj;
              v44 = obj;
              uint64_t v7 = v82;
              id v5 = v83;
              v45 = v81;
              goto LABEL_47;
            }
            id v30 = v40;
          }
        }
        uint64_t v29 = [obj countByEnumeratingWithState:&v96 objects:v106 count:16];
        if (v29) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v30 = 0;
    }
    v79 = v30;

    id v46 = objc_alloc(MEMORY[0x263EFF320]);
    v47 = [v3 managedObjectModel];
    id v48 = (void *)[v46 initWithManagedObjectModel:v47];

    v49 = [v3 persistenceStore];
    v50 = [v49 options];
    id v51 = [v49 url];
    id v52 = [v49 options];
    v77 = v49;
    id v53 = [v49 storeType];
    id v94 = 0;
    char v54 = [v48 replacePersistentStoreAtURL:v86 destinationOptions:v50 withPersistentStoreFromURL:v51 sourceOptions:v52 storeType:v53 error:&v94];
    id v80 = v94;

    v55 = (void *)*MEMORY[0x263F50090];
    v78 = v48;
    id v56 = *MEMORY[0x263F50090];
    if (v54)
    {
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v57 = v55;
        objc_super v58 = [v86 path];
        *(_DWORD *)buf = 138412290;
        v102 = v58;
        _os_log_impl(&dword_25418E000, v57, OS_LOG_TYPE_DEFAULT, "#service-container, Successfully exported database to: %@", buf, 0xCu);
      }
      id v76 = v3;
      id v41 = objc_alloc_init(MEMORY[0x263EFF8C0]);
      long long v90 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      id v59 = obj;
      uint64_t v60 = [v59 countByEnumeratingWithState:&v90 objects:v105 count:16];
      if (v60)
      {
        uint64_t v61 = v60;
        uint64_t v62 = *(void *)v91;
        unint64_t v63 = 0x263F08000uLL;
        do
        {
          for (uint64_t j = 0; j != v61; ++j)
          {
            if (*(void *)v91 != v62) {
              objc_enumerationMutation(v59);
            }
            v65 = *(void **)(*((void *)&v90 + 1) + 8 * j);
            v66 = [*(id *)(v63 + 2128) defaultManager];
            v67 = [v65 path];
            int v68 = [v66 fileExistsAtPath:v67];

            if (v68)
            {
              v69 = [*(id *)(v63 + 2128) defaultManager];
              v70 = [v65 path];
              id v89 = 0;
              char v71 = [v69 setAttributes:v88 ofItemAtPath:v70 error:&v89];
              id v72 = v89;

              if ((v71 & 1) == 0)
              {
                v73 = *MEMORY[0x263F50090];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v102 = v65;
                  __int16 v103 = 2112;
                  id v104 = v72;
                  _os_log_error_impl(&dword_25418E000, v73, OS_LOG_TYPE_ERROR, "#service-container, [ErrorId - export database: error setting file permissions] failed to change permissions of file: %@ with error: %@", buf, 0x16u);
                }
              }
              uint64_t v74 = [v41 arrayByAddingObject:v65];

              id v41 = (id)v74;
              unint64_t v63 = 0x263F08000;
            }
          }
          uint64_t v61 = [v59 countByEnumeratingWithState:&v90 objects:v105 count:16];
        }
        while (v61);
      }

      id v3 = v76;
      uint64_t v7 = v82;
      id v5 = v83;
    }
    else
    {
      uint64_t v7 = v82;
      id v5 = v83;
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
        +[IRServiceContainer exportDatabaseWithPersistenceManager:]();
      }
      id v41 = 0;
    }
    v45 = v81;
    id v14 = v86;

    v43 = obj;
    id v40 = v79;
    v44 = v80;
LABEL_47:

    goto LABEL_48;
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR)) {
    +[IRServiceContainer exportDatabaseWithPersistenceManager:].cold.4();
  }
  id v41 = 0;
LABEL_49:

  return v41;
}

+ (BOOL)deleteDatabaseWithPersistenceManager:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  int64_t v4 = (NSObject **)MEMORY[0x263F50090];
  id v5 = (void *)*MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    uint64_t v7 = [v3 getLocalStoreURL];
    *(_DWORD *)buf = 138412290;
    uint64_t v18 = v7;
    _os_log_impl(&dword_25418E000, v6, OS_LOG_TYPE_DEFAULT, "#service-container, Attempting to delete database at: %@", buf, 0xCu);
  }
  if ([v3 disconnectFromStore])
  {
    uint64_t v8 = [v3 persistentStoreCoordinator];
    int v9 = [v3 getLocalStoreURL];
    uint64_t v10 = *MEMORY[0x263EFF168];
    id v16 = 0;
    char v11 = [v8 destroyPersistentStoreAtURL:v9 withType:v10 options:0 error:&v16];
    id v12 = v16;

    char v13 = *v4;
    id v14 = *v4;
    if (v11)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_25418E000, v13, OS_LOG_TYPE_DEFAULT, "#service-container, Database deleted", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      +[IRServiceContainer deleteDatabaseWithPersistenceManager:]();
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

+ (id)getServiceTokensForClientIdentifier:(id)a3 persistenceManager:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (os_log_t *)MEMORY[0x263F50090];
  uint64_t v8 = *MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v5;
    _os_log_impl(&dword_25418E000, v8, OS_LOG_TYPE_DEFAULT, "#service-container, Trying to get service tokens for client identifier: %@", buf, 0xCu);
  }
  if ([v6 connectToStore])
  {
    int v9 = +[IRServiceStore fetchAllServicesForClientIdentifier:v5 persistenceManager:v6];
    if (v9)
    {
      uint64_t v10 = [MEMORY[0x263EFF980] array];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __77__IRServiceContainer_getServiceTokensForClientIdentifier_persistenceManager___block_invoke;
      v13[3] = &unk_26539F968;
      id v11 = v10;
      id v14 = v11;
      [v9 enumerateObjectsUsingBlock:v13];
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR)) {
      +[IRServiceContainer getServiceTokensForClientIdentifier:persistenceManager:]();
    }
    id v11 = 0;
  }

  return v11;
}

void __77__IRServiceContainer_getServiceTokensForClientIdentifier_persistenceManager___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x263F50100];
  id v4 = a2;
  id v5 = [v3 alloc];
  id v6 = [v4 serviceIdentifier];
  uint64_t v7 = [v4 servicePackage];

  id v8 = (id)[v5 initWithServiceIdentifier:v6 servicePackage:v7];
  [*(id *)(a1 + 32) addObject:v8];
}

+ (id)getServicesWithPersistenceManager:(id)a3
{
  id v3 = a3;
  if ([v3 connectToStore])
  {
    id v4 = +[IRServiceStore fetchAllServicesWithPersistenceManager:v3];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_ERROR)) {
      +[IRServiceContainer getServicesWithPersistenceManager:]();
    }
    id v4 = 0;
  }

  return v4;
}

- (void)updateCandidates:(id)a3
{
  id v4 = a3;
  id v5 = [(IRServiceContainer *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__IRServiceContainer_updateCandidates___block_invoke;
  v7[3] = &unk_26539F990;
  id v8 = v4;
  id v6 = v4;
  IRDispatchAsyncWithStrongSelf(v5, self, v7);
}

void __39__IRServiceContainer_updateCandidates___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 policyManager];
  [v3 updateCandidates:*(void *)(a1 + 32)];
}

- (void)deleteCandidate:(id)a3
{
  id v4 = a3;
  id v5 = [(IRServiceContainer *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__IRServiceContainer_deleteCandidate___block_invoke;
  v7[3] = &unk_26539F990;
  id v8 = v4;
  id v6 = v4;
  IRDispatchAsyncWithStrongSelf(v5, self, v7);
}

void __38__IRServiceContainer_deleteCandidate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 policyManager];
  [v3 deleteCandidate:*(void *)(a1 + 32)];
}

- (void)addEvent:(id)a3 forCandidate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IRServiceContainer *)self queue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __44__IRServiceContainer_addEvent_forCandidate___block_invoke;
  v11[3] = &unk_26539F9B8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  IRDispatchAsyncWithStrongSelf(v8, self, v11);
}

void __44__IRServiceContainer_addEvent_forCandidate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 policyManager];
  [v3 addEvent:*(void *)(a1 + 32) forCandidate:*(void *)(a1 + 40)];
}

- (id)requestCurrentContextWithBundleID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  __int16 v15 = __Block_byref_object_copy__0;
  id v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  id v5 = [(IRServiceContainer *)self queue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__IRServiceContainer_requestCurrentContextWithBundleID___block_invoke;
  v9[3] = &unk_26539F9E0;
  id v6 = v4;
  id v10 = v6;
  id v11 = &v12;
  IRDispatchAsyncAndWaitWithStrongSelf(v5, self, v9);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __56__IRServiceContainer_requestCurrentContextWithBundleID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  id v5 = *MEMORY[0x263F500A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F500A0], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v11 = 136315650;
    uint64_t v12 = "#service-container, ";
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    _os_log_impl(&dword_25418E000, v5, OS_LOG_TYPE_DEFAULT, "%s[%@], Requesting current context, with bundleID: %@", (uint8_t *)&v11, 0x20u);
  }

  id v7 = [v3 policyManager];
  uint64_t v8 = [v7 requestCurrentContextWithBundleID:*(void *)(a1 + 32)];
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (void)setSpotOnLocationWithParameters:(id)a3 andClientID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(IRServiceContainer *)self queue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __66__IRServiceContainer_setSpotOnLocationWithParameters_andClientID___block_invoke;
  v11[3] = &unk_26539F9B8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  IRDispatchAsyncWithStrongSelf(v8, self, v11);
}

void __66__IRServiceContainer_setSpotOnLocationWithParameters_andClientID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 policyManager];
  [v3 setSpotOnLocationWithParameters:*(void *)(a1 + 32) andClientID:*(void *)(a1 + 40)];
}

- (void)requestUpdatedBundlesWithSignificantInteraction
{
  id v3 = [(IRServiceContainer *)self queue];
  IRDispatchAsyncWithStrongSelf(v3, self, &__block_literal_global_39);
}

void __69__IRServiceContainer_requestUpdatedBundlesWithSignificantInteraction__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 policyManager];
  [v2 requestUpdatedBundlesWithSignificantInteraction];
}

- (void)dbCleanupWithDateIntervalOfMiLoPredictionsToDiscard:(id)a3
{
  id v4 = a3;
  id v5 = [(IRServiceContainer *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __74__IRServiceContainer_dbCleanupWithDateIntervalOfMiLoPredictionsToDiscard___block_invoke;
  v7[3] = &unk_26539F990;
  id v8 = v4;
  id v6 = v4;
  IRDispatchAsyncAndWaitWithStrongSelf(v5, self, v7);
}

void __74__IRServiceContainer_dbCleanupWithDateIntervalOfMiLoPredictionsToDiscard___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263EFF910];
  id v4 = a2;
  id v5 = [v3 date];
  id v6 = [v4 serviceStore];
  int v7 = [v6 cleanupWithDate:v5 dateIntervalOfMiLoPredictionsToDiscard:*(void *)(a1 + 32)];

  [v4 _refreshServiceWithDate:v5];
  id v8 = [v4 policyManager];

  [v8 synchronizeAndFetchFromDBOnDisk];
  id v9 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  id v10 = (void *)*MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
  {
    int v11 = NSNumber;
    id v12 = (void *)MEMORY[0x263EFF910];
    id v13 = v10;
    uint64_t v14 = [v12 date];
    [v14 timeIntervalSinceDate:v5];
    uint64_t v15 = objc_msgSend(v11, "numberWithDouble:");
    uint64_t v16 = (void *)v15;
    uint64_t v17 = @"Fail";
    int v18 = 136315906;
    uint64_t v19 = "#service-container, ";
    __int16 v20 = 2112;
    id v21 = v9;
    if (v7) {
      uint64_t v17 = @"Ok";
    }
    __int16 v22 = 2112;
    uint64_t v23 = v15;
    __int16 v24 = 2112;
    id v25 = v17;
    _os_log_impl(&dword_25418E000, v13, OS_LOG_TYPE_INFO, "%s[%@], Finished DB cleanup in: %@ seconds with status: %@", (uint8_t *)&v18, 0x2Au);
  }
}

- (void)restartLowLatencyMiLo:(BOOL)a3
{
  id v5 = [(IRServiceContainer *)self queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__IRServiceContainer_restartLowLatencyMiLo___block_invoke;
  v6[3] = &__block_descriptor_33_e28_v16__0__IRServiceContainer_8l;
  BOOL v7 = a3;
  IRDispatchAsyncWithStrongSelf(v5, self, v6);
}

void __44__IRServiceContainer_restartLowLatencyMiLo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = [a2 policyManager];
  [v3 restartLowLatencyMiLo:*(unsigned __int8 *)(a1 + 32)];

  id v4 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  id v5 = (void *)*MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
  {
    id v6 = NSNumber;
    uint64_t v7 = *(unsigned __int8 *)(a1 + 32);
    id v8 = v5;
    id v9 = [v6 numberWithBool:v7];
    int v10 = 136315650;
    int v11 = "#service-container, ";
    __int16 v12 = 2112;
    id v13 = v4;
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    _os_log_impl(&dword_25418E000, v8, OS_LOG_TYPE_INFO, "%s[%@], Finished restartLowLatencyMiLo: %@", (uint8_t *)&v10, 0x20u);
  }
}

- (id)getStatistics
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  int v10 = __Block_byref_object_copy__0;
  int v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  id v3 = [(IRServiceContainer *)self queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35__IRServiceContainer_getStatistics__block_invoke;
  v6[3] = &unk_26539FA28;
  void v6[4] = &v7;
  IRDispatchAsyncAndWaitWithStrongSelf(v3, self, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __35__IRServiceContainer_getStatistics__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = [a2 policyManager];
  uint64_t v4 = [v3 getStatistics];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  uint64_t v7 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  id v8 = *MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    int v10 = 136315650;
    int v11 = "#service-container, ";
    __int16 v12 = 2112;
    id v13 = v7;
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    _os_log_impl(&dword_25418E000, v8, OS_LOG_TYPE_INFO, "%s[%@], Getting statistics: %@", (uint8_t *)&v10, 0x20u);
  }
}

- (void)clearStatistics
{
  id v3 = [(IRServiceContainer *)self queue];
  IRDispatchAsyncWithStrongSelf(v3, self, &__block_literal_global_48);
}

void __37__IRServiceContainer_clearStatistics__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  uint64_t v4 = *MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    uint64_t v7 = "#service-container, ";
    __int16 v8 = 2112;
    uint64_t v9 = v3;
    _os_log_impl(&dword_25418E000, v4, OS_LOG_TYPE_INFO, "%s[%@], Clearing statistics", (uint8_t *)&v6, 0x16u);
  }

  uint64_t v5 = [v2 policyManager];
  [v5 clearStatistics];
}

- (void)setServiceIdentifier:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (IRAVOutputDeviceProvider)avOutputDeviceProvider
{
  return self->_avOutputDeviceProvider;
}

- (void)setAvOutputDeviceProvider:(id)a3
{
}

- (IRBiomeProvider)biomeProvider
{
  return self->_biomeProvider;
}

- (void)setBiomeProvider:(id)a3
{
}

- (IRRapportProvider)rapportProvider
{
  return self->_rapportProvider;
}

- (void)setRapportProvider:(id)a3
{
}

- (IRProximityProvider)proximityProvider
{
  return self->_proximityProvider;
}

- (void)setProximityProvider:(id)a3
{
}

- (IRPersistenceManager)persistenceManager
{
  return self->_persistenceManager;
}

- (void)setPersistenceManager:(id)a3
{
}

- (IRDisplayMonitor)displayMonitor
{
  return self->_displayMonitor;
}

- (void)setDisplayMonitor:(id)a3
{
}

- (IRAVOutputContextController)audioAVOutputContextController
{
  return self->_audioAVOutputContextController;
}

- (void)setAudioAVOutputContextController:(id)a3
{
}

- (void)setPolicyManager:(id)a3
{
}

- (void)setServiceStore:(id)a3
{
}

- (IRMiLoProvider)miloProvider
{
  return self->_miloProvider;
}

- (void)setMiloProvider:(id)a3
{
}

- (IRServiceLogPrefix)serviceLogPrefix
{
  return self->_serviceLogPrefix;
}

- (void)setServiceLogPrefix:(id)a3
{
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_serviceLogPrefix, 0);
  objc_storeStrong((id *)&self->_miloProvider, 0);
  objc_storeStrong((id *)&self->_serviceStore, 0);
  objc_storeStrong((id *)&self->_policyManager, 0);
  objc_storeStrong((id *)&self->_audioAVOutputContextController, 0);
  objc_storeStrong((id *)&self->_displayMonitor, 0);
  objc_storeStrong((id *)&self->_persistenceManager, 0);
  objc_storeStrong((id *)&self->_proximityProvider, 0);
  objc_storeStrong((id *)&self->_rapportProvider, 0);
  objc_storeStrong((id *)&self->_biomeProvider, 0);
  objc_storeStrong((id *)&self->_avOutputDeviceProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
}

- (void)policyManager:(id)a3 didSpotOnLocationCompleteForClientIds:(id)a4 withError:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = [(IRServiceContainer *)self queue];
  dispatch_assert_queue_V2(v9);

  id v10 = [(IRServiceContainer *)self delegate];
  [v10 serviceContainer:self didSpotOnLocationCompleteForClientIds:v8 withError:v7];
}

- (void)policyManager:(id)a3 didUpdateBundlesWithSignificantInteractionPattern:(id)a4
{
  id v5 = a4;
  int v6 = [(IRServiceContainer *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = [(IRServiceContainer *)self delegate];
  [v7 serviceContainer:self didUpdateBundlesWithSignificantInteractionPattern:v5];
}

- (void)initWithServiceIdentifier:delegate:avOutputDeviceProvider:biomeProvider:rapportProvider:proximityProvider:persistenceManager:displayMonitor:audioAVOutputContextController:isLowLatencyMiLo:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_25418E000, v0, v1, "#service-container, [ErrorId - Service init error - Service id unavailable] Cant initialize a new service container, service identifier does not exist in DB", v2, v3, v4, v5, v6);
}

- (void)initWithServiceIdentifier:delegate:avOutputDeviceProvider:biomeProvider:rapportProvider:proximityProvider:persistenceManager:displayMonitor:audioAVOutputContextController:isLowLatencyMiLo:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_25418E000, v0, v1, "#service-container, [ErrorId - Service init error - Couldnt inject relationships] Cant initialize a new service container, cant inject relationships", v2, v3, v4, v5, v6);
}

- (void)initWithServiceIdentifier:delegate:avOutputDeviceProvider:biomeProvider:rapportProvider:proximityProvider:persistenceManager:displayMonitor:audioAVOutputContextController:isLowLatencyMiLo:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_25418E000, v0, v1, "#service-container, [ErrorId - Service init error - DB unavailable] Cant initialize a new service container, DB is not available", v2, v3, v4, v5, v6);
}

+ (void)createServiceWithClientIdentifier:serviceIdentifier:parameters:persistenceManager:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_25418E000, v0, v1, "#service-container, [ErrorId - Service save error] Could not save new service to DB", v2, v3, v4, v5, v6);
}

+ (void)createServiceWithClientIdentifier:serviceIdentifier:parameters:persistenceManager:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_25418E000, v0, v1, "#service-container, [ErrorId - DB connect error] Could not connect to DB when creating a service", v2, v3, v4, v5, v6);
}

+ (void)createServiceWithClientIdentifier:serviceIdentifier:parameters:persistenceManager:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_25418E000, v0, v1, "#service-container, [ErrorId - Unsupported service package] Cant create service for not supported service package", v2, v3, v4, v5, v6);
}

+ (void)deleteServiceWithToken:persistenceManager:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_25418E000, v0, v1, "#service-container, [ErrorId - Delete Service error] Could not delete service: %@", v2, v3, v4, v5, v6);
}

+ (void)deleteServiceWithToken:persistenceManager:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_25418E000, v0, v1, "#service-container, [ErrorId - Delete MiLo Service error] Couldnt delete MiLo service for token: %@", v2, v3, v4, v5, v6);
}

+ (void)deleteServiceWithToken:persistenceManager:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_25418E000, v0, v1, "#service-container, [ErrorId - DB connect on delete] [%@]: Could not connect to DB when deleting a service", v2, v3, v4, v5, v6);
}

+ (void)exportDatabaseWithPersistenceManager:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_25418E000, v0, v1, "#service-container, [ErrorId - export database error] failed to export database with error: %@", v2, v3, v4, v5, v6);
}

+ (void)exportDatabaseWithPersistenceManager:(uint64_t)a3 .cold.2(void *a1, void *a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v5 = a1;
  uint8_t v6 = [a2 path];
  OUTLINED_FUNCTION_4();
  uint64_t v8 = a3;
  _os_log_error_impl(&dword_25418E000, v5, OS_LOG_TYPE_ERROR, "#service-container, [ErrorId - export database error] failed to remove existing file: %@ with error: %@", v7, 0x16u);
}

+ (void)exportDatabaseWithPersistenceManager:.cold.3()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_4();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_25418E000, v1, OS_LOG_TYPE_ERROR, "#service-container, [ErrorId - export database error] failed to create directory at %@ with error: %@", v2, 0x16u);
}

+ (void)exportDatabaseWithPersistenceManager:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_25418E000, v0, v1, "#service-container, [ErrorId - export database error] Could not connect to DB when exporting it", v2, v3, v4, v5, v6);
}

+ (void)deleteDatabaseWithPersistenceManager:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_25418E000, v0, v1, "#service-container, [ErrorId - DB delete error] Failed to delete database with error: %@", v2, v3, v4, v5, v6);
}

+ (void)getServiceTokensForClientIdentifier:persistenceManager:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_25418E000, v0, v1, "#service-container, [ErrorId - DB connection on get token for client] Could not connect to DB when getting service tokens for client identifier: %@", v2, v3, v4, v5, v6);
}

+ (void)getServicesWithPersistenceManager:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_25418E000, v0, v1, "#service-container, [ErrorId - DB connection on get token for client] Could not connect to DB when getting services", v2, v3, v4, v5, v6);
}

@end