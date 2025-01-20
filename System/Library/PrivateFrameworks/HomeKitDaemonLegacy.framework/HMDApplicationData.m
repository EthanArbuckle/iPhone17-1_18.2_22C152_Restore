@interface HMDApplicationData
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
- (BOOL)isEmpty;
- (HMDApplicationData)initWithCoder:(id)a3;
- (HMDApplicationData)initWithDictionary:(id)a3 parentUUID:(id)a4;
- (HMDApplicationData)initWithParentUUID:(id)a3;
- (NSMutableDictionary)appDataDictionary;
- (NSUUID)parentUUID;
- (NSUUID)uuid;
- (id)applicationDataForIdentifier:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionary;
- (id)dumpState;
- (id)logIdentifier;
- (id)modelObjectWithChangeType:(unint64_t)a3;
- (void)encodeForXPCTransportWithCoder:(id)a3 key:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)removeApplicationDataForIdentifier:(id)a3;
- (void)setAppDataDictionary:(id)a3;
- (void)setApplicationData:(id)a3 forIdentifier:(id)a4;
- (void)setParentUUID:(id)a3;
- (void)setUuid:(id)a3;
- (void)updateParentUUIDIfNil:(id)a3;
- (void)updateWithModel:(id)a3;
@end

@implementation HMDApplicationData

- (id)applicationDataForIdentifier:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDApplicationData *)self appDataDictionary];
  v19 = v4;
  v6 = [v5 objectForKeyedSubscript:v4];

  v7 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v15 = [v9 objectForKeyedSubscript:v14];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v16 = [v15 dictionaryRepresentation];
          [v8 setObject:v16 forKeyedSubscript:v14];
        }
        else
        {
          [v7 setObject:v15 forKeyedSubscript:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  if ([v8 count]) {
    [v7 setObject:v8 forKeyedSubscript:@"kAssetsKey"];
  }
  v17 = (void *)[v7 copy];

  return v17;
}

- (NSMutableDictionary)appDataDictionary
{
  return self->_appDataDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appDataDictionary, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_parentUUID, 0);
}

- (void)setAppDataDictionary:(id)a3
{
}

- (void)setUuid:(id)a3
{
}

- (void)setParentUUID:(id)a3
{
}

- (NSUUID)parentUUID
{
  return self->_parentUUID;
}

- (id)logIdentifier
{
  v2 = [(HMDApplicationData *)self parentUUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (id)modelObjectWithChangeType:(unint64_t)a3
{
  BOOL v5 = [(HMDApplicationData *)self isEmpty];
  v6 = [HMDApplicationDataModel alloc];
  v7 = [(HMDApplicationData *)self uuid];
  v8 = [(HMDApplicationData *)self parentUUID];
  if (v5)
  {
    id v9 = [(HMDBackingStoreModelObject *)v6 initWithObjectChangeType:3 uuid:v7 parentUUID:v8];
  }
  else
  {
    id v9 = [(HMDBackingStoreModelObject *)v6 initWithObjectChangeType:a3 uuid:v7 parentUUID:v8];

    v7 = [(HMDApplicationData *)self appDataDictionary];
    v8 = (void *)[v7 copy];
    [(HMDApplicationDataModel *)v9 setAppDataDictionary:v8];
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  id v4 = (void *)MEMORY[0x1D9452090]();
  BOOL v5 = [(HMDApplicationData *)self parentUUID];
  v6 = [v5 UUIDString];
  [v8 encodeObject:v6 forKey:@"HM.appDataParentUUID"];

  v7 = [(HMDApplicationData *)self appDataDictionary];
  [v8 encodeObject:v7 forKey:@"HM.appData"];
}

- (HMDApplicationData)initWithCoder:(id)a3
{
  v19[8] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HMDApplicationData;
  BOOL v5 = [(HMDApplicationData *)&v18 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = objc_alloc(MEMORY[0x1E4F29128]);
    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.appDataParentUUID"];
    uint64_t v9 = [v7 initWithUUIDString:v8];
    parentUUID = v5->_parentUUID;
    v5->_parentUUID = (NSUUID *)v9;

    uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v19[2] = objc_opt_class();
    v19[3] = objc_opt_class();
    v19[4] = objc_opt_class();
    v19[5] = objc_opt_class();
    v19[6] = objc_opt_class();
    v19[7] = objc_opt_class();
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:8];
    v13 = [v11 setWithArray:v12];
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"HM.appData"];

    v15 = (void *)[v14 mutableCopy];
    v16 = v15;
    if (!v15)
    {
      v16 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    objc_storeStrong((id *)&v5->_appDataDictionary, v16);
    if (!v15) {
  }
    }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [HMDApplicationData alloc];
  BOOL v5 = [(HMDApplicationData *)self appDataDictionary];
  v6 = [(HMDApplicationData *)self parentUUID];
  id v7 = [(HMDApplicationData *)v4 initWithDictionary:v5 parentUUID:v6];

  return v7;
}

- (void)encodeForXPCTransportWithCoder:(id)a3 key:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (objc_msgSend(v9, "hmd_isForXPCTransportEntitledForSPIAccess"))
  {
    id v7 = @"com.apple.homekit-entitledclient.identifer";
  }
  else
  {
    objc_msgSend(v9, "hmd_clientIdentifier");
    id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  id v8 = [(HMDApplicationData *)self applicationDataForIdentifier:v7];
  if (v8) {
    [v9 encodeObject:v8 forKey:v6];
  }
}

- (void)updateParentUUIDIfNil:(id)a3
{
  id v10 = a3;
  parentUUID = self->_parentUUID;
  if (!parentUUID
    || ([MEMORY[0x1E4F29128] zeroUUID],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [(NSUUID *)parentUUID isEqual:v6],
        v6,
        v7))
  {
    objc_storeStrong((id *)&self->_parentUUID, a3);
    objc_msgSend(MEMORY[0x1E4F29128], "hm_deriveUUIDFromBaseUUID:identifierSalt:withSalts:", self->_parentUUID, 0, &unk_1F2DC6A00);
    id v8 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    uuid = self->_uuid;
    self->_uuid = v8;
  }
}

- (void)updateWithModel:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 appDataDictionary];

  if (v5)
  {
    id v6 = [v4 appDataDictionary];
    int v7 = (void *)[v6 mutableCopy];
    [(HMDApplicationData *)self setAppDataDictionary:v7];

    id v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      uint64_t v12 = [(HMDApplicationData *)v9 appDataDictionary];
      v13 = [(HMDApplicationData *)v9 parentUUID];
      int v17 = 138543874;
      objc_super v18 = v11;
      __int16 v19 = 2112;
      long long v20 = v12;
      __int16 v21 = 2112;
      long long v22 = v13;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Updating the application data from transaction: %@ / %@", (uint8_t *)&v17, 0x20u);

LABEL_6:
    }
  }
  else
  {
    uint64_t v14 = [(HMDApplicationData *)self appDataDictionary];
    [v14 removeAllObjects];

    id v8 = (void *)MEMORY[0x1D9452090]();
    v15 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      v16 = [(HMDApplicationData *)v15 parentUUID];
      int v17 = 138543618;
      objc_super v18 = v11;
      __int16 v19 = 2112;
      long long v20 = v16;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Removing entire app data for container: %@", (uint8_t *)&v17, 0x16u);

      goto LABEL_6;
    }
  }
}

- (id)dumpState
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  v24 = self;
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = [(HMDApplicationData *)self appDataDictionary];
  uint64_t v26 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v26)
  {
    uint64_t v23 = *(void *)v34;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v34 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = v3;
        uint64_t v4 = *(void *)(*((void *)&v33 + 1) + 8 * v3);
        BOOL v5 = [(HMDApplicationData *)v24 appDataDictionary];
        uint64_t v27 = v4;
        id v6 = objc_msgSend(v5, "hmf_dictionaryForKey:", v4);

        int v7 = [MEMORY[0x1E4F1CA60] dictionary];
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v8 = v6;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v30;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v30 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v29 + 1) + 8 * v12);
              uint64_t v14 = [v8 objectForKeyedSubscript:v13];
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                v15 = v14;
              }
              else {
                v15 = 0;
              }
              id v16 = v15;
              int v17 = v16;
              if (v16)
              {
                uint64_t v18 = [v16 dictionaryRepresentation];
LABEL_18:
                __int16 v19 = (void *)v18;
                [v7 setObject:v18 forKeyedSubscript:v13];

                goto LABEL_19;
              }
              if (objc_opt_respondsToSelector())
              {
                uint64_t v18 = [v14 shortDescription];
                goto LABEL_18;
              }
              [v7 setObject:v14 forKeyedSubscript:v13];
LABEL_19:

              ++v12;
            }
            while (v10 != v12);
            uint64_t v20 = [v8 countByEnumeratingWithState:&v29 objects:v37 count:16];
            uint64_t v10 = v20;
          }
          while (v20);
        }

        [v25 setObject:v7 forKeyedSubscript:v27];
        uint64_t v3 = v28 + 1;
      }
      while (v28 + 1 != v26);
      uint64_t v26 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v26);
  }

  return v25;
}

- (id)dictionary
{
  v2 = [(HMDApplicationData *)self appDataDictionary];
  uint64_t v3 = (void *)[v2 copy];

  return v3;
}

- (void)removeApplicationDataForIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(HMDApplicationData *)self appDataDictionary];
    [v5 removeObjectForKey:v4];
  }
}

- (void)setApplicationData:(id)a3 forIdentifier:(id)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    if (v5)
    {
      int v7 = [(HMDApplicationData *)self appDataDictionary];
      id v33 = v6;
      v42 = [v7 objectForKeyedSubscript:v6];

      v44 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v8 = v5;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v50 objects:v61 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v51;
        id v38 = v5;
        uint64_t v35 = *(void *)v51;
        id v36 = v8;
        do
        {
          uint64_t v12 = 0;
          uint64_t v37 = v10;
          do
          {
            if (*(void *)v51 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void **)(*((void *)&v50 + 1) + 8 * v12);
            uint64_t v14 = [v8 objectForKey:v13];
            if ([v13 isEqualToString:@"kAssetsKey"])
            {
              id v15 = v14;
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                id v16 = v15;
              }
              else {
                id v16 = 0;
              }
              id v17 = v16;

              v41 = v17;
              if (v17)
              {
                uint64_t v39 = v14;
                uint64_t v40 = v12;
                long long v48 = 0u;
                long long v49 = 0u;
                long long v46 = 0u;
                long long v47 = 0u;
                id v18 = v17;
                uint64_t v45 = [v18 countByEnumeratingWithState:&v46 objects:v54 count:16];
                if (v45)
                {
                  uint64_t v43 = *(void *)v47;
                  do
                  {
                    for (uint64_t i = 0; i != v45; ++i)
                    {
                      if (*(void *)v47 != v43) {
                        objc_enumerationMutation(v18);
                      }
                      uint64_t v20 = *(void *)(*((void *)&v46 + 1) + 8 * i);
                      __int16 v21 = objc_msgSend(v18, "hmf_dictionaryForKey:", v20);
                      long long v22 = objc_msgSend(v21, "hmf_stringForKey:", @"kIdentifierKey");
                      uint64_t v23 = objc_msgSend(v21, "hmf_stringForKey:", @"kAssetURLKey");
                      v24 = objc_msgSend(v21, "hmf_dictionaryForKey:", @"kAssetMetadataKey");
                      if (v23)
                      {
                        id v25 = [MEMORY[0x1E4F1CB10] URLWithString:v23];
                      }
                      else
                      {
                        id v25 = 0;
                      }
                      uint64_t v26 = [v42 objectForKey:v20];
                      objc_opt_class();
                      objc_opt_isKindOfClass();
                      uint64_t v27 = [[HMDAsset alloc] initWithIdentifier:v22 metadata:v24 resourceURL:v25];
                      [v44 setObject:v27 forKeyedSubscript:v20];
                    }
                    uint64_t v45 = [v18 countByEnumeratingWithState:&v46 objects:v54 count:16];
                  }
                  while (v45);
                }

                uint64_t v10 = v37;
                id v5 = v38;
                uint64_t v11 = v35;
                id v8 = v36;
                uint64_t v14 = v39;
                uint64_t v12 = v40;
              }
              else
              {
                uint64_t v28 = (void *)MEMORY[0x1D9452090]();
                long long v29 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v31 = long long v30 = v14;
                  *(_DWORD *)buf = 138543874;
                  v56 = v31;
                  __int16 v57 = 2112;
                  v58 = @"kAssetsKey";
                  __int16 v59 = 2112;
                  id v60 = v15;
                  _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_INFO, "%{public}@%@ is not a dictionary, but %@", buf, 0x20u);

                  uint64_t v14 = v30;
                  id v5 = v38;
                }
              }
            }
            else
            {
              [v44 setObject:v14 forKeyedSubscript:v13];
            }

            ++v12;
          }
          while (v12 != v10);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v50 objects:v61 count:16];
        }
        while (v10);
      }

      long long v32 = [(HMDApplicationData *)self appDataDictionary];
      id v6 = v33;
      [v32 setObject:v44 forKeyedSubscript:v33];
    }
    else
    {
      [(HMDApplicationData *)self removeApplicationDataForIdentifier:v6];
    }
  }
}

- (NSUUID)uuid
{
  uuid = self->_uuid;
  if (!uuid
    || ([MEMORY[0x1E4F29128] zeroUUID],
        id v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [(NSUUID *)uuid isEqual:v4],
        v4,
        v5))
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F29128], "hm_deriveUUIDFromBaseUUID:identifierSalt:withSalts:", self->_parentUUID, 0, &unk_1F2DC69E8);
    int v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [MEMORY[0x1E4F29128] zeroUUID];
    }
    uint64_t v9 = self->_uuid;
    self->_uuid = v8;
  }
  uint64_t v10 = self->_uuid;
  return v10;
}

- (BOOL)isEmpty
{
  v2 = [(HMDApplicationData *)self appDataDictionary];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (HMDApplicationData)initWithDictionary:(id)a3 parentUUID:(id)a4
{
  id v6 = a3;
  int v7 = [(HMDApplicationData *)self initWithParentUUID:a4];
  id v8 = v7;
  if (v6 && v7) {
    [(NSMutableDictionary *)v7->_appDataDictionary setDictionary:v6];
  }

  return v8;
}

- (HMDApplicationData)initWithParentUUID:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDApplicationData;
  int v5 = [(HMDApplicationData *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    appDataDictionary = v5->_appDataDictionary;
    v5->_appDataDictionary = (NSMutableDictionary *)v6;

    uint64_t v8 = [v4 copy];
    parentUUID = v5->_parentUUID;
    v5->_parentUUID = (NSUUID *)v8;
  }
  return v5;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_11696 != -1) {
    dispatch_once(&logCategory__hmf_once_t6_11696, &__block_literal_global_11697);
  }
  v2 = (void *)logCategory__hmf_once_v7_11698;
  return v2;
}

uint64_t __33__HMDApplicationData_logCategory__block_invoke()
{
  logCategory__hmf_once_v7_11698 = HMFCreateOSLogHandle();
  return MEMORY[0x1F41817F8]();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end