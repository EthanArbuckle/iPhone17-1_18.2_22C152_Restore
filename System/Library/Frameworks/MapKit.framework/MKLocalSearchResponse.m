@interface MKLocalSearchResponse
- (MKCoordinateRegion)boundingRegion;
- (NSArray)mapItems;
- (id)_dictionaryRepresentation;
- (id)_initWithMapItems:(id)a3 boundingRegion:(id)a4;
- (id)description;
@end

@implementation MKLocalSearchResponse

- (id)_initWithMapItems:(id)a3 boundingRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MKLocalSearchResponse;
  v8 = [(MKLocalSearchResponse *)&v13 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    v10 = (void *)*((void *)v8 + 1);
    *((void *)v8 + 1) = v9;

    if (v7)
    {
      GEOMapRectForMapRegion();
      *(MKCoordinateRegion *)(v8 + 16) = MKCoordinateRegionForMapRect(v14);
    }
    v11 = v8;
  }

  return v8;
}

- (id)_dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:self->_mapItems forKey:@"mapItems"];
  CLLocationDegrees latitude = self->_boundingRegion.center.latitude;
  CLLocationDegrees longitude = self->_boundingRegion.center.longitude;
  double latitudeDelta = self->_boundingRegion.span.latitudeDelta;
  double longitudeDelta = self->_boundingRegion.span.longitudeDelta;
  v8 = NSString;
  uint64_t v9 = [NSString stringWithFormat:@"%+.8f, %+.8f", *(void *)&latitude, *(void *)&longitude];
  v10 = [v8 stringWithFormat:@"<center:%@ span:%+.8f, %+.8f>", v9, *(void *)&latitudeDelta, *(void *)&longitudeDelta];

  [v3 setObject:v10 forKey:@"boundingRegion"];

  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MKLocalSearchResponse;
  v4 = [(MKLocalSearchResponse *)&v8 description];
  v5 = [(MKLocalSearchResponse *)self _dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (NSArray)mapItems
{
  return self->_mapItems;
}

- (MKCoordinateRegion)boundingRegion
{
  double latitude = self->_boundingRegion.center.latitude;
  double longitude = self->_boundingRegion.center.longitude;
  double latitudeDelta = self->_boundingRegion.span.latitudeDelta;
  double longitudeDelta = self->_boundingRegion.span.longitudeDelta;
  result.span.double longitudeDelta = longitudeDelta;
  result.span.double latitudeDelta = latitudeDelta;
  result.center.double longitude = longitude;
  result.center.double latitude = latitude;
  return result;
}

- (void).cxx_destruct
{
}

@end