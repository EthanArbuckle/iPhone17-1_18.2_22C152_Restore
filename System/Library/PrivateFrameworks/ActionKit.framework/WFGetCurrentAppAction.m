@interface WFGetCurrentAppAction
- (BOOL)outputsMultipleItems;
- (BOOL)setParameterState:(id)a3 forKey:(id)a4;
- (id)iconSymbolName;
- (id)localizedDefaultOutputNameWithContext:(id)a3;
- (id)scopeState;
- (void)finishWithApps:(id)a3 error:(id)a4;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFGetCurrentAppAction

- (id)iconSymbolName
{
  v2 = [(WFGetCurrentAppAction *)self scopeState];
  int v3 = [v2 isEqualToString:@"Current"];

  if (v3) {
    return @"app.dashed";
  }
  else {
    return @"rectangle.3.group";
  }
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)WFGetCurrentAppAction;
  BOOL v5 = [(WFGetCurrentAppAction *)&v7 setParameterState:a3 forKey:a4];
  [(WFGetCurrentAppAction *)self iconUpdated];
  [(WFGetCurrentAppAction *)self outputDetailsUpdated];
  return v5;
}

- (BOOL)outputsMultipleItems
{
  int v3 = [(WFGetCurrentAppAction *)self parameterValueForKey:@"WFVisibleAppScope" ofClass:objc_opt_class()];
  v4 = v3;
  if (v3)
  {
    char v5 = [v3 isEqualToString:@"Visible"];
  }
  else
  {
    v6 = [(WFGetCurrentAppAction *)self scopeState];
    char v5 = [v6 isEqualToString:@"Visible"];
  }
  return v5;
}

- (id)localizedDefaultOutputNameWithContext:(id)a3
{
  int v3 = [(WFGetCurrentAppAction *)self scopeState];
  int v4 = [v3 isEqualToString:@"Visible"];

  if (v4)
  {
    char v5 = @"Visible Apps (Output Name)";
    v6 = @"Visible Apps";
  }
  else
  {
    char v5 = @"Current App (Output Name)";
    v6 = @"Current App";
  }
  objc_super v7 = WFLocalizedStringWithKey(v5, v6);
  return v7;
}

- (id)scopeState
{
  v2 = [(WFGetCurrentAppAction *)self parameterStateForKey:@"WFVisibleAppScope"];
  int v3 = [v2 value];

  return v3;
}

- (void)finishWithApps:(id)a3 error:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * v11);
        v13 = [(WFGetCurrentAppAction *)self output];
        [v13 addObject:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
  [(WFGetCurrentAppAction *)self finishRunningWithError:v7];
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  int v4 = objc_opt_new();
  char v5 = [(WFGetCurrentAppAction *)self parameterValueForKey:@"WFVisibleAppScope" ofClass:objc_opt_class()];
  if ([v5 isEqualToString:@"Current"])
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __52__WFGetCurrentAppAction_runAsynchronouslyWithInput___block_invoke;
    v7[3] = &unk_264E5EEE8;
    v7[4] = self;
    [v4 getCurrentAppWithCompletionHandler:v7];
  }
  else
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __52__WFGetCurrentAppAction_runAsynchronouslyWithInput___block_invoke_2;
    v6[3] = &unk_264E5EEE8;
    v6[4] = self;
    [v4 getVisibleAppsWithCompletionHandler:v6];
  }
}

uint64_t __52__WFGetCurrentAppAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithApps:a2 error:a3];
}

uint64_t __52__WFGetCurrentAppAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithApps:a2 error:a3];
}

@end