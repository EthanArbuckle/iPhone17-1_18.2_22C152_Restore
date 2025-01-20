@interface GEODirectionsServiceRequest
- (void)cancel;
@end

@implementation GEODirectionsServiceRequest

- (void)cancel
{
  if (!self->_isCancelled)
  {
    [(GEODirectionsRequester *)self->_directionsRequester cancelRequest:self->_directionsRequest];
    self->_isCancelled = 1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directionsRequester, 0);

  objc_storeStrong((id *)&self->_directionsRequest, 0);
}

@end