@interface INPlacemarkResolutionResult
- (id)_intentSlotValueForObject:(id)a3 slotDescription:(id)a4;
- (id)_vocabularyValueForObject:(id)a3 slotDescription:(id)a4;
@end

@implementation INPlacemarkResolutionResult

- (id)_vocabularyValueForObject:(id)a3 slotDescription:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 description];
  v8 = [MEMORY[0x1E4F1CA20] systemLocale];
  v9 = [v8 groupingSeparator];
  if ([v6 valueType] == 27)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || ([v5 firstObject],
          v10 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v10,
          (isKindOfClass & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_12;
      }
      uint64_t v12 = [v5 name];
      goto LABEL_11;
    }
LABEL_10:
    v15 = [v5 valueForKey:@"name"];
    uint64_t v12 = objc_msgSend(v15, "if_escapedComponentsJoinedByString:forLocale:", v9, v8);

    v7 = v15;
LABEL_11:

    v7 = (void *)v12;
    goto LABEL_12;
  }
  if ([v6 valueType] == 28 && objc_msgSend(v6, "valueStyle") != 3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [v5 firstObject];
      objc_opt_class();
      char v14 = objc_opt_isKindOfClass();

      if (v14) {
        goto LABEL_10;
      }
    }
  }
LABEL_12:

  return v7;
}

- (id)_intentSlotValueForObject:(id)a3 slotDescription:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc_init(_INPBIntentSlotValue);
  if ([v6 valueType] == 27)
  {
    [(_INPBIntentSlotValue *)v7 setType:6];
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
            v15 = INIntentSlotValueTransformToLocation(*(void **)(*((void *)&v35 + 1) + 8 * i));
            v16 = [v15 values];
            v17 = [v16 firstObject];
            [(_INPBIntentSlotValue *)v7 addPayloadLocation:v17];
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
        goto LABEL_28;
      }
      INIntentSlotValueTransformToLocation(v5);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      v28 = [v10 values];
      v29 = [v28 firstObject];
      [(_INPBIntentSlotValue *)v7 addPayloadLocation:v29];
    }
  }
  else if ([v6 valueType] == 28)
  {
    [(_INPBIntentSlotValue *)v7 setType:55];
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
          v21 = objc_alloc_init(_INPBLocationList);
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
                v27 = INIntentSlotValueTransformToLocation(*(void **)(*((void *)&v31 + 1) + 8 * j));
                -[_INPBLocationList addLocation:](v21, "addLocation:", v27, (void)v31);
              }
              uint64_t v24 = [v22 countByEnumeratingWithState:&v31 objects:v39 count:16];
            }
            while (v24);
          }

          [(_INPBIntentSlotValue *)v7 addPayloadLocationList:v21];
        }
      }
    }
  }
LABEL_28:

  return v7;
}

@end