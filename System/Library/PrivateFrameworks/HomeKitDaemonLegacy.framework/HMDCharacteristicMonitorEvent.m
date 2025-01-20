@interface HMDCharacteristicMonitorEvent
+ (id)logCategory;
- (BOOL)_compareEventValue:(id)a3;
- (BOOL)_evaluateNewValue:(id)a3;
- (BOOL)isCompatibleWithEvent:(id)a3;
- (id)description;
@end

@implementation HMDCharacteristicMonitorEvent

- (BOOL)isCompatibleWithEvent:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HMDCharacteristicMonitorEvent;
  return [(HMDCharacteristicEvent *)&v4 isCompatibleWithEvent:a3];
}

- (BOOL)_compareEventValue:(id)a3
{
  objc_super v4 = [(HMDCharacteristicEventBase *)self characteristic];
  v5 = [(HMDCharacteristicEvent *)self eventValue];
  v6 = +[HMDCharacteristicEventBase compareValueOfCharacteristic:v4 againstValue:v5 operatorType:&unk_1F2DC7810];
  char v7 = [v6 BOOLValue];

  return v7;
}

- (BOOL)_evaluateNewValue:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDCharacteristicEventBase *)self previousValue];
  if (v4) {
    BOOL v6 = ![(HMDCharacteristicMonitorEvent *)self _compareEventValue:v4];
  }
  else {
    LOBYTE(v6) = 0;
  }
  char v7 = (void *)MEMORY[0x1D9452090]();
  v8 = self;
  v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = v18 = v5;
    v11 = HMFBooleanToString();
    v12 = [(HMDCharacteristicEventBase *)v8 characteristic];
    v13 = [v12 value];
    [(HMDCharacteristicEvent *)v8 eventValue];
    v14 = v17 = v7;
    v15 = [(HMDCharacteristicEventBase *)v8 characteristic];
    *(_DWORD *)buf = 138544642;
    v20 = v10;
    __int16 v21 = 2112;
    v22 = v11;
    __int16 v23 = 2112;
    v24 = v18;
    __int16 v25 = 2112;
    v26 = v13;
    __int16 v27 = 2112;
    v28 = v14;
    __int16 v29 = 2112;
    v30 = v15;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Evaluated event, should fire: %@, previous value: %@, current value: %@, event monitor value: %@, %@", buf, 0x3Eu);

    char v7 = v17;
    v5 = v18;
  }

  return v6;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMDCharacteristicMonitorEvent;
  id v4 = [(HMDCharacteristicEvent *)&v8 description];
  v5 = [(HMDCharacteristicEvent *)self eventValue];
  BOOL v6 = [v3 stringWithFormat:@"[Char-Monitor-Event: %@, event value: %@]", v4, v5];

  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_20987 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_20987, &__block_literal_global_20988);
  }
  v2 = (void *)logCategory__hmf_once_v1_20989;
  return v2;
}

uint64_t __44__HMDCharacteristicMonitorEvent_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_20989;
  logCategory__hmf_once_v1_20989 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end