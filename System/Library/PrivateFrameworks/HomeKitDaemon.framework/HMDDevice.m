@interface HMDDevice
+ (BOOL)supportsSecureCoding;
+ (HMDDevice)deviceWithDestination:(id)a3;
+ (HMDDevice)deviceWithHandle:(id)a3;
+ (id)destinationForDevice:(id)a3 service:(id)a4;
+ (id)logCategory;
- (BOOL)addHandle:(id)a3;
- (BOOL)isBackingStorageEqual:(id)a3;
- (BOOL)isCloudTracked;
- (BOOL)isCurrentDevice;
- (BOOL)isDirty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocallyTracked;
- (BOOL)isRelatedToDevice:(id)a3;
- (BOOL)isSameAccountWithDevice:(id)a3;
- (BOOL)mergeObject:(id)a3;
- (BOOL)supportsHH2;
- (BOOL)updateBackingModel:(id)a3 error:(id *)a4;
- (Class)modelClass;
- (HMDAccount)account;
- (HMDDevice)init;
- (HMDDevice)initWithBackingModel:(id)a3;
- (HMDDevice)initWithCoder:(id)a3;
- (HMDDevice)initWithDeviceAddress:(id)a3;
- (HMDDevice)initWithIdentifier:(id)a3 handles:(id)a4 name:(id)a5 productInfo:(id)a6 version:(id)a7 capabilities:(id)a8;
- (HMDDevice)initWithObjectModel:(id)a3;
- (HMDDevice)initWithService:(id)a3 device:(id)a4;
- (HMDDeviceAddress)deviceAddress;
- (HMDDeviceCapabilities)capabilities;
- (HMDHomeKitVersion)version;
- (HMDRPIdentity)rpIdentity;
- (HMFProductInfo)productInfo;
- (NSArray)attributeDescriptions;
- (NSArray)identities;
- (NSData)pushToken;
- (NSString)name;
- (NSString)shortDescription;
- (NSUUID)identifier;
- (NSUUID)idsIdentifier;
- (NSUUID)modelIdentifier;
- (NSUUID)modelParentIdentifier;
- (NSUUID)sharedUserIDSIdentifier;
- (Protocol)backingModelType;
- (id)backingStoreObjectsWithChangeType:(unint64_t)a3 version:(int64_t)a4;
- (id)deviceForIDSService:(id)a3;
- (id)globalDestination;
- (id)globalHandles;
- (id)handles;
- (id)localHandles;
- (id)logIdentifier;
- (id)modelBackedObjects;
- (id)modelObjectWithChangeType:(unint64_t)a3 version:(int64_t)a4;
- (id)remoteDestinationString;
- (unint64_t)hash;
- (void)__handleAccountHandleUpdated:(id)a3;
- (void)__updateDeviceWithActions:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAccount:(id)a3;
- (void)setCapabilities:(id)a3;
- (void)setCloudTracked:(BOOL)a3;
- (void)setDirty:(BOOL)a3;
- (void)setHandles:(id)a3;
- (void)setLocallyTracked:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setProductInfo:(id)a3;
- (void)setRpIdentity:(id)a3;
- (void)setSharedUserIDSIdentifier:(id)a3;
- (void)setVersion:(id)a3;
- (void)transactionObjectRemoved:(id)a3 message:(id)a4;
- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
- (void)updateVersion:(id)a3;
- (void)updateWithDevice:(id)a3;
@end

@implementation HMDDevice

- (id)deviceForIDSService:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x263EFFA08];
  v6 = [(HMDDevice *)self localHandles];
  v7 = [v5 setWithArray:v6];

  if ([v7 count])
  {
    v8 = (void *)MEMORY[0x230FBD990]();
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v9 = [v4 devices];
    id v10 = (id)[v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      v19 = v8;
      uint64_t v11 = *(void *)v21;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v9);
          }
          v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          v14 = (void *)MEMORY[0x263EFFA08];
          v15 = objc_msgSend(v13, "hmd_handlesForService:", v4);
          v16 = [v14 setWithArray:v15];
          int v17 = [v7 intersectsSet:v16];

          if (v17)
          {
            id v10 = v13;
            goto LABEL_12;
          }
        }
        id v10 = (id)[v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v10) {
          continue;
        }
        break;
      }
LABEL_12:
      v8 = v19;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (HMDDevice)initWithService:(id)a3 device:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "hmd_handlesForService:", v6);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      v12 = 0;
      uint64_t v13 = *(void *)v31;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v31 != v13) {
            objc_enumerationMutation(v9);
          }
          v15 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          if (objc_msgSend(v15, "isGlobal", (void)v30))
          {
            uint64_t v16 = [v15 identifier];

            v12 = (void *)v16;
            goto LABEL_16;
          }
          if (!v12)
          {
            if ([v15 isLocal])
            {
              v12 = [v15 identifier];
            }
            else
            {
              v12 = 0;
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v11) {
          continue;
        }
        break;
      }
LABEL_16:

      if (v12)
      {
        int v17 = [v8 name];
        v18 = objc_msgSend(v8, "hmd_productInfo");
        v19 = objc_msgSend(v8, "hmd_version");
        long long v20 = objc_msgSend(v8, "hmd_capabilities");
        long long v21 = [(HMDDevice *)self initWithIdentifier:v12 handles:v9 name:v17 productInfo:v18 version:v19 capabilities:v20];

        long long v22 = v21;
LABEL_25:

        goto LABEL_26;
      }
    }
    else
    {
    }
    v26 = (void *)MEMORY[0x230FBD990]();
    long long v21 = self;
    v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v28 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v36 = v28;
      _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to create device identifier", buf, 0xCu);
    }
    long long v22 = 0;
    goto LABEL_25;
  }
  long long v23 = (void *)MEMORY[0x230FBD990]();
  long long v21 = self;
  v24 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    uint64_t v25 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v36 = v25;
    _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Device is required", buf, 0xCu);
  }
  long long v22 = 0;
LABEL_26:

  return v22;
}

+ (id)destinationForDevice:(id)a3 service:(id)a4
{
  id v4 = objc_msgSend(a3, "hmd_preferredHandleForService:", a4);
  v5 = [v4 destination];

  return v5;
}

- (NSArray)identities
{
  v3 = +[HMDIdentityRegistry sharedRegistry];
  id v4 = [v3 identitiesForDevice:self];

  return (NSArray *)v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedUserIDSIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_modelIdentifier, 0);
  objc_storeStrong((id *)&self->_rpIdentity, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_productInfo, 0);
  objc_destroyWeak((id *)&self->_account);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_handles, 0);
}

- (void)setSharedUserIDSIdentifier:(id)a3
{
}

- (NSUUID)sharedUserIDSIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCloudTracked:(BOOL)a3
{
  self->_cloudTracked = a3;
}

- (BOOL)isCloudTracked
{
  return self->_cloudTracked;
}

- (void)setLocallyTracked:(BOOL)a3
{
  self->_locallyTracked = a3;
}

- (BOOL)isLocallyTracked
{
  return self->_locallyTracked;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 88, 1);
}

- (NSUUID)modelIdentifier
{
  return self->_modelIdentifier;
}

- (BOOL)isBackingStorageEqual:(id)a3
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  if (![(HMDDevice *)self isEqual:v6]) {
    goto LABEL_27;
  }
  id v7 = [(HMDDevice *)self idsIdentifier];
  v8 = [v6 idsIdentifier];
  char v9 = HMFEqualObjects();

  if ((v9 & 1) == 0)
  {
    v29 = (void *)MEMORY[0x230FBD990]();
    long long v30 = self;
    long long v31 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO)) {
      goto LABEL_26;
    }
    long long v32 = HMFGetLogIdentifier();
    long long v33 = [(HMDDevice *)v30 idsIdentifier];
    v34 = [v6 idsIdentifier];
    *(_DWORD *)buf = 138543874;
    v57 = v32;
    __int16 v58 = 2112;
    v59 = v33;
    __int16 v60 = 2112;
    v61 = v34;
    v35 = "%{public}@Updating Device IDS Identifier from %@ to %@";
LABEL_25:
    _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, v35, buf, 0x20u);

    goto LABEL_26;
  }
  uint64_t v10 = [(HMDDevice *)self name];
  uint64_t v11 = [v6 name];
  char v12 = HMFEqualObjects();

  if ((v12 & 1) == 0)
  {
    v29 = (void *)MEMORY[0x230FBD990]();
    v36 = self;
    long long v31 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO)) {
      goto LABEL_26;
    }
    long long v32 = HMFGetLogIdentifier();
    long long v33 = [(HMDDevice *)v36 name];
    v34 = [v6 name];
    *(_DWORD *)buf = 138543874;
    v57 = v32;
    __int16 v58 = 2112;
    v59 = v33;
    __int16 v60 = 2112;
    v61 = v34;
    v35 = "%{public}@Updating Device name from %@ to %@";
    goto LABEL_25;
  }
  uint64_t v13 = [(HMDDevice *)self productInfo];
  v14 = [v6 productInfo];
  char v15 = HMFEqualObjects();

  if ((v15 & 1) == 0)
  {
    v29 = (void *)MEMORY[0x230FBD990]();
    uint64_t v37 = self;
    long long v31 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO)) {
      goto LABEL_26;
    }
    long long v32 = HMFGetLogIdentifier();
    long long v33 = [(HMDDevice *)v37 productInfo];
    v34 = [v6 productInfo];
    *(_DWORD *)buf = 138543874;
    v57 = v32;
    __int16 v58 = 2112;
    v59 = v33;
    __int16 v60 = 2112;
    v61 = v34;
    v35 = "%{public}@Updating Device Product Info from %@ to %@";
    goto LABEL_25;
  }
  uint64_t v16 = [(HMDDevice *)self version];
  int v17 = [v6 version];
  char v18 = HMFEqualObjects();

  if ((v18 & 1) == 0)
  {
    v29 = (void *)MEMORY[0x230FBD990]();
    v38 = self;
    long long v31 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO)) {
      goto LABEL_26;
    }
    long long v32 = HMFGetLogIdentifier();
    long long v33 = [(HMDDevice *)v38 version];
    v34 = [v6 version];
    *(_DWORD *)buf = 138543874;
    v57 = v32;
    __int16 v58 = 2112;
    v59 = v33;
    __int16 v60 = 2112;
    v61 = v34;
    v35 = "%{public}@Updating Device version from %@ to %@";
    goto LABEL_25;
  }
  v19 = [(HMDDevice *)self capabilities];
  long long v20 = [v6 capabilities];
  char v21 = HMFEqualObjects();

  if ((v21 & 1) == 0)
  {
    v29 = (void *)MEMORY[0x230FBD990]();
    v39 = self;
    long long v31 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO)) {
      goto LABEL_26;
    }
    long long v32 = HMFGetLogIdentifier();
    long long v33 = [(HMDDevice *)v39 capabilities];
    v34 = [v6 capabilities];
    *(_DWORD *)buf = 138543874;
    v57 = v32;
    __int16 v58 = 2112;
    v59 = v33;
    __int16 v60 = 2112;
    v61 = v34;
    v35 = "%{public}@Updating Device capabilities from %@ to %@";
    goto LABEL_25;
  }
  long long v22 = [(HMDDevice *)self pushToken];
  long long v23 = [v6 pushToken];
  char v24 = HMFEqualObjects();

  if ((v24 & 1) == 0)
  {
    v29 = (void *)MEMORY[0x230FBD990]();
    v40 = self;
    long long v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      long long v32 = HMFGetLogIdentifier();
      long long v33 = [(HMDDevice *)v40 pushToken];
      v34 = [v6 pushToken];
      *(_DWORD *)buf = 138543874;
      v57 = v32;
      __int16 v58 = 2112;
      v59 = v33;
      __int16 v60 = 2112;
      v61 = v34;
      v35 = "%{public}@Updating Push Token from %@ to %@";
      goto LABEL_25;
    }
LABEL_26:

LABEL_27:
    BOOL v28 = 0;
    goto LABEL_28;
  }
  uint64_t v25 = [(HMDDevice *)self rpIdentity];
  v26 = [v6 rpIdentity];
  char v27 = HMFEqualObjects();

  if ((v27 & 1) == 0)
  {
    v42 = (void *)MEMORY[0x230FBD990]();
    v43 = self;
    v44 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      v45 = HMFGetLogIdentifier();
      v46 = [(HMDDevice *)v43 rpIdentity];
      v47 = [v6 rpIdentity];
      *(_DWORD *)buf = 138543874;
      v57 = v45;
      __int16 v58 = 2112;
      v59 = v46;
      __int16 v60 = 2112;
      v61 = v47;
      _os_log_impl(&dword_22F52A000, v44, OS_LOG_TYPE_INFO, "%{public}@Updating Device Rapport identity from %@ to %@", buf, 0x20u);
    }
    v29 = (void *)MEMORY[0x230FBD990]();
    v48 = v43;
    long long v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v49 = HMFGetLogIdentifier();
      v55 = [(HMDDevice *)v48 rpIdentity];
      v54 = [v55 deviceIRK];
      v50 = [v54 data];
      v51 = [v6 rpIdentity];
      v52 = [v51 deviceIRK];
      v53 = [v52 data];
      *(_DWORD *)buf = 138543874;
      v57 = v49;
      __int16 v58 = 2112;
      v59 = v50;
      __int16 v60 = 2112;
      v61 = v53;
      _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@Rapport identity changed from %@ to %@", buf, 0x20u);
    }
    goto LABEL_26;
  }
  BOOL v28 = 1;
LABEL_28:

  return v28;
}

- (id)modelBackedObjects
{
  v3 = [MEMORY[0x263EFF980] array];
  [v3 addObject:self];
  id v4 = [(HMDDevice *)self capabilities];
  if (v4) {
    [v3 addObject:v4];
  }
  v5 = (void *)[v3 copy];

  return v5;
}

- (id)backingStoreObjectsWithChangeType:(unint64_t)a3 version:(int64_t)a4
{
  id v7 = -[HMDDevice modelObjectWithChangeType:version:](self, "modelObjectWithChangeType:version:");
  if (v7)
  {
    v8 = [MEMORY[0x263EFF980] array];
    [v8 addObject:v7];
    char v9 = [(HMDDevice *)self capabilities];
    uint64_t v10 = v9;
    if (v9)
    {
      uint64_t v11 = [v9 modelObjectWithChangeType:a3 version:a4];
      [v8 addObject:v11];
    }
    char v12 = (void *)[v8 copy];
  }
  else
  {
    char v12 = (void *)MEMORY[0x263EFFA68];
  }

  return v12;
}

- (id)modelObjectWithChangeType:(unint64_t)a3 version:(int64_t)a4
{
  id v6 = [HMDDeviceModel alloc];
  id v7 = [(HMDDevice *)self modelIdentifier];
  v8 = [(HMDDevice *)self modelParentIdentifier];
  char v9 = [(HMDBackingStoreModelObject *)v6 initWithObjectChangeType:a3 uuid:v7 parentUUID:v8];

  uint64_t v10 = [(HMDDevice *)self identifier];
  [(HMDDeviceModel *)v9 setIdentifier:v10];

  uint64_t v11 = [(HMDDevice *)self name];
  char v12 = (void *)[v11 copy];
  [(HMDDeviceModel *)v9 setName:v12];

  uint64_t v13 = [(HMDDevice *)self version];
  v14 = (void *)[v13 copy];
  [(HMDDeviceModel *)v9 setVersion:v14];

  char v15 = [(HMDDevice *)self productInfo];
  uint64_t v16 = (void *)[v15 copy];
  [(HMDDeviceModel *)v9 setProductInfo:v16];

  int v17 = [(HMDDevice *)self rpIdentity];

  if (v17)
  {
    char v18 = [(HMDDevice *)self rpIdentity];
    v19 = (void *)[v18 copy];
    [(HMDDeviceModel *)v9 setRpIdentity:v19];
  }
  long long v20 = [(HMDDevice *)self handles];
  char v21 = (void *)[v20 copy];
  [(HMDDeviceModel *)v9 setHandles:v21];

  return v9;
}

- (NSUUID)modelParentIdentifier
{
  v2 = [(HMDDevice *)self account];
  v3 = [v2 modelIdentifier];

  return (NSUUID *)v3;
}

- (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (void)__updateDeviceWithActions:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDDevice *)self account];
  id v6 = [v5 manager];

  if ([v4 source] == 2)
  {
    if ([(HMDDevice *)self isCurrentDevice]
      || [v6 isCurrentDeviceDataOwnerForDevice:self])
    {
      uint64_t v7 = [(HMDDevice *)self isLocallyTracked];
      if ((v7 & 1) == 0) {
        uint64_t v7 = [(HMDDevice *)self setLocallyTracked:1];
      }
      v8 = (void *)MEMORY[0x230FBD990](v7);
      char v9 = self;
      uint64_t v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = HMFGetLogIdentifier();
        int v24 = 138543362;
        uint64_t v25 = v11;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Not marking cloud transaction as a change for current device", (uint8_t *)&v24, 0xCu);
      }
      goto LABEL_22;
    }
    uint64_t v18 = [(HMDDevice *)self isCloudTracked];
    if ((v18 & 1) == 0) {
      uint64_t v18 = [(HMDDevice *)self setCloudTracked:1];
    }
    uint64_t v13 = (void *)MEMORY[0x230FBD990](v18);
    v14 = self;
    char v15 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
LABEL_21:

      [v4 markChanged];
      goto LABEL_22;
    }
    uint64_t v16 = HMFGetLogIdentifier();
    int v24 = 138543362;
    uint64_t v25 = v16;
    int v17 = "%{public}@Marking cloud transaction as a change";
LABEL_20:
    _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, v17, (uint8_t *)&v24, 0xCu);

    goto LABEL_21;
  }
  if ([v4 source]) {
    goto LABEL_22;
  }
  if ([(HMDDevice *)self isCurrentDevice]
    || [v6 isCurrentDeviceDataOwnerForDevice:self])
  {
    uint64_t v12 = [(HMDDevice *)self isLocallyTracked];
    if ((v12 & 1) == 0) {
      uint64_t v12 = [(HMDDevice *)self setLocallyTracked:1];
    }
    uint64_t v13 = (void *)MEMORY[0x230FBD990](v12);
    v14 = self;
    char v15 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
      goto LABEL_21;
    }
    uint64_t v16 = HMFGetLogIdentifier();
    int v24 = 138543362;
    uint64_t v25 = v16;
    int v17 = "%{public}@Marking local transaction for cloud upload";
    goto LABEL_20;
  }
  BOOL v19 = isWatch();
  long long v20 = (void *)MEMORY[0x230FBD990](v19);
  char v21 = self;
  long long v22 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    long long v23 = HMFGetLogIdentifier();
    int v24 = 138543362;
    uint64_t v25 = v23;
    _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Not marking local transaction for cloud upload", (uint8_t *)&v24, 0xCu);
  }
  [(HMDDevice *)v21 setCloudTracked:1];
  [v4 markLocalChanged];
LABEL_22:
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  uint64_t v98 = *MEMORY[0x263EF8340];
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
  unint64_t v12 = v11;
  id v13 = v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v14 = v13;
  }
  else {
    v14 = 0;
  }
  unint64_t v15 = v14;

  v80 = (void *)v15;
  v81 = (void *)v12;
  if (!(v12 | v15))
  {
    v49 = (void *)MEMORY[0x230FBD990]();
    v50 = self;
    v51 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      v52 = HMFGetLogIdentifier();
      *(_DWORD *)v89 = 138543874;
      *(void *)&v89[4] = v52;
      __int16 v90 = 2112;
      id v91 = v13;
      __int16 v92 = 2112;
      id v93 = (id)objc_opt_class();
      id v53 = v93;
      _os_log_impl(&dword_22F52A000, v51, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectUpdated:newValues:message:]", v89, 0x20u);
    }
    v54 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    [v10 respondWithError:v54];

    goto LABEL_48;
  }
  uint64_t v16 = [v10 transactionResult];
  [(HMDDevice *)self __updateDeviceWithActions:v16];
  int v17 = [(HMDDevice *)self account];
  uint64_t v18 = [v17 manager];
  int v19 = [v18 shouldDevice:self processModel:v13 actions:v16];

  if (!v19)
  {

LABEL_48:
    v47 = v80;
    long long v20 = v81;
    goto LABEL_63;
  }
  v79 = v16;
  long long v20 = v81;
  if (v81)
  {
    id v77 = v13;
    char v21 = self;
    id v22 = v81;
    id v76 = v10;
    id v75 = v10;
    long long v23 = [v75 transactionResult];
    int v24 = [(HMDDevice *)v21 modelObjectWithChangeType:0 version:4];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v25 = v24;
    }
    else {
      uint64_t v25 = 0;
    }
    id v26 = v25;

    if (v26)
    {
      id v84 = 0;
      int v27 = [v26 diff:v22 differingFields:&v84];
      id v28 = v84;
      if (!v27)
      {
        v47 = v80;
        long long v20 = v81;
        v48 = v16;
        v46 = v75;
        goto LABEL_56;
      }
      id v73 = v26;
      id v74 = v8;
      long long v96 = 0u;
      long long v97 = 0u;
      long long v94 = 0u;
      long long v95 = 0u;
      id obj = v28;
      uint64_t v29 = [obj countByEnumeratingWithState:&v94 objects:v89 count:16];
      if (!v29) {
        goto LABEL_41;
      }
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v95;
      id v82 = v22;
      while (1)
      {
        uint64_t v32 = 0;
        do
        {
          if (*(void *)v95 != v31) {
            objc_enumerationMutation(obj);
          }
          long long v33 = *(void **)(*((void *)&v94 + 1) + 8 * v32);
          v34 = (void *)MEMORY[0x230FBD990]();
          v35 = v21;
          v36 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            uint64_t v37 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v86 = v37;
            __int16 v87 = 2112;
            v88 = v33;
            _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_INFO, "%{public}@Updating device information for %@", buf, 0x16u);

            id v22 = v82;
          }

          if ([v33 isEqualToString:@"handles"])
          {
            v38 = [v22 deviceHandles];
            if (v38) {
              [(HMDDevice *)v35 setHandles:v38];
            }
            goto LABEL_34;
          }
          if ([v33 isEqualToString:@"name"])
          {
            v38 = [v22 name];
            v39 = (void *)[v38 copy];
            [(HMDDevice *)v35 setName:v39];
LABEL_33:

LABEL_34:
            [v23 markChanged];
            goto LABEL_35;
          }
          if ([v33 isEqualToString:@"version"])
          {
            v38 = [v22 version];
            v39 = (void *)[v38 copy];
            [(HMDDevice *)v35 setVersion:v39];
            goto LABEL_33;
          }
          if ([v33 isEqualToString:@"productInfo"])
          {
            v38 = [v22 productInfo];
            v39 = (void *)[v38 copy];
            [(HMDDevice *)v35 setProductInfo:v39];
            goto LABEL_33;
          }
          if ([v33 isEqualToString:@"rpIdentity"])
          {
            v38 = [v22 rpIdentity];
            v39 = (void *)[v38 copy];
            [(HMDDevice *)v35 setRpIdentity:v39];
            goto LABEL_33;
          }
          v40 = (void *)MEMORY[0x230FBD990]();
          v41 = v35;
          v42 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            v43 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v86 = v43;
            __int16 v87 = 2112;
            v88 = v33;
            _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_ERROR, "%{public}@Unexpected field! -- changedField: %@", buf, 0x16u);

            id v22 = v82;
          }

LABEL_35:
          ++v32;
        }
        while (v30 != v32);
        uint64_t v44 = [obj countByEnumeratingWithState:&v94 objects:v89 count:16];
        uint64_t v30 = v44;
        if (!v44)
        {
LABEL_41:

          if ([v23 changed])
          {
            [(HMDDevice *)v21 setDirty:1];
            v45 = [v23 backingStore];
            __HMDDeviceMarkDirty(v21, v45);
          }
          id v8 = v74;
          v46 = v75;
          v47 = v80;
          long long v20 = v81;
          v48 = v79;
          id v26 = v73;
          id v28 = obj;
          goto LABEL_56;
        }
      }
    }
    v61 = (void *)MEMORY[0x230FBD990]();
    uint64_t v62 = v21;
    v63 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      v64 = HMFGetLogIdentifier();
      *(_DWORD *)v89 = 138543362;
      *(void *)&v89[4] = v64;
      _os_log_impl(&dword_22F52A000, v63, OS_LOG_TYPE_ERROR, "%{public}@Unable to retrieve device model for updated device", v89, 0xCu);
    }
    uint64_t v65 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    v46 = v75;
    [v75 respondWithError:v65];
    id v28 = (id)v65;
    v47 = v80;
    long long v20 = v81;
    v48 = v16;
LABEL_56:

    id v10 = v76;
    id v13 = v77;
  }
  else
  {
    v48 = v16;
    v47 = v80;
    if (v80)
    {
      v55 = self;
      id v56 = v80;
      id v57 = v10;
      __int16 v58 = [v57 transactionResult];
      v59 = [(HMDDevice *)v55 capabilities];
      __int16 v60 = v59;
      if (v59)
      {
        [v59 transactionObjectUpdated:0 newValues:v56 message:v57];
      }
      else
      {
        v66 = [[HMDDeviceCapabilities alloc] initWithObjectModel:v56];
        [(HMDDevice *)v55 setCapabilities:v66];

        v67 = [(HMDDevice *)v55 capabilities];

        if (v67)
        {
          [v58 markChanged];
          v68 = [(HMDDevice *)v55 capabilities];
          *(void *)&long long v94 = @"HMDDeviceCapabilitiesUpdatedDifferingFieldsNotificationKey";
          [v56 setProperties];
          v69 = id v78 = v13;
          *(void *)v89 = v69;
          [NSDictionary dictionaryWithObjects:v89 forKeys:&v94 count:1];
          v71 = id v70 = v8;
          logAndPostNotification(@"HMDDeviceCapabilitiiesUpdatedNotification", v68, v71);

          id v8 = v70;
          id v13 = v78;
        }
      }
      if ([v58 changed])
      {
        [(HMDDevice *)v55 setDirty:1];
        v72 = [v58 backingStore];
        __HMDDeviceMarkDirty(v55, v72);
      }
      v47 = v80;
      long long v20 = 0;
      v48 = v79;
    }
  }

LABEL_63:
}

- (void)transactionObjectRemoved:(id)a3 message:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = self;
  uint64_t v11 = HMFGetOSLogHandle();
  unint64_t v12 = v11;
  if (isKindOfClass)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      id v13 = HMFGetLogIdentifier();
      int v17 = 138543362;
      uint64_t v18 = v13;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Received remove capabilities", (uint8_t *)&v17, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      int v17 = 138543874;
      uint64_t v18 = v14;
      __int16 v19 = 2112;
      id v20 = v6;
      __int16 v21 = 2112;
      id v22 = (id)objc_opt_class();
      id v15 = v22;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectRemoved:message:]", (uint8_t *)&v17, 0x20u);
    }
    uint64_t v16 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    [v7 respondWithError:v16];
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v32 = a3;
  int v4 = objc_msgSend(v32, "hmd_isForXPCTransport");
  v5 = [(HMDDevice *)self identifier];
  if (v4)
  {
    [v32 encodeObject:v5 forKey:@"HM.identifier"];

    id v6 = [(HMDDevice *)self name];
    [v32 encodeObject:v6 forKey:@"HM.name"];

    id v7 = [(HMDDevice *)self productInfo];
    [v32 encodeObject:v7 forKey:*MEMORY[0x263F0C650]];

    objc_msgSend(v32, "encodeBool:forKey:", -[HMDDevice isCurrentDevice](self, "isCurrentDevice"), @"HM.currentDevice");
    id v8 = [(HMDDevice *)self idsIdentifier];
    [v32 encodeObject:v8 forKey:*MEMORY[0x263F0C648]];

    if ((objc_msgSend(v32, "hmd_entitlements") & 0x1000) != 0)
    {
      id v9 = [(HMDDevice *)self remoteDestinationString];
      [v32 encodeObject:v9 forKey:*MEMORY[0x263F0C640]];
    }
    id v10 = [(HMDDevice *)self rpIdentity];
    uint64_t v11 = [v10 deviceIRK];
    [v32 encodeObject:v11 forKey:*MEMORY[0x263F0C658]];

    BOOL v12 = [(HMDDevice *)self supportsHH2];
    [v32 encodeBool:v12 forKey:*MEMORY[0x263F0C6C0]];
  }
  else
  {
    [v32 encodeObject:v5 forKey:@"HM.identifier"];

    id v13 = [(HMDDevice *)self handles];
    [v32 encodeObject:v13 forKey:@"HM.handles"];

    v14 = [(HMDDevice *)self name];
    [v32 encodeObject:v14 forKey:@"HM.name"];

    id v15 = [(HMDDevice *)self version];
    [v32 encodeObject:v15 forKey:@"HM.version2"];

    if ((objc_msgSend(v32, "hmd_isForLocalStore") & 1) != 0
      || objc_msgSend(v32, "hmd_isForRemoteTransportOnSameAccount"))
    {
      uint64_t v16 = [(HMDDevice *)self productInfo];
      [v32 encodeObject:v16 forKey:@"HM.productInfo"];
    }
    int v17 = [(HMDDevice *)self version];
    uint64_t v18 = v17;
    if (v17)
    {
      __int16 v19 = objc_msgSend(NSString, "stringWithFormat:", @"%tu.%tu", objc_msgSend(v17, "majorVersion"), objc_msgSend(v17, "minorVersion"));
      id v20 = NSNumber;
      [v19 doubleValue];
      __int16 v21 = objc_msgSend(v20, "numberWithDouble:");
    }
    else
    {
      __int16 v21 = 0;
    }
    [v32 encodeObject:v21 forKey:@"HM.version"];

    id v22 = [(HMDDevice *)self remoteDestinationString];
    [v32 encodeObject:v22 forKey:@"HM.destination"];

    uint64_t v23 = [(HMDDevice *)self idsIdentifier];
    [v32 encodeObject:v23 forKey:@"HM.idsIdentifier"];

    int v24 = [(HMDDevice *)self rpIdentity];
    [v32 encodeObject:v24 forKey:@"HM.rpIdentity"];

    uint64_t v25 = [(HMDDevice *)self capabilities];
    [v32 encodeObject:v25 forKey:@"HM.capabilities"];
    if (v25)
    {
      id v26 = [(HMDDevice *)self capabilities];
      objc_msgSend(v32, "encodeBool:forKey:", objc_msgSend(v26, "supportsKeychainSync"), @"HM.supportsKeychainSync");

      int v27 = [(HMDDevice *)self capabilities];
      objc_msgSend(v32, "encodeBool:forKey:", objc_msgSend(v27, "supportsCloudDataSync"), @"HM.supportsCloudDataSync");

      id v28 = [(HMDDevice *)self capabilities];
      objc_msgSend(v32, "encodeBool:forKey:", objc_msgSend(v28, "isResidentCapable"), @"HM.residentCapable");

      uint64_t v29 = [(HMDDevice *)self capabilities];
      objc_msgSend(v32, "encodeBool:forKey:", objc_msgSend(v29, "isRemoteGatewayCapable"), @"HM.remoteGatewayCapable");
    }
    if (objc_msgSend(v32, "hmd_isForLocalStore"))
    {
      uint64_t v30 = [(HMDDevice *)self modelIdentifier];
      [v32 encodeObject:v30 forKey:@"HM.modelIdentifier"];

      objc_msgSend(v32, "encodeBool:forKey:", -[HMDDevice isLocallyTracked](self, "isLocallyTracked"), @"HM.locallyTracked");
      objc_msgSend(v32, "encodeBool:forKey:", -[HMDDevice isCloudTracked](self, "isCloudTracked"), @"HM.cloudTracked");
      uint64_t v31 = [(HMDDevice *)self sharedUserIDSIdentifier];
      [v32 encodeObject:v31 forKey:@"HM.sharedUserIDSIdentifier"];
    }
  }
}

- (HMDDevice)initWithCoder:(id)a3
{
  v53[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  unint64_t v4 = 0x263F08000uLL;
  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"HM.identifier"];
  id v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"HM.name"];
  v48 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"HM.productInfo"];
  if ([v3 containsValueForKey:@"HM.handles"])
  {
    id v7 = (void *)MEMORY[0x263EFFA08];
    v53[0] = objc_opt_class();
    v53[1] = objc_opt_class();
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:2];
    id v9 = [v7 setWithArray:v8];
    uint64_t v10 = [v3 decodeObjectOfClasses:v9 forKey:@"HM.handles"];
  }
  else
  {
    id v8 = [MEMORY[0x263EFF980] arrayWithCapacity:2];
    id v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"HM.idsIdentifier"];
    if (v9)
    {
      uint64_t v11 = [[_HMDLocalDeviceHandle alloc] initWithDeviceIdentifier:v9];
      if (v11)
      {
        BOOL v12 = [[HMDDeviceHandle alloc] initWithInternal:v11];
        [v8 addObject:v12];
      }
    }
    id v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"HM.destination"];
    v14 = +[HMDDeviceHandle deviceHandleForDestination:v13];

    if (v14) {
      [v8 addObject:v14];
    }

    uint64_t v10 = [v8 copy];
  }
  id v15 = (void *)v10;

  v46 = v15;
  if ([v3 containsValueForKey:@"HM.version2"])
  {
    id v16 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"HM.version2"];
    int v17 = fixHomeKitVersion(v16);
  }
  else
  {
    int v17 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"HM.version"];
    if (v17)
    {
      uint64_t v18 = v6;
      __int16 v19 = v5;
      id v20 = (void *)MEMORY[0x230FBD990]();
      __int16 v21 = self;
      id v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        uint64_t v23 = HMFGetLogIdentifier();
        int v24 = [v17 stringValue];
        *(_DWORD *)buf = 138543618;
        v50 = v23;
        __int16 v51 = 2112;
        v52 = v24;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Updating the version of device '%@'", buf, 0x16u);
      }
      id v16 = v17;
      uint64_t v25 = [HMDHomeKitVersion alloc];
      id v26 = [v16 stringValue];

      int v27 = [(HMDHomeKitVersion *)v25 initWithVersionString:v26];
      int v17 = fixHomeKitVersion(v27);

      v5 = v19;
      id v6 = v18;
      unint64_t v4 = 0x263F08000;
      id v15 = v46;
    }
    else
    {
      id v16 = 0;
    }
  }

  if ([v3 containsValueForKey:@"HM.capabilities"])
  {
    id v28 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"HM.capabilities"];
  }
  else
  {
    uint64_t v29 = [HMDDeviceCapabilitiesModel alloc];
    uint64_t v30 = [*(id *)(v4 + 3128) UUID];
    uint64_t v31 = [(HMDBackingStoreModelObject *)v29 initWithUUID:v30];

    id v32 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "decodeBoolForKey:", @"HM.supportsKeychainSync"));
    [(HMDDeviceCapabilitiesModel *)v31 setSupportsKeychainSync:v32];

    long long v33 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "decodeBoolForKey:", @"HM.supportsCloudDataSync"));
    [(HMDDeviceCapabilitiesModel *)v31 setSupportsCloudDataSync:v33];

    v34 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "decodeBoolForKey:", @"HM.residentCapable"));
    [(HMDDeviceCapabilitiesModel *)v31 setResidentCapable:v34];

    v35 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "decodeBoolForKey:", @"HM.remoteGatewayCapable"));
    [(HMDDeviceCapabilitiesModel *)v31 setRemoteGatewayCapable:v35];

    id v28 = [[HMDDeviceCapabilities alloc] initWithObjectModel:v31];
  }
  v36 = [(HMDDevice *)self initWithIdentifier:v5 handles:v15 name:v6 productInfo:v48 version:v17 capabilities:v28];
  if (v36)
  {
    if ([v3 containsValueForKey:@"HM.modelIdentifier"])
    {
      uint64_t v37 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"HM.modelIdentifier"];
      modelIdentifier = v36->_modelIdentifier;
      v36->_modelIdentifier = (NSUUID *)v37;
    }
    v39 = [(HMDDeviceCapabilities *)v36->_capabilities modelParentIdentifier];
    char v40 = HMFEqualObjects();

    if ((v40 & 1) == 0) {
      [(HMDDeviceCapabilities *)v36->_capabilities setModelParentIdentifier:v36->_modelIdentifier];
    }
    if ([v3 containsValueForKey:@"HM.rpIdentity"])
    {
      uint64_t v41 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"HM.rpIdentity"];
      rpIdentity = v36->_rpIdentity;
      v36->_rpIdentity = (HMDRPIdentity *)v41;
    }
    v36->_locallyTracked = [v3 decodeBoolForKey:@"HM.locallyTracked"];
    v36->_cloudTracked = [v3 decodeBoolForKey:@"HM.cloudTracked"];
    uint64_t v43 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"HM.sharedUserIDSIdentifier"];
    sharedUserIDSIdentifier = v36->_sharedUserIDSIdentifier;
    v36->_sharedUserIDSIdentifier = (NSUUID *)v43;

    id v15 = v46;
  }

  return v36;
}

- (BOOL)mergeObject:(id)a3
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  if (!v6) {
    goto LABEL_38;
  }
  id v7 = [(HMDDevice *)self name];
  id v8 = [v6 name];
  int v9 = [v7 isEqualToString:v8];
  char v10 = v9;
  int v11 = v9 ^ 1;

  if ((v10 & 1) == 0)
  {
    BOOL v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      id v15 = HMFGetLogIdentifier();
      id v16 = [v6 name];
      int v78 = 138543618;
      v79 = v15;
      __int16 v80 = 2112;
      v81 = v16;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Updating device name to %@", (uint8_t *)&v78, 0x16u);
    }
    int v17 = [v6 name];
    [(HMDDevice *)v13 setName:v17];
  }
  uint64_t v18 = [v6 productInfo];
  if (v18)
  {
    __int16 v19 = (void *)v18;
    id v20 = [(HMDDevice *)self productInfo];
    __int16 v21 = [v6 productInfo];
    char v22 = [v20 isEqual:v21];

    if ((v22 & 1) == 0)
    {
      uint64_t v23 = (void *)MEMORY[0x230FBD990]();
      int v24 = self;
      uint64_t v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        id v26 = HMFGetLogIdentifier();
        int v27 = [v6 productInfo];
        int v78 = 138543618;
        v79 = v26;
        __int16 v80 = 2112;
        v81 = v27;
        _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Updating device product info to %@", (uint8_t *)&v78, 0x16u);
      }
      id v28 = [v6 productInfo];
      [(HMDDevice *)v24 setProductInfo:v28];

      int v11 = 1;
    }
  }
  uint64_t v29 = [v6 version];

  if (!v29) {
    goto LABEL_22;
  }
  if ([(HMDDevice *)self isCurrentDevice])
  {
    uint64_t v30 = [(HMDDevice *)self version];
    uint64_t v31 = [v6 version];
    char v32 = [v30 isEqual:v31];

    if (v32) {
      goto LABEL_22;
    }
  }
  else
  {
    long long v33 = [v6 version];
    v34 = [(HMDDevice *)self version];
    int v35 = [v33 isGreaterThanVersion:v34];

    if (!v35) {
      goto LABEL_22;
    }
  }
  v36 = (void *)MEMORY[0x230FBD990]();
  uint64_t v37 = self;
  v38 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
  {
    v39 = HMFGetLogIdentifier();
    char v40 = [v6 version];
    int v78 = 138543618;
    v79 = v39;
    __int16 v80 = 2112;
    v81 = v40;
    _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_DEBUG, "%{public}@Updating device version to %@", (uint8_t *)&v78, 0x16u);
  }
  uint64_t v41 = [v6 version];
  [(HMDDevice *)v37 setVersion:v41];

  int v11 = 1;
LABEL_22:
  uint64_t v42 = [v6 capabilities];
  if (v42)
  {
    uint64_t v43 = (void *)v42;
    uint64_t v44 = [(HMDDevice *)self capabilities];
    v45 = [v6 capabilities];
    char v46 = [v44 isEqual:v45];

    if ((v46 & 1) == 0)
    {
      v47 = (void *)MEMORY[0x230FBD990]();
      v48 = self;
      v49 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
      {
        v50 = HMFGetLogIdentifier();
        __int16 v51 = [v6 capabilities];
        int v78 = 138543618;
        v79 = v50;
        __int16 v80 = 2112;
        v81 = v51;
        _os_log_impl(&dword_22F52A000, v49, OS_LOG_TYPE_DEBUG, "%{public}@Updating device capabilities to: %@", (uint8_t *)&v78, 0x16u);
      }
      v52 = [v6 capabilities];
      [(HMDDevice *)v48 setCapabilities:v52];

      int v11 = 1;
    }
  }
  uint64_t v53 = [v6 rpIdentity];
  if (v53)
  {
    v54 = (void *)v53;
    v55 = [v6 rpIdentity];
    id v56 = [(HMDDevice *)self rpIdentity];
    char v57 = [v55 isEqual:v56];

    if ((v57 & 1) == 0)
    {
      __int16 v58 = [v6 rpIdentity];
      [(HMDDevice *)self setRpIdentity:v58];

      int v11 = 1;
    }
  }
  v59 = (void *)MEMORY[0x263EFF9C0];
  __int16 v60 = [(HMDDevice *)self handles];
  v61 = [v59 setWithArray:v60];

  uint64_t v62 = (void *)MEMORY[0x263EFFA08];
  v63 = [v6 handles];
  v64 = [v62 setWithArray:v63];
  int v65 = [v61 mergeObject:v64];

  if (v65)
  {
    v66 = (void *)MEMORY[0x230FBD990]();
    v67 = self;
    v68 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
    {
      v69 = HMFGetLogIdentifier();
      int v78 = 138543618;
      v79 = v69;
      __int16 v80 = 2112;
      v81 = v61;
      _os_log_impl(&dword_22F52A000, v68, OS_LOG_TYPE_DEBUG, "%{public}@Updating handles: %@", (uint8_t *)&v78, 0x16u);
    }
    id v70 = [v61 allObjects];
    [(HMDDevice *)v67 setHandles:v70];

    goto LABEL_35;
  }

  if (!v11)
  {
LABEL_38:
    BOOL v76 = 0;
    goto LABEL_39;
  }
LABEL_35:
  v71 = (void *)MEMORY[0x230FBD990]();
  v72 = self;
  id v73 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
  {
    id v74 = HMFGetLogIdentifier();
    int v78 = 138543362;
    v79 = v74;
    _os_log_impl(&dword_22F52A000, v73, OS_LOG_TYPE_INFO, "%{public}@Merge resulted in changes, posting update notification", (uint8_t *)&v78, 0xCu);
  }
  id v75 = [MEMORY[0x263F08A00] defaultCenter];
  [v75 postNotificationName:@"HMDDeviceUpdatedNotification" object:v72];

  BOOL v76 = 1;
LABEL_39:

  return v76;
}

- (id)logIdentifier
{
  v2 = [(HMDDevice *)self identifier];
  id v3 = [v2 UUIDString];

  return v3;
}

- (void)setRpIdentity:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = (HMDRPIdentity *)a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = HMFGetLogIdentifier();
    int v10 = 138543618;
    int v11 = v8;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Setting RPIdentity %@", (uint8_t *)&v10, 0x16u);
  }
  os_unfair_lock_lock_with_options();
  rpIdentity = v6->_rpIdentity;
  v6->_rpIdentity = v4;

  os_unfair_lock_unlock(&v6->_lock.lock);
}

- (HMDRPIdentity)rpIdentity
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_rpIdentity;
  os_unfair_lock_unlock(&p_lock->lock);
  return v4;
}

- (id)remoteDestinationString
{
  id v3 = [(HMDDevice *)self globalHandles];
  id v4 = [v3 firstObject];

  if (v4)
  {
    v5 = [v4 destination];
  }
  else
  {
    id v6 = [(HMDDevice *)self localHandles];
    id v7 = [v6 firstObject];

    v5 = [v7 destination];
  }
  return v5;
}

- (void)setDirty:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_dirty = a3;
  os_unfair_lock_unlock(&p_lock->lock);
}

- (BOOL)isDirty
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_dirty;
  os_unfair_lock_unlock(&p_lock->lock);
  return (char)v2;
}

- (void)setCapabilities:(id)a3
{
  id v7 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (HMDDeviceCapabilities *)[v7 copy];
  capabilities = self->_capabilities;
  self->_capabilities = v4;

  if (self->_modelIdentifier)
  {
    id v6 = [(HMDDeviceCapabilities *)self->_capabilities modelParentIdentifier];

    if (!v6) {
      [(HMDDeviceCapabilities *)self->_capabilities setModelParentIdentifier:self->_modelIdentifier];
    }
  }
  os_unfair_lock_unlock(&self->_lock.lock);
}

- (HMDDeviceCapabilities)capabilities
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_capabilities;
  os_unfair_lock_unlock(&p_lock->lock);
  return v4;
}

- (BOOL)addHandle:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263EFF9C0];
  id v6 = [(HMDDevice *)self handles];
  id v7 = [v5 setWithArray:v6];

  char v8 = [v7 containsObject:v4];
  if ((v8 & 1) == 0)
  {
    [v7 addObject:v4];
    int v9 = [v7 allObjects];
    [(HMDDevice *)self setHandles:v9];

    int v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 postNotificationName:@"HMDDeviceUpdatedNotification" object:self];

    int v11 = +[HMDAccountRegistry sharedRegistry];
    [v11 updateDevice:self withDevice:self];
  }
  return v8 ^ 1;
}

- (BOOL)supportsHH2
{
  return 1;
}

- (void)updateWithDevice:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = (HMDDevice *)a3;
  v5 = v4;
  if (v4 && self != v4)
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = self;
    char v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = HMFGetLogIdentifier();
      int v11 = 138543874;
      __int16 v12 = v9;
      __int16 v13 = 2112;
      uint64_t v14 = v7;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Updating with device -- local: %@, remote: %@", (uint8_t *)&v11, 0x20u);
    }
    [(HMDDevice *)v7 mergeObject:v5];
    int v10 = +[HMDAccountRegistry sharedRegistry];
    [v10 updateDevice:v7 withDevice:v7];
  }
}

- (void)updateVersion:(id)a3
{
  id v4 = a3;
  [(HMDDevice *)self setVersion:v4];
  id v5 = +[HMDAccountRegistry sharedRegistry];
  [v5 updateDevice:self toVersion:v4];
}

- (void)setVersion:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (HMDHomeKitVersion *)[v6 copy];
  version = self->_version;
  self->_version = v4;

  os_unfair_lock_unlock(&self->_lock.lock);
}

- (HMDHomeKitVersion)version
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_version;
  os_unfair_lock_unlock(&p_lock->lock);
  return v4;
}

- (void)setProductInfo:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (HMFProductInfo *)[v6 copy];
  productInfo = self->_productInfo;
  self->_productInfo = v4;

  os_unfair_lock_unlock(&self->_lock.lock);
}

- (HMFProductInfo)productInfo
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_productInfo;
  os_unfair_lock_unlock(&p_lock->lock);
  return v4;
}

- (void)setAccount:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 primaryHandle];
  id v6 = [v4 handles];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_account, v4);
  if (v4)
  {
    if (!self->_modelIdentifier)
    {
      char v8 = [v4 modelIdentifier];
      int v9 = self;
      p_isa = (id *)&v9->super.super.isa;
      id v31 = v8;
      if (v31)
      {
        int v10 = (void *)MEMORY[0x263F08C38];
        int v11 = [(HMDDevice *)v9 identifier];
        __int16 v12 = [v11 UUIDString];
        *(void *)buf = v12;
        __int16 v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:buf count:1];
        objc_msgSend(v10, "hm_deriveUUIDFromBaseUUID:withSalts:", v31, v13);
        uint64_t v14 = (NSUUID *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        __int16 v15 = (void *)MEMORY[0x230FBD990]();
        id v16 = v9;
        uint64_t v17 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          uint64_t v18 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v18;
          _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Missing parent identifier while updating model identifier.", buf, 0xCu);
        }
        uint64_t v14 = 0;
      }

      modelIdentifier = self->_modelIdentifier;
      self->_modelIdentifier = v14;

      id v20 = [p_isa[8] modelParentIdentifier];
      BOOL v21 = v20 == 0;

      if (v21) {
        [p_isa[8] setModelParentIdentifier:self->_modelIdentifier];
      }
    }
    id v22 = v4;
    uint64_t v23 = self;
    __deregisterForAccountHandleUpdates(v23);
    int v24 = [MEMORY[0x263F08A00] defaultCenter];
    [v24 addObserver:v23 selector:sel___handleAccountHandleUpdated_ name:@"HMDAccountHandlesUpdatedNotification" object:v22];

    uint64_t v25 = (void *)MEMORY[0x263EFFA08];
    id v26 = [(NSSet *)v23->_handles allObjects];
    int v27 = __deviceHandlesForAccount(v26, v6, v5);
    uint64_t v28 = [v25 setWithArray:v27];
    handles = v23->_handles;
    v23->_handles = (NSSet *)v28;
  }
  else
  {
    __deregisterForAccountHandleUpdates(self);
  }
  os_unfair_lock_unlock(&p_lock->lock);
}

- (HMDAccount)account
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_account);
  os_unfair_lock_unlock(&p_lock->lock);
  return (HMDAccount *)WeakRetained;
}

- (void)setName:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (NSString *)[v6 copy];
  name = self->_name;
  self->_name = v4;

  os_unfair_lock_unlock(&self->_lock.lock);
}

- (NSString)name
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_name;
  os_unfair_lock_unlock(&p_lock->lock);
  return v4;
}

- (BOOL)isCurrentDevice
{
  v2 = [(HMDDevice *)self idsIdentifier];
  id v3 = +[HMDDeviceAddress localDeviceIDSIdentifier];
  char v4 = [v2 isEqual:v3];

  return v4;
}

- (NSUUID)idsIdentifier
{
  v2 = [(HMDDevice *)self localHandles];
  id v3 = [v2 firstObject];

  if (v3)
  {
    char v4 = [v3 internal];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    id v6 = v5;

    id v7 = [v6 deviceIdentifier];
  }
  else
  {
    id v7 = 0;
  }

  return (NSUUID *)v7;
}

- (void)__handleAccountHandleUpdated:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    id v8 = [(HMDDevice *)self account];

    if (v7 == v8)
    {
      int v9 = (void *)MEMORY[0x230FBD990]();
      int v10 = self;
      int v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        __int16 v12 = HMFGetLogIdentifier();
        int v19 = 138543362;
        id v20 = v12;
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Processing updated account handle", (uint8_t *)&v19, 0xCu);
      }
      __int16 v13 = [v7 handles];
      if ((objc_msgSend(v13, "hmf_isEmpty") & 1) == 0)
      {
        uint64_t v14 = [v7 primaryHandle];
        if (v14)
        {
          os_unfair_lock_lock_with_options();
          __int16 v15 = [(NSSet *)v10->_handles allObjects];
          id v16 = __deviceHandlesForAccount(v15, v13, v14);

          uint64_t v17 = [MEMORY[0x263EFFA08] setWithArray:v16];
          handles = v10->_handles;
          v10->_handles = (NSSet *)v17;

          os_unfair_lock_unlock(&v10->_lock.lock);
        }
      }
    }
  }
}

- (void)setHandles:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v12 = v4;
    id v5 = [(HMDDevice *)self account];
    id v6 = (void *)[v12 copy];
    if (v5)
    {
      id v7 = [v5 handles];
      id v8 = [v5 primaryHandle];
      uint64_t v9 = __deviceHandlesForAccount(v6, v7, v8);

      id v6 = (void *)v9;
    }
    os_unfair_lock_lock_with_options();
    int v10 = [MEMORY[0x263EFFA08] setWithArray:v6];
    handles = self->_handles;
    self->_handles = v10;

    os_unfair_lock_unlock(&self->_lock.lock);
    id v4 = v12;
  }
}

- (NSData)pushToken
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(HMDDevice *)self globalHandles];
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
        uint64_t v7 = [*(id *)(*((void *)&v10 + 1) + 8 * i) pushToken];
        if (v7)
        {
          id v8 = (void *)v7;
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
  id v8 = 0;
LABEL_11:

  return (NSData *)v8;
}

- (id)globalDestination
{
  v2 = [(HMDDevice *)self globalHandles];
  if ([v2 count])
  {
    uint64_t v3 = [v2 firstObject];
    uint64_t v4 = [v3 destination];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)globalHandles
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [(HMDDevice *)self handles];
  uint64_t v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "isGlobal", (void)v11)) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)localHandles
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [(HMDDevice *)self handles];
  uint64_t v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "isLocal", (void)v11)) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)handles
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(NSSet *)self->_handles allObjects];
  os_unfair_lock_unlock(&p_lock->lock);
  return v4;
}

- (HMDDeviceAddress)deviceAddress
{
  uint64_t v3 = [(HMDDevice *)self idsIdentifier];
  id v4 = [(HMDDevice *)self globalHandles];
  uint64_t v5 = [v4 firstObject];
  uint64_t v6 = [v5 destination];
  uint64_t v7 = +[HMDDeviceAddress addressWithIDSIdentifier:v3 idsDestination:v6];

  return (HMDDeviceAddress *)v7;
}

- (BOOL)isSameAccountWithDevice:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = (HMDDevice *)a3;
  uint64_t v5 = [(HMDDevice *)self account];
  uint64_t v6 = [(HMDDevice *)v4 account];
  uint64_t v7 = (void *)v6;
  if (v5 && v6)
  {
    char v8 = HMFEqualObjects();
  }
  else
  {
    if (v5) {
      uint64_t v9 = v4;
    }
    else {
      uint64_t v9 = self;
    }
    long long v10 = v9;
    long long v11 = (void *)MEMORY[0x230FBD990]();
    long long v12 = self;
    long long v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      long long v14 = HMFGetLogIdentifier();
      int v16 = 138543618;
      uint64_t v17 = v14;
      __int16 v18 = 2112;
      int v19 = v10;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Device is missing account %@", (uint8_t *)&v16, 0x16u);
    }

    char v8 = 0;
  }

  return v8;
}

- (BOOL)isRelatedToDevice:(id)a3
{
  id v4 = a3;
  if ([(HMDDevice *)self isEqual:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x263EFF9C0];
    uint64_t v7 = [v4 handles];
    char v8 = [v6 setWithArray:v7];

    uint64_t v9 = (void *)MEMORY[0x263EFFA08];
    long long v10 = [(HMDDevice *)self handles];
    long long v11 = [v9 setWithArray:v10];
    [v8 intersectSet:v11];

    BOOL v5 = [v8 count] != 0;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMDDevice *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v5 = [(HMDDevice *)v4 identifier];
      uint64_t v6 = [(HMDDevice *)self identifier];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(HMDDevice *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSArray)attributeDescriptions
{
  v32[7] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  id v31 = [(HMDDevice *)self identifier];
  uint64_t v30 = [v31 UUIDString];
  uint64_t v29 = objc_msgSend(v3, "initWithName:value:", @"ID");
  v32[0] = v29;
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  uint64_t v5 = [(HMDDevice *)self name];
  int v27 = [MEMORY[0x263F42610] defaultFormatter];
  uint64_t v28 = (void *)v5;
  id v26 = objc_msgSend(v4, "initWithName:value:options:formatter:", @"Nm", v5, 0);
  v32[1] = v26;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  char v7 = [(HMDDevice *)self version];
  if (v7)
  {
    char v8 = [(HMDDevice *)self version];
  }
  else
  {
    char v8 = @"Unknown";
  }
  uint64_t v23 = v8;
  uint64_t v25 = (void *)[v6 initWithName:@"Ver" value:v8];
  v32[2] = v25;
  id v9 = objc_alloc(MEMORY[0x263F424F8]);
  long long v10 = [(HMDDevice *)self capabilities];
  long long v11 = [v10 shortDescription];
  long long v12 = (void *)[v9 initWithName:@"Cap" value:v11];
  v32[3] = v12;
  id v13 = objc_alloc(MEMORY[0x263F424F8]);
  long long v14 = [(HMDDevice *)self sharedUserIDSIdentifier];
  uint64_t v15 = (void *)[v13 initWithName:@"SHID" value:v14];
  v32[4] = v15;
  id v16 = objc_alloc(MEMORY[0x263F424F8]);
  uint64_t v17 = [(HMDDevice *)self idsIdentifier];
  __int16 v18 = (void *)[v16 initWithName:@"IDS" value:v17];
  v32[5] = v18;
  id v19 = objc_alloc(MEMORY[0x263F424F8]);
  uint64_t v20 = [(HMDDevice *)self handles];
  uint64_t v21 = (void *)[v19 initWithName:@"Hndl" value:v20];
  v32[6] = v21;
  id v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:7];

  if (v7) {
  return (NSArray *)v24;
  }
}

- (NSString)shortDescription
{
  int v3 = isInternalBuild();
  id v4 = NSString;
  uint64_t v5 = [(HMDDevice *)self identifier];
  id v6 = (void *)v5;
  if (v3)
  {
    char v7 = [(HMDDevice *)self name];
    char v8 = [v4 stringWithFormat:@"%@/%@", v6, v7];
  }
  else
  {
    char v8 = [v4 stringWithFormat:@"%@", v5];
  }

  return (NSString *)v8;
}

- (HMDDevice)initWithObjectModel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 identifier];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [v4 uuid];
  }
  char v8 = v7;

  id v9 = [v4 deviceHandles];
  long long v10 = [v4 name];
  long long v11 = [v4 productInfo];
  long long v12 = [v4 version];
  id v13 = [(HMDDevice *)self initWithIdentifier:v8 handles:v9 name:v10 productInfo:v11 version:v12 capabilities:0];

  if (v13)
  {
    uint64_t v14 = [v4 uuid];
    modelIdentifier = v13->_modelIdentifier;
    v13->_modelIdentifier = (NSUUID *)v14;

    id v16 = [v4 rpIdentity];
    uint64_t v17 = [v16 copy];
    rpIdentity = v13->_rpIdentity;
    v13->_rpIdentity = (HMDRPIdentity *)v17;
  }
  return v13;
}

- (BOOL)updateBackingModel:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [(HMDDevice *)self modelIdentifier];

  if (v6
    && ([v5 modelID],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [(HMDDevice *)self modelIdentifier],
        char v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v7 isEqual:v8],
        v8,
        v7,
        (v9 & 1) == 0))
  {
    v34 = (HMDDevice *)_HMFPreconditionFailure();
    return [(HMDDevice *)v34 backingModelType];
  }
  else
  {
    if ([(HMDDevice *)self isCurrentDevice])
    {
      long long v10 = [(HMDDevice *)self capabilities];

      if (!v10)
      {
        long long v11 = +[HMDDeviceCapabilities deviceCapabilities];
        [(HMDDevice *)self setCapabilities:v11];
      }
    }
    long long v12 = [(HMDDevice *)self identifier];
    id v13 = [v5 identifier];
    char v14 = HMFEqualObjects();

    if ((v14 & 1) == 0) {
      [v5 setIdentifier:v12];
    }

    uint64_t v15 = [(HMDDevice *)self name];
    id v16 = [v5 name];
    char v17 = HMFEqualObjects();

    if ((v17 & 1) == 0) {
      [v5 setName:v15];
    }

    __int16 v18 = [(HMDDevice *)self handles];
    id v19 = [v5 handles];
    uint64_t v20 = [v19 count];
    if (v20 != [v18 count]
      || ([MEMORY[0x263EFFA08] setWithArray:v19],
          uint64_t v21 = objc_claimAutoreleasedReturnValue(),
          [MEMORY[0x263EFFA08] setWithArray:v18],
          id v22 = objc_claimAutoreleasedReturnValue(),
          char v23 = [v21 isEqualToSet:v22],
          v22,
          v21,
          (v23 & 1) == 0))
    {
      [v5 setHandles:v18];
    }

    id v24 = [(HMDDevice *)self rpIdentity];
    if (v24)
    {
      uint64_t v25 = [v5 rpIdentity];
      char v26 = HMFEqualObjects();

      if ((v26 & 1) == 0) {
        [v5 setRpIdentity:v24];
      }
    }

    int v27 = [(HMDDevice *)self productInfo];
    uint64_t v28 = [v5 productInfo];
    char v29 = HMFEqualObjects();

    if ((v29 & 1) == 0) {
      [v5 setProductInfo:v27];
    }

    uint64_t v30 = [(HMDDevice *)self version];
    id v31 = [v5 version];
    char v32 = HMFEqualObjects();

    if ((v32 & 1) == 0) {
      [v5 setVersion:v30];
    }

    return 1;
  }
}

- (Protocol)backingModelType
{
  return (Protocol *)&unk_26E4F5978;
}

- (HMDDevice)initWithBackingModel:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  id v6 = [v4 name];
  id v7 = [v4 productInfo];
  char v8 = [v4 version];
  char v9 = [v4 handles];
  long long v10 = [v4 modelID];
  long long v11 = [v4 rpIdentity];

  long long v12 = [(HMDDevice *)self initWithIdentifier:v5 handles:v9 name:v6 productInfo:v7 version:v8 capabilities:0];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_modelIdentifier, v10);
    objc_storeStrong((id *)&v13->_rpIdentity, v11);
  }

  return v13;
}

- (HMDDevice)initWithDeviceAddress:(id)a3
{
  v13[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 idsDestination];
  id v6 = +[HMDDeviceHandle deviceHandleForDestination:v5];

  id v7 = [v4 idsIdentifier];
  char v8 = +[HMDDeviceHandle deviceHandleForDeviceIdentifier:v7];

  if (([v6 isGlobal] & 1) == 0)
  {
    _HMFPreconditionFailure();
LABEL_5:
    _HMFPreconditionFailure();
  }
  if (([v8 isLocal] & 1) == 0) {
    goto LABEL_5;
  }
  char v9 = [v6 identifier];
  v13[0] = v6;
  v13[1] = v8;
  long long v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
  long long v11 = [(HMDDevice *)self initWithIdentifier:v9 handles:v10 name:0 productInfo:0 version:0 capabilities:0];

  return v11;
}

- (HMDDevice)initWithIdentifier:(id)a3 handles:(id)a4 name:(id)a5 productInfo:(id)a6 version:(id)a7 capabilities:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (!v14)
  {
    v34 = (HMDDevice *)_HMFPreconditionFailure();
    [(HMDDevice *)v34 init];
  }
  uint64_t v20 = v19;
  v36.receiver = self;
  v36.super_class = (Class)HMDDevice;
  uint64_t v21 = [(HMDDevice *)&v36 init];
  id v22 = v21;
  if (v21)
  {
    v21->_lock.lock._os_unfair_lock_opaque = 0;
    uint64_t v23 = [v14 copy];
    identifier = v22->_identifier;
    v22->_identifier = (NSUUID *)v23;

    uint64_t v25 = [MEMORY[0x263EFFA08] setWithArray:v15];
    handles = v22->_handles;
    v22->_handles = (NSSet *)v25;

    uint64_t v27 = [v16 copy];
    name = v22->_name;
    v22->_name = (NSString *)v27;

    uint64_t v29 = [v17 copy];
    productInfo = v22->_productInfo;
    v22->_productInfo = (HMFProductInfo *)v29;

    objc_storeStrong((id *)&v22->_version, a7);
    uint64_t v31 = [v20 copy];
    capabilities = v22->_capabilities;
    v22->_capabilities = (HMDDeviceCapabilities *)v31;
  }
  return v22;
}

- (HMDDevice)init
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t25_168458 != -1) {
    dispatch_once(&logCategory__hmf_once_t25_168458, &__block_literal_global_168459);
  }
  v2 = (void *)logCategory__hmf_once_v26_168460;
  return v2;
}

void __24__HMDDevice_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v26_168460;
  logCategory__hmf_once_v26_168460 = v0;
}

+ (HMDDevice)deviceWithHandle:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  id v6 = [v4 identifier];
  v10[0] = v4;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];

  char v8 = (void *)[v5 initWithIdentifier:v6 handles:v7 name:0 productInfo:0 version:0 capabilities:0];
  return (HMDDevice *)v8;
}

+ (HMDDevice)deviceWithDestination:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[HMDDeviceHandle deviceHandleForDestination:v4];
  if (v5)
  {
    id v6 = [a1 deviceWithHandle:v5];
  }
  else
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = a1;
    char v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      long long v10 = HMFGetLogIdentifier();
      int v12 = 138543618;
      id v13 = v10;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Invalid destination: %@", (uint8_t *)&v12, 0x16u);
    }
    id v6 = 0;
  }

  return (HMDDevice *)v6;
}

@end