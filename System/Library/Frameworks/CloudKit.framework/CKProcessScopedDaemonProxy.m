@interface CKProcessScopedDaemonProxy
+ (NSXPCInterface)CKXPCClientToDaemonProcessScopedInterface;
+ (NSXPCInterface)CKXPCDaemonToClientProcessScopedInterface;
- (BOOL)hasValidProcessScopedDaemonProxyCreator;
- (CKProcessScopedDaemonProxy)initWithConnection:(id)a3;
- (CKXPCConnection)connection;
- (CKXPCProcessScopedDaemon)processScopedDaemonProxyCreator;
- (NSObject)connectionInterruptedObserver;
- (id)globalDeviceIdentifierWithError:(id *)a3;
- (unint64_t)maxInlineMergeableDeltaSize;
- (void)_getProcessScopedDaemonProxyCreatorSynchronous:(BOOL)a3 completionHandler:(id)a4;
- (void)_getProcessScopedDaemonProxySynchronous:(BOOL)a3 errorHandler:(id)a4 daemonProxyHandler:(id)a5;
- (void)accountWithID:(id)a3 changedWithChangeType:(int64_t)a4;
- (void)accountsDidGrantAccessToBundleID:(id)a3 containerIdentifiers:(id)a4;
- (void)accountsDidRevokeAccessToBundleID:(id)a3 containerIdentifiers:(id)a4;
- (void)accountsWillDeleteAccount:(id)a3 completionHandler:(id)a4;
- (void)clearPCSCachesForKnownContainersWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)dumpAllClientsStatusReportToFileHandle:(id)a3 completionHandler:(id)a4;
- (void)fetchUsabilityForTestAccountCredentials:(id)a3 completionHandler:(id)a4;
- (void)kill;
- (void)setConnectionInterruptedObserver:(id)a3;
- (void)setHasValidProcessScopedDaemonProxyCreator:(BOOL)a3;
- (void)setProcessScopedDaemonProxyCreator:(id)a3;
- (void)updatePushTokens;
- (void)wipeAllCachesAndDie;
- (void)wipeServerConfigurationsAndDie;
@end

@implementation CKProcessScopedDaemonProxy

- (CKProcessScopedDaemonProxy)initWithConnection:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKProcessScopedDaemonProxy;
  v5 = [(CKProcessScopedDaemonProxy *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_connection, v4);
  }

  return v6;
}

- (void)dealloc
{
  v5 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, v2, v3);
  v9 = objc_msgSend_connectionInterruptedObserver(self, v6, v7, v8);
  objc_msgSend_removeObserver_(v5, v10, (uint64_t)v9, v11);

  v12.receiver = self;
  v12.super_class = (Class)CKProcessScopedDaemonProxy;
  [(CKProcessScopedDaemonProxy *)&v12 dealloc];
}

- (void)accountsDidGrantAccessToBundleID:(id)a3 containerIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _os_activity_create(&dword_18AF10000, "client/accounts-did-grant-access-to-bundle-id", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  objc_super v12 = objc_msgSend_CKDeepCopy(v7, v9, v10, v11);

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_18B048264;
  v19[3] = &unk_1E5461B38;
  id v20 = v6;
  id v21 = v12;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_18B048360;
  v16[3] = &unk_1E5461B60;
  id v13 = v20;
  id v17 = v13;
  id v14 = v21;
  id v18 = v14;
  objc_msgSend__getProcessScopedDaemonProxySynchronous_errorHandler_daemonProxyHandler_(self, v15, 0, (uint64_t)v19, v16);

  os_activity_scope_leave(&state);
}

- (void)accountsDidRevokeAccessToBundleID:(id)a3 containerIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _os_activity_create(&dword_18AF10000, "client/accounts-did-revoke-access-to-bundle-id", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  objc_super v12 = objc_msgSend_CKDeepCopy(v7, v9, v10, v11);

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_18B048510;
  v19[3] = &unk_1E5461B38;
  id v20 = v6;
  id v21 = v12;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_18B04860C;
  v16[3] = &unk_1E5461B60;
  id v13 = v20;
  id v17 = v13;
  id v14 = v21;
  id v18 = v14;
  objc_msgSend__getProcessScopedDaemonProxySynchronous_errorHandler_daemonProxyHandler_(self, v15, 0, (uint64_t)v19, v16);

  os_activity_scope_leave(&state);
}

- (void)accountsWillDeleteAccount:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _os_activity_create(&dword_18AF10000, "client/accounts-will-delete-account", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_18B0487A0;
  v15[3] = &unk_1E5461378;
  id v16 = v6;
  id v17 = v7;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_18B0488A8;
  v12[3] = &unk_1E5461B88;
  id v9 = v16;
  id v13 = v9;
  id v10 = v17;
  id v14 = v10;
  objc_msgSend__getProcessScopedDaemonProxySynchronous_errorHandler_daemonProxyHandler_(self, v11, 0, (uint64_t)v15, v12);

  os_activity_scope_leave(&state);
}

- (void)accountWithID:(id)a3 changedWithChangeType:(int64_t)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = _os_activity_create(&dword_18AF10000, "client/account-with-id-changed-with-change-type", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v8 = (id)ck_log_facility_ck;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = CKStringFromAccountChangeType(a4);
    *(_DWORD *)buf = 138412546;
    id v19 = v6;
    __int16 v20 = 2114;
    id v21 = v9;
    _os_log_impl(&dword_18AF10000, v8, OS_LOG_TYPE_INFO, "Notifying cloudd that account %@ changed with type %{public}@", buf, 0x16u);
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_18B048AF4;
  v15[3] = &unk_1E5460240;
  id v16 = v6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_18B048BE4;
  v12[3] = &unk_1E5461BB0;
  id v10 = v16;
  id v13 = v10;
  int64_t v14 = a4;
  objc_msgSend__getProcessScopedDaemonProxySynchronous_errorHandler_daemonProxyHandler_(self, v11, a4 == 5, (uint64_t)v15, v12);

  os_activity_scope_leave(&state);
}

- (void)fetchUsabilityForTestAccountCredentials:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _os_activity_create(&dword_18AF10000, "client/fetch-usability-for-test-account-credentials", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_18B048D64;
  v15[3] = &unk_1E54610D8;
  id v16 = v7;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_18B048E30;
  v12[3] = &unk_1E5461B88;
  id v9 = v6;
  id v13 = v9;
  id v10 = v16;
  id v14 = v10;
  objc_msgSend__getProcessScopedDaemonProxySynchronous_errorHandler_daemonProxyHandler_(self, v11, 0, (uint64_t)v15, v12);

  os_activity_scope_leave(&state);
}

- (void)wipeAllCachesAndDie
{
  uint64_t v3 = _os_activity_create(&dword_18AF10000, "client/wipe-all-caches-and-die", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  os_activity_scope_enter(v3, &v5);
  objc_msgSend__getProcessScopedDaemonProxySynchronous_errorHandler_daemonProxyHandler_(self, v4, 0, (uint64_t)&unk_1ED7EEF98, &unk_1ED7EF7F8);
  os_activity_scope_leave(&v5);
}

- (void)wipeServerConfigurationsAndDie
{
  uint64_t v3 = _os_activity_create(&dword_18AF10000, "client/wipe-server-configurations-and-die", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  os_activity_scope_enter(v3, &v5);
  objc_msgSend__getProcessScopedDaemonProxySynchronous_errorHandler_daemonProxyHandler_(self, v4, 0, (uint64_t)&unk_1ED7EF8D8, &unk_1ED7EF958);
  os_activity_scope_leave(&v5);
}

- (void)updatePushTokens
{
  uint64_t v3 = _os_activity_create(&dword_18AF10000, "client/update-push-tokens", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  os_activity_scope_enter(v3, &v5);
  objc_msgSend__getProcessScopedDaemonProxySynchronous_errorHandler_daemonProxyHandler_(self, v4, 0, (uint64_t)&unk_1ED7EF9D8, &unk_1ED7EFA58);
  os_activity_scope_leave(&v5);
}

- (void)dumpAllClientsStatusReportToFileHandle:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _os_activity_create(&dword_18AF10000, "client/dump-all-clients-status-report", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_18B049324;
  v12[3] = &unk_1E5461B88;
  id v9 = v6;
  id v13 = v9;
  id v10 = v7;
  id v14 = v10;
  objc_msgSend__getProcessScopedDaemonProxySynchronous_errorHandler_daemonProxyHandler_(self, v11, 0, (uint64_t)v10, v12);

  os_activity_scope_leave(&state);
}

- (void)clearPCSCachesForKnownContainersWithCompletionHandler:(id)a3
{
  id v4 = a3;
  os_activity_scope_state_s v5 = _os_activity_create(&dword_18AF10000, "client/clear-pcs-chaches-for-known-containers", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_18B04947C;
  v10[3] = &unk_1E54610D8;
  id v11 = v4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_18B049494;
  v8[3] = &unk_1E5461BF8;
  id v6 = v11;
  id v9 = v6;
  objc_msgSend__getProcessScopedDaemonProxySynchronous_errorHandler_daemonProxyHandler_(self, v7, 0, (uint64_t)v10, v8);

  os_activity_scope_leave(&state);
}

- (void)kill
{
  objc_msgSend_connection(self, a2, v2, v3);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  pid_t v7 = objc_msgSend_processIdentifier(v10, v4, v5, v6);
  if (v7)
  {
    kill(v7, 9);
    objc_msgSend_invalidate_(v10, v8, 0, v9);
  }
}

- (void)_getProcessScopedDaemonProxySynchronous:(BOOL)a3 errorHandler:(id)a4 daemonProxyHandler:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_18B0495C4;
  v13[3] = &unk_1E5461038;
  BOOL v16 = v6;
  id v14 = v9;
  id v15 = v8;
  id v10 = v8;
  id v11 = v9;
  objc_msgSend__getProcessScopedDaemonProxyCreatorSynchronous_completionHandler_(self, v12, v6, (uint64_t)v13);
}

- (id)globalDeviceIdentifierWithError:(id *)a3
{
  uint64_t v5 = _os_activity_create(&dword_18AF10000, "client/global-device-identifier", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  BOOL v6 = ck_log_facility_distributed_sync;
  if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18AF10000, v6, OS_LOG_TYPE_INFO, "Will fetch global device identifier from daemon", buf, 2u);
  }
  *(void *)buf = 0;
  id v19 = buf;
  uint64_t v20 = 0x3032000000;
  id v21 = sub_18AF13B78;
  uint64_t v22 = sub_18AF13860;
  id v23 = 0;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_18AF13B78;
  BOOL v16 = sub_18AF13860;
  id v17 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_18B049900;
  v11[3] = &unk_1E5461418;
  v11[4] = &v12;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_18B0499FC;
  v10[3] = &unk_1E5461C20;
  void v10[4] = &v12;
  v10[5] = buf;
  objc_msgSend__getProcessScopedDaemonProxySynchronous_errorHandler_daemonProxyHandler_(self, v7, 1, (uint64_t)v11, v10);
  if (a3) {
    *a3 = (id) v13[5];
  }
  id v8 = *((id *)v19 + 5);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(buf, 8);
  os_activity_scope_leave(&state);

  return v8;
}

- (unint64_t)maxInlineMergeableDeltaSize
{
  uint64_t v3 = _os_activity_create(&dword_18AF10000, "client/max-inline-mergeable-delta-size", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  id v4 = self;
  objc_sync_enter(v4);
  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v5, v6, v7);
  if (v8 - *(double *)&qword_1E912A430 > 86400.0)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    id v9 = ck_log_facility_distributed_sync;
    if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl(&dword_18AF10000, v9, OS_LOG_TYPE_INFO, "Will fetch max inline delta size from daemon", v13, 2u);
    }
    objc_msgSend__getProcessScopedDaemonProxySynchronous_errorHandler_daemonProxyHandler_(v4, v10, 1, (uint64_t)&unk_1ED7EFC58, &unk_1ED7EFD18);
  }
  unint64_t v11 = qword_1E9124D48;
  objc_sync_exit(v4);

  os_activity_scope_leave(&state);
  return v11;
}

- (void)_getProcessScopedDaemonProxyCreatorSynchronous:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v6 = (void (**)(id, void *, void))a4;
  id v10 = objc_msgSend_connection(self, v7, v8, v9);
  unint64_t v11 = self;
  objc_sync_enter(v11);
  id v15 = objc_msgSend_connectionInterruptedObserver(v11, v12, v13, v14);

  if (!v15)
  {
    objc_initWeak(&location, v11);
    id v19 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v16, v17, v18);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = sub_18B04A1C4;
    v35[3] = &unk_1E5461060;
    objc_copyWeak(&v36, &location);
    id v21 = objc_msgSend_addObserverForName_object_queue_usingBlock_(v19, v20, @"CKXPCConnectionInterrupted", (uint64_t)v10, 0, v35);
    objc_msgSend_setConnectionInterruptedObserver_(v11, v22, (uint64_t)v21, v23);

    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v11);

  v24 = v11;
  objc_sync_enter(v24);
  if (objc_msgSend_hasValidProcessScopedDaemonProxyCreator(v24, v25, v26, v27))
  {
    v31 = objc_msgSend_processScopedDaemonProxyCreator(v24, v28, v29, v30);
  }
  else
  {
    v31 = 0;
  }
  objc_sync_exit(v24);

  if (v31)
  {
    v6[2](v6, v31, 0);
  }
  else
  {
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = sub_18B04A2B4;
    v33[3] = &unk_1E5461C68;
    v33[4] = v24;
    v34 = v6;
    objc_msgSend_getProcessScopedDaemonProxyCreatorSynchronous_completionHandler_(v10, v32, v4, (uint64_t)v33);
  }
}

+ (NSXPCInterface)CKXPCClientToDaemonProcessScopedInterface
{
  if (qword_1EB279B40 != -1) {
    dispatch_once(&qword_1EB279B40, &unk_1ED7EFFD8);
  }
  uint64_t v2 = (void *)qword_1EB279B38;

  return (NSXPCInterface *)v2;
}

+ (NSXPCInterface)CKXPCDaemonToClientProcessScopedInterface
{
  if (qword_1EB279B50 != -1) {
    dispatch_once(&qword_1EB279B50, &unk_1ED7F05F8);
  }
  uint64_t v2 = (void *)qword_1EB279B48;

  return (NSXPCInterface *)v2;
}

- (CKXPCProcessScopedDaemon)processScopedDaemonProxyCreator
{
  return self->_processScopedDaemonProxyCreator;
}

- (void)setProcessScopedDaemonProxyCreator:(id)a3
{
}

- (BOOL)hasValidProcessScopedDaemonProxyCreator
{
  return self->_hasValidProcessScopedDaemonProxyCreator;
}

- (void)setHasValidProcessScopedDaemonProxyCreator:(BOOL)a3
{
  self->_hasValidProcessScopedDaemonProxyCreator = a3;
}

- (NSObject)connectionInterruptedObserver
{
  return self->_connectionInterruptedObserver;
}

- (void)setConnectionInterruptedObserver:(id)a3
{
}

- (CKXPCConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  return (CKXPCConnection *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connection);
  objc_storeStrong((id *)&self->_connectionInterruptedObserver, 0);

  objc_storeStrong((id *)&self->_processScopedDaemonProxyCreator, 0);
}

@end