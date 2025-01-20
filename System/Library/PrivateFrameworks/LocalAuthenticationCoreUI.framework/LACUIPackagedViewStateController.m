@interface LACUIPackagedViewStateController
- (LACUIPackagedViewStateController)initWithLayer:(id)a3;
- (LACUIPackagedViewStateController)initWithPlatformStateController:(id)a3;
- (void)_clearPendingTransitionWithFlag:(BOOL)a3;
- (void)packagedViewPlatformStateController:(id)a3 didTransitionToState:(id)a4 completed:(BOOL)a5;
- (void)setInitialState;
- (void)setState:(id)a3 animated:(BOOL)a4 completion:(id)a5;
@end

@implementation LACUIPackagedViewStateController

- (LACUIPackagedViewStateController)initWithLayer:(id)a3
{
  id v4 = a3;
  v5 = [[LACUIPackagedViewPlatformStateController alloc] initWithLayer:v4];

  v6 = [(LACUIPackagedViewStateController *)self initWithPlatformStateController:v5];
  return v6;
}

- (LACUIPackagedViewStateController)initWithPlatformStateController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LACUIPackagedViewStateController;
  v6 = [(LACUIPackagedViewStateController *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_stateController, a3);
    [(LACUIPackagedViewPlatformStateController *)v7->_stateController setDelegate:v7];
  }

  return v7;
}

- (void)setState:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  objc_super v9 = (void (**)(id, uint64_t))a5;
  stateController = self->_stateController;
  v11 = [v8 name];
  LOBYTE(stateController) = [(LACUIPackagedViewPlatformStateController *)stateController hasState:v11];

  if (stateController)
  {
    v12 = [LACUIPackagedViewState alloc];
    v13 = [(LACUIPackagedViewPlatformStateController *)self->_stateController state];
    v14 = [(LACUIPackagedViewState *)v12 initWithName:v13];

    v15 = [(LACUIPackagedViewState *)v14 name];
    int v16 = [v8 containsStateNamed:v15];

    if (v16)
    {
      v9[2](v9, 1);
    }
    else
    {
      [(LACUIPackagedViewStateController *)self _clearPendingTransitionWithFlag:0];
      v17 = [[LACUIPackagedViewStateTransition alloc] initWithFromState:v14 toState:v8 completion:v9];
      pendingStateTransition = self->_pendingStateTransition;
      self->_pendingStateTransition = v17;

      v19 = self->_stateController;
      v20 = [v8 name];
      [(LACUIPackagedViewPlatformStateController *)v19 setState:v20 speed:(double)v6];

      if (v6)
      {
        v21 = [v8 animationOptions];
        v22 = [v21 maxDuration];
        v23 = v22;
        if (!v22) {
          v22 = &unk_270439BA0;
        }
        [v22 floatValue];
        float v25 = v24;

        if (v25 > 0.0)
        {
          double v26 = v25;
          if (v26 < 1.79769313e308)
          {
            objc_initWeak(&location, self);
            dispatch_time_t v27 = dispatch_time(0, (uint64_t)(v26 * 1000000000.0));
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = __65__LACUIPackagedViewStateController_setState_animated_completion___block_invoke;
            block[3] = &unk_2653BCB40;
            objc_copyWeak(&v30, &location);
            id v29 = v8;
            dispatch_after(v27, MEMORY[0x263EF83A0], block);

            objc_destroyWeak(&v30);
            objc_destroyWeak(&location);
          }
        }
      }
      else
      {
        [(LACUIPackagedViewStateController *)self _clearPendingTransitionWithFlag:1];
      }
    }
  }
  else
  {
    v9[2](v9, 0);
  }
}

void __65__LACUIPackagedViewStateController_setState_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained && *((void *)WeakRetained + 2))
  {
    if (LA_LOG_LACUIPackagedViewStateController_once != -1) {
      dispatch_once(&LA_LOG_LACUIPackagedViewStateController_once, &__block_literal_global_0);
    }
    id v4 = LA_LOG_LACUIPackagedViewStateController_log;
    if (os_log_type_enabled((os_log_t)LA_LOG_LACUIPackagedViewStateController_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138543362;
      uint64_t v7 = v5;
      _os_log_impl(&dword_255001000, v4, OS_LOG_TYPE_DEFAULT, "Calling completion for %{public}@ after reaching duration limit", (uint8_t *)&v6, 0xCu);
    }
    [v3 _clearPendingTransitionWithFlag:1];
  }
}

- (void)setInitialState
{
}

- (void)packagedViewPlatformStateController:(id)a3 didTransitionToState:(id)a4 completed:(BOOL)a5
{
  BOOL v5 = a5;
  pendingStateTransition = self->_pendingStateTransition;
  id v8 = a4;
  objc_super v9 = [(LACUIPackagedViewStateTransition *)pendingStateTransition toState];
  int v10 = [v9 finishesWithStateNamed:v8];

  if (v10)
  {
    [(LACUIPackagedViewStateController *)self _clearPendingTransitionWithFlag:v5];
  }
}

- (void)_clearPendingTransitionWithFlag:(BOOL)a3
{
  [(LACUIPackagedViewStateTransition *)self->_pendingStateTransition complete:a3];
  pendingStateTransition = self->_pendingStateTransition;
  self->_pendingStateTransition = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingStateTransition, 0);
  objc_storeStrong((id *)&self->_stateController, 0);
}

@end