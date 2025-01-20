@interface IMSpotlightEventNotifier
+ (id)sharedNotifier;
- (id)_displayStringForReason:(int64_t)a3;
- (id)_formatDate:(id)a3;
- (void)_presentNotificationWithMessage:(id)a3 newState:(id)a4 verbose:(BOOL)a5;
- (void)deferredReindexScheduled;
- (void)reindexCompletedWithState:(id)a3 reason:(int64_t)a4;
- (void)reindexInitiatedWithTotalMessages:(int64_t)a3 reason:(int64_t)a4;
- (void)reindexPausedWithState:(id)a3 reason:(int64_t)a4;
- (void)reindexResumedWithState:(id)a3 reason:(int64_t)a4;
- (void)reindexSuspendedUntilDate:(id)a3 withError:(id)a4;
@end

@implementation IMSpotlightEventNotifier

+ (id)sharedNotifier
{
  if (qword_1EB5ABB80 != -1) {
    dispatch_once(&qword_1EB5ABB80, &unk_1F084CFE0);
  }
  if (qword_1EB5ABB78 && [MEMORY[0x1E4F6E700] notifyForSpotlightEvents]) {
    id v2 = (id)qword_1EB5ABB78;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (id)_displayStringForReason:(int64_t)a3
{
  v3 = NSStringFromIMCoreSpotlightIndexReason();
  if ([v3 hasPrefix:@"IMCoreSpotlightIndexReason"])
  {
    uint64_t v4 = [v3 substringFromIndex:objc_msgSend(@"IMCoreSpotlightIndexReason", "length")];

    v3 = (void *)v4;
  }
  return v3;
}

- (void)_presentNotificationWithMessage:(id)a3 newState:(id)a4 verbose:(BOOL)a5
{
  BOOL v5 = a5;
  id v12 = a3;
  id v7 = a4;
  if (!v5 || [MEMORY[0x1E4F6E700] notifyForVerboseSpotlightEvents])
  {
    id v8 = objc_alloc(MEMORY[0x1E4F6E738]);
    v9 = [NSString stringWithFormat:@"Messages Indexing %@", v7];
    v10 = (void *)[v8 initWithTitle:v9 body:v12];

    objc_msgSend(v10, "setTimeSensitive:", objc_msgSend(MEMORY[0x1E4F6E700], "spotlightEventsAreTimeSensitive"));
    id v11 = objc_alloc_init(MEMORY[0x1E4F6E740]);
    [v11 postNotification:v10];
  }
}

- (void)deferredReindexScheduled
{
  v3 = NSString;
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v4 = [v3 stringWithFormat:@"Full reindex requested by Spotlight at %@, scheduled to run later.", v5];
  [(IMSpotlightEventNotifier *)self _presentNotificationWithMessage:v4 newState:@"Scheduled" verbose:0];
}

- (id)_formatDate:(id)a3
{
  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x1E4F28C10];
    id v4 = a3;
    id v5 = objc_alloc_init(v3);
    [v5 setDateStyle:1];
    [v5 setTimeStyle:2];
    v6 = [v5 stringFromDate:v4];
  }
  else
  {
    v6 = @"(nil)";
  }
  return v6;
}

- (void)reindexCompletedWithState:(id)a3 reason:(int64_t)a4
{
  v6 = NSString;
  id v7 = a3;
  id v13 = [v7 indexBeginDate];
  id v8 = [(IMSpotlightEventNotifier *)self _formatDate:v13];
  v9 = [(IMSpotlightEventNotifier *)self _displayStringForReason:a4];
  uint64_t v10 = [v7 initialIndexedMessages];
  uint64_t v11 = [v7 initialTotalMessages];

  id v12 = [v6 stringWithFormat:@"Indexing initially began %@ due to %@. Indexed %lld/%lld messages.", v8, v9, v10, v11];
  [(IMSpotlightEventNotifier *)self _presentNotificationWithMessage:v12 newState:@"Finished" verbose:0];
}

- (void)reindexInitiatedWithTotalMessages:(int64_t)a3 reason:(int64_t)a4
{
  v6 = NSString;
  id v8 = [(IMSpotlightEventNotifier *)self _displayStringForReason:a4];
  id v7 = [v6 stringWithFormat:@"Initiating reindex of %lld messages due to %@.", a3, v8];
  [(IMSpotlightEventNotifier *)self _presentNotificationWithMessage:v7 newState:@"Initiated" verbose:0];
}

- (void)reindexResumedWithState:(id)a3 reason:(int64_t)a4
{
  v6 = NSString;
  id v7 = a3;
  id v13 = [v7 indexBeginDate];
  id v8 = [(IMSpotlightEventNotifier *)self _formatDate:v13];
  v9 = [(IMSpotlightEventNotifier *)self _displayStringForReason:a4];
  uint64_t v10 = [v7 initialIndexedMessages];
  uint64_t v11 = [v7 initialTotalMessages];

  id v12 = [v6 stringWithFormat:@"Resuming indexing, which initially began %@ due to %@. Indexed %lld/%lld messages.", v8, v9, v10, v11];
  [(IMSpotlightEventNotifier *)self _presentNotificationWithMessage:v12 newState:@"Resumed" verbose:1];
}

- (void)reindexPausedWithState:(id)a3 reason:(int64_t)a4
{
  v6 = NSString;
  id v7 = a3;
  id v13 = [v7 indexBeginDate];
  id v8 = [(IMSpotlightEventNotifier *)self _formatDate:v13];
  v9 = [(IMSpotlightEventNotifier *)self _displayStringForReason:a4];
  uint64_t v10 = [v7 initialIndexedMessages];
  uint64_t v11 = [v7 initialTotalMessages];

  id v12 = [v6 stringWithFormat:@"Reindexing paused, which initially began %@ due to %@. Indexed %lld/%lld messages.", v8, v9, v10, v11];
  [(IMSpotlightEventNotifier *)self _presentNotificationWithMessage:v12 newState:@"Paused" verbose:1];
}

- (void)reindexSuspendedUntilDate:(id)a3 withError:(id)a4
{
  id v5 = [NSString stringWithFormat:@"Reindexing suspended until %@ due to an error.\n\n%@", a3, a4];
  [(IMSpotlightEventNotifier *)self _presentNotificationWithMessage:v5 newState:@"Suspended" verbose:1];
}

@end