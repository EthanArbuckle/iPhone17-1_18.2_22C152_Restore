@interface HKHRElectrocardiogramRecordingBridgeSettings
- (BOOL)_featureOnboardedWithFeatureStatus:(id)a3;
- (BOOL)_isSettingsVisibleWithFeatureStatus:(id)a3;
- (BOOL)_userInteractionEnabledWithFeatureStatus:(id)a3;
- (BOOL)settingVisible;
- (BOOL)showOnboarding;
- (BOOL)userInteractionEnabled;
- (HKHRElectrocardiogramRecordingBridgeSettings)initWithFeatureStatus:(id)a3 isAppInstalled:(BOOL)a4;
- (HKHRElectrocardiogramRecordingFooter)footer;
- (id)_footerWithFeatureStatus:(id)a3 isAppInstalled:(BOOL)a4;
@end

@implementation HKHRElectrocardiogramRecordingBridgeSettings

- (HKHRElectrocardiogramRecordingBridgeSettings)initWithFeatureStatus:(id)a3 isAppInstalled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKHRElectrocardiogramRecordingBridgeSettings;
  v7 = [(HKHRElectrocardiogramRecordingBridgeSettings *)&v14 init];
  v8 = v7;
  if (v7)
  {
    BOOL v9 = [(HKHRElectrocardiogramRecordingBridgeSettings *)v7 _isSettingsVisibleWithFeatureStatus:v6];
    v8->_settingVisible = v9;
    if (v9) {
      BOOL v10 = ![(HKHRElectrocardiogramRecordingBridgeSettings *)v8 _featureOnboardedWithFeatureStatus:v6];
    }
    else {
      LOBYTE(v10) = 0;
    }
    v8->_showOnboarding = v10;
    v8->_userInteractionEnabled = [(HKHRElectrocardiogramRecordingBridgeSettings *)v8 _userInteractionEnabledWithFeatureStatus:v6];
    uint64_t v11 = [(HKHRElectrocardiogramRecordingBridgeSettings *)v8 _footerWithFeatureStatus:v6 isAppInstalled:v4];
    footer = v8->_footer;
    v8->_footer = (HKHRElectrocardiogramRecordingFooter *)v11;
  }
  return v8;
}

- (BOOL)_userInteractionEnabledWithFeatureStatus:(id)a3
{
  BOOL v4 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F29BF0]];
  v5 = v4;
  if (self->_settingVisible) {
    char v6 = [v4 areAllRequirementsSatisfied];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)_featureOnboardedWithFeatureStatus:(id)a3
{
  return [a3 isOnboardingRecordPresent];
}

- (id)_footerWithFeatureStatus:(id)a3 isAppInstalled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F29C20]];
  v8 = v7;
  if (!self->_settingVisible)
  {
    objc_super v14 = [[HKHRElectrocardiogramRecordingFooter alloc] initWithText:0 link:0 url:0];
    goto LABEL_15;
  }
  BOOL v9 = [v7 unsatisfiedRequirementIdentifiers];
  int v10 = [v9 containsObject:*MEMORY[0x1E4F29C88]];

  if (v10)
  {
    uint64_t v11 = HKHeartRateLocalizedString(@"FEATURE_DISABLED_REMOTELY_CINNAMON");
    v12 = +[_HKHeartSettingsUtilities remoteDisabledLinkTitle];
    id v13 = (id)*MEMORY[0x1E4F29AC8];
  }
  else
  {
    v15 = [v8 unsatisfiedRequirementIdentifiers];
    int v16 = [v15 containsObject:*MEMORY[0x1E4F29CF8]];

    if (!v16)
    {
      if ([(HKHRElectrocardiogramRecordingBridgeSettings *)self _featureOnboardedWithFeatureStatus:v6])
      {
        if (v4) {
          v18 = @"ELECTROCARDIOGRAM_FOOTER_ONBOARDING_COMPLETED";
        }
        else {
          v18 = @"ELECTROCARDIOGRAM_FOOTER_ONBOARDING_COMPLETED_APP_NOT_INSTALLED";
        }
      }
      else
      {
        v18 = @"ELECTROCARDIOGRAM_FOOTER";
      }
      uint64_t v11 = HKHeartRateLocalizedString(v18);
      v12 = 0;
      v17 = 0;
      goto LABEL_14;
    }
    uint64_t v11 = HKHeartRateLocalizedString(@"FEATURE_SEED_EXPIRED_CINNAMON");
    v12 = +[_HKHeartSettingsUtilities seedExpiredLinkTitle];
    id v13 = +[_HKHeartSettingsUtilities seedExpiredLinkURL];
  }
  v17 = v13;
LABEL_14:
  objc_super v14 = [[HKHRElectrocardiogramRecordingFooter alloc] initWithText:v11 link:v12 url:v17];

LABEL_15:

  return v14;
}

- (BOOL)_isSettingsVisibleWithFeatureStatus:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F29BF8]];
  char v4 = [v3 areAllRequirementsSatisfied];

  return v4;
}

- (BOOL)settingVisible
{
  return self->_settingVisible;
}

- (BOOL)showOnboarding
{
  return self->_showOnboarding;
}

- (BOOL)userInteractionEnabled
{
  return self->_userInteractionEnabled;
}

- (HKHRElectrocardiogramRecordingFooter)footer
{
  return self->_footer;
}

- (void).cxx_destruct
{
}

@end