@interface HUSiriTriggerPhraseSettingItem
- (HMHome)home;
- (HUSiriTriggerPhraseSettingItem)initWithHome:(id)a3;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)description;
- (void)setHome:(id)a3;
@end

@implementation HUSiriTriggerPhraseSettingItem

- (HUSiriTriggerPhraseSettingItem)initWithHome:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUSiriTriggerPhraseSettingItem;
  v6 = [(HUSiriTriggerPhraseSettingItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_home, a3);
  }

  return v7;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v5 = objc_opt_new();
  v6 = (void *)MEMORY[0x1E4F1CA80];
  v7 = [(HUSiriTriggerPhraseSettingItem *)self home];
  v8 = objc_msgSend(v7, "hf_allHomePodsOrStereoPairs");
  objc_super v9 = [v6 setWithArray:v8];

  v10 = [(HUSiriTriggerPhraseSettingItem *)self home];
  v11 = objc_msgSend(v10, "hf_siriEndPointAccessories");
  [v9 addObjectsFromArray:v11];

  v12 = [(HUSiriTriggerPhraseSettingItem *)self home];
  if ([v12 siriPhraseOptions] == 3)
  {
    v3 = @"HUJustSiriOrHeySiri_Home_Level_Setting_Title";
    v13 = [(HUSiriTriggerPhraseSettingItem *)self home];
    int v14 = objc_msgSend(v13, "hf_atLeastOneMediaAccessoryWithSupportingJustSiriLanguage");

    if (v14) {
      v15 = @"HUJustSiriOrHeySiri_Home_Level_Setting_Title";
    }
    else {
      v15 = @"HUHeySiri_Home_Level_Setting_Title";
    }
  }
  else
  {

    v15 = @"HUHeySiri_Home_Level_Setting_Title";
  }
  uint64_t v16 = 1;
  v17 = _HULocalizedStringWithDefaultValue(v15, v15, 1);
  [v5 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  [v5 setObject:@"HUJustSiriOrHeySiri_Home_Level_Setting_Title" forKeyedSubscript:*MEMORY[0x1E4F68AC0]];
  [v5 setObject:@"Home.HomeSettings.SiriPhraseSetting" forKeyedSubscript:*MEMORY[0x1E4F68928]];
  v18 = NSNumber;
  v19 = [(HUSiriTriggerPhraseSettingItem *)self home];
  int v20 = objc_msgSend(v19, "hf_atleastOneMediaAccessorySupportingJustSiri");
  if (v20)
  {
    v3 = [(HUSiriTriggerPhraseSettingItem *)self home];
    uint64_t v16 = [(__CFString *)v3 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] ^ 1;
  }
  v21 = [v18 numberWithInt:v16];
  [v5 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F68B10]];

  if (v20) {
  v22 = [(HUSiriTriggerPhraseSettingItem *)self home];
  }
  if (objc_msgSend(v22, "hf_atleastOneMediaAccessoryHasSiriEnabled")) {
    v23 = @"HUSiriSetting_On";
  }
  else {
    v23 = @"HUSiriSetting_Off";
  }
  v24 = _HULocalizedStringWithDefaultValue(v23, v23, 1);
  [v5 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F68980]];

  [v5 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F68908]];
  [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68A78]];
  v25 = (void *)MEMORY[0x1E4F7A0D8];
  v26 = [MEMORY[0x1E4F69228] outcomeWithResults:v5];
  v27 = [v25 futureWithResult:v26];

  return v27;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F7A0D0] builderWithObject:self];
  v4 = [(HUSiriTriggerPhraseSettingItem *)self latestResults];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F68B10]];
  id v6 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", objc_msgSend(v5, "BOOLValue"), @"hidden", 1);

  v7 = [(HUSiriTriggerPhraseSettingItem *)self latestResults];
  v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  [v3 appendString:v8 withName:@"title"];

  objc_super v9 = [(HUSiriTriggerPhraseSettingItem *)self latestResults];
  v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F68980]];
  [v3 appendString:v10 withName:@"description" skipIfEmpty:1];

  v11 = [v3 build];

  return v11;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (void).cxx_destruct
{
}

@end