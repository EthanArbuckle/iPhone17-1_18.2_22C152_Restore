@interface CADOperationProxy
+ (BOOL)_selectorMayBeCalledBeforeInitialization:(SEL)a3;
- (CADOperationProxy)initWithClientConnection:(id)a3;
- (id)_newImplementation;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)clearCachedAuthorizationStatus;
- (void)dealloc;
- (void)forwardInvocation:(id)a3;
@end

@implementation CADOperationProxy

- (void)forwardInvocation:(id)a3
{
  if ((objc_msgSend((id)objc_opt_class(), "_selectorMayBeCalledBeforeInitialization:", objc_msgSend(a3, "selector")) & 1) == 0
    && ![(ClientConnection *)self->_conn initializationOptionsSet])
  {
    v8 = (void *)[MEMORY[0x1E4F57788] copyReplyBlockFromInvocation:a3];
    v13 = CADOperationProxyLogHandle;
    if (os_log_type_enabled((os_log_t)CADOperationProxyLogHandle, OS_LOG_TYPE_DEBUG)) {
      -[CADOperationProxy forwardInvocation:].cold.4(a3, v13);
    }
    v9 = (void *)MEMORY[0x1E4F57788];
    v10 = v8;
    id v11 = a3;
    uint64_t v12 = 1019;
    goto LABEL_18;
  }
  if (!-[CADXPCImplementation accessGrantedToPerformSelector:](self->_implementation, "accessGrantedToPerformSelector:", [a3 selector]))
  {
    v6 = CADOperationProxyLogHandle;
    if (os_log_type_enabled((os_log_t)CADOperationProxyLogHandle, OS_LOG_TYPE_ERROR)) {
      [(CADOperationProxy *)a3 forwardInvocation:v6];
    }
    if (MGGetBoolAnswer())
    {
      v7 = CADOperationProxyLogHandle;
      if (os_log_type_enabled((os_log_t)CADOperationProxyLogHandle, OS_LOG_TYPE_ERROR))
      {
        [(CADOperationProxy *)(uint64_t)self forwardInvocation:&v14];
        v7 = v14;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[CADOperationProxy forwardInvocation:](v7);
      }
    }
    v8 = (void *)[MEMORY[0x1E4F57788] copyReplyBlockFromInvocation:a3];
    v9 = (void *)MEMORY[0x1E4F57788];
    v10 = v8;
    id v11 = a3;
    uint64_t v12 = 1013;
LABEL_18:
    [v9 callReplyHandler:v10 ofInvocation:v11 withErrorCode:v12];

    return;
  }
  implementation = self->_implementation;
  [a3 invokeWithTarget:implementation];
}

+ (BOOL)_selectorMayBeCalledBeforeInitialization:(SEL)a3
{
  return sel_CADDatabaseSetInitializationOptions_reply_ == a3 || sel_CADMigrateDatabaseIfNeeded_ == a3;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  v4 = self;
  if (sel_CADDatabaseSetInitializationOptions_reply_ == a3
    || [(ClientConnection *)self->_conn initializationOptionsSet])
  {
    if ([(CADXPCImplementation *)v4->_implementation accessGrantedToPerformSelector:a3])
    {
      return v4->_implementation;
    }
    else
    {
      v5 = CADOperationProxyLogHandle;
      if (os_log_type_enabled((os_log_t)CADOperationProxyLogHandle, OS_LOG_TYPE_ERROR)) {
        [(CADOperationProxy *)a3 forwardingTargetForSelector:v5];
      }
    }
  }
  return v4;
}

- (CADOperationProxy)initWithClientConnection:(id)a3
{
  if (initWithClientConnection__onceToken != -1) {
    dispatch_once(&initWithClientConnection__onceToken, &__block_literal_global_16);
  }
  v7.receiver = self;
  v7.super_class = (Class)CADOperationProxy;
  v5 = [(CADOperationProxy *)&v7 init];
  if (v5)
  {
    v5->_conn = (ClientConnection *)a3;
    v5->_implementation = (CADXPCImplementation *)[(CADOperationProxy *)v5 _newImplementation];
  }
  return v5;
}

- (id)_newImplementation
{
  v3 = [CADXPCImplementation alloc];
  conn = self->_conn;
  return [(CADXPCImplementation *)v3 initWithClientConnection:conn];
}

- (id)methodSignatureForSelector:(SEL)a3
{
  objc_method_description MethodDescription = protocol_getMethodDescription((Protocol *)&unk_1F1530CE0, a3, 1, 1);
  types = MethodDescription.types;
  if (MethodDescription.name
    || (objc_method_description v6 = protocol_getMethodDescription((Protocol *)&unk_1F1530CE0, a3, 0, 1), types = v6.types, v6.name))
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA38];
    return (id)[v7 signatureWithObjCTypes:types];
  }
  else
  {
    v9 = (void *)MEMORY[0x1E4F1CA38];
    return (id)[v9 methodSignatureForSelector:sel__emptyMethod];
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CADOperationProxy;
  [(CADOperationProxy *)&v3 dealloc];
}

os_log_t __46__CADOperationProxy_initWithClientConnection___block_invoke()
{
  v0 = CADCalendarLogSubsystem;
  v1 = (objc_class *)objc_opt_class();
  v2 = [NSStringFromClass(v1) UTF8String];
  os_log_t result = os_log_create(v0, v2);
  CADOperationProxyLogHandle = (uint64_t)result;
  return result;
}

- (void)clearCachedAuthorizationStatus
{
}

- (void)forwardingTargetForSelector:(NSObject *)a3 .cold.1(const char *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v5 = NSStringFromSelector(a1);
  uint64_t v6 = [*(id *)(a2 + 8) identity];
  int v7 = 138412546;
  v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_1BBC88000, a3, OS_LOG_TYPE_ERROR, "A client attempted to call [%@] and was denied due to insufficient privileges.  Client identity: [%@]", (uint8_t *)&v7, 0x16u);
}

- (void)forwardInvocation:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BBC88000, log, OS_LOG_TYPE_ERROR, "ERROR: If this is unexpected please file a bug and if possible identify the above process via bundle id, name, or pid", v1, 2u);
}

- (void)forwardInvocation:(void *)a3 .cold.2(uint64_t a1, NSObject *a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*(id *)(a1 + 8) identity];
  int v6 = 138412290;
  uint64_t v7 = v5;
  _os_log_error_impl(&dword_1BBC88000, a2, OS_LOG_TYPE_ERROR, "ERROR: Refused for connection from %@", (uint8_t *)&v6, 0xCu);
  *a3 = CADOperationProxyLogHandle;
}

- (void)forwardInvocation:(NSObject *)a3 .cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSStringFromSelector((SEL)[a1 selector]);
  int v6 = [*(id *)(a2 + 8) reminderAccessGranted];
  int v7 = [*(id *)(a2 + 8) eventAccessLevel];
  int v8 = 138412802;
  __int16 v9 = v5;
  __int16 v10 = 1024;
  int v11 = v6;
  __int16 v12 = 1024;
  int v13 = v7;
  _os_log_error_impl(&dword_1BBC88000, a3, OS_LOG_TYPE_ERROR, "ERROR: access denied to perform invocation %@. The CADXPCImplementation has the following TCC status: Reminders %{BOOL}i, Events %d.", (uint8_t *)&v8, 0x18u);
}

- (void)forwardInvocation:(void *)a1 .cold.4(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 138412290;
  v4 = NSStringFromSelector((SEL)[a1 selector]);
  _os_log_debug_impl(&dword_1BBC88000, a2, OS_LOG_TYPE_DEBUG, "Received message %@ before initialization. Dropping this message.", (uint8_t *)&v3, 0xCu);
}

@end