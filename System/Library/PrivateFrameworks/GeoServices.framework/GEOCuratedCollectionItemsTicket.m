@interface GEOCuratedCollectionItemsTicket
@end

@implementation GEOCuratedCollectionItemsTicket

void __70___GEOCuratedCollectionItemsTicket_submitWithHandler_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5
    && ([v5 mapsResults],
        v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 count],
        v7,
        !v6)
    && v8)
  {
    v9 = +[GEOCollectionResult collectionResultsFromResponse:v5];
    v10 = [v9 firstObject];
    v11 = [v5 resultsWithResultType:1];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __70___GEOCuratedCollectionItemsTicket_submitWithHandler_networkActivity___block_invoke_2;
    v14[3] = &unk_1E53DECB8;
    id v12 = *(id *)(a1 + 32);
    id v15 = v10;
    id v16 = v12;
    id v13 = v10;
    _attributedGeoMapItemsForPlaceDatasWithHandler(23, v11, 0, 0, 0, 0, v14);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __70___GEOCuratedCollectionItemsTicket_submitWithHandler_networkActivity___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  uint64_t v5 = *(void *)(a1 + 40);
  if (a3)
  {
    (*(void (**)(void, void, void, void, uint64_t))(v5 + 16))(*(void *)(a1 + 40), 0, 0, 0, a3);
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) collection];
    v7 = [*(id *)(a1 + 32) placeCollectionItems];
    (*(void (**)(uint64_t, void *, void *, id, void))(v5 + 16))(v5, v6, v7, v8, 0);
  }
}

@end