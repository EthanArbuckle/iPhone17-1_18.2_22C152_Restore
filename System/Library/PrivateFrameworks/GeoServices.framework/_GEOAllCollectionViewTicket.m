@interface _GEOAllCollectionViewTicket
- (void)parseAllCollectionViewResponse:(id)a3 usingError:(id)a4 onCompletionHandler:(id)a5;
- (void)submitWithHandler:(id)a3 networkActivity:(id)a4;
@end

@implementation _GEOAllCollectionViewTicket

- (void)submitWithHandler:(id)a3 networkActivity:(id)a4
{
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __65___GEOAllCollectionViewTicket_submitWithHandler_networkActivity___block_invoke;
    v8[3] = &unk_1E53DEA28;
    v8[4] = self;
    id v9 = v6;
    [(GEOAbstractRequestResponseTicket *)self performSubmitWithHandler:v8 auditToken:0 timeout:a4 networkActivity:0.0];
  }
}

- (void)parseAllCollectionViewResponse:(id)a3 usingError:(id)a4 onCompletionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *, void *, void))a5;
  if (!v8)
  {
    uint64_t v10 = [v7 globalResult];
    if (v10)
    {
      v11 = (void *)v10;
      -[GEOPDPlaceGlobalResult _readAllCollectionsViewResult](v10);
      uint64_t v12 = v11[6];

      if (v12)
      {
        uint64_t v13 = [v7 globalResult];
        v14 = (void *)v13;
        if (v13 && (-[GEOPDPlaceGlobalResult _readAllCollectionsViewResult](v13), v14[6]))
        {
          v15 = [v7 globalResult];
          -[GEOPDPlaceGlobalResult allCollectionsViewResult](v15);
          v16 = (id *)objc_claimAutoreleasedReturnValue();
          v17 = -[GEOPDAllCollectionsViewResult resultFilters](v16);

          if (v17)
          {
            id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            v19 = [v7 mapsResults];
            v36[0] = MEMORY[0x1E4F143A8];
            v36[1] = 3221225472;
            v36[2] = __93___GEOAllCollectionViewTicket_parseAllCollectionViewResponse_usingError_onCompletionHandler___block_invoke;
            v36[3] = &unk_1E53D78A8;
            id v37 = v18;
            id v20 = v18;
            [v19 enumerateObjectsUsingBlock:v36];

            v21 = [GEOAllCollectionsViewResult alloc];
            v22 = [v7 globalResult];
            v23 = -[GEOPDPlaceGlobalResult allCollectionsViewResult](v22);
            v24 = [(GEOAllCollectionsViewResult *)v21 initWithAllCollectionsViewResult:v23 withPlaces:v20];

LABEL_16:
            v34 = +[GEOCollectionResult collectionResultsFromResponse:v7];
            v35 = (void *)[v34 copy];
            v9[2](v9, v24, v35, 0);

            goto LABEL_17;
          }
        }
        else
        {
        }
        uint64_t v25 = [v7 globalResult];
        v26 = (void *)v25;
        if (v25 && (-[GEOPDPlaceGlobalResult _readAllCollectionsViewResult](v25), v26[6]))
        {
          v27 = [v7 globalResult];
          -[GEOPDPlaceGlobalResult allCollectionsViewResult](v27);
          v28 = (id *)objc_claimAutoreleasedReturnValue();
          v29 = -[GEOPDAllCollectionsViewResult collectionIds](v28);
          uint64_t v30 = [v29 count];

          if (v30)
          {
            v31 = [GEOAllCollectionsViewResult alloc];
            v32 = [v7 globalResult];
            v33 = -[GEOPDPlaceGlobalResult allCollectionsViewResult](v32);
            v24 = [(GEOAllCollectionsViewResult *)v31 initWithAllCollectionsViewResult:v33];

            goto LABEL_16;
          }
        }
        else
        {
        }
        v24 = 0;
        goto LABEL_16;
      }
    }
  }
  ((void (**)(id, void *, void *, id))v9)[2](v9, 0, 0, v8);
LABEL_17:
}

@end