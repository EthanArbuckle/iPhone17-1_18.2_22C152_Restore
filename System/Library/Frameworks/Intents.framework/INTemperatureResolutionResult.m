@interface INTemperatureResolutionResult
- (id)_intentSlotValueForObject:(id)a3 slotDescription:(id)a4;
- (id)_vocabularyValueForObject:(id)a3 slotDescription:(id)a4;
@end

@implementation INTemperatureResolutionResult

- (id)_vocabularyValueForObject:(id)a3 slotDescription:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 description];
  v8 = [MEMORY[0x1E4F1CA20] systemLocale];
  v9 = [v8 groupingSeparator];
  if ([v6 valueType] == 32 || objc_msgSend(v6, "valueType") == 33)
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
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc_init(_INPBIntentSlotValue);
  if ([v6 valueType] == 32)
  {
    [(_INPBIntentSlotValue *)v7 setType:10];
    if ([v6 valueStyle] == 3)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = v5;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v32;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v32 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = INIntentSlotValueTransformToTemperatureValue(*(void **)(*((void *)&v31 + 1) + 8 * i));
              [(_INPBIntentSlotValue *)v7 addPayloadTemperatureValue:v13];
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
          }
          while (v10);
        }
        goto LABEL_26;
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v22 = [v5 unit];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
LABEL_25:
        INIntentSlotValueTransformToTemperatureValue(v5);
        id v8 = (id)objc_claimAutoreleasedReturnValue();
        [(_INPBIntentSlotValue *)v7 addPayloadTemperatureValue:v8];
LABEL_26:
      }
    }
  }
  else if ([v6 valueType] == 33)
  {
    [(_INPBIntentSlotValue *)v7 setType:59];
    if ([v6 valueStyle] != 3)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = v5;
        v15 = objc_alloc_init(_INPBTemperatureList);
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v16 = v14;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v28;
          do
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v28 != v19) {
                objc_enumerationMutation(v16);
              }
              uint64_t v21 = INIntentSlotValueTransformToTemperature(*(void **)(*((void *)&v27 + 1) + 8 * j));
              -[_INPBTemperatureList addTemperature:](v15, "addTemperature:", v21, (void)v27);
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v27 objects:v35 count:16];
          }
          while (v18);
        }

        [(_INPBIntentSlotValue *)v7 addPayloadTemperatureList:v15];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v25 = [v5 unit];
          objc_opt_class();
          char v26 = objc_opt_isKindOfClass();

          if (v26)
          {
            [(_INPBIntentSlotValue *)v7 setType:10];
            goto LABEL_25;
          }
        }
      }
    }
  }

  return v7;
}

@end