@interface HMDSharedUserInviteLogEventBuilder
+ (id)logCategory;
- (BOOL)isIDSAvailable;
- (BOOL)isNetworkAvailable;
- (BOOL)isReady;
- (BOOL)isiCloudSignedIn;
- (HMDSharedUserInviteLogEventBuilder)initWithLogEvent:(id)a3 homeManager:(id)a4 sessionIdentifier:(id)a5 invitationType:(unint64_t)a6 logEventSubmitter:(id)a7 wifiManager:(id)a8 currentUpTicksBlock:(id)a9 submissionTimerFactory:(id)a10;
- (id)currentUpTicksBlock;
- (int64_t)IDSAccountRegistrationError;
- (int64_t)IDSAccountRegistrationStatus;
- (void)cancel;
- (void)markAddUserBegin;
- (void)markAddUserEnd;
- (void)markError:(id)a3;
- (void)startSubmissionTimer;
- (void)submit;
- (void)submitIfReady;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDSharedUserInviteLogEventBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_submissionTimer, 0);
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_storeStrong(&self->_submissionTimerFactory, 0);
  objc_destroyWeak((id *)&self->_logEventSubmitter);
  objc_storeStrong((id *)&self->_logEvent, 0);
  objc_storeStrong(&self->_currentUpTicksBlock, 0);
}

- (id)currentUpTicksBlock
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)timerDidFire:(id)a3
{
  id v12 = a3;
  os_unfair_lock_lock_with_options();
  if (self) {
    id Property = objc_getProperty(self, v4, 40, 1);
  }
  else {
    id Property = 0;
  }
  id v6 = Property;
  v7 = [v6 error];

  if (!v7)
  {
    v9 = [MEMORY[0x1E4F28C58] hmErrorWithCode:8];
    if (self) {
      id v10 = objc_getProperty(self, v8, 40, 1);
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;
    [v11 setError:v9];
  }
  [(HMDSharedUserInviteLogEventBuilder *)self submit];
  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)isiCloudSignedIn
{
  v2 = +[HMDAppleAccountManager sharedManager];
  char v3 = [v2 isLoggedInToPrimaryAccount];

  return v3;
}

- (BOOL)isNetworkAvailable
{
  if (self) {
    self = (HMDSharedUserInviteLogEventBuilder *)objc_getProperty(self, a2, 64, 1);
  }
  v2 = [(HMDSharedUserInviteLogEventBuilder *)self currentNetworkAssociation];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isIDSAvailable
{
  v2 = +[HMDAppleAccountManager sharedManager];
  char v3 = [v2 isServiceActive];

  return v3;
}

- (int64_t)IDSAccountRegistrationStatus
{
  v2 = +[HMDAppleAccountManager sharedManager];
  int64_t v3 = [v2 IDSAccountRegistrationStatus];

  return v3;
}

- (int64_t)IDSAccountRegistrationError
{
  v2 = +[HMDAppleAccountManager sharedManager];
  int64_t v3 = [v2 IDSAccountRegistrationError];

  return v3;
}

- (void)submit
{
  os_unfair_lock_assert_owner(&self->_lock);
  if (!*(_WORD *)&self->submitted)
  {
    self->submitted = 1;
    objc_msgSend(objc_getProperty(self, v3, 72, 1), "cancel");
    objc_setProperty_atomic(self, v4, 0, 72);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_logEventSubmitter);
    objc_msgSend(WeakRetained, "submitLogEvent:", objc_getProperty(self, v5, 40, 1));
  }
}

- (void)submitIfReady
{
  os_unfair_lock_assert_owner(&self->_lock);
  if ([(HMDSharedUserInviteLogEventBuilder *)self isReady])
  {
    [(HMDSharedUserInviteLogEventBuilder *)self submit];
  }
}

- (BOOL)isReady
{
  os_unfair_lock_assert_owner(&self->_lock);
  BOOL cancelled = self->cancelled;
  if (!self->cancelled)
  {
    objc_msgSend(objc_getProperty(self, v3, 40, 1), "error");
  }
  return !cancelled;
}

- (void)cancel
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (!self->submitted) {
    self->BOOL cancelled = 1;
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)markError:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  SEL v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = HMFGetLogIdentifier();
    int v17 = 138543618;
    v18 = v8;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@markError %@", (uint8_t *)&v17, 0x16u);
  }
  p_lock = &v6->_lock;
  uint64_t v10 = os_unfair_lock_lock_with_options();
  if (!v6->submitted)
  {
    if (v4)
    {
      id v12 = objc_getProperty(v6, v11, 40, 1);
      [v12 setError:v4];
    }
    v13 = (void *)MEMORY[0x1D9452090](v10);
    v14 = v6;
    HMFGetOSLogHandle();
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = HMFGetLogIdentifier();
      int v17 = 138543618;
      v18 = v16;
      __int16 v19 = 2112;
      id v20 = v4;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Shared user invite error occured. Logging error metric %@", (uint8_t *)&v17, 0x16u);
    }
    [(HMDSharedUserInviteLogEventBuilder *)v14 submit];
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)markAddUserEnd
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  SEL v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)markAddUserBegin
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  SEL v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)startSubmissionTimer
{
  v2 = self;
  if (self) {
    self = (HMDSharedUserInviteLogEventBuilder *)objc_getProperty(self, a2, 56, 1);
  }
  uint64_t v3 = ((void (*)(HMDSharedUserInviteLogEventBuilder *, SEL))self->eventCreatedTime)(self, a2);
  SEL v5 = v3;
  if (v2)
  {
    objc_setProperty_atomic(v2, v4, v3, 72);

    objc_msgSend(objc_getProperty(v2, v6, 72, 1), "setDelegate:", v2);
    id Property = objc_getProperty(v2, v7, 72, 1);
  }
  else
  {

    [0 setDelegate:0];
    id Property = 0;
  }
  [Property resume];
}

- (HMDSharedUserInviteLogEventBuilder)initWithLogEvent:(id)a3 homeManager:(id)a4 sessionIdentifier:(id)a5 invitationType:(unint64_t)a6 logEventSubmitter:(id)a7 wifiManager:(id)a8 currentUpTicksBlock:(id)a9 submissionTimerFactory:(id)a10
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a7;
  id v30 = a8;
  uint64_t v21 = (uint64_t (**)(void))a9;
  id v22 = a10;
  v31.receiver = self;
  v31.super_class = (Class)HMDSharedUserInviteLogEventBuilder;
  v23 = [(HMDSharedUserInviteLogEventBuilder *)&v31 init];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_logEvent, a3);
    objc_storeWeak((id *)&v24->_logEventSubmitter, v20);
    v25 = _Block_copy(v21);
    id currentUpTicksBlock = v24->_currentUpTicksBlock;
    v24->_id currentUpTicksBlock = v25;

    v27 = _Block_copy(v22);
    id submissionTimerFactory = v24->_submissionTimerFactory;
    v24->_id submissionTimerFactory = v27;

    objc_storeStrong((id *)&v24->_wifiManager, a8);
    v24->eventCreatedTime = v21[2](v21);
    [v17 setSessionIdentifier:v19];
    [v17 setInvitationType:a6];
    objc_msgSend(v17, "setICloudSignedIn:", -[HMDSharedUserInviteLogEventBuilder isiCloudSignedIn](v24, "isiCloudSignedIn"));
    objc_msgSend(v17, "setManateeAvailable:", objc_msgSend(v18, "pcsEnabled"));
    objc_msgSend(v17, "setNetworkAvailable:", -[HMDSharedUserInviteLogEventBuilder isNetworkAvailable](v24, "isNetworkAvailable"));
    objc_msgSend(v17, "setIDSAvailable:", -[HMDSharedUserInviteLogEventBuilder isIDSAvailable](v24, "isIDSAvailable"));
    objc_msgSend(v17, "setIDSRegistrationStatus:", -[HMDSharedUserInviteLogEventBuilder IDSAccountRegistrationStatus](v24, "IDSAccountRegistrationStatus"));
    objc_msgSend(v17, "setIDSRegistrationError:", -[HMDSharedUserInviteLogEventBuilder IDSAccountRegistrationError](v24, "IDSAccountRegistrationError"));
    [(HMDSharedUserInviteLogEventBuilder *)v24 startSubmissionTimer];
  }

  return v24;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t5_161497 != -1) {
    dispatch_once(&logCategory__hmf_once_t5_161497, &__block_literal_global_161498);
  }
  v2 = (void *)logCategory__hmf_once_v6_161499;
  return v2;
}

uint64_t __49__HMDSharedUserInviteLogEventBuilder_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v6_161499;
  logCategory__hmf_once_v6_161499 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end