@interface MapsSuggestionsNavdMapsAppLocationManager
+ (id)sharedLocationManager;
- (BOOL)hasLocationAccess;
- (MapsSuggestionsNavdMapsAppLocationManager)initWithName:(id)a3 queue:(id)a4;
@end

@implementation MapsSuggestionsNavdMapsAppLocationManager

+ (id)sharedLocationManager
{
  if (qword_1000A24B8 != -1) {
    dispatch_once(&qword_1000A24B8, &stru_100089398);
  }
  v2 = (void *)qword_1000A24B0;

  return v2;
}

- (MapsSuggestionsNavdMapsAppLocationManager)initWithName:(id)a3 queue:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MapsSuggestionsNavdMapsAppLocationManager;
  return [(MapsSuggestionsNavdLocationManager *)&v5 initWithName:a3 locationBundleID:MapsAppBundleId queue:a4];
}

- (BOOL)hasLocationAccess
{
  if (+[CLLocationManager authorizationStatusForBundleIdentifier:MapsAppBundleId]- 3 > 1)return 0; {
  v3 = [(MapsSuggestionsNavdLocationManager *)self locationManager];
  }
  BOOL v4 = [v3 accuracyAuthorization] == 0;

  return v4;
}

@end