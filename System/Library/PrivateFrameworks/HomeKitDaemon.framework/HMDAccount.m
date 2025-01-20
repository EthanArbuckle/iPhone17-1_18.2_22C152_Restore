@interface HMDAccount
+ (BOOL)supportsSecureCoding;
+ (HMDAccount)accountWithHandle:(id)a3;
+ (id)logCategory;
- (BOOL)hasFamilyMember:(id)a3;
- (BOOL)isAuthenticated;
- (BOOL)isCurrentAccount;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAccount:(id)a3;
- (BOOL)isPresentInContacts;
- (BOOL)isRelatedToAccount:(id)a3;
- (BOOL)mergeObject:(id)a3;
- (BOOL)shouldCache;
- (BOOL)shouldMergeObject:(id)a3;
- (BOOL)updateBackingModel:(id)a3 error:(id *)a4;
- (CNContact)contact;
- (Class)modelClass;
- (HMDAccount)init;
- (HMDAccount)initWithBackingModel:(id)a3;
- (HMDAccount)initWithCoder:(id)a3;
- (HMDAccount)initWithIdentifier:(id)a3 handles:(id)a4 devices:(id)a5;
- (HMDAccount)initWithObjectModel:(id)a3;
- (HMDAccountHandle)primaryHandle;
- (HMDAccountIdentifier)identifier;
- (HMDAccountManager)manager;
- (HMDDevice)currentDevice;
- (NSArray)devices;
- (NSArray)handles;
- (NSArray)identities;
- (NSString)name;
- (NSString)senderCorrelationIdentifier;
- (NSUUID)modelIdentifier;
- (NSUUID)modelParentIdentifier;
- (Protocol)backingModelType;
- (id)accountHandleWithModelIdentifier:(id)a3;
- (id)appleAccountSenderCorrelationIdentifier;
- (id)attributeDescriptions;
- (id)backingStoreObjectsWithChangeType:(unint64_t)a3 version:(int64_t)a4;
- (id)currentDeviceModelsWithChangeType:(unint64_t)a3 version:(int64_t)a4;
- (id)deviceForHandle:(id)a3;
- (id)deviceForIdentifier:(id)a3;
- (id)deviceWithModelIdentifier:(id)a3;
- (id)logIdentifier;
- (id)modelBackedObjects;
- (id)modelObjectWithChangeType:(unint64_t)a3 version:(int64_t)a4;
- (id)shortDescription;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
- (void)_repairDevicesWithStaleHandle:(id)a3;
- (void)addDevice:(id)a3;
- (void)addHandle:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)isOfKnownPersonWithCompletion:(id)a3;
- (void)isPresentInFamilyCircleWithCompletion:(id)a3;
- (void)removeDevice:(id)a3;
- (void)removeHandle:(id)a3;
- (void)setAppleAccountSenderCorrelationIdentifier:(id)a3;
- (void)setHandles:(id)a3;
- (void)setManager:(id)a3;
- (void)setSenderCorrelationIdentifier:(id)a3;
- (void)transactionObjectRemoved:(id)a3 message:(id)a4;
- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
@end

@implementation HMDAccount

- (HMDDevice)currentDevice
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(HMDAccount *)self devices];
  id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v6 isCurrentDevice])
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (HMDDevice *)v3;
}

- (BOOL)isCurrentAccount
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(HMDAccount *)self devices];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) isCurrentDevice])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_manager);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_appleAccountSenderCorrelationIdentifier, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_handles, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setManager:(id)a3
{
}

- (HMDAccountManager)manager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  return (HMDAccountManager *)WeakRetained;
}

- (HMDAccountIdentifier)identifier
{
  return (HMDAccountIdentifier *)objc_getProperty(self, a2, 48, 1);
}

- (id)modelBackedObjects
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  [v3 addObject:self];
  uint64_t v4 = [(HMDAccount *)self handles];
  [v3 addObjectsFromArray:v4];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = [(HMDAccount *)self devices];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) modelBackedObjects];
        [v3 addObjectsFromArray:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  long long v11 = (void *)[v3 copy];
  return v11;
}

- (id)currentDeviceModelsWithChangeType:(unint64_t)a3 version:(int64_t)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [(HMDAccount *)self devices];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    long long v10 = (void *)MEMORY[0x263EFFA68];
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v12 isCurrentDevice])
        {
          long long v10 = [v12 backingStoreObjectsWithChangeType:a3 version:a4];
          goto LABEL_12;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    long long v10 = (void *)MEMORY[0x263EFFA68];
  }
LABEL_12:

  return v10;
}

- (id)backingStoreObjectsWithChangeType:(unint64_t)a3 version:(int64_t)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v7 = [MEMORY[0x263EFF980] array];
  uint64_t v8 = [(HMDAccount *)self modelObjectWithChangeType:a3 version:a4];
  [v7 addObject:v8];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v9 = [(HMDAccount *)self handles];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = [*(id *)(*((void *)&v27 + 1) + 8 * i) modelObjectWithChangeType:a3 version:a4];
        [v7 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v11);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v15 = [(HMDAccount *)self devices];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = [*(id *)(*((void *)&v23 + 1) + 8 * j) backingStoreObjectsWithChangeType:a3 version:a4];
        [v7 addObjectsFromArray:v20];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v17);
  }

  v21 = (void *)[v7 copy];
  return v21;
}

- (id)modelObjectWithChangeType:(unint64_t)a3 version:(int64_t)a4
{
  uint64_t v6 = [HMDAccountModel alloc];
  uint64_t v7 = [(HMDAccount *)self modelIdentifier];
  uint64_t v8 = [(HMDAccount *)self modelParentIdentifier];
  uint64_t v9 = [(HMDBackingStoreModelObject *)v6 initWithObjectChangeType:a3 uuid:v7 parentUUID:v8];

  uint64_t v10 = [(HMDAccount *)self identifier];
  uint64_t v11 = (void *)[v10 copy];
  [(HMDAccountModel *)v9 setIdentifier:v11];

  return v9;
}

- (NSUUID)modelParentIdentifier
{
  if (modelParentIdentifier_onceToken != -1) {
    dispatch_once(&modelParentIdentifier_onceToken, &__block_literal_global_400);
  }
  v2 = (void *)modelParentIdentifier_homeManagerUUID;
  return (NSUUID *)v2;
}

void __35__HMDAccount_modelParentIdentifier__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"1CAEDC10-E3E5-41A4-BB17-A9EEBA14A938"];
  v1 = (void *)modelParentIdentifier_homeManagerUUID;
  modelParentIdentifier_homeManagerUUID = v0;
}

- (NSUUID)modelIdentifier
{
  v2 = [(HMDAccount *)self identifier];
  uint64_t v3 = [v2 identifier];

  return (NSUUID *)v3;
}

- (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = v9;
  if (!v11)
  {
    id v12 = v9;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      long long v13 = v12;
    }
    else {
      long long v13 = 0;
    }
    id v14 = v13;

    if (v14)
    {
      long long v15 = self;
      id v33 = v8;
      id v16 = v14;
      id v17 = v10;
      uint64_t v18 = [v17 transactionResult];
      uint64_t v19 = [v16 uuid];
      v20 = [(HMDAccount *)v15 accountHandleWithModelIdentifier:v19];

      if (v20)
      {
        v21 = v33;
        [(HMDAccountHandle *)v20 transactionObjectUpdated:v33 newValues:v16 message:v17];
      }
      else
      {
        v20 = [[HMDAccountHandle alloc] initWithObjectModel:v16];
        if (v20)
        {
          os_unfair_lock_lock_with_options();
          char v31 = __HMDAccountAddHandle(v15, v20);
          os_unfair_lock_unlock(&v15->_lock);
          if (v31) {
            __HMDAccountDidUpdateHandles(v15);
          }
          [v18 markChanged];
        }
        v21 = v33;
      }
      if (![v18 source] && !-[HMDAccountHandle isLocallyTracked](v20, "isLocallyTracked"))
      {
        [(HMDAccountHandle *)v20 setLocallyTracked:1];
        [v18 markChanged];
      }
LABEL_32:

      goto LABEL_33;
    }
    id v12 = v12;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v22 = v12;
    }
    else {
      v22 = 0;
    }
    id v23 = v22;

    if (v23)
    {
      long long v15 = self;
      id v34 = v8;
      id v16 = v23;
      id v17 = v10;
      uint64_t v18 = [v17 transactionResult];
      long long v24 = [v16 uuid];
      v20 = [(HMDAccount *)v15 deviceWithModelIdentifier:v24];

      if (v20)
      {
        v21 = v34;
        [(HMDAccountHandle *)v20 transactionObjectUpdated:v34 newValues:v16 message:v17];
      }
      else
      {
        v20 = [[HMDDevice alloc] initWithObjectModel:v16];
        os_unfair_lock_lock_with_options();
        char v32 = __HMDAccountAddDevice(v15, v20);
        os_unfair_lock_unlock(&v15->_lock);
        if (v32)
        {
          [(HMDAccountHandle *)v20 setAccount:v15];
          __HMDAccountDidAddDevice(v15, v20);
        }
        v21 = v34;
      }
      [(HMDAccountHandle *)v20 __updateDeviceWithActions:v18];
      goto LABEL_32;
    }
    long long v25 = (void *)MEMORY[0x230FBD990]();
    long long v26 = self;
    long long v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      long long v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v36 = v28;
      __int16 v37 = 2112;
      id v38 = v12;
      __int16 v39 = 2112;
      id v40 = (id)objc_opt_class();
      id v29 = v40;
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectUpdated:newValues:message:]", buf, 0x20u);
    }
    long long v30 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    [v10 respondWithError:v30];

    id v12 = 0;
  }
LABEL_33:
}

- (void)transactionObjectRemoved:(id)a3 message:(id)a4
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  v60 = v7;
  v61 = v8;
  if (v10)
  {
    uint64_t v11 = self;
    id v12 = v10;
    id v13 = v7;
    id v14 = [v13 transactionResult];
    long long v15 = [v12 uuid];
    id v16 = [(HMDAccount *)v11 accountHandleWithModelIdentifier:v15];

    if (v16)
    {
      id v17 = [(HMDAccount *)v11 manager];
      int v18 = [v17 shouldAccount:v11 pushbackModel:v12 actions:v14];

      if (v18)
      {
        uint64_t v19 = [v14 backingStore];
        v20 = +[HMDBackingStoreTransactionOptions localPushBackOptions];
        v21 = [v19 transaction:@"accountHandle pushback" options:v20];

        v22 = [v16 modelObjectWithChangeType:1 version:4];
        [v21 add:v22];

        [v21 run];
      }
      else
      {
        os_unfair_lock_lock_with_options();
        v21 = __HMDAccountRemoveHandle(v11, v16);
        os_unfair_lock_unlock(&v11->_lock);
        if (v21) {
          __HMDAccountDidUpdateHandles(v11);
        }
        [v14 markChanged];
      }
    }
    else
    {
      id v40 = (void *)MEMORY[0x230FBD990]();
      uint64_t v41 = v11;
      v42 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        v43 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v67 = v43;
        __int16 v68 = 2112;
        id v69 = v12;
        __int16 v70 = 2112;
        id v71 = (id)objc_opt_class();
        v44 = v40;
        id v45 = v71;
        _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_ERROR, "%{public}@Delete request for unknown object (%@) sent to [%@ transactionObjectRemoved:message:]", buf, 0x20u);

        id v40 = v44;
      }

      v46 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
      [v13 respondWithError:v46];
    }
    id v27 = v61;
    goto LABEL_48;
  }
  id v23 = v8;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    long long v24 = v23;
  }
  else {
    long long v24 = 0;
  }
  id v25 = v24;

  if (v25)
  {
    long long v26 = self;
    id v27 = v25;
    id v59 = v7;
    long long v28 = [v59 transactionResult];
    id v29 = [v27 uuid];
    long long v30 = [(HMDAccount *)v26 deviceWithModelIdentifier:v29];

    if (!v30)
    {
      v52 = (void *)MEMORY[0x230FBD990]();
      v53 = v26;
      v54 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        v55 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v67 = v55;
        __int16 v68 = 2112;
        id v69 = v27;
        __int16 v70 = 2112;
        id v71 = (id)objc_opt_class();
        id v56 = v71;
        _os_log_impl(&dword_22F52A000, v54, OS_LOG_TYPE_ERROR, "%{public}@Delete request for unknown object (%@) sent to [%@ transactionObjectRemoved:message:]", buf, 0x20u);
      }
      v57 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
      [v59 respondWithError:v57];

      goto LABEL_47;
    }
    char v31 = [(HMDAccount *)v26 manager];
    int v32 = [v31 shouldAccount:v26 pushbackModel:v27 actions:v28];

    if (v32)
    {
      id v33 = [v28 backingStore];
      id v34 = +[HMDBackingStoreTransactionOptions localPushBackOptions];
      v35 = [v33 transaction:@"device pushback" options:v34];

      v36 = [v30 backingStoreObjectsWithChangeType:1 version:4];
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      uint64_t v37 = [v36 countByEnumeratingWithState:&v62 objects:buf count:16];
      if (v37)
      {
        uint64_t v38 = *(void *)v63;
        do
        {
          uint64_t v39 = 0;
          do
          {
            if (*(void *)v63 != v38) {
              objc_enumerationMutation(v36);
            }
            [v35 add:*(void *)(*((void *)&v62 + 1) + 8 * v39++)];
          }
          while (v37 != v39);
          uint64_t v37 = [v36 countByEnumeratingWithState:&v62 objects:buf count:16];
        }
        while (v37);
      }
      [v35 run];

LABEL_47:
      goto LABEL_48;
    }
    if ([v28 source])
    {
      if ([v28 source] != 2 || !objc_msgSend(v30, "isCloudTracked"))
      {
LABEL_43:
        if (([v30 isLocallyTracked] & 1) == 0)
        {
          os_unfair_lock_lock_with_options();
          v58 = __HMDAccountRemoveDevice(v26, v30);
          os_unfair_lock_unlock(&v26->_lock);
          if (v58)
          {
            __HMDAccountDidRemoveDevice(v26, v58);
            [v58 setAccount:0];
          }
          [v28 markChanged];
        }
        goto LABEL_47;
      }
      [v30 setCloudTracked:0];
    }
    else
    {
      if (![v30 isLocallyTracked]) {
        goto LABEL_43;
      }
      [v30 setLocallyTracked:0];
    }
    [v28 markChanged];
    goto LABEL_43;
  }
  v47 = (void *)MEMORY[0x230FBD990]();
  v48 = self;
  v49 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
  {
    v50 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v67 = v50;
    __int16 v68 = 2112;
    id v69 = v23;
    __int16 v70 = 2112;
    id v71 = (id)objc_opt_class();
    id v51 = v71;
    _os_log_impl(&dword_22F52A000, v49, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectRemoved:message:]", buf, 0x20u);
  }
  id v27 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
  [v60 respondWithError:v27];
LABEL_48:
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMDAccount *)self identifier];
  [v4 encodeObject:v5 forKey:@"HM.identifier2"];

  id v6 = [(HMDAccount *)self handles];
  [v4 encodeObject:v6 forKey:@"HM.handles"];

  id v7 = [(HMDAccount *)self devices];
  [v4 encodeObject:v7 forKey:@"HM.devices"];
}

- (HMDAccount)initWithCoder:(id)a3
{
  v29[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x263EFFA08];
  v29[0] = objc_opt_class();
  v29[1] = objc_opt_class();
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:2];
  id v7 = [v5 setWithArray:v6];
  id v8 = [v4 decodeObjectOfClasses:v7 forKey:@"HM.devices"];

  id v9 = (void *)MEMORY[0x263EFFA08];
  v28[0] = objc_opt_class();
  v28[1] = objc_opt_class();
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:2];
  uint64_t v11 = [v9 setWithArray:v10];
  id v12 = [v4 decodeObjectOfClasses:v11 forKey:@"HM.handles"];

  id v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.identifier2"];
  if (v13 && v12 && v8)
  {
    id v14 = [(HMDAccount *)self initWithIdentifier:v13 handles:v12 devices:v8];
    long long v15 = v14;
  }
  else
  {
    id v16 = (void *)MEMORY[0x230FBD990]();
    id v14 = self;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v18 = HMFGetLogIdentifier();
      int v20 = 138544130;
      v21 = v18;
      __int16 v22 = 2112;
      id v23 = v13;
      __int16 v24 = 2112;
      id v25 = v12;
      __int16 v26 = 2112;
      id v27 = v8;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Cannot initialize HMDAccount from decoded identifier: %@ handles: %@ devices:%@ ", (uint8_t *)&v20, 0x2Au);
    }
    long long v15 = 0;
  }

  return v15;
}

- (BOOL)mergeObject:(id)a3
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    id v7 = (void *)MEMORY[0x263EFF9C0];
    id v8 = [(HMDAccount *)self handles];
    id v9 = [v7 setWithArray:v8];

    id v10 = (void *)MEMORY[0x263EFFA08];
    uint64_t v11 = [v6 handles];
    id v12 = [v10 setWithArray:v11];
    int v13 = [v9 mergeObject:v12];

    __int16 v68 = v6;
    if (v13)
    {
      id v14 = (void *)MEMORY[0x230FBD990]();
      long long v15 = self;
      id v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        id v17 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v89 = v17;
        __int16 v90 = 2112;
        v91 = v9;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Updated handles: %@", buf, 0x16u);
      }
      int v18 = [v9 allObjects];
      [(HMDAccount *)v15 setHandles:v18];

      LOBYTE(v13) = 1;
    }

    uint64_t v19 = (void *)MEMORY[0x263EFFA08];
    int v20 = [(HMDAccount *)self devices];
    v21 = [v19 setWithArray:v20];

    __int16 v22 = (void *)MEMORY[0x263EFFA08];
    id v69 = v4;
    id v23 = [v4 devices];
    uint64_t v24 = [v22 setWithArray:v23];

    __int16 v70 = v21;
    id v25 = (void *)[v21 mutableCopy];
    v75 = (void *)v24;
    [v25 minusSet:v24];
    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    obuint64_t j = v25;
    uint64_t v26 = [obj countByEnumeratingWithState:&v84 objects:v96 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v85;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v85 != v28) {
            objc_enumerationMutation(obj);
          }
          long long v30 = *(void **)(*((void *)&v84 + 1) + 8 * i);
          char v31 = (void *)MEMORY[0x230FBD990]();
          int v32 = self;
          id v33 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            id v34 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v89 = v34;
            __int16 v90 = 2112;
            v91 = v30;
            _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_INFO, "%{public}@Removed device: %@", buf, 0x16u);
          }
          [(HMDAccount *)v32 removeDevice:v30];
        }
        uint64_t v27 = [obj countByEnumeratingWithState:&v84 objects:v96 count:16];
      }
      while (v27);
      LOBYTE(v13) = 1;
    }

    v35 = (void *)[v75 mutableCopy];
    [v35 minusSet:v21];
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id v73 = v35;
    uint64_t v36 = [v73 countByEnumeratingWithState:&v80 objects:v95 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v81;
      do
      {
        for (uint64_t j = 0; j != v37; ++j)
        {
          if (*(void *)v81 != v38) {
            objc_enumerationMutation(v73);
          }
          id v40 = *(void **)(*((void *)&v80 + 1) + 8 * j);
          uint64_t v41 = (void *)MEMORY[0x230FBD990]();
          v42 = self;
          v43 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            v44 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v89 = v44;
            __int16 v90 = 2112;
            v91 = v40;
            _os_log_impl(&dword_22F52A000, v43, OS_LOG_TYPE_INFO, "%{public}@Added device: %@", buf, 0x16u);
          }
          [(HMDAccount *)v42 addDevice:v40];
        }
        uint64_t v37 = [v73 countByEnumeratingWithState:&v80 objects:v95 count:16];
      }
      while (v37);
      LOBYTE(v13) = 1;
    }
    char v71 = v13;

    id v45 = (void *)[v21 mutableCopy];
    [v45 minusSet:obj];
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id v72 = v45;
    uint64_t v46 = [v72 countByEnumeratingWithState:&v76 objects:v94 count:16];
    if (v46)
    {
      uint64_t v47 = v46;
      uint64_t v48 = *(void *)v77;
      do
      {
        for (uint64_t k = 0; k != v47; ++k)
        {
          if (*(void *)v77 != v48) {
            objc_enumerationMutation(v72);
          }
          v50 = *(void **)(*((void *)&v76 + 1) + 8 * k);
          id v51 = [v75 member:v50];
          if (v51)
          {
            v52 = (void *)MEMORY[0x230FBD990]();
            v53 = self;
            v54 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
            {
              v55 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              v89 = v55;
              __int16 v90 = 2112;
              v91 = v50;
              __int16 v92 = 2112;
              v93 = v51;
              _os_log_impl(&dword_22F52A000, v54, OS_LOG_TYPE_DEBUG, "%{public}@Merging existing device: %@ with device: %@", buf, 0x20u);
            }
            if ([v50 mergeObject:v51])
            {
              id v56 = (void *)MEMORY[0x230FBD990]();
              v57 = v53;
              v58 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
              {
                id v59 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543618;
                v89 = v59;
                __int16 v90 = 2112;
                v91 = v51;
                _os_log_impl(&dword_22F52A000, v58, OS_LOG_TYPE_INFO, "%{public}@Updated device: %@", buf, 0x16u);
              }
              char v71 = 1;
            }
          }
        }
        uint64_t v47 = [v72 countByEnumeratingWithState:&v76 objects:v94 count:16];
      }
      while (v47);
    }

    v60 = [(HMDAccount *)self appleAccountSenderCorrelationIdentifier];
    id v6 = v68;
    v61 = [v68 appleAccountSenderCorrelationIdentifier];
    if (v61)
    {
      id v4 = v69;
      if (([v60 isEqualToString:v61] & 1) == 0)
      {
        long long v62 = (void *)MEMORY[0x230FBD990]();
        long long v63 = self;
        long long v64 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
        {
          long long v65 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v89 = v65;
          __int16 v90 = 2112;
          v91 = v61;
          _os_log_impl(&dword_22F52A000, v64, OS_LOG_TYPE_INFO, "%{public}@Updating sender correlation identifier to %@", buf, 0x16u);
        }
        [(HMDAccount *)v63 setAppleAccountSenderCorrelationIdentifier:v61];
        char v71 = 1;
      }
    }
    else
    {
      id v4 = v69;
    }

    BOOL v66 = v71 & 1;
  }
  else
  {
    BOOL v66 = 0;
  }

  return v66;
}

- (BOOL)shouldMergeObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  id v7 = [(HMDAccount *)self identifier];
  id v8 = [v6 identifier];

  LOBYTE(v6) = [v7 isEqual:v8];
  return (char)v6;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  id v8 = [(HMDAccount *)self devices];
  unint64_t v9 = [v8 countByEnumeratingWithState:a3 objects:a4 count:a5];

  return v9;
}

- (id)logIdentifier
{
  v2 = [(HMDAccount *)self identifier];
  uint64_t v3 = [v2 identifier];
  id v4 = [v3 UUIDString];

  return v4;
}

- (void)removeDevice:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    os_unfair_lock_lock_with_options();
    v5 = __HMDAccountRemoveDevice(self, v9);
    os_unfair_lock_unlock(&self->_lock);
    if (v5)
    {
      id v6 = self;
      id v7 = v5;
      id v8 = +[HMDAccountRegistry sharedRegistry];
      [v8 removeDevice:v7 fromAccount:v6];

      [v7 setAccount:0];
      __HMDAccountDidRemoveDevice(v6, v7);
    }

    id v4 = v9;
  }
}

- (void)addDevice:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    os_unfair_lock_lock_with_options();
    char v5 = __HMDAccountAddDevice(self, v9);
    os_unfair_lock_unlock(&self->_lock);
    id v4 = v9;
    if (v5)
    {
      [v9 setAccount:self];
      id v6 = self;
      id v7 = v9;
      id v8 = +[HMDAccountRegistry sharedRegistry];
      [v8 addDevice:v7 toAccount:v6];

      __HMDAccountDidAddDevice(v6, v7);
      id v4 = v9;
    }
  }
}

- (id)deviceWithModelIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    [(HMDAccount *)self devices];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          id v10 = objc_msgSend(v9, "modelIdentifier", (void)v13);
          char v11 = objc_msgSend(v4, "hmf_isEqualToUUID:", v10);

          if (v11)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
        id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)deviceForHandle:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = self->_devices;
  id v7 = (id)[(NSMutableSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        char v11 = objc_msgSend(v10, "handles", (void)v14);
        char v12 = [v11 containsObject:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[(NSMutableSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (id)deviceForIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = self->_devices;
  id v7 = (id)[(NSMutableSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        char v11 = objc_msgSend(v10, "identifier", (void)v14);
        char v12 = objc_msgSend(v11, "hmf_isEqualToUUID:", v4);

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[(NSMutableSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (NSArray)devices
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(NSMutableSet *)self->_devices allObjects];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (id)accountHandleWithModelIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = [(HMDAccount *)self handles];
    id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          id v10 = [v9 modelIdentifier];
          char v11 = objc_msgSend(v4, "hmf_isEqualToUUID:", v10);

          if (v11)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
        id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)_repairDevicesWithStaleHandle:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccount *)self primaryHandle];
  id v6 = [(HMDAccount *)self devices];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __44__HMDAccount__repairDevicesWithStaleHandle___block_invoke;
  v31[3] = &unk_264A2C5D8;
  id v25 = v4;
  id v32 = v25;
  uint64_t v7 = objc_msgSend(v6, "na_filter:", v31);

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v39 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v28;
    id v26 = v8;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v14 = (void *)MEMORY[0x230FBD990]();
        long long v15 = self;
        long long v16 = HMFGetOSLogHandle();
        BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
        if (v5)
        {
          if (v17)
          {
            uint64_t v18 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            id v34 = v18;
            __int16 v35 = 2112;
            uint64_t v36 = v13;
            __int16 v37 = 2112;
            uint64_t v38 = v5;
            _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Repairing stale handle for device %@ updating to %@", buf, 0x20u);

            id v8 = v26;
          }

          [v13 setAccount:v15];
        }
        else
        {
          if (v17)
          {
            uint64_t v19 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            id v34 = v19;
            __int16 v35 = 2112;
            uint64_t v36 = v13;
            _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Removing device from empty account %@", buf, 0x16u);

            id v8 = v26;
          }

          [(HMDAccount *)v15 removeDevice:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v39 count:16];
    }
    while (v10);
  }

  if (v5)
  {
    int v20 = self;
    id v21 = v8;
    __int16 v22 = +[HMDAccountRegistry sharedRegistry];
    id v23 = [MEMORY[0x263EFFA08] setWithArray:v21];

    id v24 = (id)[v22 updateDevices:v23 onAccount:v20];
  }
}

uint64_t __44__HMDAccount__repairDevicesWithStaleHandle___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 handles];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__HMDAccount__repairDevicesWithStaleHandle___block_invoke_2;
  v6[3] = &unk_264A1D8F0;
  id v7 = *(id *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __44__HMDAccount__repairDevicesWithStaleHandle___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 accountHandle];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (void)removeHandle:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    os_unfair_lock_lock_with_options();
    id v5 = __HMDAccountRemoveHandle(self, v9);
    os_unfair_lock_unlock(&self->_lock);
    if (v5)
    {
      id v6 = self;
      id v7 = v5;
      id v8 = +[HMDAccountRegistry sharedRegistry];
      [v8 removeHandle:v7 fromAccount:v6];

      __HMDAccountDidUpdateHandles(v6);
      [(HMDAccount *)v6 _repairDevicesWithStaleHandle:v9];
    }

    id v4 = v9;
  }
}

- (void)addHandle:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    os_unfair_lock_lock_with_options();
    char v5 = __HMDAccountAddHandle(self, v6);
    os_unfair_lock_unlock(&self->_lock);
    id v4 = v6;
    if (v5)
    {
      __HMDAccountDidUpdateHandles(self);
      id v4 = v6;
    }
  }
}

- (void)setHandles:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    char v5 = [MEMORY[0x263EFFA08] setWithArray:v4];
    os_unfair_lock_lock_with_options();
    if ([(NSSet *)self->_handles isEqualToSet:v5])
    {
      os_unfair_lock_unlock(&self->_lock);
    }
    else
    {
      objc_storeStrong((id *)&self->_handles, v5);
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v6 = self->_handles;
      uint64_t v7 = [(NSSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v15;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v15 != v8) {
              objc_enumerationMutation(v6);
            }
            uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
            uint64_t v11 = objc_msgSend(v10, "modelParentIdentifier", (void)v14);
            BOOL v12 = v11 == 0;

            if (v12)
            {
              long long v13 = [(HMDAccount *)self modelIdentifier];
              [v10 setModelParentIdentifier:v13];
            }
          }
          uint64_t v7 = [(NSSet *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v7);
      }

      os_unfair_lock_unlock(&self->_lock);
      __HMDAccountDidUpdateHandles(self);
    }
  }
}

- (HMDAccountHandle)primaryHandle
{
  uint64_t v3 = [(HMDAccount *)self manager];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v3 primaryHandleForAccount:self], (id v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    p_locuint64_t k = &self->_lock;
    os_unfair_lock_lock_with_options();
    id v6 = [MEMORY[0x263EFF9B0] orderedSetWithSet:self->_handles];
    [v6 sortUsingComparator:&__block_literal_global_88212];
    id v4 = [v6 lastObject];

    os_unfair_lock_unlock(p_lock);
  }

  return (HMDAccountHandle *)v4;
}

uint64_t __27__HMDAccount_primaryHandle__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  int v6 = [v4 isLocal];
  if (v6 == [v5 isLocal])
  {
    uint64_t v8 = [v4 type];
    if (v8 != [v5 type])
    {
      if ([v4 type] == 1)
      {
        uint64_t v7 = 1;
        goto LABEL_11;
      }
      if ([v5 type] == 1)
      {
        uint64_t v7 = -1;
        goto LABEL_11;
      }
    }
    id v9 = +[HMDAccountHandleFormatter defaultFormatter];
    uint64_t v10 = [v9 stringForObjectValue:v4];
    uint64_t v11 = [v9 stringForObjectValue:v5];
    uint64_t v7 = [v10 caseInsensitiveCompare:v11];

    goto LABEL_11;
  }
  if ([v4 isLocal]) {
    uint64_t v7 = -1;
  }
  else {
    uint64_t v7 = 1;
  }
LABEL_11:

  return v7;
}

- (NSArray)handles
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(NSSet *)self->_handles allObjects];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)setAppleAccountSenderCorrelationIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  id v18 = v4;
  if (self)
  {
    os_unfair_lock_assert_owner(&self->_lock);
    id v5 = [(HMDAccount *)self identifier];
    int v6 = [v5 senderCorrelationIdentifier];

    if (v6)
    {
      BOOL v12 = (void *)MEMORY[0x230FBD990]();
      long long v13 = self;
      long long v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        uint64_t v20 = *(_DWORD *)buf = 138543362;
        long long v15 = (void *)v20;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: MergeID cannot be updated on an account with identifier based on MergeID", buf, 0xCu);
      }
      long long v16 = [[HMDAssertionLogEvent alloc] initWithReason:@"MergeID cannot be updated on an account with identifier based on MergeID"];
      long long v17 = +[HMDMetricsManager sharedLogEventSubmitter];
      [v17 submitLogEvent:v16];
    }
    uint64_t v7 = [(HMDAccount *)self identifier];
    uint64_t v8 = [v7 senderCorrelationIdentifier];

    if (!v8 && v18 && (HMFEqualObjects() & 1) == 0)
    {
      id v9 = (NSString *)[v18 copy];
      appleAccountSenderCorrelationIdentifier = self->_appleAccountSenderCorrelationIdentifier;
      self->_appleAccountSenderCorrelationIdentifier = v9;

      uint64_t v11 = [MEMORY[0x263F08A00] defaultCenter];
      [v11 postNotificationName:@"HMDAppleAccountMergeIdentifierUpdatedNotification" object:self];
    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (id)appleAccountSenderCorrelationIdentifier
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_appleAccountSenderCorrelationIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setSenderCorrelationIdentifier:(id)a3
{
  if (a3) {
    -[HMDAccount setAppleAccountSenderCorrelationIdentifier:](self, "setAppleAccountSenderCorrelationIdentifier:");
  }
}

- (NSString)senderCorrelationIdentifier
{
  uint64_t v3 = [(HMDAccount *)self identifier];
  id v4 = [v3 senderCorrelationIdentifier];

  if (!v4)
  {
    id v4 = [(HMDAccount *)self appleAccountSenderCorrelationIdentifier];
  }
  return (NSString *)v4;
}

- (CNContact)contact
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(HMDAccount *)self handles];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = [*(id *)(*((void *)&v10 + 1) + 8 * i) contact];
        if (v7)
        {
          uint64_t v8 = (void *)v7;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  uint64_t v8 = 0;
LABEL_11:

  return (CNContact *)v8;
}

- (NSString)name
{
  uint64_t v3 = [(HMDAccount *)self contact];
  if (!v3
    || ([MEMORY[0x263EFEA20] stringFromContact:v3 style:0],
        (uint64_t v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v5 = +[HMDAccountHandleFormatter defaultFormatter];
    int v6 = [(HMDAccount *)self handles];
    uint64_t v7 = [v6 firstObject];
    uint64_t v4 = [v5 stringForObjectValue:v7];
  }
  return (NSString *)v4;
}

- (BOOL)shouldCache
{
  v2 = self;
  uint64_t v3 = [(HMDAccount *)self manager];
  LOBYTE(v2) = [v3 shouldCacheAccount:v2];

  return (char)v2;
}

- (BOOL)isAuthenticated
{
  v2 = [(HMDAccount *)self identifier];
  char v3 = [v2 isAuthenticated];

  return v3;
}

- (id)attributeDescriptions
{
  v18[4] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  uint64_t v4 = [(HMDAccount *)self identifier];
  uint64_t v5 = [v4 shortDescription];
  int v6 = (void *)[v3 initWithName:@"Id" value:v5];
  v18[0] = v6;
  id v7 = objc_alloc(MEMORY[0x263F424F8]);
  uint64_t v8 = [(HMDAccount *)self senderCorrelationIdentifier];
  id v9 = (void *)[v7 initWithName:@"MID" value:v8];
  v18[1] = v9;
  id v10 = objc_alloc(MEMORY[0x263F424F8]);
  long long v11 = [(HMDAccount *)self handles];
  long long v12 = (void *)[v10 initWithName:@"Hndl" value:v11];
  v18[2] = v12;
  id v13 = objc_alloc(MEMORY[0x263F424F8]);
  long long v14 = [(HMDAccount *)self devices];
  uint64_t v15 = (void *)[v13 initWithName:@"Dev" value:v14];
  v18[3] = v15;
  long long v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:4];

  return v16;
}

- (id)shortDescription
{
  id v3 = NSString;
  uint64_t v4 = [(id)objc_opt_class() shortDescription];
  uint64_t v5 = [(HMDAccount *)self identifier];
  int v6 = [v5 shortDescription];
  id v7 = [v3 stringWithFormat:@"%@ %@", v4, v6];

  return v7;
}

- (void)isOfKnownPersonWithCompletion:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void (**)(id, uint64_t))a3;
  if ([(HMDAccount *)self isPresentInContacts])
  {
    v4[2](v4, 1);
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x230FBD990]();
    int v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      int v9 = 138543362;
      id v10 = v8;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Account is not present in contacts, checking family circle.", (uint8_t *)&v9, 0xCu);
    }
    [(HMDAccount *)v6 isPresentInFamilyCircleWithCompletion:v4];
  }
}

- (BOOL)isPresentInContacts
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = [(HMDAccount *)self handles];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v9 = [v8 contact];
        if (v9)
        {
          uint64_t v11 = (void *)v9;
          long long v12 = (void *)MEMORY[0x230FBD990]();
          id v13 = self;
          long long v14 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            uint64_t v15 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            __int16 v22 = v15;
            __int16 v23 = 2112;
            id v24 = v11;
            __int16 v25 = 2112;
            id v26 = v8;
            _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Found contact: %@ for handle: %@", buf, 0x20u);
          }

          BOOL v10 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v27 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_13:

  return v10;
}

- (BOOL)isRelatedToAccount:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if ([(HMDAccount *)self isEqualToAccount:v4])
    {
      BOOL v5 = 1;
    }
    else
    {
      uint64_t v6 = [v4 senderCorrelationIdentifier];
      if (v6
        && ([(HMDAccount *)self senderCorrelationIdentifier],
            id v7 = objc_claimAutoreleasedReturnValue(),
            char v8 = [v7 isEqualToString:v6],
            v7,
            (v8 & 1) != 0))
      {
        BOOL v5 = 1;
      }
      else
      {
        uint64_t v9 = (void *)MEMORY[0x263EFF9C0];
        BOOL v10 = [v4 handles];
        uint64_t v11 = [v9 setWithArray:v10];

        long long v12 = (void *)MEMORY[0x263EFFA08];
        id v13 = [(HMDAccount *)self handles];
        long long v14 = [v12 setWithArray:v13];
        [v11 intersectSet:v14];

        BOOL v5 = [v11 count] != 0;
      }
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isEqualToAccount:(id)a3
{
  id v4 = (HMDAccount *)a3;
  BOOL v5 = v4;
  if (v4)
  {
    if (v4 == self)
    {
      char v8 = 1;
    }
    else
    {
      uint64_t v6 = [(HMDAccount *)v4 identifier];
      id v7 = [(HMDAccount *)self identifier];
      char v8 = [v6 isEqual:v7];
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMDAccount *)a3;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = v4;
    }
    else {
      BOOL v5 = 0;
    }
    uint64_t v6 = v5;
    if (v6) {
      BOOL v7 = [(HMDAccount *)self isEqualToAccount:v6];
    }
    else {
      BOOL v7 = 0;
    }
  }
  return v7;
}

- (unint64_t)hash
{
  v2 = [(HMDAccount *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (HMDAccount)initWithObjectModel:(id)a3
{
  id v4 = [a3 identifier];
  BOOL v5 = [(HMDAccount *)self initWithIdentifier:v4 handles:MEMORY[0x263EFFA68] devices:MEMORY[0x263EFFA68]];

  return v5;
}

- (BOOL)updateBackingModel:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 modelID];
  BOOL v7 = [(HMDAccount *)self modelIdentifier];
  char v8 = [v6 isEqual:v7];

  if (v8)
  {
    uint64_t v9 = [(HMDAccount *)self identifier];
    BOOL v10 = [v5 identifier];
    char v11 = HMFEqualObjects();

    if ((v11 & 1) == 0) {
      [v5 setIdentifier:v9];
    }

    long long v12 = [(HMDAccount *)self handles];
    [v5 synchronizeHandlesRelationWith:v12];

    id v13 = [(HMDAccount *)self devices];
    [v5 synchronizeDevicesRelationWith:v13];

    return 1;
  }
  else
  {
    uint64_t v15 = (HMDAccount *)_HMFPreconditionFailure();
    return [(HMDAccount *)v15 backingModelType];
  }
}

- (Protocol)backingModelType
{
  return (Protocol *)&unk_26E4870D8;
}

- (HMDAccount)initWithBackingModel:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFF980];
  id v5 = a3;
  uint64_t v6 = [v4 array];
  BOOL v7 = [MEMORY[0x263EFF980] array];
  char v8 = [v5 handles];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __35__HMDAccount_initWithBackingModel___block_invoke;
  v20[3] = &unk_264A1D8A0;
  id v21 = v6;
  id v9 = v6;
  objc_msgSend(v8, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v20);

  BOOL v10 = [v5 devices];
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  long long v17 = __35__HMDAccount_initWithBackingModel___block_invoke_2;
  long long v18 = &unk_264A1D8C8;
  id v19 = v7;
  id v11 = v7;
  objc_msgSend(v10, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v15);

  long long v12 = objc_msgSend(v5, "identifier", v15, v16, v17, v18);

  id v13 = [(HMDAccount *)self initWithIdentifier:v12 handles:v9 devices:v11];
  return v13;
}

void __35__HMDAccount_initWithBackingModel___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [[HMDAccountHandle alloc] initWithBackingModel:v3];

  id v4 = v5;
  if (v5)
  {
    [*(id *)(a1 + 32) addObject:v5];
    id v4 = v5;
  }
}

void __35__HMDAccount_initWithBackingModel___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [[HMDDevice alloc] initWithBackingModel:v3];

  [v2 addObject:v4];
}

- (HMDAccount)initWithIdentifier:(id)a3 handles:(id)a4 devices:(id)a5
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    v48.receiver = self;
    v48.super_class = (Class)HMDAccount;
    id v11 = [(HMDAccount *)&v48 init];
    if (v11)
    {
      uint64_t v12 = [v8 copy];
      identifier = v11->_identifier;
      v11->_identifier = (HMDAccountIdentifier *)v12;

      v11->_lock._os_unfair_lock_opaque = 0;
      HMDispatchQueueNameString();
      id v14 = objc_claimAutoreleasedReturnValue();
      uint64_t v15 = (const char *)[v14 UTF8String];
      uint64_t v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v17 = dispatch_queue_create(v15, v16);
      queue = v11->_queue;
      v11->_queue = (OS_dispatch_queue *)v17;

      if (v9) {
        [MEMORY[0x263EFFA08] setWithArray:v9];
      }
      else {
      id v24 = [MEMORY[0x263EFFA08] set];
      }
      objc_storeStrong((id *)&v11->_handles, v24);

      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      __int16 v25 = v11->_handles;
      uint64_t v26 = [(NSSet *)v25 countByEnumeratingWithState:&v44 objects:v50 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v45;
        do
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v45 != v28) {
              objc_enumerationMutation(v25);
            }
            long long v30 = *(void **)(*((void *)&v44 + 1) + 8 * i);
            char v31 = [v30 modelParentIdentifier];

            if (!v31)
            {
              id v32 = [(HMDAccount *)v11 modelIdentifier];
              [v30 setModelParentIdentifier:v32];
            }
          }
          uint64_t v27 = [(NSSet *)v25 countByEnumeratingWithState:&v44 objects:v50 count:16];
        }
        while (v27);
      }

      if (v10) {
        [MEMORY[0x263EFF9C0] setWithArray:v10];
      }
      else {
      id v33 = [MEMORY[0x263EFF9C0] set];
      }
      objc_storeStrong((id *)&v11->_devices, v33);

      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v34 = v11->_devices;
      uint64_t v35 = [(NSMutableSet *)v34 countByEnumeratingWithState:&v40 objects:v49 count:16];
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v37 = *(void *)v41;
        do
        {
          for (uint64_t j = 0; j != v36; ++j)
          {
            if (*(void *)v41 != v37) {
              objc_enumerationMutation(v34);
            }
            objc_msgSend(*(id *)(*((void *)&v40 + 1) + 8 * j), "setAccount:", v11, (void)v40);
          }
          uint64_t v36 = [(NSMutableSet *)v34 countByEnumeratingWithState:&v40 objects:v49 count:16];
        }
        while (v36);
      }
    }
    long long v20 = v11;
    __int16 v23 = v20;
  }
  else
  {
    id v19 = (void *)MEMORY[0x230FBD990]();
    long long v20 = self;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      __int16 v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v52 = v22;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Missing account identifier", buf, 0xCu);
    }
    __int16 v23 = 0;
  }

  return v23;
}

- (HMDAccount)init
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t23_88255 != -1) {
    dispatch_once(&logCategory__hmf_once_t23_88255, &__block_literal_global_373);
  }
  v2 = (void *)logCategory__hmf_once_v24_88256;
  return v2;
}

void __25__HMDAccount_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v24_88256;
  logCategory__hmf_once_v24_88256 = v0;
}

+ (HMDAccount)accountWithHandle:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  uint64_t v6 = +[HMDAccountIdentifier accountIdentifierForAccountHandle:v4];
  v10[0] = v4;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];

  id v8 = (void *)[v5 initWithIdentifier:v6 handles:v7 devices:MEMORY[0x263EFFA68]];
  return (HMDAccount *)v8;
}

- (BOOL)hasFamilyMember:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [(HMDAccount *)self handles];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v10 = +[HMDAccountHandleFormatter defaultFormatter];
        id v11 = [v10 stringForObjectValue:v9];

        if (v11)
        {
          uint64_t v12 = [v4 appleID];
          if ([v11 isEqualToString:v12])
          {

LABEL_13:
            LOBYTE(v6) = 1;
            goto LABEL_14;
          }
          id v13 = [v4 memberPhoneNumbers];
          char v14 = [v11 isEqualToString:v13];

          if (v14) {
            goto LABEL_13;
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return v6;
}

- (void)isPresentInFamilyCircleWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F3BF48]);
  [v5 setCachePolicy:2];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__HMDAccount_FamilyCircle__isPresentInFamilyCircleWithCompletion___block_invoke;
  v7[3] = &unk_264A1D940;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 startRequestWithCompletionHandler:v7];
}

void __66__HMDAccount_FamilyCircle__isPresentInFamilyCircleWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 8);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __66__HMDAccount_FamilyCircle__isPresentInFamilyCircleWithCompletion___block_invoke_2;
  v11[3] = &unk_264A2EE30;
  id v12 = v5;
  uint64_t v13 = v7;
  id v14 = v6;
  id v15 = *(id *)(a1 + 40);
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v8, v11);
}

uint64_t __66__HMDAccount_FamilyCircle__isPresentInFamilyCircleWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = [v2 members];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __66__HMDAccount_FamilyCircle__isPresentInFamilyCircleWithCompletion___block_invoke_541;
    v16[3] = &unk_264A1D918;
    v16[4] = *(void *)(a1 + 40);
    objc_msgSend(v3, "na_any:", v16);

    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 40);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = HMFGetLogIdentifier();
      id v8 = HMFBooleanToString();
      *(_DWORD *)buf = 138543618;
      long long v18 = v7;
      __int16 v19 = 2112;
      long long v20 = v8;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Account is in family circle: %@", buf, 0x16u);
    }
    id v9 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  }
  else
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = *(id *)(a1 + 40);
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      id v14 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      long long v18 = v13;
      __int16 v19 = 2112;
      long long v20 = v14;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch family members with error: %@", buf, 0x16u);
    }
    id v9 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  }
  return v9();
}

uint64_t __66__HMDAccount_FamilyCircle__isPresentInFamilyCircleWithCompletion___block_invoke_541(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) hasFamilyMember:a2];
}

- (NSArray)identities
{
  uint64_t v3 = +[HMDIdentityRegistry sharedRegistry];
  id v4 = [v3 identitiesForAccount:self];

  return (NSArray *)v4;
}

@end