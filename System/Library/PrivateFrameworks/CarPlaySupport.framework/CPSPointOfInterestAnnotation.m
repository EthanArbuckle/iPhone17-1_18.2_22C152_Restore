@interface CPSPointOfInterestAnnotation
- (CLLocationCoordinate2D)coordinate;
- (CPPointOfInterest)pointOfInterest;
- (CPSPointOfInterestAnnotation)initWithPointOfInterest:(id)a3;
- (NSString)description;
- (NSString)subtitle;
- (NSString)title;
@end

@implementation CPSPointOfInterestAnnotation

- (CPSPointOfInterestAnnotation)initWithPointOfInterest:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)CPSPointOfInterestAnnotation;
  v8 = [(CPSPointOfInterestAnnotation *)&v6 init];
  objc_storeStrong((id *)&v8, v8);
  if (v8) {
    objc_storeStrong((id *)&v8->_pointOfInterest, location[0]);
  }
  v5 = v8;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v8, 0);
  return v5;
}

- (CLLocationCoordinate2D)coordinate
{
  v8 = [(CPSPointOfInterestAnnotation *)self pointOfInterest];
  v7 = [(CPPointOfInterest *)v8 location];
  objc_super v6 = [(MKMapItem *)v7 placemark];
  [(MKPlacemark *)v6 coordinate];
  double v9 = v2;
  double v10 = v3;

  double v4 = v9;
  double v5 = v10;
  result.longitude = v5;
  result.latitude = v4;
  return result;
}

- (NSString)title
{
  double v3 = [(CPSPointOfInterestAnnotation *)self pointOfInterest];
  double v4 = [(CPPointOfInterest *)v3 title];

  return v4;
}

- (NSString)subtitle
{
  return 0;
}

- (NSString)description
{
  v16 = self;
  SEL v15 = a2;
  unint64_t v7 = 0x263F08000uLL;
  id v9 = (id)NSString;
  double v2 = (objc_class *)objc_opt_class();
  id v11 = NSStringFromClass(v2);
  v8 = v16;
  [(CPSPointOfInterestAnnotation *)v16 coordinate];
  uint64_t v13 = v3;
  uint64_t v14 = v4;
  uint64_t v17 = v3;
  uint64_t v18 = v4;
  id v10 = (id)[NSString stringWithFormat:@"%+.8f, %+.8f", v3, v4];
  id v12 = (id)[v9 stringWithFormat:@"<%@: %p %@>", v11, v8, v10];

  double v5 = v12;

  return (NSString *)v5;
}

- (CPPointOfInterest)pointOfInterest
{
  return self->_pointOfInterest;
}

- (void).cxx_destruct
{
}

@end