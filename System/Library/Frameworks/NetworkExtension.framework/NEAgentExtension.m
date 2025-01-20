@interface NEAgentExtension
- (BOOL)appsUpdateEnding;
- (BOOL)appsUpdateStarted;
- (NEAgentExtension)initWithPluginType:(id)a3 pluginClass:(int64_t)a4 pluginEndpoint:(id)a5 pluginProcessIdentity:(id)a6 queue:(id)a7 factory:(id)a8;
- (NEAgentExtension)initWithPluginType:(id)a3 pluginClass:(int64_t)a4 pluginInfo:(id)a5 queue:(id)a6 factory:(id)a7;
- (NEExtensionProviderHostContext)sessionContext;
- (NEPluginManagerObjectFactory)managerObjectFactory;
- (NSArray)uuids;
- (NSString)extensionIdentifier;
- (NSString)pluginType;
- (NSXPCInterface)driverInterface;
- (NSXPCInterface)driverProtocol;
- (NSXPCInterface)managerInterface;
- (NSXPCInterface)managerProtocol;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)sendFailedTimer;
- (id)copyProcessIdentities;
- (void)cleanupExtensionWithRequestIdentifier:(void *)a1;
- (void)dealloc;
- (void)extension:(id)a3 didFailWithError:(id)a4;
- (void)extensionDidStop:(id)a3;
- (void)handleDisposeWithCompletionHandler:(id)a3;
- (void)handleExtensionExit:(void *)a1;
- (void)handleExtensionStartedWithCompletionHandler:(id)a3;
- (void)handleInitWithCompletionHandler:(id)a3;
- (void)setAppsUpdateEnding:(BOOL)a3;
- (void)setAppsUpdateStarted:(BOOL)a3;
- (void)setExtension:(uint64_t)a1;
- (void)setQueue:(id)a3;
- (void)setSendFailedTimer:(id)a3;
- (void)setSessionContext:(id)a3;
- (void)setSessionRequestIdentifier:(uint64_t)a1;
- (void)sleepWithCompletionHandler:(id)a3;
- (void)startWithConfiguration:(id)a3 completionHandler:(id)a4;
- (void)updateConfiguration:(id)a3;
- (void)wakeup;
@end

@implementation NEAgentExtension

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pendingDisposeCompletion, 0);
  objc_storeStrong((id *)&self->_extensionUUIDs, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_extensionPointIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_sendFailedTimer, 0);
  objc_storeStrong((id *)&self->_driverProtocol, 0);
  objc_storeStrong((id *)&self->_managerProtocol, 0);
  objc_storeStrong((id *)&self->_extensionIdentifier, 0);
  objc_storeStrong((id *)&self->_pluginType, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sessionContext, 0);

  objc_destroyWeak((id *)&self->_managerObjectFactory);
}

- (void)setSendFailedTimer:(id)a3
{
}

- (OS_dispatch_source)sendFailedTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAppsUpdateEnding:(BOOL)a3
{
  self->_appsUpdateEnding = a3;
}

- (BOOL)appsUpdateEnding
{
  return self->_appsUpdateEnding;
}

- (void)setAppsUpdateStarted:(BOOL)a3
{
  self->_appsUpdateStarted = a3;
}

- (BOOL)appsUpdateStarted
{
  return self->_appsUpdateStarted;
}

- (NSXPCInterface)driverProtocol
{
  return (NSXPCInterface *)objc_getProperty(self, a2, 64, 1);
}

- (NSXPCInterface)managerProtocol
{
  return (NSXPCInterface *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)extensionIdentifier
{
  return self->_extensionIdentifier;
}

- (NSString)pluginType
{
  return self->_pluginType;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSessionContext:(id)a3
{
}

- (NEExtensionProviderHostContext)sessionContext
{
  return self->_sessionContext;
}

- (NEPluginManagerObjectFactory)managerObjectFactory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_managerObjectFactory);

  return (NEPluginManagerObjectFactory *)WeakRetained;
}

- (void)handleExtensionStartedWithCompletionHandler:(id)a3
{
}

- (void)extensionDidStop:(id)a3
{
  [(NEAgentExtension *)self setSessionContext:0];
  if (self && objc_getProperty(self, v4, 112, 1))
  {
    Property = (void (**)(void))objc_getProperty(self, v5, 112, 1);
    Property[2]();
    objc_setProperty_atomic_copy(self, v7, 0, 112);
  }
}

- (void)extension:(id)a3 didFailWithError:(id)a4
{
  v5 = [(NEAgentExtension *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__NEAgentExtension_extension_didFailWithError___block_invoke;
  block[3] = &unk_1E59932C0;
  block[4] = self;
  dispatch_async(v5, block);
}

void __47__NEAgentExtension_extension_didFailWithError___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2) {
    v3 = (void *)v2[10];
  }
  else {
    v3 = 0;
  }
  id v4 = v3;
  [v2 setSessionContext:0];
  -[NEAgentExtension setSessionRequestIdentifier:](*(void *)(a1 + 32), 0);
  -[NEAgentExtension handleExtensionExit:](*(void **)(a1 + 32), v4);
}

- (void)setSessionRequestIdentifier:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 80), a2);
  }
}

- (void)handleExtensionExit:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = [a1 queue];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __40__NEAgentExtension_handleExtensionExit___block_invoke;
    v5[3] = &unk_1E5992328;
    v5[4] = a1;
    id v6 = v3;
    dispatch_async(v4, v5);
  }
}

void __40__NEAgentExtension_handleExtensionExit___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) appsUpdateStarted])
  {
    v2 = ne_log_obj();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = v3;
      _os_log_impl(&dword_19DDAF000, v2, OS_LOG_TYPE_DEFAULT, "App updating - ignore extension failure/exit for %@", buf, 0xCu);
    }
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) sendFailedTimer];

    if (!v4)
    {
      v5 = ne_log_obj();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v17 = v6;
        _os_log_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_DEFAULT, "Scheduing timer for extension failure/exit for %@", buf, 0xCu);
      }

      v7 = [*(id *)(a1 + 32) queue];
      uint64_t v10 = MEMORY[0x1E4F143A8];
      uint64_t v11 = 3221225472;
      v12 = __40__NEAgentExtension_handleExtensionExit___block_invoke_8;
      v13 = &unk_1E5992328;
      v8 = *(void **)(a1 + 40);
      uint64_t v14 = *(void *)(a1 + 32);
      id v15 = v8;
      v9 = NECreateTimerSource(v7, 5, &v10);
      objc_msgSend(*(id *)(a1 + 32), "setSendFailedTimer:", v9, v10, v11, v12, v13, v14);
    }
  }
}

void __40__NEAgentExtension_handleExtensionExit___block_invoke_8(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) sendFailedTimer];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) sendFailedTimer];
    dispatch_source_cancel(v3);

    [*(id *)(a1 + 32) setSendFailedTimer:0];
  }
  int v4 = [*(id *)(a1 + 32) appsUpdateStarted];
  v5 = ne_log_obj();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v9 = 138412290;
      uint64_t v10 = v7;
      _os_log_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_DEFAULT, "App updating - ignore extension failure/exit for %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    if (v6)
    {
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_DEFAULT, "Handle extension failure/exit for %@ - disconnect session", (uint8_t *)&v9, 0xCu);
    }

    [*(id *)(a1 + 32) sendExtensionFailed];
  }
}

- (void)wakeup
{
  id v2 = [(NEAgentExtension *)self sessionContext];
  [v2 wake];
}

- (void)sleepWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(NEAgentExtension *)self sessionContext];
  [v5 sleepWithCompletionHandler:v4];
}

- (void)updateConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(NEAgentExtension *)self sessionContext];
  [v5 setConfiguration:v4 extensionIdentifier:self->_extensionIdentifier];
}

- (void)startWithConfiguration:(id)a3 completionHandler:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NEAgentExtension *)self sessionContext];

  if (v8)
  {
    int v9 = [(NEAgentExtension *)self sessionContext];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke;
    v24[3] = &unk_1E5992440;
    uint64_t v10 = &v26;
    id v25 = v6;
    id v26 = v7;
    uint64_t v11 = &v25;
    v24[4] = self;
    id v12 = v6;
    id v13 = v7;
    [v9 createWithCompletionHandler:v24];
  }
  else
  {
    uint64_t v14 = ne_log_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      if (self) {
        extension = self->_extension;
      }
      else {
        extension = 0;
      }
      v16 = extension;
      uint64_t v17 = [(NSExtension *)v16 identifier];
      *(_DWORD *)buf = 138412290;
      v28 = v17;
      _os_log_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_DEFAULT, "Beginning extension request with extension %@", buf, 0xCu);
    }
    if (self) {
      uint64_t v18 = self->_extension;
    }
    else {
      uint64_t v18 = 0;
    }
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_33;
    v21[3] = &unk_1E5991890;
    uint64_t v10 = &v23;
    id v22 = v6;
    id v23 = v7;
    uint64_t v11 = &v22;
    v21[4] = self;
    id v19 = v6;
    id v20 = v7;
    [(NSExtension *)v18 beginExtensionRequestWithInputItems:0 completion:v21];
  }
}

void __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke(uint64_t a1, char a2)
{
  id v4 = [*(id *)(a1 + 32) queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_2;
  v8[3] = &unk_1E5992418;
  char v11 = a2;
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  id v10 = v5;
  v8[4] = v6;
  id v9 = v7;
  dispatch_async(v4, v8);
}

void __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_33(id *a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = ne_log_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = a1[4];
    if (v8) {
      uint64_t v8 = (void *)v8[12];
    }
    id v9 = v8;
    id v10 = [v9 identifier];
    *(_DWORD *)buf = 138412546;
    id v22 = v10;
    __int16 v23 = 2112;
    id v24 = v5;
    _os_log_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_DEFAULT, "Extension request with extension %@ started with identifier %@", buf, 0x16u);
  }
  char v11 = [a1[4] queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_34;
  block[3] = &unk_1E5992468;
  id v12 = a1[4];
  id v16 = v6;
  id v17 = v12;
  id v20 = a1[6];
  id v18 = v5;
  id v19 = a1[5];
  id v13 = v5;
  id v14 = v6;
  dispatch_async(v11, block);
}

void __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_34(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id v2 = ne_log_obj();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void **)(a1 + 40);
      if (v8) {
        uint64_t v8 = (void *)v8[12];
      }
      id v9 = v8;
      id v10 = [v9 identifier];
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v21 = v10;
      __int16 v22 = 2112;
      uint64_t v23 = v11;
      _os_log_error_impl(&dword_19DDAF000, v2, OS_LOG_TYPE_ERROR, "Failed to start extension %@: %@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    uint64_t v3 = *(void **)(a1 + 40);
    if (v3) {
      uint64_t v3 = (void *)v3[12];
    }
    uint64_t v4 = *(void *)(a1 + 48);
    id v5 = v3;
    id v6 = -[NSExtension extensionHostContextForUUID:](v5, v4);

    if (v6)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_35;
      v15[3] = &unk_1E5992ED0;
      v15[4] = *(void *)(a1 + 40);
      id v19 = *(id *)(a1 + 64);
      id v16 = *(id *)(a1 + 48);
      id v17 = v6;
      id v18 = *(id *)(a1 + 56);
      [v17 validateWithCompletionHandler:v15];
    }
    else
    {
      id v7 = ne_log_obj();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v12 = *(void **)(a1 + 40);
        if (v12) {
          id v12 = (void *)v12[12];
        }
        id v13 = v12;
        id v14 = [v13 identifier];
        *(_DWORD *)buf = 138412290;
        v21 = v14;
        _os_log_error_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_ERROR, "Failed to get the host context for extension %@", buf, 0xCu);
      }
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
  }
}

void __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_35(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1[4] queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_2_36;
  v7[3] = &unk_1E5991868;
  id v5 = a1[4];
  id v8 = v3;
  id v9 = v5;
  id v13 = a1[8];
  id v10 = a1[5];
  id v11 = a1[6];
  id v12 = a1[7];
  id v6 = v3;
  dispatch_async(v4, v7);
}

void __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_2_36(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id v2 = ne_log_obj();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      id v7 = [*(id *)(a1 + 40) pluginType];
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      id v12 = v7;
      __int16 v13 = 2112;
      uint64_t v14 = v8;
      _os_log_error_impl(&dword_19DDAF000, v2, OS_LOG_TYPE_ERROR, "Provider %@ validation failed: %@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    -[NEAgentExtension setSessionRequestIdentifier:](*(void *)(a1 + 40), *(void **)(a1 + 48));
    [*(id *)(a1 + 40) setSessionContext:*(void *)(a1 + 56)];
    id v3 = *(void **)(a1 + 40);
    uint64_t v4 = [v3 sessionContext];
    id v5 = (void *)v4;
    if (v4) {
      objc_storeWeak((id *)(v4 + 56), v3);
    }

    [*(id *)(a1 + 40) updateConfiguration:*(void *)(a1 + 64)];
    id v6 = *(void **)(a1 + 40);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_37;
    v9[3] = &unk_1E5992300;
    v9[4] = v6;
    id v10 = *(id *)(a1 + 72);
    [v6 handleExtensionStartedWithCompletionHandler:v9];
  }
}

void __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_37(uint64_t a1, uint64_t a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4)
    {
      uint64_t v5 = *(void *)(v4 + 80);
      if (v5)
      {
        id v6 = *(id *)(v4 + 96);
        [v6 cancelExtensionRequestWithIdentifier:v5];
      }
    }
  }
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = -[NEAgentExtension copyProcessIdentities](*(id *)(a1 + 32));
  (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
}

- (id)copyProcessIdentities
{
  if (result)
  {
    v1 = result;
    id v2 = [result sessionContext];

    if (!v2) {
      goto LABEL_7;
    }
    Property = [v1 sessionContext];
    uint64_t v5 = Property;
    if (Property) {
      Property = objc_getProperty(Property, v4, 64, 1);
    }
    id v6 = Property;

    if (v6)
    {
      uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v6, 0);

      return (id)v7;
    }
    else
    {
LABEL_7:
      id v8 = ne_log_obj();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_ERROR, "No extension process identity is available", buf, 2u);
      }

      return objc_alloc_init(MEMORY[0x1E4F1C978]);
    }
  }
  return result;
}

void __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    id v2 = [*(id *)(a1 + 32) sessionContext];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_3;
    v4[3] = &unk_1E59923F0;
    v4[4] = *(void *)(a1 + 32);
    id v6 = *(id *)(a1 + 48);
    id v5 = *(id *)(a1 + 40);
    [v2 validateWithCompletionHandler:v4];
  }
  else
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v3();
  }
}

void __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_3(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1[4] queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_4;
  v7[3] = &unk_1E5992508;
  id v5 = a1[4];
  id v8 = v3;
  id v9 = v5;
  id v11 = a1[6];
  id v10 = a1[5];
  id v6 = v3;
  dispatch_async(v4, v7);
}

void __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id v2 = ne_log_obj();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      id v5 = [*(id *)(a1 + 40) pluginType];
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      id v10 = v5;
      __int16 v11 = 2112;
      uint64_t v12 = v6;
      _os_log_error_impl(&dword_19DDAF000, v2, OS_LOG_TYPE_ERROR, "Provider %@ validation failed: %@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    [*(id *)(a1 + 40) updateConfiguration:*(void *)(a1 + 48)];
    id v3 = *(void **)(a1 + 40);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_30;
    v7[3] = &unk_1E5992300;
    id v4 = *(id *)(a1 + 56);
    void v7[4] = *(void *)(a1 + 40);
    id v8 = v4;
    [v3 handleExtensionStartedWithCompletionHandler:v7];
  }
}

void __61__NEAgentExtension_startWithConfiguration_completionHandler___block_invoke_30(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = -[NEAgentExtension copyProcessIdentities](*(id *)(a1 + 32));
  (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, a2, v4);
}

- (NSXPCInterface)driverInterface
{
  if (driverInterface_onceToken_16360 != -1) {
    dispatch_once(&driverInterface_onceToken_16360, &__block_literal_global_16361);
  }
  id v2 = (void *)driverInterface_driverInterface_16362;

  return (NSXPCInterface *)v2;
}

uint64_t __35__NEAgentExtension_driverInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF093350];
  uint64_t v1 = driverInterface_driverInterface_16362;
  driverInterface_driverInterface_16362 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (NSXPCInterface)managerInterface
{
  return 0;
}

- (NSArray)uuids
{
  return self->_extensionUUIDs;
}

- (void)handleDisposeWithCompletionHandler:(id)a3
{
  newValue = (void (**)(void))a3;
  id v4 = [(NEAgentExtension *)self sessionContext];

  if (v4)
  {
    if (self) {
      objc_setProperty_atomic_copy(self, v5, newValue, 112);
    }
    uint64_t v6 = [(NEAgentExtension *)self sessionContext];
    [v6 dispose];
  }
  else
  {
    uint64_t v7 = newValue;
    if (!newValue) {
      goto LABEL_8;
    }
    newValue[2](newValue);
  }
  uint64_t v7 = newValue;
LABEL_8:
}

- (void)handleInitWithCompletionHandler:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(NEAgentExtension *)self extensionIdentifier];

  if (v5)
  {
    v22[0] = *MEMORY[0x1E4F28290];
    uint64_t v6 = [(NEAgentExtension *)self extensionIdentifier];
    v23[0] = v6;
    v22[1] = *MEMORY[0x1E4F282B0];
    if (self) {
      extensionPointIdentifier = self->_extensionPointIdentifier;
    }
    else {
      extensionPointIdentifier = 0;
    }
    v23[1] = extensionPointIdentifier;
    id v8 = (void *)MEMORY[0x1E4F1C9E8];
    id v9 = extensionPointIdentifier;
    id v5 = [v8 dictionaryWithObjects:v23 forKeys:v22 count:2];
  }
  id v10 = ne_log_obj();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [(NEAgentExtension *)self extensionIdentifier];
    uint64_t v12 = (void *)v11;
    if (self) {
      uint64_t v13 = self->_extensionPointIdentifier;
    }
    else {
      uint64_t v13 = 0;
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v19 = v11;
    __int16 v20 = 2112;
    v21 = v13;
    _os_log_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_DEFAULT, "Looking for an extension with identifier %@ and extension point %@", buf, 0x16u);
  }
  uint64_t v14 = (void *)MEMORY[0x1E4F28C70];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __52__NEAgentExtension_handleInitWithCompletionHandler___block_invoke;
  v16[3] = &unk_1E5993720;
  v16[4] = self;
  id v17 = v4;
  id v15 = v4;
  [v14 extensionsWithMatchingAttributes:v5 completion:v16];
}

void __52__NEAgentExtension_handleInitWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__NEAgentExtension_handleInitWithCompletionHandler___block_invoke_2;
  v12[3] = &unk_1E5992508;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(a1 + 40);
  id v13 = v5;
  uint64_t v14 = v8;
  id v15 = v6;
  id v16 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, v12);
}

void __52__NEAgentExtension_handleInitWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) count];
    uint64_t v4 = [*(id *)(a1 + 40) extensionIdentifier];
    id v5 = (void *)v4;
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6) {
      uint64_t v6 = *(void *)(v6 + 88);
    }
    *(_DWORD *)buf = 134218498;
    uint64_t v27 = v3;
    __int16 v28 = 2112;
    uint64_t v29 = v4;
    __int16 v30 = 2112;
    uint64_t v31 = v6;
    _os_log_impl(&dword_19DDAF000, v2, OS_LOG_TYPE_DEFAULT, "Found %lu extension(s) with identifier %@ and extension point %@", buf, 0x20u);
  }
  if (!*(void *)(a1 + 48) && (uint64_t v8 = *(void **)(a1 + 32)) != 0 && [v8 count])
  {
    objc_initWeak((id *)buf, *(id *)(a1 + 40));
    id v9 = [*(id *)(a1 + 32) objectAtIndexedSubscript:0];
    -[NEAgentExtension setExtension:](*(void *)(a1 + 40), v9);

    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __52__NEAgentExtension_handleInitWithCompletionHandler___block_invoke_12;
    v24[3] = &unk_1E5992350;
    objc_copyWeak(&v25, (id *)buf);
    id v10 = *(void **)(a1 + 40);
    if (v10) {
      id v10 = (void *)v10[12];
    }
    id v11 = v10;
    [v11 setRequestInterruptionBlock:v24];

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    void v22[2] = __52__NEAgentExtension_handleInitWithCompletionHandler___block_invoke_14;
    v22[3] = &unk_1E5992378;
    objc_copyWeak(&v23, (id *)buf);
    uint64_t v12 = *(void **)(a1 + 40);
    if (v12) {
      uint64_t v12 = (void *)v12[12];
    }
    id v13 = v12;
    [v13 setRequestCompletionBlock:v22];

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __52__NEAgentExtension_handleInitWithCompletionHandler___block_invoke_2_16;
    v20[3] = &unk_1E59923A0;
    objc_copyWeak(&v21, (id *)buf);
    uint64_t v14 = *(void **)(a1 + 40);
    if (v14) {
      uint64_t v14 = (void *)v14[12];
    }
    id v15 = v14;
    [v15 setRequestCancellationBlock:v20];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    uint64_t v7 = ne_log_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = [*(id *)(a1 + 40) extensionIdentifier];
      id v17 = (void *)v16;
      uint64_t v18 = *(void *)(a1 + 40);
      if (v18) {
        uint64_t v18 = *(void *)(v18 + 88);
      }
      uint64_t v19 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      uint64_t v27 = v16;
      __int16 v28 = 2112;
      uint64_t v29 = v18;
      __int16 v30 = 2112;
      uint64_t v31 = v19;
      _os_log_error_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_ERROR, "Failed to find an app extension with identifier %@ and extension point %@: %@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)setExtension:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 96), a2);
  }
}

void __52__NEAgentExtension_handleInitWithCompletionHandler___block_invoke_12(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    if (WeakRetained) {
      uint64_t v7 = (void *)WeakRetained[12];
    }
    else {
      uint64_t v7 = 0;
    }
    id v8 = v7;
    id v9 = [v8 identifier];
    int v10 = 138412290;
    id v11 = v9;
    _os_log_error_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_ERROR, "Extension %@ died unexpectedly", (uint8_t *)&v10, 0xCu);
  }
  if (WeakRetained) {
    uint64_t v6 = WeakRetained[10];
  }
  else {
    uint64_t v6 = 0;
  }
  if ([v3 isEqual:v6])
  {
    -[NEAgentExtension handleExtensionExit:](WeakRetained, v3);
    -[NEAgentExtension cleanupExtensionWithRequestIdentifier:](WeakRetained, v3);
  }
}

void __52__NEAgentExtension_handleInitWithCompletionHandler___block_invoke_14(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    uint64_t v5 = WeakRetained[10];
  }
  else {
    uint64_t v5 = 0;
  }
  if ([v6 isEqual:v5]) {
    -[NEAgentExtension cleanupExtensionWithRequestIdentifier:](v4, v6);
  }
}

void __52__NEAgentExtension_handleInitWithCompletionHandler___block_invoke_2_16(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    uint64_t v5 = WeakRetained[10];
  }
  else {
    uint64_t v5 = 0;
  }
  if ([v6 isEqual:v5]) {
    -[NEAgentExtension cleanupExtensionWithRequestIdentifier:](v4, v6);
  }
}

- (void)cleanupExtensionWithRequestIdentifier:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = [a1 queue];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __58__NEAgentExtension_cleanupExtensionWithRequestIdentifier___block_invoke;
    v5[3] = &unk_1E5992328;
    v5[4] = a1;
    id v6 = v3;
    dispatch_async(v4, v5);
  }
}

void __58__NEAgentExtension_cleanupExtensionWithRequestIdentifier___block_invoke(uint64_t a1)
{
  -[NEAgentExtension setSessionRequestIdentifier:](*(void *)(a1 + 32), 0);
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id v3 = *(void **)(v2 + 96);
  }
  else {
    id v3 = 0;
  }
  [v3 setRequestInterruptionBlock:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v5 = *(void **)(v4 + 96);
  }
  else {
    uint64_t v5 = 0;
  }
  [v5 setRequestCancellationBlock:0];
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    uint64_t v7 = *(void **)(v6 + 96);
  }
  else {
    uint64_t v7 = 0;
  }
  [v7 setRequestCompletionBlock:0];
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    id v9 = *(void **)(v8 + 96);
  }
  else {
    id v9 = 0;
  }
  [v9 cancelExtensionRequestWithIdentifier:*(void *)(a1 + 40)];
  -[NEAgentExtension setExtension:](*(void *)(a1 + 32), 0);
  int v10 = *(void **)(a1 + 32);
  id v11 = [v10 sessionContext];
  [v10 extensionDidStop:v11];
}

- (void)dealloc
{
  id v3 = [(NEAgentExtension *)self sendFailedTimer];

  if (v3)
  {
    uint64_t v4 = [(NEAgentExtension *)self sendFailedTimer];
    dispatch_source_cancel(v4);

    [(NEAgentExtension *)self setSendFailedTimer:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)NEAgentExtension;
  [(NEAgentExtension *)&v5 dealloc];
}

- (NEAgentExtension)initWithPluginType:(id)a3 pluginClass:(int64_t)a4 pluginEndpoint:(id)a5 pluginProcessIdentity:(id)a6 queue:(id)a7 factory:(id)a8
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v31.receiver = self;
  v31.super_class = (Class)NEAgentExtension;
  __int16 v20 = [(NEAgentExtension *)&v31 init];
  id v21 = v20;
  if (v20)
  {
    objc_storeWeak((id *)&v20->_managerObjectFactory, v19);
    objc_storeStrong((id *)&v21->_queue, a7);
    id v22 = objc_alloc(MEMORY[0x1E4F1C978]);
    id v23 = [v17 uuid];
    uint64_t v24 = objc_msgSend(v22, "initWithObjects:", v23, 0);
    extensionUUIDs = v21->_extensionUUIDs;
    v21->_extensionUUIDs = (NSArray *)v24;

    objc_storeStrong((id *)&v21->_pluginType, a3);
    objc_storeStrong((id *)&v21->_extensionIdentifier, a3);
    id v26 = 0;
    switch(a4)
    {
      case 2:
        uint64_t v27 = NEExtensionAppProxyProviderHostContext;
        goto LABEL_7;
      case 3:
        uint64_t v27 = NEExtensionDNSProxyProviderHostContext;
        goto LABEL_7;
      case 5:
        uint64_t v27 = NEExtensionPacketTunnelProviderHostContext;
        goto LABEL_7;
      case 7:
        uint64_t v27 = NEExtensionAppPushProviderHostContext;
LABEL_7:
        __int16 v28 = -[NEExtensionProviderHostContext initWithVendorEndpoint:processIdentity:delegate:]((id *)[v27 alloc], v16, v17, v21);
        sessionContext = v21->_sessionContext;
        v21->_sessionContext = (NEExtensionProviderHostContext *)v28;

        if (v21->_sessionContext) {
          goto LABEL_8;
        }
        id v26 = 0;
        break;
      default:
        break;
    }
  }
  else
  {
LABEL_8:
    id v26 = v21;
  }

  return v26;
}

- (NEAgentExtension)initWithPluginType:(id)a3 pluginClass:(int64_t)a4 pluginInfo:(id)a5 queue:(id)a6 factory:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v28.receiver = self;
  v28.super_class = (Class)NEAgentExtension;
  id v17 = [(NEAgentExtension *)&v28 init];
  if (v17)
  {
    id v18 = [v14 objectForKeyedSubscript:@"extension-identifier"];
    id v19 = +[NELaunchServices pluginProxyWithIdentifier:v18 type:v13 pluginClass:a4 extensionPoint:0];

    if (!v19)
    {
      id v26 = 0;
      goto LABEL_6;
    }
    objc_storeWeak((id *)&v17->_managerObjectFactory, v16);
    objc_storeStrong((id *)&v17->_queue, a6);
    uint64_t v20 = [v19 pluginIdentifier];
    extensionIdentifier = v17->_extensionIdentifier;
    v17->_extensionIdentifier = (NSString *)v20;

    uint64_t v22 = [v19 machOUUIDs];
    extensionUUIDs = v17->_extensionUUIDs;
    v17->_extensionUUIDs = (NSArray *)v22;

    objc_storeStrong((id *)&v17->_pluginType, a3);
    uint64_t v24 = +[NELaunchServices pluginClassToExtensionPoint:a4];
    extensionPointIdentifier = v17->_extensionPointIdentifier;
    v17->_extensionPointIdentifier = (NSString *)v24;
  }
  id v26 = v17;
LABEL_6:

  return v26;
}

@end