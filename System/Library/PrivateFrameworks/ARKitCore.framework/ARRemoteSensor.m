@interface ARRemoteSensor
- (ARRemoteSensor)initWithListenerEndpoint:(id)a3;
- (ARRemoteSensor)initWithServerConnection:(id)a3;
- (ARRemoteSensor)initWithServiceName:(id)a3;
- (ARSensorDelegate)delegate;
- (ARServerConnection)serverConnection;
- (BOOL)isRunning;
- (unint64_t)providedDataTypes;
- (void)dealloc;
- (void)sensorDidFailWithError:(id)a3;
- (void)sensorDidOutputSensorData:(id)a3;
- (void)sensorDidPause;
- (void)sensorDidRestart;
- (void)sensorDidStart;
- (void)setDelegate:(id)a3;
- (void)setRunning:(BOOL)a3;
- (void)start;
- (void)stop;
@end

@implementation ARRemoteSensor

- (ARRemoteSensor)initWithListenerEndpoint:(id)a3
{
  id v4 = a3;
  v5 = [[ARServerConnection alloc] initWithListenerEndpoint:v4];

  v6 = [(ARRemoteSensor *)self initWithServerConnection:v5];
  return v6;
}

- (ARRemoteSensor)initWithServerConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARRemoteSensor;
  v6 = [(ARRemoteSensor *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serverConnection, a3);
    [(ARServerConnection *)v7->_serverConnection setDelegate:v7];
    -[ARServerConnection setExportedInterface:](v7->_serverConnection, "setExportedInterface:", [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1272378]);
    [(ARServerConnection *)v7->_serverConnection setExportedObject:v7];
    -[ARServerConnection setRemoteObjectInterface:](v7->_serverConnection, "setRemoteObjectInterface:", [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F127E510]);
    v7->_running = 0;
  }

  return v7;
}

- (ARRemoteSensor)initWithServiceName:(id)a3
{
  id v4 = a3;
  id v5 = [[ARServerConnection alloc] initWithServiceName:v4];

  v6 = [(ARRemoteSensor *)self initWithServerConnection:v5];
  return v6;
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = _ARLogSensor_8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138543618;
    v8 = v5;
    __int16 v9 = 2048;
    v10 = self;
    _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: dealloc", buf, 0x16u);
  }
  v6.receiver = self;
  v6.super_class = (Class)ARRemoteSensor;
  [(ARRemoteSensor *)&v6 dealloc];
}

- (void)sensorDidFailWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(ARRemoteSensor *)self delegate];
  [v5 sensor:self didFailWithError:v4];
}

- (void)sensorDidOutputSensorData:(id)a3
{
  id v4 = a3;
  id v5 = [(ARRemoteSensor *)self delegate];
  [v5 sensor:self didOutputSensorData:v4];
}

- (void)sensorDidPause
{
  v3 = [(ARRemoteSensor *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(ARRemoteSensor *)self delegate];
    [v5 sensorDidPause:self];
  }
}

- (void)sensorDidRestart
{
  v3 = [(ARRemoteSensor *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(ARRemoteSensor *)self delegate];
    [v5 sensorDidRestart:self];
  }
}

- (void)sensorDidStart
{
  v3 = [(ARRemoteSensor *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(ARRemoteSensor *)self delegate];
    [v5 sensorDidStart:self];
  }
}

- (unint64_t)providedDataTypes
{
  uint64_t v8 = 0;
  __int16 v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  serverConnection = self->_serverConnection;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__ARRemoteSensor_providedDataTypes__block_invoke;
  v7[3] = &unk_1E6185C00;
  v7[4] = self;
  v3 = [(ARServerConnection *)serverConnection synchronousRemoteObjectProxyWithErrorHandler:v7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__ARRemoteSensor_providedDataTypes__block_invoke_66;
  v6[3] = &unk_1E6186D50;
  v6[4] = &v8;
  [v3 providedDataTypesWithReply:v6];
  unint64_t v4 = v9[3];

  _Block_object_dispose(&v8, 8);
  return v4;
}

void __35__ARRemoteSensor_providedDataTypes__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unint64_t v4 = _ARLogSensor_8();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (objc_class *)objc_opt_class();
    objc_super v6 = NSStringFromClass(v5);
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138543874;
    __int16 v9 = v6;
    __int16 v10 = 2048;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1B88A2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Failed to send data to service - error: %@", (uint8_t *)&v8, 0x20u);
  }
}

uint64_t __35__ARRemoteSensor_providedDataTypes__block_invoke_66(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)start
{
  if (![(ARRemoteSensor *)self isRunning])
  {
    [(ARRemoteSensor *)self setRunning:1];
    serverConnection = self->_serverConnection;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __23__ARRemoteSensor_start__block_invoke;
    v5[3] = &unk_1E6185C00;
    v5[4] = self;
    unint64_t v4 = [(ARServerConnection *)serverConnection synchronousRemoteObjectProxyWithErrorHandler:v5];
    [v4 start];
  }
}

void __23__ARRemoteSensor_start__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unint64_t v4 = _ARLogSensor_8();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (objc_class *)objc_opt_class();
    objc_super v6 = NSStringFromClass(v5);
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138543874;
    __int16 v9 = v6;
    __int16 v10 = 2048;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1B88A2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Failed to send data to service - error: %@", (uint8_t *)&v8, 0x20u);
  }
}

- (void)stop
{
  if ([(ARRemoteSensor *)self isRunning])
  {
    [(ARRemoteSensor *)self setRunning:0];
    serverConnection = self->_serverConnection;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __22__ARRemoteSensor_stop__block_invoke;
    v5[3] = &unk_1E6185C00;
    v5[4] = self;
    unint64_t v4 = [(ARServerConnection *)serverConnection synchronousRemoteObjectProxyWithErrorHandler:v5];
    [v4 stop];
  }
}

void __22__ARRemoteSensor_stop__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unint64_t v4 = _ARLogSensor_8();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (objc_class *)objc_opt_class();
    objc_super v6 = NSStringFromClass(v5);
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138543874;
    __int16 v9 = v6;
    __int16 v10 = 2048;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1B88A2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Failed to send data to service - error: %@", (uint8_t *)&v8, 0x20u);
  }
}

- (ARSensorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ARSensorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isRunning
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (ARServerConnection)serverConnection
{
  return self->_serverConnection;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serviceProxy, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);
}

@end