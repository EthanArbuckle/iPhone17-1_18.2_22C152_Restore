@interface HMDCharacteristicEventBase
+ (BOOL)supportsSecureCoding;
+ (id)compareValueOfCharacteristic:(id)a3 againstValue:(id)a4 operatorType:(id)a5;
+ (id)logCategory;
+ (id)lookForCharacteristicByAccessoryUUID:(id)a3 serviceID:(id)a4 characteristicID:(id)a5 inHome:(id)a6 checkForSupport:(BOOL)a7 outError:(id *)a8 shouldLog:(BOOL)a9;
- (BOOL)_activate:(unint64_t)a3 completionHandler:(id)a4;
- (BOOL)_evaluateNewValue:(id)a3;
- (BOOL)isActive;
- (BOOL)isCompatibleWithEvent:(id)a3;
- (HMDCharacteristic)characteristic;
- (HMDCharacteristicEventBase)initWithCoder:(id)a3;
- (HMDCharacteristicEventBase)initWithModel:(id)a3 home:(id)a4;
- (NSNumber)characteristicInstanceID;
- (NSNumber)serviceID;
- (NSUUID)accessoryUUID;
- (id)createPayload;
- (id)description;
- (id)previousValue;
- (void)__handleCharacteristicsChangedPayload:(id)a3;
- (void)_registerForMessages;
- (void)encodeWithCoder:(id)a3;
- (void)fixCharacteristicInHome:(id)a3;
- (void)handleCharacteristicsChangedNotification:(id)a3;
- (void)replaceCharacteristic:(id)a3;
- (void)setCharacteristic:(id)a3;
- (void)setPreviousValue:(id)a3;
@end

@implementation HMDCharacteristicEventBase

- (void).cxx_destruct
{
  objc_storeStrong(&self->_previousValue, 0);
  objc_storeStrong((id *)&self->_characteristicInstanceID, 0);
  objc_storeStrong((id *)&self->_serviceID, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
  objc_storeStrong((id *)&self->_characteristic, 0);
}

- (void)setPreviousValue:(id)a3
{
}

- (id)previousValue
{
  return self->_previousValue;
}

- (NSNumber)characteristicInstanceID
{
  return self->_characteristicInstanceID;
}

- (NSNumber)serviceID
{
  return self->_serviceID;
}

- (NSUUID)accessoryUUID
{
  return self->_accessoryUUID;
}

- (void)setCharacteristic:(id)a3
{
}

- (BOOL)_activate:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v45.receiver = self;
  v45.super_class = (Class)HMDCharacteristicEventBase;
  BOOL v7 = [(HMDEvent *)&v45 _activate:a3 completionHandler:0];
  v8 = [(HMDCharacteristicEventBase *)self characteristic];

  if (v8)
  {
    v9 = [(HMDCharacteristicEventBase *)self characteristic];
    char v10 = [v9 properties];

    if (v10)
    {
      if (v7)
      {
        BOOL v24 = [(HMDCharacteristicEventBase *)self isActive];
        v25 = (void *)MEMORY[0x230FBD990]();
        v26 = self;
        v27 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          v28 = HMFGetLogIdentifier();
          v29 = HMFEnabledStatusToString();
          *(_DWORD *)buf = 138543618;
          v48 = v28;
          __int16 v49 = 2112;
          v50 = v29;
          _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@Changing characteristic notification state to %@", buf, 0x16u);
        }
        v30 = NSString;
        v31 = [(HMDEvent *)v26 uuid];
        v32 = [v31 UUIDString];
        v16 = [v30 stringWithFormat:@"%@-%@", @"com.apple.HomeKitDaemon.characteristicEvents", v32];

        v33 = [(HMDCharacteristicEventBase *)v26 characteristic];
        v34 = [v33 accessory];
        v35 = [(HMDCharacteristicEventBase *)v26 characteristic];
        v46 = v35;
        v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v46 count:1];
        [v34 setNotificationsEnabled:v24 forCharacteristics:v36 clientIdentifier:v16];

        v37 = _Block_copy(v6);
        v38 = v37;
        if (v37) {
          (*((void (**)(void *, void))v37 + 2))(v37, 0);
        }

        BOOL v7 = 1;
      }
      else
      {
        v39 = (void *)MEMORY[0x230FBD990]();
        v40 = self;
        v41 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          v42 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v48 = v42;
          _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_INFO, "%{public}@Not changing characteristic notification state because activation type has not changed", buf, 0xCu);
        }
        v43 = _Block_copy(v6);
        v16 = (void (**)(void, void))v43;
        if (v43) {
          (*((void (**)(void *, void))v43 + 2))(v43, 0);
        }
        BOOL v7 = 0;
      }
    }
    else
    {
      v11 = (void *)MEMORY[0x230FBD990]();
      v12 = self;
      v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = HMFGetLogIdentifier();
        v15 = [(HMDCharacteristicEventBase *)v12 characteristic];
        *(_DWORD *)buf = 138543618;
        v48 = v14;
        __int16 v49 = 2112;
        v50 = v15;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Trigger contains a characteristic event (%@) which does not support notification, cannot enable the event trigger", buf, 0x16u);
      }
      v16 = (void (**)(void, void))_Block_copy(v6);
      if (v16)
      {
        v17 = (void *)MEMORY[0x263F087E8];
        uint64_t v18 = 7;
LABEL_11:
        v23 = [v17 hmErrorWithCode:v18];
        ((void (**)(void, void *))v16)[2](v16, v23);
      }
    }
  }
  else
  {
    v19 = (void *)MEMORY[0x230FBD990]();
    v20 = self;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v48 = v22;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Characteristic is not yet available yet due to lack of PV or Resident sync, cannot enable the event trigger", buf, 0xCu);
    }
    v16 = (void (**)(void, void))_Block_copy(v6);
    if (v16)
    {
      v17 = (void *)MEMORY[0x263F087E8];
      uint64_t v18 = 27;
      goto LABEL_11;
    }
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HMDCharacteristicEventBase;
  [(HMDEvent *)&v14 encodeWithCoder:v4];
  v5 = [(HMDCharacteristicEventBase *)self characteristic];
  [v4 encodeConditionalObject:v5 forKey:@"characteristic"];

  id v6 = [(HMDCharacteristicEventBase *)self characteristicInstanceID];
  [v4 encodeObject:v6 forKey:@"characteristicInstanceID"];

  BOOL v7 = [(HMDCharacteristicEventBase *)self serviceID];
  [v4 encodeObject:v7 forKey:@"serviceInstanceID"];

  v8 = [(HMDCharacteristicEventBase *)self accessoryUUID];
  v9 = [v8 UUIDString];
  [v4 encodeObject:v9 forKey:@"accessoryUUID"];

  char v10 = +[HMDHAPMetadata getSharedInstance];
  v11 = [(HMDCharacteristicEventBase *)self characteristic];
  v12 = [v11 type];
  if ([v10 shouldNotCacheCharacteristicOfType:v12])
  {

LABEL_5:
    goto LABEL_6;
  }
  v13 = [(HMDCharacteristicEventBase *)self previousValue];

  if (v13)
  {
    v11 = [(HMDCharacteristicEventBase *)self previousValue];
    [v4 encodeObject:v11 forKey:@"HM.previousValue"];
    goto LABEL_5;
  }
LABEL_6:
}

- (HMDCharacteristicEventBase)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"characteristic"];
  v22.receiver = self;
  v22.super_class = (Class)HMDCharacteristicEventBase;
  id v6 = [(HMDEvent *)&v22 initWithCoder:v4];
  BOOL v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_characteristic, v5);
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessoryUUID"];
    uint64_t v9 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v8];
    accessoryUUID = v7->_accessoryUUID;
    v7->_accessoryUUID = (NSUUID *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceInstanceID"];
    serviceID = v7->_serviceID;
    v7->_serviceID = (NSNumber *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"characteristicInstanceID"];
    characteristicInstanceID = v7->_characteristicInstanceID;
    v7->_characteristicInstanceID = (NSNumber *)v13;

    v15 = allowedCharValueTypes();
    v16 = [v4 decodeObjectOfClasses:v15 forKey:@"HM.previousValue"];

    v17 = +[HMDHAPMetadata getSharedInstance];
    uint64_t v18 = [(HMDCharacteristicEventBase *)v7 characteristic];
    v19 = [v18 type];
    char v20 = [v17 shouldNotCacheCharacteristicOfType:v19];

    if ((v20 & 1) == 0) {
      objc_storeStrong(&v7->_previousValue, v16);
    }
  }
  return v7;
}

- (void)fixCharacteristicInHome:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  characteristic = self->_characteristic;
  if (characteristic)
  {
    id v6 = [(HMDCharacteristic *)characteristic accessory];
    BOOL v7 = [v6 uuid];
    accessoryUUID = self->_accessoryUUID;
    self->_accessoryUUID = v7;

    uint64_t v9 = [(HMDCharacteristic *)self->_characteristic service];
    char v10 = [v9 instanceID];
    serviceID = self->_serviceID;
    self->_serviceID = v10;

    v12 = [(HMDCharacteristic *)self->_characteristic instanceID];
    characteristicInstanceID = self->_characteristicInstanceID;
    self->_characteristicInstanceID = v12;
  }
  else
  {
    objc_super v14 = [(HMDCharacteristicEventBase *)self accessoryUUID];
    v15 = [(HMDCharacteristicEventBase *)self serviceID];
    v16 = [(HMDCharacteristicEventBase *)self characteristicInstanceID];
    LOBYTE(v25) = 0;
    v17 = +[HMDCharacteristicEventBase lookForCharacteristicByAccessoryUUID:v14 serviceID:v15 characteristicID:v16 inHome:v4 checkForSupport:0 outError:0 shouldLog:v25];
    uint64_t v18 = self->_characteristic;
    self->_characteristic = v17;

    if (self->_characteristic)
    {
      v19 = (void *)MEMORY[0x230FBD990]();
      char v20 = self;
      v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        objc_super v22 = HMFGetLogIdentifier();
        v23 = self->_characteristic;
        *(_DWORD *)buf = 138543618;
        v27 = v22;
        __int16 v28 = 2112;
        v29 = v23;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Found characteristic, re-evaluating the event trigger %@", buf, 0x16u);
      }
      BOOL v24 = [(HMDEvent *)v20 eventTrigger];
      [v24 reEvaluate:2];
    }
  }
}

- (HMDCharacteristic)characteristic
{
  characteristic = self->_characteristic;
  if (!characteristic)
  {
    id v4 = [(HMDEvent *)self eventTrigger];
    v5 = [v4 home];
    [(HMDCharacteristicEventBase *)self fixCharacteristicInHome:v5];

    characteristic = self->_characteristic;
  }
  return characteristic;
}

- (void)replaceCharacteristic:(id)a3
{
}

- (id)createPayload
{
  v3 = (void *)MEMORY[0x263EFF9A0];
  v12.receiver = self;
  v12.super_class = (Class)HMDCharacteristicEventBase;
  id v4 = [(HMDEvent *)&v12 createPayload];
  v5 = [v3 dictionaryWithDictionary:v4];

  id v6 = [(HMDCharacteristicEventBase *)self accessoryUUID];
  BOOL v7 = [v6 UUIDString];
  [v5 setObject:v7 forKeyedSubscript:@"kAccessoryUUID"];

  v8 = [(HMDCharacteristicEventBase *)self serviceID];
  [v5 setObject:v8 forKeyedSubscript:@"kServiceInstanceID"];

  uint64_t v9 = [(HMDCharacteristicEventBase *)self characteristicInstanceID];
  [v5 setObject:v9 forKeyedSubscript:@"kCharacteristicInstanceID"];

  char v10 = (void *)[v5 copy];
  return v10;
}

- (BOOL)_evaluateNewValue:(id)a3
{
  return 0;
}

- (void)handleCharacteristicsChangedNotification:(id)a3
{
  id v4 = a3;
  v5 = [(HMDEvent *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__HMDCharacteristicEventBase_handleCharacteristicsChangedNotification___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __71__HMDCharacteristicEventBase_handleCharacteristicsChangedNotification___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) userInfo];
  objc_msgSend(v1, "__handleCharacteristicsChangedPayload:", v2);
}

- (void)__handleCharacteristicsChangedPayload:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_msgSend(v4, "hmf_arrayForKey:", @"kModifiedCharacteristicsKey");
  if (v5)
  {
    id v37 = v4;
    v35 = [(HMDEvent *)self eventTrigger];
    v38 = [v35 home];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v36 = v5;
    id obj = v5;
    uint64_t v6 = [obj countByEnumeratingWithState:&v41 objects:v51 count:16];
    if (!v6) {
      goto LABEL_26;
    }
    uint64_t v7 = v6;
    uint64_t v40 = *(void *)v42;
    while (1)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v42 != v40) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        char v10 = [(HMDCharacteristicEventBase *)self characteristicInstanceID];
        uint64_t v11 = [v9 instanceID];
        if (![v10 isEqual:v11]) {
          goto LABEL_22;
        }
        objc_super v12 = [(HMDCharacteristicEventBase *)self accessoryUUID];
        uint64_t v13 = [v9 accessory];
        objc_super v14 = [v13 uuid];
        int v15 = [v12 isEqual:v14];

        if (!v15) {
          continue;
        }
        v16 = (void *)MEMORY[0x230FBD990]();
        v17 = self;
        uint64_t v18 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v19 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          uint64_t v46 = (uint64_t)v19;
          __int16 v47 = 2112;
          v48 = (const char *)v9;
          _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Received notification that characteristic changed state, evaluating if trigger needs to be executed, %@", buf, 0x16u);
        }
        char v20 = [v9 value];
        BOOL v21 = [(HMDCharacteristicEventBase *)v17 _evaluateNewValue:v20];

        char v10 = +[HMDHAPMetadata getSharedInstance];
        objc_super v22 = [(HMDCharacteristicEventBase *)v17 characteristic];
        v23 = [v22 type];
        char v24 = [v10 shouldNotCacheCharacteristicOfType:v23];

        if ((v24 & 1) == 0)
        {
          uint64_t v25 = [v9 value];
          [(HMDCharacteristicEventBase *)v17 setPreviousValue:v25];

          [v38 saveToCurrentAccountWithReason:@"kCharacteristicPreviousValue"];
        }
        if (v21)
        {
          BOOL v26 = [(HMDCharacteristicEventBase *)v17 isActive];
          v27 = (void *)MEMORY[0x230FBD990]();
          __int16 v28 = v17;
          v29 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            uint64_t v30 = HMFGetLogIdentifier();
            v31 = (void *)v30;
            *(_DWORD *)buf = 138543874;
            v32 = "Not firing";
            if (v26) {
              v32 = "Firing";
            }
            uint64_t v46 = v30;
            v33 = "is not";
            if (v26) {
              v33 = "is";
            }
            __int16 v47 = 2080;
            v48 = v32;
            __int16 v49 = 2080;
            v50 = v33;
            _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_INFO, "%{public}@%s event because it %s active", buf, 0x20u);
          }
          if (v26)
          {
            uint64_t v11 = [(HMDEvent *)v28 delegate];
            id v34 = (id)[v11 didOccurEvent:v28 causingDevice:0];
LABEL_22:
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v41 objects:v51 count:16];
      if (!v7)
      {
LABEL_26:

        v5 = v36;
        id v4 = v37;
        break;
      }
    }
  }
}

- (void)_registerForMessages
{
  v7.receiver = self;
  v7.super_class = (Class)HMDCharacteristicEventBase;
  [(HMDEvent *)&v7 _registerForMessages];
  v3 = [(HMDEvent *)self home];
  id v4 = [(HMDCharacteristicEventBase *)self accessoryUUID];
  v5 = [v3 accessoryWithUUID:v4];

  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:self selector:sel_handleCharacteristicsChangedNotification_ name:@"HMDAccessoryCharacteristicsChangedNotification" object:v5];
  }
}

- (BOOL)isCompatibleWithEvent:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDCharacteristicEventBase;
  if ([(HMDEvent *)&v9 isCompatibleWithEvent:v4])
  {
    v5 = [(HMDCharacteristicEventBase *)self characteristic];
    uint64_t v6 = [v4 characteristic];
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
  v8.super_class = (Class)HMDCharacteristicEventBase;
  id v4 = [(HMDEvent *)&v8 description];
  v5 = [(HMDCharacteristicEventBase *)self characteristic];
  uint64_t v6 = [v3 stringWithFormat:@"%@, %@", v4, v5];

  return v6;
}

- (HMDCharacteristicEventBase)initWithModel:(id)a3 home:(id)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HMDCharacteristicEventBase;
  char v7 = [(HMDEvent *)&v17 initWithModel:v6 home:a4];
  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x263F08C38]);
    objc_super v9 = [v6 accessory];
    uint64_t v10 = [v8 initWithUUIDString:v9];
    accessoryUUID = v7->_accessoryUUID;
    v7->_accessoryUUID = (NSUUID *)v10;

    uint64_t v12 = [v6 serviceID];
    serviceID = v7->_serviceID;
    v7->_serviceID = (NSNumber *)v12;

    uint64_t v14 = [v6 characteristicID];
    characteristicInstanceID = v7->_characteristicInstanceID;
    v7->_characteristicInstanceID = (NSNumber *)v14;
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)lookForCharacteristicByAccessoryUUID:(id)a3 serviceID:(id)a4 characteristicID:(id)a5 inHome:(id)a6 checkForSupport:(BOOL)a7 outError:(id *)a8 shouldLog:(BOOL)a9
{
  BOOL v10 = a7;
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  v19 = [v18 accessoryWithUUID:v15];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v20 = v19;
  }
  else {
    char v20 = 0;
  }
  id v21 = v20;

  if (v17 && v16 && v21)
  {
    objc_super v22 = [v21 findCharacteristic:v17 forService:v16];
    v23 = v22;
    if (!v22)
    {
      if (a9)
      {
        v35 = (void *)MEMORY[0x230FBD990]();
        id v36 = a1;
        id v37 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v38 = __int16 v49 = v35;
          *(_DWORD *)buf = 138543618;
          uint64_t v52 = v38;
          __int16 v53 = 2112;
          id v54 = v17;
          _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_ERROR, "%{public}@Cannot find the given characteristic ID %@ in accessory", buf, 0x16u);

          v35 = v49;
        }
      }
      if (a8)
      {
        __int16 v28 = (void *)MEMORY[0x263F087E8];
        uint64_t v29 = 3;
        goto LABEL_27;
      }
LABEL_40:
      id v34 = 0;
      goto LABEL_45;
    }
    if (([v22 properties] & 1) == 0)
    {
      if (a9)
      {
        char v24 = (void *)MEMORY[0x230FBD990]();
        id v25 = a1;
        BOOL v26 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v27 = v48 = v24;
          *(_DWORD *)buf = 138543618;
          uint64_t v52 = v27;
          __int16 v53 = 2112;
          id v54 = v23;
          _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@Given characteristic %@ does not support notification", buf, 0x16u);

          char v24 = v48;
        }
      }
      if (a8)
      {
        __int16 v28 = (void *)MEMORY[0x263F087E8];
        uint64_t v29 = 7;
LABEL_27:
        [v28 hmErrorWithCode:v29];
        id v34 = 0;
        *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_45:

        goto LABEL_46;
      }
      goto LABEL_40;
    }
    if (!v10)
    {
LABEL_44:
      id v34 = v23;
      goto LABEL_45;
    }
    v50 = [v23 service];
    v39 = [v23 type];
    if ([v39 isEqual:@"00000073-0000-1000-8000-0026BB765291"])
    {
      uint64_t v46 = [v50 type];
      if ([v46 isEqual:@"00000089-0000-1000-8000-0026BB765291"])
      {
        char v45 = [v18 isResidentSupported];

        if ((v45 & 1) == 0)
        {
          if (a9)
          {
            uint64_t v40 = (void *)MEMORY[0x230FBD990]();
            id v41 = a1;
            long long v42 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              long long v43 = v47 = v40;
              *(_DWORD *)buf = 138543362;
              uint64_t v52 = v43;
              _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_ERROR, "%{public}@The given characteristic is of type programmable switch and input event, but resident is not available", buf, 0xCu);

              uint64_t v40 = v47;
            }
          }
          if (a8)
          {
            *a8 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
          }

          goto LABEL_40;
        }
        goto LABEL_43;
      }
    }
LABEL_43:

    goto LABEL_44;
  }
  if (a9)
  {
    uint64_t v30 = (void *)MEMORY[0x230FBD990]();
    id v31 = a1;
    v32 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v33 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      uint64_t v52 = v33;
      __int16 v53 = 2112;
      id v54 = v21;
      __int16 v55 = 2112;
      id v56 = v16;
      __int16 v57 = 2112;
      id v58 = v17;
      _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@Associated accessory %@, service ID %@ or characteristic ID %@ is invalid", buf, 0x2Au);
    }
  }
  if (a8)
  {
    [MEMORY[0x263F087E8] hmErrorWithCode:3];
    id v34 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v34 = 0;
  }
LABEL_46:

  return v34;
}

+ (id)compareValueOfCharacteristic:(id)a3 againstValue:(id)a4 operatorType:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  objc_super v9 = (void *)[a5 unsignedIntegerValue];
  BOOL v10 = [v8 metadata];
  uint64_t v11 = [v10 stepValue];
  uint64_t v12 = NSNumber;
  uint64_t v13 = [v8 value];

  BOOL v14 = compareCharacteristicValue(v13, v7, v9, v11);
  id v15 = [v12 numberWithBool:v14];

  return v15;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_184555 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_184555, &__block_literal_global_184556);
  }
  id v2 = (void *)logCategory__hmf_once_v1_184557;
  return v2;
}

void __41__HMDCharacteristicEventBase_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_184557;
  logCategory__hmf_once_v1_184557 = v0;
}

@end