@interface _LSDService
+ (BOOL)XPCConnectionIsAlwaysPrivileged;
+ (BOOL)isEnabled;
+ (Class)clientClass;
+ (id)XPCConnectionToService;
+ (id)XPCInterface;
+ (id)XPCProxyWithErrorHandler:(uint64_t)a1;
+ (id)dispatchQueue;
+ (id)replacementObjectForXPCConnection:(id)a3 encoder:(id)a4 object:(id)a5;
+ (id)synchronousXPCProxyWithErrorHandler:(uint64_t)a1;
+ (unsigned)connectionType;
+ (void)XPCConnectionToService;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_LSDService)initWithXPCListener:(id)a3;
- (id).cxx_construct;
- (id)clientForConnection:(id)a3;
- (id)replacementObjectForXPCConnection:(id)a3 encoder:(id)a4 object:(id)a5;
- (void)clientBorn:(id)a3 forNewConnection:(id)a4;
- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5;
- (void)connectionWasInvalidated:(id)a3;
@end

@implementation _LSDService

- (id)replacementObjectForXPCConnection:(id)a3 encoder:(id)a4 object:(id)a5
{
  return _LSDServiceReplaceObject((objc_object *)a5);
}

+ (id)replacementObjectForXPCConnection:(id)a3 encoder:(id)a4 object:(id)a5
{
  return _LSDServiceReplaceObject((objc_object *)a5);
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  BOOL v5 = a5;
  v9 = -[_LSDService clientForConnection:](self, "clientForConnection:");
  if (!v9)
  {
    v10 = _LSDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[_LSDService connection:handleInvocation:isReply:]((uint64_t)a3, (uint64_t)self, v10);
    }
  }
  [v9 handleXPCInvocation:a4 isReply:v5];
}

- (id)clientForConnection:(id)a3
{
  p_clientMapMutex = (os_unfair_lock_s *)&self->_clientMapMutex;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_clientMapMutex);
  v6 = [(NSMapTable *)self->_clientMap objectForKey:a3];
  os_unfair_lock_unlock(p_clientMapMutex);

  return v6;
}

+ (id)XPCProxyWithErrorHandler:(uint64_t)a1
{
  v3 = self;
  v4 = +[_LSDServiceDomain defaultServiceDomain]();
  BOOL v5 = _LSDServiceGetXPCProxyForServiceClass(v3, (uint64_t)v4, 0, a2);

  return v5;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v6 = (objc_class *)[(id)objc_opt_class() clientClass];
  v7 = [(id)objc_opt_class() XPCInterface];
  if (v6
    && ((int v8 = [(objc_class *)v6 isSubclassOfClass:objc_opt_class()], v7) ? (v9 = v8) : (v9 = 0),
        v9 == 1))
  {
    v10 = [(id)objc_opt_class() dispatchQueue];
    v11 = (void *)[[v6 alloc] initWithXPCConnection:a4 queue:v10];
    BOOL v12 = v11 != 0;
    if (v11)
    {
      [a4 setExportedInterface:v7];
      [a4 setExportedObject:v11];
      [a4 setDelegate:self];
      objc_initWeak(&location, a4);
      objc_initWeak(&from, self);
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      v16 = __50___LSDService_listener_shouldAcceptNewConnection___block_invoke;
      v17 = &unk_1E522F3D0;
      objc_copyWeak(&v18, &from);
      objc_copyWeak(&v19, &location);
      [a4 setInvalidationHandler:&v14];
      -[_LSDService clientBorn:forNewConnection:](self, "clientBorn:forNewConnection:", v11, a4, v14, v15, v16, v17);
      [a4 resume];
      objc_destroyWeak(&v19);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

+ (id)synchronousXPCProxyWithErrorHandler:(uint64_t)a1
{
  v3 = self;
  v4 = +[_LSDServiceDomain defaultServiceDomain]();
  BOOL v5 = _LSDServiceGetXPCProxyForServiceClass(v3, (uint64_t)v4, 1, a2);

  return v5;
}

+ (BOOL)XPCConnectionIsAlwaysPrivileged
{
  return 0;
}

- (void)clientBorn:(id)a3 forNewConnection:(id)a4
{
  p_clientMapMutex = (os_unfair_lock_s *)&self->_clientMapMutex;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_clientMapMutex);
  [(NSMapTable *)self->_clientMap setObject:a3 forKey:a4];

  os_unfair_lock_unlock(p_clientMapMutex);
}

+ (id)dispatchQueue
{
  return 0;
}

+ (id)XPCConnectionToService
{
  if ([(id)__LSDefaultsGetSharedInstance() isInXCTestRigInsecure])
  {
    v3 = +[_LSDServiceDomain defaultServiceDomain]();
    v4 = _LSDServiceGetXPCConnection(a1, (uint64_t)v3);
  }
  else
  {
    BOOL v5 = _LSDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      +[_LSDService XPCConnectionToService](v5);
    }

    v4 = 0;
  }

  return v4;
}

- (_LSDService)initWithXPCListener:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_LSDService;
  v4 = [(_LSDService *)&v9 init];
  BOOL v5 = v4;
  if (v4)
  {
    objc_storeWeak((id *)&v4->_listener, a3);
    uint64_t v6 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    clientMap = v5->_clientMap;
    v5->_clientMap = (NSMapTable *)v6;
  }
  return v5;
}

- (void)connectionWasInvalidated:(id)a3
{
  p_clientMapMutex = (os_unfair_lock_s *)&self->_clientMapMutex;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_clientMapMutex);
  [(NSMapTable *)self->_clientMap removeObjectForKey:a3];

  os_unfair_lock_unlock(p_clientMapMutex);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientMap, 0);

  objc_destroyWeak((id *)&self->_listener);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 4) = 0;
  return self;
}

+ (unsigned)connectionType
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"unimplemented method %s", "+[_LSDService(SubclassesShouldOverride) connectionType]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

+ (Class)clientClass
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"unimplemented method %s", "+[_LSDService(SubclassesShouldOverride) clientClass]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

+ (id)XPCInterface
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"unimplemented method %s", "+[_LSDService(SubclassesShouldOverride) XPCInterface]");
  id v5 = [v2 exceptionWithName:v3 reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

+ (BOOL)isEnabled
{
  return [(id)__LSDefaultsGetSharedInstance() isLightweightSystemServer] ^ 1;
}

+ (void)XPCConnectionToService
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_182959000, log, OS_LOG_TYPE_FAULT, "Process is directly invoking +XPCConnectionToService. This method is unsupported.", v1, 2u);
}

- (void)connection:(uint64_t)a1 handleInvocation:(uint64_t)a2 isReply:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_182959000, log, OS_LOG_TYPE_FAULT, "client was unexpectedly nil for connection %@ for %@", (uint8_t *)&v3, 0x16u);
}

@end