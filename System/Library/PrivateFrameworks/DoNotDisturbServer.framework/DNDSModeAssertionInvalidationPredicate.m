@interface DNDSModeAssertionInvalidationPredicate
+ (id)predicateForAnyAssertion;
+ (id)predicateForAssertionClientIdentifiers:(id)a3;
+ (id)predicateForAssertionUUIDs:(id)a3;
+ (id)predicateForAssertionsTakenBeforeDate:(id)a3;
- (BOOL)evaluateWithObject:(id)a3 substitutionVariables:(id)a4;
- (id)_init;
- (unint64_t)predicateType;
@end

@implementation DNDSModeAssertionInvalidationPredicate

+ (id)predicateForAnyAssertion
{
  v2 = objc_alloc_init(DNDSAnyModeAssertionInvalidationPredicate);
  return v2;
}

+ (id)predicateForAssertionsTakenBeforeDate:(id)a3
{
  id v3 = a3;
  v4 = [[DNDSModeAssertionDateInvalidationPredicate alloc] initWithDate:v3];

  return v4;
}

+ (id)predicateForAssertionClientIdentifiers:(id)a3
{
  id v3 = a3;
  v4 = [[DNDSModeAssertionClientIdentifierInvalidationPredicate alloc] initWithClientIdentifiers:v3];

  return v4;
}

+ (id)predicateForAssertionUUIDs:(id)a3
{
  id v3 = a3;
  v4 = [[DNDSModeAssertionUUIDInvalidationPredicate alloc] initWithUUIDs:v3];

  return v4;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)DNDSModeAssertionInvalidationPredicate;
  return [(DNDSModeAssertionInvalidationPredicate *)&v3 init];
}

- (BOOL)evaluateWithObject:(id)a3 substitutionVariables:(id)a4
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)predicateType
{
  return 0;
}

@end