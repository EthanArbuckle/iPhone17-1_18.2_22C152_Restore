@interface BSBaseXPCClient
- (BOOL)isSuspended;
- (BSBaseXPCClient)init;
- (BSBaseXPCClient)initWithEndpoint:(id)a3;
- (BSBaseXPCClient)initWithServiceName:(id)a3;
- (BSBaseXPCClient)initWithServiceName:(id)a3 endpoint:(id)a4;
- (id)_connection;
- (id)_connectionInstanceUUID;
- (id)_errorFromMessageIfAny:(id)a3;
- (id)_getStringFromMessage:(id)a3 key:(char *)a4;
- (id)queue_connection;
- (void)_sendMessage:(id)a3;
- (void)_sendMessage:(id)a3 withReplyHandler:(id)a4 waitForReply:(BOOL)a5 waitDuration:(unint64_t)a6;
- (void)_sendMessageReply:(id)a3 messagePacker:(id)a4;
- (void)_sendReplyForMessage:(id)a3 messagePacker:(id)a4;
- (void)_setEndpoint:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)queue_invalidateAndFlush:(uint64_t)a1;
- (void)queue_registerWithServerIfNecessary;
- (void)queue_resumeConnection;
- (void)reconnectIfNecessary;
- (void)resumeConnection;
- (void)suspendConnection;
@end

@implementation BSBaseXPCClient

- (BSBaseXPCClient)init
{
  return 0;
}

- (BSBaseXPCClient)initWithServiceName:(id)a3
{
  return [(BSBaseXPCClient *)self initWithServiceName:a3 endpoint:0];
}

- (BSBaseXPCClient)initWithServiceName:(id)a3 endpoint:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)BSBaseXPCClient;
  v6 = [(BSBaseXPCClient *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_notifyToken = -1;
    v6->_serviceName = (NSString *)[a3 copy];
    v7->_queue = (OS_dispatch_queue *)BSDispatchQueueCreateWithQualityOfService((const char *)[a3 UTF8String], 0, QOS_CLASS_USER_INITIATED, 0);
    v7->_serverEndpoint = (OS_xpc_object *)a4;
    v7->_clientInvalidated = 0;
  }
  return v7;
}

- (BSBaseXPCClient)initWithEndpoint:(id)a3
{
  return [(BSBaseXPCClient *)self initWithServiceName:@"queue" endpoint:a3];
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_connection)
  {
    if (![(BSAtomicSignal *)self->_invalidationSignal hasBeenSignalled])
    {
      v3 = BSLogCommon();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v7 = "-[BSBaseXPCClient dealloc]";
        __int16 v8 = 2114;
        objc_super v9 = self;
        _os_log_error_impl(&dword_18AAA8000, v3, OS_LOG_TYPE_ERROR, "%s API violation: %{public}@ released before calling -invalidate", buf, 0x16u);
      }
    }
  }
  dispatch_release((dispatch_object_t)self->_queue);
  self->_queue = 0;
  -[BSBaseXPCClient queue_invalidateAndFlush:]((uint64_t)self, 1);

  self->_invalidationSignal = 0;
  serverEndpoint = self->_serverEndpoint;
  if (serverEndpoint)
  {
    xpc_release(serverEndpoint);
    self->_serverEndpoint = 0;
  }

  if (notify_is_valid_token(self->_notifyToken))
  {
    notify_cancel(self->_notifyToken);
    self->_notifyToken = -1;
  }
  v5.receiver = self;
  v5.super_class = (Class)BSBaseXPCClient;
  [(BSBaseXPCClient *)&v5 dealloc];
}

- (void)queue_invalidateAndFlush:(uint64_t)a1
{
  if (a1)
  {
    [*(id *)(a1 + 16) signal];
    v4 = *(_xpc_connection_s **)(a1 + 48);
    if (v4)
    {
      v6[0] = 0;
      v6[1] = v6;
      v6[2] = 0x3052000000;
      v6[3] = __Block_byref_object_copy__4;
      v6[4] = __Block_byref_object_dispose__4;
      v6[5] = v4;
      *(void *)(a1 + 48) = 0;
      if (a2)
      {
        barrier[0] = MEMORY[0x1E4F143A8];
        barrier[1] = 3221225472;
        barrier[2] = __44__BSBaseXPCClient_queue_invalidateAndFlush___block_invoke;
        barrier[3] = &unk_1E5445FE0;
        barrier[4] = v6;
        xpc_connection_send_barrier(v4, barrier);
      }
      else
      {
        xpc_release(v4);
      }
      objc_msgSend((id)a1, "queue_connectionWasDestroyed");
      _Block_object_dispose(v6, 8);
    }
  }
}

- (BOOL)isSuspended
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__BSBaseXPCClient_isSuspended__block_invoke;
  v5[3] = &unk_1E5445890;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __30__BSBaseXPCClient_isSuspended__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1) {
    LOBYTE(v1) = *(unsigned char *)(v1 + 56) != 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v1;
  return result;
}

- (void)reconnectIfNecessary
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__BSBaseXPCClient_reconnectIfNecessary__block_invoke;
  block[3] = &unk_1E5445818;
  block[4] = self;
  dispatch_async(queue, block);
}

void __39__BSBaseXPCClient_reconnectIfNecessary__block_invoke(uint64_t a1)
{
}

- (void)queue_registerWithServerIfNecessary
{
  location[2] = *(id *)MEMORY[0x1E4F143B8];
  if (a1)
  {
    BSDispatchQueueAssert(*(void **)(a1 + 8));
    if (!*(void *)(a1 + 48))
    {
      unsigned int v2 = 1;
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 40), &v2, v2, memory_order_relaxed, memory_order_relaxed);
      if (v2 != 1)
      {
        *(unsigned char *)(a1 + 56) = 1;
        char v3 = *(_xpc_endpoint_s **)(a1 + 24);
        if (v3) {
          xpc_connection_t mach_service = xpc_connection_create_from_endpoint(v3);
        }
        else {
          xpc_connection_t mach_service = xpc_connection_create_mach_service((const char *)[*(id *)(a1 + 32) UTF8String], 0, 0);
        }
        *(void *)(a1 + 48) = mach_service;
        objc_super v5 = (void *)[(id)a1 _connectionInstanceUUID];
        if (v5)
        {
          location[0] = 0;
          location[1] = 0;
          [v5 getUUIDBytes:location];
          xpc_connection_set_oneshot_instance();
        }
        uint64_t v6 = *(void **)(a1 + 16);
        if (v6)
        {

          *(void *)(a1 + 16) = 0;
        }
        *(void *)(a1 + 16) = objc_alloc_init(BSAtomicSignal);
        objc_initWeak(location, (id)a1);
        uint64_t v7 = *(void *)(a1 + 16);
        xpc_connection_set_target_queue(*(xpc_connection_t *)(a1 + 48), *(dispatch_queue_t *)(a1 + 8));
        uint64_t v8 = *(_xpc_connection_s **)(a1 + 48);
        handler[0] = MEMORY[0x1E4F143A8];
        handler[1] = 3221225472;
        handler[2] = __54__BSBaseXPCClient_queue_registerWithServerIfNecessary__block_invoke;
        handler[3] = &unk_1E5445F90;
        handler[4] = v7;
        objc_copyWeak(&v14, location);
        xpc_connection_set_event_handler(v8, handler);
        if (!notify_is_valid_token(*(_DWORD *)(a1 + 44)))
        {
          char v9 = (const char *)[(id)objc_msgSend(NSString stringWithFormat:@"%@.serverNotifyToken", *(void *)(a1 + 32)), "UTF8String"];
          uint64_t v10 = *(NSObject **)(a1 + 8);
          v11[0] = MEMORY[0x1E4F143A8];
          v11[1] = 3221225472;
          v11[2] = __54__BSBaseXPCClient_queue_registerWithServerIfNecessary__block_invoke_37;
          v11[3] = &unk_1E5445FB8;
          objc_copyWeak(&v12, location);
          notify_register_dispatch(v9, (int *)(a1 + 44), v10, v11);
          objc_destroyWeak(&v12);
        }
        objc_msgSend((id)a1, "queue_connectionWasCreated");
        -[BSBaseXPCClient queue_resumeConnection](a1);
        objc_destroyWeak(&v14);
        objc_destroyWeak(location);
      }
    }
  }
}

- (void)suspendConnection
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__BSBaseXPCClient_suspendConnection__block_invoke;
  block[3] = &unk_1E5445818;
  block[4] = self;
  dispatch_async(queue, block);
}

void __36__BSBaseXPCClient_suspendConnection__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    BSDispatchQueueAssert(*(void **)(v1 + 8));
    if (!*(unsigned char *)(v1 + 56))
    {
      unsigned int v2 = *(_xpc_connection_s **)(v1 + 48);
      if (v2)
      {
        xpc_connection_suspend(v2);
        *(unsigned char *)(v1 + 56) = 1;
        objc_msgSend((id)v1, "queue_connectionWasSuspended");
      }
    }
  }
}

- (void)resumeConnection
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__BSBaseXPCClient_resumeConnection__block_invoke;
  block[3] = &unk_1E5445818;
  block[4] = self;
  dispatch_async(queue, block);
}

void __35__BSBaseXPCClient_resumeConnection__block_invoke(uint64_t a1)
{
}

- (void)queue_resumeConnection
{
  if (a1)
  {
    BSDispatchQueueAssert(*(void **)(a1 + 8));
    if (*(unsigned char *)(a1 + 56))
    {
      unsigned int v2 = *(_xpc_connection_s **)(a1 + 48);
      if (v2)
      {
        xpc_connection_resume(v2);
        *(unsigned char *)(a1 + 56) = 0;
        objc_msgSend((id)a1, "queue_connectionWasResumed");
      }
    }
  }
}

- (void)invalidate
{
  int v3 = 0;
  atomic_compare_exchange_strong_explicit(&self->_clientInvalidated, (unsigned int *)&v3, 1u, memory_order_relaxed, memory_order_relaxed);
  BOOL v4 = v3 == 0;
  [(BSAtomicSignal *)self->_invalidationSignal signal];
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__BSBaseXPCClient_invalidate__block_invoke;
  v6[3] = &unk_1E5445EC8;
  BOOL v7 = v4;
  v6[4] = self;
  dispatch_async(queue, v6);
}

void __29__BSBaseXPCClient_invalidate__block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    objc_msgSend(*(id *)(a1 + 32), "queue_clientWasInvalidated");
  }
  uint64_t v2 = *(void *)(a1 + 32);
  -[BSBaseXPCClient queue_invalidateAndFlush:](v2, 1);
}

- (id)_errorFromMessageIfAny:(id)a3
{
  if (object_getClass(a3) != (Class)MEMORY[0x1E4F145A8]) {
    return 0;
  }
  objc_super v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:a3 forKey:*MEMORY[0x1E4F28A50]];
  return (id)[v5 errorWithDomain:@"BSErrorDomain" code:1 userInfo:v6];
}

- (id)_getStringFromMessage:(id)a3 key:(char *)a4
{
  id result = (id)xpc_dictionary_get_string(a3, a4);
  if (result)
  {
    id v5 = result;
    uint64_t v6 = NSString;
    return (id)[v6 stringWithUTF8String:v5];
  }
  return result;
}

- (void)_sendMessageReply:(id)a3 messagePacker:(id)a4
{
  if (a4)
  {
    if (!a3) {
      return;
    }
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"BSBaseXPCClient.m", 152, @"Must have a message packer");
    if (!a3) {
      return;
    }
  }
  (*((void (**)(id, id))a4 + 2))(a4, a3);
  remote_connection = xpc_dictionary_get_remote_connection(a3);
  xpc_connection_send_message(remote_connection, a3);
}

- (void)_sendReplyForMessage:(id)a3 messagePacker:(id)a4
{
  xpc_object_t reply = xpc_dictionary_create_reply(a3);
  if (reply)
  {
    BOOL v7 = reply;
    [(BSBaseXPCClient *)self _sendMessageReply:reply messagePacker:a4];
    xpc_release(v7);
  }
}

- (void)_sendMessage:(id)a3
{
}

- (void)_sendMessage:(id)a3 withReplyHandler:(id)a4 waitForReply:(BOOL)a5 waitDuration:(unint64_t)a6
{
  BOOL v10 = a6 == -1 && a5;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v30 = __75__BSBaseXPCClient__sendMessage_withReplyHandler_waitForReply_waitDuration___block_invoke;
  v31 = &unk_1E5445EF0;
  id v32 = a4;
  v11 = +[BSXPCMessage messageWithPacker:a3];
  queue = self->_queue;
  if (a4 && a5)
  {
    BSDispatchQueueAssertNot(queue);
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x3052000000;
    v25 = __Block_byref_object_copy__4;
    v26 = __Block_byref_object_dispose__4;
    uint64_t v27 = 0;
    v13 = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__BSBaseXPCClient__sendMessage_withReplyHandler_waitForReply_waitDuration___block_invoke_30;
    block[3] = &unk_1E5445F40;
    block[4] = self;
    void block[5] = &v22;
    dispatch_sync(v13, block);
    if (v23[5])
    {
      if (v10)
      {
        uint64_t v20 = 0;
        id v14 = (void *)MEMORY[0x18C125360]();
        uint64_t v15 = [(BSXPCMessage *)v11 sendSynchronouslyToConnection:v23[5] error:&v20];
        v30((uint64_t)v29, (void *)v15, v20);
      }
      else
      {
        v16 = dispatch_semaphore_create(0);
        connection = self->_connection;
        v18 = self->_queue;
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __75__BSBaseXPCClient__sendMessage_withReplyHandler_waitForReply_waitDuration___block_invoke_2_31;
        v19[3] = &unk_1E5445F68;
        v19[4] = v16;
        v19[5] = v29;
        [(BSXPCMessage *)v11 sendToConnection:connection replyQueue:v18 replyHandler:v19];
        dispatch_semaphore_wait(v16, a6);
        dispatch_release(v16);
      }
    }
    else
    {
      (*((void (**)(id, void))a4 + 2))(a4, 0);
    }

    _Block_object_dispose(&v22, 8);
  }
  else
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __75__BSBaseXPCClient__sendMessage_withReplyHandler_waitForReply_waitDuration___block_invoke_2;
    v28[3] = &unk_1E5445F18;
    v28[4] = self;
    v28[5] = v11;
    v28[6] = a4;
    v28[7] = v29;
    dispatch_async(queue, v28);
  }
}

uint64_t __75__BSBaseXPCClient__sendMessage_withReplyHandler_waitForReply_waitDuration___block_invoke(uint64_t result, void *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(result + 32);
  if (!a2 || a3)
  {
    if (!v3) {
      return result;
    }
    uint64_t v4 = 0;
  }
  else
  {
    if (!v3) {
      return result;
    }
    uint64_t v4 = [a2 payload];
  }
  id v5 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 16);
  return v5(v3, v4);
}

void __75__BSBaseXPCClient__sendMessage_withReplyHandler_waitForReply_waitDuration___block_invoke_2(uint64_t *a1)
{
  -[BSBaseXPCClient queue_registerWithServerIfNecessary](a1[4]);
  uint64_t v2 = a1[6];
  if (*(void *)(a1[4] + 48))
  {
    uint64_t v3 = (void *)a1[5];
    if (v2)
    {
      objc_msgSend(v3, "sendToConnection:replyQueue:replyHandler:");
    }
    else
    {
      objc_msgSend(v3, "sendToConnection:");
    }
  }
  else if (v2)
  {
    uint64_t v4 = *(void (**)(uint64_t, void))(v2 + 16);
    uint64_t v5 = a1[6];
    v4(v5, 0);
  }
}

uint64_t __75__BSBaseXPCClient__sendMessage_withReplyHandler_waitForReply_waitDuration___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __75__BSBaseXPCClient__sendMessage_withReplyHandler_waitForReply_waitDuration___block_invoke_30(uint64_t a1)
{
  -[BSBaseXPCClient queue_registerWithServerIfNecessary](*(void *)(a1 + 32));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = *(void *)(*(void *)(a1 + 32) + 48);
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return v2;
}

intptr_t __75__BSBaseXPCClient__sendMessage_withReplyHandler_waitForReply_waitDuration___block_invoke_2_31(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v2);
}

- (id)_connection
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x3052000000;
  char v9 = __Block_byref_object_copy__4;
  BOOL v10 = __Block_byref_object_dispose__4;
  uint64_t v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__BSBaseXPCClient__connection__block_invoke;
  v5[3] = &unk_1E5445890;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __30__BSBaseXPCClient__connection__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 48);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_setEndpoint:(id)a3
{
  serverEndpoint = self->_serverEndpoint;
  if (serverEndpoint) {
    xpc_release(serverEndpoint);
  }
  xpc_retain(a3);
  self->_serverEndpoint = (OS_xpc_object *)a3;
}

- (id)_connectionInstanceUUID
{
  return 0;
}

void __54__BSBaseXPCClient_queue_registerWithServerIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) hasBeenSignalled] & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      uint64_t v5 = WeakRetained;
      uint64_t v6 = (void *)MEMORY[0x18C125360]();
      Class Class = object_getClass(a2);
      if (Class == (Class)MEMORY[0x1E4F145A8])
      {
        objc_msgSend(v5, "queue_handleError:", a2);
        if (a2 == (void *)MEMORY[0x1E4F14520])
        {
          objc_msgSend(v5, "queue_connectionWasInterrupted");
          -[BSBaseXPCClient queue_invalidateAndFlush:]((uint64_t)v5, 1);
          -[BSBaseXPCClient queue_registerWithServerIfNecessary](v5);
        }
        else if (a2 == (void *)MEMORY[0x1E4F14528])
        {
          objc_msgSend(v5, "queue_connectionWasInvalidated");
          -[BSBaseXPCClient queue_invalidateAndFlush:]((uint64_t)v5, 0);
        }
        else
        {
          uint64_t v8 = BSLogCommon();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            int v9 = 138543362;
            uint64_t v10 = [a2 description];
            _os_log_error_impl(&dword_18AAA8000, v8, OS_LOG_TYPE_ERROR, "Connection closed unexpectedly: %{public}@", (uint8_t *)&v9, 0xCu);
          }
        }
      }
      else if (Class == (Class)MEMORY[0x1E4F14590])
      {
        objc_msgSend(v5, "queue_handleMessage:", a2);
      }
    }
  }
}

uint64_t __54__BSBaseXPCClient_queue_registerWithServerIfNecessary__block_invoke_37(uint64_t a1, int token)
{
  uint64_t state64 = 0;
  uint64_t result = notify_get_state(token, &state64);
  if (state64)
  {
    uint64_t result = (uint64_t)objc_loadWeak((id *)(a1 + 32));
    if (result)
    {
      uint64_t v4 = (void *)result;
      unsigned int v5 = 1;
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(result + 40), &v5, v5, memory_order_relaxed, memory_order_relaxed);
      if (v5 != 1)
      {
        uint64_t result = [*(id *)(result + 16) hasBeenSignalled];
        if (result) {
          return [v4 reconnectIfNecessary];
        }
      }
    }
  }
  return result;
}

- (id)queue_connection
{
  return self->_connection;
}

void __44__BSBaseXPCClient_queue_invalidateAndFlush___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(_xpc_connection_s **)(*(void *)(v2 + 8) + 40);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __44__BSBaseXPCClient_queue_invalidateAndFlush___block_invoke_2;
  handler[3] = &unk_1E5445840;
  handler[4] = v2;
  xpc_connection_set_event_handler(v3, handler);
  xpc_connection_cancel(*(xpc_connection_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
}

void __44__BSBaseXPCClient_queue_invalidateAndFlush___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2 == MEMORY[0x1E4F14528]) {
    xpc_release(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  }
}

@end