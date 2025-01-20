@interface HMDUnassociatedAppleMediaAccessory
+ (BOOL)supportsSecureCoding;
+ (id)logCategory;
- (BOOL)canPairGivenCapabilities:(unint64_t)a3;
- (BOOL)isCurrentAccessory;
- (HMDCapabilityFlags)requiredPairingCapabilities;
- (HMDDevice)device;
- (HMDHomeKitVersion)minimumRequiredPairingSoftwareVersion;
- (HMDUnassociatedAppleMediaAccessory)initWithCoder:(id)a3;
- (HMDUnassociatedAppleMediaAccessory)initWithIdentifier:(id)a3 name:(id)a4 category:(id)a5 productColor:(int64_t)a6 idsIdentifierString:(id)a7 rawAccessoryCapabilities:(id)a8 rawResidentCapabilities:(id)a9 messageDispatcher:(id)a10;
- (HMDUnassociatedAppleMediaAccessory)initWithIdentifier:(id)a3 name:(id)a4 category:(id)a5 requiredPairingCapabilities:(unint64_t)a6 minimumPairingSoftware:(id)a7 productColor:(int64_t)a8 idsIdentifierString:(id)a9 rawAccessoryCapabilities:(id)a10 rawResidentCapabilities:(id)a11 messageDispatcher:(id)a12;
- (HMFSoftwareVersion)softwareVersion;
- (NSData)rawAccessoryCapabilities;
- (NSData)rawResidentCapabilities;
- (NSString)idsIdentifierString;
- (NSString)model;
- (NSString)serialNumber;
- (id)addTransactionForHome:(id)a3;
- (id)descriptionWithPointer:(BOOL)a3 additionalDescription:(id)a4;
- (id)dumpDescription;
- (id)modelForChangeType:(unint64_t)a3 uuid:(id)a4 parentUUID:(id)a5;
- (int64_t)productColor;
- (unint64_t)supportedStereoPairVersions;
- (unint64_t)variant;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrentAccessory:(BOOL)a3;
- (void)setDevice:(id)a3;
- (void)setModel:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setSoftwareVersion:(id)a3;
- (void)setSupportedStereoPairVersions:(unint64_t)a3;
- (void)setVariant:(unint64_t)a3;
@end

@implementation HMDUnassociatedAppleMediaAccessory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredPairingCapabilities, 0);
  objc_storeStrong((id *)&self->_rawResidentCapabilities, 0);
  objc_storeStrong((id *)&self->_rawAccessoryCapabilities, 0);
  objc_storeStrong((id *)&self->_idsIdentifierString, 0);
  objc_storeStrong((id *)&self->_minimumRequiredPairingSoftwareVersion, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_softwareVersion, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

- (void)setVariant:(unint64_t)a3
{
  self->_variant = a3;
}

- (unint64_t)variant
{
  return self->_variant;
}

- (HMDCapabilityFlags)requiredPairingCapabilities
{
  return (HMDCapabilityFlags *)objc_getProperty(self, a2, 216, 1);
}

- (NSData)rawResidentCapabilities
{
  return (NSData *)objc_getProperty(self, a2, 208, 1);
}

- (NSData)rawAccessoryCapabilities
{
  return (NSData *)objc_getProperty(self, a2, 200, 1);
}

- (NSString)idsIdentifierString
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (HMDHomeKitVersion)minimumRequiredPairingSoftwareVersion
{
  return (HMDHomeKitVersion *)objc_getProperty(self, a2, 184, 1);
}

- (void)setSupportedStereoPairVersions:(unint64_t)a3
{
  self->_supportedStereoPairVersions = a3;
}

- (unint64_t)supportedStereoPairVersions
{
  return self->_supportedStereoPairVersions;
}

- (void)setCurrentAccessory:(BOOL)a3
{
  self->_currentAccessory = a3;
}

- (BOOL)isCurrentAccessory
{
  return self->_currentAccessory;
}

- (int64_t)productColor
{
  return self->_productColor;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HMDUnassociatedAppleMediaAccessory;
  [(HMDUnassociatedAccessory *)&v18 encodeWithCoder:v4];
  v5 = [(HMDUnassociatedAppleMediaAccessory *)self model];
  [v4 encodeObject:v5 forKey:@"HM.model"];

  v6 = [(HMDUnassociatedAppleMediaAccessory *)self serialNumber];
  [v4 encodeObject:v6 forKey:@"HM.serialNumber"];

  v7 = [(HMDUnassociatedAppleMediaAccessory *)self softwareVersion];
  [v4 encodeObject:v7 forKey:*MEMORY[0x263F0B708]];

  v8 = [(HMDUnassociatedAppleMediaAccessory *)self device];
  [v4 encodeObject:v8 forKey:@"HM.device"];

  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUnassociatedAppleMediaAccessory supportedStereoPairVersions](self, "supportedStereoPairVersions"));
  [v4 encodeObject:v9 forKey:*MEMORY[0x263F0DAF0]];

  v10 = [(HMDUnassociatedAppleMediaAccessory *)self minimumRequiredPairingSoftwareVersion];

  if (v10)
  {
    v11 = [(HMDUnassociatedAppleMediaAccessory *)self minimumRequiredPairingSoftwareVersion];
    [v4 encodeObject:v11 forKey:@"HMD.un.psv"];
  }
  v12 = [(HMDUnassociatedAppleMediaAccessory *)self requiredPairingCapabilities];
  [v4 encodeObject:v12 forKey:@"HMD.un.pcap"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[HMDUnassociatedAppleMediaAccessory variant](self, "variant"), @"HMD.un.var");
  int64_t v13 = [(HMDUnassociatedAppleMediaAccessory *)self productColor];
  [v4 encodeInteger:v13 forKey:*MEMORY[0x263F0D4F8]];
  v14 = [(HMDUnassociatedAppleMediaAccessory *)self idsIdentifierString];
  [v4 encodeObject:v14 forKey:@"HMD.un.idsId"];

  v15 = [(HMDUnassociatedAppleMediaAccessory *)self rawResidentCapabilities];
  [v4 encodeObject:v15 forKey:@"HMD.un.recap"];

  v16 = [(HMDUnassociatedAppleMediaAccessory *)self rawAccessoryCapabilities];
  [v4 encodeObject:v16 forKey:@"HMD.un.accap"];

  if (objc_msgSend(v4, "hmd_isForXPCTransport"))
  {
    BOOL v17 = [(HMDUnassociatedAppleMediaAccessory *)self isCurrentAccessory];
    [v4 encodeBool:v17 forKey:*MEMORY[0x263F0B268]];
  }
}

- (HMDUnassociatedAppleMediaAccessory)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)HMDUnassociatedAppleMediaAccessory;
  v5 = [(HMDUnassociatedAccessory *)&v26 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.model"];
    model = v5->_model;
    v5->_model = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.serialNumber"];
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F0B708]];
    softwareVersion = v5->_softwareVersion;
    v5->_softwareVersion = (HMFSoftwareVersion *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.device"];
    device = v5->_device;
    v5->_device = (HMDDevice *)v12;

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x263F0DAF0]];
    v5->_supportedStereoPairVersions = [v14 unsignedIntegerValue];

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMD.un.psv"];
    minimumRequiredPairingSoftwareVersion = v5->_minimumRequiredPairingSoftwareVersion;
    v5->_minimumRequiredPairingSoftwareVersion = (HMDHomeKitVersion *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMD.un.pcap"];
    requiredPairingCapabilities = v5->_requiredPairingCapabilities;
    v5->_requiredPairingCapabilities = (HMDCapabilityFlags *)v17;

    v5->_variant = [v4 decodeIntegerForKey:@"HMD.un.var"];
    v5->_productColor = [v4 decodeIntegerForKey:*MEMORY[0x263F0D4F8]];
    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMD.un.idsId"];
    idsIdentifierString = v5->_idsIdentifierString;
    v5->_idsIdentifierString = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMD.un.recap"];
    rawResidentCapabilities = v5->_rawResidentCapabilities;
    v5->_rawResidentCapabilities = (NSData *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMD.un.accap"];
    rawAccessoryCapabilities = v5->_rawAccessoryCapabilities;
    v5->_rawAccessoryCapabilities = (NSData *)v23;
  }
  return v5;
}

- (id)dumpDescription
{
  v16 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
  v14 = NSString;
  v3 = [(HMDUnassociatedAccessory *)self name];
  uint64_t v15 = [(HMDUnassociatedAccessory *)self uuid];
  id v4 = [v15 UUIDString];
  v5 = [(HMDUnassociatedAccessory *)self category];
  uint64_t v6 = [(HMDUnassociatedAccessory *)self identifier];
  v7 = [(HMDUnassociatedAppleMediaAccessory *)self device];
  uint64_t v8 = [(HMDUnassociatedAppleMediaAccessory *)self minimumRequiredPairingSoftwareVersion];
  v9 = [(HMDUnassociatedAppleMediaAccessory *)self requiredPairingCapabilities];
  [(HMDUnassociatedAppleMediaAccessory *)self productColor];
  uint64_t v10 = HMFProductColorToString();
  v11 = [(HMDUnassociatedAppleMediaAccessory *)self idsIdentifierString];
  uint64_t v12 = [v14 stringWithFormat:@"WHA Accessory '%@': uuid %@  category %@ identifier %@  device: %@, requiredSoftwareVersion:%@, requiredPairingCapabilities: %@, productColor: %@, idsIdentifier: %@", v3, v4, v5, v6, v7, v8, v9, v10, v11];

  [v16 setObject:v12 forKey:*MEMORY[0x263F41FA8]];
  return v16;
}

- (BOOL)canPairGivenCapabilities:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v5 = [(HMDUnassociatedAppleMediaAccessory *)self requiredPairingCapabilities];

  if (v5)
  {
    uint64_t v6 = [[HMDCapabilityFlags alloc] initWithCapabilityOptions:a3];
    v7 = [(HMDUnassociatedAppleMediaAccessory *)self requiredPairingCapabilities];
    BOOL v8 = [(HMDCapabilityFlags *)v6 hasCapabilities:v7];

    return v8;
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x230FBD990]();
    v11 = self;
    uint64_t v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int64_t v13 = HMFGetLogIdentifier();
      int v14 = 138543362;
      uint64_t v15 = v13;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@No required capabilities found.", (uint8_t *)&v14, 0xCu);
    }
    return 1;
  }
}

- (id)addTransactionForHome:(id)a3
{
  v31.receiver = self;
  v31.super_class = (Class)HMDUnassociatedAppleMediaAccessory;
  id v4 = [(HMDUnassociatedMediaAccessory *)&v31 addTransactionForHome:a3];
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
    v7 = [(HMDUnassociatedAppleMediaAccessory *)self device];
    BOOL v8 = v7;
    if (v7)
    {
      v9 = [v7 identifier];
      uint64_t v10 = [v9 UUIDString];
      [v6 setDeviceUUID:v10];

      [v6 setDevice:v8];
    }
    v11 = [(HMDUnassociatedAccessory *)self category];
    uint64_t v12 = [v11 categoryType];
    int v13 = [v12 isEqualToString:*MEMORY[0x263F0B0A0]];

    int v14 = (void *)MEMORY[0x263F0DF40];
    uint64_t v15 = [(HMDUnassociatedAccessory *)self category];
    uint64_t v16 = [v14 categoryIdentifierForCategory:v15];
    [v6 setInitialCategoryIdentifier:v16];

    uint64_t v17 = [(HMDUnassociatedAppleMediaAccessory *)self model];
    [v6 setModel:v17];

    objc_super v18 = [(HMDUnassociatedAppleMediaAccessory *)self model];
    [v6 setInitialModel:v18];

    uint64_t v19 = [(HMDUnassociatedAppleMediaAccessory *)self serialNumber];
    [v6 setSerialNumber:v19];

    v20 = [(HMDUnassociatedAppleMediaAccessory *)self softwareVersion];
    [v6 setSoftwareVersion:v20];

    if (v13)
    {
      if ([(HMDUnassociatedAppleMediaAccessory *)self supportedStereoPairVersions])
      {
        uint64_t v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUnassociatedAppleMediaAccessory supportedStereoPairVersions](self, "supportedStereoPairVersions"));
        [v6 setSupportedStereoPairVersions:v21];
      }
      else
      {
        [v6 setSupportedStereoPairVersions:&unk_26E471098];
      }
    }
    [v6 setManufacturer:@"Apple Inc."];
    [v6 setInitialManufacturer:@"Apple Inc."];
    id v22 = objc_alloc(MEMORY[0x263F08C38]);
    uint64_t v23 = [(HMDUnassociatedAppleMediaAccessory *)self idsIdentifierString];
    v24 = (void *)[v22 initWithUUIDString:v23];

    if (v24) {
      [v6 setIdsIdentifier:v24];
    }
    unint64_t v25 = [(HMDUnassociatedAppleMediaAccessory *)self variant];
    if ((v13 & (v25 == 0)) != 0) {
      uint64_t v26 = 1;
    }
    else {
      uint64_t v26 = v25;
    }
    if (v26)
    {
      v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
      [v6 setVariant:v27];
    }
    v28 = [(HMDUnassociatedAppleMediaAccessory *)self rawAccessoryCapabilities];
    [v6 setAccessoryCapabilities:v28];

    v29 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDUnassociatedAppleMediaAccessory productColor](self, "productColor"));
    [v6 setProductColor:v29];
  }
  return v4;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
  id v5 = a3;
  id v6 = [v5 name];
  [(HMDUnassociatedAccessory *)self setName:v6];

  v7 = (void *)MEMORY[0x263F0DF40];
  id v9 = [v5 productInfo];
  BOOL v8 = [v7 categoryForProductInfo:v9];

  [(HMDUnassociatedAccessory *)self setCategory:v8];
}

- (HMDDevice)device
{
  return self->_device;
}

- (void)setSoftwareVersion:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v7 = v5;
    os_unfair_recursive_lock_lock_with_options();
    p_softwareVersion = &self->_softwareVersion;
    if ((HMFEqualObjects() & 1) == 0) {
      objc_storeStrong((id *)p_softwareVersion, a3);
    }
    os_unfair_recursive_lock_unlock();
    id v5 = v7;
  }
}

- (HMFSoftwareVersion)softwareVersion
{
  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_softwareVersion;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setSerialNumber:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    os_unfair_recursive_lock_lock_with_options();
    if ((HMFEqualObjects() & 1) == 0)
    {
      id v5 = (NSString *)[v7 copy];
      serialNumber = self->_serialNumber;
      self->_serialNumber = v5;
    }
    os_unfair_recursive_lock_unlock();
    id v4 = v7;
  }
}

- (NSString)serialNumber
{
  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_serialNumber;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (void)setModel:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    os_unfair_recursive_lock_lock_with_options();
    id v5 = (NSString *)[v7 copy];
    model = self->_model;
    self->_model = v5;

    os_unfair_recursive_lock_unlock();
    id v4 = v7;
  }
}

- (NSString)model
{
  os_unfair_recursive_lock_lock_with_options();
  v3 = self->_model;
  os_unfair_recursive_lock_unlock();
  return v3;
}

- (id)descriptionWithPointer:(BOOL)a3 additionalDescription:(id)a4
{
  BOOL v4 = a3;
  id v6 = NSString;
  id v7 = [(HMDUnassociatedAppleMediaAccessory *)self softwareVersion];
  BOOL v8 = [(HMDUnassociatedAppleMediaAccessory *)self minimumRequiredPairingSoftwareVersion];
  id v9 = [(HMDUnassociatedAppleMediaAccessory *)self requiredPairingCapabilities];
  uint64_t v10 = [(HMDUnassociatedAppleMediaAccessory *)self idsIdentifierString];
  v11 = [(HMDUnassociatedAppleMediaAccessory *)self device];
  uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUnassociatedAppleMediaAccessory supportedStereoPairVersions](self, "supportedStereoPairVersions"));
  int v13 = [v6 stringWithFormat:@"softwareVersion = %@, pairingRequiredSoftwareVersion = %@, requiredPairingCapabilities = %@, idsIdentifier = %@, Device = %@, supportedStereoPairVersions = %@", v7, v8, v9, v10, v11, v12];
  v16.receiver = self;
  v16.super_class = (Class)HMDUnassociatedAppleMediaAccessory;
  int v14 = [(HMDUnassociatedAccessory *)&v16 descriptionWithPointer:v4 additionalDescription:v13];

  return v14;
}

- (HMDUnassociatedAppleMediaAccessory)initWithIdentifier:(id)a3 name:(id)a4 category:(id)a5 requiredPairingCapabilities:(unint64_t)a6 minimumPairingSoftware:(id)a7 productColor:(int64_t)a8 idsIdentifierString:(id)a9 rawAccessoryCapabilities:(id)a10 rawResidentCapabilities:(id)a11 messageDispatcher:(id)a12
{
  id v26 = a7;
  id v25 = a9;
  id v24 = a10;
  id v23 = a11;
  v27.receiver = self;
  v27.super_class = (Class)HMDUnassociatedAppleMediaAccessory;
  objc_super v18 = [(HMDUnassociatedMediaAccessory *)&v27 initWithIdentifier:a3 name:a4 category:a5 messageDispatcher:a12];
  if (v18)
  {
    uint64_t v19 = [[HMDCapabilityFlags alloc] initWithCapabilityOptions:a6];
    requiredPairingCapabilities = v18->_requiredPairingCapabilities;
    v18->_requiredPairingCapabilities = v19;

    objc_storeStrong((id *)&v18->_minimumRequiredPairingSoftwareVersion, a7);
    v18->_productColor = a8;
    objc_storeStrong((id *)&v18->_idsIdentifierString, a9);
    objc_storeStrong((id *)&v18->_rawResidentCapabilities, a11);
    objc_storeStrong((id *)&v18->_rawAccessoryCapabilities, a10);
  }

  return v18;
}

- (HMDUnassociatedAppleMediaAccessory)initWithIdentifier:(id)a3 name:(id)a4 category:(id)a5 productColor:(int64_t)a6 idsIdentifierString:(id)a7 rawAccessoryCapabilities:(id)a8 rawResidentCapabilities:(id)a9 messageDispatcher:(id)a10
{
  return [(HMDUnassociatedAppleMediaAccessory *)self initWithIdentifier:a3 name:a4 category:a5 requiredPairingCapabilities:1 minimumPairingSoftware:0 productColor:a6 idsIdentifierString:a7 rawAccessoryCapabilities:a8 rawResidentCapabilities:a9 messageDispatcher:a10];
}

- (id)modelForChangeType:(unint64_t)a3 uuid:(id)a4 parentUUID:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(HMDBackingStoreModelObject *)[HMDAppleMediaAccessoryModel alloc] initWithObjectChangeType:a3 uuid:v8 parentUUID:v7];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t8 != -1) {
    dispatch_once(&logCategory__hmf_once_t8, &__block_literal_global_49748);
  }
  v2 = (void *)logCategory__hmf_once_v9;
  return v2;
}

void __49__HMDUnassociatedAppleMediaAccessory_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v9;
  logCategory__hmf_once_id v9 = v0;
}

@end