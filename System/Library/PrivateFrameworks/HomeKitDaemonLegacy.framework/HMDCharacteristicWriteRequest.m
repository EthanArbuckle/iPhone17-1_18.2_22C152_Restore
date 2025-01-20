@interface HMDCharacteristicWriteRequest
+ (HMDCharacteristicWriteRequest)writeRequestWithCharacteristic:(id)a3 value:(id)a4 authorizationData:(id)a5 identifier:(id)a6 type:(unint64_t)a7;
+ (HMDCharacteristicWriteRequest)writeRequestWithCharacteristic:(id)a3 value:(id)a4 authorizationData:(id)a5 identifier:(id)a6 type:(unint64_t)a7 includeResponseValue:(BOOL)a8;
+ (HMDCharacteristicWriteRequest)writeRequestWithCharacteristic:(id)a3 value:(id)a4 authorizationData:(id)a5 identifier:(id)a6 type:(unint64_t)a7 includeResponseValue:(BOOL)a8 contextData:(id)a9;
+ (HMDCharacteristicWriteRequest)writeRequestWithCharacteristic:(id)a3 value:(id)a4 authorizationData:(id)a5 type:(unint64_t)a6;
+ (id)logCategory;
+ (id)writeRequestForTransitionFetchWithLightProfile:(id)a3;
+ (id)writeRequestForTransitionStartWithLightProfile:(id)a3 naturalLightingEnabled:(BOOL)a4 startDate:(id)a5 type:(unint64_t)a6;
+ (id)writeRequestForTransitionStartWithLightProfile:(id)a3 naturalLightingEnabled:(BOOL)a4 startDate:(id)a5 type:(unint64_t)a6 dataSource:(id)a7;
- (BOOL)includeResponseValue;
- (HMDCharacteristicWriteRequest)initWithCharacteristic:(id)a3 value:(id)a4 authorizationData:(id)a5 identifier:(id)a6 type:(unint64_t)a7 includeResponseValue:(BOOL)a8 contextData:(id)a9;
- (NSData)authorizationData;
- (NSData)contextData;
- (NSUUID)identifier;
- (id)attributeDescriptions;
- (id)value;
- (unint64_t)requestType;
@end

@implementation HMDCharacteristicWriteRequest

+ (id)writeRequestForTransitionFetchWithLightProfile:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 service];
  v6 = (__CFString *)*MEMORY[0x1E4F2CE78];
  v7 = [v5 findCharacteristicWithType:*MEMORY[0x1E4F2CE78]];
  if (v7)
  {
    v8 = [v5 findCharacteristicWithType:@"00000143-0000-1000-8000-0026BB765291"];
    if (v8)
    {
      id v9 = objc_alloc(MEMORY[0x1E4F5BCC8]);
      id v10 = objc_alloc(MEMORY[0x1E4F5BE68]);
      v11 = [v7 instanceID];
      v12 = (void *)[v10 initWithValue:v11];
      v13 = (void *)[v9 initWithHAPInstanceID:v12];

      v14 = (void *)[objc_alloc(MEMORY[0x1E4F5BCA8]) initWithTransitionFetch:v13 transitionStart:0];
      id v36 = 0;
      v15 = [v14 serializeWithError:&v36];
      v16 = (__CFString *)v36;
      context = (void *)MEMORY[0x1D9452090]();
      id v17 = a1;
      v18 = HMFGetOSLogHandle();
      v19 = v18;
      if (v15)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v20 = v33 = v13;
          objc_msgSend(v15, "hmf_hexadecimalRepresentation");
          v21 = v32 = v16;
          *(_DWORD *)buf = 138543618;
          v38 = v20;
          __int16 v39 = 2112;
          v40 = v21;
          _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Writing value to transition control characteristic: %@", buf, 0x16u);

          v16 = v32;
          v13 = v33;
        }

        v22 = +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:v8 value:v15 authorizationData:0 identifier:0 type:0 includeResponseValue:1];
      }
      else
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v34 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v38 = v34;
          __int16 v39 = 2112;
          v40 = v14;
          __int16 v41 = 2112;
          v42 = v16;
          _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize transition control write request %@:%@", buf, 0x20u);
        }
        v22 = 0;
      }
    }
    else
    {
      v27 = (void *)MEMORY[0x1D9452090]();
      id v28 = a1;
      v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v38 = v30;
        __int16 v39 = 2112;
        v40 = v5;
        __int16 v41 = 2112;
        v42 = @"00000143-0000-1000-8000-0026BB765291";
        _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_ERROR, "%{public}@Service doesn't support Value Transition Control Characteristic %@:%@", buf, 0x20u);
      }
      v22 = 0;
    }
  }
  else
  {
    v23 = (void *)MEMORY[0x1D9452090]();
    id v24 = a1;
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v38 = v26;
      __int16 v39 = 2112;
      v40 = v5;
      __int16 v41 = 2112;
      v42 = v6;
      _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_ERROR, "%{public}@Service doesn't support Color Temperature Characteristic %@:%@", buf, 0x20u);
    }
    v22 = 0;
  }

  return v22;
}

+ (id)writeRequestForTransitionStartWithLightProfile:(id)a3 naturalLightingEnabled:(BOOL)a4 startDate:(id)a5 type:(unint64_t)a6 dataSource:(id)a7
{
  BOOL v10 = a4;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  v15 = [v12 service];
  v16 = [v15 findCharacteristicWithType:@"00000143-0000-1000-8000-0026BB765291"];
  if (v16)
  {
    id v17 = [MEMORY[0x1E4F5BCA0] naturalLightingValueTransitionWithLightProfile:v12 naturalLightingEnabled:v10 startDate:v13 dataSource:v14];
    if (v17)
    {
      unint64_t v41 = a6;
      id v18 = objc_alloc_init(MEMORY[0x1E4F5BCA8]);
      id v19 = objc_alloc(MEMORY[0x1E4F5BCD0]);
      v47 = v17;
      v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
      uint64_t v21 = [v19 initWithTransitions:v20];

      v44 = (void *)v21;
      [v18 setTransitionStart:v21];
      id v46 = 0;
      v22 = [v18 serializeWithError:&v46];
      v45 = (__CFString *)v46;
      context = (void *)MEMORY[0x1D9452090]();
      id v23 = a1;
      id v24 = HMFGetOSLogHandle();
      v25 = v24;
      if (v22)
      {
        id v39 = v14;
        id v40 = v13;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          v26 = HMFGetLogIdentifier();
          v27 = objc_msgSend(v22, "hmf_hexadecimalRepresentation");
          *(_DWORD *)buf = 138543618;
          v49 = v26;
          __int16 v50 = 2112;
          id v51 = v27;
          _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Writing value to transition control characteristic: %@", buf, 0x16u);
        }
        id v28 = [v12 uniqueIdentifier];
        v29 = +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:v16 value:v22 authorizationData:0 identifier:v28 type:v41 includeResponseValue:1];

        id v14 = v39;
        id v13 = v40;
      }
      else
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v42 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v49 = v42;
          __int16 v50 = 2112;
          id v51 = v18;
          __int16 v52 = 2112;
          v53 = v45;
          _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize transition control write request %@:%@", buf, 0x20u);
        }
        v29 = 0;
      }
    }
    else
    {
      v34 = (void *)MEMORY[0x1D9452090]();
      id v35 = a1;
      id v36 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v37 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v49 = v37;
        __int16 v50 = 2112;
        id v51 = v12;
        _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_ERROR, "%{public}@Failed to create natural lighting transition for light profile: %@", buf, 0x16u);
      }
      v29 = 0;
    }
  }
  else
  {
    v30 = (void *)MEMORY[0x1D9452090]();
    id v31 = a1;
    v32 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v33 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v49 = v33;
      __int16 v50 = 2112;
      id v51 = v15;
      __int16 v52 = 2112;
      v53 = @"00000143-0000-1000-8000-0026BB765291";
      _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_ERROR, "%{public}@Service doesn't support Value Transition Control Characteristic %@:%@", buf, 0x20u);
    }
    v29 = 0;
  }

  return v29;
}

+ (id)writeRequestForTransitionStartWithLightProfile:(id)a3 naturalLightingEnabled:(BOOL)a4 startDate:(id)a5 type:(unint64_t)a6
{
  BOOL v7 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = objc_alloc_init(HMDLightProfileDataSource);
  id v12 = +[HMDCharacteristicWriteRequest writeRequestForTransitionStartWithLightProfile:v10 naturalLightingEnabled:v7 startDate:v9 type:a6 dataSource:v11];

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_authorizationData, 0);
  objc_storeStrong(&self->_value, 0);
}

- (NSData)contextData
{
  return self->_contextData;
}

- (BOOL)includeResponseValue
{
  return self->_includeResponseValue;
}

- (unint64_t)requestType
{
  return self->_requestType;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSData)authorizationData
{
  return self->_authorizationData;
}

- (id)value
{
  return self->_value;
}

- (id)attributeDescriptions
{
  v17[3] = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)HMDCharacteristicWriteRequest;
  v3 = [(HMDCharacteristicRequest *)&v16 attributeDescriptions];
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v5 = [(HMDCharacteristicWriteRequest *)self value];
  v6 = (void *)[v4 initWithName:@"Value" value:v5];
  v17[0] = v6;
  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  v8 = [(HMDCharacteristicWriteRequest *)self value];
  id v9 = (void *)[v7 initWithName:@"Type" value:objc_opt_class()];
  v17[1] = v9;
  id v10 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMDCharacteristicWriteRequest *)self includeResponseValue];
  v11 = HMFBooleanToString();
  id v12 = (void *)[v10 initWithName:@"Include response value" value:v11];
  v17[2] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];
  id v14 = [v3 arrayByAddingObjectsFromArray:v13];

  return v14;
}

- (HMDCharacteristicWriteRequest)initWithCharacteristic:(id)a3 value:(id)a4 authorizationData:(id)a5 identifier:(id)a6 type:(unint64_t)a7 includeResponseValue:(BOOL)a8 contextData:(id)a9
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a9;
  v23.receiver = self;
  v23.super_class = (Class)HMDCharacteristicWriteRequest;
  id v18 = [(HMDCharacteristicRequest *)&v23 initWithCharacteristic:a3];
  id v19 = v18;
  if (v18)
  {
    objc_storeStrong(&v18->_value, a4);
    objc_storeStrong((id *)&v19->_authorizationData, a5);
    objc_storeStrong((id *)&v19->_identifier, a6);
    v19->_requestType = a7;
    v19->_includeResponseValue = a8;
    objc_storeStrong((id *)&v19->_contextData, a9);
  }

  return v19;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_188767 != -1) {
    dispatch_once(&logCategory__hmf_once_t3_188767, &__block_literal_global_110_188768);
  }
  v2 = (void *)logCategory__hmf_once_v4_188769;
  return v2;
}

uint64_t __44__HMDCharacteristicWriteRequest_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v4_188769;
  logCategory__hmf_once_v4_188769 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (HMDCharacteristicWriteRequest)writeRequestWithCharacteristic:(id)a3 value:(id)a4 authorizationData:(id)a5 identifier:(id)a6 type:(unint64_t)a7 includeResponseValue:(BOOL)a8 contextData:(id)a9
{
  BOOL v9 = a8;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a9;
  if (a7 == 1)
  {
    v20 = +[HMDHAPMetadata getSharedInstance];
    uint64_t v21 = [v15 type];
    int v22 = [v20 isTargetCharacteristic:v21];

    a7 = v22 ^ 1u;
  }
  objc_super v23 = (void *)[objc_alloc((Class)a1) initWithCharacteristic:v15 value:v16 authorizationData:v17 identifier:v18 type:a7 includeResponseValue:v9 contextData:v19];

  return (HMDCharacteristicWriteRequest *)v23;
}

+ (HMDCharacteristicWriteRequest)writeRequestWithCharacteristic:(id)a3 value:(id)a4 authorizationData:(id)a5 identifier:(id)a6 type:(unint64_t)a7 includeResponseValue:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  if (a7 == 1)
  {
    id v18 = +[HMDHAPMetadata getSharedInstance];
    id v19 = [v14 type];
    int v20 = [v18 isTargetCharacteristic:v19];

    a7 = v20 ^ 1u;
  }
  uint64_t v21 = (void *)[objc_alloc((Class)a1) initWithCharacteristic:v14 value:v15 authorizationData:v16 identifier:v17 type:a7 includeResponseValue:v8 contextData:0];

  return (HMDCharacteristicWriteRequest *)v21;
}

+ (HMDCharacteristicWriteRequest)writeRequestWithCharacteristic:(id)a3 value:(id)a4 authorizationData:(id)a5 identifier:(id)a6 type:(unint64_t)a7
{
  return (HMDCharacteristicWriteRequest *)[a1 writeRequestWithCharacteristic:a3 value:a4 authorizationData:a5 identifier:a6 type:a7 includeResponseValue:0];
}

+ (HMDCharacteristicWriteRequest)writeRequestWithCharacteristic:(id)a3 value:(id)a4 authorizationData:(id)a5 type:(unint64_t)a6
{
  return +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:a3 value:a4 authorizationData:a5 identifier:0 type:a6];
}

@end