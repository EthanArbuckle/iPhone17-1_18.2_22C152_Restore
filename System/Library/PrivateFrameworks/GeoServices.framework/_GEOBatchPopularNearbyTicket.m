@interface _GEOBatchPopularNearbyTicket
- (_GEOBatchPopularNearbyTicket)initWithRequest:(id)a3 traits:(id)a4 categories:(id)a5;
- (id)resultSectionHeaderForCategory:(id)a3;
- (void)submitWithHandler:(id)a3 auditToken:(id)a4 networkActivity:(id)a5;
- (void)submitWithHandler:(id)a3 networkActivity:(id)a4;
@end

@implementation _GEOBatchPopularNearbyTicket

- (_GEOBatchPopularNearbyTicket)initWithRequest:(id)a3 traits:(id)a4 categories:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_GEOBatchPopularNearbyTicket;
  v9 = [(GEOAbstractRequestResponseTicket *)&v14 initWithRequest:a3 traits:a4];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    categories = v9->_categories;
    v9->_categories = (NSArray *)v10;

    v12 = v9;
  }

  return v9;
}

- (void)submitWithHandler:(id)a3 networkActivity:(id)a4
{
}

- (void)submitWithHandler:(id)a3 auditToken:(id)a4 networkActivity:(id)a5
{
  id v8 = a3;
  v9 = v8;
  if (v8)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __77___GEOBatchPopularNearbyTicket_submitWithHandler_auditToken_networkActivity___block_invoke;
    v10[3] = &unk_1E53DEA28;
    v10[4] = self;
    id v11 = v8;
    [(GEOAbstractRequestResponseTicket *)self performSubmitWithHandler:v10 auditToken:a4 timeout:a5 networkActivity:0.0];
  }
}

- (id)resultSectionHeaderForCategory:(id)a3
{
  id v4 = a3;
  response = self->super._response;
  if (!response) {
    goto LABEL_6;
  }
  v6 = [(GEOPDPlaceResponse *)response globalResult];
  uint64_t v7 = -[GEOPDPlaceGlobalResult batchPopularNearbySearchResult](v6);
  id v8 = (void *)v7;
  uint64_t v9 = v7 ? [*(id *)(v7 + 16) count] : 0;
  NSUInteger v10 = [(NSArray *)self->_categories count];

  if (v9 == v10
    && (NSUInteger v11 = [(NSArray *)self->_categories indexOfObject:v4], v11 != 0x7FFFFFFFFFFFFFFFLL))
  {
    uint64_t v14 = v11;
    v15 = [(GEOPDPlaceResponse *)self->super._response globalResult];
    -[GEOPDPlaceGlobalResult batchPopularNearbySearchResult](v15);
    v16 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDBatchPopularNearbySearchResult popularNearbyResultAtIndex:](v16, v14);
    v17 = (id *)objc_claimAutoreleasedReturnValue();

    v12 = -[GEOPDPopularNearbyResult sectionHeader](v17);
  }
  else
  {
LABEL_6:
    v12 = 0;
  }

  return v12;
}

- (void).cxx_destruct
{
}

@end