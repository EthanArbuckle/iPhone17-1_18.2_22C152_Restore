@interface INIntegerResolutionResult
+ (INIntegerResolutionResult)successWithResolvedValue:(NSInteger)resolvedValue;
- (id)_intentSlotValueForObject:(id)a3 slotDescription:(id)a4;
- (id)_vocabularyValueForObject:(id)a3 slotDescription:(id)a4;
@end

@implementation INIntegerResolutionResult

+ (INIntegerResolutionResult)successWithResolvedValue:(NSInteger)resolvedValue
{
  v4 = [NSNumber numberWithInteger:resolvedValue];
  v5 = [a1 resolutionResultSuccessWithResolvedValue:v4];

  return (INIntegerResolutionResult *)v5;
}

- (id)_vocabularyValueForObject:(id)a3 slotDescription:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 description];
  v8 = [MEMORY[0x1E4F1CA20] systemLocale];
  v9 = [v8 groupingSeparator];
  if ([v6 valueType] == 24
    || [v6 valueType] == 8
    || [v6 valueType] == 5
    || [v6 valueType] == 9
    || [v6 valueType] == 6)
  {
    if ([v6 valueStyle] != 3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_13;
      }
      uint64_t v13 = [v5 stringValue];
      goto LABEL_12;
    }
  }
  else if ([v6 valueType] != 25)
  {
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = [v5 firstObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v12 = [v5 valueForKey:@"stringValue"];
      uint64_t v13 = objc_msgSend(v12, "if_escapedComponentsJoinedByString:forLocale:", v9, v8);

      v7 = v12;
LABEL_12:

      v7 = (void *)v13;
    }
  }
LABEL_13:

  return v7;
}

- (id)_intentSlotValueForObject:(id)a3 slotDescription:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc_init(_INPBIntentSlotValue);
  if ([v6 valueType] == 24)
  {
    [(_INPBIntentSlotValue *)v7 setType:3];
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
          id v10 = v5;
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v48 objects:v54 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v49;
            do
            {
              for (uint64_t i = 0; i != v12; ++i)
              {
                if (*(void *)v49 != v13) {
                  objc_enumerationMutation(v10);
                }
                v15 = INIntentSlotValueTransformToInteger(*(void **)(*((void *)&v48 + 1) + 8 * i));
                v16 = [v15 values];
                v17 = [v16 firstObject];
                [(_INPBIntentSlotValue *)v7 addPayloadIntegerValue:v17];
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v48 objects:v54 count:16];
            }
            while (v12);
          }
          goto LABEL_47;
        }
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_48;
    }
    INIntentSlotValueTransformToInteger(v5);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    v28 = [v10 values];
    v29 = [v28 firstObject];
    [(_INPBIntentSlotValue *)v7 addPayloadIntegerValue:v29];
LABEL_46:

LABEL_47:
    goto LABEL_48;
  }
  if ([v6 valueType] == 25)
  {
    [(_INPBIntentSlotValue *)v7 setType:52];
    if ([v6 valueStyle] != 3)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18 = [v5 firstObject];
        objc_opt_class();
        char v19 = objc_opt_isKindOfClass();

        if (v19)
        {
          id v20 = v5;
          v21 = objc_alloc_init(_INPBIntegerList);
          long long v44 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          id v22 = v20;
          uint64_t v23 = [v22 countByEnumeratingWithState:&v44 objects:v53 count:16];
          if (v23)
          {
            uint64_t v24 = v23;
            uint64_t v25 = *(void *)v45;
            do
            {
              for (uint64_t j = 0; j != v24; ++j)
              {
                if (*(void *)v45 != v25) {
                  objc_enumerationMutation(v22);
                }
                v27 = INIntentSlotValueTransformToInteger(*(void **)(*((void *)&v44 + 1) + 8 * j));
                [(_INPBIntegerList *)v21 addDataString:v27];
              }
              uint64_t v24 = [v22 countByEnumeratingWithState:&v44 objects:v53 count:16];
            }
            while (v24);
          }

          [(_INPBIntentSlotValue *)v7 addPayloadIntegerList:v21];
        }
      }
    }
  }
  else
  {
    if ([v6 valueType] == 26)
    {
      [(_INPBIntentSlotValue *)v7 setType:8];
      if ([v6 valueStyle] == 3)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v30 = [v5 firstObject];
          objc_opt_class();
          char v31 = objc_opt_isKindOfClass();

          if (v31)
          {
            id v10 = v5;
            long long v40 = 0u;
            long long v41 = 0u;
            long long v42 = 0u;
            long long v43 = 0u;
            uint64_t v32 = [v10 countByEnumeratingWithState:&v40 objects:v52 count:16];
            if (v32)
            {
              uint64_t v33 = v32;
              uint64_t v34 = *(void *)v41;
              do
              {
                for (uint64_t k = 0; k != v33; ++k)
                {
                  if (*(void *)v41 != v34) {
                    objc_enumerationMutation(v10);
                  }
                  v36 = INIntentSlotValueTransformToLong(*(void **)(*((void *)&v40 + 1) + 8 * k));
                  v37 = [v36 values];
                  v38 = [v37 firstObject];
                  [(_INPBIntentSlotValue *)v7 addPayloadLongValue:v38];
                }
                uint64_t v33 = [v10 countByEnumeratingWithState:&v40 objects:v52 count:16];
              }
              while (v33);
            }
            goto LABEL_47;
          }
        }
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_48;
      }
      INIntentSlotValueTransformToLong(v5);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      v28 = [v10 values];
      v29 = [v28 firstObject];
      [(_INPBIntentSlotValue *)v7 addPayloadLongValue:v29];
      goto LABEL_46;
    }
    if ([v6 valueType] == 8 || objc_msgSend(v6, "valueType") == 5)
    {
      [(_INPBIntentSlotValue *)v7 setType:101];
      if ([v6 valueStyle] != 3)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          -[_INPBIntentSlotValue addPayloadPrimitiveInt:](v7, "addPayloadPrimitiveInt:", [v5 intValue]);
        }
      }
    }
    else if ([v6 valueType] == 9 || objc_msgSend(v6, "valueType") == 6)
    {
      [(_INPBIntentSlotValue *)v7 setType:102];
      if ([v6 valueStyle] != 3)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          -[_INPBIntentSlotValue addPayloadPrimitiveLong:](v7, "addPayloadPrimitiveLong:", [v5 longLongValue]);
        }
      }
    }
  }
LABEL_48:

  return v7;
}

@end