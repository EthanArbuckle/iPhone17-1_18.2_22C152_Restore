@interface _HKMedicalRecordComparisonFilter(HealthDaemon)
- (id)predicateWithProfile:()HealthDaemon;
@end

@implementation _HKMedicalRecordComparisonFilter(HealthDaemon)

- (id)predicateWithProfile:()HealthDaemon
{
  v4 = [a1 keyPath];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F2A018]];

  if (v5)
  {
    v6 = [a1 value];
    uint64_t v7 = HDMedicalRecordEntityPredicateForMedicalUserDomainConcept(v6);
LABEL_5:
    v10 = (void *)v7;

    goto LABEL_17;
  }
  v8 = [a1 keyPath];
  int v9 = [v8 isEqualToString:*MEMORY[0x1E4F29FF0]];

  if (v9)
  {
    v6 = [a1 value];
    uint64_t v7 = HDMedicalRecordEntityPredicateForSignedClinicalDataOriginIdentifier(v6);
    goto LABEL_5;
  }
  [a1 operatorType];
  uint64_t v11 = HDSQLiteComparisonTypeForPredicateOperator();
  v12 = [a1 keyPath];
  int v13 = [v12 isEqualToString:*MEMORY[0x1E4F29FD8]];

  if (v13)
  {
    v14 = [a1 value];
    uint64_t v15 = HDMedicalRecordEntityPredicateForModifiedDate(v11);
LABEL_16:
    v10 = (void *)v15;

    goto LABEL_17;
  }
  v16 = [a1 keyPath];
  int v17 = [v16 isEqualToString:*MEMORY[0x1E4F29FE8]];

  if (v17)
  {
    v14 = [a1 value];
    uint64_t v15 = HDMedicalRecordEntityPredicateForOriginType(v11 == 1, [v14 integerValue]);
    goto LABEL_16;
  }
  v18 = [a1 keyPath];
  int v19 = [v18 isEqualToString:*MEMORY[0x1E4F29FF8]];

  if (v19)
  {
    v20 = [a1 value];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    v22 = [a1 value];
    v23 = v22;
    if (isKindOfClass)
    {
      uint64_t v24 = [v22 date];

      v23 = (void *)v24;
    }

    v10 = HDMedicalRecordEntityPredicateForSortDate(v11);
  }
  else
  {
    v25 = [a1 keyPath];
    int v26 = [v25 isEqualToString:*MEMORY[0x1E4F2A010]];

    if (v26)
    {
      v14 = [a1 value];
      uint64_t v15 = HDMedicalRecordEntityPredicateForState(v11, [v14 integerValue]);
      goto LABEL_16;
    }
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2 object:a1 file:@"_HKMedicalRecordComparisonFilter+HealthDaemon.m" lineNumber:46 description:@"Unreachable code has been executed"];

    v10 = [MEMORY[0x1E4F65D58] falsePredicate];
  }
LABEL_17:

  return v10;
}

@end