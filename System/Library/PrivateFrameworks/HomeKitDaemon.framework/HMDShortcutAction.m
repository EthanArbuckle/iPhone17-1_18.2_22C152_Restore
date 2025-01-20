@interface HMDShortcutAction
+ (BOOL)supportsSecureCoding;
+ (id)actionWithDictionaryRepresentation:(id)a3 home:(id)a4;
+ (id)actionWithDictionaryRepresentation:(id)a3 home:(id)a4 actionSet:(id)a5;
+ (id)logCategory;
- (BOOL)isAssociatedWithAccessory:(id)a3;
- (BOOL)isCompatibleWithAction:(id)a3;
- (BOOL)isStaleWithAccessory:(id)a3;
- (BOOL)isUnsecuringAction;
- (BOOL)requiresDeviceUnlock;
- (Class)modelClass;
- (HMDShortcutAction)initWithCoder:(id)a3;
- (HMDShortcutAction)initWithModelObject:(id)a3 parent:(id)a4 error:(id *)a5;
- (HMDShortcutAction)initWithSerializedShortcut:(id)a3 uuid:(id)a4 actionSet:(id)a5;
- (id)associatedAccessories;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)modelObjectWithChangeType:(unint64_t)a3 version:(int64_t)a4;
- (id)removeShortcut;
- (id)stateDump;
- (uint64_t)doesActionSetContainItemsPassingTest:(void *)a3 actionSetUUIDs:;
- (uint64_t)doesAnyCharacteristicWriteTuplePassTest:(void *)a3 orDoesAnyActionSetPassTest:;
- (unint64_t)entitlementsForNotification;
- (unint64_t)type;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)executeWithSource:(unint64_t)a3 clientName:(id)a4 completionHandler:(id)a5;
- (void)getCharacteristicsAndActionSetsFromShortcut:(void *)a3 characteristicWriteTuples:(void *)a4 homeUUID:;
- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
- (void)unpackActionsAndActionSets:(void *)a3 actionSets:(void *)a4 characteristicWriteTuples:(void *)a5 homeUUID:;
@end

@implementation HMDShortcutAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_shortcut, 0);
  objc_storeStrong((id *)&self->_shortcutData, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HMDShortcutAction allocWithZone:a3];
  shortcutData = self->_shortcutData;
  v6 = [(HMDAction *)self uuid];
  v7 = [(HMDAction *)self actionSet];
  v8 = [(HMDShortcutAction *)v4 initWithSerializedShortcut:shortcutData uuid:v6 actionSet:v7];

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)HMDShortcutAction;
  [(HMDAction *)&v6 encodeWithCoder:v4];
  shortcutData = self->_shortcutData;
  if (shortcutData) {
    [v4 encodeObject:shortcutData forKey:*MEMORY[0x263F0DE58]];
  }
}

- (HMDShortcutAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMDShortcutAction;
  v5 = [(HMDAction *)&v8 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F0DE58]];
    __HMDShortcutActionInitializeWithSerializedShortcut(v5, v6);
  }
  return v5;
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  if (v13)
  {
    if (self)
    {
      id v14 = 0;
    }
    else
    {
      id v14 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
      v15 = (void *)MEMORY[0x230FBD990]();
      v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v22 = v17;
        __int16 v23 = 2112;
        id v24 = v14;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to process model update with error: %@", buf, 0x16u);
      }
    }
    v18 = [v10 responseHandler];

    if (v18)
    {
      v19 = [v10 responseHandler];
      ((void (**)(void, id, void))v19)[2](v19, v14, 0);
    }
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)HMDShortcutAction;
    [(HMDAction *)&v20 transactionObjectUpdated:v8 newValues:v11 message:v10];
  }
}

- (id)modelObjectWithChangeType:(unint64_t)a3 version:(int64_t)a4
{
  if (a4 < 4)
  {
    v5 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)HMDShortcutAction;
    v5 = -[HMDAction modelObjectWithChangeType:version:](&v10, sel_modelObjectWithChangeType_version_, a3);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_super v6 = v5;
    }
    else {
      objc_super v6 = 0;
    }
    id v7 = v6;
    id v8 = v7;
    if (v7) {
      [v7 setData:self->_shortcutData];
    }
  }
  return v5;
}

- (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (HMDShortcutAction)initWithModelObject:(id)a3 parent:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    objc_opt_class();
    int v10 = objc_opt_isKindOfClass() & 1;
    if (v10) {
      id v11 = v8;
    }
    else {
      id v11 = 0;
    }
    id v12 = v11;
    if (!v10)
    {
      if (a5)
      {
        [MEMORY[0x263F087E8] hmErrorWithCode:22];
        v21 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = 0;
      }
      goto LABEL_33;
    }
    id v13 = [v8 uuid];
    if (!v13)
    {
      if (a5)
      {
        [MEMORY[0x263F087E8] hmErrorWithCode:3];
        v21 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = 0;
      }
      goto LABEL_32;
    }
    id v14 = [v8 data];
    if (v14)
    {
      if (!v9
        || ((id v15 = v9, objc_opt_class(), (v16 = objc_opt_isKindOfClass() & 1) == 0)
          ? (v17 = 0)
          : (v17 = v15),
            id v18 = v17,
            v15,
            v16))
      {
        v25.receiver = self;
        v25.super_class = (Class)HMDShortcutAction;
        v19 = [(HMDAction *)&v25 initWithUUID:v13 actionSet:v9];
        if (v19)
        {
          objc_super v20 = (void *)[v14 copy];
          __HMDShortcutActionInitializeWithSerializedShortcut(v19, v20);
        }
        self = v19;

        v21 = self;
        goto LABEL_31;
      }
      if (a5)
      {
        v22 = (void *)MEMORY[0x263F087E8];
        uint64_t v23 = 22;
        goto LABEL_29;
      }
    }
    else if (a5)
    {
      v22 = (void *)MEMORY[0x263F087E8];
      uint64_t v23 = 3;
LABEL_29:
      [v22 hmErrorWithCode:v23];
      v21 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_31:

LABEL_32:
LABEL_33:

      goto LABEL_34;
    }
    v21 = 0;
    goto LABEL_31;
  }
  if (a5)
  {
    [MEMORY[0x263F087E8] hmErrorWithCode:20];
    v21 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }
LABEL_34:

  return v21;
}

- (id)associatedAccessories
{
  return (id)MEMORY[0x263EFFA68];
}

- (BOOL)isStaleWithAccessory:(id)a3
{
  return 0;
}

- (BOOL)isCompatibleWithAction:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HMDShortcutAction;
  if ([(HMDAction *)&v7 isCompatibleWithAction:v4]) {
    char v5 = [(NSData *)self->_shortcutData isEqual:v4[3]];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)isAssociatedWithAccessory:(id)a3
{
  return 0;
}

- (unint64_t)entitlementsForNotification
{
  v3.receiver = self;
  v3.super_class = (Class)HMDShortcutAction;
  return [(HMDAction *)&v3 entitlementsForNotification] | 4;
}

- (BOOL)isUnsecuringAction
{
  v3[4] = self;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __39__HMDShortcutAction_isUnsecuringAction__block_invoke;
  v4[3] = &unk_264A14A68;
  v4[4] = self;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __39__HMDShortcutAction_isUnsecuringAction__block_invoke_2;
  v3[3] = &unk_264A14A68;
  return -[HMDShortcutAction doesAnyCharacteristicWriteTuplePassTest:orDoesAnyActionSetPassTest:](self, v4, v3);
}

BOOL __39__HMDShortcutAction_isUnsecuringAction__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  if (v2)
  {
    id v4 = +[HMDHAPMetadata getSharedInstance];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __61__HMDShortcutAction_doesAnyCharacteristicTupleUnsecureAHome___block_invoke;
    v20[3] = &unk_264A14AB8;
    id v5 = v4;
    id v21 = v5;
    Property = objc_msgSend(v3, "na_firstObjectPassingTest:", v20);
    id v8 = Property;
    if (Property) {
      Property = objc_getProperty(Property, v7, 8, 1);
    }
    id v9 = Property;

    BOOL v10 = v9 != 0;
    id v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = v2;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      id v15 = [v9 service];
      uint64_t v16 = [v15 accessory];
      v17 = (void *)v16;
      id v18 = @"does not";
      *(_DWORD *)buf = 138543874;
      uint64_t v23 = v14;
      __int16 v24 = 2112;
      if (v9) {
        id v18 = &stru_26E2EB898;
      }
      uint64_t v25 = v16;
      __int16 v26 = 2112;
      v27 = v18;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@[%@] %@ requires device to be unlock", buf, 0x20u);
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

uint64_t __39__HMDShortcutAction_isUnsecuringAction__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  if (v2)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __58__HMDShortcutAction_doesActionSetContainUnsecuringAction___block_invoke;
    v11[3] = &unk_264A210B8;
    v11[4] = v2;
    uint64_t v4 = -[HMDShortcutAction doesActionSetContainItemsPassingTest:actionSetUUIDs:](v2, v11, v3);
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = v2;
    objc_super v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      id v9 = HMFBooleanToString();
      *(_DWORD *)buf = 138543618;
      id v13 = v8;
      __int16 v14 = 2112;
      id v15 = v9;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Does this shortcut action contain any unsecuring actions: [%@]", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (uint64_t)doesAnyCharacteristicWriteTuplePassTest:(void *)a3 orDoesAnyActionSetPassTest:
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (a1 && WorkflowKitLibraryCore())
  {
    uint64_t v28 = (void *)MEMORY[0x230FBD990]();
    objc_super v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = a1;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      BOOL v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v30 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Shortcuts framework is available on this OS", buf, 0xCu);
    }
    id v11 = [MEMORY[0x263EFF9C0] set];
    id v12 = [MEMORY[0x263EFF9C0] set];
    id v13 = [v8[4] homeIdentifier];
    __int16 v14 = [v8 actionSet];
    id v15 = [v14 home];

    uint64_t v16 = [v15 uuid];
    char v17 = [v16 isEqual:v13];

    if (v17)
    {
      -[HMDShortcutAction getCharacteristicsAndActionSetsFromShortcut:characteristicWriteTuples:homeUUID:](v8, v11, v12, v13);
      if ([v11 count] || objc_msgSend(v12, "count"))
      {
        if (v5[2](v5, v12)) {
          uint64_t v18 = 1;
        }
        else {
          uint64_t v18 = v6[2](v6, v11);
        }
        goto LABEL_16;
      }
      v19 = (void *)MEMORY[0x230FBD990]();
      objc_super v20 = v8;
      id v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v30 = v22;
        uint64_t v23 = "%{public}@There are no characteristics or actionSets present in this shortcut.";
        __int16 v24 = v21;
        os_log_type_t v25 = OS_LOG_TYPE_INFO;
        uint32_t v26 = 12;
        goto LABEL_13;
      }
    }
    else
    {
      v19 = (void *)MEMORY[0x230FBD990]();
      objc_super v20 = v8;
      id v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v30 = v22;
        __int16 v31 = 2112;
        v32 = v13;
        __int16 v33 = 2112;
        v34 = v15;
        uint64_t v23 = "%{public}@This shortcut action does not belong to this home. Current: %@, Expected Home UUID: %@";
        __int16 v24 = v21;
        os_log_type_t v25 = OS_LOG_TYPE_ERROR;
        uint32_t v26 = 32;
LABEL_13:
        _os_log_impl(&dword_22F52A000, v24, v25, v23, buf, v26);
      }
    }

    uint64_t v18 = 0;
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v18 = 0;
LABEL_17:

  return v18;
}

- (void)getCharacteristicsAndActionSetsFromShortcut:(void *)a3 characteristicWriteTuples:(void *)a4 homeUUID:
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    BOOL v10 = [a1[4] shortcutsDictionaryRepresentations];
    id v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = a1;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      __int16 v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v35 = v14;
      __int16 v36 = 2112;
      id v37 = v10;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Going to deserialize shortcut dictionary [%@]", buf, 0x16u);
    }
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __100__HMDShortcutAction_getCharacteristicsAndActionSetsFromShortcut_characteristicWriteTuples_homeUUID___block_invoke;
    v30[3] = &unk_264A2F0F0;
    v30[4] = v12;
    id v15 = v7;
    id v31 = v15;
    id v16 = v8;
    id v32 = v16;
    id v33 = v9;
    char v17 = (void *)MEMORY[0x230FBD990](objc_msgSend(v10, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v30));
    uint64_t v18 = v12;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      objc_super v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v35 = v20;
      __int16 v36 = 2112;
      id v37 = v15;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Found actionSets from shortcut dictionary : %@", buf, 0x16u);
    }
    uint32_t v26 = (void *)MEMORY[0x230FBD990](v21, v22, v23, v24, v25);
    v27 = v18;
    uint64_t v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v35 = v29;
      __int16 v36 = 2112;
      id v37 = v16;
      _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_DEBUG, "%{public}@Found characteristics from shortcut dictionary : %@", buf, 0x16u);
    }
  }
}

void __100__HMDShortcutAction_getCharacteristicsAndActionSetsFromShortcut_characteristicWriteTuples_homeUUID___block_invoke(void **a1, void *a2)
{
}

- (void)unpackActionsAndActionSets:(void *)a3 actionSets:(void *)a4 characteristicWriteTuples:(void *)a5 homeUUID:
{
  uint64_t v239 = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a3;
  id v206 = a4;
  id v204 = a5;
  if (a1)
  {
    uint64_t v11 = *MEMORY[0x263F0B8E8];
    id v12 = objc_msgSend(v9, "hmf_stringForKey:", *MEMORY[0x263F0B8E8]);
    if ([v12 isEqualToString:*MEMORY[0x263F0B8F0]])
    {
      id v13 = objc_msgSend(v9, "hmf_stringForKey:", *MEMORY[0x263F0B8F8]);
      char v14 = [v13 isEqualToString:*MEMORY[0x263F0B900]];

      if (v14)
      {
        uint64_t v15 = objc_msgSend(v9, "hmf_dataForKey:", *MEMORY[0x263F0B8E0]);
        if (!v15)
        {
          v154 = 0;
          v155 = (void *)MEMORY[0x230FBD990]();
          id v156 = a1;
          v157 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v157, OS_LOG_TYPE_ERROR))
          {
            v158 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v158;
            _os_log_impl(&dword_22F52A000, v157, OS_LOG_TYPE_ERROR, "%{public}@Did not find any serialized homekit data in this shortcut dictionary", buf, 0xCu);
          }
          goto LABEL_159;
        }
        v201 = (void *)v15;
        id v16 = (void *)[objc_alloc(MEMORY[0x263F0E618]) initWithData:v15];
        v202 = v16;
        if (!v16)
        {
          v159 = (void *)MEMORY[0x230FBD990]();
          id v160 = a1;
          v161 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v161, OS_LOG_TYPE_ERROR))
          {
            v162 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v162;
            _os_log_impl(&dword_22F52A000, v161, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize PB actionSet data", buf, 0xCu);
          }
          v154 = v201;
          goto LABEL_158;
        }
        char v17 = (void *)MEMORY[0x263F08C38];
        uint64_t v18 = v16;
        v19 = [v16 uuid];
        uint64_t v20 = objc_msgSend(v17, "hmf_UUIDWithBytesAsData:", v19);

        v203 = (void *)v20;
        if (v20)
        {
          if ([v18 hasHomeUUID])
          {
            uint64_t v21 = (void *)MEMORY[0x263F08C38];
            uint64_t v22 = [v18 homeUUID];
            uint64_t v23 = objc_msgSend(v21, "hmf_UUIDWithBytesAsData:", v22);

            if (v23)
            {
              v192 = (void *)v23;
              if ([v204 isEqual:v23])
              {
                id v180 = v10;
                id v181 = v9;
                [v10 addObject:v203];
                uint64_t v24 = [a1 actionSet];
                v205 = [v24 home];

                long long v213 = 0u;
                long long v214 = 0u;
                long long v211 = 0u;
                long long v212 = 0u;
                id obj = [v202 actions];
                uint64_t v25 = [obj countByEnumeratingWithState:&v211 objects:v223 count:16];
                if (!v25) {
                  goto LABEL_132;
                }
                uint64_t v27 = v25;
                uint64_t v209 = *(void *)v212;
                *(void *)&long long v26 = 138544130;
                long long v177 = v26;
                v199 = a1;
                while (1)
                {
                  uint64_t v28 = 0;
                  uint64_t v207 = v27;
                  do
                  {
                    if (*(void *)v212 != v209) {
                      objc_enumerationMutation(obj);
                    }
                    v29 = *(void **)(*((void *)&v211 + 1) + 8 * v28);
                    if (objc_msgSend(v29, "type", v177) != 1)
                    {
                      id v63 = 0;
                      goto LABEL_123;
                    }
                    id v30 = [v29 characteristicWriteAction];
                    id v31 = v205;
                    id v32 = [v30 characteristicReference];
                    if ([v32 hasUniqueIdentifier])
                    {
                      if ([v32 hasServiceReference])
                      {
                        id v33 = (void *)MEMORY[0x263F08C38];
                        v34 = [v32 uniqueIdentifier];
                        uint64_t v35 = objc_msgSend(v33, "hmf_UUIDWithBytesAsData:", v34);

                        if (!v35)
                        {
                          v70 = (void *)MEMORY[0x230FBD990]();
                          id v71 = a1;
                          v72 = HMFGetOSLogHandle();
                          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
                          {
                            v73 = HMFGetLogIdentifier();
                            *(_DWORD *)buf = 138543362;
                            *(void *)&uint8_t buf[4] = v73;
                            _os_log_impl(&dword_22F52A000, v72, OS_LOG_TYPE_ERROR, "%{public}@Couldn't decode characteristic uniqueIdentifier", buf, 0xCu);
                          }
                          id v63 = 0;
                          goto LABEL_111;
                        }
                        __int16 v36 = [v32 serviceReference];
                        if ([v36 hasUniqueIdentifier])
                        {
                          if ([v36 hasAccessoryReference])
                          {
                            id v37 = [v36 accessoryReference];
                            v200 = v37;
                            if ([v37 hasUniqueIdentifier])
                            {
                              if ([v37 hasHomeReference])
                              {
                                v198 = v36;
                                uint64_t v38 = (void *)MEMORY[0x263F08C38];
                                v39 = [v37 uniqueIdentifier];
                                v40 = objc_msgSend(v38, "hmf_UUIDWithBytesAsData:", v39);

                                v197 = v40;
                                if (v40)
                                {
                                  v41 = [v37 homeReference];
                                  v191 = v41;
                                  if ([v41 hasUniqueIdentifier])
                                  {
                                    v193 = (void *)MEMORY[0x263F08C38];
                                    v42 = [v41 uniqueIdentifier];
                                    v184 = objc_msgSend(v193, "hmf_UUIDWithBytesAsData:", v42);

                                    v43 = [v41 uniqueIdentifier];

                                    if (v43)
                                    {
                                      v44 = [v31 spiClientIdentifier];
                                      char v45 = [v184 isEqual:v44];

                                      if ((v45 & 1) != 0
                                        || ([v31 uuid],
                                            v46 = objc_claimAutoreleasedReturnValue(),
                                            char v47 = [v184 isEqual:v46],
                                            v46,
                                            (v47 & 1) != 0))
                                      {
                                        v48 = [v31 accessoryWithSPIClientIdentifier:v40];
                                        if (!v48)
                                        {
                                          v48 = [v31 accessoryWithUUID:v40];
                                        }
                                        id v49 = v48;
                                        objc_opt_class();
                                        if (objc_opt_isKindOfClass()) {
                                          v50 = v49;
                                        }
                                        else {
                                          v50 = 0;
                                        }
                                        id v51 = v50;
                                        v178 = v49;

                                        v179 = v51;
                                        if (v51)
                                        {
                                          v52 = (void *)MEMORY[0x263F08C38];
                                          v53 = [v198 uniqueIdentifier];
                                          uint64_t v54 = objc_msgSend(v52, "hmf_UUIDWithBytesAsData:", v53);

                                          v189 = (void *)v54;
                                          if (!v54)
                                          {
                                            v55 = (void *)MEMORY[0x230FBD990]();
                                            id v56 = a1;
                                            v57 = HMFGetOSLogHandle();
                                            if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
                                            {
                                              v58 = HMFGetLogIdentifier();
                                              *(_DWORD *)buf = 138543362;
                                              *(void *)&uint8_t buf[4] = v58;
                                              _os_log_impl(&dword_22F52A000, v57, OS_LOG_TYPE_ERROR, "%{public}@Couldn't decode service uniqueIdentifier", buf, 0xCu);
                                            }
                                            id v51 = v179;
                                          }
                                          long long v221 = 0u;
                                          long long v222 = 0u;
                                          long long v219 = 0u;
                                          long long v220 = 0u;
                                          id v182 = [v51 services];
                                          __int16 v36 = v198;
                                          uint64_t v187 = [v182 countByEnumeratingWithState:&v219 objects:buf count:16];
                                          if (v187)
                                          {
                                            id v185 = *(id *)v220;
LABEL_40:
                                            uint64_t v59 = 0;
                                            while (1)
                                            {
                                              if (*(id *)v220 != v185) {
                                                objc_enumerationMutation(v182);
                                              }
                                              v194 = *(void **)(*((void *)&v219 + 1) + 8 * v59);
                                              v60 = [v194 uuid];
                                              if ([v60 isEqual:v189]) {
                                                break;
                                              }
                                              v61 = [v194 spiClientIdentifier];
                                              char v62 = [v61 isEqual:v189];

                                              __int16 v36 = v198;
                                              if (v62) {
                                                goto LABEL_86;
                                              }
                                              if (v187 == ++v59)
                                              {
                                                uint64_t v187 = [v182 countByEnumeratingWithState:&v219 objects:buf count:16];
                                                if (v187) {
                                                  goto LABEL_40;
                                                }
                                                goto LABEL_47;
                                              }
                                            }

LABEL_86:
                                            id v113 = v194;

                                            if (!v113) {
                                              goto LABEL_96;
                                            }
                                            long long v217 = 0u;
                                            long long v218 = 0u;
                                            long long v215 = 0u;
                                            long long v216 = 0u;
                                            id v183 = v113;
                                            id v186 = [v113 characteristics];
                                            uint64_t v196 = [v186 countByEnumeratingWithState:&v215 objects:v228 count:16];
                                            if (v196)
                                            {
                                              uint64_t v188 = *(void *)v216;
LABEL_89:
                                              uint64_t v114 = 0;
                                              while (1)
                                              {
                                                if (*(void *)v216 != v188) {
                                                  objc_enumerationMutation(v186);
                                                }
                                                v115 = *(void **)(*((void *)&v215 + 1) + 8 * v114);
                                                v116 = [v115 spiClientIdentifier];
                                                char v117 = [v116 isEqual:v35];

                                                if (v117) {
                                                  break;
                                                }
                                                ++v114;
                                                __int16 v36 = v198;
                                                if (v196 == v114)
                                                {
                                                  uint64_t v196 = [v186 countByEnumeratingWithState:&v215 objects:v228 count:16];
                                                  if (v196) {
                                                    goto LABEL_89;
                                                  }
                                                  goto LABEL_95;
                                                }
                                              }
                                              id v63 = v115;

                                              __int16 v36 = v198;
                                              if (v63) {
                                                goto LABEL_103;
                                              }
                                            }
                                            else
                                            {
LABEL_95:
                                            }
                                            v122 = (void *)MEMORY[0x230FBD990]();
                                            id v123 = a1;
                                            v124 = HMFGetOSLogHandle();
                                            if (os_log_type_enabled(v124, OS_LOG_TYPE_INFO))
                                            {
                                              v125 = HMFGetLogIdentifier();
                                              *(_DWORD *)v224 = 138543618;
                                              v225 = v125;
                                              __int16 v226 = 2112;
                                              v227 = v35;
                                              _os_log_impl(&dword_22F52A000, v124, OS_LOG_TYPE_INFO, "%{public}@Unable to find the characteristic with uniqueIdentifier: %@", v224, 0x16u);

                                              __int16 v36 = v198;
                                            }

                                            id v63 = 0;
LABEL_103:
                                          }
                                          else
                                          {
LABEL_47:

LABEL_96:
                                            v118 = (void *)MEMORY[0x230FBD990]();
                                            id v119 = a1;
                                            v120 = HMFGetOSLogHandle();
                                            if (os_log_type_enabled(v120, OS_LOG_TYPE_INFO))
                                            {
                                              v121 = HMFGetLogIdentifier();
                                              *(_DWORD *)v228 = 138543618;
                                              v229 = v121;
                                              __int16 v230 = 2112;
                                              v231 = v189;
                                              _os_log_impl(&dword_22F52A000, v120, OS_LOG_TYPE_INFO, "%{public}@Unable to find the service with uniqueIdentifier : %@", v228, 0x16u);

                                              __int16 v36 = v198;
                                            }

                                            id v63 = 0;
                                          }
                                          v40 = v197;
                                        }
                                        else
                                        {
                                          v104 = (void *)MEMORY[0x230FBD990]();
                                          id v105 = a1;
                                          v106 = HMFGetOSLogHandle();
                                          if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
                                          {
                                            v107 = HMFGetLogIdentifier();
                                            *(_DWORD *)buf = 138543618;
                                            *(void *)&uint8_t buf[4] = v107;
                                            *(_WORD *)&buf[12] = 2112;
                                            *(void *)&buf[14] = v197;
                                            _os_log_impl(&dword_22F52A000, v106, OS_LOG_TYPE_ERROR, "%{public}@Can't find accessory %@", buf, 0x16u);
                                          }
                                          id v63 = 0;
                                          v40 = v197;
                                          __int16 v36 = v198;
                                        }
                                        id v37 = v200;
                                      }
                                      else
                                      {
                                        v108 = (void *)MEMORY[0x230FBD990]();
                                        id v195 = a1;
                                        v109 = HMFGetOSLogHandle();
                                        if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
                                        {
                                          HMFGetLogIdentifier();
                                          v110 = v190 = v108;
                                          v111 = [v31 spiClientIdentifier];
                                          v112 = [v31 uuid];
                                          *(_DWORD *)buf = v177;
                                          *(void *)&uint8_t buf[4] = v110;
                                          *(_WORD *)&buf[12] = 2112;
                                          *(void *)&buf[14] = v184;
                                          __int16 v233 = 2112;
                                          id v234 = v111;
                                          __int16 v235 = 2112;
                                          v236 = v112;
                                          _os_log_impl(&dword_22F52A000, v109, OS_LOG_TYPE_ERROR, "%{public}@Trying to dereference characteristic reference from different home [Looking for :%@] against [spiIdenfitifer : %@], [UUID : %@]", buf, 0x2Au);

                                          v40 = v197;
                                          id v37 = v200;

                                          v108 = v190;
                                        }

                                        id v63 = 0;
                                        __int16 v36 = v198;
                                      }
                                    }
                                    else
                                    {
                                      v100 = (void *)MEMORY[0x230FBD990]();
                                      id v101 = a1;
                                      v102 = HMFGetOSLogHandle();
                                      if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
                                      {
                                        v103 = HMFGetLogIdentifier();
                                        *(_DWORD *)buf = 138543362;
                                        *(void *)&uint8_t buf[4] = v103;
                                        _os_log_impl(&dword_22F52A000, v102, OS_LOG_TYPE_ERROR, "%{public}@Couldn't decode Home uniqueIdentifier", buf, 0xCu);
                                      }
                                      id v63 = 0;
                                      v40 = v197;
                                      __int16 v36 = v198;
                                      id v37 = v200;
                                    }
                                  }
                                  else
                                  {
                                    v96 = (void *)MEMORY[0x230FBD990]();
                                    id v97 = a1;
                                    v98 = HMFGetOSLogHandle();
                                    if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
                                    {
                                      v99 = HMFGetLogIdentifier();
                                      *(_DWORD *)buf = 138543362;
                                      *(void *)&uint8_t buf[4] = v99;
                                      _os_log_impl(&dword_22F52A000, v98, OS_LOG_TYPE_ERROR, "%{public}@Characteristic write action's HomeReference does not have uniqueIdentifier set", buf, 0xCu);
                                    }
                                    id v63 = 0;
                                    v40 = v197;
                                    __int16 v36 = v198;
                                    id v37 = v200;
                                  }
                                }
                                else
                                {
                                  v92 = (void *)MEMORY[0x230FBD990]();
                                  id v93 = a1;
                                  v94 = HMFGetOSLogHandle();
                                  if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
                                  {
                                    v95 = HMFGetLogIdentifier();
                                    *(_DWORD *)buf = 138543362;
                                    *(void *)&uint8_t buf[4] = v95;
                                    _os_log_impl(&dword_22F52A000, v94, OS_LOG_TYPE_ERROR, "%{public}@Couldn't decode accessory uniqueIdentifier", buf, 0xCu);
                                  }
                                  id v63 = 0;
                                  v40 = 0;
                                  __int16 v36 = v198;
                                  id v37 = v200;
                                }

LABEL_109:
LABEL_110:

LABEL_111:
                                goto LABEL_112;
                              }
                              v83 = (void *)MEMORY[0x230FBD990]();
                              id v84 = a1;
                              v85 = HMFGetOSLogHandle();
                              if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
                              {
                                HMFGetLogIdentifier();
                                id v86 = v31;
                                v87 = v35;
                                v89 = v88 = v36;
                                *(_DWORD *)buf = 138543362;
                                *(void *)&uint8_t buf[4] = v89;
                                v90 = v85;
                                v91 = "%{public}@Characteristic write action does not have home reference";
LABEL_68:
                                _os_log_impl(&dword_22F52A000, v90, OS_LOG_TYPE_ERROR, v91, buf, 0xCu);

                                __int16 v36 = v88;
                                uint64_t v35 = v87;
                                id v31 = v86;
                                a1 = v199;
                              }
                            }
                            else
                            {
                              v83 = (void *)MEMORY[0x230FBD990]();
                              id v84 = a1;
                              v85 = HMFGetOSLogHandle();
                              if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
                              {
                                HMFGetLogIdentifier();
                                id v86 = v31;
                                v87 = v35;
                                v89 = v88 = v36;
                                *(_DWORD *)buf = 138543362;
                                *(void *)&uint8_t buf[4] = v89;
                                v90 = v85;
                                v91 = "%{public}@Characteristic write action does not have accessory uniqueIdentifier";
                                goto LABEL_68;
                              }
                            }

                            id v63 = 0;
                            id v37 = v200;
                            goto LABEL_109;
                          }
                          v74 = (void *)MEMORY[0x230FBD990]();
                          id v75 = a1;
                          v76 = HMFGetOSLogHandle();
                          if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
                          {
                            HMFGetLogIdentifier();
                            id v77 = v31;
                            v78 = v35;
                            v80 = v79 = v36;
                            *(_DWORD *)buf = 138543362;
                            *(void *)&uint8_t buf[4] = v80;
                            v81 = v76;
                            v82 = "%{public}@Characteristic write action does not have reference to the accessory";
LABEL_62:
                            _os_log_impl(&dword_22F52A000, v81, OS_LOG_TYPE_ERROR, v82, buf, 0xCu);

                            __int16 v36 = v79;
                            uint64_t v35 = v78;
                            id v31 = v77;
                            a1 = v199;
                          }
                        }
                        else
                        {
                          v74 = (void *)MEMORY[0x230FBD990]();
                          id v75 = a1;
                          v76 = HMFGetOSLogHandle();
                          if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
                          {
                            HMFGetLogIdentifier();
                            id v77 = v31;
                            v78 = v35;
                            v80 = v79 = v36;
                            *(_DWORD *)buf = 138543362;
                            *(void *)&uint8_t buf[4] = v80;
                            v81 = v76;
                            v82 = "%{public}@Characteristic write action's service uniqueIdentifier is nil'";
                            goto LABEL_62;
                          }
                        }

                        id v63 = 0;
                        goto LABEL_110;
                      }
                      v64 = (void *)MEMORY[0x230FBD990]();
                      id v65 = a1;
                      v66 = HMFGetOSLogHandle();
                      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                      {
                        v67 = HMFGetLogIdentifier();
                        *(_DWORD *)buf = 138543362;
                        *(void *)&uint8_t buf[4] = v67;
                        v68 = v66;
                        v69 = "%{public}@Characteristic write action does not have reference to the service";
                        goto LABEL_53;
                      }
                    }
                    else
                    {
                      v64 = (void *)MEMORY[0x230FBD990]();
                      id v65 = a1;
                      v66 = HMFGetOSLogHandle();
                      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                      {
                        v67 = HMFGetLogIdentifier();
                        *(_DWORD *)buf = 138543362;
                        *(void *)&uint8_t buf[4] = v67;
                        v68 = v66;
                        v69 = "%{public}@Characteristic write action does not have reference to the characteristic";
LABEL_53:
                        _os_log_impl(&dword_22F52A000, v68, OS_LOG_TYPE_ERROR, v69, buf, 0xCu);
                      }
                    }

                    id v63 = 0;
LABEL_112:

                    v126 = (void *)MEMORY[0x263F08928];
                    v127 = [MEMORY[0x263F0E290] allowedTargetValueClassesForShortcuts];
                    v128 = [v30 targetValue];
                    id v210 = 0;
                    v129 = [v126 unarchivedObjectOfClasses:v127 fromData:v128 error:&v210];
                    id v130 = v210;

                    if (v130)
                    {
                      v131 = (void *)MEMORY[0x230FBD990]();
                      id v132 = a1;
                      v133 = HMFGetOSLogHandle();
                      if (os_log_type_enabled(v133, OS_LOG_TYPE_ERROR))
                      {
                        v134 = HMFGetLogIdentifier();
                        *(_DWORD *)buf = 138544386;
                        *(void *)&uint8_t buf[4] = v134;
                        *(_WORD *)&buf[12] = 2112;
                        *(void *)&buf[14] = v130;
                        __int16 v233 = 2112;
                        id v234 = v63;
                        __int16 v235 = 2112;
                        v236 = v203;
                        __int16 v237 = 2112;
                        id v238 = v204;
                        _os_log_impl(&dword_22F52A000, v133, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive allowed target value from target value data (%@) for characteristic: %@ in action set: %@ home: %@", buf, 0x34u);
                      }
                    }

                    if (v63)
                    {
                      if (v129)
                      {
                        v135 = [HMDCharacteristicWriteTuple alloc];
                        id v136 = v63;
                        id v137 = v129;
                        if (v135)
                        {
                          *(void *)buf = v135;
                          *(void *)&buf[8] = HMDCharacteristicWriteTuple;
                          v138 = (HMDCharacteristicWriteTuple *)objc_msgSendSuper2((objc_super *)buf, sel_init);
                          v135 = v138;
                          if (v138)
                          {
                            objc_storeStrong((id *)&v138->_characteristic, v63);
                            objc_storeStrong(&v135->_targetValue, v129);
                          }
                        }

                        [v206 addObject:v135];
                        id v63 = v136;
                      }
                      else
                      {
                        v143 = (void *)MEMORY[0x230FBD990]();
                        id v144 = a1;
                        v145 = HMFGetOSLogHandle();
                        if (os_log_type_enabled(v145, OS_LOG_TYPE_INFO))
                        {
                          v146 = HMFGetLogIdentifier();
                          *(_DWORD *)buf = 138543362;
                          *(void *)&uint8_t buf[4] = v146;
                          _os_log_impl(&dword_22F52A000, v145, OS_LOG_TYPE_INFO, "%{public}@Did not find the target value belonging to the write action", buf, 0xCu);
                        }
                      }
                      uint64_t v27 = v207;
                      goto LABEL_130;
                    }
                    id v63 = v129;
                    uint64_t v27 = v207;
LABEL_123:
                    v139 = (void *)MEMORY[0x230FBD990]();
                    id v140 = a1;
                    v141 = HMFGetOSLogHandle();
                    if (os_log_type_enabled(v141, OS_LOG_TYPE_INFO))
                    {
                      v142 = HMFGetLogIdentifier();
                      *(_DWORD *)buf = 138543362;
                      *(void *)&uint8_t buf[4] = v142;
                      _os_log_impl(&dword_22F52A000, v141, OS_LOG_TYPE_INFO, "%{public}@Did not find the accessory/characteristic belonging to the write action", buf, 0xCu);
                    }
LABEL_130:

                    ++v28;
                  }
                  while (v28 != v27);
                  uint64_t v27 = [obj countByEnumeratingWithState:&v211 objects:v223 count:16];
                  if (!v27)
                  {
LABEL_132:

                    id v10 = v180;
                    id v9 = v181;
                    goto LABEL_155;
                  }
                }
              }
              v173 = (void *)MEMORY[0x230FBD990]();
              id v174 = a1;
              v175 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v175, OS_LOG_TYPE_ERROR))
              {
                v176 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543874;
                *(void *)&uint8_t buf[4] = v176;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v204;
                __int16 v233 = 2112;
                id v234 = v192;
                _os_log_impl(&dword_22F52A000, v175, OS_LOG_TYPE_ERROR, "%{public}@Cannot deserialize actionSet for different home. expected home :%@, found home :%@", buf, 0x20u);
              }
LABEL_155:
              v154 = v201;
              v168 = v192;
            }
            else
            {
              v168 = 0;
              v169 = (void *)MEMORY[0x230FBD990]();
              id v170 = a1;
              v171 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v171, OS_LOG_TYPE_ERROR))
              {
                v172 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543362;
                *(void *)&uint8_t buf[4] = v172;
                _os_log_impl(&dword_22F52A000, v171, OS_LOG_TYPE_ERROR, "%{public}@Couldn't decode Home UUID", buf, 0xCu);
              }
              v154 = v201;
            }

            goto LABEL_157;
          }
          v163 = (void *)MEMORY[0x230FBD990]();
          id v164 = a1;
          v165 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v165, OS_LOG_TYPE_ERROR))
          {
            v166 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v166;
            v167 = "%{public}@homeUUID not set while decoding ActionSet";
            goto LABEL_147;
          }
        }
        else
        {
          v163 = (void *)MEMORY[0x230FBD990]();
          id v164 = a1;
          v165 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v165, OS_LOG_TYPE_ERROR))
          {
            v166 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v166;
            v167 = "%{public}@Couldn't decode ActionSet UUID";
LABEL_147:
            _os_log_impl(&dword_22F52A000, v165, OS_LOG_TYPE_ERROR, v167, buf, 0xCu);
          }
        }

        v154 = v201;
LABEL_157:

LABEL_158:
LABEL_159:

        goto LABEL_160;
      }
    }
    else
    {
    }
    v147 = (void *)MEMORY[0x230FBD990]();
    id v148 = a1;
    v149 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v149, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v151 = id v150 = v10;
      v152 = objc_msgSend(v9, "hmf_stringForKey:", v11);
      v153 = objc_msgSend(v9, "hmf_stringForKey:", *MEMORY[0x263F0B8F8]);
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v151;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v152;
      __int16 v233 = 2112;
      id v234 = v153;
      _os_log_impl(&dword_22F52A000, v149, OS_LOG_TYPE_ERROR, "%{public}@Protobuf version mismatch : ProtoKey: %@, ProtoVersion: %@", buf, 0x20u);

      id v10 = v150;
    }
  }
LABEL_160:
}

uint64_t __58__HMDShortcutAction_doesActionSetContainUnsecuringAction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 containsUnsecuringAction];
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = *(id *)(a1 + 32);
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = @"does not";
    int v11 = 138543874;
    id v12 = v8;
    __int16 v13 = 2112;
    if (v4) {
      id v9 = @"does";
    }
    char v14 = v9;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@ActionSet %@ unsecure the home : %@", (uint8_t *)&v11, 0x20u);
  }

  return v4;
}

- (uint64_t)doesActionSetContainItemsPassingTest:(void *)a3 actionSetUUIDs:
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [a1 actionSet];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __73__HMDShortcutAction_doesActionSetContainItemsPassingTest_actionSetUUIDs___block_invoke;
  v12[3] = &unk_264A14A90;
  id v13 = v7;
  char v14 = a1;
  id v8 = v5;
  id v15 = v8;
  id v9 = v7;
  uint64_t v10 = objc_msgSend(v6, "na_any:", v12);

  return v10;
}

uint64_t __73__HMDShortcutAction_doesActionSetContainItemsPassingTest_actionSetUUIDs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) uuid];
  if (![v4 isEqual:v3])
  {
    id v5 = [*(id *)(a1 + 32) spiClientIdentifier];
    int v6 = [v5 isEqual:v3];

    if (v6) {
      goto LABEL_4;
    }
    char v14 = [*(id *)(a1 + 32) home];
    id v15 = [v14 actionSetWithUUID:v3];
    if (!v15)
    {
      id v16 = (void *)MEMORY[0x230FBD990]();
      id v17 = *(id *)(a1 + 40);
      uint64_t v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        id v30 = v19;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Could not find actionSet based on actionSet.uuid. Now searching using spiClientIdentifier", buf, 0xCu);
      }
      uint64_t v20 = [v14 actionSets];
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __73__HMDShortcutAction_doesActionSetContainItemsPassingTest_actionSetUUIDs___block_invoke_191;
      v27[3] = &unk_264A210B8;
      id v21 = v3;
      id v28 = v21;
      objc_msgSend(v20, "na_firstObjectPassingTest:", v27);
      id v15 = (id)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        uint64_t v23 = (void *)MEMORY[0x230FBD990]();
        id v24 = *(id *)(a1 + 40);
        uint64_t v25 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          long long v26 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          id v30 = v26;
          __int16 v31 = 2112;
          id v32 = v21;
          _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Could not find actionSet [%@]", buf, 0x16u);
        }
        uint64_t v13 = 0;
        id v15 = v28;
        goto LABEL_13;
      }
    }
    uint64_t v13 = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_13:

    goto LABEL_14;
  }

LABEL_4:
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 40);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    int v11 = [*(id *)(a1 + 32) uuid];
    id v12 = [*(id *)(a1 + 32) spiClientIdentifier];
    *(_DWORD *)buf = 138544130;
    id v30 = v10;
    __int16 v31 = 2112;
    id v32 = v3;
    __int16 v33 = 2112;
    v34 = v11;
    __int16 v35 = 2112;
    __int16 v36 = v12;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Skipping actionSet to avoid cycle. [Checking ActionSet : %@] against [ActionSetUUID: %@] [ActionSet SPI Identifier: %@]", buf, 0x2Au);
  }
  uint64_t v13 = 0;
LABEL_14:

  return v13;
}

uint64_t __73__HMDShortcutAction_doesActionSetContainItemsPassingTest_actionSetUUIDs___block_invoke_191(uint64_t a1, void *a2)
{
  id v3 = [a2 spiClientIdentifier];
  uint64_t v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(void *)(a1 + 32));

  return v4;
}

uint64_t __61__HMDShortcutAction_doesAnyCharacteristicTupleUnsecureAHome___block_invoke(uint64_t a1, void *a2)
{
  id Property = a2;
  id v5 = Property;
  if (Property) {
    id Property = objc_getProperty(Property, v4, 8, 1);
  }
  id v6 = Property;
  id v7 = *(void **)(a1 + 32);
  id v8 = [v6 type];
  id v9 = [v6 service];
  uint64_t v10 = [v9 type];
  if ([v7 requiresDeviceUnlock:v8 forService:v10])
  {
    int v11 = *(void **)(a1 + 32);
    uint64_t v13 = [v6 type];
    if (v5) {
      id v14 = objc_getProperty(v5, v12, 16, 1);
    }
    else {
      id v14 = 0;
    }
    uint64_t v15 = [v11 allowsSecuringWriteFor:v13 withValue:v14] ^ 1;
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (BOOL)requiresDeviceUnlock
{
  v3[4] = self;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __41__HMDShortcutAction_requiresDeviceUnlock__block_invoke;
  v4[3] = &unk_264A14A68;
  v4[4] = self;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __41__HMDShortcutAction_requiresDeviceUnlock__block_invoke_2;
  v3[3] = &unk_264A14A68;
  return -[HMDShortcutAction doesAnyCharacteristicWriteTuplePassTest:orDoesAnyActionSetPassTest:](self, v4, v3);
}

BOOL __41__HMDShortcutAction_requiresDeviceUnlock__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  if (v2)
  {
    uint64_t v4 = +[HMDHAPMetadata getSharedInstance];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __67__HMDShortcutAction_doesAnyCharacteristicTupleRequireDeviceUnlock___block_invoke;
    v20[3] = &unk_264A14AB8;
    id v5 = v4;
    id v21 = v5;
    id Property = objc_msgSend(v3, "na_firstObjectPassingTest:", v20);
    id v8 = Property;
    if (Property) {
      id Property = objc_getProperty(Property, v7, 8, 1);
    }
    id v9 = Property;

    BOOL v10 = v9 != 0;
    int v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = v2;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      uint64_t v15 = [v9 service];
      uint64_t v16 = [v15 accessory];
      id v17 = (void *)v16;
      uint64_t v18 = @"does not";
      *(_DWORD *)buf = 138543874;
      uint64_t v23 = v14;
      __int16 v24 = 2112;
      if (v9) {
        uint64_t v18 = &stru_26E2EB898;
      }
      uint64_t v25 = v16;
      __int16 v26 = 2112;
      uint64_t v27 = v18;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@[%@] %@ requires device to be unlock", buf, 0x20u);
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

uint64_t __41__HMDShortcutAction_requiresDeviceUnlock__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  if (v2)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __62__HMDShortcutAction_doesActionSetContainSecureCharacteristic___block_invoke;
    v11[3] = &unk_264A210B8;
    v11[4] = v2;
    uint64_t v4 = -[HMDShortcutAction doesActionSetContainItemsPassingTest:actionSetUUIDs:](v2, v11, v3);
    id v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = v2;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      id v9 = HMFBooleanToString();
      *(_DWORD *)buf = 138543618;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Does this shortcut action contain any secure class accessories: [%@]", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t __62__HMDShortcutAction_doesActionSetContainSecureCharacteristic___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 containsSecureCharacteristic];
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = *(id *)(a1 + 32);
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = @"does not";
    int v11 = 138543874;
    id v12 = v8;
    __int16 v13 = 2112;
    if (v4) {
      id v9 = @"does";
    }
    __int16 v14 = v9;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@ActionSet %@ contain secure class accessory : %@", (uint8_t *)&v11, 0x20u);
  }

  return v4;
}

uint64_t __67__HMDShortcutAction_doesAnyCharacteristicTupleRequireDeviceUnlock___block_invoke(uint64_t a1, id self)
{
  if (self) {
    id Property = objc_getProperty(self, (SEL)self, 8, 1);
  }
  else {
    id Property = 0;
  }
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = Property;
  id v6 = [v5 type];
  id v7 = [v5 service];

  id v8 = [v7 type];
  uint64_t v9 = [v4 requiresDeviceUnlock:v6 forService:v8];

  return v9;
}

- (void)executeWithSource:(unint64_t)a3 clientName:(id)a4 completionHandler:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  if (WorkflowKitLibraryCore() && self->_controller)
  {
    uint64_t v9 = (void *)MEMORY[0x230FBD990]();
    BOOL v10 = self;
    int v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = HMFGetLogIdentifier();
      shortcut = v10->_shortcut;
      *(_DWORD *)buf = 138543618;
      __int16 v24 = v12;
      __int16 v25 = 2114;
      __int16 v26 = shortcut;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Executing shortcut action : %{public}@", buf, 0x16u);
    }
    objc_initWeak((id *)buf, v10);
    controller = self->_controller;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __68__HMDShortcutAction_executeWithSource_clientName_completionHandler___block_invoke;
    v20[3] = &unk_264A14A40;
    objc_copyWeak(&v22, (id *)buf);
    id v21 = v8;
    [(WFHomeWorkflowController *)controller startWithCompletionHandler:v20];

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    __int16 v15 = (void *)MEMORY[0x230FBD990]();
    id v16 = self;
    uint64_t v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v24 = v18;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@The shortcut action is unavailable to execute", buf, 0xCu);
    }
    if (v8)
    {
      v19 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
      (*((void (**)(id, void *))v8 + 2))(v8, v19);
    }
  }
}

void __68__HMDShortcutAction_executeWithSource_clientName_completionHandler___block_invoke(uint64_t a1, void *a2, int a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = WeakRetained;
  uint64_t v9 = HMFGetOSLogHandle();
  BOOL v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = HMFGetLogIdentifier();
      uint64_t v12 = v8[4];
      int v21 = 138543874;
      id v22 = v11;
      __int16 v23 = 2114;
      uint64_t v24 = v12;
      __int16 v25 = 2114;
      id v26 = v5;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to execute shortcut action %{public}@ with error: %{public}@", (uint8_t *)&v21, 0x20u);
    }
    uint64_t v13 = [MEMORY[0x263F087E8] hmErrorWithCode:-1 description:0 reason:0 suggestion:0 underlyingError:v5];
LABEL_9:
    uint64_t v17 = (void *)v13;
    goto LABEL_10;
  }
  BOOL v14 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (a3)
  {
    if (v14)
    {
      __int16 v15 = HMFGetLogIdentifier();
      uint64_t v16 = v8[4];
      int v21 = 138543618;
      id v22 = v15;
      __int16 v23 = 2112;
      uint64_t v24 = v16;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@shortcut action execution was cancelled : %@", (uint8_t *)&v21, 0x16u);
    }
    uint64_t v13 = [MEMORY[0x263F087E8] hmErrorWithCode:23];
    goto LABEL_9;
  }
  if (v14)
  {
    v19 = HMFGetLogIdentifier();
    uint64_t v20 = v8[4];
    int v21 = 138543618;
    id v22 = v19;
    __int16 v23 = 2112;
    uint64_t v24 = v20;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Shortcut action successfully executed : %@", (uint8_t *)&v21, 0x16u);
  }
  uint64_t v17 = 0;
LABEL_10:
  uint64_t v18 = *(void *)(a1 + 32);
  if (v18) {
    (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v17);
  }
}

- (id)stateDump
{
  id v3 = [MEMORY[0x263EFF9C0] set];
  uint64_t v4 = [MEMORY[0x263EFF9C0] set];
  id v5 = [(WFHomeWorkflow *)self->_shortcut homeIdentifier];
  -[HMDShortcutAction getCharacteristicsAndActionSetsFromShortcut:characteristicWriteTuples:homeUUID:]((id *)&self->super.super.super.isa, v3, v4, v5);
  id v6 = objc_msgSend(v4, "na_map:", &__block_literal_global_2547);
  v11.receiver = self;
  v11.super_class = (Class)HMDShortcutAction;
  id v7 = [(HMDAction *)&v11 stateDump];
  [(HMDShortcutAction *)self requiresDeviceUnlock];
  id v8 = HMFBooleanToString();
  uint64_t v9 = [v7 stringByAppendingFormat:@", Shortcut: [DeviceRequiresUnlock: %@] [Home: %@], [ActionSets: %@], [Characteristic: %@]", v8, v5, v3, v6];

  return v9;
}

id __30__HMDShortcutAction_stateDump__block_invoke(int a1, id self)
{
  if (self)
  {
    id Property = objc_getProperty(self, (SEL)self, 8, 1);
  }
  else
  {
    id Property = 0;
  }
  return Property;
}

- (id)dictionaryRepresentation
{
  v11[1] = *MEMORY[0x263EF8340];
  v9.receiver = self;
  v9.super_class = (Class)HMDShortcutAction;
  id v3 = [(HMDAction *)&v9 dictionaryRepresentation];
  uint64_t v4 = (void *)[v3 mutableCopy];

  shortcutData = self->_shortcutData;
  if (shortcutData)
  {
    uint64_t v10 = *MEMORY[0x263F0DE58];
    v11[0] = shortcutData;
    id v6 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    [v4 addEntriesFromDictionary:v6];
  }
  id v7 = (void *)[v4 copy];

  return v7;
}

- (unint64_t)type
{
  return 2;
}

- (void)dealloc
{
  controller = self->_controller;
  if (controller) {
    [(WFHomeWorkflowController *)controller cancel];
  }
  v4.receiver = self;
  v4.super_class = (Class)HMDShortcutAction;
  [(HMDShortcutAction *)&v4 dealloc];
}

- (id)removeShortcut
{
  shortcutData = self->_shortcutData;
  self->_shortcutData = 0;

  return self;
}

- (HMDShortcutAction)initWithSerializedShortcut:(id)a3 uuid:(id)a4 actionSet:(id)a5
{
  id v8 = a3;
  if (v8)
  {
    v13.receiver = self;
    v13.super_class = (Class)HMDShortcutAction;
    objc_super v9 = [(HMDAction *)&v13 initWithUUID:a4 actionSet:a5];
    if (v9)
    {
      uint64_t v10 = (void *)[v8 copy];
      __HMDShortcutActionInitializeWithSerializedShortcut(v9, v10);
    }
    self = v9;
    objc_super v11 = self;
  }
  else
  {
    objc_super v11 = 0;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t53 != -1) {
    dispatch_once(&logCategory__hmf_once_t53, &__block_literal_global_223);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v54;
  return v2;
}

void __32__HMDShortcutAction_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v54;
  logCategory__hmf_once_uint64_t v54 = v0;
}

+ (id)actionWithDictionaryRepresentation:(id)a3 home:(id)a4 actionSet:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_super v11 = objc_msgSend(v8, "hmf_numberForKey:", @"kActionType");
  if ([v11 unsignedIntegerValue] == 2)
  {
    uint64_t v12 = objc_msgSend(v8, "hmf_dataForKey:", *MEMORY[0x263F0DE58]);
    if (v12)
    {
      id v13 = objc_alloc((Class)a1);
      BOOL v14 = [MEMORY[0x263F08C38] UUID];
      __int16 v15 = (void *)[v13 initWithSerializedShortcut:v12 uuid:v14 actionSet:v10];
    }
    else
    {
      uint64_t v20 = (void *)MEMORY[0x230FBD990]();
      id v21 = a1;
      id v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        __int16 v23 = HMFGetLogIdentifier();
        int v25 = 138543618;
        id v26 = v23;
        __int16 v27 = 2112;
        id v28 = v8;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Missing serialized shortcut: %@", (uint8_t *)&v25, 0x16u);
      }
      __int16 v15 = 0;
    }
  }
  else
  {
    uint64_t v16 = (void *)MEMORY[0x230FBD990]();
    id v17 = a1;
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = HMFGetLogIdentifier();
      int v25 = 138543618;
      id v26 = v19;
      __int16 v27 = 2112;
      id v28 = v11;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Invalid action type: %@", (uint8_t *)&v25, 0x16u);
    }
    __int16 v15 = 0;
  }

  return v15;
}

+ (id)actionWithDictionaryRepresentation:(id)a3 home:(id)a4
{
  return (id)[a1 actionWithDictionaryRepresentation:a3 home:a4 actionSet:0];
}

@end