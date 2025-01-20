@interface WFGetVariableAction
- (BOOL)shouldBeSuggestedAfterAction:(id)a3 inWorkflow:(id)a4;
- (id)accessibilityName;
- (id)currentVariable;
- (id)inheritedOutputContentClassesInWorkflow:(id)a3 context:(id)a4;
- (void)runWithInput:(id)a3 error:(id *)a4;
@end

@implementation WFGetVariableAction

- (id)accessibilityName
{
  v3 = [(WFGetVariableAction *)self localizedName];
  v4 = [(WFGetVariableAction *)self currentVariable];
  uint64_t v5 = [v4 nameIncludingPropertyName];
  v6 = (void *)v5;
  v7 = &stru_26F008428;
  if (v5) {
    v7 = (__CFString *)v5;
  }
  v8 = [v3 stringByAppendingFormat:@" (%@)", v7];

  return v8;
}

- (id)inheritedOutputContentClassesInWorkflow:(id)a3 context:(id)a4
{
  id v5 = a4;
  if ([v5 containsObject:self])
  {
    v6 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    [v5 addObject:self];
    v7 = [(WFGetVariableAction *)self currentVariable];
    v8 = [v7 possibleAggrandizedContentClassesWithContext:v5];
    v6 = [v8 array];
  }
  return v6;
}

- (id)currentVariable
{
  v2 = [(WFGetVariableAction *)self parameterStateForKey:@"WFVariable"];
  v3 = [v2 variable];

  return v3;
}

- (BOOL)shouldBeSuggestedAfterAction:(id)a3 inWorkflow:(id)a4
{
  return [a3 hasAvailableVariables];
}

- (void)runWithInput:(id)a3 error:(id *)a4
{
  id v5 = [(WFGetVariableAction *)self parameterValueForKey:@"WFVariable" ofClass:objc_opt_class()];
  [(WFGetVariableAction *)self setOutput:v5];
}

@end