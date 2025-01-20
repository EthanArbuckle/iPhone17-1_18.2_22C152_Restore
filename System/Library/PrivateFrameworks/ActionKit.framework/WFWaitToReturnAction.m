@interface WFWaitToReturnAction
- (id)disabledOnPlatforms;
- (int)token;
- (void)dealloc;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)setToken:(int)a3;
@end

@implementation WFWaitToReturnAction

- (void)setToken:(int)a3
{
  self->_token = a3;
}

- (int)token
{
  return self->_token;
}

- (id)disabledOnPlatforms
{
  v5.receiver = self;
  v5.super_class = (Class)WFWaitToReturnAction;
  v2 = [(WFWaitToReturnAction *)&v5 disabledOnPlatforms];
  v3 = [v2 arrayByAddingObject:*MEMORY[0x263F871E8]];

  return v3;
}

- (void)dealloc
{
  if (notify_is_valid_token(self->_token)) {
    notify_cancel(self->_token);
  }
  v3.receiver = self;
  v3.super_class = (Class)WFWaitToReturnAction;
  [(WFWaitToReturnAction *)&v3 dealloc];
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  self->_token = -1;
  objc_initWeak(&location, self);
  objc_super v5 = (const char *)*MEMORY[0x263F33A10];
  v6 = MEMORY[0x263EF83A0];
  id v7 = MEMORY[0x263EF83A0];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__WFWaitToReturnAction_runAsynchronouslyWithInput___block_invoke;
  v8[3] = &unk_264E5EE98;
  objc_copyWeak(&v9, &location);
  notify_register_dispatch(v5, &self->_token, v6, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __51__WFWaitToReturnAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  notify_cancel(a2);
  [WeakRetained finishRunningWithError:0];
}

@end