@interface GEOPlaceEnrichmentTicket
@end

@implementation GEOPlaceEnrichmentTicket

void __63___GEOPlaceEnrichmentTicket_submitWithHandler_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3)
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
    v9 = [v5 resultsWithResultType:1];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __63___GEOPlaceEnrichmentTicket_submitWithHandler_networkActivity___block_invoke_2;
    v10[3] = &unk_1E53DA278;
    id v11 = *(id *)(a1 + 32);
    _attributedGeoMapItemsForPlaceDatasWithHandler(58, v9, 0, 0, 0, 0, v10);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __63___GEOPlaceEnrichmentTicket_submitWithHandler_networkActivity___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = [a2 firstObject];
  if (v6
    && ([v6 _enrichmentData], v3 = objc_claimAutoreleasedReturnValue(), v3, v3))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = [v6 _enrichmentData];
    (*(void (**)(uint64_t, void *, void))(v4 + 16))(v4, v5, 0);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

@end