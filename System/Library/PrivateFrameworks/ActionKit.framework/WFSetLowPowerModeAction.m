@interface WFSetLowPowerModeAction
- (id)disabledOnPlatforms;
- (void)finishRunningWithError:(id)a3;
- (void)resolveSlot:(id)a3 withProcessedValue:(id)a4 parameter:(id)a5 input:(id)a6 completion:(id)a7;
@end

@implementation WFSetLowPowerModeAction

- (void)finishRunningWithError:(id)a3
{
  id v4 = a3;
  if (v4
    || ([(WFSetLowPowerModeAction *)self runningDelegate],
        v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = objc_opt_respondsToSelector(),
        v5,
        (v6 & 1) == 0))
  {
    v8.receiver = self;
    v8.super_class = (Class)WFSetLowPowerModeAction;
    [(WFHandleIntentAction *)&v8 finishRunningWithError:v4];
  }
  else
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __50__WFSetLowPowerModeAction_finishRunningWithError___block_invoke;
    v7[3] = &unk_264E58490;
    v7[4] = self;
    +[WFLowPowerModeSettingsClient getBookmarkForCurrentStateWithCompletionHandler:v7];
  }
}

void __50__WFSetLowPowerModeAction_finishRunningWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (v5)
  {
    char v6 = [*(id *)(a1 + 32) runningDelegate];
    uint64_t v7 = *(void *)(a1 + 32);
    objc_super v8 = [v5 actionReversalState];
    [v6 action:v7 didGenerateReversalState:v8];

    objc_msgSendSuper2(&v9, sel_finishRunningWithError_, 0, *(void *)(a1 + 32), WFSetLowPowerModeAction, v10.receiver, v10.super_class);
  }
  else
  {
    objc_msgSendSuper2(&v10, sel_finishRunningWithError_, a3, v9.receiver, v9.super_class, *(void *)(a1 + 32), WFSetLowPowerModeAction);
  }
}

- (void)resolveSlot:(id)a3 withProcessedValue:(id)a4 parameter:(id)a5 input:(id)a6 completion:(id)a7
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = objc_msgSend(v12, "wf_slotName");
  if (![v17 isEqualToString:@"state"]) {
    goto LABEL_6;
  }
  v18 = [(WFSetLowPowerModeAction *)self runningDelegate];
  char v19 = objc_opt_respondsToSelector();

  if ((v19 & 1) == 0) {
    goto LABEL_6;
  }
  v20 = [(WFSetLowPowerModeAction *)self runningDelegate];
  v21 = [v20 actionReversalStateForAction:self];

  if (v21)
  {
    v22 = (void *)[objc_alloc(MEMORY[0x263F86E58]) initWithActionReversalState:v21];
    if (v22)
    {
      +[WFLowPowerModeSettingsClient getReversalStateWithBookmark:v22 completionHandler:v16];
    }
    else
    {
      v23 = getWFActionsLogObject();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v26 = "-[WFSetLowPowerModeAction resolveSlot:withProcessedValue:parameter:input:completion:]";
        __int16 v27 = 2112;
        v28 = v21;
        _os_log_impl(&dword_23C364000, v23, OS_LOG_TYPE_FAULT, "%s Couldn't turn action reversal state %@ into a settings client bookmark", buf, 0x16u);
      }

      (*((void (**)(id, void, void))v16 + 2))(v16, 0, 0);
    }
  }
  else
  {
LABEL_6:
    v24.receiver = self;
    v24.super_class = (Class)WFSetLowPowerModeAction;
    [(WFHandleIntentAction *)&v24 resolveSlot:v12 withProcessedValue:v13 parameter:v14 input:v15 completion:v16];
  }
}

- (id)disabledOnPlatforms
{
  v5.receiver = self;
  v5.super_class = (Class)WFSetLowPowerModeAction;
  v2 = [(WFHandleCustomIntentAction *)&v5 disabledOnPlatforms];
  v3 = [v2 arrayByAddingObject:*MEMORY[0x263F871E8]];

  return v3;
}

@end