@interface HMDMatterAttributeEventBase
+ (BOOL)supportsSecureCoding;
+ (id)compareValueOfAttribute:(id)a3 againstValue:(id)a4 operatorType:(id)a5;
+ (id)logCategory;
- (BOOL)_activate:(unint64_t)a3 completionHandler:(id)a4;
- (BOOL)_evaluateNewValue:(id)a3;
- (BOOL)isActive;
- (BOOL)isCompatibleWithEvent:(id)a3;
- (HMDMatterAttributeEventBase)initWithCoder:(id)a3;
- (HMDMatterAttributeEventBase)initWithModel:(id)a3 home:(id)a4;
- (HMDMatterPath)matterPath;
- (NSUUID)matterPathUUID;
- (id)createPayload;
- (id)description;
- (void)__handleAttributesChangedNotification:(id)a3;
- (void)_registerForMessages;
- (void)encodeWithCoder:(id)a3;
- (void)handleAttributesChangedNotification:(id)a3;
- (void)setMatterPathUUID:(id)a3;
@end

@implementation HMDMatterAttributeEventBase

- (void).cxx_destruct
{
}

- (void)setMatterPathUUID:(id)a3
{
}

- (NSUUID)matterPathUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 88, 1);
}

- (BOOL)_activate:(unint64_t)a3 completionHandler:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)HMDMatterAttributeEventBase;
  id v5 = a4;
  BOOL v6 = [(HMDEvent *)&v9 _activate:a3 completionHandler:0];
  v7 = (void (**)(void *, void))_Block_copy(v5);

  if (v7) {
    v7[2](v7, 0);
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)HMDMatterAttributeEventBase;
  id v4 = a3;
  [(HMDEvent *)&v13 encodeWithCoder:v4];
  id v5 = [(HMDMatterAttributeEventBase *)self matterPath];
  BOOL v6 = [v5 attributeID];
  [v4 encodeObject:v6 forKey:*MEMORY[0x263F0BA70]];

  v7 = [(HMDMatterAttributeEventBase *)self matterPath];
  v8 = [v7 clusterID];
  [v4 encodeObject:v8 forKey:*MEMORY[0x263F0C5F0]];

  objc_super v9 = [(HMDMatterAttributeEventBase *)self matterPath];
  v10 = [v9 endpointID];
  [v4 encodeObject:v10 forKey:*MEMORY[0x263F0C6F0]];

  v11 = [(HMDMatterAttributeEventBase *)self matterPath];
  v12 = [v11 accessory];
  [v4 encodeObject:v12 forKey:@"accessory"];
}

- (HMDMatterAttributeEventBase)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  v7 = NSString;
  v8 = NSStringFromSelector(a2);
  objc_super v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (id)createPayload
{
  v3 = (void *)MEMORY[0x263EFF9A0];
  v17.receiver = self;
  v17.super_class = (Class)HMDMatterAttributeEventBase;
  id v4 = [(HMDEvent *)&v17 createPayload];
  id v5 = [v3 dictionaryWithDictionary:v4];

  uint64_t v6 = [(HMDMatterAttributeEventBase *)self matterPath];
  v7 = [v6 accessory];
  v8 = [v7 uuid];
  [v5 setObject:v8 forKeyedSubscript:@"kAccessoryUUID"];

  objc_super v9 = [(HMDMatterAttributeEventBase *)self matterPath];
  id v10 = [v9 attributeID];
  [v5 setObject:v10 forKeyedSubscript:*MEMORY[0x263F0BA78]];

  v11 = [(HMDMatterAttributeEventBase *)self matterPath];
  v12 = [v11 clusterID];
  [v5 setObject:v12 forKeyedSubscript:*MEMORY[0x263F0C5F8]];

  objc_super v13 = [(HMDMatterAttributeEventBase *)self matterPath];
  v14 = [v13 endpointID];
  [v5 setObject:v14 forKeyedSubscript:*MEMORY[0x263F0C6F8]];

  v15 = (void *)[v5 copy];
  return v15;
}

- (BOOL)_evaluateNewValue:(id)a3
{
  return 0;
}

- (void)handleAttributesChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDEvent *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__HMDMatterAttributeEventBase_handleAttributesChangedNotification___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __67__HMDMatterAttributeEventBase_handleAttributesChangedNotification___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) userInfo];
  objc_msgSend(v1, "__handleAttributesChangedNotification:", v2);
}

- (void)__handleAttributesChangedNotification:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_msgSend(v4, "hmf_numberForKey:", @"HMDMatterAttributeChangedNotificationEndpointIDKey");
  id v5 = (char *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmf_numberForKey:", @"HMDMatterAttributeChangedNotificationClusterIDKey");
  id v6 = (char *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = objc_msgSend(v4, "hmf_numberForKey:", @"HMDMatterAttributeChangedNotificationAttributeIDKey");
  id v8 = (void *)v7;
  if (v5 && v6 && v7)
  {
    objc_super v9 = [(HMDMatterAttributeEventBase *)self matterPath];
    id v10 = +[HMDMatterPath PathWithAttributeID:v8 endpointID:v5 clusterID:v6];
    int v11 = [v9 isEqual:v10];

    if (v11)
    {
      v12 = (void *)MEMORY[0x230FBD990]();
      objc_super v13 = self;
      v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = HMFGetLogIdentifier();
        v16 = [(HMDMatterAttributeEventBase *)v13 matterPath];
        int v31 = 138543618;
        uint64_t v32 = (uint64_t)v15;
        __int16 v33 = 2112;
        v34 = v16;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Received notification that attributes changed state, evaluating if trigger needs to be executed, %@", (uint8_t *)&v31, 0x16u);
      }
      if ([(HMDMatterAttributeEventBase *)v13 _evaluateNewValue:v4])
      {
        BOOL v17 = [(HMDMatterAttributeEventBase *)v13 isActive];
        v18 = (void *)MEMORY[0x230FBD990]();
        v19 = v13;
        v20 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          uint64_t v21 = HMFGetLogIdentifier();
          v22 = (void *)v21;
          v23 = "Not firing";
          if (v17) {
            v23 = "Firing";
          }
          v24 = "is not";
          int v31 = 138543874;
          uint64_t v32 = v21;
          v34 = v23;
          __int16 v33 = 2080;
          if (v17) {
            v24 = "is";
          }
          __int16 v35 = 2080;
          v36 = v24;
          _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@%s event because it %s active", (uint8_t *)&v31, 0x20u);
        }
        if (v17)
        {
          v25 = [(HMDEvent *)v19 delegate];
          id v26 = (id)[v25 didOccurEvent:v19 causingDevice:0];
        }
      }
    }
  }
  else
  {
    v27 = (void *)MEMORY[0x230FBD990]();
    v28 = self;
    v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      v30 = HMFGetLogIdentifier();
      int v31 = 138544130;
      uint64_t v32 = (uint64_t)v30;
      __int16 v33 = 2112;
      v34 = v5;
      __int16 v35 = 2112;
      v36 = v6;
      __int16 v37 = 2112;
      v38 = v8;
      _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_INFO, "%{public}@Attribute changed notification did not have endpointID/clusterID/attributeID %@/%@/%@", (uint8_t *)&v31, 0x2Au);
    }
  }
}

- (void)_registerForMessages
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)HMDMatterAttributeEventBase;
  [(HMDEvent *)&v11 _registerForMessages];
  v3 = [(HMDMatterAttributeEventBase *)self matterPath];
  id v4 = [v3 accessory];

  if (v4)
  {
    id v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:self selector:sel_handleAttributesChangedNotification_ name:@"HMDMatterAttributeChangedNotification" object:v4];
  }
  else
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    uint64_t v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_super v9 = HMFGetLogIdentifier();
      id v10 = [(HMDMatterAttributeEventBase *)v7 matterPath];
      *(_DWORD *)buf = 138543618;
      objc_super v13 = v9;
      __int16 v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unable to find accessory on matter path %@", buf, 0x16u);
    }
  }
}

- (HMDMatterPath)matterPath
{
  v3 = [(HMDEvent *)self home];
  id v4 = [(HMDMatterAttributeEventBase *)self matterPathUUID];
  id v5 = [v3 matterPathWithUUID:v4];

  return (HMDMatterPath *)v5;
}

- (BOOL)isCompatibleWithEvent:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDMatterAttributeEventBase;
  if ([(HMDEvent *)&v9 isCompatibleWithEvent:v4])
  {
    id v5 = [(HMDMatterAttributeEventBase *)self matterPath];
    id v6 = [v4 matterPath];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)isActive
{
  return ([(HMDEvent *)self activationType] & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMDMatterAttributeEventBase;
  id v4 = [(HMDEvent *)&v8 description];
  id v5 = [(HMDMatterAttributeEventBase *)self matterPath];
  id v6 = [v3 stringWithFormat:@"%@, %@", v4, v5];

  return v6;
}

- (HMDMatterAttributeEventBase)initWithModel:(id)a3 home:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDMatterAttributeEventBase;
  char v7 = [(HMDEvent *)&v11 initWithModel:v6 home:a4];
  if (v7)
  {
    uint64_t v8 = [v6 matterPathUUID];
    matterPathUUID = v7->_matterPathUUID;
    v7->_matterPathUUID = (NSUUID *)v8;
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)compareValueOfAttribute:(id)a3 againstValue:(id)a4 operatorType:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  objc_super v9 = (void *)[a5 unsignedIntegerValue];
  id v10 = NSNumber;
  BOOL v11 = compareCharacteristicValue(v8, v7, v9, &unk_26E473C00);

  return (id)[v10 numberWithBool:v11];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_267332 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_267332, &__block_literal_global_267333);
  }
  id v2 = (void *)logCategory__hmf_once_v1_267334;
  return v2;
}

void __42__HMDMatterAttributeEventBase_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_267334;
  logCategory__hmf_once_v1_267334 = v0;
}

@end