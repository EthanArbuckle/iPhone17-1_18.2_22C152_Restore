@interface HUServiceDetailsResetAccessoryItem
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HUServiceDetailsResetAccessoryItem

- (id)_subclass_updateWithOptions:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v3 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsResetHomePodDeviceButton", @"HUServiceDetailsResetHomePodDeviceButton", 1);
  v4 = (void *)MEMORY[0x1E4F7A0D8];
  v5 = (void *)MEMORY[0x1E4F69228];
  uint64_t v6 = *MEMORY[0x1E4F68928];
  v11[0] = *MEMORY[0x1E4F68AB8];
  v11[1] = v6;
  v12[0] = v3;
  v12[1] = @"AccessoryDetails.ResetHomePodButton";
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v8 = [v5 outcomeWithResults:v7];
  v9 = [v4 futureWithResult:v8];

  return v9;
}

@end