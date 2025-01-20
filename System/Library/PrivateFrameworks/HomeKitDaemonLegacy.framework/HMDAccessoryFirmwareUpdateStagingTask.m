@interface HMDAccessoryFirmwareUpdateStagingTask
- (BOOL)isUserInitiated;
- (BOOL)shouldRun;
- (HMDAccessoryFirmwareUpdateStagingTask)initWithSession:(id)a3 profile:(id)a4 userInitiated:(BOOL)a5 delay:(BOOL)a6;
- (id)criteria;
- (void)run;
@end

@implementation HMDAccessoryFirmwareUpdateStagingTask

- (BOOL)isUserInitiated
{
  return self->_userInitiated;
}

- (void)run
{
  id v2 = [(HMDAccessoryFirmwareUpdateTask *)self session];
  [v2 resumeWithState:1];
}

- (BOOL)shouldRun
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDAccessoryFirmwareUpdateTask *)self session];
  if ([(HMDAccessoryFirmwareUpdateTask *)self shouldRunOnCurrentDevice]
    && [v3 isReadyForStaging]
    && [v3 sessionState] == 1)
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = (void *)MEMORY[0x1D9452090]();
    v6 = self;
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = HMFGetLogIdentifier();
      [(HMDAccessoryFirmwareUpdateTask *)v6 shouldRunOnCurrentDevice];
      v9 = HMFBooleanToString();
      [v3 isReadyForStaging];
      v10 = HMFBooleanToString();
      [v3 sessionState];
      v11 = HMFBooleanToString();
      uint64_t v12 = [v3 sessionState];
      if ((unint64_t)(v12 - 1) > 2) {
        v13 = @"Up-To-Date";
      }
      else {
        v13 = off_1E6A10920[v12 - 1];
      }
      v14 = v13;
      int v16 = 138544386;
      v17 = v8;
      __int16 v18 = 2112;
      v19 = v9;
      __int16 v20 = 2112;
      v21 = v10;
      __int16 v22 = 2112;
      v23 = v11;
      __int16 v24 = 2112;
      v25 = v14;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Staging task shouldn't run - runOnCurrentDevice:%@ readyForStaging:%@ needsStaging:%@ (%@)", (uint8_t *)&v16, 0x34u);
    }
    BOOL v4 = 0;
  }

  return v4;
}

- (id)criteria
{
  if ([(HMDAccessoryFirmwareUpdateStagingTask *)self isUserInitiated])
  {
LABEL_6:
    BOOL v4 = 0;
    goto LABEL_7;
  }
  int64_t v3 = [(HMDAccessoryFirmwareUpdateTask *)self accessoryActiveTransport];
  switch(v3)
  {
    case 4:
      BOOL v4 = threadAccessoryStageSystemCriteria();
      break;
    case 3:
      BOOL v4 = bleAccessoryStageSystemCriteria();
      break;
    case 2:
      BOOL v4 = ipAccessoryStageSystemCriteria();
      break;
    default:
      goto LABEL_6;
  }
LABEL_7:
  return v4;
}

- (HMDAccessoryFirmwareUpdateStagingTask)initWithSession:(id)a3 profile:(id)a4 userInitiated:(BOOL)a5 delay:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  double v12 = 0.0;
  if (v6 && !a5)
  {
    int v13 = uint32ForPreference(@"firmwareUpdateStageMinDelay");
    int v14 = uint32ForPreference(@"firmwareUpdateStageMaxDelay");
    double v12 = (double)(arc4random_uniform(1000 * (v14 - v13)) + 1000 * v13) / 1000.0;
  }
  v18.receiver = self;
  v18.super_class = (Class)HMDAccessoryFirmwareUpdateStagingTask;
  v15 = [(HMDAccessoryFirmwareUpdateTask *)&v18 initWithSession:v10 profile:v11 initialDelay:v12];
  int v16 = v15;
  if (v15) {
    v15->_userInitiated = a5;
  }

  return v16;
}

@end