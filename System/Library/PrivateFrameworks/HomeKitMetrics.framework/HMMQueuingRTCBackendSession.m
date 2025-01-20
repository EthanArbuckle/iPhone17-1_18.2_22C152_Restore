@interface HMMQueuingRTCBackendSession
+ (id)logCategory;
- (BOOL)isRealtime;
- (BOOL)sendMessage:(id)a3;
- (HMMQueuingRTCBackendSession)initWithServiceName:(id)a3 sessionUUID:(id)a4 isRealtime:(BOOL)a5 submitter:(id)a6 timeSourceBlock:(id)a7;
- (NSString)serviceName;
- (NSUUID)sessionUUID;
- (_HMMLogBackendSubmitterDelegate)submitter;
- (double)lastEventTime;
- (id)timeSourceBlock;
- (void)close;
- (void)dealloc;
@end

@implementation HMMQueuingRTCBackendSession

- (void).cxx_destruct
{
  objc_storeStrong(&self->_timeSourceBlock, 0);
  objc_destroyWeak((id *)&self->_submitter);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_queuedEvents, 0);
}

- (id)timeSourceBlock
{
  return self->_timeSourceBlock;
}

- (_HMMLogBackendSubmitterDelegate)submitter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_submitter);
  return (_HMMLogBackendSubmitterDelegate *)WeakRetained;
}

- (BOOL)isRealtime
{
  return self->_isRealtime;
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)dealloc
{
  [(HMMQueuingRTCBackendSession *)self close];
  v3.receiver = self;
  v3.super_class = (Class)HMMQueuingRTCBackendSession;
  [(HMMQueuingRTCBackendSession *)&v3 dealloc];
}

- (void)close
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  BOOL isOpen = self->_isOpen;
  self->_BOOL isOpen = 0;
  os_unfair_lock_unlock(p_lock);
  if (isOpen && [(NSMutableArray *)self->_queuedEvents count])
  {
    id v8 = [(HMMQueuingRTCBackendSession *)self submitter];
    v5 = (void *)[(NSMutableArray *)self->_queuedEvents copy];
    v6 = [(HMMQueuingRTCBackendSession *)self serviceName];
    v7 = [(HMMQueuingRTCBackendSession *)self sessionUUID];
    objc_msgSend(v8, "submitMessages:serviceName:sessionUUID:isRealtime:", v5, v6, v7, -[HMMQueuingRTCBackendSession isRealtime](self, "isRealtime"));
  }
}

- (double)lastEventTime
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  double lastEventTime = self->_lastEventTime;
  os_unfair_lock_unlock(p_lock);
  return lastEventTime;
}

- (BOOL)sendMessage:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  if (self->_isOpen)
  {
    [(NSMutableArray *)self->_queuedEvents addObject:v4];
    self->_double lastEventTime = (*((double (**)(void))self->_timeSourceBlock + 2))();
  }
  os_unfair_lock_unlock(&self->_lock);

  return 1;
}

- (HMMQueuingRTCBackendSession)initWithServiceName:(id)a3 sessionUUID:(id)a4 isRealtime:(BOOL)a5 submitter:(id)a6 timeSourceBlock:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  v16 = (double (**)(void))a7;
  v24.receiver = self;
  v24.super_class = (Class)HMMQueuingRTCBackendSession;
  v17 = [(HMMQueuingRTCBackendSession *)&v24 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_serviceName, a3);
    objc_storeStrong((id *)&v18->_sessionUUID, a4);
    v18->_isRealtime = a5;
    objc_storeWeak((id *)&v18->_submitter, v15);
    uint64_t v19 = MEMORY[0x1D944EB70](v16);
    id timeSourceBlock = v18->_timeSourceBlock;
    v18->_id timeSourceBlock = (id)v19;

    v18->_BOOL isOpen = 1;
    uint64_t v21 = [MEMORY[0x1E4F1CA48] array];
    queuedEvents = v18->_queuedEvents;
    v18->_queuedEvents = (NSMutableArray *)v21;

    v18->_double lastEventTime = v16[2](v16);
  }

  return v18;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3 != -1) {
    dispatch_once(&logCategory__hmf_once_t3, &__block_literal_global_324);
  }
  v2 = (void *)logCategory__hmf_once_v4;
  return v2;
}

uint64_t __42__HMMQueuingRTCBackendSession_logCategory__block_invoke()
{
  logCategory__hmf_once_id v4 = HMFCreateOSLogHandle();
  return MEMORY[0x1F41817F8]();
}

@end