@interface _GEOProgressForReceivingOverXPC
- (_GEOProgressForReceivingOverXPC)initWithEndpoint:(id)a3;
- (id)initVendingEndpoint:(id *)a3;
- (void)_handleEvent:(id)a3;
- (void)cancel;
- (void)dealloc;
@end

@implementation _GEOProgressForReceivingOverXPC

- (_GEOProgressForReceivingOverXPC)initWithEndpoint:(id)a3
{
  v4 = (_xpc_endpoint_s *)a3;
  v18.receiver = self;
  v18.super_class = (Class)_GEOProgressForReceivingOverXPC;
  id v5 = [(_GEOProgressForReceivingOverXPC *)&v18 initWithParent:0 userInfo:0];
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = geo_dispatch_queue_create_with_workloop_qos();
  v7 = (void *)*((void *)v5 + 16);
  *((void *)v5 + 16) = v6;

  xpc_connection_t v8 = xpc_connection_create_from_endpoint(v4);
  v9 = (void *)*((void *)v5 + 15);
  *((void *)v5 + 15) = v8;

  v10 = (_xpc_connection_s *)*((void *)v5 + 15);
  if (v10)
  {
    xpc_connection_set_target_queue(v10, *((dispatch_queue_t *)v5 + 16));
    objc_initWeak(&location, v5);
    v11 = (_xpc_connection_s *)*((void *)v5 + 15);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __52___GEOProgressForReceivingOverXPC_initWithEndpoint___block_invoke;
    v15[3] = &unk_1E53DF960;
    objc_copyWeak(&v16, &location);
    xpc_connection_set_event_handler(v11, v15);
    xpc_connection_activate(*((xpc_connection_t *)v5 + 15));
    xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
    xpc_connection_send_message(*((xpc_connection_t *)v5 + 15), v12);
    v13 = (_GEOProgressForReceivingOverXPC *)v5;

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
LABEL_4:
    v13 = 0;
  }

  return v13;
}

- (id)initVendingEndpoint:(id *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)_GEOProgressForReceivingOverXPC;
  v4 = [(_GEOProgressForReceivingOverXPC *)&v15 initWithParent:0 userInfo:0];
  if (v4)
  {
    id v5 = geo_dispatch_queue_create_with_workloop_qos();
    objc_storeStrong((id *)&v4->_queue, v5);
    xpc_connection_t v6 = xpc_connection_create(0, (dispatch_queue_t)v4->_queue);
    connection = v4->_connection;
    v4->_connection = v6;

    if (v4->_connection)
    {
      objc_initWeak(&location, v4);
      xpc_connection_t v8 = v4->_connection;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __55___GEOProgressForReceivingOverXPC_initVendingEndpoint___block_invoke;
      handler[3] = &unk_1E53E48C0;
      objc_copyWeak(&v13, &location);
      id v12 = v5;
      xpc_connection_set_event_handler(v8, handler);
      xpc_connection_activate(v4->_connection);
      if (a3) {
        *a3 = xpc_endpoint_create(v4->_connection);
      }
      v9 = v4;

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
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

  return v9;
}

- (void)dealloc
{
  connection = self->_connection;
  if (connection) {
    xpc_connection_cancel(connection);
  }
  v4.receiver = self;
  v4.super_class = (Class)_GEOProgressForReceivingOverXPC;
  [(_GEOProgressForReceivingOverXPC *)&v4 dealloc];
}

- (void)_handleEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = MEMORY[0x18C1213B0]();
  if (v5 == MEMORY[0x1E4F14590])
  {
    [(NSProgress *)self _geo_configureFromMirroredProgressXPCDictionary:v4];
    if ([(_GEOProgressForReceivingOverXPC *)self isFinished])
    {
      xpc_connection_t v6 = self->_connection;
      connection = self->_connection;
      self->_connection = 0;

      if (v6) {
        xpc_connection_cancel(v6);
      }
      goto LABEL_10;
    }
  }
  else if (v5 == MEMORY[0x1E4F145A8])
  {
    xpc_connection_t v6 = self->_connection;
    v7 = self->_connection;
    self->_connection = 0;

    if (v6) {
      xpc_connection_cancel(v6);
    }
    if (([(_GEOProgressForReceivingOverXPC *)self isFinished] & 1) == 0)
    {
      v9.receiver = self;
      v9.super_class = (Class)_GEOProgressForReceivingOverXPC;
      [(_GEOProgressForReceivingOverXPC *)&v9 cancel];
    }
LABEL_10:
  }
}

- (void)cancel
{
  v5.receiver = self;
  v5.super_class = (Class)_GEOProgressForReceivingOverXPC;
  [(_GEOProgressForReceivingOverXPC *)&v5 cancel];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41___GEOProgressForReceivingOverXPC_cancel__block_invoke;
  block[3] = &unk_1E53D79D8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end