@interface BSXPCConnectionListenerManager
+ (id)defaultHandlerQueue;
+ (id)sharedInstance;
+ (void)listenForService:(id)a3 onQueue:(id)a4 withHandler:(id)a5;
+ (void)stopListeningForService:(id)a3;
- (BSXPCConnectionListenerManager)init;
- (void)dealloc;
@end

@implementation BSXPCConnectionListenerManager

+ (id)sharedInstance
{
  self;
  if (qword_1EB21B0F0 != -1) {
    dispatch_once(&qword_1EB21B0F0, &__block_literal_global_9);
  }
  v0 = (void *)_MergedGlobals_11;
  return v0;
}

void __48__BSXPCConnectionListenerManager_sharedInstance__block_invoke()
{
  v0 = [BSXPCConnectionListenerManager alloc];
  if (v0)
  {
    v11.receiver = v0;
    v11.super_class = (Class)BSXPCConnectionListenerManager;
    v1 = objc_msgSendSuper2(&v11, sel_init);
    if (v1)
    {
      dispatch_queue_t v2 = BSDispatchQueueCreateWithQualityOfService("com.apple.baseboard.xpc.connectionListening", 0, QOS_CLASS_USER_INTERACTIVE, 0);
      v3 = (void *)v1[1];
      v1[1] = v2;

      id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v5 = (void *)v1[2];
      v1[2] = v4;

      id v6 = objc_alloc_init(MEMORY[0x1E4F28E08]);
      v7 = (void *)v1[3];
      v1[3] = v6;

      dispatch_queue_t v8 = BSDispatchQueueCreateWithQualityOfService("com.apple.baseboard.xpc.connectionListening", 0, QOS_CLASS_USER_INITIATED, 0);
      v9 = (void *)v1[4];
      v1[4] = v8;
    }
  }
  else
  {
    v1 = 0;
  }
  v10 = (void *)_MergedGlobals_11;
  _MergedGlobals_11 = (uint64_t)v1;
}

- (BSXPCConnectionListenerManager)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"BSXPCConnectionListenerManager.m" lineNumber:114 description:@"init is not allowed"];

  return 0;
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = self->_services;
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = [(NSMutableDictionary *)self->_services objectForKey:*(void *)(*((void *)&v11 + 1) + 8 * v6)];
        dispatch_queue_t v8 = (void *)v7;
        if (v7)
        {
          v9 = *(void **)(v7 + 8);
          *(void *)(v7 + 8) = 0;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  v10.receiver = self;
  v10.super_class = (Class)BSXPCConnectionListenerManager;
  [(BSXPCConnectionListenerManager *)&v10 dealloc];
}

void __66__BSXPCConnectionListenerManager__addService_withHandler_onQueue___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x18C125360]();
  Class Class = object_getClass(v3);
  if (Class == (Class)MEMORY[0x1E4F145A8])
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Error on %@: %s", *(void *)(a1 + 32), xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x1E4F14530]) format];
  }
  else if (Class == (Class)MEMORY[0x1E4F14578])
  {
    uint64_t v7 = *(void **)(a1 + 32);
    if (v7)
    {
      Property = objc_getProperty(v7, v6, 32, 1);
      v9 = *(void **)(a1 + 32);
    }
    else
    {
      v9 = 0;
      Property = 0;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__BSXPCConnectionListenerManager__addService_withHandler_onQueue___block_invoke_2;
    block[3] = &unk_1E54456B8;
    id v11 = v9;
    id v12 = v3;
    dispatch_sync(Property, block);
  }
}

void __66__BSXPCConnectionListenerManager__addService_withHandler_onQueue___block_invoke_2(uint64_t a1, const char *a2)
{
  id Property = *(id *)(a1 + 32);
  if (Property) {
    id Property = objc_getProperty(Property, a2, 16, 1);
  }
  id v8 = Property;
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  if (v5) {
    id v7 = objc_getProperty(v5, v4, 24, 1);
  }
  else {
    id v7 = 0;
  }
  [v8 handleIncomingConnection:v6 forService:v7];
}

+ (id)defaultHandlerQueue
{
  uint64_t v2 = +[BSXPCConnectionListenerManager sharedInstance]();
  id v3 = (void *)v2;
  if (v2) {
    id v4 = *(id *)(v2 + 32);
  }
  else {
    id v4 = 0;
  }

  return v4;
}

+ (void)listenForService:(id)a3 onQueue:(id)a4 withHandler:(id)a5
{
  id v7 = a3;
  id v35 = a4;
  id v34 = a5;
  uint64_t v8 = +[BSXPCConnectionListenerManager sharedInstance]();
  id v39 = v7;
  id v9 = v34;
  id v10 = v35;
  if (v8)
  {
    id v11 = (void *)MEMORY[0x18C125360]();
    id v38 = v10;
    [*(id *)(v8 + 24) lock];
    if (!v9)
    {
      v27 = [MEMORY[0x1E4F28B00] currentHandler];
      [v27 handleFailureInMethod:sel__addService_withHandler_onQueue_, v8, @"BSXPCConnectionListenerManager.m", 148, @"cannot add a nil handler -> service = %@", v39 object file lineNumber description];
    }
    if (!v39)
    {
      v28 = [MEMORY[0x1E4F28B00] currentHandler];
      [v28 handleFailureInMethod:sel__addService_withHandler_onQueue_, v8, @"BSXPCConnectionListenerManager.m", 149, @"cannot add a handler for a nil service -> objc_super handler = %@", v9 object file lineNumber description];

      v29 = [MEMORY[0x1E4F28B00] currentHandler];
      [v29 handleFailureInMethod:sel__addService_withHandler_onQueue_, v8, @"BSXPCConnectionListenerManager.m", 150, @"cannot add a handler without a queue -> service = %@ : objc_super handler = %@", 0, v9 object file lineNumber description];
    }
    id v12 = objc_msgSend(*(id *)(v8 + 16), "objectForKey:");

    if (v12)
    {
      v30 = [MEMORY[0x1E4F28B00] currentHandler];
      [v30 handleFailureInMethod:sel__addService_withHandler_onQueue_, v8, @"BSXPCConnectionListenerManager.m", 151, @"cannot add a service twice -> service = %@ : objc_super handler = %@", v39, v9 object file lineNumber description];
    }
    id v36 = a4;
    id v13 = v39;
    xpc_connection_t obj = xpc_connection_create_mach_service((const char *)[v13 UTF8String], *(dispatch_queue_t *)(v8 + 8), 1uLL);
    long long v14 = [BSXPCConnectionListener alloc];
    v15 = obj;
    id v16 = v13;
    id v17 = v9;
    id v18 = v10;
    if (!v14)
    {
      v20 = 0;
LABEL_16:

      handler.receiver = (id)MEMORY[0x1E4F143A8];
      handler.super_class = (Class)3221225472;
      v41 = __66__BSXPCConnectionListenerManager__addService_withHandler_onQueue___block_invoke;
      v42 = &unk_1E5445D00;
      v23 = v20;
      v43 = v23;
      xpc_connection_set_event_handler(v15, &handler);
      v25 = *(void **)(v8 + 16);
      id v10 = v38;
      if (v23) {
        id Property = objc_getProperty(v23, v24, 24, 1);
      }
      else {
        id Property = 0;
      }
      [v25 setObject:v23 forKey:Property];
      xpc_connection_resume(v15);
      [*(id *)(v8 + 24) unlock];

      goto LABEL_19;
    }
    if (v15)
    {
      if (v9)
      {
LABEL_11:
        if (!v39)
        {
          v33 = [MEMORY[0x1E4F28B00] currentHandler];
          [v33 handleFailureInMethod:sel_initWithConnection_forService_withHandler_onQueue_ object:v14 file:@"BSXPCConnectionListenerManager.m" lineNumber:43 description:@"cannot initialize without a service"];
        }
        handler.receiver = v14;
        handler.super_class = (Class)BSXPCConnectionListener;
        v19 = objc_msgSendSuper2(&handler, sel_init);
        v20 = v19;
        if (v19)
        {
          objc_storeStrong(v19 + 1, obj);
          objc_storeStrong(v20 + 2, a5);
          uint64_t v21 = [v16 copy];
          id v22 = v20[3];
          v20[3] = (id)v21;

          if (v18) {
            objc_storeStrong(v20 + 4, v36);
          }
        }
        goto LABEL_16;
      }
    }
    else
    {
      v31 = [MEMORY[0x1E4F28B00] currentHandler];
      [v31 handleFailureInMethod:sel_initWithConnection_forService_withHandler_onQueue_ object:v14 file:@"BSXPCConnectionListenerManager.m" lineNumber:41 description:@"cannot initialize with a NULL connection"];

      if (v9) {
        goto LABEL_11;
      }
    }
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:sel_initWithConnection_forService_withHandler_onQueue_ object:v14 file:@"BSXPCConnectionListenerManager.m" lineNumber:42 description:@"cannot initialize without a handler"];

    goto LABEL_11;
  }
LABEL_19:
}

+ (void)stopListeningForService:(id)a3
{
  id v3 = a3;
  +[BSXPCConnectionListenerManager sharedInstance]();
  id v4 = (id *)objc_claimAutoreleasedReturnValue();
  id v9 = v3;
  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x18C125360]();
    [v4[3] lock];
    uint64_t v6 = [v4[2] objectForKey:v9];
    id v7 = (void *)v6;
    if (v6)
    {
      uint64_t v8 = *(void **)(v6 + 8);
      *(void *)(v6 + 8) = 0;
    }
    [v4[2] removeObjectForKey:v9];
    [v4[3] unlock];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultHandlerQueue, 0);
  objc_storeStrong((id *)&self->_servicesLock, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_listeningQueue, 0);
}

@end