@interface WFFinderImageConvertAction
- (BOOL)isProgressIndeterminate;
- (BOOL)prefersActionAttribution;
- (id)contextualAction;
- (id)localizedAttributionWithContext:(id)a3;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFFinderImageConvertAction

- (id)contextualAction
{
  v3 = [(WFFinderImageConvertAction *)self runningDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(WFFinderImageConvertAction *)self runningDelegate];
    v6 = [v5 currentRunningContextForAction:self];

    v7 = [v6 contextualAction];
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)localizedAttributionWithContext:(id)a3
{
  id v4 = a3;
  v5 = [(WFFinderImageConvertAction *)self contextualAction];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 displayString];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)WFFinderImageConvertAction;
    uint64_t v7 = [(WFFinderImageConvertAction *)&v10 localizedAttributionWithContext:v4];
  }
  v8 = (void *)v7;

  return v8;
}

- (BOOL)prefersActionAttribution
{
  return 1;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  v5 = [(WFFinderImageConvertAction *)self parameterValueForKey:@"WFFileFormat" ofClass:objc_opt_class()];
  v6 = [(WFFinderImageConvertAction *)self parameterValueForKey:@"WFSize" ofClass:objc_opt_class()];
  uint64_t v7 = [(WFFinderImageConvertAction *)self parameterValueForKey:@"WFPreserveMetadata" ofClass:objc_opt_class()];
  uint64_t v8 = WFFinderImageResizeFormatFromDescription();
  uint64_t v9 = WFFinderImageResizeSizeFromDescription();
  id v10 = objc_alloc_init(MEMORY[0x263F86B60]);
  v11 = objc_msgSend(objc_alloc(MEMORY[0x263F852C0]), "initWithFormat:size:preserveMetadata:", v8, v9, objc_msgSend(v7, "BOOLValue"));
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __57__WFFinderImageConvertAction_runAsynchronouslyWithInput___block_invoke;
  v15[3] = &unk_264E5E840;
  v15[4] = self;
  v12 = [v10 resizeImages:v4 toSize:v11 completion:v15];

  v13 = [(WFFinderImageConvertAction *)self progress];
  [v13 setTotalUnitCount:1];

  v14 = [(WFFinderImageConvertAction *)self progress];
  [v14 addChild:v12 withPendingUnitCount:1];
}

void __57__WFFinderImageConvertAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setOutput:a2];
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

- (BOOL)isProgressIndeterminate
{
  return 0;
}

@end