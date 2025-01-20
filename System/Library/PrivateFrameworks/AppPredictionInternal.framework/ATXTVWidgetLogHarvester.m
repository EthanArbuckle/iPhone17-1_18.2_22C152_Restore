@interface ATXTVWidgetLogHarvester
+ (id)_stringForWidgetSuggestionEventType:(int64_t)a3;
- (ATXTVWidgetLogHarvester)init;
- (id)dryRunResult;
- (id)shouldSuggestTVWidgetWithDefaults:(id)a3;
- (void)generateTVWidgetMetrics;
- (void)sendToCoreAnalytics;
@end

@implementation ATXTVWidgetLogHarvester

- (ATXTVWidgetLogHarvester)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXTVWidgetLogHarvester;
  v2 = [(ATXTVWidgetLogHarvester *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    tvWidgetMetrics = v2->_tvWidgetMetrics;
    v2->_tvWidgetMetrics = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)generateTVWidgetMetrics
{
  if (![MEMORY[0x1E4F93B08] isiPad]) {
    return;
  }
  id v3 = objc_alloc(MEMORY[0x1E4F1CB18]);
  id v23 = (id)[v3 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  v4 = [v23 objectForKey:*MEMORY[0x1E4F4B700]];
  v5 = [(ATXTVWidgetLogHarvester *)self shouldSuggestTVWidgetWithDefaults:v23];
  objc_super v6 = v5;
  if (!v5)
  {
    v7 = @"eligibilityUnknown";
    goto LABEL_7;
  }
  if (([v5 BOOLValue] & 1) == 0)
  {
    v7 = @"ineligible";
LABEL_7:
    [(NSMutableDictionary *)self->_tvWidgetMetrics setObject:v7 forKeyedSubscript:@"suggestionStatus"];
  }
  if ([v6 BOOLValue]) {
    BOOL v8 = v4 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    [(NSMutableDictionary *)self->_tvWidgetMetrics setObject:@"eligibleButNotSuggested" forKeyedSubscript:@"suggestionStatus"];
    uint64_t v9 = [v23 integerForKey:*MEMORY[0x1E4F4B5F0]];
    if (v9 <= 0)
    {
      v12 = objc_opt_new();
    }
    else
    {
      uint64_t v10 = v9;
      v11 = [(id)objc_opt_class() _stringForWidgetSuggestionEventType:v9];
      [(NSMutableDictionary *)self->_tvWidgetMetrics setObject:v11 forKeyedSubscript:@"suggestionStatus"];

      v12 = objc_opt_new();
      if (v10 == 1)
      {
        v13 = (void *)MEMORY[0x1E4F1C9C8];
        v14 = [v23 objectForKey:*MEMORY[0x1E4F4B5E0]];
        v15 = objc_msgSend(v13, "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v14, "integerValue"));

        v16 = NSNumber;
        [v12 convertDate:v15 toDeltaFromSkyUpdateDate:v4];
        v17 = objc_msgSend(v16, "numberWithDouble:");
        [(NSMutableDictionary *)self->_tvWidgetMetrics setObject:v17 forKeyedSubscript:@"acceptedDate"];
      }
    }
    v18 = [v23 objectForKey:*MEMORY[0x1E4F4B5E8]];
    v19 = v18;
    if (v18)
    {
      v20 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v18, "integerValue"));
      v21 = NSNumber;
      [v12 convertDate:v20 toDeltaFromSkyUpdateDate:v4];
      v22 = objc_msgSend(v21, "numberWithDouble:");
      [(NSMutableDictionary *)self->_tvWidgetMetrics setObject:v22 forKeyedSubscript:@"removedDate"];
    }
  }
}

- (id)shouldSuggestTVWidgetWithDefaults:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKey:*MEMORY[0x1E4F4B5A8]];
  v5 = [v3 objectForKey:*MEMORY[0x1E4F4B5B8]];
  uint64_t v6 = [v3 objectForKey:*MEMORY[0x1E4F4B5C0]];
  v7 = (void *)v6;
  if (v4) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8 || v5 == 0)
  {
    uint64_t v10 = [v3 objectForKey:*MEMORY[0x1E4F4B5B0]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v18 = v10;
    }
    else {
      id v18 = 0;
    }
  }
  else
  {
    v11 = NSNumber;
    v12 = (void *)MEMORY[0x1E4F4AFB0];
    [v4 doubleValue];
    double v14 = v13;
    [v5 doubleValue];
    double v16 = v15;
    [v7 doubleValue];
    objc_msgSend(v11, "numberWithBool:", objc_msgSend(v12, "shouldSuggestTVWithAppLaunchCount:intentDonationCount:upcomingMediaCount:", v14, v16, v17));
    id v18 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

- (void)sendToCoreAnalytics
{
}

- (id)dryRunResult
{
  return self->_tvWidgetMetrics;
}

+ (id)_stringForWidgetSuggestionEventType:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return &stru_1F2740B58;
  }
  else {
    return off_1E68B44D8[a3];
  }
}

- (void).cxx_destruct
{
}

@end