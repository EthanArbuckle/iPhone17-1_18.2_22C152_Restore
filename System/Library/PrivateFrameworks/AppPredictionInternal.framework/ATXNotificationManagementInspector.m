@interface ATXNotificationManagementInspector
- (BOOL)clearAllNotificationData:(id *)a3;
- (id)constructStacksForNotifications:(id)a3;
- (id)constructStacksGroupedByAppForNotifications:(id)a3;
- (id)fetchNotificationsFromBiomeFromStartDate:(id)a3 endDate:(id)a4 outError:(id *)a5;
- (id)fetchNotificationsFromDbFromStartDate:(id)a3 endDate:(id)a4;
- (id)fetchNotificationsFromFileData:(id)a3 outError:(id *)a4;
- (id)fetchNotificationsFromSource:(id)a3 startDate:(id)a4 endDate:(id)a5 shouldInferMessages:(BOOL)a6 outError:(id *)a7;
- (id)fetchSerializedAppGroupedNotificationDigestFromSource:(id)a3 digestTimeString:(id)a4 startDate:(id)a5 endDate:(id)a6 shouldInferMessages:(BOOL)a7 outError:(id *)a8;
- (id)fetchSerializedMissedNotificationRankingFromFileData:(id)a3 modeString:(id)a4 outError:(id *)a5;
- (id)fetchSerializedMissedNotificationRankingFromSource:(id)a3 modeString:(id)a4 startDate:(id)a5 endDate:(id)a6 shouldInferMessages:(BOOL)a7 outError:(id *)a8;
- (id)fetchSerializedNotificationDigestFromFileData:(id)a3 digestTimeString:(id)a4 outError:(id *)a5;
- (id)fetchSerializedNotificationDigestFromSource:(id)a3 digestTimeString:(id)a4 startDate:(id)a5 endDate:(id)a6 shouldInferMessages:(BOOL)a7 outError:(id *)a8;
- (id)fetchSerializedNotificationsFromSource:(id)a3 startDate:(id)a4 endDate:(id)a5 shouldInferMessages:(BOOL)a6 outError:(id *)a7;
- (id)logAndCreateErrorForString:(id)a3;
@end

@implementation ATXNotificationManagementInspector

- (BOOL)clearAllNotificationData:(id *)a3
{
  v4 = objc_opt_new();
  [v4 deleteAllEvents];

  v5 = objc_opt_new();
  [v5 deleteAllEvents];

  v6 = objc_opt_new();
  [v6 deleteAllEvents];

  v7 = objc_opt_new();
  v8 = [v7 deleteAllData];

  if (a3) {
    *a3 = v8;
  }

  return v8 == 0;
}

- (id)fetchSerializedNotificationDigestFromFileData:(id)a3 digestTimeString:(id)a4 outError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v41 = 0;
  v42 = (id *)&v41;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__70;
  v45 = __Block_byref_object_dispose__70;
  id v46 = 0;
  id v40 = 0;
  v10 = [(ATXNotificationManagementInspector *)self fetchNotificationsFromFileData:v8 outError:&v40];
  objc_storeStrong(&v46, v40);
  if (a5 && (id v11 = v42[5]) != 0)
  {
    v12 = 0;
    *a5 = v11;
  }
  else
  {
    uint64_t v34 = 0;
    v35 = &v34;
    uint64_t v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__70;
    v38 = __Block_byref_object_dispose__70;
    id v39 = 0;
    v13 = [(ATXNotificationManagementInspector *)self constructStacksForNotifications:v10];
    id v14 = objc_alloc(MEMORY[0x1E4F4B1B8]);
    v15 = +[ATXNotificationDigestRankerServer sharedInstance];
    v16 = (void *)[v14 initWithDigestRankerClient:v15];

    dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __110__ATXNotificationManagementInspector_fetchSerializedNotificationDigestFromFileData_digestTimeString_outError___block_invoke;
    v30[3] = &unk_1E68B3750;
    v32 = &v41;
    v33 = &v34;
    v18 = v17;
    v31 = v18;
    [v16 generateDigestForNotificationArrays:v13 reply:v30];
    double v19 = (double)(unint64_t)*MEMORY[0x1E4F4B588];
    v28[4] = self;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __110__ATXNotificationManagementInspector_fetchSerializedNotificationDigestFromFileData_digestTimeString_outError___block_invoke_2;
    v29[3] = &unk_1E68AB818;
    v29[4] = self;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __110__ATXNotificationManagementInspector_fetchSerializedNotificationDigestFromFileData_digestTimeString_outError___block_invoke_51;
    v28[3] = &unk_1E68AB818;
    [MEMORY[0x1E4F93B18] waitForSemaphore:v18 timeoutSeconds:v29 onAcquire:v28 onTimeout:v19];
    if (a5 && (id v20 = v42[5]) != 0)
    {
      v12 = 0;
      *a5 = v20;
    }
    else
    {
      v21 = (void *)MEMORY[0x1E4F28D90];
      v22 = [(id)v35[5] jsonRepresentation];
      v23 = v42;
      id obj = v42[5];
      v24 = [v21 dataWithJSONObject:v22 options:1 error:&obj];
      objc_storeStrong(v23 + 5, obj);

      if (a5 && (id v25 = v42[5]) != 0)
      {
        v12 = 0;
        *a5 = v25;
      }
      else
      {
        v12 = (void *)[[NSString alloc] initWithData:v24 encoding:4];
      }
    }
    _Block_object_dispose(&v34, 8);
  }
  _Block_object_dispose(&v41, 8);

  return v12;
}

void __110__ATXNotificationManagementInspector_fetchSerializedNotificationDigestFromFileData_digestTimeString_outError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v11 = v5;
  if (a3)
  {
    uint64_t v6 = [a3 copy];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  else
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = v5;
    id v8 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v10;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __110__ATXNotificationManagementInspector_fetchSerializedNotificationDigestFromFileData_digestTimeString_outError___block_invoke_2()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v0 = __atxlog_handle_default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = (objc_class *)objc_opt_class();
    v2 = NSStringFromClass(v1);
    int v3 = 138412290;
    v4 = v2;
    _os_log_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_DEFAULT, "Successfully acquired semaphore in %@", (uint8_t *)&v3, 0xCu);
  }
}

void __110__ATXNotificationManagementInspector_fetchSerializedNotificationDigestFromFileData_digestTimeString_outError___block_invoke_51()
{
  v0 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __110__ATXNotificationManagementInspector_fetchSerializedNotificationDigestFromFileData_digestTimeString_outError___block_invoke_51_cold_1();
  }
}

- (id)fetchSerializedNotificationDigestFromSource:(id)a3 digestTimeString:(id)a4 startDate:(id)a5 endDate:(id)a6 shouldInferMessages:(BOOL)a7 outError:(id *)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  uint64_t v50 = 0;
  v51 = (id *)&v50;
  uint64_t v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__70;
  v54 = __Block_byref_object_dispose__70;
  id v55 = 0;
  id v49 = 0;
  v18 = [(ATXNotificationManagementInspector *)self fetchNotificationsFromSource:v14 startDate:v16 endDate:v17 shouldInferMessages:v9 outError:&v49];
  objc_storeStrong(&v55, v49);
  if (a8 && (id v19 = v51[5]) != 0)
  {
    id v20 = 0;
    *a8 = v19;
  }
  else
  {
    uint64_t v43 = 0;
    v44 = &v43;
    uint64_t v45 = 0x3032000000;
    id v46 = __Block_byref_object_copy__70;
    v47 = __Block_byref_object_dispose__70;
    id v48 = 0;
    v35 = [(ATXNotificationManagementInspector *)self constructStacksForNotifications:v18];
    id v34 = v15;
    id v21 = objc_alloc(MEMORY[0x1E4F4B1B8]);
    v22 = +[ATXNotificationDigestRankerServer sharedInstance];
    v23 = (void *)[v21 initWithDigestRankerClient:v22];

    dispatch_semaphore_t v24 = dispatch_semaphore_create(0);
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __146__ATXNotificationManagementInspector_fetchSerializedNotificationDigestFromSource_digestTimeString_startDate_endDate_shouldInferMessages_outError___block_invoke;
    v39[3] = &unk_1E68B3750;
    uint64_t v41 = &v50;
    v42 = &v43;
    id v25 = v24;
    id v40 = v25;
    [v23 generateDigestForNotificationArrays:v35 reply:v39];
    double v26 = (double)(unint64_t)*MEMORY[0x1E4F4B588];
    v37[4] = self;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __146__ATXNotificationManagementInspector_fetchSerializedNotificationDigestFromSource_digestTimeString_startDate_endDate_shouldInferMessages_outError___block_invoke_2;
    v38[3] = &unk_1E68AB818;
    v38[4] = self;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __146__ATXNotificationManagementInspector_fetchSerializedNotificationDigestFromSource_digestTimeString_startDate_endDate_shouldInferMessages_outError___block_invoke_54;
    v37[3] = &unk_1E68AB818;
    [MEMORY[0x1E4F93B18] waitForSemaphore:v25 timeoutSeconds:v38 onAcquire:v37 onTimeout:v26];
    if (a8 && (id v27 = v51[5]) != 0)
    {
      id v20 = 0;
      *a8 = v27;
    }
    else
    {
      v28 = (void *)MEMORY[0x1E4F28D90];
      v29 = objc_msgSend((id)v44[5], "jsonRepresentation", v34);
      v30 = v51;
      id obj = v51[5];
      v31 = [v28 dataWithJSONObject:v29 options:1 error:&obj];
      objc_storeStrong(v30 + 5, obj);

      if (a8 && (id v32 = v51[5]) != 0)
      {
        id v20 = 0;
        *a8 = v32;
      }
      else
      {
        id v20 = (void *)[[NSString alloc] initWithData:v31 encoding:4];
      }
    }
    _Block_object_dispose(&v43, 8);

    id v15 = v34;
  }

  _Block_object_dispose(&v50, 8);
  return v20;
}

void __146__ATXNotificationManagementInspector_fetchSerializedNotificationDigestFromSource_digestTimeString_startDate_endDate_shouldInferMessages_outError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v11 = v5;
  if (a3)
  {
    uint64_t v6 = [a3 copy];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  else
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = v5;
    id v8 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v10;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __146__ATXNotificationManagementInspector_fetchSerializedNotificationDigestFromSource_digestTimeString_startDate_endDate_shouldInferMessages_outError___block_invoke_2()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v0 = __atxlog_handle_default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = (objc_class *)objc_opt_class();
    v2 = NSStringFromClass(v1);
    int v3 = 138412290;
    v4 = v2;
    _os_log_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_DEFAULT, "Successfully acquired semaphore in %@", (uint8_t *)&v3, 0xCu);
  }
}

void __146__ATXNotificationManagementInspector_fetchSerializedNotificationDigestFromSource_digestTimeString_startDate_endDate_shouldInferMessages_outError___block_invoke_54()
{
  v0 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __110__ATXNotificationManagementInspector_fetchSerializedNotificationDigestFromFileData_digestTimeString_outError___block_invoke_51_cold_1();
  }
}

- (id)fetchSerializedAppGroupedNotificationDigestFromSource:(id)a3 digestTimeString:(id)a4 startDate:(id)a5 endDate:(id)a6 shouldInferMessages:(BOOL)a7 outError:(id *)a8
{
  id v10 = [(ATXNotificationManagementInspector *)self fetchNotificationsFromSource:a3 startDate:a5 endDate:a6 shouldInferMessages:a7 outError:a8];
  if (*a8)
  {
    id v11 = 0;
  }
  else
  {
    v12 = objc_opt_new();
    v13 = [(ATXNotificationManagementInspector *)self constructStacksGroupedByAppForNotifications:v10];
    id v14 = [v12 createDigestForAppGroupedNotificationStacks:v13 maxGlobalMarqueeGroups:2 maxAppMarqueeGroups:2 outError:a8];

    if (*a8)
    {
      id v11 = 0;
    }
    else
    {
      id v15 = (void *)MEMORY[0x1E4F28D90];
      id v16 = [v14 jsonRepresentation];
      id v17 = [v15 dataWithJSONObject:v16 options:1 error:a8];

      if (*a8) {
        id v11 = 0;
      }
      else {
        id v11 = (void *)[[NSString alloc] initWithData:v17 encoding:4];
      }
    }
  }

  return v11;
}

- (id)fetchSerializedMissedNotificationRankingFromFileData:(id)a3 modeString:(id)a4 outError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v42 = 0;
  uint64_t v43 = (id *)&v42;
  uint64_t v44 = 0x3032000000;
  uint64_t v45 = __Block_byref_object_copy__70;
  id v46 = __Block_byref_object_dispose__70;
  id v47 = 0;
  id v41 = 0;
  id v10 = [(ATXNotificationManagementInspector *)self fetchNotificationsFromFileData:v8 outError:&v41];
  objc_storeStrong(&v47, v41);
  if (a5 && (id v11 = v43[5]) != 0)
  {
    v12 = 0;
    *a5 = v11;
  }
  else
  {
    v13 = [(ATXNotificationManagementInspector *)self constructStacksForNotifications:v10];
    id v14 = objc_alloc(MEMORY[0x1E4F4B1B8]);
    id v15 = +[ATXNotificationDigestRankerServer sharedInstance];
    id v16 = (void *)[v14 initWithDigestRankerClient:v15];

    uint64_t v35 = 0;
    uint64_t v36 = &v35;
    uint64_t v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__70;
    id v39 = __Block_byref_object_dispose__70;
    id v40 = 0;
    dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
    uint64_t v18 = ATXStringToMode();
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __111__ATXNotificationManagementInspector_fetchSerializedMissedNotificationRankingFromFileData_modeString_outError___block_invoke;
    v31[3] = &unk_1E68B3778;
    v33 = &v42;
    id v34 = &v35;
    id v19 = v17;
    id v32 = v19;
    [v16 generateMissedNotificationRankingForNotificationArrays:v13 atxMode:v18 reply:v31];
    double v20 = (double)(unint64_t)*MEMORY[0x1E4F4B588];
    v29[4] = self;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __111__ATXNotificationManagementInspector_fetchSerializedMissedNotificationRankingFromFileData_modeString_outError___block_invoke_2;
    v30[3] = &unk_1E68AB818;
    void v30[4] = self;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __111__ATXNotificationManagementInspector_fetchSerializedMissedNotificationRankingFromFileData_modeString_outError___block_invoke_57;
    v29[3] = &unk_1E68AB818;
    [MEMORY[0x1E4F93B18] waitForSemaphore:v19 timeoutSeconds:v30 onAcquire:v29 onTimeout:v20];
    if (a5 && (id v21 = v43[5]) != 0)
    {
      v12 = 0;
      *a5 = v21;
    }
    else
    {
      v22 = (void *)MEMORY[0x1E4F28D90];
      v23 = [(id)v36[5] jsonRepresentation];
      dispatch_semaphore_t v24 = v43;
      id obj = v43[5];
      id v25 = [v22 dataWithJSONObject:v23 options:1 error:&obj];
      objc_storeStrong(v24 + 5, obj);

      if (a5 && (id v26 = v43[5]) != 0)
      {
        v12 = 0;
        *a5 = v26;
      }
      else
      {
        v12 = (void *)[[NSString alloc] initWithData:v25 encoding:4];
      }
    }
    _Block_object_dispose(&v35, 8);
  }
  _Block_object_dispose(&v42, 8);

  return v12;
}

void __111__ATXNotificationManagementInspector_fetchSerializedMissedNotificationRankingFromFileData_modeString_outError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v11 = v5;
  if (a3)
  {
    uint64_t v6 = [a3 copy];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  else
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = v5;
    id v8 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v10;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __111__ATXNotificationManagementInspector_fetchSerializedMissedNotificationRankingFromFileData_modeString_outError___block_invoke_2()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v0 = __atxlog_handle_default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = (objc_class *)objc_opt_class();
    v2 = NSStringFromClass(v1);
    int v3 = 138412290;
    v4 = v2;
    _os_log_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_DEFAULT, "Successfully acquired semaphore in %@", (uint8_t *)&v3, 0xCu);
  }
}

void __111__ATXNotificationManagementInspector_fetchSerializedMissedNotificationRankingFromFileData_modeString_outError___block_invoke_57()
{
  v0 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __111__ATXNotificationManagementInspector_fetchSerializedMissedNotificationRankingFromFileData_modeString_outError___block_invoke_57_cold_1();
  }
}

- (id)fetchSerializedMissedNotificationRankingFromSource:(id)a3 modeString:(id)a4 startDate:(id)a5 endDate:(id)a6 shouldInferMessages:(BOOL)a7 outError:(id *)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  uint64_t v51 = 0;
  uint64_t v52 = (id *)&v51;
  uint64_t v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__70;
  id v55 = __Block_byref_object_dispose__70;
  id v56 = 0;
  id v50 = 0;
  uint64_t v18 = [(ATXNotificationManagementInspector *)self fetchNotificationsFromSource:v14 startDate:v16 endDate:v17 shouldInferMessages:v9 outError:&v50];
  objc_storeStrong(&v56, v50);
  if (a8 && (id v19 = v52[5]) != 0)
  {
    double v20 = 0;
    *a8 = v19;
  }
  else
  {
    uint64_t v35 = [(ATXNotificationManagementInspector *)self constructStacksForNotifications:v18];
    id v36 = v15;
    id v21 = objc_alloc(MEMORY[0x1E4F4B1B8]);
    v22 = +[ATXNotificationDigestRankerServer sharedInstance];
    v23 = (void *)[v21 initWithDigestRankerClient:v22];

    uint64_t v44 = 0;
    uint64_t v45 = &v44;
    uint64_t v46 = 0x3032000000;
    id v47 = __Block_byref_object_copy__70;
    id v48 = __Block_byref_object_dispose__70;
    id v49 = 0;
    dispatch_semaphore_t v24 = dispatch_semaphore_create(0);
    uint64_t v25 = ATXStringToMode();
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __147__ATXNotificationManagementInspector_fetchSerializedMissedNotificationRankingFromSource_modeString_startDate_endDate_shouldInferMessages_outError___block_invoke;
    v40[3] = &unk_1E68B3778;
    uint64_t v42 = &v51;
    uint64_t v43 = &v44;
    id v26 = v24;
    id v41 = v26;
    [v23 generateMissedNotificationRankingForNotificationArrays:v35 atxMode:v25 reply:v40];
    double v27 = (double)(unint64_t)*MEMORY[0x1E4F4B588];
    v38[4] = self;
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __147__ATXNotificationManagementInspector_fetchSerializedMissedNotificationRankingFromSource_modeString_startDate_endDate_shouldInferMessages_outError___block_invoke_2;
    v39[3] = &unk_1E68AB818;
    void v39[4] = self;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __147__ATXNotificationManagementInspector_fetchSerializedMissedNotificationRankingFromSource_modeString_startDate_endDate_shouldInferMessages_outError___block_invoke_58;
    v38[3] = &unk_1E68AB818;
    [MEMORY[0x1E4F93B18] waitForSemaphore:v26 timeoutSeconds:v39 onAcquire:v38 onTimeout:v27];
    if (a8 && (id v28 = v52[5]) != 0)
    {
      double v20 = 0;
      *a8 = v28;
    }
    else
    {
      v29 = (void *)MEMORY[0x1E4F28D90];
      v30 = objc_msgSend((id)v45[5], "jsonRepresentation", v35);
      v31 = v52;
      id obj = v52[5];
      id v32 = [v29 dataWithJSONObject:v30 options:1 error:&obj];
      objc_storeStrong(v31 + 5, obj);

      if (a8 && (id v33 = v52[5]) != 0)
      {
        double v20 = 0;
        *a8 = v33;
      }
      else
      {
        double v20 = (void *)[[NSString alloc] initWithData:v32 encoding:4];
      }
    }
    _Block_object_dispose(&v44, 8);

    id v15 = v36;
  }

  _Block_object_dispose(&v51, 8);
  return v20;
}

void __147__ATXNotificationManagementInspector_fetchSerializedMissedNotificationRankingFromSource_modeString_startDate_endDate_shouldInferMessages_outError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v11 = v5;
  if (a3)
  {
    uint64_t v6 = [a3 copy];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  else
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v10 = v5;
    id v8 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v10;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __147__ATXNotificationManagementInspector_fetchSerializedMissedNotificationRankingFromSource_modeString_startDate_endDate_shouldInferMessages_outError___block_invoke_2()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v0 = __atxlog_handle_default();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = (objc_class *)objc_opt_class();
    v2 = NSStringFromClass(v1);
    int v3 = 138412290;
    v4 = v2;
    _os_log_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_DEFAULT, "Successfully acquired semaphore in %@", (uint8_t *)&v3, 0xCu);
  }
}

void __147__ATXNotificationManagementInspector_fetchSerializedMissedNotificationRankingFromSource_modeString_startDate_endDate_shouldInferMessages_outError___block_invoke_58()
{
  v0 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __111__ATXNotificationManagementInspector_fetchSerializedMissedNotificationRankingFromFileData_modeString_outError___block_invoke_57_cold_1();
  }
}

- (id)fetchSerializedNotificationsFromSource:(id)a3 startDate:(id)a4 endDate:(id)a5 shouldInferMessages:(BOOL)a6 outError:(id *)a7
{
  id v8 = -[ATXNotificationManagementInspector fetchNotificationsFromSource:startDate:endDate:shouldInferMessages:outError:](self, "fetchNotificationsFromSource:startDate:endDate:shouldInferMessages:outError:", a3, a4, a5, a6);
  uint64_t v9 = objc_msgSend(v8, "_pas_mappedArrayWithTransform:", &__block_literal_global_152);
  id v10 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v9 options:1 error:a7];
  id v11 = (void *)[[NSString alloc] initWithData:v10 encoding:4];

  return v11;
}

uint64_t __124__ATXNotificationManagementInspector_fetchSerializedNotificationsFromSource_startDate_endDate_shouldInferMessages_outError___block_invoke(uint64_t a1, void *a2)
{
  return [a2 jsonRepresentation];
}

- (id)fetchNotificationsFromFileData:(id)a3 outError:(id *)a4
{
  uint64_t v5 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:2 error:a4];
  uint64_t v6 = v5;
  if (a4 && *a4)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    uint64_t v7 = objc_msgSend(v5, "_pas_mappedArrayWithTransform:", &__block_literal_global_62_0);
  }

  return v7;
}

id __78__ATXNotificationManagementInspector_fetchNotificationsFromFileData_outError___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F4B3F8];
  id v3 = a2;
  v4 = (void *)[[v2 alloc] initFromJSON:v3];

  return v4;
}

- (id)fetchNotificationsFromSource:(id)a3 startDate:(id)a4 endDate:(id)a5 shouldInferMessages:(BOOL)a6 outError:(id *)a7
{
  BOOL v8 = a6;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    id v15 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  id v16 = v15;
  if (v14)
  {
    id v17 = v14;
  }
  else
  {
    id v17 = [MEMORY[0x1E4F1C9C8] distantFuture];
  }
  uint64_t v18 = v17;
  if ([v12 isEqualToString:@"biome"])
  {
    id v40 = 0;
    id v19 = [(ATXNotificationManagementInspector *)self fetchNotificationsFromBiomeFromStartDate:v16 endDate:v18 outError:&v40];
    id v20 = v40;
    if (!a7) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if (![v12 isEqualToString:@"db"])
  {
    id v20 = [(ATXNotificationManagementInspector *)self logAndCreateErrorForString:@"Unknown source specified"];
    id v19 = (void *)MEMORY[0x1E4F1CBF0];
    if (!a7) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  id v19 = [(ATXNotificationManagementInspector *)self fetchNotificationsFromDbFromStartDate:v16 endDate:v18];
  id v20 = 0;
  if (a7) {
LABEL_14:
  }
    *a7 = v20;
LABEL_15:
  if (v8)
  {
    id v32 = v18;
    id v33 = v16;
    id v34 = v13;
    id v35 = v12;
    id v21 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F27F36A8];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v31 = v19;
    id v22 = v19;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v37 != v25) {
            objc_enumerationMutation(v22);
          }
          double v27 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          id v28 = [v27 bundleID];
          int v29 = [v21 containsObject:v28];

          if (v29) {
            [v27 setIsMessage:1];
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v24);
    }

    id v13 = v34;
    id v12 = v35;
    uint64_t v18 = v32;
    id v16 = v33;
    id v19 = v31;
  }

  return v19;
}

- (id)logAndCreateErrorForString:(id)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = __atxlog_handle_default();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[ATXNotificationManagementInspector logAndCreateErrorForString:]();
  }

  uint64_t v5 = *MEMORY[0x1E4F28578];
  v9[0] = *MEMORY[0x1E4F28228];
  v9[1] = v5;
  v10[0] = v3;
  v10[1] = v3;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  uint64_t v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATXNotificationManagementInspector" code:1 userInfo:v6];

  return v7;
}

- (id)fetchNotificationsFromBiomeFromStartDate:(id)a3 endDate:(id)a4 outError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F4B660]) initWithMaxSize:200];
  id v11 = objc_opt_new();
  [v8 timeIntervalSinceReferenceDate];
  id v12 = objc_msgSend(v11, "publisherFromStartTime:");

  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__70;
  int v29 = __Block_byref_object_dispose__70;
  id v30 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __96__ATXNotificationManagementInspector_fetchNotificationsFromBiomeFromStartDate_endDate_outError___block_invoke;
  v24[3] = &unk_1E68B37E0;
  v24[4] = self;
  v24[5] = &v25;
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  id v20 = __96__ATXNotificationManagementInspector_fetchNotificationsFromBiomeFromStartDate_endDate_outError___block_invoke_82;
  id v21 = &unk_1E68B3808;
  id v13 = v9;
  id v22 = v13;
  id v14 = v10;
  id v23 = v14;
  id v15 = (id)[v12 sinkWithCompletion:v24 shouldContinue:&v18];
  if (a5) {
    *a5 = (id) v26[5];
  }
  id v16 = objc_msgSend(v14, "toArray", v18, v19, v20, v21);

  _Block_object_dispose(&v25, 8);
  return v16;
}

void __96__ATXNotificationManagementInspector_fetchNotificationsFromBiomeFromStartDate_endDate_outError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state] == 1)
  {
    v4 = __atxlog_handle_default();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __96__ATXNotificationManagementInspector_fetchNotificationsFromBiomeFromStartDate_endDate_outError___block_invoke_cold_1(a1, v3);
    }

    uint64_t v5 = [v3 error];
    uint64_t v6 = [v5 copy];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

BOOL __96__ATXNotificationManagementInspector_fetchNotificationsFromBiomeFromStartDate_endDate_outError___block_invoke_82(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 timestamp];
  double v5 = v4;
  [*(id *)(a1 + 32) timeIntervalSinceReferenceDate];
  double v7 = v6;
  if (v5 <= v6)
  {
    id v8 = [v3 eventBody];
    if ([v8 isReceiveEvent])
    {
      id v9 = [v8 notification];

      if (v9)
      {
        id v10 = *(void **)(a1 + 40);
        id v11 = [v8 notification];
        [v10 addObject:v11];
      }
    }
  }
  return v5 <= v7;
}

- (id)fetchNotificationsFromDbFromStartDate:(id)a3 endDate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  double v7 = objc_opt_new();
  [v7 updateDatabase];
  id v8 = [v7 allNotificationsBetweenStartTimestamp:v6 endTimestamp:v5 limit:200];

  return v8;
}

- (id)constructStacksForNotifications:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  double v4 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v10 = NSString;
        id v11 = [v9 bundleID];
        id v12 = [v9 threadID];
        id v13 = [v10 stringWithFormat:@"(%@, %@)", v11, v12];

        id v14 = [v4 objectForKeyedSubscript:v13];

        if (!v14)
        {
          id v15 = objc_opt_new();
          [v4 setObject:v15 forKeyedSubscript:v13];
        }
        id v16 = [v4 objectForKeyedSubscript:v13];
        [v16 addObject:v9];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }

  id v17 = [v4 allValues];

  return v17;
}

- (id)constructStacksGroupedByAppForNotifications:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = [(ATXNotificationManagementInspector *)self constructStacksForNotifications:a3];
  double v4 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v23;
    *(void *)&long long v7 = 138412290;
    long long v21 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "firstObject", v21, (void)v22);
        id v13 = [v12 bundleID];

        if (v13)
        {
          id v14 = [v4 objectForKeyedSubscript:v13];

          if (!v14)
          {
            id v15 = objc_opt_new();
            [v4 setObject:v15 forKeyedSubscript:v13];
          }
          id v16 = [v4 objectForKeyedSubscript:v13];
          [v16 addObject:v11];
        }
        else
        {
          id v16 = __atxlog_handle_notification_management();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            id v17 = (objc_class *)objc_opt_class();
            uint64_t v18 = NSStringFromClass(v17);
            *(_DWORD *)buf = v21;
            uint64_t v27 = v18;
            _os_log_impl(&dword_1D0FA3000, v16, OS_LOG_TYPE_INFO, "[%@] Missing bundle ID for stack", buf, 0xCu);
          }
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v8);
  }

  uint64_t v19 = [v4 allValues];

  return v19;
}

void __110__ATXNotificationManagementInspector_fetchSerializedNotificationDigestFromFileData_digestTimeString_outError___block_invoke_51_cold_1()
{
  v0 = (objc_class *)OUTLINED_FUNCTION_2_8();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1D0FA3000, v2, v3, "%@ - timed out trying to get digest", v4, v5, v6, v7, v8);
}

void __111__ATXNotificationManagementInspector_fetchSerializedMissedNotificationRankingFromFileData_modeString_outError___block_invoke_57_cold_1()
{
  v0 = (objc_class *)OUTLINED_FUNCTION_2_8();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1D0FA3000, v2, v3, "%@ - timed out trying to get missed notification ranking", v4, v5, v6, v7, v8);
}

- (void)logAndCreateErrorForString:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_0(&dword_1D0FA3000, v2, v3, "[%@] Error: %@", v4, v5, v6, v7, v8);
}

void __96__ATXNotificationManagementInspector_fetchNotificationsFromBiomeFromStartDate_endDate_outError___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)OUTLINED_FUNCTION_2_8();
  uint64_t v4 = NSStringFromClass(v3);
  uint64_t v5 = [a2 error];
  id v12 = [v5 localizedDescription];
  OUTLINED_FUNCTION_1_0(&dword_1D0FA3000, v6, v7, "[%@] Failed to fetch Biome events with error %@", v8, v9, v10, v11, 2u);
}

@end