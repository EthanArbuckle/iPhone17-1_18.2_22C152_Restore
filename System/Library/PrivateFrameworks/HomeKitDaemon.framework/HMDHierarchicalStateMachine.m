@interface HMDHierarchicalStateMachine
+ (id)logCategory;
- (BOOL)allowSelfStateTransitions;
- (BOOL)hasStarted;
- (CUStateEvent)eventCausingStateTransition;
- (CUStateMachine)cuStateMachine;
- (HMDHierarchicalStateMachine)initWithQueue:(id)a3 allowSelfStateTransitions:(BOOL)a4;
- (HMDHierarchicalStateMachineState)currentHSMState;
- (HMDHierarchicalStateMachineState)initialState;
- (OS_dispatch_queue)queue;
- (id)stateWithName:(id)a3;
- (void)_start;
- (void)currentHSMStateWithCompletion:(id)a3;
- (void)dispatchEvent:(id)a3;
- (void)dispatchEvent:(id)a3 userInfo:(id)a4;
- (void)dispatchEvent:(id)a3 userInfo:(id)a4 completion:(id)a5;
- (void)invalidate;
- (void)setCuStateMachine:(id)a3;
- (void)setCurrentHSMState:(id)a3;
- (void)setEventCausingStateTransition:(id)a3;
- (void)setHSMInternalCurrentState:(id)a3;
- (void)setInitialState:(id)a3;
- (void)setStates:(id)a3;
- (void)start;
- (void)transitionToState:(id)a3;
- (void)transitionToState:(id)a3 withEvent:(id)a4;
@end

@implementation HMDHierarchicalStateMachine

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_currentHSMState);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_eventCausingStateTransition, 0);
  objc_storeStrong((id *)&self->_cuStateMachine, 0);
}

- (void)setCurrentHSMState:(id)a3
{
}

- (HMDHierarchicalStateMachineState)currentHSMState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentHSMState);
  return (HMDHierarchicalStateMachineState *)WeakRetained;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setEventCausingStateTransition:(id)a3
{
}

- (CUStateEvent)eventCausingStateTransition
{
  return self->_eventCausingStateTransition;
}

- (BOOL)hasStarted
{
  return self->_started;
}

- (BOOL)allowSelfStateTransitions
{
  return self->_allowSelfStateTransitions;
}

- (void)setCuStateMachine:(id)a3
{
}

- (CUStateMachine)cuStateMachine
{
  return self->_cuStateMachine;
}

- (void)setHSMInternalCurrentState:(id)a3
{
  id v4 = a3;
  v5 = [(HMDHierarchicalStateMachine *)self queue];
  dispatch_assert_queue_V2(v5);

  [(HMDHierarchicalStateMachine *)self setCurrentHSMState:v4];
  [(HMDHierarchicalStateMachine *)self setEventCausingStateTransition:0];
}

- (id)stateWithName:(id)a3
{
  id v4 = a3;
  v5 = [(HMDHierarchicalStateMachine *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = [(HMDHierarchicalStateMachine *)self cuStateMachine];
  v7 = [v6 states];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __45__HMDHierarchicalStateMachine_stateWithName___block_invoke;
  v14[3] = &unk_264A2F898;
  id v15 = v4;
  id v8 = v4;
  v9 = objc_msgSend(v7, "na_firstObjectPassingTest:", v14);

  id v10 = v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;

  return v12;
}

uint64_t __45__HMDHierarchicalStateMachine_stateWithName___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 name];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

- (void)currentHSMStateWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(HMDHierarchicalStateMachine *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__HMDHierarchicalStateMachine_currentHSMStateWithCompletion___block_invoke;
  v7[3] = &unk_264A2F870;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __61__HMDHierarchicalStateMachine_currentHSMStateWithCompletion___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) currentHSMState];
  v2 = _Block_copy(*(const void **)(a1 + 40));
  v3 = v2;
  if (v2) {
    (*((void (**)(void *, id))v2 + 2))(v2, v4);
  }
}

- (void)setStates:(id)a3
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__HMDHierarchicalStateMachine_setStates___block_invoke;
  v7[3] = &unk_264A2F848;
  v7[4] = self;
  id v4 = a3;
  objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v7);
  v5 = (void *)[v4 copy];

  id v6 = [(HMDHierarchicalStateMachine *)self cuStateMachine];
  [v6 setStates:v5];
}

uint64_t __41__HMDHierarchicalStateMachine_setStates___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setHsm:*(void *)(a1 + 32)];
}

- (HMDHierarchicalStateMachineState)initialState
{
  v2 = [(HMDHierarchicalStateMachine *)self cuStateMachine];
  v3 = [v2 initialState];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  v5 = v4;

  return v5;
}

- (void)setInitialState:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDHierarchicalStateMachine *)self cuStateMachine];
  [v5 setInitialState:v4];
}

- (void)transitionToState:(id)a3 withEvent:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  v7 = [(HMDHierarchicalStateMachine *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(HMDHierarchicalStateMachine *)self currentHSMState];
  if (![v8 isEqual:v11])
  {

    goto LABEL_5;
  }
  BOOL v9 = [(HMDHierarchicalStateMachine *)self allowSelfStateTransitions];

  if (v9)
  {
LABEL_5:
    [(HMDHierarchicalStateMachine *)self setEventCausingStateTransition:v6];
    id v10 = [(HMDHierarchicalStateMachine *)self cuStateMachine];
    [v10 transitionToState:v11];
  }
}

- (void)transitionToState:(id)a3
{
  id v5 = a3;
  id v4 = [(HMDHierarchicalStateMachine *)self queue];
  dispatch_assert_queue_V2(v4);

  [(HMDHierarchicalStateMachine *)self transitionToState:v5 withEvent:0];
}

- (void)dispatchEvent:(id)a3 userInfo:(id)a4 completion:(id)a5
{
  id v8 = (objc_class *)MEMORY[0x263F385D0];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = (id)[[v8 alloc] initWithName:v11 userInfo:v10 completion:v9];

  [(HMDHierarchicalStateMachine *)self dispatchEvent:v12];
}

- (void)dispatchEvent:(id)a3 userInfo:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x263F385D0];
  id v7 = a4;
  id v8 = a3;
  id v9 = (id)[[v6 alloc] initWithName:v8 userInfo:v7];

  [(HMDHierarchicalStateMachine *)self dispatchEvent:v9];
}

- (void)dispatchEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDHierarchicalStateMachine *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__HMDHierarchicalStateMachine_dispatchEvent___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __45__HMDHierarchicalStateMachine_dispatchEvent___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  char v2 = [*(id *)(a1 + 32) hasStarted];
  v3 = (void *)MEMORY[0x230FBD990]();
  id v4 = *(id *)(a1 + 32);
  id v5 = HMFGetOSLogHandle();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v6)
    {
      id v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 40);
      int v13 = 138543618;
      v14 = v7;
      __int16 v15 = 2112;
      uint64_t v16 = v8;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@DispatchEvent: %@", (uint8_t *)&v13, 0x16u);
    }
    id v9 = [*(id *)(a1 + 32) cuStateMachine];
    [v9 dispatchEvent:*(void *)(a1 + 40)];
  }
  else
  {
    if (v6)
    {
      id v10 = HMFGetLogIdentifier();
      uint64_t v11 = *(void *)(a1 + 40);
      int v13 = 138543618;
      v14 = v10;
      __int16 v15 = 2112;
      uint64_t v16 = v11;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Cannot handle event %@ until the state machine has started", (uint8_t *)&v13, 0x16u);
    }
    id v12 = *(void **)(a1 + 40);
    id v9 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    [v12 completedWithError:v9];
  }
}

- (void)invalidate
{
  v3 = [(HMDHierarchicalStateMachine *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__HMDHierarchicalStateMachine_invalidate__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __41__HMDHierarchicalStateMachine_invalidate__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) cuStateMachine];
  [v1 invalidate];
}

- (void)_start
{
  v3 = [(HMDHierarchicalStateMachine *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDHierarchicalStateMachine *)self cuStateMachine];
  [v4 start];

  self->_started = 1;
}

- (void)start
{
  v3 = [(HMDHierarchicalStateMachine *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__HMDHierarchicalStateMachine_start__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __36__HMDHierarchicalStateMachine_start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _start];
}

- (HMDHierarchicalStateMachine)initWithQueue:(id)a3 allowSelfStateTransitions:(BOOL)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMDHierarchicalStateMachine;
  uint64_t v8 = [(HMDHierarchicalStateMachine *)&v12 init];
  if (v8)
  {
    id v9 = (CUStateMachine *)objc_alloc_init(MEMORY[0x263F385D8]);
    cuStateMachine = v8->_cuStateMachine;
    v8->_cuStateMachine = v9;

    objc_storeStrong((id *)&v8->_queue, a3);
    v8->_allowSelfStateTransitions = a4;
  }

  return v8;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_273886 != -1) {
    dispatch_once(&logCategory__hmf_once_t6_273886, &__block_literal_global_273887);
  }
  char v2 = (void *)logCategory__hmf_once_v7_273888;
  return v2;
}

void __42__HMDHierarchicalStateMachine_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  id v1 = (void *)logCategory__hmf_once_v7_273888;
  logCategory__hmf_once_v7_273888 = v0;
}

@end