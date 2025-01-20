@interface _GEOMapServiceGeoIpLookupTicket
- ($C4D369C9F02205611300857CFD58F739)dataRequestKind;
- (_GEOMapServiceGeoIpLookupTicket)initWithIpAddress:(id)a3;
- (void)cancel;
- (void)submitWithHandler:(id)a3 auditToken:(id)a4 networkActivity:(id)a5 handlerQueue:(id)a6;
@end

@implementation _GEOMapServiceGeoIpLookupTicket

- (_GEOMapServiceGeoIpLookupTicket)initWithIpAddress:(id)a3
{
  id v4 = a3;
  v5 = +[GEOMapService sharedService];
  v6 = [v5 defaultTraits];

  v11.receiver = self;
  v11.super_class = (Class)_GEOMapServiceGeoIpLookupTicket;
  v7 = [(GEOAbstractTicket *)&v11 initWithTraits:v6];
  if (v7)
  {
    v8 = [[GEOPDPlaceRequest alloc] initForGeoIpLookupWithIpAddress:v4 traits:v6];
    placeRequest = v7->_placeRequest;
    v7->_placeRequest = v8;
  }
  return v7;
}

- (void)submitWithHandler:(id)a3 auditToken:(id)a4 networkActivity:(id)a5 handlerQueue:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  v14 = +[GEOPlaceCardRequester sharedRequester];
  placeRequest = self->_placeRequest;
  traits = self->super._traits;
  throttlerToken = self->super._throttlerToken;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __93___GEOMapServiceGeoIpLookupTicket_submitWithHandler_auditToken_networkActivity_handlerQueue___block_invoke;
  v22[3] = &unk_1E53DEBC8;
  v22[4] = self;
  id v23 = v11;
  id v24 = v10;
  id v18 = v10;
  id v19 = v11;
  v20 = [v14 performPlaceDataRequest:placeRequest traits:traits cachePolicy:1 timeout:v13 auditToken:throttlerToken throttleToken:v12 networkActivity:0.0 requesterHandler:v22];

  id requestToken = self->_requestToken;
  self->_id requestToken = v20;
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)_GEOMapServiceGeoIpLookupTicket;
  [(GEOAbstractTicket *)&v4 cancel];
  v3 = +[GEOPlaceCardRequester sharedRequester];
  [v3 cancelRequest:self->_requestToken];
}

- ($C4D369C9F02205611300857CFD58F739)dataRequestKind
{
  int v3 = [(GEOMapServiceTraits *)self->super._traits requestPriority];
  uint64_t v4 = 768;
  if (v3 == 1) {
    uint64_t v4 = 1280;
  }
  if (v3 == 2) {
    uint64_t v5 = 1792;
  }
  else {
    uint64_t v5 = v4;
  }
  return ($C4D369C9F02205611300857CFD58F739)(v5 | ([(GEOPDPlaceRequest *)self->_placeRequest requestType] << 32));
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_requestToken, 0);

  objc_storeStrong((id *)&self->_placeRequest, 0);
}

@end