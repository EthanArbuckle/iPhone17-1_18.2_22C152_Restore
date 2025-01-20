@interface WDMedicalRecordCategorySummary
- (BOOL)_shouldConsiderRecordTruncation:(id)a3;
- (BOOL)dirty;
- (BOOL)displayingTruncatedRecords;
- (BOOL)showCategoryTitle;
- (HRProfile)profile;
- (NSArray)displayItems;
- (NSMutableArray)allDisplayItems;
- (NSMutableArray)truncatedDisplayItems;
- (NSMutableArray)visibleDisplayItems;
- (NSMutableDictionary)panelsToRecords;
- (NSMutableOrderedSet)allRecords;
- (NSMutableOrderedSet)allStandaloneRecords;
- (NSMutableOrderedSet)panels;
- (NSString)summarySortString;
- (OS_dispatch_queue)resourceQueue;
- (OS_dispatch_queue)summaryQueue;
- (WDMedicalRecordCategorySummary)initWithProfile:(id)a3 categoryType:(int64_t)a4 showCategoryTitle:(BOOL)a5 delegate:(id)a6;
- (WDMedicalRecordSummaryDelegate)delegate;
- (id)_appendixItemForCount:(int64_t)a3;
- (id)_displayItemsForGenericRecord:(id)a3 previous:(id)a4 next:(id)a5 signedClinicalDataRecord:(id)a6;
- (int64_t)additionalDisplayItemCount;
- (int64_t)additionalRecordCount;
- (int64_t)categoryType;
- (int64_t)truncatedMedicalRecordCount;
- (unint64_t)truncationDisplayItemOffset;
- (void)_displayItemsForGenericRecord:(id)a3 previous:(id)a4 next:(id)a5 completion:(id)a6;
- (void)_displayItemsForObservation:(id)a3 previous:(id)a4 next:(id)a5 completion:(id)a6;
- (void)_displayItemsForPanel:(id)a3 completion:(id)a4;
- (void)_displayItemsForRecord:(id)a3 previous:(id)a4 next:(id)a5 completion:(id)a6;
- (void)_displayItemsForUnknownRecord:(id)a3 completion:(id)a4;
- (void)_rqueue_determinStandaloneRecords;
- (void)_rqueue_recomputeIfNeeded;
- (void)_rqueue_setNeedsCompute;
- (void)addMedicalRecord:(id)a3;
- (void)recomputeIfNeeded;
- (void)setAllDisplayItems:(id)a3;
- (void)setAllRecords:(id)a3;
- (void)setAllStandaloneRecords:(id)a3;
- (void)setCategoryType:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDirty:(BOOL)a3;
- (void)setDisplayingTruncatedRecords:(BOOL)a3;
- (void)setNeedsRecompute;
- (void)setPanels:(id)a3;
- (void)setPanelsToRecords:(id)a3;
- (void)setProfile:(id)a3;
- (void)setResourceQueue:(id)a3;
- (void)setShowCategoryTitle:(BOOL)a3;
- (void)setSummaryQueue:(id)a3;
- (void)setTruncatedDisplayItems:(id)a3;
- (void)setTruncatedMedicalRecordCount:(int64_t)a3;
- (void)setTruncationDisplayItemOffset:(unint64_t)a3;
- (void)setVisibleDisplayItems:(id)a3;
- (void)showTruncatedRecords;
@end

@implementation WDMedicalRecordCategorySummary

- (WDMedicalRecordCategorySummary)initWithProfile:(id)a3 categoryType:(int64_t)a4 showCategoryTitle:(BOOL)a5 delegate:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v30.receiver = self;
  v30.super_class = (Class)WDMedicalRecordCategorySummary;
  v13 = [(WDMedicalRecordCategorySummary *)&v30 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_profile, a3);
    objc_storeWeak((id *)&v14->_delegate, v12);
    v14->_categoryType = a4;
    v15 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    allRecords = v14->_allRecords;
    v14->_allRecords = v15;

    v17 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    panels = v14->_panels;
    v14->_panels = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    panelsToRecords = v14->_panelsToRecords;
    v14->_panelsToRecords = v19;

    v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    allDisplayItems = v14->_allDisplayItems;
    v14->_allDisplayItems = v21;

    v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    visibleDisplayItems = v14->_visibleDisplayItems;
    v14->_visibleDisplayItems = v23;

    v14->_truncationDisplayItemOffset = 0;
    v14->_truncatedMedicalRecordCount = 0;
    v14->_showCategoryTitle = a5;
    *(_WORD *)&v14->_displayingTruncatedRecords = 0;
    uint64_t v25 = HKCreateSerialDispatchQueue();
    summaryQueue = v14->_summaryQueue;
    v14->_summaryQueue = (OS_dispatch_queue *)v25;

    uint64_t v27 = HKCreateSerialDispatchQueue();
    resourceQueue = v14->_resourceQueue;
    v14->_resourceQueue = (OS_dispatch_queue *)v27;
  }
  return v14;
}

- (void)addMedicalRecord:(id)a3
{
  id v4 = a3;
  v5 = [(WDMedicalRecordCategorySummary *)self resourceQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__WDMedicalRecordCategorySummary_addMedicalRecord___block_invoke;
  v7[3] = &unk_1E644ADD8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __51__WDMedicalRecordCategorySummary_addMedicalRecord___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) allRecords];
  [v2 addObject:*(void *)(a1 + 40)];

  v3 = [*(id *)(a1 + 40) sampleType];
  id v4 = [v3 identifier];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F29A30]];

  if (v5)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    id v8 = [v6 panels];
    [v8 addObject:v7];
  }
  v9 = *(void **)(a1 + 32);
  return objc_msgSend(v9, "_rqueue_setNeedsCompute");
}

- (void)showTruncatedRecords
{
  v3 = [(WDMedicalRecordCategorySummary *)self resourceQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__WDMedicalRecordCategorySummary_showTruncatedRecords__block_invoke;
  block[3] = &unk_1E644A6C0;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __54__WDMedicalRecordCategorySummary_showTruncatedRecords__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) displayingTruncatedRecords];
  if ((result & 1) == 0)
  {
    [*(id *)(a1 + 32) setDisplayingTruncatedRecords:1];
    objc_msgSend(*(id *)(a1 + 32), "_rqueue_setNeedsCompute");
    v3 = *(void **)(a1 + 32);
    return objc_msgSend(v3, "_rqueue_recomputeIfNeeded");
  }
  return result;
}

- (void)recomputeIfNeeded
{
  v3 = [(WDMedicalRecordCategorySummary *)self resourceQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__WDMedicalRecordCategorySummary_recomputeIfNeeded__block_invoke;
  block[3] = &unk_1E644A6C0;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __51__WDMedicalRecordCategorySummary_recomputeIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_rqueue_recomputeIfNeeded");
}

- (void)setNeedsRecompute
{
  v3 = [(WDMedicalRecordCategorySummary *)self resourceQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__WDMedicalRecordCategorySummary_setNeedsRecompute__block_invoke;
  block[3] = &unk_1E644A6C0;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __51__WDMedicalRecordCategorySummary_setNeedsRecompute__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_rqueue_setNeedsCompute");
}

- (int64_t)additionalDisplayItemCount
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v3 = [(WDMedicalRecordCategorySummary *)self resourceQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__WDMedicalRecordCategorySummary_additionalDisplayItemCount__block_invoke;
  v6[3] = &unk_1E644AE00;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __60__WDMedicalRecordCategorySummary_additionalDisplayItemCount__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_rqueue_recomputeIfNeeded");
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 88) count];
  if (result)
  {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 72) count];
    uint64_t v3 = result - *(void *)(*(void *)(a1 + 32) + 96);
  }
  else
  {
    uint64_t v3 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (int64_t)additionalRecordCount
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  uint64_t v3 = [(WDMedicalRecordCategorySummary *)self resourceQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__WDMedicalRecordCategorySummary_additionalRecordCount__block_invoke;
  v6[3] = &unk_1E644AE00;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __55__WDMedicalRecordCategorySummary_additionalRecordCount__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_rqueue_recomputeIfNeeded");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(void *)(*(void *)(a1 + 32) + 104);
  return result;
}

- (NSArray)displayItems
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__1;
  id v11 = __Block_byref_object_dispose__1;
  id v12 = 0;
  uint64_t v3 = [(WDMedicalRecordCategorySummary *)self resourceQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__WDMedicalRecordCategorySummary_displayItems__block_invoke;
  v6[3] = &unk_1E644AE00;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __46__WDMedicalRecordCategorySummary_displayItems__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_rqueue_recomputeIfNeeded");
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = 72;
  if (!*(unsigned char *)(v2 + 9)) {
    uint64_t v3 = 80;
  }
  uint64_t v4 = [*(id *)(v2 + v3) copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (int64_t)categoryType
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  uint64_t v3 = [(WDMedicalRecordCategorySummary *)self resourceQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__WDMedicalRecordCategorySummary_categoryType__block_invoke;
  v6[3] = &unk_1E644B0F8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __46__WDMedicalRecordCategorySummary_categoryType__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 16);
  return result;
}

- (NSString)summarySortString
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__1;
  id v11 = __Block_byref_object_dispose__1;
  id v12 = 0;
  uint64_t v3 = [(WDMedicalRecordCategorySummary *)self resourceQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__WDMedicalRecordCategorySummary_summarySortString__block_invoke;
  v6[3] = &unk_1E644B0F8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __51__WDMedicalRecordCategorySummary_summarySortString__block_invoke(uint64_t a1)
{
  id v7 = +[WDMedicalRecordDisplayItemProvider supportedRecordCategoriesByCategoryType];
  uint64_t v2 = [NSNumber numberWithInteger:*(void *)(*(void *)(a1 + 32) + 16)];
  uint64_t v3 = [v7 objectForKeyedSubscript:v2];
  uint64_t v4 = [v3 displayName];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (BOOL)_shouldConsiderRecordTruncation:(id)a3
{
  return 0;
}

- (void)_rqueue_setNeedsCompute
{
  uint64_t v3 = [(WDMedicalRecordCategorySummary *)self resourceQueue];
  dispatch_assert_queue_V2(v3);

  [(WDMedicalRecordCategorySummary *)self setDirty:1];
}

- (void)_rqueue_recomputeIfNeeded
{
  uint64_t v3 = [(WDMedicalRecordCategorySummary *)self resourceQueue];
  dispatch_assert_queue_V2(v3);

  if ([(WDMedicalRecordCategorySummary *)self dirty])
  {
    uint64_t v4 = [(WDMedicalRecordCategorySummary *)self allRecords];
    uint64_t v5 = [v4 count];

    if (v5)
    {
      [(WDMedicalRecordCategorySummary *)self setDirty:0];
      [(WDMedicalRecordCategorySummary *)self _rqueue_determinStandaloneRecords];
      BOOL v6 = [(WDMedicalRecordCategorySummary *)self showCategoryTitle];
      id v7 = [(WDMedicalRecordCategorySummary *)self allStandaloneRecords];
      id v8 = (void *)[v7 copy];

      uint64_t v9 = [(WDMedicalRecordCategorySummary *)self panelsToRecords];
      uint64_t v10 = (void *)[v9 copy];

      id v11 = [(WDMedicalRecordCategorySummary *)self summaryQueue];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __59__WDMedicalRecordCategorySummary__rqueue_recomputeIfNeeded__block_invoke;
      v14[3] = &unk_1E644B210;
      id v15 = v8;
      v16 = self;
      id v17 = v10;
      BOOL v18 = v6;
      id v12 = v10;
      id v13 = v8;
      dispatch_async(v11, v14);
    }
  }
}

void __59__WDMedicalRecordCategorySummary__rqueue_recomputeIfNeeded__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__1;
  v34[4] = __Block_byref_object_dispose__1;
  id v35 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__1;
  v32[4] = __Block_byref_object_dispose__1;
  id v33 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__1;
  v30[4] = __Block_byref_object_dispose__1;
  id v31 = 0;
  dispatch_group_t v5 = dispatch_group_create();
  BOOL v6 = *(void **)(a1 + 32);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __59__WDMedicalRecordCategorySummary__rqueue_recomputeIfNeeded__block_invoke_2;
  v25[3] = &unk_1E644B170;
  id v7 = v5;
  uint64_t v8 = *(void *)(a1 + 40);
  v26 = v7;
  uint64_t v27 = v8;
  id v9 = v4;
  id v28 = v9;
  id v29 = *(id *)(a1 + 32);
  [v6 enumerateObjectsUsingBlock:v25];
  uint64_t v10 = [*(id *)(a1 + 40) summaryQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __59__WDMedicalRecordCategorySummary__rqueue_recomputeIfNeeded__block_invoke_5;
  v14[3] = &unk_1E644B1E8;
  id v15 = *(id *)(a1 + 32);
  id v16 = *(id *)(a1 + 48);
  id v17 = v9;
  id v18 = v3;
  id v19 = v2;
  v22 = v34;
  v23 = v30;
  char v24 = *(unsigned char *)(a1 + 56);
  uint64_t v20 = *(void *)(a1 + 40);
  v21 = v32;
  id v11 = v2;
  id v12 = v3;
  id v13 = v9;
  dispatch_group_notify(v7, v10, v14);

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);

  _Block_object_dispose(v34, 8);
}

void __59__WDMedicalRecordCategorySummary__rqueue_recomputeIfNeeded__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  BOOL v6 = [v5 sampleType];
  id v7 = [v6 identifier];
  int v8 = [v7 isEqualToString:*MEMORY[0x1E4F29A30]];

  if (v8)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __59__WDMedicalRecordCategorySummary__rqueue_recomputeIfNeeded__block_invoke_3;
    v17[3] = &unk_1E644B120;
    id v9 = *(void **)(a1 + 40);
    id v18 = *(id *)(a1 + 48);
    id v19 = *(id *)(a1 + 32);
    [v9 _displayItemsForPanel:v5 completion:v17];

    uint64_t v10 = v18;
  }
  else
  {
    if (a3)
    {
      uint64_t v10 = [*(id *)(a1 + 56) objectAtIndexedSubscript:a3 - 1];
    }
    else
    {
      uint64_t v10 = 0;
    }
    if ([*(id *)(a1 + 56) count] - 1 == a3)
    {
      id v11 = 0;
    }
    else
    {
      id v11 = [*(id *)(a1 + 56) objectAtIndexedSubscript:a3 + 1];
    }
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __59__WDMedicalRecordCategorySummary__rqueue_recomputeIfNeeded__block_invoke_4;
    v13[3] = &unk_1E644B148;
    id v12 = *(void **)(a1 + 40);
    id v14 = *(id *)(a1 + 48);
    id v15 = v5;
    id v16 = *(id *)(a1 + 32);
    [v12 _displayItemsForRecord:v15 previous:v10 next:v11 completion:v13];
  }
}

void __59__WDMedicalRecordCategorySummary__rqueue_recomputeIfNeeded__block_invoke_3(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) addEntriesFromDictionary:a2];
  id v3 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v3);
}

void __59__WDMedicalRecordCategorySummary__rqueue_recomputeIfNeeded__block_invoke_4(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setObject:a2 forKeyedSubscript:*(void *)(a1 + 40)];
  id v3 = *(NSObject **)(a1 + 48);
  dispatch_group_leave(v3);
}

void __59__WDMedicalRecordCategorySummary__rqueue_recomputeIfNeeded__block_invoke_5(uint64_t a1)
{
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __59__WDMedicalRecordCategorySummary__rqueue_recomputeIfNeeded__block_invoke_6;
  v18[3] = &unk_1E644B1C0;
  id v2 = *(void **)(a1 + 32);
  id v19 = *(id *)(a1 + 40);
  id v20 = *(id *)(a1 + 48);
  id v21 = *(id *)(a1 + 56);
  [v2 enumerateObjectsUsingBlock:v18];
  [*(id *)(a1 + 64) addObjectsFromArray:*(void *)(a1 + 56)];
  uint64_t v3 = [*(id *)(a1 + 56) lastObject];
  uint64_t v4 = *(void *)(*(void *)(a1 + 80) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  +[WDMedicalRecordGroupableCell defaultGap];
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), "setSeparatorInsets:", 0.0, v6, 0.0, 0.0);
  uint64_t v7 = [*(id *)(a1 + 64) lastObject];
  uint64_t v8 = *(void *)(*(void *)(a1 + 88) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) setSeparatorHidden:1];
  uint64_t v10 = [*(id *)(a1 + 56) firstObject];
  uint64_t v11 = *(void *)(*(void *)(a1 + 96) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  if ([*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) displayItemType] == 8) {
    [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) setExtraTopPadding:0];
  }
  if ([*(id *)(a1 + 64) count] == 1) {
    [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) setPlacement:2];
  }
  if (*(unsigned char *)(a1 + 104))
  {
    if ([*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) displayItemType] == 18) {
      [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) setExtraTopPadding:0];
    }
    id v13 = +[WDMedicalRecordDisplayItem timelineSummaryCategoryTitleItemWithCategoryType:](WDMedicalRecordDisplayItem, "timelineSummaryCategoryTitleItemWithCategoryType:", [*(id *)(a1 + 72) categoryType]);
    [v13 setExtraTopPadding:1];
    [*(id *)(a1 + 56) insertObject:v13 atIndex:0];
    [*(id *)(a1 + 64) insertObject:v13 atIndex:0];
  }
  id v14 = [*(id *)(a1 + 72) resourceQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __59__WDMedicalRecordCategorySummary__rqueue_recomputeIfNeeded__block_invoke_8;
  v15[3] = &unk_1E644A670;
  v15[4] = *(void *)(a1 + 72);
  id v16 = *(id *)(a1 + 56);
  id v17 = *(id *)(a1 + 64);
  dispatch_async(v14, v15);
}

void __59__WDMedicalRecordCategorySummary__rqueue_recomputeIfNeeded__block_invoke_6(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 sampleType];
  id v5 = [v4 identifier];
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4F29A30]];

  if (v6)
  {
    uint64_t v7 = [a1[4] objectForKeyedSubscript:v3];
    uint64_t v8 = [v7 count];
    id v9 = [a1[5] objectForKeyedSubscript:v3];
    uint64_t v10 = v9;
    id v11 = a1[6];
    if (v8)
    {
      id v12 = [v9 firstObject];
      [v11 addObject:v12];

      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      id v17 = __59__WDMedicalRecordCategorySummary__rqueue_recomputeIfNeeded__block_invoke_7;
      id v18 = &unk_1E644B198;
      id v19 = a1[5];
      id v20 = a1[6];
      [v7 enumerateObjectsUsingBlock:&v15];
      id v13 = a1[6];
      id v14 = objc_msgSend(v10, "lastObject", v15, v16, v17, v18);
      [v13 addObject:v14];
    }
    else
    {
      [a1[6] addObjectsFromArray:v9];
    }
  }
  else
  {
    uint64_t v7 = [a1[5] objectForKeyedSubscript:v3];
    [a1[6] addObjectsFromArray:v7];
  }
}

void __59__WDMedicalRecordCategorySummary__rqueue_recomputeIfNeeded__block_invoke_7(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  [*(id *)(a1 + 40) addObjectsFromArray:v3];
}

void __59__WDMedicalRecordCategorySummary__rqueue_recomputeIfNeeded__block_invoke_8(uint64_t a1)
{
  [*(id *)(a1 + 32) setVisibleDisplayItems:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setAllDisplayItems:*(void *)(a1 + 48)];
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 summaryDidFinishRecompute:*(void *)(a1 + 32)];
}

- (void)_rqueue_determinStandaloneRecords
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = [(WDMedicalRecordCategorySummary *)self resourceQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(WDMedicalRecordCategorySummary *)self allRecords];
  id v5 = (void *)[v4 mutableCopy];
  [(WDMedicalRecordCategorySummary *)self setAllStandaloneRecords:v5];

  int v6 = [(WDMedicalRecordCategorySummary *)self panels];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id obj = [(WDMedicalRecordCategorySummary *)self panels];
    uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v21 + 1) + 8 * v11);
          id v13 = [(WDMedicalRecordCategorySummary *)self allRecords];
          id v14 = (void *)MEMORY[0x1E4F28F60];
          uint64_t v15 = [v12 results];
          uint64_t v16 = [v14 predicateWithFormat:@"FHIRIdentifier IN %@", v15];
          id v17 = [v13 filteredOrderedSetUsingPredicate:v16];

          id v18 = [(WDMedicalRecordCategorySummary *)self panelsToRecords];
          [v18 setObject:v17 forKeyedSubscript:v12];

          id v19 = [(WDMedicalRecordCategorySummary *)self allStandaloneRecords];
          [v19 minusOrderedSet:v17];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v9);
    }
  }
}

- (void)_displayItemsForRecord:(id)a3 previous:(id)a4 next:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(WDMedicalRecordCategorySummary *)self summaryQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__WDMedicalRecordCategorySummary__displayItemsForRecord_previous_next_completion___block_invoke;
  block[3] = &unk_1E644A9E0;
  id v23 = v12;
  id v24 = v13;
  id v20 = v10;
  long long v21 = self;
  id v22 = v11;
  id v15 = v12;
  id v16 = v11;
  id v17 = v13;
  id v18 = v10;
  dispatch_async(v14, block);
}

uint64_t __82__WDMedicalRecordCategorySummary__displayItemsForRecord_previous_next_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) sampleType];
  id v3 = [v2 identifier];
  int v4 = [v3 isEqualToString:*MEMORY[0x1E4F29A30]];

  if (v4)
  {
    id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);
    return v5();
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v7 = *(void **)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      uint64_t v10 = *(void *)(a1 + 56);
      uint64_t v11 = *(void *)(a1 + 64);
      return [v7 _displayItemsForObservation:v8 previous:v9 next:v10 completion:v11];
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      uint64_t v14 = *(void *)(a1 + 32);
      id v13 = *(void **)(a1 + 40);
      if (isKindOfClass)
      {
        uint64_t v15 = *(void *)(a1 + 64);
        return [v13 _displayItemsForUnknownRecord:v14 completion:v15];
      }
      else
      {
        uint64_t v16 = *(void *)(a1 + 48);
        uint64_t v17 = *(void *)(a1 + 56);
        uint64_t v18 = *(void *)(a1 + 64);
        return [v13 _displayItemsForGenericRecord:v14 previous:v16 next:v17 completion:v18];
      }
    }
  }
}

- (void)_displayItemsForGenericRecord:(id)a3 previous:(id)a4 next:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [(HRProfile *)self->_profile healthRecordsStore];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __89__WDMedicalRecordCategorySummary__displayItemsForGenericRecord_previous_next_completion___block_invoke;
  v19[3] = &unk_1E644B238;
  id v22 = v12;
  id v23 = v13;
  v19[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  id v18 = v13;
  [v17 fetchCorrespondingSignedClinicalDataRecordWithHealthRecordsStore:v14 completion:v19];
}

void __89__WDMedicalRecordCategorySummary__displayItemsForGenericRecord_previous_next_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 64);
  id v3 = [*(id *)(a1 + 32) _displayItemsForGenericRecord:*(void *)(a1 + 40) previous:*(void *)(a1 + 48) next:*(void *)(a1 + 56) signedClinicalDataRecord:a2];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (id)_displayItemsForGenericRecord:(id)a3 previous:(id)a4 next:(id)a5 signedClinicalDataRecord:(id)a6
{
  uint64_t v27 = self;
  id v9 = a3;
  id v29 = a6;
  id v10 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v11 = a5;
  id v12 = a4;
  id v13 = objc_alloc_init(v10);
  int v14 = _ConceptsOfRecordsAreDefinedAndEqual(v9, v12);

  int v15 = _ConceptsOfRecordsAreDefinedAndEqual(v9, v11);
  id v16 = [v9 displayNameForGroupByConcept];
  id v17 = [v9 preferredDisplayName];
  unsigned int v18 = [v16 isEqualToString:v17];
  id v19 = [v9 meaningfulDateTitle];
  BOOL v20 = (v18 & 1) == 0 && [v17 length] || objc_msgSend(v19, "length", v27) != 0;
  if ((v14 ^ 1 | v18) == 1)
  {
    id v21 = +[WDMedicalRecordDisplayItem conceptHeaderItemWithCategoryType:title:](WDMedicalRecordDisplayItem, "conceptHeaderItemWithCategoryType:title:", [v9 recordCategoryType], v16);
    [v21 setSeparatorHidden:1];
    [v21 setMedicalRecord:v9];
    [v21 setCategorySummary:v27];
    [v21 setExtraTopPadding:1];
    if (((v20 | v15) & 1) == 0) {
      [v21 setPlacement:2];
    }
    objc_msgSend(v13, "addObject:", v21, v27);
  }
  if (v20)
  {
    id v22 = +[WDMedicalRecordDisplayItem timelineSummaryContentWithSubtitleItem];
    id v23 = v22;
    if (v18) {
      id v24 = 0;
    }
    else {
      id v24 = v17;
    }
    objc_msgSend(v22, "setTitle:", v24, v27);
    [v23 setSubtitle:v19];
    uint64_t v25 = [v29 attributedMeaningfulDateStringWithDateTitle:v19];
    [v23 setAttributedSubtitle:v25];

    objc_msgSend(v23, "setRecordCategoryType:", objc_msgSend(v9, "recordCategoryType"));
    [v23 setMedicalRecord:v9];
    [v23 setCategorySummary:v28];
    if ((v15 ^ 1 | v18))
    {
      [v23 setPlacement:5];
    }
    else
    {
      [v23 setPlacement:4];
      [v23 setSeparatorStyle:0];
    }
    [v23 setSeparatorHidden:v15 ^ 1 | v18];
    [v13 addObject:v23];
  }
  return v13;
}

- (void)_displayItemsForObservation:(id)a3 previous:(id)a4 next:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int v15 = [(WDMedicalRecordCategorySummary *)self profile];
  id v16 = [v15 healthRecordsStore];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __87__WDMedicalRecordCategorySummary__displayItemsForObservation_previous_next_completion___block_invoke;
  v22[3] = &unk_1E644B288;
  v22[4] = self;
  id v23 = v10;
  id v24 = v11;
  id v25 = v12;
  id v26 = v14;
  id v27 = v13;
  id v17 = v13;
  id v18 = v14;
  id v19 = v12;
  id v20 = v11;
  id v21 = v10;
  [v21 fetchObservationDetailItemsWithHealthRecordsStore:v16 style:1 completion:v22];
}

void __87__WDMedicalRecordCategorySummary__displayItemsForObservation_previous_next_completion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  int v4 = [a1[4] summaryQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__WDMedicalRecordCategorySummary__displayItemsForObservation_previous_next_completion___block_invoke_2;
  block[3] = &unk_1E644B260;
  id v9 = a1[5];
  id v10 = a1[6];
  id v5 = a1[7];
  id v6 = a1[4];
  id v11 = v5;
  id v12 = v6;
  id v13 = a1[8];
  id v14 = v3;
  id v15 = a1[9];
  id v7 = v3;
  dispatch_async(v4, block);
}

void __87__WDMedicalRecordCategorySummary__displayItemsForObservation_previous_next_completion___block_invoke_2(uint64_t a1)
{
  id v10 = [*(id *)(a1 + 32) displayNameForGroupByConcept];
  char v2 = _ConceptsOfRecordsAreDefinedAndEqual(*(void **)(a1 + 32), *(void **)(a1 + 40));
  int v3 = _ConceptsOfRecordsAreDefinedAndEqual(*(void **)(a1 + 32), *(void **)(a1 + 48));
  if ((v2 & 1) == 0)
  {
    int v4 = +[WDMedicalRecordDisplayItem conceptHeaderItemWithCategoryType:title:](WDMedicalRecordDisplayItem, "conceptHeaderItemWithCategoryType:title:", [*(id *)(a1 + 32) recordCategoryType], v10);
    [v4 setSeparatorHidden:1];
    [v4 setMedicalRecord:*(void *)(a1 + 32)];
    [v4 setCategorySummary:*(void *)(a1 + 56)];
    [v4 setExtraTopPadding:1];
    [*(id *)(a1 + 64) addObject:v4];
  }
  [*(id *)(a1 + 64) addObjectsFromArray:*(void *)(a1 + 72)];
  id v5 = [*(id *)(a1 + 64) lastObject];
  id v6 = v5;
  if (v3)
  {
    [v5 setPlacement:4];

    id v7 = [*(id *)(a1 + 64) lastObject];
    uint64_t v8 = v7;
    uint64_t v9 = 0;
  }
  else
  {
    [v5 setPlacement:5];

    id v7 = [*(id *)(a1 + 64) lastObject];
    uint64_t v8 = v7;
    uint64_t v9 = 1;
  }
  [v7 setSeparatorHidden:v9];

  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
}

- (void)_displayItemsForPanel:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(WDMedicalRecordCategorySummary *)self summaryQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__WDMedicalRecordCategorySummary__displayItemsForPanel_completion___block_invoke;
  block[3] = &unk_1E644B350;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __67__WDMedicalRecordCategorySummary__displayItemsForPanel_completion___block_invoke(id *a1)
{
  char v2 = [a1[4] preferredDisplayName];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__1;
  v16[4] = __Block_byref_object_dispose__1;
  id v17 = 0;
  int v4 = [a1[5] resourceQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__WDMedicalRecordCategorySummary__displayItemsForPanel_completion___block_invoke_2;
  block[3] = &unk_1E644B328;
  id v15 = v16;
  int8x16_t v9 = *((int8x16_t *)a1 + 2);
  id v5 = (id)v9.i64[0];
  int8x16_t v11 = vextq_s8(v9, v9, 8uLL);
  id v12 = v3;
  id v6 = a1[6];
  id v13 = v2;
  id v14 = v6;
  id v7 = v2;
  id v8 = v3;
  dispatch_async(v4, block);

  _Block_object_dispose(v16, 8);
}

void __67__WDMedicalRecordCategorySummary__displayItemsForPanel_completion___block_invoke_2(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) panelsToRecords];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = [v3 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 72) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if ([*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) count])
  {
    dispatch_group_t v7 = dispatch_group_create();
    uint64_t v8 = *(void *)(a1 + 72);
    int8x16_t v9 = *(void **)(*(void *)(v8 + 8) + 40);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __67__WDMedicalRecordCategorySummary__displayItemsForPanel_completion___block_invoke_5;
    v20[3] = &unk_1E644B300;
    uint64_t v24 = v8;
    uint64_t v10 = *(void *)(a1 + 32);
    dispatch_group_t v21 = v7;
    uint64_t v22 = v10;
    id v23 = *(id *)(a1 + 48);
    int8x16_t v11 = v7;
    [v9 enumerateObjectsUsingBlock:v20];
    id v12 = [*(id *)(a1 + 32) summaryQueue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __67__WDMedicalRecordCategorySummary__displayItemsForPanel_completion___block_invoke_7;
    v15[3] = &unk_1E644B2B0;
    id v16 = *(id *)(a1 + 56);
    id v17 = *(id *)(a1 + 40);
    id v18 = *(id *)(a1 + 48);
    id v19 = *(id *)(a1 + 64);
    dispatch_group_notify(v11, v12, v15);
  }
  else
  {
    id v13 = *(void **)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 40);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __67__WDMedicalRecordCategorySummary__displayItemsForPanel_completion___block_invoke_3;
    v25[3] = &unk_1E644B2D8;
    void v25[4] = v13;
    id v26 = *(id *)(a1 + 48);
    id v27 = *(id *)(a1 + 40);
    id v28 = *(id *)(a1 + 64);
    [v13 _displayItemsForGenericRecord:v14 previous:0 next:0 completion:v25];
  }
}

void __67__WDMedicalRecordCategorySummary__displayItemsForPanel_completion___block_invoke_3(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1[4] summaryQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__WDMedicalRecordCategorySummary__displayItemsForPanel_completion___block_invoke_4;
  v6[3] = &unk_1E644B2B0;
  id v7 = a1[5];
  id v8 = a1[6];
  id v9 = v3;
  id v10 = a1[7];
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __67__WDMedicalRecordCategorySummary__displayItemsForPanel_completion___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setObject:*(void *)(a1 + 48) forKeyedSubscript:*(void *)(a1 + 40)];
  char v2 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  return v2();
}

void __67__WDMedicalRecordCategorySummary__displayItemsForPanel_completion___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    id v6 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) objectAtIndexedSubscript:a3 - 1];
  }
  else
  {
    id v6 = 0;
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count] - 1 == a3)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) objectAtIndexedSubscript:a3 + 1];
  }
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__WDMedicalRecordCategorySummary__displayItemsForPanel_completion___block_invoke_6;
  v10[3] = &unk_1E644B148;
  id v8 = *(void **)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  id v12 = v5;
  id v13 = *(id *)(a1 + 32);
  id v9 = v5;
  [v8 _displayItemsForRecord:v9 previous:v6 next:v7 completion:v10];
}

void __67__WDMedicalRecordCategorySummary__displayItemsForPanel_completion___block_invoke_6(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setObject:a2 forKeyedSubscript:*(void *)(a1 + 40)];
  id v3 = *(NSObject **)(a1 + 48);
  dispatch_group_leave(v3);
}

void __67__WDMedicalRecordCategorySummary__displayItemsForPanel_completion___block_invoke_7(uint64_t a1)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  char v2 = +[WDMedicalRecordDisplayItem timelineSummaryPanelTitleItem];
  id v3 = HRLocalizedString(@"LAB_RESULTS_PANEL");
  [v2 setTitle:v3];

  [v2 setSubtitle:*(void *)(a1 + 32)];
  [v2 setExtraTopPadding:1];
  [v2 setMedicalRecord:*(void *)(a1 + 40)];
  uint64_t v4 = +[WDMedicalRecordDisplayItem timelineSummaryAppendixItem];
  id v5 = HRLocalizedString(@"ADDITIONAL_PANEL_INFORMATION");
  [v4 setTitle:v5];

  [v4 setPlacement:2];
  [v4 setExtraTopPadding:1];
  [v4 setMedicalRecord:*(void *)(a1 + 40)];
  v7[0] = v2;
  v7[1] = v4;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  [*(id *)(a1 + 48) setObject:v6 forKeyedSubscript:*(void *)(a1 + 40)];

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)_displayItemsForUnknownRecord:(id)a3 completion:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, void *))a4;
  id v6 = a3;
  id v7 = +[WDMedicalRecordDisplayItem standaloneItem];
  [v7 setPlacement:2];
  [v7 setExtraTopPadding:1];
  id v8 = [v6 preferredDisplayName];
  [v7 setTitle:v8];

  [v7 setMedicalRecord:v6];
  v10[0] = v7;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  v5[2](v5, v9);
}

- (id)_appendixItemForCount:(int64_t)a3
{
  id v5 = +[WDMedicalRecordDisplayItem timelineSummaryAppendixItem];
  id v6 = NSString;
  id v7 = HRLocalizedString(@"SHOW %d MORE");
  id v8 = objc_msgSend(v6, "localizedStringWithFormat:", v7, a3);
  [v5 setTitle:v8];

  [v5 setPlacement:2];
  [v5 setExtraTopPadding:1];
  [v5 setCategorySummary:self];
  return v5;
}

- (void)setCategoryType:(int64_t)a3
{
  self->_categoryType = a3;
}

- (HRProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
}

- (WDMedicalRecordSummaryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WDMedicalRecordSummaryDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableOrderedSet)allRecords
{
  return self->_allRecords;
}

- (void)setAllRecords:(id)a3
{
}

- (NSMutableOrderedSet)allStandaloneRecords
{
  return self->_allStandaloneRecords;
}

- (void)setAllStandaloneRecords:(id)a3
{
}

- (NSMutableOrderedSet)panels
{
  return self->_panels;
}

- (void)setPanels:(id)a3
{
}

- (NSMutableDictionary)panelsToRecords
{
  return self->_panelsToRecords;
}

- (void)setPanelsToRecords:(id)a3
{
}

- (NSMutableArray)allDisplayItems
{
  return self->_allDisplayItems;
}

- (void)setAllDisplayItems:(id)a3
{
}

- (NSMutableArray)visibleDisplayItems
{
  return self->_visibleDisplayItems;
}

- (void)setVisibleDisplayItems:(id)a3
{
}

- (NSMutableArray)truncatedDisplayItems
{
  return self->_truncatedDisplayItems;
}

- (void)setTruncatedDisplayItems:(id)a3
{
}

- (unint64_t)truncationDisplayItemOffset
{
  return self->_truncationDisplayItemOffset;
}

- (void)setTruncationDisplayItemOffset:(unint64_t)a3
{
  self->_truncationDisplayItemOffset = a3;
}

- (int64_t)truncatedMedicalRecordCount
{
  return self->_truncatedMedicalRecordCount;
}

- (void)setTruncatedMedicalRecordCount:(int64_t)a3
{
  self->_truncatedMedicalRecordCount = a3;
}

- (BOOL)showCategoryTitle
{
  return self->_showCategoryTitle;
}

- (void)setShowCategoryTitle:(BOOL)a3
{
  self->_showCategoryTitle = a3;
}

- (BOOL)displayingTruncatedRecords
{
  return self->_displayingTruncatedRecords;
}

- (void)setDisplayingTruncatedRecords:(BOOL)a3
{
  self->_displayingTruncatedRecords = a3;
}

- (BOOL)dirty
{
  return self->_dirty;
}

- (void)setDirty:(BOOL)a3
{
  self->_dirty = a3;
}

- (OS_dispatch_queue)summaryQueue
{
  return self->_summaryQueue;
}

- (void)setSummaryQueue:(id)a3
{
}

- (OS_dispatch_queue)resourceQueue
{
  return self->_resourceQueue;
}

- (void)setResourceQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceQueue, 0);
  objc_storeStrong((id *)&self->_summaryQueue, 0);
  objc_storeStrong((id *)&self->_truncatedDisplayItems, 0);
  objc_storeStrong((id *)&self->_visibleDisplayItems, 0);
  objc_storeStrong((id *)&self->_allDisplayItems, 0);
  objc_storeStrong((id *)&self->_panelsToRecords, 0);
  objc_storeStrong((id *)&self->_panels, 0);
  objc_storeStrong((id *)&self->_allStandaloneRecords, 0);
  objc_storeStrong((id *)&self->_allRecords, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_profile, 0);
}

@end