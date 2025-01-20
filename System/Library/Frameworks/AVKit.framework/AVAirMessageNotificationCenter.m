@interface AVAirMessageNotificationCenter
+ (BOOL)_isNotificationCenterEnabled;
+ (BOOL)isPrepared;
+ (id)shared;
+ (void)prepare;
- (AVAirMessageNotificationCenter)init;
- (AVAirMessageNotificationCenterDelegate)delegate;
- (AVBonjourService)mainService;
- (AVPlayerItem)nowPlayingPlayerItem;
- (NSMutableSet)activeChannels;
- (OS_dispatch_queue)queue;
- (id)_initPrivate;
- (id)bonjourServiceAdditionalTXTRecordInfo:(id)a3;
- (id)playerItemForIdentifier:(id)a3;
- (void)airTransport:(id)a3 didReceiveObject:(id)a4;
- (void)airTransportInputDidClose:(id)a3;
- (void)bonjourService:(id)a3 didAcceptConnectionChannel:(id)a4;
- (void)bonjourService:(id)a3 didCloseChannel:(id)a4;
- (void)dealloc;
- (void)handleCommandMessage:(id)a3 completion:(id)a4;
- (void)setActiveChannels:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNowPlayingPlayerItem:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation AVAirMessageNotificationCenter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeChannels, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_nowPlayingPlayerItem, 0);
  objc_storeStrong((id *)&self->_mainService, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setActiveChannels:(id)a3
{
}

- (NSMutableSet)activeChannels
{
  return self->_activeChannels;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setNowPlayingPlayerItem:(id)a3
{
}

- (AVPlayerItem)nowPlayingPlayerItem
{
  return self->_nowPlayingPlayerItem;
}

- (AVBonjourService)mainService
{
  return self->_mainService;
}

- (void)setDelegate:(id)a3
{
}

- (AVAirMessageNotificationCenterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AVAirMessageNotificationCenterDelegate *)WeakRetained;
}

- (void)airTransportInputDidClose:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(AVAirMessageNotificationCenter *)self activeChannels];
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    v7 = _avairlog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315394;
      v10 = "-[AVAirMessageNotificationCenter airTransportInputDidClose:]";
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_DEFAULT, "%s Removing channel from active list (%@)", (uint8_t *)&v9, 0x16u);
    }

    v8 = [(AVAirMessageNotificationCenter *)self activeChannels];
    [v8 removeObject:v4];
  }
}

- (void)airTransport:(id)a3 didReceiveObject:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v6 = a3;
  id v7 = a4;
  v8 = [(AVAirMessageNotificationCenter *)self activeChannels];
  int v9 = [v8 containsObject:v6];

  if (!v9)
  {
    v10 = _avairlog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[AVAirMessageNotificationCenter airTransport:didReceiveObject:]";
      __int16 v22 = 2112;
      v23 = v6;
      _os_log_impl(&dword_1B05B7000, v10, OS_LOG_TYPE_DEFAULT, "%s Unexpectedly received object from inactive channel (%@)", buf, 0x16u);
    }
    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = v7;
    __int16 v11 = [v10 airMessage];
    if (v11)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __64__AVAirMessageNotificationCenter_airTransport_didReceiveObject___block_invoke;
        v18[3] = &unk_1E5FC2090;
        v19 = v6;
        [(AVAirMessageNotificationCenter *)self handleCommandMessage:v11 completion:v18];
        id v12 = v19;
LABEL_17:

LABEL_18:
        goto LABEL_19;
      }
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      id v12 = _avairlog();
      BOOL v17 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (isKindOfClass)
      {
        if (!v17) {
          goto LABEL_17;
        }
        *(_DWORD *)buf = 136315138;
        v21 = "-[AVAirMessageNotificationCenter airTransport:didReceiveObject:]";
        uint64_t v13 = "%s unexpectedly received a response -- expected a message only";
      }
      else
      {
        if (!v17) {
          goto LABEL_17;
        }
        *(_DWORD *)buf = 136315138;
        v21 = "-[AVAirMessageNotificationCenter airTransport:didReceiveObject:]";
        uint64_t v13 = "%s I just received something, I know not what";
      }
      v14 = v12;
      uint32_t v15 = 12;
    }
    else
    {
      id v12 = _avairlog();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      *(_DWORD *)buf = 136315394;
      v21 = "-[AVAirMessageNotificationCenter airTransport:didReceiveObject:]";
      __int16 v22 = 2114;
      v23 = v10;
      uint64_t v13 = "%s unable to receive message : %{public}@";
      v14 = v12;
      uint32_t v15 = 22;
    }
    _os_log_impl(&dword_1B05B7000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
    goto LABEL_17;
  }
LABEL_19:
}

void __64__AVAirMessageNotificationCenter_airTransport_didReceiveObject___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = _avairlog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[AVAirMessageNotificationCenter airTransport:didReceiveObject:]_block_invoke";
    __int16 v8 = 1024;
    int v9 = a2;
    _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "%s responding with result %d", (uint8_t *)&v6, 0x12u);
  }

  v5 = [[AVAirMessageResponse alloc] initWithStatus:a2 localizedDescription:0];
  [*(id *)(a1 + 32) sendResponse:v5];
}

- (void)bonjourService:(id)a3 didCloseChannel:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = _avairlog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    int v9 = "-[AVAirMessageNotificationCenter bonjourService:didCloseChannel:]";
    __int16 v10 = 2114;
    id v11 = v5;
    _os_log_impl(&dword_1B05B7000, v6, OS_LOG_TYPE_DEFAULT, "%s %{public}@", (uint8_t *)&v8, 0x16u);
  }

  [v5 setDelegate:0];
  [v5 close];
  id v7 = [(AVAirMessageNotificationCenter *)self activeChannels];
  [v7 removeObject:v5];
}

- (id)bonjourServiceAdditionalTXTRecordInfo:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(AVAirMessageNotificationCenter *)self delegate];
  id v5 = [v4 airTrafficControllerCurrentItemIdentifier:self];

  if ([v5 length])
  {
    int v8 = @"currentItemIdentifier";
    v9[0] = v5;
    int v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (void)bonjourService:(id)a3 didAcceptConnectionChannel:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = _avairlog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(AVAirMessageNotificationCenter *)self activeChannels];
    int v10 = 136315650;
    id v11 = "-[AVAirMessageNotificationCenter bonjourService:didAcceptConnectionChannel:]";
    __int16 v12 = 2112;
    id v13 = v5;
    __int16 v14 = 2112;
    uint32_t v15 = v7;
    _os_log_impl(&dword_1B05B7000, v6, OS_LOG_TYPE_DEFAULT, "%s new channel %@; activeChannels has %@",
      (uint8_t *)&v10,
      0x20u);
  }
  int v8 = [(AVAirMessageNotificationCenter *)self activeChannels];
  [v8 addObject:v5];

  int v9 = +[AVDataValueTransformer messageTransformerWithClass:objc_opt_class()];
  [v5 setStreamDataTransformer:v9];

  [v5 setDelegate:self];
  [v5 open];
}

- (void)handleCommandMessage:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(void, void, void))[a4 copy];
  int v8 = [(AVAirMessageNotificationCenter *)self delegate];

  if (v8)
  {
    int v9 = _avairlog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315394;
      id v13 = "-[AVAirMessageNotificationCenter handleCommandMessage:completion:]";
      __int16 v14 = 2114;
      id v15 = v6;
      _os_log_impl(&dword_1B05B7000, v9, OS_LOG_TYPE_DEFAULT, "%s received message %{public}@", (uint8_t *)&v12, 0x16u);
    }

    int v10 = [v6 type];
    if (v10 <= 209)
    {
      if (v10 != 100 && v10 != 200) {
        goto LABEL_13;
      }
    }
    else if (v10 != 210 && v10 != 400 && v10 != 300)
    {
LABEL_13:
      v7[2](v7, -1999, 0);
      goto LABEL_14;
    }
    id v11 = [(AVAirMessageNotificationCenter *)self delegate];
    [v11 airTrafficController:self didReceiveMessage:v6 completion:v7];
  }
  else
  {
    v7[2](v7, -1, 0);
  }
LABEL_14:
}

- (id)playerItemForIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(AVAirMessageNotificationCenter *)self nowPlayingPlayerItem];
    id v6 = v5;
    if (v5)
    {
      id v7 = [v5 avkitACMIdentifier];
      if ([v7 isEqualToString:v4]) {
        id v8 = v6;
      }
      else {
        id v8 = 0;
      }
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)stop
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_started)
  {
    v3 = [(AVAirMessageNotificationCenter *)self activeChannels];
    id v4 = (void *)[v3 copy];

    id v5 = [MEMORY[0x1E4F1CA80] set];
    [(AVAirMessageNotificationCenter *)self setActiveChannels:v5];

    self->_started = 0;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "invalidate", (void)v11);
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)start
{
  if (!self->_started) {
    self->_started = 1;
  }
}

- (void)dealloc
{
  [(AVAirMessageNotificationCenter *)self stop];
  [(AVBonjourService *)self->_mainService stop];
  v3.receiver = self;
  v3.super_class = (Class)AVAirMessageNotificationCenter;
  [(AVAirMessageNotificationCenter *)&v3 dealloc];
}

- (id)_initPrivate
{
  v8.receiver = self;
  v8.super_class = (Class)AVAirMessageNotificationCenter;
  v2 = [(AVAirMessageNotificationCenter *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.avkit.AirMessageNotificationCenter", MEMORY[0x1E4F14430]);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
    activeChannels = v2->_activeChannels;
    v2->_activeChannels = (NSMutableSet *)v5;

    [(AVBonjourService *)v2->_mainService setDelegate:v2];
    +[AVAirMessageParts registerClass:objc_opt_class() forMessageVersion:@"AVKitAir/1"];
    +[AVAirMessageParts registerClass:objc_opt_class() forMessageVersion:@"AVKitAirResponse/1"];
    [(AVBonjourService *)v2->_mainService start];
  }
  return v2;
}

- (AVAirMessageNotificationCenter)init
{
  return 0;
}

+ (id)shared
{
  return (id)_shared;
}

+ (BOOL)isPrepared
{
  return _shared != 0;
}

+ (void)prepare
{
  if (prepare_onceToken != -1) {
    dispatch_once(&prepare_onceToken, &__block_literal_global_1572);
  }
}

uint64_t __41__AVAirMessageNotificationCenter_prepare__block_invoke()
{
  uint64_t result = +[AVAirMessageNotificationCenter _isNotificationCenterEnabled];
  if (result)
  {
    id v1 = [[AVAirMessageNotificationCenter alloc] _initPrivate];
    uint64_t v2 = _shared;
    _shared = (uint64_t)v1;
    return MEMORY[0x1F41817F8](v1, v2);
  }
  return result;
}

+ (BOOL)_isNotificationCenterEnabled
{
  return 0;
}

@end