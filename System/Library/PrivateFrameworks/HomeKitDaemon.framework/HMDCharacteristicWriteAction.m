@interface HMDCharacteristicWriteAction
+ (BOOL)supportsSecureCoding;
+ (id)actionWithDictionaryRepresentation:(id)a3 home:(id)a4;
+ (id)logCategory;
- (BOOL)isActionForCharacteristic:(id)a3;
- (BOOL)isAssociatedWithAccessory:(id)a3;
- (BOOL)isCompatibleWithAction:(id)a3;
- (BOOL)isStaleWithAccessory:(id)a3;
- (BOOL)isUnsecuringAction;
- (BOOL)requiresDeviceUnlock;
- (HMDCharacteristic)characteristic;
- (HMDCharacteristicWriteAction)init;
- (HMDCharacteristicWriteAction)initWithCoder:(id)a3;
- (HMDCharacteristicWriteAction)initWithUUID:(id)a3 accessoryUUID:(id)a4 serviceIID:(id)a5 characteristicIID:(id)a6 targetValue:(id)a7 actionSet:(id)a8;
- (HMDCharacteristicWriteAction)initWithUUID:(id)a3 characteristic:(id)a4 targetValue:(id)a5 actionSet:(id)a6;
- (HMDHAPAccessory)accessory;
- (HMDHome)home;
- (NSDictionary)actionInformation;
- (NSNumber)characteristicID;
- (NSNumber)serviceID;
- (NSString)dumpState;
- (NSUUID)accessoryUUID;
- (id)associatedAccessories;
- (id)attributeDescriptions;
- (id)dictionaryRepresentation;
- (id)modelObjectWithChangeType:(unint64_t)a3;
- (id)stateDump;
- (id)targetValue;
- (unint64_t)type;
- (void)_processWriteActionModelUpdated:(id)a3 message:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithSource:(unint64_t)a3 clientName:(id)a4 completionHandler:(id)a5;
- (void)setTargetValue:(id)a3;
- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
@end

@implementation HMDCharacteristicWriteAction

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_dumpState, 0);
  objc_storeStrong((id *)&self->_actionInformation, 0);
  objc_storeStrong((id *)&self->_characteristicID, 0);
  objc_storeStrong((id *)&self->_serviceID, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
  objc_storeStrong(&self->_targetValue, 0);
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (NSString)dumpState
{
  return self->_dumpState;
}

- (NSDictionary)actionInformation
{
  return self->_actionInformation;
}

- (NSNumber)characteristicID
{
  return self->_characteristicID;
}

- (NSNumber)serviceID
{
  return self->_serviceID;
}

- (NSUUID)accessoryUUID
{
  return self->_accessoryUUID;
}

- (void)setTargetValue:(id)a3
{
}

- (id)targetValue
{
  return self->_targetValue;
}

- (id)attributeDescriptions
{
  v14[3] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMDAction *)self uuid];
  v5 = (void *)[v3 initWithName:@"UUID" value:v4];
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = [(HMDCharacteristicWriteAction *)self characteristic];
  v8 = (void *)[v6 initWithName:@"characteristic" value:v7];
  v14[1] = v8;
  id v9 = objc_alloc(MEMORY[0x263F424F8]);
  v10 = [(HMDCharacteristicWriteAction *)self targetValue];
  v11 = (void *)[v9 initWithName:@"target value" value:v10];
  v14[2] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:3];

  return v12;
}

- (id)modelObjectWithChangeType:(unint64_t)a3
{
  v5 = [HMDCharacteristicWriteActionModel alloc];
  id v6 = [(HMDAction *)self uuid];
  v7 = [(HMDAction *)self actionSet];
  v8 = [v7 uuid];
  id v9 = [(HMDBackingStoreModelObject *)v5 initWithObjectChangeType:a3 uuid:v6 parentUUID:v8];

  v10 = [(HMDCharacteristicWriteAction *)self characteristic];
  v11 = [v10 accessory];
  v12 = [v11 uuid];
  v13 = [v12 UUIDString];
  [(HMDCharacteristicWriteActionModel *)v9 setAccessory:v13];

  v14 = [v10 service];
  v15 = [v14 instanceID];
  [(HMDCharacteristicWriteActionModel *)v9 setServiceID:v15];

  v16 = [v10 instanceID];
  [(HMDCharacteristicWriteActionModel *)v9 setCharacteristicID:v16];

  v17 = [(HMDCharacteristicWriteAction *)self targetValue];
  [(HMDCharacteristicWriteActionModel *)v9 setTargetValue:v17];

  return v9;
}

- (void)_processWriteActionModelUpdated:(id)a3 message:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 transactionResult];
  id v9 = [(HMDAction *)self actionSet];
  v10 = [v6 setProperties];
  int v11 = [v10 containsObject:@"targetValue"];

  if (!v11)
  {
    v20 = 0;
    goto LABEL_6;
  }
  uint64_t v12 = [v9 home];
  v13 = (void *)v12;
  if (v9 && v12)
  {
    v14 = [v6 targetValue];
    [(HMDCharacteristicWriteAction *)self setTargetValue:v14];

    v32[0] = @"kActionUUID";
    v15 = [(HMDAction *)self uuid];
    v16 = [v15 UUIDString];
    v33[0] = v16;
    v32[1] = @"kActionInfo";
    [(HMDCharacteristicWriteAction *)self dictionaryRepresentation];
    v17 = v31 = v8;
    v33[1] = v17;
    v32[2] = @"kHomeUUID";
    [v13 uuid];
    v18 = v30 = v13;
    v19 = [v18 UUIDString];
    v33[2] = v19;
    v20 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:3];

    v8 = v31;
LABEL_6:
    v21 = (void *)MEMORY[0x230FBD990]([v7 respondWithPayload:v20]);
    v22 = self;
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v35 = v24;
      __int16 v36 = 2112;
      id v37 = v20;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_DEBUG, "%{public}@Responding to client after updating action with response %@", buf, 0x16u);
    }
    [v8 markChanged];
    if ([(HMDCharacteristicWriteAction *)v22 isSecureAction]) {
      [v8 markSaveToAssistant];
    }
    goto LABEL_13;
  }
  v25 = (void *)MEMORY[0x230FBD990]();
  v26 = self;
  v27 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    v28 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544130;
    v35 = v28;
    __int16 v36 = 2112;
    id v37 = v6;
    __int16 v38 = 2112;
    v39 = v9;
    __int16 v40 = 2112;
    v41 = v13;
    _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Write action Model object (%@) missing actionset %@ or home %@ ", buf, 0x2Au);
  }
  v29 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
  [v7 respondWithError:v29];

  v20 = 0;
LABEL_13:
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = v12;

  if (v13)
  {
    [(HMDCharacteristicWriteAction *)self _processWriteActionModelUpdated:v13 message:v10];
  }
  else
  {
    v14 = (void *)MEMORY[0x230FBD990]();
    v15 = self;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = HMFGetLogIdentifier();
      int v20 = 138543874;
      v21 = v17;
      __int16 v22 = 2112;
      id v23 = v11;
      __int16 v24 = 2112;
      id v25 = (id)objc_opt_class();
      id v18 = v25;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectUpdated]", (uint8_t *)&v20, 0x20u);
    }
    v19 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    [v10 respondWithError:v19];
  }
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HMDCharacteristicWriteAction;
  id v4 = a3;
  [(HMDAction *)&v7 encodeWithCoder:v4];
  v5 = [(HMDCharacteristicWriteAction *)self characteristic];
  [v4 encodeObject:v5 forKey:@"characteristic"];

  id v6 = [(HMDCharacteristicWriteAction *)self targetValue];
  [v4 encodeObject:v6 forKey:@"characteristicValue"];
}

- (HMDCharacteristicWriteAction)initWithCoder:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [[HMDAction alloc] initWithCoder:v4];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"characteristic"];
    objc_super v7 = allowedCharValueTypes();
    id v8 = [v4 decodeObjectOfClasses:v7 forKey:@"characteristicValue"];

    id v9 = [(HMDAction *)v5 uuid];
    id v10 = [(HMDAction *)v5 actionSet];
    id v11 = [(HMDCharacteristicWriteAction *)self initWithUUID:v9 characteristic:v6 targetValue:v8 actionSet:v10];

    uint64_t v12 = v11;
  }
  else
  {
    id v13 = (void *)MEMORY[0x230FBD990]();
    id v11 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      v18.receiver = v11;
      v18.super_class = (Class)HMDCharacteristicWriteAction;
      id v16 = [(HMDCharacteristicWriteAction *)&v18 class];
      *(_DWORD *)buf = 138543618;
      int v20 = v15;
      __int16 v21 = 2112;
      id v22 = v16;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode base class: %@", buf, 0x16u);
    }
    uint64_t v12 = 0;
  }

  return v12;
}

- (BOOL)isStaleWithAccessory:(id)a3
{
  if (![(HMDCharacteristicWriteAction *)self isAssociatedWithAccessory:a3]) {
    return 0;
  }
  id v4 = [(HMDCharacteristicWriteAction *)self characteristic];
  BOOL v5 = v4 == 0;

  return v5;
}

- (id)associatedAccessories
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [(HMDCharacteristicWriteAction *)self accessory];
  id v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  }
  else
  {
    id v4 = (void *)MEMORY[0x263EFFA68];
  }

  return v4;
}

- (BOOL)isAssociatedWithAccessory:(id)a3
{
  id v4 = [a3 uuid];
  BOOL v5 = [(HMDCharacteristicWriteAction *)self accessoryUUID];
  char v6 = [v4 isEqual:v5];

  return v6;
}

- (HMDHAPAccessory)accessory
{
  id v3 = [(HMDCharacteristicWriteAction *)self accessoryUUID];

  if (v3)
  {
    id v4 = [(HMDCharacteristicWriteAction *)self home];
    BOOL v5 = [(HMDCharacteristicWriteAction *)self accessoryUUID];
    char v6 = [v4 accessoryWithUUID:v5];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_super v7 = v6;
    }
    else {
      objc_super v7 = 0;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }
  return (HMDHAPAccessory *)v8;
}

- (BOOL)isUnsecuringAction
{
  id v3 = +[HMDHAPMetadata getSharedInstance];
  id v4 = [(HMDCharacteristicWriteAction *)self characteristic];
  BOOL v5 = [v4 type];
  char v6 = [v4 service];
  objc_super v7 = [v6 type];
  if ([v3 requiresDeviceUnlock:v5 forService:v7])
  {
    id v8 = [v4 type];
    id v9 = [(HMDCharacteristicWriteAction *)self targetValue];
    int v10 = [v3 allowsSecuringWriteFor:v8 withValue:v9] ^ 1;
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (BOOL)requiresDeviceUnlock
{
  id v3 = +[HMDHAPMetadata getSharedInstance];
  id v4 = [(HMDCharacteristicWriteAction *)self characteristic];
  BOOL v5 = [v4 type];
  char v6 = [v4 service];
  objc_super v7 = [v6 type];
  char v8 = [v3 requiresDeviceUnlock:v5 forService:v7];

  return v8;
}

- (BOOL)isCompatibleWithAction:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDCharacteristicWriteAction;
  if ([(HMDAction *)&v13 isCompatibleWithAction:v4])
  {
    BOOL v5 = [(HMDCharacteristicWriteAction *)self characteristicID];
    char v6 = [v4 characteristicID];
    if ([v5 isEqual:v6])
    {
      objc_super v7 = [(HMDCharacteristicWriteAction *)self serviceID];
      char v8 = [v4 serviceID];
      if ([v7 isEqual:v8])
      {
        id v9 = [(HMDCharacteristicWriteAction *)self accessoryUUID];
        int v10 = [v4 accessoryUUID];
        char v11 = [v9 isEqual:v10];
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (BOOL)isActionForCharacteristic:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 instanceID];
  char v6 = [v4 service];
  objc_super v7 = [v6 instanceID];

  char v8 = [v4 accessory];

  id v9 = [v8 uuid];
  int v10 = [v9 UUIDString];

  char v11 = [(HMDCharacteristicWriteAction *)self characteristic];
  uint64_t v12 = [v11 instanceID];
  objc_super v13 = [v11 service];
  v14 = [v13 instanceID];

  v15 = [v11 accessory];
  id v16 = [v15 uuid];
  v17 = [v16 UUIDString];

  if ([v12 isEqual:v5] && objc_msgSend(v14, "isEqual:", v7)) {
    char v18 = [v17 isEqualToString:v10];
  }
  else {
    char v18 = 0;
  }

  return v18;
}

- (void)executeWithSource:(unint64_t)a3 clientName:(id)a4 completionHandler:(id)a5
{
  if (a5) {
    (*((void (**)(id, void))a5 + 2))(a5, 0);
  }
}

- (id)dictionaryRepresentation
{
  id v3 = [(HMDCharacteristicWriteAction *)self characteristic];
  v16.receiver = self;
  v16.super_class = (Class)HMDCharacteristicWriteAction;
  id v4 = [(HMDAction *)&v16 dictionaryRepresentation];
  BOOL v5 = (void *)[v4 mutableCopy];

  char v6 = [v3 accessory];
  objc_super v7 = accessoryToEncodeForXPCTransportForAccessory(v6);
  char v8 = [v7 uuid];
  id v9 = [v8 UUIDString];
  [v5 setObject:v9 forKeyedSubscript:@"kAccessoryUUID"];

  int v10 = [v3 service];
  char v11 = [v10 instanceID];
  [v5 setObject:v11 forKeyedSubscript:@"kServiceInstanceID"];

  uint64_t v12 = [v3 instanceID];
  [v5 setObject:v12 forKeyedSubscript:@"kCharacteristicInstanceID"];

  objc_super v13 = [(HMDCharacteristicWriteAction *)self targetValue];
  [v5 setObject:v13 forKeyedSubscript:@"kCharacteristicValue"];

  v14 = (void *)[v5 copy];
  return v14;
}

- (id)stateDump
{
  id v3 = NSString;
  id v4 = [(HMDAction *)self uuid];
  BOOL v5 = [v4 UUIDString];
  char v6 = [(HMDCharacteristicWriteAction *)self characteristic];
  objc_super v7 = [(HMDCharacteristicWriteAction *)self targetValue];
  char v8 = [v3 stringWithFormat:@"Action uuid: %@, Characteristic %@  value %@", v5, v6, v7];

  return v8;
}

- (HMDCharacteristic)characteristic
{
  uint64_t v3 = [(HMDCharacteristicWriteAction *)self serviceID];
  if (v3
    && (id v4 = (void *)v3,
        [(HMDCharacteristicWriteAction *)self characteristicID],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    char v6 = [(HMDCharacteristicWriteAction *)self accessory];
    objc_super v7 = [(HMDCharacteristicWriteAction *)self characteristicID];
    char v8 = [(HMDCharacteristicWriteAction *)self serviceID];
    id v9 = [v6 findCharacteristic:v7 forService:v8];
  }
  else
  {
    id v9 = 0;
  }
  return (HMDCharacteristic *)v9;
}

- (unint64_t)type
{
  return 0;
}

- (HMDCharacteristicWriteAction)initWithUUID:(id)a3 accessoryUUID:(id)a4 serviceIID:(id)a5 characteristicIID:(id)a6 targetValue:(id)a7 actionSet:(id)a8
{
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)HMDCharacteristicWriteAction;
  char v18 = [(HMDAction *)&v23 initWithUUID:a3 actionSet:v17];
  if (v18)
  {
    v19 = objc_msgSend(v17, "home", v21, v22);
    objc_storeWeak((id *)&v18->_home, v19);

    objc_storeStrong((id *)&v18->_accessoryUUID, a4);
    objc_storeStrong((id *)&v18->_serviceID, a5);
    objc_storeStrong((id *)&v18->_characteristicID, a6);
    objc_storeStrong(&v18->_targetValue, a7);
  }

  return v18;
}

- (HMDCharacteristicWriteAction)initWithUUID:(id)a3 characteristic:(id)a4 targetValue:(id)a5 actionSet:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)HMDCharacteristicWriteAction;
  uint64_t v12 = [(HMDAction *)&v23 initWithUUID:a3 actionSet:a6];
  if (v12)
  {
    objc_super v13 = [v10 service];
    v14 = [v13 accessory];
    id v15 = [v14 home];
    objc_storeWeak((id *)&v12->_home, v15);

    uint64_t v16 = [v14 uuid];
    accessoryUUID = v12->_accessoryUUID;
    v12->_accessoryUUID = (NSUUID *)v16;

    uint64_t v18 = [v13 instanceID];
    serviceID = v12->_serviceID;
    v12->_serviceID = (NSNumber *)v18;

    uint64_t v20 = [v10 instanceID];
    characteristicID = v12->_characteristicID;
    v12->_characteristicID = (NSNumber *)v20;

    objc_storeStrong(&v12->_targetValue, a5);
  }

  return v12;
}

- (HMDCharacteristicWriteAction)init
{
  uint64_t v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = NSString;
  BOOL v5 = NSStringFromSelector(a2);
  char v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t13_175166 != -1) {
    dispatch_once(&logCategory__hmf_once_t13_175166, &__block_literal_global_175167);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v14_175168;
  return v2;
}

void __43__HMDCharacteristicWriteAction_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v14_175168;
  logCategory__hmf_once_v14_175168 = v0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)actionWithDictionaryRepresentation:(id)a3 home:(id)a4
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  char v8 = objc_msgSend(v6, "hmf_numberForKey:", @"kActionType");
  if (![v8 unsignedIntegerValue])
  {
    v14 = [v6 objectForKeyedSubscript:@"kCharacteristicValue"];
    if (v14)
    {
      id v15 = objc_msgSend(v6, "hmf_UUIDForKey:", @"kAccessoryUUID");
      if (v15
        && (([v7 accessoryWithUUID:v15],
             uint64_t v16 = objc_claimAutoreleasedReturnValue(),
             objc_opt_class(),
             (objc_opt_isKindOfClass() & 1) == 0)
          ? (id v17 = 0)
          : (id v17 = v16),
            id v18 = v17,
            v16,
            v18))
      {

        v19 = objc_msgSend(v6, "hmf_numberForKey:", @"kServiceInstanceID");
        uint64_t v20 = HAPInstanceIDFromValue();

        id v21 = objc_msgSend(v6, "hmf_numberForKey:", @"kCharacteristicInstanceID");
        id v22 = HAPInstanceIDFromValue();

        if (v20 && v22)
        {
          objc_super v23 = [v18 findCharacteristic:v22 forService:v20];
          objc_opt_class();
          __int16 v24 = (objc_opt_isKindOfClass() & 1) != 0 ? v23 : 0;
          id v25 = v24;

          if (v25)
          {

            id v26 = objc_alloc((Class)a1);
            v27 = [MEMORY[0x263F08C38] UUID];
            objc_super v13 = (void *)[v26 initWithUUID:v27 characteristic:v23 targetValue:v14 actionSet:0];

LABEL_28:
            goto LABEL_29;
          }
        }
        __int16 v36 = (void *)MEMORY[0x230FBD990]();
        id v37 = a1;
        __int16 v38 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v39 = v43 = v20;
          objc_msgSend(v6, "hmf_numberForKey:", @"kCharacteristicInstanceID");
          __int16 v40 = v42 = v36;
          *(_DWORD *)buf = 138544130;
          v45 = v39;
          __int16 v46 = 2112;
          id v47 = v22;
          __int16 v48 = 2112;
          v49 = v40;
          __int16 v50 = 2112;
          v51 = v43;
          _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to find characteristic: %@ (%@)-%@", buf, 0x2Au);

          __int16 v36 = v42;
          uint64_t v20 = v43;
        }
      }
      else
      {
        v28 = (void *)MEMORY[0x230FBD990]();
        id v29 = a1;
        v30 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          v31 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v45 = v31;
          __int16 v46 = 2112;
          id v47 = v15;
          _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to find accessory with identifier: %@", buf, 0x16u);
        }
      }
    }
    else
    {
      v32 = (void *)MEMORY[0x230FBD990]();
      id v33 = a1;
      v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v35 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v45 = v35;
        __int16 v46 = 2112;
        id v47 = v6;
        _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_ERROR, "%{public}@Missing target value: %@", buf, 0x16u);
      }
    }
    objc_super v13 = 0;
    goto LABEL_28;
  }
  id v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = a1;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v45 = v12;
    __int16 v46 = 2112;
    id v47 = v8;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Invalid action type: %@", buf, 0x16u);
  }
  objc_super v13 = 0;
LABEL_29:

  return v13;
}

@end