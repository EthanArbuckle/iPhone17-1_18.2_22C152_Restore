@interface GEOCollectionResult
+ (id)collectionResultsFromResponse:(id)a3;
- (GEOCollectionResult)initWithCollectionResult:(id)a3;
- (GEOPlaceCollection)collection;
- (NSArray)placeCollectionItems;
@end

@implementation GEOCollectionResult

- (GEOPlaceCollection)collection
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  collection = self->_collection;
  if (!collection)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v4 = -[GEOPDComponent values]((id *)&self->_collectionComponent->super.super.isa);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          if (v9)
          {
            if (*(void *)(v9 + 392))
            {
              collectionComponent = self->_collectionComponent;
              if (collectionComponent)
              {
                if (collectionComponent->_attribution)
                {
                  v11 = [GEOPlaceCollection alloc];
                  v12 = -[GEOPDComponentValue placeCollection]((id *)v9);
                  v13 = -[GEOPDComponent attribution]((id *)&self->_collectionComponent->super.super.isa);
                  v14 = -[GEOPlaceCollection initWithCollection:usingAttribution:](v11, "initWithCollection:usingAttribution:", v12, v13, (void)v17);
                  v15 = self->_collection;
                  self->_collection = v14;

                  goto LABEL_15;
                }
              }
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_15:

    collection = self->_collection;
  }

  return collection;
}

void __48__GEOCollectionResult_initWithCollectionResult___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = a2;
  if (v7)
  {
    __int16 v8 = v7[50];
    if ((v8 & 0x80) != 0 && *((_DWORD *)v7 + 22) == 65 && ((v8 & 0x20) == 0 || !*((_DWORD *)v7 + 20)))
    {
      uint64_t v9 = v7;
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
      uint64_t v7 = v9;
      *a4 = 1;
    }
  }
}

- (GEOCollectionResult)initWithCollectionResult:(id)a3
{
  v4 = (id *)a3;
  v19.receiver = self;
  v19.super_class = (Class)GEOCollectionResult;
  uint64_t v5 = [(GEOCollectionResult *)&v19 init];
  if (!v5) {
    goto LABEL_7;
  }
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__27;
  long long v17 = __Block_byref_object_dispose__27;
  id v18 = 0;
  uint64_t v6 = -[GEOPDCollectionResult components](v4);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __48__GEOCollectionResult_initWithCollectionResult___block_invoke;
  v12[3] = &unk_1E53DAA50;
  v12[4] = &v13;
  [v6 enumerateObjectsUsingBlock:v12];

  uint64_t v7 = (GEOCollectionResult *)v14[5];
  if (v7)
  {
    objc_storeStrong((id *)&v5->_collectionComponent, (id)v14[5]);
    __int16 v8 = v4;
    p_super = &v5->_collectionResult->super.super;
    v5->_collectionResult = v8;
  }
  else
  {
    p_super = GEOGetCuratedCollectionsLog();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_188D96000, p_super, OS_LOG_TYPE_ERROR, "Collection Result could not be initialized because some data is missing.\n collectionComponent is nil.", v11, 2u);
    }
  }

  _Block_object_dispose(&v13, 8);
  if (v7) {
LABEL_7:
  }
    uint64_t v7 = v5;

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_collectionComponent, 0);

  objc_storeStrong((id *)&self->_collectionResult, 0);
}

- (NSArray)placeCollectionItems
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = -[GEOPDCollectionResult components]((id *)&self->_collectionResult->super.super.isa);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__GEOCollectionResult_placeCollectionItems__block_invoke;
  v8[3] = &unk_1E53DF898;
  id v5 = v3;
  id v9 = v5;
  [v4 enumerateObjectsUsingBlock:v8];

  if ([v5 count]) {
    uint64_t v6 = (void *)[v5 copy];
  }
  else {
    uint64_t v6 = 0;
  }

  return (NSArray *)v6;
}

void __43__GEOCollectionResult_placeCollectionItems__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  if (v3)
  {
    __int16 v4 = v3[50];
    if ((v4 & 0x80) != 0 && *((_DWORD *)v3 + 22) == 74 && ((v4 & 0x20) == 0 || !*((_DWORD *)v3 + 20)))
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      v14 = v3;
      id v5 = -[GEOPDComponent values]((id *)v3);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v16;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v16 != v8) {
              objc_enumerationMutation(v5);
            }
            uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * v9);
            if (v10 && *(void *)(v10 + 384))
            {
              v11 = [GEOPlaceCollectionItem alloc];
              v12 = -[GEOPDComponentValue placeCollectionItem]((id *)v10);
              uint64_t v13 = [(GEOPlaceCollectionItem *)v11 initWithPlaceCollectionItem:v12];

              if (v13) {
                [*(id *)(a1 + 32) addObject:v13];
              }
            }
            ++v9;
          }
          while (v7 != v9);
          uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v7);
      }

      v3 = v14;
    }
  }
}

+ (id)collectionResultsFromResponse:(id)a3
{
  v3 = [a3 resultsWithResultType:2];
  __int16 v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__GEOCollectionResult_collectionResultsFromResponse___block_invoke;
  v8[3] = &unk_1E53DF8C0;
  id v9 = v4;
  id v5 = v4;
  [v3 enumerateObjectsUsingBlock:v8];
  uint64_t v6 = (void *)[v5 copy];

  return v6;
}

void __53__GEOCollectionResult_collectionResultsFromResponse___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [[GEOCollectionResult alloc] initWithCollectionResult:v3];

  __int16 v4 = v5;
  if (v5)
  {
    [*(id *)(a1 + 32) addObject:v5];
    __int16 v4 = v5;
  }
}

@end