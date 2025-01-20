@interface GEOBatchSpatialLookupTicket
@end

@implementation GEOBatchSpatialLookupTicket

void __77___GEOBatchSpatialLookupTicket_submitWithHandler_auditToken_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if ([*(id *)(a1 + 32) isCancelled] || v7)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), a2);
    uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 48) responsesCount];
    if (v8 == [*(id *)(*(void *)(a1 + 32) + 56) count])
    {
      uint64_t v21 = 0;
      v22 = &v21;
      uint64_t v23 = 0x2020000000;
      uint64_t v24 = 0;
      uint64_t v24 = [v6 responsesCount];
      if (v22[3])
      {
        for (unint64_t i = 0; i < [v6 responsesCount]; ++i)
        {
          v10 = [v6 responseAtIndex:i];
          v11 = [*(id *)(*(void *)(a1 + 32) + 56) objectAtIndex:i];
          if ([v10 statusCode] || !objc_msgSend(v10, "placesCount"))
          {
            uint64_t v12 = v22[3] - 1;
            v22[3] = v12;
            if (!v12) {
              (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
            }
          }
          else
          {
            v13 = [v10 places];
            v17[0] = MEMORY[0x1E4F143A8];
            v17[1] = 3221225472;
            v17[2] = __77___GEOBatchSpatialLookupTicket_submitWithHandler_auditToken_networkActivity___block_invoke_2;
            v17[3] = &unk_1E53DE730;
            v14 = *(void **)(a1 + 40);
            v17[4] = *(void *)(a1 + 32);
            id v19 = v14;
            id v18 = v11;
            v20 = &v21;
            _attributedGeoMapItemsForPlaceDatasWithHandler(0, v13, 0, 0, 0, 0, v17);
          }
        }
      }
      else
      {
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
      _Block_object_dispose(&v21, 8);
    }
    else
    {
      uint64_t v15 = *(void *)(a1 + 40);
      v16 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11 reason:@"Incorrect number of responses"];
      (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v16);
    }
  }
}

void __77___GEOBatchSpatialLookupTicket_submitWithHandler_auditToken_networkActivity___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    if (v5)
    {
      [*(id *)(a1 + 32) cancel];
      id v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_4:
      v6();
      goto LABEL_8;
    }
    id v7 = v8;
    if (!v8) {
      id v7 = (id)MEMORY[0x1E4F1CBF0];
    }
    id v8 = v7;
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "setObject:forKey:");
    if (!--*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      id v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
      goto LABEL_4;
    }
  }
LABEL_8:
}

void __83___GEOBatchSpatialLookupTicket_submitWithHandler_auditToken_networkActivity_queue___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)a1[6];
  if (v4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83___GEOBatchSpatialLookupTicket_submitWithHandler_auditToken_networkActivity_queue___block_invoke_2;
    block[3] = &unk_1E53D8E18;
    id v5 = a1[4];
    block[4] = a1[5];
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, block);
  }
}

uint64_t __83___GEOBatchSpatialLookupTicket_submitWithHandler_auditToken_networkActivity_queue___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isCancelled];
  if ((result & 1) == 0)
  {
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v3();
  }
  return result;
}

void __83___GEOBatchSpatialLookupTicket_submitWithHandler_auditToken_networkActivity_queue___block_invoke_3(void *a1, char a2)
{
  v2 = (void *)a1[6];
  if (v2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83___GEOBatchSpatialLookupTicket_submitWithHandler_auditToken_networkActivity_queue___block_invoke_4;
    block[3] = &unk_1E53DE578;
    v4 = a1[4];
    block[4] = a1[5];
    id v6 = v2;
    char v7 = a2;
    dispatch_async(v4, block);
  }
}

uint64_t __83___GEOBatchSpatialLookupTicket_submitWithHandler_auditToken_networkActivity_queue___block_invoke_4(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isCancelled];
  if ((result & 1) == 0)
  {
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

@end