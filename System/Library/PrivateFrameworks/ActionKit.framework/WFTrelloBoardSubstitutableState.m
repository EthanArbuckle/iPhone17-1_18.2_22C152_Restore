@interface WFTrelloBoardSubstitutableState
+ (Class)processingValueClass;
+ (id)serializedRepresentationFromValue:(id)a3;
+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
@end

@implementation WFTrelloBoardSubstitutableState

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
      v17[2] = __92__WFTrelloBoardSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
      v17[3] = &unk_264E5E1E0;
      id v18 = v10;
      [v14 getObjectRepresentationForClass:v15 context:v8 completionHandler:v17];

      v12 = v18;
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)WFTrelloBoardSubstitutableState;
    [(WFVariableSubstitutableParameterState *)&v16 processWithContext:v8 userInputRequiredHandler:v9 valueHandler:v10];
  }
}

void __92__WFTrelloBoardSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  v20[2] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a5;
  v9 = +[WFDiskCache workflowCache];
  id v10 = (void *)MEMORY[0x263EFFA08];
  v20[0] = objc_opt_class();
  v20[1] = objc_opt_class();
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
  v12 = [v10 setWithArray:v11];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __92__WFTrelloBoardSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2;
  v16[3] = &unk_264E55A78;
  id v13 = *(id *)(a1 + 32);
  id v18 = v8;
  id v19 = v13;
  id v17 = v7;
  id v14 = v8;
  id v15 = v7;
  [v9 objectOfClasses:v12 forKey:@"WFTrelloBoards" completion:v16];
}

void __92__WFTrelloBoardSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2(void *a1, void *a2)
{
  uint64_t v3 = a1[6];
  id v4 = [a2 objectMatchingKey:@"name" value:a1[4]];
  (*(void (**)(uint64_t, id, void))(v3 + 16))(v3, v4, a1[5]);
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
      id v14 = "WFEnforceClass";
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
    id v4 = [MEMORY[0x263F86DD8] JSONDictionaryFromModel:a3 error:0];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

@end