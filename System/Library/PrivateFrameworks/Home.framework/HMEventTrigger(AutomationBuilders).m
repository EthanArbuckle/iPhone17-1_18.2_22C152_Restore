@interface HMEventTrigger(AutomationBuilders)
+ (id)hf_newTriggerWithBuilder:()AutomationBuilders inHome:;
- (id)hf_copyAsBuilder;
- (id)hf_updateWithBuilder:()AutomationBuilders;
@end

@implementation HMEventTrigger(AutomationBuilders)

- (id)hf_copyAsBuilder
{
  v1 = (void *)[a1 copyAsBuilder];
  return v1;
}

- (id)hf_updateWithBuilder:()AutomationBuilders
{
  id v5 = a3;
  objc_opt_class();
  id v6 = v5;
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    v9 = (void *)MEMORY[0x263F58190];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __59__HMEventTrigger_AutomationBuilders__hf_updateWithBuilder___block_invoke;
    v17[3] = &unk_26408E218;
    v17[4] = a1;
    id v18 = v8;
    v10 = [v9 futureWithErrorOnlyHandlerAdapterBlock:v17];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __59__HMEventTrigger_AutomationBuilders__hf_updateWithBuilder___block_invoke_2;
    v16[3] = &unk_26408CDC8;
    v16[4] = a1;
    v11 = [v10 flatMap:v16];
  }
  else
  {
    v12 = NSStringFromSelector(a2);
    NSLog(&cfstr_WasPassedABuil.isa, a1, v12, v6);

    v13 = (void *)MEMORY[0x263F58190];
    v14 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 33);
    v11 = [v13 futureWithError:v14];
  }
  return v11;
}

+ (id)hf_newTriggerWithBuilder:()AutomationBuilders inHome:
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  id v9 = v7;
  if (objc_opt_isKindOfClass()) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  if (v11)
  {
    v12 = (void *)MEMORY[0x263F58190];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __70__HMEventTrigger_AutomationBuilders__hf_newTriggerWithBuilder_inHome___block_invoke;
    v18[3] = &unk_264090378;
    id v19 = v8;
    id v20 = v11;
    v13 = [v12 futureWithCompletionHandlerAdapterBlock:v18];
  }
  else
  {
    v14 = NSStringFromSelector(a2);
    NSLog(&cfstr_WasPassedABuil.isa, a1, v14, v9);

    v15 = (void *)MEMORY[0x263F58190];
    v16 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 33);
    v13 = [v15 futureWithError:v16];
  }
  return v13;
}

@end