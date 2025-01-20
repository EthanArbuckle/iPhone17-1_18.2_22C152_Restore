@interface CKDiscretionaryClientConnection
- (BOOL)isSpringBoardApp;
- (BOOL)requiresPastBuddy;
- (CKDiscretionaryClientConnection)initWithDaemon:(id)a3 connection:(id)a4;
- (CKDiscretionaryClientConnection)initWithDaemon:(id)a3 group:(id)a4 bundleID:(id)a5 isSpringBoardApp:(BOOL)a6 requiresPastBuddy:(BOOL)a7 scheduleSendBarrierBlock:(id)a8;
- (CKDiscretionaryDaemon)daemon;
- (NSMutableDictionary)tasksByOperationID;
- (NSString)bundleID;
- (NSString)group;
- (OS_dispatch_queue)serialQueue;
- (id)scheduleSendBarrierBlock;
- (void)cleanup;
- (void)finishOperationID:(id)a3;
- (void)handleCompletedTask:(id)a3 operationID:(id)a4;
- (void)queueOperationID:(id)a3 options:(id)a4 clientOperationCallbackProxyEndpoint:(id)a5 withBlock:(id)a6;
- (void)setBundleID:(id)a3;
- (void)setDaemon:(id)a3;
- (void)setGroup:(id)a3;
- (void)setIsSpringBoardApp:(BOOL)a3;
- (void)setRequiresPastBuddy:(BOOL)a3;
- (void)setScheduleSendBarrierBlock:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setTasksByOperationID:(id)a3;
@end

@implementation CKDiscretionaryClientConnection

- (CKDiscretionaryClientConnection)initWithDaemon:(id)a3 group:(id)a4 bundleID:(id)a5 isSpringBoardApp:(BOOL)a6 requiresPastBuddy:(BOOL)a7 scheduleSendBarrierBlock:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  v33.receiver = self;
  v33.super_class = (Class)CKDiscretionaryClientConnection;
  v18 = [(CKDiscretionaryClientConnection *)&v33 init];
  v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_daemon, v14);
    v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    [v14 serialQueue];
    id obj = a4;
    id v21 = v16;
    id v22 = v15;
    v24 = BOOL v23 = a7;
    dispatch_queue_t v25 = dispatch_queue_create_with_target_V2("com.apple.ckdiscretionaryd.connection", v20, v24);
    serialQueue = v19->_serialQueue;
    v19->_serialQueue = (OS_dispatch_queue *)v25;

    uint64_t v27 = +[NSMutableDictionary dictionary];
    tasksByOperationID = v19->_tasksByOperationID;
    v19->_tasksByOperationID = (NSMutableDictionary *)v27;

    objc_storeStrong((id *)&v19->_bundleID, a5);
    v19->_isSpringBoardApp = a6;
    v19->_requiresPastBuddy = v23;
    id v15 = v22;
    id v16 = v21;
    id v29 = objc_retainBlock(v17);
    id scheduleSendBarrierBlock = v19->_scheduleSendBarrierBlock;
    v19->_id scheduleSendBarrierBlock = v29;

    objc_storeStrong((id *)&v19->_group, obj);
  }

  return v19;
}

- (CKDiscretionaryClientConnection)initWithDaemon:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 _xpcConnection];
  v9 = (void *)xpc_connection_copy_bundle_id();

  if (v9)
  {
    v10 = +[NSString stringWithUTF8String:v9];
    free(v9);
  }
  else
  {
    v10 = 0;
  }
  v11 = [v7 _xpcConnection];
  v12 = v10;
  if ((xpc_connection_is_extension() & (v10 != 0)) != 1) {
    goto LABEL_21;
  }
  id v13 = v10;
  if (ck_log_initialization_predicate != -1) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  id v14 = ck_log_facility_ckdd;
  if (os_log_type_enabled(ck_log_facility_ckdd, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Client is a PlugIn with bundle identifier %{public}@", buf, 0xCu);
  }
  id v29 = 0;
  id v15 = [objc_alloc((Class)LSApplicationExtensionRecord) initWithBundleIdentifier:v13 error:&v29];
  id v16 = v29;
  if (v16)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    id v17 = ck_log_facility_ck;
    v12 = v13;
    if (!os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v13;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v16;
    _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to initialize LSApplicationExtensionRecord with bundle id %@: %@", buf, 0x16u);
    v12 = v13;
  }
  else
  {
    v12 = v13;
    if (v15)
    {
      v18 = [v15 containingBundleRecord];
      v12 = [v18 bundleIdentifier];
    }
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
LABEL_18:
  v19 = ck_log_facility_ckdd;
  if (os_log_type_enabled(ck_log_facility_ckdd, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = v12;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Containing app for PlugIn is %{public}@", buf, 0xCu);
  }

LABEL_21:
  v20 = [v7 valueForEntitlement:kCKAllowAccessDuringBuddyEntitlementKey];
  if (v20 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v21 = [v20 BOOLValue] ^ 1;
    if (v12) {
      goto LABEL_29;
    }
  }
  else
  {
    uint64_t v21 = 1;
    if (v12) {
      goto LABEL_29;
    }
  }
  memset(buf, 0, 32);
  if (v7) {
    [v7 auditToken];
  }
  uint64_t v28 = 0;
  long long v26 = *(_OWORD *)buf;
  long long v27 = *(_OWORD *)&buf[16];
  CPCopyBundleIdentifierAndTeamFromAuditToken();
  v12 = 0;
LABEL_29:
  objc_initWeak((id *)buf, v7);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100008084;
  v24[3] = &unk_100010698;
  objc_copyWeak(&v25, (id *)buf);
  id v22 = [(CKDiscretionaryClientConnection *)self initWithDaemon:v6 group:@"com.apple.ckdiscretionaryd" bundleID:v12 isSpringBoardApp:v10 != 0 requiresPastBuddy:v21 scheduleSendBarrierBlock:v24];
  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);

  return v22;
}

- (void)queueOperationID:(id)a3 options:(id)a4 clientOperationCallbackProxyEndpoint:(id)a5 withBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  id v14 = [objc_alloc((Class)CKDOperationCallbackProxy) initWithEndpoint:v13];

  [v14 activate];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1000083BC;
  v33[3] = &unk_1000106C0;
  id v15 = v14;
  id v34 = v15;
  id v16 = v12;
  id v35 = v16;
  id v17 = objc_retainBlock(v33);
  if (ck_log_initialization_predicate != -1) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v18 = (void *)ck_log_facility_ckdd;
  if (os_log_type_enabled(ck_log_facility_ckdd, OS_LOG_TYPE_INFO))
  {
    v19 = v18;
    v20 = [(CKDiscretionaryClientConnection *)self bundleID];
    *(_DWORD *)buf = 138543874;
    id v37 = v10;
    __int16 v38 = 2112;
    v39 = v20;
    __int16 v40 = 2048;
    v41 = self;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%{public}@ queued for %@ on connection %p", buf, 0x20u);
  }
  objc_initWeak((id *)buf, self);
  serialQueue = self->_serialQueue;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100008418;
  v26[3] = &unk_100010738;
  objc_copyWeak(&v32, (id *)buf);
  id v30 = v15;
  id v31 = v17;
  id v27 = v10;
  uint64_t v28 = self;
  id v29 = v11;
  id v22 = v15;
  id v23 = v11;
  id v24 = v10;
  id v25 = v17;
  dispatch_async(serialQueue, v26);

  objc_destroyWeak(&v32);
  objc_destroyWeak((id *)buf);
}

- (void)finishOperationID:(id)a3
{
  id v4 = a3;
  if (ck_log_initialization_predicate != -1) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v5 = ck_log_facility_ckdd;
  if (os_log_type_enabled(ck_log_facility_ckdd, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@ finishing", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008D6C;
  block[3] = &unk_100010760;
  objc_copyWeak(&v11, (id *)buf);
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_async(serialQueue, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

- (void)cleanup
{
  if (ck_log_initialization_predicate != -1) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v3 = (void *)ck_log_facility_ckdd;
  if (os_log_type_enabled(ck_log_facility_ckdd, OS_LOG_TYPE_INFO))
  {
    id v4 = v3;
    v5 = [(CKDiscretionaryClientConnection *)self bundleID];
    *(_DWORD *)buf = 138543618;
    id v10 = v5;
    __int16 v11 = 2048;
    id v12 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "cleanup for %{public}@ on connection %p", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000090B0;
  v7[3] = &unk_100010788;
  objc_copyWeak(&v8, (id *)buf);
  v7[4] = self;
  dispatch_async(serialQueue, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

- (void)handleCompletedTask:(id)a3 operationID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = dispatch_group_create();
  id v9 = [v6 callbackProxy];
  if (v9)
  {
    dispatch_group_enter(v8);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10000944C;
    v20[3] = &unk_1000105C0;
    uint64_t v21 = v8;
    [v9 addBarrierBlock:v20];
  }
  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100009454;
  v14[3] = &unk_1000107B0;
  id v15 = v6;
  id v16 = v9;
  id v11 = v9;
  id v12 = v6;
  objc_copyWeak(&v18, &location);
  id v17 = v7;
  id v13 = v7;
  dispatch_group_notify(v8, serialQueue, v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (BOOL)isSpringBoardApp
{
  return self->_isSpringBoardApp;
}

- (void)setIsSpringBoardApp:(BOOL)a3
{
  self->_isSpringBoardApp = a3;
}

- (BOOL)requiresPastBuddy
{
  return self->_requiresPastBuddy;
}

- (void)setRequiresPastBuddy:(BOOL)a3
{
  self->_requiresPastBuddy = a3;
}

- (CKDiscretionaryDaemon)daemon
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  return (CKDiscretionaryDaemon *)WeakRetained;
}

- (void)setDaemon:(id)a3
{
}

- (NSMutableDictionary)tasksByOperationID
{
  return self->_tasksByOperationID;
}

- (void)setTasksByOperationID:(id)a3
{
}

- (NSString)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
}

- (id)scheduleSendBarrierBlock
{
  return self->_scheduleSendBarrierBlock;
}

- (void)setScheduleSendBarrierBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_scheduleSendBarrierBlock, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_tasksByOperationID, 0);
  objc_destroyWeak((id *)&self->_daemon);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end