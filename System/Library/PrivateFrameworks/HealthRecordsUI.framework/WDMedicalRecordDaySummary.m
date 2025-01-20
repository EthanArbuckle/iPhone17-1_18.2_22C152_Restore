@interface WDMedicalRecordDaySummary
- (HRProfile)profile;
- (NSMutableDictionary)categoriesBySourceAlphaOrdered;
- (NSMutableDictionary)categoriesBySourceByType;
- (NSMutableSet)inProgressCatogorySummaries;
- (OS_dispatch_queue)resourceQueue;
- (WDMedicalRecordDaySummary)initWithProfile:(id)a3 style:(int64_t)a4 delegate:(id)a5;
- (WDMedicalRecordDaySummaryDelegate)delegate;
- (id)_alphaSortedCategories:(id)a3;
- (id)_alphaSortedKeysForCategories:(id)a3;
- (id)displayItemAtIndex:(int64_t)a3;
- (int64_t)numberOfDisplayItems;
- (int64_t)style;
- (void)addMedicalRecord:(id)a3;
- (void)recomputeIfNeeded;
- (void)setCategoriesBySourceAlphaOrdered:(id)a3;
- (void)setCategoriesBySourceByType:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInProgressCatogorySummaries:(id)a3;
- (void)setProfile:(id)a3;
- (void)setResourceQueue:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)summaryDidFinishRecompute:(id)a3;
@end

@implementation WDMedicalRecordDaySummary

- (WDMedicalRecordDaySummary)initWithProfile:(id)a3 style:(int64_t)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)WDMedicalRecordDaySummary;
  v11 = [(WDMedicalRecordDaySummary *)&v21 init];
  if (v11)
  {
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    categoriesBySourceAlphaOrdered = v11->_categoriesBySourceAlphaOrdered;
    v11->_categoriesBySourceAlphaOrdered = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    categoriesBySourceByType = v11->_categoriesBySourceByType;
    v11->_categoriesBySourceByType = v14;

    v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    inProgressCatogorySummaries = v11->_inProgressCatogorySummaries;
    v11->_inProgressCatogorySummaries = v16;

    objc_storeStrong((id *)&v11->_profile, a3);
    objc_storeWeak((id *)&v11->_delegate, v10);
    uint64_t v18 = HKCreateSerialDispatchQueue();
    resourceQueue = v11->_resourceQueue;
    v11->_resourceQueue = (OS_dispatch_queue *)v18;

    v11->_style = a4;
  }

  return v11;
}

- (void)addMedicalRecord:(id)a3
{
  id v4 = a3;
  v5 = [(WDMedicalRecordDaySummary *)self resourceQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__WDMedicalRecordDaySummary_addMedicalRecord___block_invoke;
  v7[3] = &unk_1E644ADD8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __46__WDMedicalRecordDaySummary_addMedicalRecord___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) categoriesBySourceByType];
  v3 = [*(id *)(a1 + 40) sourceRevision];
  id v4 = [v3 source];
  id v26 = [v2 objectForKeyedSubscript:v4];

  if (!v26)
  {
    id v26 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v5 = [*(id *)(a1 + 32) categoriesBySourceByType];
    id v6 = [*(id *)(a1 + 40) sourceRevision];
    v7 = [v6 source];
    [v5 setObject:v26 forKeyedSubscript:v7];
  }
  id v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "recordCategoryType"));
  id v9 = [v26 objectForKeyedSubscript:v8];
  if (!v9)
  {
    uint64_t v10 = [*(id *)(a1 + 32) style];
    if (v10 == 2)
    {
      uint64_t v18 = [WDMedicalRecordConceptSummary alloc];
      v12 = [*(id *)(a1 + 32) profile];
      uint64_t v19 = [(WDMedicalRecordConceptSummary *)v18 initWithProfile:v12 delegate:*(void *)(a1 + 32)];
    }
    else
    {
      if (v10 == 1)
      {
        v20 = [WDMedicalRecordCategorySummary alloc];
        v12 = [*(id *)(a1 + 32) profile];
        uint64_t v13 = [*(id *)(a1 + 40) recordCategoryType];
        uint64_t v14 = *(void *)(a1 + 32);
        v15 = v20;
        v16 = v12;
        uint64_t v17 = 0;
      }
      else
      {
        if (v10)
        {
          id v9 = 0;
          goto LABEL_13;
        }
        v11 = [WDMedicalRecordCategorySummary alloc];
        v12 = [*(id *)(a1 + 32) profile];
        uint64_t v13 = [*(id *)(a1 + 40) recordCategoryType];
        uint64_t v14 = *(void *)(a1 + 32);
        v15 = v11;
        v16 = v12;
        uint64_t v17 = 1;
      }
      uint64_t v19 = [(WDMedicalRecordCategorySummary *)v15 initWithProfile:v16 categoryType:v13 showCategoryTitle:v17 delegate:v14];
    }
    id v9 = (void *)v19;

LABEL_13:
    [v26 setObject:v9 forKeyedSubscript:v8];
    objc_super v21 = [*(id *)(a1 + 32) _alphaSortedCategories:v26];
    v22 = [*(id *)(a1 + 32) categoriesBySourceAlphaOrdered];
    v23 = [*(id *)(a1 + 40) sourceRevision];
    v24 = [v23 source];
    [v22 setObject:v21 forKeyedSubscript:v24];

    v25 = [*(id *)(a1 + 32) inProgressCatogorySummaries];
    [v25 addObject:v9];
  }
  [v9 addMedicalRecord:*(void *)(a1 + 40)];
}

- (void)recomputeIfNeeded
{
  v3 = [(WDMedicalRecordDaySummary *)self resourceQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__WDMedicalRecordDaySummary_recomputeIfNeeded__block_invoke;
  block[3] = &unk_1E644A6C0;
  block[4] = self;
  dispatch_async(v3, block);
}

void __46__WDMedicalRecordDaySummary_recomputeIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v2 = [*(id *)(a1 + 32) categoriesBySourceByType];
  v3 = [v2 allKeys];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 8 * v7);
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        id v9 = objc_msgSend(*(id *)(a1 + 32), "categoriesBySourceAlphaOrdered", 0);
        uint64_t v10 = [v9 objectForKeyedSubscript:v8];

        uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v16;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v16 != v13) {
                objc_enumerationMutation(v10);
              }
              [*(id *)(*((void *)&v15 + 1) + 8 * v14++) recomputeIfNeeded];
            }
            while (v12 != v14);
            uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
          }
          while (v12);
        }

        ++v7;
      }
      while (v7 != v5);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v5);
  }
}

- (int64_t)numberOfDisplayItems
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v3 = [(WDMedicalRecordDaySummary *)self resourceQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__WDMedicalRecordDaySummary_numberOfDisplayItems__block_invoke;
  v6[3] = &unk_1E644AE00;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __49__WDMedicalRecordDaySummary_numberOfDisplayItems__block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v2 = [*(id *)(a1 + 32) categoriesBySourceByType];
  v3 = [v2 allKeys];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v20 + 1) + 8 * v7);
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "categoriesBySourceAlphaOrdered", 0);
        uint64_t v10 = [v9 objectForKeyedSubscript:v8];

        uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v17;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v17 != v13) {
                objc_enumerationMutation(v10);
              }
              long long v15 = [*(id *)(*((void *)&v16 + 1) + 8 * v14) displayItems];
              *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += [v15 count];

              ++v14;
            }
            while (v12 != v14);
            uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
          }
          while (v12);
        }

        ++v7;
      }
      while (v7 != v5);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v5);
  }
}

- (id)displayItemAtIndex:(int64_t)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__0;
  uint64_t v13 = __Block_byref_object_dispose__0;
  id v14 = 0;
  uint64_t v5 = [(WDMedicalRecordDaySummary *)self resourceQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__WDMedicalRecordDaySummary_displayItemAtIndex___block_invoke;
  block[3] = &unk_1E644AE50;
  void block[5] = &v9;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(v5, block);

  if (!a3 && [(id)v10[5] displayItemType] == 2) {
    [(id)v10[5] setExtraTopPadding:0];
  }
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __48__WDMedicalRecordDaySummary_displayItemAtIndex___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = [*(id *)(a1 + 32) categoriesBySourceByType];
  v3 = [v2 allKeys];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v13;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v13 != v5) {
        objc_enumerationMutation(v3);
      }
      uint64_t v7 = *(void *)(*((void *)&v12 + 1) + 8 * v6);
      uint64_t v8 = [*(id *)(a1 + 32) categoriesBySourceAlphaOrdered];
      uint64_t v9 = [v8 objectForKeyedSubscript:v7];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __48__WDMedicalRecordDaySummary_displayItemAtIndex___block_invoke_2;
      v11[3] = &unk_1E644AE28;
      uint64_t v10 = *(void *)(a1 + 48);
      v11[5] = *(void *)(a1 + 40);
      v11[6] = v10;
      v11[4] = v16;
      [v9 enumerateObjectsUsingBlock:v11];

      if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v17 count:16];
        if (v4) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  _Block_object_dispose(v16, 8);
}

void __48__WDMedicalRecordDaySummary_displayItemAtIndex___block_invoke_2(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = objc_msgSend(a2, "displayItems", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(a1[4] + 8);
        uint64_t v12 = *(void *)(v11 + 24);
        if (v12 == a1[6])
        {
          objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), *(id *)(*((void *)&v13 + 1) + 8 * i));
          *a4 = 1;
          goto LABEL_11;
        }
        *(void *)(v11 + 24) = v12 + 1;
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)summaryDidFinishRecompute:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WDMedicalRecordDaySummary *)self resourceQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__WDMedicalRecordDaySummary_summaryDidFinishRecompute___block_invoke;
  v7[3] = &unk_1E644ADD8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __55__WDMedicalRecordDaySummary_summaryDidFinishRecompute___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) inProgressCatogorySummaries];
  [v2 removeObject:*(void *)(a1 + 40)];

  v3 = [*(id *)(a1 + 32) inProgressCatogorySummaries];
  uint64_t v4 = [v3 count];

  if (!v4)
  {
    id v5 = [*(id *)(a1 + 32) delegate];
    [v5 daySummaryHasDisplayItemUpdate:*(void *)(a1 + 32)];
  }
}

- (id)_alphaSortedKeysForCategories:(id)a3
{
  return (id)[a3 keysSortedByValueUsingComparator:&__block_literal_global_2];
}

uint64_t __59__WDMedicalRecordDaySummary__alphaSortedKeysForCategories___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 summarySortString];
  id v6 = [v4 summarySortString];

  uint64_t v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return v7;
}

- (id)_alphaSortedCategories:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = [(WDMedicalRecordDaySummary *)self _alphaSortedKeysForCategories:v4];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [v4 objectForKeyedSubscript:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (NSMutableDictionary)categoriesBySourceAlphaOrdered
{
  return self->_categoriesBySourceAlphaOrdered;
}

- (void)setCategoriesBySourceAlphaOrdered:(id)a3
{
}

- (NSMutableDictionary)categoriesBySourceByType
{
  return self->_categoriesBySourceByType;
}

- (void)setCategoriesBySourceByType:(id)a3
{
}

- (NSMutableSet)inProgressCatogorySummaries
{
  return self->_inProgressCatogorySummaries;
}

- (void)setInProgressCatogorySummaries:(id)a3
{
}

- (WDMedicalRecordDaySummaryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WDMedicalRecordDaySummaryDelegate *)WeakRetained;
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

- (OS_dispatch_queue)resourceQueue
{
  return self->_resourceQueue;
}

- (void)setResourceQueue:(id)a3
{
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceQueue, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_inProgressCatogorySummaries, 0);
  objc_storeStrong((id *)&self->_categoriesBySourceByType, 0);
  objc_storeStrong((id *)&self->_categoriesBySourceAlphaOrdered, 0);
}

@end