@interface CLSInvestigationPhotoKitFeeder
+ (id)feederForAssetCollection:(id)a3 options:(id)a4 feederPrefetchOptions:(id)a5 curationContext:(id)a6;
+ (id)feederForAssetCollection:(id)a3 options:(id)a4 feederPrefetchOptions:(id)a5 curationContext:(id)a6 sharedLibraryEnabled:(BOOL)a7;
- (BOOL)_shouldPrefetchCurationInformation;
- (BOOL)hasBestScoringAssets;
- (BOOL)hasFavoritedAssets;
- (BOOL)hasNonJunkAssets;
- (BOOL)hasPeople;
- (CLSInvestigationPhotoKitFeeder)initWithAssetCollection:(id)a3 assetFetchOptions:(id)a4 feederPrefetchOptions:(id)a5 curationContext:(id)a6;
- (CLSInvestigationPhotoKitFeeder)initWithAssetFetchResult:(id)a3 curationContext:(id)a4;
- (NSSet)shareParticipants;
- (PHAssetCollection)assetCollection;
- (PHFetchOptions)assetFetchOptions;
- (PHFetchResult)assetFetchResult;
- (double)behavioralScore;
- (id)allItems;
- (id)approximateLocation;
- (id)itemAtIndex:(unint64_t)a3;
- (id)localEndDate;
- (id)localEndDateComponents;
- (id)localStartDate;
- (id)localStartDateComponents;
- (id)privateItems;
- (id)sharedItems;
- (id)universalEndDate;
- (id)universalStartDate;
- (unint64_t)numberOfAllPeople;
- (unint64_t)numberOfItems;
- (unint64_t)numberOfRegularGemItems;
- (unint64_t)numberOfShinyGemItems;
- (void)_prefetchShareParticipants;
- (void)enumerateItemsUsingBlock:(id)a3;
- (void)enumerateItemsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
@end

@implementation CLSInvestigationPhotoKitFeeder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareParticipants, 0);
  objc_storeStrong((id *)&self->_assetFetchOptions, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->_curationContext, 0);
  objc_storeStrong((id *)&self->_allItems, 0);
  objc_storeStrong((id *)&self->_fetchResult, 0);
}

- (NSSet)shareParticipants
{
  return self->_shareParticipants;
}

- (PHFetchOptions)assetFetchOptions
{
  return self->_assetFetchOptions;
}

- (PHAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (void)_prefetchShareParticipants
{
  v3 = [(PHFetchResult *)self->_fetchResult photoLibrary];
  id v9 = [v3 librarySpecificFetchOptions];

  v4 = [MEMORY[0x1E4F392E8] fetchContributorsForAssets:self->_fetchResult options:v9];
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  v6 = [v4 fetchedObjects];
  v7 = [v5 setWithArray:v6];
  shareParticipants = self->_shareParticipants;
  self->_shareParticipants = v7;
}

- (double)behavioralScore
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [(CLSInvestigationPhotoKitFeeder *)self allItems];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    double v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * i) clsBehavioralScore];
        double v7 = v7 + v9;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
  }
  unint64_t v10 = [(PHFetchResult *)self->_fetchResult count];

  return v7 / (double)v10;
}

- (unint64_t)numberOfRegularGemItems
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [(CLSInvestigationPhotoKitFeeder *)self allItems];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += [*(id *)(*((void *)&v9 + 1) + 8 * i) isRegularGem];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (unint64_t)numberOfShinyGemItems
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [(CLSInvestigationPhotoKitFeeder *)self allItems];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += [*(id *)(*((void *)&v9 + 1) + 8 * i) isShinyGem];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (void)enumerateItemsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  double v7 = self->_fetchResult;
  objc_sync_enter(v7);
  if (self->_assetPrefetchOptions)
  {
    v8 = [(CLSInvestigationPhotoKitFeeder *)self allItems];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __71__CLSInvestigationPhotoKitFeeder_enumerateItemsWithOptions_usingBlock___block_invoke_2;
    v10[3] = &unk_1E690F8E0;
    id v11 = v6;
    [v8 enumerateObjectsWithOptions:a3 usingBlock:v10];
  }
  else
  {
    fetchResult = self->_fetchResult;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __71__CLSInvestigationPhotoKitFeeder_enumerateItemsWithOptions_usingBlock___block_invoke;
    v12[3] = &unk_1E690F8E0;
    id v13 = v6;
    [(PHFetchResult *)fetchResult enumerateObjectsWithOptions:a3 usingBlock:v12];
    v8 = v13;
  }

  objc_sync_exit(v7);
}

uint64_t __71__CLSInvestigationPhotoKitFeeder_enumerateItemsWithOptions_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __71__CLSInvestigationPhotoKitFeeder_enumerateItemsWithOptions_usingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateItemsUsingBlock:(id)a3
{
  id v4 = (id)MEMORY[0x1D2602540](a3, a2);
  [(CLSInvestigationPhotoKitFeeder *)self enumerateItemsWithOptions:0 usingBlock:v4];
}

- (id)itemAtIndex:(unint64_t)a3
{
  unint64_t v5 = self->_fetchResult;
  objc_sync_enter(v5);
  if (self->_assetPrefetchOptions)
  {
    id v6 = [(CLSInvestigationPhotoKitFeeder *)self allItems];
    double v7 = [v6 objectAtIndexedSubscript:a3];
  }
  else
  {
    double v7 = [(PHFetchResult *)self->_fetchResult objectAtIndex:a3];
  }
  objc_sync_exit(v5);

  return v7;
}

- (id)sharedItems
{
  v2 = [(CLSInvestigationPhotoKitFeeder *)self allItems];
  uint64_t v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"clsIsInSharedLibrary == YES"];
  id v4 = [v2 filteredArrayUsingPredicate:v3];

  return v4;
}

- (id)privateItems
{
  v2 = [(CLSInvestigationPhotoKitFeeder *)self allItems];
  uint64_t v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"clsIsInSharedLibrary == NO"];
  id v4 = [v2 filteredArrayUsingPredicate:v3];

  return v4;
}

- (id)allItems
{
  uint64_t v3 = self->_allItems;
  objc_sync_enter(v3);
  allItems = self->_allItems;
  if (!allItems)
  {
    unint64_t v5 = self->_fetchResult;
    objc_sync_enter(v5);
    unint64_t assetPrefetchOptions = self->_assetPrefetchOptions;
    if (assetPrefetchOptions)
    {
      double v7 = [MEMORY[0x1E4F38EB8] clsAllAssetsFromFetchResult:self->_fetchResult prefetchOptions:assetPrefetchOptions curationContext:self->_curationContext];
      v8 = self->_allItems;
      self->_allItems = v7;
    }
    else
    {
      id v9 = objc_alloc(MEMORY[0x1E4F1C978]);
      v8 = [(PHFetchResult *)self->_fetchResult fetchedObjects];
      long long v10 = (NSArray *)[v9 initWithArray:v8 copyItems:0];
      id v11 = self->_allItems;
      self->_allItems = v10;
    }
    objc_sync_exit(v5);

    allItems = self->_allItems;
  }
  long long v12 = allItems;
  objc_sync_exit(v3);

  return v12;
}

- (id)approximateLocation
{
  uint64_t v3 = self->_fetchResult;
  objc_sync_enter(v3);
  id v4 = [(PHAssetCollection *)self->_assetCollection approximateLocation];
  objc_sync_exit(v3);

  return v4;
}

- (id)localEndDateComponents
{
  return [(PHAssetCollection *)self->_assetCollection cls_localEndDateComponents];
}

- (id)localStartDateComponents
{
  return [(PHAssetCollection *)self->_assetCollection cls_localStartDateComponents];
}

- (unint64_t)numberOfAllPeople
{
  v2 = self;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  unint64_t result = self->_numberOfAllPeople;
  if (result == -1)
  {
    uint64_t v4 = MEMORY[0x1D2602300](-1, a2);
    unint64_t v5 = (void *)v4;
    if ((v2->_assetPrefetchOptions & 8) != 0)
    {
      v23 = (void *)v4;
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v10 = [(CLSCurationContext *)v2->_curationContext nonPetFacedPersonLocalIdentifiers];
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      v24 = v2;
      obuint64_t j = [(CLSInvestigationPhotoKitFeeder *)v2 allItems];
      uint64_t v11 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v31 != v13) {
              objc_enumerationMutation(obj);
            }
            long long v15 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            long long v26 = 0u;
            long long v27 = 0u;
            long long v28 = 0u;
            long long v29 = 0u;
            v16 = objc_msgSend(v15, "clsFaceInformationSummary", v23);
            uint64_t v17 = [v16 faceInformationByPersonLocalIdentifier];

            uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
            if (v18)
            {
              uint64_t v19 = v18;
              uint64_t v20 = *(void *)v27;
              do
              {
                for (uint64_t j = 0; j != v19; ++j)
                {
                  if (*(void *)v27 != v20) {
                    objc_enumerationMutation(v17);
                  }
                  uint64_t v22 = *(void *)(*((void *)&v26 + 1) + 8 * j);
                  if ([v10 containsObject:v22]) {
                    [v9 addObject:v22];
                  }
                }
                uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
              }
              while (v19);
            }
          }
          uint64_t v12 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
        }
        while (v12);
      }

      v2 = v24;
      v24->_numberOfAllPeople = [v9 count];

      unint64_t v5 = v23;
    }
    else
    {
      id v6 = [(PHAssetCollection *)v2->_assetCollection photoLibrary];
      double v7 = [v6 librarySpecificFetchOptions];

      [v7 setShouldPrefetchCount:1];
      [v7 setPersonContext:1];
      [v7 setIncludedDetectionTypes:&unk_1F28F2DF8];
      v8 = [MEMORY[0x1E4F391F0] fetchPersonsForAssetCollection:v2->_assetCollection options:v7];
      v2->_numberOfAllPeople = [v8 count];
    }
    return v2->_numberOfAllPeople;
  }
  return result;
}

- (id)localEndDate
{
  return [(PHAssetCollection *)self->_assetCollection cls_localEndDate];
}

- (id)localStartDate
{
  return [(PHAssetCollection *)self->_assetCollection cls_localStartDate];
}

- (id)universalEndDate
{
  return [(PHAssetCollection *)self->_assetCollection cls_universalEndDate];
}

- (id)universalStartDate
{
  return [(PHAssetCollection *)self->_assetCollection cls_universalStartDate];
}

- (BOOL)hasNonJunkAssets
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(CLSInvestigationPhotoKitFeeder *)self allItems];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    double v5 = *MEMORY[0x1E4F8E750];
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "clsContentScore", (void)v9);
        if (v7 > v5)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)hasBestScoringAssets
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(CLSInvestigationPhotoKitFeeder *)self allItems];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    double v5 = *MEMORY[0x1E4F8E738];
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        double v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        objc_msgSend(v7, "clsContentScore", (void)v10);
        if (v8 >= v5 && ![v7 clsIsUtility])
        {
          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v3;
}

- (BOOL)hasFavoritedAssets
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = self->_fetchResult;
  objc_sync_enter(v3);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = self->_fetchResult;
  uint64_t v5 = [(PHFetchResult *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "isFavorite", (void)v9))
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [(PHFetchResult *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v3);
  return v5;
}

- (BOOL)hasPeople
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = self->_fetchResult;
  objc_sync_enter(v3);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = self->_fetchResult;
  uint64_t v5 = [(PHFetchResult *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "clsPeopleCount", (void)v9))
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [(PHFetchResult *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v3);
  return v5;
}

- (unint64_t)numberOfItems
{
  uint64_t v3 = self->_fetchResult;
  objc_sync_enter(v3);
  unint64_t v4 = [(PHFetchResult *)self->_fetchResult count];
  objc_sync_exit(v3);

  return v4;
}

- (BOOL)_shouldPrefetchCurationInformation
{
  id v2 = self;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([(PHAssetCollection *)self->_assetCollection assetCollectionType] == PHAssetCollectionTypeMoment)
  {
    uint64_t v3 = [(PHFetchResult *)v2->_fetchResult firstObject];
    [v3 curationScore];
    LOBYTE(v2) = v4 == 0.0;
  }
  else
  {
    uint64_t v3 = [(PHFetchOptions *)v2->_assetFetchOptions predicate];
    if (v3)
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      uint64_t v5 = v2->_fetchResult;
      id v2 = (CLSInvestigationPhotoKitFeeder *)[(PHFetchResult *)v5 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v2)
      {
        uint64_t v6 = *(void *)v19;
        while (2)
        {
          for (uint64_t i = 0; i != v2; uint64_t i = (CLSInvestigationPhotoKitFeeder *)((char *)i + 1))
          {
            if (*(void *)v19 != v6) {
              objc_enumerationMutation(v5);
            }
            objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "curationScore", (void)v18);
            if (v8 == 0.0)
            {
              LOBYTE(v2) = 1;
              goto LABEL_17;
            }
          }
          id v2 = (CLSInvestigationPhotoKitFeeder *)[(PHFetchResult *)v5 countByEnumeratingWithState:&v18 objects:v23 count:16];
          if (v2) {
            continue;
          }
          break;
        }
      }
    }
    else
    {
      long long v9 = [(PHAssetCollection *)v2->_assetCollection photoLibrary];
      uint64_t v5 = [v9 librarySpecificFetchOptions];

      [(PHFetchResult *)v5 setShouldPrefetchCount:1];
      [(PHFetchResult *)v5 setIncludeGuestAssets:1];
      [(PHFetchResult *)v5 setFetchLimit:1];
      long long v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"noindex:(curationScore) == 0"];
      uint64_t v11 = [(PHFetchOptions *)v2->_assetFetchOptions internalPredicate];
      long long v12 = (void *)v11;
      if (v11)
      {
        long long v13 = (void *)MEMORY[0x1E4F28BA0];
        v22[0] = v10;
        v22[1] = v11;
        uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
        uint64_t v15 = [v13 andPredicateWithSubpredicates:v14];

        long long v10 = (void *)v15;
      }
      [(PHFetchResult *)v5 setInternalPredicate:v10];
      v16 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v2->_assetCollection options:v5];
      LOBYTE(v2) = [v16 count] != 0;
    }
LABEL_17:
  }
  return (char)v2;
}

- (PHFetchResult)assetFetchResult
{
  return self->_fetchResult;
}

- (CLSInvestigationPhotoKitFeeder)initWithAssetFetchResult:(id)a3 curationContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CLSInvestigationPhotoKitFeeder;
  long long v9 = [(CLSInvestigationFeeder *)&v18 init];
  long long v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fetchResult, a3);
    uint64_t v11 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssetFetchResult:v7 title:0];
    assetCollection = v10->_assetCollection;
    v10->_assetCollection = (PHAssetCollection *)v11;

    uint64_t v13 = [v7 fetchOptions];
    assetFetchOptions = v10->_assetFetchOptions;
    v10->_assetFetchOptions = (PHFetchOptions *)v13;

    objc_storeStrong((id *)&v10->_curationContext, a4);
    uint64_t v15 = [MEMORY[0x1E4F1CAD0] set];
    shareParticipants = v10->_shareParticipants;
    v10->_shareParticipants = (NSSet *)v15;
  }
  return v10;
}

- (CLSInvestigationPhotoKitFeeder)initWithAssetCollection:(id)a3 assetFetchOptions:(id)a4 feederPrefetchOptions:(id)a5 curationContext:(id)a6
{
  v43[2] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v41.receiver = self;
  v41.super_class = (Class)CLSInvestigationPhotoKitFeeder;
  v16 = [(CLSInvestigationFeeder *)&v41 init];
  if (!v16) {
    goto LABEL_25;
  }
  id v40 = v15;
  uint64_t v17 = (void *)[v13 copy];
  objc_super v18 = v17;
  if (!v17)
  {
    uint64_t v6 = [v12 photoLibrary];
    objc_super v18 = [v6 librarySpecificFetchOptions];
  }
  p_assetFetchOptions = (id *)&v16->_assetFetchOptions;
  objc_storeStrong((id *)&v16->_assetFetchOptions, v18);
  if (!v17)
  {
  }
  [*p_assetFetchOptions setChunkSizeForFetch:10000];
  [*p_assetFetchOptions setIncludeGuestAssets:1];
  objc_storeStrong((id *)&v16->_assetCollection, a3);
  v16->_numberOfAllPeople = -1;
  long long v20 = [*p_assetFetchOptions sortDescriptors];
  if (v20) {
    goto LABEL_7;
  }
  long long v21 = [*p_assetFetchOptions internalSortDescriptors];

  if (!v21)
  {
    long long v20 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
    v43[0] = v20;
    v38 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
    v43[1] = v38;
    v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
    [*p_assetFetchOptions setSortDescriptors:v39];

LABEL_7:
  }
  if (v14) {
    uint64_t v22 = (CLSFeederPrefetchOptions *)v14;
  }
  else {
    uint64_t v22 = objc_alloc_init(CLSFeederPrefetchOptions);
  }
  v23 = v22;
  v16->_uint64_t assetPrefetchOptions = 0;
  v16->_assetPrefetchOptions |= [(CLSFeederPrefetchOptions *)v22 personCountPrefetchMode] == 2;
  v16->_assetPrefetchOptions |= 2 * ([(CLSFeederPrefetchOptions *)v23 personsPrefetchMode] == 2);
  v16->_assetPrefetchOptions |= 4 * ([(CLSFeederPrefetchOptions *)v23 scenesPrefetchMode] == 2);
  v16->_assetPrefetchOptions |= 8
                              * ([(CLSFeederPrefetchOptions *)v23 faceInformationPrefetchMode] == 2);
  if ([(CLSFeederPrefetchOptions *)v23 locationPrefetchMode] == 2) {
    uint64_t v24 = 16;
  }
  else {
    uint64_t v24 = 16 * ([(CLSFeederPrefetchOptions *)v23 locationPrefetchMode] == 1);
  }
  v16->_assetPrefetchOptions |= v24;
  if ([(CLSFeederPrefetchOptions *)v23 personsPrefetchMode] == 1
    || [(CLSFeederPrefetchOptions *)v23 scenesPrefetchMode] == 1
    || [(CLSFeederPrefetchOptions *)v23 faceInformationPrefetchMode] == 1)
  {
    BOOL v25 = [(CLSInvestigationPhotoKitFeeder *)v16 _shouldPrefetchCurationInformation];
    uint64_t v26 = [(CLSFeederPrefetchOptions *)v23 personCountPrefetchMode];
    if (v25)
    {
      v16->_assetPrefetchOptions |= v26 == 1;
      v16->_assetPrefetchOptions |= 2
                                  * ([(CLSFeederPrefetchOptions *)v23 personsPrefetchMode] == 1);
      v16->_assetPrefetchOptions |= 4
                                  * ([(CLSFeederPrefetchOptions *)v23 scenesPrefetchMode] == 1);
      uint64_t v27 = 8 * ([(CLSFeederPrefetchOptions *)v23 faceInformationPrefetchMode] == 1);
      uint64_t assetPrefetchOptions = v16->_assetPrefetchOptions;
    }
    else
    {
      if (v26 != 1) {
        goto LABEL_23;
      }
      uint64_t v27 = v16->_assetPrefetchOptions;
      uint64_t assetPrefetchOptions = 1;
    }
    v16->_uint64_t assetPrefetchOptions = v27 | assetPrefetchOptions;
  }
LABEL_23:
  if (!v13)
  {
    if (v16->_assetPrefetchOptions)
    {
      uint64_t v34 = *MEMORY[0x1E4F394E0];
      v42[0] = *MEMORY[0x1E4F39538];
      v42[1] = v34;
      v42[2] = *MEMORY[0x1E4F39488];
      v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:3];
      [*p_assetFetchOptions setFetchPropertySets:v35];

      if ((v16->_assetPrefetchOptions & 8) != 0)
      {
        uint64_t v36 = [*p_assetFetchOptions fetchPropertySets];
        v37 = [v36 arrayByAddingObject:*MEMORY[0x1E4F39480]];
        [*p_assetFetchOptions setFetchPropertySets:v37];
      }
    }
  }
  uint64_t v29 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v16->_assetCollection options:*p_assetFetchOptions];
  fetchResult = v16->_fetchResult;
  v16->_fetchResult = (PHFetchResult *)v29;

  [(CLSInvestigationFeeder *)v16 setAllowsInterview:1];
  objc_storeStrong((id *)&v16->_curationContext, a6);
  uint64_t v31 = [MEMORY[0x1E4F1CAD0] set];
  shareParticipants = v16->_shareParticipants;
  v16->_shareParticipants = (NSSet *)v31;

  id v15 = v40;
LABEL_25:

  return v16;
}

+ (id)feederForAssetCollection:(id)a3 options:(id)a4 feederPrefetchOptions:(id)a5 curationContext:(id)a6 sharedLibraryEnabled:(BOOL)a7
{
  BOOL v7 = a7;
  id v8 = +[CLSInvestigationPhotoKitFeeder feederForAssetCollection:a3 options:a4 feederPrefetchOptions:a5 curationContext:a6];
  long long v9 = v8;
  if (v7) {
    [v8 _prefetchShareParticipants];
  }
  return v9;
}

+ (id)feederForAssetCollection:(id)a3 options:(id)a4 feederPrefetchOptions:(id)a5 curationContext:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [[CLSInvestigationPhotoKitFeeder alloc] initWithAssetCollection:v12 assetFetchOptions:v11 feederPrefetchOptions:v10 curationContext:v9];

  return v13;
}

@end