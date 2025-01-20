@interface GEOPhoneNumbersTicket
@end

@implementation GEOPhoneNumbersTicket

void __79___GEOPhoneNumbersTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    if (v5)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      v6 = [v7 resultsWithResultType:1];
      _attributedGeoMapItemsForPlaceDatasWithHandler(5, v6, 0, 0, 0, 0, *(void **)(a1 + 40));
    }
  }
}

@end