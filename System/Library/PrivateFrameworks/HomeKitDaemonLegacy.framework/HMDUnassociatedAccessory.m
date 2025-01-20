@interface HMDUnassociatedAccessory
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
+ (id)otherAccessoryCategory;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (BOOL)isKnownToSystemCommissioner;
- (BOOL)isReachable;
- (BOOL)requiresThreadRouter;
- (BOOL)supportsCHIP;
- (HMAccessoryCategory)category;
- (HMDAccessoryAdvertisement)accessoryAdvertisement;
- (HMDUnassociatedAccessory)init;
- (HMDUnassociatedAccessory)initWithCoder:(id)a3;
- (HMDUnassociatedAccessory)initWithIdentifier:(id)a3 name:(id)a4 category:(id)a5 messageDispatcher:(id)a6;
- (HMFMessageDispatcher)messageDispatcher;
- (NSData)rootPublicKey;
- (NSNumber)nodeID;
- (NSNumber)productID;
- (NSNumber)vendorID;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)identifier;
- (NSString)name;
- (NSString)serialNumber;
- (NSUUID)commissioningID;
- (NSUUID)uuid;
- (id)descriptionWithPointer:(BOOL)a3 additionalDescription:(id)a4;
- (id)dumpDescription;
- (id)messageDestination;
- (id)shortDescription;
- (int64_t)associationOptions;
- (unint64_t)hash;
- (unint64_t)transportTypes;
- (void)_handleIdentify:(id)a3;
- (void)_registerForMessages;
- (void)associateWithAccessoryAdvertisement:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)identifyWithCompletionHandler:(id)a3;
- (void)setAccessoryAdvertisement:(id)a3;
- (void)setCategory:(id)a3;
- (void)setCommissioningID:(id)a3;
- (void)setName:(id)a3;
- (void)setProductID:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setUUID:(id)a3;
- (void)setVendorID:(id)a3;
- (void)updateCategoryWithCategoryIdentifier:(id)a3;
@end

@implementation HMDUnassociatedAccessory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_commissioningID, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_nodeID, 0);
  objc_storeStrong((id *)&self->_rootPublicKey, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_accessoryAdvertisement, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)setProductID:(id)a3
{
}

- (NSNumber)productID
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setVendorID:(id)a3
{
}

- (NSNumber)vendorID
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setCommissioningID:(id)a3
{
}

- (NSUUID)commissioningID
{
  return (NSUUID *)objc_getProperty(self, a2, 96, 1);
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)serialNumber
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (NSNumber)nodeID
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (NSData)rootPublicKey
{
  return (NSData *)objc_getProperty(self, a2, 72, 1);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return self->_messageDispatcher;
}

- (void)setAccessoryAdvertisement:(id)a3
{
}

- (int64_t)associationOptions
{
  return self->_associationOptions;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUUID:(id)a3
{
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (void)encodeWithCoder:(id)a3
{
  id v20 = a3;
  if ((objc_msgSend(v20, "hmd_isForXPCTransport") & 1) == 0)
  {
    v4 = [(HMDUnassociatedAccessory *)self identifier];
    [v20 encodeObject:v4 forKey:@"accessoryServerIdentifier"];
  }
  v5 = [(HMDUnassociatedAccessory *)self name];
  [v20 encodeObject:v5 forKey:@"accessoryName"];

  v6 = [(HMDUnassociatedAccessory *)self category];
  [v20 encodeObject:v6 forKey:@"HM.accessoryCategory"];

  v7 = [(HMDUnassociatedAccessory *)self uuid];
  v8 = [v7 UUIDString];
  [v20 encodeObject:v8 forKey:@"accessoryUUID"];

  [v20 encodeBool:0 forKey:@"isBridged"];
  [v20 encodeBool:0 forKey:@"paired"];
  objc_msgSend(v20, "encodeBool:forKey:", -[HMDUnassociatedAccessory isReachable](self, "isReachable"), @"reachable");
  int64_t v9 = [(HMDUnassociatedAccessory *)self associationOptions];
  [v20 encodeInteger:v9 forKey:*MEMORY[0x1E4F2C128]];
  if (objc_msgSend(v20, "hmd_isForXPCTransportEntitledForSPIAccess")) {
    objc_msgSend(v20, "encodeInteger:forKey:", -[HMDUnassociatedAccessory transportTypes](self, "transportTypes"), @"HM.accessoryTransportTypes");
  }
  if (objc_msgSend(v20, "hmd_isForXPCTransportEntitledForSPIAccess"))
  {
    BOOL v10 = [(HMDUnassociatedAccessory *)self supportsCHIP];
    [v20 encodeBool:v10 forKey:*MEMORY[0x1E4F2C788]];
    BOOL v11 = [(HMDUnassociatedAccessory *)self isKnownToSystemCommissioner];
    [v20 encodeBool:v11 forKey:*MEMORY[0x1E4F2C408]];
    v12 = [(HMDUnassociatedAccessory *)self rootPublicKey];
    [v20 encodeObject:v12 forKey:*MEMORY[0x1E4F2C568]];

    v13 = [(HMDUnassociatedAccessory *)self nodeID];
    [v20 encodeObject:v13 forKey:*MEMORY[0x1E4F2C2B0]];

    v14 = [(HMDUnassociatedAccessory *)self commissioningID];
    [v20 encodeObject:v14 forKey:*MEMORY[0x1E4F2C2A8]];

    v15 = [(HMDUnassociatedAccessory *)self serialNumber];
    [v20 encodeObject:v15 forKey:@"HM.serialNumber"];

    v16 = [(HMDUnassociatedAccessory *)self productID];
    [v20 encodeObject:v16 forKey:*MEMORY[0x1E4F2C4F8]];

    v17 = [(HMDUnassociatedAccessory *)self vendorID];
    [v20 encodeObject:v17 forKey:*MEMORY[0x1E4F2C8B0]];

    BOOL v18 = [(HMDUnassociatedAccessory *)self requiresThreadRouter];
    [v20 encodeBool:v18 forKey:*MEMORY[0x1E4F2C548]];
    v19 = [(HMDUnassociatedAccessory *)self identifier];
    [v20 encodeObject:v19 forKey:@"accessoryServerIdentifier"];
  }
}

- (HMDUnassociatedAccessory)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessoryServerIdentifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessoryName"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.accessoryCategory"];
  v8 = [(HMDUnassociatedAccessory *)self initWithIdentifier:v5 name:v6 category:v7 messageDispatcher:0];
  if (v8)
  {
    int64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessoryUUID"];
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v9];
    uuid = v8->_uuid;
    v8->_uuid = (NSUUID *)v10;
  }
  return v8;
}

- (id)messageDestination
{
  id v3 = objc_alloc(MEMORY[0x1E4F65488]);
  id v4 = [(HMDUnassociatedAccessory *)self uuid];
  v5 = (void *)[v3 initWithTarget:v4];

  return v5;
}

- (HMDAccessoryAdvertisement)accessoryAdvertisement
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = self->_accessoryAdvertisement;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)associateWithAccessoryAdvertisement:(id)a3
{
  id v4 = (HMDAccessoryAdvertisement *)a3;
  os_unfair_recursive_lock_lock_with_options();
  accessoryAdvertisement = self->_accessoryAdvertisement;
  self->_accessoryAdvertisement = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)identifyWithCompletionHandler:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v10 = 138543362;
    BOOL v11 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@The accessory does not support identify", (uint8_t *)&v10, 0xCu);
  }
  if (v4)
  {
    int64_t v9 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    v4[2](v4, v9);
  }
}

- (void)_handleIdentify:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v14 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Identifying", buf, 0xCu);
  }
  objc_initWeak((id *)buf, v6);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__HMDUnassociatedAccessory__handleIdentify___block_invoke;
  v10[3] = &unk_1E6A17758;
  objc_copyWeak(&v12, (id *)buf);
  id v9 = v4;
  id v11 = v9;
  [(HMDUnassociatedAccessory *)v6 identifyWithCompletionHandler:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

void __44__HMDUnassociatedAccessory__handleIdentify___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = WeakRetained;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = HMFGetLogIdentifier();
    int v11 = 138543618;
    id v12 = v8;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Identified with error: %@", (uint8_t *)&v11, 0x16u);
  }
  id v9 = [*(id *)(a1 + 32) responseHandler];

  if (v9)
  {
    int v10 = [*(id *)(a1 + 32) responseHandler];
    ((void (**)(void, id, void))v10)[2](v10, v3, 0);
  }
}

- (BOOL)isReachable
{
  return 1;
}

- (void)updateCategoryWithCategoryIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v10 = +[HMDHAPMetadata getSharedInstance];
    v5 = [v10 categoryForIdentifier:v4];

    if (!v5)
    {
      v5 = [v10 categoryForOther];
    }
    id v6 = objc_alloc(MEMORY[0x1E4F2E520]);
    v7 = [v5 uuidStr];
    v8 = [v5 catDescription];
    id v9 = (void *)[v6 initWithType:v7 name:v8];

    [(HMDUnassociatedAccessory *)self setCategory:v9];
  }
}

- (void)setCategory:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    os_unfair_recursive_lock_lock_with_options();
    if (HMFEqualObjects())
    {
      os_unfair_recursive_lock_unlock();
    }
    else
    {
      v5 = [MEMORY[0x1E4F2E7B0] cachedInstanceForHMAccessoryCategory:v4];
      category = self->_category;
      self->_category = v5;

      os_unfair_recursive_lock_unlock();
      v7 = encodeRootObjectForIncomingXPCMessage(v4, 0);
      v8 = (void *)MEMORY[0x1E4F65480];
      id v9 = [(HMDUnassociatedAccessory *)self messageDestination];
      __int16 v13 = @"kAccessoryCategory";
      v14[0] = v7;
      id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
      int v11 = [v8 messageWithName:@"kAccessoryCategoryChangedNotificationKey" destination:v9 payload:v10];

      id v12 = [(HMDUnassociatedAccessory *)self messageDispatcher];
      [v12 sendMessage:v11 completionHandler:0];
    }
  }
}

- (HMAccessoryCategory)category
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = self->_category;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setName:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    os_unfair_recursive_lock_lock_with_options();
    if (HMFEqualObjects())
    {
      os_unfair_recursive_lock_unlock();
    }
    else
    {
      v5 = (NSString *)[v4 copy];
      name = self->_name;
      self->_name = v5;

      os_unfair_recursive_lock_unlock();
      v7 = (void *)MEMORY[0x1E4F65480];
      v8 = [(HMDUnassociatedAccessory *)self messageDestination];
      id v12 = @"kAccessoryName";
      v13[0] = v4;
      id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
      id v10 = [v7 messageWithName:@"kAccessoryNameChangedNotificationKey" destination:v8 payload:v9];

      int v11 = [(HMDUnassociatedAccessory *)self messageDispatcher];
      [v11 sendMessage:v10 completionHandler:0];
    }
  }
}

- (NSString)name
{
  os_unfair_recursive_lock_lock_with_options();
  id v3 = self->_name;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)_registerForMessages
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDUnassociatedAccessory *)self messageDispatcher];
  id v4 = +[HMDXPCMessagePolicy policyWithEntitlements:1];
  v6[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [v3 registerForMessage:@"kIdentifyAccessoryRequestKey" receiver:self policies:v5 selector:sel__handleIdentify_];
}

- (id)dumpDescription
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  id v4 = NSString;
  v5 = [(HMDUnassociatedAccessory *)self name];
  id v6 = [(HMDUnassociatedAccessory *)self uuid];
  v7 = [v6 UUIDString];
  v8 = [(HMDUnassociatedAccessory *)self identifier];
  id v9 = [v4 stringWithFormat:@"Accessory '%@': uuid %@  identifier %@", v5, v7, v8];

  [v3 setObject:v9 forKey:*MEMORY[0x1E4F64EA0]];
  return v3;
}

- (NSString)description
{
  return (NSString *)[(HMDUnassociatedAccessory *)self descriptionWithPointer:0 additionalDescription:0];
}

- (NSString)debugDescription
{
  return (NSString *)[(HMDUnassociatedAccessory *)self descriptionWithPointer:1 additionalDescription:0];
}

- (id)descriptionWithPointer:(BOOL)a3 additionalDescription:(id)a4
{
  BOOL v4 = a3;
  id v26 = a4;
  id v6 = NSString;
  v25 = [(id)objc_opt_class() shortDescription];
  BOOL v22 = v4;
  id v20 = v6;
  if (v4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @" %p", self);
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = &stru_1F2C9F1A8;
  }
  v21 = [(HMDUnassociatedAccessory *)self uuid];
  v24 = [v21 UUIDString];
  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDUnassociatedAccessory isKnownToSystemCommissioner](self, "isKnownToSystemCommissioner"));
  v8 = NSNumber;
  id v9 = [(HMDUnassociatedAccessory *)self rootPublicKey];
  id v10 = objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "hash"));
  int v11 = [(HMDUnassociatedAccessory *)self nodeID];
  id v12 = [(HMDUnassociatedAccessory *)self identifier];
  __int16 v13 = [(HMDUnassociatedAccessory *)self name];
  id v14 = [(HMDUnassociatedAccessory *)self category];
  uint64_t v15 = [v14 name];
  v16 = (void *)v15;
  if (v26)
  {
    v17 = [NSString stringWithFormat:@", %@", v26];
    BOOL v18 = [v20 stringWithFormat:@"<%@%@, UUID = %@, knownToSystemCommissioner = %@, RPK(Hash) = %@, NodeID = %@, Identifier = %@, Name = %@, Category = %@%@>", v25, v23, v24, v7, v10, v11, v12, v13, v16, v17];
  }
  else
  {
    BOOL v18 = [v20 stringWithFormat:@"<%@%@, UUID = %@, knownToSystemCommissioner = %@, RPK(Hash) = %@, NodeID = %@, Identifier = %@, Name = %@, Category = %@%@>", v25, v23, v24, v7, v10, v11, v12, v13, v15, &stru_1F2C9F1A8];
  }

  if (v22) {
  return v18;
  }
}

- (id)shortDescription
{
  id v3 = NSString;
  BOOL v4 = [(id)objc_opt_class() shortDescription];
  v5 = [(HMDUnassociatedAccessory *)self identifier];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (HMDUnassociatedAccessory *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
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
      v7 = [(HMDUnassociatedAccessory *)self identifier];
      v8 = [(HMDUnassociatedAccessory *)v6 identifier];
      char v9 = [v7 isEqualToString:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (BOOL)requiresThreadRouter
{
  return 0;
}

- (BOOL)isKnownToSystemCommissioner
{
  return 0;
}

- (BOOL)supportsCHIP
{
  return 0;
}

- (unint64_t)transportTypes
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  BOOL v4 = NSString;
  v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (unint64_t)hash
{
  v2 = [(HMDUnassociatedAccessory *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)dealloc
{
  unint64_t v3 = [(HMDUnassociatedAccessory *)self messageDispatcher];
  [v3 deregisterReceiver:self];

  v4.receiver = self;
  v4.super_class = (Class)HMDUnassociatedAccessory;
  [(HMDUnassociatedAccessory *)&v4 dealloc];
}

- (HMDUnassociatedAccessory)initWithIdentifier:(id)a3 name:(id)a4 category:(id)a5 messageDispatcher:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)HMDUnassociatedAccessory;
  id v14 = [(HMDUnassociatedAccessory *)&v23 init];
  if (v14)
  {
    uint64_t v15 = [MEMORY[0x1E4F29128] UUID];
    uuid = v14->_uuid;
    v14->_uuid = (NSUUID *)v15;

    uint64_t v17 = [v10 copy];
    identifier = v14->_identifier;
    v14->_identifier = (NSString *)v17;

    uint64_t v19 = [v11 copy];
    name = v14->_name;
    v14->_name = (NSString *)v19;

    v21 = v12;
    if (!v12)
    {
      v21 = +[HMDUnassociatedAccessory otherAccessoryCategory];
    }
    objc_storeStrong((id *)&v14->_category, v21);
    if (!v12) {

    }
    objc_storeStrong((id *)&v14->_messageDispatcher, a6);
    if (v13) {
      [(HMDUnassociatedAccessory *)v14 _registerForMessages];
    }
  }

  return v14;
}

- (HMDUnassociatedAccessory)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  objc_super v4 = NSString;
  v5 = NSStringFromSelector(a2);
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
  if (logCategory__hmf_once_t10_118263 != -1) {
    dispatch_once(&logCategory__hmf_once_t10_118263, &__block_literal_global_118264);
  }
  v2 = (void *)logCategory__hmf_once_v11_118265;
  return v2;
}

uint64_t __39__HMDUnassociatedAccessory_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v11_118265;
  logCategory__hmf_once_v11_118265 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)otherAccessoryCategory
{
  v2 = +[HMDHAPMetadata getSharedInstance];
  uint64_t v3 = [v2 categoryForOther];

  id v4 = objc_alloc(MEMORY[0x1E4F2E520]);
  v5 = [v3 uuidStr];
  id v6 = [v3 catDescription];
  id v7 = (void *)[v4 initWithType:v5 name:v6];

  v8 = [MEMORY[0x1E4F2E7B0] cachedInstanceForHMAccessoryCategory:v7];

  return v8;
}

@end