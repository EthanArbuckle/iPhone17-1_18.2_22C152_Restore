@interface CADLocalXPCConnection
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)isValid;
- (CADLocalXPCConnection)initWithRemoteObject:(id)a3;
- (id)_remoteObjectProxyWithErrorHandler:(id)a3 synchronous:(BOOL)a4;
- (id)invalidationHandler;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (int)processIdentifier;
- (void)invalidate;
- (void)resume;
- (void)setInvalidationHandler:(id)a3;
@end

@implementation CADLocalXPCConnection

- (int)processIdentifier
{
  if (_processIdentifierForCurrentProcess_onceToken != -1) {
    dispatch_once(&_processIdentifierForCurrentProcess_onceToken, &__block_literal_global_84);
  }
  return _processIdentifierForCurrentProcess_pid;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  if (_auditTokenForCurrentProcess_onceToken != -1) {
    dispatch_once(&_auditTokenForCurrentProcess_onceToken, &__block_literal_global_1);
  }
  long long v4 = unk_1E9F8C098;
  *(_OWORD *)retstr->var0 = _auditTokenForCurrentProcess_token;
  *(_OWORD *)&retstr->var0[4] = v4;
  return self;
}

- (BOOL)isValid
{
  return self->_state != 2;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  return [(CADLocalXPCConnection *)self _remoteObjectProxyWithErrorHandler:a3 synchronous:1];
}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3 synchronous:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (self->_remoteObject)
  {
    v7 = [[CADLocalXPCProxyObject alloc] initWithWrappedObject:self->_remoteObject queue:self->_queue errorHandler:v6 synchronous:v4 connection:self];
  }
  else
  {
    v8 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_FAULT)) {
      -[CADLocalXPCConnection _remoteObjectProxyWithErrorHandler:synchronous:](v8);
    }
    v7 = 0;
  }

  return v7;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (void)invalidate
{
  self->_state = 2;
  v3 = [(CADLocalXPCConnection *)self invalidationHandler];

  if (v3)
  {
    BOOL v4 = [(CADLocalXPCConnection *)self invalidationHandler];
    v4[2]();
  }
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_remoteObject, 0);
}

- (CADLocalXPCConnection)initWithRemoteObject:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CADLocalXPCConnection;
  id v6 = [(CADLocalXPCConnection *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_remoteObject, a3);
    v7->_state = 0;
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("CADLocalXPCConnectionQueue", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

    dispatch_suspend((dispatch_object_t)v7->_queue);
  }

  return v7;
}

- (void)resume
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1BBC88000, log, OS_LOG_TYPE_FAULT, "Attempt to resume connection that is not suspended.", v1, 2u);
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  return [(CADLocalXPCConnection *)self _remoteObjectProxyWithErrorHandler:a3 synchronous:0];
}

- (void)_remoteObjectProxyWithErrorHandler:(os_log_t)log synchronous:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1BBC88000, log, OS_LOG_TYPE_FAULT, "Attempt to get a remote object proxy before assigning a remote object", v1, 2u);
}

@end