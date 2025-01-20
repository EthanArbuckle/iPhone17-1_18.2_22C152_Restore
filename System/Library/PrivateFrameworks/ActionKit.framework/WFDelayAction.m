@interface WFDelayAction
- (BOOL)isProgressIndeterminate;
- (OS_dispatch_source)timer;
- (WFAutoIncrementingProgress)delayProgress;
- (void)finishRunningWithError:(id)a3;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)setDelayProgress:(id)a3;
- (void)setTimer:(id)a3;
@end

@implementation WFDelayAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayProgress, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

- (void)setDelayProgress:(id)a3
{
}

- (WFAutoIncrementingProgress)delayProgress
{
  return self->_delayProgress;
}

- (void)setTimer:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)finishRunningWithError:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFDelayAction;
  [(WFDelayAction *)&v6 finishRunningWithError:a3];
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
  }
  else
  {
    v5 = [(WFDelayAction *)self delayProgress];
    [v5 finish];
  }
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  v4 = [(WFDelayAction *)self parameterValueForKey:@"WFDelayTime" ofClass:objc_opt_class()];
  [v4 doubleValue];
  double v6 = v5;

  id v7 = objc_alloc(MEMORY[0x263F86928]);
  v8 = [(WFDelayAction *)self progress];
  v9 = (void *)[v7 initWithParent:v8 pendingUnitCount:1 duration:v6];
  [(WFDelayAction *)self setDelayProgress:v9];

  v10 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
  dispatch_time_t v11 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
  dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0x2FAF080uLL);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __44__WFDelayAction_runAsynchronouslyWithInput___block_invoke;
  handler[3] = &unk_264E5EE70;
  handler[4] = self;
  dispatch_source_set_cancel_handler(v10, handler);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __44__WFDelayAction_runAsynchronouslyWithInput___block_invoke_2;
  v16[3] = &unk_264E5DED8;
  v12 = v10;
  v17 = v12;
  v18 = self;
  dispatch_source_set_event_handler(v12, v16);
  timer = self->_timer;
  self->_timer = (OS_dispatch_source *)v12;
  v14 = v12;

  dispatch_resume(v14);
  v15 = [(WFDelayAction *)self delayProgress];
  [v15 start];
}

void __44__WFDelayAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delayProgress];
  [v2 cancel];

  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 328);
  *(void *)(v3 + 328) = 0;
}

uint64_t __44__WFDelayAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  v2 = *(void **)(a1 + 40);
  return [v2 finishRunningWithError:0];
}

- (BOOL)isProgressIndeterminate
{
  return 0;
}

@end