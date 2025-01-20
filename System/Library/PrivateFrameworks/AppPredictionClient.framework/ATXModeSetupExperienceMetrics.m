@interface ATXModeSetupExperienceMetrics
- (NSString)modeSemanticType;
- (id)coreAnalyticsDictionary;
- (id)description;
- (id)metricName;
- (id)outcomeToString:(int64_t)a3;
- (int64_t)onboardingOutcome;
- (void)sendToCoreAnalytics;
- (void)setModeSemanticType:(id)a3;
- (void)setOnboardingOutcome:(int64_t)a3;
@end

@implementation ATXModeSetupExperienceMetrics

- (id)metricName
{
  return @"com.apple.ModeConfiguration.SetupExperience";
}

- (id)coreAnalyticsDictionary
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"modeSemanticType";
  v3 = [(ATXModeSetupExperienceMetrics *)self modeSemanticType];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"onboardingOutcome";
  v10[0] = v4;
  v5 = [(ATXModeSetupExperienceMetrics *)self outcomeToString:[(ATXModeSetupExperienceMetrics *)self onboardingOutcome]];
  v6 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  if (!v5) {

  }
  if (!v3) {

  }
  return v7;
}

- (id)description
{
  v3 = NSString;
  v4 = [(ATXModeSetupExperienceMetrics *)self modeSemanticType];
  v5 = [(ATXModeSetupExperienceMetrics *)self outcomeToString:[(ATXModeSetupExperienceMetrics *)self onboardingOutcome]];
  v6 = [v3 stringWithFormat:@"ATXModeSetupExperienceMetrics modeSemanticType:%@\nonboardingOutcome:%@\n", v4, v5];

  return v6;
}

- (void)sendToCoreAnalytics
{
  id v4 = [(ATXModeSetupExperienceMetrics *)self metricName];
  v3 = [(ATXModeSetupExperienceMetrics *)self coreAnalyticsDictionary];
  AnalyticsSendEvent();
}

- (id)outcomeToString:(int64_t)a3
{
  v3 = @"ModifiedSuggestions";
  if (a3 == 1) {
    v3 = @"AcceptedSuggestions";
  }
  if (a3 == 2) {
    return @"Dismissed";
  }
  else {
    return v3;
  }
}

- (NSString)modeSemanticType
{
  return self->_modeSemanticType;
}

- (void)setModeSemanticType:(id)a3
{
}

- (int64_t)onboardingOutcome
{
  return self->_onboardingOutcome;
}

- (void)setOnboardingOutcome:(int64_t)a3
{
  self->_onboardingOutcome = a3;
}

- (void).cxx_destruct
{
}

@end