@interface HMDHierarchicalStateMachineState
+ (id)logCategory;
- (HMDHierarchicalStateMachine)hsm;
- (HMDHierarchicalStateMachineState)initWithName:(id)a3 parent:(id)a4;
- (int64_t)_internalEventHandler:(id)a3;
- (int64_t)handleEvent:(id)a3;
- (void)_registerForEventHandler;
- (void)handleEnterEvent:(id)a3;
- (void)handleExitEvent:(id)a3;
- (void)onInitialTransition:(id)a3;
- (void)setHsm:(id)a3;
@end

@implementation HMDHierarchicalStateMachineState

- (void).cxx_destruct
{
}

- (void)setHsm:(id)a3
{
}

- (HMDHierarchicalStateMachine)hsm
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hsm);
  return (HMDHierarchicalStateMachine *)WeakRetained;
}

- (int64_t)_internalEventHandler:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  v6 = [(HMDHierarchicalStateMachineState *)self hsm];
  uint64_t v7 = [v6 eventCausingStateTransition];
  v8 = (void *)v7;
  if (v7) {
    v9 = (void *)v7;
  }
  else {
    v9 = v4;
  }
  id v10 = v9;

  id v11 = [MEMORY[0x263F385D0] enterState];

  if (v11 == v4)
  {
    [(HMDHierarchicalStateMachineState *)self handleEnterEvent:v10];
LABEL_11:
    int64_t v14 = 2;
    goto LABEL_12;
  }
  id v12 = [MEMORY[0x263F385D0] exitState];

  if (v12 == v4)
  {
    [(HMDHierarchicalStateMachineState *)self handleExitEvent:v10];
    goto LABEL_11;
  }
  id v13 = [MEMORY[0x263F385D0] initialTransition];

  if (v13 == v4)
  {
    [(HMDHierarchicalStateMachineState *)self onInitialTransition:v10];
    goto LABEL_11;
  }
  int64_t v14 = [(HMDHierarchicalStateMachineState *)self handleEvent:v4];
LABEL_12:

  return v14;
}

- (void)_registerForEventHandler
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __60__HMDHierarchicalStateMachineState__registerForEventHandler__block_invoke;
  v3[3] = &unk_264A1C130;
  objc_copyWeak(&v4, &location);
  [(CUState *)self setEventHandler:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

uint64_t __60__HMDHierarchicalStateMachineState__registerForEventHandler__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v5 = [WeakRetained _internalEventHandler:v3];

  return v5;
}

- (void)onInitialTransition:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x230FBD990]();
  v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    v9 = [(CUState *)v6 name];
    id v10 = [v4 name];
    id v11 = [v4 userInfo];
    int v13 = 138544130;
    int64_t v14 = v8;
    __int16 v15 = 2112;
    v16 = v9;
    __int16 v17 = 2112;
    v18 = v10;
    __int16 v19 = 2112;
    v20 = v11;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@%@.onInitialTransition: %@ / %@", (uint8_t *)&v13, 0x2Au);
  }
  id v12 = [(HMDHierarchicalStateMachineState *)v6 hsm];
  [v12 setHSMInternalCurrentState:v6];
}

- (void)handleExitEvent:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x230FBD990]();
  v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    v9 = [(CUState *)v6 name];
    id v10 = [v4 name];
    id v11 = [v4 userInfo];
    int v12 = 138544130;
    int v13 = v8;
    __int16 v14 = 2112;
    __int16 v15 = v9;
    __int16 v16 = 2112;
    __int16 v17 = v10;
    __int16 v18 = 2112;
    __int16 v19 = v11;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@%@.handleExitEvent: %@ / %@", (uint8_t *)&v12, 0x2Au);
  }
}

- (void)handleEnterEvent:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x230FBD990]();
  v6 = self;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    v9 = [(CUState *)v6 name];
    id v10 = [v4 name];
    id v11 = [v4 userInfo];
    int v12 = 138544130;
    int v13 = v8;
    __int16 v14 = 2112;
    __int16 v15 = v9;
    __int16 v16 = 2112;
    __int16 v17 = v10;
    __int16 v18 = 2112;
    __int16 v19 = v11;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@%@.handleEnterEvent: %@ / %@", (uint8_t *)&v12, 0x2Au);
  }
}

- (int64_t)handleEvent:(id)a3
{
  return 1;
}

- (HMDHierarchicalStateMachineState)initWithName:(id)a3 parent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)HMDHierarchicalStateMachineState;
  id v4 = [(CUState *)&v7 initWithName:a3 parent:a4];
  uint64_t v5 = v4;
  if (v4) {
    [(HMDHierarchicalStateMachineState *)v4 _registerForEventHandler];
  }
  return v5;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_74644 != -1) {
    dispatch_once(&logCategory__hmf_once_t3_74644, &__block_literal_global_74645);
  }
  v2 = (void *)logCategory__hmf_once_v4_74646;
  return v2;
}

void __47__HMDHierarchicalStateMachineState_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v4_74646;
  logCategory__hmf_once_v4_74646 = v0;
}

@end