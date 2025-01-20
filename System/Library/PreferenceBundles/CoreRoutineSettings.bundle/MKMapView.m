@interface MKMapView
- (int64_t)desiredStateForLoi:(id)a3 maximumWidth:(double)a4;
@end

@implementation MKMapView

- (int64_t)desiredStateForLoi:(id)a3 maximumWidth:(double)a4
{
  id v6 = a3;
  v7 = [v6 polygon];
  [v7 coordinate];
  CLLocationDegrees v9 = v8;
  CLLocationDegrees v11 = v10;
  v12 = [v6 polygon];
  [v12 radius];
  CLLocationDistance v14 = v13;
  v15 = [v6 polygon];

  [v15 radius];
  CLLocationDistance v17 = v16;
  v24.double latitude = v9;
  v24.double longitude = v11;
  MKCoordinateRegion v25 = MKCoordinateRegionMakeWithDistance(v24, v14, v17);
  double latitude = v25.center.latitude;
  double longitude = v25.center.longitude;
  double latitudeDelta = v25.span.latitudeDelta;
  double longitudeDelta = v25.span.longitudeDelta;

  -[MKMapView convertRegion:toRectToView:](self, "convertRegion:toRectToView:", self, latitude, longitude, latitudeDelta, longitudeDelta);
  if (v22 <= a4) {
    return 1;
  }
  else {
    return 2;
  }
}

@end