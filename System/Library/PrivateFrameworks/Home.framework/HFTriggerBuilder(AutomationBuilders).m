@interface HFTriggerBuilder(AutomationBuilders)
- (BOOL)supportsHomeKitAutomationBuilders;
@end

@implementation HFTriggerBuilder(AutomationBuilders)

- (BOOL)supportsHomeKitAutomationBuilders
{
  uint64_t v3 = [(HFTriggerBuilder *)self trigger];
  if (v3)
  {
    v4 = (void *)v3;
    v5 = [(HFTriggerBuilder *)self trigger];
    v6 = objc_msgSend(v5, "hf_copyAsBuilder");

    if (!v6) {
      return 0;
    }
  }
  v7 = [(HFItemBuilder *)self home];
  char v8 = [v7 areAutomationBuildersSupported];

  return v8;
}

@end