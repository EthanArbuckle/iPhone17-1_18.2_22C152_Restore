@interface GEOCuratedCollectionTicket
@end

@implementation GEOCuratedCollectionTicket

void __65___GEOCuratedCollectionTicket_submitWithHandler_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3)
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
    v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __65___GEOCuratedCollectionTicket_submitWithHandler_networkActivity___block_invoke_2;
    v14[3] = &unk_1E53DEC90;
    id v15 = v10;
    id v11 = v10;
    [v9 enumerateObjectsUsingBlock:v14];
    uint64_t v12 = *(void *)(a1 + 32);
    v13 = (void *)[v11 copy];
    (*(void (**)(uint64_t, void *, void))(v12 + 16))(v12, v13, 0);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __65___GEOCuratedCollectionTicket_submitWithHandler_networkActivity___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  v3 = [v6 collection];

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    id v5 = [v6 collection];
    [v4 addObject:v5];
  }
}

@end