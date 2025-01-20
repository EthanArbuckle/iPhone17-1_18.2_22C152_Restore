@interface GEOPlaceSearchCompletionItem
@end

@implementation GEOPlaceSearchCompletionItem

void __112___GEOPlaceSearchCompletionItem_initWithEntry_traits_entryListIndex_entryIndex_mapItems_collections_publishers___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v16 = a2;
  v6 = [v16 collection];
  v7 = -[GEOPDCollectionResult collectionId](v6);

  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    v9 = [GEOMapItemIdentifier alloc];
    v10 = [v16 collection];
    v11 = -[GEOPDCollectionResult collectionId](v10);
    v12 = [(GEOMapItemIdentifier *)v9 initWithMapsIdentifier:v11];
    LODWORD(v8) = [v8 isEqualToGEOMapItemIdentifier:v12];

    if (v8)
    {
      uint64_t v13 = [v16 collection];
      uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
      v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;

      *a4 = 1;
    }
  }
}

void __112___GEOPlaceSearchCompletionItem_initWithEntry_traits_entryListIndex_entryIndex_mapItems_collections_publishers___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v16 = a2;
  v6 = [v16 publisher];
  v7 = -[GEOPDPublisherResult publisherId](v6);

  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    v9 = [GEOMapItemIdentifier alloc];
    v10 = [v16 publisher];
    v11 = -[GEOPDPublisherResult publisherId](v10);
    v12 = [(GEOMapItemIdentifier *)v9 initWithMapsIdentifier:v11];
    LODWORD(v8) = [v8 isEqualToGEOMapItemIdentifier:v12];

    if (v8)
    {
      uint64_t v13 = [v16 publisher];
      uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
      v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;

      *a4 = 1;
    }
  }
}

GEOResultRefinement *__50___GEOPlaceSearchCompletionItem_resultRefinements__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[GEOResultRefinement alloc] initWithResultRefinement:v2];

  return v3;
}

@end