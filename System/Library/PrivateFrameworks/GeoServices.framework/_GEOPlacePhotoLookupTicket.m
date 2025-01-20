@interface _GEOPlacePhotoLookupTicket
- (_GEOPlacePhotoLookupTicket)initWithVendorIdentifier:(id)a3 mapItemIdentifier:(id)a4 range:(_NSRange)a5 traits:(id)a6;
- (void)cancel;
- (void)submitWithHandler:(id)a3 networkActivity:(id)a4;
@end

@implementation _GEOPlacePhotoLookupTicket

- (_GEOPlacePhotoLookupTicket)initWithVendorIdentifier:(id)a3 mapItemIdentifier:(id)a4 range:(_NSRange)a5 traits:(id)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v15 = +[GEOPDPlaceRequest photoLookupRequestWithVendorIdentifier:mapItemIdentifier:range:traits:](GEOPDPlaceRequest, "photoLookupRequestWithVendorIdentifier:mapItemIdentifier:range:traits:", v12, v13, location, length, v14);
  v19.receiver = self;
  v19.super_class = (Class)_GEOPlacePhotoLookupTicket;
  v16 = [(GEOAbstractRequestResponseTicket *)&v19 initWithRequest:v15 traits:v14];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->super._request, v15);
    objc_storeStrong((id *)&v17->_vendorIdentifier, a3);
    objc_storeStrong((id *)&v17->_mapItemIdentifier, a4);
    v17->_range.NSUInteger location = location;
    v17->_range.NSUInteger length = length;
    objc_storeStrong((id *)&v17->_traits, a6);
  }

  return v17;
}

- (void)submitWithHandler:(id)a3 networkActivity:(id)a4
{
  id v6 = a3;
  _NSRange range = self->_range;
  v7 = self->_mapItemIdentifier;
  id v8 = a4;
  v9 = +[GEOPlaceCardRequester sharedRequester];
  request = self->super._request;
  traits = self->_traits;
  double UInteger = (double)(unint64_t)GEOConfigGetUInteger(GeoServicesConfig_PhotoLookupBatchRequestTimeout, (uint64_t)off_1E9114D88);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __64___GEOPlacePhotoLookupTicket_submitWithHandler_networkActivity___block_invoke;
  v17[3] = &unk_1E53DEAB8;
  v18 = v7;
  id v19 = v6;
  id v13 = v7;
  id v14 = v6;
  v15 = [v9 performPlaceDataRequest:request traits:traits cachePolicy:4 timeout:0 auditToken:0 throttleToken:v8 networkActivity:UInteger requesterHandler:v17];

  id requestToken = self->super._requestToken;
  self->super._id requestToken = v15;
}

- (void)cancel
{
  if (self->super._request)
  {
    v3 = +[GEOPlaceCardRequester sharedRequester];
    [v3 cancelRequest:self->super._requestToken];

    request = self->super._request;
    self->super._request = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_mapItemIdentifier, 0);

  objc_storeStrong((id *)&self->_vendorIdentifier, 0);
}

@end