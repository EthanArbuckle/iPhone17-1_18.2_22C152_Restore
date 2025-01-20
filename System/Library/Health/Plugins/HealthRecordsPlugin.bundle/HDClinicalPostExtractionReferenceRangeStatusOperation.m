@interface HDClinicalPostExtractionReferenceRangeStatusOperation
- (void)main;
@end

@implementation HDClinicalPostExtractionReferenceRangeStatusOperation

- (void)main
{
  _HKInitializeLogging();
  v3 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
    sub_AFD74(v3, self);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v4 = [(HDClinicalPostExtractionOperation *)self extractionResult];
  v5 = [v4 allUnits];

  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v17 + 1) + 8 * (void)v9) medicalRecord];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v10;
          v12 = [v11 value];
          if (![v12 collectionType]
            || ([v12 inspectableValue],
                v13 = objc_claimAutoreleasedReturnValue(),
                v14 = (char *)[v13 valueType],
                v13,
                v14 == (unsigned char *)&dword_4 + 2))
          {
            if (v12)
            {
              v15 = [v11 referenceRanges];
              id v16 = [v12 referenceRangeStatusWithRanges:v15];
            }
            else
            {
              id v16 = 0;
            }
            [v11 _setReferenceRangeStatus:v16];
          }
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }
}

@end