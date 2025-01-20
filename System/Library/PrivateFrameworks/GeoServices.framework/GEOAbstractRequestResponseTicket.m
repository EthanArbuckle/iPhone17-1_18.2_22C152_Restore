@interface GEOAbstractRequestResponseTicket
- ($C4D369C9F02205611300857CFD58F739)dataRequestKind;
- (GEOAbstractRequestResponseTicket)initWithRequest:(id)a3 traits:(id)a4;
- (GEOAbstractRequestResponseTicket)initWithTraits:(id)a3;
- (void)cancel;
- (void)performSubmitWithHandler:(id)a3 auditToken:(id)a4 timeout:(double)a5 networkActivity:(id)a6;
- (void)performSubmitWithHandler:(id)a3 timeout:(double)a4 networkActivity:(id)a5;
@end

@implementation GEOAbstractRequestResponseTicket

void __96__GEOAbstractRequestResponseTicket_performSubmitWithHandler_auditToken_timeout_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    if (!v6) {
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), a2);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (GEOAbstractRequestResponseTicket)initWithRequest:(id)a3 traits:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GEOAbstractRequestResponseTicket;
  v8 = [(GEOAbstractTicket *)&v11 initWithTraits:a4];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_request, a3);
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong(&self->_requestToken, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

- (void)performSubmitWithHandler:(id)a3 auditToken:(id)a4 timeout:(double)a5 networkActivity:(id)a6
{
  id v10 = a3;
  if (v10)
  {
    id v11 = a6;
    id v12 = a4;
    v13 = +[GEOPlaceCardRequester sharedRequester];
    request = self->_request;
    traits = self->super._traits;
    unint64_t cachePolicy = self->super._cachePolicy;
    throttlerToken = self->super._throttlerToken;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __96__GEOAbstractRequestResponseTicket_performSubmitWithHandler_auditToken_timeout_networkActivity___block_invoke;
    v20[3] = &unk_1E53DEA28;
    v20[4] = self;
    id v21 = v10;
    v18 = [v13 performPlaceDataRequest:request traits:traits cachePolicy:cachePolicy timeout:v12 auditToken:throttlerToken throttleToken:v11 networkActivity:a5 requesterHandler:v20];

    id requestToken = self->_requestToken;
    self->_id requestToken = v18;
  }
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)GEOAbstractRequestResponseTicket;
  [(GEOAbstractTicket *)&v4 cancel];
  v3 = +[GEOPlaceCardRequester sharedRequester];
  [v3 cancelRequest:self->_requestToken];
}

- (GEOAbstractRequestResponseTicket)initWithTraits:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GEOAbstractRequestResponseTicket;
  return [(GEOAbstractTicket *)&v4 initWithTraits:a3];
}

- (void)performSubmitWithHandler:(id)a3 timeout:(double)a4 networkActivity:(id)a5
{
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
  return ($C4D369C9F02205611300857CFD58F739)(v5 | ([(GEOPDPlaceRequest *)self->_request requestType] << 32));
}

@end