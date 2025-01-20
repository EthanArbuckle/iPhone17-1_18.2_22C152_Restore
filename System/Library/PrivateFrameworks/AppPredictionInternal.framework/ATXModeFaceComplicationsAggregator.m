@interface ATXModeFaceComplicationsAggregator
- (id)provideComplicationsForSuggestedFaceType:(int64_t)a3 environment:(id)a4;
- (id)provideLandscapeComplicationsForSuggestedFaceType:(int64_t)a3 environment:(id)a4;
@end

@implementation ATXModeFaceComplicationsAggregator

- (id)provideComplicationsForSuggestedFaceType:(int64_t)a3 environment:(id)a4
{
  v34[3] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if ([MEMORY[0x1E4F93B08] isBetaBuild]) {
    int v6 = 1;
  }
  else {
    int v6 = [MEMORY[0x1E4F93B08] isInternalBuild];
  }
  v7 = objc_opt_new();
  v8 = objc_opt_new();
  v9 = objc_opt_new();
  v10 = objc_opt_new();
  uint64_t v11 = MEMORY[0x1E4F1CBF0];
  v12 = v8;
  if (v6)
  {
    uint64_t v13 = [v7 provideComplicationsForSuggestedFaceType:a3 environment:v5];
    v14 = (void *)v13;
    if (v13) {
      uint64_t v15 = v13;
    }
    else {
      uint64_t v15 = v11;
    }
    [v10 addObjectsFromArray:v15];

    uint64_t v16 = [v8 provideComplicationsForSuggestedFaceType:a3 environment:v5];
    v17 = (void *)v16;
    if (v16) {
      uint64_t v18 = v16;
    }
    else {
      uint64_t v18 = v11;
    }
    [v10 addObjectsFromArray:v18];

    v12 = v9;
  }
  uint64_t v19 = [v12 provideComplicationsForSuggestedFaceType:a3 environment:v5];
  v20 = (void *)v19;
  if (v19) {
    uint64_t v21 = v19;
  }
  else {
    uint64_t v21 = v11;
  }
  [v10 addObjectsFromArray:v21];

  v22 = [v10 allObjects];
  v23 = [v22 sortedArrayUsingComparator:&__block_literal_global_58];

  v33[0] = &unk_1F27F0630;
  v24 = objc_opt_new();
  v34[0] = v24;
  v33[1] = &unk_1F27F0648;
  v25 = objc_opt_new();
  v34[1] = v25;
  v33[2] = &unk_1F27F0660;
  v26 = objc_opt_new();
  v34[2] = v26;
  v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:3];

  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __91__ATXModeFaceComplicationsAggregator_provideComplicationsForSuggestedFaceType_environment___block_invoke_22;
  v31[3] = &unk_1E68AE538;
  id v32 = v27;
  id v28 = v27;
  v29 = objc_msgSend(v23, "_pas_filteredArrayWithTest:", v31);

  return v29;
}

uint64_t __91__ATXModeFaceComplicationsAggregator_provideComplicationsForSuggestedFaceType_environment___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = NSNumber;
  id v5 = a2;
  [a3 score];
  int v6 = objc_msgSend(v4, "numberWithDouble:");
  v7 = NSNumber;
  [v5 score];
  double v9 = v8;

  v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

uint64_t __91__ATXModeFaceComplicationsAggregator_provideComplicationsForSuggestedFaceType_environment___block_invoke_22(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 containerBundleIdentifier];
  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    int v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "widgetFamily"));
    v7 = [v5 objectForKeyedSubscript:v6];

    if (v7)
    {
      if ([v7 containsObject:v4])
      {
        uint64_t v8 = 0;
LABEL_11:

        goto LABEL_12;
      }
      [v7 addObject:v4];
    }
    else
    {
      double v9 = __atxlog_handle_lock_screen();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        __91__ATXModeFaceComplicationsAggregator_provideComplicationsForSuggestedFaceType_environment___block_invoke_22_cold_1(v3, v9);
      }
    }
    uint64_t v8 = 1;
    goto LABEL_11;
  }
  uint64_t v8 = 1;
LABEL_12:

  return v8;
}

- (id)provideLandscapeComplicationsForSuggestedFaceType:(int64_t)a3 environment:(id)a4
{
  id v5 = a4;
  int v6 = objc_opt_new();
  v7 = objc_opt_new();
  uint64_t v8 = [v6 provideLandscapeComplicationsForSuggestedFaceType:a3 environment:v5];

  if (v8) {
    double v9 = v8;
  }
  else {
    double v9 = (void *)MEMORY[0x1E4F1CBF0];
  }
  [v7 addObjectsFromArray:v9];

  v10 = [v7 allObjects];
  uint64_t v11 = [v10 sortedArrayUsingComparator:&__block_literal_global_25];

  return v11;
}

uint64_t __100__ATXModeFaceComplicationsAggregator_provideLandscapeComplicationsForSuggestedFaceType_environment___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = NSNumber;
  id v5 = a2;
  [a3 score];
  int v6 = objc_msgSend(v4, "numberWithDouble:");
  v7 = NSNumber;
  [v5 score];
  double v9 = v8;

  v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

void __91__ATXModeFaceComplicationsAggregator_provideComplicationsForSuggestedFaceType_environment___block_invoke_22_cold_1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 134217984;
  uint64_t v4 = [a1 widgetFamily];
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "Unrecognized widget family: %ld", (uint8_t *)&v3, 0xCu);
}

@end