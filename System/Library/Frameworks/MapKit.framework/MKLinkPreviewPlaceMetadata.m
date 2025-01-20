@interface MKLinkPreviewPlaceMetadata
- (BOOL)isPointOfInterest;
- (CLLocationCoordinate2D)coordinate;
- (CNPostalAddress)addressComponents;
- (NSString)address;
- (NSString)category;
- (NSString)name;
- (void)setAddress:(id)a3;
- (void)setAddressComponents:(id)a3;
- (void)setCategory:(id)a3;
- (void)setCoordinate:(CLLocationCoordinate2D)a3;
- (void)setIsPointOfInterest:(BOOL)a3;
- (void)setName:(id)a3;
@end

@implementation MKLinkPreviewPlaceMetadata

- (BOOL)isPointOfInterest
{
  return self->_isPointOfInterest;
}

- (void)setIsPointOfInterest:(BOOL)a3
{
  self->_isPointOfInterest = a3;
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  self->_coordinate = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
}

- (CNPostalAddress)addressComponents
{
  return self->_addressComponents;
}

- (void)setAddressComponents:(id)a3
{
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_addressComponents, 0);
  objc_storeStrong((id *)&self->_address, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end