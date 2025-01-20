@interface GEOMapServiceSearchCapabilitiesTicket
@end

@implementation GEOMapServiceSearchCapabilitiesTicket

void __76___GEOMapServiceSearchCapabilitiesTicket_submitWithHandler_networkActivity___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v4();
  }
  else
  {
    v5 = [a2 globalResult];
    -[GEOPDPlaceGlobalResult searchCapabilitiesResult](v5);
    v9 = (id *)objc_claimAutoreleasedReturnValue();

    -[GEOPDSearchCapabilitiesResult offlineCapabilities](v9);
    v6 = (unsigned char *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && (v6[20] & 1) != 0)
    {
      v8 = -[GEOPDSearchCapabilitiesResult offlineCapabilities](v9);
      if (v8) {
    }
      }
    else
    {
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

@end