@interface HMHome(AutomationBuilderMocking)
- (id)hdm_newEventTriggerBuilderWithName:()AutomationBuilderMocking events:;
- (void)hdm_addEventTriggerFromBuilder:()AutomationBuilderMocking completionHandler:;
@end

@implementation HMHome(AutomationBuilderMocking)

- (id)hdm_newEventTriggerBuilderWithName:()AutomationBuilderMocking events:
{
  v4 = (void *)[a1 newEventTriggerBuilderWithName:a3 events:a4 predicate:0];
  return v4;
}

- (void)hdm_addEventTriggerFromBuilder:()AutomationBuilderMocking completionHandler:
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __85__HMHome_AutomationBuilderMocking__hdm_addEventTriggerFromBuilder_completionHandler___block_invoke;
  v8[3] = &unk_26536EED0;
  id v9 = v6;
  id v7 = v6;
  [a1 addEventTriggerFromBuilder:a3 completionHandler:v8];
}

@end