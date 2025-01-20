@interface MapKitFacade
+ (id)setCustomFeatureAnnotationsForSnapshotOptions:(id)a3 coordinate:(CLLocationCoordinate2D)a4 title:(id)a5;
@end

@implementation MapKitFacade

+ (id)setCustomFeatureAnnotationsForSnapshotOptions:(id)a3 coordinate:(CLLocationCoordinate2D)a4 title:(id)a5
{
  double longitude = a4.longitude;
  double latitude = a4.latitude;
  v14[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = (objc_class *)MEMORY[0x1E4F30F38];
  id v10 = a5;
  v11 = objc_msgSend([v9 alloc], "initWithCoordinate:title:representation:", v10, 2, latitude, longitude);

  v14[0] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [v8 _setCustomFeatureAnnotations:v12];

  [v8 _setSearchResultsType:1];
  return v8;
}

@end