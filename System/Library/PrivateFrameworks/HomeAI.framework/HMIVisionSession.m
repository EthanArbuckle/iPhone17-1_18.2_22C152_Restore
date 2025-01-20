@interface HMIVisionSession
+ (HMIVisionSession)sharedInstance;
- (HMFOSTransaction)transaction;
- (HMFTimer)watchdogTimer;
- (HMIVisionSession)init;
- (VNSession)vnSession;
- (void)setTransaction:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMIVisionSession

+ (HMIVisionSession)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__HMIVisionSession_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, block);
  }
  v2 = (void *)sharedInstance_session;
  return (HMIVisionSession *)v2;
}

void __34__HMIVisionSession_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x22A641C70]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    int v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_225DC6000, v4, OS_LOG_TYPE_INFO, "%{public}@Initializing HMIVisionSession", (uint8_t *)&v8, 0xCu);
  }
  id v6 = objc_alloc_init(*(Class *)(a1 + 32));
  v7 = (void *)sharedInstance_session;
  sharedInstance_session = (uint64_t)v6;
}

- (HMIVisionSession)init
{
  v7.receiver = self;
  v7.super_class = (Class)HMIVisionSession;
  v2 = [(HMIVisionSession *)&v7 init];
  id v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:8 options:30.0];
    watchdogTimer = v3->_watchdogTimer;
    v3->_watchdogTimer = (HMFTimer *)v4;

    [(HMFTimer *)v3->_watchdogTimer setDelegate:v3];
  }
  return v3;
}

- (VNSession)vnSession
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (!self->_session)
  {
    uint64_t v4 = (HMFOSTransaction *)[objc_alloc(MEMORY[0x263F425C0]) initWithName:@"HMIVisionSession"];
    transaction = self->_transaction;
    self->_transaction = v4;

    id v6 = (VNSession *)objc_alloc_init(MEMORY[0x263F1F000]);
    session = self->_session;
    self->_session = v6;
  }
  int v8 = [(HMIVisionSession *)self watchdogTimer];
  [v8 resume];

  v9 = self->_session;
  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (void)timerDidFire:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x22A641C70]();
  p_lock = &self->_lock;
  uint64_t v7 = os_unfair_lock_lock_with_options();
  int v8 = (void *)MEMORY[0x22A641C70](v7);
  v9 = self;
  HMFGetOSLogHandle();
  uint64_t v10 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    int v14 = 138543362;
    v15 = v11;
    _os_log_impl(&dword_225DC6000, v10, OS_LOG_TYPE_INFO, "%{public}@Releasing vision session and transaction after period of inactivity", (uint8_t *)&v14, 0xCu);
  }
  session = v9->_session;
  v9->_session = 0;

  transaction = v9->_transaction;
  v9->_transaction = 0;

  os_unfair_lock_unlock(p_lock);
}

- (HMFTimer)watchdogTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 24, 1);
}

- (HMFOSTransaction)transaction
{
  return (HMFOSTransaction *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_watchdogTimer, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end