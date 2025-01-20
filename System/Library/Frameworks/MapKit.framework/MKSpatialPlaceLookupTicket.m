@interface MKSpatialPlaceLookupTicket
@end

@implementation MKSpatialPlaceLookupTicket

void __55___MKSpatialPlaceLookupTicket_submitWithHandler_queue___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v6 = [*(id *)(*(void *)(a1 + 32) + 8) parameters];
    v7 = [v6 objectAtIndexedSubscript:0];
    v8 = [v5 resultItemForSpatialLookupParameters:v7];

    v9 = [v8 mapItems];
    if ([v9 count])
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __55___MKSpatialPlaceLookupTicket_submitWithHandler_queue___block_invoke_2;
      v14[3] = &unk_1E54BAF48;
      v14[4] = *(void *)(a1 + 32);
      id v15 = v8;
      id v16 = *(id *)(a1 + 40);
      _mapItemsForGeoMapItemsWithHandler(v9, v14);
    }
    else
    {
      id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v11 = [v10 initWithDomain:MKErrorDomain code:4 userInfo:0];
      uint64_t v12 = *(void *)(a1 + 32);
      v13 = *(void **)(v12 + 16);
      *(void *)(v12 + 16) = v11;

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

void __55___MKSpatialPlaceLookupTicket_submitWithHandler_queue___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), a3);
  if ([v9 count])
  {
    uint64_t v6 = [*(id *)(a1 + 40) boundingRegion];
    uint64_t v7 = *(void *)(a1 + 32);
    v8 = *(void **)(v7 + 24);
    *(void *)(v7 + 24) = v6;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

@end