@interface BAAgentSystemProxy
- (BAAgentSystemProxy)init;
- (BOOL)applicationEventPerformedWithDescriptor:(id)a3 error:(id *)a4;
- (BOOL)applicationPrepareWithDescriptor:(id)a3 error:(id *)a4;
- (BOOL)applicationShouldTriggerPeriodicWithIdentifier:(id)a3 bundleURLPath:(id)a4 error:(id *)a5;
- (BOOL)updateAppStoreProgressObservationWithConfiguration:(id)a3 error:(id *)a4;
- (uint64_t)_setupConnection;
- (void)_connectionInvalidated;
- (void)_ensureConnection;
- (void)_resendProgressConfigurationAfterInterruption;
- (void)invalidate;
- (void)receiveAppStoreProgressWithAppBundleIdentifier:(id)a3 progressInfo:(id)a4;
- (void)runDebugCommand:(id)a3;
@end

@implementation BAAgentSystemProxy

- (BAAgentSystemProxy)init
{
  v3.receiver = self;
  v3.super_class = (Class)BAAgentSystemProxy;
  result = [(BAAgentSystemProxy *)&v3 init];
  if (result) {
    *(void *)&result->_connectionLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (uint64_t)_setupConnection
{
  if (result)
  {
    v1 = (void *)result;
    id v2 = objc_alloc(MEMORY[0x263F08D68]);
    objc_super v3 = (void *)[v2 initWithMachServiceName:kBackgroundAssetsAgentSPIMachServiceName options:0];
    objc_setProperty_atomic(v1, v4, v3, 16);

    result = (uint64_t)objc_getProperty(v1, v5, 16, 1);
    if (result)
    {
      objc_initWeak(&location, v1);
      v6 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26DAFC730];
      [v6 setClass:objc_opt_class() forSelector:sel_applicationPrepareWithDescriptor_completionHandler_ argumentIndex:0 ofReply:0];
      [v6 setClass:objc_opt_class() forSelector:sel_applicationEventPerformedWithDescriptor_completionHandler_ argumentIndex:0 ofReply:0];
      v7 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26DAFAE50];
      [v7 setClass:objc_opt_class() forSelector:sel_receiveAppStoreProgressWithAppBundleIdentifier_progressInfo_ argumentIndex:1 ofReply:0];
      id v9 = objc_getProperty(v1, v8, 16, 1);
      [v9 setRemoteObjectInterface:v6];

      id v11 = objc_getProperty(v1, v10, 16, 1);
      [v11 setExportedInterface:v7];

      id v13 = objc_getProperty(v1, v12, 16, 1);
      [v13 setExportedObject:v1];

      id v15 = objc_getProperty(v1, v14, 16, 1);
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __38__BAAgentSystemProxy__setupConnection__block_invoke;
      v22[3] = &unk_2647E8D40;
      objc_copyWeak(&v23, &location);
      [v15 setInterruptionHandler:v22];

      id v17 = objc_getProperty(v1, v16, 16, 1);
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __38__BAAgentSystemProxy__setupConnection__block_invoke_3;
      v20[3] = &unk_2647E8D40;
      objc_copyWeak(&v21, &location);
      [v17 setInvalidationHandler:v20];

      id v19 = objc_getProperty(v1, v18, 16, 1);
      [v19 resume];

      objc_destroyWeak(&v21);
      objc_destroyWeak(&v23);

      objc_destroyWeak(&location);
      return 1;
    }
  }
  return result;
}

void __38__BAAgentSystemProxy__setupConnection__block_invoke(uint64_t a1)
{
  qos_class_t v2 = qos_class_self();
  objc_super v3 = dispatch_get_global_queue(v2, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__BAAgentSystemProxy__setupConnection__block_invoke_2;
  block[3] = &unk_2647E8D40;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
}

void __38__BAAgentSystemProxy__setupConnection__block_invoke_2(uint64_t a1)
{
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    qos_class_t v2 = WeakRetained;
    -[BAAgentSystemProxy _resendProgressConfigurationAfterInterruption](WeakRetained);
    WeakRetained = v2;
  }
}

void __38__BAAgentSystemProxy__setupConnection__block_invoke_3(uint64_t a1)
{
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  -[BAAgentSystemProxy _connectionInvalidated](WeakRetained);
}

- (void)_connectionInvalidated
{
  if (a1)
  {
    qos_class_t v2 = a1 + 3;
    os_unfair_lock_lock(a1 + 3);
    objc_setProperty_atomic(a1, v3, 0, 16);
    objc_setProperty_atomic(a1, v4, 0, 24);
    os_unfair_lock_unlock(v2);
  }
}

- (void)invalidate
{
  p_connectionLock = &self->_connectionLock;
  os_unfair_lock_lock(&self->_connectionLock);
  if (self) {
    id Property = objc_getProperty(self, v4, 16, 1);
  }
  else {
    id Property = 0;
  }
  [Property invalidate];

  os_unfair_lock_unlock(p_connectionLock);
}

- (void)_ensureConnection
{
  if (a1)
  {
    qos_class_t v2 = a1 + 2;
    os_unfair_lock_lock(a1 + 2);
    if (!objc_getProperty(a1, v3, 16, 1)) {
      -[BAAgentSystemProxy _setupConnection]((uint64_t)a1);
    }
    os_unfair_lock_unlock(v2);
  }
}

- (void)_resendProgressConfigurationAfterInterruption
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (a1)
  {
    qos_class_t v2 = a1 + 3;
    os_unfair_lock_lock(a1 + 3);
    if (objc_getProperty(a1, v3, 24, 1))
    {
      id v5 = (os_unfair_lock_s *)objc_getProperty(a1, v4, 24, 1);
      objc_setProperty_atomic(a1, v6, 0, 24);
      os_unfair_lock_unlock(v2);
      if (v5)
      {
        v7 = -[BAAppStoreProgressConfiguration appBundleIdentifiers](v5);
        uint64_t v8 = [v7 count];

        if (v8)
        {
          id v15 = 0;
          char v9 = [(os_unfair_lock_s *)a1 updateAppStoreProgressObservationWithConfiguration:v5 error:&v15];
          id v10 = v15;
          if ((v9 & 1) == 0)
          {
            id v11 = BAClientLogObject();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              SEL v12 = [v10 description];
              *(_DWORD *)buf = 138543362;
              id v17 = v12;
              _os_log_impl(&dword_226E14000, v11, OS_LOG_TYPE_INFO, "Error occured updating progress observer after a connection interruption - Error: %{public}@", buf, 0xCu);
            }
            os_unfair_lock_lock(v2);
            if (!objc_getProperty(a1, v13, 24, 1)) {
              objc_setProperty_atomic(a1, v14, v5, 24);
            }
            os_unfair_lock_unlock(v2);
          }
        }
      }
    }
    else
    {
      os_unfair_lock_unlock(v2);
      id v5 = 0;
    }
  }
}

- (BOOL)applicationPrepareWithDescriptor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  -[BAAgentSystemProxy _ensureConnection]((os_unfair_lock_s *)self);
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__1;
  id v23 = __Block_byref_object_dispose__1;
  id v24 = 0;
  uint64_t v15 = 0;
  SEL v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  if (self) {
    id Property = objc_getProperty(self, v7, 16, 1);
  }
  else {
    id Property = 0;
  }
  id v9 = Property;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __61__BAAgentSystemProxy_applicationPrepareWithDescriptor_error___block_invoke;
  v14[3] = &unk_2647E8DB8;
  v14[4] = &v19;
  id v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v14];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __61__BAAgentSystemProxy_applicationPrepareWithDescriptor_error___block_invoke_66;
  v13[3] = &unk_2647E8CC8;
  v13[4] = &v15;
  v13[5] = &v19;
  [v10 applicationPrepareWithDescriptor:v6 completionHandler:v13];

  if (a4) {
    *a4 = (id) v20[5];
  }
  char v11 = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v11;
}

void __61__BAAgentSystemProxy_applicationPrepareWithDescriptor_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v5 = BAClientLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 description];
    int v7 = 136446466;
    uint64_t v8 = "-[BAAgentSystemProxy applicationPrepareWithDescriptor:error:]_block_invoke";
    __int16 v9 = 2114;
    id v10 = v6;
    _os_log_impl(&dword_226E14000, v5, OS_LOG_TYPE_INFO, "Failed to send message %{public}s - Error: %{public}@", (uint8_t *)&v7, 0x16u);
  }
}

void __61__BAAgentSystemProxy_applicationPrepareWithDescriptor_error___block_invoke_66(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)applicationEventPerformedWithDescriptor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  -[BAAgentSystemProxy _ensureConnection]((os_unfair_lock_s *)self);
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__1;
  id v23 = __Block_byref_object_dispose__1;
  id v24 = 0;
  uint64_t v15 = 0;
  SEL v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  if (self) {
    id Property = objc_getProperty(self, v7, 16, 1);
  }
  else {
    id Property = 0;
  }
  id v9 = Property;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __68__BAAgentSystemProxy_applicationEventPerformedWithDescriptor_error___block_invoke;
  v14[3] = &unk_2647E8DB8;
  v14[4] = &v19;
  id v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v14];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __68__BAAgentSystemProxy_applicationEventPerformedWithDescriptor_error___block_invoke_68;
  v13[3] = &unk_2647E8CC8;
  v13[4] = &v15;
  v13[5] = &v19;
  [v10 applicationEventPerformedWithDescriptor:v6 completionHandler:v13];

  if (a4) {
    *a4 = (id) v20[5];
  }
  char v11 = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v11;
}

void __68__BAAgentSystemProxy_applicationEventPerformedWithDescriptor_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v5 = BAClientLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 description];
    int v7 = 136446466;
    uint64_t v8 = "-[BAAgentSystemProxy applicationEventPerformedWithDescriptor:error:]_block_invoke";
    __int16 v9 = 2114;
    id v10 = v6;
    _os_log_impl(&dword_226E14000, v5, OS_LOG_TYPE_INFO, "Failed to send message %{public}s - Error: %{public}@", (uint8_t *)&v7, 0x16u);
  }
}

void __68__BAAgentSystemProxy_applicationEventPerformedWithDescriptor_error___block_invoke_68(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)applicationShouldTriggerPeriodicWithIdentifier:(id)a3 bundleURLPath:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  -[BAAgentSystemProxy _ensureConnection]((os_unfair_lock_s *)self);
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__1;
  v26 = __Block_byref_object_dispose__1;
  id v27 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  if (self) {
    id Property = objc_getProperty(self, v10, 16, 1);
  }
  else {
    id Property = 0;
  }
  id v12 = Property;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __89__BAAgentSystemProxy_applicationShouldTriggerPeriodicWithIdentifier_bundleURLPath_error___block_invoke;
  v17[3] = &unk_2647E8DB8;
  v17[4] = &v22;
  SEL v13 = [v12 synchronousRemoteObjectProxyWithErrorHandler:v17];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __89__BAAgentSystemProxy_applicationShouldTriggerPeriodicWithIdentifier_bundleURLPath_error___block_invoke_69;
  v16[3] = &unk_2647E8CC8;
  v16[4] = &v18;
  v16[5] = &v22;
  [v13 applicationShouldTriggerPeriodicWithIdentifier:v8 bundleURLPath:v9 completionHandler:v16];

  if (a5) {
    *a5 = (id) v23[5];
  }
  char v14 = *((unsigned char *)v19 + 24);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  return v14;
}

void __89__BAAgentSystemProxy_applicationShouldTriggerPeriodicWithIdentifier_bundleURLPath_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v5 = BAClientLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 description];
    int v7 = 136446466;
    id v8 = "-[BAAgentSystemProxy applicationShouldTriggerPeriodicWithIdentifier:bundleURLPath:error:]_block_invoke";
    __int16 v9 = 2114;
    id v10 = v6;
    _os_log_impl(&dword_226E14000, v5, OS_LOG_TYPE_INFO, "Failed to send message %{public}s - Error: %{public}@", (uint8_t *)&v7, 0x16u);
  }
}

void __89__BAAgentSystemProxy_applicationShouldTriggerPeriodicWithIdentifier_bundleURLPath_error___block_invoke_69(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void)runDebugCommand:(id)a3
{
  id v4 = a3;
  -[BAAgentSystemProxy _ensureConnection]((os_unfair_lock_s *)self);
  if (self) {
    id Property = objc_getProperty(self, v5, 16, 1);
  }
  else {
    id Property = 0;
  }
  id v7 = [Property synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_3];
  [v7 runDebugCommand:v4 reply:&__block_literal_global_72];
}

void __38__BAAgentSystemProxy_runDebugCommand___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = a2;
  SEL v3 = BAClientLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [v2 description];
    int v5 = 136446466;
    id v6 = "-[BAAgentSystemProxy runDebugCommand:]_block_invoke";
    __int16 v7 = 2114;
    id v8 = v4;
    _os_log_impl(&dword_226E14000, v3, OS_LOG_TYPE_INFO, "Failed to send message %{public}s - Error: %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

- (BOOL)updateAppStoreProgressObservationWithConfiguration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  -[BAAgentSystemProxy _ensureConnection]((os_unfair_lock_s *)self);
  uint64_t v20 = 0;
  char v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__1;
  uint64_t v24 = __Block_byref_object_dispose__1;
  id v25 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  os_unfair_lock_lock(&self->_progressObserverLock);
  if (self)
  {
    objc_setProperty_atomic(self, v7, v6, 24);
    os_unfair_lock_unlock(&self->_progressObserverLock);
    id Property = objc_getProperty(self, v8, 16, 1);
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)0xC);
    id Property = 0;
  }
  id v10 = Property;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __79__BAAgentSystemProxy_updateAppStoreProgressObservationWithConfiguration_error___block_invoke;
  v15[3] = &unk_2647E8DB8;
  v15[4] = &v20;
  uint64_t v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v15];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __79__BAAgentSystemProxy_updateAppStoreProgressObservationWithConfiguration_error___block_invoke_73;
  v14[3] = &unk_2647E8CC8;
  v14[4] = &v16;
  void v14[5] = &v20;
  [v11 updateAppStoreProgressObservationWithConfiguration:v6 completionHandler:v14];

  if (a4) {
    *a4 = (id) v21[5];
  }
  char v12 = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return v12;
}

void __79__BAAgentSystemProxy_updateAppStoreProgressObservationWithConfiguration_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  int v5 = BAClientLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 description];
    int v7 = 136446466;
    SEL v8 = "-[BAAgentSystemProxy updateAppStoreProgressObservationWithConfiguration:error:]_block_invoke";
    __int16 v9 = 2114;
    id v10 = v6;
    _os_log_impl(&dword_226E14000, v5, OS_LOG_TYPE_INFO, "Failed to send message %{public}s - Error: %{public}@", (uint8_t *)&v7, 0x16u);
  }
}

void __79__BAAgentSystemProxy_updateAppStoreProgressObservationWithConfiguration_error___block_invoke_73(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void)receiveAppStoreProgressWithAppBundleIdentifier:(id)a3 progressInfo:(id)a4
{
  p_progressObserverLock = &self->_progressObserverLock;
  id v7 = a4;
  id v11 = a3;
  os_unfair_lock_lock(p_progressObserverLock);
  if (self) {
    id Property = objc_getProperty(self, v8, 24, 1);
  }
  else {
    id Property = 0;
  }
  id v10 = Property;
  os_unfair_lock_unlock(p_progressObserverLock);
  -[BAAppStoreProgressConfiguration invokeHandlerWithAppBundleIdentifier:progressInfo:]((uint64_t)v10, v11, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentProgressConfiguration, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end