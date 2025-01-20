@interface INStringResolutionResult
- (id)_intentSlotValueForObject:(id)a3 slotDescription:(id)a4;
- (id)_vocabularyValueForObject:(id)a3 slotDescription:(id)a4;
@end

@implementation INStringResolutionResult

- (id)_vocabularyValueForObject:(id)a3 slotDescription:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 description];
  v8 = [MEMORY[0x1E4F1CA20] systemLocale];
  v9 = [v8 groupingSeparator];
  if ([v6 valueType] == 7 || objc_msgSend(v6, "valueType") == 30)
  {
    if ([v6 valueStyle] != 3) {
      goto LABEL_9;
    }
  }
  else if ([v6 valueType] != 31 || objc_msgSend(v6, "valueStyle") == 3)
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
      uint64_t v12 = objc_msgSend(v5, "if_escapedComponentsJoinedByString:forLocale:", v9, v8);

      v7 = (void *)v12;
    }
  }
LABEL_9:

  return v7;
}

- (id)_intentSlotValueForObject:(id)a3 slotDescription:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc_init(_INPBIntentSlotValue);
  if ([v6 valueType] == 30)
  {
    [(_INPBIntentSlotValue *)v7 setType:1];
    if ([v6 valueStyle] == 3
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && ([v5 firstObject],
          v8 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v8,
          (isKindOfClass & 1) != 0))
    {
      id v10 = v5;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v44 objects:v50 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v45;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v45 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = INIntentSlotValueTransformToString(*(void **)(*((void *)&v44 + 1) + 8 * i));
            v16 = [v15 values];
            v17 = [v16 firstObject];
            [(_INPBIntentSlotValue *)v7 addPayloadStringValue:v17];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v44 objects:v50 count:16];
        }
        while (v12);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_44;
      }
      INIntentSlotValueTransformToString(v5);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      v28 = [v10 values];
      v29 = [v28 firstObject];
      [(_INPBIntentSlotValue *)v7 addPayloadStringValue:v29];
    }
    goto LABEL_27;
  }
  if ([v6 valueType] == 31)
  {
    [(_INPBIntentSlotValue *)v7 setType:50];
    if ([v6 valueStyle] == 3) {
      goto LABEL_44;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = [v5 firstObject];
      objc_opt_class();
      char v19 = objc_opt_isKindOfClass();

      if (v19)
      {
        id v20 = v5;
        v21 = objc_alloc_init(_INPBStringList);
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v22 = v20;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v40 objects:v49 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v41;
          do
          {
            for (uint64_t j = 0; j != v24; ++j)
            {
              if (*(void *)v41 != v25) {
                objc_enumerationMutation(v22);
              }
              v27 = INIntentSlotValueTransformToString(*(void **)(*((void *)&v40 + 1) + 8 * j));
              [(_INPBStringList *)v21 addDataString:v27];
            }
            uint64_t v24 = [v22 countByEnumeratingWithState:&v40 objects:v49 count:16];
          }
          while (v24);
        }

        [(_INPBIntentSlotValue *)v7 addPayloadStringList:v21];
        goto LABEL_44;
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_44;
    }
    [(_INPBIntentSlotValue *)v7 setType:1];
    INIntentSlotValueTransformToStringValue(v5);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    [(_INPBIntentSlotValue *)v7 addPayloadStringValue:v10];
LABEL_27:

    goto LABEL_44;
  }
  if ([v6 valueType] != 7) {
    goto LABEL_44;
  }
  [(_INPBIntentSlotValue *)v7 setType:104];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(_INPBIntentSlotValue *)v7 addPayloadPrimitiveString:v5];
    goto LABEL_44;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v10 = v5;
    uint64_t v30 = [v10 countByEnumeratingWithState:&v36 objects:v48 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v37;
      do
      {
        for (uint64_t k = 0; k != v31; ++k)
        {
          if (*(void *)v37 != v32) {
            objc_enumerationMutation(v10);
          }
          uint64_t v34 = *(void *)(*((void *)&v36 + 1) + 8 * k);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            -[_INPBIntentSlotValue addPayloadPrimitiveString:](v7, "addPayloadPrimitiveString:", v34, (void)v36);
          }
        }
        uint64_t v31 = [v10 countByEnumeratingWithState:&v36 objects:v48 count:16];
      }
      while (v31);
    }
    goto LABEL_27;
  }
LABEL_44:

  return v7;
}

@end