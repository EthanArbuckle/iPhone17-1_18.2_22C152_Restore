@interface CLGeocoderInternal
- (CLGeocoderInternal)init;
- (CLSilo)responseSilo;
- (void)dealloc;
- (void)setResponseSilo:(id)a3;
@end

@implementation CLGeocoderInternal

- (CLSilo)responseSilo
{
  return (CLSilo *)objc_getProperty(self, a2, 32, 1);
}

- (CLGeocoderInternal)init
{
  v4.receiver = self;
  v4.super_class = (Class)CLGeocoderInternal;
  v2 = [(CLGeocoderInternal *)&v4 init];
  if (v2)
  {
    v2->_responseSilo = (CLSilo *)(id)[MEMORY[0x1E4F73058] main];
    v2->_queue = (OS_dispatch_queue *)dispatch_queue_create("CLGeocoder", 0);
  }
  return v2;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_queue);
  self->_responseSilo = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLGeocoderInternal;
  [(CLGeocoderInternal *)&v3 dealloc];
}

- (void)setResponseSilo:(id)a3
{
}

@end