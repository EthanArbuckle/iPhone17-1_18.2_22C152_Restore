@interface _HKMedicalUserDomainConceptComparisonFilter(HealthDaemon)
- (id)predicateWithProfile:()HealthDaemon;
@end

@implementation _HKMedicalUserDomainConceptComparisonFilter(HealthDaemon)

- (id)predicateWithProfile:()HealthDaemon
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [a1 keyPath];
  int v7 = [v6 isEqualToString:*MEMORY[0x1E4F2A350]];

  if (v7)
  {
    if (!a1) {
      goto LABEL_20;
    }
    BOOL v8 = [a1 operatorType] == 10;
    uint64_t v9 = [a1 value];
    v10 = (void *)v9;
    if (v8) {
      HDMedicalUserDomainConceptEntityPredicateForCategoryTypes(v9);
    }
    else {
      HDMedicalUserDomainConceptEntityPredicateForCategoryType(v9, [a1 operatorType] == 4);
    }
    goto LABEL_5;
  }
  v12 = [a1 keyPath];
  int v13 = [v12 isEqualToString:*MEMORY[0x1E4F2A3B0]];

  if (v13)
  {
    if (a1)
    {
      BOOL v14 = [a1 operatorType] == 10;
      uint64_t v15 = [a1 value];
      v10 = (void *)v15;
      if (v14) {
        HDMedicalUserDomainConceptEntityPredicateForMedicalRecordWithUUIDs(v15);
      }
      else {
        HDMedicalUserDomainConceptEntityPredicateForMedicalRecordWithUUID(v15, [a1 operatorType] == 4);
      }
      uint64_t v11 = LABEL_5:;
      a1 = (void *)v11;
    }
  }
  else
  {
    v16 = [a1 keyPath];
    int v17 = [v16 isEqualToString:*MEMORY[0x1E4F2A458]];

    if (v17)
    {
      id v42 = v5;
      if (a1)
      {
        v18 = [a1 value];
        id v43 = 0;
        id v19 = v42;
        id v20 = v18;
        v21 = [HDConceptResolutionConfiguration alloc];
        v22 = [v20 countryCode];
        v23 = -[HDConceptResolutionConfiguration initWithCountryCode:recordCategoryType:options:](v21, "initWithCountryCode:recordCategoryType:options:", v22, [v20 recordCategoryType], 0);

        v24 = [v20 codingCollection];

        v25 = +[HDOntologyConceptManager conceptForCodingCollection:v24 configuration:v23 profile:v19 error:&v43];

        v41 = (uint64_t (*)(uint64_t, uint64_t))v43;
        if (v25)
        {
          id v26 = v25;
          id v40 = v19;
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          v51 = __Block_byref_object_copy__76;
          v52 = __Block_byref_object_dispose__76;
          id v53 = 0;
          v39 = v26;
          v27 = [v26 identifier];
          v28 = +[HDOntologyConceptManager predicateMatchingConceptsWithRelationshipType:1013 withSubjectId:v27];

          v29 = +[HDOntologyConceptManager predicateToExcludeSentinel];
          v30 = [MEMORY[0x1E4F65D08] compoundPredicateWithPredicate:v28 otherPredicate:v29];
          v44[0] = MEMORY[0x1E4F143A8];
          v44[1] = 3221225472;
          v44[2] = __104___HKMedicalUserDomainConceptComparisonFilter_HealthDaemon___grouperConceptPredicateForConcept_profile___block_invoke;
          v44[3] = &unk_1E62F4DF0;
          v44[4] = buf;
          id v45 = 0;
          LOBYTE(v26) = +[HDOntologyConceptManager enumerateConceptsMatchingPredicate:v30 profile:v40 error:&v45 enumerationHandler:v44];
          id v31 = v45;
          if (v26)
          {
            v32 = *(void **)(*(void *)&buf[8] + 40);
            if (!v32) {
              v32 = v39;
            }
            id v33 = v32;
            v34 = [v33 coding];
            a1 = HDUserDomainConceptEntityPredicateForMedicalCoding(v34);
          }
          else
          {
            _HKInitializeLogging();
            v38 = HKLogHealthOntology();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v46 = 138543618;
              v47 = a1;
              __int16 v48 = 2114;
              id v49 = v31;
              _os_log_error_impl(&dword_1BCB7D000, v38, OS_LOG_TYPE_ERROR, "%{public}@: Error loading relationships for concept: %{public}@", v46, 0x16u);
            }

            a1 = [MEMORY[0x1E4F65D58] falsePredicate];
          }

          _Block_object_dispose(buf, 8);
        }
        else
        {
          _HKInitializeLogging();
          v37 = HKLogHealthOntology();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543875;
            *(void *)&buf[4] = a1;
            *(_WORD *)&buf[12] = 2113;
            *(void *)&buf[14] = v20;
            *(_WORD *)&buf[22] = 2114;
            v51 = v41;
            _os_log_error_impl(&dword_1BCB7D000, v37, OS_LOG_TYPE_ERROR, "%{public}@: Failed to perform concept resolution for concept resolution definition: %{private}@ with error: %{public}@", buf, 0x20u);
          }

          a1 = [MEMORY[0x1E4F65D58] falsePredicate];
        }
      }
    }
    else
    {
      v35 = [MEMORY[0x1E4F28B00] currentHandler];
      [v35 handleFailureInMethod:a2 object:a1 file:@"_HKMedicalUserDomainConceptComparisonFilter+HealthDaemon.m" lineNumber:34 description:@"Unreachable code has been executed"];

      a1 = [MEMORY[0x1E4F65D58] falsePredicate];
    }
  }
LABEL_20:

  return a1;
}

@end