@interface _HDUserDomainConceptObserverRecord
- (HKUserDomainConcept)userDomainConcept;
- (_HDUserDomainConceptObserverRecord)init;
- (_HDUserDomainConceptObserverRecord)initWithUserDomainConcept:(id)a3 modificationType:(int64_t)a4;
- (int64_t)changeType;
@end

@implementation _HDUserDomainConceptObserverRecord

- (_HDUserDomainConceptObserverRecord)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (_HDUserDomainConceptObserverRecord)initWithUserDomainConcept:(id)a3 modificationType:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_HDUserDomainConceptObserverRecord;
  v8 = [(_HDUserDomainConceptObserverRecord *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_userDomainConcept, a3);
    v9->_changeType = a4;
  }

  return v9;
}

- (int64_t)changeType
{
  return self->_changeType;
}

- (HKUserDomainConcept)userDomainConcept
{
  return self->_userDomainConcept;
}

- (void).cxx_destruct
{
}

@end