@interface HUServiceDetailsAudioSettingsItem
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HUServiceDetailsAudioSettingsItem

- (id)_subclass_updateWithOptions:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3);
  v5 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsAudioSettingsLabel", @"HUServiceDetailsAudioSettingsLabel", 1);
  [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  if ([(HUServiceDetailsAbstractItem *)self isMediaAccessoryGroup]
    && ([(HUServiceDetailsAbstractItem *)self home],
        v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = objc_msgSend(v6, "hf_currentUserIsAdministrator"),
        v6,
        (v7 & 1) != 0))
  {
    v8 = [(HUServiceDetailsAbstractItem *)self sourceServiceItem];
    v9 = [v8 latestResults];
    v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F68740]];
    if ([v10 conformsToProtocol:&unk_1F1AD86A8]) {
      v11 = v10;
    }
    else {
      v11 = 0;
    }
    id v12 = v11;

    v13 = NSNumber;
    int v14 = objc_msgSend(v12, "hf_showsAudioSettings");

    v15 = [v13 numberWithInt:v14 ^ 1u];
    [v4 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F68A08]];
  }
  else
  {
    [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
  }
  v16 = (void *)MEMORY[0x1E4F7A0D8];
  v17 = [MEMORY[0x1E4F69228] outcomeWithResults:v4];
  v18 = [v16 futureWithResult:v17];

  return v18;
}

@end