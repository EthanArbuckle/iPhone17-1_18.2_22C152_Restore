@interface INPersonResolutionResult
- (id)_intentSlotValueForObject:(id)a3 slotDescription:(id)a4;
- (id)_vocabularyValueForObject:(id)a3 slotDescription:(id)a4;
@end

@implementation INPersonResolutionResult

- (id)_vocabularyValueForObject:(id)a3 slotDescription:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 description];
  v8 = [MEMORY[0x1E4F1CA20] systemLocale];
  v9 = [v8 groupingSeparator];
  if ([v6 valueType] == 18 || objc_msgSend(v6, "valueType") == 10)
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
        goto LABEL_13;
      }
      uint64_t v13 = [v5 displayName];
      goto LABEL_8;
    }
LABEL_5:
    v12 = [v5 valueForKey:@"displayName"];
    uint64_t v13 = objc_msgSend(v12, "if_escapedComponentsJoinedByString:forLocale:", v9, v8);

    v7 = v12;
LABEL_8:

    v7 = (void *)v13;
    goto LABEL_13;
  }
  if ([v6 valueType] == 11 && objc_msgSend(v6, "valueStyle") != 3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14 = [v5 firstObject];
      objc_opt_class();
      char v15 = objc_opt_isKindOfClass();

      if (v15) {
        goto LABEL_5;
      }
    }
  }
LABEL_13:

  return v7;
}

- (id)_intentSlotValueForObject:(id)a3 slotDescription:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc_init(_INPBIntentSlotValue);
  if ([v6 valueType] == 18)
  {
    [(_INPBIntentSlotValue *)v7 setType:1000];
    if ([v6 valueStyle] == 3
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && ([v5 firstObject],
          v8 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v8,
          (isKindOfClass & 1) != 0))
    {
      v10 = (_INPBContactList *)v5;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      uint64_t v11 = [(_INPBContactList *)v10 countByEnumeratingWithState:&v44 objects:v50 count:16];
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
            char v15 = INIntentSlotValueTransformToDialingContact(*(void **)(*((void *)&v44 + 1) + 8 * i));
            [(_INPBIntentSlotValue *)v7 addPayloadDialingContact:v15];
          }
          uint64_t v12 = [(_INPBContactList *)v10 countByEnumeratingWithState:&v44 objects:v50 count:16];
        }
        while (v12);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_46;
      }
      INIntentSlotValueTransformToDialingContact(v5);
      v10 = (_INPBContactList *)objc_claimAutoreleasedReturnValue();
      [(_INPBIntentSlotValue *)v7 addPayloadDialingContact:v10];
    }
    goto LABEL_45;
  }
  if ([v6 valueType] == 10)
  {
    [(_INPBIntentSlotValue *)v7 setType:4];
    if ([v6 valueStyle] == 3
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && ([v5 firstObject],
          v16 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char v17 = objc_opt_isKindOfClass(),
          v16,
          (v17 & 1) != 0))
    {
      v10 = (_INPBContactList *)v5;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      uint64_t v18 = [(_INPBContactList *)v10 countByEnumeratingWithState:&v40 objects:v49 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v41;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v41 != v20) {
              objc_enumerationMutation(v10);
            }
            v22 = INIntentSlotValueTransformToContact(*(void **)(*((void *)&v40 + 1) + 8 * j));
            v23 = [v22 values];
            v24 = [v23 firstObject];
            [(_INPBIntentSlotValue *)v7 addPayloadContactValue:v24];
          }
          uint64_t v19 = [(_INPBContactList *)v10 countByEnumeratingWithState:&v40 objects:v49 count:16];
        }
        while (v19);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_46;
      }
      INIntentSlotValueTransformToContact(v5);
      v10 = (_INPBContactList *)objc_claimAutoreleasedReturnValue();
      v33 = [(_INPBContactList *)v10 values];
      v34 = [v33 firstObject];
      [(_INPBIntentSlotValue *)v7 addPayloadContactValue:v34];
    }
    goto LABEL_45;
  }
  if ([v6 valueType] == 11)
  {
    [(_INPBIntentSlotValue *)v7 setType:53];
    if ([v6 valueStyle] != 3)
    {
      v10 = objc_alloc_init(_INPBContactList);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && ([v5 firstObject],
            v25 = objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            char v26 = objc_opt_isKindOfClass(),
            v25,
            (v26 & 1) != 0))
      {
        id v27 = v5;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        uint64_t v28 = [v27 countByEnumeratingWithState:&v36 objects:v48 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v37;
          do
          {
            for (uint64_t k = 0; k != v29; ++k)
            {
              if (*(void *)v37 != v30) {
                objc_enumerationMutation(v27);
              }
              v32 = INIntentSlotValueTransformToContact(*(void **)(*((void *)&v36 + 1) + 8 * k));
              [(_INPBContactList *)v10 addContact:v32];
            }
            uint64_t v29 = [v27 countByEnumeratingWithState:&v36 objects:v48 count:16];
          }
          while (v29);
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_44:
          [(_INPBIntentSlotValue *)v7 addPayloadContactList:v10];
LABEL_45:

          goto LABEL_46;
        }
        INIntentSlotValueTransformToContact(v5);
        id v27 = (id)objc_claimAutoreleasedReturnValue();
        [(_INPBContactList *)v10 addContact:v27];
      }

      goto LABEL_44;
    }
  }
LABEL_46:

  return v7;
}

@end