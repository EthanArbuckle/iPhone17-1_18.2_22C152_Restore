@interface GEORPFeedbackTicket
@end

@implementation GEORPFeedbackTicket

void __58___GEORPFeedbackTicket_submitWithHandler_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    id v6 = *(id *)(*(void *)(a1 + 32) + 40);
    v7 = v6;
    if (v5 && !v6)
    {
      v7 = [*(id *)(*(void *)(a1 + 32) + 64) data];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

@end