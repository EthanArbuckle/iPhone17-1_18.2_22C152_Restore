@interface _GEOComponentsTicket
- ($C4D369C9F02205611300857CFD58F739)dataRequestKind;
- (_GEOComponentsTicket)initWithComponents:(id)a3 identifier:(id)a4 resultProviderID:(int)a5 contentProvider:(id)a6 traits:(id)a7;
- (_GEOComponentsTicket)initWithTraits:(id)a3;
- (id)description;
- (void)cancel;
- (void)submitWithHandler:(id)a3 auditToken:(id)a4 timeout:(int64_t)a5 networkActivity:(id)a6;
@end

@implementation _GEOComponentsTicket

- (_GEOComponentsTicket)initWithTraits:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_GEOComponentsTicket;
  return [(GEOAbstractTicket *)&v4 initWithTraits:a3];
}

- (_GEOComponentsTicket)initWithComponents:(id)a3 identifier:(id)a4 resultProviderID:(int)a5 contentProvider:(id)a6 traits:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)_GEOComponentsTicket;
  v15 = [(GEOAbstractTicket *)&v22 initWithTraits:a7];
  if (v15)
  {
    uint64_t v16 = [v12 copy];
    components = v15->_components;
    v15->_components = (NSDictionary *)v16;

    objc_storeStrong((id *)&v15->_identifier, a4);
    v15->_resultProviderID = a5;
    uint64_t v18 = [v14 copy];
    contentProvider = v15->_contentProvider;
    v15->_contentProvider = (NSString *)v18;

    v20 = v15;
  }

  return v15;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)_GEOComponentsTicket;
  objc_super v4 = [(GEOAbstractTicket *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ identifier: %@ result provider id: %d components: %@ ", v4, self->_identifier, self->_resultProviderID, self->_components];

  return v5;
}

- (void)submitWithHandler:(id)a3 auditToken:(id)a4 timeout:(int64_t)a5 networkActivity:(id)a6
{
  id v8 = a3;
  if (v8)
  {
    id v9 = a4;
    v10 = [[GEOPDPlaceRequest alloc] initWithComponents:self->_components identifier:self->_identifier resultProviderID:self->_resultProviderID traits:self->super.super._traits];
    v11 = +[GEOPlaceCardRequester sharedRequester];
    traits = self->super.super._traits;
    throttlerToken = self->super.super._throttlerToken;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __77___GEOComponentsTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke;
    v16[3] = &unk_1E53DEA28;
    v16[4] = self;
    id v17 = v8;
    id v14 = [v11 performPlaceDataRequest:v10 traits:traits cachePolicy:4 timeout:v9 auditToken:throttlerToken throttleToken:0 networkActivity:0.0 requesterHandler:v16];

    id requestToken = self->_requestToken;
    self->_id requestToken = v14;
  }
}

- ($C4D369C9F02205611300857CFD58F739)dataRequestKind
{
  int v2 = [(GEOMapServiceTraits *)self->super.super._traits requestPriority];
  $C4D369C9F02205611300857CFD58F739 v3 = ($C4D369C9F02205611300857CFD58F739)0x1700000500;
  if (v2 != 1) {
    $C4D369C9F02205611300857CFD58F739 v3 = ($C4D369C9F02205611300857CFD58F739)0x1700000300;
  }
  if (v2 == 2) {
    return ($C4D369C9F02205611300857CFD58F739)0x1700000700;
  }
  else {
    return v3;
  }
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)_GEOComponentsTicket;
  [(GEOAbstractTicket *)&v4 cancel];
  $C4D369C9F02205611300857CFD58F739 v3 = +[GEOPlaceCardRequester sharedRequester];
  [v3 cancelRequest:self->_requestToken];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_requestToken, 0);
  objc_storeStrong((id *)&self->_contentProvider, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_components, 0);
}

@end