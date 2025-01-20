@interface HMDAccessoryFirmwareUpdateApplyTask
- (BOOL)_isApplyAllowedByPolicy;
- (BOOL)isUserInitiated;
- (BOOL)shouldRun;
- (HMDAccessoryFirmwareUpdateApplyTask)initWithSession:(id)a3 profile:(id)a4 policy:(id)a5 userInitiated:(BOOL)a6 delay:(BOOL)a7;
- (HMDAccessoryFirmwareUpdatePolicy)policy;
- (id)criteria;
- (void)run;
@end

@implementation HMDAccessoryFirmwareUpdateApplyTask

- (void).cxx_destruct
{
}

- (HMDAccessoryFirmwareUpdatePolicy)policy
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_policy);
  return (HMDAccessoryFirmwareUpdatePolicy *)WeakRetained;
}

- (BOOL)isUserInitiated
{
  return self->_userInitiated;
}

- (BOOL)_isApplyAllowedByPolicy
{
  v3 = [(HMDAccessoryFirmwareUpdateApplyTask *)self policy];
  BOOL v4 = [(HMDAccessoryFirmwareUpdateApplyTask *)self isUserInitiated];
  char v5 = 1;
  if (!v4 && v3) {
    char v5 = [v3 status];
  }

  return v5;
}

- (void)run
{
  id v2 = [(HMDAccessoryFirmwareUpdateTask *)self session];
  [v2 resumeWithState:2];
}

- (BOOL)shouldRun
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDAccessoryFirmwareUpdateTask *)self session];
  if ([(HMDAccessoryFirmwareUpdateTask *)self shouldRunOnCurrentDevice]
    && [v3 isReadyToApplyUpdate]
    && [v3 sessionState] == 2
    && [(HMDAccessoryFirmwareUpdateApplyTask *)self _isApplyAllowedByPolicy])
  {
    BOOL v4 = 1;
  }
  else
  {
    char v5 = (void *)MEMORY[0x1D9452090]();
    v6 = self;
    v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = HMFGetLogIdentifier();
      [v3 isReadyToApplyUpdate];
      v9 = HMFBooleanToString();
      [v3 sessionState];
      v10 = HMFBooleanToString();
      uint64_t v11 = [v3 sessionState];
      if ((unint64_t)(v11 - 1) > 2) {
        v12 = @"Up-To-Date";
      }
      else {
        v12 = off_1E6A10920[v11 - 1];
      }
      v13 = v12;
      [(HMDAccessoryFirmwareUpdateApplyTask *)v6 _isApplyAllowedByPolicy];
      v14 = HMFBooleanToString();
      int v16 = 138544386;
      v17 = v8;
      __int16 v18 = 2112;
      v19 = v9;
      __int16 v20 = 2112;
      v21 = v10;
      __int16 v22 = 2112;
      v23 = v13;
      __int16 v24 = 2112;
      v25 = v14;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Apply task shouldn't run - readyForApply:%@ needsApply:%@ (%@) policyCheck: %@", (uint8_t *)&v16, 0x34u);
    }
    BOOL v4 = 0;
  }

  return v4;
}

- (id)criteria
{
  if ([(HMDAccessoryFirmwareUpdateApplyTask *)self isUserInitiated]) {
    goto LABEL_6;
  }
  int64_t v3 = [(HMDAccessoryFirmwareUpdateTask *)self accessoryActiveTransport];
  if (v3 == 4)
  {
    xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x1E4F141C0], "com.apple.homed.firmwareUpdate.threadAccessory.apply.group");
    char v5 = (const char *)*MEMORY[0x1E4F141B8];
    v6 = @"firmwareUpdateThreadAccessoryApplyConcurrentLimit";
    goto LABEL_8;
  }
  if (v3 == 3)
  {
    xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x1E4F141C0], "com.apple.homed.firmwareUpdate.bleAccessory.apply.group");
    v8 = (const char *)*MEMORY[0x1E4F141B8];
    unsigned int v9 = uint32ForPreference(@"firmwareUpdateBLEAccessoryApplyConcurrentLimit");
    xpc_dictionary_set_uint64(v4, v8, v9);
    goto LABEL_10;
  }
  if (v3 != 2)
  {
LABEL_6:
    xpc_object_t v4 = 0;
    goto LABEL_11;
  }
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x1E4F141C0], "com.apple.homed.firmwareUpdate.ipAccessory.apply.group");
  char v5 = (const char *)*MEMORY[0x1E4F141B8];
  v6 = @"firmwareUpdateIPAccessoryApplyConcurrentLimit";
LABEL_8:
  unsigned int v7 = uint32ForPreference(v6);
  xpc_dictionary_set_uint64(v4, v5, v7);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E4F14330], 1);
LABEL_10:
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E4F14138], 1);
LABEL_11:
  return v4;
}

- (HMDAccessoryFirmwareUpdateApplyTask)initWithSession:(id)a3 profile:(id)a4 policy:(id)a5 userInitiated:(BOOL)a6 delay:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  double v15 = 0.0;
  if (v7 && !a6)
  {
    int v16 = uint32ForPreference(@"firmwareUpdateApplyMinDelay");
    int v17 = uint32ForPreference(@"firmwareUpdateApplyMaxDelay");
    double v15 = (double)(arc4random_uniform(1000 * (v17 - v16)) + 1000 * v16) / 1000.0;
  }
  v21.receiver = self;
  v21.super_class = (Class)HMDAccessoryFirmwareUpdateApplyTask;
  __int16 v18 = [(HMDAccessoryFirmwareUpdateTask *)&v21 initWithSession:v12 profile:v13 initialDelay:v15];
  v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_policy, v14);
    v19->_userInitiated = a6;
  }

  return v19;
}

@end