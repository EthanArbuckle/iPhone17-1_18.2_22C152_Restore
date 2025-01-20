@interface WFNSUnitSubstitutableState
+ (Class)processingValueClass;
+ (id)serializedRepresentationFromValue:(id)a3;
+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
@end

@implementation WFNSUnitSubstitutableState

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
      v17[2] = __87__WFNSUnitSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
      v17[3] = &unk_264E5E1E0;
      id v18 = v10;
      [v14 getObjectRepresentationForClass:v15 context:v8 completionHandler:v17];

      v12 = v18;
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)WFNSUnitSubstitutableState;
    [(WFVariableSubstitutableParameterState *)&v16 processWithContext:v8 userInputRequiredHandler:v9 valueHandler:v10];
  }
}

void __87__WFNSUnitSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = (void *)MEMORY[0x263F85370];
  id v8 = a5;
  id v9 = [v7 unitFromString:a2];
  (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v9, v8);
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = WFEnforceClass(v5, v6);

  id v8 = [v7 objectForKeyedSubscript:@"WFNSUnitType"];
  uint64_t v9 = objc_opt_class();
  id v10 = WFEnforceClass(v8, v9);

  v11 = [v7 objectForKeyedSubscript:@"WFNSUnitSymbol"];
  uint64_t v12 = objc_opt_class();
  v13 = WFEnforceClass(v11, v12);

  if (v10) {
    BOOL v14 = v13 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
    objc_super v16 = 0;
  }
  else
  {
    uint64_t v15 = [MEMORY[0x263F85370] availableUnitsForUnitType:v10];
    objc_super v16 = [v15 objectMatchingKey:@"symbol" value:v13];
  }
  return v16;
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  v10[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263F85370] unitTypeForUnitClass:objc_opt_class()];
  id v5 = (void *)v4;
  if (v4)
  {
    v9[0] = @"WFNSUnitType";
    v9[1] = @"WFNSUnitSymbol";
    v10[0] = v4;
    uint64_t v6 = [v3 symbol];
    v10[1] = v6;
    v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

@end