@interface WFINRideOptionParameterState
+ (Class)processingValueClass;
+ (id)serializedRepresentationFromValue:(id)a3;
+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
@end

@implementation WFINRideOptionParameterState

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = WFEnforceClass(v5, v6);

  v8 = [v7 objectForKeyedSubscript:@"Name"];
  uint64_t v9 = objc_opt_class();
  v10 = WFEnforceClass(v8, v9);

  v11 = [v7 objectForKeyedSubscript:@"EstimatedPickupDate"];
  uint64_t v12 = objc_opt_class();
  v13 = WFEnforceClass(v11, v12);

  if (v10)
  {
    v14 = (void *)[objc_alloc(MEMORY[0x263F0FE10]) initWithName:v10 estimatedPickupDate:v13];
    v15 = [v7 objectForKeyedSubscript:@"AvailablePartySizeOptions"];
    uint64_t v16 = objc_opt_class();
    v17 = WFEnforceClass(v15, v16);

    if (v17)
    {
      v18 = objc_msgSend(v17, "if_compactMap:", &__block_literal_global_198_37696);
      [v14 setAvailablePartySizeOptions:v18];
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  id v5 = [v3 name];
  [v4 setObject:v5 forKey:@"Name"];

  uint64_t v6 = [v3 estimatedPickupDate];
  [v4 setValue:v6 forKey:@"EstimatedPickupDate"];

  v7 = [v3 availablePartySizeOptions];

  if (v7)
  {
    v8 = [v3 availablePartySizeOptions];
    uint64_t v9 = objc_msgSend(v8, "if_compactMap:", &__block_literal_global_37715);

    [v4 setObject:v9 forKey:@"AvailablePartySizeOptions"];
  }

  return v4;
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (void (**)(id, void *, void))a4;
  id v10 = a5;
  v11 = [(WFVariableSubstitutableParameterState *)self variable];

  if (v11)
  {
    uint64_t v12 = [(WFVariableSubstitutableParameterState *)self variable];
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v13 = [v12 prompt];
      v9[2](v9, v13, 0);
    }
    else
    {

      v14 = [(WFVariableSubstitutableParameterState *)self variable];
      uint64_t v15 = objc_opt_class();
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __89__WFINRideOptionParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
      v20[3] = &unk_264E5E1E0;
      id v21 = v10;
      [v14 getObjectRepresentationForClass:v15 context:v8 completionHandler:v20];

      uint64_t v12 = v21;
    }
  }
  else
  {
    id v16 = objc_alloc(MEMORY[0x263F0FFA0]);
    v17 = [(WFVariableSubstitutableParameterState *)self value];
    v18 = [v17 name];
    v19 = (void *)[v16 initWithSpokenPhrase:v18];
    (*((void (**)(id, void *, void))v10 + 2))(v10, v19, 0);
  }
}

void __89__WFINRideOptionParameterState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  uint64_t v8 = *(void *)(a1 + 32);
  id v13 = v7;
  if (v7)
  {
    uint64_t v9 = (objc_class *)MEMORY[0x263F0FFA0];
    id v10 = a5;
    id v11 = (id)[[v9 alloc] initWithSpokenPhrase:v13];
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v11, v10);
  }
  else
  {
    uint64_t v12 = *(void (**)(uint64_t, void, id))(v8 + 16);
    id v11 = a5;
    v12(v8, 0, v11);
  }
}

@end