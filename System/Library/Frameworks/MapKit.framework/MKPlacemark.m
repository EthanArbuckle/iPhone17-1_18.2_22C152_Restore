@interface MKPlacemark
- (CLLocationCoordinate2D)coordinate;
- (MKPlacemark)initWithCoordinate:(CLLocationCoordinate2D)coordinate;
- (MKPlacemark)initWithCoordinate:(CLLocationCoordinate2D)coordinate addressDictionary:(NSDictionary *)addressDictionary;
- (MKPlacemark)initWithCoordinate:(CLLocationCoordinate2D)coordinate postalAddress:(CNPostalAddress *)postalAddress;
- (NSString)subtitle;
- (NSString)title;
- (id)thoroughfare;
@end

@implementation MKPlacemark

- (MKPlacemark)initWithCoordinate:(CLLocationCoordinate2D)coordinate
{
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:coordinate.latitude longitude:coordinate.longitude];
  v5 = [(MKPlacemark *)self initWithLocation:v4 addressDictionary:0 region:0 areasOfInterest:0];

  return v5;
}

- (MKPlacemark)initWithCoordinate:(CLLocationCoordinate2D)coordinate addressDictionary:(NSDictionary *)addressDictionary
{
  double longitude = coordinate.longitude;
  double latitude = coordinate.latitude;
  v7 = MKAddressDictionaryFromContactsDictionary(addressDictionary);
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:latitude longitude:longitude];
  v9 = [(MKPlacemark *)self initWithLocation:v8 addressDictionary:v7 region:0 areasOfInterest:0];

  return v9;
}

- (MKPlacemark)initWithCoordinate:(CLLocationCoordinate2D)coordinate postalAddress:(CNPostalAddress *)postalAddress
{
  double longitude = coordinate.longitude;
  double latitude = coordinate.latitude;
  v7 = MKAddressDictionaryFromPostalAddress(postalAddress);
  v8 = -[MKPlacemark initWithCoordinate:addressDictionary:](self, "initWithCoordinate:addressDictionary:", v7, latitude, longitude);

  return v8;
}

- (NSString)title
{
  v3 = [(MKPlacemark *)self formattedAddressLines];
  if ([v3 count])
  {
    v4 = objc_msgSend(v3, "_mapkit_joinedAddressComponents");
  }
  else
  {
    v5 = [(MKPlacemark *)self mkPostalAddressDictionary];
    v4 = MKAddressStringForAddressDictionary(v5, 1u);
  }

  return (NSString *)v4;
}

- (NSString)subtitle
{
  return 0;
}

- (CLLocationCoordinate2D)coordinate
{
  v3 = [(MKPlacemark *)self location];
  if (v3)
  {
    v4 = [(MKPlacemark *)self location];
    [v4 coordinate];
    unint64_t v6 = v5;
    unint64_t v8 = v7;
  }
  else
  {
    unint64_t v8 = 0xC066800000000000;
    unint64_t v6 = 0xC066800000000000;
  }

  double v9 = *(double *)&v6;
  double v10 = *(double *)&v8;
  result.double longitude = v10;
  result.double latitude = v9;
  return result;
}

- (id)thoroughfare
{
  v8.receiver = self;
  v8.super_class = (Class)MKPlacemark;
  v3 = [(MKPlacemark *)&v8 thoroughfare];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(MKPlacemark *)self fullThoroughfare];
  }
  unint64_t v6 = v5;

  return v6;
}

@end