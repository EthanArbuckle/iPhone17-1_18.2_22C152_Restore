@interface MAResultAnnotation
- (CLLocationCoordinate2D)coordinate;
- (MAResultAnnotation)initWithMapItem:(id)a3;
- (NSString)subtitle;
- (NSString)title;
- (SALocalSearchMapItem)mapItem;
- (id)_abbreviatedAddress;
- (void)setMapItem:(id)a3;
@end

@implementation MAResultAnnotation

- (MAResultAnnotation)initWithMapItem:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MAResultAnnotation;
  v6 = [(MAResultAnnotation *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mapItem, a3);
    v8 = [v5 location];
    v9 = [v8 latitude];
    [v9 doubleValue];
    CLLocationDegrees v11 = v10;
    v12 = [v5 location];
    v13 = [v12 longitude];
    [v13 doubleValue];
    CLLocationCoordinate2D v15 = CLLocationCoordinate2DMake(v11, v14);

    v7->_coordinate = v15;
  }

  return v7;
}

- (NSString)title
{
  v2 = [(MAResultAnnotation *)self mapItem];
  v3 = [v2 label];

  return (NSString *)v3;
}

- (NSString)subtitle
{
  return (NSString *)[(MAResultAnnotation *)self _abbreviatedAddress];
}

- (id)_abbreviatedAddress
{
  v2 = [(MAResultAnnotation *)self mapItem];
  v3 = [v2 location];
  v4 = [v3 properties];

  uint64_t v5 = [v4 valueForKey:@"street"];
  uint64_t v6 = [v4 valueForKey:@"city"];
  v7 = (void *)v6;
  if (v5 | v6)
  {
    if (!v5 || v6)
    {
      if (v5 || !v6)
      {
        v8 = +[NSString stringWithFormat:@"%@, %@", v5, v6];
      }
      else
      {
        v8 = (__CFString *)(id)v6;
      }
    }
    else
    {
      v8 = (__CFString *)(id)v5;
    }
    v9 = v8;
  }
  else
  {
    v9 = &stru_43A50;
  }

  return v9;
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (SALocalSearchMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end