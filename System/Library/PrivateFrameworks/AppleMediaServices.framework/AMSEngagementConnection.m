@interface AMSEngagementConnection
- (AMSEngagementConnection)initWithNotificationCenter:(id)a3;
- (NSNotificationCenter)notificationCenter;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)queue;
- (id)_makeExportedClientConnectionInterface;
- (id)_makeRemoteConnectionInterface;
- (id)_newRemoteConnection;
- (id)errorHandler;
- (id)proxy;
- (void)_removeRemoteConnection;
- (void)beginObservingMessages;
- (void)contentInfoForApp:(id)a3 cacheKey:(id)a4 version:(id)a5 reply:(id)a6;
- (void)dealloc;
- (void)enqueueWithRequest:(id)a3 completion:(id)a4;
- (void)fetchMetricsIdentifiers;
- (void)handlePushedEvent:(id)a3;
- (void)manualSyncMetricsIdentifiers;
- (void)notifyBlockedMessages:(id)a3;
- (void)setConnection:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setNotificationCenter:(id)a3;
- (void)syncMetricsIdentifiers;
- (void)syncWithRequest:(id)a3 completion:(id)a4;
- (void)treatmentStoreServiceWithReply:(id)a3;
- (void)treatmentsDidSyncronize;
@end

@implementation AMSEngagementConnection

- (void)beginObservingMessages
{
  id v2 = [(AMSEngagementConnection *)self proxy];
  [v2 beginObservingMessages];
}

- (void)enqueueWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AMSEngagementConnection *)self proxy];
  [v8 enqueueWithRequest:v7 completion:v6];
}

- (void)treatmentStoreServiceWithReply:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSEngagementConnection *)self proxy];
  [v5 treatmentStoreServiceWithReply:v4];
}

- (id)proxy
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = [(AMSEngagementConnection *)v2 connection];
  if (!v3)
  {
    id v3 = [(AMSEngagementConnection *)v2 _newRemoteConnection];
    [(AMSEngagementConnection *)v2 setConnection:v3];
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __32__AMSEngagementConnection_proxy__block_invoke;
  v6[3] = &unk_1E559F028;
  v6[4] = v2;
  id v4 = [v3 remoteObjectProxyWithErrorHandler:v6];

  objc_sync_exit(v2);
  return v4;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void)setErrorHandler:(id)a3
{
}

- (AMSEngagementConnection)initWithNotificationCenter:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSEngagementConnection;
  id v6 = [(AMSEngagementConnection *)&v12 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_notificationCenter, a3);
    id v8 = dispatch_get_global_queue(0, 0);
    dispatch_queue_t v9 = dispatch_queue_create_with_target_V2("com.apple.AppleMediaServices.engagement", 0, v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;
  }
  return v7;
}

- (id)_makeRemoteConnectionInterface
{
  id v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDD1B4F0];
  id v3 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  id v6 = objc_msgSend(v3, "initWithObjects:", v4, v5, objc_opt_class(), 0);
  [v2 setClasses:v6 forSelector:sel_contentInfoForApp_cacheKey_version_reply_ argumentIndex:0 ofReply:1];
  id v7 = +[AMSEngagementEnqueueResult archiveClasses];
  [v2 setClasses:v7 forSelector:sel_enqueueWithRequest_completion_ argumentIndex:0 ofReply:1];

  id v8 = +[AMSEngagementSyncResult archiveClasses];
  [v2 setClasses:v8 forSelector:sel_syncWithRequest_completion_ argumentIndex:0 ofReply:1];

  dispatch_queue_t v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDD515A8];
  id v10 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  v14 = objc_msgSend(v10, "initWithObjects:", v11, v12, v13, objc_opt_class(), 0);
  [v9 setClasses:v14 forSelector:sel_treatmentsForAreas_cachePolicy_startDate_endDate_completion_ argumentIndex:0 ofReply:1];
  id v15 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  v18 = objc_msgSend(v15, "initWithObjects:", v16, v17, objc_opt_class(), 0);
  [v9 setClasses:v18 forSelector:sel_areasWithIDs_cachePolicy_completion_ argumentIndex:0 ofReply:1];
  [v2 setInterface:v9 forSelector:sel_treatmentStoreServiceWithReply_ argumentIndex:0 ofReply:1];

  return v2;
}

- (id)_newRemoteConnection
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = +[AMSLogConfig sharedEngagementConfig];
  if (!v3)
  {
    id v3 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = objc_opt_class();
    id v6 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v20 = v5;
    __int16 v21 = 2114;
    v22 = v6;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Creating new connection.", buf, 0x16u);
  }
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.xpc.amsengagementd" options:0];
  id v8 = [(AMSEngagementConnection *)self queue];
  [v7 _setQueue:v8];

  dispatch_queue_t v9 = [(AMSEngagementConnection *)self _makeRemoteConnectionInterface];
  [v7 setRemoteObjectInterface:v9];

  id v10 = [(AMSEngagementConnection *)self _makeExportedClientConnectionInterface];
  [v7 setExportedInterface:v10];

  [v7 setExportedObject:self];
  objc_initWeak((id *)buf, self);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __47__AMSEngagementConnection__newRemoteConnection__block_invoke;
  v17[3] = &unk_1E559F890;
  objc_copyWeak(&v18, (id *)buf);
  [v7 setInvalidationHandler:v17];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __47__AMSEngagementConnection__newRemoteConnection__block_invoke_2;
  id v15 = &unk_1E559F890;
  objc_copyWeak(&v16, (id *)buf);
  [v7 setInterruptionHandler:&v12];
  objc_msgSend(v7, "resume", v12, v13, v14, v15);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
  return v7;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)_makeExportedClientConnectionInterface
{
  id v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDD1B3D0];
  id v3 = +[AMSEngagementPushEvent archiveClasses];
  [v2 setClasses:v3 forSelector:sel_handlePushedEvent_ argumentIndex:0 ofReply:0];

  return v2;
}

- (void)syncMetricsIdentifiers
{
  id v2 = [(AMSEngagementConnection *)self proxy];
  [v2 syncMetricsIdentifiers];
}

void __32__AMSEngagementConnection_proxy__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = +[AMSLogConfig sharedEngagementConfig];
  if (!v3)
  {
    id v3 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = objc_opt_class();
    id v6 = AMSLogKey();
    int v7 = 138543874;
    uint64_t v8 = v5;
    __int16 v9 = 2114;
    id v10 = v6;
    __int16 v11 = 2114;
    id v12 = v2;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to retrieve remote object. %{public}@", (uint8_t *)&v7, 0x20u);
  }
}

- (void)dealloc
{
  [(AMSEngagementConnection *)self _removeRemoteConnection];
  v3.receiver = self;
  v3.super_class = (Class)AMSEngagementConnection;
  [(AMSEngagementConnection *)&v3 dealloc];
}

void __47__AMSEngagementConnection__newRemoteConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _removeRemoteConnection];
  v1 = [WeakRetained notificationCenter];
  [v1 postNotificationName:@"AMSEnagementConnectionErrorNotification" object:0];
}

void __47__AMSEngagementConnection__newRemoteConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _removeRemoteConnection];
  v1 = [WeakRetained notificationCenter];
  [v1 postNotificationName:@"AMSEnagementConnectionErrorNotification" object:0];
}

- (void)_removeRemoteConnection
{
  objc_super v3 = [(AMSEngagementConnection *)self connection];
  [v3 invalidate];

  [(AMSEngagementConnection *)self setConnection:0];
}

- (void)handlePushedEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSEngagementConnection *)self notificationCenter];
  [v5 postNotificationName:@"com.apple.AppleMediaServices.engagement.pushEvent" object:v4];
}

- (void)treatmentsDidSyncronize
{
  id v2 = [(AMSEngagementConnection *)self notificationCenter];
  [v2 postNotificationName:@"AMSEngagementTreatmentsDidSyncronizeNotification" object:0];
}

- (void)contentInfoForApp:(id)a3 cacheKey:(id)a4 version:(id)a5 reply:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(AMSEngagementConnection *)self proxy];
  [v14 contentInfoForApp:v13 cacheKey:v12 version:v11 reply:v10];
}

- (void)notifyBlockedMessages:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSEngagementConnection *)self proxy];
  [v5 notifyBlockedMessages:v4];
}

- (void)syncWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AMSEngagementConnection *)self proxy];
  [v8 syncWithRequest:v7 completion:v6];
}

- (void)fetchMetricsIdentifiers
{
  id v2 = [(AMSEngagementConnection *)self proxy];
  [v2 fetchMetricsIdentifiers];
}

- (void)manualSyncMetricsIdentifiers
{
  id v2 = [(AMSEngagementConnection *)self proxy];
  [v2 manualSyncMetricsIdentifiers];
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_errorHandler, 0);
}

@end