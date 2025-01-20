@interface ATXUserEducationSuggestionFeedbackMetricCustomizeFocus
- (id)coreAnalyticsDictionary;
- (id)metricName;
@end

@implementation ATXUserEducationSuggestionFeedbackMetricCustomizeFocus

- (id)metricName
{
  return @"com.apple.ATXUserEducationSuggestionFeedbackMetricCustomizeFocus";
}

- (id)coreAnalyticsDictionary
{
  v10.receiver = self;
  v10.super_class = (Class)ATXUserEducationSuggestionFeedbackMetricCustomizeFocus;
  v3 = [(ATXUserEducationSuggestionFeedbackMetric *)&v10 coreAnalyticsDictionary];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(ATXUserEducationSuggestionFeedbackMetric *)self feedback];
  v6 = [v5 suggestion];

  [v6 modeSemanticType];
  v7 = DNDModeSemanticTypeToString();
  if (v7)
  {
    [v4 setObject:v7 forKey:@"modeSemanticType"];
  }
  else
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
    [v4 setObject:v8 forKey:@"modeSemanticType"];
  }
  return v4;
}

@end