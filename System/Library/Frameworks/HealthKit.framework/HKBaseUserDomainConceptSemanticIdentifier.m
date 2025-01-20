@interface HKBaseUserDomainConceptSemanticIdentifier
+ (id)semanticIdentifierWithComponents:(id)a3;
- (HKBaseUserDomainConceptSemanticIdentifier)init;
- (HKBaseUserDomainConceptSemanticIdentifier)initWithTypeIdentifier:(id)a3;
- (HKBaseUserDomainConceptSemanticIdentifier)initWithUUID:(id)a3;
- (NSUUID)UUID;
- (id)stringValue;
@end

@implementation HKBaseUserDomainConceptSemanticIdentifier

- (HKBaseUserDomainConceptSemanticIdentifier)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKBaseUserDomainConceptSemanticIdentifier)initWithTypeIdentifier:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3C8];
  v6 = NSStringFromSelector(a2);
  [v4 raise:v5, @"The -%@ method is not available on %@", v6, objc_opt_class() format];

  return 0;
}

- (HKBaseUserDomainConceptSemanticIdentifier)initWithUUID:(id)a3
{
  id v5 = a3;
  v6 = +[HKUserDomainConceptTypeIdentifier baseUserDomainConceptIdentifier];
  v9.receiver = self;
  v9.super_class = (Class)HKBaseUserDomainConceptSemanticIdentifier;
  v7 = [(HKUserDomainConceptSemanticIdentifier *)&v9 initWithTypeIdentifier:v6];

  if (v7) {
    objc_storeStrong((id *)&v7->_UUID, a3);
  }

  return v7;
}

+ (id)semanticIdentifierWithComponents:(id)a3
{
  id v3 = a3;
  if ([v3 count] == 1)
  {
    uint64_t v4 = [v3 firstObject];
    id v5 = 0;
    if (([v4 isEqualToString:@"(null)"] & 1) == 0 && v4)
    {
      v6 = (objc_class *)MEMORY[0x1E4F29128];
      id v7 = v4;
      v8 = (void *)[[v6 alloc] initWithUUIDString:v7];

      if (v8) {
        id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithUUID:v8];
      }
      else {
        id v5 = 0;
      }
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)stringValue
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)HKBaseUserDomainConceptSemanticIdentifier;
  id v3 = [(HKUserDomainConceptSemanticIdentifier *)&v8 stringValue];
  v9[0] = v3;
  uint64_t v4 = [(NSUUID *)self->_UUID UUIDString];
  v9[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  v6 = [v5 componentsJoinedByString:@"|█|"];

  return v6;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void).cxx_destruct
{
}

@end