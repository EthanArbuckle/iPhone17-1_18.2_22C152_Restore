@interface WFHKSampleTypeSubstitutableState
+ (Class)processingValueClass;
+ (id)serializedRepresentationFromValue:(id)a3;
+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
@end

@implementation WFHKSampleTypeSubstitutableState

+ (id)serializedRepresentationFromValue:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"WFHKSampleTypeSubstitutableState.m", 44, @"Invalid parameter not satisfying: %@", @"[value isKindOfClass:[HKSampleType class]]" object file lineNumber description];
  }
  v6 = [v5 identifier];
  v7 = +[WFHealthKitHelper readableSampleTypeIdentifierFromSampleTypeIdentifier:v6];

  return v7;
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  if (v7 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = getWFGeneralLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v17 = 136315906;
      *(void *)&v17[4] = "WFEnforceClass";
      *(_WORD *)&v17[12] = 2114;
      *(void *)&v17[14] = v7;
      *(_WORD *)&v17[22] = 2114;
      id v18 = (id)objc_opt_class();
      LOWORD(v19) = 2114;
      *(void *)((char *)&v19 + 2) = v6;
      id v10 = v18;
      _os_log_impl(&dword_23C364000, v9, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", v17, 0x2Au);
    }
    v8 = 0;
  }
  else
  {
    v8 = (__CFString *)v7;
  }

  if ([(__CFString *)v8 isEqualToString:@"Menstrual Flow"])
  {

    v8 = @"Menstruation";
  }
  v11 = +[WFHealthKitHelper sampleTypeIdentifierFromReadableTypeIdentifier:](WFHealthKitHelper, "sampleTypeIdentifierFromReadableTypeIdentifier:", v8, *(_OWORD *)v17, *(void *)&v17[16], v18, v19);
  if (v11)
  {
    v12 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:v11];
    v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:v11];
    }
    v15 = v14;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8 = a3;
  v9 = (void (**)(id, void *, void))a4;
  id v10 = a5;
  v11 = [(WFVariableSubstitutableParameterState *)self variable];

  if (v11)
  {
    v12 = [(WFVariableSubstitutableParameterState *)self variable];
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v13 = [v12 prompt];
      v9[2](v9, v13, 0);
    }
    else
    {

      id v14 = [(WFVariableSubstitutableParameterState *)self variable];
      uint64_t v15 = objc_opt_class();
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __93__WFHKSampleTypeSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
      v17[3] = &unk_264E5E1E0;
      id v18 = v10;
      [v14 getObjectRepresentationForClass:v15 context:v8 completionHandler:v17];

      v12 = v18;
    }
  }
  else
  {
    v16 = [(WFVariableSubstitutableParameterState *)self value];
    (*((void (**)(id, void *, void))v10 + 2))(v10, v16, 0);
  }
}

void __93__WFHKSampleTypeSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = +[WFHealthKitHelper sampleTypeIdentifierFromReadableTypeIdentifier:a2];
    id v8 = (id)v3;
    if (v3)
    {
      v4 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:v3];
      uint64_t v5 = *(void *)(a1 + 32);
      if (v4)
      {
        (*(void (**)(uint64_t, void *, void))(v5 + 16))(v5, v4, 0);
      }
      else
      {
        id v7 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:v8];
        (*(void (**)(uint64_t, void *, void))(v5 + 16))(v5, v7, 0);
      }
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
  else
  {
    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v6();
  }
}

@end