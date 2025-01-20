@interface ADServiceConnection
- (ADServiceConnection)initWithIdentifier:(id)a3 path:(id)a4 commandMap:(id)a5 anchorMap:(id)a6 clearingClass:(id)a7 maintenanceClass:(id)a8 instanceContext:(id)a9 queue:(id)a10;
- (ADServiceConnectionDelegate)delegate;
- (NSString)identifier;
- (double)_timeoutForCommand:(id)a3;
- (id)_bundleClassForDomain:(id)a3 commandName:(id)a4;
- (id)_connection;
- (id)_providerService;
- (id)_providerServiceDelegate;
- (id)_providerServiceWithErrorHandler:(id)a3;
- (id)_stopTimersWithContinuation;
- (id)_syncClassForAnchorKey:(id)a3;
- (void)_addWatchdogTimer:(id)a3 forUUID:(id)a4;
- (void)_getCarDNDModeWithReply:(id)a3;
- (void)_getLockStateWithReply:(id)a3;
- (void)_getStarkModeWithReply:(id)a3;
- (void)_getTimeoutSuspendedWithReply:(id)a3;
- (void)_getWatchAuthenticationWithReply:(id)a3;
- (void)_handleCommand:(id)a3 executionInfo:(id)a4 completion:(id)a5;
- (void)_openURL:(id)a3 completion:(id)a4;
- (void)_removeTimerForUUID:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)preheatServiceBundle;
- (void)reloadServiceBundleAtPath:(id)a3;
- (void)runMaintenanceWorkWithCompletion:(id)a3;
- (void)sendBeginSyncWithInfo:(id)a3 chunkHandler:(id)a4 completion:(id)a5;
- (void)sendClearDomainObjects;
- (void)sendClientBoundCommand:(id)a3 domain:(id)a4 executionContext:(id)a5 reply:(id)a6;
- (void)sendFetchSyncSnapshotForInfo:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation ADServiceConnection

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_suspendedWatchdogTimerUUIDs, 0);
  objc_storeStrong((id *)&self->_watchdogTimersByUUID, 0);
  objc_storeStrong((id *)&self->_maintenanceClassName, 0);
  objc_storeStrong((id *)&self->_domainObjectClearingClassName, 0);
  objc_storeStrong((id *)&self->_anchorKeyClassMap, 0);
  objc_storeStrong((id *)&self->_commandMap, 0);
  objc_storeStrong((id *)&self->_stats, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_targetQueue, 0);
}

- (void)setDelegate:(id)a3
{
}

- (ADServiceConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ADServiceConnectionDelegate *)WeakRetained;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)_getTimeoutSuspendedWithReply:(id)a3
{
  id v4 = a3;
  v5 = [(ADServiceConnection *)self _stopTimersWithContinuation];
  v6 = dispatch_get_global_queue(33, 0);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1002605CC;
  v9[3] = &unk_10050C868;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, v9);
}

- (void)_handleCommand:(id)a3 executionInfo:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(ADServiceConnection *)self _stopTimersWithContinuation];
  v12 = +[ADCommandCenter sharedCommandCenter];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100260754;
  v15[3] = &unk_100508368;
  id v16 = v11;
  id v17 = v8;
  id v13 = v8;
  id v14 = v11;
  [v12 handleCommand:v10 withExecutionContextMatchingInfo:v9 completion:v15];
}

- (void)_getWatchAuthenticationWithReply:(id)a3
{
  id v4 = a3;
  v5 = [(ADServiceConnection *)self _stopTimersWithContinuation];
  v6 = dispatch_get_global_queue(33, 0);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1002608B0;
  v9[3] = &unk_10050C868;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, v9);
}

- (void)_getStarkModeWithReply:(id)a3
{
  id v4 = a3;
  v5 = [(ADServiceConnection *)self _stopTimersWithContinuation];
  v6 = dispatch_get_global_queue(33, 0);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1002609F4;
  v9[3] = &unk_10050C868;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, v9);
}

- (void)_getCarDNDModeWithReply:(id)a3
{
  id v4 = a3;
  v5 = [(ADServiceConnection *)self _stopTimersWithContinuation];
  v6 = dispatch_get_global_queue(33, 0);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100260B4C;
  v9[3] = &unk_10050C868;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, v9);
}

- (void)_getLockStateWithReply:(id)a3
{
  id v4 = a3;
  v5 = [(ADServiceConnection *)self _stopTimersWithContinuation];
  v6 = dispatch_get_global_queue(33, 0);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100260C90;
  v9[3] = &unk_10050C868;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, v9);
}

- (void)_openURL:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ADServiceConnection *)self _stopTimersWithContinuation];
  id v9 = +[ADCommandCenter sharedCommandCenter];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100260DFC;
  v12[3] = &unk_100508340;
  id v13 = v8;
  id v14 = v6;
  id v10 = v6;
  id v11 = v8;
  [v9 openURL:v7 completion:v12];
}

- (id)_stopTimersWithContinuation
{
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = sub_100260F84;
  v8[4] = sub_100260F94;
  id v9 = 0;
  targetQueue = self->_targetQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100260F9C;
  block[3] = &unk_10050D5F0;
  block[4] = self;
  block[5] = v8;
  dispatch_async(targetQueue, block);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1002611EC;
  v6[3] = &unk_10050D5F0;
  v6[4] = self;
  v6[5] = v8;
  id v4 = objc_retainBlock(v6);
  _Block_object_dispose(v8, 8);

  return v4;
}

- (void)reloadServiceBundleAtPath:(id)a3
{
  id v4 = a3;
  id v5 = [(ADServiceConnection *)self _providerService];
  [v5 reloadServiceBundleAtPath:v4];
}

- (void)invalidate
{
  v3 = self->_connection;
  connection = self->_connection;
  self->_connection = 0;

  self->_preheated = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100261590;
  v6[3] = &unk_10050E138;
  id v7 = v3;
  id v5 = v3;
  [(NSXPCConnection *)v5 addBarrierBlock:v6];
}

- (void)runMaintenanceWorkWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = v4;
  if (self->_maintenanceClassName && self->_path)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100261684;
    v8[3] = &unk_10050D440;
    id v6 = v4;
    id v9 = v6;
    id v7 = [(ADServiceConnection *)self _providerServiceWithErrorHandler:v8];
    [v7 runMaintenanceWorkForServicePath:self->_path className:self->_maintenanceClassName completion:v6];

    self->_preheated = 1;
  }
  else if (v4)
  {
    v4[2](v4);
  }
}

- (void)preheatServiceBundle
{
  if (!self->_preheated)
  {
    v3 = [(ADServiceConnection *)self _providerService];
    [v3 preheatBundleForServicePath:self->_path];

    self->_preheated = 1;
  }
}

- (void)sendClearDomainObjects
{
  v3 = [(ADServiceConnection *)self _providerService];
  [v3 clearDomainObjectsForServicePath:self->_path className:self->_domainObjectClearingClassName];

  self->_preheated = 1;
}

- (void)sendFetchSyncSnapshotForInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = AFSiriLogContextSync;
    if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[ADServiceConnection sendFetchSyncSnapshotForInfo:completion:]";
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
    }
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100261950;
    v18[3] = &unk_10050DF38;
    v18[4] = self;
    id v9 = v6;
    id v19 = v9;
    id v10 = v7;
    id v20 = v10;
    id v11 = [(ADServiceConnection *)self _providerServiceWithErrorHandler:v18];
    path = self->_path;
    id v13 = [v9 key];
    id v14 = [(ADServiceConnection *)self _syncClassForAnchorKey:v13];
    v15 = [v9 key];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100261A48;
    v16[3] = &unk_100508318;
    id v17 = v10;
    [v11 fetchCurrentSyncSnapshotForServicePath:path className:v14 key:v15 completion:v16];
  }
}

- (void)sendBeginSyncWithInfo:(id)a3 chunkHandler:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v57 = "-[ADServiceConnection sendBeginSyncWithInfo:chunkHandler:completion:]";
    __int16 v58 = 2112;
    id v59 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  v12 = [(ADServiceConnection *)self _providerServiceDelegate];
  id v13 = objc_alloc_init(ADSyncRequest);
  [(ADSyncRequest *)v13 setSyncChunkHandler:v9];
  id v14 = [(ADSyncRequest *)v13 uuid];
  v15 = [(ADServiceConnection *)self delegate];
  syncQueue = self->_syncQueue;
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_100261EAC;
  v50[3] = &unk_10050D3F0;
  id v17 = v8;
  id v51 = v17;
  id v18 = v12;
  id v52 = v18;
  id v19 = v14;
  id v53 = v19;
  id v54 = v15;
  id v20 = v10;
  id v55 = v20;
  id v36 = v15;
  [(ADSyncRequest *)v13 startTimerOnQueue:syncQueue withTimeoutHandler:v50];
  v21 = self->_syncQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100261FB4;
  block[3] = &unk_10050DCB8;
  id v22 = v18;
  id v47 = v22;
  v48 = v13;
  id v23 = v19;
  id v49 = v23;
  v35 = v13;
  dispatch_async(v21, block);
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_100261FC4;
  v42[3] = &unk_1005082F0;
  v42[4] = self;
  id v43 = v22;
  id v44 = v23;
  id v45 = v20;
  id v34 = v20;
  id v24 = v23;
  id v25 = v22;
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1002620A4;
  v39[3] = &unk_10050DF38;
  v39[4] = self;
  id v40 = v17;
  v26 = objc_retainBlock(v42);
  id v41 = v26;
  id v27 = v17;
  v28 = [(ADServiceConnection *)self _providerServiceWithErrorHandler:v39];
  path = self->_path;
  [v27 key];
  v31 = v30 = v9;
  v32 = [(ADServiceConnection *)self _syncClassForAnchorKey:v31];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1002621C4;
  v37[3] = &unk_10050D0D0;
  id v38 = v26;
  v33 = v26;
  [v28 beginSyncForServicePath:path className:v32 requestUUID:v24 info:v27 reply:v37];

  self->_preheated = 1;
}

- (id)_syncClassForAnchorKey:(id)a3
{
  return [(NSDictionary *)self->_anchorKeyClassMap objectForKey:a3];
}

- (void)sendClientBoundCommand:(id)a3 domain:(id)a4 executionContext:(id)a5 reply:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v47 = a5;
  id v13 = a6;
  if (self->_path)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    id v41 = +[NSAssertionHandler currentHandler];
    [v41 handleFailureInMethod:a2 object:self file:@"ADServiceConnection.m" lineNumber:182 description:@"Must have a path"];

    if (v11) {
      goto LABEL_3;
    }
  }
  v42 = +[NSAssertionHandler currentHandler];
  [v42 handleFailureInMethod:a2 object:self file:@"ADServiceConnection.m" lineNumber:183 description:@"Must have a command"];

LABEL_3:
  uint64_t v14 = [v11 encodedClassName];
  v46 = v12;
  v15 = [(ADServiceConnection *)self _bundleClassForDomain:v12 commandName:v14];
  id v16 = objc_alloc_init((Class)NSUUID);
  id v45 = (void *)v14;
  [(ADServiceStatistics *)self->_stats markIncomingCommand:v14];
  [(ADServiceConnection *)self _timeoutForCommand:v11];
  double v18 = v17;
  id v19 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    id v20 = v19;
    v21 = +[NSNumber numberWithDouble:v18];
    *(_DWORD *)buf = 136315650;
    v64 = "-[ADServiceConnection sendClientBoundCommand:domain:executionContext:reply:]";
    __int16 v65 = 2114;
    v66 = v21;
    __int16 v67 = 2114;
    v68 = v15;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s Using timeout of %{public}@ seconds for %{public}@", buf, 0x20u);
  }
  id v22 = objc_alloc((Class)AFWatchdogTimer);
  targetQueue = self->_targetQueue;
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = sub_1002627D8;
  v58[3] = &unk_10050E228;
  id v24 = v15;
  id v59 = v24;
  v60 = self;
  id v25 = v16;
  id v61 = v25;
  id v26 = v13;
  id v62 = v26;
  id v27 = [v22 initWithTimeoutInterval:targetQueue onQueue:v58 timeoutHandler:v18];
  [v27 start];
  v28 = v11;
  LODWORD(v22) = objc_msgSend(v11, "ad_shouldLogToMetrics");
  kdebug_trace();
  if (v22)
  {
    v29 = +[AFAnalytics sharedAnalytics];
    [v29 logEventWithType:4005 context:0];
  }
  kdebug_trace();
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_100262978;
  v53[3] = &unk_1005082A0;
  v53[4] = self;
  id v30 = v25;
  id v54 = v30;
  id v31 = v27;
  id v55 = v31;
  id v56 = v24;
  id v32 = v26;
  id v57 = v32;
  id v33 = v24;
  id v34 = [(ADServiceConnection *)self _providerServiceWithErrorHandler:v53];
  path = self->_path;
  id v44 = v28;
  id v36 = [v28 dictionary];
  v37 = [v47 info];
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_100262A70;
  v48[3] = &unk_1005082C8;
  v48[4] = self;
  id v49 = v30;
  id v50 = v31;
  id v51 = v45;
  id v52 = v32;
  id v43 = v32;
  id v38 = v45;
  id v39 = v31;
  id v40 = v30;
  [v34 doCommandForServicePath:path className:v33 infoDictionary:v36 executionInfo:v37 reply:v48];

  [(ADServiceConnection *)self _addWatchdogTimer:v39 forUUID:v40];
}

- (double)_timeoutForCommand:(id)a3
{
  id v4 = a3;
  char v5 = objc_opt_respondsToSelector();
  if ((v5 & 1) == 0)
  {
    if (objc_opt_respondsToSelector()) {
      goto LABEL_7;
    }
    goto LABEL_12;
  }
  v3 = [v4 hashedRouteUIDs];
  if (![v3 count])
  {
    if (objc_opt_respondsToSelector())
    {
LABEL_7:
      id v6 = [v4 hashedRouteUID];
      id v7 = [v6 length];

      if (v5) {
      if (v7)
      }
        goto LABEL_10;
LABEL_13:
      double v8 = 10.0;
      goto LABEL_14;
    }

LABEL_12:
    goto LABEL_13;
  }

LABEL_10:
  double v8 = 15.0;
LABEL_14:

  return v8;
}

- (void)_removeTimerForUUID:(id)a3
{
  id v4 = a3;
  char v5 = v4;
  if (v4)
  {
    targetQueue = self->_targetQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1002630B8;
    v7[3] = &unk_10050E160;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(targetQueue, v7);
  }
}

- (void)_addWatchdogTimer:(id)a3 forUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    targetQueue = self->_targetQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100263190;
    block[3] = &unk_10050DCB8;
    void block[4] = self;
    id v11 = v6;
    id v12 = v8;
    dispatch_async(targetQueue, block);
  }
}

- (id)_bundleClassForDomain:(id)a3 commandName:(id)a4
{
  commandMap = self->_commandMap;
  id v6 = a4;
  id v7 = [(NSDictionary *)commandMap objectForKey:a3];
  id v8 = [v7 objectForKey:v6];

  return v8;
}

- (id)_providerServiceDelegate
{
  v2 = [(ADServiceConnection *)self _connection];
  v3 = [v2 exportedObject];

  return v3;
}

- (id)_providerServiceWithErrorHandler:(id)a3
{
  id v4 = a3;
  char v5 = [(ADServiceConnection *)self _connection];
  id v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (id)_providerService
{
  v2 = [(ADServiceConnection *)self _connection];
  v3 = [v2 remoteObjectProxy];

  return v3;
}

- (id)_connection
{
  connection = self->_connection;
  if (!connection)
  {
    id v4 = [(AFInstanceContext *)self->_instanceContext createXPCConnectionWithMachServiceName:kAssistantServiceServiceName options:0];
    char v5 = self->_connection;
    self->_connection = v4;

    id v6 = self->_connection;
    id v7 = AFProviderServiceXPCInterface();
    [(NSXPCConnection *)v6 setRemoteObjectInterface:v7];

    id v8 = self->_connection;
    id v9 = AFProviderServiceDelegateXPCInterface();
    [(NSXPCConnection *)v8 setExportedInterface:v9];

    id v10 = self->_connection;
    id v11 = [[ADServiceConnectionProviderServiceDelegate alloc] initWithServiceConnection:self syncQueue:self->_syncQueue];
    [(NSXPCConnection *)v10 setExportedObject:v11];

    id v12 = self->_connection;
    if (AFIsHorseman())
    {
      id v13 = (id)qword_100585E48;
      uint64_t v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v15 = dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_UNSPECIFIED, 0);

      dispatch_queue_t v16 = dispatch_queue_create_with_target_V2(0, v15, v13);
    }
    else
    {
      double v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      id v13 = dispatch_queue_attr_make_with_qos_class(v17, QOS_CLASS_USER_INTERACTIVE, 0);

      dispatch_queue_t v16 = dispatch_queue_create(0, v13);
    }

    [(NSXPCConnection *)v12 _setQueue:v16];
    [(NSXPCConnection *)self->_connection setInterruptionHandler:&stru_100508230];
    [(NSXPCConnection *)self->_connection setInvalidationHandler:&stru_100508250];
    [(NSXPCConnection *)self->_connection resume];
    connection = self->_connection;
  }
  return connection;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ADServiceConnection;
  [(ADServiceConnection *)&v3 dealloc];
}

- (ADServiceConnection)initWithIdentifier:(id)a3 path:(id)a4 commandMap:(id)a5 anchorMap:(id)a6 clearingClass:(id)a7 maintenanceClass:(id)a8 instanceContext:(id)a9 queue:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  v50.receiver = self;
  v50.super_class = (Class)ADServiceConnection;
  id v24 = [(ADServiceConnection *)&v50 init];
  if (v24)
  {
    id v49 = v23;
    id v25 = (NSString *)[v16 copy];
    identifier = v24->_identifier;
    v24->_identifier = v25;

    id v27 = (NSString *)[v17 copy];
    path = v24->_path;
    v24->_path = v27;

    v29 = [[ADServiceStatistics alloc] initWithServiceIdentifier:v16];
    stats = v24->_stats;
    v24->_stats = v29;

    id v31 = (NSDictionary *)[v18 copy];
    commandMap = v24->_commandMap;
    v24->_commandMap = v31;

    id v33 = (NSDictionary *)[v19 copy];
    anchorKeyClassMap = v24->_anchorKeyClassMap;
    v24->_anchorKeyClassMap = v33;

    v35 = (NSString *)[v20 copy];
    domainObjectClearingClassName = v24->_domainObjectClearingClassName;
    v24->_domainObjectClearingClassName = v35;

    v37 = (NSString *)[v21 copy];
    maintenanceClassName = v24->_maintenanceClassName;
    v24->_maintenanceClassName = v37;

    objc_storeStrong((id *)&v24->_targetQueue, a10);
    id v39 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v40 = dispatch_queue_create("ADServiceConnectionSyncQueue", v39);

    syncQueue = v24->_syncQueue;
    v24->_syncQueue = (OS_dispatch_queue *)v40;

    v42 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    watchdogTimersByUUID = v24->_watchdogTimersByUUID;
    v24->_watchdogTimersByUUID = v42;

    id v44 = (NSCountedSet *)objc_alloc_init((Class)NSCountedSet);
    suspendedWatchdogTimerUUIDs = v24->_suspendedWatchdogTimerUUIDs;
    v24->_suspendedWatchdogTimerUUIDs = v44;

    if (v22)
    {
      v46 = (AFInstanceContext *)v22;
    }
    else
    {
      v46 = +[AFInstanceContext defaultContext];
    }
    instanceContext = v24->_instanceContext;
    v24->_instanceContext = v46;

    id v23 = v49;
  }

  return v24;
}

@end