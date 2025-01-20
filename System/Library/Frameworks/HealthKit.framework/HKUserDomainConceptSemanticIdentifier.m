@interface HKUserDomainConceptSemanticIdentifier
+ (id)semanticIdentifierWithComponents:(id)a3;
- (BOOL)isEqual:(id)a3;
- (HKUserDomainConceptSemanticIdentifier)init;
- (HKUserDomainConceptSemanticIdentifier)initWithTypeIdentifier:(id)a3;
- (HKUserDomainConceptTypeIdentifier)typeIdentifier;
- (NSString)stringValue;
- (unint64_t)hash;
@end

@implementation HKUserDomainConceptSemanticIdentifier

- (HKUserDomainConceptSemanticIdentifier)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKUserDomainConceptSemanticIdentifier)initWithTypeIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKUserDomainConceptSemanticIdentifier;
  v6 = [(HKUserDomainConceptSemanticIdentifier *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_typeIdentifier, a3);
  }

  return v7;
}

- (NSString)stringValue
{
  v11[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HKUserDomainConceptTypeIdentifier *)self->_typeIdentifier schema];
  uint64_t v4 = (void *)v3;
  id v5 = @"(null)";
  if (v3) {
    id v5 = (__CFString *)v3;
  }
  v11[0] = v5;
  v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[HKUserDomainConceptTypeIdentifier code](self->_typeIdentifier, "code"));
  v7 = [v6 stringValue];
  v11[1] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  objc_super v9 = [v8 componentsJoinedByString:@"|█|"];

  return (NSString *)v9;
}

- (unint64_t)hash
{
  v2 = [(HKUserDomainConceptSemanticIdentifier *)self stringValue];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKUserDomainConceptSemanticIdentifier *)a3;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(HKUserDomainConceptSemanticIdentifier *)self stringValue];
      v7 = [(HKUserDomainConceptSemanticIdentifier *)v5 stringValue];
      if (v6 == v7)
      {
        char v11 = 1;
      }
      else
      {
        v8 = [(HKUserDomainConceptSemanticIdentifier *)v5 stringValue];
        if (v8)
        {
          objc_super v9 = [(HKUserDomainConceptSemanticIdentifier *)self stringValue];
          v10 = [(HKUserDomainConceptSemanticIdentifier *)v5 stringValue];
          char v11 = [v9 isEqualToString:v10];
        }
        else
        {
          char v11 = 0;
        }
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (HKUserDomainConceptTypeIdentifier)typeIdentifier
{
  return self->_typeIdentifier;
}

- (void).cxx_destruct
{
}

+ (id)semanticIdentifierWithComponents:(id)a3
{
  return 0;
}

@end