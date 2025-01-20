@interface HMTimerTrigger(AutomationBuilders)
+ (id)hf_newTriggerWithBuilder:()AutomationBuilders inHome:;
@end

@implementation HMTimerTrigger(AutomationBuilders)

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
    v18[2] = __70__HMTimerTrigger_AutomationBuilders__hf_newTriggerWithBuilder_inHome___block_invoke;
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