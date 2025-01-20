@interface HUAccessorySettingsDetailsViewControllerFactory
+ (id)_viewControllerForIdentifier:(id)a3 groupItem:(id)a4;
+ (id)_viewControllerForIdentifier:(id)a3 settingItem:(id)a4;
+ (id)viewControllerForGroup:(id)a3;
+ (id)viewControllerForSettingItem:(id)a3;
@end

@implementation HUAccessorySettingsDetailsViewControllerFactory

+ (id)_viewControllerForIdentifier:(id)a3 groupItem:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  if (_MergedGlobals_641 != -1) {
    dispatch_once(&_MergedGlobals_641, &__block_literal_global_258);
  }
  id v7 = (id)qword_1EBA47B28;
  v8 = (objc_class *)[v7 objectForKeyedSubscript:v6];

  v9 = (void *)[[v8 alloc] initWithAccessoryGroupItem:v5];

  return v9;
}

void __90__HUAccessorySettingsDetailsViewControllerFactory__viewControllerForIdentifier_groupItem___block_invoke_2()
{
  v3[11] = *MEMORY[0x1E4F143B8];
  v2[0] = @"AnalyticsLogsViewController";
  v3[0] = objc_opt_class();
  v2[1] = @"AnalyticsViewController";
  v3[1] = objc_opt_class();
  v2[2] = @"AppleMusicAccountViewController";
  v3[2] = objc_opt_class();
  v2[3] = @"DataAnalyticsViewController";
  v3[3] = objc_opt_class();
  v2[4] = @"DoorbellChimeDevicesViewController";
  v3[4] = objc_opt_class();
  v2[5] = @"PlaybackInfluencesViewController";
  v3[5] = objc_opt_class();
  v2[6] = @"ProfilesViewController";
  v3[6] = objc_opt_class();
  v2[7] = @"SiriHistoryViewController";
  v3[7] = objc_opt_class();
  v2[8] = @"SiriOutputVoiceViewController";
  v3[8] = objc_opt_class();
  v2[9] = @"SiriPersonalRequestsViewController";
  v3[9] = objc_opt_class();
  v2[10] = @"SiriRecognitionLanguageViewController";
  v3[10] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:11];
  v1 = (void *)qword_1EBA47B28;
  qword_1EBA47B28 = v0;
}

+ (id)_viewControllerForIdentifier:(id)a3 settingItem:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  if (qword_1EBA47B30 != -1) {
    dispatch_once(&qword_1EBA47B30, &__block_literal_global_308);
  }
  id v7 = (id)qword_1EBA47B38;
  v8 = (objc_class *)[v7 objectForKeyedSubscript:v6];

  v9 = (void *)[[v8 alloc] initWithAccessorySettingItem:v5];

  return v9;
}

void __92__HUAccessorySettingsDetailsViewControllerFactory__viewControllerForIdentifier_settingItem___block_invoke_2()
{
  v3[4] = *MEMORY[0x1E4F143B8];
  v2[0] = @"AnnounceSettingsViewController";
  v3[0] = objc_opt_class();
  v2[1] = @"AudioAnalysisSettingsViewController";
  v3[1] = objc_opt_class();
  v2[2] = @"PlaybackInfluencesViewController";
  v3[2] = objc_opt_class();
  v2[3] = @"SiriTriggerPhraseSettingDetailsViewController";
  v3[3] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:4];
  v1 = (void *)qword_1EBA47B38;
  qword_1EBA47B38 = v0;
}

+ (id)viewControllerForSettingItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 entity];
  id v6 = [v5 userInfo];
  id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68018]];

  v8 = [v4 settingKeyPath];
  LODWORD(v6) = [v8 isEqualToString:*MEMORY[0x1E4F68598]];

  if (v6)
  {

    id v7 = @"SiriTriggerPhraseSettingDetailsViewController";
  }
  else if (!v7)
  {
    v10 = 0;
LABEL_8:
    v11 = [[HUAccessorySettingsDetailsViewController alloc] initWithAccessorySettingItem:v4];

    goto LABEL_9;
  }
  v9 = [a1 _viewControllerForIdentifier:v7 settingItem:v4];
  v10 = v9;
  if (!v9) {
    goto LABEL_8;
  }
  v11 = v9;
  if (([(HUAccessorySettingsDetailsViewController *)v9 conformsToProtocol:&unk_1F1A21240] & 1) == 0) {
    goto LABEL_8;
  }
LABEL_9:

  return v11;
}

+ (id)viewControllerForGroup:(id)a3
{
  id v4 = a3;
  id v5 = [v4 entity];
  id v6 = [v5 userInfo];
  id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68018]];

  if (!v7)
  {
    v9 = 0;
LABEL_6:
    v10 = [[HUAccessorySettingsDetailsViewController alloc] initWithAccessoryGroupItem:v4];

    goto LABEL_7;
  }
  v8 = [a1 _viewControllerForIdentifier:v7 groupItem:v4];
  v9 = v8;
  if (!v8) {
    goto LABEL_6;
  }
  v10 = v8;
  if (([(HUAccessorySettingsDetailsViewController *)v8 conformsToProtocol:&unk_1F1A21240] & 1) == 0) {
    goto LABEL_6;
  }
LABEL_7:

  return v10;
}

@end