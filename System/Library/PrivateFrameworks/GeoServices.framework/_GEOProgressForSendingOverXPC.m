@interface _GEOProgressForSendingOverXPC
- (OS_xpc_object)endpoint;
- (_GEOProgressForSendingOverXPC)initWithMirroredProgress:(id)a3;
- (_GEOProgressForSendingOverXPC)initWithMirroredProgress:(id)a3 endpoint:(id)a4;
- (void)_broadcastOverXPCConnections:(id)a3;
- (void)_connectionDidInvalidate;
- (void)_update;
- (void)cancel;
- (void)dealloc;
@end

@implementation _GEOProgressForSendingOverXPC

- (_GEOProgressForSendingOverXPC)initWithMirroredProgress:(id)a3
{
  id v4 = a3;
  if (v4
    && (v28.receiver = self,
        v28.super_class = (Class)_GEOProgressForSendingOverXPC,
        (self = [(_GEOMirroredProgress *)&v28 _initWithMirroredProgressForSubclasses:v4]) != 0))
  {
    v5 = geo_dispatch_queue_create_with_workloop_qos();
    objc_storeStrong((id *)&self->_queue, v5);
    v6 = xpc_connection_create(0, (dispatch_queue_t)self->_queue);
    connection = self->_connection;
    self->_connection = v6;

    if (self->_connection)
    {
      v8 = [MEMORY[0x1E4F1CA48] array];
      remoteConnections = self->_remoteConnections;
      self->_remoteConnections = v8;

      uint64_t v22 = 0;
      v23 = &v22;
      uint64_t v24 = 0x3032000000;
      v25 = __Block_byref_object_copy__49;
      v26 = __Block_byref_object_dispose__49;
      v10 = self;
      v27 = v10;
      v11 = self->_connection;
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      v18 = __58___GEOProgressForSendingOverXPC_initWithMirroredProgress___block_invoke;
      v19 = &unk_1E53E4898;
      v21 = &v22;
      id v20 = v5;
      xpc_connection_set_event_handler(v11, &v16);
      xpc_endpoint_t v12 = xpc_endpoint_create(self->_connection);
      endpoint = v10->_endpoint;
      v10->_endpoint = v12;

      xpc_connection_activate(self->_connection);
      objc_msgSend((id)v23[5], "_registerForKVO", v16, v17, v18, v19);
      [(id)v23[5] _update];
      v14 = v10;

      _Block_object_dispose(&v22, 8);
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (_GEOProgressForSendingOverXPC)initWithMirroredProgress:(id)a3 endpoint:(id)a4
{
  id v6 = a3;
  v7 = (_xpc_endpoint_s *)a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    v26.receiver = self;
    v26.super_class = (Class)_GEOProgressForSendingOverXPC;
    self = [(_GEOMirroredProgress *)&v26 _initWithMirroredProgressForSubclasses:v6];
    if (self)
    {
      v10 = geo_dispatch_queue_create_with_workloop_qos();
      objc_storeStrong((id *)&self->_queue, v10);
      objc_storeStrong((id *)&self->_endpoint, a4);
      v11 = xpc_connection_create_from_endpoint(v8);
      connection = self->_connection;
      self->_connection = v11;

      v13 = self->_connection;
      if (v13)
      {
        xpc_connection_set_target_queue(v13, (dispatch_queue_t)self->_queue);
        v14 = [MEMORY[0x1E4F1CA48] array];
        remoteConnections = self->_remoteConnections;
        self->_remoteConnections = v14;

        [(NSMutableArray *)self->_remoteConnections addObject:self->_connection];
        uint64_t v20 = 0;
        v21 = &v20;
        uint64_t v22 = 0x3032000000;
        v23 = __Block_byref_object_copy__49;
        uint64_t v24 = __Block_byref_object_dispose__49;
        uint64_t v16 = self;
        v25 = v16;
        uint64_t v17 = self->_connection;
        handler[0] = MEMORY[0x1E4F143A8];
        handler[1] = 3221225472;
        handler[2] = __67___GEOProgressForSendingOverXPC_initWithMirroredProgress_endpoint___block_invoke;
        handler[3] = &unk_1E53E4870;
        handler[4] = &v20;
        xpc_connection_set_event_handler(v17, handler);
        xpc_connection_activate(self->_connection);
        [(id)v21[5] _registerForKVO];
        [(id)v21[5] _update];
        v9 = v16;
        _Block_object_dispose(&v20, 8);
      }
      else
      {
        v9 = 0;
      }
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (void)dealloc
{
  connection = self->_connection;
  if (connection) {
    xpc_connection_cancel(connection);
  }
  v4.receiver = self;
  v4.super_class = (Class)_GEOProgressForSendingOverXPC;
  [(_GEOMirroredProgress *)&v4 dealloc];
}

- (void)_update
{
  v11.receiver = self;
  v11.super_class = (Class)_GEOProgressForSendingOverXPC;
  [(_GEOMirroredProgress *)&v11 _update];
  queue = self->_queue;
  if (queue)
  {
    uint64_t v5 = 0;
    id v6 = &v5;
    uint64_t v7 = 0x3032000000;
    v8 = __Block_byref_object_copy__49;
    v9 = __Block_byref_object_dispose__49;
    id v10 = 0;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __40___GEOProgressForSendingOverXPC__update__block_invoke;
    v4[3] = &unk_1E53D89C0;
    v4[4] = self;
    v4[5] = &v5;
    dispatch_async_and_wait(queue, v4);
    [(_GEOProgressForSendingOverXPC *)self _broadcastOverXPCConnections:v6[5]];
    _Block_object_dispose(&v5, 8);
  }
}

- (void)_broadcastOverXPCConnections:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v5 = [(NSProgress *)self _geo_mirroredProgressXPCDictionary];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          xpc_connection_send_message(*(xpc_connection_t *)(*((void *)&v11 + 1) + 8 * v10++), v5);
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)cancel
{
  queue = self->_queue;
  if (queue)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39___GEOProgressForSendingOverXPC_cancel__block_invoke;
    block[3] = &unk_1E53D79D8;
    block[4] = self;
    dispatch_async(queue, block);
    v4.receiver = self;
    v4.super_class = (Class)_GEOProgressForSendingOverXPC;
    [(_GEOProgressForSendingOverXPC *)&v4 cancel];
  }
}

- (void)_connectionDidInvalidate
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_queue)
  {
    v3 = self->_connection;
    objc_super v4 = (void *)[(NSMutableArray *)self->_remoteConnections copy];
    connection = self->_connection;
    self->_connection = 0;

    [(NSMutableArray *)self->_remoteConnections removeAllObjects];
    if (v3) {
      xpc_connection_cancel(v3);
    }
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          xpc_connection_cancel(*(xpc_connection_t *)(*((void *)&v11 + 1) + 8 * i));
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }

    if (([(_GEOProgressForSendingOverXPC *)self isFinished] & 1) == 0) {
      geo_dispatch_async_qos();
    }
  }
}

- (OS_xpc_object)endpoint
{
  return self->_endpoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteConnections, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end