@interface MKMapItemAnnotation
- (CLLocationCoordinate2D)coordinate;
- (MKMapItem)_representedMapItem;
- (MKMapItem)mapItem;
- (MKMapItemAnnotation)initWithMapItem:(id)a3;
- (NSString)title;
@end

@implementation MKMapItemAnnotation

- (MKMapItemAnnotation)initWithMapItem:(id)a3
{
  id v5 = a3;
  v6 = [v5 placemark];
  uint64_t v7 = [v6 location];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [v5 placemark];
    v10 = [v9 location];
    [v10 coordinate];
    double v12 = v11;
    double v14 = v13;

    v15 = 0;
    if (v14 >= -180.0 && v14 <= 180.0 && v12 >= -90.0 && v12 <= 90.0)
    {
      v19.receiver = self;
      v19.super_class = (Class)MKMapItemAnnotation;
      v16 = [(MKMapItemAnnotation *)&v19 init];
      v17 = v16;
      if (v16) {
        objc_storeStrong((id *)&v16->_mapItem, a3);
      }
      self = v17;
      v15 = self;
    }
  }
  else
  {

    v15 = 0;
  }

  return v15;
}

- (CLLocationCoordinate2D)coordinate
{
  v2 = [(MKMapItem *)self->_mapItem placemark];
  v3 = [v2 location];

  if (v3)
  {
    [v3 coordinate];
    double v5 = v4;
    double v7 = v6;
  }
  else
  {
    double v5 = *MEMORY[0x1E4F1E750];
    double v7 = *(double *)(MEMORY[0x1E4F1E750] + 8);
  }

  double v8 = v5;
  double v9 = v7;
  result.longitude = v9;
  result.latitude = v8;
  return result;
}

- (NSString)title
{
  return [(MKMapItem *)self->_mapItem name];
}

- (MKMapItem)_representedMapItem
{
  return self->_mapItem;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void).cxx_destruct
{
}

@end