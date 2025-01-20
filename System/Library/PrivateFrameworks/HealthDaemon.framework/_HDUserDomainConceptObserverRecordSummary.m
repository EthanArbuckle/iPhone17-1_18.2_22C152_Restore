@interface _HDUserDomainConceptObserverRecordSummary
- (NSArray)addedConcepts;
- (NSArray)journaledConcepts;
- (NSArray)removedConcepts;
- (NSArray)updatedConcepts;
- (_HDUserDomainConceptObserverRecordSummary)init;
- (_HDUserDomainConceptObserverRecordSummary)initWithJournaledConcepts:(id)a3 addedConcepts:(id)a4 updatedConcepts:(id)a5 removedConcepts:(id)a6;
@end

@implementation _HDUserDomainConceptObserverRecordSummary

- (_HDUserDomainConceptObserverRecordSummary)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (_HDUserDomainConceptObserverRecordSummary)initWithJournaledConcepts:(id)a3 addedConcepts:(id)a4 updatedConcepts:(id)a5 removedConcepts:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)_HDUserDomainConceptObserverRecordSummary;
  v14 = [(_HDUserDomainConceptObserverRecordSummary *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    journaledConcepts = v14->_journaledConcepts;
    v14->_journaledConcepts = (NSArray *)v15;

    uint64_t v17 = [v11 copy];
    addedConcepts = v14->_addedConcepts;
    v14->_addedConcepts = (NSArray *)v17;

    uint64_t v19 = [v12 copy];
    updatedConcepts = v14->_updatedConcepts;
    v14->_updatedConcepts = (NSArray *)v19;

    uint64_t v21 = [v13 copy];
    removedConcepts = v14->_removedConcepts;
    v14->_removedConcepts = (NSArray *)v21;
  }
  return v14;
}

- (NSArray)journaledConcepts
{
  return self->_journaledConcepts;
}

- (NSArray)addedConcepts
{
  return self->_addedConcepts;
}

- (NSArray)updatedConcepts
{
  return self->_updatedConcepts;
}

- (NSArray)removedConcepts
{
  return self->_removedConcepts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedConcepts, 0);
  objc_storeStrong((id *)&self->_updatedConcepts, 0);
  objc_storeStrong((id *)&self->_addedConcepts, 0);

  objc_storeStrong((id *)&self->_journaledConcepts, 0);
}

@end