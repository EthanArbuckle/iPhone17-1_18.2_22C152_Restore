@interface DNDModeAssertion(Predicates)
+ (id)predicateForModeAssertionsWithLifetimeClass:()Predicates;
+ (uint64_t)predicateForModeAssertionsTakenBeforeDate:()Predicates;
+ (uint64_t)predicateForModeAssertionsWithClientIdentifiers:()Predicates;
+ (uint64_t)predicateForModeAssertionsWithDeviceIdentifier:()Predicates;
+ (uint64_t)predicateForModeAssertionsWithModeIdentifiersNotContainedIn:()Predicates;
+ (uint64_t)predicateForModeAssertionsWithUUIDs:()Predicates;
@end

@implementation DNDModeAssertion(Predicates)

+ (uint64_t)predicateForModeAssertionsWithUUIDs:()Predicates
{
  return [MEMORY[0x1E4F28F60] predicateWithFormat:@"UUID IN %@", a3];
}

+ (uint64_t)predicateForModeAssertionsWithClientIdentifiers:()Predicates
{
  return [MEMORY[0x1E4F28F60] predicateWithFormat:@"source.clientIdentifier IN %@", a3];
}

+ (uint64_t)predicateForModeAssertionsWithDeviceIdentifier:()Predicates
{
  return [MEMORY[0x1E4F28F60] predicateWithFormat:@"source.deviceIdentifier == %@", a3];
}

+ (uint64_t)predicateForModeAssertionsWithModeIdentifiersNotContainedIn:()Predicates
{
  return [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT (details.modeIdentifier IN %@)", a3];
}

+ (id)predicateForModeAssertionsWithLifetimeClass:()Predicates
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __76__DNDModeAssertion_Predicates__predicateForModeAssertionsWithLifetimeClass___block_invoke;
  v5[3] = &__block_descriptor_40_e43_B24__0__DNDModeAssertion_8__NSDictionary_16lu32l8;
  v5[4] = a3;
  v3 = [MEMORY[0x1E4F28F60] predicateWithBlock:v5];
  return v3;
}

+ (uint64_t)predicateForModeAssertionsTakenBeforeDate:()Predicates
{
  return [MEMORY[0x1E4F28F60] predicateWithFormat:@"startDate < %@", a3];
}

@end