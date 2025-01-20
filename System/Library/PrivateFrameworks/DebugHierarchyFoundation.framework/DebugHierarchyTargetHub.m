@interface DebugHierarchyTargetHub
+ (float)debugHierarchyVersion;
+ (id)performDebugRequest:(int64_t)a3;
+ (id)sharedHub;
- (BOOL)performRequestInPlaceWithRequestInBase64:(id)a3;
- (DebugHierarchyRuntimeInfo)runtimeInfo;
- (DebugHierarchyTargetHub)init;
- (NSData)response;
- (NSMapTable)knownObjectsMap;
- (NSMutableDictionary)additionalKnownObjects;
- (NSString)currentRequestInBase64;
- (OS_dispatch_queue)agentConnectionQueue;
- (OS_xpc_object)currentReply;
- (const)currentResponseBytes;
- (id)performRequest:(id)a3;
- (id)performRequest:(id)a3 error:(id *)a4;
- (id)performRequestWithRequestInBase64:(id)a3;
- (int)currentResponseFileDescriptor;
- (int)darwinNotificationToken;
- (unint64_t)currentResponseLength;
- (void)clearAllRequestsAndData;
- (void)handleXPCEvent:(id)a3;
- (void)openXPCConnection;
- (void)performRequestAndWriteResponseToFileDescriptorWithRequestInBase64:(id)a3 fileDescriptor:(int)a4;
- (void)registerForDarwinNotifications;
- (void)setAdditionalKnownObjects:(id)a3;
- (void)setCurrentReply:(id)a3;
- (void)setCurrentRequest:(id)a3 responseFileDescriptor:(int)a4 reply:(id)a5;
- (void)setCurrentRequestInBase64:(id)a3;
- (void)setCurrentResponseFileDescriptor:(int)a3;
@end

@implementation DebugHierarchyTargetHub

+ (float)debugHierarchyVersion
{
  return 4.0;
}

+ (id)sharedHub
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __36__DebugHierarchyTargetHub_sharedHub__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedHub_onceToken_0 != -1) {
    dispatch_once(&sharedHub_onceToken_0, block);
  }
  v2 = (void *)sharedHub_sharedHub_0;
  return v2;
}

uint64_t __36__DebugHierarchyTargetHub_sharedHub__block_invoke(uint64_t a1)
{
  sharedHub_sharedHub_0 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return _objc_release_x1();
}

- (DebugHierarchyTargetHub)init
{
  v10.receiver = self;
  v10.super_class = (Class)DebugHierarchyTargetHub;
  v2 = [(DebugHierarchyTargetHub *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("DebugHierarchyAgentXPCQueue", 0);
    agentConnectionQueue = v2->_agentConnectionQueue;
    v2->_agentConnectionQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = +[NSMapTable strongToWeakObjectsMapTable];
    knownObjectsMap = v2->_knownObjectsMap;
    v2->_knownObjectsMap = (NSMapTable *)v5;

    uint64_t v7 = objc_opt_new();
    additionalKnownObjects = v2->_additionalKnownObjects;
    v2->_additionalKnownObjects = (NSMutableDictionary *)v7;
  }
  return v2;
}

- (void)clearAllRequestsAndData
{
  knownObjectsMap = self->_knownObjectsMap;
  self->_knownObjectsMap = 0;

  runtimeInfo = self->_runtimeInfo;
  self->_runtimeInfo = 0;

  response = self->_response;
  self->_response = 0;

  additionalKnownObjects = self->_additionalKnownObjects;
  self->_additionalKnownObjects = 0;

  DBGClearCachedFormatSpecifiers();
}

- (NSMapTable)knownObjectsMap
{
  knownObjectsMap = self->_knownObjectsMap;
  if (!knownObjectsMap)
  {
    v4 = +[NSMapTable strongToWeakObjectsMapTable];
    uint64_t v5 = self->_knownObjectsMap;
    self->_knownObjectsMap = v4;

    knownObjectsMap = self->_knownObjectsMap;
  }
  return knownObjectsMap;
}

- (NSMutableDictionary)additionalKnownObjects
{
  additionalKnownObjects = self->_additionalKnownObjects;
  if (!additionalKnownObjects)
  {
    v4 = (NSMutableDictionary *)objc_opt_new();
    uint64_t v5 = self->_additionalKnownObjects;
    self->_additionalKnownObjects = v4;

    additionalKnownObjects = self->_additionalKnownObjects;
  }
  return additionalKnownObjects;
}

- (DebugHierarchyRuntimeInfo)runtimeInfo
{
  runtimeInfo = self->_runtimeInfo;
  if (!runtimeInfo)
  {
    v4 = objc_alloc_init(DebugHierarchyRuntimeInfo);
    uint64_t v5 = self->_runtimeInfo;
    self->_runtimeInfo = v4;

    runtimeInfo = self->_runtimeInfo;
  }
  return runtimeInfo;
}

- (id)performRequestWithRequestInBase64:(id)a3
{
  id v4 = a3;
  id v15 = 0;
  uint64_t v5 = +[DebugHierarchyRequest requestWithBase64Data:v4 error:&v15];
  id v6 = v15;
  if (v6)
  {
    v8 = [v6 debugHierarchyResponseDataForRequest:v5];
  }
  else
  {
    id v14 = 0;
    v9 = [(DebugHierarchyTargetHub *)self performRequest:v5 error:&v14];
    id v10 = v14;
    v11 = v10;
    if (v10)
    {
      id v12 = [v10 debugHierarchyResponseDataForRequest:v5];
    }
    else
    {
      id v12 = v9;
    }
    v8 = v12;
  }

  return v8;
}

- (id)performRequest:(id)a3
{
  return [(DebugHierarchyTargetHub *)self performRequest:a3 error:0];
}

- (id)performRequest:(id)a3 error:(id *)a4
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = DebugHierarchyRequestsOSLog_0();
    os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, v4);
    uint64_t v7 = v5;
    v8 = v7;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      v9 = [v4 name];
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v9;
      _os_signpost_emit_with_name_impl(&dword_0, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "Perform Request", "(%{public}@)", (uint8_t *)&buf, 0xCu);
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v28 = 0x3032000000;
    v29 = __Block_byref_object_copy_;
    v30 = __Block_byref_object_dispose_;
    id v31 = 0;
    v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    v21 = __48__DebugHierarchyTargetHub_performRequest_error___block_invoke;
    v22 = &unk_24410;
    id v10 = v4;
    id v23 = v10;
    p_long long buf = &buf;
    v11 = objc_retainBlock(&v19);
    if (+[NSThread isMainThread]) {
      ((void (*)(void ***))v11[2])(v11);
    }
    else {
      dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v11);
    }
    v13 = DebugHierarchyRequestsOSLog_0();
    os_signpost_id_t v14 = os_signpost_id_make_with_pointer(v13, v10);
    id v15 = v13;
    v16 = v15;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      id v17 = [*(id *)(*((void *)&buf + 1) + 40) length];
      *(_DWORD *)v25 = 134217984;
      id v26 = v17;
      _os_signpost_emit_with_name_impl(&dword_0, v16, OS_SIGNPOST_INTERVAL_END, v14, "Perform Request", "Completed with size: %{xcode:size-in-bytes}lu", v25, 0xCu);
    }

    id v12 = *(id *)(*((void *)&buf + 1) + 40);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

void __48__DebugHierarchyTargetHub_performRequest_error___block_invoke(uint64_t a1)
{
  v2 = +[DebugHierarchyRequestExecutor executorWithRequest:*(void *)(a1 + 32)];
  id v7 = 0;
  uint64_t v3 = [v2 runWithError:&v7];
  id v4 = v7;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  os_signpost_id_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (BOOL)performRequestInPlaceWithRequestInBase64:(id)a3
{
  id v4 = [(DebugHierarchyTargetHub *)self performRequestWithRequestInBase64:a3];
  response = self->_response;
  self->_response = v4;

  return 1;
}

- (void)performRequestAndWriteResponseToFileDescriptorWithRequestInBase64:(id)a3 fileDescriptor:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = [(DebugHierarchyTargetHub *)self performRequestWithRequestInBase64:v6];
  id v8 = [objc_alloc((Class)NSFileHandle) initWithFileDescriptor:v4 closeOnDealloc:1];
  id v11 = 0;
  unsigned __int8 v9 = [v8 writeData:v7 error:&v11];
  id v10 = v11;
  if ((v9 & 1) == 0 && v10) {
    -[DebugHierarchyTargetHub performRequestAndWriteResponseToFileDescriptorWithRequestInBase64:fileDescriptor:]();
  }
}

- (const)currentResponseBytes
{
  return [(NSData *)self->_response bytes];
}

- (unint64_t)currentResponseLength
{
  return [(NSData *)self->_response length];
}

- (void)registerForDarwinNotifications
{
  __assert_rtn("-[DebugHierarchyTargetHub registerForDarwinNotifications]", "DebugHierarchyTargetHub.m", 169, "notifyStatus == NOTIFY_STATUS_OK");
}

id __57__DebugHierarchyTargetHub_registerForDarwinNotifications__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) openXPCConnection];
}

- (void)openXPCConnection
{
  [(DebugHierarchyTargetHub *)self clearAllRequestsAndData];
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  mach_service = xpc_connection_create_mach_service("com.apple.dt.ViewHierarchyTargetHub.xpc", (dispatch_queue_t)self->_agentConnectionQueue, 0);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = __44__DebugHierarchyTargetHub_openXPCConnection__block_invoke;
  handler[3] = &unk_24460;
  handler[4] = self;
  uint64_t v5 = v3;
  v13 = v5;
  xpc_connection_set_event_handler(mach_service, handler);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __44__DebugHierarchyTargetHub_openXPCConnection__block_invoke_2;
  block[3] = &unk_24488;
  unsigned __int8 v9 = mach_service;
  id v10 = v5;
  id v11 = self;
  id v6 = v5;
  id v7 = mach_service;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

intptr_t __44__DebugHierarchyTargetHub_openXPCConnection__block_invoke(uint64_t a1, uint64_t a2)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __44__DebugHierarchyTargetHub_openXPCConnection__block_invoke_2(uint64_t a1)
{
  xpc_connection_activate(*(xpc_connection_t *)(a1 + 32));
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), empty);
  while (1)
  {
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 40), 0xFFFFFFFFFFFFFFFFLL);
    dispatch_semaphore_t v3 = [*(id *)(a1 + 48) currentRequestInBase64];

    if (!v3) {
      break;
    }
    uint64_t v4 = *(void **)(a1 + 48);
    uint64_t v5 = [v4 currentRequestInBase64];
    objc_msgSend(v4, "performRequestAndWriteResponseToFileDescriptorWithRequestInBase64:fileDescriptor:", v5, objc_msgSend(*(id *)(a1 + 48), "currentResponseFileDescriptor"));

    id v6 = *(_xpc_connection_s **)(a1 + 32);
    id v7 = [*(id *)(a1 + 48) currentReply];
    xpc_connection_send_message(v6, v7);
  }
  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
  [*(id *)(a1 + 48) clearAllRequestsAndData];
}

- (void)handleXPCEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && xpc_get_type(v4) == (xpc_type_t)&_xpc_type_dictionary)
  {
    size_t length = 0;
    data = xpc_dictionary_get_data(v5, "request", &length);
    id v7 = +[NSData dataWithBytes:data length:length];
    id v8 = [objc_alloc((Class)NSString) initWithData:v7 encoding:4];
    uint64_t v9 = xpc_dictionary_dup_fd(v5, "fd");
    if ((v9 & 0x80000000) != 0)
    {
      [(DebugHierarchyTargetHub *)self setCurrentRequest:0 responseFileDescriptor:0xFFFFFFFFLL reply:0];
    }
    else
    {
      uint64_t v10 = v9;
      xpc_object_t reply = xpc_dictionary_create_reply(v5);
      [(DebugHierarchyTargetHub *)self setCurrentRequest:v8 responseFileDescriptor:v10 reply:reply];
    }
  }
  else
  {
    [(DebugHierarchyTargetHub *)self setCurrentRequest:0 responseFileDescriptor:0xFFFFFFFFLL reply:0];
  }
}

- (void)setCurrentRequest:(id)a3 responseFileDescriptor:(int)a4 reply:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  [(DebugHierarchyTargetHub *)self setCurrentRequestInBase64:a3];
  [(DebugHierarchyTargetHub *)self setCurrentResponseFileDescriptor:v5];
  [(DebugHierarchyTargetHub *)self setCurrentReply:v8];
}

+ (id)performDebugRequest:(int64_t)a3
{
  if ((unint64_t)a3 > 1)
  {
    id v8 = 0;
  }
  else
  {
    id v4 = objc_alloc_init(DebugHierarchyPropertyAction);
    [(DebugHierarchyPropertyAction *)v4 setPropertyNames:&__NSArray0__struct exlusive:1];
    uint64_t v10 = v4;
    uint64_t v5 = +[NSArray arrayWithObjects:&v10 count:1];
    id v6 = +[DebugHierarchyRequest requestWithDiscoveryType:1 actions:v5 completion:&__block_literal_global_1];

    [v6 setTimeout:120.0];
    id v7 = +[DebugHierarchyTargetHub sharedHub];
    id v8 = [v7 performRequest:v6];

    if (!a3)
    {

      id v8 = 0;
    }
  }
  return v8;
}

- (NSData)response
{
  return self->_response;
}

- (void)setAdditionalKnownObjects:(id)a3
{
}

- (int)darwinNotificationToken
{
  return self->_darwinNotificationToken;
}

- (OS_dispatch_queue)agentConnectionQueue
{
  return self->_agentConnectionQueue;
}

- (NSString)currentRequestInBase64
{
  return self->_currentRequestInBase64;
}

- (void)setCurrentRequestInBase64:(id)a3
{
}

- (int)currentResponseFileDescriptor
{
  return self->_currentResponseFileDescriptor;
}

- (void)setCurrentResponseFileDescriptor:(int)a3
{
  self->_currentResponseFileDescriptor = a3;
}

- (OS_xpc_object)currentReply
{
  return self->_currentReply;
}

- (void)setCurrentReply:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentReply, 0);
  objc_storeStrong((id *)&self->_currentRequestInBase64, 0);
  objc_storeStrong((id *)&self->_agentConnectionQueue, 0);
  objc_storeStrong((id *)&self->_additionalKnownObjects, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_runtimeInfo, 0);
  objc_storeStrong((id *)&self->_knownObjectsMap, 0);
}

- (void)performRequestAndWriteResponseToFileDescriptorWithRequestInBase64:fileDescriptor:.cold.1()
{
}

@end