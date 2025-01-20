@interface HKInspectableValueCollection(Display)
+ (void)parseUncodedValueCollection:()Display referenceRanges:withCompletion:;
+ (void)parseValueCollection:()Display referenceRanges:healthRecordsStore:withCompletion:;
- (id)_stringsForValues:()Display;
- (id)displayString;
- (uint64_t)_joinValueStrings:()Display;
@end

@implementation HKInspectableValueCollection(Display)

- (id)displayString
{
  v11[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 collectionType];
  if ((unint64_t)(v3 - 2) < 2)
  {
    v5 = [a1 inspectableValues];
    v6 = [a1 _stringsForValues:v5];
    v1 = [a1 _joinValueStrings:v6];
LABEL_7:

    goto LABEL_8;
  }
  if (v3 == 1)
  {
    v5 = [a1 min];
    v6 = [v5 displayString];
    v11[0] = v6;
    v7 = [a1 max];
    v8 = [v7 displayString];
    v11[1] = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    v1 = [a1 _joinValueStrings:v9];

    goto LABEL_7;
  }
  if (!v3)
  {
    v4 = [a1 inspectableValue];
    v1 = [v4 displayString];
  }
LABEL_8:
  return v1;
}

- (id)_stringsForValues:()Display
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "displayString", (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (uint64_t)_joinValueStrings:()Display
{
  return [a3 componentsJoinedByString:@"/"];
}

+ (void)parseValueCollection:()Display referenceRanges:healthRecordsStore:withCompletion:
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  long long v13 = a6;
  if (!v12 || [v10 collectionType]) {
    goto LABEL_3;
  }
  long long v14 = [v10 inspectableValue];
  if ([v14 valueType] == 7)
  {
  }
  else
  {
    long long v15 = [v10 inspectableValue];
    uint64_t v16 = [v15 valueType];

    if (v16 != 9)
    {
LABEL_3:
      [a1 parseUncodedValueCollection:v10 referenceRanges:v11 withCompletion:v13];
      goto LABEL_4;
    }
  }
  uint64_t v17 = [v10 inspectableValue];
  uint64_t v18 = [v17 valueType];

  v19 = [v10 inspectableValue];
  v20 = v19;
  if (v18 == 9)
  {
    v21 = [v19 dataAbsentReason];
    v22 = [v21 localizedPreferredName];

    if (![(__CFString *)v22 length])
    {
      _HKInitializeLogging();
      v23 = (void *)*MEMORY[0x1E4F29F38];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_FAULT)) {
        +[HKInspectableValueCollection(Display) parseValueCollection:referenceRanges:healthRecordsStore:withCompletion:](v23, v10);
      }

      v22 = &stru_1F3B9CF20;
    }
    v13[2](v13, 0, v22, &stru_1F3B9CF20, 1);
  }
  else
  {
    v24 = [v19 ontologyConcept];
    v22 = [v24 localizedPreferredName];

    if (![(__CFString *)v22 length])
    {
      _HKInitializeLogging();
      v25 = (void *)*MEMORY[0x1E4F29F38];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_FAULT)) {
        +[HKInspectableValueCollection(Display) parseValueCollection:referenceRanges:healthRecordsStore:withCompletion:](v25, v10);
      }

      v22 = &stru_1F3B9CF20;
    }
    v13[2](v13, 0, v22, &stru_1F3B9CF20, 0);
  }

LABEL_4:
}

+ (void)parseUncodedValueCollection:()Display referenceRanges:withCompletion:
{
  id v11 = a5;
  if (a3)
  {
    id v7 = a3;
    uint64_t v8 = [v7 valueInRangeWithReferenceRanges:a4 includeUnitString:1];
    v9 = [v7 displayString];
    a3 = objc_msgSend(v9, "hk_trimWhitespaceAndNewlines");

    id v10 = [MEMORY[0x1E4F2B120] _unitStringForValueCollection:v7];
  }
  else
  {
    uint64_t v8 = 0;
    id v10 = 0;
  }
  v11[2](v11, v8, a3, v10, 0);
}

+ (void)parseValueCollection:()Display referenceRanges:healthRecordsStore:withCompletion:.cold.1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 inspectableValue];
  id v5 = [v4 dataAbsentReason];
  OUTLINED_FUNCTION_0_2(&dword_1E0B26000, v6, v7, "Data absent reasaon display name should not be nil: %@", v8, v9, v10, v11, 2u);
}

+ (void)parseValueCollection:()Display referenceRanges:healthRecordsStore:withCompletion:.cold.2(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 inspectableValue];
  id v5 = [v4 ontologyConcept];
  OUTLINED_FUNCTION_0_2(&dword_1E0B26000, v6, v7, "Concept display name should not be nil: %@", v8, v9, v10, v11, 2u);
}

@end