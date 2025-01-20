@interface MKPlaceCuratedCollectionRefiner
- (MKPlaceCuratedCollectionRefiner)initWithCollectionIdentifier:(unint64_t)a3;
- (MKPlaceCuratedCollectionRefiner)initWithCollectionIdentifier:(unint64_t)a3 providerIdentifier:(int)a4;
- (void)fetchWithCallbackQueue:(id)a3 completion:(id)a4;
@end

@implementation MKPlaceCuratedCollectionRefiner

- (MKPlaceCuratedCollectionRefiner)initWithCollectionIdentifier:(unint64_t)a3
{
  return [(MKPlaceCuratedCollectionRefiner *)self initWithCollectionIdentifier:a3 providerIdentifier:0];
}

- (MKPlaceCuratedCollectionRefiner)initWithCollectionIdentifier:(unint64_t)a3 providerIdentifier:(int)a4
{
  v4 = self;
  v19[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v5 = *(void *)&a4;
    v17.receiver = self;
    v17.super_class = (Class)MKPlaceCuratedCollectionRefiner;
    v7 = [(MKPlaceCuratedCollectionRefiner *)&v17 init];
    if (v7)
    {
      v8 = [MKMapItemIdentifier alloc];
      uint64_t v9 = -[MKMapItemIdentifier initWithMUID:resultProviderID:coordinate:](v8, "initWithMUID:resultProviderID:coordinate:", a3, v5, *MEMORY[0x1E4F1E750], *(double *)(MEMORY[0x1E4F1E750] + 8));
      collectionIdentifier = v7->_collectionIdentifier;
      v7->_collectionIdentifier = (MKMapItemIdentifier *)v9;

      v11 = +[MKMapService sharedService];
      v19[0] = v7->_collectionIdentifier;
      v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
      uint64_t v13 = [v11 ticketForCuratedCollections:v12 isBatchLookup:0 traits:0];
      identifierRefinementTicket = v7->_identifierRefinementTicket;
      v7->_identifierRefinementTicket = (MKMapServiceCuratedCollectionTicket *)v13;
    }
    v4 = v7;
    v15 = v4;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_18BAEC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: collectionIdentifier != 0", buf, 2u);
    }
    v15 = 0;
  }

  return v15;
}

- (void)fetchWithCallbackQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_WORD *)buf = 0;
    uint64_t v13 = MEMORY[0x1E4F14500];
    v14 = "Assertion failed: completion != ((void *)0)";
LABEL_9:
    _os_log_fault_impl(&dword_18BAEC000, v13, OS_LOG_TYPE_FAULT, v14, buf, 2u);
    goto LABEL_4;
  }
  if (!v6)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_WORD *)buf = 0;
    uint64_t v13 = MEMORY[0x1E4F14500];
    v14 = "Assertion failed: callbackQueue != ((void *)0)";
    goto LABEL_9;
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  void v19[2] = __69__MKPlaceCuratedCollectionRefiner_fetchWithCallbackQueue_completion___block_invoke;
  v19[3] = &unk_1E54B8DF8;
  v19[4] = self;
  id v8 = v6;
  id v20 = v8;
  id v9 = v7;
  id v21 = v9;
  v10 = (void *)MEMORY[0x18C139AE0](v19);
  identifierRefinementTicket = self->_identifierRefinementTicket;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__MKPlaceCuratedCollectionRefiner_fetchWithCallbackQueue_completion___block_invoke_3;
  v15[3] = &unk_1E54B8E20;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  [(MKMapServiceCuratedCollectionTicket *)identifierRefinementTicket submitWithCallbackQueue:v16 handler:v15 networkActivity:0];

LABEL_4:
}

void __69__MKPlaceCuratedCollectionRefiner_fetchWithCallbackQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 itemIds];
  v4 = MKMapItemIdentifiersArrayFromGEOMapItemIdentifiersArray(v3);

  uint64_t v5 = +[MKMapService sharedService];
  id v6 = [v5 ticketForCuratedCollectionItems:v4 collection:*(void *)(*(void *)(a1 + 32) + 8) traits:0];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__MKPlaceCuratedCollectionRefiner_fetchWithCallbackQueue_completion___block_invoke_2;
  v8[3] = &unk_1E54B8DD0;
  uint64_t v7 = *(void *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  [v6 submitWithCallbackQueue:v7 handler:v8 networkActivity:0];
}

void __69__MKPlaceCuratedCollectionRefiner_fetchWithCallbackQueue_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if ([@"Failed to refine map items for curated collection" length]) {
      [v10 setObject:@"Failed to refine map items for curated collection" forKey:*MEMORY[0x1E4F28568]];
    }
    [v10 setObject:@"Failed to refine map items for curated collection" forKey:*MEMORY[0x1E4F28A50]];
    v11 = (void *)MEMORY[0x1E4F28C58];
    id v12 = MKErrorDomain;
    uint64_t v13 = (void *)[v10 copy];
    v14 = [v11 errorWithDomain:v12 code:2 userInfo:v13];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v16 = v8;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v23 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "mapItem", (void)v22);
          [v15 addObject:v21];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v18);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __69__MKPlaceCuratedCollectionRefiner_fetchWithCallbackQueue_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if ([@"Failed to refine curated collection for identifier" length]) {
      [v7 setObject:@"Failed to refine curated collection for identifier" forKey:*MEMORY[0x1E4F28568]];
    }
    [v7 setObject:@"Failed to refine curated collection for identifier" forKey:*MEMORY[0x1E4F28A50]];
    id v8 = (void *)MEMORY[0x1E4F28C58];
    id v9 = MKErrorDomain;
    id v10 = (void *)[v7 copy];
    v11 = [v8 errorWithDomain:v9 code:2 userInfo:v10];

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__MKPlaceCuratedCollectionRefiner_fetchWithCallbackQueue_completion___block_invoke_4;
    block[3] = &unk_1E54B8360;
    id v12 = *(NSObject **)(a1 + 32);
    id v13 = *(id *)(a1 + 40);
    id v30 = v11;
    id v31 = v13;
    id v14 = v11;
    dispatch_async(v12, block);

    id v15 = v31;
  }
  else
  {
    if ([v5 count])
    {
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __69__MKPlaceCuratedCollectionRefiner_fetchWithCallbackQueue_completion___block_invoke_6;
      v23[3] = &unk_1E54B8360;
      id v25 = *(id *)(a1 + 48);
      id v24 = v5;
      dispatch_async(MEMORY[0x1E4F14428], v23);

      id v14 = v25;
      goto LABEL_8;
    }
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if ([@"No curated collections for identifier" length]) {
      [v16 setObject:@"No curated collections for identifier" forKey:*MEMORY[0x1E4F28568]];
    }
    uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = MKErrorDomain;
    uint64_t v19 = (void *)[v16 copy];
    id v20 = [v17 errorWithDomain:v18 code:1 userInfo:v19];

    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __69__MKPlaceCuratedCollectionRefiner_fetchWithCallbackQueue_completion___block_invoke_5;
    v26[3] = &unk_1E54B8360;
    id v21 = *(NSObject **)(a1 + 32);
    id v22 = *(id *)(a1 + 40);
    id v27 = v20;
    id v28 = v22;
    id v14 = v20;
    dispatch_async(v21, v26);

    id v15 = v28;
  }

LABEL_8:
}

uint64_t __69__MKPlaceCuratedCollectionRefiner_fetchWithCallbackQueue_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

uint64_t __69__MKPlaceCuratedCollectionRefiner_fetchWithCallbackQueue_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

void __69__MKPlaceCuratedCollectionRefiner_fetchWithCallbackQueue_completion___block_invoke_6(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) firstObject];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItemRefinementTicket, 0);
  objc_storeStrong((id *)&self->_identifierRefinementTicket, 0);

  objc_storeStrong((id *)&self->_collectionIdentifier, 0);
}

@end