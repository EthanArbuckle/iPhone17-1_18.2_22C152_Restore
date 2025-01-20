@interface NEAgentFilterExtension
+ (BOOL)authenticateFlowWithState:(cfil_crypto_state *)a3 crypto_key:(id)a4 flow:(id)a5 salt:(unsigned int)a6 isKernelSocket:(BOOL)a7;
- (NEAgentFilterExtension)initWithPluginType:(id)a3 pluginClass:(int64_t)a4 pluginEndpoint:(id)a5 pluginProcessIdentity:(id)a6 queue:(id)a7 factory:(id)a8;
- (NEAgentFilterExtension)initWithPluginType:(id)a3 pluginClass:(int64_t)a4 pluginInfo:(id)a5 queue:(id)a6 factory:(id)a7;
- (NSArray)uuids;
- (NSObject)generateClientKey:(int)a3 salt:;
- (NSXPCInterface)driverInterface;
- (NSXPCInterface)managerInterface;
- (uint64_t)copyProcessIdentities;
- (unsigned)sanitizeFilterFlow:(unsigned int *)a1;
- (void)applySettings:(id)a3 completionHandler:(id)a4;
- (void)cleanupControlExtensionWithRequestIdentifier:(void *)a1;
- (void)cleanupDataExtensionWithRequestIdentifier:(void *)a1;
- (void)cleanupOnStartFailure;
- (void)createPacketChannelForExtension:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)extension:(id)a3 didFailWithError:(id)a4;
- (void)extension:(id)a3 didStartWithError:(id)a4;
- (void)extensionDidStop:(id)a3;
- (void)fetchCurrentRulesForFlow:(id)a3 completionHandler:(id)a4;
- (void)getFilterClientConnectionWithCompletionHandler:(int)a3 completionHandler:(id)a4;
- (void)handleAppsUninstalled:(id)a3;
- (void)handleAppsUpdateBegins:(id)a3;
- (void)handleAppsUpdateEnding:(id)a3;
- (void)handleAppsUpdateEnds:(id)a3;
- (void)handleCancel;
- (void)handleDisposeWithCompletionHandler:(id)a3;
- (void)handleExtensionExit:(void *)a1;
- (void)handleInitWithCompletionHandler:(id)a3;
- (void)handleStopCompleteWithError:(uint64_t)a1;
- (void)notifyRulesChanged;
- (void)provideRemediationMap:(id)a3;
- (void)provideURLAppendStringMap:(id)a3;
- (void)report:(id)a3;
- (void)sendBrowserContentFilterServerRequest;
- (void)sendFilterStatus:(uint64_t)a3 withError:;
- (void)sendSocketContentFilterRequest;
- (void)sleepWithCompletionHandler:(id)a3;
- (void)startFilter;
- (void)startWithConfiguration:(id)a3 completionHandler:(id)a4;
- (void)stopFilterExtensionWithReason:(unsigned char *)a1;
- (void)updateConfiguration:(id)a3;
- (void)wakeup;
@end

@implementation NEAgentFilterExtension

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pendingDisposeCompletion, 0);
  objc_storeStrong((id *)&self->_sendFailedTimer, 0);
  objc_storeStrong((id *)&self->_extensionUUIDs, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_clientListenerEndpoint, 0);
  objc_storeStrong((id *)&self->_controlExtensionIdentifier, 0);
  objc_storeStrong((id *)&self->_dataExtensionIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_controlSessionRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_dataSessionRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_controlSessionContext, 0);
  objc_storeStrong((id *)&self->_dataSessionContext, 0);
  objc_storeStrong((id *)&self->_controlExtension, 0);
  objc_storeStrong((id *)&self->_dataExtension, 0);
  objc_storeStrong((id *)&self->_pluginType, 0);

  objc_destroyWeak((id *)&self->_managerObjectFactory);
}

- (void)applySettings:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_managerObjectFactory);
  }
  else {
    id WeakRetained = 0;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__NEAgentFilterExtension_applySettings_completionHandler___block_invoke;
  v10[3] = &unk_1E5993618;
  v10[4] = self;
  v9 = [WeakRetained managerObjectWithErrorHandler:v10];

  [v9 applySettings:v6 completionHandler:v7];
}

void __58__NEAgentFilterExtension_applySettings_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = ne_log_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_error_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_ERROR, "Got an XPC error while applying filter settings: %@", (uint8_t *)&v5, 0xCu);
  }

  -[NEAgentFilterExtension sendFilterStatus:withError:](*(void *)(a1 + 32), 0, 1);
}

- (void)sendFilterStatus:(uint64_t)a3 withError:
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    id v7 = [WeakRetained managerObject];

    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"NEFilterErrorDomain" code:a3 userInfo:0];
    [v7 setStatus:a2 error:v6];
  }
}

- (void)createPacketChannelForExtension:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_managerObjectFactory);
  }
  else {
    id WeakRetained = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__NEAgentFilterExtension_createPacketChannelForExtension_completionHandler___block_invoke;
  v8[3] = &unk_1E5993618;
  v8[4] = self;
  id v7 = [WeakRetained managerObjectWithErrorHandler:v8];

  [v7 createPacketChannelWithCompletionHandler:v5];
}

void __76__NEAgentFilterExtension_createPacketChannelForExtension_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = ne_log_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_error_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_ERROR, "Got an XPC error while creating a packet filter channel: %@", (uint8_t *)&v5, 0xCu);
  }

  -[NEAgentFilterExtension sendFilterStatus:withError:](*(void *)(a1 + 32), 0, 1);
}

- (void)provideURLAppendStringMap:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 48, 1);
  }
  else {
    id Property = 0;
  }
  id v7 = Property;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    if (self) {
      id v10 = objc_getProperty(self, v9, 48, 1);
    }
    else {
      id v10 = 0;
    }
    [v10 provideURLAppendStringMap:v5];
  }
  else
  {
    v11 = ne_log_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      if (self) {
        objc_getProperty(self, v12, 48, 1);
      }
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      int v15 = 138412290;
      v16 = v14;
      _os_log_error_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_ERROR, "provideURLAppendStringMap called, but dataSessionContext is not a flow data provider: %@", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)provideRemediationMap:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 48, 1);
  }
  else {
    id Property = 0;
  }
  id v7 = Property;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    if (self) {
      id v10 = objc_getProperty(self, v9, 48, 1);
    }
    else {
      id v10 = 0;
    }
    [v10 provideRemediationMap:v5];
  }
  else
  {
    v11 = ne_log_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      if (self) {
        objc_getProperty(self, v12, 48, 1);
      }
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      int v15 = 138412290;
      v16 = v14;
      _os_log_error_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_ERROR, "provideRemediationMap called, but dataSessionContext is not a flow data provider: %@", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)notifyRulesChanged
{
  v2 = self;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self) {
    self = (NEAgentFilterExtension *)objc_getProperty(self, a2, 48, 1);
  }
  id v3 = self;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    if (v2) {
      id Property = objc_getProperty(v2, v5, 48, 1);
    }
    else {
      id Property = 0;
    }
    [Property handleRulesChanged];
  }
  else
  {
    id v7 = ne_log_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      if (v2) {
        objc_getProperty(v2, v8, 48, 1);
      }
      v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      int v11 = 138412290;
      v12 = v10;
      _os_log_error_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_ERROR, "notifyRulesChanged called, but dataSessionContext is not a flow data provider: %@", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)getFilterClientConnectionWithCompletionHandler:(int)a3 completionHandler:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (self) {
    id Property = objc_getProperty(self, v6, 48, 1);
  }
  else {
    id Property = 0;
  }
  id v9 = Property;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v12 = -[NEAgentFilterExtension generateClientKey:salt:]((uint64_t)self, a3, 0);
    if (!v12)
    {
      uint64_t v13 = ne_log_obj();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v24) = a3;
        _os_log_error_impl(&dword_19DDAF000, v13, OS_LOG_TYPE_ERROR, "getFilterClientConnection called, but failed to create client crypto key for pid %d", buf, 8u);
      }

      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
    if (self) {
      v14 = objc_getProperty(self, v11, 80, 1);
    }
    else {
      v14 = 0;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __91__NEAgentFilterExtension_getFilterClientConnectionWithCompletionHandler_completionHandler___block_invoke;
    block[3] = &unk_1E5992CA0;
    block[4] = self;
    id v21 = v12;
    id v22 = v7;
    id v15 = v12;
    dispatch_async(v14, block);
  }
  else
  {
    v16 = ne_log_obj();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      if (self) {
        objc_getProperty(self, v17, 48, 1);
      }
      v18 = (objc_class *)objc_opt_class();
      v19 = NSStringFromClass(v18);
      *(_DWORD *)buf = 138412290;
      v24 = v19;
      _os_log_error_impl(&dword_19DDAF000, v16, OS_LOG_TYPE_ERROR, "getFilterClientConnection called, but dataSessionContext is not a flow data provider: %@", buf, 0xCu);
    }
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (NSObject)generateClientKey:(int)a3 salt:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
LABEL_13:
    id v7 = 0;
    goto LABEL_19;
  }
  if (!pid) {
    goto LABEL_5;
  }
  uint64_t v16 = 0;
  long long v14 = 0u;
  long long v15 = 0u;
  long long buffer = 0u;
  if (proc_pidinfo(pid, 17, 1uLL, &buffer, 56) != 56)
  {
    v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v11 = 67109120;
      int v12 = pid;
      _os_log_error_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_ERROR, "failed to get upid for pid %d", (uint8_t *)&v11, 8u);
    }

    goto LABEL_13;
  }
  a3 = v14;
LABEL_5:
  long long buffer = 0u;
  long long v14 = 0u;
  if ((ne_filter_crypto_generate_client_key() & 1) == 0)
  {
    id v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v11 = 67109120;
      int v12 = a3;
      _os_log_error_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_ERROR, "failed to generate client crypto key for salt %u", (uint8_t *)&v11, 8u);
    }
    goto LABEL_17;
  }
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&buffer length:32];
  if (!v5)
  {
    id v9 = ne_log_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 67109120;
      int v12 = a3;
      _os_log_error_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_ERROR, "failed to create NSData for client crypto key for salt %u", (uint8_t *)&v11, 8u);
    }

    id v6 = 0;
LABEL_17:
    id v7 = 0;
    goto LABEL_18;
  }
  id v6 = v5;
  id v7 = v6;
LABEL_18:

LABEL_19:

  return v7;
}

void __91__NEAgentFilterExtension_getFilterClientConnectionWithCompletionHandler_completionHandler___block_invoke(uint64_t a1, const char *a2)
{
  id v3 = *(void **)(a1 + 32);
  if (!v3) {
    goto LABEL_11;
  }
  if (!objc_getProperty(v3, a2, 104, 1))
  {
    id v10 = *(void **)(a1 + 32);
    if (v10)
    {
      id Property = objc_getProperty(v10, v4, 48, 1);
      uint64_t v12 = *(void *)(a1 + 32);
LABEL_10:
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __91__NEAgentFilterExtension_getFilterClientConnectionWithCompletionHandler_completionHandler___block_invoke_2;
      v13[3] = &unk_1E5992530;
      v13[4] = v12;
      id v15 = *(id *)(a1 + 48);
      id v14 = *(id *)(a1 + 40);
      [Property fetchProviderConnectionWithCompletionHandler:v13];

      return;
    }
LABEL_11:
    uint64_t v12 = 0;
    id Property = 0;
    goto LABEL_10;
  }
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = *(void **)(a1 + 32);
  if (v6) {
    id v7 = objc_getProperty(v6, v4, 104, 1);
  }
  else {
    id v7 = 0;
  }
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = *(void (**)(uint64_t, id, uint64_t))(v5 + 16);

  v9(v5, v7, v8);
}

void __91__NEAgentFilterExtension_getFilterClientConnectionWithCompletionHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id Property = objc_getProperty(v5, v3, 80, 1);
    uint64_t v7 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v7 = 0;
    id Property = 0;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __91__NEAgentFilterExtension_getFilterClientConnectionWithCompletionHandler_completionHandler___block_invoke_3;
  v9[3] = &unk_1E5992508;
  v9[4] = v7;
  id v10 = v4;
  id v12 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 40);
  id v8 = v4;
  dispatch_async(Property, v9);
}

uint64_t __91__NEAgentFilterExtension_getFilterClientConnectionWithCompletionHandler_completionHandler___block_invoke_3(uint64_t a1, const char *a2)
{
  id v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_setProperty_atomic(v3, a2, *(id *)(a1 + 40), 104);
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 56);
    if (v5) {
      id Property = objc_getProperty(v5, v4, 104, 1);
    }
    else {
      id Property = 0;
    }
  }
  else
  {
    id Property = 0;
    uint64_t v6 = *(void *)(a1 + 56);
  }
  uint64_t v8 = *(void *)(a1 + 48);
  id v9 = *(uint64_t (**)(uint64_t, id, uint64_t))(v6 + 16);

  return v9(v6, Property, v8);
}

- (void)report:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (!self)
  {
LABEL_18:

    goto LABEL_19;
  }
  if (!v4)
  {
    id v12 = ne_log_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v15 = "-[NEAgentFilterExtension sanitizeReport:]";
      _os_log_fault_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_FAULT, "%s called with null report", buf, 0xCu);
    }

    goto LABEL_18;
  }
  uint64_t v6 = [v4 flow];
  uint64_t v7 = -[NEAgentFilterExtension sanitizeFilterFlow:]((unsigned int *)self, v6);

  uint64_t v8 = [v5 action];
  if ((unint64_t)(v8 - 1) >= 4) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = v8;
  }
  uint64_t v10 = [v5 event];
  if ((unint64_t)(v10 - 1) >= 3) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = v10;
  }
  _cmd = 0;
  if (v7 && v9 && v11)
  {
    _cmd = (char *)-[NEFilterReport initWithFlow:action:event:]([NEFilterReport alloc], v7, v9, v11);
    objc_msgSend(_cmd, "setBytesInboundCount:", objc_msgSend(v7, "inBytes"));
    objc_msgSend(_cmd, "setBytesOutboundCount:", objc_msgSend(v7, "outBytes"));
  }

  if (_cmd)
  {
    objc_msgSend(objc_getProperty(self, _cmd, 56, 1), "handleReport:", _cmd);
    goto LABEL_20;
  }
LABEL_19:
  _cmd = 0;
LABEL_20:
}

- (unsigned)sanitizeFilterFlow:(unsigned int *)a1
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    id v4 = ne_log_obj();
    uint64_t v5 = v4;
    if (!v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)v31 = "-[NEAgentFilterExtension sanitizeFilterFlow:]";
        _os_log_fault_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_FAULT, "%s called with null flow", buf, 0xCu);
      }
      goto LABEL_18;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v31 = v3;
      _os_log_debug_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_DEBUG, "Sanitizing flow before: %@", buf, 0xCu);
    }

    uint64_t v5 = v3;
    id v7 = objc_getProperty(v5, v6, 128, 1);

    if (v7)
    {
      uint64_t v8 = -[NEAgentFilterExtension generateClientKey:salt:]((uint64_t)a1, [v5 pid], 0);
      uint64_t v9 = [v5 pid];
      if (!v8) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v8 = -[NEAgentFilterExtension generateClientKey:salt:]((uint64_t)a1, 0, a1[3]);
      uint64_t v9 = a1[3];
      if (!v8)
      {
LABEL_15:
        id v15 = ne_log_obj();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v31 = v9;
          _os_log_error_impl(&dword_19DDAF000, v15, OS_LOG_TYPE_ERROR, "Signature validation failed to generate client crypto key for salt %d", buf, 8u);
        }

LABEL_18:
        a1 = 0;
LABEL_19:

        goto LABEL_20;
      }
    }
    id v10 = v8;
    if (![v10 bytes] || objc_msgSend(v10, "length") != 32) {
      goto LABEL_15;
    }
    BOOL v11 = +[NEAgentFilterExtension authenticateFlowWithState:*((void *)a1 + 17) crypto_key:v10 flow:v5 salt:v9 isKernelSocket:v7 == 0];

    if (v11)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = v5;
        a1 = [v12 copy];
        objc_msgSend(a1, "setCrypto_signature:", 0);
        [a1 setPid:0];
        [a1 setEpid:0];
        [a1 setUuid:0];
        [a1 setEuuid:0];
        uint64_t v13 = ne_log_obj();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          if ((unint64_t)v12[25].isa + 1 >= 2) {
            v24 = @"kernel";
          }
          else {
            v24 = @"socket";
          }
          *(_DWORD *)buf = 138412546;
          *(void *)v31 = v24;
          *(_WORD *)&v31[8] = 2112;
          *(void *)&v31[10] = a1;
          _os_log_debug_impl(&dword_19DDAF000, v13, OS_LOG_TYPE_DEBUG, "Sanitized %@ socket flow: %@", buf, 0x16u);
        }

        id v14 = [v12 euuid];
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v18 = ne_log_obj();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            v26 = objc_opt_class();
            *(_DWORD *)buf = 138412290;
            *(void *)v31 = v26;
            id v27 = v26;
            _os_log_error_impl(&dword_19DDAF000, v18, OS_LOG_TYPE_ERROR, "Unknown flow class %@", buf, 0xCu);
          }
          a1 = 0;
          id v14 = 0;
          goto LABEL_35;
        }
        a1 = [v5 copy];
        objc_msgSend(a1, "setCrypto_signature:", 0);
        [a1 setPid:0];
        [a1 setEpid:0];
        [a1 setRequest:0];
        [a1 setResponse:0];
        [a1 setParentURL:0];
        id v12 = ne_log_obj();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v31 = a1;
          _os_log_debug_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_DEBUG, "Sanitized browser flow: %@", buf, 0xCu);
        }
        id v14 = 0;
      }

      if (!a1)
      {
LABEL_36:
        uint64_t v5 = v14;
        v23 = ne_log_obj();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v31 = a1;
          _os_log_debug_impl(&dword_19DDAF000, v23, OS_LOG_TYPE_DEBUG, "Sanitizing flow after: %@", buf, 0xCu);
        }

        goto LABEL_19;
      }
      uint64_t v17 = [a1 URL];
      v18 = trimURL(v17);

      [a1 setURL:v18];
      v19 = [a1 sourceAppIdentifier];
      v20 = ne_log_obj();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        int v25 = [v5 pid];
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v31 = v25;
        *(_WORD *)&v31[4] = 2112;
        *(void *)&v31[6] = v14;
        *(_WORD *)&v31[14] = 2112;
        *(void *)&v31[16] = v19;
        _os_log_debug_impl(&dword_19DDAF000, v20, OS_LOG_TYPE_DEBUG, "LOOKUP: Sanitization (2) looking up pid %d, euuid %@, bundle id: %@", buf, 0x1Cu);
      }

      id v21 = +[NEAppInfoCache sharedAppInfoCache]();
      int v22 = [v5 pid];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __45__NEAgentFilterExtension_sanitizeFilterFlow___block_invoke;
      v28[3] = &unk_1E5992560;
      a1 = a1;
      v29 = a1;
      -[NEAppInfoCache appInfoForPid:UUID:bundleID:completionHandler:](v21, v22, v14, v19, v28);

LABEL_35:
      goto LABEL_36;
    }
    a1 = 0;
  }
LABEL_20:

  return a1;
}

void __45__NEAgentFilterExtension_sanitizeFilterFlow___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v5 = v3[3];
    [*(id *)(a1 + 32) setSourceAppIdentifier:v5];

    id v6 = v4[4];
    [*(id *)(a1 + 32) setSourceAppVersion:v6];

    id v7 = v4[5];
    [*(id *)(a1 + 32) setSourceAppUniqueIdentifier:v7];
  }
  else
  {
    id v7 = ne_log_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_error_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_ERROR, "Could not find app info for flow", v9, 2u);
    }
  }

  uint64_t v8 = [*(id *)(a1 + 32) sourceAppVersion];

  if (!v8) {
    [*(id *)(a1 + 32) setSourceAppVersion:&stru_1EF054CB8];
  }
}

- (void)fetchCurrentRulesForFlow:(id)a3 completionHandler:(id)a4
{
  id v10 = (void (**)(id, NEFilterControlVerdict *))a4;
  id v7 = -[NEAgentFilterExtension sanitizeFilterFlow:]((unsigned int *)self, a3);
  if (v7)
  {
    if (self) {
      id Property = objc_getProperty(self, v6, 56, 1);
    }
    else {
      id Property = 0;
    }
    [Property handleNewFlow:v7 completionHandler:v10];
  }
  else
  {
    uint64_t v9 = objc_alloc_init(NEFilterControlVerdict);
    v10[2](v10, v9);
  }
}

- (void)sendSocketContentFilterRequest
{
  v2 = self;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self) {
    self = (NEAgentFilterExtension *)objc_getProperty(self, a2, 48, 1);
  }
  id v3 = self;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    if (v2) {
      id WeakRetained = objc_loadWeakRetained((id *)&v2->_managerObjectFactory);
    }
    else {
      id WeakRetained = 0;
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __56__NEAgentFilterExtension_sendSocketContentFilterRequest__block_invoke;
    v12[3] = &unk_1E5993618;
    v12[4] = v2;
    id v6 = [WeakRetained managerObjectWithErrorHandler:v12];

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __56__NEAgentFilterExtension_sendSocketContentFilterRequest__block_invoke_65;
    v11[3] = &unk_1E59924E0;
    v11[4] = v2;
    [v6 createContentFilterSocketWithCompletionHandler:v11];
  }
  else
  {
    id v7 = ne_log_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      if (v2) {
        objc_getProperty(v2, v8, 48, 1);
      }
      uint64_t v9 = (objc_class *)objc_opt_class();
      id v10 = NSStringFromClass(v9);
      *(_DWORD *)buf = 138412290;
      id v14 = v10;
      _os_log_error_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_ERROR, "sendSocketContentFilterRequest called, but dataSessionContext is not a flow data provider: %@", buf, 0xCu);
    }
  }
}

void __56__NEAgentFilterExtension_sendSocketContentFilterRequest__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = ne_log_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_error_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_ERROR, "Got an XPC error while creating a content filter socket: %@", (uint8_t *)&v5, 0xCu);
  }

  -[NEAgentFilterExtension sendFilterStatus:withError:](*(void *)(a1 + 32), 0, 1);
}

void __56__NEAgentFilterExtension_sendSocketContentFilterRequest__block_invoke_65(uint64_t a1, void *a2)
{
  id v4 = a2;
  int v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id Property = objc_getProperty(v5, v3, 80, 1);
    uint64_t v7 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v7 = 0;
    id Property = 0;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__NEAgentFilterExtension_sendSocketContentFilterRequest__block_invoke_2;
  v9[3] = &unk_1E5992328;
  id v10 = v4;
  uint64_t v11 = v7;
  id v8 = v4;
  dispatch_async(Property, v9);
}

void __56__NEAgentFilterExtension_sendSocketContentFilterRequest__block_invoke_2(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    uint64_t v15 = ne_log_obj();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19DDAF000, v15, OS_LOG_TYPE_ERROR, "Failed to create a content filter socket", buf, 2u);
    }

    -[NEAgentFilterExtension sendFilterStatus:withError:](*(void *)(a1 + 40), 0, 1);
    return;
  }
  int v3 = [v2 fileDescriptor];
  uint64_t v4 = *(void *)(a1 + 40);
  if (!v4
    || (-[NEAgentFilterExtension generateClientKey:salt:](v4, 0, *(_DWORD *)(v4 + 12)),
        (int v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_ERROR, "sendSocketContentFilterRequest called, but failed to create client crypto key for kernel", buf, 2u);
    }
    uint64_t v17 = 0;
    goto LABEL_23;
  }
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = v5;
  id v8 = v7;
  if (!v6) {
    goto LABEL_19;
  }
  if (v3 < 0 || [v7 length] != 32)
  {
    uint64_t v16 = ne_log_obj();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    id v21 = "No control socket or invalid crypto key for sending crypto key";
    int v22 = buf;
    v23 = v16;
    uint32_t v24 = 2;
LABEL_32:
    _os_log_error_impl(&dword_19DDAF000, v23, OS_LOG_TYPE_ERROR, v21, v22, v24);
    goto LABEL_18;
  }
  *(_OWORD *)buf = xmmword_19DF9BF60;
  uint64_t v27 = 0;
  uint64_t v9 = (long long *)[v8 bytes];
  unint64_t v10 = 0;
  long long v11 = v9[1];
  long long v28 = *v9;
  long long v29 = v11;
  while (1)
  {
    ssize_t v12 = write(v3, &buf[v10], 56 - v10);
    uint64_t v13 = __error();
    if (v12 < 1) {
      break;
    }
    v10 += v12;
LABEL_12:
    if (v10 >= 0x38) {
      goto LABEL_19;
    }
  }
  if (!v12) {
    goto LABEL_12;
  }
  int v14 = *v13;
  if (*v13 == 35) {
    goto LABEL_12;
  }
  v20 = ne_log_obj();
  uint64_t v16 = v20;
  if (v14 != 2)
  {
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    LODWORD(v25) = 136315138;
    *(void *)((char *)&v25 + 4) = strerror(v14);
    id v21 = "Write operation on the control socket failed while sending the crypto key: (%s)";
    int v22 = (uint8_t *)&v25;
    v23 = v16;
    uint32_t v24 = 12;
    goto LABEL_32;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v25) = 0;
    _os_log_debug_impl(&dword_19DDAF000, v16, OS_LOG_TYPE_DEBUG, "Failed to send crypto key to kernel", (uint8_t *)&v25, 2u);
  }
LABEL_18:

LABEL_19:
  uint64_t v17 = v8;
LABEL_23:

  id Property = *(id *)(a1 + 40);
  if (Property) {
    id Property = objc_getProperty(Property, v18, 48, 1);
  }
  objc_msgSend(Property, "providerControlSocketFileHandle:", *(void *)(a1 + 32), v25, *(void *)buf, *(void *)&buf[8], v27, v28, v29, v30);
}

- (void)sendBrowserContentFilterServerRequest
{
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_managerObjectFactory);
  }
  else {
    id WeakRetained = 0;
  }
  id v3 = [WeakRetained managerObject];

  [v3 acceptAgentClients];
}

- (void)extensionDidStop:(id)a3
{
  uint64_t v4 = (const char *)a3;
  int v5 = v4;
  if (self)
  {
    ptrdiff_t v6 = 48;
    _cmd = v4;
    id Property = (const char *)objc_getProperty(self, v4, 48, 1);
    id v8 = _cmd;
    if (Property == _cmd
      || (ptrdiff_t v6 = 56, v9 = (const char *)objc_getProperty(self, _cmd, 56, 1), v8 = _cmd, v9 == _cmd))
    {
      objc_setProperty_atomic(self, v8, 0, v6);
    }
    id v10 = objc_getProperty(self, v8, 48, 1);
    if (v10)
    {

LABEL_7:
      int v5 = _cmd;
      goto LABEL_9;
    }
    uint64_t v4 = (const char *)objc_getProperty(self, v11, 56, 1);
    int v5 = _cmd;
    if (!v4)
    {
      uint64_t v4 = (const char *)objc_getProperty(self, _cmd, 144, 1);
      int v5 = _cmd;
      if (v4)
      {
        ssize_t v12 = (void (**)(void))objc_getProperty(self, _cmd, 144, 1);
        v12[2]();
        objc_setProperty_atomic_copy(self, v13, 0, 144);
        goto LABEL_7;
      }
    }
  }
LABEL_9:

  MEMORY[0x1F41817F8](v4, v5);
}

- (void)extension:(id)a3 didFailWithError:(id)a4
{
  _cmd = (char *)a3;
  id v7 = a4;
  if (!self) {
    goto LABEL_5;
  }
  if (objc_getProperty(self, v6, 48, 1) == _cmd)
  {
    ptrdiff_t v9 = 64;
    id v8 = objc_getProperty(self, _cmd, 64, 1);
    ptrdiff_t v11 = 48;
  }
  else
  {
    if (objc_getProperty(self, _cmd, 56, 1) == _cmd)
    {
      ptrdiff_t v9 = 72;
      id v8 = objc_getProperty(self, _cmd, 72, 1);
    }
    else
    {
      if (_cmd)
      {
LABEL_5:
        id v8 = 0;
        goto LABEL_11;
      }
      objc_setProperty_atomic(self, 0, 0, 48);
      objc_setProperty_atomic(self, v12, 0, 64);
      id v8 = 0;
      ptrdiff_t v9 = 72;
    }
    ptrdiff_t v11 = 56;
  }
  objc_setProperty_atomic(self, v10, 0, v11);
  objc_setProperty_atomic(self, v13, 0, v9);
LABEL_11:
  -[NEAgentFilterExtension handleExtensionExit:](self, v8);
}

- (void)handleExtensionExit:(void *)a1
{
  id v4 = a2;
  if (a1)
  {
    id Property = objc_getProperty(a1, v3, 80, 1);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __46__NEAgentFilterExtension_handleExtensionExit___block_invoke;
    v6[3] = &unk_1E5992328;
    v6[4] = a1;
    id v7 = v4;
    dispatch_async(Property, v6);
  }
}

void __46__NEAgentFilterExtension_handleExtensionExit___block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = *(unsigned char **)(a1 + 32);
  if (!v3)
  {
LABEL_4:
    id v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = v5;
      _os_log_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_DEFAULT, "Scheduing timer for Filter extension failure/exit for %@", buf, 0xCu);
    }

    id v7 = *(void **)(a1 + 32);
    if (v7)
    {
      id Property = objc_getProperty(v7, v6, 80, 1);
      uint64_t v9 = *(void *)(a1 + 32);
    }
    else
    {
      uint64_t v9 = 0;
      id Property = 0;
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __46__NEAgentFilterExtension_handleExtensionExit___block_invoke_44;
    v15[3] = &unk_1E5992328;
    v15[4] = v9;
    id v16 = *(id *)(a1 + 40);
    ptrdiff_t v11 = NECreateTimerSource(Property, 5, v15);
    SEL v12 = *(void **)(a1 + 32);
    if (v12) {
      objc_setProperty_atomic(v12, v10, v11, 128);
    }

    return;
  }
  if ((v3[10] & 1) == 0)
  {
    if (objc_getProperty(v3, a2, 128, 1)) {
      return;
    }
    goto LABEL_4;
  }
  SEL v13 = ne_log_obj();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    uint64_t v18 = v14;
    _os_log_impl(&dword_19DDAF000, v13, OS_LOG_TYPE_DEFAULT, "Filter App updating - ignore extension failure/exit for %@", buf, 0xCu);
  }
}

void __46__NEAgentFilterExtension_handleExtensionExit___block_invoke_44(uint64_t a1, const char *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = *(void **)(a1 + 32);
  if (!v3) {
    goto LABEL_9;
  }
  if (objc_getProperty(v3, a2, 128, 1))
  {
    id Property = *(NSObject **)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v4, 128, 1);
    }
    dispatch_source_cancel(Property);
    id v7 = *(void **)(a1 + 32);
    if (!v7) {
      goto LABEL_9;
    }
    objc_setProperty_atomic(v7, v6, 0, 128);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (!v8 || (*(unsigned char *)(v8 + 10) & 1) == 0)
  {
LABEL_9:
    uint64_t v9 = ne_log_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 40);
      int v14 = 138412290;
      uint64_t v15 = v13;
      _os_log_error_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_ERROR, "Handle Filter extension failure/exit for %@ - disconnect session", (uint8_t *)&v14, 0xCu);
    }

    uint64_t v10 = *(void *)(a1 + 32);
    if (v10) {
      -[NEAgentFilterExtension sendFilterStatus:withError:](v10, 0, 1);
    }
    return;
  }
  ptrdiff_t v11 = ne_log_obj();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(a1 + 40);
    int v14 = 138412290;
    uint64_t v15 = v12;
    _os_log_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_DEFAULT, "Filter App updating - ignore extension failure/exit for %@", (uint8_t *)&v14, 0xCu);
  }
}

- (void)extension:(id)a3 didStartWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = v7;
  if (self)
  {
    if (objc_getProperty(self, v8, 48, 1) == v6)
    {
      if (v9)
      {
LABEL_10:
        uint64_t v13 = self;
        uint64_t v14 = 0;
        uint64_t v15 = 1;
LABEL_13:
        -[NEAgentFilterExtension sendFilterStatus:withError:]((uint64_t)v13, v14, v15);
        goto LABEL_14;
      }
      if (self->_controlExtensionInitialized)
      {
        objc_initWeak(&location, self);
        id v17 = objc_getProperty(self, v16, 56, 1);
        id v19 = objc_getProperty(self, v18, 112, 1);
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __54__NEAgentFilterExtension_extension_didStartWithError___block_invoke;
        v20[3] = &unk_1E59924B8;
        objc_copyWeak(&v21, &location);
        [v17 startFilterWithOptions:v19 completionHandler:v20];

        objc_destroyWeak(&v21);
        objc_destroyWeak(&location);
        goto LABEL_14;
      }
LABEL_12:
      uint64_t v13 = self;
      uint64_t v14 = 2;
      uint64_t v15 = 0;
      goto LABEL_13;
    }
    id Property = objc_getProperty(self, v10, 56, 1);
  }
  else
  {
    if (!v6)
    {
      if (!v7) {
        goto LABEL_14;
      }
      goto LABEL_10;
    }
    id Property = 0;
  }
  if (Property == v6)
  {
    if (v9)
    {
      if (self) {
        id v12 = objc_getProperty(self, v8, 48, 1);
      }
      else {
        id v12 = 0;
      }
      [v12 stopWithReason:7];
      goto LABEL_10;
    }
    goto LABEL_12;
  }
LABEL_14:
}

void __54__NEAgentFilterExtension_extension_didStartWithError___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  -[NEAgentFilterExtension handleStopCompleteWithError:]((uint64_t)WeakRetained, v3);
}

- (void)handleStopCompleteWithError:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    BOOL v4 = v3 != 0;
    id v12 = v3;
    if (v3)
    {
      uint64_t v5 = [v3 domain];
      if (v5
        && (id v6 = (void *)v5,
            [v12 domain],
            id v7 = objc_claimAutoreleasedReturnValue(),
            int v8 = [v7 isEqualToString:@"NEAgentErrorDomain"],
            v7,
            v6,
            v8))
      {
        if ([v12 code] == 3)
        {
          uint64_t v9 = 0;
          uint64_t v10 = 4;
        }
        else
        {
          uint64_t v11 = [v12 code];
          uint64_t v10 = 0;
          if (v11 == 2) {
            uint64_t v9 = 2;
          }
          else {
            uint64_t v9 = v4;
          }
        }
      }
      else
      {
        uint64_t v10 = 0;
        uint64_t v9 = 1;
      }
    }
    else
    {
      uint64_t v10 = 0;
      uint64_t v9 = 0;
    }
    -[NEAgentFilterExtension sendFilterStatus:withError:](a1, v10, v9);
    id v3 = v12;
  }
}

- (void)updateConfiguration:(id)a3
{
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 80, 1);
  }
  else {
    id Property = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__NEAgentFilterExtension_updateConfiguration___block_invoke;
  v8[3] = &unk_1E5992328;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(Property, v8);
}

void __46__NEAgentFilterExtension_updateConfiguration___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 40) contentFilter];
  BOOL v4 = [v2 provider];
  id v5 = *(void **)(a1 + 32);
  if (v5) {
    objc_setProperty_atomic(v5, v3, v4, 112);
  }

  id v6 = *(unsigned char **)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  if (v6)
  {
    if (v6[8])
    {
      id v8 = objc_getProperty(v6, v7, 48, 1);
      objc_msgSend(v8, "setConfiguration:extensionIdentifier:", v12, objc_getProperty(v6, v9, 88, 1));
    }
    if (v6[9])
    {
      id v10 = objc_getProperty(v6, v7, 56, 1);
      objc_msgSend(v10, "setConfiguration:extensionIdentifier:", v12, objc_getProperty(v6, v11, 96, 1));
    }
  }
}

- (void)wakeup
{
  if (self)
  {
    if (self->_dataExtensionInitialized)
    {
      objc_msgSend(objc_getProperty(self, a2, 48, 1), "wake");
      id v4 = objc_getProperty(self, v3, 40, 1);
      if (v4)
      {
        BOOL controlExtensionInitialized = self->_controlExtensionInitialized;

        if (controlExtensionInitialized)
        {
          id Property = objc_getProperty(self, v6, 56, 1);
          [Property wake];
        }
      }
    }
  }
}

- (void)sleepWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self && self->_dataExtensionInitialized)
  {
    id Property = objc_getProperty(self, v5, 48, 1);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __53__NEAgentFilterExtension_sleepWithCompletionHandler___block_invoke;
    v8[3] = &unk_1E59936F8;
    v8[4] = self;
    id v9 = v6;
    [Property sleepWithCompletionHandler:v8];
  }
  else
  {
    (*((void (**)(id))v4 + 2))(v4);
  }
}

void __53__NEAgentFilterExtension_sleepWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v16 = v3;
    _os_log_impl(&dword_19DDAF000, v2, OS_LOG_TYPE_INFO, "%@: Data Extension sleep event complete", buf, 0xCu);
  }

  id v5 = *(void **)(a1 + 32);
  if (!v5) {
    goto LABEL_7;
  }
  id v6 = objc_getProperty(v5, v4, 40, 1);
  if (!v6) {
    goto LABEL_7;
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (!v7)
  {

    goto LABEL_7;
  }
  char v8 = *(unsigned char *)(v7 + 9);

  if ((v8 & 1) == 0)
  {
LABEL_7:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    return;
  }
  id v10 = *(void **)(a1 + 32);
  if (v10)
  {
    id Property = objc_getProperty(v10, v9, 56, 1);
    uint64_t v12 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v12 = 0;
    id Property = 0;
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__NEAgentFilterExtension_sleepWithCompletionHandler___block_invoke_64;
  v13[3] = &unk_1E59936F8;
  v13[4] = v12;
  id v14 = *(id *)(a1 + 40);
  [Property sleepWithCompletionHandler:v13];
}

uint64_t __53__NEAgentFilterExtension_sleepWithCompletionHandler___block_invoke_64(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_19DDAF000, v2, OS_LOG_TYPE_INFO, "%@: Control Extension sleep event complete.", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)startFilter
{
  v2 = self;
  if (self) {
    self = (NEAgentFilterExtension *)objc_getProperty(self, a2, 80, 1);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__NEAgentFilterExtension_startFilter__block_invoke;
  block[3] = &unk_1E59932C0;
  block[4] = v2;
  dispatch_async(&self->super, block);
}

void __37__NEAgentFilterExtension_startFilter__block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v3 = *(unsigned char **)(a1 + 32);
  if (!v3 || (v3[8] & 1) == 0) {
    goto LABEL_6;
  }
  id v4 = objc_getProperty(v3, a2, 40, 1);
  if (v4)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (!v6)
    {

      goto LABEL_6;
    }
    char v7 = *(unsigned char *)(v6 + 9);

    if ((v7 & 1) == 0)
    {
LABEL_6:
      char v8 = ne_log_obj();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v17[0]) = 0;
        _os_log_error_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_ERROR, "Data or Control Extension not initialized.", (uint8_t *)v17, 2u);
      }

      -[NEAgentFilterExtension sendFilterStatus:withError:](*(void *)(a1 + 32), 0, 1);
      return;
    }
  }
  id v9 = *(unsigned char **)(a1 + 32);
  if (v9)
  {
    char v10 = v9[9];
    id Property = objc_getProperty(v9, v5, 112, 1);
    if (Property) {
      Property[11] = v10 & 1;
    }
    uint64_t v12 = *(void **)(a1 + 32);
    if (v12)
    {
      objc_initWeak(&location, *(id *)(a1 + 32));
      id v14 = objc_getProperty(v12, v13, 48, 1);
      id v16 = objc_getProperty(v12, v15, 112, 1);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __46__NEAgentFilterExtension_startFilterExtension__block_invoke;
      v17[3] = &unk_1E59924B8;
      objc_copyWeak(&v18, &location);
      [v14 startFilterWithOptions:v16 completionHandler:v17];

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
  }
}

void __46__NEAgentFilterExtension_startFilterExtension__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  -[NEAgentFilterExtension handleStopCompleteWithError:]((uint64_t)WeakRetained, v3);
}

- (void)startWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__NEAgentFilterExtension_startWithConfiguration_completionHandler___block_invoke;
  v14[3] = &unk_1E5992440;
  id v15 = v6;
  id v16 = v7;
  v14[4] = self;
  id v8 = v6;
  id v9 = v7;
  id v10 = v8;
  uint64_t v12 = v14;
  if (self)
  {
    id Property = objc_getProperty(self, v11, 80, 1);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke;
    block[3] = &unk_1E5992CA0;
    block[4] = self;
    id v19 = v12;
    id v18 = v10;
    dispatch_async(Property, block);
  }
}

void __67__NEAgentFilterExtension_startWithConfiguration_completionHandler___block_invoke(uint64_t a1, const char *a2)
{
  id v3 = *(unsigned char **)(a1 + 32);
  if (a2)
  {
    if (v3 && objc_getProperty(v3, a2, 40, 1))
    {
      id v4 = *(void **)(a1 + 32);
      int v5 = *(void **)(a1 + 40);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __67__NEAgentFilterExtension_startWithConfiguration_completionHandler___block_invoke_63;
      v14[3] = &unk_1E5992300;
      v14[4] = v4;
      id v15 = *(id *)(a1 + 48);
      id v6 = v5;
      id v8 = v14;
      if (v4)
      {
        id Property = objc_getProperty(v4, v7, 80, 1);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __83__NEAgentFilterExtension_startControlExtensionWithConfiguration_completionHandler___block_invoke;
        block[3] = &unk_1E5992CA0;
        block[4] = v4;
        id v18 = v8;
        id v17 = v6;
        dispatch_async(Property, block);
      }
    }
    else
    {
      SEL v11 = ne_log_obj();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(block[0]) = 0;
        _os_log_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_DEFAULT, "Control Extension not present", (uint8_t *)block, 2u);
      }

      uint64_t v12 = *(void *)(a1 + 48);
      SEL v13 = (void *)-[NEAgentFilterExtension copyProcessIdentities](*(void **)(a1 + 32));
      (*(void (**)(uint64_t, uint64_t, void *))(v12 + 16))(v12, 1, v13);
    }
  }
  else
  {
    [(NEAgentFilterExtension *)v3 cleanupOnStartFailure];
    id v10 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v10();
  }
}

void __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke(id *a1, const char *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a1[4];
  if (!v3) {
    goto LABEL_16;
  }
  id Property = objc_getProperty(v3, a2, 48, 1);
  id v6 = a1[4];
  if (Property)
  {
    if (v6)
    {
      id v6 = objc_getProperty(a1[4], v5, 48, 1);
      id v7 = a1[4];
    }
    else
    {
      id v7 = 0;
    }
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke_2;
    v22[3] = &unk_1E5992440;
    v22[4] = v7;
    id v24 = a1[6];
    id v23 = a1[5];
    [v6 createWithCompletionHandler:v22];

    return;
  }
  if (v6)
  {
    objc_setProperty_atomic(a1[4], v5, 0, 104);
    v6[4] = 0;
    id v8 = a1[4];
  }
  else
  {
LABEL_16:
    id v8 = 0;
  }
  objc_initWeak(&location, v8);
  id v9 = ne_log_obj();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = a1[4];
    if (v11) {
      id v11 = objc_getProperty(v11, v10, 32, 1);
    }
    id v12 = v11;
    SEL v13 = [v12 identifier];
    *(_DWORD *)buf = 138412290;
    v26 = v13;
    _os_log_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_DEFAULT, "Beginning data extension request with extension %@", buf, 0xCu);
  }
  id v15 = a1[4];
  if (v15) {
    id v15 = objc_getProperty(v15, v14, 32, 1);
  }
  id v16 = v15;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke_56;
  v17[3] = &unk_1E5992490;
  objc_copyWeak(&v20, &location);
  id v19 = a1[6];
  id v18 = a1[5];
  [v16 beginExtensionRequestWithInputItems:0 completion:v17];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke_2(uint64_t a1, const char *a2)
{
  char v2 = (char)a2;
  id v4 = *(void **)(a1 + 32);
  if (v4) {
    id Property = objc_getProperty(v4, a2, 80, 1);
  }
  else {
    id Property = 0;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke_3;
  v9[3] = &unk_1E5992418;
  char v12 = v2;
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(a1 + 40);
  id v11 = v6;
  void v9[4] = v7;
  id v10 = v8;
  dispatch_async(Property, v9);
}

void __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke_56(id *a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v8 = ne_log_obj();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (WeakRetained)
  {
    if (v9)
    {
      id v11 = objc_msgSend(objc_getProperty(WeakRetained, v10, 32, 1), "identifier");
      *(_DWORD *)buf = 138412546;
      id v21 = v11;
      __int16 v22 = 2112;
      id v23 = v5;
      _os_log_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_DEFAULT, "Extension request with data extension %@ started with identifier %@", buf, 0x16u);
    }
    id Property = objc_getProperty(WeakRetained, v12, 80, 1);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke_57;
    block[3] = &unk_1E5992468;
    id v15 = v6;
    id v16 = WeakRetained;
    id v19 = a1[5];
    id v17 = v5;
    id v18 = a1[4];
    dispatch_async(Property, block);
  }
  else
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_DEFAULT, "strongself is nil after data extension request started", buf, 2u);
    }

    (*((void (**)(void))a1[5] + 2))();
  }
}

void __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke_57(uint64_t a1, const char *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id v3 = ne_log_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id Property = *(id *)(a1 + 40);
      if (Property) {
        id Property = objc_getProperty(Property, v4, 88, 1);
      }
      uint64_t v18 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      id v25 = Property;
      __int16 v26 = 2112;
      uint64_t v27 = v18;
      _os_log_error_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_ERROR, "Failed to start the data extension %@: %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    id v5 = *(id *)(a1 + 40);
    if (v5) {
      id v5 = objc_getProperty(v5, a2, 32, 1);
    }
    uint64_t v7 = -[NSExtension extensionHostContextForUUID:](v5, *(void *)(a1 + 48));
    if (v7)
    {
      id v8 = *(void **)(a1 + 40);
      if (v8)
      {
        objc_setProperty_atomic(v8, v6, *(id *)(a1 + 48), 64);
        id v10 = *(void **)(a1 + 40);
        if (v10)
        {
          objc_setProperty_atomic(v10, v9, v7, 48);
          SEL v12 = *(void **)(a1 + 40);
          if (v12)
          {
            SEL v13 = (id *)objc_getProperty(*(id *)(a1 + 40), v11, 48, 1);
            if (v13) {
              objc_storeWeak(v13 + 7, v12);
            }
          }
        }
      }
      id v14 = *(unsigned char **)(a1 + 40);
      if (v14)
      {
        v14[8] = 1;
        id v14 = *(unsigned char **)(a1 + 40);
      }
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke_58;
      v20[3] = &unk_1E59923F0;
      id v21 = v14;
      id v22 = *(id *)(a1 + 56);
      id v23 = *(id *)(a1 + 64);
      [v7 validateWithCompletionHandler:v20];
    }
    else
    {
      id v15 = ne_log_obj();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v19 = *(id *)(a1 + 40);
        if (v19) {
          id v19 = objc_getProperty(v19, v16, 88, 1);
        }
        *(_DWORD *)buf = 138412290;
        id v25 = v19;
        _os_log_error_impl(&dword_19DDAF000, v15, OS_LOG_TYPE_ERROR, "Failed to get the host context for data extension %@", buf, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
  }
}

void __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke_58(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id Property = objc_getProperty(v5, v3, 80, 1);
    uint64_t v7 = *(void **)(a1 + 32);
  }
  else
  {
    uint64_t v7 = 0;
    id Property = 0;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke_2_59;
  v9[3] = &unk_1E5992508;
  id v10 = v4;
  id v11 = v7;
  id v12 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  id v8 = v4;
  dispatch_async(Property, v9);
}

uint64_t __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke_2_59(void *a1, const char *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a1[4])
  {
    id v3 = ne_log_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = a1[4];
      int v17 = 138412290;
      uint64_t v18 = v16;
      _os_log_error_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_ERROR, "Filter Data provider validation failed with error: %@", (uint8_t *)&v17, 0xCu);
    }

    return (*(uint64_t (**)(void))(a1[7] + 16))();
  }
  else
  {
    id Property = (id)a1[5];
    if (Property) {
      id Property = objc_getProperty(Property, a2, 48, 1);
    }
    id v7 = Property;
    id v8 = (void *)a1[5];
    uint64_t v9 = a1[6];
    if (v8) {
      id v10 = objc_getProperty(v8, v6, 88, 1);
    }
    else {
      id v10 = 0;
    }
    [v7 setConfiguration:v9 extensionIdentifier:v10];

    id v11 = [(id)a1[6] contentFilter];
    id v13 = [v11 provider];
    id v14 = (void *)a1[5];
    if (v14) {
      objc_setProperty_atomic(v14, v12, v13, 112);
    }

    id v15 = *(uint64_t (**)(void))(a1[7] + 16);
    return v15();
  }
}

void __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke_3(uint64_t a1, const char *a2)
{
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3)
    {
      *(unsigned char *)(v3 + 8) = 1;
      id v4 = *(void **)(a1 + 32);
      if (v4)
      {
        id Property = objc_getProperty(v4, a2, 48, 1);
        uint64_t v3 = *(void *)(a1 + 32);
LABEL_5:
        v7[0] = MEMORY[0x1E4F143A8];
        v7[1] = 3221225472;
        v7[2] = __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke_4;
        v7[3] = &unk_1E59923F0;
        v7[4] = v3;
        id v8 = *(id *)(a1 + 40);
        id v9 = *(id *)(a1 + 48);
        [Property validateWithCompletionHandler:v7];

        return;
      }
      uint64_t v3 = 0;
    }
    id Property = 0;
    goto LABEL_5;
  }
  id v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);

  v6();
}

void __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id Property = objc_getProperty(v5, v3, 80, 1);
    uint64_t v7 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v7 = 0;
    id Property = 0;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke_5;
  v9[3] = &unk_1E5992508;
  id v10 = v4;
  uint64_t v11 = v7;
  id v12 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  id v8 = v4;
  dispatch_async(Property, v9);
}

uint64_t __80__NEAgentFilterExtension_startDataExtensionWithConfiguration_completionHandler___block_invoke_5(void *a1, const char *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a1[4])
  {
    uint64_t v3 = ne_log_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = a1[4];
      int v17 = 138412290;
      uint64_t v18 = v16;
      _os_log_error_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_ERROR, "Filter provider validation failed: %@", (uint8_t *)&v17, 0xCu);
    }

    return (*(uint64_t (**)(void))(a1[7] + 16))();
  }
  else
  {
    id Property = (id)a1[5];
    if (Property) {
      id Property = objc_getProperty(Property, a2, 48, 1);
    }
    id v7 = Property;
    id v8 = (void *)a1[5];
    uint64_t v9 = a1[6];
    if (v8) {
      id v10 = objc_getProperty(v8, v6, 88, 1);
    }
    else {
      id v10 = 0;
    }
    [v7 setConfiguration:v9 extensionIdentifier:v10];

    uint64_t v11 = [(id)a1[6] contentFilter];
    id v13 = [v11 provider];
    id v14 = (void *)a1[5];
    if (v14) {
      objc_setProperty_atomic(v14, v12, v13, 112);
    }

    id v15 = *(uint64_t (**)(void))(a1[7] + 16);
    return v15();
  }
}

- (void)cleanupOnStartFailure
{
  if (a1)
  {
    if (objc_getProperty(a1, a2, 64, 1))
    {
      id v4 = objc_getProperty(a1, v3, 32, 1);
      objc_msgSend(v4, "cancelExtensionRequestWithIdentifier:", objc_getProperty(a1, v5, 64, 1));
    }
    if (objc_getProperty(a1, v3, 72, 1))
    {
      id v7 = objc_getProperty(a1, v6, 40, 1);
      objc_msgSend(v7, "cancelExtensionRequestWithIdentifier:", objc_getProperty(a1, v8, 72, 1));
    }
    objc_setProperty_atomic(a1, v6, 0, 48);
    objc_setProperty_atomic(a1, v9, 0, 64);
    a1[8] = 0;
    objc_setProperty_atomic(a1, v10, 0, 56);
    objc_setProperty_atomic(a1, v11, 0, 72);
    a1[9] = 0;
  }
}

- (uint64_t)copyProcessIdentities
{
  if (!a1) {
    return 0;
  }
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (objc_getProperty(a1, v3, 56, 1))
  {
    id Property = objc_getProperty(a1, v4, 56, 1);
    if (Property) {
      id Property = objc_getProperty(Property, v6, 64, 1);
    }
    id v7 = Property;
  }
  else
  {
    id v7 = 0;
  }
  if (!objc_getProperty(a1, v4, 48, 1))
  {
    id v11 = 0;
    if (v7) {
      goto LABEL_11;
    }
LABEL_14:
    id v12 = ne_log_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_DEFAULT, "No control extension process identity is available", buf, 2u);
    }

    if (v11) {
      goto LABEL_12;
    }
LABEL_17:
    id v13 = ne_log_obj();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_error_impl(&dword_19DDAF000, v13, OS_LOG_TYPE_ERROR, "No data extension process identity is available", v16, 2u);
    }

    goto LABEL_20;
  }
  id v9 = objc_getProperty(a1, v8, 48, 1);
  if (v9) {
    id v9 = objc_getProperty(v9, v10, 64, 1);
  }
  id v11 = v9;
  if (!v7) {
    goto LABEL_14;
  }
LABEL_11:
  [v2 addObject:v7];
  if (!v11) {
    goto LABEL_17;
  }
LABEL_12:
  [v2 addObject:v11];
LABEL_20:
  uint64_t v14 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v2];

  return v14;
}

void __67__NEAgentFilterExtension_startWithConfiguration_completionHandler___block_invoke_63(uint64_t a1, const char *a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v5 = (id)-[NEAgentFilterExtension copyProcessIdentities](*(void **)(a1 + 32));
    (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, 1, v5);
  }
  else
  {
    [(NEAgentFilterExtension *)*(unsigned char **)(a1 + 32) cleanupOnStartFailure];
    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
}

void __83__NEAgentFilterExtension_startControlExtensionWithConfiguration_completionHandler___block_invoke(id *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, a1[4]);
  id v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id Property = a1[4];
    if (Property) {
      id Property = objc_getProperty(Property, v3, 40, 1);
    }
    id v5 = Property;
    id v6 = [v5 identifier];
    *(_DWORD *)buf = 138412290;
    uint64_t v16 = v6;
    _os_log_impl(&dword_19DDAF000, v2, OS_LOG_TYPE_DEFAULT, "Beginning control extension request with extension %@", buf, 0xCu);
  }
  id v8 = a1[4];
  if (v8) {
    id v8 = objc_getProperty(v8, v7, 40, 1);
  }
  id v9 = v8;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83__NEAgentFilterExtension_startControlExtensionWithConfiguration_completionHandler___block_invoke_60;
  v10[3] = &unk_1E5992490;
  objc_copyWeak(&v13, &location);
  id v12 = a1[6];
  id v11 = a1[5];
  [v9 beginExtensionRequestWithInputItems:0 completion:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __83__NEAgentFilterExtension_startControlExtensionWithConfiguration_completionHandler___block_invoke_60(id *a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v8 = ne_log_obj();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (WeakRetained)
  {
    if (v9)
    {
      id v11 = objc_msgSend(objc_getProperty(WeakRetained, v10, 40, 1), "identifier");
      *(_DWORD *)buf = 138412546;
      id v21 = v11;
      __int16 v22 = 2112;
      id v23 = v5;
      _os_log_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_DEFAULT, "Extension request with control extension %@ started with identifier %@", buf, 0x16u);
    }
    id Property = objc_getProperty(WeakRetained, v12, 80, 1);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83__NEAgentFilterExtension_startControlExtensionWithConfiguration_completionHandler___block_invoke_61;
    block[3] = &unk_1E5992468;
    id v15 = v6;
    id v16 = WeakRetained;
    id v19 = a1[5];
    id v17 = v5;
    id v18 = a1[4];
    dispatch_async(Property, block);
  }
  else
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_DEFAULT, "strongself is nil after control extension request started", buf, 2u);
    }

    (*((void (**)(void))a1[5] + 2))();
  }
}

void __83__NEAgentFilterExtension_startControlExtensionWithConfiguration_completionHandler___block_invoke_61(uint64_t a1, const char *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    uint64_t v3 = ne_log_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id Property = *(id *)(a1 + 40);
      if (Property) {
        id Property = objc_getProperty(Property, v4, 96, 1);
      }
      uint64_t v18 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      id v25 = Property;
      __int16 v26 = 2112;
      uint64_t v27 = v18;
      _os_log_error_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_ERROR, "Failed to start control extension %@: %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    id v5 = *(id *)(a1 + 40);
    if (v5) {
      id v5 = objc_getProperty(v5, a2, 40, 1);
    }
    id v7 = -[NSExtension extensionHostContextForUUID:](v5, *(void *)(a1 + 48));
    if (v7)
    {
      id v8 = *(void **)(a1 + 40);
      if (v8)
      {
        objc_setProperty_atomic(v8, v6, *(id *)(a1 + 48), 72);
        SEL v10 = *(void **)(a1 + 40);
        if (v10)
        {
          objc_setProperty_atomic(v10, v9, v7, 56);
          SEL v12 = *(void **)(a1 + 40);
          if (v12)
          {
            id v13 = (id *)objc_getProperty(*(id *)(a1 + 40), v11, 56, 1);
            if (v13) {
              objc_storeWeak(v13 + 7, v12);
            }
          }
        }
      }
      uint64_t v14 = *(unsigned char **)(a1 + 40);
      if (v14)
      {
        v14[9] = 1;
        uint64_t v14 = *(unsigned char **)(a1 + 40);
      }
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __83__NEAgentFilterExtension_startControlExtensionWithConfiguration_completionHandler___block_invoke_62;
      v20[3] = &unk_1E59923F0;
      id v21 = v14;
      id v22 = *(id *)(a1 + 56);
      id v23 = *(id *)(a1 + 64);
      [v7 validateWithCompletionHandler:v20];
    }
    else
    {
      id v15 = ne_log_obj();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v19 = *(id *)(a1 + 40);
        if (v19) {
          id v19 = objc_getProperty(v19, v16, 96, 1);
        }
        *(_DWORD *)buf = 138412290;
        id v25 = v19;
        _os_log_error_impl(&dword_19DDAF000, v15, OS_LOG_TYPE_ERROR, "Failed to get the host context for control extension %@", buf, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
  }
}

void __83__NEAgentFilterExtension_startControlExtensionWithConfiguration_completionHandler___block_invoke_62(void *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    id v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      id v14 = v4;
      _os_log_error_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_ERROR, "Filter Control validation failed with error: %@", (uint8_t *)&v13, 0xCu);
    }

    id v6 = *(void (**)(void))(a1[6] + 16);
  }
  else
  {
    id Property = (id)a1[4];
    if (Property) {
      id Property = objc_getProperty(Property, v3, 56, 1);
    }
    id v9 = Property;
    SEL v10 = (void *)a1[4];
    uint64_t v11 = a1[5];
    if (v10) {
      id v12 = objc_getProperty(v10, v8, 96, 1);
    }
    else {
      id v12 = 0;
    }
    [v9 setConfiguration:v11 extensionIdentifier:v12];

    id v6 = *(void (**)(void))(a1[6] + 16);
  }
  v6();
}

- (NSXPCInterface)driverInterface
{
  if (driverInterface_onceToken_19775 != -1) {
    dispatch_once(&driverInterface_onceToken_19775, &__block_literal_global_29);
  }
  id v2 = (void *)driverInterface_driverInterface_19776;

  return (NSXPCInterface *)v2;
}

uint64_t __41__NEAgentFilterExtension_driverInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF09D918];
  uint64_t v1 = driverInterface_driverInterface_19776;
  driverInterface_driverInterface_19776 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (NSXPCInterface)managerInterface
{
  if (managerInterface_onceToken_19778 != -1) {
    dispatch_once(&managerInterface_onceToken_19778, &__block_literal_global_19779);
  }
  id v2 = (void *)managerInterface_managerInterface_19780;

  return (NSXPCInterface *)v2;
}

uint64_t __42__NEAgentFilterExtension_managerInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF0A5690];
  uint64_t v1 = managerInterface_managerInterface_19780;
  managerInterface_managerInterface_19780 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (NSArray)uuids
{
  return self->_extensionUUIDs;
}

- (void)handleAppsUpdateEnds:(id)a3
{
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 80, 1);
  }
  else {
    id Property = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__NEAgentFilterExtension_handleAppsUpdateEnds___block_invoke;
  v8[3] = &unk_1E5992328;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(Property, v8);
}

void __47__NEAgentFilterExtension_handleAppsUpdateEnds___block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = *(unsigned char **)(a1 + 32);
  if (!v4 || (v4[11] & 1) == 0) {
    return;
  }
  id v6 = objc_getProperty(v4, a2, 88, 1);
  if (!v6) {
    goto LABEL_8;
  }
  id Property = *(id *)(a1 + 32);
  id v8 = *(void **)(a1 + 40);
  if (Property) {
    id Property = objc_getProperty(Property, v5, 88, 1);
  }
  id v2 = Property;
  if (![v8 containsObject:v2])
  {
LABEL_8:
    id v9 = *(void **)(a1 + 32);
    if (v9 && (id v10 = objc_getProperty(v9, v5, 96, 1)) != 0)
    {
      id v12 = v10;
      int v13 = *(void **)(a1 + 32);
      id v14 = *(void **)(a1 + 40);
      if (v13) {
        id v15 = objc_getProperty(v13, v11, 96, 1);
      }
      else {
        id v15 = 0;
      }
      int v16 = [v14 containsObject:v15];

      if (v6)
      {
LABEL_13:

        if ((v16 & 1) == 0) {
          return;
        }
        goto LABEL_17;
      }
    }
    else
    {
      int v16 = 0;
      if (v6) {
        goto LABEL_13;
      }
    }
    if (!v16) {
      return;
    }
    goto LABEL_17;
  }

LABEL_17:
  uint64_t v17 = *(void *)(a1 + 32);
  if (v17)
  {
    *(unsigned char *)(v17 + 10) = 0;
    uint64_t v18 = *(void *)(a1 + 32);
    if (v18) {
      *(unsigned char *)(v18 + 11) = 0;
    }
  }
  id v19 = ne_log_obj();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = *(id *)(a1 + 32);
    if (v21)
    {
      id v23 = objc_getProperty(v21, v20, 88, 1);
      id v21 = *(id *)(a1 + 32);
      if (v21) {
        id v21 = objc_getProperty(v21, v22, 96, 1);
      }
    }
    else
    {
      id v23 = 0;
    }
    int v24 = 138412546;
    id v25 = v23;
    __int16 v26 = 2112;
    id v27 = v21;
    _os_log_impl(&dword_19DDAF000, v19, OS_LOG_TYPE_DEFAULT, "Extensions %@ and %@ have been updated, idling", (uint8_t *)&v24, 0x16u);
  }

  -[NEAgentFilterExtension sendFilterStatus:withError:](*(void *)(a1 + 32), 0, 0);
}

- (void)handleAppsUpdateEnding:(id)a3
{
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 80, 1);
  }
  else {
    id Property = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__NEAgentFilterExtension_handleAppsUpdateEnding___block_invoke;
  v8[3] = &unk_1E5992328;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(Property, v8);
}

void __49__NEAgentFilterExtension_handleAppsUpdateEnding___block_invoke(uint64_t a1, const char *a2)
{
  id v4 = *(unsigned char **)(a1 + 32);
  if (v4 && (v4[10] & 1) != 0 && (v4[11] & 1) == 0)
  {
    id v6 = objc_getProperty(v4, a2, 88, 1);
    if (v6)
    {
      id Property = *(id *)(a1 + 32);
      id v8 = *(void **)(a1 + 40);
      if (Property) {
        id Property = objc_getProperty(Property, v5, 88, 1);
      }
      id v2 = Property;
      if ([v8 containsObject:v2])
      {

LABEL_18:
        uint64_t v17 = *(void *)(a1 + 32);
        if (v17) {
          *(unsigned char *)(v17 + 11) = 1;
        }
        return;
      }
    }
    id v9 = *(void **)(a1 + 32);
    if (v9 && (id v10 = objc_getProperty(v9, v5, 96, 1)) != 0)
    {
      id v12 = v10;
      int v13 = *(void **)(a1 + 32);
      id v14 = *(void **)(a1 + 40);
      if (v13) {
        id v15 = objc_getProperty(v13, v11, 96, 1);
      }
      else {
        id v15 = 0;
      }
      int v16 = [v14 containsObject:v15];

      if (v6)
      {
LABEL_14:

        if ((v16 & 1) == 0) {
          return;
        }
        goto LABEL_18;
      }
    }
    else
    {
      int v16 = 0;
      if (v6) {
        goto LABEL_14;
      }
    }
    if (!v16) {
      return;
    }
    goto LABEL_18;
  }
}

- (void)handleAppsUpdateBegins:(id)a3
{
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 80, 1);
  }
  else {
    id Property = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__NEAgentFilterExtension_handleAppsUpdateBegins___block_invoke;
  v8[3] = &unk_1E5992328;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(Property, v8);
}

void __49__NEAgentFilterExtension_handleAppsUpdateBegins___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    if (*(unsigned char *)(v2 + 10)) {
      return;
    }
    uint64_t v3 = *(void *)(v2 + 24);
  }
  else
  {
    uint64_t v3 = 0;
  }
  if ([*(id *)(a1 + 40) containsObject:v3])
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5)
    {
      *(unsigned char *)(v5 + 10) = 1;
      id v6 = *(void **)(a1 + 32);
      if (v6)
      {
        if (objc_getProperty(v6, v4, 128, 1))
        {
          id Property = *(NSObject **)(a1 + 32);
          if (Property) {
            id Property = objc_getProperty(Property, v7, 128, 1);
          }
          dispatch_source_cancel(Property);
          id v10 = *(void **)(a1 + 32);
          if (v10) {
            objc_setProperty_atomic(v10, v9, 0, 128);
          }
        }
      }
    }
    uint64_t v11 = ne_log_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = *(id *)(a1 + 32);
      if (v13)
      {
        id v15 = objc_getProperty(v13, v12, 88, 1);
        id v13 = *(id *)(a1 + 32);
        if (v13) {
          id v13 = objc_getProperty(v13, v14, 96, 1);
        }
      }
      else
      {
        id v15 = 0;
      }
      int v16 = 138412546;
      id v17 = v15;
      __int16 v18 = 2112;
      id v19 = v13;
      _os_log_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_DEFAULT, "Extensions %@ and %@ are being updated, stopping", (uint8_t *)&v16, 0x16u);
    }

    -[NEAgentFilterExtension sendFilterStatus:withError:](*(void *)(a1 + 32), 4, 0);
    -[NEAgentFilterExtension stopFilterExtensionWithReason:](*(unsigned char **)(a1 + 32), 40);
  }
}

- (void)stopFilterExtensionWithReason:(unsigned char *)a1
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      uint64_t v7 = ne_session_stop_reason_to_string();
      _os_log_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_DEFAULT, "Stopping filter with reason %s", (uint8_t *)&v6, 0xCu);
    }

    if (a1[8]) {
      objc_msgSend(objc_getProperty(a1, v5, 48, 1), "stopWithReason:", a2);
    }
    if (a1[9]) {
      objc_msgSend(objc_getProperty(a1, v5, 56, 1), "stopWithReason:", a2);
    }
    objc_setProperty_atomic(a1, v5, 0, 104);
    *((_WORD *)a1 + 4) = 0;
  }
}

- (void)handleAppsUninstalled:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([a3 containsObject:self->_pluginType])
  {
    id v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      pluginType = self->_pluginType;
      int v6 = 138412290;
      uint64_t v7 = pluginType;
      _os_log_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_DEFAULT, "App for plugin type %@ has been uninstalled, stopping", (uint8_t *)&v6, 0xCu);
    }

    -[NEAgentFilterExtension stopFilterExtensionWithReason:](self, 6);
  }
}

- (void)handleCancel
{
}

- (void)handleDisposeWithCompletionHandler:(id)a3
{
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 80, 1);
  }
  else {
    id Property = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__NEAgentFilterExtension_handleDisposeWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E59936F8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(Property, v8);
}

uint64_t __61__NEAgentFilterExtension_handleDisposeWithCompletionHandler___block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (v3)
  {
    id v4 = objc_getProperty(v3, a2, 48, 1);
    if (v4)
    {

LABEL_6:
      uint64_t v8 = *(void **)(a1 + 32);
      if (v8)
      {
        objc_setProperty_atomic_copy(v8, v6, *(id *)(a1 + 40), 144);
        uint64_t v8 = *(void **)(a1 + 32);
      }
      return [v8 handleCancel];
    }
    id v7 = *(void **)(a1 + 32);
    if (v7 && objc_getProperty(v7, v5, 56, 1)) {
      goto LABEL_6;
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v10 = *(uint64_t (**)(void))(result + 16);
    return v10();
  }
  return result;
}

- (void)handleInitWithCompletionHandler:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58__NEAgentFilterExtension_handleInitWithCompletionHandler___block_invoke;
  v14[3] = &unk_1E5992300;
  v14[4] = self;
  id v15 = v4;
  id v5 = v4;
  int v6 = v14;
  if (self)
  {
    objc_initWeak(&location, self);
    v22[0] = *MEMORY[0x1E4F28290];
    id v8 = objc_getProperty(self, v7, 88, 1);
    v22[1] = *MEMORY[0x1E4F282B0];
    v23[0] = v8;
    v23[1] = @"com.apple.networkextension.filter-data";
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];

    id v10 = ne_log_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id Property = objc_getProperty(self, v11, 88, 1);
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = Property;
      _os_log_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_DEFAULT, "Looking for a data extension with identifier %@", (uint8_t *)&buf, 0xCu);
    }

    id v13 = (void *)MEMORY[0x1E4F28C70];
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    __int16 v18 = __71__NEAgentFilterExtension_handleDataExtensionInitWithCompletionHandler___block_invoke;
    id v19 = &unk_1E59923C8;
    objc_copyWeak(v21, &location);
    uint64_t v20 = v6;
    [v13 extensionsWithMatchingAttributes:v9 completion:&buf];

    objc_destroyWeak(v21);
    objc_destroyWeak(&location);
  }
}

void __58__NEAgentFilterExtension_handleInitWithCompletionHandler___block_invoke(uint64_t a1, const char *a2)
{
  char v2 = (char)a2;
  id v4 = *(void **)(a1 + 32);
  if (v4) {
    id Property = objc_getProperty(v4, a2, 80, 1);
  }
  else {
    id Property = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__NEAgentFilterExtension_handleInitWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E59922D8;
  char v9 = v2;
  id v6 = *(id *)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v8 = v6;
  dispatch_async(Property, block);
}

void __71__NEAgentFilterExtension_handleDataExtensionInitWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = ne_log_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v5 count];
    if (WeakRetained) {
      id Property = objc_getProperty(WeakRetained, v9, 88, 1);
    }
    else {
      id Property = 0;
    }
    *(_DWORD *)long long buf = 134218242;
    uint64_t v30 = (__CFString *)v10;
    __int16 v31 = 2112;
    id v32 = Property;
    _os_log_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_DEFAULT, "Found %lu data extension(s) with identifier %@", buf, 0x16u);
  }

  if (v5 && !v6 && [v5 count] && WeakRetained)
  {
    objc_initWeak((id *)buf, WeakRetained);
    id v12 = [v5 objectAtIndexedSubscript:0];
    objc_setProperty_atomic(WeakRetained, v13, v12, 32);

    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __71__NEAgentFilterExtension_handleDataExtensionInitWithCompletionHandler___block_invoke_47;
    v27[3] = &unk_1E5992350;
    objc_copyWeak(&v28, (id *)buf);
    id v15 = objc_getProperty(WeakRetained, v14, 32, 1);
    [v15 setRequestInterruptionBlock:v27];

    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __71__NEAgentFilterExtension_handleDataExtensionInitWithCompletionHandler___block_invoke_49;
    v25[3] = &unk_1E5992378;
    objc_copyWeak(&v26, (id *)buf);
    id v17 = objc_getProperty(WeakRetained, v16, 32, 1);
    [v17 setRequestCompletionBlock:v25];

    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __71__NEAgentFilterExtension_handleDataExtensionInitWithCompletionHandler___block_invoke_2;
    void v23[3] = &unk_1E59923A0;
    objc_copyWeak(&v24, (id *)buf);
    id v19 = objc_getProperty(WeakRetained, v18, 32, 1);
    [v19 setRequestCancellationBlock:v23];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    uint64_t v20 = ne_log_obj();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      if (WeakRetained) {
        id v22 = objc_getProperty(WeakRetained, v21, 88, 1);
      }
      else {
        id v22 = 0;
      }
      *(_DWORD *)long long buf = 138412802;
      uint64_t v30 = @"com.apple.networkextension.filter-data";
      __int16 v31 = 2112;
      id v32 = v22;
      __int16 v33 = 2112;
      id v34 = v6;
      _os_log_error_impl(&dword_19DDAF000, v20, OS_LOG_TYPE_ERROR, "Failed to create a %@ extension with identifier %@: %@", buf, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __71__NEAgentFilterExtension_handleDataExtensionInitWithCompletionHandler___block_invoke_47(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    if (WeakRetained) {
      id Property = objc_getProperty(WeakRetained, v6, 88, 1);
    }
    else {
      id Property = 0;
    }
    int v10 = 138412290;
    id v11 = Property;
    _os_log_error_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_ERROR, "Extension %@ died unexpectedly", (uint8_t *)&v10, 0xCu);
  }

  if (WeakRetained) {
    id v8 = objc_getProperty(WeakRetained, v7, 64, 1);
  }
  else {
    id v8 = 0;
  }
  if ([v3 isEqual:v8])
  {
    -[NEAgentFilterExtension handleExtensionExit:](WeakRetained, v3);
    -[NEAgentFilterExtension cleanupDataExtensionWithRequestIdentifier:](WeakRetained, v3);
  }
}

void __71__NEAgentFilterExtension_handleDataExtensionInitWithCompletionHandler___block_invoke_49(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained) {
    id Property = objc_getProperty(WeakRetained, v4, 64, 1);
  }
  else {
    id Property = 0;
  }
  if ([v7 isEqual:Property]) {
    -[NEAgentFilterExtension cleanupDataExtensionWithRequestIdentifier:](v5, v7);
  }
}

void __71__NEAgentFilterExtension_handleDataExtensionInitWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained) {
    id Property = objc_getProperty(WeakRetained, v4, 64, 1);
  }
  else {
    id Property = 0;
  }
  if ([v7 isEqual:Property]) {
    -[NEAgentFilterExtension cleanupDataExtensionWithRequestIdentifier:](v5, v7);
  }
}

- (void)cleanupDataExtensionWithRequestIdentifier:(void *)a1
{
  id v4 = a2;
  if (a1)
  {
    id Property = objc_getProperty(a1, v3, 80, 1);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __68__NEAgentFilterExtension_cleanupDataExtensionWithRequestIdentifier___block_invoke;
    v6[3] = &unk_1E5992328;
    v6[4] = a1;
    id v7 = v4;
    dispatch_async(Property, v6);
  }
}

uint64_t __68__NEAgentFilterExtension_cleanupDataExtensionWithRequestIdentifier___block_invoke(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property)
  {
    objc_setProperty_atomic(Property, a2, 0, 64);
    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v4, 32, 1);
    }
  }
  [Property setRequestInterruptionBlock:0];
  id v6 = *(id *)(a1 + 32);
  if (v6) {
    id v6 = objc_getProperty(v6, v5, 32, 1);
  }
  [v6 setRequestCancellationBlock:0];
  id v8 = *(id *)(a1 + 32);
  if (v8) {
    id v8 = objc_getProperty(v8, v7, 32, 1);
  }
  [v8 setRequestCompletionBlock:0];
  id v10 = *(id *)(a1 + 32);
  if (v10) {
    id v10 = objc_getProperty(v10, v9, 32, 1);
  }
  [v10 cancelExtensionRequestWithIdentifier:*(void *)(a1 + 40)];
  uint64_t v12 = *(void **)(a1 + 32);
  if (v12) {
    id v13 = objc_getProperty(v12, v11, 48, 1);
  }
  else {
    id v13 = 0;
  }

  return [v12 extensionDidStop:v13];
}

void __58__NEAgentFilterExtension_handleInitWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  v27[2] = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    id v17 = __58__NEAgentFilterExtension_handleInitWithCompletionHandler___block_invoke_3;
    SEL v18 = &unk_1E59922B0;
    uint64_t v1 = *(void **)(a1 + 32);
    id v19 = *(id *)(a1 + 40);
    id v3 = &v15;
    if (v1)
    {
      id Property = objc_getProperty(v1, v2, 96, 1);
      if (objc_msgSend(Property, "length", v15, v16))
      {
        objc_initWeak(&location, v1);
        v26[0] = *MEMORY[0x1E4F28290];
        id v6 = objc_getProperty(v1, v5, 96, 1);
        v26[1] = *MEMORY[0x1E4F282B0];
        v27[0] = v6;
        v27[1] = @"com.apple.networkextension.filter-control";
        id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];

        id v8 = ne_log_obj();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          id v10 = objc_getProperty(v1, v9, 96, 1);
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v10;
          _os_log_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_DEFAULT, "Looking for a control extension with identifier %@", (uint8_t *)&buf, 0xCu);
        }

        id v11 = (void *)MEMORY[0x1E4F28C70];
        *(void *)&long long buf = MEMORY[0x1E4F143A8];
        *((void *)&buf + 1) = 3221225472;
        id v22 = __74__NEAgentFilterExtension_handleControlExtensionInitWithCompletionHandler___block_invoke;
        id v23 = &unk_1E59923C8;
        objc_copyWeak(v25, &location);
        id v24 = v3;
        [v11 extensionsWithMatchingAttributes:v7 completion:&buf];

        objc_destroyWeak(v25);
        objc_destroyWeak(&location);
      }
      else
      {
        id v13 = ne_log_obj();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf) = 0;
          _os_log_error_impl(&dword_19DDAF000, v13, OS_LOG_TYPE_ERROR, "Control Extension not found", (uint8_t *)&buf, 2u);
        }

        objc_setProperty_atomic(v1, v14, 0, 40);
        ((void (*)(uint64_t *, uint64_t))v17)(v3, 1);
      }
    }
  }
  else
  {
    uint64_t v12 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v12();
  }
}

uint64_t __58__NEAgentFilterExtension_handleInitWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74__NEAgentFilterExtension_handleControlExtensionInitWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = ne_log_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v5 count];
    if (WeakRetained) {
      id Property = objc_getProperty(WeakRetained, v9, 96, 1);
    }
    else {
      id Property = 0;
    }
    *(_DWORD *)long long buf = 134218242;
    __int16 v33 = (__CFString *)v10;
    __int16 v34 = 2112;
    id v35 = Property;
    _os_log_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_DEFAULT, "Found %lu control extension(s) with identifier %@", buf, 0x16u);
  }

  if (v5 && !v6 && [v5 count])
  {
    objc_initWeak((id *)buf, WeakRetained);
    id v13 = [v5 objectAtIndexedSubscript:0];
    if (WeakRetained) {
      objc_setProperty_atomic(WeakRetained, v12, v13, 40);
    }

    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __74__NEAgentFilterExtension_handleControlExtensionInitWithCompletionHandler___block_invoke_53;
    v30[3] = &unk_1E5992350;
    objc_copyWeak(&v31, (id *)buf);
    if (WeakRetained) {
      id v15 = objc_getProperty(WeakRetained, v14, 40, 1);
    }
    else {
      id v15 = 0;
    }
    id v16 = v15;
    [v16 setRequestInterruptionBlock:v30];

    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __74__NEAgentFilterExtension_handleControlExtensionInitWithCompletionHandler___block_invoke_54;
    v28[3] = &unk_1E5992378;
    objc_copyWeak(&v29, (id *)buf);
    if (WeakRetained) {
      id v18 = objc_getProperty(WeakRetained, v17, 40, 1);
    }
    else {
      id v18 = 0;
    }
    id v19 = v18;
    [v19 setRequestCompletionBlock:v28];

    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    void v26[2] = __74__NEAgentFilterExtension_handleControlExtensionInitWithCompletionHandler___block_invoke_2;
    v26[3] = &unk_1E59923A0;
    objc_copyWeak(&v27, (id *)buf);
    if (WeakRetained) {
      id v21 = objc_getProperty(WeakRetained, v20, 40, 1);
    }
    else {
      id v21 = 0;
    }
    id v22 = v21;
    [v22 setRequestCancellationBlock:v26];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&v31);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v23 = ne_log_obj();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      if (WeakRetained) {
        id v25 = objc_getProperty(WeakRetained, v24, 96, 1);
      }
      else {
        id v25 = 0;
      }
      *(_DWORD *)long long buf = 138412802;
      __int16 v33 = @"com.apple.networkextension.filter-control";
      __int16 v34 = 2112;
      id v35 = v25;
      __int16 v36 = 2112;
      id v37 = v6;
      _os_log_error_impl(&dword_19DDAF000, v23, OS_LOG_TYPE_ERROR, "Failed to create a %@ extension with identifier %@: %@", buf, 0x20u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __74__NEAgentFilterExtension_handleControlExtensionInitWithCompletionHandler___block_invoke_53(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    if (WeakRetained) {
      id Property = objc_getProperty(WeakRetained, v6, 96, 1);
    }
    else {
      id Property = 0;
    }
    int v10 = 138412290;
    id v11 = Property;
    _os_log_error_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_ERROR, "Extension %@ died unexpectedly", (uint8_t *)&v10, 0xCu);
  }

  if (WeakRetained) {
    id v8 = objc_getProperty(WeakRetained, v7, 72, 1);
  }
  else {
    id v8 = 0;
  }
  if ([v3 isEqual:v8])
  {
    -[NEAgentFilterExtension handleExtensionExit:](WeakRetained, v3);
    -[NEAgentFilterExtension cleanupControlExtensionWithRequestIdentifier:](WeakRetained, v3);
  }
}

void __74__NEAgentFilterExtension_handleControlExtensionInitWithCompletionHandler___block_invoke_54(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained) {
    id Property = objc_getProperty(WeakRetained, v4, 72, 1);
  }
  else {
    id Property = 0;
  }
  if ([v7 isEqual:Property]) {
    -[NEAgentFilterExtension cleanupControlExtensionWithRequestIdentifier:](v5, v7);
  }
}

void __74__NEAgentFilterExtension_handleControlExtensionInitWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained) {
    id Property = objc_getProperty(WeakRetained, v4, 72, 1);
  }
  else {
    id Property = 0;
  }
  if ([v7 isEqual:Property]) {
    -[NEAgentFilterExtension cleanupControlExtensionWithRequestIdentifier:](v5, v7);
  }
}

- (void)cleanupControlExtensionWithRequestIdentifier:(void *)a1
{
  id v4 = a2;
  if (a1)
  {
    id Property = objc_getProperty(a1, v3, 80, 1);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __71__NEAgentFilterExtension_cleanupControlExtensionWithRequestIdentifier___block_invoke;
    v6[3] = &unk_1E5992328;
    v6[4] = a1;
    id v7 = v4;
    dispatch_async(Property, v6);
  }
}

uint64_t __71__NEAgentFilterExtension_cleanupControlExtensionWithRequestIdentifier___block_invoke(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property)
  {
    objc_setProperty_atomic(Property, a2, 0, 72);
    id Property = *(id *)(a1 + 32);
    if (Property) {
      id Property = objc_getProperty(Property, v4, 40, 1);
    }
  }
  [Property setRequestInterruptionBlock:0];
  id v6 = *(id *)(a1 + 32);
  if (v6) {
    id v6 = objc_getProperty(v6, v5, 40, 1);
  }
  [v6 setRequestCancellationBlock:0];
  id v8 = *(id *)(a1 + 32);
  if (v8) {
    id v8 = objc_getProperty(v8, v7, 40, 1);
  }
  [v8 setRequestCompletionBlock:0];
  id v10 = *(id *)(a1 + 32);
  if (v10) {
    id v10 = objc_getProperty(v10, v9, 40, 1);
  }
  [v10 cancelExtensionRequestWithIdentifier:*(void *)(a1 + 40)];
  uint64_t v12 = *(void **)(a1 + 32);
  if (v12) {
    id v13 = objc_getProperty(v12, v11, 56, 1);
  }
  else {
    id v13 = 0;
  }

  return [v12 extensionDidStop:v13];
}

- (void)dealloc
{
  crypto_state = self->_crypto_state;
  if (crypto_state)
  {
    free(crypto_state);
    self->_crypto_state = 0;
  }
  if (objc_getProperty(self, a2, 128, 1))
  {
    id Property = objc_getProperty(self, v4, 128, 1);
    dispatch_source_cancel(Property);
    objc_setProperty_atomic(self, v6, 0, 128);
  }
  v7.receiver = self;
  v7.super_class = (Class)NEAgentFilterExtension;
  [(NEAgentFilterExtension *)&v7 dealloc];
}

- (NEAgentFilterExtension)initWithPluginType:(id)a3 pluginClass:(int64_t)a4 pluginEndpoint:(id)a5 pluginProcessIdentity:(id)a6 queue:(id)a7 factory:(id)a8
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v34.receiver = self;
  v34.super_class = (Class)NEAgentFilterExtension;
  uint64_t v20 = [(NEAgentFilterExtension *)&v34 init];
  id v21 = v20;
  if (!v20) {
    goto LABEL_9;
  }
  objc_storeWeak((id *)&v20->_managerObjectFactory, v19);
  objc_storeStrong((id *)&v21->_queue, a7);
  id v22 = objc_alloc(MEMORY[0x1E4F1C978]);
  id v23 = [v17 uuid];
  uint64_t v24 = objc_msgSend(v22, "initWithObjects:", v23, 0);
  extensionUUIDs = v21->_extensionUUIDs;
  v21->_extensionUUIDs = (NSArray *)v24;

  objc_storeStrong((id *)&v21->_pluginType, a3);
  if (a4 == 6)
  {
    id v27 = NEFilterPacketExtensionProviderHostContext;
LABEL_6:
    id v28 = -[NEExtensionProviderHostContext initWithVendorEndpoint:processIdentity:delegate:]((id *)[v27 alloc], v16, v17, v21);
    dataSessionContext = v21->_dataSessionContext;
    v21->_dataSessionContext = (NEFilterExtensionProviderHostContext *)v28;

    if (v21->_dataSessionContext)
    {
      objc_storeStrong((id *)&v21->_dataExtensionIdentifier, a3);
      uint64_t inited = ne_filter_crypto_init_master();
      v21->_crypto_state = (cfil_crypto_state *)inited;
      if (inited)
      {
        arc4random_buf(&v21->_crypto_kernel_salt, 4uLL);
LABEL_9:
        id v26 = v21;
        goto LABEL_14;
      }
      id v31 = ne_log_obj();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl(&dword_19DDAF000, v31, OS_LOG_TYPE_ERROR, "Failed to initialize NE filter crypto", buf, 2u);
      }
    }
    id v26 = 0;
    goto LABEL_14;
  }
  id v26 = 0;
  if (a4 == 4)
  {
    id v27 = NEFilterDataExtensionProviderHostContext;
    goto LABEL_6;
  }
LABEL_14:

  return v26;
}

- (NEAgentFilterExtension)initWithPluginType:(id)a3 pluginClass:(int64_t)a4 pluginInfo:(id)a5 queue:(id)a6 factory:(id)a7
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v40.receiver = self;
  v40.super_class = (Class)NEAgentFilterExtension;
  id v17 = [(NEAgentFilterExtension *)&v40 init];
  id v18 = v17;
  if (!v17) {
    goto LABEL_11;
  }
  objc_storeWeak((id *)&v17->_managerObjectFactory, v16);
  objc_storeStrong((id *)&v18->_queue, a6);
  *(_WORD *)&v18->_dataExtensionInitialized = 0;
  objc_storeStrong((id *)&v18->_pluginType, a3);
  id v19 = [v14 objectForKeyedSubscript:@"extension-identifier"];
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v21 = +[NELaunchServices pluginProxyWithIdentifier:v19 type:v13 pluginClass:a4 extensionPoint:0];
  id v22 = v21;
  if (v21)
  {
    id v23 = [v21 machOUUIDs];
    [v20 addObjectsFromArray:v23];

    uint64_t v24 = [v22 pluginIdentifier];
    dataExtensionIdentifier = v18->_dataExtensionIdentifier;
    v18->_dataExtensionIdentifier = (NSString *)v24;
  }
  id v26 = +[NELaunchServices pluginProxyWithIdentifier:0 type:v13 pluginClass:4 extensionPoint:@"com.apple.networkextension.filter-control"];
  id v27 = v26;
  if (v26)
  {
    id v28 = [v26 machOUUIDs];
    [v20 addObjectsFromArray:v28];

    uint64_t v29 = [v27 pluginIdentifier];
    controlExtensionIdentifier = v18->_controlExtensionIdentifier;
    v18->_controlExtensionIdentifier = (NSString *)v29;
  }
  if (!v18->_dataExtensionIdentifier)
  {
    id v35 = ne_log_obj();
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
LABEL_15:

      objc_super v34 = 0;
      goto LABEL_16;
    }
    *(_DWORD *)long long buf = 138412546;
    v42 = @"com.apple.networkextension.filter-data";
    __int16 v43 = 2112;
    id v44 = v13;
    __int16 v36 = "Failed to find a %@ extension inside of app %@";
    id v37 = v35;
    uint32_t v38 = 22;
LABEL_18:
    _os_log_error_impl(&dword_19DDAF000, v37, OS_LOG_TYPE_ERROR, v36, buf, v38);
    goto LABEL_15;
  }
  if ([v20 count])
  {
    uint64_t v31 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v20];
    extensionUUIDs = v18->_extensionUUIDs;
    v18->_extensionUUIDs = (NSArray *)v31;
  }
  uint64_t inited = ne_filter_crypto_init_master();
  v18->_crypto_state = (cfil_crypto_state *)inited;
  if (!inited)
  {
    id v35 = ne_log_obj();
    if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    *(_WORD *)long long buf = 0;
    __int16 v36 = "Failed to initialize NE filter crypto";
    id v37 = v35;
    uint32_t v38 = 2;
    goto LABEL_18;
  }
  arc4random_buf(&v18->_crypto_kernel_salt, 4uLL);

LABEL_11:
  objc_super v34 = v18;
LABEL_16:

  return v34;
}

+ (BOOL)authenticateFlowWithState:(cfil_crypto_state *)a3 crypto_key:(id)a4 flow:(id)a5 salt:(unsigned int)a6 isKernelSocket:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  if (v10)
  {
    id v12 = v10;
    if ([v12 bytes])
    {
      if ([v12 length] == 32)
      {
        uint64_t v13 = objc_msgSend(v11, "crypto_signature");
        if (v13)
        {
          id v14 = (void *)v13;
          id v15 = objc_msgSend(v11, "crypto_signature");
          uint64_t v16 = [v15 length];

          if (v16)
          {
            uint64_t v117 = 0;
            long long v115 = 0u;
            long long v116 = 0u;
            long long v113 = 0u;
            long long v114 = 0u;
            *(_OWORD *)long long buf = 0u;
            memset(v112, 0, sizeof(v112));
            if (v11) {
              id Property = objc_getProperty(v11, v17, 128, 1);
            }
            else {
              id Property = 0;
            }
            id v19 = Property;

            if (v19)
            {
              if (v11) {
                id v21 = objc_getProperty(v11, v20, 128, 1);
              }
              else {
                id v21 = 0;
              }
              id v22 = v21;
              [v22 getUUIDBytes:buf];
            }
            DWORD2(v112[0]) = [v11 direction] != 1;
            DWORD2(v112[4]) = [v11 pid];
            if ([v11 epid]) {
              int v23 = [v11 epid];
            }
            else {
              int v23 = [v11 pid];
            }
            HIDWORD(v112[4]) = v23;
            LODWORD(v113) = [v11 rpid];
            *((void *)&v116 + 1) = [v11 inBytes];
            uint64_t v117 = [v11 outBytes];
            if ([v11 inBytes]) {
              BOOL v27 = 1;
            }
            else {
              BOOL v27 = [v11 outBytes] != 0;
            }
            BOOL v88 = v27;
            if (v11)
            {
              if (v11[13])
              {
                id v28 = [v11 sourceAppIdentifier];

                if (v28)
                {
                  id v29 = [v11 sourceAppIdentifier];
                  [v29 UTF8String];

                  uint64_t v30 = [v11 sourceAppIdentifier];
                  [v30 length];
                }
              }
            }
            unsigned int v85 = a6;
            uint64_t v31 = [v11 URL];

            if (v31)
            {
              id v32 = [v11 URL];
              id v33 = [v32 absoluteString];
              [v33 UTF8String];

              objc_super v34 = [v11 URL];
              id v35 = [v34 absoluteString];
              [v35 length];
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              int v40 = 0;
              v87 = "";
              v86 = "Browser";
              goto LABEL_60;
            }
            __int16 v36 = v11;
            uint32_t v38 = v36;
            if (v11)
            {
              id v39 = objc_getProperty(v36, v37, 128, 1);
              if (v39)
              {

LABEL_36:
                v42 = [v38 remoteFlowEndpoint];

                if (v42)
                {
                  __int16 v43 = [v38 remoteFlowEndpoint];
                  address = nw_endpoint_get_address(v43);

                  if (address)
                  {
                    int sa_family = address->sa_family;
                    if (sa_family == 30)
                    {
                      sockaddr v46 = *address;
                      *(sockaddr *)((char *)&v112[1] + 8) = *(sockaddr *)&address->sa_data[10];
                      goto LABEL_42;
                    }
                    if (sa_family == 2)
                    {
                      sockaddr v46 = *address;
LABEL_42:
                      *(sockaddr *)((char *)v112 + 12) = v46;
                    }
                  }
                }
                v47 = [v38 localFlowEndpoint];

                if (!v47) {
                  goto LABEL_50;
                }
                v48 = [v38 localFlowEndpoint];
                v49 = nw_endpoint_get_address(v48);

                if (!v49) {
                  goto LABEL_50;
                }
                int v50 = v49->sa_family;
                if (v50 == 30)
                {
                  sockaddr v51 = *v49;
                  *(sockaddr *)((char *)&v112[3] + 4) = *(sockaddr *)&v49->sa_data[10];
                }
                else
                {
                  if (v50 != 2) {
                    goto LABEL_50;
                  }
                  sockaddr v51 = *v49;
                }
                *(sockaddr *)((char *)&v112[2] + 8) = v51;
LABEL_50:
                uint64_t v52 = [v38 remoteHostname];
                if (v52
                  && (v53 = (void *)v52,
                      [v38 remoteHostname],
                      v54 = objc_claimAutoreleasedReturnValue(),
                      uint64_t v55 = [v54 length],
                      v54,
                      v53,
                      v55))
                {
                  id v56 = [v38 remoteHostname];
                  v57 = (const char *)[v56 UTF8String];

                  int v84 = strlen(v57);
                }
                else
                {
                  int v84 = 0;
                }
                DWORD1(v112[4]) = [v38 socketProtocol];
                v58 = [v38 uuid];
                [v58 getUUIDBytes:(char *)&v113 + 4];

                v59 = [v38 euuid];
                [v59 getUUIDBytes:(char *)&v114 + 4];

                v60 = [v38 ruuid];
                [v60 getUUIDBytes:(char *)&v115 + 4];

                int v61 = [v38 socketProtocol];
                int v62 = [v38 socketFamily];

                if (v62 == 2) {
                  v63 = "v4";
                }
                else {
                  v63 = "v6";
                }
                v64 = "UDP";
                if (v61 == 6) {
                  v64 = "TCP";
                }
                v86 = v64;
                v87 = v63;
                int v40 = v84;
LABEL_60:
                [v12 bytes];
                objc_msgSend(v11, "crypto_signature");
                id v65 = objc_claimAutoreleasedReturnValue();
                uint64_t v66 = [v65 bytes];
                v67 = objc_msgSend(v11, "crypto_signature");
                LODWORD(v83) = [v67 length];
                LODWORD(v82) = v40;
                char v25 = ne_filter_crypto_validate_data();

                v68 = ne_log_obj();
                v69 = v68;
                if (v25)
                {
                  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
                  {
                    if (v7) {
                      v70 = "Kernel ";
                    }
                    else {
                      v70 = "";
                    }
                    v71 = "New";
                    if (v88) {
                      v71 = "Closed";
                    }
                    v89 = v71;
                    if (objc_msgSend(v11, "direction", v82, v66, v83) == 1)
                    {
                      v72 = "IN";
                    }
                    else if ([v11 direction] == 2)
                    {
                      v72 = "OUT";
                    }
                    else
                    {
                      v72 = "ANY";
                    }
                    v76 = objc_msgSend(v11, "crypto_signature");
                    uint64_t v77 = [v11 inBytes];
                    uint64_t v78 = [v11 outBytes];
                    v79 = [v11 sourceAppIdentifier];
                    *(_DWORD *)v91 = 136317442;
                    v92 = v70;
                    __int16 v93 = 2080;
                    v94 = v89;
                    __int16 v95 = 2080;
                    v96 = v86;
                    __int16 v97 = 2080;
                    v98 = v87;
                    __int16 v99 = 2080;
                    v100 = v72;
                    __int16 v101 = 1024;
                    unsigned int v102 = v85;
                    __int16 v103 = 2112;
                    v104 = v76;
                    __int16 v105 = 2048;
                    uint64_t v106 = v77;
                    __int16 v107 = 2048;
                    uint64_t v108 = v78;
                    __int16 v109 = 2112;
                    v110 = v79;
                    _os_log_debug_impl(&dword_19DDAF000, v69, OS_LOG_TYPE_DEBUG, "Signature validation (%s%s - %s %s %s) succeeded for salt %d with signature %@ (inBytes %llu outBytes %llu) (app %@)", v91, 0x62u);
LABEL_86:
                  }
                }
                else if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
                {
                  if (v7) {
                    v73 = "Kernel ";
                  }
                  else {
                    v73 = "";
                  }
                  v74 = "New";
                  if (v88) {
                    v74 = "Closed";
                  }
                  v90 = v74;
                  if (objc_msgSend(v11, "direction", v82, v66, v83) == 1)
                  {
                    v75 = "IN";
                  }
                  else if ([v11 direction] == 2)
                  {
                    v75 = "OUT";
                  }
                  else
                  {
                    v75 = "ANY";
                  }
                  v76 = objc_msgSend(v11, "crypto_signature");
                  uint64_t v80 = [v11 inBytes];
                  uint64_t v81 = [v11 outBytes];
                  v79 = [v11 sourceAppIdentifier];
                  *(_DWORD *)v91 = 136317442;
                  v92 = v73;
                  __int16 v93 = 2080;
                  v94 = v90;
                  __int16 v95 = 2080;
                  v96 = v86;
                  __int16 v97 = 2080;
                  v98 = v87;
                  __int16 v99 = 2080;
                  v100 = v75;
                  __int16 v101 = 1024;
                  unsigned int v102 = v85;
                  __int16 v103 = 2112;
                  v104 = v76;
                  __int16 v105 = 2048;
                  uint64_t v106 = v80;
                  __int16 v107 = 2048;
                  uint64_t v108 = v81;
                  __int16 v109 = 2112;
                  v110 = v79;
                  _os_log_error_impl(&dword_19DDAF000, v69, OS_LOG_TYPE_ERROR, "Signature validation (%s%s - %s %s %s) failed for salt %d with signature %@ (inBytes %llu outBytes %llu) (app %@)", v91, 0x62u);
                  goto LABEL_86;
                }

                goto LABEL_18;
              }
              uint64_t v41 = v38[25];
              if (v41 == -1) {
                goto LABEL_36;
              }
            }
            else
            {
              uint64_t v41 = 0;
            }
            *(void *)&v112[0] = v41;
            goto LABEL_36;
          }
        }
        uint64_t v24 = ne_log_obj();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_error_impl(&dword_19DDAF000, v24, OS_LOG_TYPE_ERROR, "Signature validation: flow has no signature", buf, 2u);
        }
      }
    }
  }
  char v25 = 0;
LABEL_18:

  return v25;
}

@end