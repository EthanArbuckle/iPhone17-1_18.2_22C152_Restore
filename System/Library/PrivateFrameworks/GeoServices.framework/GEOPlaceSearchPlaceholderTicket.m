@interface GEOPlaceSearchPlaceholderTicket
@end

@implementation GEOPlaceSearchPlaceholderTicket

void __70___GEOPlaceSearchPlaceholderTicket_submitWithHandler_networkActivity___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v4();
  }
  else
  {
    v5 = [a2 globalResult];
    -[GEOPDPlaceGlobalResult searchFieldPlaceholderResult](v5);
    v6 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDSearchFieldPlaceholderResult displayString](v6);
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      v7 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-11 reason:@"Response had no placeholderString"];
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

@end