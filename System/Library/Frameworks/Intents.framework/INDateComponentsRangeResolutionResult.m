@interface INDateComponentsRangeResolutionResult
- (id)_intentSlotValueForObject:(id)a3 slotDescription:(id)a4;
- (id)_vocabularyValueForObject:(id)a3 slotDescription:(id)a4;
@end

@implementation INDateComponentsRangeResolutionResult

- (id)_vocabularyValueForObject:(id)a3 slotDescription:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 description];
  if ([v6 valueType] == 16)
  {
    if ([v6 valueStyle] != 3)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v8 = NSString;
        id v9 = v5;
        v10 = [v9 startDate];
        v11 = [v9 endDate];

        uint64_t v12 = [v8 stringWithFormat:@"%@ - %@", v10, v11];

        v7 = (void *)v12;
      }
    }
  }
  else if ([v6 valueType] == 17)
  {
    [v6 valueStyle];
  }

  return v7;
}

- (id)_intentSlotValueForObject:(id)a3 slotDescription:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc_init(_INPBIntentSlotValue);
  if ([v6 valueType] == 16)
  {
    [(_INPBIntentSlotValue *)v7 setType:5];
    if ([v6 valueStyle] == 3)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v8 = [v5 firstObject];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          v10 = (_INPBDateTimeRangeList *)v5;
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          uint64_t v11 = [(_INPBDateTimeRangeList *)v10 countByEnumeratingWithState:&v32 objects:v37 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v33;
            do
            {
              for (uint64_t i = 0; i != v12; ++i)
              {
                if (*(void *)v33 != v13) {
                  objc_enumerationMutation(v10);
                }
                v15 = INIntentSlotValueTransformToDateTimeRange(*(void **)(*((void *)&v32 + 1) + 8 * i));
                v16 = [v15 values];
                v17 = [v16 firstObject];
                [(_INPBIntentSlotValue *)v7 addPayloadDateTimeRangeValue:v17];
              }
              uint64_t v12 = [(_INPBDateTimeRangeList *)v10 countByEnumeratingWithState:&v32 objects:v37 count:16];
            }
            while (v12);
          }
          goto LABEL_29;
        }
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_30;
    }
    INIntentSlotValueTransformToDateTimeRange(v5);
    v10 = (_INPBDateTimeRangeList *)objc_claimAutoreleasedReturnValue();
    id v20 = [(_INPBDateTimeRangeList *)v10 values];
    v26 = [v20 firstObject];
    [(_INPBIntentSlotValue *)v7 addPayloadDateTimeRangeValue:v26];

LABEL_28:
LABEL_29:

    goto LABEL_30;
  }
  if ([v6 valueType] == 17)
  {
    [(_INPBIntentSlotValue *)v7 setType:54];
    if ([v6 valueStyle] != 3)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v18 = [v5 firstObject];
          objc_opt_class();
          char v19 = objc_opt_isKindOfClass();

          if (v19)
          {
            v10 = objc_alloc_init(_INPBDateTimeRangeList);
            id v20 = v5;
            long long v28 = 0u;
            long long v29 = 0u;
            long long v30 = 0u;
            long long v31 = 0u;
            uint64_t v21 = [v20 countByEnumeratingWithState:&v28 objects:v36 count:16];
            if (v21)
            {
              uint64_t v22 = v21;
              uint64_t v23 = *(void *)v29;
              do
              {
                for (uint64_t j = 0; j != v22; ++j)
                {
                  if (*(void *)v29 != v23) {
                    objc_enumerationMutation(v20);
                  }
                  v25 = INIntentSlotValueTransformToDateTimeRange(*(void **)(*((void *)&v28 + 1) + 8 * j));
                  [(_INPBDateTimeRangeList *)v10 addDateRange:v25];
                }
                uint64_t v22 = [v20 countByEnumeratingWithState:&v28 objects:v36 count:16];
              }
              while (v22);
            }
            [(_INPBIntentSlotValue *)v7 addPayloadDateTimeRangeList:v10];
            goto LABEL_28;
          }
        }
      }
    }
  }
LABEL_30:

  return v7;
}

@end