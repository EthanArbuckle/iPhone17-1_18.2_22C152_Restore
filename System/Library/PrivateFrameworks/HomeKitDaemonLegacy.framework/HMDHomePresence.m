@interface HMDHomePresence
+ (id)logCategory;
- (BOOL)areUsersAtHome:(id)a3;
- (BOOL)areUsersNotAtHome:(id)a3;
- (BOOL)hasPresenceRegionForAllUsers;
- (BOOL)isAnyUserAtHome;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNoUserAtHome;
- (BOOL)isPresenceRegionKnownForUser:(id)a3;
- (BOOL)isUserAtHome:(id)a3;
- (BOOL)isUserNotAtHome:(id)a3;
- (HMDDevice)lastUpdateByDevice;
- (HMDHome)home;
- (HMDHomePresence)initWithHome:(id)a3 userPresenceMap:(id)a4 lastUpdateByDevice:(id)a5;
- (NSArray)authorizedUsers;
- (NSDictionary)userPresenceMap;
- (id)attributeDescriptions;
- (id)logIdentifier;
- (id)serializedIdentifierDictionary;
- (id)serializedUUIDDictionary;
- (id)shortDescription;
- (unint64_t)hash;
@end

@implementation HMDHomePresence

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdateByDevice, 0);
  objc_storeStrong((id *)&self->_userPresenceMap, 0);
  objc_destroyWeak((id *)&self->_home);
}

- (HMDDevice)lastUpdateByDevice
{
  return self->_lastUpdateByDevice;
}

- (NSDictionary)userPresenceMap
{
  return self->_userPresenceMap;
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (BOOL)areUsersNotAtHome:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      BOOL v9 = 1;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          BOOL v9 = v9
            && -[HMDHomePresence isUserNotAtHome:](self, "isUserNotAtHome:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
    else
    {
      BOOL v9 = 1;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)areUsersAtHome:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      BOOL v8 = 0;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v5);
          }
          BOOL v8 = v8
            || -[HMDHomePresence isUserAtHome:](self, "isUserAtHome:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isPresenceRegionKnownForUser:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 presenceAuthStatus];
  uint64_t v6 = [v5 value];

  if (v6 == 1)
  {
    uint64_t v7 = [(HMDHomePresence *)self userPresenceMap];
    BOOL v8 = [v4 uuid];
    uint64_t v9 = [v7 objectForKeyedSubscript:v8];

    if (v9)
    {
      v10 = [v9 presenceRegionStatus];
      if (v10)
      {
        v11 = [v9 presenceRegionStatus];
        BOOL v12 = [v11 value] != 0;
      }
      else
      {
        BOOL v12 = 0;
      }
    }
    else
    {
      uint64_t v17 = (void *)MEMORY[0x1D9452090]();
      v18 = self;
      v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = HMFGetLogIdentifier();
        int v22 = 138543618;
        v23 = v20;
        __int16 v24 = 2112;
        id v25 = v4;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Could not find user %@", (uint8_t *)&v22, 0x16u);
      }
      BOOL v12 = 0;
    }
  }
  else
  {
    long long v13 = (void *)MEMORY[0x1D9452090]();
    long long v14 = self;
    long long v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v16 = HMFGetLogIdentifier();
      int v22 = 138543618;
      v23 = v16;
      __int16 v24 = 2112;
      id v25 = v4;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_DEBUG, "%{public}@%@ is not presence-authorized, cannot determine isUserPresenceRegionKnown", (uint8_t *)&v22, 0x16u);
    }
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)isUserNotAtHome:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 presenceAuthStatus];
  uint64_t v6 = [v5 value];

  if (v6 == 1)
  {
    uint64_t v7 = [(HMDHomePresence *)self userPresenceMap];
    BOOL v8 = [v4 uuid];
    uint64_t v9 = [v7 objectForKeyedSubscript:v8];

    if (v9)
    {
      v10 = [v9 presenceRegionStatus];
      BOOL v11 = [v10 value] == 2;
    }
    else
    {
      v16 = (void *)MEMORY[0x1D9452090]();
      uint64_t v17 = self;
      v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = HMFGetLogIdentifier();
        int v21 = 138543618;
        int v22 = v19;
        __int16 v23 = 2112;
        id v24 = v4;
        _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Could not find user %@", (uint8_t *)&v21, 0x16u);
      }
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v12 = (void *)MEMORY[0x1D9452090]();
    long long v13 = self;
    long long v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      long long v15 = HMFGetLogIdentifier();
      int v21 = 138543618;
      int v22 = v15;
      __int16 v23 = 2112;
      id v24 = v4;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_DEBUG, "%{public}@%@ is not presence-authorized, cannot determine isUserNotAtHome", (uint8_t *)&v21, 0x16u);
    }
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)isUserAtHome:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 presenceAuthStatus];
  uint64_t v6 = [v5 value];

  if (v6 == 1)
  {
    uint64_t v7 = [(HMDHomePresence *)self userPresenceMap];
    BOOL v8 = [v4 uuid];
    uint64_t v9 = [v7 objectForKeyedSubscript:v8];

    if (v9)
    {
      v10 = [v9 presenceRegionStatus];
      BOOL v11 = [v10 value] == 1;
    }
    else
    {
      v16 = (void *)MEMORY[0x1D9452090]();
      uint64_t v17 = self;
      v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = HMFGetLogIdentifier();
        int v21 = 138543618;
        int v22 = v19;
        __int16 v23 = 2112;
        id v24 = v4;
        _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Could not find user %@", (uint8_t *)&v21, 0x16u);
      }
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v12 = (void *)MEMORY[0x1D9452090]();
    long long v13 = self;
    long long v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      long long v15 = HMFGetLogIdentifier();
      int v21 = 138543618;
      int v22 = v15;
      __int16 v23 = 2112;
      id v24 = v4;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_DEBUG, "%{public}@%@ is not presence-authorized, cannot determine isUserAtHome", (uint8_t *)&v21, 0x16u);
    }
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)hasPresenceRegionForAllUsers
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDHomePresence *)self authorizedUsers];
  if ([v3 count])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v4);
          }
          if (!-[HMDHomePresence isPresenceRegionKnownForUser:](self, "isPresenceRegionKnownForUser:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15))
          {
            BOOL v9 = 0;
            goto LABEL_12;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    BOOL v9 = 1;
LABEL_12:
  }
  else
  {
    v10 = (void *)MEMORY[0x1D9452090]();
    BOOL v11 = self;
    BOOL v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      long long v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      int v21 = v13;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@doAllUsersHavePresenceRegion - No users in presence map", buf, 0xCu);
    }
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)isAnyUserAtHome
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDHomePresence *)self authorizedUsers];
  if ([v3 count])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      BOOL v7 = 0;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v4);
          }
          BOOL v7 = v7
            || -[HMDHomePresence isUserAtHome:](self, "isUserAtHome:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v6);
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    v10 = (void *)MEMORY[0x1D9452090]();
    BOOL v11 = self;
    BOOL v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      long long v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      int v21 = v13;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@isAnyUserAtHome - No users in presence map", buf, 0xCu);
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isNoUserAtHome
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDHomePresence *)self authorizedUsers];
  if ([v3 count])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v16;
      BOOL v8 = 1;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v4);
          }
          BOOL v8 = v8
            && -[HMDHomePresence isUserNotAtHome:](self, "isUserNotAtHome:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v6);
    }
    else
    {
      BOOL v8 = 1;
    }
  }
  else
  {
    v10 = (void *)MEMORY[0x1D9452090]();
    BOOL v11 = self;
    BOOL v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      long long v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      int v21 = v13;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@isNoUserAtHome - No users in presence map", buf, 0xCu);
    }
    BOOL v8 = 0;
  }

  return v8;
}

- (id)attributeDescriptions
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v4 = [(HMDHomePresence *)self userPresenceMap];
  uint64_t v5 = [v4 allValues];
  uint64_t v6 = [v5 componentsJoinedByString:@", "];
  uint64_t v7 = (void *)[v3 initWithName:@"UP" value:v6];
  v10[0] = v7;
  BOOL v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];

  return v8;
}

- (id)shortDescription
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = [MEMORY[0x1E4F28E78] string];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(HMDHomePresence *)self userPresenceMap];
  uint64_t v6 = [v5 allValues];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        BOOL v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) shortDescription];
        [v4 appendFormat:@"%@, ", v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v4;
}

- (id)logIdentifier
{
  v2 = [(HMDHomePresence *)self home];
  if (isInternalBuild())
  {
    id v3 = NSString;
    id v4 = [v2 name];
    uint64_t v5 = [v2 uuid];
    uint64_t v6 = [v5 UUIDString];
    uint64_t v7 = [v3 stringWithFormat:@"%@/%@", v4, v6];
  }
  else
  {
    id v4 = [v2 uuid];
    uint64_t v7 = [v4 UUIDString];
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(HMDHomePresence *)self userPresenceMap];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    uint64_t v7 = [(HMDHomePresence *)self userPresenceMap];
    uint64_t v8 = [v6 userPresenceMap];
    char v9 = [v7 isEqualToDictionary:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)serializedIdentifierDictionary
{
  unint64_t v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = [(HMDHomePresence *)self userPresenceMap];
  uint64_t v5 = objc_msgSend(v3, "dictionaryWithCapacity:", objc_msgSend(v4, "count"));

  id v6 = [(HMDHomePresence *)self userPresenceMap];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __49__HMDHomePresence_serializedIdentifierDictionary__block_invoke;
  v10[3] = &unk_1E6A12268;
  id v7 = v5;
  id v11 = v7;
  BOOL v12 = self;
  [v6 enumerateKeysAndObjectsUsingBlock:v10];

  id v8 = v7;
  return v8;
}

void __49__HMDHomePresence_serializedIdentifierDictionary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 user];
  id v8 = [v7 pairingIdentity];
  char v9 = [v8 identifier];

  v10 = [v7 presenceAuthStatus];
  uint64_t v11 = [v10 value];

  if (v11 != 1)
  {
LABEL_7:
    [*(id *)(a1 + 32) setObject:&unk_1F2DC90D0 forKeyedSubscript:v9];
    goto LABEL_8;
  }
  BOOL v12 = [v6 presenceRegionStatus];

  if (!v12)
  {
    long long v15 = (void *)MEMORY[0x1D9452090]();
    id v16 = *(id *)(a1 + 40);
    long long v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      int v19 = 138543618;
      v20 = v18;
      __int16 v21 = 2112;
      uint64_t v22 = v7;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Using HMDUserPresenceRegionStatusUnknown for user with nil presence: %@", (uint8_t *)&v19, 0x16u);
    }
    goto LABEL_7;
  }
  long long v13 = [v6 presenceRegionStatus];
  long long v14 = [v13 number];
  [*(id *)(a1 + 32) setObject:v14 forKeyedSubscript:v9];

LABEL_8:
}

- (id)serializedUUIDDictionary
{
  unint64_t v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = [(HMDHomePresence *)self userPresenceMap];
  id v5 = objc_msgSend(v3, "dictionaryWithCapacity:", objc_msgSend(v4, "count"));

  id v6 = [(HMDHomePresence *)self userPresenceMap];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __43__HMDHomePresence_serializedUUIDDictionary__block_invoke;
  v10[3] = &unk_1E6A12268;
  id v7 = v5;
  id v11 = v7;
  BOOL v12 = self;
  [v6 enumerateKeysAndObjectsUsingBlock:v10];

  id v8 = v7;
  return v8;
}

void __43__HMDHomePresence_serializedUUIDDictionary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 user];
  id v8 = [v7 presenceAuthStatus];
  uint64_t v9 = [v8 value];

  if (v9 != 1)
  {
LABEL_7:
    v20 = *(void **)(a1 + 32);
    id v11 = [v7 uuid];
    BOOL v12 = [v11 UUIDString];
    [v20 setObject:&unk_1F2DC90D0 forKeyedSubscript:v12];
    goto LABEL_8;
  }
  v10 = [v6 presenceRegionStatus];

  if (!v10)
  {
    id v16 = (void *)MEMORY[0x1D9452090]();
    id v17 = *(id *)(a1 + 40);
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v19 = HMFGetLogIdentifier();
      int v21 = 138543618;
      uint64_t v22 = v19;
      __int16 v23 = 2112;
      id v24 = v7;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Using HMDUserPresenceRegionStatusUnknown for user with nil presence: %@", (uint8_t *)&v21, 0x16u);
    }
    goto LABEL_7;
  }
  id v11 = [v6 presenceRegionStatus];
  BOOL v12 = [v11 number];
  long long v13 = *(void **)(a1 + 32);
  long long v14 = [v7 uuid];
  long long v15 = [v14 UUIDString];
  [v13 setObject:v12 forKeyedSubscript:v15];

LABEL_8:
}

- (NSArray)authorizedUsers
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = [(HMDHomePresence *)self userPresenceMap];
  id v5 = [v4 allValues];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v11 = [v10 user];
        BOOL v12 = [v11 presenceAuthStatus];
        uint64_t v13 = [v12 value];

        if (v13 == 1)
        {
          long long v14 = [v10 user];
          [v3 addObject:v14];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  long long v15 = (void *)[v3 copy];
  return (NSArray *)v15;
}

- (HMDHomePresence)initWithHome:(id)a3 userPresenceMap:(id)a4 lastUpdateByDevice:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HMDHomePresence;
  id v11 = [(HMDHomePresence *)&v16 init];
  BOOL v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_home, v8);
    uint64_t v13 = [v9 copy];
    userPresenceMap = v12->_userPresenceMap;
    v12->_userPresenceMap = (NSDictionary *)v13;

    objc_storeStrong((id *)&v12->_lastUpdateByDevice, a5);
  }

  return v12;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_138473 != -1) {
    dispatch_once(&logCategory__hmf_once_t3_138473, &__block_literal_global_138474);
  }
  v2 = (void *)logCategory__hmf_once_v4_138475;
  return v2;
}

uint64_t __30__HMDHomePresence_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v4_138475;
  logCategory__hmf_once_v4_138475 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end