@interface HUHomeAudioAnalysisDetectionSettingsItem
- (HMHome)home;
- (HUHomeAudioAnalysisDetectionSettingsItem)initWithDetectionType:(unint64_t)a3 home:(id)a4;
- (id)_localizedStringFromDetectionType:(unint64_t)a3;
- (id)_subclass_updateWithOptions:(id)a3;
- (unint64_t)audioDetectionType;
@end

@implementation HUHomeAudioAnalysisDetectionSettingsItem

- (HUHomeAudioAnalysisDetectionSettingsItem)initWithDetectionType:(unint64_t)a3 home:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HUHomeAudioAnalysisDetectionSettingsItem;
  v8 = [(HUHomeAudioAnalysisDetectionSettingsItem *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_audioDetectionType = a3;
    objc_storeStrong((id *)&v8->_home, a4);
  }

  return v9;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v23[5] = *MEMORY[0x1E4F143B8];
  v4 = [(HUHomeAudioAnalysisDetectionSettingsItem *)self home];
  [v4 audioAnalysisClassifierOptions];

  v22[0] = *MEMORY[0x1E4F68AB8];
  v5 = [(HUHomeAudioAnalysisDetectionSettingsItem *)self _localizedStringFromDetectionType:[(HUHomeAudioAnalysisDetectionSettingsItem *)self audioDetectionType]];
  v23[0] = v5;
  v22[1] = *MEMORY[0x1E4F68BC0];
  v6 = NSNumber;
  [(HUHomeAudioAnalysisDetectionSettingsItem *)self audioDetectionType];
  id v7 = [v6 numberWithInteger:HFPrimaryStateFromBOOL()];
  uint64_t v8 = *MEMORY[0x1E4F68B10];
  uint64_t v9 = MEMORY[0x1E4F1CC28];
  v23[1] = v7;
  v23[2] = MEMORY[0x1E4F1CC28];
  uint64_t v10 = *MEMORY[0x1E4F68908];
  v22[2] = v8;
  v22[3] = v10;
  objc_super v11 = (void *)MEMORY[0x1E4F1CAD0];
  v12 = [(HUHomeAudioAnalysisDetectionSettingsItem *)self home];
  v13 = [v11 setWithObject:v12];
  v23[3] = v13;
  v22[4] = *MEMORY[0x1E4F68A08];
  v14 = [(HUHomeAudioAnalysisDetectionSettingsItem *)self home];
  int v15 = objc_msgSend(v14, "hf_currentUserIsAdministrator");
  uint64_t v16 = MEMORY[0x1E4F1CC38];
  if (v15) {
    uint64_t v16 = v9;
  }
  v23[4] = v16;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:5];

  v18 = (void *)MEMORY[0x1E4F7A0D8];
  v19 = [MEMORY[0x1E4F69228] outcomeWithResults:v17];
  v20 = [v18 futureWithResult:v19];

  return v20;
}

- (id)_localizedStringFromDetectionType:(unint64_t)a3
{
  if (a3 == 1)
  {
    v4 = _HULocalizedStringWithDefaultValue(@"HUAudioAnalysisEventSmokeAlarm", @"HUAudioAnalysisEventSmokeAlarm", a3);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (unint64_t)audioDetectionType
{
  return self->_audioDetectionType;
}

- (HMHome)home
{
  return self->_home;
}

- (void).cxx_destruct
{
}

@end