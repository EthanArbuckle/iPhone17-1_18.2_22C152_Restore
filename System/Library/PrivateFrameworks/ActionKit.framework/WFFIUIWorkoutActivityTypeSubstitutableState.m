@interface WFFIUIWorkoutActivityTypeSubstitutableState
+ (id)serializedRepresentationFromValue:(id)a3;
+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
@end

@implementation WFFIUIWorkoutActivityTypeSubstitutableState

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
      v17[2] = __104__WFFIUIWorkoutActivityTypeSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
      v17[3] = &unk_264E5E1E0;
      id v18 = v10;
      [v14 getObjectRepresentationForClass:v15 context:v8 completionHandler:v17];

      v12 = v18;
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)WFFIUIWorkoutActivityTypeSubstitutableState;
    [(WFVariableSubstitutableParameterState *)&v16 processWithContext:v8 userInputRequiredHandler:v9 valueHandler:v10];
  }
}

void __104__WFFIUIWorkoutActivityTypeSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a5;
  id v8 = +[WFFitnessUIHelper activityTypeForLocalizedActivityName:a2];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  id v5 = a3;
  getFIUIWorkoutActivityTypeClass_22375();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"WFFIUIWorkoutActivityTypeSubstitutableState.m", 46, @"Invalid parameter not satisfying: %@", @"[value isKindOfClass:getFIUIWorkoutActivityTypeClass()]" object file lineNumber description];
  }
  v6 = objc_opt_new();
  if ([v5 isCategorizedOtherWorkout]) {
    uint64_t v7 = [v5 auxiliaryTypeIdentifier];
  }
  else {
    uint64_t v7 = [v5 identifier];
  }
  id v8 = [NSNumber numberWithUnsignedInteger:v7];
  [v6 setObject:v8 forKey:@"Identifier"];

  v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isIndoor"));
  [v6 setObject:v9 forKey:@"IsIndoor"];

  id v10 = [v5 metadata];
  [v6 setObject:v10 forKey:@"Metadata"];

  return v6;
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = WFEnforceClass(v5, v6);

  if (v7)
  {
    id v8 = [v7 objectForKeyedSubscript:@"Identifier"];
    uint64_t v9 = objc_opt_class();
    id v10 = WFEnforceClass(v8, v9);
    uint64_t v11 = [v10 integerValue];

    v12 = [v7 objectForKeyedSubscript:@"IsIndoor"];
    uint64_t v13 = objc_opt_class();
    v14 = WFEnforceClass(v12, v13);
    uint64_t v15 = [v14 BOOLValue];

    objc_super v16 = [v7 objectForKeyedSubscript:@"Metadata"];
    uint64_t v17 = objc_opt_class();
    id v18 = WFEnforceClass(v16, v17);

    v19 = (void *)[objc_alloc((Class)getFIUIWorkoutActivityTypeClass_22375()) initWithActivityTypeIdentifier:v11 isIndoor:v15 metadata:v18];
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

@end