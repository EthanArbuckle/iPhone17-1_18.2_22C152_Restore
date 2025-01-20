@interface CHSWidgetEventServicePublisher
- (BOOL)isActive;
- (CHSWidgetEventServicePublisher)initWithMachServiceName:(id)a3;
- (id)_activeConnection;
- (id)description;
- (void)_invalidateConnection;
- (void)activate;
- (void)dealloc;
- (void)publishOpenEventWithURL:(id)a3;
- (void)publishOpenEventWithUserActivity:(id)a3;
@end

@implementation CHSWidgetEventServicePublisher

- (void)dealloc
{
  [(CHSWidgetEventServicePublisher *)self _invalidateConnection];
  v3.receiver = self;
  v3.super_class = (Class)CHSWidgetEventServicePublisher;
  [(CHSWidgetEventServicePublisher *)&v3 dealloc];
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; machName: %@>",
               objc_opt_class(),
               self,
               self->_machServiceName);
}

- (CHSWidgetEventServicePublisher)initWithMachServiceName:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"CHSWidgetEventServicePublisher.m", 38, @"Invalid parameter not satisfying: %@", @"machServiceName" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)CHSWidgetEventServicePublisher;
  v6 = [(CHSWidgetEventServicePublisher *)&v17 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    machServiceName = v6->_machServiceName;
    v6->_machServiceName = (NSString *)v7;

    uint64_t Serial = BSDispatchQueueCreateSerial();
    connectionQueue = v6->_connectionQueue;
    v6->_connectionQueue = (OS_dispatch_queue *)Serial;

    v11 = CHSLogChronoServices();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      v14 = [(CHSWidgetEventServicePublisher *)v6 description];
      *(_DWORD *)buf = 138543618;
      v19 = v13;
      __int16 v20 = 2114;
      v21 = v14;
      _os_log_impl(&dword_190C6F000, v11, OS_LOG_TYPE_DEFAULT, "Initializing new %{public}@ instance: %{public}@", buf, 0x16u);
    }
  }

  return v6;
}

- (void)activate
{
  id v2 = [(CHSWidgetEventServicePublisher *)self _activeConnection];
}

- (void)publishOpenEventWithURL:(id)a3
{
  id v6 = a3;
  v4 = [(CHSWidgetEventServicePublisher *)self _activeConnection];
  id v5 = [v4 remoteTarget];

  if (v5) {
    [v5 handleOpenEventWithURL:v6];
  }
}

- (void)publishOpenEventWithUserActivity:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CHSWidgetEventServicePublisher *)self _activeConnection];
  id v6 = [v5 remoteTarget];

  if (v6)
  {
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x3032000000;
    __int16 v20 = __Block_byref_object_copy__1;
    v21 = __Block_byref_object_dispose__1;
    id v22 = 0;
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__1;
    v15 = __Block_byref_object_dispose__1;
    id v16 = 0;
    [v4 setNeedsSave:0];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __67__CHSWidgetEventServicePublisher_publishOpenEventWithUserActivity___block_invoke;
    v10[3] = &unk_1E56C8680;
    v10[4] = &v17;
    v10[5] = &v11;
    [v4 _createUserActivityDataWithOptions:0 completionHandler:v10];
    if (v12[5])
    {
      uint64_t v7 = CHSLogChronoServices();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = (objc_class *)objc_opt_class();
        v9 = NSStringFromClass(v8);
        *(_DWORD *)buf = 138543618;
        v24 = v9;
        __int16 v25 = 2114;
        id v26 = v4;
        _os_log_impl(&dword_190C6F000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Error serializing User Activity %{public}@", buf, 0x16u);
      }
    }
    else
    {
      [v6 handleOpenEventWithUserActivityData:v18[5]];
    }
    _Block_object_dispose(&v11, 8);

    _Block_object_dispose(&v17, 8);
  }
}

void __67__CHSWidgetEventServicePublisher_publishOpenEventWithUserActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)_activeConnection
{
  id v2 = self;
  objc_sync_enter(v2);
  if (!v2->_connection)
  {
    objc_super v3 = (void *)MEMORY[0x1E4F50BB8];
    machServiceName = v2->_machServiceName;
    id v5 = +[CHSWidgetEventServiceSpecification identifier];
    id v6 = [v3 endpointForMachName:machServiceName service:v5 instance:0];

    uint64_t v7 = [MEMORY[0x1E4F50BA0] connectionWithEndpoint:v6];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __51__CHSWidgetEventServicePublisher__activeConnection__block_invoke;
    v10[3] = &unk_1E56C86D0;
    v10[4] = v2;
    [v7 configureConnection:v10];
    objc_storeStrong((id *)&v2->_connection, v7);
    [(BSServiceConnection *)v2->_connection activate];
  }
  objc_sync_exit(v2);

  connection = v2->_connection;
  return connection;
}

void __51__CHSWidgetEventServicePublisher__activeConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[CHSWidgetEventServiceSpecification interface];
  objc_initWeak(&location, *(id *)(a1 + 32));
  if (v4)
  {
    [v3 setInterface:v4];
    [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  }
  [v3 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 24)];
  id v5 = +[CHSWidgetEventServiceSpecification serviceQuality];
  [v3 setServiceQuality:v5];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__CHSWidgetEventServicePublisher__activeConnection__block_invoke_2;
  v10[3] = &unk_1E56C86A8;
  objc_copyWeak(&v11, &location);
  [v3 setActivationHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__CHSWidgetEventServicePublisher__activeConnection__block_invoke_21;
  v8[3] = &unk_1E56C86A8;
  objc_copyWeak(&v9, &location);
  [v3 setInterruptionHandler:v8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__CHSWidgetEventServicePublisher__activeConnection__block_invoke_22;
  v6[3] = &unk_1E56C86A8;
  objc_copyWeak(&v7, &location);
  [v3 setInvalidationHandler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __51__CHSWidgetEventServicePublisher__activeConnection__block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = CHSLogChronoServices();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_190C6F000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ (host-side) connection activated", (uint8_t *)&v6, 0xCu);
  }
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    objc_sync_enter(v5);
    v5[32] = 1;
    objc_sync_exit(v5);
  }
}

void __51__CHSWidgetEventServicePublisher__activeConnection__block_invoke_21(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = CHSLogChronoServices();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    int v9 = 138543362;
    v10 = v7;
    _os_log_impl(&dword_190C6F000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ (service-side) connection interrupted", (uint8_t *)&v9, 0xCu);
  }
  if (WeakRetained)
  {
    uint64_t v8 = WeakRetained;
    objc_sync_enter(v8);
    v8[32] = 0;
    [v3 activate];
    objc_sync_exit(v8);
  }
}

void __51__CHSWidgetEventServicePublisher__activeConnection__block_invoke_22(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = CHSLogChronoServices();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_190C6F000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ (host-side) connection invalidated", (uint8_t *)&v6, 0xCu);
  }
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    objc_sync_enter(v5);
    v5[32] = 0;
    [v5 _invalidateConnection];
    objc_sync_exit(v5);
  }
}

- (void)_invalidateConnection
{
  obj = self;
  objc_sync_enter(obj);
  id v2 = obj;
  connection = obj->_connection;
  if (connection)
  {
    [(BSServiceConnection *)connection invalidate];
    id v4 = obj->_connection;
    obj->_connection = 0;

    id v2 = obj;
  }
  objc_sync_exit(v2);
}

- (BOOL)isActive
{
  return self->_active;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);
}

@end