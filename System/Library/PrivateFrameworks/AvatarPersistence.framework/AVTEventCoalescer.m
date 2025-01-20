@interface AVTEventCoalescer
- (AVTEventCoalescer)initWithDelay:(double)a3 queue:(id)a4 logger:(id)a5;
- (AVTUILogger)logger;
- (BOOL)eventDeliveryScheduled;
- (NSString)eventLabel;
- (OS_dispatch_queue)workQueue;
- (double)delay;
- (id)eventHandler;
- (void)eventDidOccur:(id)a3;
- (void)registerEventForCoalescingWithLabel:(id)a3 handler:(id)a4;
- (void)setEventDeliveryScheduled:(BOOL)a3;
- (void)setEventHandler:(id)a3;
- (void)setEventLabel:(id)a3;
@end

@implementation AVTEventCoalescer

- (AVTEventCoalescer)initWithDelay:(double)a3 queue:(id)a4 logger:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AVTEventCoalescer;
  v11 = [(AVTEventCoalescer *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_delay = a3;
    objc_storeStrong((id *)&v11->_workQueue, a4);
    objc_storeStrong((id *)&v12->_logger, a5);
  }

  return v12;
}

- (void)registerEventForCoalescingWithLabel:(id)a3 handler:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = [(AVTEventCoalescer *)self eventHandler];

  if (v7) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"Coalescer already received an eventHandler"];
  }
  [(AVTEventCoalescer *)self setEventLabel:v8];
  [(AVTEventCoalescer *)self setEventHandler:v6];
}

- (void)eventDidOccur:(id)a3
{
  id v4 = a3;
  v5 = [(AVTEventCoalescer *)self eventHandler];

  if (!v5) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"Coalescer did not receive an eventHandler"];
  }
  id v6 = [(AVTEventCoalescer *)self logger];
  v7 = [(AVTEventCoalescer *)self eventLabel];
  [v6 logCoalesceableEventOccured:v7];

  id v8 = [(AVTEventCoalescer *)self workQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __35__AVTEventCoalescer_eventDidOccur___block_invoke;
  v10[3] = &unk_2647C31E8;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_async(v8, v10);
}

void __35__AVTEventCoalescer_eventDidOccur___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) eventDeliveryScheduled])
  {
    uint64_t v2 = *(void *)(a1 + 40);
    if (v2)
    {
      v3 = *(void (**)(void))(v2 + 16);
      v3();
    }
  }
  else
  {
    [*(id *)(a1 + 32) setEventDeliveryScheduled:1];
    [*(id *)(a1 + 32) delay];
    dispatch_time_t v5 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
    id v6 = [*(id *)(a1 + 32) workQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __35__AVTEventCoalescer_eventDidOccur___block_invoke_2;
    v8[3] = &unk_2647C31E8;
    v7 = *(void **)(a1 + 40);
    v8[4] = *(void *)(a1 + 32);
    id v9 = v7;
    dispatch_after(v5, v6, v8);
  }
}

uint64_t __35__AVTEventCoalescer_eventDidOccur___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setEventDeliveryScheduled:0];
  uint64_t v2 = [*(id *)(a1 + 32) eventHandler];
  v2[2]();

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void)setEventHandler:(id)a3
{
}

- (NSString)eventLabel
{
  return self->_eventLabel;
}

- (void)setEventLabel:(id)a3
{
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (double)delay
{
  return self->_delay;
}

- (BOOL)eventDeliveryScheduled
{
  return self->_eventDeliveryScheduled;
}

- (void)setEventDeliveryScheduled:(BOOL)a3
{
  self->_eventDeliveryScheduled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_eventLabel, 0);

  objc_storeStrong(&self->_eventHandler, 0);
}

@end