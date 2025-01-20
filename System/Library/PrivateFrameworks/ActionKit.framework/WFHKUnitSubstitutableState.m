@interface WFHKUnitSubstitutableState
+ (Class)processingValueClass;
+ (id)serializedRepresentationFromValue:(id)a3;
+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
@end

@implementation WFHKUnitSubstitutableState

+ (id)serializedRepresentationFromValue:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"WFHKUnitSubstitutableState.m", 30, @"Invalid parameter not satisfying: %@", @"[value isKindOfClass:[HKUnit class]]" object file lineNumber description];
  }
  v6 = [v5 unitString];

  return v6;
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  if (v7)
  {
    if (objc_opt_isKindOfClass())
    {
      v8 = objc_msgSend(MEMORY[0x263F0A830], "wf_safeUnitFromString:", v7);

      goto LABEL_8;
    }
    v9 = getWFGeneralLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      int v12 = 136315906;
      v13 = "WFEnforceClass";
      __int16 v14 = 2114;
      id v15 = v7;
      __int16 v16 = 2114;
      id v17 = (id)objc_opt_class();
      __int16 v18 = 2114;
      uint64_t v19 = v6;
      id v10 = v17;
      _os_log_impl(&dword_23C364000, v9, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v12, 0x2Au);
    }
  }
  v8 = 0;
LABEL_8:

  return v8;
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
    int v12 = [(WFVariableSubstitutableParameterState *)self variable];
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v13 = [v12 prompt];
      v9[2](v9, v13, 0);
    }
    else
    {

      __int16 v14 = [(WFVariableSubstitutableParameterState *)self variable];
      uint64_t v15 = objc_opt_class();
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __87__WFHKUnitSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
      v17[3] = &unk_264E5E1E0;
      id v18 = v10;
      [v14 getObjectRepresentationForClass:v15 context:v8 completionHandler:v17];

      int v12 = v18;
    }
  }
  else
  {
    __int16 v16 = [(WFVariableSubstitutableParameterState *)self value];
    (*((void (**)(id, void *, void))v10 + 2))(v10, v16, 0);
  }
}

void __87__WFHKUnitSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = *(void *)(a1 + 32);
  if (a2)
  {
    id v7 = (void *)MEMORY[0x263F0A830];
    id v8 = a5;
    objc_msgSend(v7, "wf_safeUnitFromString:", a2);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v5 + 16))(v5);
  }
  else
  {
    v9 = *(void (**)(uint64_t, void))(v5 + 16);
    id v10 = a5;
    v9(v5, 0);
  }
}

@end