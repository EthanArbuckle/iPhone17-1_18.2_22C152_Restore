@interface CSAttSiriServiceClient
- (CSAttSiriServiceClient)init;
- (CSAttSiriServiceDelegate)delegate;
- (NSXPCConnection)attSiriSvcConn;
- (id)remoteSvcProxy;
- (void)_setupAttSiriSvcXpcConnection;
- (void)attSiriAttendingFailed;
- (void)attSiriAttendingTimeoutTriggered;
- (void)attSiriDidDetectAttendingTrigger:(id)a3;
- (void)attSiriDidDetectContinuousConversation;
- (void)attSiriDidStartAttending:(BOOL)a3 useLegacyModel:(BOOL)a4;
- (void)dealloc;
- (void)gazeEstimates:(CGPoint)a3 landmarks:(id)a4;
- (void)gazeTrackerFaceTrackingMetaDataUpdate:(id)a3 atMachAbsTime:(unint64_t)a4;
- (void)invalidate;
- (void)setAttSiriSvcConn:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRemoteSvcProxy:(id)a3;
- (void)siriRequestProcessingCompleted;
- (void)startAttendingWithContext:(id)a3;
- (void)stopAttendingWithContext:(id)a3;
- (void)updateSiriOrbLocation:(CGRect)a3;
@end

@implementation CSAttSiriServiceClient

- (void).cxx_destruct
{
  objc_storeStrong(&self->_remoteSvcProxy, 0);
  objc_storeStrong((id *)&self->_attSiriSvcConn, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setRemoteSvcProxy:(id)a3
{
}

- (id)remoteSvcProxy
{
  return self->_remoteSvcProxy;
}

- (void)setAttSiriSvcConn:(id)a3
{
}

- (NSXPCConnection)attSiriSvcConn
{
  return self->_attSiriSvcConn;
}

- (void)setDelegate:(id)a3
{
}

- (CSAttSiriServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSAttSiriServiceDelegate *)WeakRetained;
}

- (void)attSiriDidStartAttending:(BOOL)a3 useLegacyModel:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v7 = (os_log_t *)MEMORY[0x1E4F5D180];
  v8 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 136315394;
    v22 = "-[CSAttSiriServiceClient attSiriDidStartAttending:useLegacyModel:]";
    __int16 v23 = 1024;
    BOOL v24 = v5;
    _os_log_impl(&dword_1C9338000, v8, OS_LOG_TYPE_DEFAULT, "%s useGazeSignal:%u", (uint8_t *)&v21, 0x12u);
  }
  if (CSIsIOS())
  {
    if (v5)
    {
      v9 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 136315394;
        v22 = "-[CSAttSiriServiceClient attSiriDidStartAttending:useLegacyModel:]";
        __int16 v23 = 1024;
        BOOL v24 = v4;
        _os_log_impl(&dword_1C9338000, v9, OS_LOG_TYPE_DEFAULT, "%s useLegacyGazeModel:%u", (uint8_t *)&v21, 0x12u);
      }
    }
  }
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (WeakRetained)
  {
    v12 = WeakRetained;
    id v13 = objc_loadWeakRetained((id *)p_delegate);
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      id v15 = objc_loadWeakRetained((id *)p_delegate);
      [v15 attSiriDidStartAttending:v4];
    }
  }
  id v16 = objc_loadWeakRetained((id *)p_delegate);
  if (v16)
  {
    v17 = v16;
    id v18 = objc_loadWeakRetained((id *)p_delegate);
    char v19 = objc_opt_respondsToSelector();

    if (v19)
    {
      id v20 = objc_loadWeakRetained((id *)p_delegate);
      [v20 attSiriDidStartAttending];
    }
  }
}

- (void)attSiriDidDetectContinuousConversation
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    BOOL v4 = WeakRetained;
    id v5 = objc_loadWeakRetained((id *)p_delegate);
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = objc_loadWeakRetained((id *)p_delegate);
      [v7 attSiriDidDetectContinuousConversation];
    }
  }
}

- (void)attSiriAttendingFailed
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    v11 = "-[CSAttSiriServiceClient attSiriAttendingFailed]";
    _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v10, 0xCu);
  }
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (WeakRetained)
  {
    char v6 = WeakRetained;
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)p_delegate);
      [v9 attSiriAttendingFailed];
    }
  }
}

- (void)attSiriAttendingTimeoutTriggered
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    v11 = "-[CSAttSiriServiceClient attSiriAttendingTimeoutTriggered]";
    _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v10, 0xCu);
  }
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (WeakRetained)
  {
    char v6 = WeakRetained;
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)p_delegate);
      [v9 attSiriAttendingTimeoutTriggered];
    }
  }
}

- (void)attSiriDidDetectAttendingTrigger:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315394;
    id v13 = "-[CSAttSiriServiceClient attSiriDidDetectAttendingTrigger:]";
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_DEFAULT, "%s triggerInfo: %@", (uint8_t *)&v12, 0x16u);
  }
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (WeakRetained)
  {
    char v8 = WeakRetained;
    id v9 = objc_loadWeakRetained((id *)p_delegate);
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = objc_loadWeakRetained((id *)p_delegate);
      [v11 attSiriDidDetectAttendingTrigger:v4];
    }
  }
}

- (void)_setupAttSiriSvcXpcConnection
{
  v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.corespeech.corespeechd.attsiri.service" options:4096];
  attSiriSvcConn = self->_attSiriSvcConn;
  self->_attSiriSvcConn = v3;

  id v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F23CB890];
  [(NSXPCConnection *)self->_attSiriSvcConn setRemoteObjectInterface:v5];

  char v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F23CB760];
  [(NSXPCConnection *)self->_attSiriSvcConn setExportedInterface:v6];

  [(NSXPCConnection *)self->_attSiriSvcConn setExportedObject:self];
  objc_initWeak(&location, self);
  id v7 = self->_attSiriSvcConn;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__CSAttSiriServiceClient__setupAttSiriSvcXpcConnection__block_invoke;
  v11[3] = &unk_1E658C420;
  objc_copyWeak(&v12, &location);
  [(NSXPCConnection *)v7 setInterruptionHandler:v11];
  char v8 = self->_attSiriSvcConn;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__CSAttSiriServiceClient__setupAttSiriSvcXpcConnection__block_invoke_72;
  v9[3] = &unk_1E658C420;
  objc_copyWeak(&v10, &location);
  [(NSXPCConnection *)v8 setInvalidationHandler:v9];
  [(NSXPCConnection *)self->_attSiriSvcConn resume];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __55__CSAttSiriServiceClient__setupAttSiriSvcXpcConnection__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)*MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    id v4 = [WeakRetained attSiriSvcConn];
    id v5 = [WeakRetained attSiriSvcConn];
    int v8 = 136315650;
    id v9 = "-[CSAttSiriServiceClient _setupAttSiriSvcXpcConnection]_block_invoke";
    __int16 v10 = 2114;
    id v11 = v4;
    __int16 v12 = 1026;
    int v13 = [v5 processIdentifier];
    _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_DEFAULT, "%s Client Interruption Handler: %{public}@, client PID: %{public}d)", (uint8_t *)&v8, 0x1Cu);
  }
  if (WeakRetained)
  {
    char v6 = [WeakRetained attSiriSvcConn];

    if (v6)
    {
      id v7 = [WeakRetained attSiriSvcConn];
      [v7 invalidate];

      [WeakRetained setAttSiriSvcConn:0];
    }
  }
}

void __55__CSAttSiriServiceClient__setupAttSiriSvcXpcConnection__block_invoke_72(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)*MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    id v4 = [WeakRetained attSiriSvcConn];
    id v5 = [WeakRetained attSiriSvcConn];
    int v7 = 136315650;
    int v8 = "-[CSAttSiriServiceClient _setupAttSiriSvcXpcConnection]_block_invoke";
    __int16 v9 = 2114;
    __int16 v10 = v4;
    __int16 v11 = 1026;
    int v12 = [v5 processIdentifier];
    _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_DEFAULT, "%s Client Invalidation Handler: %{public}@, client PID: %{public}d exited", (uint8_t *)&v7, 0x1Cu);
  }
  if (WeakRetained)
  {
    char v6 = [WeakRetained attSiriSvcConn];

    if (v6) {
      [WeakRetained setAttSiriSvcConn:0];
    }
  }
}

- (void)dealloc
{
  [(CSAttSiriServiceClient *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CSAttSiriServiceClient;
  [(CSAttSiriServiceClient *)&v3 dealloc];
}

- (void)invalidate
{
  [(NSXPCConnection *)self->_attSiriSvcConn invalidate];
  attSiriSvcConn = self->_attSiriSvcConn;
  self->_attSiriSvcConn = 0;
}

- (void)gazeEstimates:(CGPoint)a3 landmarks:(id)a4
{
}

- (void)updateSiriOrbLocation:(CGRect)a3
{
}

- (void)gazeTrackerFaceTrackingMetaDataUpdate:(id)a3 atMachAbsTime:(unint64_t)a4
{
}

- (void)siriRequestProcessingCompleted
{
}

- (void)stopAttendingWithContext:(id)a3
{
}

- (void)startAttendingWithContext:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    int v7 = "-[CSAttSiriServiceClient startAttendingWithContext:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_DEFAULT, "%s ctx=%@", (uint8_t *)&v6, 0x16u);
  }
  [self->_remoteSvcProxy startAttendingWithContext:v4];
}

- (CSAttSiriServiceClient)init
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  CSLogInitIfNeeded();
  v10.receiver = self;
  v10.super_class = (Class)CSAttSiriServiceClient;
  objc_super v3 = [(CSAttSiriServiceClient *)&v10 init];
  id v4 = v3;
  if (v3
    && ([(CSAttSiriServiceClient *)v3 _setupAttSiriSvcXpcConnection],
        [(NSXPCConnection *)v4->_attSiriSvcConn synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_1081], uint64_t v5 = objc_claimAutoreleasedReturnValue(), remoteSvcProxy = v4->_remoteSvcProxy, v4->_remoteSvcProxy = (id)v5, remoteSvcProxy, !v4->_remoteSvcProxy))
  {
    __int16 v8 = *MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      int v12 = "-[CSAttSiriServiceClient init]";
      _os_log_error_impl(&dword_1C9338000, v8, OS_LOG_TYPE_ERROR, "%s _remoteSvcProxy is nil!", buf, 0xCu);
    }
    int v7 = 0;
  }
  else
  {
    int v7 = v4;
  }

  return v7;
}

void __30__CSAttSiriServiceClient_init__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  objc_super v3 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[CSAttSiriServiceClient init]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_error_impl(&dword_1C9338000, v3, OS_LOG_TYPE_ERROR, "%s ERR: Failed to get remote proxy object for AttSiriXPC: %@", (uint8_t *)&v4, 0x16u);
  }
}

@end