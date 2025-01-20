@interface HUServiceDetailsPairingModeItem
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HUServiceDetailsPairingModeItem

- (id)_subclass_updateWithOptions:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  if ([(HUServiceDetailsAbstractItem *)self isCHIPAccessory]) {
    BOOL v4 = [(HUServiceDetailsAbstractItem *)self isBridged];
  }
  else {
    BOOL v4 = 1;
  }
  v12[0] = *MEMORY[0x1E4F68AB8];
  v5 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsPairingModeItemDisplayTitle", @"HUServiceDetailsPairingModeItemDisplayTitle", 1);
  v13[0] = v5;
  v12[1] = *MEMORY[0x1E4F68B10];
  v6 = [NSNumber numberWithBool:v4];
  v13[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  v8 = (void *)MEMORY[0x1E4F7A0D8];
  v9 = [MEMORY[0x1E4F69228] outcomeWithResults:v7];
  v10 = [v8 futureWithResult:v9];

  return v10;
}

@end