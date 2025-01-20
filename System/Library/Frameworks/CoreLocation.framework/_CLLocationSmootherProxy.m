@interface _CLLocationSmootherProxy
- (CLLocationSmoother)locationManagerSmoother;
- (CLLocationSmootherDelegate)delegate;
- (NSXPCConnection)connection;
- (_CLLocationSmootherProxy)initWithCLLocationSmoother:(id)a3;
- (void)createConnection;
- (void)dealloc;
- (void)didSmoothLocations:(id)a3 ofType:(id)a4;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLocationManagerSmoother:(id)a3;
@end

@implementation _CLLocationSmootherProxy

- (_CLLocationSmootherProxy)initWithCLLocationSmoother:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_CLLocationSmootherProxy;
  v4 = [(_CLLocationSmootherProxy *)&v7 init];
  if (v4)
  {
    v4->_queue = (OS_dispatch_queue *)dispatch_queue_create((const char *)[(id)objc_msgSend(NSString stringWithFormat:@"_CLLocationSmootherProxy, %p", v4), "UTF8String"], 0);
    [(_CLLocationSmootherProxy *)v4 createConnection];
    v4->_locationManagerSmoother = (CLLocationSmoother *)a3;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v4, (CFNotificationCallback)sub_190732B18, @"com.apple.locationd.smoother", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v4;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  [(_CLLocationSmootherProxy *)self setLocationManagerSmoother:0];
  [(_CLLocationSmootherProxy *)self setDelegate:0];
  [(_CLLocationSmootherProxy *)self setConnection:0];
  queue = self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)_CLLocationSmootherProxy;
  [(_CLLocationSmootherProxy *)&v5 dealloc];
}

- (void)didSmoothLocations:(id)a3 ofType:(id)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_190732C84;
  block[3] = &unk_1E5696FA8;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)createConnection
{
  connection = self->_connection;
  if (connection)
  {

    self->_connection = 0;
  }
  v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.locationd.smoother" options:4096];
  self->_connection = v4;
  if (v4)
  {
    -[NSXPCConnection setExportedInterface:](self->_connection, "setExportedInterface:", [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE02AC68]);
    [(NSXPCConnection *)self->_connection setExportedObject:self];
    objc_super v5 = [(NSXPCConnection *)self->_connection exportedInterface];
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v5, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0), sel_didSmoothLocations_ofType_, 0, 0);
    -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE041038]);
    v9 = [(NSXPCConnection *)self->_connection serviceName];
    v10 = self->_connection;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_190732EEC;
    v13[3] = &unk_1E5696BF0;
    v13[4] = v9;
    [(NSXPCConnection *)v10 setInterruptionHandler:v13];
    v11 = self->_connection;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_190732F1C;
    v12[3] = &unk_1E5696BF0;
    v12[4] = v9;
    [(NSXPCConnection *)v11 setInvalidationHandler:v12];
    [(NSXPCConnection *)self->_connection resume];
  }
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (CLLocationSmootherDelegate)delegate
{
  return (CLLocationSmootherDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (CLLocationSmoother)locationManagerSmoother
{
  return self->_locationManagerSmoother;
}

- (void)setLocationManagerSmoother:(id)a3
{
  self->_locationManagerSmoother = (CLLocationSmoother *)a3;
}

- (void).cxx_destruct
{
}

@end