@interface DNDAWDMetricsService
- (DNDAWDMetricsService)initWithClientIdentifier:(id)a3;
- (unint64_t)_queue_currentAWDMetricState;
- (void)_queue_postAWDMetric;
- (void)handleTransitionToUILocked:(BOOL)a3;
- (void)resume;
- (void)stateService:(id)a3 didReceiveDoNotDisturbStateUpdate:(id)a4;
@end

@implementation DNDAWDMetricsService

- (DNDAWDMetricsService)initWithClientIdentifier:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DNDAWDMetricsService;
  v5 = [(DNDAWDMetricsService *)&v12 init];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.donotdisturb.kit.AWDMetricService", v6);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    uint64_t v9 = [MEMORY[0x263F3A7B0] serviceForClientIdentifier:v4];
    notificationsStateService = v5->_notificationsStateService;
    v5->_notificationsStateService = (DNDStateService *)v9;

    v5->_lockState = 0;
  }

  return v5;
}

- (void)resume
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__DNDAWDMetricsService_resume__block_invoke;
  block[3] = &unk_2644AF2B8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __30__DNDAWDMetricsService_resume__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) addStateUpdateListener:*(void *)(a1 + 32) withCompletionHandler:&__block_literal_global_2];
  *(void *)(*(void *)(a1 + 32) + 24) = [*(id *)(*(void *)(a1 + 32) + 16) queryCurrentStateWithError:0];
  return MEMORY[0x270F9A758]();
}

- (void)handleTransitionToUILocked:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__DNDAWDMetricsService_handleTransitionToUILocked___block_invoke;
  v4[3] = &unk_2644AF400;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

uint64_t __51__DNDAWDMetricsService_handleTransitionToUILocked___block_invoke(uint64_t a1)
{
  uint64_t v1 = 1;
  if (!*(unsigned char *)(a1 + 40)) {
    uint64_t v1 = 2;
  }
  *(void *)(*(void *)(a1 + 32) + 32) = v1;
  return objc_msgSend(*(id *)(a1 + 32), "_queue_postAWDMetric");
}

- (void)stateService:(id)a3 didReceiveDoNotDisturbStateUpdate:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __71__DNDAWDMetricsService_stateService_didReceiveDoNotDisturbStateUpdate___block_invoke;
  v8[3] = &unk_2644AF300;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

uint64_t __71__DNDAWDMetricsService_stateService_didReceiveDoNotDisturbStateUpdate___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 40) state];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v3;

  v6 = *(void **)(a1 + 32);
  return objc_msgSend(v6, "_queue_postAWDMetric");
}

- (unint64_t)_queue_currentAWDMetricState
{
  uint64_t v3 = [(DNDState *)self->_currentState suppressionState];
  if (v3 == 2)
  {
    if (self->_lockState == 1) {
      return 2;
    }
    else {
      return 1;
    }
  }
  else if (v3 == 1)
  {
    return 2;
  }
  else
  {
    return 0;
  }
}

- (void)_queue_postAWDMetric
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_currentState && self->_lockState)
  {
    unint64_t v3 = [(DNDAWDMetricsService *)self _queue_currentAWDMetricState];
    MEMORY[0x270F858E0](1441795, v3);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_notificationsStateService, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end