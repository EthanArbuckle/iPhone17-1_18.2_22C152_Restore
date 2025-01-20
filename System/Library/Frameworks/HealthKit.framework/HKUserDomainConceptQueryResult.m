@interface HKUserDomainConceptQueryResult
+ (BOOL)supportsSecureCoding;
- (HKQueryAnchor)anchor;
- (HKUserDomainConcept)userConcept;
- (HKUserDomainConceptQueryResult)init;
- (HKUserDomainConceptQueryResult)initWithCoder:(id)a3;
- (HKUserDomainConceptQueryResult)initWithUserConcept:(id)a3 rawAnchor:(int64_t)a4;
- (int64_t)rawAnchor;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKUserDomainConceptQueryResult

- (HKUserDomainConceptQueryResult)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKUserDomainConceptQueryResult)initWithUserConcept:(id)a3 rawAnchor:(int64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKUserDomainConceptQueryResult;
  v7 = [(HKUserDomainConceptQueryResult *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    userConcept = v7->_userConcept;
    v7->_userConcept = (HKUserDomainConcept *)v8;

    v7->_rawAnchor = a4;
  }

  return v7;
}

- (HKQueryAnchor)anchor
{
  return (HKQueryAnchor *)+[HKQueryAnchor _anchorWithRowid:self->_rawAnchor];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKUserDomainConceptQueryResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKUserDomainConceptQueryResult;
  v5 = [(HKUserDomainConceptQueryResult *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userConcept"];
    userConcept = v5->_userConcept;
    v5->_userConcept = (HKUserDomainConcept *)v6;

    v5->_rawAnchor = [v4 decodeInt64ForKey:@"anchor"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  userConcept = self->_userConcept;
  id v5 = a3;
  [v5 encodeObject:userConcept forKey:@"userConcept"];
  [v5 encodeInt64:self->_rawAnchor forKey:@"anchor"];
}

- (HKUserDomainConcept)userConcept
{
  return self->_userConcept;
}

- (int64_t)rawAnchor
{
  return self->_rawAnchor;
}

- (void).cxx_destruct
{
}

@end