@interface HMDServiceGroup
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
- (HMDApplicationData)appData;
- (HMDHome)home;
- (HMDServiceGroup)initWithCoder:(id)a3;
- (HMDServiceGroup)initWithName:(id)a3 uuid:(id)a4 home:(id)a5 queue:(id)a6;
- (HMFMessageDispatcher)msgDispatcher;
- (NSArray)serviceUUIDs;
- (NSDictionary)assistantObject;
- (NSMutableDictionary)serviceMapping;
- (NSString)name;
- (NSString)urlString;
- (NSUUID)spiClientIdentifier;
- (NSUUID)uuid;
- (OS_dispatch_queue)workQueue;
- (id)backingStoreObjects:(int64_t)a3;
- (id)dumpState;
- (id)modelObjectWithChangeType:(unint64_t)a3;
- (id)updateServiceGroupWithModel:(id)a3 message:(id)a4;
- (void)_handleAddServiceRequest:(id)a3;
- (void)_handleRemoveAppDataModel:(id)a3 message:(id)a4;
- (void)_handleRemoveServiceRequest:(id)a3;
- (void)_handleRenameRequest:(id)a3;
- (void)_handleUpdateAppDataModel:(id)a3 message:(id)a4;
- (void)_handleUpdateServicesTransaction:(id)a3;
- (void)_registerForMessages;
- (void)_transactionServiceGroupUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
- (void)configure:(id)a3 queue:(id)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)fixupServiceGroup;
- (void)fixupServicesForReplacementAccessory:(id)a3;
- (void)removeService:(id)a3;
- (void)removeServicesForAccessory:(id)a3;
- (void)setAppData:(id)a3;
- (void)setHome:(id)a3;
- (void)setMsgDispatcher:(id)a3;
- (void)setName:(id)a3;
- (void)setServiceIfPresent:(id)a3;
- (void)setServiceMapping:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)transactionObjectRemoved:(id)a3 message:(id)a4;
- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
@end

@implementation HMDServiceGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appData, 0);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_serviceMapping, 0);
  objc_storeStrong((id *)&self->_spiClientIdentifier, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_serviceUUIDs, 0);
}

- (void)setAppData:(id)a3
{
}

- (HMDApplicationData)appData
{
  return self->_appData;
}

- (void)setMsgDispatcher:(id)a3
{
}

- (HMFMessageDispatcher)msgDispatcher
{
  return self->_msgDispatcher;
}

- (void)setHome:(id)a3
{
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setServiceMapping:(id)a3
{
}

- (NSMutableDictionary)serviceMapping
{
  return self->_serviceMapping;
}

- (NSUUID)spiClientIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)fixupServiceGroup
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v3 = [(NSMutableDictionary *)self->_serviceMapping allKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v21;
    id obj = v3;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v8 = -[NSMutableDictionary objectForKey:](self->_serviceMapping, "objectForKey:", v7, lock);
        v9 = [v8 uuid];
        v10 = [v9 UUIDString];
        char v11 = [v10 isEqual:v7];

        if ((v11 & 1) == 0)
        {
          serviceMapping = self->_serviceMapping;
          v13 = [v8 uuid];
          v14 = [v13 UUIDString];
          [(NSMutableDictionary *)serviceMapping setObject:v8 forKey:v14];

          [(NSMutableDictionary *)self->_serviceMapping removeObjectForKey:v7];
        }
      }
      v3 = obj;
      uint64_t v4 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v4);
  }

  v15 = [(NSMutableDictionary *)self->_serviceMapping allKeys];
  v16 = (NSMutableArray *)[v15 mutableCopy];
  serviceUUIDs = self->_serviceUUIDs;
  self->_serviceUUIDs = v16;

  os_unfair_lock_unlock(lock);
}

- (id)backingStoreObjects:(int64_t)a3
{
  uint64_t v5 = [MEMORY[0x263EFF980] array];
  v6 = [(HMDServiceGroup *)self modelObjectWithChangeType:1];
  [v5 addObject:v6];

  uint64_t v7 = [(HMDServiceGroup *)self appData];

  if (a3 >= 3 && v7)
  {
    v8 = [(HMDServiceGroup *)self appData];
    v9 = [v8 modelObjectWithChangeType:1];
    [v5 addObject:v9];
  }
  return v5;
}

- (id)modelObjectWithChangeType:(unint64_t)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v5 = [HMDServiceGroupModel alloc];
  v6 = [(HMDServiceGroup *)self uuid];
  uint64_t v7 = [(HMDServiceGroup *)self home];
  v8 = [v7 uuid];
  long long v23 = [(HMDBackingStoreModelObject *)v5 initWithObjectChangeType:a3 uuid:v6 parentUUID:v8];

  v9 = (void *)MEMORY[0x263EFF980];
  v10 = [(HMDServiceGroup *)self serviceUUIDs];
  char v11 = objc_msgSend(v9, "arrayWithCapacity:", objc_msgSend(v10, "count"));

  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v12 = [(NSMutableDictionary *)self->_serviceMapping allValues];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v12);
        }
        v16 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "modelObjectWithChangeType:", a3, lock);
        v17 = [v16 uuid];
        v18 = [v17 UUIDString];
        [v11 addObject:v18];
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v13);
  }

  os_unfair_lock_unlock(lock);
  v19 = [(HMDServiceGroup *)self name];
  [(HMDServiceGroupModel *)v23 setName:v19];

  long long v20 = (void *)[v11 copy];
  [(HMDServiceGroupModel *)v23 setServices:v20];

  return v23;
}

- (void)_handleRemoveAppDataModel:(id)a3 message:(id)a4
{
  id v5 = a4;
  [(HMDServiceGroup *)self setAppData:0];
  id v6 = [v5 transactionResult];
  [v6 markChanged];
  [v5 respondWithPayload:0];
}

- (void)_handleUpdateAppDataModel:(id)a3 message:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDServiceGroup *)self appData];

  if (v8)
  {
    v9 = [(HMDServiceGroup *)self appData];
    [v9 updateWithModel:v6];
  }
  else
  {
    v10 = [HMDApplicationData alloc];
    char v11 = [v6 appDataDictionary];
    v12 = [(HMDServiceGroup *)self uuid];
    uint64_t v13 = [(HMDApplicationData *)v10 initWithDictionary:v11 parentUUID:v12];
    [(HMDServiceGroup *)self setAppData:v13];

    uint64_t v14 = (void *)MEMORY[0x230FBD990]();
    v15 = self;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v17 = HMFGetLogIdentifier();
      v18 = [v6 appDataDictionary];
      int v20 = 138543618;
      long long v21 = v17;
      __int16 v22 = 2112;
      long long v23 = v18;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Updating the application data : %@", (uint8_t *)&v20, 0x16u);
    }
  }
  v19 = [v7 transactionResult];
  [v19 markChanged];
  [v7 respondWithPayload:0];
}

- (void)_handleUpdateServicesTransaction:(id)a3
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v50 = self;
  v46 = [(HMDServiceGroup *)self home];
  v49 = [MEMORY[0x263EFF9A0] dictionary];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id obj = v4;
  id v47 = (id)[obj countByEnumeratingWithState:&v63 objects:v76 count:16];
  if (v47)
  {
    uint64_t v45 = *(void *)v64;
    uint64_t v43 = *MEMORY[0x263F356A0];
    do
    {
      for (uint64_t i = 0; i != v47; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v64 != v45) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v63 + 1) + 8 * i);
        id v7 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v6];
        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        v8 = [v46 accessories];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v59 objects:v75 count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v60;
          while (2)
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v60 != v10) {
                objc_enumerationMutation(v8);
              }
              id v12 = *(id *)(*((void *)&v59 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                uint64_t v13 = v12;
              }
              else {
                uint64_t v13 = 0;
              }
              id v14 = v13;

              v15 = [v14 serviceWithUUID:v7];

              if (v15)
              {

                v16 = [v15 type];
                char v17 = [v16 isEqualToString:v43];

                if ((v17 & 1) == 0) {
                  [v49 setObject:v15 forKeyedSubscript:v6];
                }
                goto LABEL_20;
              }
            }
            uint64_t v9 = [v8 countByEnumeratingWithState:&v59 objects:v75 count:16];
            if (v9) {
              continue;
            }
            break;
          }
        }

        v15 = 0;
LABEL_20:
      }
      id v47 = (id)[obj countByEnumeratingWithState:&v63 objects:v76 count:16];
    }
    while (v47);
  }

  v18 = (void *)[obj mutableCopy];
  os_unfair_lock_lock_with_options();
  v19 = [(NSMutableDictionary *)v50->_serviceMapping allKeys];
  [v18 removeObjectsInArray:v19];

  int v20 = [(NSMutableDictionary *)v50->_serviceMapping allKeys];
  v44 = (void *)[v20 mutableCopy];

  [v44 removeObjectsInArray:obj];
  uint64_t v21 = [obj mutableCopy];
  serviceUUIDs = v50->_serviceUUIDs;
  v50->_serviceUUIDs = (NSMutableArray *)v21;

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v48 = v18;
  uint64_t v23 = [v48 countByEnumeratingWithState:&v55 objects:v74 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v56;
    do
    {
      for (uint64_t k = 0; k != v23; ++k)
      {
        if (*(void *)v56 != v24) {
          objc_enumerationMutation(v48);
        }
        uint64_t v26 = *(void *)(*((void *)&v55 + 1) + 8 * k);
        long long v27 = [v49 objectForKeyedSubscript:v26];
        if (v27)
        {
          v28 = (void *)MEMORY[0x230FBD990]([(NSMutableDictionary *)v50->_serviceMapping setObject:v27 forKey:v26]);
          HMFGetOSLogHandle();
          uint64_t v29 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            v30 = HMFGetLogIdentifier();
            name = v50->_name;
            *(_DWORD *)buf = 138543874;
            v69 = v30;
            __int16 v70 = 2112;
            uint64_t v71 = v26;
            __int16 v72 = 2112;
            v73 = name;
            _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_INFO, "%{public}@Add service uuid: %@ to group: %@", buf, 0x20u);
          }
        }
      }
      uint64_t v23 = [v48 countByEnumeratingWithState:&v55 objects:v74 count:16];
    }
    while (v23);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v32 = v44;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v51 objects:v67 count:16];
  if (v33)
  {
    uint64_t v34 = *(void *)v52;
    do
    {
      for (uint64_t m = 0; m != v33; ++m)
      {
        if (*(void *)v52 != v34) {
          objc_enumerationMutation(v32);
        }
        uint64_t v36 = *(void *)(*((void *)&v51 + 1) + 8 * m);
        v37 = [(NSMutableDictionary *)v50->_serviceMapping objectForKey:v36];
        if (v37)
        {
          v38 = (void *)MEMORY[0x230FBD990]([(NSMutableDictionary *)v50->_serviceMapping removeObjectForKey:v36]);
          HMFGetOSLogHandle();
          v39 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            v40 = HMFGetLogIdentifier();
            v41 = v50->_name;
            *(_DWORD *)buf = 138543874;
            v69 = v40;
            __int16 v70 = 2112;
            uint64_t v71 = v36;
            __int16 v72 = 2112;
            v73 = v41;
            _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_INFO, "%{public}@Remove service uuid: %@ from group: %@", buf, 0x20u);
          }
        }
      }
      uint64_t v33 = [v32 countByEnumeratingWithState:&v51 objects:v67 count:16];
    }
    while (v33);
  }

  os_unfair_lock_unlock(&v50->_lock);
}

- (void)_transactionServiceGroupUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v7 = a5;
  id v8 = [(HMDServiceGroup *)self updateServiceGroupWithModel:a4 message:v7];
  [v7 respondWithPayload:0 error:v8];
}

- (id)updateServiceGroupWithModel:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDServiceGroup *)self home];
  if (v8)
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = [MEMORY[0x263F087E8] hmErrorWithCode:21];
  }
  uint64_t v10 = [v6 name];
  if (v10)
  {
    char v11 = [(HMDServiceGroup *)self name];
    char v12 = HMFEqualObjects();

    if ((v12 & 1) == 0)
    {
      uint64_t v13 = objc_msgSend(v10, "hm_truncatedNameString");

      id v14 = [(HMDServiceGroup *)self name];
      id v15 = (id)[v8 replaceName:v14 withNewName:v13];

      [(HMDServiceGroup *)self setName:v13];
      uint64_t v10 = (void *)v13;
    }
  }
  if (!v9)
  {
    v16 = [v6 services];

    if (v16)
    {
      char v17 = [v6 services];
      [(HMDServiceGroup *)self _handleUpdateServicesTransaction:v17];
    }
    v18 = [v7 transactionResult];
    [v18 markChanged];
    [v18 markSaveToAssistant];
  }
  return v9;
}

- (void)transactionObjectRemoved:(id)a3 message:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    [(HMDServiceGroup *)self _handleRemoveAppDataModel:v10 message:v7];
  }
  else
  {
    char v11 = (void *)MEMORY[0x230FBD990]();
    char v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      int v17 = 138543874;
      v18 = v14;
      __int16 v19 = 2112;
      id v20 = v8;
      __int16 v21 = 2112;
      id v22 = (id)objc_opt_class();
      id v15 = v22;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectRemoved]", (uint8_t *)&v17, 0x20u);
    }
    v16 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    [v7 respondWithError:v16];
  }
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v11 = v9;
  }
  else {
    char v11 = 0;
  }
  id v12 = v11;
  if (v12)
  {
    [(HMDServiceGroup *)self _transactionServiceGroupUpdated:0 newValues:v12 message:v10];
    id v13 = v9;
  }
  else
  {
    id v13 = v9;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }
    id v15 = v14;

    if (v15)
    {
      [(HMDServiceGroup *)self _handleUpdateAppDataModel:v15 message:v10];
    }
    else
    {
      v16 = (void *)MEMORY[0x230FBD990]();
      int v17 = self;
      v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        __int16 v19 = HMFGetLogIdentifier();
        int v21 = 138543874;
        id v22 = v19;
        __int16 v23 = 2112;
        id v24 = v13;
        __int16 v25 = 2112;
        id v26 = (id)objc_opt_class();
        id v20 = v26;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectUpdated]", (uint8_t *)&v21, 0x20u);
      }
      id v13 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
      [v10 respondWithError:v13];
    }
  }
}

- (void)_handleRemoveServiceRequest:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 uuidForKey:@"kAccessoryUUID"];
  uint64_t v6 = [v4 numberForKey:@"kServiceInstanceID"];
  id v7 = (void *)v6;
  if (v5 && v6)
  {
    v30 = +[HMDService generateUUIDWithAccessoryUUID:v5 serviceID:v6];
    id v8 = [(HMDServiceGroup *)self home];
    id v9 = [HMDServiceGroupModel alloc];
    id v10 = [(HMDServiceGroup *)self uuid];
    char v11 = [v8 uuid];
    uint64_t v29 = [(HMDBackingStoreModelObject *)v9 initWithObjectChangeType:2 uuid:v10 parentUUID:v11];

    os_unfair_lock_lock_with_options();
    serviceUUIDs = self->_serviceUUIDs;
    id v13 = [v30 UUIDString];
    LOBYTE(serviceUUIDs) = [(NSMutableArray *)serviceUUIDs containsObject:v13];

    if (serviceUUIDs)
    {
      id v14 = self->_serviceUUIDs;
      id v15 = [v30 UUIDString];
      [(NSMutableArray *)v14 removeObject:v15];

      v16 = (void *)[(NSMutableArray *)self->_serviceUUIDs copy];
      [(HMDServiceGroupModel *)v29 setServices:v16];

      os_unfair_lock_unlock(&self->_lock);
    }
    else
    {
      v18 = (void *)MEMORY[0x230FBD990]();
      HMFGetOSLogHandle();
      __int16 v19 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v28 = v18;
        id v20 = v8;
        HMFGetLogIdentifier();
        id v21 = (id)objc_claimAutoreleasedReturnValue();
        name = self->_name;
        __int16 v23 = [v20 name];
        *(_DWORD *)buf = 138544386;
        id v35 = v21;
        __int16 v36 = 2112;
        v37 = v7;
        __int16 v38 = 2112;
        v39 = v5;
        __int16 v40 = 2112;
        v41 = name;
        __int16 v42 = 2112;
        uint64_t v43 = v23;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Service %@:%@ does not exist in group %@ in home %@", buf, 0x34u);

        id v8 = v20;
        v18 = v28;
      }
      id v24 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
      os_unfair_lock_unlock(&self->_lock);
      if (v24)
      {
        [v4 respondWithError:v24];
LABEL_11:

        goto LABEL_12;
      }
    }
    __int16 v25 = objc_msgSend(v8, "backingStore", v28);
    id v26 = [v4 name];
    uint64_t v27 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
    id v24 = [v25 transaction:v26 options:v27];

    [v24 add:v29];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __47__HMDServiceGroup__handleRemoveServiceRequest___block_invoke;
    v31[3] = &unk_264A2E210;
    v31[4] = self;
    id v32 = v30;
    id v33 = v4;
    [v24 run:v31];

    goto LABEL_11;
  }
  int v17 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
  [v4 respondWithError:v17];

LABEL_12:
}

void __47__HMDServiceGroup__handleRemoveServiceRequest___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    v3 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
    os_unfair_lock_lock_with_options();
    id v4 = *(void **)(*(void *)(a1 + 32) + 16);
    id v5 = [*(id *)(a1 + 40) UUIDString];
    [v4 addObject:v5];

    os_unfair_lock_unlock(v3);
    [*(id *)(a1 + 48) respondWithError:v6];
  }
  else
  {
    [*(id *)(a1 + 48) respondWithSuccess];
  }
}

- (void)_handleAddServiceRequest:(id)a3
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 uuidForKey:@"kAccessoryUUID"];
  uint64_t v6 = [v4 numberForKey:@"kServiceInstanceID"];
  id v7 = (void *)v6;
  if (v5 && v6)
  {
    long long v53 = +[HMDService generateUUIDWithAccessoryUUID:v5 serviceID:v6];
    id v8 = [(HMDServiceGroup *)self home];
    id v9 = [v8 accessoryWithUUID:v5];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;

    long long v51 = v11;
    id v12 = [v11 serviceWithUUID:v53];
    long long v52 = v12;
    if (!v12)
    {
      id v21 = (void *)MEMORY[0x230FBD990]();
      id v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        __int16 v23 = HMFGetLogIdentifier();
        id v24 = [v8 name];
        *(_DWORD *)buf = 138543874;
        id v58 = v23;
        __int16 v59 = 2112;
        long long v60 = v53;
        __int16 v61 = 2112;
        long long v62 = v24;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Service with UUID %@ does not exist in home %@", buf, 0x20u);
      }
      __int16 v19 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
      [v4 respondWithError:v19];
      goto LABEL_28;
    }
    id v13 = [v12 type];
    int v14 = [v13 isEqualToString:*MEMORY[0x263F356A0]];

    if (v14)
    {
      id v15 = (void *)MEMORY[0x230FBD990]();
      v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        int v17 = HMFGetLogIdentifier();
        v18 = [v8 name];
        *(_DWORD *)buf = 138543874;
        id v58 = v17;
        __int16 v59 = 2112;
        long long v60 = v53;
        __int16 v61 = 2112;
        long long v62 = v18;
        _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Rejecting attempt to associate acc info service with UUID %@ in home %@", buf, 0x20u);
      }
      __int16 v19 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
      [v4 respondWithError:v19];
      goto LABEL_28;
    }
    __int16 v25 = [HMDServiceGroupModel alloc];
    id v26 = [(HMDServiceGroup *)self uuid];
    uint64_t v27 = [v8 uuid];
    __int16 v19 = [(HMDBackingStoreModelObject *)v25 initWithObjectChangeType:2 uuid:v26 parentUUID:v27];

    os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    unint64_t v28 = [(NSMutableArray *)self->_serviceUUIDs count];
    if (v28 >= maximumServicesPerServiceGroup)
    {
      v37 = (void *)MEMORY[0x230FBD990]();
      HMFGetOSLogHandle();
      __int16 v38 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        v49 = v37;
        HMFGetLogIdentifier();
        id v39 = (id)objc_claimAutoreleasedReturnValue();
        name = self->_name;
        v41 = [v8 name];
        *(_DWORD *)buf = 138544386;
        id v58 = v39;
        __int16 v59 = 2112;
        long long v60 = v7;
        __int16 v61 = 2112;
        long long v62 = v5;
        __int16 v63 = 2112;
        long long v64 = name;
        __int16 v65 = 2112;
        long long v66 = v41;
        _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_INFO, "%{public}@Can't add service %@:%@ to service group %@ in home %@; already at maximum services for group",
          buf,
          0x34u);

        v37 = v49;
      }

      uint64_t v36 = 49;
    }
    else
    {
      serviceUUIDs = self->_serviceUUIDs;
      v30 = [v53 UUIDString];
      LODWORD(serviceUUIDs) = [(NSMutableArray *)serviceUUIDs containsObject:v30];

      if (!serviceUUIDs)
      {
        uint64_t v43 = self->_serviceUUIDs;
        uint64_t v44 = [v53 UUIDString];
        [(NSMutableArray *)v43 addObject:v44];

        uint64_t v45 = (void *)[(NSMutableArray *)self->_serviceUUIDs copy];
        [(HMDServiceGroupModel *)v19 setServices:v45];

        os_unfair_lock_unlock(lock);
        goto LABEL_26;
      }
      v31 = (void *)MEMORY[0x230FBD990]();
      HMFGetOSLogHandle();
      id v32 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v49 = v31;
        HMFGetLogIdentifier();
        id v33 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v34 = self->_name;
        id v35 = [v8 name];
        *(_DWORD *)buf = 138544386;
        id v58 = v33;
        __int16 v59 = 2112;
        long long v60 = v7;
        __int16 v61 = 2112;
        long long v62 = v5;
        __int16 v63 = 2112;
        long long v64 = v34;
        __int16 v65 = 2112;
        long long v66 = v35;
        _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@Service %@:%@ already exists in service group %@ in home %@", buf, 0x34u);

        v31 = v49;
      }

      uint64_t v36 = 1;
    }
    __int16 v42 = objc_msgSend(MEMORY[0x263F087E8], "hmErrorWithCode:", v36, v49);
    os_unfair_lock_unlock(lock);
    if (v42)
    {
      [v4 respondWithError:v42];
LABEL_27:

LABEL_28:
      goto LABEL_29;
    }
LABEL_26:
    v46 = [v8 backingStore];
    id v47 = [v4 name];
    id v48 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
    __int16 v42 = [v46 transaction:v47 options:v48];

    [v42 add:v19];
    v54[0] = MEMORY[0x263EF8330];
    v54[1] = 3221225472;
    v54[2] = __44__HMDServiceGroup__handleAddServiceRequest___block_invoke;
    v54[3] = &unk_264A2E210;
    v54[4] = self;
    id v55 = v53;
    id v56 = v4;
    [v42 run:v54];

    goto LABEL_27;
  }
  id v20 = [MEMORY[0x263F087E8] hmErrorWithCode:20];
  [v4 respondWithError:v20];

LABEL_29:
}

void __44__HMDServiceGroup__handleAddServiceRequest___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    v3 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 8);
    os_unfair_lock_lock_with_options();
    id v4 = *(void **)(*(void *)(a1 + 32) + 16);
    id v5 = [*(id *)(a1 + 40) UUIDString];
    [v4 removeObject:v5];

    os_unfair_lock_unlock(v3);
    [*(id *)(a1 + 48) respondWithError:v6];
  }
  else
  {
    [*(id *)(a1 + 48) respondWithSuccess];
  }
}

- (void)_registerForMessages
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v3 = [(HMDServiceGroup *)self home];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 administratorHandler];
    uint64_t v6 = *MEMORY[0x263F0E980];
    id v7 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:2];
    v26[0] = v7;
    id v8 = +[HMDXPCMessagePolicy policyWithEntitlements:1];
    v26[1] = v8;
    id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
    [v5 registerForMessage:v6 receiver:self policies:v9 selector:sel__handleAddServiceRequest_];

    id v10 = [v4 administratorHandler];
    uint64_t v11 = *MEMORY[0x263F0EAD0];
    id v12 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:2];
    v25[0] = v12;
    id v13 = +[HMDXPCMessagePolicy policyWithEntitlements:1];
    v25[1] = v13;
    int v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
    [v10 registerForMessage:v11 receiver:self policies:v14 selector:sel__handleRemoveServiceRequest_];

    id v15 = [v4 administratorHandler];
    uint64_t v16 = *MEMORY[0x263F0EAD8];
    int v17 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:2];
    v18 = +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 1, v17);
    v24[1] = v18;
    __int16 v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
    [v15 registerForMessage:v16 receiver:self policies:v19 selector:sel__handleRenameRequest_];
  }
  else
  {
    id v20 = (void *)MEMORY[0x230FBD990]();
    id v21 = self;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      __int16 v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      unint64_t v28 = v23;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Not registering for messages as home is nil", buf, 0xCu);
    }
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v17 = a3;
  id v4 = [(HMDServiceGroup *)self home];
  [v17 encodeConditionalObject:v4 forKey:@"home"];
  id v5 = [(HMDServiceGroup *)self name];
  [v17 encodeObject:v5 forKey:*MEMORY[0x263F0EB28]];

  uint64_t v6 = [(HMDServiceGroup *)self uuid];
  id v7 = [v6 UUIDString];
  [v17 encodeObject:v7 forKey:*MEMORY[0x263F0EB48]];

  int v8 = objc_msgSend(v17, "hmd_isForXPCTransport");
  int v9 = objc_msgSend(v17, "hmd_isForXPCTransportEntitledForSPIAccess");
  int v10 = objc_msgSend(v17, "hmd_isForLocalStore");
  os_unfair_lock_lock_with_options();
  [(NSMutableDictionary *)self->_serviceMapping allValues];
  if (v10) {
    uint64_t v11 = {;
  }
    objc_msgSend(v17, "hm_encodeArrayOfConditionalObjects:forKey:", v11, *MEMORY[0x263F0EB40]);

    [v17 encodeObject:self->_serviceUUIDs forKey:*MEMORY[0x263F0EB38]];
  }
  else {
    id v12 = {;
  }
    objc_msgSend(v17, "hm_encodeArrayOfConditionalObjects:forKey:", v12, *MEMORY[0x263F0EB40]);
  }
  os_unfair_lock_unlock(&self->_lock);
  if (v8)
  {
    if (v9)
    {
      id v13 = @"com.apple.homekit-entitledclient.identifer";
      int v14 = @"com.apple.homekit-entitledclient.identifer";
    }
    else
    {
      objc_msgSend(v17, "hmd_clientIdentifier");
      id v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    id v15 = [(HMDServiceGroup *)self appData];
    uint64_t v16 = [v15 applicationDataForIdentifier:v13];

    if (v16) {
      [v17 encodeObject:v16 forKey:@"HM.appData"];
    }
  }
  else
  {
    id v13 = [(HMDServiceGroup *)self appData];
    [v17 encodeObject:v13 forKey:@"HM.appDataRepository"];
  }
}

- (HMDServiceGroup)initWithCoder:(id)a3
{
  v47[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"home"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F0EB28]];
  id v7 = objc_msgSend(v6, "hm_truncatedNameString");

  int v8 = objc_msgSend(v4, "hm_decodeAndCacheUUIDFromStringForKey:", *MEMORY[0x263F0EB48]);
  int v9 = [(HMDServiceGroup *)self initWithName:v7 uuid:v8 home:v5 queue:0];
  if (v9)
  {
    int v10 = objc_msgSend(v4, "hm_decodeArrayOfConditionalObjects:forKey:", objc_opt_class(), *MEMORY[0x263F0EB40]);
    uint64_t v11 = (void *)MEMORY[0x263EFFA08];
    v47[0] = objc_opt_class();
    v47[1] = objc_opt_class();
    id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:2];
    id v13 = [v11 setWithArray:v12];
    v41 = [v4 decodeObjectOfClasses:v13 forKey:*MEMORY[0x263F0EB38]];

    int v14 = v10;
    id v15 = &OBJC_IVAR___HMDHome__accessCodeManager;
    if ([v10 count])
    {
      v37 = v8;
      __int16 v38 = v7;
      id v39 = v5;
      id v40 = v4;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      uint64_t v36 = v10;
      id v16 = v10;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v42 objects:v46 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v43;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v43 != v19) {
              objc_enumerationMutation(v16);
            }
            id v21 = *(void **)(*((void *)&v42 + 1) + 8 * i);
            id v22 = objc_msgSend(v21, "uuid", v36, v37, v38, v39, v40);

            if (v22)
            {
              serviceMapping = v9->_serviceMapping;
              id v24 = [v21 uuid];
              __int16 v25 = [v24 UUIDString];
              [(NSMutableDictionary *)serviceMapping setObject:v21 forKey:v25];
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v42 objects:v46 count:16];
        }
        while (v18);
      }

      id v26 = [(NSMutableDictionary *)v9->_serviceMapping allKeys];
      uint64_t v27 = [v26 mutableCopy];
      id v15 = &OBJC_IVAR___HMDHome__accessCodeManager;
      serviceUUIDs = v9->_serviceUUIDs;
      v9->_serviceUUIDs = (NSMutableArray *)v27;

      id v5 = v39;
      id v4 = v40;
      int v8 = v37;
      id v7 = v38;
      int v14 = v36;
    }
    if (objc_msgSend(v41, "count", v36, v37, v38, v39, v40))
    {
      [(HMDServiceGroup *)v9 _handleUpdateServicesTransaction:v41];
    }
    else
    {
      uint64_t v29 = [(NSMutableDictionary *)v9->_serviceMapping allKeys];
      uint64_t v30 = [v29 mutableCopy];
      uint64_t v31 = v15[643];
      id v32 = *(Class *)((char *)&v9->super.super.isa + v31);
      *(Class *)((char *)&v9->super.super.isa + v31) = (Class)v30;
    }
    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.appDataRepository"];
    appData = v9->_appData;
    v9->_appData = (HMDApplicationData *)v33;

    [(HMDApplicationData *)v9->_appData updateParentUUIDIfNil:v9->_uuid];
  }

  return v9;
}

- (void)removeService:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    p_os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    serviceUUIDs = self->_serviceUUIDs;
    id v7 = [v4 uuid];
    int v8 = [v7 UUIDString];
    [(NSMutableArray *)serviceUUIDs removeObject:v8];

    serviceMapping = self->_serviceMapping;
    int v10 = [v4 uuid];
    uint64_t v11 = [v10 UUIDString];
    [(NSMutableDictionary *)serviceMapping removeObjectForKey:v11];

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    id v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = self;
    int v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = HMFGetLogIdentifier();
      int v16 = 138543362;
      uint64_t v17 = v15;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Cannot remove nil service from service group", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)removeServicesForAccessory:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = objc_msgSend(a3, "services", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [(HMDServiceGroup *)self removeService:*(void *)(*((void *)&v10 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  int v9 = [(HMDServiceGroup *)self home];
  [v9 saveWithReason:@"kServiceRemovedFromGroupNotificationKey" postSyncNotification:1];
}

- (void)setServiceIfPresent:(id)a3
{
  id v11 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  serviceUUIDs = self->_serviceUUIDs;
  uint64_t v6 = [v11 uuid];
  uint64_t v7 = [v6 UUIDString];
  LODWORD(serviceUUIDs) = [(NSMutableArray *)serviceUUIDs containsObject:v7];

  if (serviceUUIDs)
  {
    serviceMapping = self->_serviceMapping;
    int v9 = [v11 uuid];
    long long v10 = [v9 UUIDString];
    [(NSMutableDictionary *)serviceMapping setObject:v11 forKey:v10];
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)fixupServicesForReplacementAccessory:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = objc_msgSend(a3, "services", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(HMDServiceGroup *)self setServiceIfPresent:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_handleRenameRequest:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 stringForKey:*MEMORY[0x263F0EB30]];
  if (!v5)
  {
    long long v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = 20;
LABEL_7:
    long long v13 = [v11 hmErrorWithCode:v12];
    [v4 respondWithError:v13];
    goto LABEL_12;
  }
  unint64_t v6 = HMMaxLengthForNaming();
  if ([v5 length] > v6)
  {
    uint64_t v7 = (void *)MEMORY[0x230FBD990]();
    uint64_t v8 = self;
    long long v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      long long v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      unint64_t v28 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@New name is longer than the pre-defined max length", buf, 0xCu);
    }
    long long v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = 46;
    goto LABEL_7;
  }
  long long v13 = [(HMDServiceGroup *)self home];
  uint64_t v14 = [(HMDServiceGroup *)self name];
  uint64_t v15 = [v13 replaceName:v14 withNewName:v5];

  if (v15)
  {
    [v4 respondWithError:v15];
  }
  else
  {
    int v16 = [HMDServiceGroupModel alloc];
    uint64_t v17 = [(HMDServiceGroup *)self uuid];
    uint64_t v18 = [v13 uuid];
    uint64_t v19 = [(HMDBackingStoreModelObject *)v16 initWithObjectChangeType:2 uuid:v17 parentUUID:v18];

    [(HMDServiceGroupModel *)v19 setName:v5];
    id v20 = [v13 backingStore];
    id v21 = [v4 name];
    id v22 = +[HMDBackingStoreTransactionOptions defaultXPCOptions];
    __int16 v23 = [v20 transaction:v21 options:v22];

    [v23 add:v19];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    void v24[2] = __40__HMDServiceGroup__handleRenameRequest___block_invoke;
    v24[3] = &unk_264A2F370;
    id v25 = v4;
    id v26 = v5;
    [v23 run:v24];
  }
LABEL_12:
}

void __40__HMDServiceGroup__handleRenameRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    [v3 respondWithError:a2];
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v6 = *MEMORY[0x263F0EB30];
    v7[0] = v4;
    uint64_t v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
    [v2 respondWithPayload:v5];
  }
}

- (void)setName:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = (NSString *)[v6 copy];
  name = self->_name;
  self->_name = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)name
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = self->_name;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSArray)serviceUUIDs
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v4 = (void *)[(NSMutableArray *)self->_serviceUUIDs copy];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (id)dumpState
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v26 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
  v2 = NSString;
  v3 = [(HMDServiceGroup *)self name];
  uint64_t v4 = [(HMDServiceGroup *)self uuid];
  uint64_t v5 = [v4 UUIDString];
  id v6 = [(HMDServiceGroup *)self urlString];
  id v25 = [v2 stringWithFormat:@"name: %@, uuid: %@, assistantIdentifier: %@", v3, v5, v6];

  [v26 setObject:v25 forKeyedSubscript:*MEMORY[0x263F41FA8]];
  os_unfair_lock_lock_with_options();
  uint64_t v7 = (void *)[(NSMutableDictionary *)self->_serviceMapping copy];
  os_unfair_lock_unlock(&self->_lock);
  if ([v7 count])
  {
    id v24 = v7;
    uint64_t v29 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = [v7 allValues];
    uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v31;
      long long v10 = (void *)*MEMORY[0x263F357F0];
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v31 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          long long v13 = [v12 accessory];
          uint64_t v14 = [v12 serviceType];
          if ([v14 hasSuffix:v10])
          {
            uint64_t v15 = objc_msgSend(v14, "substringToIndex:", objc_msgSend(v14, "length") - objc_msgSend(v10, "length"));

            uint64_t v14 = (void *)v15;
          }
          int v16 = NSString;
          uint64_t v17 = [v13 uuid];
          uint64_t v18 = [v17 UUIDString];
          uint64_t v19 = [v12 instanceID];
          id v20 = [v16 stringWithFormat:@"Accessory: %@, serviceID: %@, type: %@", v18, v19, v14];
          [v29 addObject:v20];
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v8);
    }

    [v26 setObject:v29 forKeyedSubscript:*MEMORY[0x263F41F88]];
    id v21 = [(HMDServiceGroup *)self appData];
    id v22 = [v21 dumpState];
    [v26 setObject:v22 forKeyedSubscript:*MEMORY[0x263F41E98]];

    uint64_t v7 = v24;
  }

  return v26;
}

- (void)configure:(id)a3 queue:(id)a4
{
  id v6 = a4;
  [(HMDServiceGroup *)self setMsgDispatcher:a3];
  [(HMDServiceGroup *)self setWorkQueue:v6];

  [(HMDServiceGroup *)self _registerForMessages];
}

- (void)dealloc
{
  v3 = [(HMDServiceGroup *)self msgDispatcher];
  [v3 deregisterReceiver:self];

  uint64_t v4 = [(HMDServiceGroup *)self home];
  uint64_t v5 = [v4 administratorHandler];
  [v5 deregisterReceiver:self];

  v6.receiver = self;
  v6.super_class = (Class)HMDServiceGroup;
  [(HMDServiceGroup *)&v6 dealloc];
}

- (HMDServiceGroup)initWithName:(id)a3 uuid:(id)a4 home:(id)a5 queue:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v31.receiver = self;
  v31.super_class = (Class)HMDServiceGroup;
  uint64_t v14 = [(HMDServiceGroup *)&v31 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    name = v14->_name;
    v14->_name = (NSString *)v15;

    if (v11)
    {
      uint64_t v17 = [v11 copy];
    }
    else
    {
      uint64_t v17 = [MEMORY[0x263F08C38] UUID];
    }
    uint64_t v18 = (void *)v17;
    uint64_t v19 = objc_msgSend(MEMORY[0x263F425D0], "hmf_cachedInstanceForNSUUID:", v17);
    uuid = v14->_uuid;
    v14->_uuid = (NSUUID *)v19;

    id v21 = spiClientIdentifierForUUID(v14->_uuid);
    uint64_t v22 = objc_msgSend(MEMORY[0x263F425D0], "hmf_cachedInstanceForNSUUID:", v21);
    spiClientIdentifier = v14->_spiClientIdentifier;
    v14->_spiClientIdentifier = (NSUUID *)v22;

    objc_storeStrong((id *)&v14->_workQueue, a6);
    objc_storeWeak((id *)&v14->_home, v12);
    uint64_t v24 = [v12 msgDispatcher];
    msgDispatcher = v14->_msgDispatcher;
    v14->_msgDispatcher = (HMFMessageDispatcher *)v24;

    uint64_t v26 = [MEMORY[0x263EFF980] array];
    serviceUUIDs = v14->_serviceUUIDs;
    v14->_serviceUUIDs = (NSMutableArray *)v26;

    uint64_t v28 = [MEMORY[0x263EFF9A0] dictionary];
    serviceMapping = v14->_serviceMapping;
    v14->_serviceMapping = (NSMutableDictionary *)v28;

    if (v13) {
      [(HMDServiceGroup *)v14 _registerForMessages];
    }
  }
  return v14;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t33 != -1) {
    dispatch_once(&logCategory__hmf_once_t33, &__block_literal_global_30060);
  }
  v2 = (void *)logCategory__hmf_once_v34;
  return v2;
}

void __30__HMDServiceGroup_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v34;
  logCategory__hmf_once_uint64_t v34 = v0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)assistantObject
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v3 = [(HMDServiceGroup *)self home];
  uint64_t v4 = [(HMDServiceGroup *)self name];
  uint64_t v5 = v4;
  if (v4 && v3)
  {
    objc_super v6 = [v3 name];

    if (v6)
    {
      v20[0] = *MEMORY[0x263F655C8];
      uint64_t v7 = [(HMDServiceGroup *)self name];
      v20[1] = v7;
      v19[2] = @"objectIdentifier";
      uint64_t v8 = [(HMDServiceGroup *)self urlString];
      v20[2] = v8;
      v19[3] = @"objectHome";
      uint64_t v9 = [v3 name];
      v20[3] = v9;
      v19[4] = @"objectHomeIdentifier";
      id v10 = [v3 urlString];
      v20[4] = v10;
      v20[5] = self;
      v19[5] = @"objectReference";
      v19[6] = @"objectGroupType";
      v20[6] = *MEMORY[0x263F65608];
      id v11 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:7];

      goto LABEL_9;
    }
  }
  else
  {
  }
  id v12 = (void *)MEMORY[0x230FBD990]();
  id v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    uint64_t v15 = [(HMDServiceGroup *)self name];
    int v16 = [(HMDServiceGroup *)self uuid];
    uint64_t v17 = [v16 UUIDString];
    *(_DWORD *)buf = 138544130;
    uint64_t v22 = v14;
    __int16 v23 = 2112;
    uint64_t v24 = v15;
    __int16 v25 = 2112;
    uint64_t v26 = v17;
    __int16 v27 = 2112;
    uint64_t v28 = v3;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Skipping because attribute(s) is nil self %@/%@  self.home %@", buf, 0x2Au);
  }
  id v11 = 0;
LABEL_9:

  return (NSDictionary *)v11;
}

- (NSString)urlString
{
  v2 = [(HMDServiceGroup *)self uuid];
  v3 = hm_assistantIdentifier();

  return (NSString *)v3;
}

@end