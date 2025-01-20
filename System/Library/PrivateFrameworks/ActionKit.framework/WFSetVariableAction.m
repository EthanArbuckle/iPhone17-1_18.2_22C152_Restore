@interface WFSetVariableAction
- (BOOL)setParameterState:(id)a3 forKey:(id)a4;
- (id)accessibilityName;
- (id)outputVariableWithVariableProvider:(id)a3 UUIDProvider:(id)a4;
- (id)providedVariableNames;
- (id)variableName;
- (void)runWithInput:(id)a3 error:(id *)a4;
@end

@implementation WFSetVariableAction

- (id)outputVariableWithVariableProvider:(id)a3 UUIDProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(WFSetVariableAction *)self variableName];
  if ([v8 length])
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x263F86F80]) initWithName:v8 variableProvider:v6 aggrandizements:0];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)WFSetVariableAction;
    uint64_t v9 = [(WFSetVariableAction *)&v12 outputVariableWithVariableProvider:v6 UUIDProvider:v7];
  }
  v10 = (void *)v9;

  return v10;
}

- (id)accessibilityName
{
  v3 = [(WFSetVariableAction *)self localizedName];
  uint64_t v4 = [(WFSetVariableAction *)self variableName];
  v5 = (void *)v4;
  id v6 = &stru_26F008428;
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  id v7 = [v3 stringByAppendingFormat:@" (%@)", v6];

  return v7;
}

- (id)providedVariableNames
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [(WFSetVariableAction *)self variableName];
  v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)variableName
{
  uint64_t v2 = [(WFSetVariableAction *)self parameterStateForKey:@"WFVariableName"];
  v3 = [v2 string];

  return v3;
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [v7 isEqualToString:@"WFVariableName"])
  {
    v8 = [(WFSetVariableAction *)self parameterStateForKey:v7];
    uint64_t v9 = [v8 string];

    v14.receiver = self;
    v14.super_class = (Class)WFSetVariableAction;
    BOOL v10 = [(WFSetVariableAction *)&v14 setParameterState:v6 forKey:v7];
    v11 = [v6 string];
    [(WFSetVariableAction *)self didChangeVariableName:v9 to:v11];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)WFSetVariableAction;
    BOOL v10 = [(WFSetVariableAction *)&v13 setParameterState:v6 forKey:v7];
  }

  return v10;
}

- (void)runWithInput:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v8 = [(WFSetVariableAction *)self parameterValueForKey:@"WFVariableName" ofClass:objc_opt_class()];
  id v6 = [(WFSetVariableAction *)self variableSource];
  id v7 = (void *)[v5 copy];

  [v6 setContent:v7 forVariableWithName:v8];
}

@end