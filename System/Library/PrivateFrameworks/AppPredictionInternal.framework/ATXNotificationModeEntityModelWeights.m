@interface ATXNotificationModeEntityModelWeights
- (ATXNotificationModeEntityModelWeights)init;
- (double)appCategoryScoreComponent;
- (double)appClassConditionalProbabilityComponent;
- (double)appGlobalOccurrencesComponent;
- (double)appGlobalPopularityComponent;
- (double)appModePopularityComponent;
- (double)appPosteriorProbabilityComponent;
- (double)bias;
- (double)clearClassConditionalProbabilityComponent;
- (double)clearGlobalPopularityComponent;
- (double)clearModePopularityComponent;
- (double)clearPosteriorProbabilityComponent;
- (double)contactClassConditionalProbabilityComponent;
- (double)contactGlobalOccurrencesComponent;
- (double)contactGlobalPopularityComponent;
- (double)contactIsFavoriteComponent;
- (double)contactIsVIPComponent;
- (double)contactPosteriorProbabilityComponent;
- (double)dismissClassConditionalProbabilityComponent;
- (double)dismissGlobalPopularityComponent;
- (double)dismissModePopularityComponent;
- (double)dismissPosteriorProbabilityComponent;
- (double)engagementClassConditionalProbabilityComponent;
- (double)engagementGlobalPopularityComponent;
- (double)engagementModePopularityComponent;
- (double)engagementPosteriorProbabilityComponent;
- (double)hiddenClassConditionalProbabilityComponent;
- (double)hiddenGlobalPopularityComponent;
- (double)hiddenModePopularityComponent;
- (double)hiddenPosteriorProbabilityComponent;
- (id)abGroup;
- (int)numOfDays;
- (void)init;
@end

@implementation ATXNotificationModeEntityModelWeights

- (ATXNotificationModeEntityModelWeights)init
{
  v13.receiver = self;
  v13.super_class = (Class)ATXNotificationModeEntityModelWeights;
  id v2 = [(ATXNotificationModeEntityModelWeights *)&v13 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F4B180] sharedInstance];
    v4 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v3;

    v5 = [*((id *)v2 + 2) notificationModeEntityModelWeights];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      v7 = __atxlog_handle_modes();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[ATXNotificationModeEntityModelWeights init](v7);
      }

      uint64_t v8 = [*((id *)v2 + 2) notificationModeEntityModelWeights];
      v9 = (void *)*((void *)v2 + 1);
      *((void *)v2 + 1) = v8;

      v10 = __atxlog_handle_modes();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        [(ATXNotificationModeEntityModelWeights *)(uint64_t *)v2 + 1 init];
      }
    }
    else
    {
      uint64_t v11 = [MEMORY[0x1E4F4AF08] dictionaryForResource:@"ATXNotificationModeEntityModelWeights" ofType:@"plist" specifiedABGroup:0];
      v10 = *((void *)v2 + 1);
      *((void *)v2 + 1) = v11;
    }
  }
  return (ATXNotificationModeEntityModelWeights *)v2;
}

- (double)appCategoryScoreComponent
{
  id v2 = [(NSDictionary *)self->_notificationModeEntityModelWeights objectForKeyedSubscript:@"appCategoryScoreComponent"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (double)appClassConditionalProbabilityComponent
{
  id v2 = [(NSDictionary *)self->_notificationModeEntityModelWeights objectForKeyedSubscript:@"appClassConditionalProbabilityComponent"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (double)appGlobalPopularityComponent
{
  id v2 = [(NSDictionary *)self->_notificationModeEntityModelWeights objectForKeyedSubscript:@"appGlobalPopularityComponent"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (double)appModePopularityComponent
{
  id v2 = [(NSDictionary *)self->_notificationModeEntityModelWeights objectForKeyedSubscript:@"appModePopularityComponent"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (double)appPosteriorProbabilityComponent
{
  id v2 = [(NSDictionary *)self->_notificationModeEntityModelWeights objectForKeyedSubscript:@"appPosteriorProbabilityComponent"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (double)appGlobalOccurrencesComponent
{
  id v2 = [(NSDictionary *)self->_notificationModeEntityModelWeights objectForKeyedSubscript:@"appGlobalOccurrencesComponent"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (double)contactClassConditionalProbabilityComponent
{
  id v2 = [(NSDictionary *)self->_notificationModeEntityModelWeights objectForKeyedSubscript:@"contactClassConditionalProbabilityComponent"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (double)contactGlobalPopularityComponent
{
  id v2 = [(NSDictionary *)self->_notificationModeEntityModelWeights objectForKeyedSubscript:@"contactGlobalPopularityComponent"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (double)contactPosteriorProbabilityComponent
{
  id v2 = [(NSDictionary *)self->_notificationModeEntityModelWeights objectForKeyedSubscript:@"contactPosteriorProbabilityComponent"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (double)contactGlobalOccurrencesComponent
{
  id v2 = [(NSDictionary *)self->_notificationModeEntityModelWeights objectForKeyedSubscript:@"contactGlobalOccurrencesComponent"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (double)contactIsFavoriteComponent
{
  id v2 = [(NSDictionary *)self->_notificationModeEntityModelWeights objectForKeyedSubscript:@"contactIsFavoriteComponent"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (double)contactIsVIPComponent
{
  id v2 = [(NSDictionary *)self->_notificationModeEntityModelWeights objectForKeyedSubscript:@"contactIsVIPComponent"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (double)engagementGlobalPopularityComponent
{
  id v2 = [(NSDictionary *)self->_notificationModeEntityModelWeights objectForKeyedSubscript:@"engagementGlobalPopularityComponent"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (double)engagementModePopularityComponent
{
  id v2 = [(NSDictionary *)self->_notificationModeEntityModelWeights objectForKeyedSubscript:@"engagementModePopularityComponent"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (double)engagementClassConditionalProbabilityComponent
{
  id v2 = [(NSDictionary *)self->_notificationModeEntityModelWeights objectForKeyedSubscript:@"engagementClassConditionalProbabilityComponent"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (double)engagementPosteriorProbabilityComponent
{
  id v2 = [(NSDictionary *)self->_notificationModeEntityModelWeights objectForKeyedSubscript:@"engagementPosteriorProbabilityComponent"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (double)clearGlobalPopularityComponent
{
  id v2 = [(NSDictionary *)self->_notificationModeEntityModelWeights objectForKeyedSubscript:@"clearGlobalPopularityComponent"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (double)clearModePopularityComponent
{
  id v2 = [(NSDictionary *)self->_notificationModeEntityModelWeights objectForKeyedSubscript:@"clearModePopularityComponent"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (double)clearClassConditionalProbabilityComponent
{
  id v2 = [(NSDictionary *)self->_notificationModeEntityModelWeights objectForKeyedSubscript:@"clearClassConditionalProbabilityComponent"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (double)clearPosteriorProbabilityComponent
{
  id v2 = [(NSDictionary *)self->_notificationModeEntityModelWeights objectForKeyedSubscript:@"clearPosteriorProbabilityComponent"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (double)hiddenGlobalPopularityComponent
{
  id v2 = [(NSDictionary *)self->_notificationModeEntityModelWeights objectForKeyedSubscript:@"hiddenGlobalPopularityComponent"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (double)hiddenModePopularityComponent
{
  id v2 = [(NSDictionary *)self->_notificationModeEntityModelWeights objectForKeyedSubscript:@"hiddenModePopularityComponent"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (double)hiddenClassConditionalProbabilityComponent
{
  id v2 = [(NSDictionary *)self->_notificationModeEntityModelWeights objectForKeyedSubscript:@"hiddenClassConditionalProbabilityComponent"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (double)hiddenPosteriorProbabilityComponent
{
  id v2 = [(NSDictionary *)self->_notificationModeEntityModelWeights objectForKeyedSubscript:@"hiddenPosteriorProbabilityComponent"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (double)dismissGlobalPopularityComponent
{
  id v2 = [(NSDictionary *)self->_notificationModeEntityModelWeights objectForKeyedSubscript:@"dismissGlobalPopularityComponent"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (double)dismissModePopularityComponent
{
  id v2 = [(NSDictionary *)self->_notificationModeEntityModelWeights objectForKeyedSubscript:@"dismissModePopularityComponent"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (double)dismissClassConditionalProbabilityComponent
{
  id v2 = [(NSDictionary *)self->_notificationModeEntityModelWeights objectForKeyedSubscript:@"dismissClassConditionalProbabilityComponent"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (double)dismissPosteriorProbabilityComponent
{
  id v2 = [(NSDictionary *)self->_notificationModeEntityModelWeights objectForKeyedSubscript:@"dismissPosteriorProbabilityComponent"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (int)numOfDays
{
  id v2 = [(NSDictionary *)self->_notificationModeEntityModelWeights objectForKeyedSubscript:@"numOfDays"];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (double)bias
{
  id v2 = [(NSDictionary *)self->_notificationModeEntityModelWeights objectForKeyedSubscript:@"bias"];
  uint64_t v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (id)abGroup
{
  id v2 = [(NSDictionary *)self->_notificationModeEntityModelWeights objectForKeyedSubscript:@"abGroup"];
  uint64_t v3 = [v2 stringValue];
  double v4 = v3;
  if (!v3) {
    uint64_t v3 = @"default";
  }
  double v5 = v3;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeEntityTrialClientWrapper, 0);
  objc_storeStrong((id *)&self->_notificationModeEntityModelWeights, 0);
}

- (void)init
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_DEBUG, "ATXNotificationModeEntityModelWeights: Trial factors loaded", v1, 2u);
}

@end