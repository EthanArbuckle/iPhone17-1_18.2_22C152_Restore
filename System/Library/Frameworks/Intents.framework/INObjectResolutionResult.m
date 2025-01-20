@interface INObjectResolutionResult
- (id)_intentSlotValueForObject:(id)a3 slotDescription:(id)a4;
- (id)_vocabularyValueForObject:(id)a3 slotDescription:(id)a4;
- (void)transformResolutionResultForIntent:(id)a3 intentSlotDescription:(id)a4 withOptionsProvider:(id)a5 completion:(id)a6;
@end

@implementation INObjectResolutionResult

- (void)transformResolutionResultForIntent:(id)a3 intentSlotDescription:(id)a4 withOptionsProvider:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [v10 _codableDescription];
  if (v14)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v15 = v14;
    }
    else {
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }
  id v16 = v15;

  v17 = [(INIntentResolutionResult *)self resolvedValue];
  v18 = [v16 _referencedCodableDescriptionsByClassName];
  v19 = +[INCodableDescription _codableDescriptionForTypedObject:v17 inDictionary:v18];

  if (v19)
  {
    v20 = [v11 name];
    v21 = [v16 attributeByName:v20];

    if (v21)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v22 = v21;
      }
      else {
        v22 = 0;
      }
    }
    else
    {
      v22 = 0;
    }
    id v23 = v22;

    [v23 setCodableDescription:v19];
    v24 = [v11 codableAttribute];
    if (v24)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v25 = v24;
      }
      else {
        v25 = 0;
      }
    }
    else
    {
      v25 = 0;
    }
    id v26 = v25;

    [v26 setCodableDescription:v19];
  }
  v27.receiver = self;
  v27.super_class = (Class)INObjectResolutionResult;
  [(INIntentResolutionResult *)&v27 transformResolutionResultForIntent:v10 intentSlotDescription:v11 withOptionsProvider:v12 completion:v13];
}

- (id)_vocabularyValueForObject:(id)a3 slotDescription:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 description];
  v8 = [MEMORY[0x1E4F1CA20] systemLocale];
  v9 = [v8 groupingSeparator];
  if ([v6 valueType] == 225)
  {
    if ([v6 valueStyle] == 3
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && ([v5 firstObject],
          id v10 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v10,
          (isKindOfClass & 1) != 0))
    {
      id v12 = [v5 valueForKey:@"displayString"];
      uint64_t v13 = objc_msgSend(v12, "if_escapedComponentsJoinedByString:forLocale:", v9, v8);

      v7 = v12;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_9;
      }
      uint64_t v13 = [v5 displayString];
    }

    v7 = (void *)v13;
  }
LABEL_9:

  return v7;
}

- (id)_intentSlotValueForObject:(id)a3 slotDescription:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc_init(_INPBIntentSlotValue);
  if ([v6 valueType] == 225)
  {
    [(_INPBIntentSlotValue *)v7 setType:1000];
    v8 = [v6 codableAttribute];
    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v9 = v8;
      }
      else {
        v9 = 0;
      }
    }
    else
    {
      v9 = 0;
    }
    id v10 = v9;

    id v11 = [v10 valueTransformer];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __70__INObjectResolutionResult__intentSlotValueForObject_slotDescription___block_invoke;
    v28[3] = &unk_1E551BA58;
    id v12 = v11;
    id v29 = v12;
    v30 = v7;
    id v13 = v10;
    id v31 = v13;
    v14 = (void (**)(void, void))MEMORY[0x192F984C0](v28);
    if ([v6 valueStyle] == 3
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && ([v5 firstObject],
          v15 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v15,
          (isKindOfClass & 1) != 0))
    {
      id v23 = v12;
      id v17 = v5;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v25 != v20) {
              objc_enumerationMutation(v17);
            }
            v14[2](v14, *(void *)(*((void *)&v24 + 1) + 8 * i));
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
        }
        while (v19);
      }

      id v12 = v23;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        ((void (**)(void, id))v14)[2](v14, v5);
      }
    }
  }

  return v7;
}

void __70__INObjectResolutionResult__intentSlotValueForObject_slotDescription___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  uint64_t v3 = [(id)objc_opt_class() transformedValueClass];
  if (v3 == objc_opt_class())
  {
    id v5 = INIntentSlotValueTransformToCustomObject(v12);
    [*(id *)(a1 + 40) addPayloadCustomObject:v5];
  }
  else
  {
    v4 = [*(id *)(a1 + 48) valueTransformer];
    id v5 = [v4 transformedValue:v12];

    id v6 = [INArchivedObject alloc];
    v7 = [*(id *)(a1 + 48) typeName];
    v8 = [v5 data];
    v9 = [(INArchivedObject *)v6 initWithTypeName:v7 messageData:v8];

    id v10 = *(void **)(a1 + 40);
    id v11 = INIntentSlotValueTransformToArchivedObject(v9);
    [v10 addPayloadArchivedObject:v11];
  }
}

@end