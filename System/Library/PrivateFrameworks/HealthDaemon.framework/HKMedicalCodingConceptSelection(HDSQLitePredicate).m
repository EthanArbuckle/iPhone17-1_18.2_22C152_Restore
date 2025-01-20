@interface HKMedicalCodingConceptSelection(HDSQLitePredicate)
- (id)predicateWithProfile:()HDSQLitePredicate;
@end

@implementation HKMedicalCodingConceptSelection(HDSQLitePredicate)

- (id)predicateWithProfile:()HDSQLitePredicate
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 ontologyConceptManager];
  v6 = [a1 coding];
  v7 = [v6 codingSystem];
  v8 = [v5 attributeIdentifierForCodingSystem:v7];

  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F2AC20]);
    uint64_t v10 = [v8 longLongValue];
    v11 = [a1 coding];
    v12 = [v11 code];
    v13 = (void *)[v9 initWithAttribute:v10 operatorType:4 value:v12];

    v14 = [v13 predicateWithProfile:v4];
  }
  else
  {
    _HKInitializeLogging();
    v15 = HKLogHealthOntology();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v17 = [a1 coding];
      v18 = [v17 codingSystem];
      v19 = HKSensitiveLogItem();
      int v20 = 138543618;
      v21 = a1;
      __int16 v22 = 2114;
      v23 = v19;
      _os_log_error_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_ERROR, "%{public}@ received no attribute identifier for %{public}@, will return 'false' predicate", (uint8_t *)&v20, 0x16u);
    }
    v14 = [MEMORY[0x1E4F65D58] falsePredicate];
  }

  return v14;
}

@end