@interface ATXNotificationAndSuggestionDatastore
- (ATXNotificationAndSuggestionDatastore)init;
- (ATXNotificationAndSuggestionDatastore)initWithNotificationAndSuggestionDatabase:(id)a3;
- (ATXNotificationAndSuggestionDatastore)initWithNotificationAndSuggestionDatabase:(id)a3 bookmark:(id)a4;
- (ATXNotificationAndSuggestionDatastore)initWithNotificationAndSuggestionDatabase:(id)a3 bookmark:(id)a4 notificationEventPublisher:(id)a5 suggestionPublisher:(id)a6 suggestionInteractionEventPublisher:(id)a7;
- (ATXNotificationAndSuggestionDatastore)initWithNotificationAndSuggestionDatabase:(id)a3 createBookmark:(id)a4 updateBookmark:(id)a5 notificationEventPublisher:(id)a6 suggestionPublisher:(id)a7 suggestionInteractionEventPublisher:(id)a8 notificationGroupEventPublisher:(id)a9 notificationDeliveryEventPublisher:(id)a10;
- (BOOL)hasSuggestionBeenShownForEntityId:(id)a3 suggestionType:(int64_t)a4 scope:(int64_t)a5 sinceTimestamp:(double)a6;
- (BOOL)hasUrgencyTuningSuggestionBeenShownForBundleId:(id)a3 sinceTimestamp:(double)a4;
- (double)receiveTimeStampOfFirstNotification;
- (id)_fetchBookmarkFromDbWithName:(id)a3 version:(unint64_t)a4;
- (id)_notificationDeliveryEventPublisher;
- (id)_notificationEventPublisher;
- (id)_notificationGroupEventPublisher;
- (id)_serializeBookmark:(id)a3 withVersion:(unint64_t)a4;
- (id)_suggestionInteractionEventPublisher;
- (id)_suggestionPublisher;
- (id)_timeBasedMergePublisher:(id)a3 withOtherPublishers:(id)a4;
- (id)allBundleIdsOfNotificationsOnLockscreen;
- (id)allNotificationsBetweenStartTimestamp:(id)a3 endTimestamp:(id)a4 limit:(unint64_t)a5;
- (id)allNotificationsFromBundleId:(id)a3 sinceTimestamp:(double)a4;
- (id)appSortedByNumOfNotificationsSinceTimestamp:(double)a3;
- (id)currentActiveSuggestions;
- (id)deleteAllData;
- (id)engagementStatusOfActiveAndProminentAndMessageNotificationsSinceTimestamp:(double)a3;
- (id)engagementStatusOfActiveAndProminentNotificationsSinceTimestamp:(double)a3;
- (id)engagementStatusOfActiveAndProminentNotificationsWithUrgency:(int64_t)a3 sinceTimestamp:(double)a4;
- (id)feedbackHistoriesForKeys:(id)a3;
- (id)getSmartPauseFeaturesForBundleIds:(id)a3 sinceTimestamp:(double)a4;
- (id)getTopOfNonProminentStackNotificationsWithLimit:(unint64_t)a3;
- (id)getTopOfProminentStackNotificationsWithLimit:(unint64_t)a3;
- (id)mergedInputEventStreamForInsert;
- (id)mergedInputEventStreamForUpdates;
- (id)messageNotificationsPerAppFromStartTime:(double)a3 toEndTime:(double)a4;
- (id)metricsForSuggestionsSinceCompletionTimestamp:(double)a3;
- (id)mostRecentActiveNotifications;
- (id)notificationsReceivedPerBundleIdSinceDate:(id)a3;
- (id)numProminentActiveNotificationsPerBundleId;
- (id)numProminentActiveNotificationsPerThreadId;
- (id)pruneNotificationsBeforeTimestamp:(double)a3;
- (id)pruneSuggestionsBeforeTimestamp:(double)a3;
- (id)resolutionsForNotifications:(id)a3;
- (id)suggestionEventTypeShownForEntityId:(id)a3 suggestionType:(int64_t)a4 scope:(int64_t)a5 sinceTimestamp:(double)a6;
- (id)telemetryDataForNotificationWithBundleId:(id)a3 notificationId:(id)a4 recordTimestamp:(double)a5;
- (id)telemetryDataForNotificationsFromTimestamp:(double)a3 endTimestamp:(double)a4;
- (id)timeSensitiveNonmessageNotificationsPerAppFromStartTime:(double)a3 toEndTime:(double)a4;
- (id)totalNotificationsPerAppFromStartTime:(double)a3 toEndTime:(double)a4;
- (id)vacuumDatabase;
- (void)analyze;
- (void)notificationAndSuggestionDatastorePerfMetricsLogging;
- (void)numberOfActiveNotificationsWithCompletionHandler:(id)a3;
- (void)pruneDatabaseWithXPCActivity:(id)a3;
- (void)pruneNotificationsBasedOnHardLimitsWithXPCActivity:(id)a3;
- (void)pruneSuggestionsBasedOnHardLimitsWithXPCActivity:(id)a3;
- (void)updateDatabase;
- (void)updateDatabaseForEvent:(id)a3;
- (void)updateDatabaseForNotificationEvent:(id)a3;
@end

@implementation ATXNotificationAndSuggestionDatastore

- (id)mergedInputEventStreamForInsert
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v3 = [(ATXNotificationAndSuggestionDatastore *)self _notificationEventPublisher];
  v4 = [(ATXNotificationAndSuggestionDatastore *)self _suggestionPublisher];
  v8[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  v6 = [(ATXNotificationAndSuggestionDatastore *)self _timeBasedMergePublisher:v3 withOtherPublishers:v5];

  return v6;
}

- (id)mergedInputEventStreamForUpdates
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v3 = [(ATXNotificationAndSuggestionDatastore *)self _suggestionInteractionEventPublisher];
  v4 = [(ATXNotificationAndSuggestionDatastore *)self _notificationGroupEventPublisher];
  v5 = [(ATXNotificationAndSuggestionDatastore *)self _notificationDeliveryEventPublisher];
  v9[0] = v3;
  v9[1] = v4;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  v7 = [(ATXNotificationAndSuggestionDatastore *)self _timeBasedMergePublisher:v5 withOtherPublishers:v6];

  return v7;
}

- (id)_timeBasedMergePublisher:(id)a3 withOtherPublishers:(id)a4
{
  return (id)[a3 orderedMergeWithOthers:a4 comparator:&__block_literal_global_189];
}

uint64_t __86__ATXNotificationAndSuggestionDatastore__timeBasedMergePublisher_withOtherPublishers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = NSNumber;
  id v5 = a3;
  [a2 timestamp];
  v6 = objc_msgSend(v4, "numberWithDouble:");
  v7 = NSNumber;
  [v5 timestamp];
  double v9 = v8;

  v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

- (id)_notificationEventPublisher
{
  notificationEventPublisher = self->_notificationEventPublisher;
  if (!notificationEventPublisher)
  {
    v4 = objc_opt_new();
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-604800.0];
    [v5 timeIntervalSinceReferenceDate];
    objc_msgSend(v4, "publisherFromStartTime:");
    v6 = (BPSPublisher *)objc_claimAutoreleasedReturnValue();
    v7 = self->_notificationEventPublisher;
    self->_notificationEventPublisher = v6;

    notificationEventPublisher = self->_notificationEventPublisher;
  }
  return notificationEventPublisher;
}

- (id)_suggestionPublisher
{
  suggestionPublisher = self->_suggestionPublisher;
  if (!suggestionPublisher)
  {
    v4 = objc_opt_new();
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-604800.0];
    [v5 timeIntervalSinceReferenceDate];
    objc_msgSend(v4, "publisherFromStartTime:");
    v6 = (BPSPublisher *)objc_claimAutoreleasedReturnValue();
    v7 = self->_suggestionPublisher;
    self->_suggestionPublisher = v6;

    suggestionPublisher = self->_suggestionPublisher;
  }
  return suggestionPublisher;
}

- (id)_suggestionInteractionEventPublisher
{
  suggestionInteractionEventPublisher = self->_suggestionInteractionEventPublisher;
  if (!suggestionInteractionEventPublisher)
  {
    v4 = objc_opt_new();
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-604800.0];
    [v5 timeIntervalSinceReferenceDate];
    objc_msgSend(v4, "publisherFromStartTime:");
    v6 = (BPSPublisher *)objc_claimAutoreleasedReturnValue();
    v7 = self->_suggestionInteractionEventPublisher;
    self->_suggestionInteractionEventPublisher = v6;

    suggestionInteractionEventPublisher = self->_suggestionInteractionEventPublisher;
  }
  return suggestionInteractionEventPublisher;
}

- (id)_notificationGroupEventPublisher
{
  notificationGroupEventPublisher = self->_notificationGroupEventPublisher;
  if (!notificationGroupEventPublisher)
  {
    v4 = objc_opt_new();
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-604800.0];
    [v5 timeIntervalSinceReferenceDate];
    objc_msgSend(v4, "publisherFromStartTime:");
    v6 = (BPSPublisher *)objc_claimAutoreleasedReturnValue();
    v7 = self->_notificationGroupEventPublisher;
    self->_notificationGroupEventPublisher = v6;

    notificationGroupEventPublisher = self->_notificationGroupEventPublisher;
  }
  return notificationGroupEventPublisher;
}

- (id)_notificationDeliveryEventPublisher
{
  notificationDeliveryEventPublisher = self->_notificationDeliveryEventPublisher;
  if (!notificationDeliveryEventPublisher)
  {
    v4 = objc_opt_new();
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-604800.0];
    [v5 timeIntervalSinceReferenceDate];
    objc_msgSend(v4, "publisherFromStartTime:");
    v6 = (BPSPublisher *)objc_claimAutoreleasedReturnValue();
    v7 = self->_notificationDeliveryEventPublisher;
    self->_notificationDeliveryEventPublisher = v6;

    notificationDeliveryEventPublisher = self->_notificationDeliveryEventPublisher;
  }
  return notificationDeliveryEventPublisher;
}

- (void)updateDatabaseForEvent:(id)a3
{
  id v4 = a3;
  id v5 = [v4 eventBody];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v7 = [v4 eventBody];
  if (isKindOfClass)
  {
    [(ATXNotificationAndSuggestionDatastore *)self updateDatabaseForNotificationEvent:v7];
  }
  else
  {
    objc_opt_class();
    char v8 = objc_opt_isKindOfClass();

    v7 = [v4 eventBody];
    if (v8)
    {
      [(ATXNotificationAndSuggestionDatabase *)self->_db insertSuggestion:v7];
    }
    else
    {
      objc_opt_class();
      char v9 = objc_opt_isKindOfClass();

      v7 = [v4 eventBody];
      if (v9)
      {
        [(ATXNotificationAndSuggestionDatabase *)self->_db updateSuggestionFromEvent:v7];
      }
      else
      {
        objc_opt_class();
        char v10 = objc_opt_isKindOfClass();

        uint64_t v11 = [v4 eventBody];
        v7 = v11;
        if (v10)
        {
          if ([v11 eventType] == 3)
          {
            [(ATXNotificationAndSuggestionDatabase *)self->_db setAllNotificationsToClearedExceptProminent];
          }
          else if ([v7 eventType] == 15)
          {
            [(ATXNotificationAndSuggestionDatabase *)self->_db setAllNotificationsToModified];
          }
        }
        else
        {
          objc_opt_class();
          char v12 = objc_opt_isKindOfClass();

          if (v12)
          {
            v7 = [v4 eventBody];
            db = self->_db;
            v14 = [v7 suggestionUUIDs];
            [(ATXNotificationAndSuggestionDatabase *)db updateNotificationUIForNotifications:v14 nextUI:[v7 deliveryUI]];
          }
          else
          {
            v7 = __atxlog_handle_default();
            if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
              -[ATXNotificationAndSuggestionDatastore updateDatabaseForEvent:]();
            }
          }
        }
      }
    }
  }
}

- (void)updateDatabaseForNotificationEvent:(id)a3
{
  id v4 = a3;
  if ([v4 isReceiveEvent])
  {
    uint64_t v5 = [v4 eventType];
    uint64_t v6 = 1;
    if (v5 && v5 != 16)
    {
      if (v5 == 17)
      {
        uint64_t v6 = 0;
      }
      else
      {
        v7 = __atxlog_handle_default();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
          -[ATXNotificationAndSuggestionDatastore updateDatabaseForNotificationEvent:]();
        }

        uint64_t v6 = 2;
      }
    }
    db = self->_db;
    char v9 = [v4 modeUUID];
    char v10 = [v9 UUIDString];
    uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "deliveryReason"));
    [(ATXNotificationAndSuggestionDatabase *)db insertNotificationFromEvent:v4 deliveryMethod:v6 modeIdentifier:v10 deliveryReason:v11];
  }
  else
  {
    [(ATXNotificationAndSuggestionDatabase *)self->_db updateNotificationFromEvent:v4];
  }
}

- (ATXNotificationAndSuggestionDatastore)init
{
  return [(ATXNotificationAndSuggestionDatastore *)self initWithNotificationAndSuggestionDatabase:0 bookmark:0];
}

- (ATXNotificationAndSuggestionDatastore)initWithNotificationAndSuggestionDatabase:(id)a3
{
  return [(ATXNotificationAndSuggestionDatastore *)self initWithNotificationAndSuggestionDatabase:a3 bookmark:0];
}

- (ATXNotificationAndSuggestionDatastore)initWithNotificationAndSuggestionDatabase:(id)a3 bookmark:(id)a4
{
  return [(ATXNotificationAndSuggestionDatastore *)self initWithNotificationAndSuggestionDatabase:a3 bookmark:a4 notificationEventPublisher:0 suggestionPublisher:0 suggestionInteractionEventPublisher:0];
}

- (ATXNotificationAndSuggestionDatastore)initWithNotificationAndSuggestionDatabase:(id)a3 bookmark:(id)a4 notificationEventPublisher:(id)a5 suggestionPublisher:(id)a6 suggestionInteractionEventPublisher:(id)a7
{
  return [(ATXNotificationAndSuggestionDatastore *)self initWithNotificationAndSuggestionDatabase:a3 createBookmark:a4 updateBookmark:0 notificationEventPublisher:a5 suggestionPublisher:a6 suggestionInteractionEventPublisher:a7 notificationGroupEventPublisher:0 notificationDeliveryEventPublisher:0];
}

- (ATXNotificationAndSuggestionDatastore)initWithNotificationAndSuggestionDatabase:(id)a3 createBookmark:(id)a4 updateBookmark:(id)a5 notificationEventPublisher:(id)a6 suggestionPublisher:(id)a7 suggestionInteractionEventPublisher:(id)a8 notificationGroupEventPublisher:(id)a9 notificationDeliveryEventPublisher:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v31 = a6;
  id v30 = a7;
  id v29 = a8;
  id v28 = a9;
  id v19 = a10;
  v32.receiver = self;
  v32.super_class = (Class)ATXNotificationAndSuggestionDatastore;
  v20 = [(ATXNotificationAndSuggestionDatastore *)&v32 init];
  if (v20)
  {
    if (v16) {
      v21 = (ATXNotificationAndSuggestionDatabase *)v16;
    }
    else {
      v21 = (ATXNotificationAndSuggestionDatabase *)objc_opt_new();
    }
    db = v20->_db;
    v20->_db = v21;

    if (v17)
    {
      v23 = (BMBookmark *)v17;
    }
    else
    {
      v23 = [(ATXNotificationAndSuggestionDatastore *)v20 _fetchBookmarkFromDbWithName:@"ATXNotificationAndSuggestionDatastore_bookmark", 2, v28, v29, v30, v31 version];
    }
    insertionBookmark = v20->_insertionBookmark;
    v20->_insertionBookmark = v23;

    if (v18)
    {
      v25 = (BMBookmark *)v18;
    }
    else
    {
      v25 = [(ATXNotificationAndSuggestionDatastore *)v20 _fetchBookmarkFromDbWithName:@"ATXNotificationAndSuggestionDatastoreUpdate_bookmark" version:1];
    }
    updateBookmark = v20->_updateBookmark;
    v20->_updateBookmark = v25;

    objc_storeStrong((id *)&v20->_notificationEventPublisher, a6);
    objc_storeStrong((id *)&v20->_suggestionPublisher, a7);
    objc_storeStrong((id *)&v20->_suggestionInteractionEventPublisher, a8);
    objc_storeStrong((id *)&v20->_notificationGroupEventPublisher, a9);
    objc_storeStrong((id *)&v20->_notificationDeliveryEventPublisher, a10);
  }

  return v20;
}

- (id)_fetchBookmarkFromDbWithName:(id)a3 version:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(ATXNotificationAndSuggestionDatabase *)self->_db getBookmarkDataFromName:v6];
  if (v7)
  {
    char v8 = (void *)MEMORY[0x1E4F4B618];
    char v9 = [NSNumber numberWithUnsignedInteger:a4];
    char v10 = [v8 bookmarkFromData:v7 bookmarkLocation:v6 versionNumber:v9];

    uint64_t v11 = [v10 bookmark];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)_serializeBookmark:(id)a3 withVersion:(unint64_t)a4
{
  uint64_t v5 = (objc_class *)MEMORY[0x1E4F4B618];
  id v6 = a3;
  id v7 = [v5 alloc];
  char v8 = [NSNumber numberWithUnsignedInteger:a4];
  char v9 = (void *)[v7 initWithURLPath:0 versionNumber:v8 bookmark:v6 metadata:0];

  id v15 = 0;
  char v10 = [v9 serializeBookmark:&v15];
  id v11 = v15;
  if (v11)
  {
    char v12 = __atxlog_handle_default();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ATXNotificationAndSuggestionDatastore _serializeBookmark:withVersion:]();
    }

    id v13 = 0;
  }
  else
  {
    id v13 = v10;
  }

  return v13;
}

- (void)updateDatabase
{
  v3 = [(ATXNotificationAndSuggestionDatastore *)self mergedInputEventStreamForInsert];
  insertionBookmark = self->_insertionBookmark;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__ATXNotificationAndSuggestionDatastore_updateDatabase__block_invoke;
  v12[3] = &unk_1E68ABA68;
  v12[4] = self;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__ATXNotificationAndSuggestionDatastore_updateDatabase__block_invoke_2;
  v11[3] = &unk_1E68B4650;
  v11[4] = self;
  id v5 = (id)[v3 sinkWithBookmark:insertionBookmark completion:v12 receiveInput:v11];

  id v6 = [(ATXNotificationAndSuggestionDatastore *)self mergedInputEventStreamForUpdates];
  updateBookmark = self->_updateBookmark;
  v9[4] = self;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__ATXNotificationAndSuggestionDatastore_updateDatabase__block_invoke_40;
  v10[3] = &unk_1E68ABA68;
  v10[4] = self;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__ATXNotificationAndSuggestionDatastore_updateDatabase__block_invoke_2_41;
  void v9[3] = &unk_1E68B4650;
  id v8 = (id)[v6 sinkWithBookmark:updateBookmark completion:v10 receiveInput:v9];
}

void __55__ATXNotificationAndSuggestionDatastore_updateDatabase__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v7 = [*(id *)(a1 + 32) _serializeBookmark:v4 withVersion:2];
  [*(id *)(*(void *)(a1 + 32) + 8) setBookmarkData:v7 forName:@"ATXNotificationAndSuggestionDatastore_bookmark"];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v4;
}

void __55__ATXNotificationAndSuggestionDatastore_updateDatabase__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [*(id *)(a1 + 32) updateDatabaseForEvent:v3];
  }
  else
  {
    id v4 = __atxlog_handle_default();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __55__ATXNotificationAndSuggestionDatastore_updateDatabase__block_invoke_2_cold_1();
    }
  }
}

void __55__ATXNotificationAndSuggestionDatastore_updateDatabase__block_invoke_40(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v7 = [*(id *)(a1 + 32) _serializeBookmark:v4 withVersion:1];
  [*(id *)(*(void *)(a1 + 32) + 8) setBookmarkData:v7 forName:@"ATXNotificationAndSuggestionDatastoreUpdate_bookmark"];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v4;
}

void __55__ATXNotificationAndSuggestionDatastore_updateDatabase__block_invoke_2_41(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [*(id *)(a1 + 32) updateDatabaseForEvent:v3];
  }
  else
  {
    id v4 = __atxlog_handle_default();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __55__ATXNotificationAndSuggestionDatastore_updateDatabase__block_invoke_2_cold_1();
    }
  }
}

- (BOOL)hasUrgencyTuningSuggestionBeenShownForBundleId:(id)a3 sinceTimestamp:(double)a4
{
  return [(ATXNotificationAndSuggestionDatastore *)self hasSuggestionBeenShownForEntityId:a3 suggestionType:7 scope:1 sinceTimestamp:a4];
}

- (BOOL)hasSuggestionBeenShownForEntityId:(id)a3 suggestionType:(int64_t)a4 scope:(int64_t)a5 sinceTimestamp:(double)a6
{
  return [(ATXNotificationAndSuggestionDatabase *)self->_db hasSuggestionBeenShownForEntityId:a3 suggestionType:a4 scope:a5 sinceTimestamp:a6];
}

- (id)suggestionEventTypeShownForEntityId:(id)a3 suggestionType:(int64_t)a4 scope:(int64_t)a5 sinceTimestamp:(double)a6
{
  return [(ATXNotificationAndSuggestionDatabase *)self->_db suggestionEventTypeShownForEntityId:a3 suggestionType:a4 scope:a5 sinceTimestamp:a6];
}

- (id)engagementStatusOfActiveAndProminentNotificationsWithUrgency:(int64_t)a3 sinceTimestamp:(double)a4
{
  return [(ATXNotificationAndSuggestionDatabase *)self->_db engagementStatusOfActiveAndProminentNotificationsWithUrgency:a3 sinceTimestamp:a4];
}

- (id)engagementStatusOfActiveAndProminentAndMessageNotificationsSinceTimestamp:(double)a3
{
  return [(ATXNotificationAndSuggestionDatabase *)self->_db engagementStatusOfActiveAndProminentAndMessageNotificationsSinceTimestamp:a3];
}

- (id)engagementStatusOfActiveAndProminentNotificationsSinceTimestamp:(double)a3
{
  return [(ATXNotificationAndSuggestionDatabase *)self->_db engagementStatusOfActiveAndProminentNotificationsSinceTimestamp:a3];
}

- (id)mostRecentActiveNotifications
{
  return [(ATXNotificationAndSuggestionDatabase *)self->_db mostRecentActiveNotifications];
}

- (id)numProminentActiveNotificationsPerBundleId
{
  return [(ATXNotificationAndSuggestionDatabase *)self->_db numProminentActiveNotificationsByGroupingColumn:@"bundleId"];
}

- (id)numProminentActiveNotificationsPerThreadId
{
  return [(ATXNotificationAndSuggestionDatabase *)self->_db numProminentActiveNotificationsByGroupingColumn:@"threadId"];
}

- (void)numberOfActiveNotificationsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  [(ATXNotificationAndSuggestionDatastore *)self updateDatabase];
  [(ATXNotificationAndSuggestionDatabase *)self->_db numberOfActiveNotificationsWithCompletionHandler:v4];
}

- (id)currentActiveSuggestions
{
  return [(ATXNotificationAndSuggestionDatabase *)self->_db currentActiveSuggestions];
}

- (id)allNotificationsBetweenStartTimestamp:(id)a3 endTimestamp:(id)a4 limit:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  id v11 = v10;
  if (v9)
  {
    id v12 = v9;
  }
  else
  {
    id v12 = [MEMORY[0x1E4F1C9C8] distantFuture];
  }
  id v13 = v12;
  v14 = [(ATXNotificationAndSuggestionDatabase *)self->_db allNotificationsBetweenStartTimestamp:v11 endTimestamp:v12 limit:a5];

  return v14;
}

- (id)notificationsReceivedPerBundleIdSinceDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  id v7 = v6;
  id v8 = [(ATXNotificationAndSuggestionDatabase *)self->_db notificationsReceivedPerBundleIdSinceDate:v6];

  return v8;
}

- (id)resolutionsForNotifications:(id)a3
{
  return [(ATXNotificationAndSuggestionDatabase *)self->_db resolutionsForNotifications:a3];
}

- (id)appSortedByNumOfNotificationsSinceTimestamp:(double)a3
{
  return [(ATXNotificationAndSuggestionDatabase *)self->_db appSortedByNumOfNotificationsSinceTimestamp:a3];
}

- (double)receiveTimeStampOfFirstNotification
{
  [(ATXNotificationAndSuggestionDatabase *)self->_db receiveTimeStampOfFirstNotification];
  return result;
}

- (id)deleteAllData
{
  insertionBookmark = self->_insertionBookmark;
  self->_insertionBookmark = 0;

  updateBookmark = self->_updateBookmark;
  self->_updateBookmark = 0;

  db = self->_db;
  return [(ATXNotificationAndSuggestionDatabase *)db deleteAllData];
}

- (id)messageNotificationsPerAppFromStartTime:(double)a3 toEndTime:(double)a4
{
  return [(ATXNotificationAndSuggestionDatabase *)self->_db messageNotificationsPerAppFromStartTime:a3 toEndTime:a4];
}

- (id)timeSensitiveNonmessageNotificationsPerAppFromStartTime:(double)a3 toEndTime:(double)a4
{
  return [(ATXNotificationAndSuggestionDatabase *)self->_db timeSensitiveNonmessageNotificationsPerAppFromStartTime:a3 toEndTime:a4];
}

- (id)totalNotificationsPerAppFromStartTime:(double)a3 toEndTime:(double)a4
{
  return [(ATXNotificationAndSuggestionDatabase *)self->_db totalNotificationsPerAppFromStartTime:a3 toEndTime:a4];
}

- (id)getTopOfProminentStackNotificationsWithLimit:(unint64_t)a3
{
  return [(ATXNotificationAndSuggestionDatabase *)self->_db getTopOfProminentStackNotificationsWithLimit:a3];
}

- (id)getTopOfNonProminentStackNotificationsWithLimit:(unint64_t)a3
{
  return [(ATXNotificationAndSuggestionDatabase *)self->_db getTopOfNonProminentStackNotificationsWithLimit:a3];
}

- (id)telemetryDataForNotificationsFromTimestamp:(double)a3 endTimestamp:(double)a4
{
  return [(ATXNotificationAndSuggestionDatabase *)self->_db telemetryDataForNotificationsFromTimestamp:a3 endTimestamp:a4];
}

- (id)telemetryDataForNotificationWithBundleId:(id)a3 notificationId:(id)a4 recordTimestamp:(double)a5
{
  return [(ATXNotificationAndSuggestionDatabase *)self->_db telemetryDataForNotificationWithBundleId:a3 notificationId:a4 recordTimestamp:a5];
}

- (id)getSmartPauseFeaturesForBundleIds:(id)a3 sinceTimestamp:(double)a4
{
  return [(ATXNotificationAndSuggestionDatabase *)self->_db getSmartPauseFeaturesForBundleIds:a3 sinceTimestamp:&unk_1F27F37B0 positiveEngagementEnums:a4];
}

- (id)allNotificationsFromBundleId:(id)a3 sinceTimestamp:(double)a4
{
  return [(ATXNotificationAndSuggestionDatabase *)self->_db allNotificationsFromBundleId:a3 sinceTimestamp:a4];
}

- (id)allBundleIdsOfNotificationsOnLockscreen
{
  return [(ATXNotificationAndSuggestionDatabase *)self->_db allBundleIdsOfNotificationsOnLockscreen];
}

- (id)pruneNotificationsBeforeTimestamp:(double)a3
{
  return [(ATXNotificationAndSuggestionDatabase *)self->_db pruneNotificationsBeforeTimestamp:a3];
}

- (id)pruneSuggestionsBeforeTimestamp:(double)a3
{
  return [(ATXNotificationAndSuggestionDatabase *)self->_db pruneSuggestionsBeforeTimestamp:a3];
}

- (void)pruneNotificationsBasedOnHardLimitsWithXPCActivity:(id)a3
{
}

- (void)pruneSuggestionsBasedOnHardLimitsWithXPCActivity:(id)a3
{
}

- (void)analyze
{
}

- (id)vacuumDatabase
{
  return [(ATXNotificationAndSuggestionDatabase *)self->_db vacuumDatabase];
}

- (id)metricsForSuggestionsSinceCompletionTimestamp:(double)a3
{
  return [(ATXNotificationAndSuggestionDatabase *)self->_db metricsForSuggestionsSinceCompletionTimestamp:a3];
}

- (id)feedbackHistoriesForKeys:(id)a3
{
  return [(ATXNotificationAndSuggestionDatabase *)self->_db feedbackHistoriesForKeys:a3];
}

- (void)pruneDatabaseWithXPCActivity:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v6 = v5;
  id v7 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    id v9 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v60 = v9;
    __int16 v61 = 2048;
    double v62 = v6;
    _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_INFO, "[%@] Pruning database given current time %f", buf, 0x16u);
  }
  double v10 = [MEMORY[0x1E4F4B650] appPredictionDirectoryFile:@"_ATXNotificationStore.db"];
  id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v57 = 0;
  char v12 = [v11 removeItemAtPath:*(void *)&v10 error:&v57];
  id v13 = v57;
  v14 = v13;
  if ((v12 & 1) != 0 || !v13)
  {
    v20 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v60 = "-[ATXNotificationAndSuggestionDatastore pruneDatabaseWithXPCActivity:]";
      __int16 v61 = 2112;
      double v62 = v10;
      _os_log_impl(&dword_1D0FA3000, v20, OS_LOG_TYPE_DEFAULT, "%s: Migration step 10: Deleted old database at %@", buf, 0x16u);
    }

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    v21 = [MEMORY[0x1E4F4B650] appPredictionDirectory];
    id v19 = [v11 contentsOfDirectoryAtPath:v21 error:0];

    uint64_t v22 = [v19 countByEnumeratingWithState:&v53 objects:v58 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      v51 = v14;
      id v52 = v4;
      double v24 = v10;
      uint64_t v25 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v54 != v25) {
            objc_enumerationMutation(v19);
          }
          v27 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          if (objc_msgSend(v27, "hasPrefix:", @"_ATXNotificationStore.db", v51, v52))
          {
            id v28 = [MEMORY[0x1E4F4B650] appPredictionDirectoryFile:v27];
            [v11 removeItemAtPath:v28 error:0];
          }
        }
        uint64_t v23 = [v19 countByEnumeratingWithState:&v53 objects:v58 count:16];
      }
      while (v23);
      double v10 = v24;
      v14 = v51;
      id v4 = v52;
    }
    id v18 = &off_1D142A000;
  }
  else
  {
    id v15 = [v13 userInfo];
    id v16 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];
    uint64_t v17 = [v16 code];

    id v18 = &off_1D142A000;
    if (v17 == 2) {
      goto LABEL_22;
    }
    id v19 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      [(ATXNotificationAndSuggestionDatastore *)*(uint64_t *)&v10 pruneDatabaseWithXPCActivity:v19];
    }
  }

LABEL_22:
  id v29 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    id v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    id v31 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = *((void *)v18 + 494);
    v60 = v31;
    __int16 v61 = 2048;
    double v62 = v6 + -5184000.0;
    _os_log_impl(&dword_1D0FA3000, v29, OS_LOG_TYPE_INFO, "[%@] Pruning notifications with cutoff time %f", buf, 0x16u);
  }
  id v32 = [(ATXNotificationAndSuggestionDatastore *)self pruneNotificationsBeforeTimestamp:v6 + -5184000.0];
  if ([v4 didDefer])
  {
    v33 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      v34 = (objc_class *)objc_opt_class();
      NSStringFromClass(v34);
      v35 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v60 = v35;
      _os_log_impl(&dword_1D0FA3000, v33, OS_LOG_TYPE_INFO, "[%@] XPC Activity deferred, skipping remaining work.", buf, 0xCu);
    }
  }
  double v36 = v6 + -31536000.0;
  v37 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    v38 = (objc_class *)objc_opt_class();
    NSStringFromClass(v38);
    v39 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = *((void *)v18 + 494);
    v60 = v39;
    __int16 v61 = 2048;
    double v62 = v36;
    _os_log_impl(&dword_1D0FA3000, v37, OS_LOG_TYPE_INFO, "[%@] Pruning suggestions with cutoff time %f", buf, 0x16u);
  }
  id v40 = [(ATXNotificationAndSuggestionDatastore *)self pruneSuggestionsBeforeTimestamp:v36];
  if ([v4 didDefer])
  {
    v41 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      v42 = (objc_class *)objc_opt_class();
      NSStringFromClass(v42);
      v43 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v60 = v43;
      _os_log_impl(&dword_1D0FA3000, v41, OS_LOG_TYPE_INFO, "[%@] XPC Activity deferred, skipping remaining work.", buf, 0xCu);
    }
  }
  v44 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
  {
    v45 = (objc_class *)objc_opt_class();
    NSStringFromClass(v45);
    v46 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v60 = v46;
    _os_log_impl(&dword_1D0FA3000, v44, OS_LOG_TYPE_INFO, "[%@] Vacuuming database", buf, 0xCu);
  }
  id v47 = [(ATXNotificationAndSuggestionDatastore *)self vacuumDatabase];
  v48 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
  {
    v49 = (objc_class *)objc_opt_class();
    NSStringFromClass(v49);
    v50 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v60 = v50;
    _os_log_impl(&dword_1D0FA3000, v48, OS_LOG_TYPE_INFO, "[%@] Finished pruning and vacuuming database", buf, 0xCu);
  }
}

- (void)notificationAndSuggestionDatastorePerfMetricsLogging
{
  v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(ATXNotificationAndSuggestionDatabase *)self->_db notificationAndSuggestionDatastorePerfMetrics];
  uint64_t v4 = v3;
  v8[0] = @"notificationsCount";
  double v5 = [NSNumber numberWithInteger:v2];
  v8[1] = @"suggestionsCount";
  v9[0] = v5;
  double v6 = [NSNumber numberWithInteger:v4];
  v9[1] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  AnalyticsSendEvent();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationDeliveryEventPublisher, 0);
  objc_storeStrong((id *)&self->_notificationGroupEventPublisher, 0);
  objc_storeStrong((id *)&self->_suggestionInteractionEventPublisher, 0);
  objc_storeStrong((id *)&self->_suggestionPublisher, 0);
  objc_storeStrong((id *)&self->_notificationEventPublisher, 0);
  objc_storeStrong((id *)&self->_updateBookmark, 0);
  objc_storeStrong((id *)&self->_insertionBookmark, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

- (void)updateDatabaseForEvent:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  v1 = (objc_class *)objc_opt_class();
  uint64_t v2 = NSStringFromClass(v1);
  uint64_t v3 = [v0 eventBody];
  uint64_t v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_6(&dword_1D0FA3000, v6, v7, "[%@] - Encountered unknown event type: %@", v8, v9, v10, v11, v12);
}

- (void)updateDatabaseForNotificationEvent:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  v1 = (objc_class *)objc_opt_class();
  uint64_t v2 = NSStringFromClass(v1);
  [v0 eventType];
  uint64_t v3 = ATXNEventTypeToString();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_6(&dword_1D0FA3000, v4, v5, "[%@] Received unexpected notification receive event type %@", v6, v7, v8, v9, v10);
}

- (void)_serializeBookmark:withVersion:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = v1;
  _os_log_error_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_ERROR, "%@ – failed to serialize bookmark.  Error: %@", (uint8_t *)&v4, 0x16u);
}

void __55__ATXNotificationAndSuggestionDatastore_updateDatabase__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_6(&dword_1D0FA3000, v4, v5, "[%@] Expected a BMStoreEvent, but received a %@", v6, v7, v8, v9, v10);
}

- (void)pruneDatabaseWithXPCActivity:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = 136315650;
  uint64_t v4 = "-[ATXNotificationAndSuggestionDatastore pruneDatabaseWithXPCActivity:]";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "%s: Failed to delete: %@ with error: %@", (uint8_t *)&v3, 0x20u);
}

@end