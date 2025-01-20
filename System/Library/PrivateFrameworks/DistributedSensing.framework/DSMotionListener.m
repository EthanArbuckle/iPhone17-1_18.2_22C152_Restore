@interface DSMotionListener
- (BOOL)isSubscribed;
- (BOOL)isTestMode;
- (DSClientMotionDataOptions)motionDataOptions;
- (DSMotionListener)initWithDelegate:(id)a3 queue:(id)a4;
- (DSMotionListenerDelegate)delegate;
- (DSMotionStateListenerProxy)sharedListener;
- (NSArray)activeProviders;
- (OS_dispatch_queue)clientQueue;
- (void)failedToStartListenerWithError:(id)a3;
- (void)receivedData:(id)a3 fromProvider:(id)a4;
- (void)requestMotionData;
- (void)setClientQueue:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsSubscribed:(BOOL)a3;
- (void)setIsTestMode:(BOOL)a3;
- (void)setMotionDataOptions:(id)a3;
- (void)setSharedListener:(id)a3;
- (void)startMotionDataListenerWithOptions:(id)a3;
- (void)startedListener;
- (void)stopMotionDataListener;
- (void)stoppedListener;
- (void)updateProviders:(id)a3;
@end

@implementation DSMotionListener

- (DSMotionListener)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)DSMotionListener;
  v8 = [(DSMotionListener *)&v19 init];
  if (v8)
  {
    if (v7)
    {
      v9 = (OS_dispatch_queue *)v7;
      clientQueue = v8->_clientQueue;
      v8->_clientQueue = v9;
    }
    else
    {
      v11 = (const char *)[@"com.apple.distributedsensing.clientQueue" UTF8String];
      clientQueue = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v12 = dispatch_queue_create(v11, clientQueue);
      v13 = v8->_clientQueue;
      v8->_clientQueue = (OS_dispatch_queue *)v12;
    }
    v8->_isSubscribed = 0;
    objc_storeWeak((id *)&v8->_delegate, v6);
    v14 = objc_alloc_init(DSClientMotionDataOptions);
    motionDataOptions = v8->_motionDataOptions;
    v8->_motionDataOptions = v14;

    v8->_isTestMode = 0;
    uint64_t v16 = +[DSMotionStateListenerProxy sharedInstance];
    sharedListener = v8->_sharedListener;
    v8->_sharedListener = (DSMotionStateListenerProxy *)v16;
  }
  return v8;
}

- (NSArray)activeProviders
{
  return [(DSListener *)self->_sharedListener activeProviders];
}

- (void)startMotionDataListenerWithOptions:(id)a3
{
  v22[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v21 = *MEMORY[0x263F08320];
    v22[0] = @"Unsupported feature";
    v9 = NSDictionary;
    v10 = (__CFString **)v22;
    v11 = &v21;
LABEL_14:
    dispatch_queue_t v12 = [v9 dictionaryWithObjects:v10 forKeys:v11 count:1];
    v13 = v8;
    uint64_t v14 = 5;
LABEL_15:
    v15 = [v13 errorWithDomain:@"DSErrorDomain" code:v14 userInfo:v12];

    [(DSMotionListener *)self failedToStartListenerWithError:v15];
    goto LABEL_16;
  }
  char v5 = [v4 deviceType];
  char v6 = [v4 dataSubType];
  if ((v5 & 2) != 0)
  {
    v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v19 = *MEMORY[0x263F08320];
    v20 = @"Unrelated devices not supported";
    v9 = NSDictionary;
    v10 = &v20;
    v11 = &v19;
    goto LABEL_14;
  }
  char v7 = v6;
  if (v5) {
    [(DSClientMotionDataOptions *)self->_motionDataOptions setDeviceType:[(DSClientMotionDataOptions *)self->_motionDataOptions deviceType] | 1];
  }
  if (v7) {
    [(DSClientMotionDataOptions *)self->_motionDataOptions setDataSubType:[(DSClientMotionDataOptions *)self->_motionDataOptions dataSubType] | 1];
  }
  if (![(DSClientMotionDataOptions *)self->_motionDataOptions dataSubType]
    || ![(DSClientMotionDataOptions *)self->_motionDataOptions deviceType])
  {
    uint64_t v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263F08320];
    v18 = @"Invalid options";
    dispatch_queue_t v12 = [NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    v13 = v16;
    uint64_t v14 = 2;
    goto LABEL_15;
  }
  if (self->_isTestMode) {
    [(DSListener *)self->_sharedListener setIsTestMode:1];
  }
  [(DSMotionStateListenerProxy *)self->_sharedListener startMotionStateListenerWithObserver:self];
LABEL_16:
}

- (void)stopMotionDataListener
{
  if ([(DSMotionListener *)self isSubscribed])
  {
    id v3 = [(DSMotionListener *)self sharedListener];
    [v3 stopMotionStateListenerWithObserver:self];
  }
}

- (void)requestMotionData
{
  if (![(DSMotionListener *)self isSubscribed])
  {
    id v3 = +[DSLogging sharedInstance];
    id v4 = [v3 dsLogger];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)char v5 = 0;
      _os_log_impl(&dword_223BD6000, v4, OS_LOG_TYPE_DEFAULT, "[DSMotionListener] can't request motion data before listener is started\n", v5, 2u);
    }
  }
  [(DSMotionStateListenerProxy *)self->_sharedListener requestMotionState];
}

- (void)failedToStartListenerWithError:(id)a3
{
  id v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__DSMotionListener_failedToStartListenerWithError___block_invoke;
  v7[3] = &unk_2646D5408;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(clientQueue, v7);
}

void __51__DSMotionListener_failedToStartListenerWithError___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 dsmotion:*(void *)(a1 + 32) didFailToStartListenerWithError:*(void *)(a1 + 40)];
  }
}

- (void)startedListener
{
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__DSMotionListener_startedListener__block_invoke;
  block[3] = &unk_2646D4E18;
  block[4] = self;
  dispatch_async(clientQueue, block);
}

void __35__DSMotionListener_startedListener__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsSubscribed:1];
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 dsmotionDidStartListener:*(void *)(a1 + 32)];
  }
}

- (void)receivedData:(id)a3 fromProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__DSMotionListener_receivedData_fromProvider___block_invoke;
  block[3] = &unk_2646D5238;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(clientQueue, block);
}

void __46__DSMotionListener_receivedData_fromProvider___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isSubscribed])
  {
    v2 = [*(id *)(a1 + 32) delegate];
    char v3 = objc_opt_respondsToSelector();

    if (v3)
    {
      id v6 = [*(id *)(a1 + 32) delegate];
      [v6 dsmotion:*(void *)(a1 + 32) didReceiveMotionData:*(void *)(a1 + 40) fromProvider:*(void *)(a1 + 48)];
    }
  }
  else
  {
    id v4 = +[DSLogging sharedInstance];
    char v5 = [v4 dsLogger];

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_223BD6000, v5, OS_LOG_TYPE_DEFAULT, "[DSMotionListner] recieved data when not subscribed\n", buf, 2u);
    }
  }
}

- (void)updateProviders:(id)a3
{
  id v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__DSMotionListener_updateProviders___block_invoke;
  v7[3] = &unk_2646D5408;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(clientQueue, v7);
}

void __36__DSMotionListener_updateProviders___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isSubscribed])
  {
    v2 = [*(id *)(a1 + 32) delegate];
    char v3 = objc_opt_respondsToSelector();

    if (v3)
    {
      id v6 = [*(id *)(a1 + 32) delegate];
      [v6 dsmotion:*(void *)(a1 + 32) didUpdateProviders:*(void *)(a1 + 40)];
    }
  }
  else
  {
    id v4 = +[DSLogging sharedInstance];
    char v5 = [v4 dsLogger];

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_223BD6000, v5, OS_LOG_TYPE_DEFAULT, "[DSMotionListner] recieved updated provider list when not subscribed\n", buf, 2u);
    }
  }
}

- (void)stoppedListener
{
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__DSMotionListener_stoppedListener__block_invoke;
  block[3] = &unk_2646D4E18;
  block[4] = self;
  dispatch_async(clientQueue, block);
}

void __35__DSMotionListener_stoppedListener__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsSubscribed:0];
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 dsmotionDidStopListener:*(void *)(a1 + 32)];
  }
}

- (BOOL)isTestMode
{
  return self->_isTestMode;
}

- (void)setIsTestMode:(BOOL)a3
{
  self->_isTestMode = a3;
}

- (DSClientMotionDataOptions)motionDataOptions
{
  return self->_motionDataOptions;
}

- (void)setMotionDataOptions:(id)a3
{
}

- (DSMotionListenerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DSMotionListenerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)setClientQueue:(id)a3
{
}

- (DSMotionStateListenerProxy)sharedListener
{
  return self->_sharedListener;
}

- (void)setSharedListener:(id)a3
{
}

- (BOOL)isSubscribed
{
  return self->_isSubscribed;
}

- (void)setIsSubscribed:(BOOL)a3
{
  self->_isSubscribed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedListener, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_motionDataOptions, 0);
}

@end