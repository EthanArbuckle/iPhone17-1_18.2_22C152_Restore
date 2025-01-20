@interface GEOTransitLineTicket
@end

@implementation GEOTransitLineTicket

void __59___GEOTransitLineTicket_submitWithHandler_networkActivity___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v4();
  }
  else
  {
    v5 = [a2 resultsWithResultType:1];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __59___GEOTransitLineTicket_submitWithHandler_networkActivity___block_invoke_2;
    v6[3] = &unk_1E53DA278;
    id v7 = *(id *)(a1 + 32);
    _geoTransitLineItemsForPlaceDatas(v5, v6);
  }
}

uint64_t __59___GEOTransitLineTicket_submitWithHandler_networkActivity___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end