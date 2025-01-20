@interface ASServiceClient
- (ASServiceClient)initWithConnection:(id)a3 servicesMonitor:(id)a4;
- (BOOL)_classInstancesSufficientlyRespondToSyncSelectors:(Class)a3;
- (BOOL)sendSyncChunksWithPreAnchor:(id)a3 postAnchor:(id)a4 updates:(id)a5 deletes:(id)a6 validity:(id)a7 forRequestUUID:(id)a8;
- (id)_providerServiceDelegateWithErrorHandler:(id)a3;
- (id)_synchronousProviderServiceDelegateWithErrorHandler:(id)a3;
- (void)barrierWithCompletion:(id)a3;
- (void)beginSyncForServicePath:(id)a3 className:(id)a4 requestUUID:(id)a5 info:(id)a6 reply:(id)a7;
- (void)clearDomainObjectsForServicePath:(id)a3 className:(id)a4;
- (void)doCommandForServicePath:(id)a3 className:(id)a4 infoDictionary:(id)a5 executionInfo:(id)a6 reply:(id)a7;
- (void)fetchCurrentSyncSnapshotForServicePath:(id)a3 className:(id)a4 key:(id)a5 completion:(id)a6;
- (void)preheatBundleForServicePath:(id)a3;
- (void)reloadServiceBundleAtPath:(id)a3;
- (void)runMaintenanceWorkForServicePath:(id)a3 className:(id)a4 completion:(id)a5;
- (void)serviceMonitorWillCrashAssistantServiceDueToPluginAtPath:(id)a3 reply:(id)a4;
@end

@implementation ASServiceClient

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_servicesMonitor);
  objc_destroyWeak((id *)&self->_connection);
}

- (void)preheatBundleForServicePath:(id)a3
{
  id v3 = a3;
  v4 = AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[ASServiceClient preheatBundleForServicePath:]";
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Preheating bundle at path %@", buf, 0x16u);
  }
  if (sub_100007ADC(v3))
  {
    v5 = sub_100007B58(v3, 33);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100007CB4;
    block[3] = &unk_1000146E8;
    id v8 = v3;
    dispatch_async(v5, block);
  }
  else
  {
    v6 = AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[ASServiceClient preheatBundleForServicePath:]";
      __int16 v11 = 2114;
      id v12 = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s Path is %{public}@ is not allowed", buf, 0x16u);
    }
  }
}

- (void)clearDomainObjectsForServicePath:(id)a3 className:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_INFO))
  {
    unsigned int v19 = 136315394;
    v20 = "-[ASServiceClient clearDomainObjectsForServicePath:className:]";
    __int16 v21 = 2112;
    id v22 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Clearing domain objects for service path %@", (uint8_t *)&v19, 0x16u);
  }
  id v8 = sub_100008534(v6, v5);
  if (!v8)
  {
    v15 = AFSiriLogContextService;
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_ERROR))
    {
      unsigned int v19 = 136315650;
      v20 = "-[ASServiceClient clearDomainObjectsForServicePath:className:]";
      __int16 v21 = 2114;
      id v22 = v6;
      __int16 v23 = 2114;
      id v24 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s No clearing class with name %{public}@ at path %{public}@", (uint8_t *)&v19, 0x20u);
    }
    goto LABEL_15;
  }
  v9 = v8;
  unsigned int v19 = 0;
  v10 = protocol_copyMethodDescriptionList((Protocol *)&OBJC_PROTOCOL___AFDomainObjectClearing, 1, 1, &v19);
  if (!v10)
  {
LABEL_10:
    id v14 = objc_alloc_init(v9);
    [v14 clearAceDomainObjects];

    goto LABEL_15;
  }
  __int16 v11 = v10;
  if (!v19)
  {
LABEL_9:
    free(v11);
    goto LABEL_10;
  }
  unint64_t v12 = 0;
  v13 = v10;
  while (([(objc_class *)v9 instancesRespondToSelector:v13->name] & 1) != 0)
  {
    ++v12;
    ++v13;
    if (v12 >= v19) {
      goto LABEL_9;
    }
  }
  free(v11);
  v16 = (void *)AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_ERROR))
  {
    v17 = v16;
    v18 = NSStringFromClass(v9);
    unsigned int v19 = 136315394;
    v20 = "-[ASServiceClient clearDomainObjectsForServicePath:className:]";
    __int16 v21 = 2114;
    id v22 = v18;
    _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s Class %{public}@ doesn't conform to AFDomainObjectClearing", (uint8_t *)&v19, 0x16u);
  }
LABEL_15:
}

- (BOOL)_classInstancesSufficientlyRespondToSyncSelectors:(Class)a3
{
  if (([(objc_class *)a3 instancesRespondToSelector:"beginSyncWithAnchor:validity:count:forKey:beginInfo:"] & 1) != 0|| ([(objc_class *)a3 instancesRespondToSelector:"beginSyncWithAnchor:validity:forKey:beginInfo:"] & 1) != 0|| ([(objc_class *)a3 instancesRespondToSelector:"beginSyncWithAnchor:validity:count:forKey:beginInfo:configuration:"] & 1) != 0|| (unsigned int v4 = [(objc_class *)a3 instancesRespondToSelector:"beginSyncWithInfo:configuration:"]) != 0)
  {
    LOBYTE(v4) = [(objc_class *)a3 instancesRespondToSelector:"getChangeAfterAnchor:changeInfo:"];
  }
  return v4;
}

- (void)fetchCurrentSyncSnapshotForServicePath:(id)a3 className:(id)a4 key:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    id v14 = v13;
    v15 = AFSiriLogContextSync;
    if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "-[ASServiceClient fetchCurrentSyncSnapshotForServicePath:className:key:completion:]";
      __int16 v29 = 2112;
      id v30 = v10;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s Fetching current sync for path %@", buf, 0x16u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_servicesMonitor);
    v17 = [WeakRetained startWatchdogForPluginAtPath:v10 syncClassName:v11 syncSnapshotCompletion:v14];
    v18 = v17;
    if (!v17) {
      v17 = v14;
    }
    id v19 = objc_retainBlock(v17);

    v20 = sub_100007B58(v10, 17);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100008DF0;
    block[3] = &unk_100014698;
    void block[4] = self;
    id v23 = v11;
    id v24 = v10;
    id v25 = v12;
    id v26 = v19;
    id v21 = v19;
    dispatch_async(v20, block);
  }
}

- (void)reloadServiceBundleAtPath:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    id v8 = "-[ASServiceClient reloadServiceBundleAtPath:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v7, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_servicesMonitor);
  [WeakRetained reloadServiceBundleAtPath:v4];
}

- (void)runMaintenanceWorkForServicePath:(id)a3 className:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v25 = "-[ASServiceClient runMaintenanceWorkForServicePath:className:completion:]";
    __int16 v26 = 2112;
    id v27 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  if (qword_10001AA90 != -1) {
    dispatch_once(&qword_10001AA90, &stru_100014620);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_servicesMonitor);
  id v13 = [WeakRetained startWatchdogForPluginAtPath:v8 syncClassName:v9 completion:v10];
  id v14 = v13;
  if (!v13) {
    id v13 = v10;
  }
  id v15 = objc_retainBlock(v13);

  v16 = qword_10001AA88;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000926C;
  block[3] = &unk_100014670;
  id v21 = v9;
  id v22 = v8;
  id v23 = v15;
  id v17 = v15;
  id v18 = v8;
  id v19 = v9;
  dispatch_async(v16, block);
}

- (void)beginSyncForServicePath:(id)a3 className:(id)a4 requestUUID:(id)a5 info:(id)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v35 = "-[ASServiceClient beginSyncForServicePath:className:requestUUID:info:reply:]";
    __int16 v36 = 2112;
    id v37 = v12;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s Beginning sync for path %@", buf, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_servicesMonitor);
  id v19 = [WeakRetained startWatchdogForPluginAtPath:v12 syncClassName:v13 completion:v16];
  v20 = v19;
  if (!v19) {
    id v19 = v16;
  }
  id v21 = objc_retainBlock(v19);

  id v22 = sub_100007B58(v12, 17);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100009628;
  v28[3] = &unk_1000145E0;
  v28[4] = self;
  id v29 = v13;
  id v30 = v12;
  id v31 = v15;
  id v32 = v14;
  id v33 = v21;
  id v23 = v21;
  id v24 = v14;
  id v25 = v15;
  id v26 = v12;
  id v27 = v13;
  dispatch_async(v22, v28);
}

- (void)doCommandForServicePath:(id)a3 className:(id)a4 infoDictionary:(id)a5 executionInfo:(id)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = +[AFAnalytics sharedAnalytics];
  [v17 logEventWithType:4004 context:0];

  kdebug_trace();
  id v18 = AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    v41 = "-[ASServiceClient doCommandForServicePath:className:infoDictionary:executionInfo:reply:]";
    __int16 v42 = 2112;
    id v43 = v14;
    __int16 v44 = 2112;
    id v45 = v13;
    __int16 v46 = 2112;
    id v47 = v12;
    __int16 v48 = 2112;
    id v49 = v15;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s Connection got message %@ for command %@. (bundle = %@, executionInfo = %@)", buf, 0x34u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_servicesMonitor);
  v20 = [WeakRetained keepAliveWithReplyHandler:v16];
  id v21 = v20;
  if (!v20) {
    v20 = v16;
  }
  id v22 = objc_retainBlock(v20);

  id v23 = sub_100007B58(v12, 33);
  id v30 = _NSConcreteStackBlock;
  uint64_t v31 = 3221225472;
  id v32 = sub_100009A88;
  id v33 = &unk_1000145E0;
  id v34 = v13;
  id v35 = v12;
  id v36 = v14;
  id v37 = v15;
  v38 = self;
  id v39 = v22;
  id v24 = v22;
  id v25 = v15;
  id v26 = v14;
  id v27 = v12;
  id v28 = v13;
  dispatch_async(v23, &v30);

  kdebug_trace();
  id v29 = +[AFAnalytics sharedAnalytics];
  [v29 logEventWithType:4006 context:0];
}

- (void)barrierWithCompletion:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000CA6C;
  v7[3] = &unk_100014590;
  id v8 = v4;
  id v6 = v4;
  [WeakRetained addBarrierBlock:v7];
}

- (id)_synchronousProviderServiceDelegateWithErrorHandler:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  if (WeakRetained)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000CC20;
    v10[3] = &unk_100014568;
    id v11 = v4;
    id v6 = [WeakRetained synchronousRemoteObjectProxyWithErrorHandler:v10];
    int v7 = v11;
LABEL_6:

    goto LABEL_7;
  }
  id v8 = AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    id v13 = "-[ASServiceClient _synchronousProviderServiceDelegateWithErrorHandler:]";
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Connection to assistantd already dropped", buf, 0xCu);
    if (v4) {
      goto LABEL_5;
    }
  }
  else if (v4)
  {
LABEL_5:
    int v7 = +[AFError errorWithCode:23 description:@"Connection to assistantd already dropped."];
    (*((void (**)(id, void *))v4 + 2))(v4, v7);
    id v6 = 0;
    goto LABEL_6;
  }
  id v6 = 0;
LABEL_7:

  return v6;
}

- (id)_providerServiceDelegateWithErrorHandler:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  if (WeakRetained)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000CEA4;
    v10[3] = &unk_100014568;
    id v11 = v4;
    id v6 = [WeakRetained remoteObjectProxyWithErrorHandler:v10];
    int v7 = v11;
LABEL_6:

    goto LABEL_7;
  }
  id v8 = AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    id v13 = "-[ASServiceClient _providerServiceDelegateWithErrorHandler:]";
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Connection to assistantd already dropped", buf, 0xCu);
    if (v4) {
      goto LABEL_5;
    }
  }
  else if (v4)
  {
LABEL_5:
    int v7 = +[AFError errorWithCode:23 description:@"Connection to assistantd already dropped."];
    (*((void (**)(id, void *))v4 + 2))(v4, v7);
    id v6 = 0;
    goto LABEL_6;
  }
  id v6 = 0;
LABEL_7:

  return v6;
}

- (ASServiceClient)initWithConnection:(id)a3 servicesMonitor:(id)a4
{
  objc_initWeak(&location, a3);
  objc_initWeak(&v12, a4);
  v11.receiver = self;
  v11.super_class = (Class)ASServiceClient;
  id v6 = [(ASServiceClient *)&v11 init];
  if (v6)
  {
    id v7 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v6->_connection, v7);

    id v8 = objc_loadWeakRetained(&v12);
    objc_storeWeak((id *)&v6->_servicesMonitor, v8);

    id WeakRetained = objc_loadWeakRetained((id *)&v6->_servicesMonitor);
    [WeakRetained setDelegate:v6];
  }
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v6;
}

- (BOOL)sendSyncChunksWithPreAnchor:(id)a3 postAnchor:(id)a4 updates:(id)a5 deletes:(id)a6 validity:(id)a7 forRequestUUID:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10000D22C;
  v23[3] = &unk_1000148B0;
  v23[4] = &v24;
  v20 = [(ASServiceClient *)self _synchronousProviderServiceDelegateWithErrorHandler:v23];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10000D240;
  v22[3] = &unk_100014750;
  v22[4] = &v24;
  [v20 syncChunksWithPreAnchor:v14 postAnchor:v15 updates:v16 deletes:v17 validity:v18 forRequestUUID:v19 reply:v22];

  LOBYTE(v20) = *((unsigned char *)v25 + 24);
  _Block_object_dispose(&v24, 8);

  return (char)v20;
}

- (void)serviceMonitorWillCrashAssistantServiceDueToPluginAtPath:(id)a3 reply:(id)a4
{
  id v8 = a4;
  id v6 = a3;
  id v7 = [(ASServiceClient *)self _providerServiceDelegateWithErrorHandler:&stru_1000148D0];
  [v7 assistantServiceWillCrashForStuckSyncPluginAtPath:v6];

  [(ASServiceClient *)self barrierWithCompletion:v8];
}

@end