@interface HMDPresenceNotificationConditionHandler
+ (id)logCategory;
- (BOOL)canHandleCondition:(id)a3;
- (BOOL)conditionPasses:(id)a3 registrationUser:(id)a4;
- (HMDFeaturesDataSource)featuresDataSource;
- (HMDHome)home;
- (HMDPresenceNotificationConditionHandler)initWithHome:(id)a3;
- (HMDPresenceNotificationConditionHandler)initWithHome:(id)a3 presenceProvider:(id)a4 featuresDataSource:(id)a5;
- (HMDPresenceNotificationConditionPresenceProvider)presenceProvider;
@end

@implementation HMDPresenceNotificationConditionHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuresDataSource, 0);
  objc_storeStrong((id *)&self->_presenceProvider, 0);
  objc_destroyWeak((id *)&self->_home);
}

- (HMDFeaturesDataSource)featuresDataSource
{
  return (HMDFeaturesDataSource *)objc_getProperty(self, a2, 24, 1);
}

- (HMDPresenceNotificationConditionPresenceProvider)presenceProvider
{
  return (HMDPresenceNotificationConditionPresenceProvider *)objc_getProperty(self, a2, 16, 1);
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (BOOL)conditionPasses:(id)a3 registrationUser:(id)a4
{
  v64[5] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v52 = a4;
  id v7 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v8 = v7;
  }
  else {
    v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    [v9 presenceEventType];
    uint64_t v10 = [v9 presenceEventUserType];
    v11 = [v9 userUUIDs];
    v12 = objc_msgSend(v11, "na_map:", &__block_literal_global_249417);

    if (v10 == 1)
    {
      v13 = [v52 uuid];
      v14 = (void *)MEMORY[0x230FBD990]();
      v15 = self;
      v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = v17 = v12;
        *(_DWORD *)buf = 138543618;
        v54 = v18;
        __int16 v55 = 2112;
        id v56 = v13;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Replacing HMPresenceEventUserTypeCurrentUser with HMPresenceEventUserTypeCustomUsers and userUUID: %@", buf, 0x16u);

        v12 = v17;
      }

      v19 = (void *)MEMORY[0x263EFFA08];
      v20 = [v13 UUIDString];
      uint64_t v21 = [v19 setWithObject:v20];

      v12 = (void *)v21;
    }
    v22 = presenceTypeForEventTypeAndGranularity();
    v23 = [MEMORY[0x263F0E680] activationGranularityWithValue:granularityForEventType()];
    v63[0] = @"kEventTriggerEndEvent";
    v63[1] = @"kEventTriggerTypeKey";
    v64[0] = &unk_26E473888;
    v64[1] = @"kEventTriggerTypePresenceEventKey";
    v64[2] = v22;
    v63[2] = @"kPresenceEventPresence";
    v63[3] = @"kPresenceEventActivationGranularity";
    v50 = v23;
    v24 = [v23 number];
    v64[3] = v24;
    v63[4] = @"kPresenceEventUsers";
    v51 = v12;
    v25 = [v12 allObjects];
    v64[4] = v25;
    uint64_t v26 = [NSDictionary dictionaryWithObjects:v64 forKeys:v63 count:5];

    v27 = [(HMDPresenceNotificationConditionHandler *)self home];
    v49 = (void *)v26;
    uint64_t v28 = +[HMDPresenceEventModel eventModelWithDictionary:v26 home:v27 eventTriggerUUID:0 message:0];
    v29 = [HMDPresenceEvent alloc];
    v30 = [(HMDPresenceNotificationConditionHandler *)self featuresDataSource];
    v48 = (void *)v28;
    v31 = [(HMDPresenceEvent *)v29 initWithModel:v28 home:v27 featuresDataSource:v30];

    v32 = [(HMDPresenceNotificationConditionHandler *)self presenceProvider];
    v33 = [v32 presenceForHome:v27];

    BOOL v34 = [(HMDPresenceEvent *)v31 evaluateWithHomePresence:v33];
    v35 = (void *)MEMORY[0x230FBD990]();
    v36 = self;
    v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v38 = v46 = v22;
      HMFBooleanToString();
      id v47 = v9;
      v40 = id v39 = v7;
      *(_DWORD *)buf = 138544386;
      v54 = v38;
      __int16 v55 = 2112;
      id v56 = v40;
      __int16 v57 = 2112;
      id v58 = v39;
      __int16 v59 = 2112;
      v60 = v31;
      __int16 v61 = 2112;
      v62 = v33;
      _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_INFO, "%{public}@Condition passes: %@ condition: %@ Presence Event: %@ Home Presence: %@", buf, 0x34u);

      id v7 = v39;
      id v9 = v47;

      v22 = v46;
    }
  }
  else
  {
    v41 = (void *)MEMORY[0x230FBD990]();
    v42 = self;
    v43 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      v44 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v54 = v44;
      __int16 v55 = 2112;
      id v56 = v7;
      _os_log_impl(&dword_22F52A000, v43, OS_LOG_TYPE_ERROR, "%{public}@Attempting to evaluate a non-presence condition: %@", buf, 0x16u);
    }
    BOOL v34 = 0;
  }

  return v34;
}

uint64_t __76__HMDPresenceNotificationConditionHandler_conditionPasses_registrationUser___block_invoke(uint64_t a1, void *a2)
{
  return [a2 UUIDString];
}

- (BOOL)canHandleCondition:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  BOOL v4 = objc_opt_isKindOfClass() & (v3 != 0);

  return v4;
}

- (HMDPresenceNotificationConditionHandler)initWithHome:(id)a3 presenceProvider:(id)a4 featuresDataSource:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    v11 = v10;
    v18.receiver = self;
    v18.super_class = (Class)HMDPresenceNotificationConditionHandler;
    v12 = [(HMDPresenceNotificationConditionHandler *)&v18 init];
    v13 = v12;
    if (v12)
    {
      objc_storeWeak((id *)&v12->_home, v8);
      objc_storeStrong((id *)&v13->_presenceProvider, a4);
      objc_storeStrong((id *)&v13->_featuresDataSource, a5);
    }

    return v13;
  }
  else
  {
    v15 = (HMDPresenceNotificationConditionHandler *)_HMFPreconditionFailure();
    return [(HMDPresenceNotificationConditionHandler *)v15 initWithHome:v17];
  }
}

- (HMDPresenceNotificationConditionHandler)initWithHome:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(HMDPresenceNotificationConditionDefaultPresenceProvider);
  id v6 = [v4 featureDataSource];
  id v7 = [(HMDPresenceNotificationConditionHandler *)self initWithHome:v4 presenceProvider:v5 featuresDataSource:v6];

  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t5_249439 != -1) {
    dispatch_once(&logCategory__hmf_once_t5_249439, &__block_literal_global_16_249440);
  }
  v2 = (void *)logCategory__hmf_once_v6_249441;
  return v2;
}

void __54__HMDPresenceNotificationConditionHandler_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v6_249441;
  logCategory__hmf_once_v6_249441 = v0;
}

@end