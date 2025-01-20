@interface HAPAccessoryReachabilityClient
+ (HAPAccessoryReachabilityClient)new;
+ (id)logCategory;
+ (id)shortDescription;
+ (void)initialize;
- (BOOL)isRunning;
- (HAPAccessoryReachabilityClient)init;
- (HAPAccessoryReachabilityClient)initWithIdentifier:(id)a3 profile:(id)a4 operationQueue:(id)a5;
- (HAPAccessoryReachabilityDelegate)delegate;
- (HAPAccessoryReachabilityProfile)profile;
- (NSString)description;
- (double)confirmInterval;
- (id)shortDescription;
- (int64_t)state;
- (void)_enterState:(int64_t)a3;
- (void)_poll;
- (void)_processProfile;
- (void)_runStateMachine;
- (void)_stop;
- (void)_timerDidFire:(id)a3;
- (void)_wait;
- (void)confirm;
- (void)kick;
- (void)setDelegate:(id)a3;
- (void)setProfile:(id)a3;
- (void)setState:(int64_t)a3;
- (void)startWithCompletionHandler:(id)a3;
- (void)stopWithCompletionHandler:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HAPAccessoryReachabilityClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityTimer, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_propertyLock, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_profile, 0);
}

- (double)confirmInterval
{
  return self->_confirmInterval;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (HAPAccessoryReachabilityDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HAPAccessoryReachabilityDelegate *)WeakRetained;
}

- (HAPAccessoryReachabilityProfile)profile
{
  return self->_profile;
}

- (id)shortDescription
{
  v2 = objc_opt_class();

  return (id)[v2 shortDescription];
}

- (void)_timerDidFire:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = v5;
  if (self) {
    activityTimer = self->_activityTimer;
  }
  else {
    activityTimer = 0;
  }
  if ([v5 isEqual:activityTimer])
  {
    int64_t v8 = [(HAPAccessoryReachabilityClient *)self state];
    if ((unint64_t)(v8 - 1) >= 3)
    {
      if (!v8) {
        [(HAPAccessoryReachabilityClient *)self _enterState:1];
      }
    }
    else
    {
      v9 = (void *)MEMORY[0x1D944E080]();
      v10 = self;
      v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = HMFGetLogIdentifier();
        v13 = NSStringFromSelector(a2);
        int v14 = 138543618;
        v15 = v12;
        __int16 v16 = 2112;
        v17 = v13;
        _os_log_impl(&dword_1D4758000, v11, OS_LOG_TYPE_ERROR, "%{public}@%@ timer should not be running in this state", (uint8_t *)&v14, 0x16u);
      }
    }
  }
}

- (void)timerDidFire:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void *)MEMORY[0x1D944E080]();
  v7 = self;
  int64_t v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = HMFGetLogIdentifier();
    v10 = NSStringFromSelector(a2);
    identifier = v7->_identifier;
    *(_DWORD *)buf = 138543874;
    v19 = v9;
    __int16 v20 = 2112;
    v21 = v10;
    __int16 v22 = 2112;
    v23 = identifier;
    _os_log_impl(&dword_1D4758000, v8, OS_LOG_TYPE_DEBUG, "%{public}@%@ id=%@", buf, 0x20u);
  }
  objc_initWeak((id *)buf, v7);
  if (v7) {
    operationQueue = v7->_operationQueue;
  }
  else {
    operationQueue = 0;
  }
  v13 = operationQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __47__HAPAccessoryReachabilityClient_timerDidFire___block_invoke;
  v15[3] = &unk_1E69F4540;
  objc_copyWeak(&v17, (id *)buf);
  id v14 = v5;
  id v16 = v14;
  [(HAP2SerializedOperationQueue *)v13 addBlock:v15];

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

void __47__HAPAccessoryReachabilityClient_timerDidFire___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _timerDidFire:*(void *)(a1 + 32)];
}

- (void)_stop
{
  if (self)
  {
    [(HAP2SerializedOperationQueue *)self->_operationQueue assertCurrentQueue];
    [(HMFTimer *)self->_activityTimer suspend];
    objc_storeStrong((id *)&self->_activityTimer, 0);
  }
  else
  {
    [0 assertCurrentQueue];
    [0 suspend];
  }
}

- (void)_poll
{
  v2 = self;
  if (self) {
    self = (HAPAccessoryReachabilityClient *)self->_operationQueue;
  }
  [(HAPAccessoryReachabilityClient *)self assertCurrentQueue];
  id WeakRetained = objc_loadWeakRetained((id *)&v2->_delegate);
  [WeakRetained pollAccessory];
}

- (void)_wait
{
  if (self)
  {
    [(HAP2SerializedOperationQueue *)self->_operationQueue assertCurrentQueue];
    activityTimer = self->_activityTimer;
    if (activityTimer)
    {
      [(HMFTimer *)activityTimer suspend];
      [(HMFTimer *)self->_activityTimer setDelegate:0];
    }
  }
  else
  {
    [0 assertCurrentQueue];
  }
  double v4 = (double)arc4random() * 2.32830644e-10;
  [(HAPAccessoryReachabilityClient *)self confirmInterval];
  double v6 = v4 * (v5 * 0.05);
  id v7 = objc_alloc(MEMORY[0x1E4F65580]);
  [(HAPAccessoryReachabilityClient *)self confirmInterval];
  v9 = (void *)[v7 initWithTimeInterval:1 options:v6 + v8];
  v10 = v9;
  if (self)
  {
    objc_storeStrong((id *)&self->_activityTimer, v9);

    [(HMFTimer *)self->_activityTimer setDelegate:self];
    v11 = self->_activityTimer;
  }
  else
  {

    [0 setDelegate:0];
    v11 = 0;
  }

  [(HMFTimer *)v11 resume];
}

- (void)_processProfile
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  double v4 = [(HAPAccessoryReachabilityClient *)self profile];
  [v4 sleepInterval];
  double v6 = v5;

  id v7 = [MEMORY[0x1E4F65530] sharedPreferences];
  double v8 = v7;
  if (v6 <= 0.0)
  {
    v12 = [v7 preferenceForKey:@"kReachabilityDefaultTestInterval"];
    v13 = [v12 numberValue];
    self->_confirmInterval = (double)[v13 unsignedIntValue];

    self->_confirmInterval = fmax(self->_confirmInterval, 1.0);
  }
  else
  {
    v9 = [v7 preferenceForKey:@"kReachabilityDefaultSleepyTestInterval"];
    v10 = [v9 numberValue];
    double v11 = (double)[v10 unsignedIntValue];

    self->_confirmInterval = fmax((v6 + v6) * 1.15, fmax(v11, 1.0));
  }
  id v14 = (void *)MEMORY[0x1D944E080]();
  v15 = self;
  id v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    id v17 = HMFGetLogIdentifier();
    uint64_t v18 = NSStringFromSelector(a2);
    int v19 = 138543874;
    __int16 v20 = v17;
    __int16 v21 = 2112;
    __int16 v22 = v18;
    __int16 v23 = 2112;
    uint64_t v24 = v15;
    _os_log_impl(&dword_1D4758000, v16, OS_LOG_TYPE_DEBUG, "%{public}@%@: %@", (uint8_t *)&v19, 0x20u);
  }
}

- (void)_enterState:(int64_t)a3
{
  double v4 = self;
  if (self) {
    self = (HAPAccessoryReachabilityClient *)self->_operationQueue;
  }
  [(HAPAccessoryReachabilityClient *)self assertCurrentQueue];
  v4->_state = a3;

  [(HAPAccessoryReachabilityClient *)v4 _runStateMachine];
}

- (void)_runStateMachine
{
  v2 = self;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (self) {
    self = (HAPAccessoryReachabilityClient *)self->_operationQueue;
  }
  v3 = (void *)MEMORY[0x1D944E080]([(HAPAccessoryReachabilityClient *)self assertCurrentQueue]);
  double v4 = v2;
  double v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    id v7 = (void *)v6;
    unint64_t state = v4->_state;
    if (state > 3) {
      v9 = @"unknown";
    }
    else {
      v9 = off_1E69F1C60[state];
    }
    identifier = v4->_identifier;
    int v12 = 138543874;
    uint64_t v13 = v6;
    __int16 v14 = 2112;
    v15 = v9;
    __int16 v16 = 2112;
    id v17 = identifier;
    _os_log_impl(&dword_1D4758000, v5, OS_LOG_TYPE_INFO, "%{public}@state=%@ id=%@", (uint8_t *)&v12, 0x20u);
  }
  int64_t v11 = v4->_state;
  if ((unint64_t)(v11 - 1) < 2)
  {
    [(HAPAccessoryReachabilityClient *)v4 _poll];
  }
  else if (v11 == 3)
  {
    [(HAPAccessoryReachabilityClient *)v4 _stop];
  }
  else if (!v11)
  {
    [(HAPAccessoryReachabilityClient *)v4 _wait];
  }
}

- (void)confirm
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  double v4 = (void *)MEMORY[0x1D944E080]();
  double v5 = self;
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = HMFGetLogIdentifier();
    uint64_t v8 = NSStringFromSelector(a2);
    v9 = (void *)v8;
    unint64_t state = v5->_state;
    if (state > 3) {
      int64_t v11 = @"unknown";
    }
    else {
      int64_t v11 = off_1E69F1C60[state];
    }
    identifier = v5->_identifier;
    *(_DWORD *)buf = 138544130;
    id v17 = v7;
    __int16 v18 = 2112;
    uint64_t v19 = v8;
    __int16 v20 = 2112;
    __int16 v21 = v11;
    __int16 v22 = 2112;
    __int16 v23 = identifier;
    _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_DEBUG, "%{public}@%@ state=%@ id=%@", buf, 0x2Au);
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __41__HAPAccessoryReachabilityClient_confirm__block_invoke;
  v15[3] = &unk_1E69F4330;
  void v15[4] = v5;
  uint64_t v13 = (void *)MEMORY[0x1D944E2D0](v15);
  if (v5) {
    operationQueue = v5->_operationQueue;
  }
  else {
    operationQueue = 0;
  }
  [(HAP2SerializedOperationQueue *)operationQueue addBlock:v13];
}

uint64_t __41__HAPAccessoryReachabilityClient_confirm__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) state];
  if (result)
  {
    if (result != 3) {
      return result;
    }
    uint64_t v3 = 2;
  }
  else
  {
    uint64_t v3 = 1;
  }
  double v4 = *(void **)(a1 + 32);

  return [v4 _enterState:v3];
}

- (void)kick
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  double v4 = (void *)MEMORY[0x1D944E080]();
  double v5 = self;
  uint64_t v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = HMFGetLogIdentifier();
    uint64_t v8 = NSStringFromSelector(a2);
    v9 = (void *)v8;
    unint64_t state = v5->_state;
    if (state > 3) {
      int64_t v11 = @"unknown";
    }
    else {
      int64_t v11 = off_1E69F1C60[state];
    }
    identifier = v5->_identifier;
    *(_DWORD *)buf = 138544130;
    id v17 = v7;
    __int16 v18 = 2112;
    uint64_t v19 = v8;
    __int16 v20 = 2112;
    __int16 v21 = v11;
    __int16 v22 = 2112;
    __int16 v23 = identifier;
    _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_DEBUG, "%{public}@%@ state=%@ id=%@", buf, 0x2Au);
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __38__HAPAccessoryReachabilityClient_kick__block_invoke;
  v15[3] = &unk_1E69F4330;
  void v15[4] = v5;
  uint64_t v13 = (void *)MEMORY[0x1D944E2D0](v15);
  if (v5) {
    operationQueue = v5->_operationQueue;
  }
  else {
    operationQueue = 0;
  }
  [(HAP2SerializedOperationQueue *)operationQueue addBlock:v13];
}

unint64_t __38__HAPAccessoryReachabilityClient_kick__block_invoke(uint64_t a1)
{
  unint64_t result = [*(id *)(a1 + 32) state];
  if (result <= 2)
  {
    uint64_t v3 = qword_1D4912BE8[result];
    double v4 = *(void **)(a1 + 32);
    return [v4 _enterState:v3];
  }
  return result;
}

- (BOOL)isRunning
{
  return ([(HAPAccessoryReachabilityClient *)self state] & 0xFFFFFFFFFFFFFFFELL) != 2;
}

- (void)stopWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __60__HAPAccessoryReachabilityClient_stopWithCompletionHandler___block_invoke;
  int64_t v11 = &unk_1E69F3C68;
  int v12 = self;
  id v13 = v4;
  id v5 = v4;
  uint64_t v6 = (void *)MEMORY[0x1D944E2D0](&v8);
  if (self) {
    operationQueue = self->_operationQueue;
  }
  else {
    operationQueue = 0;
  }
  -[HAP2SerializedOperationQueue addBlock:](operationQueue, "addBlock:", v6, v8, v9, v10, v11, v12);
}

uint64_t __60__HAPAccessoryReachabilityClient_stopWithCompletionHandler___block_invoke(uint64_t a1)
{
  if ((unint64_t)[*(id *)(a1 + 32) state] <= 1) {
    [*(id *)(a1 + 32) _enterState:3];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)startWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __61__HAPAccessoryReachabilityClient_startWithCompletionHandler___block_invoke;
  int64_t v11 = &unk_1E69F3C68;
  int v12 = self;
  id v13 = v4;
  id v5 = v4;
  uint64_t v6 = (void *)MEMORY[0x1D944E2D0](&v8);
  if (self) {
    operationQueue = self->_operationQueue;
  }
  else {
    operationQueue = 0;
  }
  -[HAP2SerializedOperationQueue addBlock:](operationQueue, "addBlock:", v6, v8, v9, v10, v11, v12);
}

void __61__HAPAccessoryReachabilityClient_startWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));

  if (WeakRetained)
  {
    uint64_t v3 = [*(id *)(a1 + 32) state];
    if ((unint64_t)(v3 - 1) < 3)
    {
      [*(id *)(a1 + 32) _enterState:0];
      id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
      v4();
      return;
    }
    if (v3) {
      return;
    }
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = (void *)MEMORY[0x1E4F28C58];
    id v9 = [NSString stringWithFormat:@"Cannot start from current state: %@", @"waiting"];
    uint64_t v8 = [v7 hapErrorWithCode:4 description:@"reachability is already running" reason:v9 suggestion:0 underlyingError:0];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v8);
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v9 = [MEMORY[0x1E4F28C58] hapErrorWithCode:9 description:@"Failed to start reachability monitoring" reason:@"No delegate" suggestion:0 underlyingError:0];
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v9);
  }
}

- (void)setProfile:(id)a3
{
  id v4 = a3;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __45__HAPAccessoryReachabilityClient_setProfile___block_invoke;
  int64_t v11 = &unk_1E69F46E0;
  int v12 = self;
  id v13 = v4;
  id v5 = v4;
  uint64_t v6 = (void *)MEMORY[0x1D944E2D0](&v8);
  if (self) {
    operationQueue = self->_operationQueue;
  }
  else {
    operationQueue = 0;
  }
  -[HAP2SerializedOperationQueue addBlock:](operationQueue, "addBlock:", v6, v8, v9, v10, v11, v12);
}

uint64_t __45__HAPAccessoryReachabilityClient_setProfile___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copyWithZone:0];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  id v5 = *(void **)(a1 + 32);

  return [v5 _processProfile];
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  if (self) {
    propertyLock = self->_propertyLock;
  }
  else {
    propertyLock = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__HAPAccessoryReachabilityClient_setDelegate___block_invoke;
  v7[3] = &unk_1E69F46E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(HAP2PropertyLock *)propertyLock performWritingBlock:v7];
}

id __46__HAPAccessoryReachabilityClient_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
}

- (NSString)description
{
  v14.receiver = self;
  v14.super_class = (Class)HAPAccessoryReachabilityClient;
  uint64_t v3 = [(HMFObject *)&v14 description];
  id v4 = NSString;
  if (self) {
    identifier = self->_identifier;
  }
  else {
    identifier = 0;
  }
  id v6 = identifier;
  unint64_t v7 = [(HAPAccessoryReachabilityClient *)self state];
  if (v7 > 3) {
    id v8 = @"unknown";
  }
  else {
    id v8 = off_1E69F1C60[v7];
  }
  [(HAPAccessoryReachabilityClient *)self confirmInterval];
  uint64_t v10 = v9;
  int64_t v11 = [(HAPAccessoryReachabilityClient *)self profile];
  int v12 = [v4 stringWithFormat:@"%@ identifier=%@ state=%@, confirmInterval=%f, profile=%@", v3, v6, v8, v10, v11];

  return (NSString *)v12;
}

- (HAPAccessoryReachabilityClient)initWithIdentifier:(id)a3 profile:(id)a4 operationQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)HAPAccessoryReachabilityClient;
  int64_t v11 = [(HAPAccessoryReachabilityClient *)&v21 init];
  int v12 = v11;
  if (v11)
  {
    v11->_unint64_t state = 3;
    uint64_t v13 = [v8 copy];
    identifier = v12->_identifier;
    v12->_identifier = (HAPDeviceID *)v13;

    uint64_t v15 = [v9 copyWithZone:0];
    profile = v12->_profile;
    v12->_profile = (HAPAccessoryReachabilityProfile *)v15;

    objc_storeStrong((id *)&v12->_operationQueue, a5);
    uint64_t v17 = +[HAP2PropertyLock lockWithName:@"HAPAccessoryReachabilityClient.propertyLock"];
    propertyLock = v12->_propertyLock;
    v12->_propertyLock = (HAP2PropertyLock *)v17;

    [(HAPAccessoryReachabilityClient *)v12 _processProfile];
    uint64_t v19 = v12;
  }

  return v12;
}

- (HAPAccessoryReachabilityClient)init
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)shortDescription
{
  uint64_t v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6 != -1) {
    dispatch_once(&logCategory__hmf_once_t6, &__block_literal_global_8662);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v7;

  return v2;
}

uint64_t __45__HAPAccessoryReachabilityClient_logCategory__block_invoke()
{
  logCategory__hmf_once_id v7 = HMFCreateOSLogHandle();

  return MEMORY[0x1F41817F8]();
}

+ (void)initialize
{
  [MEMORY[0x1E4F65530] setDefaultValue:&unk_1F2C80DC0 forPreferenceKey:@"kReachabilityDefaultTestInterval"];
  uint64_t v2 = (void *)MEMORY[0x1E4F65530];

  [v2 setDefaultValue:&unk_1F2C80DD0 forPreferenceKey:@"kReachabilityDefaultSleepyTestInterval"];
}

+ (HAPAccessoryReachabilityClient)new
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end