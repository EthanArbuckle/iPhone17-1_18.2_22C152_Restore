@interface HMMTRAttributeTimer
+ (id)logCategory;
- (HMFTimer)attributeTimer;
- (HMMTRAccessoryServer)server;
- (HMMTRAttributeTimer)initWithServer:(id)a3 report:(id)a4 timeout:(double)a5 queue:(id)a6 server:(id)a7;
- (MTRAttributePath)path;
- (NSMutableDictionary)report;
- (void)setAttributeTimer:(id)a3;
- (void)setReport:(id)a3;
- (void)start;
- (void)stop;
- (void)timerDidFire:(id)a3;
- (void)updateReport:(id)a3;
@end

@implementation HMMTRAttributeTimer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_report, 0);
  objc_destroyWeak((id *)&self->_server);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_attributeTimer, 0);
}

- (void)setReport:(id)a3
{
}

- (NSMutableDictionary)report
{
  return self->_report;
}

- (HMMTRAccessoryServer)server
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  return (HMMTRAccessoryServer *)WeakRetained;
}

- (MTRAttributePath)path
{
  return self->_path;
}

- (void)setAttributeTimer:(id)a3
{
}

- (HMFTimer)attributeTimer
{
  return self->_attributeTimer;
}

- (void)timerDidFire:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x2533B64D0]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = HMFGetLogIdentifier();
    path = v6->_path;
    report = v6->_report;
    int v12 = 138543874;
    v13 = v8;
    __int16 v14 = 2112;
    v15 = path;
    __int16 v16 = 2112;
    v17 = report;
    _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Attribute timer triggered for path %@ with report %@", (uint8_t *)&v12, 0x20u);
  }
  v11 = [(HMMTRAttributeTimer *)v6 server];
  [v11 processAttributeReport:v6->_report];
}

- (void)stop
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x2533B64D0](self, a2);
  id v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = HMFGetLogIdentifier();
    path = v4->_path;
    int v9 = 138543618;
    v10 = v6;
    __int16 v11 = 2112;
    int v12 = path;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Stopping attribute timer for path %@", (uint8_t *)&v9, 0x16u);
  }
  v8 = [(HMMTRAttributeTimer *)v4 attributeTimer];
  [v8 suspend];
}

- (void)start
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x2533B64D0](self, a2);
  id v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = HMFGetLogIdentifier();
    [(HMFTimer *)v4->_attributeTimer timeInterval];
    path = v4->_path;
    int v10 = 138543874;
    __int16 v11 = v6;
    __int16 v12 = 2048;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    v15 = path;
    _os_log_impl(&dword_252495000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Starting attribute timer with delay of %f for path %@", (uint8_t *)&v10, 0x20u);
  }
  int v9 = [(HMMTRAttributeTimer *)v4 attributeTimer];
  [v9 resume];
}

- (void)updateReport:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x2533B64D0]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    path = v6->_path;
    int v13 = 138543874;
    __int16 v14 = v8;
    __int16 v15 = 2112;
    uint64_t v16 = path;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl(&dword_252495000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Update report for path %@ with report %@ and reset timer", (uint8_t *)&v13, 0x20u);
  }
  uint64_t v10 = [v4 mutableCopy];
  report = v6->_report;
  v6->_report = (NSMutableDictionary *)v10;

  __int16 v12 = [(HMMTRAttributeTimer *)v6 attributeTimer];
  [v12 resume];
}

- (HMMTRAttributeTimer)initWithServer:(id)a3 report:(id)a4 timeout:(double)a5 queue:(id)a6 server:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  v24.receiver = self;
  v24.super_class = (Class)HMMTRAttributeTimer;
  __int16 v17 = [(HMMTRAttributeTimer *)&v24 init];
  id v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_server, v16);
    objc_storeStrong((id *)&v18->_path, a3);
    uint64_t v19 = [v14 mutableCopy];
    report = v18->_report;
    v18->_report = (NSMutableDictionary *)v19;

    uint64_t v21 = [objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:2 options:a5];
    attributeTimer = v18->_attributeTimer;
    v18->_attributeTimer = (HMFTimer *)v21;

    [(HMFTimer *)v18->_attributeTimer setDelegateQueue:v15];
    [(HMFTimer *)v18->_attributeTimer setDelegate:v18];
  }

  return v18;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4 != -1) {
    dispatch_once(&logCategory__hmf_once_t4, &__block_literal_global_3178);
  }
  v2 = (void *)logCategory__hmf_once_v5;
  return v2;
}

uint64_t __34__HMMTRAttributeTimer_logCategory__block_invoke()
{
  logCategory__hmf_once_v5 = HMFCreateOSLogHandle();
  return MEMORY[0x270F9A758]();
}

@end