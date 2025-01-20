@interface LACUIPackagedViewPlatformStateController
- (BOOL)hasState:(id)a3;
- (LACUIPackagedViewPlatformStateController)initWithLayer:(id)a3;
- (LACUIPackagedViewPlatformStateControllerDelegate)delegate;
- (NSString)description;
- (id)state;
- (void)setDelegate:(id)a3;
- (void)setInitialState;
- (void)setState:(id)a3 speed:(double)a4;
- (void)stateController:(id)a3 didSetStateOfLayer:(id)a4;
- (void)stateController:(id)a3 transitionDidStart:(id)a4 speed:(float)a5;
- (void)stateController:(id)a3 transitionDidStop:(id)a4 completed:(BOOL)a5;
@end

@implementation LACUIPackagedViewPlatformStateController

- (LACUIPackagedViewPlatformStateController)initWithLayer:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LACUIPackagedViewPlatformStateController;
  v5 = [(LACUIPackagedViewPlatformStateController *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x263F158B0]) initWithLayer:v4];
    stateController = v5->_stateController;
    v5->_stateController = (CAStateController *)v6;

    [(CAStateController *)v5->_stateController setDelegate:v5];
  }

  return v5;
}

- (id)state
{
  stateController = self->_stateController;
  v3 = [(CAStateController *)stateController layer];
  id v4 = [(CAStateController *)stateController stateOfLayer:v3];
  v5 = [v4 name];

  return v5;
}

- (BOOL)hasState:(id)a3
{
  stateController = self->_stateController;
  id v4 = a3;
  v5 = [(CAStateController *)stateController layer];
  uint64_t v6 = [v5 stateWithName:v4];

  return v6 != 0;
}

- (void)setState:(id)a3 speed:(double)a4
{
  id v11 = a3;
  if (!-[LACUIPackagedViewPlatformStateController hasState:](self, "hasState:")) {
    -[LACUIPackagedViewPlatformStateController setState:speed:]();
  }
  stateController = self->_stateController;
  v7 = [(CAStateController *)stateController layer];
  v8 = [v7 stateWithName:v11];
  objc_super v9 = [(CAStateController *)self->_stateController layer];
  *(float *)&double v10 = a4;
  [(CAStateController *)stateController setState:v8 ofLayer:v9 transitionSpeed:v10];
}

- (void)setInitialState
{
  stateController = self->_stateController;
  id v3 = [(CAStateController *)stateController layer];
  [(CAStateController *)stateController setInitialStatesOfLayer:v3];
}

- (void)stateController:(id)a3 transitionDidStop:(id)a4 completed:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v24 = *MEMORY[0x263EF8340];
  v8 = (CAStateController *)a3;
  id v9 = a4;
  if (self->_stateController != v8) {
    -[LACUIPackagedViewPlatformStateController stateController:transitionDidStop:completed:]();
  }
  double v10 = v9;
  id v11 = LA_LOG_LACUIPackagedViewPlatformStateController();
  v12 = v11;
  if (v5) {
    os_log_type_t v13 = OS_LOG_TYPE_DEBUG;
  }
  else {
    os_log_type_t v13 = OS_LOG_TYPE_ERROR;
  }
  if (os_log_type_enabled(v11, v13))
  {
    if (v5) {
      v14 = "finish";
    }
    else {
      v14 = "skip";
    }
    v15 = _NSStringFromCAStateTransition(v10);
    int v18 = 138543874;
    v19 = self;
    __int16 v20 = 2080;
    v21 = v14;
    __int16 v22 = 2114;
    v23 = v15;
    _os_log_impl(&dword_255001000, v12, v13, "%{public}@ did %s %{public}@", (uint8_t *)&v18, 0x20u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v17 = [v10 toState];
  [WeakRetained packagedViewPlatformStateController:self didTransitionToState:v17 completed:v5];
}

- (void)stateController:(id)a3 didSetStateOfLayer:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v6 = (CAStateController *)a3;
  id v7 = a4;
  if (self->_stateController != v6) {
    -[LACUIPackagedViewPlatformStateController stateController:didSetStateOfLayer:]();
  }
  v8 = v7;
  id v9 = LA_LOG_LACUIPackagedViewPlatformStateController();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    double v10 = [(CAStateController *)self->_stateController stateOfLayer:v8];
    id v11 = [v10 name];
    int v12 = 138543618;
    os_log_type_t v13 = self;
    __int16 v14 = 2114;
    v15 = v11;
    _os_log_debug_impl(&dword_255001000, v9, OS_LOG_TYPE_DEBUG, "%{public}@ did set layer state to '%{public}@'", (uint8_t *)&v12, 0x16u);
  }
}

- (void)stateController:(id)a3 transitionDidStart:(id)a4 speed:(float)a5
{
  id v7 = (CAStateController *)a3;
  id v8 = a4;
  if (self->_stateController != v7) {
    -[LACUIPackagedViewPlatformStateController stateController:transitionDidStart:speed:]();
  }
  id v9 = v8;
  double v10 = LA_LOG_LACUIPackagedViewPlatformStateController();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[LACUIPackagedViewPlatformStateController stateController:transitionDidStart:speed:]((uint64_t)self, v9, v10);
  }
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@; %p>", objc_opt_class(), self];
}

- (LACUIPackagedViewPlatformStateControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (LACUIPackagedViewPlatformStateControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stateController, 0);
}

- (void)setState:speed:.cold.1()
{
}

- (void)stateController:transitionDidStop:completed:.cold.1()
{
  __assert_rtn("-[LACUIPackagedViewPlatformStateController stateController:transitionDidStop:completed:]", "LACUIPackagedViewPlatformStateController.m", 61, "controller == _stateController");
}

- (void)stateController:didSetStateOfLayer:.cold.1()
{
  __assert_rtn("-[LACUIPackagedViewPlatformStateController stateController:didSetStateOfLayer:]", "LACUIPackagedViewPlatformStateController.m", 68, "controller == _stateController");
}

- (void)stateController:(uint64_t)a1 transitionDidStart:(void *)a2 speed:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v5 = _NSStringFromCAStateTransition(a2);
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  id v9 = v5;
  _os_log_debug_impl(&dword_255001000, a3, OS_LOG_TYPE_DEBUG, "%{public}@ will start %{public}@", (uint8_t *)&v6, 0x16u);
}

- (void)stateController:transitionDidStart:speed:.cold.2()
{
  __assert_rtn("-[LACUIPackagedViewPlatformStateController stateController:transitionDidStart:speed:]", "LACUIPackagedViewPlatformStateController.m", 74, "controller == _stateController");
}

@end