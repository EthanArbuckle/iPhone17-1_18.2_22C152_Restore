@interface HMTrigger(AutomationBuilders)
+ (id)hf_newTriggerWithBuilder:()AutomationBuilders inHome:;
- (id)hf_updateWithBuilder:()AutomationBuilders;
- (uint64_t)hf_copyAsBuilder;
@end

@implementation HMTrigger(AutomationBuilders)

- (uint64_t)hf_copyAsBuilder
{
  return 0;
}

- (id)hf_updateWithBuilder:()AutomationBuilders
{
  NSLog(&cfstr_AttemptedToUse.isa);
  v0 = (void *)MEMORY[0x263F58190];
  v1 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 36);
  v2 = [v0 futureWithError:v1];

  return v2;
}

+ (id)hf_newTriggerWithBuilder:()AutomationBuilders inHome:
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = (void *)MEMORY[0x263F0E860];
LABEL_5:
    v10 = objc_msgSend(v9, "hf_newTriggerWithBuilder:inHome:", v7, v8);
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = (void *)MEMORY[0x263F0E320];
    goto LABEL_5;
  }
  v11 = [MEMORY[0x263F08690] currentHandler];
  [v11 handleFailureInMethod:a2, a1, @"HMTrigger+AutomationBuilders.m", 35, @"Unknown trigger builder type: %@", v7 object file lineNumber description];

  v10 = 0;
LABEL_7:

  return v10;
}

@end