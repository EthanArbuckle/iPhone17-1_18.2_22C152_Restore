@interface ATXDigestOnboardingSuggestionMetrics
- (NSString)outcome;
- (NSString)sessionUUID;
- (double)timeToResolution;
- (id)coreAnalyticsDictionary;
- (id)metricName;
- (void)setOutcome:(id)a3;
- (void)setSessionUUID:(id)a3;
- (void)setTimeToResolution:(double)a3;
@end

@implementation ATXDigestOnboardingSuggestionMetrics

- (id)metricName
{
  return @"com.apple.digestOnboarding.digestOnboardingSuggestion.event";
}

- (id)coreAnalyticsDictionary
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v11[0] = @"sessionUUID";
  v3 = [(ATXDigestOnboardingSuggestionMetrics *)self sessionUUID];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v4;
  v11[1] = @"suggestionOutcome";
  v5 = [(ATXDigestOnboardingSuggestionMetrics *)self outcome];
  v6 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v6;
  v11[2] = @"timeToResolution";
  v7 = NSNumber;
  [(ATXDigestOnboardingSuggestionMetrics *)self timeToResolution];
  v8 = objc_msgSend(v7, "numberWithDouble:");
  v12[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];

  if (!v5) {
  if (!v3)
  }

  return v9;
}

- (NSString)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
}

- (NSString)outcome
{
  return self->_outcome;
}

- (void)setOutcome:(id)a3
{
}

- (double)timeToResolution
{
  return self->_timeToResolution;
}

- (void)setTimeToResolution:(double)a3
{
  self->_timeToResolution = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outcome, 0);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
}

@end