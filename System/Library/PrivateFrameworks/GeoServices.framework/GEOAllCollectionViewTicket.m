@interface GEOAllCollectionViewTicket
@end

@implementation GEOAllCollectionViewTicket

void __65___GEOAllCollectionViewTicket_submitWithHandler_networkActivity___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65___GEOAllCollectionViewTicket_submitWithHandler_networkActivity___block_invoke_2;
  v6[3] = &unk_1E53DEC68;
  v5 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  [v5 parseAllCollectionViewResponse:a2 usingError:a3 onCompletionHandler:v6];
}

uint64_t __65___GEOAllCollectionViewTicket_submitWithHandler_networkActivity___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __93___GEOAllCollectionViewTicket_parseAllCollectionViewResponse_usingError_onCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ([v7 resultType] == 1)
  {
    if ([v7 hasPlace])
    {
      v3 = [v7 place];
      int v4 = [v3 status];

      if (!v4)
      {
        v5 = *(void **)(a1 + 32);
        v6 = [v7 place];
        [v5 addObject:v6];
      }
    }
  }
}

@end