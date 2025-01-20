@interface NFCSession
- (BOOL)_connectIfNeeded;
- (NFCSession)initWithMachServiceName:(id)a3 remoteObjectInterface:(id)a4 exportedObjectInterface:(id)a5 exportedObject:(id)a6 delegate:(id)a7;
- (id)_connection;
- (id)_connectionLock;
- (id)_exportedObjectClassName;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (void)_invalidate;
- (void)_setConnection:(id)a3;
- (void)dealloc;
@end

@implementation NFCSession

- (NFCSession)initWithMachServiceName:(id)a3 remoteObjectInterface:(id)a4 exportedObjectInterface:(id)a5 exportedObject:(id)a6 delegate:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v26.receiver = self;
  v26.super_class = (Class)NFCSession;
  id v17 = [(NFCSession *)&v26 init];
  if (v17)
  {
    id v18 = objc_alloc_init(MEMORY[0x263F08958]);
    v19 = (void *)*((void *)v17 + 1);
    *((void *)v17 + 1) = v18;

    v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v21 = dispatch_queue_create("com.apple.corenfc.session.xpc", v20);
    v22 = (void *)*((void *)v17 + 3);
    *((void *)v17 + 3) = v21;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v17 + 3), (const void *)*MEMORY[0x263F8C6C0], (void *)1, 0);
    objc_storeStrong((id *)v17 + 4, a4);
    objc_storeStrong((id *)v17 + 5, a5);
    objc_storeWeak((id *)v17 + 7, v15);
    uint64_t v23 = [v12 copy];
    v24 = (void *)*((void *)v17 + 6);
    *((void *)v17 + 6) = v23;

    objc_storeWeak((id *)v17 + 8, v16);
  }

  return (NFCSession *)v17;
}

- (void)dealloc
{
  [(NFCSession *)self _invalidate];
  v3.receiver = self;
  v3.super_class = (Class)NFCSession;
  [(NFCSession *)&v3 dealloc];
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void *))a3;
  v5 = [(NFCSession *)self _connection];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v4];
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x263F087E8]);
    v9 = [NSString stringWithUTF8String:"nfcd"];
    uint64_t v14 = *MEMORY[0x263F08320];
    v10 = [NSString stringWithUTF8String:"XPC Error"];
    v15[0] = v10;
    v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
    id v12 = (void *)[v8 initWithDomain:v9 code:7 userInfo:v11];
    v4[2](v4, v12);

    v7 = 0;
  }

  return v7;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  v15[1] = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void *))a3;
  v5 = [(NFCSession *)self _connection];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 remoteObjectProxyWithErrorHandler:v4];
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x263F087E8]);
    v9 = [NSString stringWithUTF8String:"nfcd"];
    uint64_t v14 = *MEMORY[0x263F08320];
    v10 = [NSString stringWithUTF8String:"XPC Error"];
    v15[0] = v10;
    v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
    id v12 = (void *)[v8 initWithDomain:v9 code:7 userInfo:v11];
    v4[2](v4, v12);

    v7 = 0;
  }

  return v7;
}

- (id)_connection
{
  [(NFCSession *)self _connectIfNeeded];
  connection = self->_connection;

  return connection;
}

- (void)_setConnection:(id)a3
{
}

- (id)_connectionLock
{
  return self->_connectionLock;
}

- (id)_exportedObjectClassName
{
  id WeakRetained = objc_loadWeakRetained(&self->_exportedObject);
  objc_super v3 = (objc_class *)objc_opt_class();
  if (!v3) {
    objc_super v3 = (objc_class *)objc_opt_class();
  }
  v4 = NSStringFromClass(v3);

  return v4;
}

- (BOOL)_connectIfNeeded
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  [(NSLock *)self->_connectionLock lock];
  if (self->_connection) {
    goto LABEL_4;
  }
  v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:self->_machServiceName options:4096];
  connection = self->_connection;
  self->_connection = v4;

  v6 = self->_connection;
  if (v6)
  {
    [(NSXPCConnection *)v6 setRemoteObjectInterface:self->_remoteObjectInterface];
    [(NSXPCConnection *)self->_connection setExportedInterface:self->_exportedObjectInterface];
    id WeakRetained = objc_loadWeakRetained(&self->_exportedObject);
    [(NSXPCConnection *)self->_connection setExportedObject:WeakRetained];

    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __30__NFCSession__connectIfNeeded__block_invoke;
    aBlock[3] = &unk_2645B43A0;
    objc_copyWeak(&v29, &location);
    id v8 = _Block_copy(aBlock);
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __30__NFCSession__connectIfNeeded__block_invoke_2;
    v26[3] = &unk_2645B4308;
    id v9 = v8;
    id v27 = v9;
    [(NSXPCConnection *)self->_connection setInvalidationHandler:v26];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __30__NFCSession__connectIfNeeded__block_invoke_3;
    v24[3] = &unk_2645B4308;
    id v10 = v9;
    id v25 = v10;
    [(NSXPCConnection *)self->_connection setInterruptionHandler:v24];
    [(NSXPCConnection *)self->_connection _setQueue:self->_xpcQueue];
    [(NSXPCConnection *)self->_connection resume];

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
LABEL_4:
    BOOL v11 = 1;
    goto LABEL_5;
  }
  id v13 = (const void **)MEMORY[0x263F8C6C0];
  dispatch_get_specific((const void *)*MEMORY[0x263F8C6C0]);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v15 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v19 = 45;
    if (isMetaClass) {
      uint64_t v19 = 43;
    }
    v15(3, "%c[%{public}s %{public}s]:%i Failed to connect to NFCD", v19, ClassName, Name, 115);
  }
  dispatch_get_specific(*v13);
  v20 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    dispatch_queue_t v21 = object_getClass(self);
    if (class_isMetaClass(v21)) {
      int v22 = 43;
    }
    else {
      int v22 = 45;
    }
    LODWORD(location) = 67109890;
    HIDWORD(location) = v22;
    __int16 v31 = 2082;
    v32 = object_getClassName(self);
    __int16 v33 = 2082;
    v34 = sel_getName(a2);
    __int16 v35 = 1024;
    int v36 = 115;
    _os_log_impl(&dword_2214B8000, v20, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to connect to NFCD", (uint8_t *)&location, 0x22u);
  }

  BOOL v11 = 0;
LABEL_5:
  [(NSLock *)self->_connectionLock unlock];
  return v11;
}

void __30__NFCSession__connectIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    id v2 = WeakRetained[2];
    objc_super v3 = [v6 _connectionLock];
    [v3 lock];

    [v2 invalidate];
    [v2 setRemoteObjectInterface:0];
    [v2 setExportedObject:0];
    [v2 setExportedInterface:0];

    [v6 _setConnection:0];
    v4 = [v6 _connectionLock];
    [v4 unlock];

    id v5 = objc_loadWeakRetained(v6 + 8);
    [v5 didInvalidate];

    id WeakRetained = v6;
  }
}

uint64_t __30__NFCSession__connectIfNeeded__block_invoke_2(uint64_t a1)
{
  id v2 = _os_activity_create(&dword_2214B8000, "NFCSession xpcInvalidated", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v4.opaque[0] = 0;
  v4.opaque[1] = 0;
  os_activity_scope_enter(v2, &v4);
  os_activity_scope_leave(&v4);

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __30__NFCSession__connectIfNeeded__block_invoke_3(uint64_t a1)
{
  id v2 = _os_activity_create(&dword_2214B8000, "NFCSession xpcInterrupted", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v4.opaque[0] = 0;
  v4.opaque[1] = 0;
  os_activity_scope_enter(v2, &v4);
  os_activity_scope_leave(&v4);

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_invalidate
{
  [(NSLock *)self->_connectionLock lock];
  [(NSXPCConnection *)self->_connection invalidate];
  [(NSXPCConnection *)self->_connection setRemoteObjectInterface:0];
  [(NSXPCConnection *)self->_connection setExportedObject:0];
  [(NSXPCConnection *)self->_connection setExportedInterface:0];
  connection = self->_connection;
  self->_connection = 0;

  connectionLock = self->_connectionLock;

  [(NSLock *)connectionLock unlock];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak(&self->_exportedObject);
  objc_storeStrong((id *)&self->_machServiceName, 0);
  objc_storeStrong((id *)&self->_exportedObjectInterface, 0);
  objc_storeStrong((id *)&self->_remoteObjectInterface, 0);
  objc_storeStrong((id *)&self->_xpcQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_connectionLock, 0);
}

@end