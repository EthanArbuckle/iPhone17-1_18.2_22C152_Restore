@interface NSXPCConnection
+ (NSXPCConnection)currentConnection;
+ (void)_currentBoost;
+ (void)_handoffCurrentReplyToQueue:(id)a3 block:(id)a4;
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (Class)_remoteObjectInterfaceClass;
- (NSString)_serviceInfoForDecoder;
- (NSString)serviceName;
- (NSXPCConnection)init;
- (NSXPCConnection)initWithListenerEndpoint:(NSXPCListenerEndpoint *)endpoint;
- (NSXPCConnection)initWithMachServiceName:(NSString *)name options:(NSXPCConnectionOptions)options;
- (NSXPCConnection)initWithMachServiceName:(id)a3;
- (NSXPCConnection)initWithServiceName:(NSString *)serviceName;
- (NSXPCConnection)initWithServiceName:(id)a3 options:(unint64_t)a4;
- (NSXPCInterface)exportedInterface;
- (NSXPCInterface)remoteObjectInterface;
- (NSXPCListenerEndpoint)endpoint;
- (au_asid_t)auditSessionIdentifier;
- (gid_t)effectiveGroupIdentifier;
- (id)_additionalInvalidationHandler;
- (id)_errorDescription;
- (id)_initWithCustomTransport:(id)a3;
- (id)_initWithRemoteConnection:(id)a3 name:(id)a4;
- (id)_initWithRemoteService:(id)a3 name:(id)a4 options:(unint64_t)a5;
- (id)_initWithRemoteService:(id)a3 name:(id)a4 options:(unint64_t)a5 mode:(unint64_t)a6;
- (id)_queue;
- (id)_unboostingRemoteObjectProxy;
- (id)_xpcConnection;
- (id)delegate;
- (id)description;
- (id)exportedObject;
- (id)remoteObjectProxy;
- (id)remoteObjectProxyWithErrorHandler:(void *)handler;
- (id)remoteObjectProxyWithTimeout:(double)a3 errorHandler:(id)a4;
- (id)remoteObjectProxyWithUserInfo:(id)a3 errorHandler:(id)a4;
- (id)replacementObjectForEncoder:(id)a3 object:(id)a4;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(void *)handler;
- (id)userInfo;
- (id)valueForEntitlement:(id)a3;
- (pid_t)processIdentifier;
- (uid_t)effectiveUserIdentifier;
- (uint64_t)_initWithPeerConnection:(void *)a1 name:(_xpc_connection_s *)a2 options:(__CFString *)a3;
- (uint64_t)_initWithRemotePeerConnection:(void *)a1 name:(uint64_t)a2 options:(__CFString *)a3;
- (uint64_t)_removeImportedProxy:(uint64_t)result;
- (uint64_t)_sendProgressMessage:(uint64_t)a3 forSequence:;
- (void)_cancelProgress:(unint64_t)a3;
- (void)_decodeAndInvokeMessageWithEvent:(id)a3 reply:(id)a4 flags:(unint64_t)a5;
- (void)_decodeAndInvokeReplyBlockWithEvent:(id)a3 sequence:(unint64_t)a4 replyInfo:(id)a5;
- (void)_decodeProgressMessageWithData:(id)a3 flags:(unint64_t)a4;
- (void)_killConnection:(int)a3;
- (void)_pauseProgress:(unint64_t)a3;
- (void)_resumeProgress:(unint64_t)a3;
- (void)_sendDesistForProxy:(id)a3;
- (void)_sendInvocation:(id)a3 orArguments:(id *)a4 count:(unint64_t)a5 methodSignature:(id)a6 selector:(SEL)a7 withProxy:(id)a8;
- (void)_sendSelector:(SEL)a3 withProxy:(id)a4;
- (void)_sendSelector:(SEL)a3 withProxy:(id)a4 arg1:(id)a5;
- (void)_sendSelector:(SEL)a3 withProxy:(id)a4 arg1:(id)a5 arg2:(id)a6;
- (void)_sendSelector:(SEL)a3 withProxy:(id)a4 arg1:(id)a5 arg2:(id)a6 arg3:(id)a7;
- (void)_sendSelector:(SEL)a3 withProxy:(id)a4 arg1:(id)a5 arg2:(id)a6 arg3:(id)a7 arg4:(id)a8;
- (void)_setBootstrapObject:(id)a3 forKey:(id)a4;
- (void)_setLanguages:(id)a3;
- (void)_setQueue:(id)a3;
- (void)_setTargetUserIdentifier:(unsigned int)a3;
- (void)_setUUID:(id)a3;
- (void)activate;
- (void)dealloc;
- (void)interruptionHandler;
- (void)invalidate;
- (void)invalidationHandler;
- (void)resume;
- (void)scheduleSendBarrierBlock:(void *)block;
- (void)setDelegate:(id)a3;
- (void)setExportedInterface:(NSXPCInterface *)exportedInterface;
- (void)setExportedObject:(id)exportedObject;
- (void)setInterruptionHandler:(void *)interruptionHandler;
- (void)setInvalidationHandler:(void *)invalidationHandler;
- (void)setOptions:(unint64_t)a3;
- (void)setRemoteObjectInterface:(NSXPCInterface *)remoteObjectInterface;
- (void)setUserInfo:(id)a3;
- (void)set_additionalInvalidationHandler:(id)a3;
- (void)suspend;
@end

@implementation NSXPCConnection

- (id)replacementObjectForEncoder:(id)a3 object:(id)a4
{
  if (!atomic_load((unint64_t *)&self->_delegate)) {
    return a4;
  }
  char v5 = atomic_load(&self->_state2);
  if ((v5 & 2) == 0) {
    return a4;
  }
  v7 = (void *)atomic_load((unint64_t *)&self->_delegate);
  return (id)objc_msgSend(v7, "replacementObjectForXPCConnection:encoder:object:");
}

void __56__NSXPCConnection__initWithPeerConnection_name_options___block_invoke(uint64_t a1, void *a2)
{
}

- (NSXPCConnection)initWithMachServiceName:(NSString *)name options:(NSXPCConnectionOptions)options
{
  handler[5] = *MEMORY[0x1E4F143B8];
  v7 = [(NSXPCConnection *)self init];
  if (v7)
  {
    v8 = [+[NSFileManager defaultManager] fileSystemRepresentationWithPath:name];
    if (!v8)
    {

      v8 = 0;
    }
    v9 = [+[NSString stringWithFormat:@"com.apple.NSXPCConnection.m-user.%@", name] UTF8String];
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    global_queue = dispatch_get_global_queue(21, 0);
    v7->_userQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2(v9, v10, global_queue);
    v7->_serviceName = (NSString *)[(NSString *)name copy];
    mach_service = xpc_connection_create_mach_service(v8, (dispatch_queue_t)v7->_userQueue, (options >> 11) & 2);
    v7->_connection.xpc = mach_service;
    if (!mach_service)
    {
      v15 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Unable to connect to the specified name (%@). No connection was created.", _NSMethodExceptionProem((objc_class *)v7, a2), v7->_serviceName), 0 reason userInfo];
      objc_exception_throw(v15);
    }
    xpc_connection_set_target_queue(mach_service, (dispatch_queue_t)v7->_userQueue);
    xpc = v7->_connection.xpc;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __51__NSXPCConnection_initWithMachServiceName_options___block_invoke;
    handler[3] = &unk_1E51F99C0;
    handler[4] = v7;
    xpc_connection_set_event_handler(xpc, handler);
    [(NSString *)v7->_serviceName UTF8String];
  }
  return v7;
}

- (uint64_t)_initWithPeerConnection:(void *)a1 name:(_xpc_connection_s *)a2 options:(__CFString *)a3
{
  handler[5] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v5 = [a1 init];
  if (v5)
  {
    *(void *)(v5 + 104) = [(__CFString *)a3 copy];
    uint64_t pid = xpc_connection_get_pid(a2);
    v7 = @"anonymous";
    if (a3) {
      v7 = a3;
    }
    v8 = +[NSString stringWithFormat:@"com.apple.NSXPCConnection.user.%@.%d", v7, pid];
    atomic_fetch_or((atomic_uint *volatile)(v5 + 36), 0x10u);
    v9 = [(NSString *)v8 UTF8String];
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    global_queue = dispatch_get_global_queue(21, 0);
    *(void *)(v5 + 24) = dispatch_queue_create_with_target_V2(v9, v10, global_queue);
    v12 = (_xpc_connection_s *)xpc_retain(a2);
    *(void *)(v5 + 8) = v12;
    xpc_connection_set_target_queue(v12, *(dispatch_queue_t *)(v5 + 24));
    v13 = *(_xpc_connection_s **)(v5 + 8);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __56__NSXPCConnection__initWithPeerConnection_name_options___block_invoke;
    handler[3] = &unk_1E51F99C0;
    handler[4] = v5;
    xpc_connection_set_event_handler(v13, handler);
  }
  return v5;
}

- (NSXPCConnection)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)NSXPCConnection;
  v2 = [(NSXPCConnection *)&v4 init];
  if (v2)
  {
    v2->_exportInfo = (_NSXPCConnectionExportedObjectTable *)objc_opt_new();
    v2->_importInfo = (_NSXPCConnectionImportInfo *)objc_opt_new();
    v2->_repliesExpected = (_NSXPCConnectionExpectedReplies *)objc_opt_new();
    v2->_repliesRequested = (_NSXPCConnectionRequestedReplies *)objc_opt_new();
    v2->_lock._os_unfair_lock_opaque = 0;
    v2->_eCache = (_NSXPCConnectionClassCache *)objc_opt_new();
    v2->_dCache = (_NSXPCConnectionClassCache *)objc_opt_new();
    v2->_importInfo->_generationCount = 1;
  }
  return v2;
}

- (void)invalidate
{
  atomic_fetch_or((atomic_uint *volatile)&self->_state2, 8u);
  char v2 = atomic_load(&self->_state2);
  if ((v2 & 0x40) != 0)
  {
    transport = self->_transport;
    [(_NSXPCTransport *)transport cancel];
  }
  else
  {
    xpc = self->_connection.xpc;
    if (xpc)
    {
      xpc_connection_cancel(xpc);
    }
  }
}

void __51__NSXPCConnection_initWithMachServiceName_options___block_invoke(uint64_t a1, void *a2)
{
}

- (NSXPCConnection)initWithServiceName:(id)a3 options:(unint64_t)a4
{
  handler[5] = *MEMORY[0x1E4F143B8];
  v6 = [(NSXPCConnection *)self init];
  if (v6)
  {
    v7 = [+[NSFileManager defaultManager] fileSystemRepresentationWithPath:a3];
    if (!v7)
    {

      v7 = 0;
    }
    v8 = [+[NSString stringWithFormat:@"com.apple.NSXPCConnection.user.%@", a3] UTF8String];
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    global_queue = dispatch_get_global_queue(21, 0);
    v6->_userQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2(v8, v9, global_queue);
    v6->_serviceName = (NSString *)[a3 copy];
    v11 = xpc_connection_create(v7, (dispatch_queue_t)v6->_userQueue);
    v6->_connection.xpc = v11;
    if (!v11)
    {
      v14 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Unable to connect to the specified name (%@). No connection was created.", _NSMethodExceptionProem((objc_class *)v6, a2), v6->_serviceName), 0 reason userInfo];
      objc_exception_throw(v14);
    }
    xpc_connection_set_target_queue(v11, (dispatch_queue_t)v6->_userQueue);
    xpc = v6->_connection.xpc;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __47__NSXPCConnection_initWithServiceName_options___block_invoke;
    handler[3] = &unk_1E51F99C0;
    handler[4] = v6;
    xpc_connection_set_event_handler(xpc, handler);
    [(NSString *)v6->_serviceName UTF8String];
  }
  return v6;
}

- (id)userInfo
{
  char v2 = self->_otherInfo;

  return v2;
}

- (NSXPCInterface)remoteObjectInterface
{
  return (NSXPCInterface *)objc_getProperty(self, a2, 96, 1);
}

- (void)_sendSelector:(SEL)a3 withProxy:(id)a4 arg1:(id)a5 arg2:(id)a6 arg3:(id)a7 arg4:(id)a8
{
  v16[4] = *MEMORY[0x1E4F143B8];
  if (a4) {
    id Property = objc_getProperty(a4, a2, 16, 1);
  }
  else {
    id Property = 0;
  }
  v16[0] = a5;
  v16[1] = a6;
  v16[2] = a7;
  v16[3] = a8;
  -[NSXPCConnection _sendInvocation:orArguments:count:methodSignature:selector:withProxy:](self, "_sendInvocation:orArguments:count:methodSignature:selector:withProxy:", 0, v16, 4, [Property _methodSignatureForRemoteSelector:a3], a3, a4);
}

- (void)_sendSelector:(SEL)a3 withProxy:(id)a4
{
  if (a4) {
    id Property = objc_getProperty(a4, a2, 16, 1);
  }
  else {
    id Property = 0;
  }
  uint64_t v8 = [Property _methodSignatureForRemoteSelector:a3];

  [(NSXPCConnection *)self _sendInvocation:0 orArguments:0 count:0 methodSignature:v8 selector:a3 withProxy:a4];
}

- (void)_sendSelector:(SEL)a3 withProxy:(id)a4 arg1:(id)a5 arg2:(id)a6 arg3:(id)a7
{
  v14[3] = *MEMORY[0x1E4F143B8];
  if (a4) {
    id Property = objc_getProperty(a4, a2, 16, 1);
  }
  else {
    id Property = 0;
  }
  v14[0] = a5;
  v14[1] = a6;
  v14[2] = a7;
  -[NSXPCConnection _sendInvocation:orArguments:count:methodSignature:selector:withProxy:](self, "_sendInvocation:orArguments:count:methodSignature:selector:withProxy:", 0, v14, 3, [Property _methodSignatureForRemoteSelector:a3], a3, a4);
}

- (void)_sendSelector:(SEL)a3 withProxy:(id)a4 arg1:(id)a5
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  if (a4) {
    id Property = objc_getProperty(a4, a2, 16, 1);
  }
  else {
    id Property = 0;
  }
  -[NSXPCConnection _sendInvocation:orArguments:count:methodSignature:selector:withProxy:](self, "_sendInvocation:orArguments:count:methodSignature:selector:withProxy:", 0, &v9, 1, objc_msgSend(Property, "_methodSignatureForRemoteSelector:", a3, v9, v10), a3, a4);
}

- (void)_sendSelector:(SEL)a3 withProxy:(id)a4 arg1:(id)a5 arg2:(id)a6
{
  v12[2] = *MEMORY[0x1E4F143B8];
  if (a4) {
    id Property = objc_getProperty(a4, a2, 16, 1);
  }
  else {
    id Property = 0;
  }
  v12[0] = a5;
  v12[1] = a6;
  -[NSXPCConnection _sendInvocation:orArguments:count:methodSignature:selector:withProxy:](self, "_sendInvocation:orArguments:count:methodSignature:selector:withProxy:", 0, v12, 2, [Property _methodSignatureForRemoteSelector:a3], a3, a4);
}

+ (NSXPCConnection)currentConnection
{
  id v2 = (id)_CFGetTSD();

  return (NSXPCConnection *)v2;
}

- (pid_t)processIdentifier
{
  char v2 = atomic_load(&self->_state2);
  if ((v2 & 0x40) != 0) {
    return [(_NSXPCTransport *)self->_transport processIdentifier];
  }
  else {
    return xpc_connection_get_pid(self->_connection.xpc);
  }
}

- (id)_xpcConnection
{
  char v2 = atomic_load(&self->_state2);
  if ((v2 & 0x40) != 0)
  {
    objc_super v4 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Custom transports do not support this method.", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v4);
  }
  return self->_connection.xpc;
}

- (id)_initWithCustomTransport:(id)a3
{
  v12[5] = *MEMORY[0x1E4F143B8];
  objc_super v4 = [(NSXPCConnection *)self init];
  if (v4)
  {
    uint64_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    global_queue = dispatch_get_global_queue(21, 0);
    v4->_userQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.NSXPCConnection.user.endpoint", v5, global_queue);
    atomic_fetch_or((atomic_uint *volatile)&v4->_state2, 0x40u);
    v7 = (_NSXPCTransport *)a3;
    v4->_transport = v7;
    [(_NSXPCTransport *)v7 setTargetQueue:v4->_userQueue];
    transport = v4->_transport;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __44__NSXPCConnection__initWithCustomTransport___block_invoke;
    void v12[3] = &unk_1E51F99C0;
    v12[4] = v4;
    [(_NSXPCTransport *)transport setErrorHandler:v12];
    id v9 = v4->_transport;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __44__NSXPCConnection__initWithCustomTransport___block_invoke_2;
    v11[3] = &unk_1E51FE6E0;
    v11[4] = v4;
    [(_NSXPCTransport *)v9 setMessageHandler:v11];
  }
  return v4;
}

- (void)setExportedInterface:(NSXPCInterface *)exportedInterface
{
}

- (void)activate
{
  if ((atomic_fetch_or((atomic_uchar *volatile)&self->_state, 4u) & 4) == 0) {
    CFRetain(self);
  }
  -[_NSXPCConnectionImportInfo _clearEntitlementCache]((uint64_t)self->_importInfo);
  char v3 = atomic_load(&self->_state2);
  if ((v3 & 0x40) != 0)
  {
    transport = self->_transport;
    [(_NSXPCTransport *)transport activate];
  }
  else
  {
    xpc = self->_connection.xpc;
    if (xpc)
    {
      xpc_connection_activate(xpc);
    }
  }
}

- (void)resume
{
  if ((atomic_fetch_or((atomic_uchar *volatile)&self->_state, 4u) & 4) == 0) {
    CFRetain(self);
  }
  -[_NSXPCConnectionImportInfo _clearEntitlementCache]((uint64_t)self->_importInfo);
  char v3 = atomic_load(&self->_state2);
  if ((v3 & 0x40) != 0)
  {
    transport = self->_transport;
    [(_NSXPCTransport *)transport resume];
  }
  else
  {
    xpc = self->_connection.xpc;
    xpc_connection_resume(xpc);
  }
}

- (void)setDelegate:(id)a3
{
  atomic_store((unint64_t)a3, (unint64_t *)&self->_delegate);
  atomic_load((unint64_t *)&self->_delegate);
  char v4 = objc_opt_respondsToSelector();
  p_state2 = &self->_state2;
  if (v4) {
    atomic_fetch_or((atomic_uint *volatile)p_state2, 2u);
  }
  else {
    atomic_fetch_and((atomic_uint *volatile)p_state2, 0xFFFFFFFD);
  }
}

- (void)setRemoteObjectInterface:(NSXPCInterface *)remoteObjectInterface
{
}

- (void)_setQueue:(id)a3
{
  if (!a3)
  {
    id v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: The queue parameter is NULL, which is invalid", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v9);
  }
  userQueue = self->_userQueue;
  if (userQueue) {
    BOOL v6 = userQueue == a3;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    dispatch_retain((dispatch_object_t)a3);
    v7 = self->_userQueue;
    self->_userQueue = (OS_dispatch_queue *)a3;
    char v8 = atomic_load(&self->_state2);
    if ((v8 & 0x40) != 0) {
      [(_NSXPCTransport *)self->_transport setTargetQueue:a3];
    }
    else {
      xpc_connection_set_target_queue(self->_connection.xpc, (dispatch_queue_t)a3);
    }
    dispatch_release(v7);
  }
}

- (void)setOptions:(unint64_t)a3
{
  __int16 v3 = a3;
  if ((a3 & 0x100) != 0)
  {
    char v6 = atomic_load(&self->_state2);
    if ((v6 & 0x40) != 0) {
      goto LABEL_9;
    }
    xpc_connection_set_legacy();
  }
  if ((v3 & 0x1000) == 0) {
    return;
  }
  char v7 = atomic_load(&self->_state2);
  if ((v7 & 0x40) != 0)
  {
LABEL_9:
    id v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Custom transports do not support this method.", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v9);
  }
  xpc = self->_connection.xpc;

  MEMORY[0x1F40CECC8](xpc);
}

- (uint64_t)_removeImportedProxy:(uint64_t)result
{
  if (result)
  {
    __int16 v3 = (void *)result;
    if (!a2 || *(void *)(a2 + 40) != 1)
    {
      result = -[_NSXPCConnectionImportInfo removeProxy:](*(void *)(result + 72), a2);
      if (result)
      {
        return [v3 _sendDesistForProxy:a2];
      }
    }
  }
  return result;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];

  id interruptionHandler = self->_interruptionHandler;
  if (interruptionHandler)
  {

    self->_id interruptionHandler = 0;
  }
  id invalidationHandler = self->_invalidationHandler;
  if (invalidationHandler)
  {

    self->_id invalidationHandler = 0;
  }

  bootstrap = self->_bootstrap;
  if (bootstrap) {
    xpc_release(bootstrap);
  }
  userQueue = self->_userQueue;
  if (userQueue) {
    dispatch_release(userQueue);
  }

  xpc = self->_connection.xpc;
  if (xpc) {
    xpc_release(xpc);
  }
  v8.receiver = self;
  v8.super_class = (Class)NSXPCConnection;
  [(NSXPCConnection *)&v8 dealloc];
}

- (void)_sendDesistForProxy:(id)a3
{
  if (a3)
  {
    uint64_t v4 = *((void *)a3 + 5);
    if (v4 == 1) {
      return;
    }
    uint64_t v5 = *((void *)a3 + 6);
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  if (v5 == self->_importInfo->_generationCount)
  {
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "f", 0xDuLL);
    xpc_dictionary_set_uint64(v6, "proxynum", v4);
    char v7 = atomic_load(&self->_state2);
    if ((v7 & 0x40) != 0)
    {
      [(_NSXPCTransport *)self->_transport sendNotification:v6];
    }
    else if (self->_connection.xpc)
    {
      xpc_connection_send_notification();
    }
    xpc_release(v6);
  }
}

- (void)setInvalidationHandler:(void *)invalidationHandler
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = self->_invalidationHandler;
  if (v6 != invalidationHandler)
  {
    if (v6) {

    }
    if (invalidationHandler) {
      char v7 = (void *)[invalidationHandler copy];
    }
    else {
      char v7 = 0;
    }
    self->_id invalidationHandler = v7;
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)setInterruptionHandler:(void *)interruptionHandler
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = self->_interruptionHandler;
  if (v6 != interruptionHandler)
  {
    if (v6) {

    }
    if (interruptionHandler) {
      char v7 = (void *)[interruptionHandler copy];
    }
    else {
      char v7 = 0;
    }
    self->_id interruptionHandler = v7;
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)setExportedObject:(id)exportedObject
{
}

- (void)invalidationHandler
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (id)[self->_invalidationHandler copy];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)_additionalInvalidationHandler
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (id)objc_msgSend(objc_getAssociatedObject(self, "additionalInvalidationHandler"), "copy");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)interruptionHandler
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (id)[self->_interruptionHandler copy];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

void __44__NSXPCConnection__initWithCustomTransport___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
}

- (void)_decodeAndInvokeReplyBlockWithEvent:(id)a3 sequence:(unint64_t)a4 replyInfo:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a5)
  {
    objc_super v8 = [NSXPCDecoder alloc];
    uint64_t v10 = [(NSXPCDecoder *)v8 initWithInterface:objc_getProperty(a5, v9, 40, 1)];
    [(NSXPCDecoder *)v10 _setConnection:self];
    if (self->_otherInfo) {
      -[NSXPCCoder setUserInfo:](v10, "setUserInfo:");
    }
    v11 = (const char **)((char *)a5 + 32);
    if (*((void *)a5 + 4)) {
      uint64_t v12 = *((void *)a5 + 4);
    }
    else {
      uint64_t v12 = 0;
    }
    id v15 = [(NSXPCDecoder *)v10 _decodeReplyFromXPCObject:a3 forSelector:v12];
    if (!v15)
    {
      v25 = +[NSString stringWithFormat:@"NSXPCConnection %p: Decode of incoming invocation failed (no result)", self];
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v25 userInfo:0]);
    }
    objc_msgSend(v15, "setTarget:", objc_getProperty(a5, v14, 8, 1));
    _CFGetTSD();
    _CFSetTSD();
    v16 = (void *)atomic_load((unint64_t *)&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      v17 = [NSString alloc];
      if (*v11) {
        v18 = *v11;
      }
      else {
        v18 = 0;
      }
      v19 = [(NSString *)v17 initWithUTF8String:sel_getName(v18)];
      if (objc_getProperty(a5, v20, 48, 1))
      {
        v28[0] = @"_NSXPCConnectionInvocationReplyToSelectorKey";
        v28[1] = @"_NSXPCConnectionInvocationReplyUserInfoKey";
        v29[0] = v19;
        v29[1] = objc_getProperty(a5, v21, 48, 1);
        v22 = (__CFString **)v28;
        v23 = (NSString **)v29;
        uint64_t v24 = 2;
      }
      else
      {
        v26 = @"_NSXPCConnectionInvocationReplyToSelectorKey";
        v27 = v19;
        v22 = &v26;
        v23 = &v27;
        uint64_t v24 = 1;
      }
      objc_msgSend(v15, "setUserInfo:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v23, v22, v24));
      [v16 connection:self handleInvocation:v15 isReply:1];
    }
    else
    {
      __NSXPCCONNECTION_IS_CALLING_OUT_TO_REPLY_BLOCK__(v15);
    }
    -[_NSXPCConnectionExpectedReplyInfo cleanup]((uint64_t)a5);
    _CFSetTSD();
  }
  else
  {
    v13 = _NSXPCLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v31 = self;
      _os_log_fault_impl(&dword_181795000, v13, OS_LOG_TYPE_FAULT, "%{public}@: Warning: Received reply to unknown message. Dropping incoming message and invalidating connection.", buf, 0xCu);
    }
    [(NSXPCConnection *)self invalidate];
  }
}

- (void)_decodeAndInvokeMessageWithEvent:(id)a3 reply:(id)a4 flags:(unint64_t)a5
{
  char v5 = a5;
  v72[5] = *MEMORY[0x1E4F143B8];
  uint64 = (const char *)xpc_dictionary_get_uint64(a3, "proxynum");
  if (!uint64
    || (v11 = -[_NSXPCConnectionExportedObjectTable exportedObjectForProxyNumber:]((os_unfair_lock_s *)self->_exportInfo, uint64), uint64_t v12 = -[_NSXPCConnectionExportedObjectTable interfaceForProxyNumber:]((os_unfair_lock_s *)self->_exportInfo, uint64), !v11))
  {
    v16 = _NSXPCLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = self;
      __int16 v66 = 2048;
      v67 = uint64;
      _os_log_fault_impl(&dword_181795000, v16, OS_LOG_TYPE_FAULT, "%{public}@: received an undecodable message for proxy %lld (no exported object to receive message). Dropping message.", buf, 0x16u);
    }
    goto LABEL_10;
  }
  v13 = v12;
  if (!v12)
  {
    v17 = _NSXPCLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = self;
      _os_log_fault_impl(&dword_181795000, v17, OS_LOG_TYPE_FAULT, "%{public}@: received an undecodable message (no protocol set to define allowed messages on exported object). Dropping message.", buf, 0xCu);
    }
LABEL_10:
    [(NSXPCConnection *)self invalidate];
    return;
  }
  unint64_t v14 = atomic_load((unint64_t *)&self->_delegate);
  v52 = (void *)v14;
  char v53 = objc_opt_respondsToSelector();
  id v63 = 0;
  v64 = 0;
  memset(v72, 0, 32);
  v61[0] = 0;
  v61[1] = v61;
  v61[2] = 0x2020000000;
  int v62 = 0;
  id v59 = 0;
  v60 = 0;
  id v15 = [[NSXPCDecoder alloc] initWithInterface:v13];
  [(NSXPCDecoder *)v15 _setConnection:self];
  if (self->_otherInfo) {
    -[NSXPCCoder setUserInfo:](v15, "setUserInfo:");
  }
  BOOL v54 = [(NSXPCDecoder *)v15 _decodeMessageFromXPCObject:a3 allowingSimpleMessageSend:(v53 & 1) == 0 outInvocation:&v60 outArguments:v72 outArgumentsMaxCount:4 outMethodSignature:&v59 outSelector:&v64] == 1;
  if (!v64)
  {
    v18 = _NSXPCLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = self;
      _os_log_fault_impl(&dword_181795000, v18, OS_LOG_TYPE_FAULT, "%{public}@: received an undecodable message (invocation with no selector)", buf, 0xCu);
    }
    BOOL v54 = 0;
    v60 = 0;
  }

  if (!v60 && !v54) {
    goto LABEL_88;
  }
  if ((v5 & 0x20) == 0)
  {
    if (![v60 _hasBlockArgument])
    {
      v21 = 0;
      char v51 = 1;
      goto LABEL_36;
    }
    v19 = _NSXPCLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = self;
      _os_log_fault_impl(&dword_181795000, v19, OS_LOG_TYPE_FAULT, "%{public}@: received an undecodable message (remote asked for no reply, but we expected one). Dropping message.", buf, 0xCu);
    }
    goto LABEL_88;
  }
  uint64_t v20 = xpc_dictionary_get_uint64(a3, "sequence");
  if ((v5 & 0x40) != 0)
  {
    v21 = [[_NSProgressWithRemoteParent alloc] initWithParent:0 userInfo:0];
    [(NSProgress *)v21 setTotalUnitCount:1];
    [(NSProgress *)v21 set_adoptChildUserInfo:1];
    [(_NSProgressWithRemoteParent *)v21 setSequence:v20];
    [(_NSProgressWithRemoteParent *)v21 setParentConnection:self];
    BOOL v22 = (v5 & 0x80) == 0;
  }
  else
  {
    v21 = 0;
    BOOL v22 = 1;
  }
  char v51 = v22;
  v50 = (const void *)v20;
  uint64_t v23 = [v59 numberOfArguments];
  uint64_t v24 = v23 - 2;
  if (v23 == 2) {
    goto LABEL_36;
  }
  uint64_t v25 = 0;
  while (1)
  {
    v26 = (_WORD *)[v59 _argInfo:v25 + 2];
    if (!v26)
    {
      v29 = _NSXPCLog();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
        goto LABEL_88;
      }
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = self;
      v30 = "%{public}@: received an undecodable message (invocation with bad argument info)";
LABEL_105:
      _os_log_fault_impl(&dword_181795000, v29, OS_LOG_TYPE_FAULT, v30, buf, 0xCu);
      goto LABEL_88;
    }
    __int16 v27 = v26[17];
    if ((v27 & 0x80) == 0) {
      goto LABEL_34;
    }
    if (!*(void *)v26)
    {
      v29 = _NSXPCLog();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
        goto LABEL_88;
      }
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = self;
      v30 = "%{public}@: received an undecodable message (invocation with bad replaced by pointer argument)";
      goto LABEL_105;
    }
    __int16 v27 = *(_WORD *)(*(void *)v26 + 34);
LABEL_34:
    if (v27 < 0) {
      break;
    }
    if (v24 == ++v25) {
      goto LABEL_36;
    }
  }
  string = xpc_dictionary_get_string(a3, "replysig");
  if (!string)
  {
    v37 = _NSXPCLog();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = self;
      _os_log_fault_impl(&dword_181795000, v37, OS_LOG_TYPE_FAULT, "%{public}@: received an undecodable message (invocation with no signature info)", buf, 0xCu);
    }
    goto LABEL_88;
  }
  uint64_t v32 = (void *)[MEMORY[0x1E4F1CA38] signatureWithObjCTypes:string];
  v49 = (void *)[(os_unfair_lock_s *)v13 _methodSignatureForReplyBlockOfSelector:v64];
  if (!v32
    || !v49
    || ([v32 isEqual:v49] & 1) == 0
    && ([v49 _isCompatibleWithMethodSignature:v32] & 1) == 0)
  {
    v34 = _NSXPCLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
    {
      Name = sel_getName(v64);
      uint64_t v44 = [v32 debugDescription];
      uint64_t v45 = [v49 debugDescription];
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = self;
      __int16 v66 = 2082;
      v67 = Name;
      __int16 v68 = 2114;
      uint64_t v69 = v44;
      __int16 v70 = 2114;
      uint64_t v71 = v45;
      _os_log_fault_impl(&dword_181795000, v34, OS_LOG_TYPE_FAULT, "%{public}@ received an undecodable message (incompatible reply block signature for %{public}s (wire: %{public}@ vs local: %{public}@)", buf, 0x2Au);
    }
LABEL_88:
    [(NSXPCConnection *)self invalidate];
    goto LABEL_85;
  }
  unint64_t v33 = [v49 numberOfArguments] - 1;
  if (v33 > 3) {
    char v48 = 0;
  }
  else {
    char v48 = [v49 _isAllObjects];
  }
  -[_NSXPCConnectionRequestedReplies beginTransactionForSequence:selector:reply:withProgress:]((uint64_t)self->_repliesRequested, v50, v64, a4, v21);
  char v38 = v48 ^ 1;
  if (v33) {
    char v39 = 1;
  }
  else {
    char v39 = v48 ^ 1;
  }
  if ((v39 & 1) == 0)
  {
    v40 = v58;
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke;
    v58[3] = &unk_1E51FE5C8;
    v58[5] = a4;
    v58[6] = v61;
    v58[7] = v50;
    v58[8] = v64;
    v58[9] = uint64;
    v58[4] = self;
    goto LABEL_110;
  }
  if (v33 != 1) {
    char v38 = 1;
  }
  if ((v38 & 1) == 0)
  {
    v40 = v57;
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke_3;
    v57[3] = &unk_1E51FE5F0;
    v57[4] = self;
    v57[5] = v13;
    v57[8] = v50;
    v57[9] = v64;
    v57[10] = uint64;
    v57[6] = a4;
    v57[7] = v61;
    goto LABEL_110;
  }
  char v41 = v48 ^ 1;
  if (v33 == 2) {
    char v42 = v48 ^ 1;
  }
  else {
    char v42 = 1;
  }
  if ((v42 & 1) == 0)
  {
    v40 = v56;
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke_5;
    v56[3] = &unk_1E51FE640;
    v56[4] = self;
    v56[5] = v13;
    v56[8] = v50;
    v56[9] = v64;
    v56[10] = uint64;
    v56[6] = a4;
    v56[7] = v61;
    goto LABEL_110;
  }
  if (v33 != 3) {
    char v41 = 1;
  }
  if (v41)
  {
    [v49 _cTypeString];
    id v63 = (id)__NSMakeSpecialForwardingCaptureBlock();
    id v46 = v63;
  }
  else
  {
    v40 = v55;
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke_7;
    v55[3] = &unk_1E51FE690;
    v55[4] = self;
    v55[5] = v13;
    v55[8] = v50;
    v55[9] = v64;
    v55[10] = uint64;
    v55[6] = a4;
    v55[7] = v61;
LABEL_110:
    id v63 = v40;
  }
  if (v60)
  {
    [v60 setArgument:&v63 atIndex:v25 + 2];
  }
  else if (v54)
  {

    v72[v25] = v63;
  }
LABEL_36:
  _CFGetTSD();
  _CFGetTSD();
  _CFGetTSD();
  _CFSetTSD();
  _CFSetTSD();
  if (a4)
  {
    xpc_retain(a4);
    _CFSetTSD();
  }
  if (v21) {
    char v28 = v51 ^ 1;
  }
  else {
    char v28 = 1;
  }
  if ((v28 & 1) == 0) {
    [(NSProgress *)v21 becomeCurrentWithPendingUnitCount:1];
  }
  *(void *)buf = 0;
  if (v60)
  {
    [v60 setTarget:v11];
    if (v53)
    {
      [v60 retainArguments];
      [v52 connection:self handleInvocation:v60 isReply:0];
    }
    else
    {
      __NSXPCCONNECTION_IS_CALLING_OUT_TO_REPLY_BLOCK__(v60);
    }
  }
  else
  {
    if (!v54)
    {
      v47 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Attempt to dispatch neither invocation nor simple message send.", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
      objc_exception_throw(v47);
    }
    switch([v59 numberOfArguments])
    {
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
        *(void *)buf = __NSXPCCONNECTION_IS_CALLING_OUT_TO_EXPORTED_OBJECT_S0__(v11, v64);
        break;
      default:
        break;
    }
  }
  if (v21) {
    char v35 = v51;
  }
  else {
    char v35 = 1;
  }
  if ((v35 & 1) == 0)
  {
    if (!v54) {
      [v60 getReturnValue:buf];
    }
    if (*(void *)buf && (objc_opt_isKindOfClass() & 1) != 0)
    {
      if (([*(id *)buf isCancellable] & 1) == 0) {
        [(_NSProgressWithRemoteParent *)v21 setCancellable:0];
      }
      if ([*(id *)buf isPausable]) {
        [(_NSProgressWithRemoteParent *)v21 setPausable:1];
      }
      [(NSProgress *)v21 addChild:*(void *)buf withPendingUnitCount:1];
    }
  }
  if ((v28 & 1) == 0) {
    [(NSProgress *)v21 resignCurrent];
  }

  _CFSetTSD();
  if (a4) {
    xpc_release(a4);
  }
  if (v54)
  {
    for (uint64_t i = 0; i != 4; ++i)
  }
  _CFSetTSD();
  _CFSetTSD();
LABEL_85:
  _Block_object_dispose(v61, 8);
}

- (void)_sendInvocation:(id)a3 orArguments:(id *)a4 count:(unint64_t)a5 methodSignature:(id)a6 selector:(SEL)a7 withProxy:(id)a8
{
  v110[256] = *(id *)MEMORY[0x1E4F143B8];
  v89 = (void *)[a8 _userInfo];
  if (a8)
  {
    double v15 = *((double *)a8 + 8);
    id Property = objc_getProperty(a8, v14, 32, 1);
    id newValue = objc_getProperty(a8, v16, 16, 1);
  }
  else
  {
    id Property = 0;
    id newValue = 0;
    double v15 = 0.0;
  }
  xpc_object_t v17 = xpc_dictionary_create(0, 0, 0);
  unint64_t v18 = [a6 numberOfArguments];
  if (!a3 && v18 - 2 != a5)
  {
    uint64_t v69 = +[NSString stringWithFormat:@"[NSXPCConnection sendInvocation]: Mismatch of count of expected arguments (%s) %lu vs %lu", sel_getName(a7), v18 - 2, a5];
LABEL_112:
    __int16 v70 = v69;
    uint64_t v71 = (void *)MEMORY[0x1E4F1CA00];
    v72 = (void *)MEMORY[0x1E4F1C3B8];
    goto LABEL_126;
  }
  if (a8) {
    uint64_t value = *((void *)a8 + 5);
  }
  else {
    uint64_t value = 0;
  }
  unint64_t v82 = a5;
  SEL v83 = a2;
  v90 = a8;
  if (v18 >= 3)
  {
    v19 = 0;
    char v20 = 0;
    dispatch_semaphore_t v84 = 0;
    xpc_object_t v85 = v17;
    v21 = 0;
    unint64_t v22 = v18 - 2;
    uint64_t v23 = 2;
    uint64_t v93 = 1;
    v87 = self;
    while (1)
    {
      uint64_t v24 = [a6 _argInfo:v19 + 2];
      if (!v24) {
        break;
      }
      __int16 v25 = *(_WORD *)(v24 + 34);
      if ((v25 & 0x80) != 0)
      {
        uint64_t v24 = *(void *)v24;
        if (!v24) {
          break;
        }
        __int16 v25 = *(_WORD *)(v24 + 34);
      }
      if ((v25 & 8) != 0)
      {
        Name = sel_getName(a7);
        v73 = @"[NSXPCConnection sendInvocation]: Arguments to messages sent to this proxy may not be 'byref'. (%s)";
        goto LABEL_124;
      }
      if ((v25 & 2) != 0)
      {
        Name = sel_getName(a7);
        v73 = @"[NSXPCConnection sendInvocation]: Arguments to messages sent to this proxy may not be 'out'. (%s)";
        goto LABEL_124;
      }
      if ((v25 & 0x1000) != 0)
      {
        uint64_t v26 = *(void *)(v24 + 8);
        if (v26)
        {
          if ((*(_WORD *)(v26 + 34) & 0x1000) != 0)
          {
            Name = sel_getName(a7);
            v73 = @"[NSXPCConnection sendInvocation]: Arguments to messages sent to this proxy may not be of type '**'. (%s)";
            goto LABEL_124;
          }
        }
      }
      if (v25 < 0)
      {
        if (v20)
        {
          Name = sel_getName(a7);
          v73 = @"[NSXPCConnection sendInvocation]: Only one reply block is allowed per message send. (%s)";
          goto LABEL_124;
        }
        if (v90 && (v90[56] & 2) != 0)
        {
          Name = sel_getName(a7);
          v73 = @"[NSXPCConnection sendInvocation]: A reply block was sent over a 'no importance' proxy. (%s)";
          goto LABEL_124;
        }
        v110[0] = 0;
        if (a3)
        {
          [a3 getArgument:v110 atIndex:v19 + 2];
          id v28 = v110[0];
          if (!v110[0]) {
            goto LABEL_117;
          }
        }
        else
        {
          id v28 = a4[(void)v19];
          v110[0] = v28;
          if (!v28)
          {
LABEL_117:
            Name = sel_getName(a7);
            v73 = @"[NSXPCConnection sendInvocation]: A NULL reply block was passed into a message meant to be sent over a connection. (%s)";
            goto LABEL_124;
          }
        }
        v29 = _Block_signature(v28);
        if (!v29)
        {
          Name = sel_getName(a7);
          v73 = @"[NSXPCConnection sendInvocation]: Block was not compiled using a compiler that inserts type information about arguments. (%s)";
          goto LABEL_124;
        }
        v30 = v29;
        uint64_t v31 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA38], "signatureWithObjCTypes:", v29), "_argInfo:", -1);
        if ((*(_WORD *)(v31 + 34) & 0x80) != 0) {
          uint64_t v31 = *(void *)v31;
        }
        if (*(unsigned char *)(v31 + 36) != 118)
        {
          Name = sel_getName(a7);
          v73 = @"[NSXPCConnection sendInvocation]: Return value of block argument must be 'void'. (%s)";
          goto LABEL_124;
        }
        uint64_t v32 = -[_NSXPCConnectionExpectedReplyInfo initWithSelector:]([_NSXPCConnectionExpectedReplyInfo alloc], (uint64_t)a7);
        v21 = v32;
        if (v32)
        {
          objc_setProperty_atomic(v32, v33, newValue, 40);
          v21[7] = value;
          if (v89) {
            objc_setProperty_atomic(v21, v34, v89, 48);
          }
          objc_setProperty_atomic_copy(v21, v34, v110[0], 8);
          objc_setProperty_atomic_copy(v21, v35, Property, 16);
          if (v15 != 0.0)
          {
            dispatch_semaphore_t v84 = dispatch_semaphore_create(0);
            objc_setProperty_atomic(v21, v36, v84, 24);
          }
        }
        else if (v15 != 0.0)
        {
          dispatch_semaphore_t v84 = dispatch_semaphore_create(0);
        }
        sel_getName(a7);
        v93 |= 0x20uLL;
        xpc_dictionary_set_string(v17, "replysig", v30);
        char v20 = 1;
      }
      else if ((v25 & 0x2000) != 0)
      {
        v110[0] = 0;
        if (a3)
        {
          [a3 getArgument:v110 atIndex:v19 + 2];
          __int16 v27 = (const char *)(v23 - 2);
        }
        else
        {
          v110[0] = a4[(void)v19];
          __int16 v27 = v19;
        }
        uint64_t v37 = [newValue _interfaceForArgument:v27 ofSelector:a7 reply:0];
        if (v110[0])
        {
          if (objc_opt_isKindOfClass())
          {
            if (!v37)
            {
              Name = v27;
              v80 = sel_getName(a7);
              v73 = @"[NSXPCConnection sendInvocation]: A proxy object was passed as an argument to a message (argument %ld) but the interface does not specify a proxy object there. (%s)";
              goto LABEL_124;
            }
          }
          else if (v110[0] && v37)
          {
            id v109 = 0;
            char v38 = [_NSXPCDistantObject alloc];
            id v39 = [(_NSXPCDistantObject *)v38 _initWithConnection:v87 exportedObject:v110[0] interface:v37];
            id v109 = v39;
            if (a3)
            {
              [a3 setArgument:&v109 atIndex:v19 + 2];
              [a3 _addAttachedObject:v109];
            }
            else
            {
              a4[(void)v27] = v39;
            }
          }
        }
        self = v87;
        xpc_object_t v17 = v85;
      }
      ++v23;
      if ((const char *)v22 == ++v19) {
        goto LABEL_56;
      }
    }
    uint64_t v69 = +[NSString stringWithFormat:@"[NSXPCConnection sendInvocation]: No argument type for invocation argument (%s)", sel_getName(a7), v80, v81];
    goto LABEL_112;
  }
  v21 = 0;
  dispatch_semaphore_t v84 = 0;
  uint64_t v93 = 1;
LABEL_56:
  uint64_t v40 = [a6 _argInfo:-1];
  uint64_t v42 = v40;
  if ((*(_WORD *)(v40 + 34) & 0x80) != 0) {
    uint64_t v42 = *(void *)v40;
  }
  int v43 = *(unsigned __int8 *)(v42 + 36);
  if (v43 != 118)
  {
    if (v21)
    {
      uint64_t v44 = (__objc2_class *)[newValue _returnClassForSelector:a7];
      if (v44 == NSProgress) {
        goto LABEL_61;
      }
      v75 = (objc_class *)v44;
      uint64_t v76 = *(unsigned __int8 *)(v42 + 36);
      v77 = sel_getName(a7);
      v74 = +[NSString stringWithFormat:@"[NSXPCConnection sendInvocation]: Return type (%c) of method %s is an object (%s) but not 'NSProgress'", v76, v77, class_getName(v75)];
    }
    else
    {
      Name = sel_getName(a7);
      v73 = @"[NSXPCConnection sendInvocation]: Return type of methods sent over this proxy must be 'void' or 'NSProgress *' (%s)";
LABEL_124:
      v74 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v73, Name, v80, v81);
    }
    __int16 v70 = v74;
    uint64_t v71 = (void *)MEMORY[0x1E4F1CA00];
    v72 = (void *)MEMORY[0x1E4F1C3C8];
LABEL_126:
    objc_exception_throw((id)[v71 exceptionWithName:*v72 reason:v70 userInfo:0]);
  }
LABEL_61:
  if (value != 1)
  {
    uint64_t v45 = v90;
    if (v90) {
      uint64_t v45 = (unsigned char *)*((void *)v90 + 6);
    }
    if (v45 != (unsigned char *)self->_importInfo->_generationCount)
    {
      v55 = v84;
      if (v21 && objc_getProperty(v21, v41, 16, 1))
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __88__NSXPCConnection__sendInvocation_orArguments_count_methodSignature_selector_withProxy___block_invoke;
        block[3] = &unk_1E51F6678;
        block[4] = self;
        block[5] = v21;
        if (v90 && (v90[56] & 4) != 0) {
          __88__NSXPCConnection__sendInvocation_orArguments_count_methodSignature_selector_withProxy___block_invoke((uint64_t)block);
        }
        else {
          dispatch_async((dispatch_queue_t)self->_userQueue, block);
        }
      }
      BOOL v67 = v21 != 0;
      goto LABEL_106;
    }
  }
  id v46 = objc_opt_new();
  v47 = [[NSXPCEncoder alloc] initWithStackSpace:v110 size:2048];
  [(NSXPCEncoder *)v47 _setConnection:self];
  [(NSXPCEncoder *)v47 setDelegate:self];
  if (self->_otherInfo) {
    -[NSXPCCoder setUserInfo:](v47, "setUserInfo:");
  }
  if (a3) {
    [(NSXPCEncoder *)v47 _encodeInvocation:a3 isReply:0 into:v17];
  }
  else {
    -[NSXPCEncoder _encodeInvocationObjectArgumentsOnly:count:typeString:selector:isReply:into:](v47, "_encodeInvocationObjectArgumentsOnly:count:typeString:selector:isReply:into:", a4, v82, [a6 _cTypeString], a7, 0, v17);
  }

  xpc_dictionary_set_uint64(v17, "proxynum", value);
  if (!v21)
  {
    xpc_dictionary_set_uint64(v17, "f", v93);
    if (v90)
    {
      uint64_t v53 = *((void *)v90 + 7);
      char v54 = atomic_load(&self->_state2);
      if ((v53 & 2) != 0)
      {
        if ((v54 & 0x40) != 0) {
          -[_NSXPCTransport sendNotification:](self->_transport, "sendNotification:", v17, v51, v52);
        }
        else {
          xpc_connection_send_notification();
        }
        goto LABEL_132;
      }
      if ((v54 & 0x40) == 0) {
        goto LABEL_77;
      }
    }
    else
    {
      char v78 = atomic_load(&self->_state2);
      if ((v78 & 0x40) == 0)
      {
LABEL_77:
        xpc_connection_send_message(self->_connection.xpc, v17);
LABEL_132:
        xpc_release(v17);
        goto LABEL_133;
      }
    }
    -[_NSXPCTransport sendMessage:](self->_transport, "sendMessage:", v17, v51, v52);
    goto LABEL_132;
  }
  v110[0] = 0;
  if (v43 != 118)
  {
    v110[0] = +[NSProgress discreteProgressWithTotalUnitCount:1];
    [a3 setReturnValue:v110];
    uint64_t v50 = v93 | 0xC0;
    v49 = (NSProgress *)v110[0];
    goto LABEL_84;
  }
  char v48 = +[NSProgress currentProgress];
  if (v48)
  {
    v49 = [[NSProgress alloc] initWithParent:v48 userInfo:0];
    v110[0] = v49;
    uint64_t v50 = v93 | 0x40;
LABEL_84:
    v56 = v90;
    goto LABEL_85;
  }
  v49 = 0;
  v56 = v90;
  uint64_t v50 = v93;
LABEL_85:
  v57 = -[_NSXPCConnectionExpectedReplies sequenceForProgress:]((uint64_t)self->_repliesExpected, v49);
  xpc_dictionary_set_uint64(v17, "sequence", (uint64_t)v57);
  xpc_dictionary_set_uint64(v17, "f", v50);
  if (v110[0])
  {
    [v110[0] setTotalUnitCount:1];
    v107[0] = MEMORY[0x1E4F143A8];
    v107[1] = 3221225472;
    v107[2] = __88__NSXPCConnection__sendInvocation_orArguments_count_methodSignature_selector_withProxy___block_invoke_2;
    v107[3] = &unk_1E51F8B80;
    v107[4] = self;
    v107[5] = v57;
    [v110[0] setCancellationHandler:v107];
    v106[0] = MEMORY[0x1E4F143A8];
    v106[1] = 3221225472;
    v106[2] = __88__NSXPCConnection__sendInvocation_orArguments_count_methodSignature_selector_withProxy___block_invoke_3;
    v106[3] = &unk_1E51F8B80;
    v106[4] = self;
    v106[5] = v57;
    [v110[0] setPausingHandler:v106];
    v105[0] = MEMORY[0x1E4F143A8];
    v105[1] = 3221225472;
    v105[2] = __88__NSXPCConnection__sendInvocation_orArguments_count_methodSignature_selector_withProxy___block_invoke_4;
    v105[3] = &unk_1E51F8B80;
    v105[4] = self;
    v105[5] = v57;
    [v110[0] setResumingHandler:v105];
  }
  int v60 = objc_msgSend(newValue, "_hasProxiesInReplyBlockArgumentsOfSelector:", a7, v58, v59);
  char v61 = v60;
  if (v60)
  {
    exportInfo = self->_exportInfo;
    if (exportInfo) {
      dispatch_group_enter((dispatch_group_t)exportInfo->_replyGroup);
    }
  }
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  v96 = __88__NSXPCConnection__sendInvocation_orArguments_count_methodSignature_selector_withProxy___block_invoke_5;
  v97 = &unk_1E51FE708;
  v98 = self;
  v99 = v21;
  id v100 = v110[0];
  v101 = v57;
  uint64_t v102 = value;
  SEL v103 = v83;
  char v104 = v61;
  if (v56)
  {
    uint64_t v63 = *((void *)v56 + 7);
    char v64 = atomic_load(&self->_state2);
    if ((v63 & 4) != 0)
    {
      if ((v64 & 0x40) != 0) {
        xpc_object_t v65 = (id)[(_NSXPCTransport *)self->_transport sendMessageWithReplySync:v17];
      }
      else {
        xpc_object_t v65 = __NSXPCCONNECTION_IS_WAITING_FOR_A_SYNCHRONOUS_REPLY__(self->_connection.xpc, v17);
      }
      __int16 v66 = v65;
      v96((uint64_t)handler, v65);
      xpc_release(v66);
      goto LABEL_101;
    }
  }
  else
  {
    char v64 = atomic_load(&self->_state2);
  }
  if ((v64 & 0x40) != 0) {
    [(_NSXPCTransport *)self->_transport sendMessageWithReply:v17 onQueue:self->_userQueue replyHandler:handler];
  }
  else {
    xpc_connection_send_message_with_reply(self->_connection.xpc, v17, (dispatch_queue_t)self->_userQueue, handler);
  }
LABEL_101:
  v55 = v84;
  BOOL v67 = 1;
LABEL_106:
  xpc_release(v17);
  if (v67 && v55)
  {
    dispatch_time_t v68 = dispatch_time(0, (uint64_t)(v15 * 1000000000.0));
    if (dispatch_semaphore_wait(v55, v68))
    {
      [(NSXPCConnection *)self invalidate];
      dispatch_semaphore_wait(v55, 0xFFFFFFFFFFFFFFFFLL);
    }
    dispatch_release(v55);
  }
LABEL_133:
}

void __88__NSXPCConnection__sendInvocation_orArguments_count_methodSignature_selector_withProxy___block_invoke_5(uint64_t a1, void *a2)
{
  v48[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    uint64_t v6 = *(void *)(v5 + 56);
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(void *)(a1 + 56);
  if (*(void *)(a1 + 48))
  {
    -[_NSXPCConnectionExpectedReplies removeProgressSequence:](*(void *)(*(void *)(a1 + 32) + 16), *(const void **)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 48), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 48), "totalUnitCount"));
  }
  objc_super v8 = (void *)MEMORY[0x185308110](v4, v6, v7);
  Class Class = object_getClass(a2);
  if (Class == (Class)MEMORY[0x1E4F145A8])
  {
    if (a2 == (void *)MEMORY[0x1E4F14520])
    {
      uint64_t v12 = *(void *)(a1 + 40);
      if (v12) {
        v13 = *(const char **)(v12 + 56);
      }
      else {
        v13 = 0;
      }
      unint64_t v14 = *(void **)(a1 + 40);
      if (v14 && objc_getProperty(v14, v13, 16, 1))
      {
        if (*(void *)(a1 + 64) == 1)
        {
          uint64_t v45 = @"NSDebugDescription";
          uint64_t v46 = [*(id *)(a1 + 32) _errorDescription];
          uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
          uint64_t v16 = 4097;
        }
        else
        {
          v47 = @"NSDebugDescription";
          v48[0] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"The %@ was interrupted, but the message was sent over an additional proxy and therefore this proxy has become invalid.", [*(id *)(a1 + 32) _errorDescription]);
          uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:&v47 count:1];
          uint64_t v16 = 4099;
        }
        goto LABEL_39;
      }
      goto LABEL_42;
    }
    if (a2 != (void *)MEMORY[0x1E4F14528])
    {
      if (a2 != (void *)MEMORY[0x1E4F14548])
      {
        if (a2 != (void *)MEMORY[0x1E4F14550])
        {
          uint64_t v10 = (void *)MEMORY[0x18530A880](a2);
          v11 = _NSXPCLog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            SEL v36 = v10;
            _os_log_error_impl(&dword_181795000, v11, OS_LOG_TYPE_ERROR, "Unexpected XPC error type on reply: %s", buf, 0xCu);
          }
          free(v10);
        }
        goto LABEL_42;
      }
      uint64_t v25 = *(void *)(a1 + 40);
      if (v25) {
        uint64_t v26 = *(const char **)(v25 + 56);
      }
      else {
        uint64_t v26 = 0;
      }
      __int16 v27 = *(void **)(a1 + 40);
      if (v27 && objc_getProperty(v27, v26, 16, 1))
      {
        uint64_t v37 = @"NSDebugDescription";
        char v38 = @"The code signature requirement failed.";
        uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
        uint64_t v16 = 4102;
LABEL_39:
        +[NSError errorWithDomain:@"NSCocoaErrorDomain" code:v16 userInfo:v15];
        id Property = *(id *)(a1 + 40);
        if (Property) {
          id Property = objc_getProperty(Property, v31, 16, 1);
        }
        __NSINDEXSET_IS_CALLING_OUT_TO_A_RANGE_BLOCK__((uint64_t)Property);
      }
LABEL_42:
      -[_NSXPCConnectionExpectedReplyInfo cleanup](*(void *)(a1 + 40));
      goto LABEL_43;
    }
    uint64_t v17 = *(void *)(a1 + 40);
    if (v17) {
      unint64_t v18 = *(const char **)(v17 + 56);
    }
    else {
      unint64_t v18 = 0;
    }
    v19 = *(void **)(a1 + 40);
    if (!v19 || !objc_getProperty(v19, v18, 16, 1)) {
      goto LABEL_42;
    }
    char v20 = atomic_load((unsigned int *)(*(void *)(a1 + 32) + 36));
    if ((v20 & 8) != 0)
    {
      int v43 = @"NSDebugDescription";
      uint64_t v44 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"The %@ was invalidated from this process.", [*(id *)(a1 + 32) _errorDescription]);
      id v28 = (void *)MEMORY[0x1E4F1C9E8];
      v29 = &v44;
      v30 = &v43;
    }
    else
    {
      char v21 = atomic_load((unsigned int *)(*(void *)(a1 + 32) + 36));
      if ((v21 & 0x40) == 0)
      {
        [*(id *)(a1 + 32) _xpcConnection];
        uint64_t v22 = xpc_connection_copy_invalidation_reason();
        if (v22)
        {
          uint64_t v23 = (void *)v22;
          char v41 = @"NSDebugDescription";
          uint64_t v42 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"The %@ was invalidated: %s.", [*(id *)(a1 + 32) _errorDescription], v22);
          uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
          free(v23);
LABEL_38:
          uint64_t v16 = 4099;
          uint64_t v15 = v24;
          goto LABEL_39;
        }
      }
      id v39 = @"NSDebugDescription";
      uint64_t v40 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"The %@ was invalidated.", [*(id *)(a1 + 32) _errorDescription]);
      id v28 = (void *)MEMORY[0x1E4F1C9E8];
      v29 = &v40;
      v30 = &v39;
    }
    uint64_t v24 = [v28 dictionaryWithObjects:v29 forKeys:v30 count:1];
    goto LABEL_38;
  }
  if (Class != (Class)MEMORY[0x1E4F14590])
  {
    v34 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: encoded data has been corrupted, root object is not an XPC dictionary", _NSMethodExceptionProem(*(objc_class **)(a1 + 32), *(const char **)(a1 + 72))), 0 reason userInfo];
    objc_exception_throw(v34);
  }
  [*(id *)(a1 + 32) _decodeAndInvokeReplyBlockWithEvent:a2 sequence:*(void *)(a1 + 56) replyInfo:*(void *)(a1 + 40)];
LABEL_43:
  if (*(unsigned char *)(a1 + 80))
  {
    uint64_t v33 = *(void *)(*(void *)(a1 + 32) + 56);
    if (v33) {
      dispatch_group_leave(*(dispatch_group_t *)(v33 + 48));
    }
  }
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)NSXPCConnection;
  return +[NSString stringWithFormat:@"%@ %@", [(NSXPCConnection *)&v3 description], [(NSXPCConnection *)self _errorDescription]];
}

- (id)_errorDescription
{
  char v3 = atomic_load(&self->_state2);
  if ((v3 & 0x40) != 0) {
    uint64_t pid = [(_NSXPCTransport *)self->_transport processIdentifier];
  }
  else {
    uint64_t pid = xpc_connection_get_pid(self->_connection.xpc);
  }
  char v5 = atomic_load(&self->_state2);
  if ((v5 & 0x10) != 0)
  {
    if (pid) {
      uint64_t v7 = +[NSString stringWithFormat:@" from pid %d", pid];
    }
    else {
      uint64_t v7 = (NSString *)&stru_1ECA5C228;
    }
    serviceName = self->_serviceName;
    if (serviceName && [(NSString *)serviceName length])
    {
      v11 = @"custom";
      if ((v3 & 0x40) == 0) {
        v11 = @"mach";
      }
      return +[NSString stringWithFormat:@"connection%@ on %@ service named %@", v7, v11, self->_serviceName];
    }
    else
    {
      return +[NSString stringWithFormat:@"connection%@ on anonymousListener or serviceListener", v7, v12, v13];
    }
  }
  else
  {
    if (pid) {
      uint64_t v6 = +[NSString stringWithFormat:@" with pid %d", pid];
    }
    else {
      uint64_t v6 = (NSString *)&stru_1ECA5C228;
    }
    char v8 = atomic_load(&self->_state2);
    if ((v8 & 0x20) != 0) {
      return +[NSString stringWithFormat:@"connection to service%@ created from an endpoint", v6, v12, v13];
    }
    else {
      return +[NSString stringWithFormat:@"connection to service%@ named %@", v6, self->_serviceName, v13];
    }
  }
}

void __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke(void *a1)
{
  v3[8] = *MEMORY[0x1E4F143B8];
  if (!atomic_exchange((atomic_uint *volatile)(*(void *)(a1[6] + 8) + 24), 1u))
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke_2;
    v3[3] = &unk_1E51F8BA8;
    v1 = (const void *)a1[7];
    uint64_t v2 = a1[9];
    v3[6] = a1[8];
    v3[7] = v2;
    -[_NSXPCConnectionRequestedReplies endTransactionForSequence:completionHandler:](*(void *)(a1[4] + 64), v1, (uint64_t)v3);
  }
}

- (id)_unboostingRemoteObjectProxy
{
  uint64_t v2 = objc_msgSend(objc_alloc(-[NSXPCConnection _remoteObjectInterfaceClass](self, "_remoteObjectInterfaceClass")), "_initWithConnection:proxyNumber:generationCount:interface:options:error:", self, 1, 0, self->_remoteObjectInterface, 2, 0);

  return v2;
}

- (id)remoteObjectProxy
{
  uint64_t v2 = objc_msgSend(objc_alloc(-[NSXPCConnection _remoteObjectInterfaceClass](self, "_remoteObjectInterfaceClass")), "_initWithConnection:proxyNumber:generationCount:interface:options:error:", self, 1, 0, self->_remoteObjectInterface, 0, 0);

  return v2;
}

- (id)remoteObjectProxyWithErrorHandler:(void *)handler
{
  char v3 = objc_msgSend(objc_alloc(-[NSXPCConnection _remoteObjectInterfaceClass](self, "_remoteObjectInterfaceClass")), "_initWithConnection:proxyNumber:generationCount:interface:options:error:", self, 1, 0, self->_remoteObjectInterface, 0, handler);

  return v3;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(void *)handler
{
  char v3 = objc_msgSend(objc_alloc(-[NSXPCConnection _remoteObjectInterfaceClass](self, "_remoteObjectInterfaceClass")), "_initWithConnection:proxyNumber:generationCount:interface:options:error:", self, 1, 0, self->_remoteObjectInterface, 4, handler);

  return v3;
}

- (Class)_remoteObjectInterfaceClass
{
  remoteObjectInterface = self->_remoteObjectInterface;
  if (remoteObjectInterface) {
    return [(NSXPCInterface *)remoteObjectInterface _customSubclass];
  }
  else {
    return (Class)objc_opt_class();
  }
}

- (id)_queue
{
  return self->_userQueue;
}

- (NSString)serviceName
{
  uint64_t v2 = self->_serviceName;

  return v2;
}

void __44__NSXPCConnection_initWithListenerEndpoint___block_invoke(uint64_t a1, void *a2)
{
}

- (NSXPCInterface)exportedInterface
{
  return (NSXPCInterface *)-[_NSXPCConnectionExportedObjectTable interfaceForProxyNumber:]((os_unfair_lock_s *)self->_exportInfo, (const void *)1);
}

- (id)exportedObject
{
  return -[_NSXPCConnectionExportedObjectTable exportedObjectForProxyNumber:]((os_unfair_lock_s *)self->_exportInfo, (const void *)1);
}

void __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke_7(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v9[12] = *MEMORY[0x1E4F143B8];
  if (!atomic_exchange((atomic_uint *volatile)(*(void *)(a1[7] + 8) + 24), 1u))
  {
    uint64_t v4 = a1[4];
    uint64_t v5 = *(void *)(v4 + 64);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke_8;
    v9[3] = &unk_1E51FE668;
    v9[4] = v4;
    v9[5] = a2;
    uint64_t v6 = a1[6];
    v9[6] = a1[5];
    v9[7] = a3;
    uint64_t v7 = (const void *)a1[8];
    uint64_t v8 = a1[10];
    v9[10] = a1[9];
    v9[11] = v8;
    v9[8] = a4;
    v9[9] = v6;
    -[_NSXPCConnectionRequestedReplies endTransactionForSequence:completionHandler:](v5, v7, (uint64_t)v9);
  }
}

void __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke_8(uint64_t a1)
{
  v2[3] = *MEMORY[0x1E4F143B8];
  v2[0] = _replacedWithDistantObject(*(void *)(a1 + 32), *(void *)(a1 + 40), *(void **)(a1 + 48), *(void *)(a1 + 80), 0);
  v2[1] = _replacedWithDistantObject(*(void *)(a1 + 32), *(void *)(a1 + 56), *(void **)(a1 + 48), *(void *)(a1 + 80), 1);
  v2[2] = _replacedWithDistantObject(*(void *)(a1 + 32), *(void *)(a1 + 64), *(void **)(a1 + 48), *(void *)(a1 + 80), 2);
  _sendReplyArgumentsOnly(*(void *)(a1 + 32), (uint64_t)"v@?@@@", (uint64_t)v2, 3, *(void *)(a1 + 80), *(void *)(a1 + 88), *(void **)(a1 + 72));
}

void __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!atomic_exchange((atomic_uint *volatile)(*(void *)(*(void *)(a1 + 56) + 8) + 24), 1u))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(v2 + 64);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke_4;
    v6[3] = &unk_1E51FDA68;
    v6[4] = v2;
    v6[5] = a2;
    uint64_t v4 = *(const void **)(a1 + 64);
    uint64_t v5 = *(void *)(a1 + 80);
    uint64_t v8 = *(void *)(a1 + 72);
    uint64_t v9 = v5;
    long long v7 = *(_OWORD *)(a1 + 40);
    -[_NSXPCConnectionRequestedReplies endTransactionForSequence:completionHandler:](v3, v4, (uint64_t)v6);
  }
}

void __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke_4(uint64_t a1)
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = _replacedWithDistantObject(*(void *)(a1 + 32), *(void *)(a1 + 40), *(void **)(a1 + 48), *(void *)(a1 + 64), 0);
  _sendReplyArgumentsOnly(*(void *)(a1 + 32), (uint64_t)"v@?@", (uint64_t)v2, 1, *(void *)(a1 + 64), *(void *)(a1 + 72), *(void **)(a1 + 56));
}

void __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke_9(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!atomic_exchange((atomic_uint *volatile)(*(void *)(*(void *)(a1 + 64) + 8) + 24), 1u))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(v2 + 64);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke_10;
    v6[3] = &unk_1E51FE618;
    v6[4] = *(void *)(a1 + 40);
    v6[5] = a2;
    void v6[6] = v2;
    long long v7 = *(_OWORD *)(a1 + 48);
    uint64_t v4 = *(const void **)(a1 + 72);
    uint64_t v5 = *(void *)(a1 + 88);
    uint64_t v8 = *(void *)(a1 + 80);
    uint64_t v9 = v5;
    -[_NSXPCConnectionRequestedReplies endTransactionForSequence:completionHandler:](v3, v4, (uint64_t)v6);
  }
}

void __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke_10(uint64_t a1)
{
  v11[256] = *MEMORY[0x1E4F143B8];
  if ((unint64_t)[*(id *)(a1 + 32) numberOfArguments] >= 2)
  {
    unint64_t v2 = 1;
    do
    {
      if ((*(_WORD *)([*(id *)(a1 + 32) _argInfo:v2] + 34) & 0x2000) != 0)
      {
        v11[0] = 0;
        [*(id *)(a1 + 40) getArgument:v11 atIndex:v2];
        id v10 = 0;
        id v3 = _replacedWithDistantObject(*(void *)(a1 + 48), v11[0], *(void **)(a1 + 56), *(void *)(a1 + 72), v2 - 1);
        id v10 = v3;
        if (v3)
        {
          objc_msgSend(*(id *)(a1 + 40), "_addAttachedObject:", v3, v10);
          [*(id *)(a1 + 40) setArgument:&v10 atIndex:v2];
        }
      }
      ++v2;
    }
    while (v2 < objc_msgSend(*(id *)(a1 + 32), "numberOfArguments", v10));
  }
  uint64_t v4 = [[NSXPCEncoder alloc] initWithStackSpace:v11 size:2048];
  [(NSXPCEncoder *)v4 _setConnection:*(void *)(a1 + 48)];
  [(NSXPCEncoder *)v4 setDelegate:*(void *)(a1 + 48)];
  if (*(void *)(*(void *)(a1 + 48) + 80)) {
    -[NSXPCCoder setUserInfo:](v4, "setUserInfo:");
  }
  [(NSXPCEncoder *)v4 _encodeInvocation:*(void *)(a1 + 40) isReply:1 into:*(void *)(a1 + 64)];

  char v7 = atomic_load((unsigned int *)(*(void *)(a1 + 48) + 36));
  uint64_t v8 = *(void *)(a1 + 48);
  if ((v7 & 0x40) != 0)
  {
    objc_msgSend(*(id *)(v8 + 152), "sendMessage:", *(void *)(a1 + 64), v5, v6);
  }
  else
  {
    uint64_t v9 = *(_xpc_connection_s **)(v8 + 8);
    if (v9) {
      xpc_connection_send_message(v9, *(xpc_object_t *)(a1 + 64));
    }
  }
}

void __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke_5(void *a1, uint64_t a2, uint64_t a3)
{
  v8[11] = *MEMORY[0x1E4F143B8];
  if (!atomic_exchange((atomic_uint *volatile)(*(void *)(a1[7] + 8) + 24), 1u))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = *(void *)(v3 + 64);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke_6;
    v8[3] = &unk_1E51FE618;
    v8[4] = v3;
    v8[5] = a2;
    uint64_t v5 = a1[6];
    v8[6] = a1[5];
    v8[7] = a3;
    uint64_t v6 = (const void *)a1[8];
    uint64_t v7 = a1[10];
    v8[9] = a1[9];
    v8[10] = v7;
    v8[8] = v5;
    -[_NSXPCConnectionRequestedReplies endTransactionForSequence:completionHandler:](v4, v6, (uint64_t)v8);
  }
}

void __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke_6(uint64_t a1)
{
  void v2[2] = *MEMORY[0x1E4F143B8];
  v2[0] = _replacedWithDistantObject(*(void *)(a1 + 32), *(void *)(a1 + 40), *(void **)(a1 + 48), *(void *)(a1 + 72), 0);
  v2[1] = _replacedWithDistantObject(*(void *)(a1 + 32), *(void *)(a1 + 56), *(void **)(a1 + 48), *(void *)(a1 + 72), 1);
  _sendReplyArgumentsOnly(*(void *)(a1 + 32), (uint64_t)"v@?@@", (uint64_t)v2, 2, *(void *)(a1 + 72), *(void *)(a1 + 80), *(void **)(a1 + 64));
}

void __64__NSXPCConnection__decodeAndInvokeMessageWithEvent_reply_flags___block_invoke_2(uint64_t a1)
{
}

+ (void)_currentBoost
{
  self;
  result = (void *)_CFGetTSD();
  if (result)
  {
    v1 = -[_NSXPCBoost _initWithEvent:]([_NSXPCBoost alloc], result);
    return v1;
  }
  return result;
}

- (id)valueForEntitlement:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  if (self) {
    [(NSXPCConnection *)self auditToken];
  }
  importInfo = (os_unfair_lock_s *)self->_importInfo;
  v7[0] = v8;
  v7[1] = v9;
  return -[_NSXPCConnectionImportInfo _valueForEntitlement:auditToken:](importInfo, (uint64_t)a3, v7);
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  char v3 = atomic_load(&self->_state2);
  if ((v3 & 0x40) != 0)
  {
    result = ($115C4C562B26FF47E01F9F4EA65B5887 *)self->_transport;
    if (result)
    {
      return ($115C4C562B26FF47E01F9F4EA65B5887 *)[($115C4C562B26FF47E01F9F4EA65B5887 *)result auditToken];
    }
    else
    {
      *(_OWORD *)retstr->var0 = 0u;
      *(_OWORD *)&retstr->var0[4] = 0u;
    }
  }
  else
  {
    *(_OWORD *)retstr->var0 = 0u;
    *(_OWORD *)&retstr->var0[4] = 0u;
    return ($115C4C562B26FF47E01F9F4EA65B5887 *)xpc_connection_get_audit_token();
  }
  return result;
}

void __44__NSXPCConnection__initWithCustomTransport___block_invoke(uint64_t a1, uint64_t a2)
{
}

- (uint64_t)_sendProgressMessage:(uint64_t)a3 forSequence:
{
  if (result)
  {
    uint64_t v5 = result;
    xpc_dictionary_set_uint64(xdict, "f", 0x15uLL);
    xpc_dictionary_set_uint64(xdict, "sequence", a3);
    char v6 = atomic_load((unsigned int *)(v5 + 36));
    if ((v6 & 0x40) != 0)
    {
      uint64_t v7 = *(void **)(v5 + 152);
      return [v7 sendNotification:xdict];
    }
    else
    {
      return xpc_connection_send_notification();
    }
  }
  return result;
}

- (NSXPCConnection)initWithListenerEndpoint:(NSXPCListenerEndpoint *)endpoint
{
  handler[5] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(NSXPCConnection *)self init];
  if (v5)
  {
    char v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    global_queue = dispatch_get_global_queue(21, 0);
    v5->_userQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.NSXPCConnection.user.endpoint", v6, global_queue);
    atomic_fetch_or((atomic_uint *volatile)&v5->_state2, 0x20u);
    if ([(NSXPCListenerEndpoint *)endpoint _endpoint])
    {
      long long v8 = xpc_connection_create_from_endpoint((xpc_endpoint_t)[(NSXPCListenerEndpoint *)endpoint _endpoint]);
      v5->_connection.xpc = v8;
      if (v8)
      {
        xpc_connection_set_target_queue(v8, (dispatch_queue_t)v5->_userQueue);
        xpc = v5->_connection.xpc;
        handler[0] = MEMORY[0x1E4F143A8];
        handler[1] = 3221225472;
        void handler[2] = __44__NSXPCConnection_initWithListenerEndpoint___block_invoke;
        handler[3] = &unk_1E51F99C0;
        handler[4] = v5;
        xpc_connection_set_event_handler(xpc, handler);
        v5->_endpoint = endpoint;
        return v5;
      }
      v11 = +[NSString stringWithFormat:@"%@: Unable to connect to the specified endpoint. No connection was created.", _NSMethodExceptionProem((objc_class *)v5, a2)];
    }
    else
    {
      v11 = +[NSString stringWithFormat:@"%@: Endpoint argument is NULL.", _NSMethodExceptionProem((objc_class *)v5, a2)];
    }
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v11 userInfo:0]);
  }
  return v5;
}

- (NSXPCConnection)initWithServiceName:(NSString *)serviceName
{
  return [(NSXPCConnection *)self initWithServiceName:serviceName options:0];
}

void __47__NSXPCConnection_initWithServiceName_options___block_invoke(uint64_t a1, void *a2)
{
}

- (void)setUserInfo:(id)a3
{
  otherInfo = self->_otherInfo;
  if (otherInfo != a3)
  {

    self->_otherInfo = a3;
  }
}

- (void)scheduleSendBarrierBlock:(void *)block
{
  char v3 = atomic_load(&self->_state2);
  if ((v3 & 0x40) != 0)
  {
    [(_NSXPCTransport *)self->_transport sendBarrierBlock:block];
  }
  else
  {
    xpc = self->_connection.xpc;
    if (xpc) {
      xpc_connection_send_barrier(xpc, block);
    }
  }
}

- (gid_t)effectiveGroupIdentifier
{
  char v2 = atomic_load(&self->_state2);
  if ((v2 & 0x40) != 0) {
    return [(_NSXPCTransport *)self->_transport effectiveGroupIdentifier];
  }
  else {
    return xpc_connection_get_egid(self->_connection.xpc);
  }
}

- (au_asid_t)auditSessionIdentifier
{
  char v2 = atomic_load(&self->_state2);
  if ((v2 & 0x40) != 0) {
    return [(_NSXPCTransport *)self->_transport auditSessionIdentifier];
  }
  else {
    return xpc_connection_get_asid(self->_connection.xpc);
  }
}

- (uid_t)effectiveUserIdentifier
{
  char v2 = atomic_load(&self->_state2);
  if ((v2 & 0x40) != 0) {
    return [(_NSXPCTransport *)self->_transport effectiveUserIdentifier];
  }
  else {
    return xpc_connection_get_euid(self->_connection.xpc);
  }
}

- (void)suspend
{
  char v2 = atomic_load(&self->_state2);
  if ((v2 & 0x40) != 0)
  {
    transport = self->_transport;
    [(_NSXPCTransport *)transport suspend];
  }
  else
  {
    xpc = self->_connection.xpc;
    xpc_connection_suspend(xpc);
  }
}

- (void)_setUUID:(id)a3
{
  v5[2] = *MEMORY[0x1E4F143B8];
  char v3 = atomic_load(&self->_state2);
  if ((v3 & 0x40) != 0)
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Custom transports do not support this method.", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v4);
  }
  v5[0] = 0;
  v5[1] = 0;
  [a3 getUUIDBytes:v5];
  xpc_connection_set_instance();
}

- (NSString)_serviceInfoForDecoder
{
  if (result) {
    return +[NSString stringWithFormat:@"NSXPCInterface: %@\n%@", [(objc_class *)result[12].super.isa debugDescription], [(NSString *)result debugDescription]];
  }
  return result;
}

+ (void)_handoffCurrentReplyToQueue:(id)a3 block:(id)a4
{
  if (!_CFGetTSD())
  {
    char v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: called when there is no reply context", _NSMethodExceptionProem((objc_class *)a1, a2)), 0 reason userInfo];
    objc_exception_throw(v6);
  }

  MEMORY[0x1F40CEF18]();
}

- (uint64_t)_initWithRemotePeerConnection:(void *)a1 name:(uint64_t)a2 options:(__CFString *)a3
{
  v17[5] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v5 = [a1 init];
  uint64_t v6 = v5;
  if (v5)
  {
    atomic_fetch_or((atomic_uint *volatile)(v5 + 36), 0x40u);
    *(void *)(v5 + 104) = [(__CFString *)a3 copy];
    uint64_t v7 = @"anonymous";
    if (a3) {
      uint64_t v7 = a3;
    }
    long long v8 = +[NSString stringWithFormat:@"com.apple.NSXPCConnection.user.%@.remote", v7];
    atomic_fetch_or((atomic_uint *volatile)(v6 + 36), 0x10u);
    long long v9 = [(NSString *)v8 UTF8String];
    uint64_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    global_queue = dispatch_get_global_queue(21, 0);
    *(void *)(v6 + 24) = dispatch_queue_create_with_target_V2(v9, v10, global_queue);
    uint64_t v12 = [[_NSXPCRemoteTransport alloc] initWithConnection:a2];
    *(void *)(v6 + 152) = v12;
    [(_NSXPCRemoteTransport *)v12 setTargetQueue:*(void *)(v6 + 24)];
    uint64_t v13 = *(void **)(v6 + 152);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __62__NSXPCConnection__initWithRemotePeerConnection_name_options___block_invoke;
    v17[3] = &unk_1E51F99C0;
    v17[4] = v6;
    [v13 setErrorHandler:v17];
    unint64_t v14 = *(void **)(v6 + 152);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __62__NSXPCConnection__initWithRemotePeerConnection_name_options___block_invoke_2;
    v16[3] = &unk_1E51FE6E0;
    v16[4] = v6;
    [v14 setMessageHandler:v16];
  }
  return v6;
}

void __62__NSXPCConnection__initWithRemotePeerConnection_name_options___block_invoke(uint64_t a1, uint64_t a2)
{
}

void __62__NSXPCConnection__initWithRemotePeerConnection_name_options___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
}

- (id)_initWithRemoteService:(id)a3 name:(id)a4 options:(unint64_t)a5 mode:(unint64_t)a6
{
  v19[5] = *MEMORY[0x1E4F143B8];
  long long v9 = [(NSXPCConnection *)self init];
  uint64_t v10 = v9;
  if (v9)
  {
    atomic_fetch_or((atomic_uint *volatile)&v9->_state2, 0x40u);
    v11 = [+[NSString stringWithFormat:@"com.apple.NSXPCConnection.r-user.%@", v9->_serviceName] UTF8String];
    uint64_t v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    global_queue = dispatch_get_global_queue(21, 0);
    v10->_userQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2(v11, v12, global_queue);
    unint64_t v14 = [[_NSXPCRemoteTransport alloc] initWithRemoteService:a3 name:a4 queue:v10->_userQueue mode:a6];
    v10->_transport = (_NSXPCTransport *)v14;
    [(_NSXPCRemoteTransport *)v14 setTargetQueue:v10->_userQueue];
    transport = v10->_transport;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __60__NSXPCConnection__initWithRemoteService_name_options_mode___block_invoke;
    v19[3] = &unk_1E51F99C0;
    v19[4] = v10;
    [(_NSXPCTransport *)transport setErrorHandler:v19];
    uint64_t v16 = v10->_transport;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __60__NSXPCConnection__initWithRemoteService_name_options_mode___block_invoke_2;
    v18[3] = &unk_1E51FE6E0;
    v18[4] = v10;
    [(_NSXPCTransport *)v16 setMessageHandler:v18];
    [(NSString *)v10->_serviceName UTF8String];
  }
  return v10;
}

void __60__NSXPCConnection__initWithRemoteService_name_options_mode___block_invoke(uint64_t a1, uint64_t a2)
{
}

void __60__NSXPCConnection__initWithRemoteService_name_options_mode___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
}

- (id)_initWithRemoteService:(id)a3 name:(id)a4 options:(unint64_t)a5
{
  return [(NSXPCConnection *)self _initWithRemoteService:a3 name:a4 options:a5 mode:0];
}

- (id)_initWithRemoteConnection:(id)a3 name:(id)a4
{
  v15[5] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(NSXPCConnection *)self init];
  uint64_t v6 = v5;
  if (v5)
  {
    atomic_fetch_or((atomic_uint *volatile)&v5->_state2, 0x40u);
    uint64_t v7 = [+[NSString stringWithFormat:@"com.apple.NSXPCConnection.r-user.%@", v5->_serviceName] UTF8String];
    long long v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    global_queue = dispatch_get_global_queue(21, 0);
    v6->_userQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2(v7, v8, global_queue);
    uint64_t v10 = [[_NSXPCRemoteTransport alloc] initWithConnection:a3];
    v6->_transport = (_NSXPCTransport *)v10;
    [(_NSXPCRemoteTransport *)v10 setTargetQueue:v6->_userQueue];
    transport = v6->_transport;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __50__NSXPCConnection__initWithRemoteConnection_name___block_invoke;
    v15[3] = &unk_1E51F99C0;
    v15[4] = v6;
    [(_NSXPCTransport *)transport setErrorHandler:v15];
    uint64_t v12 = v6->_transport;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __50__NSXPCConnection__initWithRemoteConnection_name___block_invoke_2;
    v14[3] = &unk_1E51FE6E0;
    void v14[4] = v6;
    [(_NSXPCTransport *)v12 setMessageHandler:v14];
    [(NSString *)v6->_serviceName UTF8String];
  }
  return v6;
}

void __50__NSXPCConnection__initWithRemoteConnection_name___block_invoke(uint64_t a1, uint64_t a2)
{
}

void __50__NSXPCConnection__initWithRemoteConnection_name___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
}

- (NSXPCConnection)initWithMachServiceName:(id)a3
{
  return [(NSXPCConnection *)self initWithMachServiceName:a3 options:0];
}

void __88__NSXPCConnection__sendInvocation_orArguments_count_methodSignature_selector_withProxy___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = @"NSDebugDescription";
  v5[0] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"The %@ was interrupted, but the message was sent over an additional proxy and therefore this proxy has become invalid.", [*(id *)(a1 + 32) _errorDescription]);
  +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 4099, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1]);
  id Property = *(id *)(a1 + 40);
  if (Property) {
    id Property = objc_getProperty(Property, v2, 16, 1);
  }
  __NSINDEXSET_IS_CALLING_OUT_TO_A_RANGE_BLOCK__((uint64_t)Property);
  -[_NSXPCConnectionExpectedReplyInfo cleanup](*(void *)(a1 + 40));
}

uint64_t __88__NSXPCConnection__sendInvocation_orArguments_count_methodSignature_selector_withProxy___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelProgress:*(void *)(a1 + 40)];
}

uint64_t __88__NSXPCConnection__sendInvocation_orArguments_count_methodSignature_selector_withProxy___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pauseProgress:*(void *)(a1 + 40)];
}

uint64_t __88__NSXPCConnection__sendInvocation_orArguments_count_methodSignature_selector_withProxy___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resumeProgress:*(void *)(a1 + 40)];
}

- (void)set_additionalInvalidationHandler:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_setAssociatedObject(self, "additionalInvalidationHandler", a3, (void *)0x303);

  os_unfair_lock_unlock(p_lock);
}

- (NSXPCListenerEndpoint)endpoint
{
  char v2 = self->_endpoint;

  return v2;
}

- (void)_setLanguages:(id)a3
{
  char v4 = atomic_load(&self->_state2);
  if ((v4 & 0x40) != 0)
  {
    uint64_t v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Custom transports do not support this method.", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v6);
  }
  os_unfair_lock_lock(&self->_lock);
  if (self->_bootstrap)
  {
    if (a3)
    {
LABEL_4:
      _CFBundleSetupXPCBootstrapWithLanguages();
      goto LABEL_7;
    }
  }
  else
  {
    self->_bootstrap = (OS_xpc_object *)xpc_dictionary_create(0, 0, 0);
    if (a3) {
      goto LABEL_4;
    }
  }
  _CFBundleSetupXPCBootstrap();
LABEL_7:
  xpc_connection_set_bootstrap();

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_setBootstrapObject:(id)a3 forKey:(id)a4
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  bootstrap = self->_bootstrap;
  if (!bootstrap)
  {
    bootstrap = (OS_xpc_object *)xpc_dictionary_create(0, 0, 0);
    self->_bootstrap = bootstrap;
  }
  xpc_dictionary_set_value(bootstrap, (const char *)[a4 UTF8String], a3);
  xpc_connection_set_bootstrap();

  os_unfair_lock_unlock(p_lock);
}

- (id)delegate
{
  return (id)atomic_load((unint64_t *)&self->_delegate);
}

- (id)remoteObjectProxyWithUserInfo:(id)a3 errorHandler:(id)a4
{
  id v5 = (id)objc_msgSend(objc_alloc(-[NSXPCConnection _remoteObjectInterfaceClass](self, "_remoteObjectInterfaceClass")), "_initWithConnection:proxyNumber:generationCount:interface:options:error:", self, 1, 0, self->_remoteObjectInterface, 0, a4);
  objc_msgSend(v5, "set_userInfo:", a3);
  return v5;
}

- (id)remoteObjectProxyWithTimeout:(double)a3 errorHandler:(id)a4
{
  id result = (id)objc_msgSend(objc_alloc(-[NSXPCConnection _remoteObjectInterfaceClass](self, "_remoteObjectInterfaceClass")), "_initWithConnection:proxyNumber:generationCount:interface:options:error:", self, 1, 0, self->_remoteObjectInterface, 0, a4);
  if (result) {
    *((double *)result + 8) = a3;
  }
  return result;
}

- (void)_setTargetUserIdentifier:(unsigned int)a3
{
  char v3 = atomic_load(&self->_state2);
  if ((v3 & 0x40) != 0)
  {
    id v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Custom transports do not support this method.", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v5);
  }
  xpc = self->_connection.xpc;

  MEMORY[0x1F40CECE8](xpc, *(void *)&a3);
}

- (void)_killConnection:(int)a3
{
  char v3 = atomic_load(&self->_state2);
  if ((v3 & 0x40) != 0)
  {
    id v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Custom transports do not support this method.", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v5);
  }
  xpc = self->_connection.xpc;

  MEMORY[0x1F40CEC28](xpc, *(void *)&a3);
}

- (void)_cancelProgress:(unint64_t)a3
{
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v5, "f", 0x10015uLL);
  xpc_dictionary_set_uint64(v5, "sequence", a3);
  char v6 = atomic_load(&self->_state2);
  if ((v6 & 0x40) != 0) {
    [(_NSXPCTransport *)self->_transport sendNotification:v5];
  }
  else {
    xpc_connection_send_notification();
  }

  xpc_release(v5);
}

- (void)_pauseProgress:(unint64_t)a3
{
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v5, "f", 0x20015uLL);
  xpc_dictionary_set_uint64(v5, "sequence", a3);
  char v6 = atomic_load(&self->_state2);
  if ((v6 & 0x40) != 0) {
    [(_NSXPCTransport *)self->_transport sendNotification:v5];
  }
  else {
    xpc_connection_send_notification();
  }

  xpc_release(v5);
}

- (void)_resumeProgress:(unint64_t)a3
{
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v5, "f", 0x40015uLL);
  xpc_dictionary_set_uint64(v5, "sequence", a3);
  char v6 = atomic_load(&self->_state2);
  if ((v6 & 0x40) != 0) {
    [(_NSXPCTransport *)self->_transport sendNotification:v5];
  }
  else {
    xpc_connection_send_notification();
  }

  xpc_release(v5);
}

- (void)_decodeProgressMessageWithData:(id)a3 flags:(unint64_t)a4
{
  int v4 = a4;
  uint64 = (const void *)xpc_dictionary_get_uint64(a3, "sequence");
  if ((v4 & 0x10000) != 0)
  {
    long long v9 = -[_NSXPCConnectionRequestedReplies progressForSequence:]((os_unfair_lock_s *)self->_repliesRequested, uint64);
    [(os_unfair_lock_s *)v9 cancel];
  }
  else if ((v4 & 0x20000) != 0)
  {
    uint64_t v10 = -[_NSXPCConnectionRequestedReplies progressForSequence:]((os_unfair_lock_s *)self->_repliesRequested, uint64);
    [(os_unfair_lock_s *)v10 pause];
  }
  else if ((v4 & 0x40000) != 0)
  {
    v11 = -[_NSXPCConnectionRequestedReplies progressForSequence:]((os_unfair_lock_s *)self->_repliesRequested, uint64);
    [(os_unfair_lock_s *)v11 resume];
  }
  else
  {
    long long v8 = -[_NSXPCConnectionExpectedReplies progressForSequence:]((os_unfair_lock_s *)self->_repliesExpected, uint64);
    -[NSProgress _receiveProgressMessage:forSequence:](v8, a3);
  }
}

@end