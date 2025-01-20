@interface MUCoordinateViewModel
- (MUCoordinateViewModel)initWithMapItem:(id)a3 isUserLocation:(BOOL)a4;
- (NSString)titleString;
- (NSString)valueString;
@end

@implementation MUCoordinateViewModel

- (MUCoordinateViewModel)initWithMapItem:(id)a3 isUserLocation:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MUCoordinateViewModel;
  v8 = [(MUCoordinateViewModel *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_mapItem, a3);
    v9->_isUserLocation = a4;
  }

  return v9;
}

- (NSString)titleString
{
  return (NSString *)_MULocalizedStringFromThisBundle(@"Coordinates [Placecard]");
}

- (NSString)valueString
{
  v3 = objc_alloc_init(MUCoordinateStringFormatter);
  if (self->_isUserLocation)
  {
    v4 = [MEMORY[0x1E4F30EF8] sharedLocationManager];
    int v5 = [v4 isAuthorizedForPreciseLocation];

    uint64_t v6 = v5 ^ 1u;
  }
  else
  {
    uint64_t v6 = 0;
  }
  [(MUCoordinateStringFormatter *)v3 setCoarseLocation:v6];
  [(MKMapItem *)self->_mapItem _coordinate];
  id v7 = -[MUCoordinateStringFormatter stringFromCoordinate:](v3, "stringFromCoordinate:");

  return (NSString *)v7;
}

- (void).cxx_destruct
{
}

@end