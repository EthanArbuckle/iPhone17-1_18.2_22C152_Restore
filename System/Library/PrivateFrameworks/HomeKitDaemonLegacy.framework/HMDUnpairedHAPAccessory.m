@interface HMDUnpairedHAPAccessory
- (BOOL)hasBTLELink;
- (BOOL)hasIPLink;
- (BOOL)isKnownToSystemCommissioner;
- (BOOL)isReachable;
- (BOOL)requiresThreadRouter;
- (BOOL)supportsCHIP;
- (HMDUnpairedHAPAccessory)initWithAccessoryServer:(id)a3 messageDispatcher:(id)a4;
- (HMDUnpairedHAPAccessory)initWithIdentifier:(id)a3 name:(id)a4 category:(id)a5 messageDispatcher:(id)a6;
- (NSArray)accessoryServers;
- (NSData)setupHash;
- (id)commissioningID;
- (id)descriptionWithPointer:(BOOL)a3 additionalDescription:(id)a4;
- (id)dumpDescription;
- (id)nodeID;
- (id)preferredAccessoryServer;
- (id)productID;
- (id)rootPublicKey;
- (id)serialNumber;
- (id)vendorID;
- (int64_t)associationOptions;
- (int64_t)certificationStatus;
- (int64_t)linkType;
- (unint64_t)transportTypes;
- (void)addAccessoryServer:(id)a3;
- (void)identifyWithCompletionHandler:(id)a3;
- (void)removeAccessoryServer:(id)a3;
- (void)setCertificationStatus:(int64_t)a3;
@end

@implementation HMDUnpairedHAPAccessory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupHash, 0);
  objc_storeStrong((id *)&self->_accessoryServers, 0);
}

- (int64_t)linkType
{
  return self->_linkType;
}

- (NSData)setupHash
{
  return self->_setupHash;
}

- (void)setCertificationStatus:(int64_t)a3
{
  self->_certificationStatus = a3;
}

- (int64_t)certificationStatus
{
  return self->_certificationStatus;
}

- (int64_t)associationOptions
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(HMDUnpairedHAPAccessory *)self accessoryServers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    int64_t v6 = 1;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(id *)(*((void *)&v11 + 1) + 8 * i);
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0 && v8)
        {
          int64_t v6 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    int64_t v6 = 1;
  }
LABEL_13:

  return v6;
}

- (BOOL)requiresThreadRouter
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(HMDUnpairedHAPAccessory *)self accessoryServers];
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
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) requiresThreadRouter])
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

- (id)serialNumber
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(HMDUnpairedHAPAccessory *)self accessoryServers];
  uint64_t v3 = (void *)[v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(v2);
        }
        int64_t v6 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        long long v7 = [v6 primaryAccessory];
        long long v8 = [v7 serialNumber];

        if (v8)
        {
          long long v9 = [v6 primaryAccessory];
          uint64_t v3 = [v9 serialNumber];

          goto LABEL_11;
        }
      }
      uint64_t v3 = (void *)[v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)productID
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(HMDUnpairedHAPAccessory *)self accessoryServers];
  uint64_t v3 = (void *)[v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        int64_t v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        long long v7 = [v6 productID];

        if (v7)
        {
          uint64_t v3 = [v6 productID];
          goto LABEL_11;
        }
      }
      uint64_t v3 = (void *)[v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)vendorID
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(HMDUnpairedHAPAccessory *)self accessoryServers];
  uint64_t v3 = (void *)[v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        int64_t v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        long long v7 = [v6 vendorID];

        if (v7)
        {
          uint64_t v3 = [v6 vendorID];
          goto LABEL_11;
        }
      }
      uint64_t v3 = (void *)[v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)commissioningID
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(HMDUnpairedHAPAccessory *)self accessoryServers];
  uint64_t v3 = (void *)[v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        int64_t v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        long long v7 = [v6 commissioningID];

        if (v7)
        {
          uint64_t v3 = [v6 commissioningID];
          goto LABEL_11;
        }
      }
      uint64_t v3 = (void *)[v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)nodeID
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(HMDUnpairedHAPAccessory *)self accessoryServers];
  uint64_t v3 = (void *)[v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        int64_t v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        long long v7 = [v6 nodeID];

        if (v7)
        {
          uint64_t v3 = [v6 nodeID];
          goto LABEL_11;
        }
      }
      uint64_t v3 = (void *)[v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)rootPublicKey
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(HMDUnpairedHAPAccessory *)self accessoryServers];
  uint64_t v3 = (void *)[v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        int64_t v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        long long v7 = [v6 rootPublicKey];

        if (v7)
        {
          uint64_t v3 = [v6 rootPublicKey];
          goto LABEL_11;
        }
      }
      uint64_t v3 = (void *)[v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)isKnownToSystemCommissioner
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(HMDUnpairedHAPAccessory *)self accessoryServers];
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
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) isKnownToSystemCommissioner])
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

- (BOOL)supportsCHIP
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(HMDUnpairedHAPAccessory *)self accessoryServers];
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
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) communicationProtocol] == 2)
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

- (BOOL)hasIPLink
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = [(HMDUnpairedHAPAccessory *)self accessoryServers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(id *)(*((void *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          long long v8 = v7;
        }
        else {
          long long v8 = 0;
        }
        id v9 = v8;

        if (v9)
        {
          if (![v9 isWacAccessory] || (objc_msgSend(v9, "isWacComplete") & 1) != 0) {
            goto LABEL_19;
          }
        }
        else if ([v7 linkType] == 1)
        {
          id v7 = 0;
LABEL_19:

          BOOL v10 = 1;
          goto LABEL_20;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      BOOL v10 = 0;
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v10 = 0;
  }
LABEL_20:

  return v10;
}

- (BOOL)hasBTLELink
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(HMDUnpairedHAPAccessory *)self accessoryServers];
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
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) linkType] == 2)
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

- (unint64_t)transportTypes
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v2 = [(HMDUnpairedHAPAccessory *)self accessoryServers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v26;
    unint64_t v8 = 0x1E4F5B000uLL;
    *(void *)&long long v4 = 138543618;
    long long v24 = v4;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(v2);
        }
        long long v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "linkType", v24);
        if (v11 == 2)
        {
          v6 |= 2uLL;
        }
        else if (v11 == 1)
        {
          id v12 = v10;
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            long long v13 = v12;
          }
          else {
            long long v13 = 0;
          }
          id v14 = v13;

          int v15 = [v14 isWacAccessory];
          if (v15) {
            uint64_t v16 = 9;
          }
          else {
            uint64_t v16 = 1;
          }
          v6 |= v16;
        }
        else
        {
          uint64_t v17 = (void *)MEMORY[0x1D9452090]();
          id v18 = v10;
          v19 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v21 = unint64_t v20 = v8;
            uint64_t v22 = [v18 linkType];
            *(_DWORD *)buf = v24;
            v30 = v21;
            __int16 v31 = 2048;
            uint64_t v32 = v22;
            _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unhandled linkType: %tu", buf, 0x16u);

            unint64_t v8 = v20;
          }
        }
      }
      uint64_t v5 = [v2 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (id)preferredAccessoryServer
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(HMDUnpairedHAPAccessory *)self accessoryServers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v11;
LABEL_3:
    uint64_t v7 = 0;
    unint64_t v8 = v5;
    while (1)
    {
      if (*(void *)v11 != v6) {
        objc_enumerationMutation(v2);
      }
      id v5 = *(id *)(*((void *)&v10 + 1) + 8 * v7);

      if ([v5 linkType] == 1) {
        break;
      }
      ++v7;
      unint64_t v8 = v5;
      if (v4 == v7)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v4) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)removeAccessoryServer:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v5 = [v4 linkType];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = (void *)[(NSMutableArray *)self->_accessoryServers copy];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (v5 == [v10 linkType])
        {
          [(NSMutableArray *)self->_accessoryServers removeObject:v10];
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  os_unfair_recursive_lock_unlock();
}

- (void)addAccessoryServer:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v5 = [v4 linkType];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = (void *)[(NSMutableArray *)self->_accessoryServers copy];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        long long v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (v5 == [v10 linkType]) {
          [(NSMutableArray *)self->_accessoryServers removeObject:v10];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  [(NSMutableArray *)self->_accessoryServers addObject:v4];
  long long v11 = [v4 category];
  [(HMDUnassociatedAccessory *)self updateCategoryWithCategoryIdentifier:v11];

  os_unfair_recursive_lock_unlock();
}

- (NSArray)accessoryServers
{
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v3 = (void *)[(NSMutableArray *)self->_accessoryServers copy];
  os_unfair_recursive_lock_unlock();
  return (NSArray *)v3;
}

- (void)identifyWithCompletionHandler:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(HMDUnpairedHAPAccessory *)self preferredAccessoryServer];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1D9452090]();
    uint64_t v7 = self;
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      long long v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v15 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Identify by /identify URL or unpaired BTLE characteristic write", buf, 0xCu);
    }
    objc_initWeak((id *)buf, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __57__HMDUnpairedHAPAccessory_identifyWithCompletionHandler___block_invoke;
    v11[3] = &unk_1E6A16F80;
    objc_copyWeak(&v13, (id *)buf);
    id v12 = v4;
    [v5 identifyWithCompletion:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
  else if (v4)
  {
    long long v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F2D140] code:4 userInfo:0];
    (*((void (**)(id, void *))v4 + 2))(v4, v10);
  }
}

void __57__HMDUnpairedHAPAccessory_identifyWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = WeakRetained;
  uint64_t v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v10 = 138543618;
    long long v11 = v8;
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Identify by /identify URL completed with error: %@", (uint8_t *)&v10, 0x16u);
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v3);
  }
}

- (BOOL)isReachable
{
  v2 = [(HMDUnpairedHAPAccessory *)self accessoryServers];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)dumpDescription
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v29.receiver = self;
  v29.super_class = (Class)HMDUnpairedHAPAccessory;
  BOOL v3 = [(HMDUnassociatedAccessory *)&v29 dumpDescription];
  id v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = *MEMORY[0x1E4F64EA0];
  id v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F64EA0]];
  uint64_t v7 = (void *)[v6 mutableCopy];

  uint64_t v8 = [(HMDUnpairedHAPAccessory *)self setupHash];
  [(HMDUnpairedHAPAccessory *)self transportTypes];
  uint64_t v9 = HMAccessoryTransportTypesToString();
  [v7 appendFormat:@"  setupHash %@  transportTypes %@  linkType ", v8, v9];

  long long v24 = v4;
  [v4 setObject:v7 forKey:v5];
  int v10 = (void *)MEMORY[0x1E4F1CA48];
  long long v11 = [(HMDUnpairedHAPAccessory *)self accessoryServers];
  __int16 v12 = objc_msgSend(v10, "arrayWithCapacity:", objc_msgSend(v11, "count"));

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v13 = [(HMDUnpairedHAPAccessory *)self accessoryServers];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = NSString;
        unint64_t v19 = [*(id *)(*((void *)&v25 + 1) + 8 * i) linkType];
        unint64_t v20 = @"Undefined";
        if (v19 <= 2) {
          unint64_t v20 = off_1E6A0B860[v19];
        }
        v21 = v20;
        uint64_t v22 = [v18 stringWithFormat:@"%@ ", v21];
        [v12 addObject:v22];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v15);
  }

  if ([v12 count]) {
    [v24 setObject:v12 forKey:*MEMORY[0x1E4F64D70]];
  }

  return v24;
}

- (id)descriptionWithPointer:(BOOL)a3 additionalDescription:(id)a4
{
  BOOL v4 = a3;
  id v6 = NSString;
  [(HMDUnpairedHAPAccessory *)self transportTypes];
  uint64_t v7 = HMAccessoryTransportTypesToString();
  uint64_t v8 = [v6 stringWithFormat:@"transportTypes = %@", v7];
  v11.receiver = self;
  v11.super_class = (Class)HMDUnpairedHAPAccessory;
  uint64_t v9 = [(HMDUnassociatedAccessory *)&v11 descriptionWithPointer:v4 additionalDescription:v8];

  return v9;
}

- (HMDUnpairedHAPAccessory)initWithIdentifier:(id)a3 name:(id)a4 category:(id)a5 messageDispatcher:(id)a6
{
  v10.receiver = self;
  v10.super_class = (Class)HMDUnpairedHAPAccessory;
  id v6 = [(HMDUnassociatedAccessory *)&v10 initWithIdentifier:a3 name:a4 category:a5 messageDispatcher:a6];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    accessoryServers = v6->_accessoryServers;
    v6->_accessoryServers = (NSMutableArray *)v7;

    v6->_certificationStatus = 0;
    v6->_linkType = 0;
  }
  return v6;
}

- (HMDUnpairedHAPAccessory)initWithAccessoryServer:(id)a3 messageDispatcher:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x1E4F2E520];
  id v8 = a4;
  uint64_t v9 = [v6 category];
  objc_super v10 = [v7 categoryWithCategoryIdentifier:v9];

  objc_super v11 = [v6 identifier];
  __int16 v12 = [v6 name];
  id v13 = [(HMDUnpairedHAPAccessory *)self initWithIdentifier:v11 name:v12 category:v10 messageDispatcher:v8];

  if (v13)
  {
    [(NSMutableArray *)v13->_accessoryServers addObject:v6];
    uint64_t v14 = [v6 setupHash];
    uint64_t v15 = [v14 copy];
    setupHash = v13->_setupHash;
    v13->_setupHash = (NSData *)v15;

    v13->_linkType = [v6 linkType];
  }

  return v13;
}

@end