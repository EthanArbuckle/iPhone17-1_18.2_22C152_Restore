@interface _GEOPlaceSearchCategoryTicket
- (void)submitWithHandler:(id)a3 auditToken:(id)a4 networkActivity:(id)a5;
- (void)submitWithHandler:(id)a3 networkActivity:(id)a4;
@end

@implementation _GEOPlaceSearchCategoryTicket

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
    v10[2] = __78___GEOPlaceSearchCategoryTicket_submitWithHandler_auditToken_networkActivity___block_invoke;
    v10[3] = &unk_1E53DEA28;
    v10[4] = self;
    id v11 = v8;
    [(GEOAbstractRequestResponseTicket *)self performSubmitWithHandler:v10 auditToken:a4 timeout:a5 networkActivity:0.0];
  }
}

@end