@interface CSAudioPowerServiceClient
+ (unint64_t)_getTimeIntervalFromFrequency:(int64_t)a3;
- (CSAudioPowerServiceClient)initWithQueue:(id)a3 frequency:(int64_t)a4 delegate:(id)a5;
- (id)_connection;
- (id)_newConnection;
- (id)_service;
- (void)_beginUpdate;
- (void)_endUpdate;
- (void)_fetchPowerLevels;
- (void)_invalidate;
- (void)beginUpdate;
- (void)endUpdate;
- (void)invalidate;
@end

@implementation CSAudioPowerServiceClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)_service
{
  v2 = [(CSAudioPowerServiceClient *)self _connection];
  v3 = [v2 remoteObjectProxy];

  return v3;
}

- (id)_connection
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[CSAudioPowerServiceClient _connection]";
      _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s Creating new xpc connection...", buf, 0xCu);
    }
    v5 = [(CSAudioPowerServiceClient *)self _newConnection];
    v6 = self->_xpcConnection;
    self->_xpcConnection = v5;

    objc_initWeak((id *)buf, self);
    v7 = self->_xpcConnection;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __40__CSAudioPowerServiceClient__connection__block_invoke;
    v15[3] = &unk_1E6201160;
    objc_copyWeak(&v16, (id *)buf);
    [(NSXPCConnection *)v7 setInterruptionHandler:v15];
    v8 = self->_xpcConnection;
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    v12 = __40__CSAudioPowerServiceClient__connection__block_invoke_3;
    v13 = &unk_1E6201160;
    objc_copyWeak(&v14, (id *)buf);
    [(NSXPCConnection *)v8 setInvalidationHandler:&v10];
    [(NSXPCConnection *)self->_xpcConnection resume];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
    xpcConnection = self->_xpcConnection;
  }
  return xpcConnection;
}

void __40__CSAudioPowerServiceClient__connection__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    v7 = "-[CSAudioPowerServiceClient _connection]_block_invoke";
    __int16 v8 = 2112;
    v9 = @"com.apple.siri.audiopowerupdate.xpc";
    _os_log_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEFAULT, "%s xpc connection %@ Interrupted", (uint8_t *)&v6, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    [*((id *)WeakRetained + 5) invalidate];
    v5 = (void *)v4[5];
    v4[5] = 0;
  }
}

void __40__CSAudioPowerServiceClient__connection__block_invoke_3(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    v7 = "-[CSAudioPowerServiceClient _connection]_block_invoke";
    __int16 v8 = 2112;
    v9 = @"com.apple.siri.audiopowerupdate.xpc";
    _os_log_impl(&dword_1BA1A5000, v2, OS_LOG_TYPE_DEFAULT, "%s xpc connection %@ Invalidated", (uint8_t *)&v6, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)*((void *)WeakRetained + 5);
    *((void *)WeakRetained + 5) = 0;
  }
}

- (id)_newConnection
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.siri.audiopowerupdate.xpc" options:0];
  id v4 = (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F13DC820];
  [v3 setRemoteObjectInterface:v4];

  [v3 setExportedObject:self];
  [v3 _setQueue:self->_queue];
  return v3;
}

- (void)_fetchPowerLevels
{
  v3 = [(CSAudioPowerServiceClient *)self _service];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__CSAudioPowerServiceClient__fetchPowerLevels__block_invoke;
  v4[3] = &unk_1E6200170;
  v4[4] = self;
  [v3 getAudioPowerUpdateWithCompletion:v4];
}

void __46__CSAudioPowerServiceClient__fetchPowerLevels__block_invoke(uint64_t a1, uint64_t a2, float a3, float a4)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));

  if (WeakRetained)
  {
    id v11 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
    *(float *)&double v9 = a3;
    *(float *)&double v10 = a4;
    [v11 audioPowerDidUpdateWithType:a2 averagePower:v9 peakPower:v10];
  }
}

- (void)_invalidate
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [(CSAudioPowerServiceClient *)self _endUpdate];
  objc_storeWeak((id *)&self->_delegate, 0);
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    [(NSXPCConnection *)xpcConnection setInvalidationHandler:0];
    [(NSXPCConnection *)self->_xpcConnection invalidate];
    id v4 = self->_xpcConnection;
    self->_xpcConnection = 0;

    v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      v7 = "-[CSAudioPowerServiceClient _invalidate]";
      _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s XPC connection invalidated", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)_endUpdate
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    v7 = "-[CSAudioPowerServiceClient _endUpdate]";
    _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
  }
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v5 = self->_timer;
    self->_timer = 0;
  }
}

- (void)_beginUpdate
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int64_t frequency = self->_frequency;
    *(_DWORD *)buf = 136315394;
    id v14 = "-[CSAudioPowerServiceClient _beginUpdate]";
    __int16 v15 = 2048;
    int64_t v16 = frequency;
    _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Begin power update with frequency : %ld", buf, 0x16u);
  }
  unint64_t v5 = +[CSAudioPowerServiceClient _getTimeIntervalFromFrequency:self->_frequency];
  if (self->_timer) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v5 == 0;
  }
  if (!v6)
  {
    uint64_t v7 = v5;
    uint64_t v8 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_queue);
    timer = self->_timer;
    self->_timer = v8;

    dispatch_source_set_timer((dispatch_source_t)self->_timer, 0, v7, 0);
    objc_initWeak((id *)buf, self);
    double v10 = self->_timer;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __41__CSAudioPowerServiceClient__beginUpdate__block_invoke;
    handler[3] = &unk_1E6201160;
    objc_copyWeak(&v12, (id *)buf);
    dispatch_source_set_event_handler(v10, handler);
    dispatch_resume((dispatch_object_t)self->_timer);
    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
}

void __41__CSAudioPowerServiceClient__beginUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _timerFired];
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__CSAudioPowerServiceClient_invalidate__block_invoke;
  block[3] = &unk_1E6201288;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __39__CSAudioPowerServiceClient_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)endUpdate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__CSAudioPowerServiceClient_endUpdate__block_invoke;
  block[3] = &unk_1E6201288;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __38__CSAudioPowerServiceClient_endUpdate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endUpdate];
}

- (void)beginUpdate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__CSAudioPowerServiceClient_beginUpdate__block_invoke;
  block[3] = &unk_1E6201288;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __40__CSAudioPowerServiceClient_beginUpdate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginUpdate];
}

- (CSAudioPowerServiceClient)initWithQueue:(id)a3 frequency:(int64_t)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CSAudioPowerServiceClient;
  id v11 = [(CSAudioPowerServiceClient *)&v14 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_queue, a3);
    v12->_int64_t frequency = a4;
    objc_storeWeak((id *)&v12->_delegate, v10);
  }

  return v12;
}

+ (unint64_t)_getTimeIntervalFromFrequency:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return 0;
  }
  else {
    return qword_1BA25E970[a3 - 1];
  }
}

@end