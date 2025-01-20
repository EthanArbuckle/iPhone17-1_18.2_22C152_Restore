@interface CLLocationManagerGathering
- (CLLocationManagerGathering)init;
- (CLLocationManagerGathering)initWithQueue:(id)a3;
- (NSXPCConnection)connection;
- (id)getConnection;
- (id)getRemoteObjectProxy;
- (void)configure:(id)a3 withCompletionHandler:(id)a4;
- (void)dealloc;
- (void)fetchAdvertisementsDetailedWithHandler:(id)a3;
- (void)fetchAdvertisementsWithHandler:(id)a3;
- (void)setConnection:(id)a3;
@end

@implementation CLLocationManagerGathering

- (CLLocationManagerGathering)init
{
  v3 = dispatch_queue_create((const char *)[(id)objc_msgSend(NSString stringWithFormat:@"_CLLocationManagerGatheringProxy, %p", self), "UTF8String"], 0);
  v4 = [(CLLocationManagerGathering *)self initWithQueue:v3];
  dispatch_release(v3);
  return v4;
}

- (CLLocationManagerGathering)initWithQueue:(id)a3
{
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLLocationManagerGathering.mm", 38, @"Invalid parameter not satisfying: %@", @"queue");
  }
  v7.receiver = self;
  v7.super_class = (Class)CLLocationManagerGathering;
  v5 = [(CLLocationManagerGathering *)&v7 init];
  if (v5) {
    v5->_queue = (OS_dispatch_queue *)a3;
  }
  return v5;
}

- (void)dealloc
{
  [(NSXPCConnection *)[(CLLocationManagerGathering *)self connection] invalidate];
  [(CLLocationManagerGathering *)self setConnection:0];
  queue = self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CLLocationManagerGathering;
  [(CLLocationManagerGathering *)&v4 dealloc];
}

- (id)getConnection
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id result = self->_connection;
  if (!result)
  {
    if (qword_1E929F5F0 != -1) {
      dispatch_once(&qword_1E929F5F0, &unk_1EE003338);
    }
    objc_super v4 = qword_1E929F610;
    if (os_log_type_enabled((os_log_t)qword_1E929F610, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1906B8000, v4, OS_LOG_TYPE_DEBUG, "Creating new connection...", buf, 2u);
    }
    if (sub_1906CB57C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F5F0 != -1) {
        dispatch_once(&qword_1E929F5F0, &unk_1EE003338);
      }
      LOWORD(location) = 0;
      v17 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "-[CLLocationManagerGathering getConnection]", "CoreLocation: %s\n", v17);
      if (v17 != (char *)buf) {
        free(v17);
      }
    }
    v5 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.locationd.gathering" options:4096];
    self->_connection = v5;
    if (v5)
    {
      [(NSXPCConnection *)v5 _setQueue:self->_queue];
      -[NSXPCConnection setExportedInterface:](self->_connection, "setExportedInterface:", [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE041098]);
      [(NSXPCConnection *)self->_connection setExportedObject:self];
      -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE0410F8]);
      v6 = [(NSXPCConnection *)self->_connection remoteObjectInterface];
      objc_super v7 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v8 = objc_opt_class();
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v6, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0), sel_fetchAdvertisementsWithCompletion_, 0, 1);
      v9 = [(NSXPCConnection *)self->_connection remoteObjectInterface];
      v10 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v11 = objc_opt_class();
      -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v9, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0), sel_fetchAdvertisementsDetailedWithCompletion_, 0, 1);
      v12 = [(NSXPCConnection *)self->_connection serviceName];
      connection = self->_connection;
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = sub_19073ED70;
      v23[3] = &unk_1E5696BF0;
      v23[4] = v12;
      [(NSXPCConnection *)connection setInterruptionHandler:v23];
      objc_initWeak(&location, self);
      v14 = self->_connection;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = sub_19073EF24;
      v20[3] = &unk_1E5697448;
      v20[4] = v12;
      objc_copyWeak(&v21, &location);
      [(NSXPCConnection *)v14 setInvalidationHandler:v20];
      [(NSXPCConnection *)self->_connection activate];
      if (qword_1E929F5F0 != -1) {
        dispatch_once(&qword_1E929F5F0, &unk_1EE003338);
      }
      v15 = qword_1E929F610;
      if (os_log_type_enabled((os_log_t)qword_1E929F610, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1906B8000, v15, OS_LOG_TYPE_DEBUG, "Creating new connection... activated!", buf, 2u);
      }
      if (sub_1906CB57C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929F5F0 != -1) {
          dispatch_once(&qword_1E929F5F0, &unk_1EE003338);
        }
        v18 = (char *)_os_log_send_and_compose_impl();
        sub_1906D4A28("Generic", 1, 0, 2, "-[CLLocationManagerGathering getConnection]", "CoreLocation: %s\n", v18);
        if (v18 != (char *)buf) {
          free(v18);
        }
      }
      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
      return self->_connection;
    }
    else
    {
      if (qword_1E929F5F0 != -1) {
        dispatch_once(&qword_1E929F5F0, &unk_1EE003338);
      }
      v16 = qword_1E929F610;
      if (os_log_type_enabled((os_log_t)qword_1E929F610, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1906B8000, v16, OS_LOG_TYPE_DEFAULT, "NSXPCConnection failed to init", buf, 2u);
      }
      if (sub_1906CB57C(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1E929F5F0 != -1) {
          dispatch_once(&qword_1E929F5F0, &unk_1EE003338);
        }
        LOWORD(location) = 0;
        v19 = (char *)_os_log_send_and_compose_impl();
        sub_1906D4A28("Generic", 1, 0, 2, "-[CLLocationManagerGathering getConnection]", "CoreLocation: %s\n", v19);
        if (v19 != (char *)buf) {
          free(v19);
        }
      }
      return 0;
    }
  }
  return result;
}

- (id)getRemoteObjectProxy
{
  id v2 = [(CLLocationManagerGathering *)self getConnection];

  return (id)[v2 remoteObjectProxyWithErrorHandler:&unk_1EE0057A0];
}

- (void)fetchAdvertisementsWithHandler:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F5F0 != -1) {
    dispatch_once(&qword_1E929F5F0, &unk_1EE003338);
  }
  v6 = qword_1E929F610;
  if (os_log_type_enabled((os_log_t)qword_1E929F610, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1906B8000, v6, OS_LOG_TYPE_DEBUG, "fetchAdvertisementsWithHandler", buf, 2u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F5F0 != -1) {
      dispatch_once(&qword_1E929F5F0, &unk_1EE003338);
    }
    __int16 v10 = 0;
    uint64_t v8 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLLocationManagerGathering fetchAdvertisementsWithHandler:]", "CoreLocation: %s\n", v8);
    if (v8 != (char *)buf) {
      free(v8);
    }
  }
  queue = self->_queue;
  if (!queue)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLLocationManagerGathering.mm", 119, @"Invalid parameter not satisfying: %@", @"_queue");
    queue = self->_queue;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_19073F648;
  block[3] = &unk_1E5696D30;
  block[4] = self;
  block[5] = a3;
  dispatch_async(queue, block);
}

- (void)fetchAdvertisementsDetailedWithHandler:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F5F0 != -1) {
    dispatch_once(&qword_1E929F5F0, &unk_1EE003338);
  }
  v6 = qword_1E929F610;
  if (os_log_type_enabled((os_log_t)qword_1E929F610, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1906B8000, v6, OS_LOG_TYPE_DEBUG, "fetchAdvertisementsDetailedWithHandler", buf, 2u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F5F0 != -1) {
      dispatch_once(&qword_1E929F5F0, &unk_1EE003338);
    }
    __int16 v10 = 0;
    uint64_t v8 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLLocationManagerGathering fetchAdvertisementsDetailedWithHandler:]", "CoreLocation: %s\n", v8);
    if (v8 != (char *)buf) {
      free(v8);
    }
  }
  queue = self->_queue;
  if (!queue)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLLocationManagerGathering.mm", 143, @"Invalid parameter not satisfying: %@", @"_queue");
    queue = self->_queue;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_19073FBAC;
  block[3] = &unk_1E5696D30;
  block[4] = self;
  block[5] = a3;
  dispatch_async(queue, block);
}

- (void)configure:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F5F0 != -1) {
    dispatch_once(&qword_1E929F5F0, &unk_1EE003338);
  }
  uint64_t v8 = qword_1E929F610;
  if (os_log_type_enabled((os_log_t)qword_1E929F610, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1906B8000, v8, OS_LOG_TYPE_DEBUG, "configure:withCompletionHandler:", buf, 2u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F5F0 != -1) {
      dispatch_once(&qword_1E929F5F0, &unk_1EE003338);
    }
    __int16 v12 = 0;
    __int16 v10 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLLocationManagerGathering configure:withCompletionHandler:]", "CoreLocation: %s\n", v10);
    if (v10 != (char *)buf) {
      free(v10);
    }
  }
  queue = self->_queue;
  if (!queue)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLLocationManagerGathering.mm", 169, @"Invalid parameter not satisfying: %@", @"_queue");
    queue = self->_queue;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_190740138;
  block[3] = &unk_1E56974E0;
  block[4] = self;
  block[5] = a4;
  void block[6] = a3;
  dispatch_async(queue, block);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

@end