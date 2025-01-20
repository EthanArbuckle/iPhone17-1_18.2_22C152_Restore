@interface HUSoundRecognitionItem
- (HMHome)home;
- (HUSoundRecognitionItem)initWithHome:(id)a3;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation HUSoundRecognitionItem

- (HUSoundRecognitionItem)initWithHome:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HUSoundRecognitionItem.m", 18, @"Invalid parameter not satisfying: %@", @"home" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)HUSoundRecognitionItem;
  v7 = [(HUSoundRecognitionItem *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_home, a3);
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(HUSoundRecognitionItem *)self home];
  id v6 = (void *)[v4 initWithHome:v5];

  [v6 copyLatestResultsFromItem:self];
  return v6;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v4 = objc_opt_new();
  v5 = [(HUSoundRecognitionItem *)self home];
  if (objc_msgSend(v5, "hf_hasAtleastOneAudioAnalysisSupportedAccessory"))
  {
    id v6 = [(HUSoundRecognitionItem *)self home];
    uint64_t v7 = objc_msgSend(v6, "hf_currentUserIsAdministrator") ^ 1;
  }
  else
  {
    uint64_t v7 = 1;
  }

  v8 = [NSNumber numberWithBool:v7];
  [v4 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F68B10]];

  v9 = [(HUSoundRecognitionItem *)self home];
  uint64_t v10 = [v9 audioAnalysisClassifierOptions];

  objc_super v11 = _HULocalizedStringWithDefaultValue(@"HUListenSettings_Title", @"HUListenSettings_Title", 1);
  [v4 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  if (v10) {
    v12 = @"HUSafetyAndSecuritySettingsNotifications_On";
  }
  else {
    v12 = @"HUSafetyAndSecuritySettingsNotifications_Off";
  }
  v13 = _HULocalizedStringWithDefaultValue(v12, v12, 1);
  [v4 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F68980]];

  v14 = (void *)MEMORY[0x1E4F1CAD0];
  v15 = [(HUSoundRecognitionItem *)self home];
  v16 = [v14 setWithObject:v15];
  [v4 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F68908]];

  v17 = [MEMORY[0x1E4F7A0D8] futureWithResult:v4];

  return v17;
}

- (HMHome)home
{
  return self->_home;
}

- (void).cxx_destruct
{
}

@end