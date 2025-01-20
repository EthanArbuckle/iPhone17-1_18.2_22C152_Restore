@interface HUAudioAnalysisDetectionSettingsItem
- (HMAccessory)accessory;
- (HUAudioAnalysisDetectionSettingsItem)initWithDetectionType:(unint64_t)a3 accessory:(id)a4;
- (id)_localizedStringFromDetectionType:(unint64_t)a3;
- (id)_subclass_updateWithOptions:(id)a3;
- (unint64_t)audioDetectionType;
@end

@implementation HUAudioAnalysisDetectionSettingsItem

- (HUAudioAnalysisDetectionSettingsItem)initWithDetectionType:(unint64_t)a3 accessory:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HUAudioAnalysisDetectionSettingsItem;
  v8 = [(HUAudioAnalysisDetectionSettingsItem *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_audioDetectionType = a3;
    objc_storeStrong((id *)&v8->_accessory, a4);
  }

  return v9;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v25[5] = *MEMORY[0x1E4F143B8];
  v4 = [(HUAudioAnalysisDetectionSettingsItem *)self accessory];
  v5 = [v4 audioAnalysisEventBulletinBoardNotification];
  [v5 options];

  v24[0] = *MEMORY[0x1E4F68AB8];
  v6 = [(HUAudioAnalysisDetectionSettingsItem *)self _localizedStringFromDetectionType:[(HUAudioAnalysisDetectionSettingsItem *)self audioDetectionType]];
  v25[0] = v6;
  v24[1] = *MEMORY[0x1E4F68BC0];
  id v7 = NSNumber;
  [(HUAudioAnalysisDetectionSettingsItem *)self audioDetectionType];
  v8 = [v7 numberWithInteger:HFPrimaryStateFromBOOL()];
  uint64_t v9 = *MEMORY[0x1E4F68B10];
  uint64_t v10 = MEMORY[0x1E4F1CC28];
  v25[1] = v8;
  v25[2] = MEMORY[0x1E4F1CC28];
  uint64_t v11 = *MEMORY[0x1E4F68908];
  v24[2] = v9;
  v24[3] = v11;
  v12 = (void *)MEMORY[0x1E4F1CAD0];
  v13 = [(HUAudioAnalysisDetectionSettingsItem *)self accessory];
  v14 = [v12 setWithObject:v13];
  v25[3] = v14;
  v24[4] = *MEMORY[0x1E4F68A08];
  v15 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  v16 = [v15 home];
  int v17 = objc_msgSend(v16, "hf_currentUserIsAdministrator");
  uint64_t v18 = MEMORY[0x1E4F1CC38];
  if (v17) {
    uint64_t v18 = v10;
  }
  v25[4] = v18;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:5];

  v20 = (void *)MEMORY[0x1E4F7A0D8];
  v21 = [MEMORY[0x1E4F69228] outcomeWithResults:v19];
  v22 = [v20 futureWithResult:v21];

  return v22;
}

- (id)_localizedStringFromDetectionType:(unint64_t)a3
{
  if (a3 == 2)
  {
    v3 = @"HUAudioAnalysisEventCarbonMonoxideAlarm";
    v4 = @"HUAudioAnalysisEventCarbonMonoxideAlarm";
    LODWORD(a3) = 1;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v3 = @"HUAudioAnalysisEventSmokeAlarm";
    v4 = @"HUAudioAnalysisEventSmokeAlarm";
LABEL_5:
    v5 = _HULocalizedStringWithDefaultValue(v3, v4, a3);
    goto LABEL_7;
  }
  v5 = 0;
LABEL_7:

  return v5;
}

- (unint64_t)audioDetectionType
{
  return self->_audioDetectionType;
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (void).cxx_destruct
{
}

@end