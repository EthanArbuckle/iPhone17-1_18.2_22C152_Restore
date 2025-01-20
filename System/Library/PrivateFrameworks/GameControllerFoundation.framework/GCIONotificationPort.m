@interface GCIONotificationPort
- (GCIONotificationPort)init;
- (GCIONotificationPort)initWithMainPort:(unsigned int)a3;
- (GCIONotificationPort)initWithMainPort:(unsigned int)a3 queue:(id)a4;
- (GCIONotificationPort)initWithMainPort:(unsigned int)a3 queue:(id)a4 cancellationHandler:(id)a5;
- (GCIONotificationPort)initWithQueue:(id)a3;
- (id)debugDescription;
- (id)description;
- (id)redactedDescription;
- (uint64_t)port;
- (uint64_t)queue;
- (uint64_t)wakePort;
- (void)dealloc;
- (void)setQueue:(id)a3 cancellationHandler:(id)a4;
@end

@implementation GCIONotificationPort

- (GCIONotificationPort)initWithMainPort:(unsigned int)a3
{
  v8.receiver = self;
  v8.super_class = (Class)GCIONotificationPort;
  v4 = [(GCIONotificationPort *)&v8 init];
  IONotificationPortRef v5 = IONotificationPortCreate(a3);
  v4->_port = v5;
  if (!v5)
  {
    v7 = _gc_log_iokit();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[GCIONotificationPort initWithMainPort:](v7);
    }
    return 0;
  }
  return v4;
}

- (GCIONotificationPort)initWithMainPort:(unsigned int)a3 queue:(id)a4 cancellationHandler:(id)a5
{
  v7 = [(GCIONotificationPort *)self initWithMainPort:*(void *)&a3];
  [(GCIONotificationPort *)v7 setQueue:a4 cancellationHandler:a5];
  return v7;
}

- (GCIONotificationPort)initWithMainPort:(unsigned int)a3 queue:(id)a4
{
  return [(GCIONotificationPort *)self initWithMainPort:*(void *)&a3 queue:a4 cancellationHandler:0];
}

- (GCIONotificationPort)initWithQueue:(id)a3
{
  return [(GCIONotificationPort *)self initWithMainPort:kIOMainPortDefault queue:a3];
}

- (GCIONotificationPort)init
{
  return [(GCIONotificationPort *)self initWithMainPort:kIOMainPortDefault];
}

- (void)dealloc
{
  IONotificationPortDestroy(self->_port);
  self->_port = 0;
  self->_queue = 0;
  self->_cancellationSource = 0;
  v3.receiver = self;
  v3.super_class = (Class)GCIONotificationPort;
  [(GCIONotificationPort *)&v3 dealloc];
}

- (id)description
{
  if (self)
  {
    v2 = self;
    uint64_t MachPort = IONotificationPortGetMachPort(self->_port);
    self = (GCIONotificationPort *)v2->_queue;
  }
  else
  {
    uint64_t MachPort = 0;
  }
  return +[NSString stringWithFormat:@"<IONotificationPort port='%#08x' queue='%s'>", MachPort, dispatch_queue_get_label(&self->super)];
}

- (uint64_t)wakePort
{
  if (result) {
    return IONotificationPortGetMachPort(*(IONotificationPortRef *)(result + 8));
  }
  return result;
}

- (uint64_t)queue
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (id)redactedDescription
{
  if (self)
  {
    v2 = self;
    uint64_t MachPort = IONotificationPortGetMachPort(self->_port);
    self = (GCIONotificationPort *)v2->_queue;
  }
  else
  {
    uint64_t MachPort = 0;
  }
  return +[NSString stringWithFormat:@"<IONotificationPort port='%#08x' queue='%s'>", MachPort, dispatch_queue_get_label(&self->super)];
}

- (id)debugDescription
{
  objc_super v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  if (self)
  {
    uint64_t MachPort = IONotificationPortGetMachPort(self->_port);
    queue = self->_queue;
  }
  else
  {
    uint64_t MachPort = 0;
    queue = 0;
  }
  return +[NSString stringWithFormat:@"<%@ %p port='%#08x' queue='%s'>", v4, self, MachPort, dispatch_queue_get_label(queue)];
}

- (void)setQueue:(id)a3 cancellationHandler:(id)a4
{
  if (!a3) {
    objc_msgSend((id)unk_26BEED9E8(&off_26BEEDB50, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"GCIONotificationPort.m", 76, @"Assertion failed: queue != ((void *)0)");
  }
  IONotificationPortSetDispatchQueue(self->_port, (dispatch_queue_t)a3);
  self->_queue = (OS_dispatch_queue *)a3;
  if (a4)
  {
    mach_port_t MachPort = IONotificationPortGetMachPort(self->_port);
    mach_port_insert_right(mach_task_self_, MachPort, MachPort, 0x14u);
    objc_super v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_mach_send, MachPort, 1uLL, (dispatch_queue_t)self->_queue);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = __53__GCIONotificationPort_setQueue_cancellationHandler___block_invoke;
    handler[3] = &unk_26BEC5098;
    handler[4] = v8;
    handler[5] = a4;
    dispatch_source_set_event_handler(v8, handler);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = __53__GCIONotificationPort_setQueue_cancellationHandler___block_invoke_2;
    v9[3] = &unk_26BEC50C0;
    mach_port_t v10 = MachPort;
    v9[4] = v8;
    dispatch_source_set_cancel_handler(v8, v9);
    self->_cancellationSource = (OS_dispatch_source *)v8;
    dispatch_activate(v8);
  }
}

void __53__GCIONotificationPort_setQueue_cancellationHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(NSObject **)(a1 + 32);

  dispatch_source_cancel(v2);
}

void __53__GCIONotificationPort_setQueue_cancellationHandler___block_invoke_2(uint64_t a1)
{
  mach_port_deallocate(mach_task_self_, *(_DWORD *)(a1 + 40));
  v2 = *(NSObject **)(a1 + 32);

  dispatch_release(v2);
}

- (uint64_t)port
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

- (void)initWithMainPort:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20AD04000, log, OS_LOG_TYPE_ERROR, "IONotificationPortCreate() failed.", v1, 2u);
}

@end