@interface SGMockRTMapItem
- (NSData)geoMapItemHandle;
- (SGMockRTLocation)location;
- (void)setGeoMapItemHandle:(id)a3;
- (void)setLocation:(id)a3;
@end

@implementation SGMockRTMapItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoMapItemHandle, 0);

  objc_storeStrong((id *)&self->_location, 0);
}

- (void)setGeoMapItemHandle:(id)a3
{
}

- (NSData)geoMapItemHandle
{
  return self->_geoMapItemHandle;
}

- (void)setLocation:(id)a3
{
}

- (SGMockRTLocation)location
{
  return self->_location;
}

@end