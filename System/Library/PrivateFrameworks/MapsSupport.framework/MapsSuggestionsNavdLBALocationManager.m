@interface MapsSuggestionsNavdLBALocationManager
+ (id)sharedLocationManager;
- (BOOL)hasLocationAccess;
- (MapsSuggestionsNavdLBALocationManager)initWithName:(id)a3 queue:(id)a4;
@end

@implementation MapsSuggestionsNavdLBALocationManager

+ (id)sharedLocationManager
{
  if (qword_1000A2598 != -1) {
    dispatch_once(&qword_1000A2598, &stru_10008C280);
  }
  v2 = (void *)qword_1000A2590;

  return v2;
}

- (MapsSuggestionsNavdLBALocationManager)initWithName:(id)a3 queue:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MapsSuggestionsNavdLBALocationManager;
  return [(MapsSuggestionsNavdLocationManager *)&v5 initWithName:a3 locationBundlePath:@"/System/Library/LocationBundles/NavdLocationBundleiOS.bundle" limitingBundleID:MapsAppBundleId queue:a4];
}

- (BOOL)hasLocationAccess
{
  if (+[CLLocationManager authorizationStatusForBundlePath:@"/System/Library/LocationBundles/NavdLocationBundleiOS.bundle"]- 3 > 1)return 0; {
  v3 = [(MapsSuggestionsNavdLocationManager *)self locationManager];
  }
  BOOL v4 = [v3 accuracyAuthorization] == 0;

  return v4;
}

@end