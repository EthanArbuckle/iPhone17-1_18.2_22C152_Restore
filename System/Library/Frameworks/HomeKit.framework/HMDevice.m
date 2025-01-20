@interface HMDevice
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
+ (id)shortDescription;
- (BOOL)isCurrentDevice;
- (BOOL)isEqual:(id)a3;
- (BOOL)mergeFromNewObject:(id)a3;
- (BOOL)supportsHH2;
- (HMDevice)init;
- (HMDevice)initWithCoder:(id)a3;
- (HMDevice)initWithUUID:(id)a3 name:(id)a4 isCurrentDevice:(BOOL)a5;
- (HMFKey)rapportIRK;
- (HMFProductInfo)productInfo;
- (NSArray)attributeDescriptions;
- (NSString)description;
- (NSString)idsDestination;
- (NSString)name;
- (NSString)shortDescription;
- (NSUUID)idsIdentifier;
- (NSUUID)uniqueIdentifier;
- (NSUUID)uuid;
- (id)IDSDestinationForIDSService:(id)a3;
- (id)IDSDeviceForIDSService:(id)a3;
- (id)hmmmMessageDestination;
- (id)logIdentifier;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setIdsDestination:(id)a3;
- (void)setIdsIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setProductInfo:(id)a3;
- (void)setRapportIRK:(id)a3;
- (void)setSupportsHH2:(BOOL)a3;
@end

@implementation HMDevice

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_idsDestination, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_rapportIRK, 0);
  objc_storeStrong((id *)&self->_productInfo, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (BOOL)isCurrentDevice
{
  return self->_currentDevice;
}

- (id)logIdentifier
{
  v2 = [(HMDevice *)self uuid];
  v3 = [v2 UUIDString];

  return v3;
}

- (NSArray)attributeDescriptions
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v5 = [(HMDevice *)self uuid];
  v6 = (void *)[v4 initWithName:@"UUID" value:v5];
  [v3 addObject:v6];

  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  v8 = [(HMDevice *)self uniqueIdentifier];
  v9 = (void *)[v7 initWithName:@"Identifier" value:v8];
  [v3 addObject:v9];

  id v10 = objc_alloc(MEMORY[0x1E4F653F8]);
  v11 = [(HMDevice *)self name];
  v12 = (void *)[v10 initWithName:@"Name" value:v11];
  [v3 addObject:v12];

  id v13 = objc_alloc(MEMORY[0x1E4F653F8]);
  v14 = [(HMDevice *)self productInfo];
  v15 = (void *)[v13 initWithName:@"Product Info" value:v14];
  [v3 addObject:v15];

  id v16 = objc_alloc(MEMORY[0x1E4F653F8]);
  v17 = [(HMDevice *)self rapportIRK];
  v18 = (void *)[v16 initWithName:@"Rapport IRK" value:v17];
  [v3 addObject:v18];

  if ([(HMDevice *)self isCurrentDevice])
  {
    id v19 = objc_alloc(MEMORY[0x1E4F653F8]);
    [(HMDevice *)self isCurrentDevice];
    v20 = HMFBooleanToString();
    v21 = (void *)[v19 initWithName:@"Is Current Device" value:v20];
    [v3 addObject:v21];
  }
  if ([(HMDevice *)self supportsHH2])
  {
    id v22 = objc_alloc(MEMORY[0x1E4F653F8]);
    [(HMDevice *)self supportsHH2];
    v23 = HMFBooleanToString();
    v24 = (void *)[v22 initWithName:@"Supports HH2" value:v23];
    [v3 addObject:v24];
  }
  v25 = (void *)[v3 copy];

  return (NSArray *)v25;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (NSString)shortDescription
{
  v2 = [(HMDevice *)self uniqueIdentifier];
  v3 = [v2 UUIDString];

  return (NSString *)v3;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
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
    uint64_t v7 = [v6 name];
    v8 = [(HMDevice *)self name];
    v59 = (void *)v7;
    char v9 = HMFEqualObjects();

    if ((v9 & 1) == 0)
    {
      id v10 = (void *)MEMORY[0x19F3A64A0]();
      v11 = self;
      v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        id v13 = HMFGetLogIdentifier();
        v14 = [(HMDevice *)v11 name];
        *(_DWORD *)buf = 138543874;
        v61 = v13;
        __int16 v62 = 2112;
        v63 = v14;
        __int16 v64 = 2112;
        uint64_t v65 = v7;
        _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_INFO, "%{public}@Updating name from %@ to %@", buf, 0x20u);
      }
      [(HMDevice *)v11 setName:v7];
    }
    uint64_t v15 = [v6 productInfo];
    id v16 = [(HMDevice *)self productInfo];
    char v17 = HMFEqualObjects();

    if (v17)
    {
      char v18 = v9 ^ 1;
    }
    else
    {
      id v19 = (void *)MEMORY[0x19F3A64A0]();
      v20 = self;
      v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        id v22 = HMFGetLogIdentifier();
        v23 = [(HMDevice *)v20 productInfo];
        *(_DWORD *)buf = 138543874;
        v61 = v22;
        __int16 v62 = 2112;
        v63 = v23;
        __int16 v64 = 2112;
        uint64_t v65 = v15;
        _os_log_impl(&dword_19D1A8000, v21, OS_LOG_TYPE_INFO, "%{public}@Updating productInfo from %@ to %@", buf, 0x20u);
      }
      [(HMDevice *)v20 setProductInfo:v15];
      char v18 = 1;
    }
    uint64_t v24 = [v6 supportsHH2];
    if (v24 != [(HMDevice *)self supportsHH2])
    {
      v25 = (void *)MEMORY[0x19F3A64A0]();
      v26 = self;
      v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        v28 = HMFGetLogIdentifier();
        [(HMDevice *)v26 supportsHH2];
        HMFBooleanToString();
        v29 = v57 = v25;
        HMFBooleanToString();
        v31 = uint64_t v30 = v15;
        *(_DWORD *)buf = 138543874;
        v61 = v28;
        __int16 v62 = 2112;
        v63 = v29;
        __int16 v64 = 2112;
        uint64_t v65 = (uint64_t)v31;
        _os_log_impl(&dword_19D1A8000, v27, OS_LOG_TYPE_INFO, "%{public}@Updating supportsHH2 from %@ to %@", buf, 0x20u);

        uint64_t v15 = v30;
        v25 = v57;
      }
      [(HMDevice *)v26 setSupportsHH2:v24];
      char v18 = 1;
    }
    v58 = (void *)v15;
    v32 = [v6 rapportIRK];
    v33 = [(HMDevice *)self rapportIRK];
    char v34 = HMFEqualObjects();

    if ((v34 & 1) == 0)
    {
      v35 = (void *)MEMORY[0x19F3A64A0]();
      v36 = self;
      v37 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        v38 = HMFGetLogIdentifier();
        v39 = [(HMDevice *)v36 rapportIRK];
        *(_DWORD *)buf = 138543874;
        v61 = v38;
        __int16 v62 = 2112;
        v63 = v39;
        __int16 v64 = 2112;
        uint64_t v65 = (uint64_t)v32;
        _os_log_impl(&dword_19D1A8000, v37, OS_LOG_TYPE_INFO, "%{public}@Updating rapportIRK from %@ to %@", buf, 0x20u);
      }
      [(HMDevice *)v36 setRapportIRK:v32];
      char v18 = 1;
    }
    v40 = [v6 idsIdentifier];
    v41 = [(HMDevice *)self idsIdentifier];
    char v42 = HMFEqualObjects();

    if ((v42 & 1) == 0)
    {
      v43 = (void *)MEMORY[0x19F3A64A0]();
      v44 = self;
      v45 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        v46 = HMFGetLogIdentifier();
        v47 = [(HMDevice *)v44 idsIdentifier];
        *(_DWORD *)buf = 138543874;
        v61 = v46;
        __int16 v62 = 2112;
        v63 = v47;
        __int16 v64 = 2112;
        uint64_t v65 = (uint64_t)v40;
        _os_log_impl(&dword_19D1A8000, v45, OS_LOG_TYPE_INFO, "%{public}@Updating idsIdentifier from %@ to %@", buf, 0x20u);
      }
      [(HMDevice *)v44 setIdsIdentifier:v40];
      char v18 = 1;
    }
    v48 = [v6 idsDestination];
    v49 = [(HMDevice *)self idsDestination];
    char v50 = HMFEqualObjects();

    if ((v50 & 1) == 0)
    {
      v51 = (void *)MEMORY[0x19F3A64A0]();
      v52 = self;
      v53 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        v54 = HMFGetLogIdentifier();
        v55 = [(HMDevice *)v52 idsDestination];
        *(_DWORD *)buf = 138543874;
        v61 = v54;
        __int16 v62 = 2112;
        v63 = v55;
        __int16 v64 = 2112;
        uint64_t v65 = (uint64_t)v48;
        _os_log_impl(&dword_19D1A8000, v53, OS_LOG_TYPE_INFO, "%{public}@Updating idsDestination from %@ to %@", buf, 0x20u);
      }
      [(HMDevice *)v52 setIdsDestination:v48];
      char v18 = 1;
    }
  }
  else
  {
    char v18 = 0;
  }

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMDevice *)self uuid];
  [v4 encodeObject:v5 forKey:@"HM.identifier"];

  id v6 = [(HMDevice *)self name];
  [v4 encodeObject:v6 forKey:@"HM.name"];

  uint64_t v7 = [(HMDevice *)self productInfo];
  [v4 encodeObject:v7 forKey:@"HM.productInfo"];

  objc_msgSend(v4, "encodeBool:forKey:", -[HMDevice isCurrentDevice](self, "isCurrentDevice"), @"HM.currentDevice");
  objc_msgSend(v4, "encodeBool:forKey:", -[HMDevice supportsHH2](self, "supportsHH2"), @"HM.supportsHH2");
  v8 = [(HMDevice *)self rapportIRK];
  [v4 encodeObject:v8 forKey:@"HM.rpDeviceIRK"];

  char v9 = [(HMDevice *)self idsIdentifier];
  [v4 encodeObject:v9 forKey:@"HM.idsIdentifier"];

  id v10 = [(HMDevice *)self idsDestination];
  [v4 encodeObject:v10 forKey:@"HM.idsDestination"];
}

- (HMDevice)initWithCoder:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.identifier"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.name"];
  uint64_t v7 = [v4 decodeBoolForKey:@"HM.currentDevice"];
  if (v5)
  {
    v8 = [(HMDevice *)self initWithUUID:v5 name:v6 isCurrentDevice:v7];
    char v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.productInfo"];
    [(HMDevice *)v8 setProductInfo:v9];

    -[HMDevice setSupportsHH2:](v8, "setSupportsHH2:", [v4 decodeBoolForKey:@"HM.supportsHH2"]);
    id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.rpDeviceIRK"];
    [(HMDevice *)v8 setRapportIRK:v10];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.idsIdentifier"];
    [(HMDevice *)v8 setIdsIdentifier:v11];

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.idsDestination"];
    [(HMDevice *)v8 setIdsDestination:v12];

    id v13 = v8;
    v14 = v13;
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x19F3A64A0](v7);
    id v13 = self;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      char v17 = HMFGetLogIdentifier();
      int v19 = 138543874;
      v20 = v17;
      __int16 v21 = 2112;
      uint64_t v22 = 0;
      __int16 v23 = 2112;
      uint64_t v24 = v6;
      _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded UUID: %@ name: %@", (uint8_t *)&v19, 0x20u);
    }
    v14 = 0;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
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
  if (v6)
  {
    uint64_t v7 = [(HMDevice *)self uuid];
    v8 = [v6 uuid];
    if (![v7 isEqual:v8]) {
      goto LABEL_13;
    }
    char v9 = [(HMDevice *)self name];
    id v10 = [v6 name];
    int v11 = HMFEqualObjects();

    if (!v11) {
      goto LABEL_13;
    }
    v12 = [(HMDevice *)self productInfo];
    id v13 = [v6 productInfo];
    int v14 = HMFEqualObjects();

    if (!v14) {
      goto LABEL_13;
    }
    int v15 = [(HMDevice *)self isCurrentDevice];
    if (v15 != [v6 isCurrentDevice]) {
      goto LABEL_13;
    }
    int v16 = [(HMDevice *)self supportsHH2];
    if (v16 != [v6 supportsHH2]) {
      goto LABEL_13;
    }
    char v17 = [(HMDevice *)self rapportIRK];
    char v18 = [v6 rapportIRK];
    int v19 = HMFEqualObjects();

    if (!v19) {
      goto LABEL_13;
    }
    v20 = [(HMDevice *)self idsIdentifier];
    __int16 v21 = [v6 idsIdentifier];
    int v22 = HMFEqualObjects();

    if (v22)
    {
      __int16 v23 = [(HMDevice *)self idsDestination];
      uint64_t v24 = [v6 idsDestination];
      char v25 = HMFEqualObjects();
    }
    else
    {
LABEL_13:
      char v25 = 0;
    }
  }
  else
  {
    char v25 = 0;
  }

  return v25;
}

- (unint64_t)hash
{
  v2 = [(HMDevice *)self uuid];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)setIdsDestination:(id)a3
{
  id v4 = (NSString *)a3;
  os_unfair_lock_lock_with_options();
  idsDestination = self->_idsDestination;
  self->_idsDestination = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)idsDestination
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_idsDestination;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setIdsIdentifier:(id)a3
{
  id v4 = (NSUUID *)a3;
  os_unfair_lock_lock_with_options();
  idsIdentifier = self->_idsIdentifier;
  self->_idsIdentifier = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSUUID)idsIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_idsIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setRapportIRK:(id)a3
{
  id v4 = (HMFKey *)a3;
  os_unfair_lock_lock_with_options();
  rapportIRK = self->_rapportIRK;
  self->_rapportIRK = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMFKey)rapportIRK
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_rapportIRK;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setSupportsHH2:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_supportsHH2 = a3;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)supportsHH2
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_supportsHH2;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setProductInfo:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = (HMFProductInfo *)[v6 copy];
  productInfo = self->_productInfo;
  self->_productInfo = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMFProductInfo)productInfo
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_productInfo;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)setName:(id)a3
{
  id v4 = (NSString *)a3;
  os_unfair_lock_lock_with_options();
  name = self->_name;
  self->_name = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)name
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_name;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSUUID)uniqueIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uniqueIdentifier = self->_uniqueIdentifier;
  if (!uniqueIdentifier)
  {
    objc_msgSend(MEMORY[0x1E4F29128], "hm_deriveUUIDFromBaseUUID:", self->_uuid);
    v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_uniqueIdentifier;
    self->_uniqueIdentifier = v5;

    uniqueIdentifier = self->_uniqueIdentifier;
  }
  uint64_t v7 = uniqueIdentifier;
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (HMDevice)initWithUUID:(id)a3 name:(id)a4 isCurrentDevice:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HMDevice;
  id v10 = [(HMDevice *)&v17 init];
  int v11 = v10;
  if (v10)
  {
    v10->_lock._os_unfair_lock_opaque = 0;
    uint64_t v12 = [v8 copy];
    uuid = v11->_uuid;
    v11->_uuid = (NSUUID *)v12;

    uint64_t v14 = [v9 copy];
    name = v11->_name;
    v11->_name = (NSString *)v14;

    v11->_currentDevice = a5;
  }

  return v11;
}

- (HMDevice)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t22 != -1) {
    dispatch_once(&logCategory__hmf_once_t22, &__block_literal_global_3776);
  }
  v2 = (void *)logCategory__hmf_once_v23;

  return v2;
}

uint64_t __23__HMDevice_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v23;
  logCategory__hmf_once___int16 v23 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)IDSDestinationForIDSService:(id)a3
{
  v21[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDevice *)self idsDestination];
  if (v5 && IDSFoundationLibraryCore())
  {
    uint64_t v15 = 0;
    int v16 = &v15;
    uint64_t v17 = 0x2050000000;
    id v6 = (void *)getIDSDestinationClass_softClass;
    uint64_t v18 = getIDSDestinationClass_softClass;
    if (!getIDSDestinationClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getIDSDestinationClass_block_invoke;
      v20 = &unk_1E5943DD8;
      v21[0] = &v15;
      __getIDSDestinationClass_block_invoke((uint64_t)buf);
      id v6 = (void *)v16[3];
    }
    id v7 = v6;
    _Block_object_dispose(&v15, 8);
    id v8 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObject:", v5, v15);
    id v9 = [v7 destinationWithStrings:v8];
  }
  else
  {
    id v10 = (void *)MEMORY[0x19F3A64A0]();
    int v11 = self;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v5;
      *(_WORD *)&buf[22] = 2112;
      v20 = v4;
      LOWORD(v21[0]) = 2112;
      *(void *)((char *)v21 + 2) = v11;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to get IDSDestination from destination: (%@) for service: (%@) on device: %@", buf, 0x2Au);
    }
    id v9 = 0;
  }

  return v9;
}

- (id)IDSDeviceForIDSService:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDevice *)self idsIdentifier];
  if (!v5) {
    goto LABEL_14;
  }
  if (!IDSLibraryCore_frameworkLibrary)
  {
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    __int16 v21 = __IDSLibraryCore_block_invoke;
    int v22 = &__block_descriptor_40_e5_v8__0l;
    uint64_t v23 = 0;
    long long v25 = xmmword_1E593E778;
    uint64_t v26 = 0;
    IDSLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (IDSLibraryCore_frameworkLibrary)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = objc_msgSend(v4, "devices", 0);
    id v7 = (id)[v6 countByEnumeratingWithState:&v15 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          int v11 = [v10 uniqueIDOverride];
          uint64_t v12 = [v5 UUIDString];
          char v13 = [v11 isEqualToString:v12];

          if (v13)
          {
            id v7 = v10;
            goto LABEL_16;
          }
        }
        id v7 = (id)[v6 countByEnumeratingWithState:&v15 objects:v24 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_16:
  }
  else
  {
LABEL_14:
    id v7 = 0;
  }

  return v7;
}

- (id)hmmmMessageDestination
{
  uint64_t v3 = [HMMMMessageDestination alloc];
  id v4 = [(HMDevice *)self idsIdentifier];
  v5 = [v4 UUIDString];
  id v6 = [(HMDevice *)self idsDestination];
  id v7 = [(HMMMMessageDestination *)v3 initWithIDSIdentifier:v5 idsTokenURI:v6];

  return v7;
}

@end