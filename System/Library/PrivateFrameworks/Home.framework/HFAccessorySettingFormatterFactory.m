@interface HFAccessorySettingFormatterFactory
+ (id)_announceEnabledFormatter;
+ (id)_audioAnalysisEnabledFormatter;
+ (id)_doorbellChimeEnabledFormatter;
+ (id)_siriFormatter;
+ (id)_siriOutputVoiceFormatter;
+ (id)_siriPersonalRequestsFormatter;
+ (id)_siriRecognitionLanguageFormatter;
+ (id)defaultFactory;
- (HFAccessorySettingFormatterFactory)init;
- (NSMutableDictionary)formattersForKey;
- (id)_buildFormatterForKey:(id)a3;
- (id)formatterForKey:(id)a3;
- (id)formatterForKey:(id)a3 copy:(BOOL)a4;
- (void)setFormattersForKey:(id)a3;
@end

@implementation HFAccessorySettingFormatterFactory

+ (id)defaultFactory
{
  if (_MergedGlobals_328 != -1) {
    dispatch_once(&_MergedGlobals_328, &__block_literal_global_78_2);
  }
  v2 = (void *)qword_26AB2FED8;
  return v2;
}

uint64_t __52__HFAccessorySettingFormatterFactory_defaultFactory__block_invoke_2()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = qword_26AB2FED8;
  qword_26AB2FED8 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (HFAccessorySettingFormatterFactory)init
{
  v6.receiver = self;
  v6.super_class = (Class)HFAccessorySettingFormatterFactory;
  v2 = [(HFAccessorySettingFormatterFactory *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    formattersForKey = v2->_formattersForKey;
    v2->_formattersForKey = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (id)formatterForKey:(id)a3 copy:(BOOL)a4
{
  BOOL v4 = a4;
  v5 = [(HFAccessorySettingFormatterFactory *)self formatterForKey:a3];
  objc_super v6 = v5;
  if (v4)
  {
    uint64_t v7 = [v5 copy];

    objc_super v6 = (void *)v7;
  }
  return v6;
}

- (id)formatterForKey:(id)a3
{
  id v4 = a3;
  v5 = [(HFAccessorySettingFormatterFactory *)self formattersForKey];
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  v11 = __54__HFAccessorySettingFormatterFactory_formatterForKey___block_invoke;
  v12 = &unk_26409CA90;
  v13 = self;
  id v14 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "na_objectForKey:withDefaultValue:", v6, &v9);

  if (!v7) {
    NSLog(&cfstr_RequestedNilFo.isa, v9, v10, v11, v12, v13, v14);
  }

  return v7;
}

uint64_t __54__HFAccessorySettingFormatterFactory_formatterForKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _buildFormatterForKey:*(void *)(a1 + 40)];
}

- (id)_buildFormatterForKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"AccessorySettingsDefaultFormatter"])
  {
    v5 = [HFSimpleFormatter alloc];
    id v6 = &__block_literal_global_89_0;
LABEL_5:
    uint64_t v7 = [(HFSimpleFormatter *)v5 initWithFormatterBlock:v6];
LABEL_6:
    v8 = (void *)v7;
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"AccessorySettingsAccessibilitySecondsFormatter"])
  {
    v5 = [HFSimpleFormatter alloc];
    id v6 = &__block_literal_global_104_2;
    goto LABEL_5;
  }
  if ([v4 isEqualToString:@"SiriFormatter"])
  {
    uint64_t v7 = [(id)objc_opt_class() _siriFormatter];
    goto LABEL_6;
  }
  if ([v4 isEqualToString:@"SiriRecognitionLanguageFormatter"])
  {
    uint64_t v7 = [(id)objc_opt_class() _siriRecognitionLanguageFormatter];
    goto LABEL_6;
  }
  if ([v4 isEqualToString:@"SiriOutputVoiceFormatter"])
  {
    uint64_t v7 = [(id)objc_opt_class() _siriOutputVoiceFormatter];
    goto LABEL_6;
  }
  if ([v4 isEqualToString:@"SiriPersonalRequestsFormatter"])
  {
    uint64_t v7 = [(id)objc_opt_class() _siriPersonalRequestsFormatter];
    goto LABEL_6;
  }
  if ([v4 isEqualToString:@"AnnounceEnabledFormatter"])
  {
    uint64_t v7 = [(id)objc_opt_class() _announceEnabledFormatter];
    goto LABEL_6;
  }
  if ([v4 isEqualToString:@"AnnounceFooterTitleFormatter"])
  {
    uint64_t v10 = [HFSimpleFormatter alloc];
    v11 = &__block_literal_global_112;
LABEL_26:
    uint64_t v12 = [(HFSimpleFormatter *)v10 initWithFormatterBlock:v11];
LABEL_27:
    v8 = (void *)v12;
    v13 = [(HFAccessorySettingFormatterFactory *)self formattersForKey];
    [v13 setObject:v8 forKey:v4];

    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"AudioAnalysisEnabledFormatter"])
  {
    uint64_t v7 = [(id)objc_opt_class() _audioAnalysisEnabledFormatter];
    goto LABEL_6;
  }
  if ([v4 isEqualToString:@"AudioAnalysisFooterTitleFormatter"])
  {
    uint64_t v10 = [HFSimpleFormatter alloc];
    v11 = &__block_literal_global_386_0;
    goto LABEL_26;
  }
  if ([v4 isEqualToString:@"HFHomePodAnalyticImproveSiriDictationFooter"])
  {
    id v14 = [HFSimpleFormatter alloc];
    v15 = &__block_literal_global_392;
LABEL_30:
    uint64_t v12 = [(HFSimpleFormatter *)v14 initWithAttributedFormatterBlock:v15];
    goto LABEL_27;
  }
  if ([v4 isEqualToString:@"DoorbellChimeEnabledFormatter"])
  {
    uint64_t v7 = [(id)objc_opt_class() _doorbellChimeEnabledFormatter];
    goto LABEL_6;
  }
  if ([v4 isEqualToString:@"AccessorySettingsProfileCountFormatter"])
  {
    uint64_t v12 = objc_opt_new();
    goto LABEL_27;
  }
  if ([v4 isEqualToString:@"PrimaryUserAccountFormatterKey"])
  {
    uint64_t v12 = __60__HFAccessorySettingFormatterFactory__buildFormatterForKey___block_invoke_6();
    goto LABEL_27;
  }
  if ([v4 isEqualToString:@"AllowExplicitContentFormatter"])
  {
    uint64_t v10 = [HFSimpleFormatter alloc];
    v11 = &__block_literal_global_414;
    goto LABEL_26;
  }
  if ([v4 isEqualToString:@"PlaybackInfluencesFormatter"])
  {
    uint64_t v12 = __60__HFAccessorySettingFormatterFactory__buildFormatterForKey___block_invoke_2_418();
    goto LABEL_27;
  }
  if ([v4 isEqualToString:@"SiriFooterTitleFormatter"])
  {
    id v14 = [HFSimpleFormatter alloc];
    v15 = &__block_literal_global_429;
    goto LABEL_30;
  }
  if ([v4 isEqualToString:@"LocationFooterTitleFormatter"])
  {
    id v14 = [HFSimpleFormatter alloc];
    v15 = &__block_literal_global_438;
    goto LABEL_30;
  }
  if ([v4 isEqualToString:@"AirPlayFooterTitleFormatter"])
  {
    uint64_t v10 = [HFSimpleFormatter alloc];
    v11 = &__block_literal_global_447_1;
    goto LABEL_26;
  }
  if ([v4 isEqualToString:@"VoiceFeedbackHeaderTitleFormatter"])
  {
    uint64_t v10 = [HFSimpleFormatter alloc];
    v11 = &__block_literal_global_453;
    goto LABEL_26;
  }
  if ([v4 isEqualToString:@"VoiceFeedbackFooterTitleFormatter"])
  {
    uint64_t v10 = [HFSimpleFormatter alloc];
    v11 = &__block_literal_global_458_0;
    goto LABEL_26;
  }
  if ([v4 isEqualToString:@"SiriTriggerPhraseSettingFormatter"])
  {
    uint64_t v10 = [HFSimpleFormatter alloc];
    v11 = &__block_literal_global_463;
    goto LABEL_26;
  }
  v8 = 0;
LABEL_7:

  return v8;
}

id __60__HFAccessorySettingFormatterFactory__buildFormatterForKey___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      if ([v2 BOOLValue])
      {
        uint64_t v3 = @"HFAccessorySettingGroupItemOn";
        goto LABEL_9;
      }
    }
    else
    {
      NSLog(&cfstr_YouReAttemptin.isa, 0);
    }
  }
  uint64_t v3 = @"HFAccessorySettingGroupItemOff";
LABEL_9:
  id v4 = _HFLocalizedStringWithDefaultValue(v3, v3, 1);

  return v4;
}

id __60__HFAccessorySettingFormatterFactory__buildFormatterForKey___block_invoke_2()
{
  uint64_t v0 = AXFormatNumberWithOptions();
  uint64_t v7 = HFLocalizedStringWithFormat(@"HFAccessibilitySecondsFormatString", @"%@", v1, v2, v3, v4, v5, v6, (uint64_t)v0);

  return v7;
}

id __60__HFAccessorySettingFormatterFactory__buildFormatterForKey___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 conformsToProtocol:&unk_26C155B48]) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;
  id v5 = v2;
  if ([v5 conformsToProtocol:&unk_26C0FC090]) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  v8 = [v7 accessories];
  uint64_t v9 = [v8 anyObject];

  if (v4)
  {
    objc_opt_class();
    uint64_t v10 = [v4 accessories];
    v11 = [v10 anyObject];
    if (objc_opt_isKindOfClass()) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
    id v13 = v12;

    uint64_t v9 = v13;
  }
  id v14 = objc_msgSend(v9, "hf_userFriendlyLocalizedLowercaseDescription");
  v21 = HFLocalizedStringWithFormat(@"HFAnnounceFooterText", @"%@", v15, v16, v17, v18, v19, v20, (uint64_t)v14);

  return v21;
}

id __60__HFAccessorySettingFormatterFactory__buildFormatterForKey___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 conformsToProtocol:&unk_26C155B48]) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;
  id v5 = v2;
  if ([v5 conformsToProtocol:&unk_26C0FC090]) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  v8 = [v7 accessories];
  uint64_t v9 = [v8 anyObject];

  if (v4)
  {
    objc_opt_class();
    uint64_t v10 = [v4 accessories];
    v11 = [v10 anyObject];
    if (objc_opt_isKindOfClass()) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
    id v13 = v12;

    uint64_t v9 = v13;
  }
  id v14 = objc_msgSend(v9, "hf_userFriendlyLocalizedLowercaseDescription");
  v21 = HFLocalizedStringWithFormat(@"HFAudioAnalysisFooterText", @"%@", v15, v16, v17, v18, v19, v20, (uint64_t)v14);

  return v21;
}

id __60__HFAccessorySettingFormatterFactory__buildFormatterForKey___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  v15[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = _HFLocalizedStringWithDefaultValue(@"HFHomePodAnalyticImproveSiriDictationFooter", @"HFHomePodAnalyticImproveSiriDictationFooter", 1);
  id v5 = _HFLocalizedStringWithDefaultValue(@"HFHomePodAnalyticImproveSiriDictationFooterLink", @"HFHomePodAnalyticImproveSiriDictationFooterLink", 1);
  id v6 = objc_alloc(MEMORY[0x263F089B8]);
  id v7 = [v4 stringByAppendingString:@" "];
  v8 = (void *)[v6 initWithString:v7];

  id v9 = objc_alloc(MEMORY[0x263F086A0]);
  uint64_t v14 = *MEMORY[0x263F1C258];
  uint64_t v10 = +[HFURLComponents aboutImproveSiriAndDictationURL];
  v15[0] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  uint64_t v12 = (void *)[v9 initWithString:v5 attributes:v11];
  [v8 appendAttributedString:v12];

  objc_msgSend(v8, "addAttributes:range:", v3, 0, objc_msgSend(v8, "length"));
  return v8;
}

HFSimpleFormatter *__60__HFAccessorySettingFormatterFactory__buildFormatterForKey___block_invoke_6()
{
  uint64_t v0 = [[HFSimpleFormatter alloc] initWithFormatterBlock:&__block_literal_global_408];
  return v0;
}

__CFString *__60__HFAccessorySettingFormatterFactory__buildFormatterForKey___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = &unk_26C155B48;
  id v4 = v2;
  id v5 = v4;
  if (!v4) {
    goto LABEL_7;
  }
  if ([v4 conformsToProtocol:v3]) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v5;
  if (!v6)
  {
    v8 = [MEMORY[0x263F08690] currentHandler];
    id v9 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
    uint64_t v10 = NSStringFromProtocol((Protocol *)v3);
    [v8 handleFailureInFunction:v9, @"NSObject+NAAdditions.h", 71, @"Expected protocol %@", v10 file lineNumber description];

LABEL_7:
    id v7 = 0;
  }

  if (v7)
  {
    v11 = objc_msgSend(v7, "hf_appleMusicCurrentLoggedInAccount");
    uint64_t v12 = [v11 username];
    if (objc_msgSend(v7, "hf_supportsPreferredMediaUser")
      && objc_msgSend(v7, "hf_preferredUserSelectionType") == 1)
    {
      id v13 = objc_msgSend(v7, "hf_preferredMediaUser");
      uint64_t v14 = [v13 name];

      uint64_t v12 = (__CFString *)v14;
    }
    uint64_t v15 = HFLogForCategory(0x35uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = v12;
      _os_log_impl(&dword_20B986000, v15, OS_LOG_TYPE_DEFAULT, "Media account value:  %@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v12 = &stru_26C081158;
  }

  return v12;
}

id __60__HFAccessorySettingFormatterFactory__buildFormatterForKey___block_invoke_412()
{
  return _HFLocalizedStringWithDefaultValue(@"HFAllowExplicitContentFooterText", @"HFAllowExplicitContentFooterText", 1);
}

HFSimpleFormatter *__60__HFAccessorySettingFormatterFactory__buildFormatterForKey___block_invoke_2_418()
{
  uint64_t v0 = [[HFSimpleFormatter alloc] initWithFormatterBlock:&__block_literal_global_423];
  return v0;
}

id __60__HFAccessorySettingFormatterFactory__buildFormatterForKey___block_invoke_3_421(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = &unk_26C155B48;
  id v4 = v2;
  id v5 = v4;
  if (v4)
  {
    if ([v4 conformsToProtocol:v3]) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
    id v7 = v5;
    if (v6) {
      goto LABEL_8;
    }
    v8 = [MEMORY[0x263F08690] currentHandler];
    id v9 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertProtocolCast(Protocol * _Nonnull __strong, id  _Nonnull __strong)");
    uint64_t v10 = NSStringFromProtocol((Protocol *)v3);
    [v8 handleFailureInFunction:v9, @"NSObject+NAAdditions.h", 71, @"Expected protocol %@", v10 file lineNumber description];
  }
  id v7 = 0;
LABEL_8:

  if (v7)
  {
    v11 = objc_msgSend(v7, "hf_settingsValueManager");
    uint64_t v12 = [v11 valueForSettingAtKeyPath:@"root.music.playbackInfluencesForYou"];
    int v13 = [v12 BOOLValue];

    if (v13) {
      uint64_t v14 = @"HFAccessorySettingGroupItemOn";
    }
    else {
      uint64_t v14 = @"HFAccessorySettingGroupItemOff";
    }
    uint64_t v15 = _HFLocalizedStringWithDefaultValue(v14, v14, 1);
  }
  else
  {
    uint64_t v15 = _HFLocalizedStringWithDefaultValue(@"HFPlaybackInfluencesSettingNever", @"HFPlaybackInfluencesSettingNever", 1);
  }

  return v15;
}

id __60__HFAccessorySettingFormatterFactory__buildFormatterForKey___block_invoke_4_427(uint64_t a1, uint64_t a2, void *a3)
{
  v15[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = _HFLocalizedStringWithDefaultValue(@"HFSiriFooterPrivacyText", @"HFSiriFooterPrivacyText", 1);
  id v5 = _HFLocalizedStringWithDefaultValue(@"HFPrivacyFooterSectionTypeSiri", @"HFPrivacyFooterSectionTypeSiri", 1);
  id v6 = objc_alloc(MEMORY[0x263F089B8]);
  id v7 = [v4 stringByAppendingString:@" "];
  v8 = (void *)[v6 initWithString:v7];

  id v9 = objc_alloc(MEMORY[0x263F086A0]);
  uint64_t v14 = *MEMORY[0x263F1C258];
  uint64_t v10 = +[HFURLComponents siriPrivacyURL];
  v15[0] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  uint64_t v12 = (void *)[v9 initWithString:v5 attributes:v11];
  [v8 appendAttributedString:v12];

  objc_msgSend(v8, "addAttributes:range:", v3, 0, objc_msgSend(v8, "length"));
  return v8;
}

id __60__HFAccessorySettingFormatterFactory__buildFormatterForKey___block_invoke_5_436(uint64_t a1, uint64_t a2, void *a3)
{
  v15[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = HFLocalizedWiFiString(@"HFLocationFooterPrivacyText");
  id v5 = _HFLocalizedStringWithDefaultValue(@"HFPrivacyFooterSectionTypeLocationServices", @"HFPrivacyFooterSectionTypeLocationServices", 1);
  id v6 = objc_alloc(MEMORY[0x263F089B8]);
  id v7 = [v4 stringByAppendingString:@" "];
  v8 = (void *)[v6 initWithString:v7];

  id v9 = objc_alloc(MEMORY[0x263F086A0]);
  uint64_t v14 = *MEMORY[0x263F1C258];
  uint64_t v10 = +[HFURLComponents locationPrivacyURL];
  v15[0] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  uint64_t v12 = (void *)[v9 initWithString:v5 attributes:v11];
  [v8 appendAttributedString:v12];

  objc_msgSend(v8, "addAttributes:range:", v3, 0, objc_msgSend(v8, "length"));
  return v8;
}

id __60__HFAccessorySettingFormatterFactory__buildFormatterForKey___block_invoke_6_445()
{
  return _HFLocalizedStringWithDefaultValue(@"HFAirPlayFooterText", @"HFAirPlayFooterText", 1);
}

id __60__HFAccessorySettingFormatterFactory__buildFormatterForKey___block_invoke_7_451()
{
  return _HFLocalizedStringWithDefaultValue(@"HFMediaCodexAccessibilityVoiceFeedbackHeader", @"HFMediaCodexAccessibilityVoiceFeedbackHeader", 1);
}

id __60__HFAccessorySettingFormatterFactory__buildFormatterForKey___block_invoke_8()
{
  return _HFLocalizedStringWithDefaultValue(@"HFMediaCodexAccessibilityVoiceFeedbackFooter", @"HFMediaCodexAccessibilityVoiceFeedbackFooter", 1);
}

id __60__HFAccessorySettingFormatterFactory__buildFormatterForKey___block_invoke_9(uint64_t a1, void *a2)
{
  if ([a2 BOOLValue]) {
    id v2 = @"HFAccessorySettingGroupItemOn";
  }
  else {
    id v2 = @"HFAccessorySettingGroupItemOff";
  }
  id v3 = _HFLocalizedStringWithDefaultValue(v2, v2, 1);
  return v3;
}

+ (id)_siriFormatter
{
  id v2 = [[HFSimpleFormatter alloc] initWithFormatterBlock:&__block_literal_global_465];
  return v2;
}

id __52__HFAccessorySettingFormatterFactory__siriFormatter__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 conformsToProtocol:&unk_26C155B48]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;
  id v5 = [v4 mediaProfiles];

  id v6 = [v5 anyObject];
  id v7 = objc_msgSend(v6, "hf_mediaAccessoryCommonSettingsManager");

  v8 = [v7 settingValueForKeyPath:HFAllowHeySiriSettingKeyPath];
  uint64_t v9 = [v7 settingValueForKeyPath:HFTapToAccessSiriSettingKeyPath];
  uint64_t v10 = (void *)v9;
  if (v8) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11 && (([v8 BOOLValue] & 1) != 0 || objc_msgSend(v10, "BOOLValue"))) {
    uint64_t v12 = @"HFAccessorySettingGroupItemOn";
  }
  else {
    uint64_t v12 = @"HFAccessorySettingGroupItemOff";
  }
  int v13 = _HFLocalizedStringWithDefaultValue(v12, v12, 1);

  return v13;
}

+ (id)_siriRecognitionLanguageFormatter
{
  id v2 = [[HFSimpleFormatter alloc] initWithFormatterBlock:&__block_literal_global_467];
  return v2;
}

id __71__HFAccessorySettingFormatterFactory__siriRecognitionLanguageFormatter__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = (HFSiriLanguageOption *)v2;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  id v6 = v3;
  if (!v5)
  {
    objc_opt_class();
    id v7 = v3;
    if (objc_opt_isKindOfClass()) {
      v8 = v7;
    }
    else {
      v8 = 0;
    }
    uint64_t v9 = v8;

    if (v9)
    {
      uint64_t v10 = [(HFSiriLanguageOption *)v9 title];
    }
    else
    {
      objc_opt_class();
      BOOL v11 = v7;
      if (objc_opt_isKindOfClass()) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = 0;
      }
      uint64_t v10 = v12;
    }
    id v6 = [[HFSiriLanguageOption alloc] initWithSerializedRepresentation:v10];
  }
  objc_opt_class();
  int v13 = v3;
  if (objc_opt_isKindOfClass()) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  uint64_t v15 = v14;

  if (v15)
  {
    uint64_t v16 = [[HFSiriLanguageOption alloc] initWithHomeKitSettingLanguageValue:v15];

    id v6 = v16;
  }
  uint64_t v17 = [(HFSiriLanguageOption *)v6 localizedRecognitionLanguage];

  return v17;
}

+ (id)_siriOutputVoiceFormatter
{
  id v2 = [[HFSimpleFormatter alloc] initWithFormatterBlock:&__block_literal_global_472_0];
  return v2;
}

id __63__HFAccessorySettingFormatterFactory__siriOutputVoiceFormatter__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = (HFSiriLanguageOption *)v2;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  id v6 = v3;
  if (!v5)
  {
    objc_opt_class();
    id v7 = v3;
    if (objc_opt_isKindOfClass()) {
      v8 = v7;
    }
    else {
      v8 = 0;
    }
    uint64_t v9 = v8;

    if (v9)
    {
      uint64_t v10 = [(HFSiriLanguageOption *)v9 title];
    }
    else
    {
      objc_opt_class();
      BOOL v11 = v7;
      if (objc_opt_isKindOfClass()) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = 0;
      }
      uint64_t v10 = v12;
    }
    id v6 = [[HFSiriLanguageOption alloc] initWithSerializedRepresentation:v10];
  }
  objc_opt_class();
  int v13 = v3;
  if (objc_opt_isKindOfClass()) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  uint64_t v15 = v14;

  if (v15)
  {
    uint64_t v16 = [[HFSiriLanguageOption alloc] initWithHomeKitSettingLanguageValue:v15];

    id v6 = v16;
  }
  uint64_t v17 = [(HFSiriLanguageOption *)v6 localizedOutputVoice];

  return v17;
}

+ (id)_siriPersonalRequestsFormatter
{
  id v2 = [[HFSimpleFormatter alloc] initWithFormatterBlock:&__block_literal_global_475];
  return v2;
}

id __68__HFAccessorySettingFormatterFactory__siriPersonalRequestsFormatter__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = [v2 accessories];
  id v4 = objc_msgSend(v2, "hf_home");
  id v5 = [v4 currentUser];
  id v6 = objc_msgSend(v2, "hf_home");
  id v7 = [v5 assistantAccessControlForHome:v6];

  id v8 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v9 = [v7 accessories];
  uint64_t v10 = (void *)[v8 initWithArray:v9];

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __68__HFAccessorySettingFormatterFactory__siriPersonalRequestsFormatter__block_invoke_2;
  v16[3] = &unk_26408D968;
  id v17 = v10;
  id v11 = v10;
  if (objc_msgSend(v3, "na_all:", v16))
  {
    if ([v7 allowUnauthenticatedRequests])
    {
      uint64_t v12 = @"HFSiriPersonalRequestsValueOn";
      goto LABEL_8;
    }
    int v13 = HFLogForCategory(0x46uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v2;
      _os_log_impl(&dword_20B986000, v13, OS_LOG_TYPE_DEFAULT, "Forcing PR OFF for %@ because the user previously had allowUnauthenticatedRequests set to NO", buf, 0xCu);
    }
  }
  uint64_t v12 = @"HFSiriPersonalRequestsValueOff";
LABEL_8:
  uint64_t v14 = _HFLocalizedStringWithDefaultValue(v12, v12, 1);

  return v14;
}

uint64_t __68__HFAccessorySettingFormatterFactory__siriPersonalRequestsFormatter__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

+ (id)_announceEnabledFormatter
{
  id v2 = [[HFSimpleFormatter alloc] initWithFormatterBlock:&__block_literal_global_485];
  return v2;
}

id __63__HFAccessorySettingFormatterFactory__announceEnabledFormatter__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 conformsToProtocol:&unk_26C155B48]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;
  id v5 = objc_msgSend(v4, "hf_settingsValueManager");
  id v6 = [v4 settings];
  id v7 = objc_msgSend(v6, "hf_accessorySettingAtKeyPath:", @"root.announce.enabled");

  objc_opt_class();
  if (v7)
  {
    id v8 = [v5 valueForSetting:v7];
  }
  else
  {
    id v8 = v2;
  }
  uint64_t v9 = v8;
  if (objc_opt_isKindOfClass()) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = v10;

  uint64_t v12 = @"HFAnnounceEnabledValueOff";
  if (v11 && [v11 BOOLValue]) {
    uint64_t v12 = @"HFAnnounceEnabledValueOn";
  }
  int v13 = _HFLocalizedStringWithDefaultValue(v12, v12, 1);

  return v13;
}

+ (id)_audioAnalysisEnabledFormatter
{
  id v2 = [[HFSimpleFormatter alloc] initWithFormatterBlock:&__block_literal_global_493_0];
  return v2;
}

id __68__HFAccessorySettingFormatterFactory__audioAnalysisEnabledFormatter__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 conformsToProtocol:&unk_26C155B48]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;
  id v5 = objc_msgSend(v4, "hf_settingsValueManager");
  id v6 = [v4 settings];
  id v7 = objc_msgSend(v6, "hf_accessorySettingAtKeyPath:", @"root.audioAnalysis.enabled");

  objc_opt_class();
  if (v7)
  {
    id v8 = [v5 valueForSetting:v7];
  }
  else
  {
    id v8 = v2;
  }
  uint64_t v9 = v8;
  if (objc_opt_isKindOfClass()) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = v10;

  if (v11)
  {
    uint64_t v12 = @"HFAudioAnalysisEnabledValueOff";
    if ([v11 BOOLValue])
    {
      int v13 = objc_msgSend(v4, "hf_home");
      uint64_t v14 = [v13 audioAnalysisClassifierOptions];

      if (v14) {
        uint64_t v12 = @"HFAudioAnalysisEnabledValueOn";
      }
    }
  }
  else
  {
    uint64_t v12 = @"HFAudioAnalysisEnabledValueOff";
  }
  uint64_t v15 = _HFLocalizedStringWithDefaultValue(v12, v12, 1);

  return v15;
}

+ (id)_doorbellChimeEnabledFormatter
{
  id v2 = [[HFSimpleFormatter alloc] initWithFormatterBlock:&__block_literal_global_501];
  return v2;
}

id __68__HFAccessorySettingFormatterFactory__doorbellChimeEnabledFormatter__block_invoke(uint64_t a1, void *a2)
{
  id v2 = objc_msgSend(a2, "hf_home");
  id v3 = objc_msgSend(v2, "hf_allHomePodsOrStereoPairs");
  uint64_t v4 = [v3 count];

  id v5 = objc_msgSend(v2, "hf_allHomePodsOrStereoPairsThatWillChime");
  uint64_t v6 = [v5 count];

  id v7 = objc_msgSend(v2, "hf_allSiriEndPointProfileContainersThatWillChime");
  uint64_t v8 = [v7 count] + v6;

  uint64_t v9 = objc_msgSend(v2, "hf_allSiriEndPointProfileContainers");
  uint64_t v10 = [v9 count];

  if (!v8)
  {
    id v11 = @"HFChimeOnAccessories_ValueOff";
    goto LABEL_5;
  }
  if (v8 == v10 + v4)
  {
    id v11 = @"HFChimeOnAccessories_ValueAll";
LABEL_5:
    uint64_t v12 = _HFLocalizedStringWithDefaultValue(v11, v11, 1);
    goto LABEL_7;
  }
  int v13 = (void *)MEMORY[0x263F08A30];
  uint64_t v14 = [NSNumber numberWithUnsignedInteger:v8];
  uint64_t v12 = [v13 localizedStringFromNumber:v14 numberStyle:0];

LABEL_7:
  return v12;
}

- (NSMutableDictionary)formattersForKey
{
  return self->_formattersForKey;
}

- (void)setFormattersForKey:(id)a3
{
}

- (void).cxx_destruct
{
}

@end