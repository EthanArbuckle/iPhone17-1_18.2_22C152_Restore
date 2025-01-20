@interface ATXLockscreenPosterSuggestionMetric
- (BOOL)engaged;
- (BOOL)outcome;
- (NSString)extensionBundleId;
- (NSString)sessionId;
- (id)coreAnalyticsDictionary;
- (id)metricName;
- (unint64_t)section;
- (void)setEngaged:(BOOL)a3;
- (void)setExtensionBundleId:(id)a3;
- (void)setOutcome:(BOOL)a3;
- (void)setSection:(unint64_t)a3;
- (void)setSessionId:(id)a3;
@end

@implementation ATXLockscreenPosterSuggestionMetric

- (id)metricName
{
  return @"com.apple.Proactive.Lockscreen.PosterSuggestion";
}

- (id)coreAnalyticsDictionary
{
  v13[5] = *MEMORY[0x1E4F143B8];
  v12[0] = @"extensionBundleId";
  v3 = [(ATXLockscreenPosterSuggestionMetric *)self extensionBundleId];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[0] = v4;
  v12[1] = @"section";
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXLockscreenPosterSuggestionMetric section](self, "section"));
  v13[1] = v5;
  v12[2] = @"outcome";
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXLockscreenPosterSuggestionMetric outcome](self, "outcome"));
  v13[2] = v6;
  v12[3] = @"sessionId";
  v7 = [(ATXLockscreenPosterSuggestionMetric *)self sessionId];
  v8 = v7;
  if (!v7)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[3] = v8;
  v12[4] = @"engaged";
  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXLockscreenPosterSuggestionMetric engaged](self, "engaged"));
  v13[4] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:5];

  if (!v7) {
  if (!v3)
  }

  return v10;
}

- (NSString)extensionBundleId
{
  return self->_extensionBundleId;
}

- (void)setExtensionBundleId:(id)a3
{
}

- (unint64_t)section
{
  return self->_section;
}

- (void)setSection:(unint64_t)a3
{
  self->_section = a3;
}

- (BOOL)outcome
{
  return self->_outcome;
}

- (void)setOutcome:(BOOL)a3
{
  self->_outcome = a3;
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
}

- (BOOL)engaged
{
  return self->_engaged;
}

- (void)setEngaged:(BOOL)a3
{
  self->_engaged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_extensionBundleId, 0);
}

@end