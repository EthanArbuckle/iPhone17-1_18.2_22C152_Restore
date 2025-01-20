@interface HUServiceDetailsRestartAccessoriesItem
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HUServiceDetailsRestartAccessoriesItem

- (id)_subclass_updateWithOptions:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v3 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsRestartHomePodDeviceButton", @"HUServiceDetailsRestartHomePodDeviceButton", 1);
  v4 = (void *)MEMORY[0x1E4F7A0D8];
  v5 = (void *)MEMORY[0x1E4F69228];
  uint64_t v10 = *MEMORY[0x1E4F68AB8];
  v11[0] = v3;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v7 = [v5 outcomeWithResults:v6];
  v8 = [v4 futureWithResult:v7];

  return v8;
}

@end