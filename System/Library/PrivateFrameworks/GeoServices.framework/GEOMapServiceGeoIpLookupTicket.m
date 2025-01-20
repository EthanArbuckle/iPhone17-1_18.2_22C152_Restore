@interface GEOMapServiceGeoIpLookupTicket
@end

@implementation GEOMapServiceGeoIpLookupTicket

void __93___GEOMapServiceGeoIpLookupTicket_submitWithHandler_auditToken_networkActivity_handlerQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    v7 = *(void **)(a1 + 40);
    if (v7)
    {
      v8 = v7;
      if (v6)
      {
LABEL_4:
        v9 = 0;
LABEL_7:
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __93___GEOMapServiceGeoIpLookupTicket_submitWithHandler_auditToken_networkActivity_handlerQueue___block_invoke_2;
        block[3] = &unk_1E53D95B8;
        id v15 = *(id *)(a1 + 48);
        v13 = v9;
        id v14 = v6;
        v11 = v9;
        dispatch_async(v8, block);

        goto LABEL_8;
      }
    }
    else
    {
      v8 = MEMORY[0x1E4F14428];
      id v10 = MEMORY[0x1E4F14428];
      if (v6) {
        goto LABEL_4;
      }
    }
    v9 = [[GeoIpLookupResult alloc] initWithGEOPDPlaceResponse:v5];
    goto LABEL_7;
  }
LABEL_8:
}

uint64_t __93___GEOMapServiceGeoIpLookupTicket_submitWithHandler_auditToken_networkActivity_handlerQueue___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

@end