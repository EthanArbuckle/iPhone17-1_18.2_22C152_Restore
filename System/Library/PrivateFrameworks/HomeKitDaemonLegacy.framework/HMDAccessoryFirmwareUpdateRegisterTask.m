@interface HMDAccessoryFirmwareUpdateRegisterTask
- (BOOL)isUserInitiated;
- (BOOL)shouldRun;
- (HMDAccessoryFirmwareUpdateRegisterTask)initWithSession:(id)a3 profile:(id)a4 initialDelay:(double)a5;
- (id)criteria;
- (void)run;
@end

@implementation HMDAccessoryFirmwareUpdateRegisterTask

- (BOOL)isUserInitiated
{
  return self->_userInitiated;
}

- (void)run
{
  id v2 = [(HMDAccessoryFirmwareUpdateTask *)self session];
  [v2 resumeWithState:3];
}

- (BOOL)shouldRun
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDAccessoryFirmwareUpdateTask *)self session];
  BOOL v4 = [(HMDAccessoryFirmwareUpdateTask *)self shouldRunOnCurrentDevice];
  if (!v4)
  {
    v5 = (void *)MEMORY[0x1D9452090]();
    v6 = self;
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = HMFGetLogIdentifier();
      [(HMDAccessoryFirmwareUpdateTask *)v6 shouldRunOnCurrentDevice];
      v9 = HMFBooleanToString();
      uint64_t v10 = [v3 sessionState];
      if ((unint64_t)(v10 - 1) > 2) {
        v11 = @"Up-To-Date";
      }
      else {
        v11 = off_1E6A10920[v10 - 1];
      }
      v12 = v11;
      int v14 = 138543874;
      v15 = v8;
      __int16 v16 = 2112;
      v17 = v9;
      __int16 v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Register task shouldn't run - runOnCurrentDevice:%@ (%@)", (uint8_t *)&v14, 0x20u);
    }
  }

  return v4;
}

- (id)criteria
{
  int64_t v2 = [(HMDAccessoryFirmwareUpdateTask *)self accessoryActiveTransport];
  switch(v2)
  {
    case 4:
      v3 = threadAccessoryStageSystemCriteria();
      break;
    case 3:
      v3 = bleAccessoryStageSystemCriteria();
      break;
    case 2:
      v3 = ipAccessoryStageSystemCriteria();
      break;
    default:
      v3 = 0;
      break;
  }
  return v3;
}

- (HMDAccessoryFirmwareUpdateRegisterTask)initWithSession:(id)a3 profile:(id)a4 initialDelay:(double)a5
{
  v6.receiver = self;
  v6.super_class = (Class)HMDAccessoryFirmwareUpdateRegisterTask;
  return [(HMDAccessoryFirmwareUpdateTask *)&v6 initWithSession:a3 profile:a4 initialDelay:a5];
}

@end