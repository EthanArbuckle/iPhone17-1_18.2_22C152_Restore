@interface WFTrelloListSubstitutableState
+ (Class)processingValueClass;
+ (id)serializedRepresentationFromValue:(id)a3;
+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
@end

@implementation WFTrelloListSubstitutableState

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

      v14 = [(WFVariableSubstitutableParameterState *)self variable];
      uint64_t v15 = objc_opt_class();
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __91__WFTrelloListSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
      v17[3] = &unk_264E5E1E0;
      id v18 = v10;
      [v14 getObjectRepresentationForClass:v15 context:v8 completionHandler:v17];

      v12 = v18;
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)WFTrelloListSubstitutableState;
    [(WFVariableSubstitutableParameterState *)&v16 processWithContext:v8 userInputRequiredHandler:v9 valueHandler:v10];
  }
}

void __91__WFTrelloListSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a5;
  id v8 = +[WFTrelloList listWithName:a2];
  (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v8, v7);
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  if (v7 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = getWFGeneralLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      int v13 = 136315906;
      v14 = "WFEnforceClass";
      __int16 v15 = 2114;
      id v16 = v7;
      __int16 v17 = 2114;
      id v18 = (id)objc_opt_class();
      __int16 v19 = 2114;
      uint64_t v20 = v6;
      id v10 = v18;
      _os_log_impl(&dword_23C364000, v9, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v13, 0x2Au);
    }
    id v8 = 0;
  }
  else
  {
    id v8 = v7;
  }

  if ([v8 count])
  {
    v11 = [MEMORY[0x263F86DD8] modelOfClass:objc_opt_class() fromJSONDictionary:v8 error:0];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  if (a3)
  {
    v4 = [MEMORY[0x263F86DD8] JSONDictionaryFromModel:a3 error:0];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

@end