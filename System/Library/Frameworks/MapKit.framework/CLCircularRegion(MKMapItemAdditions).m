@interface CLCircularRegion(MKMapItemAdditions)
+ (id)circularRegionFromMapRegion:()MKMapItemAdditions;
@end

@implementation CLCircularRegion(MKMapItemAdditions)

+ (id)circularRegionFromMapRegion:()MKMapItemAdditions
{
  GEOMapRectForMapRegion();
  MKCoordinateRegion v9 = MKCoordinateRegionForMapRect(v8);
  double latitude = v9.center.latitude;
  v1 = 0;
  if (v9.center.longitude >= -180.0)
  {
    double longitude = v9.center.longitude;
    if (v9.center.longitude <= 180.0 && v9.center.latitude >= -90.0 && v9.center.latitude <= 90.0)
    {
      v1 = 0;
      if (v9.span.latitudeDelta >= 0.0
        && v9.span.latitudeDelta <= 180.0
        && v9.span.longitudeDelta >= 0.0
        && v9.span.longitudeDelta <= 360.0)
      {
        GEOCalculateDistance();
        double v4 = v3;
        v5 = [NSString stringWithFormat:@"<%+.8f,%+.8f> radius %.2f", *(void *)&latitude, *(void *)&longitude, *(void *)&v3];
        v1 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1E5A8]), "initWithCenter:radius:identifier:", v5, latitude, longitude, v4);
      }
    }
  }

  return v1;
}

@end