@interface MRAVDistantRoutingDiscoverySession
+ (id)clientInterface;
+ (id)serviceInterface;
- (BOOL)_shouldAddLocalEndpoint;
- (BOOL)devicePresenceDetected;
- (MRAVDistantEndpoint)distantLocalEndpoint;
- (MRAVDistantRoutingDiscoverySession)initWithConfiguration:(id)a3;
- (MRAVLocalEndpoint)localEndpoint;
- (NSArray)distantEndpoints;
- (NSArray)distantOutputDevices;
- (NSString)debugDescription;
- (NSString)description;
- (NSXPCConnection)hostedRoutingSessionConnection;
- (id)_hostedRoutingConnection;
- (id)_resolveDistantEndpoints:(id)a3;
- (id)_resolveEndpoints:(id)a3;
- (id)availableEndpoints;
- (id)routingContextUID;
- (unsigned)discoveryMode;
- (unsigned)endpointFeatures;
- (void)_initializeHostedRoutingConnectionWithCompletion:(id)a3;
- (void)_notifyEndpointsChanged;
- (void)_registerForPerRoutingContextNotifications;
- (void)_reloadAvailableDistantEndpoints;
- (void)_reloadAvailableDistantEndpointsWithEndpoints:(id)a3;
- (void)_reloadAvailableDistantOutputDevices;
- (void)_reloadAvailableDistantOutputDevicesWithOutputDevices:(id)a3;
- (void)_reloadHostedRoutingServiceDiscoveryMode;
- (void)configurationWithCompletion:(id)a3;
- (void)dealloc;
- (void)setDiscoveryMode:(unsigned int)a3;
- (void)setDistantLocalEndpoint:(id)a3;
- (void)setHostedRoutingSessionConnection:(id)a3;
- (void)setLocalEndpoint:(id)a3;
- (void)setRoutingContextUID:(id)a3;
@end

@implementation MRAVDistantRoutingDiscoverySession

uint64_t __51__MRAVDistantRoutingDiscoverySession_discoveryMode__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 148);
  return result;
}

void __84__MRAVDistantRoutingDiscoverySession__reloadAvailableDistantEndpointsWithEndpoints___block_invoke(uint64_t a1)
{
}

id __56__MRAVDistantRoutingDiscoverySession__resolveEndpoints___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 connectionType] != 1)
  {
    id v4 = v3;
    goto LABEL_5;
  }
  if ([*(id *)(a1 + 32) _shouldAddLocalEndpoint])
  {
    id v4 = [*(id *)(a1 + 32) localEndpoint];
LABEL_5:
    v5 = v4;
    goto LABEL_7;
  }
  v5 = 0;
LABEL_7:

  return v5;
}

id __63__MRAVDistantRoutingDiscoverySession__resolveDistantEndpoints___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 connectionType] != 1)
  {
    id v4 = v3;
    goto LABEL_5;
  }
  if ([*(id *)(a1 + 32) _shouldAddLocalEndpoint])
  {
    id v4 = [*(id *)(a1 + 32) distantLocalEndpoint];
LABEL_5:
    v5 = v4;
    goto LABEL_7;
  }
  v5 = 0;
LABEL_7:

  return v5;
}

- (BOOL)_shouldAddLocalEndpoint
{
  v2 = +[MRAVClusterController sharedController];
  BOOL v3 = [v2 clusterStatus] != 2;

  return v3;
}

- (MRAVDistantEndpoint)distantLocalEndpoint
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__16;
  v8 = __Block_byref_object_dispose__16;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (MRAVDistantEndpoint *)v2;
}

- (MRAVLocalEndpoint)localEndpoint
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__16;
  v8 = __Block_byref_object_dispose__16;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (MRAVLocalEndpoint *)v2;
}

void __51__MRAVDistantRoutingDiscoverySession_localEndpoint__block_invoke(uint64_t a1)
{
}

uint64_t __54__MRAVDistantRoutingDiscoverySession_distantEndpoints__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 160) copy];

  return MEMORY[0x1F41817F8]();
}

void __62__MRAVDistantRoutingDiscoverySession__hostedRoutingConnection__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 188)) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(v1 + 208));
  }
}

void __58__MRAVDistantRoutingDiscoverySession_distantLocalEndpoint__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 224);
  if (!v2)
  {
    BOOL v3 = [MRAVDistantEndpoint alloc];
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 216) descriptor];
    uint64_t v5 = [(MRAVDistantEndpoint *)v3 initWithDescriptor:v4];
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = *(void **)(v6 + 224);
    *(void *)(v6 + 224) = v5;

    id v2 = *(void **)(*(void *)(a1 + 32) + 224);
  }
  v8 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v8, v2);
}

uint64_t __92__MRAVDistantRoutingDiscoverySession__reloadAvailableDistantOutputDevicesWithOutputDevices___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 168) = [*(id *)(a1 + 40) copy];

  return MEMORY[0x1F41817F8]();
}

uint64_t __61__MRAVDistantRoutingDiscoverySession__notifyEndpointsChanged__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) availableEndpoints];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) distantEndpoints];

  return MEMORY[0x1F41817F8]();
}

- (id)availableEndpoints
{
  uint64_t v3 = [(MRAVDistantRoutingDiscoverySession *)self distantEndpoints];
  uint64_t v4 = [(MRAVDistantRoutingDiscoverySession *)self _resolveEndpoints:v3];

  return v4;
}

- (NSArray)distantEndpoints
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__16;
  v11 = __Block_byref_object_dispose__16;
  id v12 = 0;
  uint64_t v5 = MEMORY[0x1E4F143A8];
  msv_dispatch_sync_on_queue();
  uint64_t v3 = -[MRAVDistantRoutingDiscoverySession _resolveDistantEndpoints:](self, "_resolveDistantEndpoints:", v8[5], v5, 3221225472, __54__MRAVDistantRoutingDiscoverySession_distantEndpoints__block_invoke, &unk_1E57D0590, self, &v7);
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v3;
}

- (id)_resolveDistantEndpoints:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__MRAVDistantRoutingDiscoverySession__resolveDistantEndpoints___block_invoke;
  v5[3] = &unk_1E57D4448;
  v5[4] = self;
  uint64_t v3 = objc_msgSend(a3, "msv_compactMap:", v5);

  return v3;
}

- (id)_resolveEndpoints:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__MRAVDistantRoutingDiscoverySession__resolveEndpoints___block_invoke;
  v5[3] = &unk_1E57D4448;
  v5[4] = self;
  uint64_t v3 = objc_msgSend(a3, "msv_compactMap:", v5);

  return v3;
}

- (void)_reloadAvailableDistantOutputDevicesWithOutputDevices:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __92__MRAVDistantRoutingDiscoverySession__reloadAvailableDistantOutputDevicesWithOutputDevices___block_invoke;
  v10 = &unk_1E57D0790;
  v11 = self;
  id v12 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, &v7);
  -[MRAVRoutingDiscoverySession notifyOutputDevicesChanged:](self, "notifyOutputDevicesChanged:", v6, v7, v8, v9, v10, v11);
}

- (void)_reloadAvailableDistantEndpointsWithEndpoints:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __84__MRAVDistantRoutingDiscoverySession__reloadAvailableDistantEndpointsWithEndpoints___block_invoke;
  v10 = &unk_1E57D0790;
  v11 = self;
  id v12 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, &v7);
  [(MRAVDistantRoutingDiscoverySession *)self _notifyEndpointsChanged];
}

- (void)_notifyEndpointsChanged
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__16;
  v15 = __Block_byref_object_dispose__16;
  id v16 = 0;
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__16;
  serialQueue = self->_serialQueue;
  uint64_t v9 = __Block_byref_object_dispose__16;
  id v10 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__MRAVDistantRoutingDiscoverySession__notifyEndpointsChanged__block_invoke;
  block[3] = &unk_1E57D43F8;
  block[4] = self;
  block[5] = &v11;
  block[6] = &v5;
  dispatch_sync(serialQueue, block);
  [(MRAVRoutingDiscoverySession *)self notifyAvailableEndpointsChanged:v12[5] discoveredEndpoints:v6[5]];
  _Block_object_dispose(&v5, 8);

  _Block_object_dispose(&v11, 8);
}

- (unsigned)discoveryMode
{
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x2020000000;
  int v5 = 0;
  msv_dispatch_sync_on_queue();
  LODWORD(self) = self->_discoveryMode;
  _Block_object_dispose(v4, 8);
  return self;
}

- (NSArray)distantOutputDevices
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__16;
  id v10 = __Block_byref_object_dispose__16;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__MRAVDistantRoutingDiscoverySession_distantOutputDevices__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

uint64_t __60__MRAVDistantRoutingDiscoverySession_initWithConfiguration___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _registerForPerRoutingContextNotifications];
}

void __70__MRAVDistantRoutingDiscoverySession__reloadAvailableDistantEndpoints__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v8 = WeakRetained;
    if (WeakRetained) {
      [WeakRetained _reloadAvailableDistantEndpointsWithEndpoints:v5];
    }
  }
  else
  {
    uint64_t v8 = _MRLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __70__MRAVDistantRoutingDiscoverySession__reloadAvailableDistantEndpoints__block_invoke_cold_1();
    }
  }
}

void __72__MRAVDistantRoutingDiscoverySession_setHostedRoutingSessionConnection___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 208);
  if (v3 != v2)
  {
    [v3 invalidate];
    BOOL v4 = *(void *)(*(void *)(a1 + 32) + 192) == 0;
    id v5 = _MRLogForCategory(0);
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (!v6) {
        goto LABEL_8;
      }
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v34 = v14;
      __int16 v35 = 2112;
      uint64_t v36 = v15;
      id v11 = "[DistantDiscoverySession] %@ Hosted routing connection set to %@";
      id v12 = v5;
      uint32_t v13 = 22;
    }
    else
    {
      if (!v6) {
        goto LABEL_8;
      }
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(v7 + 208);
      [*(id *)(v7 + 192) timeIntervalSinceNow];
      *(_DWORD *)buf = 138413058;
      uint64_t v34 = v7;
      __int16 v35 = 2112;
      uint64_t v36 = v9;
      __int16 v37 = 2112;
      uint64_t v38 = v8;
      __int16 v39 = 2048;
      double v40 = -v10;
      id v11 = "[DistantDiscoverySession] %@ Hosted routing connection set from %@ to %@ after %lf seconds";
      id v12 = v5;
      uint32_t v13 = 42;
    }
    _os_log_impl(&dword_194F3C000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
LABEL_8:

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 208), *(id *)(a1 + 40));
    uint64_t v16 = [MEMORY[0x1E4F1C9C8] now];
    v17 = *(void **)(*(void *)(a1 + 32) + 192);
    *(void *)(*(void *)(a1 + 32) + 192) = v16;

    uint64_t v18 = *(void *)(a1 + 32);
    if (*(void *)(v18 + 208))
    {
      objc_initWeak((id *)buf, (id)v18);
      v19 = *(void **)(*(void *)(a1 + 32) + 208);
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __72__MRAVDistantRoutingDiscoverySession_setHostedRoutingSessionConnection___block_invoke_84;
      v31[3] = &unk_1E57D4380;
      objc_copyWeak(v32, (id *)buf);
      uint64_t v20 = *(void *)(a1 + 32);
      v32[1] = v19;
      v31[4] = v20;
      v21 = (void *)MEMORY[0x1997190F0](v31);
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __72__MRAVDistantRoutingDiscoverySession_setHostedRoutingSessionConnection___block_invoke_2_86;
      v29[3] = &unk_1E57D43A8;
      objc_copyWeak(v30, (id *)buf);
      v30[1] = v19;
      v22 = (void *)MEMORY[0x1997190F0](v29);
      v23 = [(id)objc_opt_class() serviceInterface];
      [*(id *)(*(void *)(a1 + 32) + 208) setRemoteObjectInterface:v23];

      v24 = [(id)objc_opt_class() clientInterface];
      [*(id *)(*(void *)(a1 + 32) + 208) setExportedInterface:v24];

      uint64_t v25 = *(void *)(a1 + 32);
      v26 = [*(id *)(v25 + 208) exportedInterface];
      v27 = [v26 protocol];
      v28 = +[MRWeakProxy weakProxyWithObject:v25 protocol:v27];
      [*(id *)(*(void *)(a1 + 32) + 208) setExportedObject:v28];

      [*(id *)(*(void *)(a1 + 32) + 208) setInvalidationHandler:v21];
      [*(id *)(*(void *)(a1 + 32) + 208) setInterruptionHandler:v22];
      [*(id *)(*(void *)(a1 + 32) + 208) resume];
      *(unsigned char *)(*(void *)(a1 + 32) + 188) = 1;

      objc_destroyWeak(v30);
      objc_destroyWeak(v32);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      *(unsigned char *)(v18 + 188) = 0;
    }
  }
}

+ (id)serviceInterface
{
  uint64_t v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE6B69D8];
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  id v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_getAvailableEndpointsWithCompletion_ argumentIndex:0 ofReply:1];
  BOOL v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  [v2 setClasses:v8 forSelector:sel_getAvailableOutputDevicesWithCompletion_ argumentIndex:0 ofReply:1];

  return v2;
}

+ (id)clientInterface
{
  uint64_t v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE68F7F8];
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  id v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_availableEndpointsDidChange_ argumentIndex:0 ofReply:0];
  BOOL v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  [v2 setClasses:v8 forSelector:sel_availableOutputDevicesDidChange_ argumentIndex:0 ofReply:0];
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v9 forSelector:sel_configurationWithCompletion_ argumentIndex:0 ofReply:1];

  return v2;
}

void __74__MRAVDistantRoutingDiscoverySession__reloadAvailableDistantOutputDevices__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v8 = WeakRetained;
    if (WeakRetained) {
      [WeakRetained _reloadAvailableDistantOutputDevicesWithOutputDevices:v5];
    }
  }
  else
  {
    uint64_t v8 = _MRLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __74__MRAVDistantRoutingDiscoverySession__reloadAvailableDistantOutputDevices__block_invoke_cold_1();
    }
  }
}

void __87__MRAVDistantRoutingDiscoverySession__initializeHostedRoutingConnectionWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v7 = WeakRetained;
  if (v5 && WeakRetained)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F292A0]);
    [v8 _setEndpoint:v5];
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v8];
    [v7 setHostedRoutingSessionConnection:v9];
    uint64_t v10 = *(void *)(a1 + 40);
    if (v10) {
      (*(void (**)(void))(v10 + 16))();
    }

    goto LABEL_18;
  }
  id v11 = _MRLogForCategory(0);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
  if (a3 && v7)
  {
    if (v12) {
      __87__MRAVDistantRoutingDiscoverySession__initializeHostedRoutingConnectionWithCompletion___block_invoke_cold_1();
    }
LABEL_16:

    uint64_t v14 = *(void *)(a1 + 40);
    if (v14) {
      (*(void (**)(void))(v14 + 16))();
    }
    goto LABEL_18;
  }
  if (!v7)
  {
    if (v12) {
      __87__MRAVDistantRoutingDiscoverySession__initializeHostedRoutingConnectionWithCompletion___block_invoke_cold_3();
    }
    goto LABEL_16;
  }
  if (v12) {
    __87__MRAVDistantRoutingDiscoverySession__initializeHostedRoutingConnectionWithCompletion___block_invoke_cold_2();
  }

  uint64_t v13 = MEMORY[0x1E4F1CBF0];
  [v7 _reloadAvailableDistantEndpointsWithEndpoints:MEMORY[0x1E4F1CBF0]];
  [v7 _reloadAvailableDistantOutputDevicesWithOutputDevices:v13];
  [v7 _initializeHostedRoutingConnectionWithCompletion:*(void *)(a1 + 40)];
LABEL_18:
}

- (void)setHostedRoutingSessionConnection:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __72__MRAVDistantRoutingDiscoverySession_setHostedRoutingSessionConnection___block_invoke;
  uint64_t v10 = &unk_1E57D0790;
  id v11 = self;
  id v12 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, &v7);
  [(MRAVDistantRoutingDiscoverySession *)self _reloadHostedRoutingServiceDiscoveryMode];
  [(MRAVDistantRoutingDiscoverySession *)self _reloadAvailableDistantEndpoints];
  [(MRAVDistantRoutingDiscoverySession *)self _reloadAvailableDistantOutputDevices];
}

- (void)_reloadAvailableDistantOutputDevices
{
  objc_initWeak(&location, self);
  id v3 = [(MRAVDistantRoutingDiscoverySession *)self _hostedRoutingConnection];
  id v4 = [v3 remoteObjectProxy];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __74__MRAVDistantRoutingDiscoverySession__reloadAvailableDistantOutputDevices__block_invoke;
  v5[3] = &unk_1E57D4420;
  objc_copyWeak(&v6, &location);
  [v4 getAvailableOutputDevicesWithCompletion:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_reloadAvailableDistantEndpoints
{
  objc_initWeak(&location, self);
  id v3 = [(MRAVDistantRoutingDiscoverySession *)self _hostedRoutingConnection];
  id v4 = [v3 remoteObjectProxy];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__MRAVDistantRoutingDiscoverySession__reloadAvailableDistantEndpoints__block_invoke;
  v5[3] = &unk_1E57D4420;
  objc_copyWeak(&v6, &location);
  [v4 getAvailableEndpointsWithCompletion:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_reloadHostedRoutingServiceDiscoveryMode
{
  id v4 = [(MRAVDistantRoutingDiscoverySession *)self _hostedRoutingConnection];
  id v3 = [v4 remoteObjectProxy];
  objc_msgSend(v3, "setDiscoveryMode:withCompletion:", -[MRAVDistantRoutingDiscoverySession discoveryMode](self, "discoveryMode"), &__block_literal_global_111);
}

- (id)_hostedRoutingConnection
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__16;
  uint64_t v10 = __Block_byref_object_dispose__16;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__MRAVDistantRoutingDiscoverySession__hostedRoutingConnection__block_invoke;
  v5[3] = &unk_1E57D07E0;
  void v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distantLocalEndpoint, 0);
  objc_storeStrong((id *)&self->_localEndpoint, 0);
  objc_storeStrong((id *)&self->_hostedRoutingSessionConnection, 0);
  objc_storeStrong((id *)&self->_notificationTokens, 0);
  objc_storeStrong((id *)&self->_hostedRoutingConnectionDate, 0);
  objc_storeStrong((id *)&self->_routingContextUID, 0);
  objc_storeStrong((id *)&self->_distantOutputDevices, 0);
  objc_storeStrong((id *)&self->_distantEndpoints, 0);
  objc_storeStrong((id *)&self->_discoveryModeDate, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

void __78__MRAVDistantRoutingDiscoverySession__reloadHostedRoutingServiceDiscoveryMode__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = _MRLogForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __78__MRAVDistantRoutingDiscoverySession__reloadHostedRoutingServiceDiscoveryMode__block_invoke_cold_1();
    }
  }
}

void __55__MRAVDistantRoutingDiscoverySession_setDiscoveryMode___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v1 + 148) != *(_DWORD *)(a1 + 56))
  {
    uint64_t v3 = *(void *)(v1 + 152);
    id v4 = _MRLogForCategory(0);
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        uint64_t v6 = *(void *)(a1 + 32);
        CFStringRef v7 = MRMediaRemoteCopyRouteDiscoveryModeDescription(*(_DWORD *)(a1 + 56));
        [*(id *)(*(void *)(a1 + 32) + 152) timeIntervalSinceNow];
        int v17 = 138412802;
        uint64_t v18 = v6;
        __int16 v19 = 2112;
        CFStringRef v20 = v7;
        __int16 v21 = 2048;
        double v22 = -v8;
        uint64_t v9 = "[DistantDiscoverySession] %@ - Discovery mode changed to: %@ after %lf seconds";
        uint64_t v10 = v4;
        uint32_t v11 = 32;
LABEL_7:
        _os_log_impl(&dword_194F3C000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v17, v11);
      }
    }
    else if (v5)
    {
      uint64_t v12 = *(void *)(a1 + 32);
      CFStringRef v13 = MRMediaRemoteCopyRouteDiscoveryModeDescription(*(_DWORD *)(a1 + 56));
      int v17 = 138412546;
      uint64_t v18 = v12;
      __int16 v19 = 2112;
      CFStringRef v20 = v13;
      uint64_t v9 = "[DistantDiscoverySession] %@ - Discovery mode changed to: %@";
      uint64_t v10 = v4;
      uint32_t v11 = 22;
      goto LABEL_7;
    }

    *(_DWORD *)(*(void *)(a1 + 32) + 148) = *(_DWORD *)(a1 + 56);
    uint64_t v14 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v16 = *(void **)(v15 + 152);
    *(void *)(v15 + 152) = v14;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 188);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (MRAVDistantRoutingDiscoverySession)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MRAVDistantRoutingDiscoverySession;
  BOOL v5 = [(MRAVRoutingDiscoverySession *)&v18 initWithConfiguration:v4];
  if (v5)
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    Name = class_getName(v6);
    double v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create(Name, v8);
    serialQueue = v5->_serialQueue;
    v5->_serialQueue = (OS_dispatch_queue *)v9;

    v5->_discoveryMode = 0;
    uint64_t v11 = [v4 routingContextUID];
    routingContextUID = v5->_routingContextUID;
    v5->_routingContextUID = (NSString *)v11;

    v5->_endpointFeatures = [v4 features];
    CFStringRef v13 = v5->_serialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__MRAVDistantRoutingDiscoverySession_initWithConfiguration___block_invoke;
    block[3] = &unk_1E57D0518;
    uint64_t v14 = v5;
    int v17 = v14;
    dispatch_sync(v13, block);
    [(MRAVDistantRoutingDiscoverySession *)v14 _initializeHostedRoutingConnectionWithCompletion:0];
  }
  return v5;
}

- (void)_initializeHostedRoutingConnectionWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  BOOL v5 = (void *)MRGetSharedService();
  unsigned int endpointFeatures = self->_endpointFeatures;
  qos_class_t v7 = qos_class_self();
  double v8 = dispatch_get_global_queue(v7, 0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __87__MRAVDistantRoutingDiscoverySession__initializeHostedRoutingConnectionWithCompletion___block_invoke;
  v10[3] = &unk_1E57D43D0;
  objc_copyWeak(&v12, &location);
  id v9 = v4;
  v10[4] = self;
  id v11 = v9;
  MRMediaRemoteServiceGetHostedRoutingXPCEndpoint(v5, endpointFeatures, v8, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)setDiscoveryMode:(unsigned int)a3
{
  uint64_t v16 = 0;
  int v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v12 = 0;
  CFStringRef v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__MRAVDistantRoutingDiscoverySession_setDiscoveryMode___block_invoke;
  block[3] = &unk_1E57D42E0;
  unsigned int v11 = a3;
  void block[4] = self;
  block[5] = &v12;
  block[6] = &v16;
  dispatch_sync(serialQueue, block);
  if (*((unsigned char *)v17 + 24))
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __55__MRAVDistantRoutingDiscoverySession_setDiscoveryMode___block_invoke_80;
    v8[3] = &unk_1E57D4308;
    v8[4] = self;
    unsigned int v9 = a3;
    uint64_t v6 = MEMORY[0x1997190F0](v8);
    qos_class_t v7 = (void *)v6;
    if (*((unsigned char *)v13 + 24)) {
      (*(void (**)(uint64_t))(v6 + 16))(v6);
    }
    else {
      [(MRAVDistantRoutingDiscoverySession *)self _initializeHostedRoutingConnectionWithCompletion:v6];
    }
  }
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
}

uint64_t __55__MRAVDistantRoutingDiscoverySession_setDiscoveryMode___block_invoke_80(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _reloadHostedRoutingServiceDiscoveryMode];
  if (*(_DWORD *)(a1 + 40))
  {
    [*(id *)(a1 + 32) _reloadAvailableDistantEndpoints];
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 _reloadAvailableDistantOutputDevices];
  }
  return result;
}

void __49__MRAVDistantRoutingDiscoverySession_description__block_invoke(uint64_t a1)
{
  id v2 = NSString;
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = *(void *)(a1 + 32);
  MRMediaRemoteEndpointFeaturesDescription(*(_DWORD *)(v4 + 144));
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v5 = (__CFString *)MRMediaRemoteCopyRouteDiscoveryModeDescription(*(_DWORD *)(*(void *)(a1 + 32) + 148));
  uint64_t v6 = [v2 stringWithFormat:@"<%@: %p> (%@ - %@)", v3, v4, v9, v5];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  double v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (void)configurationWithCompletion:(id)a3
{
  id v5 = a3;
  id v6 = [(MRAVRoutingDiscoverySession *)self configuration];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

uint64_t __58__MRAVDistantRoutingDiscoverySession_distantOutputDevices__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 168) copy];

  return MEMORY[0x1F41817F8]();
}

- (void)_registerForPerRoutingContextNotifications
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v3 = self->_notificationTokens;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v38 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v37 + 1) + 8 * i);
        double v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v8 removeObserver:v7];
      }
      uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v4);
  }

  notificationTokens = self->_notificationTokens;
  self->_notificationTokens = 0;

  distantLocalEndpoint = self->_distantLocalEndpoint;
  self->_distantLocalEndpoint = 0;

  unsigned int v11 = +[MRAVLocalEndpoint sharedLocalEndpointForRoutingContextWithUID:self->_routingContextUID];
  localEndpoint = self->_localEndpoint;
  self->_localEndpoint = v11;

  objc_initWeak(&location, self);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __80__MRAVDistantRoutingDiscoverySession__registerForPerRoutingContextNotifications__block_invoke;
  v34[3] = &unk_1E57D12D0;
  objc_copyWeak(&v35, &location);
  CFStringRef v13 = (void *)MEMORY[0x1997190F0](v34);
  uint64_t v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
  char v15 = self->_localEndpoint;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  id v32[2] = __80__MRAVDistantRoutingDiscoverySession__registerForPerRoutingContextNotifications__block_invoke_3;
  v32[3] = &unk_1E57D42B8;
  id v16 = v13;
  id v33 = v16;
  int v17 = [v14 addObserverForName:@"MRAVEndpointDidAddOutputDeviceNotification" object:v15 queue:0 usingBlock:v32];

  uint64_t v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
  char v19 = self->_localEndpoint;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  id v30[2] = __80__MRAVDistantRoutingDiscoverySession__registerForPerRoutingContextNotifications__block_invoke_4;
  v30[3] = &unk_1E57D42B8;
  id v20 = v16;
  id v31 = v20;
  __int16 v21 = [v18 addObserverForName:@"MRAVEndpointDidRemoveOutputDeviceNotification" object:v19 queue:0 usingBlock:v30];

  double v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v23 = self->_localEndpoint;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __80__MRAVDistantRoutingDiscoverySession__registerForPerRoutingContextNotifications__block_invoke_5;
  v28[3] = &unk_1E57D42B8;
  id v24 = v20;
  id v29 = v24;
  uint64_t v25 = [v22 addObserverForName:@"MRAVEndpointDidChangeOutputDeviceNotification" object:v23 queue:0 usingBlock:v28];

  v26 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v17, v21, v25, 0);
  v27 = self->_notificationTokens;
  self->_notificationTokens = v26;

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);
}

- (NSString)description
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy__16;
  double v8 = __Block_byref_object_dispose__16;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSString *)v2;
}

void __72__MRAVDistantRoutingDiscoverySession_setHostedRoutingSessionConnection___block_invoke_84(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained[17];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__MRAVDistantRoutingDiscoverySession_setHostedRoutingSessionConnection___block_invoke_2;
    block[3] = &unk_1E57D4358;
    uint64_t v5 = WeakRetained;
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 32);
    id v9 = v5;
    uint64_t v10 = v7;
    uint64_t v11 = v6;
    dispatch_sync(v4, block);
  }
}

uint64_t __72__MRAVDistantRoutingDiscoverySession_setHostedRoutingSessionConnection___block_invoke_2(uint64_t result)
{
  uint64_t v1 = (id *)(result + 32);
  if (*(void *)(*(void *)(result + 32) + 208) == *(void *)(result + 48))
  {
    uint64_t v2 = result;
    uint64_t v3 = _MRLogForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __72__MRAVDistantRoutingDiscoverySession_setHostedRoutingSessionConnection___block_invoke_2_cold_2((uint64_t)v1, v3, v4, v5, v6, v7, v8, v9);
    }

    uint64_t v10 = (void *)*((void *)*v1 + 26);
    *((void *)*v1 + 26) = 0;

    *((unsigned char *)*v1 + 188) = 0;
    if (*((_DWORD *)*v1 + 37)
      || ([*(id *)(v2 + 40) configuration],
          uint64_t v11 = objc_claimAutoreleasedReturnValue(),
          int v12 = [v11 alwaysAllowUpdates],
          v11,
          v12))
    {
      CFStringRef v13 = _MRLogForCategory(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __72__MRAVDistantRoutingDiscoverySession_setHostedRoutingSessionConnection___block_invoke_2_cold_1((uint64_t)v1, v13, v14, v15, v16, v17, v18, v19);
      }

      dispatch_time_t v20 = dispatch_time(0, 1000000000);
      qos_class_t v21 = qos_class_self();
      double v22 = dispatch_get_global_queue(v21, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __72__MRAVDistantRoutingDiscoverySession_setHostedRoutingSessionConnection___block_invoke_85;
      block[3] = &unk_1E57D0518;
      id v27 = *v1;
      dispatch_after(v20, v22, block);
    }
    uint64_t v23 = (void *)*((void *)*v1 + 20);
    *((void *)*v1 + 20) = 0;

    id v24 = (void *)*((void *)*v1 + 21);
    *((void *)*v1 + 21) = 0;

    uint64_t v25 = MEMORY[0x1E4F1CBF0];
    [*v1 notifyEndpointsChanged:MEMORY[0x1E4F1CBF0]];
    return [*v1 notifyOutputDevicesChanged:v25];
  }
  return result;
}

void __80__MRAVDistantRoutingDiscoverySession__registerForPerRoutingContextNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained[17];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__MRAVDistantRoutingDiscoverySession__registerForPerRoutingContextNotifications__block_invoke_2;
    block[3] = &unk_1E57D0518;
    void block[4] = v2;
    dispatch_sync(v3, block);
    [v2 _notifyEndpointsChanged];
  }
}

void __80__MRAVDistantRoutingDiscoverySession__registerForPerRoutingContextNotifications__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 224);
  *(void *)(v1 + 224) = 0;
}

uint64_t __80__MRAVDistantRoutingDiscoverySession__registerForPerRoutingContextNotifications__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __80__MRAVDistantRoutingDiscoverySession__registerForPerRoutingContextNotifications__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __80__MRAVDistantRoutingDiscoverySession__registerForPerRoutingContextNotifications__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_hostedRoutingSessionConnection invalidate];
  notify_cancel(self->_serviceResetNotifyToken);
  v3.receiver = self;
  v3.super_class = (Class)MRAVDistantRoutingDiscoverySession;
  [(MRAVDistantRoutingDiscoverySession *)&v3 dealloc];
}

- (unsigned)endpointFeatures
{
  return self->_endpointFeatures;
}

- (BOOL)devicePresenceDetected
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v2 = [(MRAVDistantRoutingDiscoverySession *)self _hostedRoutingConnection];
  objc_super v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_46];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__MRAVDistantRoutingDiscoverySession_devicePresenceDetected__block_invoke_82;
  v5[3] = &unk_1E57D4330;
  void v5[4] = &v6;
  [v3 getDevicePresenceDetectedWithCompletion:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __60__MRAVDistantRoutingDiscoverySession_devicePresenceDetected__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    objc_super v3 = _MRLogForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __60__MRAVDistantRoutingDiscoverySession_devicePresenceDetected__block_invoke_cold_1();
    }
  }
}

void __60__MRAVDistantRoutingDiscoverySession_devicePresenceDetected__block_invoke_82(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = _MRLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __60__MRAVDistantRoutingDiscoverySession_devicePresenceDetected__block_invoke_cold_1();
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
}

- (id)routingContextUID
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__16;
  uint64_t v10 = __Block_byref_object_dispose__16;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__MRAVDistantRoutingDiscoverySession_routingContextUID__block_invoke;
  v5[3] = &unk_1E57D0590;
  void v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __55__MRAVDistantRoutingDiscoverySession_routingContextUID__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 176) copy];

  return MEMORY[0x1F41817F8]();
}

- (void)setRoutingContextUID:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  char v9 = __59__MRAVDistantRoutingDiscoverySession_setRoutingContextUID___block_invoke;
  uint64_t v10 = &unk_1E57D0790;
  id v11 = self;
  id v12 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, &v7);
  [(MRAVDistantRoutingDiscoverySession *)self _reloadAvailableDistantEndpoints];
}

uint64_t __59__MRAVDistantRoutingDiscoverySession_setRoutingContextUID___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2[22] != *(void *)(a1 + 40))
  {
    uint64_t v3 = [*(id *)(a1 + 40) copy];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 176);
    *(void *)(v4 + 176) = v3;

    id v2 = *(void **)(a1 + 32);
  }

  return [v2 _registerForPerRoutingContextNotifications];
}

uint64_t __72__MRAVDistantRoutingDiscoverySession_setHostedRoutingSessionConnection___block_invoke_85(uint64_t a1)
{
  return [*(id *)(a1 + 32) _initializeHostedRoutingConnectionWithCompletion:0];
}

void __72__MRAVDistantRoutingDiscoverySession_setHostedRoutingSessionConnection___block_invoke_2_86(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained[17];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __72__MRAVDistantRoutingDiscoverySession_setHostedRoutingSessionConnection___block_invoke_3;
    v7[3] = &unk_1E57D2098;
    id v5 = WeakRetained;
    uint64_t v6 = *(void *)(a1 + 40);
    id v8 = v5;
    uint64_t v9 = v6;
    dispatch_async(v4, v7);
  }
}

uint64_t __72__MRAVDistantRoutingDiscoverySession_setHostedRoutingSessionConnection___block_invoke_3(uint64_t result)
{
  uint64_t v1 = result + 32;
  if (*(void *)(*(void *)(result + 32) + 208) == *(void *)(result + 40))
  {
    id v2 = _MRLogForCategory(0);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __72__MRAVDistantRoutingDiscoverySession_setHostedRoutingSessionConnection___block_invoke_3_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);
    }

    return [*(id *)(*(void *)v1 + 208) invalidate];
  }
  return result;
}

- (NSString)debugDescription
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy__16;
  uint64_t v8 = __Block_byref_object_dispose__16;
  id v9 = 0;
  msv_dispatch_sync_on_queue();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSString *)v2;
}

void __54__MRAVDistantRoutingDiscoverySession_debugDescription__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 160), "msv_map:", &__block_literal_global_94);
  dispatch_time_t v20 = NSString;
  id v21 = (id)v2;
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = MRMediaRemoteEndpointFeaturesDescription(*(_DWORD *)(v4 + 144));
  uint64_t v6 = (__CFString *)MRMediaRemoteCopyRouteDiscoveryModeDescription(*(_DWORD *)(*(void *)(a1 + 32) + 148));
  [*(id *)(*(void *)(a1 + 32) + 152) timeIntervalSinceNow];
  double v8 = -v7;
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(v9 + 176);
  id v11 = objc_msgSend(*(id *)(v9 + 168), "mr_formattedDebugDescription");
  id v12 = objc_msgSend(v21, "mr_formattedDebugDescription");
  uint64_t v13 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v13 + 188)) {
    uint64_t v14 = @"YES";
  }
  else {
    uint64_t v14 = @"NO";
  }
  uint64_t v15 = *(void *)(v13 + 208);
  [*(id *)(v13 + 192) timeIntervalSinceNow];
  uint64_t v17 = [v20 stringWithFormat:@"<%@: %p> (%@)\n  discoveryMode = %@ (%lf seconds ago)\n  routingContext = %@\n  outputDevices = %@\n  endpoints = %@\n  hostedRoutingConnectionDidInitialize = %@\n  connection = %@ (%lf seconds ago)\n}>", v3, v4, v5, v6, *(void *)&v8, v10, v11, v12, v14, v15, -v16];
  uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v17;
}

id __54__MRAVDistantRoutingDiscoverySession_debugDescription__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (objc_class *)NSString;
  id v3 = a2;
  id v4 = [v2 alloc];
  uint64_t v5 = [v3 debugName];

  uint64_t v6 = (void *)[v4 initWithFormat:@"%@", v5];

  return v6;
}

- (NSXPCConnection)hostedRoutingSessionConnection
{
  return self->_hostedRoutingSessionConnection;
}

- (void)setLocalEndpoint:(id)a3
{
}

- (void)setDistantLocalEndpoint:(id)a3
{
}

void __60__MRAVDistantRoutingDiscoverySession_devicePresenceDetected__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_3(&dword_194F3C000, v0, v1, "[DistantDiscoverySession] Failed to retrieve endpoint availability state: %{public}@", v2, v3, v4, v5, v6);
}

void __72__MRAVDistantRoutingDiscoverySession_setHostedRoutingSessionConnection___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __72__MRAVDistantRoutingDiscoverySession_setHostedRoutingSessionConnection___block_invoke_2_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __72__MRAVDistantRoutingDiscoverySession_setHostedRoutingSessionConnection___block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __87__MRAVDistantRoutingDiscoverySession__initializeHostedRoutingConnectionWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_4(&dword_194F3C000, v0, v1, "[DistantDiscoverySession] %@ ERROR: Failed to fetch hosted routing XPC endpoint. %{public}@");
}

void __87__MRAVDistantRoutingDiscoverySession__initializeHostedRoutingConnectionWithCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_4(&dword_194F3C000, v0, v1, "[DistantDiscoverySession] %@ ERROR: Failed to fetch hosted routing XPC endpoint. Will retry. %{public}@");
}

void __87__MRAVDistantRoutingDiscoverySession__initializeHostedRoutingConnectionWithCompletion___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_3(&dword_194F3C000, v0, v1, "[DistantDiscoverySession] ERROR: Failed to fetch hosted routing XPC endpoint. Will not retry since routing discovery session went away. %{public}@", v2, v3, v4, v5, v6);
}

void __78__MRAVDistantRoutingDiscoverySession__reloadHostedRoutingServiceDiscoveryMode__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_3(&dword_194F3C000, v0, v1, "[DistantDiscoverySession] Error setting discovery mode on hosted routing session. %{public}@", v2, v3, v4, v5, v6);
}

void __70__MRAVDistantRoutingDiscoverySession__reloadAvailableDistantEndpoints__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_3(&dword_194F3C000, v0, v1, "[DistantDiscoverySession] Error fetching distant endpoints from hosted routing session: %{public}@", v2, v3, v4, v5, v6);
}

void __74__MRAVDistantRoutingDiscoverySession__reloadAvailableDistantOutputDevices__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_3(&dword_194F3C000, v0, v1, "[DistantDiscoverySession] Error fetching distant output devices from hosted routing session: %{public}@", v2, v3, v4, v5, v6);
}

@end