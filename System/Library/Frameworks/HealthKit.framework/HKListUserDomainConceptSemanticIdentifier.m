@interface HKListUserDomainConceptSemanticIdentifier
+ (id)semanticIdentifierWithComponents:(id)a3;
- (HKListUserDomainConceptSemanticIdentifier)init;
- (HKListUserDomainConceptSemanticIdentifier)initWithListType:(unint64_t)a3;
- (HKListUserDomainConceptSemanticIdentifier)initWithTypeIdentifier:(id)a3;
- (id)stringValue;
- (unint64_t)listType;
@end

@implementation HKListUserDomainConceptSemanticIdentifier

- (HKListUserDomainConceptSemanticIdentifier)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKListUserDomainConceptSemanticIdentifier)initWithTypeIdentifier:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3C8];
  v6 = NSStringFromSelector(a2);
  [v4 raise:v5, @"The -%@ method is not available on %@", v6, objc_opt_class() format];

  return 0;
}

- (HKListUserDomainConceptSemanticIdentifier)initWithListType:(unint64_t)a3
{
  uint64_t v5 = +[HKUserDomainConceptTypeIdentifier listUserDomainConceptIdentifier];
  v8.receiver = self;
  v8.super_class = (Class)HKListUserDomainConceptSemanticIdentifier;
  v6 = [(HKUserDomainConceptSemanticIdentifier *)&v8 initWithTypeIdentifier:v5];

  if (v6) {
    v6->_listType = a3;
  }
  return v6;
}

+ (id)semanticIdentifierWithComponents:(id)a3
{
  id v3 = a3;
  if ([v3 count] == 1)
  {
    uint64_t v4 = [v3 firstObject];
    uint64_t v5 = 0;
    if (([v4 isEqualToString:@"(null)"] & 1) == 0 && v4)
    {
      v6 = (objc_class *)MEMORY[0x1E4F28EE0];
      id v7 = v4;
      id v8 = objc_alloc_init(v6);
      v9 = [v8 numberFromString:v7];

      if (v9) {
        uint64_t v5 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithListType:", objc_msgSend(v9, "integerValue"));
      }
      else {
        uint64_t v5 = 0;
      }
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)stringValue
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)HKListUserDomainConceptSemanticIdentifier;
  id v3 = [(HKUserDomainConceptSemanticIdentifier *)&v8 stringValue];
  v9[0] = v3;
  uint64_t v4 = [NSNumber numberWithUnsignedInteger:self->_listType];
  v9[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  v6 = [v5 componentsJoinedByString:@"|█|"];

  return v6;
}

- (unint64_t)listType
{
  return self->_listType;
}

@end