@interface WDMedicalRecordDisplayItemProvider
+ (id)allSupportedRecordCategories;
+ (id)allSupportedSampleTypes;
+ (id)supportedRecordCategoriesByCategoryType;
+ (id)unknownRecordCategory;
- (BOOL)loadingNextPage;
- (BOOL)removedRecordsOnly;
- (BOOL)shouldCancelDataCollection;
- (BOOL)shouldClearPagingCacheOnNextReload;
- (HKConcept)ontologyConcept;
- (HKMedicalUserDomainConcept)userDomainConcept;
- (HKMultiTypeSampleIterator)iterator;
- (HRProfile)profile;
- (NSArray)pendingDateLessGroups;
- (NSArray)pendingMedicalRecordGroups;
- (NSArray)preloadedRemovedRecords;
- (NSArray)sampleTypes;
- (NSArray)sortDescriptors;
- (NSDictionary)additionalPredicates;
- (NSDictionary)filterPredicatesByType;
- (NSMutableArray)dateLessGroups;
- (NSMutableArray)medicalRecordGroups;
- (NSPredicate)accountsPredicate;
- (NSPredicate)filter;
- (NSUUID)targetUUID;
- (OS_dispatch_queue)dataQueryQueue;
- (WDMedicalRecordDisplayItemProvider)initWithProfile:(id)a3 displayItemOptions:(int64_t)a4 sampleTypes:(id)a5 filter:(id)a6 additionalPredicates:(id)a7 sortDescriptors:(id)a8;
- (WDMedicalRecordDisplayItemProvider)initWithProfile:(id)a3 ontologyConcept:(id)a4 preloadedRemovedRecords:(id)a5 removedRecordsOnly:(BOOL)a6 displayItemOptions:(int64_t)a7 sampleTypes:(id)a8 filter:(id)a9 additionalPredicates:(id)a10 sortDescriptors:(id)a11;
- (WDMedicalRecordDisplayItemProvider)initWithProfile:(id)a3 userDomainConcept:(id)a4 preloadedRemovedRecords:(id)a5 removedRecordsOnly:(BOOL)a6 displayItemOptions:(int64_t)a7 sampleTypes:(id)a8 filter:(id)a9 additionalPredicates:(id)a10 sortDescriptors:(id)a11;
- (WDMedicalRecordPagingContext)pagingContext;
- (id)_displayItemGroupAtIndex:(int64_t)a3;
- (id)_queue_synthesizedPredicatesForMedicalType:(id)a3;
- (id)_sortedDisplayItemGroupWithDateDisplay:(id)a3 sourceDaySummaryMapping:(id)a4;
- (id)displayItemForIndexPath:(id)a3;
- (id)errorHandler;
- (id)indexPathForRecordId:(id)a3;
- (id)removedRecords;
- (id)sourceForGroupAtIndex:(int64_t)a3;
- (id)subtitleForGroupAtIndex:(int64_t)a3;
- (id)titleForGroupAtIndex:(int64_t)a3;
- (id)updateHandler;
- (int64_t)displayItemOptions;
- (int64_t)numOfRemovedRecords;
- (int64_t)numberOfDisplayItemsForGroupAtIndex:(int64_t)a3;
- (int64_t)numberOfGroups;
- (void)_commitPendingGroupsAndCallUpdateHandlerBypassGroupChangeDetermination:(BOOL)a3;
- (void)_displayItemGroupsForSummaryOfRecords:(id)a3 style:(int64_t)a4 completion:(id)a5;
- (void)_queue_processAccumulatedRecordsForPage:(id)a3;
- (void)_queue_queryForNextBatchOfData;
- (void)_queue_reload;
- (void)_queue_resetPagingCache;
- (void)_queue_resetPagingInformation;
- (void)_queue_setupIterator;
- (void)daySummaryHasDisplayItemUpdate:(id)a3;
- (void)reload;
- (void)requestDataOfNextPage;
- (void)setAccountsPredicate:(id)a3;
- (void)setDataQueryQueue:(id)a3;
- (void)setDateLessGroups:(id)a3;
- (void)setDisplayItemOptions:(int64_t)a3;
- (void)setErrorHandler:(id)a3;
- (void)setFilter:(id)a3;
- (void)setFilterPredicatesByType:(id)a3;
- (void)setIterator:(id)a3;
- (void)setLoadingNextPage:(BOOL)a3;
- (void)setMedicalRecordGroups:(id)a3;
- (void)setNumOfRemovedRecords:(int64_t)a3;
- (void)setOntologyConcept:(id)a3;
- (void)setPagingContext:(id)a3;
- (void)setPendingDateLessGroups:(id)a3;
- (void)setPendingMedicalRecordGroups:(id)a3;
- (void)setPreloadedRemovedRecords:(id)a3;
- (void)setProfile:(id)a3;
- (void)setRemovedRecordsOnly:(BOOL)a3;
- (void)setSampleTypes:(id)a3;
- (void)setSampleTypes:(id)a3 predicatesPerType:(id)a4 accountsPredicate:(id)a5;
- (void)setShouldCancelDataCollection:(BOOL)a3;
- (void)setShouldClearPagingCacheOnNextReload:(BOOL)a3;
- (void)setSortDescriptors:(id)a3;
- (void)setTargetUUID:(id)a3;
- (void)setUpdateHandler:(id)a3;
- (void)setUserDomainConcept:(id)a3;
- (void)startCollectingDataUntilRecordWithUUID:(id)a3 withUpdateHandler:(id)a4;
- (void)stopCollectingData;
@end

@implementation WDMedicalRecordDisplayItemProvider

+ (id)supportedRecordCategoriesByCategoryType
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__WDMedicalRecordDisplayItemProvider_supportedRecordCategoriesByCategoryType__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (supportedRecordCategoriesByCategoryType_onceToken[0] != -1) {
    dispatch_once(supportedRecordCategoriesByCategoryType_onceToken, block);
  }
  v2 = (void *)supportedRecordCategoriesByCategoryType_categoryDictionary;
  return v2;
}

- (WDMedicalRecordDisplayItemProvider)initWithProfile:(id)a3 ontologyConcept:(id)a4 preloadedRemovedRecords:(id)a5 removedRecordsOnly:(BOOL)a6 displayItemOptions:(int64_t)a7 sampleTypes:(id)a8 filter:(id)a9 additionalPredicates:(id)a10 sortDescriptors:(id)a11
{
  id v41 = a3;
  id v40 = a4;
  id v18 = a5;
  id v19 = a8;
  id v39 = a9;
  id v20 = a10;
  id v38 = a11;
  v42.receiver = self;
  v42.super_class = (Class)WDMedicalRecordDisplayItemProvider;
  v21 = [(WDMedicalRecordDisplayItemProvider *)&v42 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_profile, a3);
    objc_storeStrong((id *)&v22->_ontologyConcept, a4);
    uint64_t v23 = [v18 copy];
    preloadedRemovedRecords = v22->_preloadedRemovedRecords;
    v22->_preloadedRemovedRecords = (NSArray *)v23;

    v22->_removedRecordsOnly = a6;
    v22->_displayItemOptions = a7;
    if (v19)
    {
      v25 = (NSArray *)v19;
    }
    else
    {
      v25 = [(id)objc_opt_class() allSupportedSampleTypes];
    }
    sampleTypes = v22->_sampleTypes;
    v22->_sampleTypes = v25;

    objc_storeStrong((id *)&v22->_filter, a9);
    uint64_t v27 = [v20 copy];
    additionalPredicates = v22->_additionalPredicates;
    v22->_additionalPredicates = (NSDictionary *)v27;

    objc_storeStrong((id *)&v22->_sortDescriptors, a11);
    uint64_t v29 = HKCreateSerialDispatchQueue();
    dataQueryQueue = v22->_dataQueryQueue;
    v22->_dataQueryQueue = (OS_dispatch_queue *)v29;

    v31 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    medicalRecordGroups = v22->_medicalRecordGroups;
    v22->_medicalRecordGroups = v31;

    v33 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    dateLessGroups = v22->_dateLessGroups;
    v22->_dateLessGroups = v33;

    v22->_loadingNextPage = 0;
    v35 = objc_alloc_init(WDMedicalRecordPagingContext);
    pagingContext = v22->_pagingContext;
    v22->_pagingContext = v35;

    v22->_lock._os_unfair_lock_opaque = 0;
  }

  return v22;
}

- (WDMedicalRecordDisplayItemProvider)initWithProfile:(id)a3 userDomainConcept:(id)a4 preloadedRemovedRecords:(id)a5 removedRecordsOnly:(BOOL)a6 displayItemOptions:(int64_t)a7 sampleTypes:(id)a8 filter:(id)a9 additionalPredicates:(id)a10 sortDescriptors:(id)a11
{
  id v41 = a3;
  id v40 = a4;
  id v18 = a5;
  id v19 = a8;
  id v39 = a9;
  id v20 = a10;
  id v38 = a11;
  v42.receiver = self;
  v42.super_class = (Class)WDMedicalRecordDisplayItemProvider;
  v21 = [(WDMedicalRecordDisplayItemProvider *)&v42 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_profile, a3);
    objc_storeStrong((id *)&v22->_userDomainConcept, a4);
    uint64_t v23 = [v18 copy];
    preloadedRemovedRecords = v22->_preloadedRemovedRecords;
    v22->_preloadedRemovedRecords = (NSArray *)v23;

    v22->_removedRecordsOnly = a6;
    v22->_displayItemOptions = a7;
    if (v19)
    {
      v25 = (NSArray *)v19;
    }
    else
    {
      v25 = [(id)objc_opt_class() allSupportedSampleTypes];
    }
    sampleTypes = v22->_sampleTypes;
    v22->_sampleTypes = v25;

    objc_storeStrong((id *)&v22->_filter, a9);
    uint64_t v27 = [v20 copy];
    additionalPredicates = v22->_additionalPredicates;
    v22->_additionalPredicates = (NSDictionary *)v27;

    objc_storeStrong((id *)&v22->_sortDescriptors, a11);
    uint64_t v29 = HKCreateSerialDispatchQueue();
    dataQueryQueue = v22->_dataQueryQueue;
    v22->_dataQueryQueue = (OS_dispatch_queue *)v29;

    v31 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    medicalRecordGroups = v22->_medicalRecordGroups;
    v22->_medicalRecordGroups = v31;

    v33 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    dateLessGroups = v22->_dateLessGroups;
    v22->_dateLessGroups = v33;

    v35 = objc_alloc_init(WDMedicalRecordPagingContext);
    pagingContext = v22->_pagingContext;
    v22->_pagingContext = v35;

    v22->_lock._os_unfair_lock_opaque = 0;
  }

  return v22;
}

- (WDMedicalRecordDisplayItemProvider)initWithProfile:(id)a3 displayItemOptions:(int64_t)a4 sampleTypes:(id)a5 filter:(id)a6 additionalPredicates:(id)a7 sortDescriptors:(id)a8
{
  return [(WDMedicalRecordDisplayItemProvider *)self initWithProfile:a3 ontologyConcept:0 preloadedRemovedRecords:0 removedRecordsOnly:0 displayItemOptions:a4 sampleTypes:a5 filter:a6 additionalPredicates:a7 sortDescriptors:a8];
}

- (BOOL)loadingNextPage
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_loadingNextPage;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setLoadingNextPage:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_loadingNextPage = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)reload
{
  v3 = [(WDMedicalRecordDisplayItemProvider *)self dataQueryQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__WDMedicalRecordDisplayItemProvider_reload__block_invoke;
  block[3] = &unk_1E644A6C0;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __44__WDMedicalRecordDisplayItemProvider_reload__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_reload");
}

- (void)setFilter:(id)a3
{
  id v4 = a3;
  v5 = [(WDMedicalRecordDisplayItemProvider *)self dataQueryQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__WDMedicalRecordDisplayItemProvider_setFilter___block_invoke;
  v7[3] = &unk_1E644ADD8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __48__WDMedicalRecordDisplayItemProvider_setFilter___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 32) isEqual:*(void *)(a1 + 40)];
  if ((result & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 40));
    v3 = *(void **)(a1 + 32);
    return objc_msgSend(v3, "_queue_reload");
  }
  return result;
}

- (void)setFilterPredicatesByType:(id)a3
{
  id v4 = a3;
  v5 = [(WDMedicalRecordDisplayItemProvider *)self dataQueryQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__WDMedicalRecordDisplayItemProvider_setFilterPredicatesByType___block_invoke;
  v7[3] = &unk_1E644ADD8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __64__WDMedicalRecordDisplayItemProvider_setFilterPredicatesByType___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  return objc_msgSend(v2, "_queue_reload");
}

- (void)setSampleTypes:(id)a3 predicatesPerType:(id)a4 accountsPredicate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(WDMedicalRecordDisplayItemProvider *)self dataQueryQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __89__WDMedicalRecordDisplayItemProvider_setSampleTypes_predicatesPerType_accountsPredicate___block_invoke;
  v15[3] = &unk_1E644A710;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

uint64_t __89__WDMedicalRecordDisplayItemProvider_setSampleTypes_predicatesPerType_accountsPredicate___block_invoke(id *a1)
{
  v3 = a1 + 4;
  id v2 = a1[4];
  if (v3[1])
  {
    objc_msgSend(v2, "setSampleTypes:");
  }
  else
  {
    id v4 = [(id)objc_opt_class() allSupportedSampleTypes];
    [a1[4] setSampleTypes:v4];
  }
  objc_storeStrong((id *)a1[4] + 3, a1[6]);
  objc_storeStrong((id *)a1[4] + 18, a1[7]);
  id v5 = a1[4];
  return objc_msgSend(v5, "_queue_reload");
}

- (void)startCollectingDataUntilRecordWithUUID:(id)a3 withUpdateHandler:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_lock);
  [(WDMedicalRecordDisplayItemProvider *)self setUpdateHandler:v7];

  [(WDMedicalRecordDisplayItemProvider *)self setTargetUUID:v8];
  [(WDMedicalRecordDisplayItemProvider *)self setShouldCancelDataCollection:0];
  os_unfair_lock_unlock(p_lock);
  if ([(WDMedicalRecordDisplayItemProvider *)self numberOfGroups] >= 1) {
    [(WDMedicalRecordDisplayItemProvider *)self _commitPendingGroupsAndCallUpdateHandlerBypassGroupChangeDetermination:0];
  }
  id v9 = [(WDMedicalRecordDisplayItemProvider *)self dataQueryQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__WDMedicalRecordDisplayItemProvider_startCollectingDataUntilRecordWithUUID_withUpdateHandler___block_invoke;
  block[3] = &unk_1E644A6C0;
  block[4] = self;
  dispatch_async(v9, block);
}

uint64_t __95__WDMedicalRecordDisplayItemProvider_startCollectingDataUntilRecordWithUUID_withUpdateHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_reload");
}

- (void)stopCollectingData
{
  [(WDMedicalRecordDisplayItemProvider *)self setUpdateHandler:0];
  [(WDMedicalRecordDisplayItemProvider *)self setTargetUUID:0];
  [(WDMedicalRecordDisplayItemProvider *)self setShouldCancelDataCollection:1];
}

- (void)requestDataOfNextPage
{
  v3 = [(WDMedicalRecordDisplayItemProvider *)self dataQueryQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__WDMedicalRecordDisplayItemProvider_requestDataOfNextPage__block_invoke;
  block[3] = &unk_1E644A6C0;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __59__WDMedicalRecordDisplayItemProvider_requestDataOfNextPage__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_queryForNextBatchOfData");
}

- (int64_t)numberOfGroups
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(WDMedicalRecordDisplayItemProvider *)self medicalRecordGroups];
  int64_t v5 = [v4 count];

  id v6 = [(WDMedicalRecordDisplayItemProvider *)self pagingContext];
  char v7 = [v6 hasMoreData];

  if ((v7 & 1) == 0)
  {
    id v8 = [(WDMedicalRecordDisplayItemProvider *)self dateLessGroups];
    v5 += [v8 count];
  }
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (int64_t)numberOfDisplayItemsForGroupAtIndex:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = [(WDMedicalRecordDisplayItemProvider *)self _displayItemGroupAtIndex:a3];
  int64_t v7 = [v6 numberOfDisplayItems];
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (id)displayItemForIndexPath:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = -[WDMedicalRecordDisplayItemProvider _displayItemGroupAtIndex:](self, "_displayItemGroupAtIndex:", [v5 section]);
  uint64_t v7 = [v5 row];

  id v8 = [v6 displayItemAtIndex:v7];
  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (id)indexPathForRecordId:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  id v5 = [(WDMedicalRecordDisplayItemProvider *)self medicalRecordGroups];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = 0;
    while (1)
    {
      id v8 = [(WDMedicalRecordDisplayItemProvider *)self _displayItemGroupAtIndex:v7];
      if ([v8 numberOfDisplayItems] >= 1) {
        break;
      }
LABEL_7:

      ++v7;
      id v14 = [(WDMedicalRecordDisplayItemProvider *)self medicalRecordGroups];
      unint64_t v15 = [v14 count];

      if (v7 >= v15) {
        goto LABEL_8;
      }
    }
    uint64_t v9 = 0;
    while (1)
    {
      id v10 = [v8 displayItemAtIndex:v9];
      v11 = [v10 medicalRecord];
      id v12 = [v11 UUID];
      char v13 = [v4 isEqual:v12];

      if (v13) {
        break;
      }

      if (++v9 >= [v8 numberOfDisplayItems]) {
        goto LABEL_7;
      }
    }
    os_unfair_lock_unlock(&self->_lock);
    id v16 = [MEMORY[0x1E4F28D58] indexPathForRow:v9 inSection:v7];
  }
  else
  {
LABEL_8:
    os_unfair_lock_unlock(&self->_lock);
    id v16 = 0;
  }

  return v16;
}

- (id)titleForGroupAtIndex:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = [(WDMedicalRecordDisplayItemProvider *)self _displayItemGroupAtIndex:a3];
  unint64_t v7 = [v6 title];
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (id)subtitleForGroupAtIndex:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = [(WDMedicalRecordDisplayItemProvider *)self _displayItemGroupAtIndex:a3];
  unint64_t v7 = [v6 subtitle];
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (id)sourceForGroupAtIndex:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = [(WDMedicalRecordDisplayItemProvider *)self _displayItemGroupAtIndex:a3];
  unint64_t v7 = [v6 source];
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (id)removedRecords
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_dataQueryQueue);
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  id v12 = 0;
  dataQueryQueue = self->_dataQueryQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__WDMedicalRecordDisplayItemProvider_removedRecords__block_invoke;
  v6[3] = &unk_1E644B0F8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(dataQueryQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __52__WDMedicalRecordDisplayItemProvider_removedRecords__block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) pagingContext];
  id v2 = [v6 removedRecords];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)_queue_reload
{
  uint64_t v3 = [(WDMedicalRecordDisplayItemProvider *)self dataQueryQueue];
  dispatch_assert_queue_V2(v3);

  if (self->_shouldClearPagingCacheOnNextReload)
  {
    [(WDMedicalRecordDisplayItemProvider *)self _queue_resetPagingCache];
    self->_shouldClearPagingCacheOnNextReload = 0;
  }
  [(WDMedicalRecordDisplayItemProvider *)self _queue_resetPagingInformation];
  [(WDMedicalRecordDisplayItemProvider *)self _queue_queryForNextBatchOfData];
}

- (void)_queue_setupIterator
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = [(WDMedicalRecordDisplayItemProvider *)self sampleTypes];
  uint64_t v4 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v38;
    uint64_t v36 = *MEMORY[0x1E4F29900];
    unint64_t v7 = 0x1E4F2B000uLL;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v38 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v37 + 1) + 8 * v8);
        id v10 = [(WDMedicalRecordDisplayItemProvider *)self ontologyConcept];

        if (v10)
        {
          v11 = *(void **)(v7 + 960);
          id v12 = [(WDMedicalRecordDisplayItemProvider *)self ontologyConcept];
          char v13 = [v12 identifier];
          id v14 = [v11 predicateForSamplesWithConceptIdentifier:v13 keyPath:v36];
        }
        else
        {
          unint64_t v15 = [(WDMedicalRecordDisplayItemProvider *)self userDomainConcept];

          if (v15)
          {
            id v16 = [(WDMedicalRecordDisplayItemProvider *)self filterPredicatesByType];
            id v12 = [v16 objectForKeyedSubscript:v9];

            id v17 = *(void **)(v7 + 960);
            id v18 = [(WDMedicalRecordDisplayItemProvider *)self userDomainConcept];
            id v19 = [v17 predicateForMedicalRecordsAssociatedWithMedicalUserDomainConcept:v18];

            id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            v21 = v20;
            if (v12) {
              [v20 addObject:v12];
            }
            if (v19) {
              [v21 addObject:v19];
            }
            if ([v21 count])
            {
              id v14 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v21];
            }
            else
            {
              id v14 = 0;
            }

            unint64_t v7 = 0x1E4F2B000uLL;
          }
          else
          {
            id v12 = [(WDMedicalRecordDisplayItemProvider *)self _queue_synthesizedPredicatesForMedicalType:v9];
            if ([v12 count])
            {
              id v14 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v12];
            }
            else
            {
              id v14 = 0;
            }
          }
        }

        if (self->_removedRecordsOnly)
        {
          v22 = [*(id *)(v7 + 960) predicateForMedicalRecordWithState:1];
          uint64_t v23 = v22;
          if (v14)
          {
            v24 = (void *)MEMORY[0x1E4F28BA0];
            v42[0] = v22;
            v42[1] = v14;
            v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
            uint64_t v26 = [v24 andPredicateWithSubpredicates:v25];

            unint64_t v7 = 0x1E4F2B000;
            id v14 = (id)v26;
          }
          else
          {
            id v14 = v22;
          }
        }
        uint64_t v27 = [MEMORY[0x1E4F2B3D0] queryDescriptorWithSampleType:v9 predicate:v14];
        [v3 addObject:v27];

        ++v8;
      }
      while (v5 != v8);
      uint64_t v28 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
      uint64_t v5 = v28;
    }
    while (v28);
  }

  uint64_t v29 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:*MEMORY[0x1E4F2A008] ascending:0];
  id v30 = objc_alloc(MEMORY[0x1E4F2B238]);
  id v41 = v29;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
  v32 = [(WDMedicalRecordDisplayItemProvider *)self profile];
  v33 = [v32 healthStore];
  v34 = (void *)[v30 initWithQueryDescriptors:v3 sortDescriptors:v31 bufferSize:16 healthStore:v33];
  [(WDMedicalRecordDisplayItemProvider *)self setIterator:v34];
}

- (void)_queue_resetPagingInformation
{
  id v3 = [(WDMedicalRecordDisplayItemProvider *)self dataQueryQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(WDMedicalRecordDisplayItemProvider *)self pagingContext];
  [v4 resetPagingContext];

  [(WDMedicalRecordDisplayItemProvider *)self _queue_setupIterator];
  id v5 = [(WDMedicalRecordDisplayItemProvider *)self pagingContext];
  [v5 setPagingContextReady:1];
}

- (void)_queue_resetPagingCache
{
  id v3 = [(WDMedicalRecordDisplayItemProvider *)self dataQueryQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(WDMedicalRecordDisplayItemProvider *)self setMedicalRecordGroups:v4];

  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(WDMedicalRecordDisplayItemProvider *)self setDateLessGroups:v5];
}

- (id)_queue_synthesizedPredicatesForMedicalType:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  unint64_t v7 = [(WDMedicalRecordDisplayItemProvider *)self additionalPredicates];
  uint64_t v8 = [v7 objectForKeyedSubscript:v5];

  if (v8) {
    [v6 addObject:v8];
  }
  uint64_t v9 = [(WDMedicalRecordDisplayItemProvider *)self filter];

  if (v9)
  {
    id v10 = [(WDMedicalRecordDisplayItemProvider *)self filter];
    [v6 addObject:v10];
  }
  v11 = [(WDMedicalRecordDisplayItemProvider *)self accountsPredicate];

  if (v11)
  {
    id v12 = [(WDMedicalRecordDisplayItemProvider *)self accountsPredicate];
    [v6 addObject:v12];
  }
  return v6;
}

- (id)_displayItemGroupAtIndex:(int64_t)a3
{
  id v5 = [(WDMedicalRecordDisplayItemProvider *)self medicalRecordGroups];
  unint64_t v6 = [v5 count];

  unint64_t v7 = [(WDMedicalRecordDisplayItemProvider *)self medicalRecordGroups];
  uint64_t v8 = v7;
  if (v6 <= a3)
  {
    a3 -= [v7 count];

    unint64_t v7 = [(WDMedicalRecordDisplayItemProvider *)self dateLessGroups];
    uint64_t v8 = v7;
  }
  uint64_t v9 = [v7 objectAtIndexedSubscript:a3];

  return v9;
}

- (void)_commitPendingGroupsAndCallUpdateHandlerBypassGroupChangeDetermination:(BOOL)a3
{
  objc_initWeak(&location, self);
  id v5 = [(WDMedicalRecordDisplayItemProvider *)self dataQueryQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __109__WDMedicalRecordDisplayItemProvider__commitPendingGroupsAndCallUpdateHandlerBypassGroupChangeDetermination___block_invoke;
  block[3] = &unk_1E644B448;
  objc_copyWeak(&v7, &location);
  BOOL v8 = a3;
  dispatch_async(v5, block);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __109__WDMedicalRecordDisplayItemProvider__commitPendingGroupsAndCallUpdateHandlerBypassGroupChangeDetermination___block_invoke(uint64_t a1)
{
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [(os_unfair_lock_s *)WeakRetained pendingMedicalRecordGroups];
    id v5 = (void *)[v4 copy];

    unint64_t v6 = [(os_unfair_lock_s *)v3 pendingDateLessGroups];
    id v7 = (void *)[v6 copy];

    [(os_unfair_lock_s *)v3 setPendingMedicalRecordGroups:0];
    [(os_unfair_lock_s *)v3 setPendingDateLessGroups:0];
    BOOL v8 = [(os_unfair_lock_s *)v3 pagingContext];
    uint64_t v9 = [v8 removedRecords];
    uint64_t v10 = [v9 count];

    os_unfair_lock_lock(v3 + 2);
    BOOL v11 = *(unsigned char *)(a1 + 40) || [v5 count] || objc_msgSend(v7, "count") != 0;
    id v12 = [(os_unfair_lock_s *)v3 pagingContext];
    int v13 = [v12 shouldClearDisplayItemGroups];

    if (v13)
    {
      id v14 = [(os_unfair_lock_s *)v3 pagingContext];
      [v14 setShouldClearDisplayItemGroups:0];

      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [(os_unfair_lock_s *)v3 setMedicalRecordGroups:v15];

      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [(os_unfair_lock_s *)v3 setDateLessGroups:v16];

      BOOL v11 = 1;
    }
    id v17 = [(os_unfair_lock_s *)v3 medicalRecordGroups];
    [v17 addObjectsFromArray:v5];

    id v18 = [(os_unfair_lock_s *)v3 dateLessGroups];
    [v18 addObjectsFromArray:v7];

    [(os_unfair_lock_s *)v3 setNumOfRemovedRecords:v10];
    id v19 = [(os_unfair_lock_s *)v3 pagingContext];
    if ([v19 hasMoreData])
    {
    }
    else
    {
      uint64_t v20 = [(os_unfair_lock_s *)v3 numOfRemovedRecords];

      if (v20 > 0) {
        BOOL v11 = 1;
      }
    }
    os_unfair_lock_unlock(v3 + 2);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __109__WDMedicalRecordDisplayItemProvider__commitPendingGroupsAndCallUpdateHandlerBypassGroupChangeDetermination___block_invoke_2;
    v21[3] = &unk_1E644AB70;
    v21[4] = v3;
    BOOL v22 = v11;
    dispatch_async(MEMORY[0x1E4F14428], v21);
  }
}

void __109__WDMedicalRecordDisplayItemProvider__commitPendingGroupsAndCallUpdateHandlerBypassGroupChangeDetermination___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) updateHandler];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) updateHandler];
    v3[2](v3, *(unsigned __int8 *)(a1 + 40));
  }
}

- (void)_queue_queryForNextBatchOfData
{
  id v3 = [(WDMedicalRecordDisplayItemProvider *)self dataQueryQueue];
  dispatch_assert_queue_V2(v3);

  if ([(WDMedicalRecordDisplayItemProvider *)self shouldCancelDataCollection]) {
    return;
  }
  id v4 = [(WDMedicalRecordDisplayItemProvider *)self pagingContext];
  int v5 = [v4 shouldQueryForNextBatch];

  if (!v5) {
    return;
  }
  unint64_t v6 = [(WDMedicalRecordDisplayItemProvider *)self pagingContext];
  [v6 setFetchingCurrentPage:1];

  id v7 = [(WDMedicalRecordDisplayItemProvider *)self preloadedRemovedRecords];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    uint64_t v9 = [(WDMedicalRecordDisplayItemProvider *)self pagingContext];
    [v9 setFetchingCurrentPage:0];

    uint64_t v10 = [(WDMedicalRecordDisplayItemProvider *)self pagingContext];
    [v10 setHasMoreData:0];

    id v48 = [(WDMedicalRecordDisplayItemProvider *)self preloadedRemovedRecords];
    [(WDMedicalRecordDisplayItemProvider *)self _queue_processAccumulatedRecordsForPage:v48];

    return;
  }
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v12 = [(WDMedicalRecordDisplayItemProvider *)self iterator];
  int v13 = [v12 sample];

  if (v13)
  {
    id v14 = 0;
  }
  else
  {
    id v15 = [(WDMedicalRecordDisplayItemProvider *)self iterator];
    id v51 = 0;
    [v15 advanceWithError:&v51];
    id v14 = v51;
  }
  id v16 = [(WDMedicalRecordDisplayItemProvider *)self iterator];
  id v17 = [v16 sample];

  if (v17)
  {
    id v18 = [v17 meaningfulDateDisplayStringWithPreferredForm:1 showTime:0];
    [v11 addObject:v17];
  }
  else
  {
    id v18 = 0;
  }
  int v47 = 0;
  while (1)
  {
    id v19 = v14;
    uint64_t v20 = [(WDMedicalRecordDisplayItemProvider *)self iterator];
    id v50 = v14;
    [v20 advanceWithError:&v50];
    id v14 = v50;

    v21 = [(WDMedicalRecordDisplayItemProvider *)self iterator];
    uint64_t v22 = [v21 sample];
    if (v17 == (void *)v22)
    {

LABEL_28:
      uint64_t v28 = [(WDMedicalRecordDisplayItemProvider *)self pagingContext];
      [v28 setHasMoreData:0];
LABEL_30:

      id v41 = [(WDMedicalRecordDisplayItemProvider *)self errorHandler];

      if (v41 && v14)
      {
        objc_super v42 = [(WDMedicalRecordDisplayItemProvider *)self errorHandler];
        ((void (**)(void, id))v42)[2](v42, v14);
      }
      v43 = [(WDMedicalRecordDisplayItemProvider *)self pagingContext];
      [v43 setFetchingCurrentPage:0];

      [(WDMedicalRecordDisplayItemProvider *)self _queue_processAccumulatedRecordsForPage:v11];
      goto LABEL_34;
    }
    uint64_t v23 = (void *)v22;
    v24 = [(WDMedicalRecordDisplayItemProvider *)self iterator];
    v25 = [v24 sample];

    if (!v25) {
      goto LABEL_28;
    }
    uint64_t v26 = [(WDMedicalRecordDisplayItemProvider *)self iterator];
    uint64_t v27 = [v26 sample];

    uint64_t v28 = [v27 meaningfulDateDisplayStringWithPreferredForm:1 showTime:0];
    int v29 = 0;
    if ((unint64_t)[v11 count] >= 9) {
      int v29 = [v28 isEqual:v18] ^ 1;
    }
    id v30 = [(WDMedicalRecordDisplayItemProvider *)self ontologyConcept];

    if (!v30)
    {
LABEL_25:
      if (v29) {
        goto LABEL_29;
      }
      goto LABEL_26;
    }
    id v49 = v14;
    v31 = v18;
    id v32 = v11;
    v33 = [(WDMedicalRecordDisplayItemProvider *)self ontologyConcept];
    v34 = [v27 primaryConcept];
    v35 = [v34 groupByConcept];
    char v36 = [v33 isEqual:v35];

    if ((v36 & 1) == 0) {
      break;
    }
    long long v37 = [(WDMedicalRecordDisplayItemProvider *)self targetUUID];

    id v11 = v32;
    id v18 = v31;
    id v14 = v49;
    if (!v37) {
      goto LABEL_25;
    }
    long long v38 = [v27 UUID];
    long long v39 = [(WDMedicalRecordDisplayItemProvider *)self targetUUID];
    int v40 = [v38 isEqual:v39];

    if (v40)
    {
      [(WDMedicalRecordDisplayItemProvider *)self setTargetUUID:0];
      int v47 = 1;
    }
    if (v47 & v29)
    {
LABEL_29:
      id v17 = v27;
      goto LABEL_30;
    }
LABEL_26:

    [v11 addObject:v27];
    id v18 = v28;
    id v17 = v27;
  }
  uint64_t v44 = [(WDMedicalRecordDisplayItemProvider *)self errorHandler];

  id v11 = v32;
  if (v44)
  {
    v45 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.health.HealthRecordsUI" code:100 userInfo:0];
    v46 = [(WDMedicalRecordDisplayItemProvider *)self errorHandler];
    ((void (**)(void, void *))v46)[2](v46, v45);
  }
  id v17 = v27;
  id v18 = v31;
  id v14 = v49;
LABEL_34:
}

- (void)_queue_processAccumulatedRecordsForPage:(id)a3
{
  id v4 = a3;
  int v5 = [(WDMedicalRecordDisplayItemProvider *)self dataQueryQueue];
  dispatch_assert_queue_V2(v5);

  unint64_t v6 = [v4 sortedArrayUsingComparator:&__block_literal_global_5];
  id v7 = [(WDMedicalRecordDisplayItemProvider *)self pagingContext];
  uint64_t v8 = [v7 unprocessedRecords];
  [v8 addObjectsFromArray:v6];

  uint64_t v9 = [(WDMedicalRecordDisplayItemProvider *)self pagingContext];
  uint64_t v10 = [v9 unprocessedRecords];
  id v11 = objc_msgSend(v10, "hk_filter:", &__block_literal_global_355);

  if ((unint64_t)[v11 count] <= 8
    && ([(WDMedicalRecordDisplayItemProvider *)self pagingContext],
        id v12 = objc_claimAutoreleasedReturnValue(),
        char v13 = [v12 hasMoreData],
        v12,
        (v13 & 1) != 0))
  {
    id v14 = [(WDMedicalRecordDisplayItemProvider *)self pagingContext];
    int v15 = [v14 hasMoreData];

    if (v15) {
      [(WDMedicalRecordDisplayItemProvider *)self _queue_queryForNextBatchOfData];
    }
    else {
      [(WDMedicalRecordDisplayItemProvider *)self _commitPendingGroupsAndCallUpdateHandlerBypassGroupChangeDetermination:0];
    }
  }
  else
  {
    int64_t v16 = self->_displayItemOptions & 1;
    id v17 = [(WDMedicalRecordDisplayItemProvider *)self ontologyConcept];

    if (v17) {
      uint64_t v18 = 2;
    }
    else {
      uint64_t v18 = v16;
    }
    objc_initWeak(&location, self);
    id v19 = [(WDMedicalRecordDisplayItemProvider *)self pagingContext];
    uint64_t v20 = [v19 unprocessedRecords];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __78__WDMedicalRecordDisplayItemProvider__queue_processAccumulatedRecordsForPage___block_invoke_3;
    v21[3] = &unk_1E644B4B0;
    objc_copyWeak(&v22, &location);
    v21[4] = self;
    [(WDMedicalRecordDisplayItemProvider *)self _displayItemGroupsForSummaryOfRecords:v20 style:v18 completion:v21];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
}

uint64_t __78__WDMedicalRecordDisplayItemProvider__queue_processAccumulatedRecordsForPage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v6 = v4;
    id v7 = v5;
    uint64_t v8 = [v7 sortDate];
    uint64_t v9 = [v6 sortDate];
    uint64_t v10 = [v8 compare:v9];

    if (!v10)
    {
      id v11 = [v6 displayNameForGroupByConcept];
      id v12 = [v7 displayNameForGroupByConcept];
      uint64_t v10 = [v11 localizedStandardCompare:v12];
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

uint64_t __78__WDMedicalRecordDisplayItemProvider__queue_processAccumulatedRecordsForPage___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isDisplayable] && (objc_msgSend(v2, "isDateLess") & 1) == 0) {
    uint64_t v3 = [v2 isRemovedFromRemote] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

void __78__WDMedicalRecordDisplayItemProvider__queue_processAccumulatedRecordsForPage___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v9 = [WeakRetained pagingContext];
    uint64_t v10 = [v9 unprocessedRecords];
    [v10 removeAllObjects];

    [v8 setPendingMedicalRecordGroups:v5];
    [v8 setPendingDateLessGroups:v6];
    id v11 = [v8 pagingContext];
    id v12 = [v11 removedRecords];
    uint64_t v13 = [v12 count];

    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
    id v14 = [v8 medicalRecordGroups];
    if ([v14 count] || objc_msgSend(v5, "count"))
    {
      BOOL v15 = 0;
    }
    else
    {
      v21 = [v8 dateLessGroups];
      if ([v21 count]) {
        BOOL v15 = 0;
      }
      else {
        BOOL v15 = [v6 count] == 0;
      }
    }
    int64_t v16 = [v8 pagingContext];
    int v17 = [v16 hasMoreData];

    if (v17 || !v15)
    {
      uint64_t v18 = [v8 dataQueryQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __78__WDMedicalRecordDisplayItemProvider__queue_processAccumulatedRecordsForPage___block_invoke_4;
      block[3] = &unk_1E644A6C0;
      void block[4] = v8;
      dispatch_async(v18, block);
    }
    else
    {
      [v8 _commitPendingGroupsAndCallUpdateHandlerBypassGroupChangeDetermination:0];
    }
    id v19 = [v8 pagingContext];
    char v20 = [v19 hasMoreData];

    if ((v20 & 1) == 0 && v13) {
      [v8 _commitPendingGroupsAndCallUpdateHandlerBypassGroupChangeDetermination:0];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  }
}

void __78__WDMedicalRecordDisplayItemProvider__queue_processAccumulatedRecordsForPage___block_invoke_4(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v1 = objc_msgSend(*(id *)(a1 + 32), "pagingContext", 0);
  id v2 = [v1 computingDaySummaries];

  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) recomputeIfNeeded];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_displayItemGroupsForSummaryOfRecords:(id)a3 style:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  BOOL v10 = [(WDMedicalRecordDisplayItemProvider *)self removedRecordsOnly];
  objc_initWeak(&location, self);
  id v11 = [(WDMedicalRecordDisplayItemProvider *)self dataQueryQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __93__WDMedicalRecordDisplayItemProvider__displayItemGroupsForSummaryOfRecords_style_completion___block_invoke;
  v14[3] = &unk_1E644B4D8;
  objc_copyWeak(v17, &location);
  BOOL v18 = v10;
  v17[1] = (id)a4;
  id v15 = v8;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(v11, v14);

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
}

void __93__WDMedicalRecordDisplayItemProvider__displayItemGroupsForSummaryOfRecords_style_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_39;
  }
  id v50 = WeakRetained;
  id v46 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v47 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id obj = *(id *)(v1 + 32);
  uint64_t v6 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
  id v51 = v4;
  uint64_t v48 = v1;
  id v49 = v5;
  if (!v6) {
    goto LABEL_23;
  }
  uint64_t v7 = v6;
  uint64_t v8 = 0;
  uint64_t v9 = *(void *)v60;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v60 != v9) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(void **)(*((void *)&v59 + 1) + 8 * i);
      if ((objc_msgSend(v11, "isDisplayable", v46) & 1) == 0) {
        goto LABEL_11;
      }
      if (!*(unsigned char *)(v1 + 64) && [v11 isRemovedFromRemote])
      {
        id v12 = [v50 pagingContext];
        id v13 = [v12 removedRecords];
        [v13 addObject:v11];

LABEL_11:
        ++v8;
        continue;
      }
      if ([v11 isDateLess])
      {
        id v14 = [v11 sourceRevision];
        id v15 = [v14 source];

        id v16 = [v5 objectForKeyedSubscript:v15];
        if (!v16)
        {
          int v17 = [WDMedicalRecordDaySummary alloc];
          [v50 profile];
          BOOL v18 = v53 = v8;
          id v16 = [(WDMedicalRecordDaySummary *)v17 initWithProfile:v18 style:*(void *)(v1 + 56) delegate:v50];

          [v49 setObject:v16 forKeyedSubscript:v15];
          id v5 = v49;
          id v19 = [v50 pagingContext];
          char v20 = [v19 computingDaySummaries];
          [v20 addObject:v16];

          id v4 = v51;
          uint64_t v8 = v53;
        }
        [(WDMedicalRecordDaySummary *)v16 addMedicalRecord:v11];
      }
      else
      {
        uint64_t v54 = v8;
        v21 = [v11 meaningfulDateDisplayStringWithPreferredForm:1 showTime:0];
        id v22 = [v4 objectForKeyedSubscript:v21];
        if (!v22)
        {
          id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          [v4 setObject:v22 forKeyedSubscript:v21];
          [v47 addObject:v21];
        }
        uint64_t v23 = [v11 sourceRevision];
        v24 = [v23 source];

        v25 = [v22 objectForKeyedSubscript:v24];
        if (!v25)
        {
          uint64_t v26 = [WDMedicalRecordDaySummary alloc];
          uint64_t v27 = [v50 profile];
          v25 = [(WDMedicalRecordDaySummary *)v26 initWithProfile:v27 style:*(void *)(v48 + 56) delegate:v50];

          [v22 setObject:v25 forKeyedSubscript:v24];
          uint64_t v28 = [v50 pagingContext];
          int v29 = [v28 computingDaySummaries];
          [v29 addObject:v25];

          uint64_t v1 = v48;
          id v5 = v49;
        }
        [(WDMedicalRecordDaySummary *)v25 addMedicalRecord:v11];

        id v4 = v51;
        uint64_t v8 = v54;
      }
    }
    uint64_t v7 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
  }
  while (v7);
LABEL_23:

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v30 = v47;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v55 objects:v63 count:16];
  uint64_t v3 = v50;
  id v32 = v46;
  if (v31)
  {
    uint64_t v33 = v31;
    uint64_t v34 = *(void *)v56;
    do
    {
      for (uint64_t j = 0; j != v33; ++j)
      {
        if (*(void *)v56 != v34) {
          objc_enumerationMutation(v30);
        }
        uint64_t v36 = *(void *)(*((void *)&v55 + 1) + 8 * j);
        long long v37 = objc_msgSend(v4, "objectForKeyedSubscript:", v36, v46);
        long long v38 = [v50 _sortedDisplayItemGroupWithDateDisplay:v36 sourceDaySummaryMapping:v37];

        [v32 addObjectsFromArray:v38];
      }
      uint64_t v33 = [v30 countByEnumeratingWithState:&v55 objects:v63 count:16];
    }
    while (v33);
  }

  long long v39 = [MEMORY[0x1E4F2B628] unknownRecordType];
  int v40 = [v50 sampleTypes];
  if ([v40 count] == 1)
  {
    id v41 = [v50 sampleTypes];
    objc_super v42 = [v41 firstObject];

    if (v42 == v39)
    {
      v43 = 0;
      goto LABEL_35;
    }
  }
  else
  {
  }
  uint64_t v44 = HKHealthKitFrameworkBundle();
  v43 = [v44 localizedStringForKey:@"MEDICAL_RECORD_SUMMARY_NO_DATE_SECTION_TITLE" value:&stru_1F1D9FF30 table:@"Localizable-Clinical-Health-Records"];

LABEL_35:
  if (objc_msgSend(v49, "count", v46))
  {
    v45 = [v50 _sortedDisplayItemGroupWithDateDisplay:v43 sourceDaySummaryMapping:v49];
  }
  else
  {
    v45 = 0;
  }
  (*(void (**)(void))(*(void *)(v48 + 40) + 16))();

LABEL_39:
}

- (id)_sortedDisplayItemGroupWithDateDisplay:(id)a3 sourceDaySummaryMapping:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v8 = [v6 allKeys];
  uint64_t v9 = [v8 sortedArrayUsingComparator:&__block_literal_global_372];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v9;
  uint64_t v10 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v15 = [v6 objectForKeyedSubscript:v14];
        id v16 = +[WDMedicalRecordDisplayItemGroup displayItemGroupWithDaySummary:v15];
        [v16 setSource:v14];
        if (v5)
        {
          [v16 setTitle:v5];
          int v17 = [v14 name];
          [v16 setSubtitle:v17];
        }
        else
        {
          BOOL v18 = [v14 name];
          [v16 setTitle:v18];

          [v16 setSubtitle:0];
        }
        [v7 addObject:v16];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  return v7;
}

uint64_t __101__WDMedicalRecordDisplayItemProvider__sortedDisplayItemGroupWithDateDisplay_sourceDaySummaryMapping___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 name];
  id v6 = [v4 name];

  uint64_t v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return v7;
}

- (void)daySummaryHasDisplayItemUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [(WDMedicalRecordDisplayItemProvider *)self dataQueryQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__WDMedicalRecordDisplayItemProvider_daySummaryHasDisplayItemUpdate___block_invoke;
  v7[3] = &unk_1E644ADD8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __69__WDMedicalRecordDisplayItemProvider_daySummaryHasDisplayItemUpdate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pagingContext];
  uint64_t v3 = [v2 computingDaySummaries];
  [v3 removeObject:*(void *)(a1 + 40)];

  id v4 = [*(id *)(a1 + 32) pagingContext];
  id v5 = [v4 computingDaySummaries];
  uint64_t v6 = [v5 count];

  if (!v6)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    [v7 _commitPendingGroupsAndCallUpdateHandlerBypassGroupChangeDetermination:1];
  }
}

+ (id)allSupportedRecordCategories
{
  if (allSupportedRecordCategories_onceToken != -1) {
    dispatch_once(&allSupportedRecordCategories_onceToken, &__block_literal_global_375);
  }
  id v2 = (void *)allSupportedRecordCategories_categories;
  return v2;
}

void __66__WDMedicalRecordDisplayItemProvider_allSupportedRecordCategories__block_invoke()
{
  v121[10] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v120[0] = &unk_1F1DC22B8;
  v119[0] = @"HKMedicalRecordCategoryTypeIdentifer";
  v119[1] = @"WDMedicalRecordCategoryMetricColors";
  v81 = [MEMORY[0x1E4F67C90] medicationsClinicalColors];
  v120[1] = v81;
  v119[2] = @"WDMedicalRecordCategoryDisplayName";
  v80 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v79 = [v80 localizedStringForKey:@"MEDICATIONS_CATEGORY" value:&stru_1F1D9FF30 table:@"HealthUI-Localizable-Clinical-Health-Records"];
  v120[2] = v79;
  v120[3] = @"health_records_medications";
  v119[3] = @"WDMedicalRecordCategoryDisplayImageName";
  v119[4] = @"WDMedicalRecordCategorySampleTypes";
  v78 = [MEMORY[0x1E4F2B218] medicationOrderType];
  v118[0] = v78;
  v77 = [MEMORY[0x1E4F2B1D8] medicationDispenseRecordType];
  v118[1] = v77;
  v76 = [MEMORY[0x1E4F2B228] medicationRecordType];
  v118[2] = v76;
  v75 = [MEMORY[0x1E4F1C978] arrayWithObjects:v118 count:3];
  v120[4] = v75;
  v74 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v120 forKeys:v119 count:5];
  v121[0] = v74;
  v117[0] = &unk_1F1DC22D0;
  v116[0] = @"HKMedicalRecordCategoryTypeIdentifer";
  v116[1] = @"WDMedicalRecordCategoryMetricColors";
  v73 = [MEMORY[0x1E4F67C90] labResultsClinicalColors];
  v117[1] = v73;
  v116[2] = @"WDMedicalRecordCategoryDisplayName";
  v72 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v71 = [v72 localizedStringForKey:@"LAB_CATEGORY" value:&stru_1F1D9FF30 table:@"HealthUI-Localizable-Clinical-Health-Records"];
  v117[2] = v71;
  v117[3] = @"health_records_lab_results";
  v116[3] = @"WDMedicalRecordCategoryDisplayImageName";
  v116[4] = @"WDMedicalRecordCategorySampleTypes";
  v70 = [MEMORY[0x1E4F2AF50] diagnosticTestReportType];
  v115[0] = v70;
  v69 = [MEMORY[0x1E4F2AF60] diagnosticTestResultType];
  v115[1] = v69;
  v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:v115 count:2];
  v117[4] = v68;
  v116[5] = @"WDMedicalRecordCategoryAdditionalPredicates";
  v67 = [MEMORY[0x1E4F2AF60] diagnosticTestResultType];
  v113 = v67;
  v66 = [MEMORY[0x1E4F2B3C0] predicateForDiagnosticTestResultCategory:*MEMORY[0x1E4F29A40]];
  v114 = v66;
  uint64_t v65 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v114 forKeys:&v113 count:1];
  v117[5] = v65;
  v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v117 forKeys:v116 count:6];
  v121[1] = v64;
  v112[0] = &unk_1F1DC22E8;
  v111[0] = @"HKMedicalRecordCategoryTypeIdentifer";
  v111[1] = @"WDMedicalRecordCategoryMetricColors";
  v63 = [MEMORY[0x1E4F67C90] vitalsClinicalColors];
  v112[1] = v63;
  v111[2] = @"WDMedicalRecordCategoryDisplayName";
  long long v62 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  long long v61 = [v62 localizedStringForKey:@"CLINICAL_VITALS_CATEGORY" value:&stru_1F1D9FF30 table:@"HealthUI-Localizable-Clinical-Health-Records"];
  v112[2] = v61;
  v112[3] = @"health_records_vitals";
  v111[3] = @"WDMedicalRecordCategoryDisplayImageName";
  v111[4] = @"WDMedicalRecordCategorySampleTypes";
  long long v60 = [MEMORY[0x1E4F2AF60] diagnosticTestResultType];
  v110 = v60;
  long long v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v110 count:1];
  v112[4] = v59;
  v111[5] = @"WDMedicalRecordCategoryAdditionalPredicates";
  long long v58 = [MEMORY[0x1E4F2AF60] diagnosticTestResultType];
  v108 = v58;
  long long v57 = [MEMORY[0x1E4F2B3C0] predicateForDiagnosticTestResultCategory:*MEMORY[0x1E4F29A48]];
  v109 = v57;
  long long v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v109 forKeys:&v108 count:1];
  v112[5] = v56;
  long long v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v112 forKeys:v111 count:6];
  v121[2] = v55;
  v107[0] = &unk_1F1DC2300;
  v106[0] = @"HKMedicalRecordCategoryTypeIdentifer";
  v106[1] = @"WDMedicalRecordCategoryMetricColors";
  uint64_t v54 = [MEMORY[0x1E4F67C90] conditionsClinicalColors];
  v107[1] = v54;
  v106[2] = @"WDMedicalRecordCategoryDisplayName";
  uint64_t v53 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v52 = [v53 localizedStringForKey:@"CONDITION_CATEGORY" value:&stru_1F1D9FF30 table:@"HealthUI-Localizable-Clinical-Health-Records"];
  v107[2] = v52;
  v107[3] = @"health_records_conditions";
  v106[3] = @"WDMedicalRecordCategoryDisplayImageName";
  v106[4] = @"WDMedicalRecordCategorySampleTypes";
  id v51 = [MEMORY[0x1E4F2AE28] conditionRecordType];
  v105 = v51;
  id v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v105 count:1];
  v107[4] = v50;
  id v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v107 forKeys:v106 count:5];
  v121[3] = v49;
  v104[0] = &unk_1F1DC2318;
  v103[0] = @"HKMedicalRecordCategoryTypeIdentifer";
  v103[1] = @"WDMedicalRecordCategoryMetricColors";
  uint64_t v48 = [MEMORY[0x1E4F67C90] proceduresClinicalColors];
  v104[1] = v48;
  v103[2] = @"WDMedicalRecordCategoryDisplayName";
  id v47 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v46 = [v47 localizedStringForKey:@"PROCEDURE_CATEGORY" value:&stru_1F1D9FF30 table:@"HealthUI-Localizable-Clinical-Health-Records"];
  v104[2] = v46;
  v104[3] = @"health_records_procedures";
  v103[3] = @"WDMedicalRecordCategoryDisplayImageName";
  v103[4] = @"WDMedicalRecordCategorySampleTypes";
  v45 = [MEMORY[0x1E4F2B348] procedureRecordType];
  v102 = v45;
  uint64_t v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v102 count:1];
  v104[4] = v44;
  v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v104 forKeys:v103 count:5];
  v121[4] = v43;
  v101[0] = &unk_1F1DC2330;
  v100[0] = @"HKMedicalRecordCategoryTypeIdentifer";
  v100[1] = @"WDMedicalRecordCategoryMetricColors";
  objc_super v42 = [MEMORY[0x1E4F67C90] immunizationsClinicalColors];
  v101[1] = v42;
  v100[2] = @"WDMedicalRecordCategoryDisplayName";
  id v41 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  int v40 = [v41 localizedStringForKey:@"IMMUNIZATION_CATEGORY" value:&stru_1F1D9FF30 table:@"HealthUI-Localizable-Clinical-Health-Records"];
  v101[2] = v40;
  v101[3] = @"health_records_immunizations";
  v100[3] = @"WDMedicalRecordCategoryDisplayImageName";
  v100[4] = @"WDMedicalRecordCategorySampleTypes";
  long long v39 = [MEMORY[0x1E4F2B6B8] vaccinationRecordType];
  v99 = v39;
  long long v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v99 count:1];
  v101[4] = v38;
  long long v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v101 forKeys:v100 count:5];
  v121[5] = v37;
  v98[0] = &unk_1F1DC2348;
  v97[0] = @"HKMedicalRecordCategoryTypeIdentifer";
  v97[1] = @"WDMedicalRecordCategoryMetricColors";
  uint64_t v36 = [MEMORY[0x1E4F67C90] allergiesClinicalColors];
  v98[1] = v36;
  v97[2] = @"WDMedicalRecordCategoryDisplayName";
  v35 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v34 = [v35 localizedStringForKey:@"ALLERGY_CATEGORY" value:&stru_1F1D9FF30 table:@"HealthUI-Localizable-Clinical-Health-Records"];
  v98[2] = v34;
  v98[3] = @"health_records_allergies";
  v97[3] = @"WDMedicalRecordCategoryDisplayImageName";
  v97[4] = @"WDMedicalRecordCategorySampleTypes";
  uint64_t v33 = [MEMORY[0x1E4F2ABD0] allergyRecordType];
  v96 = v33;
  id v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v96 count:1];
  v98[4] = v32;
  id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v98 forKeys:v97 count:5];
  v121[6] = v30;
  v95[0] = &unk_1F1DC22A0;
  v94[0] = @"HKMedicalRecordCategoryTypeIdentifer";
  v94[1] = @"WDMedicalRecordCategoryMetricColors";
  int v29 = [MEMORY[0x1E4F67C90] unknownCategoryClinicalColors];
  v95[1] = v29;
  v94[2] = @"WDMedicalRecordCategoryDisplayName";
  uint64_t v28 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v27 = [v28 localizedStringForKey:@"UNKNOWN_RECORDS" value:&stru_1F1D9FF30 table:@"HealthUI-Localizable-Clinical-Health-Records"];
  v95[2] = v27;
  v94[3] = @"WDMedicalRecordCategorySampleTypes";
  uint64_t v26 = [MEMORY[0x1E4F2B628] unknownRecordType];
  v93 = v26;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v93 count:1];
  v95[3] = v25;
  long long v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v95 forKeys:v94 count:4];
  v121[7] = v24;
  v92[0] = &unk_1F1DC2360;
  v91[0] = @"HKMedicalRecordCategoryTypeIdentifer";
  v91[1] = @"WDMedicalRecordCategoryMetricColors";
  long long v23 = [MEMORY[0x1E4F67C90] insuranceClinicalColors];
  v92[1] = v23;
  v91[2] = @"WDMedicalRecordCategoryDisplayName";
  long long v22 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  long long v21 = [v22 localizedStringForKey:@"INSURANCE_CATEGORY" value:&stru_1F1D9FF30 table:@"HealthUI-Localizable-Clinical-Health-Records"];
  v92[2] = v21;
  v92[3] = @"health_records_insurance";
  v91[3] = @"WDMedicalRecordCategoryDisplayImageName";
  v91[4] = @"WDMedicalRecordCategorySampleTypes";
  char v20 = [MEMORY[0x1E4F2AE88] coverageRecordType];
  v90 = v20;
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v90 count:1];
  v92[4] = v1;
  id v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v92 forKeys:v91 count:5];
  v121[8] = v2;
  v89[0] = &unk_1F1DC2378;
  v88[0] = @"HKMedicalRecordCategoryTypeIdentifer";
  v88[1] = @"WDMedicalRecordCategoryMetricColors";
  uint64_t v3 = [MEMORY[0x1E4F67C90] clinicalNotesClinicalColors];
  v89[1] = v3;
  v88[2] = @"WDMedicalRecordCategoryDisplayName";
  id v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  id v5 = [v4 localizedStringForKey:@"CLINICAL_NOTES_CATEGORY" value:&stru_1F1D9FF30 table:@"HealthUI-Localizable-Clinical-Notes"];
  v89[2] = v5;
  v89[3] = @"health_records_clinical_notes";
  v88[3] = @"WDMedicalRecordCategoryDisplayImageName";
  v88[4] = @"WDMedicalRecordCategorySampleTypes";
  uint64_t v6 = [MEMORY[0x1E4F2AD00] clinicalNoteRecordType];
  v87 = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v87 count:1];
  v89[4] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v89 forKeys:v88 count:5];
  v121[9] = v8;
  uint64_t v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v121 count:10];

  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id v9 = v31;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v82 objects:v86 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v83;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v83 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = [[WDMedicalRecordCategory alloc] initWithDictionary:*(void *)(*((void *)&v82 + 1) + 8 * v13)];
        switch([(WDMedicalRecordCategory *)v14 categoryType])
        {
          case 0:
          case 8:
            uint64_t v15 = objc_msgSend(MEMORY[0x1E4FB1618], "hrui_unreadable");
            goto LABEL_17;
          case 1:
            uint64_t v15 = objc_msgSend(MEMORY[0x1E4FB1618], "hrui_medications");
            goto LABEL_17;
          case 2:
            uint64_t v15 = objc_msgSend(MEMORY[0x1E4FB1618], "hrui_labResults");
            goto LABEL_17;
          case 3:
            uint64_t v15 = objc_msgSend(MEMORY[0x1E4FB1618], "hrui_clinicalVitals");
            goto LABEL_17;
          case 4:
            uint64_t v15 = objc_msgSend(MEMORY[0x1E4FB1618], "hrui_conditions");
            goto LABEL_17;
          case 5:
            uint64_t v15 = objc_msgSend(MEMORY[0x1E4FB1618], "hrui_procedures");
            goto LABEL_17;
          case 6:
            uint64_t v15 = objc_msgSend(MEMORY[0x1E4FB1618], "hrui_immunizations");
            goto LABEL_17;
          case 7:
            uint64_t v15 = objc_msgSend(MEMORY[0x1E4FB1618], "hrui_allergies");
            goto LABEL_17;
          case 9:
            uint64_t v15 = objc_msgSend(MEMORY[0x1E4FB1618], "hrui_insurance");
            goto LABEL_17;
          case 10:
            uint64_t v15 = objc_msgSend(MEMORY[0x1E4FB1618], "hrui_clinicalNotes");
LABEL_17:
            id v16 = (void *)v15;
            int v17 = [(WDMedicalRecordCategory *)v14 categoryMetricColors];
            [v17 setKeyColor:v16];

            break;
          default:
            break;
        }
        [v0 addObject:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v82 objects:v86 count:16];
    }
    while (v11);
  }

  uint64_t v18 = [v0 copy];
  id v19 = (void *)allSupportedRecordCategories_categories;
  allSupportedRecordCategories_categories = v18;
}

void __77__WDMedicalRecordDisplayItemProvider_supportedRecordCategoriesByCategoryType__block_invoke()
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v1 = [(id)objc_opt_class() allSupportedRecordCategories];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        uint64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "categoryType"));
        [v0 setObject:v6 forKeyedSubscript:v7];
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v3);
  }
  uint64_t v8 = [v0 copy];
  id v9 = (void *)supportedRecordCategoriesByCategoryType_categoryDictionary;
  supportedRecordCategoriesByCategoryType_categoryDictionary = v8;
}

+ (id)allSupportedSampleTypes
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__WDMedicalRecordDisplayItemProvider_allSupportedSampleTypes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = 1;
  if (allSupportedSampleTypes_onceToken[0] != -1) {
    dispatch_once(allSupportedSampleTypes_onceToken, block);
  }
  uint64_t v2 = (void *)allSupportedSampleTypes_sampleTypes;
  return v2;
}

void __61__WDMedicalRecordDisplayItemProvider_allSupportedSampleTypes__block_invoke(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x1E4F2B448] medicalRecordTypesWithOptions:*(void *)(a1 + 32)];
  uint64_t v2 = (void *)allSupportedSampleTypes_sampleTypes;
  allSupportedSampleTypes_sampleTypes = v1;
}

+ (id)unknownRecordCategory
{
  uint64_t v2 = [(id)objc_opt_class() supportedRecordCategoriesByCategoryType];
  uint64_t v3 = [v2 objectForKeyedSubscript:&unk_1F1DC22A0];

  return v3;
}

- (int64_t)displayItemOptions
{
  return self->_displayItemOptions;
}

- (void)setDisplayItemOptions:(int64_t)a3
{
  self->_displayItemOptions = a3;
}

- (NSDictionary)additionalPredicates
{
  return self->_additionalPredicates;
}

- (NSPredicate)filter
{
  return self->_filter;
}

- (NSDictionary)filterPredicatesByType
{
  return self->_filterPredicatesByType;
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
}

- (int64_t)numOfRemovedRecords
{
  return self->_numOfRemovedRecords;
}

- (void)setNumOfRemovedRecords:(int64_t)a3
{
  self->_numOfRemovedRecords = a3;
}

- (BOOL)shouldClearPagingCacheOnNextReload
{
  return self->_shouldClearPagingCacheOnNextReload;
}

- (void)setShouldClearPagingCacheOnNextReload:(BOOL)a3
{
  self->_shouldClearPagingCacheOnNextReload = a3;
}

- (HRProfile)profile
{
  return self->_profile;
}

- (void)setProfile:(id)a3
{
}

- (HKConcept)ontologyConcept
{
  return self->_ontologyConcept;
}

- (void)setOntologyConcept:(id)a3
{
}

- (HKMedicalUserDomainConcept)userDomainConcept
{
  return self->_userDomainConcept;
}

- (void)setUserDomainConcept:(id)a3
{
}

- (NSArray)preloadedRemovedRecords
{
  return self->_preloadedRemovedRecords;
}

- (void)setPreloadedRemovedRecords:(id)a3
{
}

- (BOOL)removedRecordsOnly
{
  return self->_removedRecordsOnly;
}

- (void)setRemovedRecordsOnly:(BOOL)a3
{
  self->_removedRecordsOnly = a3;
}

- (NSMutableArray)medicalRecordGroups
{
  return self->_medicalRecordGroups;
}

- (void)setMedicalRecordGroups:(id)a3
{
}

- (NSMutableArray)dateLessGroups
{
  return self->_dateLessGroups;
}

- (void)setDateLessGroups:(id)a3
{
}

- (NSArray)pendingMedicalRecordGroups
{
  return self->_pendingMedicalRecordGroups;
}

- (void)setPendingMedicalRecordGroups:(id)a3
{
}

- (NSArray)pendingDateLessGroups
{
  return self->_pendingDateLessGroups;
}

- (void)setPendingDateLessGroups:(id)a3
{
}

- (NSArray)sampleTypes
{
  return self->_sampleTypes;
}

- (void)setSampleTypes:(id)a3
{
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (void)setSortDescriptors:(id)a3
{
}

- (NSPredicate)accountsPredicate
{
  return self->_accountsPredicate;
}

- (void)setAccountsPredicate:(id)a3
{
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void)setUpdateHandler:(id)a3
{
}

- (NSUUID)targetUUID
{
  return self->_targetUUID;
}

- (void)setTargetUUID:(id)a3
{
}

- (OS_dispatch_queue)dataQueryQueue
{
  return self->_dataQueryQueue;
}

- (void)setDataQueryQueue:(id)a3
{
}

- (WDMedicalRecordPagingContext)pagingContext
{
  return self->_pagingContext;
}

- (void)setPagingContext:(id)a3
{
}

- (HKMultiTypeSampleIterator)iterator
{
  return self->_iterator;
}

- (void)setIterator:(id)a3
{
}

- (BOOL)shouldCancelDataCollection
{
  return self->_shouldCancelDataCollection;
}

- (void)setShouldCancelDataCollection:(BOOL)a3
{
  self->_shouldCancelDataCollection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iterator, 0);
  objc_storeStrong((id *)&self->_pagingContext, 0);
  objc_storeStrong((id *)&self->_dataQueryQueue, 0);
  objc_storeStrong((id *)&self->_targetUUID, 0);
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_accountsPredicate, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_sampleTypes, 0);
  objc_storeStrong((id *)&self->_pendingDateLessGroups, 0);
  objc_storeStrong((id *)&self->_pendingMedicalRecordGroups, 0);
  objc_storeStrong((id *)&self->_dateLessGroups, 0);
  objc_storeStrong((id *)&self->_medicalRecordGroups, 0);
  objc_storeStrong((id *)&self->_preloadedRemovedRecords, 0);
  objc_storeStrong((id *)&self->_userDomainConcept, 0);
  objc_storeStrong((id *)&self->_ontologyConcept, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_filterPredicatesByType, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_additionalPredicates, 0);
}

@end