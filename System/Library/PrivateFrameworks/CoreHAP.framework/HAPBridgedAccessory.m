@interface HAPBridgedAccessory
- (BOOL)__isReachable;
- (BOOL)__parseBridgeService:(id)a3;
- (BOOL)__parseServices;
- (BOOL)isPrimary;
- (BOOL)mergeObject:(id)a3;
- (BOOL)mergeWithAccessory:(id)a3;
- (BOOL)shouldMergeObject:(id)a3;
- (HAPBridgedAccessory)initWithServer:(id)a3 instanceID:(id)a4 parsedServices:(id)a5;
- (HAPCharacteristic)reachabilityCharacteristic;
- (id)accessoryServerDidRequestCharacteristicsToRegisterForNotifications:(id)a3;
- (id)shortDescription;
- (void)accessoryServer:(id)a3 didUpdateValueForCharacteristic:(id)a4;
- (void)setReachabilityCharacteristic:(id)a3;
- (void)setReachable:(BOOL)a3;
@end

@implementation HAPBridgedAccessory

- (void).cxx_destruct
{
}

- (HAPBridgedAccessory)initWithServer:(id)a3 instanceID:(id)a4 parsedServices:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HAPBridgedAccessory;
  v11 = [(HAPAccessory *)&v19 initWithServer:v8 instanceID:v9 parsedServices:v10];
  v12 = v11;
  if (!v11) {
    goto LABEL_4;
  }
  if ([(HAPBridgedAccessory *)v11 __parseServices])
  {
    [v8 addInternalDelegate:v12];
LABEL_4:
    v13 = v12;
    goto LABEL_8;
  }
  v14 = (void *)MEMORY[0x1D944E080]();
  v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v16 = HMFGetLogIdentifier();
    v17 = [(HAPBridgedAccessory *)v12 shortDescription];
    *(_DWORD *)buf = 138543618;
    v21 = v16;
    __int16 v22 = 2112;
    v23 = v17;
    _os_log_impl(&dword_1D4758000, v15, OS_LOG_TYPE_ERROR, "%{public}@[%@] Failed to parse services", buf, 0x16u);
  }
  v13 = 0;
LABEL_8:

  return v13;
}

- (BOOL)__parseServices
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v3 = [(HAPAccessory *)self services];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v10 = [v9 type];
        int v11 = [v10 isEqualToString:@"00000062-0000-1000-8000-0026BB765291"];

        if (v11)
        {
          if (v6)
          {
            v16 = (void *)MEMORY[0x1D944E080]();
            v17 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              v18 = HMFGetLogIdentifier();
              objc_super v19 = [(HAPBridgedAccessory *)self shortDescription];
              *(_DWORD *)buf = 138543618;
              v27 = v18;
              __int16 v28 = 2112;
              v29 = v19;
              _os_log_impl(&dword_1D4758000, v17, OS_LOG_TYPE_ERROR, "%{public}@[%@] Accessory has more than one Bridge Service", buf, 0x16u);
            }

            goto LABEL_19;
          }
          id v6 = v9;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v22 objects:v30 count:16];
      if (v5) {
        continue;
      }
      break;
    }

    if (v6 && ![(HAPBridgedAccessory *)self __parseBridgeService:v6])
    {
      v12 = (void *)MEMORY[0x1D944E080]();
      v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = HMFGetLogIdentifier();
        v15 = [(HAPBridgedAccessory *)self shortDescription];
        *(_DWORD *)buf = 138543618;
        v27 = v14;
        __int16 v28 = 2112;
        v29 = v15;
        _os_log_impl(&dword_1D4758000, v13, OS_LOG_TYPE_ERROR, "%{public}@[%@] Failed to parse bridge service", buf, 0x16u);
      }
LABEL_19:
      BOOL v20 = 0;
      goto LABEL_22;
    }
  }
  else
  {

    id v6 = 0;
  }
  BOOL v20 = 1;
LABEL_22:

  return v20;
}

- (BOOL)isPrimary
{
  return 0;
}

- (void)setReachabilityCharacteristic:(id)a3
{
}

- (HAPCharacteristic)reachabilityCharacteristic
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_reachabilityCharacteristic);

  return (HAPCharacteristic *)WeakRetained;
}

- (void)accessoryServer:(id)a3 didUpdateValueForCharacteristic:(id)a4
{
  id v5 = a4;
  id v6 = [v5 service];
  uint64_t v7 = [v6 accessory];
  int v8 = [v7 isEqual:self];

  if (v8)
  {
    id v9 = [v5 value];
    id v10 = [(HAPAccessory *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__HAPBridgedAccessory_accessoryServer_didUpdateValueForCharacteristic___block_invoke;
    block[3] = &unk_1E69F4708;
    id v13 = v5;
    id v14 = v9;
    v15 = self;
    id v11 = v9;
    dispatch_async(v10, block);
  }
}

void __71__HAPBridgedAccessory_accessoryServer_didUpdateValueForCharacteristic___block_invoke(id *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [a1[4] service];
  v3 = [v2 type];
  int v4 = [v3 isEqualToString:@"00000062-0000-1000-8000-0026BB765291"];

  if (v4)
  {
    id v5 = [a1[4] type];
    int v6 = [v5 isEqualToString:@"00000063-0000-1000-8000-0026BB765291"];

    if (v6)
    {
      uint64_t v7 = [a1[5] isEqualToNumber:MEMORY[0x1E4F1CC38]];
      int v8 = (void *)MEMORY[0x1D944E080]();
      id v9 = HMFGetOSLogHandle();
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
      if (v7)
      {
        if (v10)
        {
          id v11 = HMFGetLogIdentifier();
          v12 = [a1[6] shortDescription];
          int v14 = 138543618;
          v15 = v11;
          __int16 v16 = 2112;
          v17 = v12;
          id v13 = "%{public}@[%@] Received reachability update of YES, marking accessory as reachable";
LABEL_8:
          _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v14, 0x16u);
        }
      }
      else if (v10)
      {
        id v11 = HMFGetLogIdentifier();
        v12 = [a1[6] shortDescription];
        int v14 = 138543618;
        v15 = v11;
        __int16 v16 = 2112;
        v17 = v12;
        id v13 = "%{public}@[%@] Received reachability update of NO, marking accessory as unreachable";
        goto LABEL_8;
      }

      [a1[6] setReachable:v7];
    }
  }
}

- (id)accessoryServerDidRequestCharacteristicsToRegisterForNotifications:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HAPAccessory *)self server];

  if (v5 == v4)
  {
    uint64_t v7 = [(HAPBridgedAccessory *)self reachabilityCharacteristic];
    int v8 = (void *)v7;
    if (v7)
    {
      v10[0] = v7;
      int v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    }
    else
    {
      int v6 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (BOOL)mergeObject:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    v13.receiver = self;
    v13.super_class = (Class)HAPBridgedAccessory;
    BOOL v7 = [(HAPAccessory *)&v13 mergeObject:v4];
    if (![(HAPBridgedAccessory *)self __parseServices])
    {
      int v8 = (void *)MEMORY[0x1D944E080]();
      id v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        BOOL v10 = HMFGetLogIdentifier();
        id v11 = [(HAPBridgedAccessory *)self shortDescription];
        *(_DWORD *)buf = 138543618;
        v15 = v10;
        __int16 v16 = 2112;
        v17 = v11;
        _os_log_impl(&dword_1D4758000, v9, OS_LOG_TYPE_ERROR, "%{public}@[%@] Failed to parse services during merge", buf, 0x16u);
      }
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)shouldMergeObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    v9.receiver = self;
    v9.super_class = (Class)HAPBridgedAccessory;
    BOOL v7 = [(HAPAccessory *)&v9 shouldMergeObject:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)mergeWithAccessory:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ![(HAPBridgedAccessory *)self __parseServices])
  {
    id v5 = (void *)MEMORY[0x1D944E080]();
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      BOOL v7 = HMFGetLogIdentifier();
      int v8 = [(HAPBridgedAccessory *)self shortDescription];
      int v10 = 138543618;
      id v11 = v7;
      __int16 v12 = 2112;
      objc_super v13 = v8;
      _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_ERROR, "%{public}@[%@] Failed to parse services during merge", (uint8_t *)&v10, 0x16u);
    }
  }

  return 0;
}

- (BOOL)__parseBridgeService:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = objc_msgSend(a3, "characteristics", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    char v7 = 0;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v4);
        }
        int v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v11 = [v10 type];
        int v12 = [v11 isEqualToString:@"00000063-0000-1000-8000-0026BB765291"];

        if (v12)
        {
          [(HAPBridgedAccessory *)self setReachabilityCharacteristic:v10];
          objc_super v13 = [v10 value];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            uint64_t v14 = v13;
          }
          else {
            uint64_t v14 = 0;
          }
          id v15 = v14;

          if (v15) {
            -[HAPBridgedAccessory setReachable:](self, "setReachable:", [v15 BOOLValue]);
          }

          char v7 = 1;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
  else
  {
    char v7 = 0;
  }

  return v7 & 1;
}

- (BOOL)__isReachable
{
  v3 = [(HAPBridgedAccessory *)self reachabilityCharacteristic];

  if (!v3) {
    return 1;
  }
  id v4 = [(HAPBridgedAccessory *)self reachabilityCharacteristic];
  uint64_t v5 = [v4 value];
  char v6 = [v5 BOOLValue];

  return v6;
}

- (void)setReachable:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3 && ![(HAPBridgedAccessory *)self __isReachable])
  {
    uint64_t v5 = (void *)MEMORY[0x1D944E080]();
    char v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      char v7 = HMFGetLogIdentifier();
      uint64_t v8 = [(HAPBridgedAccessory *)self shortDescription];
      *(_DWORD *)buf = 138543618;
      id v11 = v7;
      __int16 v12 = 2112;
      objc_super v13 = v8;
      _os_log_impl(&dword_1D4758000, v6, OS_LOG_TYPE_INFO, "%{public}@[%@] Not setting reachability as underlying bridged accessory is not reachable", buf, 0x16u);
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)HAPBridgedAccessory;
    [(HAPAccessory *)&v9 setReachable:v3];
  }
}

- (id)shortDescription
{
  BOOL v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(HAPAccessory *)self instanceID];
  char v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end