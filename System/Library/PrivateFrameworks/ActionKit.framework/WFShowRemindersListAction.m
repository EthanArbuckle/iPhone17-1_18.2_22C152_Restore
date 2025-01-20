@interface WFShowRemindersListAction
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFShowRemindersListAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  v4 = [(WFShowRemindersListAction *)self parameterValueForKey:@"WFList" ofClass:objc_opt_class()];
  v5 = [MEMORY[0x263F33950] allLists];
  v6 = [v4 matchingRemindersListsFromArray:v5];
  v7 = [v6 firstObject];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [MEMORY[0x263F33950] defaultList];
  }
  v10 = v9;

  v11 = NSURL;
  v12 = NSString;
  v13 = [v10 objectID];
  v14 = [v13 uuid];
  v15 = [v14 UUIDString];
  v16 = [v12 stringWithFormat:@"x-apple-reminderkit://REMCDList/%@/contents", v15];
  v17 = [v11 URLWithString:v16];

  v18 = [MEMORY[0x263F33718] sharedContext];
  v19 = [(WFShowRemindersListAction *)self appDescriptor];
  v20 = [v19 bundleIdentifier];
  v21 = [(WFShowRemindersListAction *)self userInterface];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __56__WFShowRemindersListAction_runAsynchronouslyWithInput___block_invoke;
  v22[3] = &unk_264E5BF28;
  v22[4] = self;
  [v18 openURL:v17 withBundleIdentifier:v20 userInterface:v21 completionHandler:v22];
}

uint64_t __56__WFShowRemindersListAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
}

@end