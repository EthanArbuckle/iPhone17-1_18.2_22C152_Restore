@interface WDMedicalRecordConceptSummary
- (BOOL)dirty;
- (HRProfile)profile;
- (NSArray)allDisplayItems;
- (NSArray)displayItems;
- (NSMutableOrderedSet)allRecords;
- (NSString)summarySortString;
- (OS_dispatch_queue)resourceQueue;
- (OS_dispatch_queue)summaryQueue;
- (WDMedicalRecordConceptSummary)initWithProfile:(id)a3 delegate:(id)a4;
- (WDMedicalRecordSummaryDelegate)delegate;
- (void)_displayItemsForGenericMedicalRecord:(id)a3 completion:(id)a4;
- (void)_displayItemsForObservation:(id)a3 completion:(id)a4;
- (void)_displayItemsForRecord:(id)a3 completion:(id)a4;
- (void)_rqueue_recomputeIfNeeded;
- (void)_rqueue_setNeedsCompute;
- (void)_updatePlacementForDisplayItems:(id)a3 ofRecord:(id)a4;
- (void)addMedicalRecord:(id)a3;
- (void)recomputeIfNeeded;
- (void)setAllDisplayItems:(id)a3;
- (void)setAllRecords:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDirty:(BOOL)a3;
- (void)setNeedsRecompute;
- (void)setProfile:(id)a3;
- (void)setResourceQueue:(id)a3;
- (void)setSummaryQueue:(id)a3;
@end

@implementation WDMedicalRecordConceptSummary

- (WDMedicalRecordConceptSummary)initWithProfile:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)WDMedicalRecordConceptSummary;
  v9 = [(WDMedicalRecordConceptSummary *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_profile, a3);
    v10->_dirty = 0;
    uint64_t v11 = HKCreateSerialDispatchQueue();
    summaryQueue = v10->_summaryQueue;
    v10->_summaryQueue = (OS_dispatch_queue *)v11;

    uint64_t v13 = HKCreateSerialDispatchQueue();
    resourceQueue = v10->_resourceQueue;
    v10->_resourceQueue = (OS_dispatch_queue *)v13;

    objc_storeWeak((id *)&v10->_delegate, v8);
    v15 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    allRecords = v10->_allRecords;
    v10->_allRecords = v15;
  }
  return v10;
}

- (void)addMedicalRecord:(id)a3
{
  id v4 = a3;
  v5 = [(WDMedicalRecordConceptSummary *)self resourceQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__WDMedicalRecordConceptSummary_addMedicalRecord___block_invoke;
  v7[3] = &unk_1E644ADD8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __50__WDMedicalRecordConceptSummary_addMedicalRecord___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) allRecords];
  [v2 addObject:*(void *)(a1 + 40)];

  v3 = *(void **)(a1 + 32);
  return objc_msgSend(v3, "_rqueue_setNeedsCompute");
}

- (void)setNeedsRecompute
{
  v3 = [(WDMedicalRecordConceptSummary *)self resourceQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__WDMedicalRecordConceptSummary_setNeedsRecompute__block_invoke;
  block[3] = &unk_1E644A6C0;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __50__WDMedicalRecordConceptSummary_setNeedsRecompute__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_rqueue_setNeedsCompute");
}

- (void)recomputeIfNeeded
{
  v3 = [(WDMedicalRecordConceptSummary *)self resourceQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__WDMedicalRecordConceptSummary_recomputeIfNeeded__block_invoke;
  block[3] = &unk_1E644A6C0;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __50__WDMedicalRecordConceptSummary_recomputeIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_rqueue_recomputeIfNeeded");
}

- (NSArray)displayItems
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  uint64_t v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  v3 = [(WDMedicalRecordConceptSummary *)self resourceQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__WDMedicalRecordConceptSummary_displayItems__block_invoke;
  v6[3] = &unk_1E644AE00;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __45__WDMedicalRecordConceptSummary_displayItems__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_rqueue_recomputeIfNeeded");
  v2 = *(void **)(*(void *)(a1 + 32) + 40);
  v3 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v3, v2);
}

- (NSString)summarySortString
{
  return (NSString *)&stru_1F1D9FF30;
}

- (void)_rqueue_setNeedsCompute
{
  v3 = [(WDMedicalRecordConceptSummary *)self resourceQueue];
  dispatch_assert_queue_V2(v3);

  [(WDMedicalRecordConceptSummary *)self setDirty:1];
}

- (void)_rqueue_recomputeIfNeeded
{
  v3 = [(WDMedicalRecordConceptSummary *)self resourceQueue];
  dispatch_assert_queue_V2(v3);

  if ([(WDMedicalRecordConceptSummary *)self dirty])
  {
    id v4 = [(WDMedicalRecordConceptSummary *)self allRecords];
    uint64_t v5 = [v4 count];

    if (v5)
    {
      [(WDMedicalRecordConceptSummary *)self setDirty:0];
      id v6 = [(WDMedicalRecordConceptSummary *)self allRecords];
      uint64_t v7 = (void *)[v6 copy];

      id v8 = [(WDMedicalRecordConceptSummary *)self summaryQueue];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __58__WDMedicalRecordConceptSummary__rqueue_recomputeIfNeeded__block_invoke;
      v10[3] = &unk_1E644ADD8;
      id v11 = v7;
      id v12 = self;
      id v9 = v7;
      dispatch_async(v8, v10);
    }
  }
}

void __58__WDMedicalRecordConceptSummary__rqueue_recomputeIfNeeded__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  dispatch_group_t v4 = dispatch_group_create();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __58__WDMedicalRecordConceptSummary__rqueue_recomputeIfNeeded__block_invoke_2;
  v18[3] = &unk_1E644B1C0;
  id v6 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  dispatch_group_t v19 = v4;
  uint64_t v20 = v5;
  id v7 = v2;
  id v21 = v7;
  id v8 = v4;
  [v6 enumerateObjectsUsingBlock:v18];
  id v9 = [*(id *)(a1 + 40) summaryQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__WDMedicalRecordConceptSummary__rqueue_recomputeIfNeeded__block_invoke_4;
  block[3] = &unk_1E644A710;
  id v14 = *(id *)(a1 + 32);
  id v15 = v3;
  uint64_t v10 = *(void *)(a1 + 40);
  id v16 = v7;
  uint64_t v17 = v10;
  id v11 = v7;
  id v12 = v3;
  dispatch_group_notify(v8, v9, block);
}

void __58__WDMedicalRecordConceptSummary__rqueue_recomputeIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__WDMedicalRecordConceptSummary__rqueue_recomputeIfNeeded__block_invoke_3;
  v6[3] = &unk_1E644B148;
  dispatch_group_t v4 = *(void **)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v8 = v3;
  id v9 = *(id *)(a1 + 32);
  id v5 = v3;
  [v4 _displayItemsForRecord:v5 completion:v6];
}

void __58__WDMedicalRecordConceptSummary__rqueue_recomputeIfNeeded__block_invoke_3(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setObject:a2 forKeyedSubscript:*(void *)(a1 + 40)];
  id v3 = *(NSObject **)(a1 + 48);
  dispatch_group_leave(v3);
}

void __58__WDMedicalRecordConceptSummary__rqueue_recomputeIfNeeded__block_invoke_4(uint64_t a1)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__WDMedicalRecordConceptSummary__rqueue_recomputeIfNeeded__block_invoke_5;
  v6[3] = &unk_1E644B198;
  id v2 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  [v2 enumerateObjectsUsingBlock:v6];
  id v3 = [*(id *)(a1 + 56) resourceQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__WDMedicalRecordConceptSummary__rqueue_recomputeIfNeeded__block_invoke_6;
  v4[3] = &unk_1E644ADD8;
  v4[4] = *(void *)(a1 + 56);
  id v5 = *(id *)(a1 + 40);
  dispatch_async(v3, v4);
}

void __58__WDMedicalRecordConceptSummary__rqueue_recomputeIfNeeded__block_invoke_5(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) objectForKeyedSubscript:a2];
  [v2 addObjectsFromArray:v3];
}

void __58__WDMedicalRecordConceptSummary__rqueue_recomputeIfNeeded__block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) setAllDisplayItems:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 summaryDidFinishRecompute:*(void *)(a1 + 32)];
}

- (void)_displayItemsForRecord:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(WDMedicalRecordConceptSummary *)self _displayItemsForObservation:v7 completion:v6];
  }
  else {
    [(WDMedicalRecordConceptSummary *)self _displayItemsForGenericMedicalRecord:v7 completion:v6];
  }
}

- (void)_displayItemsForObservation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v9 = [(HRProfile *)self->_profile healthRecordsStore];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__WDMedicalRecordConceptSummary__displayItemsForObservation_completion___block_invoke;
  v13[3] = &unk_1E644B2D8;
  v13[4] = self;
  id v14 = v6;
  id v15 = v8;
  id v16 = v7;
  id v10 = v7;
  id v11 = v8;
  id v12 = v6;
  [v12 fetchObservationDetailItemsWithHealthRecordsStore:v9 style:2 completion:v13];
}

void __72__WDMedicalRecordConceptSummary__displayItemsForObservation_completion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  dispatch_group_t v4 = [a1[4] summaryQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__WDMedicalRecordConceptSummary__displayItemsForObservation_completion___block_invoke_2;
  block[3] = &unk_1E644B568;
  id v7 = a1[5];
  id v8 = a1[6];
  id v9 = v3;
  id v10 = a1[4];
  id v11 = a1[7];
  id v5 = v3;
  dispatch_async(v4, block);
}

void __72__WDMedicalRecordConceptSummary__displayItemsForObservation_completion___block_invoke_2(uint64_t a1)
{
  id v6 = +[WDMedicalRecordDisplayItem timelineSummaryContentWithSubtitleItem];
  id v2 = [*(id *)(a1 + 32) preferredDisplayName];
  [v6 setTitle:v2];

  id v3 = [*(id *)(a1 + 32) meaningfulDateTitle];
  [v6 setSubtitle:v3];

  [v6 setMedicalRecord:*(void *)(a1 + 32)];
  [v6 setPlacement:3];
  [v6 setSeparatorStyle:0];
  [v6 setSeparatorHidden:1];
  [v6 setExtraTopPadding:1];
  [v6 setShowDisclosureIndicator:1];
  [v6 setUseRegularFontForSubtitle:1];
  [*(id *)(a1 + 40) addObject:v6];
  [*(id *)(a1 + 40) addObjectsFromArray:*(void *)(a1 + 48)];
  dispatch_group_t v4 = [*(id *)(a1 + 40) lastObject];
  [v4 setPlacement:5];

  id v5 = [*(id *)(a1 + 40) lastObject];
  [v5 setSeparatorHidden:1];

  [*(id *)(a1 + 56) _updatePlacementForDisplayItems:*(void *)(a1 + 40) ofRecord:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)_displayItemsForGenericMedicalRecord:(id)a3 completion:(id)a4
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__3;
  v44 = __Block_byref_object_dispose__3;
  id v45 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = __Block_byref_object_copy__3;
  v38[4] = __Block_byref_object_dispose__3;
  id v39 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__3;
  v36[4] = __Block_byref_object_dispose__3;
  id v37 = 0;
  id v8 = dispatch_group_create();
  id v9 = +[WDMedicalRecordDisplayItem timelineSummaryContentWithSubtitleItem];
  id v10 = [v6 preferredDisplayName];
  [v9 setTitle:v10];

  id v11 = [v6 meaningfulDateTitle];
  [v9 setSubtitle:v11];

  [v9 setMedicalRecord:v6];
  [v9 setPlacement:3];
  [v9 setSeparatorStyle:0];
  [v9 setSeparatorHidden:0];
  [v9 setExtraTopPadding:1];
  [v9 setShowDisclosureIndicator:1];
  [v9 setUseRegularFontForSubtitle:1];
  v46[0] = v9;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:1];
  uint64_t v13 = (void *)v41[5];
  v41[5] = v12;

  id v14 = [v6 originIdentifier];
  id v15 = [v14 signedClinicalDataRecordIdentifier];

  if (v15)
  {
    dispatch_group_enter(v8);
    id v16 = [(HRProfile *)self->_profile clinicalSourcesDataProvider];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __81__WDMedicalRecordConceptSummary__displayItemsForGenericMedicalRecord_completion___block_invoke;
    v32[3] = &unk_1E644B590;
    id v33 = v9;
    id v34 = v6;
    v35 = v8;
    [v16 fetchSignedClinicalDataRecordWithIdentifier:v15 completion:v32];
  }
  dispatch_group_enter(v8);
  uint64_t v17 = [(HRProfile *)self->_profile healthRecordsStore];
  objc_super v18 = [(HRProfile *)self->_profile conceptStore];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __81__WDMedicalRecordConceptSummary__displayItemsForGenericMedicalRecord_completion___block_invoke_2;
  v29[3] = &unk_1E644B5E0;
  v29[4] = self;
  v31 = v36;
  dispatch_group_t v19 = v8;
  v30 = v19;
  [v6 fetchConceptRoomItemsWithHealthRecordsStore:v17 conceptStore:v18 completion:v29];

  uint64_t v20 = [(WDMedicalRecordConceptSummary *)self summaryQueue];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __81__WDMedicalRecordConceptSummary__displayItemsForGenericMedicalRecord_completion___block_invoke_4;
  v23[3] = &unk_1E644B608;
  v27 = v38;
  v28 = v36;
  v23[4] = self;
  id v24 = v6;
  id v25 = v7;
  v26 = &v40;
  id v21 = v7;
  id v22 = v6;
  dispatch_group_notify(v19, v20, v23);

  _Block_object_dispose(v36, 8);
  _Block_object_dispose(v38, 8);

  _Block_object_dispose(&v40, 8);
}

void __81__WDMedicalRecordConceptSummary__displayItemsForGenericMedicalRecord_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 meaningfulDateTitle];
  id v6 = [v4 attributedMeaningfulDateStringWithDateTitle:v5];

  [*(id *)(a1 + 32) setAttributedSubtitle:v6];
  id v7 = *(NSObject **)(a1 + 48);
  dispatch_group_leave(v7);
}

void __81__WDMedicalRecordConceptSummary__displayItemsForGenericMedicalRecord_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) summaryQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__WDMedicalRecordConceptSummary__displayItemsForGenericMedicalRecord_completion___block_invoke_3;
  block[3] = &unk_1E644B5B8;
  id v9 = v3;
  long long v7 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v7;
  long long v10 = v7;
  id v6 = v3;
  dispatch_async(v4, block);
}

void __81__WDMedicalRecordConceptSummary__displayItemsForGenericMedicalRecord_completion___block_invoke_3(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(a1 + 32));
  id v2 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v2);
}

void __81__WDMedicalRecordConceptSummary__displayItemsForGenericMedicalRecord_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v2 addObjectsFromArray:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(v2, "addObjectsFromArray:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [v2 addObjectsFromArray:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
  [*(id *)(a1 + 32) _updatePlacementForDisplayItems:v2 ofRecord:*(void *)(a1 + 40)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_updatePlacementForDisplayItems:(id)a3 ofRecord:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__3;
  v29 = __Block_byref_object_dispose__3;
  id v30 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__3;
  v23 = __Block_byref_object_dispose__3;
  id v24 = 0;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __74__WDMedicalRecordConceptSummary__updatePlacementForDisplayItems_ofRecord___block_invoke;
  id v14 = &unk_1E644B630;
  uint64_t v17 = &v25;
  id v7 = v5;
  id v15 = v7;
  objc_super v18 = &v19;
  id v8 = v6;
  id v16 = v8;
  [v7 enumerateObjectsUsingBlock:&v11];
  long long v9 = (void *)v26[5];
  if (v9 == (void *)v20[5])
  {
    uint64_t v10 = 2;
  }
  else
  {
    objc_msgSend(v9, "setPlacement:", 3, v11, v12, v13, v14, v15);
    long long v9 = (void *)v20[5];
    uint64_t v10 = 5;
  }
  objc_msgSend(v9, "setPlacement:", v10, v11, v12, v13, v14);
  [(id)v20[5] setSeparatorHidden:1];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
}

void __74__WDMedicalRecordConceptSummary__updatePlacementForDisplayItems_ofRecord___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (!a3) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  if ([*(id *)(a1 + 32) count] - 1 == a3) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  }
  [v6 setPlacement:4];
  [v6 setMedicalRecord:*(void *)(a1 + 40)];
}

- (WDMedicalRecordSummaryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WDMedicalRecordSummaryDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HRProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
}

- (NSMutableOrderedSet)allRecords
{
  return self->_allRecords;
}

- (void)setAllRecords:(id)a3
{
}

- (NSArray)allDisplayItems
{
  return self->_allDisplayItems;
}

- (void)setAllDisplayItems:(id)a3
{
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

- (BOOL)dirty
{
  return self->_dirty;
}

- (void)setDirty:(BOOL)a3
{
  self->_dirty = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceQueue, 0);
  objc_storeStrong((id *)&self->_summaryQueue, 0);
  objc_storeStrong((id *)&self->_allDisplayItems, 0);
  objc_storeStrong((id *)&self->_allRecords, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end