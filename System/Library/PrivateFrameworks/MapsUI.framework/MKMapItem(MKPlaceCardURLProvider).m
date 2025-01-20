@interface MKMapItem(MKPlaceCardURLProvider)
- (id)sharingURL;
- (id)thumbnailWithSize:()MKPlaceCardURLProvider annotationView:;
@end

@implementation MKMapItem(MKPlaceCardURLProvider)

- (id)sharingURL
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F31098]);
  v6[0] = a1;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  v4 = [v2 urlForOpeningMapItems:v3 options:0];

  return v4;
}

- (id)thumbnailWithSize:()MKPlaceCardURLProvider annotationView:
{
  id v8 = a5;
  v9 = [a1 placemark];

  if (v9)
  {
    v10 = [a1 placemark];
    [v10 coordinate];
    double latitude = v11;
    double longitude = v13;
  }
  else
  {
    [a1 _coordinate];
    CLLocationDegrees v16 = v15;
    [a1 _coordinate];
    CLLocationCoordinate2D v18 = CLLocationCoordinate2DMake(v16, v17);
    double latitude = v18.latitude;
    double longitude = v18.longitude;
  }
  id v19 = objc_alloc_init(MEMORY[0x1E4F30F40]);
  objc_msgSend(v19, "setSize:", a2, a3);
  [v19 size];
  MKCoordinateRegionMakeWithZoomLevel();
  objc_msgSend(v19, "setRegion:");
  [v19 _setShowsAppleLogo:0];
  v20 = [MEMORY[0x1E4F30F30] createSnapshotWithOptions:v19 timeoutInSeconds:5];
  v21 = v20;
  if (v20)
  {
    if (v8) {
      objc_msgSend(v20, "snapshotWithAnnotationView:atCoordinate:", v8, latitude, longitude);
    }
    else {
    v22 = [v20 image];
    }
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

@end