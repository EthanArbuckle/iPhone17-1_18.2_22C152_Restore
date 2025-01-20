@interface HFDiscoveredAccessory
+ (id)discoveredAccessoryFromSetupDescription:(id)a3;
- (BOOL)requiresSetupCode;
- (BOOL)requiresSoftwareUpdate;
- (HFDiscoveredAccessory)init;
- (HFDiscoveredAccessory)initWithAccessory:(id)a3;
- (HFDiscoveredAccessory)initWithAccessoryUUID:(id)a3 accessoryName:(id)a4 accessoryCategory:(id)a5;
- (HFDiscoveredAccessory)initWithSharingDevice:(id)a3;
- (HMAccessory)accessory;
- (HMAccessoryCategory)category;
- (NSDate)discoveryDate;
- (NSError)error;
- (NSString)description;
- (NSString)manufacturer;
- (NSString)name;
- (NSString)rawSetupPayloadString;
- (NSUUID)uniqueIdentifier;
- (SFDevice)sharingDevice;
- (id)_descriptionForStatus:(unint64_t)a3;
- (id)identify;
- (unint64_t)certificationStatus;
- (unint64_t)status;
- (void)setAccessory:(id)a3;
- (void)setCategory:(id)a3;
- (void)setCertificationStatus:(unint64_t)a3;
- (void)setManufacturer:(id)a3;
- (void)setName:(id)a3;
- (void)setRawSetupPayloadString:(id)a3;
- (void)updateStatus:(unint64_t)a3 error:(id)a4;
@end

@implementation HFDiscoveredAccessory

- (HFDiscoveredAccessory)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithAccessory_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFDiscoveredAccessory.m", 28, @"%s is unavailable; use %@ instead",
    "-[HFDiscoveredAccessory init]",
    v5);

  return 0;
}

- (HFDiscoveredAccessory)initWithAccessory:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFDiscoveredAccessory;
  v6 = [(HFDiscoveredAccessory *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accessory, a3);
    uint64_t v8 = [MEMORY[0x263EFF910] date];
    discoveryDate = v7->_discoveryDate;
    v7->_discoveryDate = (NSDate *)v8;

    v7->_status = 0;
  }

  return v7;
}

- (HFDiscoveredAccessory)initWithSharingDevice:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFDiscoveredAccessory;
  v6 = [(HFDiscoveredAccessory *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sharingDevice, a3);
    uint64_t v8 = [MEMORY[0x263EFF910] date];
    discoveryDate = v7->_discoveryDate;
    v7->_discoveryDate = (NSDate *)v8;

    v7->_status = 0;
  }

  return v7;
}

- (HFDiscoveredAccessory)initWithAccessoryUUID:(id)a3 accessoryName:(id)a4 accessoryCategory:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HFDiscoveredAccessory;
  v12 = [(HFDiscoveredAccessory *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_uniqueIdentifier, a3);
    objc_storeStrong((id *)&v13->_name, a4);
    objc_storeStrong((id *)&v13->_category, a5);
    uint64_t v14 = [MEMORY[0x263EFF910] date];
    discoveryDate = v13->_discoveryDate;
    v13->_discoveryDate = (NSDate *)v14;

    v13->_status = 0;
  }

  return v13;
}

+ (id)discoveredAccessoryFromSetupDescription:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v6 = [v4 accessoryUUID];
  v7 = [v4 accessoryName];
  uint64_t v8 = [v4 category];

  id v9 = (void *)[v5 initWithAccessoryUUID:v6 accessoryName:v7 accessoryCategory:v8];
  return v9;
}

- (void)updateStatus:(unint64_t)a3 error:(id)a4
{
  id v6 = a4;
  id v9 = v6;
  if (a3 != 3 && v6)
  {
    NSLog(&cfstr_ErrorCanOnlyBe.isa);
    self->_status = a3;
LABEL_7:
    error = self->_error;
    self->_error = 0;
    goto LABEL_8;
  }
  self->_status = a3;
  if (a3 != 3) {
    goto LABEL_7;
  }
  if (self->_error) {
    goto LABEL_9;
  }
  v7 = (NSError *)v6;
  error = self->_error;
  self->_error = v7;
LABEL_8:

  id v6 = v9;
LABEL_9:
}

- (NSString)description
{
  v3 = [MEMORY[0x263F58188] builderWithObject:self];
  id v4 = [(HFDiscoveredAccessory *)self _descriptionForStatus:[(HFDiscoveredAccessory *)self status]];
  id v5 = (id)[v3 appendObject:v4 withName:@"status"];

  id v6 = [(HFDiscoveredAccessory *)self error];
  id v7 = (id)[v3 appendObject:v6 withName:@"error" skipIfNil:1];

  uint64_t v8 = [(HFDiscoveredAccessory *)self accessory];
  id v9 = objc_msgSend(v8, "hf_prettyDescription");
  id v10 = (id)[v3 appendObject:v9 withName:@"accessory" skipIfNil:1];

  id v11 = [(HFDiscoveredAccessory *)self sharingDevice];
  id v12 = (id)[v3 appendObject:v11 withName:@"sharingDevice" skipIfNil:1];

  v13 = [(HFDiscoveredAccessory *)self uniqueIdentifier];
  id v14 = (id)[v3 appendObject:v13 withName:@"uniqueIdentifier" skipIfNil:1];

  v15 = [(HFDiscoveredAccessory *)self name];
  id v16 = (id)[v3 appendObject:v15 withName:@"name" skipIfNil:1];

  objc_super v17 = [(HFDiscoveredAccessory *)self category];
  id v18 = (id)[v3 appendObject:v17 withName:@"category" skipIfNil:1];

  v19 = [v3 build];

  return (NSString *)v19;
}

- (NSUUID)uniqueIdentifier
{
  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier)
  {
    v3 = uniqueIdentifier;
    goto LABEL_8;
  }
  id v5 = [(HFDiscoveredAccessory *)self accessory];

  if (v5)
  {
    id v6 = [(HFDiscoveredAccessory *)self accessory];
    uint64_t v7 = [v6 uuid];
LABEL_7:
    v3 = (NSUUID *)v7;

    goto LABEL_8;
  }
  uint64_t v8 = [(HFDiscoveredAccessory *)self sharingDevice];

  if (v8)
  {
    id v6 = [(HFDiscoveredAccessory *)self sharingDevice];
    uint64_t v7 = [v6 identifier];
    goto LABEL_7;
  }
  NSLog(&cfstr_Hfdiscoveredac_1.isa, self);
  v3 = 0;
LABEL_8:
  return v3;
}

- (NSString)name
{
  name = self->_name;
  if (name)
  {
    v3 = name;
    goto LABEL_11;
  }
  id v5 = [(HFDiscoveredAccessory *)self accessory];

  if (v5)
  {
    id v6 = [(HFDiscoveredAccessory *)self accessory];
    v3 = [v6 name];
  }
  else
  {
    v3 = [(HFDiscoveredAccessory *)self sharingDevice];

    if (!v3) {
      goto LABEL_11;
    }
    id v6 = [(HFDiscoveredAccessory *)self sharingDevice];
    uint64_t v7 = [v6 name];
    uint64_t v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x263F0DF00], "hf_userFriendlyLocalizedCapitalizedDescription:", *MEMORY[0x263F0B0A0]);
      id v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    v3 = v9;
  }
LABEL_11:
  return v3;
}

- (HMAccessoryCategory)category
{
  category = self->_category;
  if (category)
  {
    v3 = category;
  }
  else
  {
    id v5 = [(HFDiscoveredAccessory *)self accessory];

    if (v5)
    {
      id v6 = [(HFDiscoveredAccessory *)self accessory];
      v3 = [v6 category];
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (BOOL)requiresSetupCode
{
  v3 = [(HFDiscoveredAccessory *)self accessory];

  if (v3)
  {
    id v4 = [(HFDiscoveredAccessory *)self accessory];
    char v5 = [v4 knownToSystemCommissioner];

    if (v5)
    {
      LOBYTE(v6) = 0;
    }
    else
    {
      uint64_t v7 = [(HFDiscoveredAccessory *)self accessory];
      BOOL v6 = [v7 associationOptions] & 1;
    }
  }
  else
  {
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (BOOL)requiresSoftwareUpdate
{
  v3 = [(HFDiscoveredAccessory *)self accessory];

  if (v3)
  {
    id v4 = [(HFDiscoveredAccessory *)self accessory];
    unint64_t v5 = ((unint64_t)[v4 associationOptions] >> 1) & 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (id)identify
{
  v3 = [(HFDiscoveredAccessory *)self accessory];

  if (v3)
  {
    objc_initWeak(&location, self);
    id v4 = (void *)MEMORY[0x263F58190];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __33__HFDiscoveredAccessory_identify__block_invoke;
    v7[3] = &unk_26408F0F0;
    objc_copyWeak(&v8, &location);
    unint64_t v5 = [v4 futureWithBlock:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  else
  {
    unint64_t v5 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  return v5;
}

void __33__HFDiscoveredAccessory_identify__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [WeakRetained accessory];
  unint64_t v5 = [v3 errorOnlyCompletionHandlerAdapter];

  [v4 identifyWithCompletionHandler:v5];
}

- (id)_descriptionForStatus:(unint64_t)a3
{
  if (a3 > 3) {
    return 0;
  }
  else {
    return off_264091968[a3];
  }
}

- (void)setName:(id)a3
{
}

- (void)setCategory:(id)a3
{
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(id)a3
{
}

- (SFDevice)sharingDevice
{
  return self->_sharingDevice;
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (void)setManufacturer:(id)a3
{
}

- (NSDate)discoveryDate
{
  return self->_discoveryDate;
}

- (unint64_t)status
{
  return self->_status;
}

- (NSError)error
{
  return self->_error;
}

- (unint64_t)certificationStatus
{
  return self->_certificationStatus;
}

- (void)setCertificationStatus:(unint64_t)a3
{
  self->_certificationStatus = a3;
}

- (NSString)rawSetupPayloadString
{
  return self->_rawSetupPayloadString;
}

- (void)setRawSetupPayloadString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawSetupPayloadString, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_discoveryDate, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_sharingDevice, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end