@interface GEOMapsHomeTicket
@end

@implementation GEOMapsHomeTicket

void __56___GEOMapsHomeTicket_submitWithHandler_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  if (!v5
    && ([v14 globalResult], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v7 = (void *)v6, -[GEOPDPlaceGlobalResult _readMapsHomeResult](v6), uint64_t v8 = v7[28], v7, v8))
  {
    v9 = [GEOMapsHomeResult alloc];
    v10 = [v14 globalResult];
    v11 = -[GEOPDPlaceGlobalResult mapsHomeResult](v10);
    v12 = [v14 mapsResults];
    v13 = [(GEOMapsHomeResult *)v9 initWithMapsHomeResult:v11 mapsResults:v12];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

@end