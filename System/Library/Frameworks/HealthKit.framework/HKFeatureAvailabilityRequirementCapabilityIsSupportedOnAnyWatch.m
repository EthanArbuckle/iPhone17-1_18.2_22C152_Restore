@interface HKFeatureAvailabilityRequirementCapabilityIsSupportedOnAnyWatch
+ (BOOL)supportsSecureCoding;
+ (NSString)requirementIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSupportedOnLocalDevice;
- (HKFeatureAvailabilityRequirementCapabilityIsSupportedOnAnyWatch)initWithCoder:(id)a3;
- (HKFeatureAvailabilityRequirementCapabilityIsSupportedOnAnyWatch)initWithNanoRegistryCapability:(id)a3 supportedOnLocalDevice:(BOOL)a4;
- (NSString)requirementDescription;
- (NSUUID)nanoRegistryCapability;
- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4;
- (uint64_t)_isSatisfiedWithDataSource:(uint64_t)a1;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)registerObserver:(id)a3 forDataSource:(id)a4;
- (void)unregisterObserver:(id)a3 fromDataSource:(id)a4;
@end

@implementation HKFeatureAvailabilityRequirementCapabilityIsSupportedOnAnyWatch

- (HKFeatureAvailabilityRequirementCapabilityIsSupportedOnAnyWatch)initWithNanoRegistryCapability:(id)a3 supportedOnLocalDevice:(BOOL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKFeatureAvailabilityRequirementCapabilityIsSupportedOnAnyWatch;
  v7 = [(HKFeatureAvailabilityRequirementCapabilityIsSupportedOnAnyWatch *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    nanoRegistryCapability = v7->_nanoRegistryCapability;
    v7->_nanoRegistryCapability = (NSUUID *)v8;

    v7->_supportedOnLocalDevice = a4;
  }

  return v7;
}

+ (NSString)requirementIdentifier
{
  return (NSString *)@"CapabilityIsSupportedOnAnyWatch";
}

- (NSString)requirementDescription
{
  v3 = +[_HKBehavior sharedBehavior];
  int v4 = [v3 isCompanionCapable];

  if (v4)
  {
    [NSString stringWithFormat:@"At least one watch must have the the capability %@", self->_nanoRegistryCapability];
  }
  else
  {
    if (self->_supportedOnLocalDevice) {
      v5 = @"Supported";
    }
    else {
      v5 = @"Not supported";
    }
    [NSString stringWithFormat:@"%@ on this device", v5];
  id v6 = };

  return (NSString *)v6;
}

- (uint64_t)_isSatisfiedWithDataSource:(uint64_t)a1
{
  id v3 = a2;
  int v4 = v3;
  if (a1)
  {
    v5 = [v3 behavior];
    int v6 = [v5 isCompanionCapable];

    if (v6)
    {
      v7 = [v4 devicePairingAndSwitchingNotificationDataSource];
      uint64_t v8 = [v7 pairedDeviceRegistry];

      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __94__HKFeatureAvailabilityRequirementCapabilityIsSupportedOnAnyWatch__isSatisfiedWithDataSource___block_invoke;
      v11[3] = &unk_1E58C2128;
      v11[4] = a1;
      v9 = [v8 getDevicesMatching:v11];
      a1 = [v9 count] != 0;
    }
    else
    {
      a1 = *(unsigned char *)(a1 + 8) != 0;
    }
  }

  return a1;
}

uint64_t __94__HKFeatureAvailabilityRequirementCapabilityIsSupportedOnAnyWatch__isSatisfiedWithDataSource___block_invoke(uint64_t a1, void *a2)
{
  if (*(void *)(*(void *)(a1 + 32) + 16)) {
    return objc_msgSend(a2, "supportsCapability:");
  }
  else {
    return 1;
  }
}

- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4
{
  int v4 = NSNumber;
  uint64_t v5 = -[HKFeatureAvailabilityRequirementCapabilityIsSupportedOnAnyWatch _isSatisfiedWithDataSource:]((uint64_t)self, a3);

  return (id)[v4 numberWithBool:v5];
}

- (void)registerObserver:(id)a3 forDataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 behavior];
  int v9 = [v8 isCompanionCapable];

  if (v9)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __98__HKFeatureAvailabilityRequirementCapabilityIsSupportedOnAnyWatch_registerObserver_forDataSource___block_invoke;
    v10[3] = &unk_1E58C2150;
    v10[4] = self;
    [v7 registerObserverForDeviceCharacteristicAndPairingChanges:v6 block:v10];
  }
}

void __98__HKFeatureAvailabilityRequirementCapabilityIsSupportedOnAnyWatch_registerObserver_forDataSource___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  objc_msgSend(v5, "featureAvailabilityRequirement:didUpdateSatisfaction:", v4, -[HKFeatureAvailabilityRequirementCapabilityIsSupportedOnAnyWatch _isSatisfiedWithDataSource:](v4, a2));
}

- (void)unregisterObserver:(id)a3 fromDataSource:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  id v6 = [v5 behavior];
  int v7 = [v6 isCompanionCapable];

  if (v7) {
    [v5 unregisterObserverForDeviceCharacteristicAndPairingChanges:v8];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    nanoRegistryCapability = self->_nanoRegistryCapability;
    int v7 = (NSUUID *)v5[2];
    BOOL v8 = (nanoRegistryCapability == v7 || v7 && -[NSUUID isEqual:](nanoRegistryCapability, "isEqual:"))
      && self->_supportedOnLocalDevice == *((unsigned __int8 *)v5 + 8);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)self->_nanoRegistryCapability hash];
  id v4 = [NSNumber numberWithBool:self->_supportedOnLocalDevice];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  nanoRegistryCapability = self->_nanoRegistryCapability;
  id v5 = a3;
  [v5 encodeObject:nanoRegistryCapability forKey:@"nanoRegistryCapability"];
  [v5 encodeBool:self->_supportedOnLocalDevice forKey:@"supportedOnLocalDevice"];
}

- (HKFeatureAvailabilityRequirementCapabilityIsSupportedOnAnyWatch)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nanoRegistryCapability"];
  uint64_t v6 = [v4 decodeBoolForKey:@"supportedOnLocalDevice"];

  int v7 = [(HKFeatureAvailabilityRequirementCapabilityIsSupportedOnAnyWatch *)self initWithNanoRegistryCapability:v5 supportedOnLocalDevice:v6];
  return v7;
}

- (NSUUID)nanoRegistryCapability
{
  return self->_nanoRegistryCapability;
}

- (BOOL)isSupportedOnLocalDevice
{
  return self->_supportedOnLocalDevice;
}

- (void).cxx_destruct
{
}

@end