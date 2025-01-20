@interface ARRemoteControl
+ (NSString)serviceName;
+ (NSXPCInterface)controlInterface;
+ (NSXPCInterface)controlProxyInterface;
- (ARControlProtocol)control;
- (ARControlProtocol)syncControl;
- (ARRemoteControl)init;
- (ARRemoteControl)initWithEndpoint:(id)a3;
- (ARRemoteControlDelegate)delegate;
- (void)dealloc;
- (void)interruptionHandler;
- (void)invalidate;
- (void)invalidationHandler;
- (void)setDelegate:(id)a3;
@end

@implementation ARRemoteControl

- (ARRemoteControl)init
{
  return [(ARRemoteControl *)self initWithEndpoint:0];
}

- (ARRemoteControl)initWithEndpoint:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ARRemoteControl;
  v5 = [(ARRemoteControl *)&v24 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F29268]);
    v7 = v6;
    if (v4)
    {
      uint64_t v8 = [v6 initWithListenerEndpoint:v4];
      connection = v5->_connection;
      v5->_connection = (NSXPCConnection *)v8;
    }
    else
    {
      connection = [(id)objc_opt_class() serviceName];
      uint64_t v10 = [v7 initWithMachServiceName:connection options:0];
      v11 = v5->_connection;
      v5->_connection = (NSXPCConnection *)v10;
    }
    uint64_t v12 = +[ARWeakReference weakReferenceWithObject:v5];
    exportedObjectWeakReference = v5->_exportedObjectWeakReference;
    v5->_exportedObjectWeakReference = (ARWeakReference *)v12;

    [(NSXPCConnection *)v5->_connection setExportedObject:v5->_exportedObjectWeakReference];
    v14 = [(id)objc_opt_class() controlProxyInterface];
    [(NSXPCConnection *)v5->_connection setExportedInterface:v14];

    v15 = [(id)objc_opt_class() controlInterface];
    [(NSXPCConnection *)v5->_connection setRemoteObjectInterface:v15];

    objc_initWeak(&location, v5);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __36__ARRemoteControl_initWithEndpoint___block_invoke;
    v21[3] = &unk_1E61852E8;
    objc_copyWeak(&v22, &location);
    [(NSXPCConnection *)v5->_connection setInterruptionHandler:v21];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __36__ARRemoteControl_initWithEndpoint___block_invoke_2;
    v19[3] = &unk_1E61852E8;
    objc_copyWeak(&v20, &location);
    [(NSXPCConnection *)v5->_connection setInvalidationHandler:v19];
    [(NSXPCConnection *)v5->_connection resume];
    uint64_t v16 = [(NSXPCConnection *)v5->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_8];
    control = v5->_control;
    v5->_control = (ARControlProtocol *)v16;

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __36__ARRemoteControl_initWithEndpoint___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained interruptionHandler];
}

void __36__ARRemoteControl_initWithEndpoint___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidationHandler];
}

void __36__ARRemoteControl_initWithEndpoint___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = _ARLogGeneral_2();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    id v4 = [v2 description];
    int v5 = 138412290;
    id v6 = v4;
    _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_ERROR, "ARRemoteControl: Remote object proxy failed with error: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)dealloc
{
  [(ARRemoteControl *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ARRemoteControl;
  [(ARRemoteControl *)&v3 dealloc];
}

- (ARControlProtocol)syncControl
{
  return (ARControlProtocol *)[(NSXPCConnection *)self->_connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_10];
}

void __30__ARRemoteControl_syncControl__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  objc_super v3 = _ARLogGeneral_2();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_ERROR, "ARRemoteControl: Sync remote object proxy failed with error: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)invalidate
{
  [(NSXPCConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;

  control = self->_control;
  self->_control = 0;
}

- (void)interruptionHandler
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  objc_super v3 = _ARLogGeneral_2();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    int v7 = 138543618;
    uint64_t v8 = v5;
    __int16 v9 = 2048;
    uint64_t v10 = self;
    _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Control interrupted", (uint8_t *)&v7, 0x16u);
  }
  uint64_t v6 = [(ARRemoteControl *)self delegate];
  [v6 connectionInterrupted];
}

- (void)invalidationHandler
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  objc_super v3 = _ARLogGeneral_2();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    int v6 = 138543618;
    int v7 = v5;
    __int16 v8 = 2048;
    __int16 v9 = self;
    _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Control invalidated", (uint8_t *)&v6, 0x16u);
  }
}

+ (NSString)serviceName
{
  return (NSString *)@"com.apple.arkit.service.control";
}

+ (NSXPCInterface)controlProxyInterface
{
  return (NSXPCInterface *)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F12619A8];
}

+ (NSXPCInterface)controlInterface
{
  return (NSXPCInterface *)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1285860];
}

- (ARControlProtocol)control
{
  return self->_control;
}

- (ARRemoteControlDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ARRemoteControlDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_control, 0);
  objc_storeStrong((id *)&self->_exportedObjectWeakReference, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end