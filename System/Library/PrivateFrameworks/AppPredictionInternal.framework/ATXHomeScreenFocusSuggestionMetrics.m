@interface ATXHomeScreenFocusSuggestionMetrics
- (NSString)modeSemanticType;
- (id)coreAnalyticsDictionary;
- (id)description;
- (id)metricName;
- (id)outcomeToString:(int64_t)a3;
- (int64_t)outcome;
- (unint64_t)cappedForPrivacyWithValue:(int64_t)a3;
- (void)setModeSemanticType:(id)a3;
- (void)setOutcome:(int64_t)a3;
@end

@implementation ATXHomeScreenFocusSuggestionMetrics

- (id)metricName
{
  return @"com.apple.ModeConfiguration.HomeScreenSuggestion";
}

- (id)coreAnalyticsDictionary
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"modeSemanticType";
  v3 = [(ATXHomeScreenFocusSuggestionMetrics *)self modeSemanticType];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"outcome";
  v10[0] = v4;
  v5 = [(ATXHomeScreenFocusSuggestionMetrics *)self outcomeToString:[(ATXHomeScreenFocusSuggestionMetrics *)self outcome]];
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
  return v7;
  }
}

- (id)description
{
  v3 = NSString;
  v4 = [(ATXHomeScreenFocusSuggestionMetrics *)self modeSemanticType];
  v5 = [(ATXHomeScreenFocusSuggestionMetrics *)self outcomeToString:[(ATXHomeScreenFocusSuggestionMetrics *)self outcome]];
  v6 = [v3 stringWithFormat:@"ATXHomeScreenFocusSuggestionMetrics modeSemanticType:%@\noutcome:%@\n", v4, v5];

  return v6;
}

- (id)outcomeToString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return @"AbandonedAfter24h";
  }
  else {
    return off_1E68AC000[a3 - 1];
  }
}

- (unint64_t)cappedForPrivacyWithValue:(int64_t)a3
{
  if ((unint64_t)a3 >= 0x14) {
    return 20;
  }
  else {
    return a3;
  }
}

- (NSString)modeSemanticType
{
  return self->_modeSemanticType;
}

- (void)setModeSemanticType:(id)a3
{
}

- (int64_t)outcome
{
  return self->_outcome;
}

- (void)setOutcome:(int64_t)a3
{
  self->_outcome = a3;
}

- (void).cxx_destruct
{
}

@end