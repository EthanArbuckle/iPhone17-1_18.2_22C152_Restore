@interface ATXNotificationsLoggingServer
+ (ATXNotificationsLoggingServer)sharedInstance;
- (ATXNotificationsLoggingServer)init;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)_createPortraitNotificationWithNotificationInterface:(id)a3;
- (id)duetValueType;
- (id)getDuetMetadataFromNotification:(id)a3 metadata:(id)a4;
- (id)getDuetStream;
- (id)getLockscreenBundleIds;
- (void)_donateNotificationToPortraitWithNotificationsInterface:(id)a3;
- (void)_logEventToCoreDuet:(int64_t)a3 forNotificationId:(id)a4 timestamp:(id)a5;
- (void)activeSuggestionsWithReply:(id)a3;
- (void)getModeTimelineDataFromStartDate:(id)a3 reply:(id)a4;
- (void)logNotification:(id)a3 withNotificationId:(id)a4 timestamp:(id)a5;
- (void)logNotificationDeliveryUI:(unint64_t)a3 notificationUUIDs:(id)a4;
- (void)logNotificationEvent:(int64_t)a3 notification:(id)a4 reason:(unint64_t)a5 interactionUI:(unint64_t)a6;
- (void)logNotificationGroupEvent:(int64_t)a3 eventIdentifier:(id)a4 timestamp:(id)a5;
- (void)logNotificationToCoreDuet:(id)a3 withNotificationId:(id)a4 timestamp:(id)a5;
- (void)logNotificationWithMetadata:(id)a3 withNotificationId:(id)a4 timestamp:(id)a5;
- (void)logSuggestionEvent:(int64_t)a3 suggestionType:(int64_t)a4 suggestionIdentifier:(id)a5 timestamp:(id)a6;
- (void)logToCoreDuet:(id)a3 identifier:(id)a4 timestamp:(id)a5;
@end

@implementation ATXNotificationsLoggingServer

+ (ATXNotificationsLoggingServer)sharedInstance
{
  if (sharedInstance_onceToken_11 != -1) {
    dispatch_once(&sharedInstance_onceToken_11, &__block_literal_global_212);
  }
  v2 = (void *)sharedInstance_instance_4;
  return (ATXNotificationsLoggingServer *)v2;
}

uint64_t __47__ATXNotificationsLoggingServer_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedInstance_instance_4;
  sharedInstance_instance_4 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (ATXNotificationsLoggingServer)init
{
  v22.receiver = self;
  v22.super_class = (Class)ATXNotificationsLoggingServer;
  v2 = [(ATXNotificationsLoggingServer *)&v22 init];
  if (v2)
  {
    v3 = objc_alloc_init(ATXModeTimelineManager);
    modeTimelineManager = v2->_modeTimelineManager;
    v2->_modeTimelineManager = v3;

    uint64_t v5 = +[_ATXAggregateLogger sharedInstance];
    aggdlogger = v2->_aggdlogger;
    v2->_aggdlogger = (_ATXAggregateLogger *)v5;

    uint64_t v7 = +[ATXBBNotificationManager sharedInstance];
    bbNotificationManager = v2->_bbNotificationManager;
    v2->_bbNotificationManager = (ATXBBNotificationManager *)v7;

    v9 = objc_alloc_init(ATXNotificationDeliverySuggestionManager);
    notificationDeliverySuggestionManager = v2->_notificationDeliverySuggestionManager;
    v2->_notificationDeliverySuggestionManager = v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F93B60]) initWithBlock:&__block_literal_global_40_3 idleTimeout:1800.0];
    cachedLoggingSources = v2->_cachedLoggingSources;
    v2->_cachedLoggingSources = (_PASLazyPurgeableResult *)v11;

    uint64_t v13 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"ATXNotificationsLoggingServer-donateNotification"];
    donationQueue = v2->_donationQueue;
    v2->_donationQueue = (OS_dispatch_queue *)v13;

    uint64_t v15 = +[ATXNotificationsDedupeTracker sharedInstance];
    dedupetracker = v2->_dedupetracker;
    v2->_dedupetracker = (ATXNotificationsDedupeTracker *)v15;

    uint64_t v17 = [MEMORY[0x1E4F5B560] knowledgeStore];
    duetstorer = v2->_duetstorer;
    v2->_duetstorer = (_DKKnowledgeSaving *)v17;

    uint64_t v19 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.notifications.logging"];
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v19;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener resume];
  }
  return v2;
}

id __37__ATXNotificationsLoggingServer_init__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  return v0;
}

- (void)_donateNotificationToPortraitWithNotificationsInterface:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 sectionID];
  if ([v5 length])
  {
    v6 = [v4 message];
    uint64_t v7 = [v6 length];

    if (v7)
    {
      v8 = [(ATXNotificationsLoggingServer *)self _createPortraitNotificationWithNotificationInterface:v4];
      v9 = (void *)MEMORY[0x1E4F93B18];
      donationQueue = self->_donationQueue;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __89__ATXNotificationsLoggingServer__donateNotificationToPortraitWithNotificationsInterface___block_invoke;
      v13[3] = &unk_1E68AB818;
      id v14 = v8;
      uint64_t v11 = v8;
      [v9 runAsyncOnQueue:donationQueue afterDelaySeconds:v13 block:60.0];

      goto LABEL_7;
    }
  }
  else
  {
  }
  uint64_t v11 = __atxlog_handle_default();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, "ATXNotificationsLoggingServer could not donate notification to PersonalizationPortrait as it was missing a sectionID or message", v12, 2u);
  }
LABEL_7:
}

void __89__ATXNotificationsLoggingServer__donateNotificationToPortraitWithNotificationsInterface___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v6 = 0;
  int v2 = [MEMORY[0x1E4F89DF8] donateNotification:v1 error:&v6];
  id v3 = v6;
  id v4 = __atxlog_handle_default();
  uint64_t v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __89__ATXNotificationsLoggingServer__donateNotificationToPortraitWithNotificationsInterface___block_invoke_cold_1(v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __89__ATXNotificationsLoggingServer__donateNotificationToPortraitWithNotificationsInterface___block_invoke_cold_2();
  }
}

- (id)_createPortraitNotificationWithNotificationInterface:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F89EB8];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = [v4 sectionID];
  uint64_t v7 = [v4 title];
  v8 = [v4 subtitle];
  v9 = [v4 message];

  v10 = (void *)[v5 initWithCurrentDateAndBundleId:v6 title:v7 subtitle:v8 message:v9];
  return v10;
}

- (void)logNotificationWithMetadata:(id)a3 withNotificationId:(id)a4 timestamp:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([(ATXNotificationsDedupeTracker *)self->_dedupetracker addNotificationId:v8])
  {
    uint64_t v10 = [MEMORY[0x1E4F4AD38] getBundleIdFromMetadata:v12];
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      [(ATXBBNotificationManager *)self->_bbNotificationManager addNotificationForBundleId:v10 withPublicationDate:v9];
      [(ATXNotificationsLoggingServer *)self logNotificationToCoreDuet:v12 withNotificationId:v8 timestamp:v9];
    }
  }
}

- (void)logNotificationToCoreDuet:(id)a3 withNotificationId:(id)a4 timestamp:(id)a5
{
  id v8 = a5;
  id v10 = [(ATXNotificationsLoggingServer *)self getDuetMetadataFromNotification:a4 metadata:a3];
  id v9 = ATXNEventTypeToString();
  [(ATXNotificationsLoggingServer *)self logToCoreDuet:v10 identifier:v9 timestamp:v8];
}

- (void)_logEventToCoreDuet:(int64_t)a3 forNotificationId:(id)a4 timestamp:(id)a5
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  if (v7)
  {
    id v9 = [MEMORY[0x1E4F5B598] identifier];
    id v12 = v9;
    v13[0] = v7;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    uint64_t v11 = ATXNEventTypeToString();
    [(ATXNotificationsLoggingServer *)self logToCoreDuet:v10 identifier:v11 timestamp:v8];
  }
  else
  {
    id v9 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[ATXNotificationsLoggingServer _logEventToCoreDuet:forNotificationId:timestamp:](v9);
    }
  }
}

- (void)logNotification:(id)a3 withNotificationId:(id)a4 timestamp:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v11 = a3;
  id v10 = [v11 extractMetadata];
  [(ATXNotificationsLoggingServer *)self logNotificationWithMetadata:v10 withNotificationId:v9 timestamp:v8];

  [(ATXNotificationsLoggingServer *)self _donateNotificationToPortraitWithNotificationsInterface:v11];
}

- (void)getModeTimelineDataFromStartDate:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, id))a4;
  modeTimelineManager = self->_modeTimelineManager;
  id v9 = v6;
  if (!v6)
  {
    id v9 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  id v10 = [MEMORY[0x1E4F1C9C8] date];
  id v11 = [(ATXModeTimelineManager *)modeTimelineManager modeFromStartDate:v9 toEndDate:v10];

  if (!v6) {
  id v14 = 0;
  }
  id v12 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v11 options:1 error:&v14];
  id v13 = v14;
  v7[2](v7, v12, v13);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = __atxlog_handle_default();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v12 = 0;
    _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_INFO, "Established connection", v12, 2u);
  }

  id v7 = [v5 valueForEntitlement:@"com.apple.notifications.logging"];
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0 && ([v7 BOOLValue] & 1) != 0)
  {
    id v8 = ATXNotificationsLoggingInterface();
    [v5 setExportedInterface:v8];

    [v5 setExportedObject:self];
    [v5 resume];
    BOOL v9 = 1;
  }
  else
  {
    id v10 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ATXNotificationsLoggingServer listener:shouldAcceptNewConnection:]();
    }

    BOOL v9 = 0;
  }

  return v9;
}

- (void)logToCoreDuet:(id)a3 identifier:(id)a4 timestamp:(id)a5
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x1E4F5B548];
  id v12 = [(ATXNotificationsLoggingServer *)self duetValueType];
  id v13 = [v11 identifierWithString:v9 type:v12];

  id v14 = (void *)MEMORY[0x1E4F5B510];
  uint64_t v15 = [(ATXNotificationsLoggingServer *)self getDuetStream];
  v16 = [v14 eventWithStream:v15 startDate:v10 endDate:v10 value:v13 metadata:v8];

  uint64_t v17 = self->_duetstorer;
  objc_sync_enter(v17);
  duetstorer = self->_duetstorer;
  v24[0] = v16;
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  id v23 = 0;
  char v20 = [(_DKKnowledgeSaving *)duetstorer saveObjects:v19 error:&v23];
  id v21 = v23;

  if ((v20 & 1) == 0)
  {
    objc_super v22 = __atxlog_handle_default();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[ATXNotificationsLoggingServer logToCoreDuet:identifier:timestamp:]();
    }
  }
  objc_sync_exit(v17);
}

- (id)getDuetMetadataFromNotification:(id)a3 metadata:(id)a4
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F4AD38] getBundleIdFromMetadata:a4];
  id v7 = [MEMORY[0x1E4F4AF00] parentAppBundleIdForClipBundleID:v6];
  id v8 = objc_opt_new();
  id v9 = [MEMORY[0x1E4F5B598] identifier];
  v17[0] = v9;
  v18[0] = v5;
  id v10 = [MEMORY[0x1E4F5B598] bundleID];
  v17[1] = v10;
  v18[1] = v6;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  [v8 addEntriesFromDictionary:v11];

  if (v7)
  {
    id v12 = [MEMORY[0x1E4F5B4A0] appBundleID];
    uint64_t v15 = v12;
    v16 = v7;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    [v8 addEntriesFromDictionary:v13];
  }
  return v8;
}

- (id)getDuetStream
{
  return (id)[MEMORY[0x1E4F5B520] eventStreamWithName:@"/notification/usage"];
}

- (id)duetValueType
{
  return (id)[MEMORY[0x1E4F5B4E8] typeForName:@"notificationEvent"];
}

- (id)getLockscreenBundleIds
{
  int v2 = (void *)MEMORY[0x1D25F6CC0](self, a2);
  id v3 = objc_opt_new();
  id v4 = [v3 allBundleIdsOfNotificationsOnLockscreen];

  return v4;
}

- (void)activeSuggestionsWithReply:(id)a3
{
}

- (void)logNotificationEvent:(int64_t)a3 notification:(id)a4 reason:(unint64_t)a5 interactionUI:(unint64_t)a6
{
  id v49 = a4;
  id v10 = objc_opt_new();
  id v11 = [v49 bundleID];
  [v10 setSectionID:v11];

  id v12 = [v49 title];
  [v10 setTitle:v12];

  id v13 = [v49 subtitle];
  [v10 setSubtitle:v13];

  id v14 = [v49 body];
  [v10 setMessage:v14];

  uint64_t v15 = [v49 categoryID];
  [v10 setTopic:v15];

  v16 = [v49 uuid];
  uint64_t v17 = [v16 UUIDString];

  v18 = (void *)MEMORY[0x1E4F1C9C8];
  [v49 timestamp];
  uint64_t v19 = objc_msgSend(v18, "dateWithTimeIntervalSinceReferenceDate:");
  if ((unint64_t)a3 <= 0x11 && ((1 << a3) & 0x30001) != 0) {
    [(ATXNotificationsLoggingServer *)self logNotification:v10 withNotificationId:v17 timestamp:v19];
  }
  v46 = (void *)v19;
  char v20 = [(_PASLazyPurgeableResult *)self->_cachedLoggingSources result];
  id v21 = [v20 contactRepresentationDatastore];
  [v49 setRawIdentifiersWithContactRepresentationDataStore:v21];

  v45 = v20;
  objc_super v22 = [v20 userNotificationBiomeStream];
  [v22 sendEvent:a3 notification:v49 deliveryReason:a5 interactionUI:a6];

  id v37 = objc_alloc(MEMORY[0x1E4F4FF28]);
  v44 = objc_opt_new();
  v43 = [v44 UUIDString];
  id v23 = objc_alloc(MEMORY[0x1E4F1C9C8]);
  [v49 timestamp];
  v42 = objc_msgSend(v23, "initWithTimeIntervalSinceReferenceDate:");
  v47 = v10;
  if ((unint64_t)(a3 - 1) > 0x1A) {
    unsigned int v39 = 0;
  }
  else {
    unsigned int v39 = dword_1D142BC6C[a3 - 1];
  }
  v38 = [v49 bundleID];
  v41 = [v49 uuid];
  v36 = [v41 UUIDString];
  v48 = [v49 title];
  v34 = [v49 subtitle];
  v33 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v49, "badge"));
  v32 = [v49 threadID];
  v35 = [v49 categoryID];
  v31 = [v49 sectionID];
  v24 = [v49 contactIDs];
  v25 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v49, "isGroupMessage"));
  v26 = (void *)MEMORY[0x1E4F4AF00];
  v27 = [v49 bundleID];
  v28 = [v26 parentAppBundleIdForClipBundleID:v27];
  v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v49, "bodyLength"));
  v40 = objc_msgSend(v37, "initWithUniqueID:absoluteTimestamp:usageType:bundleID:notificationID:deviceID:title:subtitle:body:badge:threadID:categoryID:sectionID:contactIDs:isGroupMessage:parentBundleID:bodyLength:", v43, v42, v39, v38, v36, 0, v48, v34, 0, v33, v32, v35, v31, v24, v25, v28,
                  v29);

  v30 = [v45 notificationUsageSource];
  [v30 sendEvent:v40];
}

- (void)logSuggestionEvent:(int64_t)a3 suggestionType:(int64_t)a4 suggestionIdentifier:(id)a5 timestamp:(id)a6
{
  id v9 = (objc_class *)MEMORY[0x1E4F4B230];
  id v10 = a6;
  id v11 = a5;
  id v14 = (id)[[v9 alloc] initWithSuggestionType:a4 eventType:a3 suggestionUUID:v11 eventDate:v10];

  id v12 = objc_opt_new();
  id v13 = [v12 source];
  [v13 sendEvent:v14];
}

- (void)logNotificationDeliveryUI:(unint64_t)a3 notificationUUIDs:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (!v5)
  {
    id v7 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[ATXNotificationsLoggingServer logNotificationDeliveryUI:notificationUUIDs:](a3, v7);
    }

    id v6 = (id)MEMORY[0x1E4F1CBF0];
  }
  id v8 = [[ATXNotificationDeliveryEvent alloc] initWithDeliveryUI:a3 suggestionUUIDs:v6];
  id v9 = objc_opt_new();
  id v10 = [v9 source];
  [v10 sendEvent:v8];
}

- (void)logNotificationGroupEvent:(int64_t)a3 eventIdentifier:(id)a4 timestamp:(id)a5
{
  id v7 = (objc_class *)MEMORY[0x1E4F4B1C0];
  id v8 = a5;
  id v9 = a4;
  id v12 = (id)[[v7 alloc] initWithEventType:a3 uuid:v9 eventDate:v8];

  id v10 = objc_opt_new();
  id v11 = [v10 source];
  [v11 sendEvent:v12];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_donationQueue, 0);
  objc_storeStrong((id *)&self->_notificationDeliverySuggestionManager, 0);
  objc_storeStrong((id *)&self->_modeTimelineManager, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_duetstorer, 0);
  objc_storeStrong((id *)&self->_cachedLoggingSources, 0);
  objc_storeStrong((id *)&self->_dedupetracker, 0);
  objc_storeStrong((id *)&self->_bbNotificationManager, 0);
  objc_storeStrong((id *)&self->_aggdlogger, 0);
}

void __89__ATXNotificationsLoggingServer__donateNotificationToPortraitWithNotificationsInterface___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_DEBUG, "ATXNotificationsLoggingServer successfully donated notification to PersonalizationPortrait", v1, 2u);
}

void __89__ATXNotificationsLoggingServer__donateNotificationToPortraitWithNotificationsInterface___block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_ERROR, "ATXNotificationsLoggingServer could not donate notification to PersonalizationPortrait: %@", v1, 0xCu);
}

- (void)_logEventToCoreDuet:(os_log_t)log forNotificationId:timestamp:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "Nullability violation: notificationId is nil", v1, 2u);
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v2 = 2114;
  id v3 = @"com.apple.notifications.logging";
  _os_log_error_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_ERROR, "ATXNotificationsLoggingServer: Rejecting connection %{public}@ without entitlement %{public}@", v1, 0x16u);
}

- (void)logToCoreDuet:identifier:timestamp:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_ERROR, "Notifications donation to CoreDuet failed: %@", v1, 0xCu);
}

- (void)logNotificationDeliveryUI:(uint64_t)a1 notificationUUIDs:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v3 = ATXNotificationDeliveryUIToString();
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "-logNotificationDeliveryUI:notificationUUIDs: deliveryUI: %{public}@. notificationsUUIDs was nil, this shouldn't happen.", v4, 0xCu);
}

@end