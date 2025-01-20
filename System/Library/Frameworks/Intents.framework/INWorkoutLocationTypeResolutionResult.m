@interface INWorkoutLocationTypeResolutionResult
+ (INWorkoutLocationTypeResolutionResult)confirmationRequiredWithWorkoutLocationTypeToConfirm:(INWorkoutLocationType)workoutLocationTypeToConfirm;
+ (INWorkoutLocationTypeResolutionResult)successWithResolvedWorkoutLocationType:(INWorkoutLocationType)resolvedWorkoutLocationType;
- (id)_intentSlotValueForObject:(id)a3 slotDescription:(id)a4;
- (id)_vocabularyValueForObject:(id)a3 slotDescription:(id)a4;
- (void)transformResolutionResultForIntent:(id)a3 intentSlotDescription:(id)a4 withOptionsProvider:(id)a5 completion:(id)a6;
@end

@implementation INWorkoutLocationTypeResolutionResult

+ (INWorkoutLocationTypeResolutionResult)confirmationRequiredWithWorkoutLocationTypeToConfirm:(INWorkoutLocationType)workoutLocationTypeToConfirm
{
  if (workoutLocationTypeToConfirm == INWorkoutLocationTypeUnknown)
  {
    id v7 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Confirmation of INWorkoutLocationTypeUnknown is not supported." userInfo:0];
    objc_exception_throw(v7);
  }
  v4 = objc_msgSend(NSNumber, "numberWithInteger:");
  v5 = [a1 resolutionResultConfirmationRequiredWithItemToConfirm:v4];

  return (INWorkoutLocationTypeResolutionResult *)v5;
}

+ (INWorkoutLocationTypeResolutionResult)successWithResolvedWorkoutLocationType:(INWorkoutLocationType)resolvedWorkoutLocationType
{
  if (resolvedWorkoutLocationType)
  {
    v4 = objc_msgSend(NSNumber, "numberWithInteger:");
    v5 = [a1 resolutionResultSuccessWithResolvedValue:v4];
  }
  else
  {
    NSLog((NSString *)@"Success resolution with INWorkoutLocationTypeUnknown will be reformed to notRequired.", a2);
    v5 = [a1 notRequired];
  }

  return (INWorkoutLocationTypeResolutionResult *)v5;
}

- (void)transformResolutionResultForIntent:(id)a3 intentSlotDescription:(id)a4 withOptionsProvider:(id)a5 completion:(id)a6
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = (void (**)(id, INWorkoutLocationTypeResolutionResult *))a6;
  int64_t v12 = [(INIntentResolutionResult *)self resolutionResultCode];
  v13 = [v9 _metadata];
  v14 = [v10 facadePropertyName];
  v15 = [v13 forceNeedsValueForParameters];
  int v16 = [v15 containsObject:v14];

  if (v16)
  {
    v17 = [v9 valueForKey:v14];
    if (v17)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v18 = v17;
      }
      else {
        v18 = 0;
      }
    }
    else
    {
      v18 = 0;
    }
    id v19 = v18;

    uint64_t v20 = [v19 integerValue];
    if (!v20 && v12 != 2 && v12 != 3)
    {
      int64_t v12 = 4;
      [(INIntentResolutionResult *)self setResolutionResultCode:4];
    }
    v21 = [v13 forceNeedsValueForParameters];
    v22 = objc_msgSend(v21, "if_arrayByRemovingObject:", v14);
    [v13 setForceNeedsValueForParameters:v22];
  }
  if ((v12 == 4 || v12 == 1) && [v9 _executionContext] != 1)
  {
    v23 = [v9 _codableDescription];
    v24 = [v10 facadePropertyName];
    v25 = [v23 attributeByName:v24];

    if (v25)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v26 = v25;
      }
      else {
        v26 = 0;
      }
    }
    else
    {
      v26 = 0;
    }
    id v27 = v26;

    v28 = [v27 codableEnum];
    if (v28)
    {
      id v40 = v27;
      v41 = v14;
      v42 = self;
      id v43 = v10;
      id v29 = objc_alloc(MEMORY[0x1E4F1CA48]);
      v30 = [v28 values];
      v31 = objc_msgSend(v29, "initWithCapacity:", objc_msgSend(v30, "count"));

      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      v39 = v28;
      v32 = [v28 values];
      uint64_t v33 = [v32 countByEnumeratingWithState:&v44 objects:v48 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v45;
        do
        {
          for (uint64_t i = 0; i != v34; ++i)
          {
            if (*(void *)v45 != v35) {
              objc_enumerationMutation(v32);
            }
            v37 = *(void **)(*((void *)&v44 + 1) + 8 * i);
            if ([v37 index])
            {
              v38 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v37, "index"));
              [v31 addObject:v38];
            }
          }
          uint64_t v34 = [v32 countByEnumeratingWithState:&v44 objects:v48 count:16];
        }
        while (v34);
      }

      if (v12 == 4) {
        [(INIntentResolutionResult *)v42 setResolutionResultCode:2];
      }
      [(INIntentResolutionResult *)v42 setDisambiguationItems:v31];
      v11[2](v11, v42);

      id v10 = v43;
      id v27 = v40;
      v14 = v41;
      v28 = v39;
    }
    else
    {
      v11[2](v11, self);
    }
  }
  else
  {
    v11[2](v11, self);
  }
}

- (id)_vocabularyValueForObject:(id)a3 slotDescription:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 description];
  uint64_t v8 = [v6 valueType];

  if (v8 == 116)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = [v5 integerValue];
      id v10 = @"unknown";
      if (v9 == 2) {
        id v10 = @"indoor";
      }
      if (v9 == 1) {
        id v10 = @"outdoor";
      }
      v11 = v10;

      id v7 = v11;
    }
  }

  return v7;
}

- (id)_intentSlotValueForObject:(id)a3 slotDescription:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(_INPBIntentSlotValue);
  if ([v6 valueType] == 116)
  {
    [(_INPBIntentSlotValue *)v7 setType:1000];
    if ([v6 valueStyle] != 3)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v8 = [v5 integerValue];
        if (v8 == 1) {
          unsigned int v9 = 0;
        }
        else {
          unsigned int v9 = 0x7FFFFFFF;
        }
        if (v8 == 2) {
          uint64_t v10 = 1;
        }
        else {
          uint64_t v10 = v9;
        }
        [(_INPBIntentSlotValue *)v7 addPayloadWorkoutLocationType:v10];
      }
    }
  }

  return v7;
}

@end