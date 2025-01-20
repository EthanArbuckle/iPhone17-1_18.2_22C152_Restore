@interface CPLPlaceAnnotation
+ (CPLPlaceAnnotation)placeAnnotationWithCPLPlaceAnnotationDictionary:(id)a3;
- (id)cplPlaceAnnotationDictionary;
@end

@implementation CPLPlaceAnnotation

+ (CPLPlaceAnnotation)placeAnnotationWithCPLPlaceAnnotationDictionary:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    uint64_t v4 = objc_msgSend(v3, "cpl_validObjectForKey:class:", @"level", objc_opt_class());
    uint64_t v5 = objc_msgSend(v3, "cpl_validObjectForKey:class:", @"name", objc_opt_class());

    if (v4 | v5)
    {
      id v6 = objc_alloc_init((Class)CPLPlaceAnnotation);
      [v6 setPlaceLevel:v4];
      [v6 setPlaceName:v5];
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  return (CPLPlaceAnnotation *)v6;
}

- (id)cplPlaceAnnotationDictionary
{
  id v3 = +[NSMutableDictionary dictionary];
  uint64_t v4 = [(CPLPlaceAnnotation *)self placeLevel];

  if (v4)
  {
    uint64_t v5 = [(CPLPlaceAnnotation *)self placeLevel];
    [v3 setObject:v5 forKey:@"level"];
  }
  id v6 = [(CPLPlaceAnnotation *)self placeName];

  if (v6)
  {
    v7 = [(CPLPlaceAnnotation *)self placeName];
    [v3 setObject:v7 forKey:@"name"];
  }
  return v3;
}

@end