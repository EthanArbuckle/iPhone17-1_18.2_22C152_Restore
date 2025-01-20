@interface BSUIMapService
+ (id)sharedService;
- (_BSUIMapServiceTicket)ticketForBrandLookupWithIMessageUid:(uint64_t)a1;
@end

@implementation BSUIMapService

+ (id)sharedService
{
  self;
  if (qword_268C5C948 != -1) {
    dispatch_once(&qword_268C5C948, &__block_literal_global);
  }
  v0 = (void *)_MergedGlobals;

  return v0;
}

void __31__BSUIMapService_sharedService__block_invoke()
{
  v0 = [BSUIMapService alloc];
  v1 = [MEMORY[0x263F10980] sharedService];
  id v4 = v1;
  if (v0)
  {
    v5.receiver = v0;
    v5.super_class = (Class)BSUIMapService;
    v2 = (BSUIMapService *)objc_msgSendSuper2(&v5, sel_init);
    v0 = v2;
    if (v2) {
      objc_storeStrong((id *)&v2->_mapService, v1);
    }
  }

  v3 = (void *)_MergedGlobals;
  _MergedGlobals = (uint64_t)v0;
}

- (_BSUIMapServiceTicket)ticketForBrandLookupWithIMessageUid:(uint64_t)a1
{
  if (a1)
  {
    v2 = [*(id *)(a1 + 8) ticketForBrandLookupWithIMessageUid:a2 traits:0];
    v3 = [_BSUIMapServiceTicket alloc];
    id v4 = v2;
    if (v3)
    {
      v7.receiver = v3;
      v7.super_class = (Class)_BSUIMapServiceTicket;
      objc_super v5 = (_BSUIMapServiceTicket *)objc_msgSendSuper2(&v7, sel_init);
      v3 = v5;
      if (v5) {
        objc_storeStrong((id *)&v5->_serviceTicket, v2);
      }
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void).cxx_destruct
{
}

@end