@interface AVAirMessageDispatcher
+ (BOOL)_isDispatcherEnabled;
+ (id)shared;
- (AVAirMessageDispatcher)init;
- (AVAirMessageDispatcherClientDelegate)delegate;
- (AVAirTransport)channel;
- (AVBonjourServiceClient)bonjourServiceClient;
- (BOOL)haveAirPlayService;
- (NSNetService)currentNetService;
- (NSString)description;
- (void)airTransport:(id)a3 didReceiveObject:(id)a4;
- (void)airTransportInputDidClose:(id)a3;
- (void)airTransportOutputDidOpen:(id)a3;
- (void)didConnectToBonjourService:(id)a3 channel:(id)a4;
- (void)sendMessage:(id)a3 completion:(id)a4;
- (void)setChannel:(id)a3;
- (void)setCurrentNetService:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation AVAirMessageDispatcher

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bonjourServiceClient, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_currentNetService, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (AVBonjourServiceClient)bonjourServiceClient
{
  return self->_bonjourServiceClient;
}

- (void)setChannel:(id)a3
{
}

- (AVAirTransport)channel
{
  return self->_channel;
}

- (void)setCurrentNetService:(id)a3
{
}

- (NSNetService)currentNetService
{
  return self->_currentNetService;
}

- (void)setDelegate:(id)a3
{
}

- (AVAirMessageDispatcherClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AVAirMessageDispatcherClientDelegate *)WeakRetained;
}

- (void)airTransport:(id)a3 didReceiveObject:(id)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v4 = _avairlog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    v6 = "-[AVAirMessageDispatcher airTransport:didReceiveObject:]";
    _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "%s (call unexpected! message will be dropped)", (uint8_t *)&v5, 0xCu);
  }
}

- (void)airTransportInputDidClose:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = _avairlog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    int v5 = "-[AVAirMessageDispatcher airTransportInputDidClose:]";
    _os_log_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
}

- (void)airTransportOutputDidOpen:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v4 = _avairlog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    v8 = "-[AVAirMessageDispatcher airTransportOutputDidOpen:]";
    _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v7, 0xCu);
  }

  int v5 = [(AVAirMessageDispatcher *)self delegate];
  [v5 didChangeTargetForAirMessageDispatcher:self];

  uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:@"AVAirMessageDispatcherDidChangeTargetNotification" object:self];
}

- (void)didConnectToBonjourService:(id)a3 channel:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v8 = _avairlog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [(AVAirMessageDispatcher *)self delegate];
    int v13 = 136315650;
    v14 = "-[AVAirMessageDispatcher didConnectToBonjourService:channel:]";
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_1B05B7000, v8, OS_LOG_TYPE_DEFAULT, "%s channel = %@; delegate = %@", (uint8_t *)&v13, 0x20u);
  }
  [(AVAirMessageDispatcher *)self setCurrentNetService:v7];

  v10 = +[AVDataValueTransformer messageTransformerWithClass:objc_opt_class()];
  [v6 setStreamDataTransformer:v10];

  v11 = [v6 delegate];

  if (v11)
  {
    v12 = _avairlog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315138;
      v14 = "-[AVAirMessageDispatcher didConnectToBonjourService:channel:]";
      _os_log_impl(&dword_1B05B7000, v12, OS_LOG_TYPE_DEFAULT, "%s the channel.delegate is already set", (uint8_t *)&v13, 0xCu);
    }
  }
  [v6 setDelegate:self];
  [(AVAirMessageDispatcher *)self setChannel:v6];
  [v6 open];
}

- (void)sendMessage:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(void, void, void))[a4 copy];
  v8 = [(AVAirMessageDispatcher *)self channel];

  if (v8)
  {
    uint64_t v9 = [(AVAirMessageDispatcher *)self channel];
    char v10 = [v9 isReadyToSend];

    if (v10)
    {
      v11 = [v6 dictionaryRepresentation];
      v12 = _avairlog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v19 = "-[AVAirMessageDispatcher sendMessage:completion:]";
        __int16 v20 = 2112;
        v21 = v11;
        _os_log_impl(&dword_1B05B7000, v12, OS_LOG_TYPE_DEFAULT, "%s telling channel to sendObject (%@)", buf, 0x16u);
      }

      int v13 = [(AVAirMessageDispatcher *)self channel];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __49__AVAirMessageDispatcher_sendMessage_completion___block_invoke;
      v16[3] = &unk_1E5FC2730;
      __int16 v17 = v7;
      [v13 sendObject:v6 receiveResponse:v16];
    }
    else
    {
      __int16 v15 = _avairlog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v19 = "-[AVAirMessageDispatcher sendMessage:completion:]";
        _os_log_impl(&dword_1B05B7000, v15, OS_LOG_TYPE_DEFAULT, "%s cannot send message yet; please wait for output stream to finish opening!",
          buf,
          0xCu);
      }

      v7[2](v7, 0, -1903);
    }
  }
  else
  {
    v14 = _avairlog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v19 = "-[AVAirMessageDispatcher sendMessage:completion:]";
      _os_log_impl(&dword_1B05B7000, v14, OS_LOG_TYPE_DEFAULT, "%s cannot send message; we don't have a channel to the AirPlay receiver (if there is one).",
        buf,
        0xCu);
    }

    v7[2](v7, 0, -1901);
  }
}

void __49__AVAirMessageDispatcher_sendMessage_completion___block_invoke(uint64_t a1, void *a2, int a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = _avairlog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315650;
    v12 = "-[AVAirMessageDispatcher sendMessage:completion:]_block_invoke";
    __int16 v13 = 1024;
    int v14 = a3;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_1B05B7000, v6, OS_LOG_TYPE_DEFAULT, "%s sendObject completed with status = %d; response message: %@",
      (uint8_t *)&v11,
      0x1Cu);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v5;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;
  if ([v8 isIncomplete])
  {
    uint64_t v9 = 0;
  }
  else
  {
    char v10 = [v8 airMessage];
    uint64_t v9 = v10;
    if (v10) {
      [v10 status];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)haveAirPlayService
{
  v2 = [(AVAirMessageDispatcher *)self channel];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSString)description
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v5 = NSString;
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    id v9 = objc_loadWeakRetained((id *)p_delegate);
    char v10 = [v5 stringWithFormat:@"<%@ %p>", v8, v9];
  }
  else
  {
    char v10 = 0;
  }

  int v11 = NSString;
  v12 = (objc_class *)objc_opt_class();
  __int16 v13 = NSStringFromClass(v12);
  int v14 = [(AVAirMessageDispatcher *)self bonjourServiceClient];
  __int16 v15 = [(AVAirMessageDispatcher *)self channel];
  objc_msgSend(v11, "stringWithFormat:", @"<%@ %p: serviceClient=%@, channel=%@; delegate=%@>",
    v13,
    self,
    v14,
    v15,
  id v16 = v10);

  return (NSString *)v16;
}

- (AVAirMessageDispatcher)init
{
  if (+[AVAirMessageDispatcher _isDispatcherEnabled])
  {
    v8.receiver = self;
    v8.super_class = (Class)AVAirMessageDispatcher;
    BOOL v3 = [(AVAirMessageDispatcher *)&v8 init];
    if (v3)
    {
      int v4 = [[AVBonjourServiceClient alloc] initWithNetServiceType:@"_avairtvui._tcp."];
      bonjourServiceClient = v3->_bonjourServiceClient;
      v3->_bonjourServiceClient = v4;

      [(AVBonjourServiceClient *)v3->_bonjourServiceClient setDelegate:v3];
      [(AVBonjourServiceClient *)v3->_bonjourServiceClient beginDiscovery];
    }
    self = v3;
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)shared
{
  if (shared_onceToken != -1) {
    dispatch_once(&shared_onceToken, &__block_literal_global_5787);
  }
  v2 = (void *)shared__shared;

  return v2;
}

uint64_t __32__AVAirMessageDispatcher_shared__block_invoke()
{
  v0 = objc_alloc_init(AVAirMessageDispatcher);
  v1 = (void *)shared__shared;
  shared__shared = (uint64_t)v0;

  +[AVAirMessageParts registerClass:objc_opt_class() forMessageVersion:@"AVKitAir/1"];
  uint64_t v2 = objc_opt_class();

  return +[AVAirMessageParts registerClass:v2 forMessageVersion:@"AVKitAirResponse/1"];
}

+ (BOOL)_isDispatcherEnabled
{
  return +[AVAirMessage isAirMessagingEnabled];
}

@end