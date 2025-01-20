@interface MKReverseGeocoder
- (BOOL)isQuerying;
- (CLLocationCoordinate2D)coordinate;
- (MKPlacemark)placemark;
- (MKReverseGeocoder)initWithCoordinate:(CLLocationCoordinate2D)coordinate;
- (id)delegate;
- (void)_notifyError:(id)a3;
- (void)_notifyNoResults;
- (void)_notifyResult:(id)a3;
- (void)cancel;
- (void)setCoordinate:(CLLocationCoordinate2D)a3;
- (void)setDelegate:(id)delegate;
- (void)start;
@end

@implementation MKReverseGeocoder

- (MKReverseGeocoder)initWithCoordinate:(CLLocationCoordinate2D)coordinate
{
  CLLocationDegrees longitude = coordinate.longitude;
  CLLocationDegrees latitude = coordinate.latitude;
  v10.receiver = self;
  v10.super_class = (Class)MKReverseGeocoder;
  v5 = [(MKReverseGeocoder *)&v10 init];
  if (v5)
  {
    v6 = objc_alloc_init(MKReverseGeocoderInternal);
    internal = v5->_internal;
    v5->_internal = v6;

    v8 = v5->_internal;
    v8->coordinate.CLLocationDegrees latitude = latitude;
    v8->coordinate.CLLocationDegrees longitude = longitude;
  }
  return v5;
}

- (id)delegate
{
  return self->_internal->delegate;
}

- (void)setDelegate:(id)delegate
{
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  self->_internal->coordinate = a3;
}

- (CLLocationCoordinate2D)coordinate
{
  internal = self->_internal;
  double latitude = internal->coordinate.latitude;
  double longitude = internal->coordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (MKPlacemark)placemark
{
  return [(MKMapItem *)self->_internal->mapItem placemark];
}

- (BOOL)isQuerying
{
  return self->_internal->querying;
}

- (void)_notifyError:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [(MKReverseGeocoderDelegate *)self->_internal->delegate reverseGeocoder:self didFailWithError:v4];
  }
}

- (void)_notifyNoResults
{
  id v3 = objc_alloc(MEMORY[0x1E4F28C58]);
  id v4 = (id)[v3 initWithDomain:MKErrorDomain code:4 userInfo:0];
  [(MKReverseGeocoder *)self _notifyError:v4];
}

- (void)_notifyResult:(id)a3
{
  id v6 = a3;
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_internal->delegate;
    v5 = [v6 placemark];
    [(MKReverseGeocoderDelegate *)delegate reverseGeocoder:self didFindPlacemark:v5];
  }
}

- (void)start
{
  if (![(MKReverseGeocoder *)self isQuerying])
  {
    id v3 = +[MKMapService sharedService];
    uint64_t v4 = objc_msgSend(v3, "ticketForReverseGeocodeCoordinate:traits:", 0, self->_internal->coordinate.latitude, self->_internal->coordinate.longitude);
    internal = self->_internal;
    ticket = internal->ticket;
    internal->ticket = (MKMapServiceTicket *)v4;

    v7 = self->_internal->ticket;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __26__MKReverseGeocoder_start__block_invoke;
    v8[3] = &unk_1E54B8FA8;
    v8[4] = self;
    [(MKMapServiceTicket *)v7 submitWithHandler:v8 networkActivity:0];
    self->_internal->querying = 1;
  }
}

void __26__MKReverseGeocoder_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = 0;
  if (v5
    || ![v12 count]
    && ([MEMORY[0x1E4F28C58] errorWithDomain:MKErrorDomain code:4 userInfo:0],
        (id v5 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    if ([v5 code] != -2
      || ([v5 domain],
          id v6 = objc_claimAutoreleasedReturnValue(),
          GEOErrorDomain(),
          v7 = objc_claimAutoreleasedReturnValue(),
          char v8 = [v6 isEqualToString:v7],
          v7,
          v6,
          (v8 & 1) == 0))
    {
      [*(id *)(a1 + 32) _notifyError:v5];
    }
  }
  else
  {
    uint64_t v9 = [v12 firstObject];
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    v11 = *(void **)(v10 + 32);
    *(void *)(v10 + 32) = v9;

    [*(id *)(a1 + 32) _notifyResult:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 32)];
    id v5 = 0;
  }
}

- (void)cancel
{
}

- (void).cxx_destruct
{
}

@end