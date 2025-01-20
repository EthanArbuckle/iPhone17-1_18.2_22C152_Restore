@interface INMediaItemResolutionResult
+ (NSArray)successesWithResolvedMediaItems:(NSArray *)resolvedMediaItems;
- (id)_intentSlotValueForObject:(id)a3 slotDescription:(id)a4;
- (id)_vocabularyValueForObject:(id)a3 slotDescription:(id)a4;
@end

@implementation INMediaItemResolutionResult

+ (NSArray)successesWithResolvedMediaItems:(NSArray *)resolvedMediaItems
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = resolvedMediaItems;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](v4, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = v4;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(a1, "resolutionResultSuccessWithResolvedValue:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [v5 addObject:v11];
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return (NSArray *)v5;
}

- (id)_vocabularyValueForObject:(id)a3 slotDescription:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 description];
  uint64_t v8 = [MEMORY[0x1E4F1CA20] systemLocale];
  uint64_t v9 = [v8 groupingSeparator];
  if ([v6 valueType] == 153)
  {
    if ([v6 valueStyle] == 3
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && ([v5 firstObject],
          v10 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v10,
          (isKindOfClass & 1) != 0))
    {
      v12 = [v5 valueForKey:@"spokenPhrase"];
      uint64_t v13 = objc_msgSend(v12, "if_escapedComponentsJoinedByString:forLocale:", v9, v8);

      uint64_t v7 = v12;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_9;
      }
      uint64_t v13 = [v5 spokenPhrase];
    }

    uint64_t v7 = (void *)v13;
  }
LABEL_9:

  return v7;
}

- (id)_intentSlotValueForObject:(id)a3 slotDescription:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_alloc_init(_INPBIntentSlotValue);
  if ([v6 valueType] == 153)
  {
    [(_INPBIntentSlotValue *)v7 setType:1000];
    if ([v6 valueStyle] == 3
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && ([v5 firstObject],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
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
            long long v15 = INIntentSlotValueTransformToMediaItemValue(*(void **)(*((void *)&v17 + 1) + 8 * i));
            [(_INPBIntentSlotValue *)v7 addPayloadMediaItemValue:v15];
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
      INIntentSlotValueTransformToMediaItemValue(v5);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      if (v10) {
        [(_INPBIntentSlotValue *)v7 addPayloadMediaItemValue:v10];
      }
    }
  }
LABEL_17:

  return v7;
}

@end