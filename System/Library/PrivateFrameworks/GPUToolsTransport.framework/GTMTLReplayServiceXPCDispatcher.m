@interface GTMTLReplayServiceXPCDispatcher
- (GTMTLReplayServiceXPCDispatcher)initWithService:(id)a3 properties:(id)a4 bulkDataService:(id)a5 bulkDataServiceProperties:(id)a6;
- (void)broadcastDisconnect:(id)a3 replyConnection:(id)a4;
- (void)bulkDataService:(id)a3 replyConnection:(id)a4;
- (void)cancel_:(id)a3 replyConnection:(id)a4;
- (void)decode_:(id)a3 replyConnection:(id)a4;
- (void)deregisterObserver_:(id)a3 replyConnection:(id)a4;
- (void)display_:(id)a3 replyConnection:(id)a4;
- (void)fetch_:(id)a3 replyConnection:(id)a4;
- (void)load_error_:(id)a3 replyConnection:(id)a4;
- (void)pause_:(id)a3 replyConnection:(id)a4;
- (void)profile_:(id)a3 replyConnection:(id)a4;
- (void)query_:(id)a3 replyConnection:(id)a4;
- (void)raytrace_:(id)a3 replyConnection:(id)a4;
- (void)registerObserver_:(id)a3 replyConnection:(id)a4;
- (void)resume_:(id)a3 replyConnection:(id)a4;
- (void)shaderdebug_:(id)a3 replyConnection:(id)a4;
- (void)terminateProcess:(id)a3 replyConnection:(id)a4;
- (void)update_:(id)a3 replyConnection:(id)a4;
@end

@implementation GTMTLReplayServiceXPCDispatcher

- (GTMTLReplayServiceXPCDispatcher)initWithService:(id)a3 properties:(id)a4 bulkDataService:(id)a5 bulkDataServiceProperties:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a4;
  v15 = (OS_os_log *)os_log_create("com.apple.gputools.transport", "ReplayDispatcher");
  log = self->_log;
  self->_log = v15;

  v17 = [v14 protocolMethods];

  v18 = (void *)[v17 mutableCopy];
  [v18 addObject:@"bulkDataService"];
  [v18 addObject:@"broadcastDisconnect"];
  v22.receiver = self;
  v22.super_class = (Class)GTMTLReplayServiceXPCDispatcher;
  v19 = [(GTXPCDispatcher *)&v22 initWithProtocolMethods:v18];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_implInstance, a3);
    objc_storeStrong((id *)&v20->_bulkDataService, a5);
    objc_storeStrong((id *)&v20->_bulkDataServiceProperties, a6);
  }

  return v20;
}

- (void)broadcastDisconnect:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  xpc_dictionary_get_array(a3, "_pathHistory");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(GTMTLReplayService *)self->_implInstance broadcastDisconnect:v6 path:v7];
}

- (void)bulkDataService:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  gt_xpc_dictionary_create_reply(a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_nsobject(v7, "returnValue", (uint64_t)self->_bulkDataServiceProperties);
  [v6 sendMessage:v7];
}

- (void)registerObserver_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v10 = [(GTServiceObserver *)[GTMTLReplayServiceObserver alloc] initWithMessage:v7 notifyConnection:v6];
  uint64_t v8 = [(GTMTLReplayService *)self->_implInstance registerObserver:v10];
  v9 = gt_xpc_dictionary_create_reply(v7);

  xpc_dictionary_set_uint64(v9, "observerId", v8);
  [v6 sendMessage:v9];
}

- (void)deregisterObserver_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(GTMTLReplayService *)self->_implInstance deregisterObserver:xpc_dictionary_get_uint64(v7, "observerId")];
  gt_xpc_dictionary_create_reply(v7);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  [v6 sendMessage:v8];
}

- (void)load_error_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = allServices(v6);
  v9 = filteredArrayByService(v8, (Protocol *)&unk_26EFBD7A0);
  v10 = [v9 firstObject];

  id v11 = [GTURLAccessProviderXPCProxy alloc];
  id v12 = [v10 serviceProperties];
  id v13 = [(GTURLAccessProviderXPCProxy *)v11 initWithConnection:v6 remoteProperties:v12];

  uint64_t v14 = objc_opt_class();
  nsobject = xpc_dictionary_get_nsobject(v7, "url", v14);
  v16 = gt_xpc_dictionary_create_reply(v7);

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __63__GTMTLReplayServiceXPCDispatcher_load_error__replyConnection___block_invoke;
  v19[3] = &unk_264E28F68;
  v19[4] = self;
  id v20 = v16;
  id v21 = v6;
  id v17 = v6;
  id v18 = v16;
  [(GTURLAccessProviderXPCProxy *)v13 securityScopedURLFromSandboxID:nsobject completionHandler:v19];
}

void __63__GTMTLReplayServiceXPCDispatcher_load_error__replyConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  v10[1] = *MEMORY[0x263EF8340];
  if (a2)
  {
    v3 = *(void **)(*(void *)(a1 + 32) + 24);
    id v8 = 0;
    [v3 load:a2 error:&v8];
    id v4 = v8;
  }
  else
  {
    v5 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = *MEMORY[0x263F08320];
    id v6 = [NSString stringWithFormat:@"File transfer failed in %@: %@", @"GTReplayService", @"loading GPU trace"];
    v10[0] = v6;
    id v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
    id v4 = [v5 errorWithDomain:@"com.apple.gputools.transport" code:8 userInfo:v7];
  }
  xpc_dictionary_set_nserror(*(void *)(a1 + 40), "error", v4);
  [*(id *)(a1 + 48) sendMessage:*(void *)(a1 + 40)];
}

- (void)terminateProcess:(id)a3 replyConnection:(id)a4
{
}

- (void)fetch_:(id)a3 replyConnection:(id)a4
{
  DispatchReplayerBatchRequest(a4, a3, self->_bulkDataService, 0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = (id)[(GTMTLReplayService *)self->_implInstance fetch:v6];
}

- (void)query_:(id)a3 replyConnection:(id)a4
{
  DispatchReplayerBatchRequest(a4, a3, self->_bulkDataService, 0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = (id)[(GTMTLReplayService *)self->_implInstance query:v6];
}

- (void)update_:(id)a3 replyConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self->_implInstance);
  id v8 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__GTMTLReplayServiceXPCDispatcher_update__replyConnection___block_invoke;
  block[3] = &unk_264E28FB8;
  id v12 = v7;
  id v13 = v6;
  uint64_t v14 = self;
  id v9 = v6;
  id v10 = v7;
  objc_copyWeak(&v15, &location);
  dispatch_async(v8, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __59__GTMTLReplayServiceXPCDispatcher_update__replyConnection___block_invoke(uint64_t a1)
{
  dispatch_group_t v2 = dispatch_group_create();
  v3 = *(void **)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v5 = *(void **)(*(void *)(a1 + 48) + 32);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  void v10[2] = __59__GTMTLReplayServiceXPCDispatcher_update__replyConnection___block_invoke_2;
  v10[3] = &unk_264E28F90;
  id v11 = v3;
  dispatch_group_t v12 = v2;
  id v13 = *(id *)(a1 + 40);
  id v6 = v2;
  id v7 = DispatchReplayerBatchRequest(v11, v4, v5, v10);
  dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v9 = (id)[WeakRetained update:v7];
}

void __59__GTMTLReplayServiceXPCDispatcher_update__replyConnection___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    id v5 = [v4 shaderURL];

    if (v5)
    {
      id v6 = allServices(*(void **)(a1 + 32));
      id v7 = filteredArrayByService(v6, (Protocol *)&unk_26EFBD7A0);
      id v8 = [v7 firstObject];

      id v9 = [GTURLAccessProviderXPCProxy alloc];
      uint64_t v10 = *(void *)(a1 + 32);
      id v11 = [v8 serviceProperties];
      dispatch_group_t v12 = [(GTURLAccessProviderXPCProxy *)v9 initWithConnection:v10 remoteProperties:v11];

      dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
      id v13 = [v4 shaderURL];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __59__GTMTLReplayServiceXPCDispatcher_update__replyConnection___block_invoke_3;
      v18[3] = &unk_264E28BB0;
      id v19 = v4;
      id v20 = *(id *)(a1 + 40);
      [(GTURLAccessProviderXPCProxy *)v12 securityScopedURLFromSandboxID:v13 completionHandler:v18];
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v14 = *(void **)(a1 + 48);
      id v15 = v3;
      v16 = xpc_dictionary_get_array(v14, "_pathHistory");
      [v15 setPath:v16];

      id v17 = [*(id *)(a1 + 32) connection];
      [v15 setConnection:v17];
    }
  }
}

void __59__GTMTLReplayServiceXPCDispatcher_update__replyConnection___block_invoke_3(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setShaderURL:a2];
  id v3 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v3);
}

- (void)decode_:(id)a3 replyConnection:(id)a4
{
  DispatchReplayerBatchRequest(a4, a3, self->_bulkDataService, 0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = (id)[(GTMTLReplayService *)self->_implInstance decode:v6];
}

- (void)display_:(id)a3 replyConnection:(id)a4
{
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id nsobject = xpc_dictionary_get_nsobject(v5, "request", v6);

  [(GTMTLReplayService *)self->_implInstance display:nsobject];
}

- (void)profile_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t uint64 = xpc_dictionary_get_uint64(v7, "_replyStreamId");
  id v9 = xpc_dictionary_get_array(v7, "_pathHistory");
  uint64_t v10 = (void *)MEMORY[0x263EFFA08];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_msgSend(v10, "setWithObjects:", v11, v12, v13, objc_opt_class(), 0);
  nsobject_classes = (void *)xpc_dictionary_get_nsobject_classes(v7, "request", v14);

  v16 = allServices(v6);
  id v17 = filteredArrayByService(v16, (Protocol *)&unk_26EFBD7A0);
  id v18 = [v17 firstObject];

  id v19 = [GTURLAccessProviderXPCProxy alloc];
  id v20 = [v18 serviceProperties];
  id v21 = [(GTURLAccessProviderXPCProxy *)v19 initWithConnection:v6 remoteProperties:v20];

  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __60__GTMTLReplayServiceXPCDispatcher_profile__replyConnection___block_invoke;
  v26[3] = &unk_264E28FE0;
  id v30 = v6;
  uint64_t v31 = uint64;
  id v27 = v9;
  v28 = v21;
  v29 = self;
  id v22 = v6;
  v23 = v21;
  id v24 = v9;
  [nsobject_classes setStreamHandler:v26];
  id v25 = (id)[(GTMTLReplayService *)self->_implInstance profile:nsobject_classes];
}

void __60__GTMTLReplayServiceXPCDispatcher_profile__replyConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "_port", *(void *)(a1 + 64));
  xpc_dictionary_set_value(empty, "_replyPath", *(xpc_object_t *)(a1 + 32));
  id v5 = [v3 data];
  if (v5)
  {
  }
  else
  {
    id v6 = [v3 error];

    if (!v6) {
      goto LABEL_13;
    }
  }
  id v7 = [v3 error];

  unint64_t v8 = 0x263F08000uLL;
  if (!v7)
  {
    id v9 = (void *)MEMORY[0x263EFFA08];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_msgSend(v9, "setWithObjects:", v10, v11, v12, v13, objc_opt_class(), 0);
    id v15 = (void *)MEMORY[0x263F08928];
    v16 = [v3 data];
    id v28 = 0;
    id v17 = [v15 unarchivedObjectOfClasses:v14 fromData:v16 error:&v28];
    id v18 = v28;

    if (!v18 && v17)
    {
      id v19 = [v17 objectForKeyedSubscript:@"Profiler Raw URL"];
      if (v19)
      {
        id v20 = [*(id *)(a1 + 40) makeURL:v19];
        id v21 = (void *)[v17 mutableCopy];
        [v21 setObject:v20 forKeyedSubscript:@"Profiler Raw URL"];
        id v27 = 0;
        id v22 = [MEMORY[0x263F08910] archivedDataWithRootObject:v21 requiringSecureCoding:1 error:&v27];
        id v18 = v27;
        [v3 setData:v22];

        unint64_t v8 = 0x263F08000;
        [v3 setError:v18];
      }
      else
      {
        id v18 = 0;
      }
    }
  }
  v23 = *(void **)(v8 + 2320);
  id v26 = 0;
  id v24 = [v23 archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v26];
  id v25 = v26;
  xpc_dictionary_set_uint64(empty, "bulkDataHandle", [*(id *)(*(void *)(a1 + 48) + 32) handoverDataForDownload:v24]);

LABEL_13:
  [*(id *)(a1 + 56) sendMessage:empty];
}

- (void)shaderdebug_:(id)a3 replyConnection:(id)a4
{
  v22[7] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = (void *)MEMORY[0x263EFFA08];
  id v8 = a3;
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  v22[2] = objc_opt_class();
  v22[3] = objc_opt_class();
  v22[4] = objc_opt_class();
  v22[5] = objc_opt_class();
  v22[6] = objc_opt_class();
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:7];
  uint64_t v10 = [v7 setWithArray:v9];

  nsobject_classes = (void *)xpc_dictionary_get_nsobject_classes(v8, "request", v10);
  uint64_t v12 = gt_xpc_dictionary_create_reply(v8);

  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  id v18 = __64__GTMTLReplayServiceXPCDispatcher_shaderdebug__replyConnection___block_invoke;
  id v19 = &unk_264E29008;
  id v20 = v12;
  id v21 = v6;
  id v13 = v6;
  id v14 = v12;
  [nsobject_classes setCompletionHandler:&v16];
  id v15 = (id)-[GTMTLReplayService shaderdebug:](self->_implInstance, "shaderdebug:", nsobject_classes, v16, v17, v18, v19);
}

uint64_t __64__GTMTLReplayServiceXPCDispatcher_shaderdebug__replyConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  xpc_dictionary_set_nsobject(*(void **)(a1 + 32), "response", a2);
  uint64_t v4 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  return [v3 sendMessage:v4];
}

- (void)raytrace_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t uint64 = xpc_dictionary_get_uint64(v7, "_replyStreamId");
  id v9 = xpc_dictionary_get_array(v7, "_pathHistory");
  uint64_t v10 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  nsobject_classes = (void *)xpc_dictionary_get_nsobject_classes(v7, "request", v10);

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __61__GTMTLReplayServiceXPCDispatcher_raytrace__replyConnection___block_invoke;
  v15[3] = &unk_264E29030;
  id v16 = v9;
  uint64_t v17 = self;
  id v18 = v6;
  uint64_t v19 = uint64;
  id v12 = v6;
  id v13 = v9;
  [nsobject_classes setStreamHandler:v15];
  id v14 = (id)[(GTMTLReplayService *)self->_implInstance raytrace:nsobject_classes];
}

void __61__GTMTLReplayServiceXPCDispatcher_raytrace__replyConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "_port", *(void *)(a1 + 56));
  xpc_dictionary_set_value(empty, "_replyPath", *(xpc_object_t *)(a1 + 32));
  xpc_dictionary_set_uint64(empty, "streamState", [v3 state]);
  id v5 = [v3 data];
  if (v5)
  {

LABEL_4:
    id v14 = 0;
    id v7 = [MEMORY[0x263F08910] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v14];
    id v8 = v14;
    xpc_dictionary_set_uint64(empty, "bulkDataHandle", [*(id *)(*(void *)(a1 + 40) + 32) handoverDataForDownload:v7]);

    goto LABEL_5;
  }
  id v6 = [v3 error];

  if (v6) {
    goto LABEL_4;
  }
  id v9 = [v3 error];

  if (!v9) {
    goto LABEL_6;
  }
  uint64_t v10 = [v3 error];
  id v13 = v10;
  id v8 = [MEMORY[0x263F08910] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v13];
  id v11 = v13;

  uint64_t v12 = [*(id *)(*(void *)(a1 + 40) + 32) handoverDataForDownload:v8];
  xpc_dictionary_set_uint64(empty, "bulkDataHandle", v12);
LABEL_5:

LABEL_6:
  [*(id *)(a1 + 48) sendMessage:empty];
}

- (void)cancel_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  LOBYTE(self) = [(GTMTLReplayService *)self->_implInstance cancel:xpc_dictionary_get_uint64(v7, "token")];
  gt_xpc_dictionary_create_reply(v7);
  xpc_object_t xdict = (xpc_object_t)objc_claimAutoreleasedReturnValue();

  xpc_dictionary_set_BOOL(xdict, "success", (BOOL)self);
  [v6 sendMessage:xdict];
}

- (void)pause_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  LOBYTE(self) = [(GTMTLReplayService *)self->_implInstance pause:xpc_dictionary_get_uint64(v7, "token")];
  gt_xpc_dictionary_create_reply(v7);
  xpc_object_t xdict = (xpc_object_t)objc_claimAutoreleasedReturnValue();

  xpc_dictionary_set_BOOL(xdict, "success", (BOOL)self);
  [v6 sendMessage:xdict];
}

- (void)resume_:(id)a3 replyConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  LOBYTE(self) = [(GTMTLReplayService *)self->_implInstance resume:xpc_dictionary_get_uint64(v7, "token")];
  gt_xpc_dictionary_create_reply(v7);
  xpc_object_t xdict = (xpc_object_t)objc_claimAutoreleasedReturnValue();

  xpc_dictionary_set_BOOL(xdict, "success", (BOOL)self);
  [v6 sendMessage:xdict];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_bulkDataServiceProperties, 0);
  objc_storeStrong((id *)&self->_bulkDataService, 0);
  objc_storeStrong((id *)&self->_implInstance, 0);
}

@end