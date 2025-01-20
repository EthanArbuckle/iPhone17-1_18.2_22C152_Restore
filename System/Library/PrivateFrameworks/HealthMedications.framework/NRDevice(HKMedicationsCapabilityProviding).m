@interface NRDevice(HKMedicationsCapabilityProviding)
- (uint64_t)supportsMeadowCapability;
- (uint64_t)supportsMedicationsCapability;
@end

@implementation NRDevice(HKMedicationsCapabilityProviding)

- (uint64_t)supportsMedicationsCapability
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"832275CC-B0F5-46CA-85B0-92463453065E"];
  uint64_t v3 = [a1 supportsCapability:v2];

  return v3;
}

- (uint64_t)supportsMeadowCapability
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"F5E0C9C7-CA38-421E-808A-0705258C1EF9"];
  uint64_t v3 = [a1 supportsCapability:v2];

  return v3;
}

@end