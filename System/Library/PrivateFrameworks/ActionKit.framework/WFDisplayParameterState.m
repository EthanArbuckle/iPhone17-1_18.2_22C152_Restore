@interface WFDisplayParameterState
+ (Class)processingValueClass;
+ (id)serializedRepresentationFromValue:(id)a3;
+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
@end

@implementation WFDisplayParameterState

+ (id)serializedRepresentationFromValue:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"WFDisplayParameterState.m", 57, @"Invalid parameter not satisfying: %@", @"[value isKindOfClass:[WFDisplay class]]" object file lineNumber description];
  }
  v6 = [v5 serializedRepresentation];

  return v6;
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  v7 = (objc_class *)MEMORY[0x263F33858];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[[v7 alloc] initWithSerializedRepresentation:v10 variableProvider:v9 parameter:v8];

  return v11;
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v13 = a3;
  id v8 = (void (**)(id, void *, void))a4;
  id v9 = (void (**)(id, void *, void))a5;
  id v10 = [(WFVariableSubstitutableParameterState *)self variable];

  if (v10)
  {
    v11 = [(WFVariableSubstitutableParameterState *)self variable];
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v12 = [v11 prompt];
      v8[2](v8, v12, 0);
    }
    else
    {

      v11 = [(WFVariableSubstitutableParameterState *)self variable];
      [v11 getContentWithContext:v13 completionHandler:v9];
    }
  }
  else
  {
    v11 = [(WFVariableSubstitutableParameterState *)self value];
    v9[2](v9, v11, 0);
  }
}

@end