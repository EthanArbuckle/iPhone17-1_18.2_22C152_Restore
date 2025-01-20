@interface ATXNotificationCategorizationUtils
+ (id)megadomeEntityIDFromNotification:(id)a3;
+ (id)megadomePersonRelationshipFromEntityID:(id)a3;
@end

@implementation ATXNotificationCategorizationUtils

+ (id)megadomeEntityIDFromNotification:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(ATXMegadomeContextualPersonRelationships);
  v5 = [v3 title];
  id v20 = 0;
  v6 = [(ATXMegadomeContextualPersonRelationships *)v4 megadomePersonIDFromName:v5 error:&v20];
  id v7 = v20;

  if (![v6 length])
  {
    v8 = [v3 contactIDs];
    v9 = [v8 firstObject];
    id v19 = v7;
    uint64_t v10 = [(ATXMegadomeContextualPersonRelationships *)v4 megadomePersonIDFromContactID:v9 error:&v19];
    id v11 = v19;

    v6 = (void *)v10;
    id v7 = v11;
  }
  if (![v6 length])
  {
    v14 = [v3 threadID];
    id v18 = v7;
    uint64_t v15 = [(ATXMegadomeContextualPersonRelationships *)v4 megadomePersonIDFromPhoneNumber:v14 error:&v18];
    id v16 = v18;

    v6 = (void *)v15;
    id v7 = v16;
    if (v16) {
      goto LABEL_5;
    }
LABEL_9:
    id v13 = v6;
    goto LABEL_10;
  }
  if (!v7) {
    goto LABEL_9;
  }
LABEL_5:
  v12 = __atxlog_handle_notification_categorization();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    +[ATXNotificationCategorizationUtils megadomeEntityIDFromNotification:]((uint64_t)v7, v12);
  }

  id v13 = 0;
LABEL_10:

  return v13;
}

+ (id)megadomePersonRelationshipFromEntityID:(id)a3
{
  id v3 = a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__63;
  v25 = __Block_byref_object_dispose__63;
  id v26 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__63;
  id v19 = __Block_byref_object_dispose__63;
  id v20 = 0;
  v4 = objc_alloc_init(ATXMegadomeContextualPersonRelationships);
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __77__ATXNotificationCategorizationUtils_megadomePersonRelationshipFromEntityID___block_invoke;
  v11[3] = &unk_1E68B2B10;
  id v13 = &v15;
  v14 = &v21;
  v6 = v5;
  v12 = v6;
  [(ATXMegadomeContextualPersonRelationships *)v4 entityRelationshipsFrom:v3 completionHandler:v11];
  id v7 = v6;
  dispatch_time_t v8 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v7, v8);

  id v9 = 0;
  if (!v16[5]) {
    id v9 = (id)v22[5];
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __77__ATXNotificationCategorizationUtils_megadomePersonRelationshipFromEntityID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = __atxlog_handle_notification_categorization();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __77__ATXNotificationCategorizationUtils_megadomePersonRelationshipFromEntityID___block_invoke_cold_1((uint64_t)v6, v7);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)megadomeEntityIDFromNotification:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXNotificationCategorizationUtils: Error getting megadomeEntityID from Name, contactID or phone number: %@", (uint8_t *)&v2, 0xCu);
}

void __77__ATXNotificationCategorizationUtils_megadomePersonRelationshipFromEntityID___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXNotificationCategorizationUtils: Error getting Megadome relationships: %@", (uint8_t *)&v2, 0xCu);
}

@end