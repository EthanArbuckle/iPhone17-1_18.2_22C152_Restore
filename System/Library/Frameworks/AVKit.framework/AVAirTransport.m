@interface AVAirTransport
+ (BOOL)_isRunningOnAirChannelQueue;
+ (NSRunLoop)eventRunLoop;
+ (NSThread)eventThread;
+ (id)airTransportQueue;
+ (id)channelWithInput:(id)a3 output:(id)a4;
+ (void)__performBlock:(id)a3;
+ (void)performAsync:(id)a3;
+ (void)performSync:(id)a3;
+ (void)startEventThreadIfNecessary;
- (AVAirTransportDelegate)delegate;
- (AVAirTransportTransformationProtocol)streamDataTransformer;
- (BOOL)isReadyToSend;
- (NSMutableArray)receiveResponseBlocks;
- (id)_initPrivate;
- (id)description;
- (id)requestCompletions;
- (int64_t)_writeData:(id)a3;
- (void)close;
- (void)dealloc;
- (void)performOnAirChannelQueueSync:(id)a3;
- (void)sendObject:(id)a3 receiveResponse:(id)a4;
- (void)sendResponse:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setStreamDataTransformer:(id)a3;
- (void)terminatePendingRequests;
- (void)writeData:(id)a3;
- (void)writeMore;
@end

@implementation AVAirTransport

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receiveResponseBlocks, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_streamDataTransformer, 0);
  objc_storeStrong((id *)&self->_requestCompletions, 0);
  objc_storeStrong((id *)&self->_leftoverInputData, 0);

  objc_storeStrong((id *)&self->_outputQueue, 0);
}

- (NSMutableArray)receiveResponseBlocks
{
  return self->_receiveResponseBlocks;
}

- (void)setDelegate:(id)a3
{
}

- (AVAirTransportDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AVAirTransportDelegate *)WeakRetained;
}

- (void)setStreamDataTransformer:(id)a3
{
}

- (AVAirTransportTransformationProtocol)streamDataTransformer
{
  return self->_streamDataTransformer;
}

- (void)sendResponse:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = [(AVAirTransport *)self streamDataTransformer];
    v6 = [v5 dataForMessage:v4];

    if (v6)
    {
      if ([v6 length])
      {
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __31__AVAirTransport_sendResponse___block_invoke;
        v8[3] = &unk_1E5FC3D18;
        v8[4] = self;
        id v9 = v6;
        +[AVAirTransport performSync:v8];
      }
    }
    else
    {
      v7 = _avairlog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v11 = "-[AVAirTransport sendResponse:]";
        __int16 v12 = 2112;
        id v13 = v4;
        _os_log_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_DEFAULT, "%s failed to transform response object (%@)", buf, 0x16u);
      }
    }
  }
}

uint64_t __31__AVAirTransport_sendResponse___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) writeData:*(void *)(a1 + 40)];
}

- (void)sendObject:(id)a3 receiveResponse:(id)a4
{
  id v6 = a3;
  v7 = (void *)[a4 copy];
  [(AVAirTransport *)self open];
  v8 = +[AVAirTransport airTransportQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__AVAirTransport_sendObject_receiveResponse___block_invoke;
  block[3] = &unk_1E5FC4670;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __45__AVAirTransport_sendObject_receiveResponse___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) streamDataTransformer];
  v3 = [v2 dataForMessage:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) receiveResponseBlocks];
    v5 = (void *)MEMORY[0x1B3E963E0](*(void *)(a1 + 48));
    [v4 addObject:v5];

    id v6 = _avairlog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v13 = "-[AVAirTransport sendObject:receiveResponse:]_block_invoke";
      __int16 v14 = 2048;
      uint64_t v15 = [v3 length];
      _os_log_impl(&dword_1B05B7000, v6, OS_LOG_TYPE_DEFAULT, "%s sending %ld bytes...", buf, 0x16u);
    }

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __45__AVAirTransport_sendObject_receiveResponse___block_invoke_133;
    v10[3] = &unk_1E5FC3D18;
    v10[4] = *(void *)(a1 + 32);
    id v11 = v3;
    +[AVAirTransport performSync:v10];
    v7 = _avairlog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v13 = "-[AVAirTransport sendObject:receiveResponse:]_block_invoke_2";
      _os_log_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_DEFAULT, "%s ...succeeded, now waiting for/reading the response...", buf, 0xCu);
    }
  }
  else
  {
    v8 = _avairlog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136315394;
      id v13 = "-[AVAirTransport sendObject:receiveResponse:]_block_invoke";
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      _os_log_impl(&dword_1B05B7000, v8, OS_LOG_TYPE_DEFAULT, "%s failed to transform message object (%@)", buf, 0x16u);
    }
  }
}

uint64_t __45__AVAirTransport_sendObject_receiveResponse___block_invoke_133(uint64_t a1)
{
  return [*(id *)(a1 + 32) writeData:*(void *)(a1 + 40)];
}

- (void)performOnAirChannelQueueSync:(id)a3
{
  v5 = (void (**)(void))a3;
  if (+[AVAirTransport _isRunningOnAirChannelQueue])
  {
    v5[2]();
  }
  else
  {
    v3 = (void *)[v5 copy];

    id v4 = +[AVAirTransport airTransportQueue];
    dispatch_sync(v4, v3);

    v5 = (void (**)(void))v3;
  }
}

- (BOOL)isReadyToSend
{
  return 0;
}

- (void)writeData:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = _avairlog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "-[AVAirTransport writeData:]";
    __int16 v9 = 2048;
    uint64_t v10 = [v4 length];
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s writing %ld bytes...", buf, 0x16u);
  }

  [(NSMutableArray *)self->_outputQueue addObject:v4];
  if ([(AVAirTransport *)self canWrite])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __28__AVAirTransport_writeData___block_invoke;
    v6[3] = &unk_1E5FC4698;
    v6[4] = self;
    +[AVAirTransport performAsync:v6];
  }
}

uint64_t __28__AVAirTransport_writeData___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) writeMore];
}

- (void)writeMore
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  if ([(AVAirTransport *)self canWrite])
  {
    *(void *)&long long v3 = 136315138;
    long long v12 = v3;
    do
    {
      if (![(NSMutableArray *)self->_outputQueue count]) {
        return;
      }
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      id v4 = [(NSMutableArray *)self->_outputQueue firstObject];
      if (v4)
      {
        uint64_t v5 = [(AVAirTransport *)self _writeData:v4];
        id v6 = _avairlog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          __int16 v14 = "-[AVAirTransport writeMore]";
          __int16 v15 = 2048;
          uint64_t v16 = v5;
          _os_log_impl(&dword_1B05B7000, v6, OS_LOG_TYPE_DEFAULT, "%s wrote %ld bytes", buf, 0x16u);
        }

        if (v5 == [v4 length])
        {
          [(NSMutableArray *)self->_outputQueue removeObject:v4];
        }
        else
        {
          if (v5 < 1)
          {
            v8 = _avairlog();
            BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
            if (v5 < 0)
            {
              if (v9)
              {
                *(_DWORD *)buf = v12;
                __int16 v14 = "-[AVAirTransport writeMore]";
                uint64_t v10 = v8;
                uint64_t v11 = "%s write error occurred";
LABEL_16:
                _os_log_impl(&dword_1B05B7000, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 0xCu);
              }
            }
            else if (v9)
            {
              *(_DWORD *)buf = v12;
              __int16 v14 = "-[AVAirTransport writeMore]";
              uint64_t v10 = v8;
              uint64_t v11 = "%s write error: stream closed";
              goto LABEL_16;
            }

            goto LABEL_18;
          }
          v7 = objc_msgSend(v4, "subdataWithRange:", v5, objc_msgSend(v4, "length") - v5);
          [(NSMutableArray *)self->_outputQueue setObject:v7 atIndexedSubscript:0];
        }
      }
LABEL_18:
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    }
    while ([(AVAirTransport *)self canWrite]);
  }
}

- (int64_t)_writeData:(id)a3
{
  return -1;
}

- (void)terminatePendingRequests
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __42__AVAirTransport_terminatePendingRequests__block_invoke;
  v2[3] = &unk_1E5FC4698;
  v2[4] = self;
  [(AVAirTransport *)self performOnAirChannelQueueSync:v2];
}

void __42__AVAirTransport_terminatePendingRequests__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [*(id *)(a1 + 32) receiveResponseBlocks];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        v8 = _avairlog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          __int16 v15 = "-[AVAirTransport terminatePendingRequests]_block_invoke";
          _os_log_impl(&dword_1B05B7000, v8, OS_LOG_TYPE_DEFAULT, "%s response never received", buf, 0xCu);
        }

        (*(void (**)(uint64_t, void, uint64_t))(v7 + 16))(v7, 0, -3);
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v16 count:16];
    }
    while (v4);
  }

  BOOL v9 = [*(id *)(a1 + 32) receiveResponseBlocks];
  [v9 removeAllObjects];
}

- (id)requestCompletions
{
  return self->_requestCompletions;
}

- (id)description
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    uint64_t v5 = NSString;
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    uint64_t v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    id v9 = objc_loadWeakRetained((id *)p_delegate);
    long long v10 = [v5 stringWithFormat:@"<%@ %p>", v8, v9];
  }
  else
  {
    long long v10 = @"nil";
  }

  long long v11 = NSString;
  long long v12 = (objc_class *)objc_opt_class();
  long long v13 = NSStringFromClass(v12);
  __int16 v14 = [v11 stringWithFormat:@"<%@ %p: delegate=%@>", v13, self, v10];

  return v14;
}

- (void)close
{
  [(AVAirTransport *)self invalidate];

  [(AVAirTransport *)self terminatePendingRequests];
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [(AVAirTransport *)self invalidate];
  uint64_t v3 = _avairlog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v6 = "-[AVAirTransport dealloc]";
    _os_log_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_DEFAULT, "%s bye bye", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)AVAirTransport;
  [(AVAirTransport *)&v4 dealloc];
}

- (id)_initPrivate
{
  v8.receiver = self;
  v8.super_class = (Class)AVAirTransport;
  v2 = [(AVAirTransport *)&v8 init];
  if (v2)
  {
    uint64_t v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    outputQueue = v2->_outputQueue;
    v2->_outputQueue = v3;

    uint64_t v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    requestCompletions = v2->_requestCompletions;
    v2->_requestCompletions = v5;
  }
  return v2;
}

+ (BOOL)_isRunningOnAirChannelQueue
{
  return dispatch_get_specific((const void *)AirChannelQueueSpecificKey) == (void *)AirChannelQueueIsCurrentValue;
}

+ (id)airTransportQueue
{
  if (airTransportQueue_onceToken != -1) {
    dispatch_once(&airTransportQueue_onceToken, &__block_literal_global_115);
  }
  v2 = (void *)airTransportQueue__queue;

  return v2;
}

void __35__AVAirTransport_airTransportQueue__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_BACKGROUND, 0);

  dispatch_queue_t v1 = dispatch_queue_create("com.apple.avkit.AirChannel", attr);
  v2 = (void *)airTransportQueue__queue;
  airTransportQueue__queue = (uint64_t)v1;

  dispatch_queue_set_specific((dispatch_queue_t)airTransportQueue__queue, (const void *)AirChannelQueueSpecificKey, (void *)AirChannelQueueIsCurrentValue, 0);
}

+ (NSRunLoop)eventRunLoop
{
  [a1 startEventThreadIfNecessary];
  v2 = (void *)_eventRunLoop;

  return (NSRunLoop *)v2;
}

+ (NSThread)eventThread
{
  return (NSThread *)(id)_eventThread;
}

+ (void)performAsync:(id)a3
{
  id v6 = (id)[a3 copy];
  uint64_t v4 = _eventThread;
  uint64_t v5 = (void *)MEMORY[0x1B3E963E0]();
  [a1 performSelector:sel___performBlock_ onThread:v4 withObject:v5 waitUntilDone:0];
}

+ (void)performSync:(id)a3
{
  id v6 = (void (**)(void))a3;
  if (isRunningEventThread())
  {
    v6[2]();
  }
  else
  {
    uint64_t v4 = _eventThread;
    uint64_t v5 = MEMORY[0x1B3E963E0](v6);

    [a1 performSelector:sel___performBlock_ onThread:v4 withObject:v5 waitUntilDone:1];
    id v6 = (void (**)(void))v5;
  }
}

+ (void)__performBlock:(id)a3
{
}

+ (void)startEventThreadIfNecessary
{
  if (startEventThreadIfNecessary_onceToken != -1) {
    dispatch_once(&startEventThreadIfNecessary_onceToken, &__block_literal_global_5632);
  }
}

uint64_t __45__AVAirTransport_startEventThreadIfNecessary__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F29060]) initWithBlock:&__block_literal_global_98];
  dispatch_queue_t v1 = (void *)_eventThread;
  _eventThread = v0;

  [(id)_eventThread setName:@"com.apple.avkit.AirChannel"];
  [(id)_eventThread start];

  return +[AVAirTransport performSync:&__block_literal_global_111];
}

uint64_t __45__AVAirTransport_startEventThreadIfNecessary__block_invoke_109()
{
  uint64_t v0 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  uint64_t v1 = _eventRunLoop;
  _eventRunLoop = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

void __45__AVAirTransport_startEventThreadIfNecessary__block_invoke_2()
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x1B3E96150]();
  uint64_t v1 = _avairlog();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    long long v10 = "+[AVAirTransport startEventThreadIfNecessary]_block_invoke_2";
    _os_log_impl(&dword_1B05B7000, v1, OS_LOG_TYPE_DEFAULT, "%s Starting event thread..", (uint8_t *)&v9, 0xCu);
  }

  v2 = (void *)MEMORY[0x1E4F1CB00];
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] distantFuture];
  [v3 timeIntervalSinceNow];
  uint64_t v4 = objc_msgSend(v2, "timerWithTimeInterval:repeats:block:", 1, &__block_literal_global_104);

  uint64_t v5 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  [v5 addTimer:v4 forMode:*MEMORY[0x1E4F1C4B0]];

  id v6 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  [v6 run];

  uint64_t v7 = _avairlog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    long long v10 = "+[AVAirTransport startEventThreadIfNecessary]_block_invoke_2";
    _os_log_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_DEFAULT, "%s Ending event thread..", (uint8_t *)&v9, 0xCu);
  }

  objc_super v8 = (void *)_eventThread;
  _eventThread = 0;
}

+ (id)channelWithInput:(id)a3 output:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [[AVAirTransportStreams alloc] initWithInput:v6 output:v5];

  return v7;
}

@end