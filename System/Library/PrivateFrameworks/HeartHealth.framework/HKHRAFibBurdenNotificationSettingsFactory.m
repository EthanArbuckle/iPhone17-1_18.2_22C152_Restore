@interface HKHRAFibBurdenNotificationSettingsFactory
- (BOOL)_isFeatureOnboardedAndAvailableWithIsOnboarded:(BOOL)a3 requirementsEvaluation:(id)a4;
- (BOOL)_isOnboarded;
- (HKFeatureStatus)featureStatus;
- (HKHRAFibBurdenNotificationSettingsFactory)initWithFeatureStatus:(id)a3;
- (id)_deviceRegionGatedBridgeSettingFooter;
- (id)_deviceRegionGatedWatchSettingFooter;
- (id)_evaluationForIsOnboarded:(BOOL)a3;
- (id)_genericBridgeSettingFooter;
- (id)_genericWatchSettingFooter;
- (id)_irnEnabledBridgeSettingFooter;
- (id)_irnEnabledWatchSettingFooter;
- (id)_remoteDisabledBridgeSettingFooter;
- (id)_remoteDisabledWatchSettingFooter;
- (id)_seedExpiryBridgeSettingFooter;
- (id)_seedExpiryWatchSettingFooter;
- (id)_wristDetectDisabledBridgeSettingFooter;
- (id)bridgeSettings;
- (id)watchSettings;
- (void)bridgeSettings;
- (void)setFeatureStatus:(id)a3;
- (void)watchSettings;
@end

@implementation HKHRAFibBurdenNotificationSettingsFactory

- (HKHRAFibBurdenNotificationSettingsFactory)initWithFeatureStatus:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKHRAFibBurdenNotificationSettingsFactory;
  v5 = [(HKHRAFibBurdenNotificationSettingsFactory *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(HKHRAFibBurdenNotificationSettingsFactory *)v5 setFeatureStatus:v4];
    v7 = v6;
  }

  return v6;
}

- (id)bridgeSettings
{
  BOOL v3 = [(HKHRAFibBurdenNotificationSettingsFactory *)self _isOnboarded];
  id v4 = [(HKHRAFibBurdenNotificationSettingsFactory *)self _evaluationForIsOnboarded:v3];
  if ([(HKHRAFibBurdenNotificationSettingsFactory *)self _isFeatureOnboardedAndAvailableWithIsOnboarded:v3 requirementsEvaluation:v4])
  {
    v5 = [HKHRAFibBurdenBridgeSettings alloc];
    v6 = [(HKHRAFibBurdenNotificationSettingsFactory *)self _genericBridgeSettingFooter];
    v7 = v5;
    uint64_t v8 = 0;
LABEL_3:
    objc_super v9 = [(HKHRAFibBurdenBridgeSettings *)v7 initWithSettingVisible:1 settingEnabled:1 showOnboarding:v8 footer:v6];

    goto LABEL_32;
  }
  int v10 = [v4 isRequirementSatisfiedWithIdentifier:*MEMORY[0x1E4F29CA0]];
  int v11 = [v4 isRequirementSatisfiedWithIdentifier:*MEMORY[0x1E4F29CB8]];
  char v12 = [v4 isRequirementSatisfiedWithIdentifier:*MEMORY[0x1E4F29C58]];
  if (v10) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13 || (v12 & 1) == 0) {
    goto LABEL_31;
  }
  char v14 = [v4 isRequirementSatisfiedWithIdentifier:*MEMORY[0x1E4F29CA8]];
  char v15 = [v4 isRequirementSatisfiedWithIdentifier:*MEMORY[0x1E4F29C88]];
  char v16 = [v4 isRequirementSatisfiedWithIdentifier:*MEMORY[0x1E4F29CF8]];
  char v17 = [v4 isRequirementSatisfiedWithIdentifier:*MEMORY[0x1E4F29D08]];
  int v18 = [v4 isRequirementSatisfiedWithIdentifier:*MEMORY[0x1E4F29C70]];
  char v19 = [v4 isRequirementSatisfiedWithIdentifier:*MEMORY[0x1E4F29C68]];
  char v20 = [v4 isRequirementSatisfiedWithIdentifier:*MEMORY[0x1E4F29CB0]];
  if (!v18 || (v19 & 1) == 0)
  {
    v22 = [HKHRAFibBurdenBridgeSettings alloc];
    uint64_t v23 = v3 ^ 1;
    uint64_t v24 = [(HKHRAFibBurdenNotificationSettingsFactory *)self _deviceRegionGatedBridgeSettingFooter];
LABEL_25:
    v25 = (void *)v24;
    objc_super v9 = [(HKHRAFibBurdenBridgeSettings *)v22 initWithSettingVisible:1 settingEnabled:0 showOnboarding:v23 footer:v24];

    goto LABEL_32;
  }
  if ((v15 & 1) == 0)
  {
    v22 = [HKHRAFibBurdenBridgeSettings alloc];
    uint64_t v23 = v3 ^ 1;
    uint64_t v24 = [(HKHRAFibBurdenNotificationSettingsFactory *)self _remoteDisabledBridgeSettingFooter];
    goto LABEL_25;
  }
  if ((v16 & 1) == 0)
  {
    v22 = [HKHRAFibBurdenBridgeSettings alloc];
    uint64_t v23 = v3 ^ 1;
    uint64_t v24 = [(HKHRAFibBurdenNotificationSettingsFactory *)self _seedExpiryBridgeSettingFooter];
    goto LABEL_25;
  }
  if ((v14 & 1) == 0)
  {
    v22 = [HKHRAFibBurdenBridgeSettings alloc];
    uint64_t v23 = v3 ^ 1;
    uint64_t v24 = [(HKHRAFibBurdenNotificationSettingsFactory *)self _genericBridgeSettingFooter];
    goto LABEL_25;
  }
  if ((v17 & 1) == 0)
  {
    v22 = [HKHRAFibBurdenBridgeSettings alloc];
    uint64_t v23 = v3 ^ 1;
    uint64_t v24 = [(HKHRAFibBurdenNotificationSettingsFactory *)self _wristDetectDisabledBridgeSettingFooter];
    goto LABEL_25;
  }
  if ((v20 & 1) == 0)
  {
    v22 = [HKHRAFibBurdenBridgeSettings alloc];
    uint64_t v23 = v3 ^ 1;
    uint64_t v24 = [(HKHRAFibBurdenNotificationSettingsFactory *)self _irnEnabledBridgeSettingFooter];
    goto LABEL_25;
  }
  if (v3)
  {
    _HKInitializeLogging();
    v21 = HKHRAFibBurdenLogForCategory(2);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      -[HKHRAFibBurdenNotificationSettingsFactory bridgeSettings]();
    }
  }
  else
  {
    if ([v4 areAllRequirementsSatisfied])
    {
      v26 = [HKHRAFibBurdenBridgeSettings alloc];
      v6 = [(HKHRAFibBurdenNotificationSettingsFactory *)self _genericBridgeSettingFooter];
      v7 = v26;
      uint64_t v8 = 1;
      goto LABEL_3;
    }
    _HKInitializeLogging();
    v21 = HKHRAFibBurdenLogForCategory(2);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      -[HKHRAFibBurdenNotificationSettingsFactory bridgeSettings]();
    }
  }

LABEL_31:
  objc_super v9 = +[HKHRAFibBurdenBridgeSettings hiddenSettings];
LABEL_32:

  return v9;
}

- (id)_genericBridgeSettingFooter
{
  v2 = [HKHRAFibBurdenFooter alloc];
  BOOL v3 = +[_HKHeartSettingsUtilities aFibBurdenFooterDescriptionWithLink];
  id v4 = +[_HKHeartSettingsUtilities aFibBurdenFooterLinkTitle];
  v5 = +[_HKHeartSettingsUtilities aFibBurdenDefaultLinkURL];
  v6 = [(HKHRAFibBurdenFooter *)v2 initWithText:v3 link:v4 url:v5];

  return v6;
}

- (id)_wristDetectDisabledBridgeSettingFooter
{
  v2 = [HKHRAFibBurdenFooter alloc];
  BOOL v3 = +[_HKHeartSettingsUtilities aFibBurdenWristDetectFooterDescriptionWithLink];
  id v4 = +[_HKHeartSettingsUtilities aFibBurdenWristDetectFooterLinkTitle];
  v5 = +[_HKHeartSettingsUtilities aFibBurdenWristDetectFooterLinkURL];
  v6 = [(HKHRAFibBurdenFooter *)v2 initWithText:v3 link:v4 url:v5];

  return v6;
}

- (id)_deviceRegionGatedBridgeSettingFooter
{
  v2 = [HKHRAFibBurdenFooter alloc];
  BOOL v3 = +[_HKHeartSettingsUtilities aFibBurdenRegionNotSupportedFooterDescriptionWithLink];
  id v4 = +[_HKHeartSettingsUtilities remoteDisabledLinkTitle];
  v5 = +[_HKHeartSettingsUtilities remoteDisabledLinkURL];
  v6 = [(HKHRAFibBurdenFooter *)v2 initWithText:v3 link:v4 url:v5];

  return v6;
}

- (id)_irnEnabledBridgeSettingFooter
{
  v2 = [HKHRAFibBurdenFooter alloc];
  BOOL v3 = +[_HKHeartSettingsUtilities aFibBurdenIRNEnabledFooterDescriptionWithLink];
  id v4 = +[_HKHeartSettingsUtilities aFibBurdenFooterLinkTitle];
  v5 = +[_HKHeartSettingsUtilities aFibBurdenDefaultLinkURL];
  v6 = [(HKHRAFibBurdenFooter *)v2 initWithText:v3 link:v4 url:v5];

  return v6;
}

- (id)_remoteDisabledBridgeSettingFooter
{
  v2 = [HKHRAFibBurdenFooter alloc];
  BOOL v3 = +[_HKHeartSettingsUtilities aFibBurdenRemoteDisabledFooterDescriptionWithLink];
  id v4 = +[_HKHeartSettingsUtilities remoteDisabledLinkTitle];
  v5 = +[_HKHeartSettingsUtilities remoteDisabledLinkURL];
  v6 = [(HKHRAFibBurdenFooter *)v2 initWithText:v3 link:v4 url:v5];

  return v6;
}

- (id)_seedExpiryBridgeSettingFooter
{
  v2 = [HKHRAFibBurdenFooter alloc];
  BOOL v3 = +[_HKHeartSettingsUtilities aFibBurdenSeedExpiryFooterDescriptionWithLink];
  id v4 = +[_HKHeartSettingsUtilities seedExpiredLinkTitle];
  v5 = +[_HKHeartSettingsUtilities seedExpiredLinkURL];
  v6 = [(HKHRAFibBurdenFooter *)v2 initWithText:v3 link:v4 url:v5];

  return v6;
}

- (id)watchSettings
{
  BOOL v3 = [(HKHRAFibBurdenNotificationSettingsFactory *)self _isOnboarded];
  id v4 = [(HKHRAFibBurdenNotificationSettingsFactory *)self _evaluationForIsOnboarded:v3];
  if ([(HKHRAFibBurdenNotificationSettingsFactory *)self _isFeatureOnboardedAndAvailableWithIsOnboarded:v3 requirementsEvaluation:v4])
  {
    int v5 = [v4 isRequirementSatisfiedWithIdentifier:*MEMORY[0x1E4F29C90]];
    v6 = [HKHRAFibBurdenWatchSettings alloc];
    if (v5) {
      +[_HKHeartSettingsUtilities detailStatusOnText];
    }
    else {
    char v19 = +[_HKHeartSettingsUtilities detailStatusOffText];
    }
    char v20 = [(HKHRAFibBurdenNotificationSettingsFactory *)self _genericWatchSettingFooter];
    int v18 = [(HKHRAFibBurdenWatchSettings *)v6 initWithSettingVisible:1 settingEnabled:1 statusText:v19 footer:v20];

    goto LABEL_22;
  }
  int v7 = [v4 isRequirementSatisfiedWithIdentifier:*MEMORY[0x1E4F29CA0]];
  int v8 = [v4 isRequirementSatisfiedWithIdentifier:*MEMORY[0x1E4F29CA8]];
  int v9 = [v4 isRequirementSatisfiedWithIdentifier:*MEMORY[0x1E4F29CB8]];
  unsigned int v10 = [v4 isRequirementSatisfiedWithIdentifier:*MEMORY[0x1E4F29C58]];
  char v11 = [v4 isRequirementSatisfiedWithIdentifier:*MEMORY[0x1E4F29D08]];
  if (!(v3 & v7 & v8 & v9 & v10) || (v11 & 1) == 0)
  {
LABEL_14:
    int v18 = +[HKHRAFibBurdenWatchSettings hiddenSettings];
    goto LABEL_23;
  }
  char v12 = [v4 isRequirementSatisfiedWithIdentifier:*MEMORY[0x1E4F29CB0]];
  char v13 = [v4 isRequirementSatisfiedWithIdentifier:*MEMORY[0x1E4F29C88]];
  char v14 = [v4 isRequirementSatisfiedWithIdentifier:*MEMORY[0x1E4F29CF8]];
  int v15 = [v4 isRequirementSatisfiedWithIdentifier:*MEMORY[0x1E4F29C70]];
  char v16 = [v4 isRequirementSatisfiedWithIdentifier:*MEMORY[0x1E4F29C68]];
  if (v15 && (v16 & 1) != 0)
  {
    if (v13)
    {
      if (v14)
      {
        if (v12)
        {
          _HKInitializeLogging();
          char v17 = HKHRAFibBurdenLogForCategory(2);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
            -[HKHRAFibBurdenNotificationSettingsFactory watchSettings]();
          }

          goto LABEL_14;
        }
        v21 = [HKHRAFibBurdenWatchSettings alloc];
        char v19 = +[_HKHeartSettingsUtilities aFibBurdenUnavailableDetailText];
        uint64_t v22 = [(HKHRAFibBurdenNotificationSettingsFactory *)self _irnEnabledWatchSettingFooter];
      }
      else
      {
        v21 = [HKHRAFibBurdenWatchSettings alloc];
        char v19 = +[_HKHeartSettingsUtilities aFibBurdenUnavailableDetailText];
        uint64_t v22 = [(HKHRAFibBurdenNotificationSettingsFactory *)self _seedExpiryWatchSettingFooter];
      }
    }
    else
    {
      v21 = [HKHRAFibBurdenWatchSettings alloc];
      char v19 = +[_HKHeartSettingsUtilities aFibBurdenUnavailableDetailText];
      uint64_t v22 = [(HKHRAFibBurdenNotificationSettingsFactory *)self _remoteDisabledWatchSettingFooter];
    }
  }
  else
  {
    v21 = [HKHRAFibBurdenWatchSettings alloc];
    char v19 = +[_HKHeartSettingsUtilities aFibBurdenUnavailableDetailText];
    uint64_t v22 = [(HKHRAFibBurdenNotificationSettingsFactory *)self _deviceRegionGatedWatchSettingFooter];
  }
  uint64_t v23 = (void *)v22;
  int v18 = [(HKHRAFibBurdenWatchSettings *)v21 initWithSettingVisible:1 settingEnabled:0 statusText:v19 footer:v22];

LABEL_22:
LABEL_23:

  return v18;
}

- (id)_genericWatchSettingFooter
{
  v2 = [HKHRAFibBurdenFooter alloc];
  BOOL v3 = +[_HKHeartSettingsUtilities aFibBurdenFooterDescription];
  id v4 = [(HKHRAFibBurdenFooter *)v2 initWithText:v3 link:0 url:0];

  return v4;
}

- (id)_deviceRegionGatedWatchSettingFooter
{
  v2 = [HKHRAFibBurdenFooter alloc];
  BOOL v3 = +[_HKHeartSettingsUtilities aFibBurdenRegionNotSupportedFooterDescription];
  id v4 = [(HKHRAFibBurdenFooter *)v2 initWithText:v3 link:0 url:0];

  return v4;
}

- (id)_irnEnabledWatchSettingFooter
{
  v2 = [HKHRAFibBurdenFooter alloc];
  BOOL v3 = +[_HKHeartSettingsUtilities aFibBurdenIRNEnabledFooterDescriptionWatch];
  id v4 = [(HKHRAFibBurdenFooter *)v2 initWithText:v3 link:0 url:0];

  return v4;
}

- (id)_remoteDisabledWatchSettingFooter
{
  v2 = [HKHRAFibBurdenFooter alloc];
  BOOL v3 = +[_HKHeartSettingsUtilities aFibBurdenRemoteDisabledFooterDescriptionWatch];
  id v4 = [(HKHRAFibBurdenFooter *)v2 initWithText:v3 link:0 url:0];

  return v4;
}

- (id)_seedExpiryWatchSettingFooter
{
  v2 = [HKHRAFibBurdenFooter alloc];
  BOOL v3 = +[_HKHeartSettingsUtilities aFibBurdenSeedExpiryFooterDescriptionWatch];
  id v4 = [(HKHRAFibBurdenFooter *)v2 initWithText:v3 link:0 url:0];

  return v4;
}

- (BOOL)_isOnboarded
{
  if (![(HKFeatureStatus *)self->_featureStatus isOnboardingRecordPresent]) {
    return 0;
  }
  BOOL v3 = [(HKFeatureStatus *)self->_featureStatus onboardingRecord];
  BOOL v4 = [v3 onboardingState] != 1;

  return v4;
}

- (id)_evaluationForIsOnboarded:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = [(HKFeatureStatus *)self->_featureStatus requirementsEvaluationByContext];
  int v5 = v4;
  v6 = (void *)MEMORY[0x1E4F29C20];
  if (!v3) {
    v6 = (void *)MEMORY[0x1E4F29BD8];
  }
  int v7 = [v4 objectForKeyedSubscript:*v6];

  return v7;
}

- (BOOL)_isFeatureOnboardedAndAvailableWithIsOnboarded:(BOOL)a3 requirementsEvaluation:(id)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  BOOL v4 = [a4 unsatisfiedRequirementIdentifiers];
  if ([v4 count])
  {
    v8[0] = *MEMORY[0x1E4F29C90];
    int v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    char v6 = [v4 isEqualToArray:v5];
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

- (HKFeatureStatus)featureStatus
{
  return self->_featureStatus;
}

- (void)setFeatureStatus:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)bridgeSettings
{
  id v0 = (id)objc_opt_class();
  OUTLINED_FUNCTION_0_1(&dword_1E0A83000, v1, v2, "[%@]: Requested settings for an un-handled pre-onboarding state", v3, v4, v5, v6, 2u);
}

- (void)watchSettings
{
  id v0 = (id)objc_opt_class();
  OUTLINED_FUNCTION_0_1(&dword_1E0A83000, v1, v2, "[%@]: Requested watch settings for an un-handled notification state", v3, v4, v5, v6, 2u);
}

@end