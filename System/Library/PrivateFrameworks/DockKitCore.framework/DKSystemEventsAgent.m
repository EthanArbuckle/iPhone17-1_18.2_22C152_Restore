@interface DKSystemEventsAgent
- (DKSystemEventsAgent)init;
- (OS_dispatch_queue)workQueue;
- (void)cameraShutterModeChanged:(unsigned __int8)a3;
- (void)dealloc;
- (void)deregisterForSystemEvents;
- (void)deregisterForSystemEvents:(id)a3;
- (void)handleSystemEvent:(id)a3 callback:(id)a4;
- (void)panoramaCaptureDirectionChanged:(unsigned __int8)a3;
- (void)registerForSystemEvents:(id)a3;
- (void)registerForSystemEvents:(id)a3 forConnectedEvents:(id)a4;
- (void)setWorkQueue:(id)a3;
- (void)startCaptureIfNeeded:(unsigned __int8)a3 orientation:(unsigned __int8)a4 finished:(id)a5;
- (void)stopCaptureIfNeeded:(unsigned __int8)a3;
@end

@implementation DKSystemEventsAgent

- (DKSystemEventsAgent)init
{
  v9.receiver = self;
  v9.super_class = (Class)DKSystemEventsAgent;
  v2 = [(DKSystemEventsAgent *)&v9 init];
  if (v2)
  {
    v3 = objc_alloc_init(SystemEventsAgent);
    agent = v2->_agent;
    v2->_agent = v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.systemEventsAgent", v5);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

- (void)registerForSystemEvents:(id)a3 forConnectedEvents:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  agent = self->_agent;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __66__DKSystemEventsAgent_registerForSystemEvents_forConnectedEvents___block_invoke;
  v13[3] = &unk_2652F86C0;
  v13[4] = self;
  id v14 = v6;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __66__DKSystemEventsAgent_registerForSystemEvents_forConnectedEvents___block_invoke_2;
  v11[3] = &unk_2652F86E8;
  id v12 = v7;
  id v9 = v7;
  id v10 = v6;
  [(SystemEventsAgent *)agent registerWithCallback:v13 connectedCallback:v11 completionHandler:&__block_literal_global_0];
}

uint64_t __66__DKSystemEventsAgent_registerForSystemEvents_forConnectedEvents___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleSystemEvent:a2 callback:*(void *)(a1 + 40)];
}

uint64_t __66__DKSystemEventsAgent_registerForSystemEvents_forConnectedEvents___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)registerForSystemEvents:(id)a3
{
  id v4 = a3;
  agent = self->_agent;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__DKSystemEventsAgent_registerForSystemEvents___block_invoke;
  v7[3] = &unk_2652F86C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(SystemEventsAgent *)agent registerWithCallback:v7 completionHandler:&__block_literal_global_26];
}

uint64_t __47__DKSystemEventsAgent_registerForSystemEvents___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleSystemEvent:a2 callback:*(void *)(a1 + 40)];
}

- (void)handleSystemEvent:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 header];
  if (v8 == +[AccessorySystemEvent kHeaderCameraShutter])
  {
    uint64_t v9 = 0;
    double v10 = (double)[v6 payload];
  }
  else
  {
    int v11 = [v6 header];
    if (v11 == +[AccessorySystemEvent kHeaderCameraFlip])
    {
      double v10 = (double)[v6 payload];
      uint64_t v9 = 1;
    }
    else
    {
      int v12 = [v6 header];
      if (v12 == +[AccessorySystemEvent kHeaderCameraZoom])
      {
        double v10 = (double)(__int16)[v6 payload] / 100.0;
        uint64_t v9 = 2;
      }
      else
      {
        uint64_t v9 = 3;
        double v10 = 0.0;
      }
    }
  }
  v13 = [NSNumber numberWithDouble:v10];
  id v14 = [[DKSystemEvent alloc] initWithType:v9 value:v13];
  workQueue = self->_workQueue;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __50__DKSystemEventsAgent_handleSystemEvent_callback___block_invoke;
  v18[3] = &unk_2652F8710;
  v19 = v14;
  id v20 = v7;
  v16 = v14;
  id v17 = v7;
  dispatch_async(workQueue, v18);
}

uint64_t __50__DKSystemEventsAgent_handleSystemEvent_callback___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)startCaptureIfNeeded:(unsigned __int8)a3 orientation:(unsigned __int8)a4 finished:(id)a5
{
  uint64_t v5 = a4;
  int v6 = a3;
  id v8 = a5;
  uint64_t v9 = v8;
  if (!v6)
  {
    agent = self->_agent;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __65__DKSystemEventsAgent_startCaptureIfNeeded_orientation_finished___block_invoke;
    v11[3] = &unk_2652F86E8;
    id v12 = v8;
    [(SystemEventsAgent *)agent startPanoramaCaptureWithOrientation:v5 finishedCallback:v11 completionHandler:&__block_literal_global_31];
  }
}

uint64_t __65__DKSystemEventsAgent_startCaptureIfNeeded_orientation_finished___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)stopCaptureIfNeeded:(unsigned __int8)a3
{
  if (!a3) {
    [(SystemEventsAgent *)self->_agent stopPanoramaCaptureWithCompletionHandler:&__block_literal_global_33];
  }
}

- (void)cameraShutterModeChanged:(unsigned __int8)a3
{
  agent = self->_agent;
  if (a3) {
    [(SystemEventsAgent *)agent deinitializePanoramaWithCompletionHandler:&__block_literal_global_37];
  }
  else {
    [(SystemEventsAgent *)agent initializePanoramaWithCompletionHandler:&__block_literal_global_35];
  }
}

- (void)panoramaCaptureDirectionChanged:(unsigned __int8)a3
{
}

- (void)deregisterForSystemEvents:(id)a3
{
  id v4 = a3;
  agent = self->_agent;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__DKSystemEventsAgent_deregisterForSystemEvents___block_invoke;
  v7[3] = &unk_2652F8760;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(SystemEventsAgent *)agent deregisterWithCompletionHandler:v7];
}

void __49__DKSystemEventsAgent_deregisterForSystemEvents___block_invoke(uint64_t a1)
{
  v1 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__DKSystemEventsAgent_deregisterForSystemEvents___block_invoke_2;
  block[3] = &unk_2652F8738;
  id v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);
}

uint64_t __49__DKSystemEventsAgent_deregisterForSystemEvents___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deregisterForSystemEvents
{
}

- (void)dealloc
{
  NSLog(&cfstr_Dksystemevents.isa, a2);
  agent = self->_agent;
  self->_agent = 0;

  v4.receiver = self;
  v4.super_class = (Class)DKSystemEventsAgent;
  [(DKSystemEventsAgent *)&v4 dealloc];
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_agent, 0);
}

@end