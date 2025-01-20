@interface CAMLibrarySelectionSignalResult
+ (BOOL)currentLocation:(id)a3 isContainedInCircularRegions:(id)a4;
+ (CAMLibrarySelectionSignalResult)librarySelectionSignalResultWithIdentitiesInProximity:(id)a3 currentLocation:(id)a4 locationAuthorizationStatus:(int)a5 homeLocations:(id)a6 frequentLocations:(id)a7;
+ (double)distanceBetweenLocation:(id)a3 andCircularRegion:(id)a4 atDate:(id)a5;
- (BOOL)cameraHasAccessToLocation;
- (BOOL)currentLocationCloseToHome;
- (BOOL)isOnTrip;
- (BOOL)suggestsSharing;
- (CAMLibrarySelectionSignalResult)initWithIdentitiesInProximity:(id)a3 currentLocation:(id)a4 locationAuthorizationStatus:(int)a5 homeLocations:(id)a6 frequentLocations:(id)a7;
- (CLLocation)currentLocation;
- (NSArray)frequentAndHomeLocations;
- (NSArray)homeLocations;
- (NSArray)identitiesInProximity;
- (NSNumber)suggestsSharingValue;
- (id)_diagnosticsForRegions:(id)a3;
- (id)description;
- (id)frequentLocationRegionContainingLocation:(id)a3;
- (id)resultDiagnostics;
- (int)locationAuthorizationStatus;
- (void)setCurrentLocation:(id)a3;
- (void)setIdentitiesInProximity:(id)a3;
- (void)setSuggestsSharingValue:(id)a3;
@end

@implementation CAMLibrarySelectionSignalResult

+ (CAMLibrarySelectionSignalResult)librarySelectionSignalResultWithIdentitiesInProximity:(id)a3 currentLocation:(id)a4 locationAuthorizationStatus:(int)a5 homeLocations:(id)a6 frequentLocations:(id)a7
{
  uint64_t v8 = *(void *)&a5;
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  v16 = (void *)[objc_alloc((Class)a1) initWithIdentitiesInProximity:v15 currentLocation:v14 locationAuthorizationStatus:v8 homeLocations:v13 frequentLocations:v12];

  return (CAMLibrarySelectionSignalResult *)v16;
}

- (CAMLibrarySelectionSignalResult)initWithIdentitiesInProximity:(id)a3 currentLocation:(id)a4 locationAuthorizationStatus:(int)a5 homeLocations:(id)a6 frequentLocations:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v26.receiver = self;
  v26.super_class = (Class)CAMLibrarySelectionSignalResult;
  v16 = [(CAMLibrarySelectionSignalResult *)&v26 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    v18 = (void *)v17;
    v19 = (void *)MEMORY[0x263EFFA68];
    if (v17) {
      v20 = (void *)v17;
    }
    else {
      v20 = (void *)MEMORY[0x263EFFA68];
    }
    objc_storeStrong((id *)&v16->_identitiesInProximity, v20);

    objc_storeStrong((id *)&v16->_currentLocation, a4);
    v16->_locationAuthorizationStatus = a5;
    if (v14) {
      v21 = v14;
    }
    else {
      v21 = v19;
    }
    objc_storeStrong((id *)&v16->_homeLocations, v21);
    if (v15) {
      id v22 = v15;
    }
    else {
      id v22 = v19;
    }
    uint64_t v23 = [v14 arrayByAddingObjectsFromArray:v22];
    frequentAndHomeLocations = v16->_frequentAndHomeLocations;
    v16->_frequentAndHomeLocations = (NSArray *)v23;
  }
  return v16;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)CAMLibrarySelectionSignalResult;
  v4 = [(CAMLibrarySelectionSignalResult *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@: identitiesInProximity: %@, currentLocation: %@, locationAuthorizationStatus: %d, homeLocations: %@, number of frequent and home locations: %lu", v4, self->_identitiesInProximity, self->_currentLocation, self->_locationAuthorizationStatus, self->_homeLocations, -[NSArray count](self->_frequentAndHomeLocations, "count")];

  return v5;
}

- (BOOL)cameraHasAccessToLocation
{
  return [(CAMLibrarySelectionSignalResult *)self locationAuthorizationStatus]- 3 < 2;
}

- (BOOL)isOnTrip
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = [(CAMLibrarySelectionSignalResult *)self frequentAndHomeLocations];
  if (![v3 count])
  {

    return 0;
  }
  v4 = [(CAMLibrarySelectionSignalResult *)self currentLocation];

  if (!v4) {
    return 0;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = [(CAMLibrarySelectionSignalResult *)self frequentAndHomeLocations];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v11 = objc_opt_class();
        id v12 = [(CAMLibrarySelectionSignalResult *)self currentLocation];
        [v11 distanceBetweenLocation:v12 andCircularRegion:v10 atDate:0];
        double v14 = v13;

        if (v14 < 50000.0)
        {
          BOOL v15 = 0;
          goto LABEL_15;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 1;
LABEL_15:

  return v15;
}

- (BOOL)currentLocationCloseToHome
{
  v3 = objc_opt_class();
  v4 = [(CAMLibrarySelectionSignalResult *)self currentLocation];
  v5 = [(CAMLibrarySelectionSignalResult *)self homeLocations];
  LOBYTE(v3) = [v3 currentLocation:v4 isContainedInCircularRegions:v5];

  return (char)v3;
}

- (id)frequentLocationRegionContainingLocation:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = [(CAMLibrarySelectionSignalResult *)self frequentAndHomeLocations];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = objc_opt_class();
        long long v19 = v10;
        id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v19 count:1];
        LOBYTE(v11) = [(id)v11 currentLocation:v4 isContainedInCircularRegions:v12];

        if (v11)
        {
          id v13 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)suggestsSharing
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  suggestsSharingValue = self->_suggestsSharingValue;
  if (suggestsSharingValue) {
    return [(NSNumber *)suggestsSharingValue BOOLValue];
  }
  id v4 = +[CAMUserPreferences preferences];
  int v5 = [(CAMLibrarySelectionSignalResult *)self locationAuthorizationStatus];
  if (v5) {
    BOOL v6 = v5 == -1;
  }
  else {
    BOOL v6 = 1;
  }
  int v7 = v6;
  if (v6 || ![(CAMLibrarySelectionSignalResult *)self cameraHasAccessToLocation])
  {
    int v15 = 0;
    int v16 = 0;
    LODWORD(v13) = 0;
  }
  else
  {
    uint64_t v8 = [(CAMLibrarySelectionSignalResult *)self currentLocation];
    [v8 coordinate];
    CLLocationDegrees v10 = v9;
    CLLocationDegrees v12 = v11;

    id v13 = [(CAMLibrarySelectionSignalResult *)self currentLocation];
    if (v13)
    {
      v36.latitude = v10;
      v36.longitude = v12;
      BOOL v14 = CLLocationCoordinate2DIsValid(v36);

      if (v14)
      {
        LODWORD(v13) = [(CAMLibrarySelectionSignalResult *)self currentLocationCloseToHome];
        int v15 = 1;
      }
      else
      {
        int v15 = 0;
        LODWORD(v13) = 0;
      }
    }
    else
    {
      int v15 = 0;
    }
    int v16 = 1;
  }
  uint64_t v17 = [v4 shareWhenAtHomeEnabled] & v13;
  long long v18 = [(CAMLibrarySelectionSignalResult *)self identitiesInProximity];
  uint64_t v19 = [v18 count];

  if ((v17 & 1) == 0 && v19)
  {
    if (v7 & 1) != 0 || ((v16 ^ 1))
    {
      if (v7)
      {
LABEL_25:
        uint64_t v17 = v15 & (v13 ^ 1);
        goto LABEL_28;
      }
    }
    else
    {
      long long v20 = [(CAMLibrarySelectionSignalResult *)self homeLocations];
      if ([v20 count])
      {
        char v21 = [v4 shareWhenAtHomeEnabled];

        if (v21) {
          goto LABEL_27;
        }
        goto LABEL_25;
      }
    }
LABEL_27:
    uint64_t v17 = 1;
  }
LABEL_28:
  uint64_t v22 = os_log_create("com.apple.camera", "SharedLibrary");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    v26[0] = 67110144;
    v26[1] = v17;
    __int16 v27 = 1024;
    int v28 = v7;
    __int16 v29 = 1024;
    int v30 = v16;
    __int16 v31 = 1024;
    int v32 = (int)v13;
    __int16 v33 = 1024;
    BOOL v34 = v19 != 0;
    _os_log_impl(&dword_2099F8000, v22, OS_LOG_TYPE_INFO, "[CAMLibrarySelectionSignalResult] suggestsSharing: %d, cameraLocationAuthorizationPending: %d, cameraHasAccessToLocation: %d, currentLocationCloseToHome: %d, hasIdentitiesInProximity: %d", (uint8_t *)v26, 0x20u);
  }

  uint64_t v23 = [NSNumber numberWithBool:v17];
  v24 = self->_suggestsSharingValue;
  self->_suggestsSharingValue = v23;

  suggestsSharingValue = self->_suggestsSharingValue;
  return [(NSNumber *)suggestsSharingValue BOOLValue];
}

- (id)resultDiagnostics
{
  v31[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = NSNumber;
  int v5 = [(CAMLibrarySelectionSignalResult *)self identitiesInProximity];
  BOOL v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
  [v3 setObject:v6 forKeyedSubscript:@"countOfIdentitiesInProximity"];

  int v7 = objc_msgSend(NSNumber, "numberWithBool:", -[CAMLibrarySelectionSignalResult suggestsSharing](self, "suggestsSharing"));
  [v3 setObject:v7 forKeyedSubscript:@"suggestsSharing"];

  uint64_t v8 = [(CAMLibrarySelectionSignalResult *)self currentLocation];
  double v9 = v8;
  if (v8)
  {
    v30[0] = @"coordinateIsValid";
    CLLocationDegrees v10 = NSNumber;
    [v8 coordinate];
    double v11 = [v10 numberWithBool:CLLocationCoordinate2DIsValid(v33)];
    v30[1] = @"horizontalAccuracy";
    v31[0] = v11;
    CLLocationDegrees v12 = NSNumber;
    [v9 horizontalAccuracy];
    id v13 = objc_msgSend(v12, "numberWithDouble:");
    v31[1] = v13;
    BOOL v14 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];
    [v3 setObject:v14 forKeyedSubscript:@"currentLocation"];
  }
  else
  {
    [v3 setObject:&unk_26BDDF830 forKeyedSubscript:@"currentLocation"];
  }
  int v15 = objc_msgSend(NSNumber, "numberWithInt:", -[CAMLibrarySelectionSignalResult locationAuthorizationStatus](self, "locationAuthorizationStatus"));
  [v3 setObject:v15 forKeyedSubscript:@"locationAuthorizationStatus"];

  int v16 = [(CAMLibrarySelectionSignalResult *)self homeLocations];
  uint64_t v17 = [(CAMLibrarySelectionSignalResult *)self _diagnosticsForRegions:v16];
  [v3 setObject:v17 forKeyedSubscript:@"homeLocationsDiagnostics"];

  long long v18 = [(CAMLibrarySelectionSignalResult *)self frequentAndHomeLocations];
  uint64_t v19 = [(CAMLibrarySelectionSignalResult *)self _diagnosticsForRegions:v18];
  [v3 setObject:v19 forKeyedSubscript:@"frequentLocationsDiagnostics"];

  long long v20 = objc_opt_class();
  char v21 = [(CAMLibrarySelectionSignalResult *)self homeLocations];
  uint64_t v22 = [v20 currentLocation:v9 isContainedInCircularRegions:v21];

  uint64_t v23 = [NSNumber numberWithBool:v22];
  [v3 setObject:v23 forKeyedSubscript:@"closeToHomeLocation"];

  v24 = objc_opt_class();
  v25 = [(CAMLibrarySelectionSignalResult *)self frequentAndHomeLocations];
  uint64_t v26 = [v24 currentLocation:v9 isContainedInCircularRegions:v25];

  __int16 v27 = [NSNumber numberWithBool:v26];
  [v3 setObject:v27 forKeyedSubscript:@"closeToFrequentLocation"];

  int v28 = objc_msgSend(NSNumber, "numberWithBool:", -[CAMLibrarySelectionSignalResult isOnTrip](self, "isOnTrip"));
  [v3 setObject:v28 forKeyedSubscript:@"isOnTrip"];

  return v3;
}

- (id)_diagnosticsForRegions:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v4, "count"));
  BOOL v6 = [(CAMLibrarySelectionSignalResult *)self currentLocation];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    double v10 = *MEMORY[0x263F009F8];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(obj);
        }
        CLLocationDegrees v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        double v13 = v10;
        if (v6)
        {
          [(id)objc_opt_class() distanceBetweenLocation:v6 andCircularRegion:v12 atDate:0];
          double v13 = v14;
        }
        v27[0] = @"coordinateIsValid";
        int v15 = NSNumber;
        [v12 center];
        int v16 = [v15 numberWithBool:CLLocationCoordinate2DIsValid(v32)];
        v28[0] = v16;
        v27[1] = @"radius";
        uint64_t v17 = NSNumber;
        [v12 radius];
        long long v18 = objc_msgSend(v17, "numberWithDouble:");
        v28[1] = v18;
        v27[2] = @"distanceFromCurrentLocation";
        uint64_t v19 = [NSNumber numberWithDouble:v13];
        v28[2] = v19;
        long long v20 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:3];
        [v5 addObject:v20];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (double)distanceBetweenLocation:(id)a3 andCircularRegion:(id)a4 atDate:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  [v7 coordinate];
  if (!v7 || !CLLocationCoordinate2DIsValid(*(CLLocationCoordinate2D *)&v10)) {
    goto LABEL_10;
  }
  if (v9)
  {
    CLLocationDegrees v12 = [v7 timestamp];
    [v9 timeIntervalSinceDate:v12];
    double v14 = v13;

    double v15 = v14 <= 60.0 ? 0.0 : v14 * 30.0;
  }
  else
  {
    double v15 = 0.0;
  }
  [v7 horizontalAccuracy];
  double v17 = v16;
  [v8 center];
  if (CLLocationCoordinate2DIsValid(v21))
  {
    CLLocationCoordinate2DGetDistanceFrom();
    double v19 = fmin(v18, fmax(v18 - (v15 + v17), 0.0));
  }
  else
  {
LABEL_10:
    double v19 = *MEMORY[0x263F009F8];
  }

  return v19;
}

+ (BOOL)currentLocation:(id)a3 isContainedInCircularRegions:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = a4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        CLLocationDegrees v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_msgSend(a1, "distanceBetweenLocation:andCircularRegion:atDate:", v6, v12, 0, (void)v18);
        double v14 = v13;
        [v12 radius];
        if (v14 < fmin(fmax(v15, 50.0), 750.0))
        {
          BOOL v16 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v16 = 0;
LABEL_11:

  return v16;
}

- (NSArray)identitiesInProximity
{
  return self->_identitiesInProximity;
}

- (void)setIdentitiesInProximity:(id)a3
{
}

- (CLLocation)currentLocation
{
  return self->_currentLocation;
}

- (void)setCurrentLocation:(id)a3
{
}

- (int)locationAuthorizationStatus
{
  return self->_locationAuthorizationStatus;
}

- (NSArray)homeLocations
{
  return self->_homeLocations;
}

- (NSArray)frequentAndHomeLocations
{
  return self->_frequentAndHomeLocations;
}

- (NSNumber)suggestsSharingValue
{
  return self->_suggestsSharingValue;
}

- (void)setSuggestsSharingValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestsSharingValue, 0);
  objc_storeStrong((id *)&self->_frequentAndHomeLocations, 0);
  objc_storeStrong((id *)&self->_homeLocations, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_storeStrong((id *)&self->_identitiesInProximity, 0);
}

@end