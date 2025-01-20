@interface HUFaceRecognitionRecentEventsItemProvider
+ (BOOL)prefersNonBlockingReloads;
+ (id)_coalescedItems:(id)a3;
+ (id)cameraSignificantEventDateComparator;
- (HMHome)home;
- (HUFaceRecognitionRecentEventsItemProvider)initWithHome:(id)a3;
- (NSDateInterval)dateRange;
- (NSMutableSet)personItems;
- (id)invalidationReasons;
- (id)reloadItems;
- (unint64_t)fetchLimit;
- (void)setDateRange:(id)a3;
- (void)setFetchLimit:(unint64_t)a3;
- (void)setHome:(id)a3;
- (void)setPersonItems:(id)a3;
@end

@implementation HUFaceRecognitionRecentEventsItemProvider

+ (BOOL)prefersNonBlockingReloads
{
  return 1;
}

- (HUFaceRecognitionRecentEventsItemProvider)initWithHome:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HUFaceRecognitionRecentEventsItemProvider;
  v6 = [(HFItemProvider *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
    personItems = v7->_personItems;
    v7->_personItems = (NSMutableSet *)v8;

    v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:-604800.0];
    id v11 = objc_alloc(MEMORY[0x1E4F28C18]);
    v12 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v13 = [v11 initWithStartDate:v10 endDate:v12];
    dateRange = v7->_dateRange;
    v7->_dateRange = (NSDateInterval *)v13;

    v7->_fetchLimit = 1000;
  }

  return v7;
}

- (id)reloadItems
{
  v3 = [(HUFaceRecognitionRecentEventsItemProvider *)self home];
  v4 = objc_msgSend(v3, "hf_allCameraProfilesSupportingRecording");

  id v5 = objc_msgSend(v4, "na_map:", &__block_literal_global_207);
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__27;
  v14[4] = __Block_byref_object_dispose__27;
  id v15 = [MEMORY[0x1E4F1CA80] set];
  v6 = (void *)MEMORY[0x1E4F7A0D8];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__HUFaceRecognitionRecentEventsItemProvider_reloadItems__block_invoke_4;
  v13[3] = &unk_1E638EF30;
  v13[4] = self;
  v13[5] = v14;
  v7 = objc_msgSend(v5, "na_map:", v13);
  uint64_t v8 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
  v9 = [v6 combineAllFutures:v7 ignoringErrors:1 scheduler:v8];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__HUFaceRecognitionRecentEventsItemProvider_reloadItems__block_invoke_12;
  v12[3] = &unk_1E638EF78;
  v12[4] = self;
  v12[5] = v14;
  v10 = [v9 flatMap:v12];

  _Block_object_dispose(v14, 8);

  return v10;
}

uint64_t __56__HUFaceRecognitionRecentEventsItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  return [a2 clipManager];
}

id __56__HUFaceRecognitionRecentEventsItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)MEMORY[0x1E4F7A0D8];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__HUFaceRecognitionRecentEventsItemProvider_reloadItems__block_invoke_2;
  v14[3] = &unk_1E6385D90;
  v14[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v15 = v5;
  v6 = [v4 futureWithBlock:v14];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__HUFaceRecognitionRecentEventsItemProvider_reloadItems__block_invoke_5;
  v11[3] = &unk_1E638EF08;
  uint64_t v7 = *(void *)(a1 + 40);
  id v12 = v5;
  uint64_t v13 = v7;
  id v8 = v5;
  id v9 = (id)[v6 addCompletionBlock:v11];

  return v6;
}

void __56__HUFaceRecognitionRecentEventsItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) dateRange];

  id v5 = *(void **)(a1 + 40);
  if (v4)
  {
    v6 = [*(id *)(a1 + 32) dateRange];
    uint64_t v7 = [*(id *)(a1 + 32) fetchLimit];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __56__HUFaceRecognitionRecentEventsItemProvider_reloadItems__block_invoke_4;
    v11[3] = &unk_1E63851B0;
    id v8 = &v12;
    id v12 = v3;
    id v9 = v3;
    [v5 fetchSignificantEventsWithDateInterval:v6 limit:v7 shouldOrderAscending:0 completion:v11];
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __56__HUFaceRecognitionRecentEventsItemProvider_reloadItems__block_invoke_3;
    v13[3] = &unk_1E6389828;
    id v8 = &v14;
    id v14 = v3;
    id v10 = v3;
    [v5 fetchAllSignificantEventsWithCompletion:v13];
  }
}

uint64_t __56__HUFaceRecognitionRecentEventsItemProvider_reloadItems__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithResult:a2 error:a3];
}

void __56__HUFaceRecognitionRecentEventsItemProvider_reloadItems__block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = a3;
  id v7 = [v5 setWithArray:a2];
  [v4 finishWithResult:v7 error:v6];
}

void __56__HUFaceRecognitionRecentEventsItemProvider_reloadItems__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v11 = 138412546;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_error_impl(&dword_1BE345000, v7, OS_LOG_TYPE_ERROR, "Error on clip manager %@ fetching significant events %@", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    objc_opt_class();
    id v9 = v5;
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }
    id v7 = v10;

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) unionSet:v7];
  }
}

id __56__HUFaceRecognitionRecentEventsItemProvider_reloadItems__block_invoke_12(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "na_filter:", &__block_literal_global_16_4);
  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count];
    *(_DWORD *)buf = 134218240;
    uint64_t v14 = v10;
    __int16 v15 = 2048;
    uint64_t v16 = [v2 count];
    _os_log_debug_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEBUG, "Recent Events reload: %lu significant events %lu have face classifications", buf, 0x16u);
  }

  v4 = *(void **)(a1 + 32);
  id v5 = [v2 allObjects];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__HUFaceRecognitionRecentEventsItemProvider_reloadItems__block_invoke_17;
  v12[3] = &unk_1E638A780;
  v12[4] = *(void *)(a1 + 32);
  id v6 = [v4 reloadItemsWithHomeKitObjects:v5 filter:0 itemMap:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__HUFaceRecognitionRecentEventsItemProvider_reloadItems__block_invoke_2_21;
  v11[3] = &unk_1E6388A88;
  void v11[4] = *(void *)(a1 + 32);
  id v7 = [v6 flatMap:v11];
  uint64_t v8 = [v7 recover:&__block_literal_global_28_1];

  return v8;
}

BOOL __56__HUFaceRecognitionRecentEventsItemProvider_reloadItems__block_invoke_2_13(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = [v2 faceClassification];

  if (!v3)
  {
    v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 138412290;
      id v7 = v2;
      _os_log_debug_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEBUG, "No face classification, skipping event %@", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3 != 0;
}

id __56__HUFaceRecognitionRecentEventsItemProvider_reloadItems__block_invoke_17(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  id v7 = [v6 faceClassification];

  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F69140]);
    id v9 = [*(id *)(a1 + 32) home];
    uint64_t v10 = (void *)[v8 initWithSignificantEvent:v6 home:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

id __56__HUFaceRecognitionRecentEventsItemProvider_reloadItems__block_invoke_2_21(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  id v6 = [v5 addedItems];
  id v7 = [v5 existingItems];
  id v8 = [v6 setByAddingObjectsFromSet:v7];
  v23 = [v8 allObjects];

  id v9 = +[HUFaceRecognitionRecentEventsItemProvider _coalescedItems:v23];
  uint64_t v10 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
  int v11 = [v5 addedItems];
  uint64_t v12 = objc_msgSend(v10, "na_setByIntersectingWithSet:", v11);

  __int16 v13 = [v5 existingItems];
  uint64_t v14 = objc_msgSend(v13, "na_setByRemovingObjectsFromSet:", v10);

  __int16 v15 = [v5 existingItems];
  uint64_t v16 = (void *)[v15 mutableCopy];

  [v16 minusSet:v14];
  uint64_t v17 = [v5 removedItems];
  v18 = (void *)[v17 mutableCopy];

  [v18 unionSet:v14];
  v19 = (void *)[objc_alloc(MEMORY[0x1E4F69210]) initWithAddedItems:v12 removedItems:v18 existingItems:v16];
  v20 = (void *)[v10 mutableCopy];
  [*(id *)(a1 + 32) setPersonItems:v20];

  v21 = [MEMORY[0x1E4F7A0D8] futureWithResult:v19];

  return v21;
}

id __56__HUFaceRecognitionRecentEventsItemProvider_reloadItems__block_invoke_3_25(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412290;
    id v7 = v2;
    _os_log_error_impl(&dword_1BE345000, v3, OS_LOG_TYPE_ERROR, "Recent Events person fetch failed with error %@", (uint8_t *)&v6, 0xCu);
  }

  id v4 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];

  return v4;
}

+ (id)_coalescedItems:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[HUFaceRecognitionRecentEventsItemProvider cameraSignificantEventDateComparator];
  id v5 = [v3 sortedArrayUsingComparator:v4];

  int v6 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v5, "count"));
  id v7 = [MEMORY[0x1E4F28E60] indexSet];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __61__HUFaceRecognitionRecentEventsItemProvider__coalescedItems___block_invoke;
  v18 = &unk_1E638EFC0;
  id v19 = v6;
  id v8 = v7;
  id v20 = v8;
  id v9 = v6;
  [v5 enumerateObjectsUsingBlock:&v15];
  uint64_t v10 = objc_msgSend(v5, "objectsAtIndexes:", v8, v15, v16, v17, v18);
  int v11 = HFLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = [v5 count];
    uint64_t v14 = [v10 count];
    *(_DWORD *)buf = 134218240;
    uint64_t v22 = v13;
    __int16 v23 = 2048;
    uint64_t v24 = v14;
    _os_log_debug_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEBUG, "Reduced events from %lu to %lu", buf, 0x16u);
  }

  return v10;
}

void __61__HUFaceRecognitionRecentEventsItemProvider__coalescedItems___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  objc_opt_class();
  id v6 = v5;
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  id v9 = [v8 person];
  uint64_t v10 = [v9 UUID];

  int v11 = [v8 person];
  uint64_t v12 = [v11 personLinks];

  uint64_t v13 = objc_msgSend(v12, "na_map:", &__block_literal_global_32_0);
  if (!v10) {
    goto LABEL_11;
  }
  if (([*(id *)(a1 + 32) containsObject:v10] & 1) == 0
    && ![*(id *)(a1 + 32) intersectsSet:v13])
  {
    [*(id *)(a1 + 32) addObject:v10];
    [*(id *)(a1 + 32) unionSet:v13];
LABEL_11:
    [*(id *)(a1 + 40) addIndex:a3];
    goto LABEL_12;
  }
  uint64_t v14 = HFLogForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = [v6 latestResults];
    uint64_t v16 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F688C0]];
    int v17 = 138412546;
    v18 = v16;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_debug_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEBUG, "Ignoring later event %@ %@", (uint8_t *)&v17, 0x16u);
  }
LABEL_12:
}

uint64_t __61__HUFaceRecognitionRecentEventsItemProvider__coalescedItems___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 personUUID];
}

- (id)invalidationReasons
{
  v5.receiver = self;
  v5.super_class = (Class)HUFaceRecognitionRecentEventsItemProvider;
  id v2 = [(HFItemProvider *)&v5 invalidationReasons];
  id v3 = [v2 setByAddingObject:*MEMORY[0x1E4F686D0]];

  return v3;
}

+ (id)cameraSignificantEventDateComparator
{
  return &__block_literal_global_38_3;
}

uint64_t __81__HUFaceRecognitionRecentEventsItemProvider_cameraSignificantEventDateComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  objc_opt_class();
  id v6 = v4;
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  objc_opt_class();
  id v9 = v5;
  if (objc_opt_isKindOfClass()) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  id v30 = v10;

  objc_opt_class();
  id v11 = v6;
  if (objc_opt_isKindOfClass()) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = v12;

  objc_opt_class();
  id v14 = v9;
  if (objc_opt_isKindOfClass()) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }
  id v16 = v15;

  int v17 = [v8 latestResults];
  uint64_t v18 = *MEMORY[0x1E4F688C0];
  __int16 v19 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F688C0]];
  id v20 = v19;
  v31 = v8;
  if (v19)
  {
    id v21 = v19;
  }
  else
  {
    uint64_t v22 = [v13 event];
    id v21 = [v22 dateOfOccurrence];
  }
  __int16 v23 = [v30 latestResults];
  uint64_t v24 = [v23 objectForKeyedSubscript:v18];
  uint64_t v25 = v24;
  if (v24)
  {
    id v26 = v24;
  }
  else
  {
    v27 = [v16 event];
    id v26 = [v27 dateOfOccurrence];
  }
  if (v21) {
    uint64_t v28 = -1;
  }
  else {
    uint64_t v28 = v26 != 0;
  }
  if (v21 && v26) {
    uint64_t v28 = [v26 compare:v21];
  }

  return v28;
}

- (NSDateInterval)dateRange
{
  return self->_dateRange;
}

- (void)setDateRange:(id)a3
{
}

- (unint64_t)fetchLimit
{
  return self->_fetchLimit;
}

- (void)setFetchLimit:(unint64_t)a3
{
  self->_fetchLimit = a3;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (NSMutableSet)personItems
{
  return self->_personItems;
}

- (void)setPersonItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personItems, 0);
  objc_storeStrong((id *)&self->_home, 0);

  objc_storeStrong((id *)&self->_dateRange, 0);
}

@end