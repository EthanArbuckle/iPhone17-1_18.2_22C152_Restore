@interface _DKLocationCoordinatesMonitor
+ (id)entitlements;
+ (id)eventStream;
+ (id)log;
- (RTLocation)home;
- (RTLocation)work;
- (_DKLocationCoordinatesMonitor)init;
- (int)altitudeRangeFrom:(double)a3;
- (int)distanceRangeFrom:(double)a3;
- (int)locationTypeFrom:(int)a3;
- (int)speedRangeFrom:(double)a3;
- (void)_fetchAndCacheLOIs;
- (void)dealloc;
- (void)init;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)setHome:(id)a3;
- (void)setWork:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation _DKLocationCoordinatesMonitor

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(_DKMonitor *)self queue];
  dispatch_assert_queue_V2(v8);

  v9 = [v7 lastObject];
  v10 = +[_DKLocationCoordinatesMonitor log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[_DKLocationCoordinatesMonitor locationManager:didUpdateLocations:].cold.7(v9, (uint64_t)self, v10);
  }

  p_lastLocation = &self->_lastLocation;
  if (self->_lastLocation)
  {
    v12 = [v9 timestamp];
    v13 = [(CLLocation *)*p_lastLocation timestamp];
    [v12 timeIntervalSinceDate:v13];
    if (fabs(v14) >= 1.0) {
      goto LABEL_16;
    }
    [v9 coordinate];
    double v16 = v15;
    [(CLLocation *)*p_lastLocation coordinate];
    if (v16 != v17) {
      goto LABEL_16;
    }
    [v9 coordinate];
    double v19 = v18;
    [(CLLocation *)*p_lastLocation coordinate];
    if (v19 != v20) {
      goto LABEL_16;
    }
    [v9 horizontalAccuracy];
    double v22 = v21;
    [(CLLocation *)*p_lastLocation horizontalAccuracy];
    if (v22 != v23) {
      goto LABEL_16;
    }
    [v9 altitude];
    double v25 = v24;
    [(CLLocation *)*p_lastLocation altitude];
    if (v25 != v26) {
      goto LABEL_16;
    }
    [v9 verticalAccuracy];
    double v28 = v27;
    [(CLLocation *)*p_lastLocation verticalAccuracy];
    if (v28 != v29) {
      goto LABEL_16;
    }
    [v9 speed];
    double v31 = v30;
    [(CLLocation *)*p_lastLocation speed];
    if (v31 == v32
      && ([v9 course], double v34 = v33, -[CLLocation course](*p_lastLocation, "course"), v34 == v35)
      && (int v36 = [v9 type], v36 == -[CLLocation type](*p_lastLocation, "type")))
    {
      v37 = [v9 floor];
      uint64_t v117 = [v37 level];
      [(CLLocation *)*p_lastLocation floor];
      v39 = id v38 = v7;
      uint64_t v40 = [v39 level];

      id v7 = v38;
      if (v117 == v40)
      {
        v41 = +[_DKLocationCoordinatesMonitor log];
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
          -[_DKLocationCoordinatesMonitor locationManager:didUpdateLocations:].cold.6(v9, v41);
        }
        goto LABEL_54;
      }
    }
    else
    {
LABEL_16:
    }
  }
  v42 = [v9 timestamp];
  v43 = [(CLLocation *)*p_lastLocation timestamp];
  [v42 timeIntervalSinceDate:v43];
  double v45 = v44;

  if (*p_lastLocation)
  {
    double v46 = fabs(v45);
    if (v46 < 5.0)
    {
      v47 = +[_DKLocationCoordinatesMonitor log];
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
        [(_DKLocationCoordinatesMonitor *)v47 locationManager:v48 didUpdateLocations:v49];
      }
LABEL_33:

      goto LABEL_34;
    }
  }
  objc_storeStrong((id *)&self->_lastLocation, v9);
  if (os_variant_has_internal_content() && self->_locationCoordinatesStreamSource)
  {
    uint64_t v124 = 0;
    v125 = &v124;
    uint64_t v126 = 0x2050000000;
    v50 = (void *)getBMILocationCoordinatesClass_softClass;
    uint64_t v127 = getBMILocationCoordinatesClass_softClass;
    if (!getBMILocationCoordinatesClass_softClass)
    {
      BiomeLibraryInternalLibraryCore();
      v125[3] = (uint64_t)objc_getClass("BMILocationCoordinates");
      getBMILocationCoordinatesClass_softClass = v125[3];
      v50 = (void *)v125[3];
    }
    id v120 = v7;
    id v122 = v6;
    v51 = v50;
    _Block_object_dispose(&v124, 8);
    id v52 = [v51 alloc];
    v53 = NSNumber;
    [v9 coordinate];
    v118 = objc_msgSend(v53, "numberWithDouble:");
    v54 = NSNumber;
    [v9 coordinate];
    v115 = [v54 numberWithDouble:v55];
    v56 = NSNumber;
    [v9 altitude];
    v114 = objc_msgSend(v56, "numberWithDouble:");
    v57 = NSNumber;
    [v9 speed];
    v113 = objc_msgSend(v57, "numberWithDouble:");
    v58 = NSNumber;
    [v9 course];
    v59 = objc_msgSend(v58, "numberWithDouble:");
    v60 = [v9 floor];
    v112 = v52;
    if (v60)
    {
      v61 = NSNumber;
      v111 = [v9 floor];
      v62 = objc_msgSend(v61, "numberWithInteger:", objc_msgSend(v111, "level"));
    }
    else
    {
      v62 = 0;
    }
    int v63 = -[_DKLocationCoordinatesMonitor locationTypeFrom:](self, "locationTypeFrom:", [v9 type]);
    v64 = NSNumber;
    [v9 horizontalAccuracy];
    v65 = objc_msgSend(v64, "numberWithDouble:");
    v66 = NSNumber;
    [v9 verticalAccuracy];
    v67 = objc_msgSend(v66, "numberWithDouble:");
    v68 = NSNumber;
    [v9 speedAccuracy];
    v69 = objc_msgSend(v68, "numberWithDouble:");
    v70 = NSNumber;
    [v9 courseAccuracy];
    v71 = objc_msgSend(v70, "numberWithDouble:");
    LODWORD(v110) = v63;
    v47 = [v112 initWithLatitude:v118 longitude:v115 altitude:v114 speed:v113 course:v59 floor:v62 locationType:v110 horizontalAccuracy:v65 verticalAccuracy:v67 speedAccuracy:v69 courseAccuracy:v71];

    if (v60)
    {
    }
    locationCoordinatesStreamSource = self->_locationCoordinatesStreamSource;
    v73 = [v9 timestamp];
    [v73 timeIntervalSinceReferenceDate];
    -[BMSource sendEvent:timestamp:](locationCoordinatesStreamSource, "sendEvent:timestamp:", v47);

    v74 = +[_DKLocationCoordinatesMonitor log];
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG)) {
      -[_DKLocationCoordinatesMonitor locationManager:didUpdateLocations:].cold.4();
    }

    id v7 = v120;
    id v6 = v122;
    goto LABEL_33;
  }
LABEL_34:
  unint64_t v75 = objc_msgSend(v9, "cd_privacyPreservingLocationHashWithLevel:", 16);
  unint64_t v76 = v75;
  if (v75 == self->_lastLocationGeoHash300m)
  {
    v41 = +[_DKLocationCoordinatesMonitor log];
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
      -[_DKLocationCoordinatesMonitor locationManager:didUpdateLocations:]();
    }
  }
  else
  {
    self->_lastLocationGeoHash300m = v75;
    v77 = [(_DKLocationCoordinatesMonitor *)self home];

    if (v77)
    {
      id v78 = objc_alloc(MEMORY[0x263F00A50]);
      v79 = [(_DKLocationCoordinatesMonitor *)self home];
      [v79 latitude];
      double v81 = v80;
      v82 = [(_DKLocationCoordinatesMonitor *)self home];
      [v82 longitude];
      v84 = (void *)[v78 initWithLatitude:v81 longitude:v83];
      [v9 distanceFromLocation:v84];
      double v86 = v85;

      int v119 = [(_DKLocationCoordinatesMonitor *)self distanceRangeFrom:v86];
    }
    else
    {
      int v119 = 0;
    }
    v87 = [(_DKLocationCoordinatesMonitor *)self work];

    id v121 = v7;
    id v123 = v6;
    if (v87)
    {
      id v88 = objc_alloc(MEMORY[0x263F00A50]);
      v89 = [(_DKLocationCoordinatesMonitor *)self work];
      [v89 latitude];
      double v91 = v90;
      v92 = [(_DKLocationCoordinatesMonitor *)self work];
      [v92 longitude];
      v94 = (void *)[v88 initWithLatitude:v91 longitude:v93];
      [v9 distanceFromLocation:v94];
      double v96 = v95;

      int v116 = [(_DKLocationCoordinatesMonitor *)self distanceRangeFrom:v96];
    }
    else
    {
      int v116 = 0;
    }
    v97 = objc_msgSend(v9, "cd_privacyPreservingLocationHashWithLevel:", 7);
    uint64_t v98 = objc_msgSend(v9, "cd_privacyPreservingLocationHashWithLevel:", 13);
    id v99 = objc_alloc(MEMORY[0x263F2A1A8]);
    v100 = [NSNumber numberWithUnsignedLongLong:v76];
    v101 = [NSNumber numberWithUnsignedLongLong:v98];
    v102 = [NSNumber numberWithUnsignedLongLong:v97];
    v103 = [v9 floor];
    if (v103)
    {
      v104 = NSNumber;
      v97 = [v9 floor];
      v105 = objc_msgSend(v104, "numberWithInteger:", objc_msgSend(v97, "level"));
    }
    else
    {
      v105 = 0;
    }
    [v9 speed];
    int v106 = -[_DKLocationCoordinatesMonitor speedRangeFrom:](self, "speedRangeFrom:");
    [v9 altitude];
    v41 = [v99 initWithLocationHashAt300Meters:v100 locationHashAt2500Meters:v101 locationHashAt156Kilometers:v102 distanceFromHomeOfCurrentLocationInMeters:0 distanceFromWorkOfCurrentLocationInMeters:0 distanceFromSchoolOfCurrentLocationInMeters:0 distanceFromGymOfCurrentLocationInMeters:0 floor:v105 speedBucket:__PAIR64__(-[_DKLocationCoordinatesMonitor altitudeRangeFrom:](self altitudeBucket:"altitudeRangeFrom:") distanceBucketFromHome:v106) distanceBucketFromWork:__PAIR64__(v116 distanceBucketFromGym:v119) distanceBucketFromSchool:0];
    if (v103)
    {
    }
    locationHashedCoordinatesStreamSource = self->_locationHashedCoordinatesStreamSource;
    id v6 = v123;
    if (locationHashedCoordinatesStreamSource)
    {
      v108 = [v9 timestamp];
      [v108 timeIntervalSinceReferenceDate];
      -[BMSource sendEvent:timestamp:](locationHashedCoordinatesStreamSource, "sendEvent:timestamp:", v41);

      v109 = +[_DKLocationCoordinatesMonitor log];
      id v7 = v121;
      if (os_log_type_enabled(v109, OS_LOG_TYPE_DEBUG)) {
        -[_DKLocationCoordinatesMonitor locationManager:didUpdateLocations:]();
      }
    }
    else
    {
      v109 = +[_DKLocationCoordinatesMonitor log];
      id v7 = v121;
      if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR)) {
        -[_DKLocationCoordinatesMonitor locationManager:didUpdateLocations:]();
      }
    }
  }
LABEL_54:
}

+ (id)log
{
  if (log_onceToken_1 != -1) {
    dispatch_once(&log_onceToken_1, &__block_literal_global_6);
  }
  v2 = (void *)log_log_1;
  return v2;
}

- (int)locationTypeFrom:(int)a3
{
  if a3 < 0xE && ((0x3FDFu >> a3)) {
    return dword_225034948[a3];
  }
  v4 = +[_DKLocationCoordinatesMonitor log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[_DKLocationCoordinatesMonitor locationTypeFrom:](a3, v4);
  }

  return 0;
}

+ (id)eventStream
{
  return @"LocationCoordinates";
}

+ (id)entitlements
{
  return &unk_26D86D770;
}

- (_DKLocationCoordinatesMonitor)init
{
  v29.receiver = self;
  v29.super_class = (Class)_DKLocationCoordinatesMonitor;
  v2 = [(_DKMonitor *)&v29 init];
  if (v2)
  {
    v3 = +[_DKLocationCoordinatesMonitor log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_225002000, v3, OS_LOG_TYPE_INFO, "Enabling location coordinates monitor", buf, 2u);
    }

    v4 = [(_DKMonitor *)v2 queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __37___DKLocationCoordinatesMonitor_init__block_invoke;
    block[3] = &unk_264714788;
    v5 = v2;
    double v27 = v5;
    dispatch_sync(v4, block);

    if (os_variant_has_internal_content())
    {
      if (BiomeLibraryInternalLibraryCore())
      {
        id v6 = BiomeLibraryInternalNodeBridge();
        id v25 = 0;
        uint64_t v7 = [v6 streamWithIdentifier:@"Location.Coordinates" error:&v25];
        v8 = v25;
        locationCoordinatesStream = v5->_locationCoordinatesStream;
        v5->_locationCoordinatesStream = (BMStream *)v7;

        uint64_t v10 = [(BMStream *)v5->_locationCoordinatesStream source];
        locationCoordinatesStreamSource = v5->_locationCoordinatesStreamSource;
        v5->_locationCoordinatesStreamSource = (BMSource *)v10;
      }
      else
      {
        v8 = +[_DKLocationCoordinatesMonitor log];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          -[_DKLocationCoordinatesMonitor init]();
        }
      }
    }
    v12 = BiomeLibrary();
    v13 = [v12 Location];
    uint64_t v14 = [v13 HashedCoordinates];
    locationHashedCoordinatesStream = v5->_locationHashedCoordinatesStream;
    v5->_locationHashedCoordinatesStream = (BMStream *)v14;

    uint64_t v16 = [(BMStream *)v5->_locationHashedCoordinatesStream source];
    locationHashedCoordinatesStreamSource = v5->_locationHashedCoordinatesStreamSource;
    v5->_locationHashedCoordinatesStreamSource = (BMSource *)v16;

    double v18 = [(_DKMonitor *)v5 queue];
    dispatch_source_t v19 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v18);
    fetchLoiTimer = v5->_fetchLoiTimer;
    v5->_fetchLoiTimer = (OS_dispatch_source *)v19;

    dispatch_source_set_timer((dispatch_source_t)v5->_fetchLoiTimer, 0, 0x4E94914F0000uLL, 0x7DBA8218000uLL);
    double v21 = v5->_fetchLoiTimer;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __37___DKLocationCoordinatesMonitor_init__block_invoke_18;
    handler[3] = &unk_264714788;
    double v24 = v5;
    dispatch_source_set_event_handler(v21, handler);
  }
  return v2;
}

- (void)_fetchAndCacheLOIs
{
  v3 = [MEMORY[0x263F37F08] defaultManager];
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51___DKLocationCoordinatesMonitor__fetchAndCacheLOIs__block_invoke;
  v6[3] = &unk_2647147B0;
  objc_copyWeak(&v7, &location);
  [v3 fetchLocationsOfInterestOfType:0 withHandler:v6];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51___DKLocationCoordinatesMonitor__fetchAndCacheLOIs__block_invoke_21;
  v4[3] = &unk_2647147B0;
  objc_copyWeak(&v5, &location);
  [v3 fetchLocationsOfInterestOfType:1 withHandler:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)start
{
  v5.receiver = self;
  v5.super_class = (Class)_DKLocationCoordinatesMonitor;
  if ([(_DKMonitor *)&v5 instantMonitorNeedsActivation])
  {
    v3 = [(_DKMonitor *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __38___DKLocationCoordinatesMonitor_start__block_invoke;
    block[3] = &unk_264714788;
    void block[4] = self;
    dispatch_sync(v3, block);

    dispatch_resume((dispatch_object_t)self->_fetchLoiTimer);
  }
}

- (void)stop
{
  v5.receiver = self;
  v5.super_class = (Class)_DKLocationCoordinatesMonitor;
  if ([(_DKMonitor *)&v5 instantMonitorNeedsDeactivation])
  {
    v3 = [(_DKMonitor *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __37___DKLocationCoordinatesMonitor_stop__block_invoke;
    block[3] = &unk_264714788;
    void block[4] = self;
    dispatch_sync(v3, block);
  }
}

- (void)dealloc
{
  [(_DKLocationCoordinatesMonitor *)self deactivate];
  fetchLoiTimer = self->_fetchLoiTimer;
  if (fetchLoiTimer)
  {
    dispatch_source_cancel(fetchLoiTimer);
    v4 = self->_fetchLoiTimer;
    self->_fetchLoiTimer = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)_DKLocationCoordinatesMonitor;
  [(_DKMonitor *)&v5 dealloc];
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v4 = a4;
  objc_super v5 = +[_DKLocationCoordinatesMonitor log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[_DKLocationCoordinatesMonitor locationManager:didFailWithError:]();
  }
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = +[_DKLocationCoordinatesMonitor log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_super v5 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "authorizationStatus"));
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl(&dword_225002000, v4, OS_LOG_TYPE_INFO, "Authorization status changed %@", (uint8_t *)&v6, 0xCu);
  }
}

- (int)speedRangeFrom:(double)a3
{
  if (a3 < 0.0) {
    return 0;
  }
  if (a3 <= 2.0) {
    return 1;
  }
  if (a3 <= 4.0) {
    return 2;
  }
  if (a3 <= 6.0) {
    return 3;
  }
  if (a3 <= 8.0) {
    return 4;
  }
  if (a3 <= 10.0) {
    return 5;
  }
  if (a3 <= 12.0) {
    return 6;
  }
  if (a3 <= 16.0) {
    return 7;
  }
  if (a3 <= 20.0) {
    return 8;
  }
  if (a3 <= 24.0) {
    int v4 = 0;
  }
  else {
    int v4 = 10;
  }
  if (a3 > 24.0) {
    return v4;
  }
  else {
    return 9;
  }
}

- (int)altitudeRangeFrom:(double)a3
{
  if (a3 < 0.0) {
    return 0;
  }
  if (a3 <= 100.0) {
    return 1;
  }
  if (a3 <= 200.0) {
    return 2;
  }
  if (a3 <= 500.0) {
    return 3;
  }
  if (a3 <= 1000.0) {
    return 4;
  }
  if (a3 <= 2000.0) {
    return 5;
  }
  if (a3 <= 3000.0) {
    return 6;
  }
  if (a3 <= 4000.0) {
    return 7;
  }
  if (a3 <= 5000.0) {
    return 8;
  }
  return 9;
}

- (int)distanceRangeFrom:(double)a3
{
  if (a3 < 0.0) {
    return 0;
  }
  if (a3 <= 50.0) {
    return 1;
  }
  if (a3 <= 200.0) {
    return 2;
  }
  if (a3 <= 500.0) {
    return 3;
  }
  if (a3 <= 1000.0) {
    return 4;
  }
  if (a3 <= 2000.0) {
    return 5;
  }
  if (a3 <= 3000.0) {
    return 6;
  }
  if (a3 <= 4000.0) {
    return 7;
  }
  if (a3 <= 5000.0) {
    return 8;
  }
  return 9;
}

- (RTLocation)home
{
  return (RTLocation *)objc_getProperty(self, a2, 208, 1);
}

- (void)setHome:(id)a3
{
}

- (RTLocation)work
{
  return (RTLocation *)objc_getProperty(self, a2, 216, 1);
}

- (void)setWork:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_work, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_locationHashedCoordinatesStreamSource, 0);
  objc_storeStrong((id *)&self->_locationHashedCoordinatesStream, 0);
  objc_storeStrong((id *)&self->_locationCoordinatesStreamSource, 0);
  objc_storeStrong((id *)&self->_locationCoordinatesStream, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_fetchLoiTimer, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_225002000, v0, v1, "BiomeLibraryInternal is not available on an internal build", v2, v3, v4, v5, v6);
}

- (void)locationManager:didFailWithError:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_225002000, v0, v1, "location manager encountered error, %@", v2, v3, v4, v5, v6);
}

- (void)locationManager:didUpdateLocations:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_225002000, v0, v1, "Skipping hashed location since the hash value is the same : %llu", v2);
}

- (void)locationManager:didUpdateLocations:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_225002000, v0, v1, "Location.HashedCoordinates stream is missing.", v2, v3, v4, v5, v6);
}

- (void)locationManager:didUpdateLocations:.cold.3()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_225002000, v0, v1, "Wrote location to external biome stream,GeoHashAt300m: %llu", v2);
}

- (void)locationManager:didUpdateLocations:.cold.4()
{
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_225002000, v0, OS_LOG_TYPE_DEBUG, "Wrote location to internal biome stream", v1, 2u);
}

- (void)locationManager:(uint64_t)a3 didUpdateLocations:(uint64_t)a4 .cold.5(NSObject *a1, double a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v4 = 134217984;
  double v5 = a2;
  OUTLINED_FUNCTION_1_1(&dword_225002000, a1, a4, "Skipping internal location since the time interval is less than minimum time : %f", (uint8_t *)&v4);
}

- (void)locationManager:(void *)a1 didUpdateLocations:(NSObject *)a2 .cold.6(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 timestamp];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1_1(&dword_225002000, a2, v4, "Dropping duplicate location with timestamp: %@", v5);
}

- (void)locationManager:(NSObject *)a3 didUpdateLocations:.cold.7(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  double v5 = [a1 timestamp];
  uint64_t v6 = [*(id *)(a2 + 160) timestamp];
  [v5 timeIntervalSinceDate:v6];
  int v9 = 134217984;
  double v10 = fabs(v7);
  OUTLINED_FUNCTION_1_1(&dword_225002000, a3, v8, "Location manager received location. Time since last location: %f", (uint8_t *)&v9);
}

- (void)locationTypeFrom:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_225002000, a2, OS_LOG_TYPE_ERROR, "Unhandled Location Type, %u", (uint8_t *)v2, 8u);
}

@end