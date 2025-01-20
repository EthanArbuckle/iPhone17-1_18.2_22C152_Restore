@interface INEnumResolutionResult
+ (INEnumResolutionResult)confirmationRequiredWithValueToConfirm:(NSInteger)valueToConfirm;
+ (INEnumResolutionResult)successWithResolvedValue:(NSInteger)resolvedValue;
- (id)_intentSlotValueForObject:(id)a3 slotDescription:(id)a4;
- (id)_vocabularyValueForObject:(id)a3 slotDescription:(id)a4;
- (void)transformResolutionResultForIntent:(id)a3 intentSlotDescription:(id)a4 withOptionsProvider:(id)a5 completion:(id)a6;
@end

@implementation INEnumResolutionResult

+ (INEnumResolutionResult)confirmationRequiredWithValueToConfirm:(NSInteger)valueToConfirm
{
  v4 = [NSNumber numberWithInteger:valueToConfirm];
  v5 = [a1 resolutionResultConfirmationRequiredWithItemToConfirm:v4];

  return (INEnumResolutionResult *)v5;
}

+ (INEnumResolutionResult)successWithResolvedValue:(NSInteger)resolvedValue
{
  v4 = [NSNumber numberWithInteger:resolvedValue];
  v5 = [a1 resolutionResultSuccessWithResolvedValue:v4];

  return (INEnumResolutionResult *)v5;
}

- (void)transformResolutionResultForIntent:(id)a3 intentSlotDescription:(id)a4 withOptionsProvider:(id)a5 completion:(id)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = (void (**)(id, INEnumResolutionResult *))a6;
  int64_t v12 = [(INIntentResolutionResult *)self resolutionResultCode];
  v13 = [v9 _metadata];
  v14 = [v10 facadePropertyName];
  v15 = [v13 forceNeedsValueForParameters];
  LODWORD(a4) = [v15 containsObject:v14];

  if (a4)
  {
    v16 = [v9 valueForKey:v14];
    if (v16)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v17 = v16;
      }
      else {
        v17 = 0;
      }
    }
    else
    {
      v17 = 0;
    }
    id v18 = v17;

    uint64_t v19 = [v18 integerValue];
    if (!v19 && v12 != 2 && v12 != 3)
    {
      int64_t v12 = 4;
      [(INIntentResolutionResult *)self setResolutionResultCode:4];
    }
    v20 = [v13 forceNeedsValueForParameters];
    v21 = objc_msgSend(v20, "if_arrayByRemovingObject:", v14);
    [v13 setForceNeedsValueForParameters:v21];
  }
  if (v12 == 4 || v12 == 1)
  {
    v22 = [v10 codableAttribute];
    v38 = self;
    v39 = v11;
    v34 = v14;
    v36 = v13;
    if (v22)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v23 = v22;
      }
      else {
        v23 = 0;
      }
    }
    else
    {
      v23 = 0;
    }
    id v24 = v23;

    v25 = [MEMORY[0x1E4F1CA48] array];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v26 = [v24 codableEnum];
    v27 = [v26 values];

    uint64_t v28 = [v27 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v41 != v30) {
            objc_enumerationMutation(v27);
          }
          v32 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          if (objc_msgSend(v32, "index", v34, v36))
          {
            v33 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v32, "index"));
            [v25 addObject:v33];
          }
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v29);
    }

    if (v12 == 4) {
      [(INIntentResolutionResult *)v38 setResolutionResultCode:2];
    }
    -[INIntentResolutionResult setDisambiguationItems:](v38, "setDisambiguationItems:", v25, v34, v36);
    v11 = v39;
    v39[2](v39, v38);

    v14 = v35;
    v13 = v37;
  }
  else
  {
    v11[2](v11, self);
  }
}

- (id)_vocabularyValueForObject:(id)a3 slotDescription:(id)a4
{
  return (id)[a3 description];
}

- (id)_intentSlotValueForObject:(id)a3 slotDescription:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc_init(_INPBIntentSlotValue);
  if ([v6 valueType] == 65)
  {
    [(_INPBIntentSlotValue *)v7 setType:1000];
    if ([v6 valueStyle] != 3)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        -[_INPBIntentSlotValue addPayloadEnumeration:](v7, "addPayloadEnumeration:", [v5 integerValue]);
      }
    }
  }

  return v7;
}

@end