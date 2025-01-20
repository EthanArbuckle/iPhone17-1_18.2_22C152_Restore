@interface MKPlaceCompactCollectionsLogicController
- (GEOGuideLocation)selectedGuideLocation;
- (MKPlaceBatchConsumer)guideConsumer;
- (MKPlaceBatchController)batchController;
- (MKPlaceCompactCollectionsLogicController)initWithGuideLocations:(id)a3 context:(int64_t)a4;
- (MKPlaceCompactCollectionsLogicController)initWithGuideLocationsResult:(id)a3 context:(int64_t)a4 usingCollectionFetcher:(id)a5 usingGuideConsumer:(id)a6 usingBatchSize:(unint64_t)a7 selectedGuideLocation:(id)a8;
- (NSArray)batchableLocations;
- (NSArray)flattenedIdentifiersForBatching;
- (NSArray)sections;
- (NSArray)viewModels;
- (id)buildBatchingStructureForResult:(id)a3;
- (id)buildViewModelsFromGuideLocations:(id)a3;
- (id)compactCollectionAtIndex:(unint64_t)a3 sectionIndex:(unint64_t)a4;
- (id)compactCollectionsInSection:(unint64_t)a3;
- (id)titleForSectionFromTitle:(id)a3;
- (int64_t)context;
- (unint64_t)initialDisplayCount;
- (unint64_t)numberOfSections;
- (void)createBatchControllerIfNeededUsingIdentifiers:(id)a3 usingCollectionFetcher:(id)a4 usingGuideConsumer:(id)a5 batchSize:(unint64_t)a6;
- (void)dismissedCompactCollections;
- (void)setBatchController:(id)a3;
- (void)setBatchableLocations:(id)a3;
- (void)setContext:(int64_t)a3;
- (void)setFlattenedIdentifiersForBatching:(id)a3;
- (void)setGuideConsumer:(id)a3;
- (void)setInitialDisplayCount:(unint64_t)a3;
- (void)setSections:(id)a3;
- (void)setSelectedGuideLocation:(id)a3;
- (void)setViewModels:(id)a3;
- (void)shouldConsumeBatch:(BOOL)a3 fetchedBatch:(id)a4;
- (void)willDisplayCellAtIndexpath:(id)a3;
@end

@implementation MKPlaceCompactCollectionsLogicController

- (MKPlaceCompactCollectionsLogicController)initWithGuideLocations:(id)a3 context:(int64_t)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MKPlaceCompactCollectionsLogicController;
  v7 = [(MKPlaceCompactCollectionsLogicController *)&v14 init];
  v8 = v7;
  if (v7)
  {
    v7->_context = a4;
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v10 = [(MKPlaceCompactCollectionsLogicController *)v8 buildViewModelsFromGuideLocations:v6];
    [v9 addObject:v10];

    uint64_t v11 = [v9 copy];
    viewModels = v8->_viewModels;
    v8->_viewModels = (NSArray *)v11;
  }
  return v8;
}

- (MKPlaceCompactCollectionsLogicController)initWithGuideLocationsResult:(id)a3 context:(int64_t)a4 usingCollectionFetcher:(id)a5 usingGuideConsumer:(id)a6 usingBatchSize:(unint64_t)a7 selectedGuideLocation:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)MKPlaceCompactCollectionsLogicController;
  v18 = [(MKPlaceCompactCollectionsLogicController *)&v23 init];
  v19 = v18;
  if (v18)
  {
    v18->_context = a4;
    objc_storeStrong((id *)&v18->_selectedGuideLocation, a8);
    if (!a4)
    {
      uint64_t v20 = [(MKPlaceCompactCollectionsLogicController *)v19 buildBatchingStructureForResult:v14];
      flattenedIdentifiersForBatching = v19->_flattenedIdentifiersForBatching;
      v19->_flattenedIdentifiersForBatching = (NSArray *)v20;

      if ([(NSArray *)v19->_flattenedIdentifiersForBatching count])
      {
        objc_storeWeak((id *)&v19->_guideConsumer, v16);
        [(MKPlaceCompactCollectionsLogicController *)v19 createBatchControllerIfNeededUsingIdentifiers:v19->_flattenedIdentifiersForBatching usingCollectionFetcher:v15 usingGuideConsumer:v19 batchSize:a7];
      }
    }
  }

  return v19;
}

- (void)willDisplayCellAtIndexpath:(id)a3
{
  id v4 = a3;
  id v6 = [(MKPlaceCompactCollectionsLogicController *)self batchController];
  uint64_t v5 = [v4 item];

  [v6 didDisplayItemAtIndex:v5];
}

- (unint64_t)numberOfSections
{
  if (self->_context) {
    return 0;
  }
  v3 = [(MKPlaceCompactCollectionsLogicController *)self batchableLocations];
  unint64_t v4 = [v3 count];

  return v4;
}

- (id)titleForSectionFromTitle:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4 && !self->_context)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v11 = *MEMORY[0x1E4F42508];
    v7 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438F8]];
    v8 = objc_msgSend(v7, "_mapkit_fontWithWeight:", *MEMORY[0x1E4F43930]);
    v12[0] = v8;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    uint64_t v5 = (void *)[v6 initWithString:v4 attributes:v9];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)compactCollectionsInSection:(unint64_t)a3
{
  if (self->_context == 1) {
    goto LABEL_5;
  }
  if ([(MKPlaceCompactCollectionsLogicController *)self numberOfSections] - 1 < a3)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_6;
  }
  if (self->_context)
  {
LABEL_5:
    id v6 = [(MKPlaceCompactCollectionsLogicController *)self viewModels];
    uint64_t v5 = [v6 objectAtIndex:a3];
  }
  else
  {
    v8 = [(MKPlaceCompactCollectionsLogicController *)self batchableLocations];
    id v9 = [v8 objectAtIndex:a3];

    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __72__MKPlaceCompactCollectionsLogicController_compactCollectionsInSection___block_invoke;
    v12[3] = &unk_1E54BAD30;
    id v13 = v10;
    id v11 = v10;
    [v9 enumerateObjectsUsingBlock:v12];
    uint64_t v5 = (void *)[v11 copy];
  }
LABEL_6:

  return v5;
}

void __72__MKPlaceCompactCollectionsLogicController_compactCollectionsInSection___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  v3 = [v6 viewModel];

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v6 viewModel];
    [v4 addObject:v5];
  }
}

- (id)compactCollectionAtIndex:(unint64_t)a3 sectionIndex:(unint64_t)a4
{
  if ([(MKPlaceCompactCollectionsLogicController *)self context])
  {
    v7 = [(MKPlaceCompactCollectionsLogicController *)self viewModels];
    v8 = [v7 objectAtIndex:a4];
    id v9 = [v8 objectAtIndex:a3];
  }
  else
  {
    v7 = [(MKPlaceCompactCollectionsLogicController *)self batchableLocations];
    v8 = [v7 objectAtIndex:a4];
    id v10 = [v8 objectAtIndex:a3];
    id v9 = [v10 viewModel];
  }

  return v9;
}

- (void)dismissedCompactCollections
{
  v3 = +[MKPlaceCollectionImageProvider sharedInstance];
  id v6 = v3;
  int64_t context = self->_context;
  if (context == 2) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = context == 0;
  }
  [v3 cancelAllOperationsForCompactImageSource:v5];
}

- (id)buildBatchingStructureForResult:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v8 = [v5 sections];
  id v9 = objc_msgSend(v7, "initWithCapacity:", objc_msgSend(v8, "count"));

  id v10 = [v5 sections];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __76__MKPlaceCompactCollectionsLogicController_buildBatchingStructureForResult___block_invoke;
  v17[3] = &unk_1E54BAD58;
  v17[4] = self;
  id v18 = v6;
  id v19 = v9;
  id v11 = v9;
  id v12 = v6;
  [v10 enumerateObjectsUsingBlock:v17];

  id v13 = (NSArray *)[v11 copy];
  batchableLocations = self->_batchableLocations;
  self->_batchableLocations = v13;

  id v15 = (void *)[v12 copy];

  return v15;
}

void __76__MKPlaceCompactCollectionsLogicController_buildBatchingStructureForResult___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 guideLocations];
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v47 = v5;
  if ([v3 isWorldwideSection])
  {
    id v6 = [v4 firstObject];
    id v7 = [MKPlaceCompactCollectionViewModel alloc];
    v8 = *(void **)(a1 + 32);
    uint64_t v9 = v8[1];
    id v10 = [v8 selectedGuideLocation];
    id v11 = -[MKPlaceCompactCollectionViewModel initWithGuideLocation:context:useBorderHighlight:](v7, "initWithGuideLocation:context:useBorderHighlight:", v6, v9, [v6 isEqual:v10]);

    id v12 = [[MKPlaceBatchableCompactCollection alloc] initWithWorldwideViewModel:v11];
    [v5 addObject:v12];
    ++*(void *)(*(void *)(a1 + 32) + 72);

    uint64_t v13 = a1;
    id v14 = v4;
  }
  else
  {
    id v15 = [v3 guideLocationIdentifiers];
    uint64_t v16 = [v15 count];

    uint64_t v13 = a1;
    id v14 = v4;
    if (v16)
    {
      uint64_t v18 = 0;
      unint64_t v19 = 0;
      *(void *)&long long v17 = 138412290;
      long long v44 = v17;
      v45 = v14;
      id v46 = v3;
      do
      {
        uint64_t v20 = [MKMapItemIdentifier alloc];
        v21 = [v3 guideLocationIdentifiers];
        v22 = [v21 objectAtIndex:v19];
        objc_super v23 = [(MKMapItemIdentifier *)v20 initWithGEOMapItemIdentifier:v22];

        if (v23)
        {
          v24 = [[MKPlaceBatchableCompactCollection alloc] initWithIdentifier:v23];
          [v47 containsObject:v24];
          [v47 addObject:v24];
          if (v19 < [v14 count]
            && ([v14 objectAtIndex:v19],
                v25 = objc_claimAutoreleasedReturnValue(),
                v25,
                v25))
          {
            v26 = v14;
            uint64_t v27 = v13;
            [v26 objectAtIndex:v18];
            v29 = v28 = v3;
            v30 = [v29 guideLocationIdentifier];
            v31 = [v28 guideLocationIdentifiers];
            v32 = [v31 objectAtIndex:v19];
            uint64_t v33 = v18;
            int v34 = [v30 isEqualToGEOMapItemIdentifier:v32];

            if (v34)
            {
              v35 = [MKPlaceCompactCollectionViewModel alloc];
              v36 = *(void **)(v27 + 32);
              uint64_t v37 = v36[1];
              v38 = [v36 selectedGuideLocation];
              v39 = -[MKPlaceCompactCollectionViewModel initWithGuideLocation:context:useBorderHighlight:](v35, "initWithGuideLocation:context:useBorderHighlight:", v29, v37, [v29 isEqual:v38]);

              uint64_t v13 = v27;
              [(MKPlaceBatchableCompactCollection *)v24 setViewModel:v39];
              uint64_t v18 = v33 + 1;
              ++*(void *)(*(void *)(v27 + 32) + 72);
              id v14 = v45;
            }
            else
            {
              v39 = MKGetCuratedCollectionsLog();
              uint64_t v13 = v27;
              if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v44;
                v49 = v23;
                _os_log_impl(&dword_18BAEC000, v39, OS_LOG_TYPE_ERROR, "Identifier mismatch when building batching structure. This implies that we have a location:(%@) for which we cannot build a view model.", buf, 0xCu);
              }
              id v14 = v45;
              uint64_t v18 = v33;
            }

            id v3 = v46;
          }
          else
          {
            objc_msgSend(*(id *)(v13 + 40), "addObject:", v23, v44);
          }
          uint64_t v40 = v18;
        }
        else
        {
          uint64_t v40 = v18;
        }

        ++v19;
        v41 = [v3 guideLocationIdentifiers];
        unint64_t v42 = [v41 count];

        BOOL v43 = v19 >= v42;
        uint64_t v18 = v40;
      }
      while (!v43);
    }
  }
  objc_msgSend(*(id *)(v13 + 48), "addObject:", v47, v44);
}

- (id)buildViewModelsFromGuideLocations:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = objc_msgSend([v4 alloc], "initWithCapacity:", objc_msgSend(v5, "count"));
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = __78__MKPlaceCompactCollectionsLogicController_buildViewModelsFromGuideLocations___block_invoke;
  uint64_t v16 = &unk_1E54BAD80;
  long long v17 = self;
  id v18 = v6;
  id v7 = v6;
  [v5 enumerateObjectsUsingBlock:&v13];

  id v8 = objc_alloc(MEMORY[0x1E4F1CAA0]);
  uint64_t v9 = objc_msgSend(v8, "initWithArray:", v7, v13, v14, v15, v16, v17);
  id v10 = [v9 array];
  id v11 = (void *)[v10 copy];

  return v11;
}

void __78__MKPlaceCompactCollectionsLogicController_buildViewModelsFromGuideLocations___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MKPlaceCompactCollectionViewModel alloc];
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = v5[1];
  id v7 = [v5 selectedGuideLocation];
  uint64_t v9 = -[MKPlaceCompactCollectionViewModel initWithGuideLocation:context:useBorderHighlight:](v4, "initWithGuideLocation:context:useBorderHighlight:", v3, v6, [v3 isEqual:v7]);

  id v8 = v9;
  if (v9)
  {
    [*(id *)(a1 + 40) addObject:v9];
    id v8 = v9;
  }
}

- (void)createBatchControllerIfNeededUsingIdentifiers:(id)a3 usingCollectionFetcher:(id)a4 usingGuideConsumer:(id)a5 batchSize:(unint64_t)a6
{
  id v14 = a3;
  id v10 = a4;
  id v11 = a5;
  [(MKPlaceCompactCollectionsLogicController *)self setBatchController:0];
  uint64_t v12 = [v14 count];
  if (v11 && v10 && v12)
  {
    uint64_t v13 = [[MKPlaceBatchController alloc] initWithItemIdentifiers:v14 withBatchSize:a6 minimumNumberOfItemBeforeFetching:2 shouldLoadFirstBatchImmediately:0 usingBatchFetcher:v10 usingBatchConsumer:v11 displayedItemCount:[(MKPlaceCompactCollectionsLogicController *)self initialDisplayCount]];
    [(MKPlaceCompactCollectionsLogicController *)self setBatchController:v13];
  }
}

- (void)shouldConsumeBatch:(BOOL)a3 fetchedBatch:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  id v7 = [(MKPlaceCompactCollectionsLogicController *)self batchableLocations];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__MKPlaceCompactCollectionsLogicController_shouldConsumeBatch_fetchedBatch___block_invoke;
  v10[3] = &unk_1E54BADD0;
  uint64_t v13 = v14;
  id v8 = v6;
  id v11 = v8;
  uint64_t v12 = self;
  [v7 enumerateObjectsUsingBlock:v10];

  uint64_t v9 = [(MKPlaceCompactCollectionsLogicController *)self guideConsumer];
  [v9 shouldConsumeBatch:v4 fetchedBatch:v8];

  _Block_object_dispose(v14, 8);
}

void __76__MKPlaceCompactCollectionsLogicController_shouldConsumeBatch_fetchedBatch___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__MKPlaceCompactCollectionsLogicController_shouldConsumeBatch_fetchedBatch___block_invoke_2;
  v9[3] = &unk_1E54BADA8;
  uint64_t v12 = *(void *)(a1 + 48);
  id v7 = *(id *)(a1 + 32);
  uint64_t v13 = a4;
  uint64_t v8 = *(void *)(a1 + 40);
  id v10 = v7;
  uint64_t v11 = v8;
  [a2 enumerateObjectsUsingBlock:v9];
}

void __76__MKPlaceCompactCollectionsLogicController_shouldConsumeBatch_fetchedBatch___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v18 = a2;
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v6 == [*(id *)(a1 + 32) count] - 1)
  {
    *a4 = 1;
    **(unsigned char **)(a1 + 56) = 1;
  }
  id v7 = [v18 viewModel];

  if (!v7)
  {
    uint64_t v8 = [*(id *)(a1 + 32) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
    uint64_t v9 = [v18 guideLocationIdentifier];
    id v10 = [v9 geoMapItemIdentifier];
    uint64_t v11 = [v8 guideLocationIdentifier];
    int v12 = [v10 isEqual:v11];

    if (v12)
    {
      uint64_t v13 = [MKPlaceCompactCollectionViewModel alloc];
      id v14 = *(void **)(a1 + 40);
      uint64_t v15 = v14[1];
      uint64_t v16 = [v14 selectedGuideLocation];
      long long v17 = -[MKPlaceCompactCollectionViewModel initWithGuideLocation:context:useBorderHighlight:](v13, "initWithGuideLocation:context:useBorderHighlight:", v8, v15, [v8 isEqual:v16]);

      [v18 setViewModel:v17];
      ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    }
  }
}

- (int64_t)context
{
  return self->_context;
}

- (void)setContext:(int64_t)a3
{
  self->_int64_t context = a3;
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (NSArray)viewModels
{
  return self->_viewModels;
}

- (void)setViewModels:(id)a3
{
}

- (NSArray)batchableLocations
{
  return self->_batchableLocations;
}

- (void)setBatchableLocations:(id)a3
{
}

- (NSArray)flattenedIdentifiersForBatching
{
  return self->_flattenedIdentifiersForBatching;
}

- (void)setFlattenedIdentifiersForBatching:(id)a3
{
}

- (MKPlaceBatchController)batchController
{
  return self->_batchController;
}

- (void)setBatchController:(id)a3
{
}

- (MKPlaceBatchConsumer)guideConsumer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_guideConsumer);

  return (MKPlaceBatchConsumer *)WeakRetained;
}

- (void)setGuideConsumer:(id)a3
{
}

- (GEOGuideLocation)selectedGuideLocation
{
  return self->_selectedGuideLocation;
}

- (void)setSelectedGuideLocation:(id)a3
{
}

- (unint64_t)initialDisplayCount
{
  return self->_initialDisplayCount;
}

- (void)setInitialDisplayCount:(unint64_t)a3
{
  self->_initialDisplayCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedGuideLocation, 0);
  objc_destroyWeak((id *)&self->_guideConsumer);
  objc_storeStrong((id *)&self->_batchController, 0);
  objc_storeStrong((id *)&self->_flattenedIdentifiersForBatching, 0);
  objc_storeStrong((id *)&self->_batchableLocations, 0);
  objc_storeStrong((id *)&self->_viewModels, 0);

  objc_storeStrong((id *)&self->_sections, 0);
}

@end