@interface GTMTLReplayServiceXPCProxy
- (BOOL)cancel:(unint64_t)a3;
- (BOOL)load:(id)a3 error:(id *)a4;
- (BOOL)pause:(unint64_t)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)resume:(unint64_t)a3;
- (GTMTLReplayServiceXPCProxy)initWithConnection:(id)a3 serviceInfo:(id)a4;
- (GTProcessInfo)processInfo;
- (id)decode:(id)a3;
- (id)fetch:(id)a3;
- (id)flushRpackets;
- (id)profile:(id)a3;
- (id)query:(id)a3;
- (id)raytrace:(id)a3;
- (id)shaderdebug:(id)a3;
- (id)update:(id)a3;
- (unint64_t)registerObserver:(id)a3;
- (void)deregisterObserver:(unint64_t)a3;
- (void)display:(id)a3;
- (void)terminateProcess;
@end

@implementation GTMTLReplayServiceXPCProxy

- (GTMTLReplayServiceXPCProxy)initWithConnection:(id)a3 serviceInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v48.receiver = self;
  v48.super_class = (Class)GTMTLReplayServiceXPCProxy;
  v9 = [(GTMTLReplayServiceXPCProxy *)&v48 init];
  if (v9)
  {
    os_log_t v10 = os_log_create("com.apple.gputools.transport", "ReplayProxy");
    log = v9->_log;
    v9->_log = (OS_os_log *)v10;

    v12 = &unk_26EFBE8E8;
    v13 = [v8 serviceProperties];
    v14 = [v13 protocolName];
    v15 = NSStringFromProtocol((Protocol *)v12);
    char v16 = [v14 isEqualToString:v15];

    if (v16)
    {
      uint64_t v17 = [v8 processInfo];
      processInfo = v9->_processInfo;
      v9->_processInfo = (GTProcessInfo *)v17;

      objc_storeStrong((id *)&v9->_gtXPCConnection, a3);
      v19 = [GTServiceConnection alloc];
      v20 = [v8 serviceProperties];
      v21 = [v20 deviceUDID];
      v22 = [v8 serviceProperties];
      uint64_t v23 = -[GTServiceConnection initWithConnection:device:port:](v19, "initWithConnection:device:port:", v7, v21, [v22 servicePort]);
      connection = v9->_connection;
      v9->_connection = (GTServiceConnection *)v23;

      v25 = +[GTServiceProperties protocolMethods:v12];
      v26 = [v8 serviceProperties];
      v27 = [v26 protocolMethods];
      uint64_t v28 = newSetWithArrayMinusArray(v25, v27);
      ignoreMethods = v9->_ignoreMethods;
      v9->_ignoreMethods = (NSSet *)v28;

      xpc_object_t empty = xpc_dictionary_create_empty();
      xpc_dictionary_set_string(empty, "_cmd", "bulkDataService");
      v31 = v9->_connection;
      id v47 = 0;
      v32 = [(GTServiceConnection *)v31 sendMessageWithReplySync:empty error:&v47];
      id v33 = v47;
      if (v32)
      {
        uint64_t v34 = objc_opt_class();
        nsobject = xpc_dictionary_get_nsobject(v32, "returnValue", v34);
        v36 = [[GTBulkDataServiceXPCProxy alloc] initWithConnection:v7 remoteProperties:nsobject];
        bulkDataProxy = v9->_bulkDataProxy;
        v9->_bulkDataProxy = v36;

        v9->_fetchCompressionAlgorithm = 3;
        v38 = (void *)MEMORY[0x263EFFA78];
        uint64_t v39 = [MEMORY[0x263EFFA78] mutableCopy];
        acceleratorStructureSessionToDispatcherId = v9->_acceleratorStructureSessionToDispatcherId;
        v9->_acceleratorStructureSessionToDispatcherId = (NSMutableDictionary *)v39;

        uint64_t v41 = [v38 mutableCopy];
        observerIdToPort = v9->_observerIdToPort;
        v9->_observerIdToPort = (NSMutableDictionary *)v41;

        if (qword_268A95A60) {
          v9->_tstream = (GTTpacketStream *)GTTpacket_stream((void *)GT_TRANSPORT_ENV);
        }
      }
      else
      {
        v44 = v9->_log;
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
          -[GTMTLReplayServiceXPCProxy initWithConnection:serviceInfo:](v44, v33);
        }
      }

      if (v32) {
        goto LABEL_13;
      }
    }
    else
    {
      v43 = v9->_log;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
        -[GTMTLReplayServiceXPCProxy initWithConnection:serviceInfo:](v43, v8, (Protocol *)v12);
      }
    }
    v45 = 0;
    goto LABEL_15;
  }
LABEL_13:
  v45 = v9;
LABEL_15:

  return v45;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  ignoreMethods = self->_ignoreMethods;
  v6 = NSStringFromSelector(a3);
  if ([(NSSet *)ignoreMethods containsObject:v6])
  {
    BOOL v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)GTMTLReplayServiceXPCProxy;
    BOOL v7 = [(GTMTLReplayServiceXPCProxy *)&v9 respondsToSelector:a3];
  }

  return v7;
}

- (unint64_t)registerObserver:(id)a3
{
  id v5 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  id v8 = [[GTMTLReplayErrorReplyStream alloc] initWithObserver:v5];

  unint64_t v9 = [(GTServiceConnection *)self->_connection registerDispatcher:v8];
  os_log_t v10 = [(GTServiceConnection *)self->_connection sendMessageWithReplySync:empty replyStreamId:v9 error:0];
  v11 = v10;
  if (v10)
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v10, "observerId");
    v13 = [NSNumber numberWithUnsignedLongLong:v9];
    observerIdToPort = self->_observerIdToPort;
    v15 = [NSNumber numberWithUnsignedLongLong:uint64];
    [(NSMutableDictionary *)observerIdToPort setObject:v13 forKeyedSubscript:v15];
  }
  else
  {
    uint64_t uint64 = 0;
  }

  return uint64;
}

- (void)deregisterObserver:(unint64_t)a3
{
  observerIdToPort = self->_observerIdToPort;
  BOOL v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
  id v8 = [(NSMutableDictionary *)observerIdToPort objectForKeyedSubscript:v7];
  uint64_t v9 = [v8 unsignedLongValue];

  os_log_t v10 = self->_observerIdToPort;
  v11 = [NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)v10 removeObjectForKey:v11];

  xpc_object_t xdict = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(xdict, "_cmd", Name);
  xpc_dictionary_set_uint64(xdict, "observerId", a3);
  id v13 = [(GTServiceConnection *)self->_connection sendMessageWithReplySync:xdict error:0];
  [(GTServiceConnection *)self->_connection deregisterDispatcher:v9];
}

- (BOOL)load:(id)a3 error:(id *)a4
{
  id v7 = a3;
  id v8 = [v7 scheme];
  int v9 = [v8 isEqualToString:*MEMORY[0x263F085A8]];

  os_log_t v10 = v7;
  if (v9)
  {
    v11 = allServices(self->_gtXPCConnection);
    v12 = filteredArrayByService(v11, (Protocol *)&unk_26EFBD7A0);
    id v13 = [v12 firstObject];

    v14 = [GTURLAccessProviderXPCProxy alloc];
    gtXPCConnection = self->_gtXPCConnection;
    char v16 = [v13 serviceProperties];
    uint64_t v17 = [(GTURLAccessProviderXPCProxy *)v14 initWithConnection:gtXPCConnection remoteProperties:v16];

    [v7 startAccessingSecurityScopedResource];
    os_log_t v10 = [(GTURLAccessProviderXPCProxy *)v17 makeURL:v7];

    [v7 stopAccessingSecurityScopedResource];
  }
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "url", (uint64_t)v10);
  uint64_t v20 = [(GTServiceConnection *)self->_connection sendMessageWithReplySync:empty error:a4];
  v21 = (void *)v20;
  if (v20)
  {
    nserror = (void *)xpc_dictionary_get_nserror(v20, "error");
    uint64_t v23 = nserror;
    BOOL v24 = nserror == 0;
    if (nserror)
    {
      if (a4) {
        *a4 = nserror;
      }
    }
    else
    {
      v25 = objc_alloc_init(GTReplayLoadRequest);
      [(GTReplayLoadRequest *)v25 setGputraceURL:v10];
      tstream = self->_tstream;
      v27 = sel_getName(a2);
      GTTpacket_record((uint64_t)tstream, (uint64_t)v27, v25);
    }
  }
  else
  {
    BOOL v24 = 0;
  }

  return v24;
}

- (id)flushRpackets
{
  tstream = self->_tstream;
  if (tstream)
  {
    v4 = GTTpacket_finish((uint64_t)tstream);
    self->_tstream = 0;
    id v5 = [MEMORY[0x263EFF990] dataWithLength:dispatch_data_get_size(v4)];
    applier[0] = MEMORY[0x263EF8330];
    applier[1] = 3221225472;
    applier[2] = __43__GTMTLReplayServiceXPCProxy_flushRpackets__block_invoke;
    applier[3] = &unk_264E28F20;
    id v6 = v5;
    id v9 = v6;
    dispatch_data_apply(v4, applier);
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

uint64_t __43__GTMTLReplayServiceXPCProxy_flushRpackets__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return 1;
}

- (void)terminateProcess
{
  xpc_object_t xdict = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(xdict, "_cmd", Name);
  [(GTServiceConnection *)self->_connection sendMessageAndWaitForDelivery:xdict];
}

- (id)fetch:(id)a3
{
  tstream = self->_tstream;
  id v6 = a3;
  Name = sel_getName(a2);
  GTTpacket_recordBatch((uint64_t)tstream, (uint64_t)Name, v6);
  connection = self->_connection;
  id v9 = sel_getName(a2);
  os_log_t v10 = ProxyReplayerBatchRequest(connection, self, v6, v9, self->_bulkDataProxy, self->_fetchCompressionAlgorithm);

  return v10;
}

- (id)query:(id)a3
{
  tstream = self->_tstream;
  id v6 = a3;
  Name = sel_getName(a2);
  GTTpacket_recordBatch((uint64_t)tstream, (uint64_t)Name, v6);
  connection = self->_connection;
  id v9 = sel_getName(a2);
  os_log_t v10 = ProxyReplayerBatchRequest(connection, self, v6, v9, self->_bulkDataProxy, 0);

  return v10;
}

- (id)update:(id)a3
{
  tstream = self->_tstream;
  id v6 = a3;
  Name = sel_getName(a2);
  GTTpacket_recordBatch((uint64_t)tstream, (uint64_t)Name, v6);
  connection = self->_connection;
  id v9 = sel_getName(a2);
  os_log_t v10 = ProxyReplayerBatchRequest(connection, self, v6, v9, self->_bulkDataProxy, 0);

  return v10;
}

- (id)decode:(id)a3
{
  tstream = self->_tstream;
  id v6 = a3;
  Name = sel_getName(a2);
  GTTpacket_recordBatch((uint64_t)tstream, (uint64_t)Name, v6);
  connection = self->_connection;
  id v9 = sel_getName(a2);
  os_log_t v10 = ProxyReplayerBatchRequest(connection, self, v6, v9, self->_bulkDataProxy, 0);

  return v10;
}

- (void)display:(id)a3
{
  id v5 = a3;
  xpc_object_t xdict = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(xdict, "_cmd", Name);
  xpc_dictionary_set_nsobject(xdict, "request", (uint64_t)v5);
  tstream = self->_tstream;
  id v8 = sel_getName(a2);
  GTTpacket_record((uint64_t)tstream, (uint64_t)v8, v5);

  [(GTServiceConnection *)self->_connection sendMessage:xdict];
}

- (id)profile:(id)a3
{
  id v5 = a3;
  id v6 = -[GTReplayRequestToken initWithService:andTokenId:]([GTReplayRequestToken alloc], "initWithService:andTokenId:", self, [v5 requestID]);
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "request", (uint64_t)v5);
  xpc_dictionary_set_uint64(empty, "token", [(GTReplayRequestToken *)v6 tokenId]);
  id v9 = [GTReplayProfileReplyStream alloc];
  os_log_t v10 = [v5 streamHandler];
  v11 = [(GTReplayProfileReplyStream *)v9 initWithCallback:v10 bulkDataProxy:self->_bulkDataProxy andToken:v6];

  [(GTReplayProfileReplyStream *)v11 setDispatcherId:[(GTServiceConnection *)self->_connection registerDispatcher:v11]];
  tstream = self->_tstream;
  id v13 = sel_getName(a2);
  GTTpacket_record((uint64_t)tstream, (uint64_t)v13, v5);

  [(GTServiceConnection *)self->_connection sendMessage:empty withReplyStreamId:[(GTReplayProfileReplyStream *)v11 dispatcherId] replyHandler:&__block_literal_global_0];
  return v6;
}

- (id)shaderdebug:(id)a3
{
  id v5 = a3;
  id v6 = -[GTReplayRequestToken initWithService:andTokenId:]([GTReplayRequestToken alloc], "initWithService:andTokenId:", self, [v5 requestID]);
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "request", (uint64_t)v5);
  xpc_dictionary_set_uint64(empty, "token", [(GTReplayRequestToken *)v6 tokenId]);
  tstream = self->_tstream;
  os_log_t v10 = sel_getName(a2);
  GTTpacket_record((uint64_t)tstream, (uint64_t)v10, v5);
  connection = self->_connection;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __42__GTMTLReplayServiceXPCProxy_shaderdebug___block_invoke;
  v17[3] = &unk_264E28D70;
  id v18 = v5;
  v12 = v6;
  v19 = v12;
  id v13 = v5;
  [(GTServiceConnection *)connection sendMessage:empty replyHandler:v17];
  v14 = v19;
  v15 = v12;

  return v15;
}

void __42__GTMTLReplayServiceXPCProxy_shaderdebug___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if (v12)
  {
    id v6 = objc_alloc(MEMORY[0x263EFFA08]);
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    id v9 = objc_msgSend(v6, "initWithObjects:", v7, v8, objc_opt_class(), 0);
    nsobject_classes = (void *)xpc_dictionary_get_nsobject_classes(v12, "response", v9);
  }
  else
  {
    nsobject_classes = objc_opt_new();
    [nsobject_classes setError:v5];
  }
  v11 = [*(id *)(a1 + 32) completionHandler];
  ((void (**)(void, void *))v11)[2](v11, nsobject_classes);

  [*(id *)(a1 + 40) completed];
}

- (id)raytrace:(id)a3
{
  id v5 = a3;
  id v6 = -[GTReplayRequestToken initWithService:andTokenId:]([GTReplayRequestToken alloc], "initWithService:andTokenId:", self, [v5 requestID]);
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "request", (uint64_t)v5);
  xpc_dictionary_set_uint64(empty, "token", [(GTReplayRequestToken *)v6 tokenId]);
  id v9 = [GTReplayADSReplyStream alloc];
  os_log_t v10 = [v5 streamHandler];
  v11 = [(GTReplayADSReplyStream *)v9 initWithCallback:v10 bulkDataProxy:self->_bulkDataProxy andToken:v6];

  [(GTReplayADSReplyStream *)v11 setDispatcherId:[(GTServiceConnection *)self->_connection registerDispatcher:v11]];
  tstream = self->_tstream;
  id v13 = sel_getName(a2);
  GTTpacket_record((uint64_t)tstream, (uint64_t)v13, v5);

  [(GTServiceConnection *)self->_connection sendMessage:empty withReplyStreamId:[(GTReplayADSReplyStream *)v11 dispatcherId]];
  return v6;
}

- (BOOL)cancel:(unint64_t)a3
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_uint64(empty, "token", a3);
  uint64_t v8 = [(GTServiceConnection *)self->_connection sendMessageWithReplySync:empty error:0];
  id v9 = v8;
  if (v8) {
    BOOL v10 = xpc_dictionary_get_BOOL(v8, "success");
  }
  else {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)pause:(unint64_t)a3
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_uint64(empty, "token", a3);
  uint64_t v8 = [(GTServiceConnection *)self->_connection sendMessageWithReplySync:empty error:0];
  id v9 = v8;
  if (v8) {
    BOOL v10 = xpc_dictionary_get_BOOL(v8, "success");
  }
  else {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)resume:(unint64_t)a3
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_uint64(empty, "token", a3);
  uint64_t v8 = [(GTServiceConnection *)self->_connection sendMessageWithReplySync:empty error:0];
  id v9 = v8;
  if (v8) {
    BOOL v10 = xpc_dictionary_get_BOOL(v8, "success");
  }
  else {
    BOOL v10 = 0;
  }

  return v10;
}

- (GTProcessInfo)processInfo
{
  return self->_processInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processInfo, 0);
  objc_storeStrong((id *)&self->_observerIdToPort, 0);
  objc_storeStrong((id *)&self->_acceleratorStructureSessionToDispatcherId, 0);
  objc_storeStrong((id *)&self->_bulkDataProxy, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong(&self->_connectionhandler, 0);
  objc_storeStrong((id *)&self->_ignoreMethods, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_gtXPCConnection, 0);
}

- (void)initWithConnection:(void *)a1 serviceInfo:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = a1;
  v4 = [a2 localizedDescription];
  int v5 = 138412290;
  id v6 = v4;
  _os_log_error_impl(&dword_23C048000, v3, OS_LOG_TYPE_ERROR, "Unable to retrieve bulk data service, %@", (uint8_t *)&v5, 0xCu);
}

- (void)initWithConnection:(Protocol *)a3 serviceInfo:.cold.2(void *a1, void *a2, Protocol *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v5 = a1;
  id v6 = [a2 serviceProperties];
  uint64_t v7 = [v6 protocolName];
  uint64_t v8 = NSStringFromProtocol(a3);
  int v9 = 138412546;
  BOOL v10 = v7;
  __int16 v11 = 2112;
  id v12 = v8;
  _os_log_debug_impl(&dword_23C048000, v5, OS_LOG_TYPE_DEBUG, "Remote protocol name %@ does not match %@", (uint8_t *)&v9, 0x16u);
}

@end