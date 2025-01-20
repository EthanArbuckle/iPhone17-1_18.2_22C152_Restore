@interface BSBaseXPCServer
+ (BOOL)_registersWithNotifyd;
- (BOOL)queue_shouldAcceptNewConnection:(id)a3;
- (BOOL)usesAnonymousConnection;
- (BSBaseXPCServer)initWithServiceName:(id)a3;
- (BSBaseXPCServer)initWithServiceName:(id)a3 onQueue:(id)a4;
- (Class)queue_classForNewClientConnection:(id)a3;
- (id)_clients;
- (id)_connection;
- (id)_copyEndpoint;
- (id)_getStringFromMessage:(id)a3 key:(char *)a4;
- (id)_queue_clientForConnection:(id)a3;
- (id)queue;
- (id)queue_newClientForConnection:(id)a3;
- (void)_invalidate;
- (void)_sendMessageReply:(id)a3 messagePacker:(id)a4;
- (void)_sendReplyForMessage:(id)a3 messagePacker:(id)a4;
- (void)dealloc;
- (void)registerServerSuspended;
- (void)resumeServer;
- (void)run;
- (void)setUsesAnonymousConnection:(BOOL)a3;
@end

@implementation BSBaseXPCServer

uint64_t __27__BSBaseXPCServer__clients__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) allObjects];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)_connection
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  uint64_t v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__BSBaseXPCServer__connection__block_invoke;
  v5[3] = &unk_1E5445890;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)_clients
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  uint64_t v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__BSBaseXPCServer__clients__block_invoke;
  v5[3] = &unk_1E5445890;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BSBaseXPCServer)initWithServiceName:(id)a3
{
  return [(BSBaseXPCServer *)self initWithServiceName:a3 onQueue:0];
}

- (BSBaseXPCServer)initWithServiceName:(id)a3 onQueue:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)BSBaseXPCServer;
  uint64_t v6 = [(BSBaseXPCServer *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_notifyToken = -1;
    uint64_t v8 = [a3 copy];
    v7->_serviceName = (NSString *)v8;
    if (a4)
    {
      v7->_queue = (OS_dispatch_queue *)a4;
      dispatch_retain((dispatch_object_t)a4);
    }
    else
    {
      v7->_queue = (OS_dispatch_queue *)BSDispatchQueueCreateWithQualityOfService((const char *)[(id)objc_msgSend(NSString stringWithFormat:@"%@.serverTaskQueue", v8), "UTF8String"], 0, QOS_CLASS_USER_INITIATED, 0);
    }
    v7->_clients = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  }
  return v7;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self);
  dispatch_release((dispatch_object_t)self->_queue);
  listenerConnection = self->_listenerConnection;
  if (listenerConnection) {
    xpc_release(listenerConnection);
  }

  if (notify_is_valid_token(self->_notifyToken))
  {
    notify_cancel(self->_notifyToken);
    self->_notifyToken = -1;
  }
  v4.receiver = self;
  v4.super_class = (Class)BSBaseXPCServer;
  [(BSBaseXPCServer *)&v4 dealloc];
}

- (id)queue
{
  return self->_queue;
}

- (void)run
{
  [(BSBaseXPCServer *)self registerServerSuspended];
  [(BSBaseXPCServer *)self resumeServer];
}

- (void)registerServerSuspended
{
  if (!self->_listenerConnection)
  {
    if (self->_usesAnonymousConnection) {
      mach_service = xpc_connection_create(0, (dispatch_queue_t)self->_queue);
    }
    else {
      mach_service = xpc_connection_create_mach_service([(NSString *)self->_serviceName UTF8String], (dispatch_queue_t)self->_queue, 1uLL);
    }
    self->_listenerConnection = mach_service;
    xpc_connection_set_target_queue(mach_service, (dispatch_queue_t)self->_queue);
    listenerConnection = self->_listenerConnection;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __42__BSBaseXPCServer_registerServerSuspended__block_invoke;
    handler[3] = &unk_1E54457F0;
    handler[4] = self;
    xpc_connection_set_event_handler(listenerConnection, handler);
    if ([(id)objc_opt_class() _registersWithNotifyd])
    {
      if (!notify_is_valid_token(self->_notifyToken)) {
        notify_register_check((const char *)[(id)objc_msgSend(NSString stringWithFormat:@"%@.serverNotifyToken", self->_serviceName), "UTF8String"], &self->_notifyToken);
      }
    }
    xpc_connection_resume(self->_listenerConnection);
  }
}

void __42__BSBaseXPCServer_registerServerSuspended__block_invoke(uint64_t a1, xpc_object_t object)
{
  xpc_retain(object);
  id v4 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  Class Class = object_getClass(object);
  if (Class == (Class)MEMORY[0x1E4F145A8])
  {
    [MEMORY[0x1E4F1CA00] raise:@"BSXPCServerException", @"Unexpected error occured on listener connection for service <%@>: %@", *(void *)(*(void *)(a1 + 32) + 40), object format];
  }
  else if (Class == (Class)MEMORY[0x1E4F14578])
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6)
    {
      if (objc_msgSend((id)v6, "queue_shouldAcceptNewConnection:", object)
        && (uint64_t v7 = objc_msgSend((id)v6, "queue_newClientForConnection:", object)) != 0)
      {
        uint64_t v8 = (void *)v7;
        [*(id *)(v6 + 24) addObject:v7];
        xpc_connection_set_target_queue((xpc_connection_t)object, *(dispatch_queue_t *)(v6 + 8));
        uint64_t handler = MEMORY[0x1E4F143A8];
        uint64_t v11 = 3221225472;
        v12 = __40__BSBaseXPCServer__addClientConnection___block_invoke;
        v13 = &unk_1E5445868;
        xpc_object_t v14 = (xpc_object_t)v6;
        xpc_object_t v15 = object;
        v16 = v8;
        xpc_connection_set_event_handler((xpc_connection_t)object, &handler);
        if (*(unsigned char *)(v6 + 32)) {
          [v8 resume];
        }
        objc_msgSend((id)v6, "queue_clientAdded:", v8);
      }
      else
      {
        global_queue = dispatch_get_global_queue(21, 0);
        xpc_connection_set_target_queue((xpc_connection_t)object, global_queue);
        uint64_t handler = MEMORY[0x1E4F143A8];
        uint64_t v11 = 3221225472;
        v12 = __40__BSBaseXPCServer__addClientConnection___block_invoke_2;
        v13 = &unk_1E54457F0;
        xpc_object_t v14 = object;
        xpc_connection_set_event_handler((xpc_connection_t)object, &handler);
        xpc_connection_resume((xpc_connection_t)object);
      }
    }
  }

  xpc_release(object);
}

- (void)resumeServer
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__BSBaseXPCServer_resumeServer__block_invoke;
  block[3] = &unk_1E5445818;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __31__BSBaseXPCServer_resumeServer__block_invoke(uint64_t result)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 32))
  {
    uint64_t v2 = result;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v3 = *(void **)(v1 + 24);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * i) resume];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }
    *(unsigned char *)(*(void *)(v2 + 32) + 32) = 1;
    uint64_t result = notify_is_valid_token(*(_DWORD *)(*(void *)(v2 + 32) + 48));
    if (result)
    {
      notify_set_state(*(_DWORD *)(*(void *)(v2 + 32) + 48), 1uLL);
      uint64_t v8 = *(void *)(v2 + 32);
      if (v8) {
        v9 = (void *)[NSString stringWithFormat:@"%@.serverNotifyToken", *(void *)(v8 + 40)];
      }
      else {
        v9 = 0;
      }
      return notify_post((const char *)[v9 UTF8String]);
    }
  }
  return result;
}

- (void)_invalidate
{
  listenerConnection = self->_listenerConnection;
  if (listenerConnection)
  {
    v5[0] = 0;
    v5[1] = v5;
    v5[2] = 0x3052000000;
    v5[3] = __Block_byref_object_copy__0;
    v5[4] = __Block_byref_object_dispose__0;
    v5[5] = listenerConnection;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __30__BSBaseXPCServer__invalidate__block_invoke;
    handler[3] = &unk_1E5445840;
    handler[4] = v5;
    xpc_connection_set_event_handler(listenerConnection, handler);
    xpc_connection_cancel(self->_listenerConnection);
    self->_listenerConnection = 0;
    _Block_object_dispose(v5, 8);
  }
}

void __30__BSBaseXPCServer__invalidate__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == MEMORY[0x1E4F14528]) {
    xpc_release(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  }
}

+ (BOOL)_registersWithNotifyd
{
  return 1;
}

void __40__BSBaseXPCServer__addClientConnection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = (void *)MEMORY[0x18C125360]();
  Class Class = object_getClass(a2);
  if (Class == (Class)MEMORY[0x1E4F145A8])
  {
    uint64_t v6 = *(id **)(a1 + 32);
    if (v6)
    {
      id v7 = (id)objc_msgSend(*(id *)(a1 + 32), "_queue_clientForConnection:", *(void *)(a1 + 40));
      if (v7)
      {
        uint64_t v8 = v7;
        [v7 invalidate];
        [v6[3] removeObject:v8];
        objc_msgSend(v6, "queue_clientRemoved:", v8);
      }
    }
  }
  else if (Class == (Class)MEMORY[0x1E4F14590])
  {
    objc_msgSend(*(id *)(a1 + 32), "queue_handleMessage:client:", a2, *(void *)(a1 + 48));
  }
}

void __40__BSBaseXPCServer__addClientConnection___block_invoke_2(uint64_t a1)
{
}

- (id)_queue_clientForConnection:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  clients = self->_clients;
  uint64_t v5 = [(NSMutableSet *)clients countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(clients);
    }
    v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if ((id)[v9 connection] == a3) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [(NSMutableSet *)clients countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (BOOL)queue_shouldAcceptNewConnection:(id)a3
{
  return 1;
}

- (Class)queue_classForNewClientConnection:(id)a3
{
  return (Class)objc_opt_class();
}

- (id)queue_newClientForConnection:(id)a3
{
  v3 = (void *)-[objc_class wrapperWithConnection:](-[BSBaseXPCServer queue_classForNewClientConnection:](self, "queue_classForNewClientConnection:"), "wrapperWithConnection:", a3);
  return v3;
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
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"BSBaseXPCServer.m", 251, @"Must have a message packer");
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
    uint64_t v7 = reply;
    [(BSBaseXPCServer *)self _sendMessageReply:reply messagePacker:a4];
    xpc_release(v7);
  }
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

uint64_t __30__BSBaseXPCServer__connection__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 40) = *(void *)(*(void *)(result + 32) + 16);
  return result;
}

- (id)_copyEndpoint
{
  id result = self->_listenerConnection;
  if (result) {
    return xpc_endpoint_create((xpc_connection_t)result);
  }
  return result;
}

- (BOOL)usesAnonymousConnection
{
  return self->_usesAnonymousConnection;
}

- (void)setUsesAnonymousConnection:(BOOL)a3
{
  self->_usesAnonymousConnection = a3;
}

@end