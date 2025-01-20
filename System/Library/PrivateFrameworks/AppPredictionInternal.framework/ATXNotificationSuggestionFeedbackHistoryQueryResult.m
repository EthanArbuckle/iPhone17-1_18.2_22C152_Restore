@interface ATXNotificationSuggestionFeedbackHistoryQueryResult
- (ATXNotificationSuggestionFeedbackHistoryQueryResult)initWithFeedbackKey:(id)a3 latestOutcome:(int64_t)a4 createdTimestamp:(id)a5;
- (NSDate)createdTimestamp;
- (NSString)feedbackKey;
- (int64_t)latestOutcome;
- (void)setCreatedTimestamp:(id)a3;
- (void)setFeedbackKey:(id)a3;
- (void)setLatestOutcome:(int64_t)a3;
@end

@implementation ATXNotificationSuggestionFeedbackHistoryQueryResult

- (ATXNotificationSuggestionFeedbackHistoryQueryResult)initWithFeedbackKey:(id)a3 latestOutcome:(int64_t)a4 createdTimestamp:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ATXNotificationSuggestionFeedbackHistoryQueryResult;
  v11 = [(ATXNotificationSuggestionFeedbackHistoryQueryResult *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_feedbackKey, a3);
    v12->_latestOutcome = a4;
    objc_storeStrong((id *)&v12->_createdTimestamp, a5);
  }

  return v12;
}

- (NSString)feedbackKey
{
  return self->_feedbackKey;
}

- (void)setFeedbackKey:(id)a3
{
}

- (int64_t)latestOutcome
{
  return self->_latestOutcome;
}

- (void)setLatestOutcome:(int64_t)a3
{
  self->_latestOutcome = a3;
}

- (NSDate)createdTimestamp
{
  return self->_createdTimestamp;
}

- (void)setCreatedTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_createdTimestamp, 0);
  objc_storeStrong((id *)&self->_feedbackKey, 0);
}

@end