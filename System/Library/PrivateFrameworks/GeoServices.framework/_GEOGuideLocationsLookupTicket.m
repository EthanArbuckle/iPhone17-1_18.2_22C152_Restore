@interface _GEOGuideLocationsLookupTicket
- (_GEOGuideLocationsLookupTicket)initWithRequest:(id)a3 traits:(id)a4 guideLocationsEntries:(id)a5;
- (void)submitWithHandler:(id)a3 networkActivity:(id)a4;
@end

@implementation _GEOGuideLocationsLookupTicket

- (_GEOGuideLocationsLookupTicket)initWithRequest:(id)a3 traits:(id)a4 guideLocationsEntries:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)_GEOGuideLocationsLookupTicket;
  v10 = [(GEOAbstractRequestResponseTicket *)&v13 initWithRequest:a3 traits:a4];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_guideLocationEntries, a5);
  }

  return v11;
}

- (void)submitWithHandler:(id)a3 networkActivity:(id)a4
{
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __68___GEOGuideLocationsLookupTicket_submitWithHandler_networkActivity___block_invoke;
    v8[3] = &unk_1E53DEA28;
    v8[4] = self;
    id v9 = v6;
    [(GEOAbstractRequestResponseTicket *)self performSubmitWithHandler:v8 auditToken:0 timeout:a4 networkActivity:0.0];
  }
}

- (void).cxx_destruct
{
}

@end