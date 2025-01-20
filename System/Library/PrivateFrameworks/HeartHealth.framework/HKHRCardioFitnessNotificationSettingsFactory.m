@interface HKHRCardioFitnessNotificationSettingsFactory
- (HKFeatureStatus)featureStatus;
- (HKHRCardioFitnessNotificationSettingsFactory)initWithFeatureStatus:(id)a3;
- (id)_ageGatedBridgeSettingFooter;
- (id)_ageGatedWatchSettingFooter;
- (id)_ageNotSetBridgeSettingFooter;
- (id)_ageNotSetWatchSettingFooter;
- (id)_bridgeNotificationsFooterForEvaluation:(id)a3 :(id)a4;
- (id)_bridgeOnboardingFooterForEvaluation:(id)a3 :(id)a4;
- (id)_genericBridgeSettingFooter;
- (id)_genericWatchSettingFooter;
- (id)_pairedDeviceRegionGatedFooter;
- (id)_pregnancyBridgeSettingFooter;
- (id)_pregnancyWatchSettingFooter;
- (id)_statusTextForWatchWithEnabledState:(BOOL)a3;
- (id)_watchFooterForEvaluation:(id)a3 :(id)a4;
- (id)_wristDetectOffBridgeSettingFooter;
- (id)bridgeSettings;
- (id)watchSettings;
- (void)setFeatureStatus:(id)a3;
@end

@implementation HKHRCardioFitnessNotificationSettingsFactory

- (HKHRCardioFitnessNotificationSettingsFactory)initWithFeatureStatus:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKHRCardioFitnessNotificationSettingsFactory;
  v5 = [(HKHRCardioFitnessNotificationSettingsFactory *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(HKHRCardioFitnessNotificationSettingsFactory *)v5 setFeatureStatus:v4];
    v7 = v6;
  }

  return v6;
}

- (id)_bridgeOnboardingFooterForEvaluation:(id)a3 :(id)a4
{
  id v5 = a3;
  if ([v5 areAllRequirementsSatisfied])
  {
    v6 = [(HKHRCardioFitnessNotificationSettingsFactory *)self featureStatus];
    v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F29BB8]];

    if (([v7 areAllRequirementsSatisfied] & 1) == 0)
    {
      uint64_t v8 = [(HKHRCardioFitnessNotificationSettingsFactory *)self _pregnancyBridgeSettingFooter];
      goto LABEL_11;
    }
  }
  else
  {
    v7 = [v5 highestPriorityUnsatisfiedRequirement];
    if ([v7 isEqualToString:*MEMORY[0x1E4F29C70]]
      || [v7 isEqualToString:*MEMORY[0x1E4F29C68]])
    {
      uint64_t v8 = [(HKHRCardioFitnessNotificationSettingsFactory *)self _pairedDeviceRegionGatedFooter];
      goto LABEL_11;
    }
    if (![v7 isEqualToString:*MEMORY[0x1E4F29CA8]])
    {
      _HKInitializeLogging();
      objc_super v9 = *MEMORY[0x1E4F29F48];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_FAULT)) {
        -[HKHRCardioFitnessNotificationSettingsFactory _bridgeOnboardingFooterForEvaluation::]((uint64_t)self, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  uint64_t v8 = [(HKHRCardioFitnessNotificationSettingsFactory *)self _genericBridgeSettingFooter];
LABEL_11:
  v16 = (void *)v8;

  return v16;
}

- (id)_bridgeNotificationsFooterForEvaluation:(id)a3 :(id)a4
{
  id v5 = a3;
  if ([v5 areAllRequirementsSatisfied])
  {
    v6 = [(HKHRCardioFitnessNotificationSettingsFactory *)self featureStatus];
    v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F29BB8]];

    if ([v7 areAllRequirementsSatisfied])
    {
LABEL_3:
      uint64_t v8 = [(HKHRCardioFitnessNotificationSettingsFactory *)self _genericBridgeSettingFooter];
      goto LABEL_15;
    }
    uint64_t v8 = [(HKHRCardioFitnessNotificationSettingsFactory *)self _pregnancyBridgeSettingFooter];
  }
  else
  {
    v7 = [v5 highestPriorityUnsatisfiedRequirement];
    if ([v7 isEqualToString:*MEMORY[0x1E4F29C70]]
      || [v7 isEqualToString:*MEMORY[0x1E4F29C68]])
    {
      uint64_t v8 = [(HKHRCardioFitnessNotificationSettingsFactory *)self _pairedDeviceRegionGatedFooter];
    }
    else if ([v7 isEqualToString:*MEMORY[0x1E4F29C50]])
    {
      uint64_t v8 = [(HKHRCardioFitnessNotificationSettingsFactory *)self _ageNotSetBridgeSettingFooter];
    }
    else if ([v7 isEqualToString:*MEMORY[0x1E4F29CB8]])
    {
      uint64_t v8 = [(HKHRCardioFitnessNotificationSettingsFactory *)self _ageGatedBridgeSettingFooter];
    }
    else
    {
      if ([v7 isEqualToString:*MEMORY[0x1E4F29CA8]]) {
        goto LABEL_3;
      }
      if (![v7 isEqualToString:*MEMORY[0x1E4F29D08]])
      {
        _HKInitializeLogging();
        uint64_t v11 = *MEMORY[0x1E4F29F48];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_FAULT)) {
          -[HKHRCardioFitnessNotificationSettingsFactory _bridgeOnboardingFooterForEvaluation::]((uint64_t)self, v11, v12, v13, v14, v15, v16, v17);
        }
        goto LABEL_3;
      }
      uint64_t v8 = [(HKHRCardioFitnessNotificationSettingsFactory *)self _wristDetectOffBridgeSettingFooter];
    }
  }
LABEL_15:
  objc_super v9 = (void *)v8;

  return v9;
}

- (id)bridgeSettings
{
  v3 = [(HKHRCardioFitnessNotificationSettingsFactory *)self featureStatus];
  id v4 = [v3 objectForKeyedSubscript:@"CardioFitnessBridgeSettingsVisibility"];

  if ([v4 areAllRequirementsSatisfied])
  {
    id v5 = [(HKHRCardioFitnessNotificationSettingsFactory *)self featureStatus];
    v6 = [v5 objectForKeyedSubscript:@"CardioFitnessBridgeOnboardingVisibility"];
    int v7 = [v6 areAllRequirementsSatisfied];

    uint64_t v8 = [(HKHRCardioFitnessNotificationSettingsFactory *)self featureStatus];
    objc_super v9 = v8;
    if (v7)
    {
      uint64_t v10 = [v8 objectForKeyedSubscript:@"CardioFitnessBridgeOnboardingEnablement"];

      uint64_t v11 = [v10 areAllRequirementsSatisfied];
      uint64_t v12 = [(HKHRCardioFitnessNotificationSettingsFactory *)self featureStatus];
      uint64_t v13 = [(HKHRCardioFitnessNotificationSettingsFactory *)self _bridgeOnboardingFooterForEvaluation:v10 :v12];

      uint64_t v14 = [[HKHRCardioFitnessBridgeSettings alloc] initWithSettingVisible:1 settingEnabled:v11 showOnboarding:1 footer:v13];
    }
    else
    {
      uint64_t v10 = [v8 objectForKeyedSubscript:@"CardioFitnessBridgeNotificationsEnablement"];

      uint64_t v15 = [(HKHRCardioFitnessNotificationSettingsFactory *)self featureStatus];
      uint64_t v16 = [v15 objectForKeyedSubscript:@"CardioFitnessBridgeNotificationsFooter"];

      uint64_t v17 = [v10 areAllRequirementsSatisfied];
      v18 = [(HKHRCardioFitnessNotificationSettingsFactory *)self featureStatus];
      v19 = [(HKHRCardioFitnessNotificationSettingsFactory *)self _bridgeNotificationsFooterForEvaluation:v16 :v18];

      uint64_t v14 = [[HKHRCardioFitnessBridgeSettings alloc] initWithSettingVisible:1 settingEnabled:v17 showOnboarding:0 footer:v19];
    }
  }
  else
  {
    uint64_t v14 = +[HKHRCardioFitnessBridgeSettings hiddenSettings];
  }

  return v14;
}

- (id)watchSettings
{
  v3 = [(HKHRCardioFitnessNotificationSettingsFactory *)self featureStatus];
  id v4 = [v3 objectForKeyedSubscript:@"CardioFitnessNanoSettingsVisibility"];

  if ([v4 areAllRequirementsSatisfied])
  {
    id v5 = [(HKHRCardioFitnessNotificationSettingsFactory *)self featureStatus];
    v6 = [v5 objectForKeyedSubscript:@"CardioFitnessNanoSettingsEnablement"];

    uint64_t v7 = [v6 areAllRequirementsSatisfied];
    uint64_t v8 = [(HKHRCardioFitnessNotificationSettingsFactory *)self _statusTextForWatchWithEnabledState:v7];
    objc_super v9 = [(HKHRCardioFitnessNotificationSettingsFactory *)self featureStatus];
    uint64_t v10 = [(HKHRCardioFitnessNotificationSettingsFactory *)self _watchFooterForEvaluation:v6 :v9];

    uint64_t v11 = [[HKHRCardioFitnessWatchSettings alloc] initWithSettingVisible:1 settingEnabled:v7 statusText:v8 footer:v10];
  }
  else
  {
    uint64_t v11 = +[HKHRCardioFitnessWatchSettings hiddenSettings];
  }

  return v11;
}

- (id)_watchFooterForEvaluation:(id)a3 :(id)a4
{
  id v5 = a3;
  if ([v5 areAllRequirementsSatisfied])
  {
    v6 = [(HKHRCardioFitnessNotificationSettingsFactory *)self featureStatus];
    uint64_t v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F29BB8]];

    if (([v7 areAllRequirementsSatisfied] & 1) == 0)
    {
      uint64_t v8 = [(HKHRCardioFitnessNotificationSettingsFactory *)self _pregnancyWatchSettingFooter];
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v7 = [v5 highestPriorityUnsatisfiedRequirement];
    if ([v7 isEqualToString:*MEMORY[0x1E4F29CB8]])
    {
      uint64_t v8 = [(HKHRCardioFitnessNotificationSettingsFactory *)self _ageGatedWatchSettingFooter];
      goto LABEL_11;
    }
    if ([v7 isEqualToString:*MEMORY[0x1E4F29C50]])
    {
      uint64_t v8 = [(HKHRCardioFitnessNotificationSettingsFactory *)self _ageNotSetWatchSettingFooter];
      goto LABEL_11;
    }
    _HKInitializeLogging();
    objc_super v9 = *MEMORY[0x1E4F29F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_FAULT)) {
      -[HKHRCardioFitnessNotificationSettingsFactory _bridgeOnboardingFooterForEvaluation::]((uint64_t)self, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  uint64_t v8 = [(HKHRCardioFitnessNotificationSettingsFactory *)self _genericWatchSettingFooter];
LABEL_11:
  uint64_t v16 = (void *)v8;

  return v16;
}

- (id)_statusTextForWatchWithEnabledState:(BOOL)a3
{
  if (a3)
  {
    v3 = [(HKHRCardioFitnessNotificationSettingsFactory *)self featureStatus];
    id v4 = [v3 requirementsEvaluationByContext];
    id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F29C20]];
    int v6 = [v5 isRequirementSatisfiedWithIdentifier:*MEMORY[0x1E4F29C90]];

    if (v6) {
      +[_HKHeartSettingsUtilities detailStatusOnText];
    }
    else {
    uint64_t v7 = +[_HKHeartSettingsUtilities detailStatusOffText];
    }
  }
  else
  {
    uint64_t v7 = +[_HKHeartSettingsUtilities cardioFitnessUnavailableDetailText];
  }

  return v7;
}

- (id)_genericBridgeSettingFooter
{
  v2 = [HKHRCardioFitnessFooter alloc];
  v3 = +[_HKHeartSettingsUtilities cardioFitnessFooterDescriptionWithLink];
  id v4 = +[_HKHeartSettingsUtilities cardioFitnessFooterLinkTitle];
  id v5 = +[_HKHeartSettingsUtilities cardioFitnessFooterLinkURL];
  int v6 = [(HKHRCardioFitnessFooter *)v2 initWithText:v3 link:v4 url:v5];

  return v6;
}

- (id)_wristDetectOffBridgeSettingFooter
{
  v2 = [HKHRCardioFitnessFooter alloc];
  v3 = +[_HKHeartSettingsUtilities cardioFitnessWristDetectFooterDescriptionWithLink];
  id v4 = +[_HKHeartSettingsUtilities cardioFitnessWristDetectFooterLinkTitle];
  id v5 = +[_HKHeartSettingsUtilities cardioFitnessWristDetectFooterLinkURL];
  int v6 = [(HKHRCardioFitnessFooter *)v2 initWithText:v3 link:v4 url:v5];

  return v6;
}

- (id)_ageGatedBridgeSettingFooter
{
  v2 = [HKHRCardioFitnessFooter alloc];
  v3 = +[_HKHeartSettingsUtilities cardioFitnessAgeRestrictedFooterDescription];
  id v4 = [(HKHRCardioFitnessFooter *)v2 initWithText:v3 link:0 url:0];

  return v4;
}

- (id)_ageNotSetBridgeSettingFooter
{
  v2 = [HKHRCardioFitnessFooter alloc];
  v3 = +[_HKHeartSettingsUtilities cardioFitnessAgeDeletedFooterDescriptionWithLink];
  id v4 = +[_HKHeartSettingsUtilities cardioFitnessAgeDeletedFooterLinkTitle];
  id v5 = +[_HKHeartSettingsUtilities cardioFitnessAgeDeletedFooterLinkURL];
  int v6 = [(HKHRCardioFitnessFooter *)v2 initWithText:v3 link:v4 url:v5];

  return v6;
}

- (id)_pairedDeviceRegionGatedFooter
{
  v2 = [HKHRCardioFitnessFooter alloc];
  v3 = +[_HKHeartSettingsUtilities cardioFitnessPairedDeviceRegionGatedFooterDescription];
  id v4 = [(HKHRCardioFitnessFooter *)v2 initWithText:v3 link:0 url:0];

  return v4;
}

- (id)_pregnancyBridgeSettingFooter
{
  v2 = [HKHRCardioFitnessFooter alloc];
  v3 = +[_HKHeartSettingsUtilities cardioFitnessPregnantFooterDescriptionWithLink];
  id v4 = +[_HKHeartSettingsUtilities cardioFitnessFooterLinkTitle];
  id v5 = +[_HKHeartSettingsUtilities cardioFitnessFooterLinkURL];
  int v6 = [(HKHRCardioFitnessFooter *)v2 initWithText:v3 link:v4 url:v5];

  return v6;
}

- (id)_genericWatchSettingFooter
{
  v2 = [HKHRCardioFitnessFooter alloc];
  v3 = +[_HKHeartSettingsUtilities cardioFitnessFooterDescription];
  id v4 = [(HKHRCardioFitnessFooter *)v2 initWithText:v3 link:0 url:0];

  return v4;
}

- (id)_ageGatedWatchSettingFooter
{
  v2 = [HKHRCardioFitnessFooter alloc];
  v3 = +[_HKHeartSettingsUtilities cardioFitnessAgeRestrictedFooterDescription];
  id v4 = [(HKHRCardioFitnessFooter *)v2 initWithText:v3 link:0 url:0];

  return v4;
}

- (id)_ageNotSetWatchSettingFooter
{
  v2 = [HKHRCardioFitnessFooter alloc];
  v3 = +[_HKHeartSettingsUtilities cardioFitnessAgeDeletedFooterDescriptionWithLink];
  id v4 = [(HKHRCardioFitnessFooter *)v2 initWithText:v3 link:0 url:0];

  return v4;
}

- (id)_pregnancyWatchSettingFooter
{
  v2 = [HKHRCardioFitnessFooter alloc];
  v3 = +[_HKHeartSettingsUtilities cardioFitnessPregnantFooterDescription];
  id v4 = [(HKHRCardioFitnessFooter *)v2 initWithText:v3 link:0 url:0];

  return v4;
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

- (void)_bridgeOnboardingFooterForEvaluation:(uint64_t)a3 :(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end