@interface ATXNotificationAdjacentSuggestionMetric
- (BOOL)isAddToMode;
- (NSString)bundleId;
- (NSString)suggestionOutcome;
- (NSString)suggestionScope;
- (NSString)suggestionType;
- (NSString)targetMode;
- (double)suggestionCompletionTimestamp;
- (double)timeToOutcome;
- (id)coreAnalyticsDictionary;
- (id)metricName;
- (void)setBundleId:(id)a3;
- (void)setIsAddToMode:(BOOL)a3;
- (void)setSuggestionCompletionTimestamp:(double)a3;
- (void)setSuggestionOutcome:(id)a3;
- (void)setSuggestionScope:(id)a3;
- (void)setSuggestionType:(id)a3;
- (void)setTargetMode:(id)a3;
- (void)setTimeToOutcome:(double)a3;
@end

@implementation ATXNotificationAdjacentSuggestionMetric

- (id)metricName
{
  return @"com.apple.NotificationAdjacentSuggestions.Suggestion";
}

- (id)coreAnalyticsDictionary
{
  v25[8] = *MEMORY[0x1E4F143B8];
  v24[0] = @"bundleId";
  uint64_t v3 = [(ATXNotificationAdjacentSuggestionMetric *)self bundleId];
  v4 = (void *)v3;
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v19 = (void *)v3;
  v25[0] = v3;
  v24[1] = @"isAddToMode";
  v23 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXNotificationAdjacentSuggestionMetric isAddToMode](self, "isAddToMode"));
  v25[1] = v23;
  v24[2] = @"secureBundleId";
  v22 = [(ATXNotificationAdjacentSuggestionMetric *)self bundleId];
  if (v22)
  {
    v21 = [(ATXNotificationAdjacentSuggestionMetric *)self bundleId];
    uint64_t v5 = +[ATXCoreAnalyticsFieldUtilities hashBoundString:](ATXCoreAnalyticsFieldUtilities, "hashBoundString:");
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
    v21 = (void *)v5;
  }
  v20 = (void *)v5;
  v25[2] = v5;
  v24[3] = @"suggestionOutcome";
  uint64_t v6 = [(ATXNotificationAdjacentSuggestionMetric *)self suggestionOutcome];
  v7 = (void *)v6;
  if (!v6)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[3] = v6;
  v24[4] = @"suggestionScope";
  v8 = [(ATXNotificationAdjacentSuggestionMetric *)self suggestionScope];
  v9 = v8;
  if (!v8)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[4] = v9;
  v24[5] = @"suggestionType";
  v10 = [(ATXNotificationAdjacentSuggestionMetric *)self suggestionType];
  v11 = v10;
  if (!v10)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[5] = v11;
  v24[6] = @"targetMode";
  v12 = [(ATXNotificationAdjacentSuggestionMetric *)self targetMode];
  v13 = v12;
  if (!v12)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[6] = v13;
  v24[7] = @"timeToOutcome";
  v14 = NSNumber;
  [(ATXNotificationAdjacentSuggestionMetric *)self timeToOutcome];
  v15 = objc_msgSend(v14, "numberWithDouble:");
  v25[7] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:8];

  if (!v12) {
  if (!v10)
  }

  if (!v8) {
  if (!v7)
  }

  if (v22) {
  if (!v4)
  }

  return v16;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (BOOL)isAddToMode
{
  return self->_isAddToMode;
}

- (void)setIsAddToMode:(BOOL)a3
{
  self->_isAddToMode = a3;
}

- (NSString)suggestionOutcome
{
  return self->_suggestionOutcome;
}

- (void)setSuggestionOutcome:(id)a3
{
}

- (NSString)suggestionScope
{
  return self->_suggestionScope;
}

- (void)setSuggestionScope:(id)a3
{
}

- (NSString)suggestionType
{
  return self->_suggestionType;
}

- (void)setSuggestionType:(id)a3
{
}

- (NSString)targetMode
{
  return self->_targetMode;
}

- (void)setTargetMode:(id)a3
{
}

- (double)timeToOutcome
{
  return self->_timeToOutcome;
}

- (void)setTimeToOutcome:(double)a3
{
  self->_timeToOutcome = a3;
}

- (double)suggestionCompletionTimestamp
{
  return self->_suggestionCompletionTimestamp;
}

- (void)setSuggestionCompletionTimestamp:(double)a3
{
  self->_suggestionCompletionTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetMode, 0);
  objc_storeStrong((id *)&self->_suggestionType, 0);
  objc_storeStrong((id *)&self->_suggestionScope, 0);
  objc_storeStrong((id *)&self->_suggestionOutcome, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end