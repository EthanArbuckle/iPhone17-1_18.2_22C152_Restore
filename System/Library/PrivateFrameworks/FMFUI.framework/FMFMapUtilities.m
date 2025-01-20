@interface FMFMapUtilities
+ ($5934897077F541E2EA57917B1DCA15E9)regionForAnnotations:(SEL)a3;
+ ($7A2C3A43EE5A76686BB0A44688CCB5FC)mapRectForCoordinateRegion:(id *)a3;
+ (BOOL)doNotAnimateToNewLocation:(CLLocationCoordinate2D)a3 forMapView:(id)a4;
@end

@implementation FMFMapUtilities

+ ($5934897077F541E2EA57917B1DCA15E9)regionForAnnotations:(SEL)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    double v8 = -90.0;
    double v9 = 180.0;
    double v10 = 90.0;
    double v11 = -180.0;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        [v13 coordinate];
        double v9 = fmin(v9, v14);
        [v13 coordinate];
        double v8 = fmax(v8, v15);
        [v13 coordinate];
        double v11 = fmax(v11, v16);
        [v13 coordinate];
        double v10 = fmin(v10, v17);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }

  return result;
}

+ ($7A2C3A43EE5A76686BB0A44688CCB5FC)mapRectForCoordinateRegion:(id *)a3
{
  double v7 = v4;
  double v8 = v3;
  double v9 = v5 * 0.5;
  double v10 = v6 * 0.5;
  CLLocationCoordinate2D v17 = CLLocationCoordinate2DMake(v3 + v5 * 0.5, v4 - v6 * 0.5);
  MKMapPoint v11 = MKMapPointForCoordinate(v17);
  CLLocationCoordinate2D v18 = CLLocationCoordinate2DMake(v8 - v9, v7 + v10);
  MKMapPoint v12 = MKMapPointForCoordinate(v18);
  double v13 = vabdd_f64(v12.x, v11.x);
  double v14 = vabdd_f64(v12.y, v11.y);
  double x = v11.x;
  double y = v11.y;
  result.var1.var1 = v14;
  result.var1.var0 = v13;
  result.var0.var1 = y;
  result.var0.var0 = x;
  return result;
}

+ (BOOL)doNotAnimateToNewLocation:(CLLocationCoordinate2D)a3 forMapView:(id)a4
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  double v6 = (objc_class *)MEMORY[0x263F00A50];
  id v7 = a4;
  double v8 = (void *)[[v6 alloc] initWithLatitude:latitude longitude:longitude];
  id v9 = objc_alloc(MEMORY[0x263F00A50]);
  [v7 centerCoordinate];
  double v11 = v10;
  [v7 centerCoordinate];
  double v13 = v12;

  double v14 = (void *)[v9 initWithLatitude:v11 longitude:v13];
  [v14 distanceFromLocation:v8];
  LOBYTE(v9) = v15 > 637300.0;

  return (char)v9;
}

@end