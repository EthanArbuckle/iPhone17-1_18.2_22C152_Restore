@interface INSpeakableStringResolutionResult
- (id)_intentSlotValueForObject:(id)a3 slotDescription:(id)a4;
- (id)_vocabularyValueForObject:(id)a3 slotDescription:(id)a4;
@end

@implementation INSpeakableStringResolutionResult

- (id)_vocabularyValueForObject:(id)a3 slotDescription:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 description];
  v8 = [MEMORY[0x1E4F1CA20] systemLocale];
  v9 = [v8 groupingSeparator];
  if ([v6 valueType] == 12)
  {
    if ([v6 valueStyle] != 3) {
      goto LABEL_9;
    }
  }
  else if ([v6 valueType] != 11 || objc_msgSend(v6, "valueStyle") == 3)
  {
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = [v5 firstObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v12 = [v5 valueForKey:@"description"];
      uint64_t v13 = objc_msgSend(v12, "if_escapedComponentsJoinedByString:forLocale:", v9, v8);

      v7 = (void *)v13;
    }
  }
LABEL_9:

  return v7;
}

- (id)_intentSlotValueForObject:(id)a3 slotDescription:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc_init(_INPBIntentSlotValue);
  if ([v6 valueType] != 12)
  {
    if ([v6 valueType] != 13) {
      goto LABEL_29;
    }
    [(_INPBIntentSlotValue *)v7 setType:56];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = objc_alloc_init(_INPBDataStringList);
      INIntentSlotValueTransformToDataString(v5);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      [(_INPBDataStringList *)v8 addDataString:v9];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_29;
      }
      v17 = [v5 firstObject];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        goto LABEL_29;
      }
      v8 = objc_alloc_init(_INPBDataStringList);
      id v9 = v5;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      uint64_t v19 = [v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v26 != v21) {
              objc_enumerationMutation(v9);
            }
            v23 = INIntentSlotValueTransformToDataString(*(void **)(*((void *)&v25 + 1) + 8 * i));
            [(_INPBDataStringList *)v8 addDataString:v23];
          }
          uint64_t v20 = [v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
        }
        while (v20);
      }
    }
    [(_INPBIntentSlotValue *)v7 addPayloadDataStringList:v8];

    goto LABEL_8;
  }
  [(_INPBIntentSlotValue *)v7 setType:7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    INIntentSlotValueTransformToDataString(v5);
    v8 = (_INPBDataStringList *)objc_claimAutoreleasedReturnValue();
    [(_INPBIntentSlotValue *)v7 addPayloadDataString:v8];
LABEL_8:

    goto LABEL_29;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = [v5 firstObject];
    objc_opt_class();
    char v11 = objc_opt_isKindOfClass();

    if (v11)
    {
      v8 = (_INPBDataStringList *)v5;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      uint64_t v12 = [(_INPBDataStringList *)v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v30;
        do
        {
          for (uint64_t j = 0; j != v13; ++j)
          {
            if (*(void *)v30 != v14) {
              objc_enumerationMutation(v8);
            }
            v16 = INIntentSlotValueTransformToDataString(*(void **)(*((void *)&v29 + 1) + 8 * j));
            [(_INPBIntentSlotValue *)v7 addPayloadDataString:v16];
          }
          uint64_t v13 = [(_INPBDataStringList *)v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
        }
        while (v13);
      }
      goto LABEL_8;
    }
  }
LABEL_29:

  return v7;
}

@end