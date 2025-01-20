@interface _CLLocationManagerRoutineProxy
- (BOOL)updating;
- (CLLocationManagerRoutine)locationManagerRoutine;
- (NSXPCConnection)connection;
- (_CLLocationManagerRoutineProxy)initWithQueue:(id)a3 locationManagerRoutine:(id)a4;
- (id)delegate;
- (id)inertialDelegate;
- (void)createConnection;
- (void)dealloc;
- (void)didUpdateInertialData:(id)a3;
- (void)didUpdateLocations:(id)a3;
- (void)didUpdateLocations:(id)a3 withReply:(id)a4;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInertialDelegate:(id)a3;
- (void)setLocationManagerRoutine:(id)a3;
- (void)setUpdating:(BOOL)a3;
@end

@implementation _CLLocationManagerRoutineProxy

- (void)didUpdateLocations:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F5E0 != -1) {
    dispatch_once(&qword_1E929F5E0, &unk_1EE0055C0);
  }
  v5 = qword_1E929F5E8;
  if (os_log_type_enabled((os_log_t)qword_1E929F5E8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289026;
    int v9 = 0;
    __int16 v10 = 2082;
    v11 = "";
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#location #routine sendLocations to RT, didUpdateLocations)\"}", buf, 0x12u);
  }
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1906C71F4;
  v7[3] = &unk_1E5696EE8;
  v7[4] = self;
  v7[5] = a3;
  dispatch_async(queue, v7);
}

- (id)delegate
{
  return self->_delegate;
}

- (CLLocationManagerRoutine)locationManagerRoutine
{
  return self->_locationManagerRoutine;
}

- (_CLLocationManagerRoutineProxy)initWithQueue:(id)a3 locationManagerRoutine:(id)a4
{
  if (!a3)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLLocationManagerRoutine.m", 57, @"Invalid parameter not satisfying: %@", @"queue");
    if (a4) {
      return 0;
    }
LABEL_7:
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLLocationManagerRoutine.m", 58, @"Invalid parameter not satisfying: %@", @"locationManagerRoutine");
    return 0;
  }
  if (!a4) {
    goto LABEL_7;
  }
  v11.receiver = self;
  v11.super_class = (Class)_CLLocationManagerRoutineProxy;
  v8 = [(_CLLocationManagerRoutineProxy *)&v11 init];
  if (v8)
  {
    v8->_queue = (OS_dispatch_queue *)a3;
    [(_CLLocationManagerRoutineProxy *)v8 createConnection];
    v8->_locationManagerRoutine = (CLLocationManagerRoutine *)a4;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v8, (CFNotificationCallback)sub_1906F578C, @"com.apple.locationd.routine", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v8;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  [(_CLLocationManagerRoutineProxy *)self setLocationManagerRoutine:0];
  [(_CLLocationManagerRoutineProxy *)self setDelegate:0];
  [(NSXPCConnection *)[(_CLLocationManagerRoutineProxy *)self connection] invalidate];
  [(_CLLocationManagerRoutineProxy *)self setConnection:0];
  queue = self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)_CLLocationManagerRoutineProxy;
  [(_CLLocationManagerRoutineProxy *)&v5 dealloc];
}

- (void)didUpdateLocations:(id)a3 withReply:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F5E0 != -1) {
    dispatch_once(&qword_1E929F5E0, &unk_1EE0055C0);
  }
  v7 = qword_1E929F5E8;
  if (os_log_type_enabled((os_log_t)qword_1E929F5E8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289026;
    int v11 = 0;
    __int16 v12 = 2082;
    v13 = "";
    _os_log_impl(&dword_1906B8000, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#location #routine sendLocations to RT, didUpdateLocations:withReply\"}", buf, 0x12u);
  }
  if (a4)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1906F59E4;
    block[3] = &unk_1E5696F10;
    block[4] = self;
    block[5] = a3;
    block[6] = a4;
    dispatch_async(queue, block);
  }
  else
  {
    [(_CLLocationManagerRoutineProxy *)self didUpdateLocations:a3];
  }
}

- (void)didUpdateInertialData:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F5E0 != -1) {
    dispatch_once(&qword_1E929F5E0, &unk_1EE0055C0);
  }
  objc_super v5 = qword_1E929F5E8;
  if (os_log_type_enabled((os_log_t)qword_1E929F5E8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289026;
    int v9 = 0;
    __int16 v10 = 2082;
    int v11 = "";
    _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#location #routine sendInertial to RT, didUpdateInertialData\"}", buf, 0x12u);
  }
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1906F5C84;
  v7[3] = &unk_1E5696EE8;
  v7[4] = self;
  v7[5] = a3;
  dispatch_async(queue, v7);
}

- (void)createConnection
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  connection = self->_connection;
  if (connection)
  {
    [(NSXPCConnection *)connection invalidate];

    self->_connection = 0;
  }
  v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.locationd.routine" options:4096];
  self->_connection = v4;
  if (v4)
  {
    if (qword_1E929F5E0 != -1) {
      dispatch_once(&qword_1E929F5E0, &unk_1EE0055C0);
    }
    objc_super v5 = qword_1E929F5E8;
    if (os_log_type_enabled((os_log_t)qword_1E929F5E8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289026;
      int v21 = 0;
      __int16 v22 = 2082;
      v23 = "";
      _os_log_impl(&dword_1906B8000, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#location #routine createConnection\"}", buf, 0x12u);
    }
    -[NSXPCConnection setExportedInterface:](self->_connection, "setExportedInterface:", [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE024A98]);
    [(NSXPCConnection *)self->_connection setExportedObject:self];
    v6 = [(NSXPCConnection *)self->_connection exportedInterface];
    v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v6, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0), sel_didUpdateLocations_, 0, 0);
    int v9 = [(NSXPCConnection *)self->_connection exportedInterface];
    __int16 v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v9, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0), sel_didUpdateLocations_withReply_, 0, 0);
    uint64_t v12 = [(NSXPCConnection *)self->_connection exportedInterface];
    v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v12, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0), sel_didUpdateInertialData_, 0, 0);
    -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE040F18]);
    v15 = [(NSXPCConnection *)self->_connection serviceName];
    v16 = self->_connection;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = sub_1906F6118;
    v19[3] = &unk_1E5696BF0;
    v19[4] = v15;
    [(NSXPCConnection *)v16 setInterruptionHandler:v19];
    v17 = self->_connection;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1906F6148;
    v18[3] = &unk_1E5696BF0;
    v18[4] = v15;
    [(NSXPCConnection *)v17 setInvalidationHandler:v18];
    [(NSXPCConnection *)self->_connection resume];
  }
  if ([(_CLLocationManagerRoutineProxy *)self updating]) {
    objc_msgSend(-[NSXPCConnection remoteObjectProxy](-[_CLLocationManagerRoutineProxy connection](self, "connection"), "remoteObjectProxy"), "startUpdatingLocation");
  }
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (id)inertialDelegate
{
  return self->_inertialDelegate;
}

- (void)setInertialDelegate:(id)a3
{
  self->_inertialDelegate = a3;
}

- (void)setLocationManagerRoutine:(id)a3
{
  self->_locationManagerRoutine = (CLLocationManagerRoutine *)a3;
}

- (BOOL)updating
{
  return self->_updating;
}

- (void)setUpdating:(BOOL)a3
{
  self->_updating = a3;
}

@end