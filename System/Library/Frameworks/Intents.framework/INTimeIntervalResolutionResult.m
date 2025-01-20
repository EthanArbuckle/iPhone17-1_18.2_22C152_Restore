@interface INTimeIntervalResolutionResult
+ (INTimeIntervalResolutionResult)confirmationRequiredWithTimeIntervalToConfirm:(NSTimeInterval)timeIntervalToConfirm;
+ (INTimeIntervalResolutionResult)successWithResolvedTimeInterval:(NSTimeInterval)resolvedTimeInterval;
- (id)_intentSlotValueForObject:(id)a3 slotDescription:(id)a4;
- (id)_vocabularyValueForObject:(id)a3 slotDescription:(id)a4;
@end

@implementation INTimeIntervalResolutionResult

+ (INTimeIntervalResolutionResult)confirmationRequiredWithTimeIntervalToConfirm:(NSTimeInterval)timeIntervalToConfirm
{
  v4 = [NSNumber numberWithDouble:timeIntervalToConfirm];
  v5 = [a1 resolutionResultConfirmationRequiredWithItemToConfirm:v4];

  return (INTimeIntervalResolutionResult *)v5;
}

+ (INTimeIntervalResolutionResult)successWithResolvedTimeInterval:(NSTimeInterval)resolvedTimeInterval
{
  v4 = [NSNumber numberWithDouble:resolvedTimeInterval];
  v5 = [a1 resolutionResultSuccessWithResolvedValue:v4];

  return (INTimeIntervalResolutionResult *)v5;
}

- (id)_vocabularyValueForObject:(id)a3 slotDescription:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 description];
  v8 = [MEMORY[0x1E4F1CA20] systemLocale];
  v9 = [v8 groupingSeparator];
  if ([v6 valueType] == 21 || objc_msgSend(v6, "valueType") == 4 || objc_msgSend(v6, "valueType") == 3)
  {
    if ([v6 valueStyle] != 3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_11;
      }
      uint64_t v13 = [v5 stringValue];
      goto LABEL_10;
    }
  }
  else if ([v6 valueType] != 22)
  {
    goto LABEL_11;
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
LABEL_10:

      v7 = (void *)v13;
    }
  }
LABEL_11:

  return v7;
}

- (id)_intentSlotValueForObject:(id)a3 slotDescription:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc_init(_INPBIntentSlotValue);
  if ([v6 valueType] == 21)
  {
    [(_INPBIntentSlotValue *)v7 setType:2];
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
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v36 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = INIntentSlotValueTransformToDouble(*(void **)(*((void *)&v35 + 1) + 8 * i));
            v16 = [v15 values];
            v17 = [v16 firstObject];
            [(_INPBIntentSlotValue *)v7 addPayloadDoubleValue:v17];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v35 objects:v40 count:16];
        }
        while (v12);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_33;
      }
      INIntentSlotValueTransformToDouble(v5);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      v28 = [v10 values];
      v29 = [v28 firstObject];
      [(_INPBIntentSlotValue *)v7 addPayloadDoubleValue:v29];
    }
  }
  else if ([v6 valueType] == 22)
  {
    [(_INPBIntentSlotValue *)v7 setType:51];
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
          v21 = objc_alloc_init(_INPBDoubleList);
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          id v22 = v20;
          uint64_t v23 = [v22 countByEnumeratingWithState:&v31 objects:v39 count:16];
          if (v23)
          {
            uint64_t v24 = v23;
            uint64_t v25 = *(void *)v32;
            do
            {
              for (uint64_t j = 0; j != v24; ++j)
              {
                if (*(void *)v32 != v25) {
                  objc_enumerationMutation(v22);
                }
                v27 = INIntentSlotValueTransformToDouble(*(void **)(*((void *)&v31 + 1) + 8 * j));
                -[_INPBDoubleList addDataString:](v21, "addDataString:", v27, (void)v31);
              }
              uint64_t v24 = [v22 countByEnumeratingWithState:&v31 objects:v39 count:16];
            }
            while (v24);
          }

          [(_INPBIntentSlotValue *)v7 addPayloadDoubleList:v21];
        }
      }
    }
  }
  else if ([v6 valueType] == 4 || objc_msgSend(v6, "valueType") == 3)
  {
    [(_INPBIntentSlotValue *)v7 setType:103];
    if ([v6 valueStyle] != 3)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v5 doubleValue];
        -[_INPBIntentSlotValue addPayloadPrimitiveDouble:](v7, "addPayloadPrimitiveDouble:");
      }
    }
  }
LABEL_33:

  return v7;
}

@end