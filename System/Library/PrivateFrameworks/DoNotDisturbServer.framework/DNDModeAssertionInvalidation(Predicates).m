@interface DNDModeAssertionInvalidation(Predicates)
+ (uint64_t)predicateForModeAssertionInvalidationsWithAssertionClientIdentifiers:()Predicates;
@end

@implementation DNDModeAssertionInvalidation(Predicates)

+ (uint64_t)predicateForModeAssertionInvalidationsWithAssertionClientIdentifiers:()Predicates
{
  return [MEMORY[0x1E4F28F60] predicateWithFormat:@"assertion.source.clientIdentifier IN %@", a3];
}

@end