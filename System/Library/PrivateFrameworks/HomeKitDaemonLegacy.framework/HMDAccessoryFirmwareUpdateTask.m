@interface HMDAccessoryFirmwareUpdateTask
+ (id)logCategory;
- (BOOL)isUserInitiated;
- (BOOL)shouldRun;
- (BOOL)shouldRunOnCurrentDevice;
- (HMDAccessoryFirmwareUpdateProfile)profile;
- (HMDAccessoryFirmwareUpdateSession)session;
- (HMDAccessoryFirmwareUpdateTask)initWithSession:(id)a3 profile:(id)a4 initialDelay:(double)a5;
- (HMDHAPAccessory)accessory;
- (NSString)description;
- (OS_xpc_object)criteria;
- (double)initialDelay;
- (id)privateDescription;
- (int64_t)accessoryActiveTransport;
- (void)run;
@end

@implementation HMDAccessoryFirmwareUpdateTask

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
  objc_destroyWeak((id *)&self->_session);
}

- (HMDAccessoryFirmwareUpdateProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  return (HMDAccessoryFirmwareUpdateProfile *)WeakRetained;
}

- (HMDAccessoryFirmwareUpdateSession)session
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);
  return (HMDAccessoryFirmwareUpdateSession *)WeakRetained;
}

- (double)initialDelay
{
  return self->_initialDelay;
}

- (int64_t)accessoryActiveTransport
{
  id v2 = [(HMDAccessoryFirmwareUpdateTask *)self accessory];
  if ([v2 isReachable])
  {
    if ([v2 isThreadTheCurrentlyActiveTransport])
    {
      int64_t v3 = 4;
    }
    else if ([v2 hasBTLELink])
    {
      int64_t v3 = 3;
    }
    else if ([v2 hasIPLink])
    {
      int64_t v3 = 2;
    }
    else
    {
      int64_t v3 = 1;
    }
  }
  else
  {
    int64_t v3 = 1;
  }

  return v3;
}

- (void)run
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (HMDHAPAccessory)accessory
{
  id v2 = [(HMDAccessoryFirmwareUpdateTask *)self session];
  uint64_t v3 = [v2 hapAccessory];

  return (HMDHAPAccessory *)v3;
}

- (BOOL)shouldRunOnCurrentDevice
{
  id v2 = [(HMDAccessoryFirmwareUpdateTask *)self accessory];
  char v3 = [v2 isReachable];

  return v3;
}

- (BOOL)isUserInitiated
{
  return 0;
}

- (BOOL)shouldRun
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (OS_xpc_object)criteria
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (id)privateDescription
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = NSNumber;
  [(HMDAccessoryFirmwareUpdateTask *)self initialDelay];
  v6 = objc_msgSend(v5, "numberWithDouble:");
  [(HMDAccessoryFirmwareUpdateTask *)self shouldRun];
  id v7 = HMFBooleanToString();
  v8 = [v3 stringWithFormat:@"<%@, Initial Delay = %@, Should Run = %@>", v4, v6, v7];

  return v8;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = NSNumber;
  [(HMDAccessoryFirmwareUpdateTask *)self initialDelay];
  v6 = objc_msgSend(v5, "numberWithDouble:");
  [(HMDAccessoryFirmwareUpdateTask *)self shouldRun];
  id v7 = HMFBooleanToString();
  v8 = [v3 stringWithFormat:@"<%@, Initial Delay = %@, Should Run = %@>", v4, v6, v7];

  return (NSString *)v8;
}

- (HMDAccessoryFirmwareUpdateTask)initWithSession:(id)a3 profile:(id)a4 initialDelay:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMDAccessoryFirmwareUpdateTask;
  v10 = [(HMDAccessoryFirmwareUpdateTask *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_session, v8);
    objc_storeWeak((id *)&v11->_profile, v9);
    v11->_initialDelay = a5;
  }

  return v11;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_157644 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_157644, &__block_literal_global_157645);
  }
  id v2 = (void *)logCategory__hmf_once_v1_157646;
  return v2;
}

uint64_t __45__HMDAccessoryFirmwareUpdateTask_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_157646;
  logCategory__hmf_once_v1_157646 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end