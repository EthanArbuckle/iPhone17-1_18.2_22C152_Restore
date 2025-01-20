@interface WFAppendVariableAction
- (BOOL)setParameterState:(id)a3 forKey:(id)a4;
- (BOOL)shouldBeSuggestedAfterAction:(id)a3 inWorkflow:(id)a4;
- (id)accessibilityName;
- (id)inheritedOutputContentClassesInWorkflow:(id)a3 context:(id)a4;
- (id)outputVariableWithVariableProvider:(id)a3 UUIDProvider:(id)a4;
- (id)providedVariableNames;
- (id)variableName;
- (void)runWithInput:(id)a3 error:(id *)a4;
@end

@implementation WFAppendVariableAction

- (id)outputVariableWithVariableProvider:(id)a3 UUIDProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(WFAppendVariableAction *)self variableName];
  if ([v8 length])
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x263F86F80]) initWithName:v8 variableProvider:v6 aggrandizements:0];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)WFAppendVariableAction;
    uint64_t v9 = [(WFAppendVariableAction *)&v12 outputVariableWithVariableProvider:v6 UUIDProvider:v7];
  }
  v10 = (void *)v9;

  return v10;
}

- (id)accessibilityName
{
  v3 = [(WFAppendVariableAction *)self localizedName];
  uint64_t v4 = [(WFAppendVariableAction *)self variableName];
  v5 = (void *)v4;
  id v6 = &stru_26F008428;
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  id v7 = [v3 stringByAppendingFormat:@" (%@)", v6];

  return v7;
}

- (id)inheritedOutputContentClassesInWorkflow:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 containsObject:self])
  {
    v8 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)WFAppendVariableAction;
    uint64_t v9 = [(WFAppendVariableAction *)&v16 inheritedOutputContentClassesInWorkflow:v6 context:v7];
    [v7 addObject:self];
    v10 = [v6 variableAvailability];
    v11 = [(WFAppendVariableAction *)self variableName];
    objc_super v12 = [v6 actions];
    v13 = objc_msgSend(v10, "possibleContentClassesForVariableNamed:atIndex:context:excludingAction:", v11, objc_msgSend(v12, "indexOfObject:", self), v7, self);

    v14 = [v13 array];
    v8 = [v9 arrayByAddingObjectsFromArray:v14];
  }
  return v8;
}

- (id)providedVariableNames
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [(WFAppendVariableAction *)self variableName];
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
  uint64_t v2 = [(WFAppendVariableAction *)self parameterStateForKey:@"WFVariableName"];
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
    v8 = [(WFAppendVariableAction *)self parameterStateForKey:v7];
    uint64_t v9 = [v8 string];

    v14.receiver = self;
    v14.super_class = (Class)WFAppendVariableAction;
    BOOL v10 = [(WFAppendVariableAction *)&v14 setParameterState:v6 forKey:v7];
    v11 = [v6 string];
    [(WFAppendVariableAction *)self didChangeVariableName:v9 to:v11];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)WFAppendVariableAction;
    BOOL v10 = [(WFAppendVariableAction *)&v13 setParameterState:v6 forKey:v7];
  }

  return v10;
}

- (BOOL)shouldBeSuggestedAfterAction:(id)a3 inWorkflow:(id)a4
{
  return [a3 hasAvailableVariables];
}

- (void)runWithInput:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [(WFAppendVariableAction *)self parameterValueForKey:@"WFVariableName" ofClass:objc_opt_class()];
  id v7 = [(WFAppendVariableAction *)self variableSource];
  v8 = [v7 contentForVariableWithName:v6];
  uint64_t v9 = v8;
  if (v8) {
    id v10 = v8;
  }
  else {
    id v10 = (id)objc_opt_new();
  }
  v11 = v10;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  objc_super v12 = objc_msgSend(v5, "items", 0);
  objc_super v13 = (void *)[v12 copy];

  uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        [v11 addItem:*(void *)(*((void *)&v19 + 1) + 8 * i)];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v15);
  }

  v18 = [(WFAppendVariableAction *)self variableSource];
  [v18 setContent:v11 forVariableWithName:v6];

  [(WFAppendVariableAction *)self setOutput:v11];
}

@end