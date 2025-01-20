@interface BLServiceProxy
- (BLProgressReceiving)progressReceiver;
- (BLServiceProxy)initWithError:(id *)a3;
- (BLServiceProxy)initWithProgressReceiver:(id)a3 error:(id *)a4;
- (BLServiceProxyConnectionMonitoring)connectionMonitor;
- (NSXPCConnection)connection;
- (id)_remoteObjectWithErrorHandler:(id)a3;
- (id)_synchronousRemoteObjectWithErrorHandler:(id)a3;
- (int)notifyToken;
- (int64_t)state;
- (void)_createAndStartConnection;
- (void)cancelAllActiveDownloadsWithReply:(id)a3;
- (void)cancelDownloadWithID:(id)a3 withReply:(id)a4;
- (void)dealloc;
- (void)downloadWithPermlink:(id)a3 title:(id)a4 reply:(id)a5;
- (void)fetchDownloadFromDownloadID:(id)a3 withReply:(id)a4;
- (void)fetchDownloadListWithReply:(id)a3;
- (void)getCrashSimulationOverrideValuesWithReply:(id)a3;
- (void)getValueSimulateDeviceOutOfSpaceWithReply:(id)a3;
- (void)migrationInfoWithStoreID:(int64_t)a3 withReply:(id)a4;
- (void)migrationInfosWithStates:(id)a3 withReply:(id)a4;
- (void)migrationInfosWithStoreIDs:(id)a3 withReply:(id)a4;
- (void)monitorProgressWithReply:(id)a3;
- (void)pauseDownloadWithID:(id)a3 withReply:(id)a4;
- (void)prepareForRemoveAppWithReply:(id)a3;
- (void)processAutomaticDownloadsWithReply:(id)a3;
- (void)purchaseWithRequest:(id)a3 uiHostProxy:(id)a4 reply:(id)a5;
- (void)racGUIDForStoreID:(int64_t)a3 withReply:(id)a4;
- (void)reloadFromServerWithReply:(id)a3;
- (void)removeAllMigrationInfosExcludingStates:(id)a3 withReply:(id)a4;
- (void)removeMigrationInfoForStoreID:(int64_t)a3 withReply:(id)a4;
- (void)removeRacGUIDForStoreID:(int64_t)a3 withReply:(id)a4;
- (void)requestDownloadWithMetadata:(id)a3 isRestore:(BOOL)a4 reply:(id)a5;
- (void)requestDownloadWithParameters:(id)a3 reply:(id)a4;
- (void)requestDownloadsWithManifestRequest:(id)a3 uiHostProxy:(id)a4 reply:(id)a5;
- (void)requestDownloadsWithMetadata:(id)a3 areRestore:(BOOL)a4 reply:(id)a5;
- (void)requestDownloadsWithRestoreContentRequestItems:(id)a3 reply:(id)a4;
- (void)resetAllCrashSimulationOverridesWithReply:(id)a3;
- (void)restartDownloadWithID:(id)a3 withReply:(id)a4;
- (void)resumeDownloadWithID:(id)a3 withReply:(id)a4;
- (void)setAutomaticDownloadEnabled:(BOOL)a3 uiHostProxy:(id)a4 reply:(id)a5;
- (void)setConnection:(id)a3;
- (void)setConnectionMonitor:(id)a3;
- (void)setMigrationState:(int64_t)a3 forStoreIDs:(id)a4 withReply:(id)a5;
- (void)setNotifyToken:(int)a3;
- (void)setRacGUID:(id)a3 forStoreID:(int64_t)a4 withReply:(id)a5;
- (void)setState:(int64_t)a3;
- (void)setValueSimulateCrashAtInstallDuringDecrypt:(BOOL)a3 withReply:(id)a4;
- (void)setValueSimulateCrashAtInstallDuringFinish:(BOOL)a3 withReply:(id)a4;
- (void)setValueSimulateCrashAtInstallDuringUnzip:(BOOL)a3 withReply:(id)a4;
- (void)setValueSimulateCrashAtInstallStart:(BOOL)a3 withReply:(id)a4;
- (void)setValueSimulateDeviceOutOfSpace:(BOOL)a3 withReply:(id)a4;
- (void)shutdown;
@end

@implementation BLServiceProxy

- (void)fetchDownloadListWithReply:(id)a3
{
  id v4 = a3;
  v5 = BLServiceProxyLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21DFE3000, v5, OS_LOG_TYPE_DEBUG, "[BLServiceProxy] fetchDownloadListWithReply", buf, 2u);
  }

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_21DFFADE4;
  v12[3] = &unk_26448B948;
  id v13 = v4;
  id v6 = v4;
  v9 = objc_msgSend__remoteObjectWithErrorHandler_(self, v7, (uint64_t)v12, v8);
  objc_msgSend_fetchDownloadListWithReply_(v9, v10, (uint64_t)v6, v11);
}

- (void)monitorProgressWithReply:(id)a3
{
  id v4 = a3;
  v5 = BLServiceProxyLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_21DFE3000, v5, OS_LOG_TYPE_DEFAULT, "[BLServiceProxy] monitorProgressWithReply", v11, 2u);
  }

  uint64_t v8 = objc_msgSend__remoteObjectWithErrorHandler_(self, v6, (uint64_t)v4, v7);
  objc_msgSend_monitorProgressWithReply_(v8, v9, (uint64_t)v4, v10);
}

- (BLServiceProxy)initWithProgressReceiver:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)BLServiceProxy;
  uint64_t v7 = [(BLServiceProxy *)&v18 init];
  uint64_t v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_progressReceiver, a3);
    v8->_connectionLock._os_unfair_lock_opaque = 0;
    v8->_state = 0;
    objc_msgSend__createAndStartConnection(v8, v9, v10, v11);
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v13 = dispatch_queue_create("BLService Notify Queue", v12);

    objc_initWeak(&location, v8);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = sub_21DFFA6E0;
    v15[3] = &unk_26448B8D0;
    objc_copyWeak(&v16, &location);
    notify_register_dispatch("com.apple.BLService.DownloadQueue.Server.Restarted", &v8->_notifyToken, v13, v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return v8;
}

- (id)_remoteObjectWithErrorHandler:(id)a3
{
  id v4 = a3;
  objc_msgSend__createAndStartConnection(self, v5, v6, v7);
  connection = self->_connection;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_21DFFAB64;
  v14[3] = &unk_26448B948;
  id v15 = v4;
  id v9 = v4;
  v12 = objc_msgSend_remoteObjectProxyWithErrorHandler_(connection, v10, (uint64_t)v14, v11);

  return v12;
}

- (void)_createAndStartConnection
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  p_connectionLock = &self->_connectionLock;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v12 = sub_21DFE5570;
  id v13 = &unk_26448B920;
  v14 = self;
  id v15 = &v16;
  id v4 = v11;
  os_unfair_lock_lock(p_connectionLock);
  ((void (*)(void *))v12)(v4);
  os_unfair_lock_unlock(p_connectionLock);

  if (*((unsigned char *)v17 + 24))
  {
    uint64_t v8 = objc_msgSend_connectionMonitor(self, v5, v6, v7);
    objc_msgSend_reconnectingToServiceForProxy_(v8, v9, (uint64_t)self, v10);
  }
  _Block_object_dispose(&v16, 8);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (int64_t)state
{
  return self->_state;
}

- (BLProgressReceiving)progressReceiver
{
  return self->_progressReceiver;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void)setConnectionMonitor:(id)a3
{
}

- (void)setConnection:(id)a3
{
}

- (BLServiceProxy)initWithError:(id *)a3
{
  return (BLServiceProxy *)objc_msgSend_initWithProgressReceiver_error_(self, a2, 0, (uint64_t)a3);
}

- (void)dealloc
{
  notify_cancel(self->_notifyToken);
  objc_msgSend_shutdown(self, v3, v4, v5);
  v6.receiver = self;
  v6.super_class = (Class)BLServiceProxy;
  [(BLServiceProxy *)&v6 dealloc];
}

- (void)shutdown
{
  p_connectionLock = &self->_connectionLock;
  os_unfair_lock_lock(&self->_connectionLock);
  if (self->_connection)
  {
    uint64_t v4 = BLServiceProxyLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_21DFE3000, v4, OS_LOG_TYPE_INFO, "[BLServiceProxy] Shutting down service proxy.", v9, 2u);
    }

    self->_state = 1;
    objc_msgSend_invalidate(self->_connection, v5, v6, v7);
    connection = self->_connection;
    self->_connection = 0;
  }
  os_unfair_lock_unlock(p_connectionLock);
}

- (id)_synchronousRemoteObjectWithErrorHandler:(id)a3
{
  id v4 = a3;
  objc_msgSend__createAndStartConnection(self, v5, v6, v7);
  connection = self->_connection;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_21DFFAD04;
  v14[3] = &unk_26448B948;
  id v15 = v4;
  id v9 = v4;
  v12 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(connection, v10, (uint64_t)v14, v11);

  return v12;
}

- (void)fetchDownloadFromDownloadID:(id)a3 withReply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = BLServiceProxyLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21DFE3000, v8, OS_LOG_TYPE_DEBUG, "[BLServiceProxy] fetchDownloadFromDownloadID", buf, 2u);
  }

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_21DFFAF60;
  v14[3] = &unk_26448B948;
  id v15 = v6;
  id v9 = v6;
  v12 = objc_msgSend__remoteObjectWithErrorHandler_(self, v10, (uint64_t)v14, v11);
  objc_msgSend_fetchDownloadFromDownloadID_withReply_(v12, v13, (uint64_t)v7, (uint64_t)v9);
}

- (void)pauseDownloadWithID:(id)a3 withReply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = BLServiceProxyLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v13 = 0;
    _os_log_impl(&dword_21DFE3000, v8, OS_LOG_TYPE_DEBUG, "[BLServiceProxy] pauseDownloadWithID", v13, 2u);
  }

  uint64_t v11 = objc_msgSend__remoteObjectWithErrorHandler_(self, v9, (uint64_t)v6, v10);
  objc_msgSend_pauseDownloadWithID_withReply_(v11, v12, (uint64_t)v7, (uint64_t)v6);
}

- (void)resumeDownloadWithID:(id)a3 withReply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = BLServiceProxyLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v13 = 0;
    _os_log_impl(&dword_21DFE3000, v8, OS_LOG_TYPE_DEBUG, "[BLServiceProxy] resumeDownloadWithID", v13, 2u);
  }

  uint64_t v11 = objc_msgSend__remoteObjectWithErrorHandler_(self, v9, (uint64_t)v6, v10);
  objc_msgSend_resumeDownloadWithID_withReply_(v11, v12, (uint64_t)v7, (uint64_t)v6);
}

- (void)restartDownloadWithID:(id)a3 withReply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = BLServiceProxyLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v13 = 0;
    _os_log_impl(&dword_21DFE3000, v8, OS_LOG_TYPE_DEBUG, "[BLServiceProxy] restartDownloadWithID", v13, 2u);
  }

  uint64_t v11 = objc_msgSend__remoteObjectWithErrorHandler_(self, v9, (uint64_t)v6, v10);
  objc_msgSend_restartDownloadWithID_withReply_(v11, v12, (uint64_t)v7, (uint64_t)v6);
}

- (void)cancelDownloadWithID:(id)a3 withReply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = BLServiceProxyLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v13 = 0;
    _os_log_impl(&dword_21DFE3000, v8, OS_LOG_TYPE_DEBUG, "[BLServiceProxy] cancelDownloadWithID", v13, 2u);
  }

  uint64_t v11 = objc_msgSend__remoteObjectWithErrorHandler_(self, v9, (uint64_t)v6, v10);
  objc_msgSend_cancelDownloadWithID_withReply_(v11, v12, (uint64_t)v7, (uint64_t)v6);
}

- (void)cancelAllActiveDownloadsWithReply:(id)a3
{
  id v4 = a3;
  uint64_t v5 = BLServiceProxyLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_21DFE3000, v5, OS_LOG_TYPE_DEBUG, "[BLServiceProxy] cancelAllActiveDownloadsWithReply", v11, 2u);
  }

  uint64_t v8 = objc_msgSend__remoteObjectWithErrorHandler_(self, v6, (uint64_t)v4, v7);
  objc_msgSend_cancelAllActiveDownloadsWithReply_(v8, v9, (uint64_t)v4, v10);
}

- (void)purchaseWithRequest:(id)a3 uiHostProxy:(id)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = BLServiceProxyLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21DFE3000, v11, OS_LOG_TYPE_DEBUG, "[BLServiceProxy] purchaseWithRequest:uiHostProxy:reply:", buf, 2u);
  }

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_21DFFB468;
  v17[3] = &unk_26448B948;
  id v18 = v8;
  id v12 = v8;
  id v15 = objc_msgSend__remoteObjectWithErrorHandler_(self, v13, (uint64_t)v17, v14);
  objc_msgSend_purchaseWithRequest_uiHostProxy_reply_(v15, v16, (uint64_t)v10, (uint64_t)v9, v12);
}

- (void)downloadWithPermlink:(id)a3 title:(id)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = BLServiceProxyLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21DFE3000, v11, OS_LOG_TYPE_DEBUG, "[BLServiceProxy] downloadWithPermlink", buf, 2u);
  }

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_21DFFB604;
  v17[3] = &unk_26448B948;
  id v18 = v8;
  id v12 = v8;
  id v15 = objc_msgSend__remoteObjectWithErrorHandler_(self, v13, (uint64_t)v17, v14);
  objc_msgSend_downloadWithPermlink_title_reply_(v15, v16, (uint64_t)v10, (uint64_t)v9, v12);
}

- (void)requestDownloadWithParameters:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = BLServiceProxyLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21DFE3000, v8, OS_LOG_TYPE_DEBUG, "[BLServiceProxy] requestDownloadWithParameters", buf, 2u);
  }

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_21DFFB780;
  v14[3] = &unk_26448B948;
  id v15 = v6;
  id v9 = v6;
  id v12 = objc_msgSend__remoteObjectWithErrorHandler_(self, v10, (uint64_t)v14, v11);
  objc_msgSend_requestDownloadWithParameters_reply_(v12, v13, (uint64_t)v7, (uint64_t)v9);
}

- (void)requestDownloadWithMetadata:(id)a3 isRestore:(BOOL)a4 reply:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = BLServiceProxyLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21DFE3000, v10, OS_LOG_TYPE_DEBUG, "[BLServiceProxy] requestDownloadWithMetadata:isRestore", buf, 2u);
  }

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_21DFFB90C;
  v16[3] = &unk_26448B948;
  id v17 = v8;
  id v11 = v8;
  uint64_t v14 = objc_msgSend__remoteObjectWithErrorHandler_(self, v12, (uint64_t)v16, v13);
  objc_msgSend_requestDownloadWithMetadata_isRestore_reply_(v14, v15, (uint64_t)v9, v5, v11);
}

- (void)requestDownloadsWithMetadata:(id)a3 areRestore:(BOOL)a4 reply:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = BLServiceProxyLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21DFE3000, v10, OS_LOG_TYPE_DEBUG, "[BLServiceProxy] requestDownloadsWithMetadata:areRestore", buf, 2u);
  }

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_21DFFBA98;
  v16[3] = &unk_26448B948;
  id v17 = v8;
  id v11 = v8;
  uint64_t v14 = objc_msgSend__remoteObjectWithErrorHandler_(self, v12, (uint64_t)v16, v13);
  objc_msgSend_requestDownloadsWithMetadata_areRestore_reply_(v14, v15, (uint64_t)v9, v5, v11);
}

- (void)requestDownloadsWithRestoreContentRequestItems:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = BLServiceProxyLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21DFE3000, v8, OS_LOG_TYPE_DEBUG, "[BLServiceProxy] requestDownloadsWithRestoreContentRequestDictionary", buf, 2u);
  }

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_21DFFBC14;
  v14[3] = &unk_26448B948;
  id v15 = v6;
  id v9 = v6;
  id v12 = objc_msgSend__remoteObjectWithErrorHandler_(self, v10, (uint64_t)v14, v11);
  objc_msgSend_requestDownloadsWithRestoreContentRequestItems_reply_(v12, v13, (uint64_t)v7, (uint64_t)v9);
}

- (void)requestDownloadsWithManifestRequest:(id)a3 uiHostProxy:(id)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = BLServiceProxyLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21DFE3000, v11, OS_LOG_TYPE_DEBUG, "[BLServiceProxy] requestDownloadsWithManifestRequest", buf, 2u);
  }

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_21DFFBDAC;
  v17[3] = &unk_26448B948;
  id v18 = v8;
  id v12 = v8;
  id v15 = objc_msgSend__remoteObjectWithErrorHandler_(self, v13, (uint64_t)v17, v14);
  objc_msgSend_requestDownloadsWithManifestRequest_uiHostProxy_reply_(v15, v16, (uint64_t)v10, (uint64_t)v9, v12);
}

- (void)processAutomaticDownloadsWithReply:(id)a3
{
  id v4 = a3;
  BOOL v5 = BLServiceProxyLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21DFE3000, v5, OS_LOG_TYPE_DEFAULT, "[BLServiceProxy] performAutomaticDownloads", buf, 2u);
  }

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_21DFFBF14;
  v12[3] = &unk_26448B948;
  id v13 = v4;
  id v6 = v4;
  id v9 = objc_msgSend__remoteObjectWithErrorHandler_(self, v7, (uint64_t)v12, v8);
  objc_msgSend_processAutomaticDownloadsWithReply_(v9, v10, (uint64_t)v6, v11);
}

- (void)setAutomaticDownloadEnabled:(BOOL)a3 uiHostProxy:(id)a4 reply:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = BLServiceProxyLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21DFE3000, v10, OS_LOG_TYPE_DEFAULT, "[BLServiceProxy] setAutomaticDownloadEnabled", buf, 2u);
  }

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_21DFFC0A4;
  v16[3] = &unk_26448B948;
  id v17 = v8;
  id v11 = v8;
  uint64_t v14 = objc_msgSend__remoteObjectWithErrorHandler_(self, v12, (uint64_t)v16, v13);
  objc_msgSend_setAutomaticDownloadEnabled_uiHostProxy_reply_(v14, v15, v6, (uint64_t)v9, v11);
}

- (void)reloadFromServerWithReply:(id)a3
{
  id v4 = a3;
  BOOL v5 = BLServiceProxyLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_21DFE3000, v5, OS_LOG_TYPE_DEBUG, "[BLServiceProxy] reloadFromServerWithReply", v11, 2u);
  }

  id v8 = objc_msgSend__remoteObjectWithErrorHandler_(self, v6, (uint64_t)v4, v7);
  objc_msgSend_reloadFromServerWithReply_(v8, v9, (uint64_t)v4, v10);
}

- (void)setRacGUID:(id)a3 forStoreID:(int64_t)a4 withReply:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = BLServiceProxyLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v15 = 0;
    _os_log_impl(&dword_21DFE3000, v10, OS_LOG_TYPE_DEFAULT, "[BLServiceProxy] setRacGUID:forStoreID:", v15, 2u);
  }

  uint64_t v13 = objc_msgSend__synchronousRemoteObjectWithErrorHandler_(self, v11, (uint64_t)v8, v12);
  objc_msgSend_setRacGUID_forStoreID_withReply_(v13, v14, (uint64_t)v9, a4, v8);
}

- (void)racGUIDForStoreID:(int64_t)a3 withReply:(id)a4
{
  id v6 = a4;
  uint64_t v7 = BLServiceProxyLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21DFE3000, v7, OS_LOG_TYPE_DEFAULT, "[BLServiceProxy] racGUIDforStoreID:", buf, 2u);
  }

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_21DFFC374;
  v13[3] = &unk_26448B948;
  id v14 = v6;
  id v8 = v6;
  id v11 = objc_msgSend__synchronousRemoteObjectWithErrorHandler_(self, v9, (uint64_t)v13, v10);
  objc_msgSend_racGUIDForStoreID_withReply_(v11, v12, a3, (uint64_t)v8);
}

- (void)removeRacGUIDForStoreID:(int64_t)a3 withReply:(id)a4
{
  id v6 = a4;
  uint64_t v7 = BLServiceProxyLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_21DFE3000, v7, OS_LOG_TYPE_DEFAULT, "[BLServiceProxy] removeRacGUIDForStoreID:", v12, 2u);
  }

  uint64_t v10 = objc_msgSend__synchronousRemoteObjectWithErrorHandler_(self, v8, (uint64_t)v6, v9);
  objc_msgSend_removeRacGUIDForStoreID_withReply_(v10, v11, a3, (uint64_t)v6);
}

- (void)setMigrationState:(int64_t)a3 forStoreIDs:(id)a4 withReply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = BLServiceProxyLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v15 = 0;
    _os_log_impl(&dword_21DFE3000, v10, OS_LOG_TYPE_DEFAULT, "[BLServiceProxy] setMigrationState:forStoreIDs:", v15, 2u);
  }

  uint64_t v13 = objc_msgSend__synchronousRemoteObjectWithErrorHandler_(self, v11, (uint64_t)v8, v12);
  objc_msgSend_setMigrationState_forStoreIDs_withReply_(v13, v14, a3, (uint64_t)v9, v8);
}

- (void)migrationInfoWithStoreID:(int64_t)a3 withReply:(id)a4
{
  id v6 = a4;
  uint64_t v7 = BLServiceProxyLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21DFE3000, v7, OS_LOG_TYPE_DEFAULT, "[BLServiceProxy] migrationInfoWithStoreID:", buf, 2u);
  }

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_21DFFC650;
  v13[3] = &unk_26448B948;
  id v14 = v6;
  id v8 = v6;
  id v11 = objc_msgSend__synchronousRemoteObjectWithErrorHandler_(self, v9, (uint64_t)v13, v10);
  objc_msgSend_migrationInfoWithStoreID_withReply_(v11, v12, a3, (uint64_t)v8);
}

- (void)migrationInfosWithStoreIDs:(id)a3 withReply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = BLServiceProxyLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21DFE3000, v8, OS_LOG_TYPE_DEFAULT, "[BLServiceProxy] migrationInfosWithStoreIDs:", buf, 2u);
  }

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_21DFFC7CC;
  v14[3] = &unk_26448B948;
  id v15 = v6;
  id v9 = v6;
  uint64_t v12 = objc_msgSend__synchronousRemoteObjectWithErrorHandler_(self, v10, (uint64_t)v14, v11);
  objc_msgSend_migrationInfosWithStoreIDs_withReply_(v12, v13, (uint64_t)v7, (uint64_t)v9);
}

- (void)migrationInfosWithStates:(id)a3 withReply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = BLServiceProxyLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21DFE3000, v8, OS_LOG_TYPE_DEFAULT, "[BLServiceProxy] migrationInfosWithStates:", buf, 2u);
  }

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_21DFFC948;
  v14[3] = &unk_26448B948;
  id v15 = v6;
  id v9 = v6;
  uint64_t v12 = objc_msgSend__synchronousRemoteObjectWithErrorHandler_(self, v10, (uint64_t)v14, v11);
  objc_msgSend_migrationInfosWithStates_withReply_(v12, v13, (uint64_t)v7, (uint64_t)v9);
}

- (void)removeMigrationInfoForStoreID:(int64_t)a3 withReply:(id)a4
{
  id v6 = a4;
  id v7 = BLServiceProxyLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_21DFE3000, v7, OS_LOG_TYPE_DEFAULT, "[BLServiceProxy] removeMigrationInfoForStoreID:", v12, 2u);
  }

  uint64_t v10 = objc_msgSend__synchronousRemoteObjectWithErrorHandler_(self, v8, (uint64_t)v6, v9);
  objc_msgSend_removeMigrationInfoForStoreID_withReply_(v10, v11, a3, (uint64_t)v6);
}

- (void)removeAllMigrationInfosExcludingStates:(id)a3 withReply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = BLServiceProxyLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_21DFE3000, v8, OS_LOG_TYPE_DEFAULT, "[BLServiceProxy] removeAllMigrationInfosExcludingStates:", v13, 2u);
  }

  uint64_t v11 = objc_msgSend__synchronousRemoteObjectWithErrorHandler_(self, v9, (uint64_t)v6, v10);
  objc_msgSend_removeAllMigrationInfosExcludingStates_withReply_(v11, v12, (uint64_t)v7, (uint64_t)v6);
}

- (void)prepareForRemoveAppWithReply:(id)a3
{
  id v4 = a3;
  BOOL v5 = BLServiceProxyLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_21DFE3000, v5, OS_LOG_TYPE_DEBUG, "[BLServiceProxy] prepareForRemoveAppWithReply", v11, 2u);
  }

  id v8 = objc_msgSend__remoteObjectWithErrorHandler_(self, v6, (uint64_t)v4, v7);
  objc_msgSend_prepareForRemoveAppWithReply_(v8, v9, (uint64_t)v4, v10);
}

- (void)setValueSimulateCrashAtInstallStart:(BOOL)a3 withReply:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = BLServiceProxyLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_21DFE3000, v7, OS_LOG_TYPE_DEBUG, "[BLServiceProxy] setValueSimulateCrashAtInstallStart:withReply:", v12, 2u);
  }

  uint64_t v10 = objc_msgSend__remoteObjectWithErrorHandler_(self, v8, (uint64_t)v6, v9);
  objc_msgSend_setValueSimulateCrashAtInstallStart_withReply_(v10, v11, v4, (uint64_t)v6);
}

- (void)setValueSimulateCrashAtInstallDuringDecrypt:(BOOL)a3 withReply:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = BLServiceProxyLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_21DFE3000, v7, OS_LOG_TYPE_DEBUG, "[BLServiceProxy] setValueSimulateCrashAtInstallDuringDecrypt:withReply:", v12, 2u);
  }

  uint64_t v10 = objc_msgSend__remoteObjectWithErrorHandler_(self, v8, (uint64_t)v6, v9);
  objc_msgSend_setValueSimulateCrashAtInstallDuringDecrypt_withReply_(v10, v11, v4, (uint64_t)v6);
}

- (void)setValueSimulateCrashAtInstallDuringUnzip:(BOOL)a3 withReply:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = BLServiceProxyLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_21DFE3000, v7, OS_LOG_TYPE_DEBUG, "[BLServiceProxy] setValueSimulateCrashAtInstallDuringUnzip:withReply:", v12, 2u);
  }

  uint64_t v10 = objc_msgSend__remoteObjectWithErrorHandler_(self, v8, (uint64_t)v6, v9);
  objc_msgSend_setValueSimulateCrashAtInstallDuringUnzip_withReply_(v10, v11, v4, (uint64_t)v6);
}

- (void)setValueSimulateCrashAtInstallDuringFinish:(BOOL)a3 withReply:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = BLServiceProxyLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_21DFE3000, v7, OS_LOG_TYPE_DEBUG, "[BLServiceProxy] setValueSimulateCrashAtInstallDuringFinish:withReply:", v12, 2u);
  }

  uint64_t v10 = objc_msgSend__remoteObjectWithErrorHandler_(self, v8, (uint64_t)v6, v9);
  objc_msgSend_setValueSimulateCrashAtInstallDuringFinish_withReply_(v10, v11, v4, (uint64_t)v6);
}

- (void)getCrashSimulationOverrideValuesWithReply:(id)a3
{
  id v4 = a3;
  BOOL v5 = BLServiceProxyLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21DFE3000, v5, OS_LOG_TYPE_DEBUG, "[BLServiceProxy] getValueSimulateCrashAtInstallDuringFinishWithReply:", buf, 2u);
  }

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_21DFFCF4C;
  v12[3] = &unk_26448B948;
  id v13 = v4;
  id v6 = v4;
  uint64_t v9 = objc_msgSend__remoteObjectWithErrorHandler_(self, v7, (uint64_t)v12, v8);
  objc_msgSend_getCrashSimulationOverrideValuesWithReply_(v9, v10, (uint64_t)v6, v11);
}

- (void)resetAllCrashSimulationOverridesWithReply:(id)a3
{
  id v4 = a3;
  BOOL v5 = BLServiceProxyLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_21DFE3000, v5, OS_LOG_TYPE_DEBUG, "[BLServiceProxy] resetAllCrashSimulationOverridesWithReply:", v11, 2u);
  }

  uint64_t v8 = objc_msgSend__remoteObjectWithErrorHandler_(self, v6, (uint64_t)v4, v7);
  objc_msgSend_resetAllCrashSimulationOverridesWithReply_(v8, v9, (uint64_t)v4, v10);
}

- (void)setValueSimulateDeviceOutOfSpace:(BOOL)a3 withReply:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = BLServiceProxyLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_21DFE3000, v7, OS_LOG_TYPE_DEBUG, "[BLServiceProxy] setValueSimulateDeviceOutOfSpace:", v12, 2u);
  }

  uint64_t v10 = objc_msgSend__remoteObjectWithErrorHandler_(self, v8, (uint64_t)v6, v9);
  objc_msgSend_setValueSimulateDeviceOutOfSpace_withReply_(v10, v11, v4, (uint64_t)v6);
}

- (void)getValueSimulateDeviceOutOfSpaceWithReply:(id)a3
{
  id v4 = a3;
  BOOL v5 = BLServiceProxyLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21DFE3000, v5, OS_LOG_TYPE_DEBUG, "[BLServiceProxy] getValueSimulateDeviceOutOfSpaceWithReply:", buf, 2u);
  }

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_21DFFD208;
  v12[3] = &unk_26448B948;
  id v13 = v4;
  id v6 = v4;
  uint64_t v9 = objc_msgSend__remoteObjectWithErrorHandler_(self, v7, (uint64_t)v12, v8);
  objc_msgSend_getValueSimulateDeviceOutOfSpaceWithReply_(v9, v10, (uint64_t)v6, v11);
}

- (BLServiceProxyConnectionMonitoring)connectionMonitor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connectionMonitor);

  return (BLServiceProxyConnectionMonitoring *)WeakRetained;
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setNotifyToken:(int)a3
{
  self->_notifyToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressReceiver, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_destroyWeak((id *)&self->_connectionMonitor);
}

@end