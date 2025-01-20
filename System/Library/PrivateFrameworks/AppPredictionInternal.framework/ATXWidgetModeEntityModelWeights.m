@interface ATXWidgetModeEntityModelWeights
- (ATXWidgetModeEntityModelWeights)init;
- (double)classConditionalProbability;
- (double)globalPopularity;
- (double)modePopularity;
- (double)posteriorProbability;
- (double)weightForWidgetProbability;
- (id)abGroup;
- (int)numOfDays;
- (void)init;
@end

@implementation ATXWidgetModeEntityModelWeights

- (ATXWidgetModeEntityModelWeights)init
{
  v13.receiver = self;
  v13.super_class = (Class)ATXWidgetModeEntityModelWeights;
  id v2 = [(ATXWidgetModeEntityModelWeights *)&v13 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F4B180] sharedInstance];
    v4 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v3;

    v5 = [*((id *)v2 + 2) widgetModeEntityModelWeights];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      v7 = __atxlog_handle_modes();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[ATXWidgetModeEntityModelWeights init](v7);
      }

      uint64_t v8 = [*((id *)v2 + 2) widgetModeEntityModelWeights];
      v9 = (void *)*((void *)v2 + 1);
      *((void *)v2 + 1) = v8;

      v10 = __atxlog_handle_modes();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        [(ATXWidgetModeEntityModelWeights *)(uint64_t *)v2 + 1 init];
      }
    }
    else
    {
      uint64_t v11 = [MEMORY[0x1E4F4AF08] dictionaryForResource:@"ATXWidgetModeEntityModelWeights" ofType:@"plist" specifiedABGroup:0];
      v10 = *((void *)v2 + 1);
      *((void *)v2 + 1) = v11;
    }
  }
  return (ATXWidgetModeEntityModelWeights *)v2;
}

- (double)classConditionalProbability
{
  id v2 = [(NSDictionary *)self->_widgetModeEntityModelWeights objectForKeyedSubscript:@"classConditionalProbability"];
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

- (double)posteriorProbability
{
  id v2 = [(NSDictionary *)self->_widgetModeEntityModelWeights objectForKeyedSubscript:@"posteriorProbability"];
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

- (double)globalPopularity
{
  id v2 = [(NSDictionary *)self->_widgetModeEntityModelWeights objectForKeyedSubscript:@"globalPopularity"];
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

- (double)modePopularity
{
  id v2 = [(NSDictionary *)self->_widgetModeEntityModelWeights objectForKeyedSubscript:@"modePopularity"];
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

- (double)weightForWidgetProbability
{
  id v2 = [(NSDictionary *)self->_widgetModeEntityModelWeights objectForKeyedSubscript:@"weightForWidgetProbability"];
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
  id v2 = [(NSDictionary *)self->_widgetModeEntityModelWeights objectForKeyedSubscript:@"numOfDays"];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (id)abGroup
{
  id v2 = [(NSDictionary *)self->_widgetModeEntityModelWeights objectForKeyedSubscript:@"abGroup"];
  uint64_t v3 = [v2 stringValue];
  int v4 = v3;
  if (!v3) {
    uint64_t v3 = @"default";
  }
  double v5 = v3;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeEntityTrialClientWrapper, 0);
  objc_storeStrong((id *)&self->_widgetModeEntityModelWeights, 0);
}

- (void)init
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_DEBUG, "ATXWidgetModeEntityModelWeights: Trial factors loaded", v1, 2u);
}

@end