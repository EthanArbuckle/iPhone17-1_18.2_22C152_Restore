@interface ATXDynamicBreakthroughFeaturesCorrelator
- (ATXDynamicBreakthroughFeaturesCorrelator)init;
- (double)appCategoryScoreForNotification:(id)a3 inCurrentMode:(unint64_t)a4;
- (double)appModeAffinityScoreForNotification:(id)a3 inCurrentMode:(unint64_t)a4;
- (double)contactModeAffinityScoreForNotification:(id)a3 inCurrentMode:(unint64_t)a4;
- (double)notificationModeAffinityScoreForNotification:(id)a3 inCurrentMode:(unint64_t)a4;
- (id)collectDynamicBreakthroughFeaturesForNotification:(id)a3 contactStore:(id)a4 withContactRelationships:(id)a5;
- (int)currentLocationSemanticForGivenDate:(id)a3;
- (unint64_t)_contactRelationshipsFromNotification:(id)a3 contactStore:(id)a4 withRelationships:(id)a5;
- (void)refreshMegadomeRelationshipsIfNeeded:(id)a3;
@end

@implementation ATXDynamicBreakthroughFeaturesCorrelator

- (ATXDynamicBreakthroughFeaturesCorrelator)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXDynamicBreakthroughFeaturesCorrelator;
  v2 = [(ATXDynamicBreakthroughFeaturesCorrelator *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    resolutionAccumulator = v2->_resolutionAccumulator;
    v2->_resolutionAccumulator = (ATXNotificationResolutionAccumulator *)v3;
  }
  return v2;
}

- (unint64_t)_contactRelationshipsFromNotification:(id)a3 contactStore:(id)a4 withRelationships:(id)a5
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  v9 = [a3 contactIDs];
  v10 = [v9 firstObject];

  if (v10)
  {
    v11 = [v8 cnContactIdsOfEmergencyContacts];
    unsigned int v12 = [v11 containsObject:v10];

    unint64_t v13 = v12;
    v14 = [v8 cnContactIdsOfFavoriteContacts];
    int v15 = [v14 containsObject:v10];

    if (v15) {
      v13 |= 2uLL;
    }
    v16 = [v8 cnContactIdsOfICloudFamilyMembers];
    int v17 = [v16 containsObject:v10];

    if (v17) {
      unint64_t v18 = v13 | 4;
    }
    else {
      unint64_t v18 = v13;
    }
    v40[0] = *MEMORY[0x1E4F1ADC8];
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
    id v38 = 0;
    v20 = [v7 unifiedContactWithIdentifier:v10 keysToFetch:v19 error:&v38];
    id v21 = v38;

    if (v21)
    {
      v22 = __atxlog_handle_notification_categorization();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[ATXDynamicBreakthroughFeaturesCorrelator _contactRelationshipsFromNotification:contactStore:withRelationships:]((uint64_t)v21, v22);
      }
    }
    else
    {
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      v22 = [v20 emailAddresses];
      uint64_t v23 = [v22 countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        v32 = v20;
        id v33 = v7;
        uint64_t v25 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v35 != v25) {
              objc_enumerationMutation(v22);
            }
            v27 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            v28 = [v8 vipContactEmailAddresses];
            v29 = [v27 value];
            int v30 = [v28 containsObject:v29];

            if (v30) {
              v18 |= 8uLL;
            }
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v34 objects:v39 count:16];
        }
        while (v24);
        v20 = v32;
        id v7 = v33;
        id v21 = 0;
      }
    }
  }
  else
  {
    unint64_t v18 = 16;
  }

  return v18;
}

- (int)currentLocationSemanticForGivenDate:(id)a3
{
  id v3 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  unint64_t v18 = __Block_byref_object_copy__6;
  v19 = __Block_byref_object_dispose__6;
  id v20 = 0;
  v4 = BiomeLibrary();
  v5 = [v4 Location];
  objc_super v6 = [v5 Semantic];
  id v7 = objc_msgSend(v6, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", v3, 0, &unk_1F27F00A8, 0, 1);

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __80__ATXDynamicBreakthroughFeaturesCorrelator_currentLocationSemanticForGivenDate___block_invoke_16;
  v14[3] = &unk_1E68AC8E8;
  v14[4] = &v15;
  id v8 = (id)[v7 sinkWithCompletion:&__block_literal_global_20 shouldContinue:v14];
  LODWORD(v4) = [(id)v16[5] userSpecificPlaceType];
  LODWORD(v5) = [(id)v16[5] userSpecificPlaceType];
  int v9 = [(id)v16[5] userSpecificPlaceType];
  int v10 = [(id)v16[5] userSpecificPlaceType];
  int v11 = v4 == 1;
  if (v5 == 2) {
    int v11 = 2;
  }
  if (v9 == 4) {
    int v11 = 3;
  }
  if (v10 == 3) {
    int v12 = 4;
  }
  else {
    int v12 = v11;
  }

  _Block_object_dispose(&v15, 8);
  return v12;
}

void __80__ATXDynamicBreakthroughFeaturesCorrelator_currentLocationSemanticForGivenDate___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 error];

  if (v3)
  {
    v4 = __atxlog_handle_notification_categorization();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __80__ATXDynamicBreakthroughFeaturesCorrelator_currentLocationSemanticForGivenDate___block_invoke_cold_1(v2, v4);
    }
  }
}

uint64_t __80__ATXDynamicBreakthroughFeaturesCorrelator_currentLocationSemanticForGivenDate___block_invoke_16(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 eventBody];
  int v5 = [v4 starting];

  if (v5)
  {
    uint64_t v6 = [v3 eventBody];
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  return 0;
}

- (double)appCategoryScoreForNotification:(id)a3 inCurrentMode:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 bundleID];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    id v8 = objc_opt_new();
    int v9 = [v5 bundleID];
    int v10 = [v8 appEntityForBundleId:v9];

    if (v10)
    {
      int v11 = objc_msgSend(v10, "affinityVector_v2");
      [v11 scoreForMode:a4];
      double v13 = v12;
    }
    else
    {
      double v13 = 0.0;
    }
  }
  else
  {
    double v13 = 0.0;
  }

  return v13;
}

- (double)appModeAffinityScoreForNotification:(id)a3 inCurrentMode:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = (double *)&v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  uint64_t v6 = +[ATXModeEntityScorerServer sharedInstance];
  uint64_t v7 = [v6 rankedAppsForMode:a4];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __94__ATXDynamicBreakthroughFeaturesCorrelator_appModeAffinityScoreForNotification_inCurrentMode___block_invoke;
  v11[3] = &unk_1E68AC910;
  id v8 = v5;
  id v12 = v8;
  double v13 = &v14;
  [v7 enumerateObjectsUsingBlock:v11];
  double v9 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __94__ATXDynamicBreakthroughFeaturesCorrelator_appModeAffinityScoreForNotification_inCurrentMode___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  uint64_t v6 = [v11 bundleId];
  uint64_t v7 = [*(id *)(a1 + 32) bundleID];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    double v9 = [v11 scoreMetadata];
    [v9 score];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v10;

    *a4 = 1;
  }
}

- (double)contactModeAffinityScoreForNotification:(id)a3 inCurrentMode:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = (double *)&v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  uint64_t v6 = [v5 contactIDs];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    int v8 = +[ATXModeEntityScorerServer sharedInstance];
    double v9 = [v8 rankedContactsForMode:a4 options:1];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __98__ATXDynamicBreakthroughFeaturesCorrelator_contactModeAffinityScoreForNotification_inCurrentMode___block_invoke;
    v12[3] = &unk_1E68AC938;
    id v13 = v5;
    uint64_t v14 = &v15;
    [v9 enumerateObjectsUsingBlock:v12];
  }
  double v10 = v16[3];
  _Block_object_dispose(&v15, 8);

  return v10;
}

void __98__ATXDynamicBreakthroughFeaturesCorrelator_contactModeAffinityScoreForNotification_inCurrentMode___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  uint64_t v6 = [v12 identifier];
  uint64_t v7 = [*(id *)(a1 + 32) contactIDs];
  int v8 = [v7 firstObject];
  int v9 = [v6 isEqualToString:v8];

  if (v9)
  {
    double v10 = [v12 scoreMetadata];
    [v10 score];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v11;

    *a4 = 1;
  }
}

- (double)notificationModeAffinityScoreForNotification:(id)a3 inCurrentMode:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = (double *)&v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  uint64_t v6 = +[ATXModeEntityScorerServer sharedInstance];
  uint64_t v7 = [v6 rankedNotificationsForMode:a4 options:1];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __103__ATXDynamicBreakthroughFeaturesCorrelator_notificationModeAffinityScoreForNotification_inCurrentMode___block_invoke;
  v11[3] = &unk_1E68AC960;
  id v8 = v5;
  id v12 = v8;
  id v13 = &v14;
  [v7 enumerateObjectsUsingBlock:v11];
  double v9 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __103__ATXDynamicBreakthroughFeaturesCorrelator_notificationModeAffinityScoreForNotification_inCurrentMode___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v20 = a2;
  uint64_t v6 = [v20 appEntity];
  uint64_t v7 = [v6 bundleId];
  id v8 = [*(id *)(a1 + 32) bundleID];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    double v10 = [*(id *)(a1 + 32) contactIDs];
    uint64_t v11 = [v10 count];

    if (!v11) {
      goto LABEL_5;
    }
    id v12 = [v20 contactEntity];

    if (v12)
    {
      id v13 = [v20 contactEntity];
      uint64_t v14 = [v13 identifier];
      uint64_t v15 = [*(id *)(a1 + 32) contactIDs];
      uint64_t v16 = [v15 firstObject];
      int v17 = [v14 isEqualToString:v16];

      if (v17)
      {
LABEL_5:
        uint64_t v18 = [v20 scoreMetadata];
        [v18 score];
        *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v19;

        *a4 = 1;
      }
    }
  }
}

- (void)refreshMegadomeRelationshipsIfNeeded:(id)a3
{
  uint64_t v4 = +[ATXNotificationCategorizationUtils megadomeEntityIDFromNotification:a3];
  megadomeEntityIDFromLastNotification = self->_megadomeEntityIDFromLastNotification;
  id obj = (id)v4;
  if (!megadomeEntityIDFromLastNotification
    || (BOOL v6 = -[NSString isEqualToString:](megadomeEntityIDFromLastNotification, "isEqualToString:"), v7 = obj, !v6))
  {
    objc_storeStrong((id *)&self->_megadomeEntityIDFromLastNotification, obj);
    id v8 = +[ATXNotificationCategorizationUtils megadomePersonRelationshipFromEntityID:self->_megadomeEntityIDFromLastNotification];
    megadomeRelationshipsFromLastNotification = self->_megadomeRelationshipsFromLastNotification;
    self->_megadomeRelationshipsFromLastNotification = v8;

    uint64_t v7 = obj;
  }
}

- (id)collectDynamicBreakthroughFeaturesForNotification:(id)a3 contactStore:(id)a4 withContactRelationships:(id)a5
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = __atxlog_handle_notification_categorization();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = "-[ATXDynamicBreakthroughFeaturesCorrelator collectDynamicBreakthroughFeaturesForNotification:co"
                         "ntactStore:withContactRelationships:]";
    _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, "Starting %s", buf, 0xCu);
  }

  id v12 = (void *)MEMORY[0x1E4F1C9C8];
  [v8 timestamp];
  uint64_t v13 = objc_msgSend(v12, "dateWithTimeIntervalSinceReferenceDate:");
  uint64_t v14 = +[ATXUnifiedComputedAndInferredModeStream currentUnifiedModeEventAtGivenTime:v13];
  uint64_t v15 = [v14 mode];

  [(ATXDynamicBreakthroughFeaturesCorrelator *)self refreshMegadomeRelationshipsIfNeeded:v8];
  uint64_t v16 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v52 = [v16 components:512 fromDate:v13];
  uint64_t v51 = [v52 weekday];
  v53 = v16;
  *(void *)buf = 0;
  [v16 getHour:buf minute:0 second:0 nanosecond:0 fromDate:v13];
  if (*(void *)buf > 0x17uLL)
  {
    uint64_t v19 = __atxlog_handle_notification_categorization();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[ATXDynamicBreakthroughFeaturesCorrelator collectDynamicBreakthroughFeaturesForNotification:contactStore:withContactRelationships:](v19);
    }

    unsigned int v50 = 0;
  }
  else
  {
    if (*(void *)buf < 0x11uLL) {
      int v17 = 2;
    }
    else {
      int v17 = 3;
    }
    if (*(void *)buf >= 0xCuLL) {
      int v18 = v17;
    }
    else {
      int v18 = 1;
    }
    unsigned int v50 = v18;
  }
  uint64_t v20 = [v8 bodyLength];
  unint64_t v21 = 10 * (v20 / 10);
  if (v20 % 10 >= 5) {
    v21 += 10;
  }
  if (v21 <= 0xA) {
    unint64_t v21 = 10;
  }
  unint64_t v49 = v21;
  [(ATXNotificationResolutionAccumulator *)self->_resolutionAccumulator computeFeaturesForNotification:v8 mode:v15];
  id v48 = objc_alloc(MEMORY[0x1E4F4B1A0]);
  v47 = [v8 bundleID];
  uint64_t v46 = [v8 urgency];
  unint64_t v45 = [(ATXDynamicBreakthroughFeaturesCorrelator *)self _contactRelationshipsFromNotification:v8 contactStore:v10 withRelationships:v9];

  megadomeRelationshipsFromLastNotification = self->_megadomeRelationshipsFromLastNotification;
  int v43 = [(ATXDynamicBreakthroughFeaturesCorrelator *)self currentLocationSemanticForGivenDate:v13];
  [(ATXDynamicBreakthroughFeaturesCorrelator *)self appModeAffinityScoreForNotification:v8 inCurrentMode:v15];
  double v23 = v22;
  [(ATXDynamicBreakthroughFeaturesCorrelator *)self contactModeAffinityScoreForNotification:v8 inCurrentMode:v15];
  double v25 = v24;
  [(ATXDynamicBreakthroughFeaturesCorrelator *)self notificationModeAffinityScoreForNotification:v8 inCurrentMode:v15];
  double v27 = v26;
  [(ATXDynamicBreakthroughFeaturesCorrelator *)self appCategoryScoreForNotification:v8 inCurrentMode:v15];
  double v29 = v28;
  unint64_t v40 = [(ATXNotificationResolutionAccumulator *)self->_resolutionAccumulator timeToLaunchApp];
  v42 = [(ATXNotificationResolutionAccumulator *)self->_resolutionAccumulator historicalResolutionsForNotification];
  int v30 = [v42 historicalVolumeByCountAndPercentage];
  v31 = [(ATXNotificationResolutionAccumulator *)self->_resolutionAccumulator historicalResolutionsForNotification];
  v32 = [v31 modeConditionedHistoricalVolumeByCountAndPercentage];
  id v33 = [(ATXNotificationResolutionAccumulator *)self->_resolutionAccumulator historicalResolutionsForNotification];
  [v33 historicalResolutionByPercentage];
  long long v34 = v41 = (void *)v13;
  long long v35 = [(ATXNotificationResolutionAccumulator *)self->_resolutionAccumulator historicalResolutionsForNotification];
  long long v36 = [v35 modeConditionedHistoricalResolutionByPercentage];
  LODWORD(v39) = v43;
  long long v37 = objc_msgSend(v48, "initWithBundleID:notificationDeliveryUrgency:contactRelationships:relationshipsFromMegadome:dayOfWeek:timeOfDay:locationSemantic:appModeAffinityScore:contactModeAffinityScore:notificationModeAffinityScore:appCategoryScoreInMode:urgencyScore:importanceScore:bucketizedLengthOfNotificationBody:currentMode:timeToLaunchApp:historicalVolumeByCountAndPercentage:modeConditionedHistoricalVolumeByCountAndPercentage:historicalResolutionByPercentage:modeConditionedHistoricalResolutionByPercentage:", v47, v46, v45, megadomeRelationshipsFromLastNotification, v51, v50, v23, v25, v27, v29, 0.0, 0.0, v39,
                  v49,
                  v15,
                  v40,
                  v30,
                  v32,
                  v34,
                  v36);

  return v37;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolutionAccumulator, 0);
  objc_storeStrong((id *)&self->_megadomeRelationshipsFromLastNotification, 0);
  objc_storeStrong((id *)&self->_megadomeEntityIDFromLastNotification, 0);
}

- (void)_contactRelationshipsFromNotification:(uint64_t)a1 contactStore:(NSObject *)a2 withRelationships:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXDynamicBreakthroughFeaturesCorrelator: Error fetching unified contact email addresses: %@", (uint8_t *)&v2, 0xCu);
}

void __80__ATXDynamicBreakthroughFeaturesCorrelator_currentLocationSemanticForGivenDate___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 error];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXDynamicBreakthroughFeaturesCorrelator: Error fetching last location event: %@", (uint8_t *)&v4, 0xCu);
}

- (void)collectDynamicBreakthroughFeaturesForNotification:(os_log_t)log contactStore:withContactRelationships:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "ATXDynamicBreakthroughFeaturesCorrelator: NSDateFormatter returned out of bounds hour for notification date", v1, 2u);
}

@end