@interface WFAlertAction
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFAlertAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  v4 = [(WFAlertAction *)self parameterValueForKey:@"WFAlertActionTitle" ofClass:objc_opt_class()];
  v5 = [(WFAlertAction *)self parameterValueForKey:@"WFAlertActionMessage" ofClass:objc_opt_class()];
  v6 = [(WFAlertAction *)self parameterValueForKey:@"WFAlertActionCancelButtonShown" ofClass:objc_opt_class()];
  int v7 = [v6 BOOLValue];

  v8 = [(WFAlertAction *)self supplementalParameterValueForKey:@"WFAlertActionCancelButtonTitle" ofClass:objc_opt_class()];
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    WFLocalizedString(@"Cancel");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  v12 = [(WFAlertAction *)self supplementalParameterValueForKey:@"WFAlertActionOKButtonTitle" ofClass:objc_opt_class()];
  v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    WFLocalizedString(@"OK");
    id v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  v16 = objc_opt_new();
  [v16 setTitle:v4];
  [v16 setMessage:v5];
  if (v7 && [v11 length])
  {
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __44__WFAlertAction_runAsynchronouslyWithInput___block_invoke;
    v21[3] = &unk_264E5EE70;
    v21[4] = self;
    v17 = [MEMORY[0x263F336F0] buttonWithTitle:v11 style:1 handler:v21];
    [v16 addButton:v17];
  }
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __44__WFAlertAction_runAsynchronouslyWithInput___block_invoke_2;
  v20[3] = &unk_264E5EE70;
  v20[4] = self;
  v18 = [MEMORY[0x263F336F0] buttonWithTitle:v15 style:0 handler:v20];
  [v16 addButton:v18];

  v19 = [(WFAlertAction *)self userInterface];
  [v19 presentAlert:v16];
}

uint64_t __44__WFAlertAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

uint64_t __44__WFAlertAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishRunningWithError:0];
}

@end