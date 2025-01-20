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
  v6 = +[HMDCharacteristicEventBase compareValueOfCharacteristic:v4 againstValue:v5 operatorType:&unk_26E470C30];
  char v7 = [v6 BOOLValue];

  return v7;
}

- (BOOL)_evaluateNewValue:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDCharacteristicEventBase *)self characteristic];
  v6 = [v5 previousValue];

  if (v4) {
    LODWORD(v7) = ![(HMDCharacteristicMonitorEvent *)self _compareEventValue:v4];
  }
  else {
    LOBYTE(v7) = 0;
  }
  v8 = (void *)MEMORY[0x230FBD990]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    v12 = HMFBooleanToString();
    v13 = [(HMDCharacteristicEventBase *)v9 characteristic];
    v14 = [v13 value];
    [(HMDCharacteristicEvent *)v9 eventValue];
    v15 = v19 = v8;
    [(HMDCharacteristicEventBase *)v9 characteristic];
    BOOL v18 = v7;
    v16 = BOOL v7 = (BOOL)v6;
    *(_DWORD *)buf = 138544642;
    v21 = v11;
    __int16 v22 = 2112;
    v23 = v12;
    __int16 v24 = 2112;
    BOOL v25 = v7;
    __int16 v26 = 2112;
    v27 = v14;
    __int16 v28 = 2112;
    v29 = v15;
    __int16 v30 = 2112;
    v31 = v16;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Evaluated event, should fire: %@, previous value: %@, current value: %@, event monitor value: %@, %@", buf, 0x3Eu);

    v6 = (void *)v7;
    LOBYTE(v7) = v18;

    v8 = v19;
  }

  return v7;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMDCharacteristicMonitorEvent;
  id v4 = [(HMDCharacteristicEvent *)&v8 description];
  v5 = [(HMDCharacteristicEvent *)self eventValue];
  v6 = [v3 stringWithFormat:@"[Char-Monitor-Event: %@, event value: %@]", v4, v5];

  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_29742 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_29742, &__block_literal_global_29743);
  }
  v2 = (void *)logCategory__hmf_once_v1_29744;
  return v2;
}

void __44__HMDCharacteristicMonitorEvent_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_29744;
  logCategory__hmf_once_v1_29744 = v0;
}

@end