@interface INSpeedResolutionResult
- (id)_intentSlotValueForObject:(id)a3 slotDescription:(id)a4;
- (id)_vocabularyValueForObject:(id)a3 slotDescription:(id)a4;
@end

@implementation INSpeedResolutionResult

- (id)_vocabularyValueForObject:(id)a3 slotDescription:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 description];
  v8 = [MEMORY[0x1E4F1CA20] systemLocale];
  v9 = [v8 groupingSeparator];
  if ([v6 valueType] == 40)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([v5 unit],
          v10 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v10,
          (isKindOfClass & 1) != 0))
    {
      v12 = NSString;
      v13 = NSNumber;
      id v14 = v5;
      [v14 doubleValue];
      v15 = objc_msgSend(v13, "numberWithDouble:");
      v16 = [v15 description];
      v17 = [v14 unit];

      v18 = [v17 symbol];
      uint64_t v19 = [v12 stringWithFormat:@"%@ %@", v16, v18];

      v7 = (void *)v19;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v34 = v9;
        v35 = v7;
        v36 = v8;
        id v37 = v6;
        id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v38 = v5;
        id obj = v5;
        uint64_t v21 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v41;
          do
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v41 != v23) {
                objc_enumerationMutation(obj);
              }
              v25 = *(void **)(*((void *)&v40 + 1) + 8 * i);
              v26 = NSString;
              v27 = NSNumber;
              [v25 doubleValue];
              v28 = objc_msgSend(v27, "numberWithDouble:");
              v29 = [v28 description];
              v30 = [v25 unit];
              v31 = [v30 symbol];
              v32 = [v26 stringWithFormat:@"%@ %@", v29, v31];

              [v20 addObject:v32];
            }
            uint64_t v22 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
          }
          while (v22);
        }

        v9 = v34;
        v8 = v36;
        v7 = objc_msgSend(v20, "if_escapedComponentsJoinedByString:forLocale:", v34, v36);

        id v6 = v37;
        id v5 = v38;
      }
    }
  }

  return v7;
}

- (id)_intentSlotValueForObject:(id)a3 slotDescription:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc_init(_INPBIntentSlotValue);
  if ([v6 valueType] == 40)
  {
    [(_INPBIntentSlotValue *)v7 setType:16];
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
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v18 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = INIntentSlotValueTransformToSpeedValue(*(void **)(*((void *)&v17 + 1) + 8 * i));
            [(_INPBIntentSlotValue *)v7 addPayloadSpeedValue:v15];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v12);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_17;
      }
      INIntentSlotValueTransformToSpeedValue(v5);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      if (v10) {
        [(_INPBIntentSlotValue *)v7 addPayloadSpeedValue:v10];
      }
    }
  }
LABEL_17:

  return v7;
}

@end