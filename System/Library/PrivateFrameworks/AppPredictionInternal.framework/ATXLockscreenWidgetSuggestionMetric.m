@interface ATXLockscreenWidgetSuggestionMetric
- (BOOL)outcome;
- (NSString)extensionBundleId;
- (NSString)kind;
- (NSString)sessionId;
- (id)coreAnalyticsDictionary;
- (id)metricName;
- (int64_t)numEngaged;
- (unint64_t)family;
- (unint64_t)reason;
- (void)setExtensionBundleId:(id)a3;
- (void)setFamily:(unint64_t)a3;
- (void)setKind:(id)a3;
- (void)setNumEngaged:(int64_t)a3;
- (void)setOutcome:(BOOL)a3;
- (void)setReason:(unint64_t)a3;
- (void)setSessionId:(id)a3;
@end

@implementation ATXLockscreenWidgetSuggestionMetric

- (id)metricName
{
  return @"com.apple.Proactive.Lockscreen.WidgetSuggestion";
}

- (id)coreAnalyticsDictionary
{
  v17[7] = *MEMORY[0x1E4F143B8];
  v16[0] = @"extensionBundleId";
  uint64_t v3 = [(ATXLockscreenWidgetSuggestionMetric *)self extensionBundleId];
  v4 = (void *)v3;
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[0] = v3;
  v16[1] = @"family";
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXLockscreenWidgetSuggestionMetric family](self, "family", v3));
  v17[1] = v5;
  v16[2] = @"kind";
  v6 = [(ATXLockscreenWidgetSuggestionMetric *)self kind];
  v7 = v6;
  if (!v6)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[2] = v7;
  v16[3] = @"reason";
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXLockscreenWidgetSuggestionMetric reason](self, "reason"));
  v17[3] = v8;
  v16[4] = @"outcome";
  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXLockscreenWidgetSuggestionMetric outcome](self, "outcome"));
  v17[4] = v9;
  v16[5] = @"sessionId";
  v10 = [(ATXLockscreenWidgetSuggestionMetric *)self sessionId];
  v11 = v10;
  if (!v10)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[5] = v11;
  v16[6] = @"numEngaged";
  v12 = objc_msgSend(NSNumber, "numberWithInteger:", -[ATXLockscreenWidgetSuggestionMetric numEngaged](self, "numEngaged"));
  v17[6] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:7];

  if (!v10) {
  if (!v6)
  }

  if (!v4) {
  return v13;
  }
}

- (NSString)extensionBundleId
{
  return self->_extensionBundleId;
}

- (void)setExtensionBundleId:(id)a3
{
}

- (unint64_t)family
{
  return self->_family;
}

- (void)setFamily:(unint64_t)a3
{
  self->_family = a3;
}

- (NSString)kind
{
  return self->_kind;
}

- (void)setKind:(id)a3
{
}

- (unint64_t)reason
{
  return self->_reason;
}

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
}

- (BOOL)outcome
{
  return self->_outcome;
}

- (void)setOutcome:(BOOL)a3
{
  self->_outcome = a3;
}

- (int64_t)numEngaged
{
  return self->_numEngaged;
}

- (void)setNumEngaged:(int64_t)a3
{
  self->_numEngaged = a3;
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_extensionBundleId, 0);
}

@end