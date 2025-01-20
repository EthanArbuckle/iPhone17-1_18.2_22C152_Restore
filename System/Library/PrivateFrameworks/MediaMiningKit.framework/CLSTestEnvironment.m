@interface CLSTestEnvironment
+ (id)test_cacheBusinessItem:(id)a3 poiCache:(id)a4;
+ (id)test_locationOfInterestAndVisitFromDictionary:(id)a3 poiCache:(id)a4;
+ (id)test_placemarkWithData:(id)a3;
+ (id)test_publicEventManagerWithQueryRadius:(double)a3 invalidateCache:(BOOL)a4;
+ (void)test_routineAddLocationOfInterest:(id)a3 toServiceManager:(id)a4;
+ (void)test_setMePersonIdentity:(id)a3 onServiceManager:(id)a4;
@end

@implementation CLSTestEnvironment

+ (void)test_setMePersonIdentity:(id)a3 onServiceManager:(id)a4
{
}

+ (id)test_publicEventManagerWithQueryRadius:(double)a3 invalidateCache:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = [CLSPublicEventManager alloc];
  v7 = (void *)MEMORY[0x1E4F1CB10];
  v8 = NSTemporaryDirectory();
  v9 = [v7 fileURLWithPath:v8 isDirectory:1];
  v10 = [(CLSPublicEventManager *)v6 initWithURL:v9];

  [(CLSPublicEventManager *)v10 setQueryRadius:a3];
  if (v4)
  {
    [(CLSPublicEventManager *)v10 invalidateDiskCaches];
    [(CLSPublicEventManager *)v10 invalidateMemoryCaches];
  }
  return v10;
}

+ (id)test_locationOfInterestAndVisitFromDictionary:(id)a3 poiCache:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:@"latitude"];
  v38 = v7;
  v8 = [v6 objectForKeyedSubscript:@"longitude"];
  v9 = [v6 objectForKeyedSubscript:@"startDate"];
  v10 = [v6 objectForKeyedSubscript:@"endDate"];
  v11 = [v6 objectForKeyedSubscript:@"name"];

  v12 = @"unknown";
  if (v11) {
    v12 = v11;
  }
  v13 = v12;

  uint64_t v14 = rand();
  id v15 = objc_alloc(MEMORY[0x1E4F1E5F0]);
  [v7 doubleValue];
  double v17 = v16;
  [v8 doubleValue];
  v19 = (void *)[v15 initWithLatitude:v17 longitude:v18];
  v20 = objc_alloc_init(CLSBusinessItem);
  [(CLSBusinessItem *)v20 setMuid:v14];
  [(CLSBusinessItem *)v20 setName:v13];

  id v21 = objc_alloc(MEMORY[0x1E4F1E5A8]);
  [v19 coordinate];
  double v23 = v22;
  double v25 = v24;
  v26 = [MEMORY[0x1E4F29128] UUID];
  v27 = [v26 UUIDString];
  v28 = objc_msgSend(v21, "initWithCenter:radius:identifier:", v27, v23, v25, 5.0);
  [(CLSBusinessItem *)v20 setRegion:v28];

  id v29 = +[CLSTestEnvironment test_cacheBusinessItem:v20 poiCache:v5];
  v30 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v9 endDate:v10];
  v31 = [CLSLocationOfInterest alloc];
  v32 = [MEMORY[0x1E4F29128] UUID];
  v33 = [(CLSLocationOfInterest *)v31 initWithIdentifier:v32 locationOfInterestType:-1 location:v19 placemarkRegion:0 businessItemMuid:v14 radius:200.0];

  v34 = [CLSLocationOfInterestVisit alloc];
  v35 = [MEMORY[0x1E4F29128] UUID];
  v36 = [(CLSLocationOfInterestVisit *)v34 initWithIdentifier:v35 visitInterval:v30 confidence:1.0];

  [(CLSLocationOfInterest *)v33 addVisit:v36];
  return v33;
}

+ (id)test_placemarkWithData:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_alloc_init(CLSLitePlacemark);
  id v5 = [v3 region];
  [(CLSLitePlacemark *)v4 setRegion:v5];

  id v6 = [v3 location];
  [(CLSLitePlacemark *)v4 setLocation:v6];

  v7 = [v3 thoroughfare];
  [(CLSLitePlacemark *)v4 setThoroughfare:v7];

  v8 = [v3 subThoroughfare];
  [(CLSLitePlacemark *)v4 setSubThoroughfare:v8];

  v9 = [v3 locality];
  [(CLSLitePlacemark *)v4 setLocality:v9];

  v10 = [v3 subLocality];
  [(CLSLitePlacemark *)v4 setSubLocality:v10];

  v11 = [v3 administrativeArea];
  [(CLSLitePlacemark *)v4 setAdministrativeArea:v11];

  v12 = [v3 subAdministrativeArea];
  [(CLSLitePlacemark *)v4 setSubAdministrativeArea:v12];

  v13 = [v3 ISOcountryCode];
  [(CLSLitePlacemark *)v4 setISOcountryCode:v13];

  uint64_t v14 = [v3 inlandWater];
  [(CLSLitePlacemark *)v4 setInlandWater:v14];

  id v15 = [v3 ocean];
  [(CLSLitePlacemark *)v4 setOcean:v15];

  double v16 = [v3 areasOfInterest];
  [(CLSLitePlacemark *)v4 setAreasOfInterest:v16];

  double v17 = [v3 administrativeAreaCode];
  [(CLSLitePlacemark *)v4 setAdministrativeAreaCode:v17];

  -[CLSLitePlacemark setIsIsland:](v4, "setIsIsland:", [v3 isIsland]);
  double v18 = [v3 popularityScoresOrderedByAOI];

  [(CLSLitePlacemark *)v4 setPopularityScoresOrderedByAOI:v18];
  return v4;
}

+ (id)test_cacheBusinessItem:(id)a3 poiCache:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v18 = v5;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  v19[0] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  v9 = [v5 region];
  double v17 = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  [v6 insertBatchesOfBusinessItems:v8 forRegions:v10];

  v11 = [v5 name];

  if (v11)
  {
    id v16 = v5;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
    v13 = [v6 updateBusinessItems:v12];

    id v14 = [v13 firstObject];
  }
  else
  {
    id v14 = v5;
  }

  return v14;
}

+ (void)test_routineAddLocationOfInterest:(id)a3 toServiceManager:(id)a4
{
  id v5 = a3;
  id v6 = [a4 routineService];
  [v6 cacheLocationOfInterest:v5];

  [v6 setRoutineIsAvailable:1];
}

@end