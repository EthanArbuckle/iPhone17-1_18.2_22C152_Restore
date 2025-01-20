@interface NWCSunriseComplicationBundleDataSource
+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4;
+ (BOOL)hasMigratedToWidgetForFamily:(int64_t)a3 device:(id)a4;
+ (id)appIdentifier;
+ (id)bundleIdentifier;
+ (id)legacyNTKComplicationType;
+ (id)localizedAppName;
- (BOOL)_needsCurrentEventEntry;
- (BOOL)_needsToSendChinaLocationShiftRequest;
- (BOOL)_needsToSendGeocodingRequest;
- (BOOL)isWaitingForGeocodeRequest;
- (BOOL)supportsTapAction;
- (BOOL)waitingForChinaShiftingRequest;
- (CLLocation)chinaShiftedLocation;
- (CLLocation)displayedLocation;
- (CLLocation)geocodeDelayedLocation;
- (NSString)locationName;
- (NSString)token;
- (NSTimer)geocodeRequestDelayTimer;
- (NWCComplicationTimelineEntryModelCache)cache;
- (NWCSunriseComplicationBundleDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5;
- (id)_animationGroupForDate:(id)a3 showingSunrise:(BOOL)a4 constantSun:(int64_t)a5;
- (id)_animationGroupForDate:(id)a3 showingSunrise:(BOOL)a4 constantSun:(int64_t)a5 haveLocation:(BOOL)a6;
- (id)_animationGroupForNoLocation;
- (id)_currentEntry:(BOOL)a3;
- (id)_entryModelsForDate:(id)a3 nextEvaluationDate:(id *)a4;
- (id)_timelineEntryFromEntry:(id)a3;
- (id)currentSwitcherTemplate;
- (unint64_t)timelineAnimationBehavior;
- (void)_chinaLocationShiftRequest:(id)a3;
- (void)_geocodeRequestDelayTimerTriggerred;
- (void)_handleLocation:(id)a3 error:(id)a4;
- (void)_invalidate;
- (void)_scheduleReverseGeocodeTimer:(double)a3;
- (void)_startObserving;
- (void)_stopObserving;
- (void)becomeActive;
- (void)becomeInactive;
- (void)dealloc;
- (void)fetchWidgetMigrationForDescriptor:(id)a3 family:(int64_t)a4 completion:(id)a5;
- (void)getCurrentTimelineEntryWithHandler:(id)a3;
- (void)getLaunchURLForTimelineEntryDate:(id)a3 timeTravelDate:(id)a4 withHandler:(id)a5;
- (void)getTimelineEndDateWithHandler:(id)a3;
- (void)getTimelineEntriesAfterDate:(id)a3 limit:(unint64_t)a4 withHandler:(id)a5;
- (void)setCache:(id)a3;
- (void)setChinaShiftedLocation:(id)a3;
- (void)setDisplayedLocation:(id)a3;
- (void)setGeocodeDelayedLocation:(id)a3;
- (void)setGeocodeRequestDelayTimer:(id)a3;
- (void)setLocationName:(id)a3;
- (void)setToken:(id)a3;
- (void)setWaitingForChinaShiftingRequest:(BOOL)a3;
- (void)setWaitingForGeocodeRequest:(BOOL)a3;
@end

@implementation NWCSunriseComplicationBundleDataSource

+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  id v5 = a4;
  if (unint64_t)a3 < 7 && ((0x57u >> a3))
  {
    LOBYTE(v6) = 1;
    goto LABEL_22;
  }
  LOBYTE(v6) = 1;
  if (a3 != 3 && *MEMORY[0x263EFCF20] != a3)
  {
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2020000000;
    v7 = (void *)qword_268BA3CF0;
    v20 = (void *)qword_268BA3CF0;
    if (!qword_268BA3CF0)
    {
      v8 = (void *)sub_23C354468();
      v18[3] = (uint64_t)dlsym(v8, "NTKComplicationFamilyUtilitarianLargeNarrow");
      qword_268BA3CF0 = v18[3];
      v7 = (void *)v18[3];
    }
    _Block_object_dispose(&v17, 8);
    if (!v7)
    {
      sub_23C35D2E0();
      goto LABEL_24;
    }
    if (*v7 == a3)
    {
      LOBYTE(v6) = 1;
    }
    else if ((unint64_t)a3 > 0xC)
    {
      LOBYTE(v6) = 0;
    }
    else
    {
      unsigned int v6 = (0x1580u >> a3) & 1;
    }
  }
  if (a3 == 10)
  {
    id v11 = v5;
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2020000000;
    v12 = (uint64_t (*)(id))off_268BA3D00;
    v20 = off_268BA3D00;
    if (!off_268BA3D00)
    {
      v13 = (void *)sub_23C354468();
      v18[3] = (uint64_t)dlsym(v13, "NTKShowBlueRidgeUI");
      off_268BA3D00 = (_UNKNOWN *)v18[3];
      v12 = (uint64_t (*)(id))v18[3];
    }
    _Block_object_dispose(&v17, 8);
    if (v12)
    {
      char v14 = v12(v11);

      LOBYTE(v6) = v6 & v14;
      goto LABEL_22;
    }
LABEL_24:
    v16 = (_Unwind_Exception *)sub_23C35D2E0();
    _Block_object_dispose(&v17, 8);
    _Unwind_Resume(v16);
  }
  if (a3 == 11 && _os_feature_enabled_impl())
  {
    v9 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"2C1C2266-9A61-4756-8AFD-9DFE14C54864"];
    char v10 = [v5 supportsCapability:v9];

    LOBYTE(v6) = v6 | v10;
  }
LABEL_22:

  return v6;
}

+ (id)bundleIdentifier
{
  return @"com.apple.NanoWorldClock.sunrise";
}

- (NWCSunriseComplicationBundleDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  v18.receiver = self;
  v18.super_class = (Class)NWCSunriseComplicationBundleDataSource;
  id v5 = [(CLKCComplicationDataSource *)&v18 initWithComplication:a3 family:a4 forDevice:a5];
  unsigned int v6 = v5;
  if (v5)
  {
    [(NWCSunriseComplicationBundleDataSource *)v5 _startObserving];
    v7 = [sub_23C359B88() sharedLocationManager];
    v8 = [v7 currentLocation];

    v9 = +[NWCComplicationGeocoder sharedGeocoder];
    char v10 = [v9 cachedPlacemarkForLocation:v8];

    uint64_t v11 = NWCComplicationLocationNameForPlacemark((uint64_t)v8, v10);
    locationName = v6->_locationName;
    v6->_locationName = (NSString *)v11;

    displayedLocation = v6->_displayedLocation;
    v6->_displayedLocation = v8;
    char v14 = v8;

    v15 = [[NWCComplicationTimelineEntryModelCache alloc] initWithDataSource:v6];
    cache = v6->_cache;
    v6->_cache = v15;
  }
  return v6;
}

- (void)_stopObserving
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263EFF458] object:0];
}

+ (id)appIdentifier
{
  if (_os_feature_enabled_impl()) {
    v2 = @"com.apple.NanoWorldClock";
  }
  else {
    v2 = 0;
  }

  return v2;
}

- (void)dealloc
{
  [(NSTimer *)self->_geocodeRequestDelayTimer invalidate];
  [(NWCSunriseComplicationBundleDataSource *)self _stopObserving];
  v3.receiver = self;
  v3.super_class = (Class)NWCSunriseComplicationBundleDataSource;
  [(NWCSunriseComplicationBundleDataSource *)&v3 dealloc];
}

+ (id)legacyNTKComplicationType
{
  return &unk_26EFF7138;
}

+ (id)localizedAppName
{
  return NWCComplicationLocalizedString(@"COMPLICATION_DISPLAY_NAME_SUNRISE", @"Display name for Sunrise complication.", 0);
}

+ (BOOL)hasMigratedToWidgetForFamily:(int64_t)a3 device:(id)a4
{
  v4 = (objc_class *)MEMORY[0x263F08C38];
  id v5 = a4;
  unsigned int v6 = (void *)[[v4 alloc] initWithUUIDString:@"CB0D11F9-5EA4-4B0F-B640-0D6D61FC7116"];
  char v7 = [v5 supportsCapability:v6];

  return v7;
}

- (void)fetchWidgetMigrationForDescriptor:(id)a3 family:(int64_t)a4 completion:(id)a5
{
  id v5 = (void (**)(id, void *))a5;
  unsigned int v6 = NTALogForCategory(7uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_23C352000, v6, OS_LOG_TYPE_DEFAULT, "Providing sunrise/sunset widget migration", v8, 2u);
  }

  char v7 = (void *)[objc_alloc(MEMORY[0x263EFD238]) initWithExtensionBundleIdentifier:@"com.apple.NanoWorldClock.WorldClockWidgetExtension" containerBundleIdentifier:@"com.apple.NanoWorldClock" kind:@"SunriseSunsetWidget" intent:0];
  v5[2](v5, v7);
}

- (void)becomeActive
{
  objc_initWeak(&location, self);
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  v8 = sub_23C359D7C;
  v9 = &unk_264E3D9D8;
  objc_copyWeak(&v10, &location);
  objc_super v3 = (void *)MEMORY[0x23ECE2850](&v6);
  v4 = objc_msgSend(sub_23C359B88(), "sharedLocationManager", v6, v7, v8, v9);
  id v5 = [v4 startLocationUpdatesWithIdentifier:@"ntk.sunriseComplicationDataSource" handler:v3];
  [(NWCSunriseComplicationBundleDataSource *)self setToken:v5];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)becomeInactive
{
  objc_super v3 = [(NWCSunriseComplicationBundleDataSource *)self token];

  if (v3)
  {
    v4 = [sub_23C359B88() sharedLocationManager];
    id v5 = [(NWCSunriseComplicationBundleDataSource *)self token];
    [v4 stopLocationUpdatesForToken:v5];

    [(NWCSunriseComplicationBundleDataSource *)self setToken:0];
  }
  [(NWCSunriseComplicationBundleDataSource *)self setGeocodeDelayedLocation:0];
  uint64_t v6 = [(NWCSunriseComplicationBundleDataSource *)self geocodeRequestDelayTimer];
  [v6 invalidate];

  [(NWCSunriseComplicationBundleDataSource *)self setGeocodeRequestDelayTimer:0];
  [(NWCSunriseComplicationBundleDataSource *)self setWaitingForGeocodeRequest:0];

  [(NWCSunriseComplicationBundleDataSource *)self setWaitingForChinaShiftingRequest:0];
}

- (id)currentSwitcherTemplate
{
  v2 = [(NWCSunriseComplicationBundleDataSource *)self _currentEntry:1];
  objc_super v3 = [v2 complicationTemplate];

  return v3;
}

- (void)getCurrentTimelineEntryWithHandler:(id)a3
{
  id v5 = a3;
  id v6 = [(NWCSunriseComplicationBundleDataSource *)self _currentEntry:0];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (void)getTimelineEndDateWithHandler:(id)a3
{
  v4 = (void (**)(id, id))a3;
  id v5 = [(NWCSunriseComplicationBundleDataSource *)self displayedLocation];
  if (v5)
  {
    id v6 = [MEMORY[0x263EFF910] distantFuture];
  }
  else
  {
    id v6 = 0;
  }

  v4[2](v4, v6);
}

- (void)getTimelineEntriesAfterDate:(id)a3 limit:(unint64_t)a4 withHandler:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = (void (**)(id, void *))a5;
  id v10 = [(NWCSunriseComplicationBundleDataSource *)self cache];
  uint64_t v11 = [v10 entryModelsAfterDate:v8 limit:a4];

  v12 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v11, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_super v18 = -[NWCSunriseComplicationBundleDataSource _timelineEntryFromEntry:](self, "_timelineEntryFromEntry:", *(void *)(*((void *)&v19 + 1) + 8 * v17), (void)v19);
        [v12 addObject:v18];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v15);
  }

  v9[2](v9, v12);
}

- (BOOL)supportsTapAction
{
  return _os_feature_enabled_impl();
}

- (void)getLaunchURLForTimelineEntryDate:(id)a3 timeTravelDate:(id)a4 withHandler:(id)a5
{
}

- (unint64_t)timelineAnimationBehavior
{
  return 1;
}

- (void)_invalidate
{
  objc_super v3 = [(NWCSunriseComplicationBundleDataSource *)self cache];
  [v3 invalidate];

  id v4 = [(CLKCComplicationDataSource *)self delegate];
  [v4 invalidateEntries];
}

- (id)_animationGroupForDate:(id)a3 showingSunrise:(BOOL)a4 constantSun:(int64_t)a5
{
  return (id)MEMORY[0x270F9A6D0](self, sel__animationGroupForDate_showingSunrise_constantSun_haveLocation_);
}

- (id)_animationGroupForDate:(id)a3 showingSunrise:(BOOL)a4 constantSun:(int64_t)a5 haveLocation:(BOOL)a6
{
  if (a6)
  {
    uint64_t v7 = @"sunset";
    if (a4) {
      uint64_t v7 = @"sunrise";
    }
    id v8 = [NSString stringWithFormat:@"%@.%@", v7, a3];
    if (a5)
    {
      uint64_t v9 = [@"constant." stringByAppendingString:v8];

      id v8 = (__CFString *)v9;
    }
  }
  else
  {
    id v8 = @"no.event";
  }

  return v8;
}

- (id)_animationGroupForNoLocation
{
  return (id)MEMORY[0x270F9A6D0](self, sel__animationGroupForDate_showingSunrise_constantSun_haveLocation_);
}

- (void)_startObserving
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__invalidate name:*MEMORY[0x263EFF458] object:0];
}

- (void)_geocodeRequestDelayTimerTriggerred
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if (self->_geocodeDelayedLocation)
  {
    if (![(NWCSunriseComplicationBundleDataSource *)self isWaitingForGeocodeRequest])
    {
      [(NWCSunriseComplicationBundleDataSource *)self setWaitingForGeocodeRequest:1];
      id v5 = [(NWCSunriseComplicationBundleDataSource *)self geocodeDelayedLocation];
      objc_initWeak(buf, self);
      uint64_t v8 = MEMORY[0x263EF8330];
      uint64_t v9 = 3221225472;
      id v10 = sub_23C35A54C;
      uint64_t v11 = &unk_264E3DA00;
      objc_copyWeak(&v13, buf);
      id v3 = v5;
      v12 = v3;
      id v6 = (void *)MEMORY[0x23ECE2850](&v8);
      uint64_t v7 = +[NWCComplicationGeocoder sharedGeocoder];
      [v7 placemarkForLocation:v3 handler:v6];

      objc_destroyWeak(&v13);
      objc_destroyWeak(buf);
      goto LABEL_9;
    }
    id v3 = NTALogForCategory(7uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      id v4 = "Reverse geocode delay timer was triggered, but we are already waiting for a reverse geocode response.";
LABEL_7:
      _os_log_impl(&dword_23C352000, v3, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)buf, 2u);
    }
  }
  else
  {
    id v3 = NTALogForCategory(7uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      id v4 = "Reverse geocode delay timer was triggered, but the delayed location is missing.";
      goto LABEL_7;
    }
  }
LABEL_9:
}

- (void)_handleLocation:(id)a3 error:(id)a4
{
  id v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if (v5)
  {
    id v6 = NTALogForCategory(7uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23C352000, v6, OS_LOG_TYPE_DEFAULT, "Received new location", buf, 2u);
    }

    if ([(NWCSunriseComplicationBundleDataSource *)self _needsToSendGeocodingRequest])
    {
      [(NWCSunriseComplicationBundleDataSource *)self setGeocodeDelayedLocation:v5];
      uint64_t v7 = NTALogForCategory(7uLL);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v14 = 0;
        _os_log_impl(&dword_23C352000, v7, OS_LOG_TYPE_DEFAULT, "For new location, check if we should start a geocode delay timer.", v14, 2u);
      }

      uint64_t v8 = [(NWCSunriseComplicationBundleDataSource *)self geocodeRequestDelayTimer];
      if (!v8
        || (uint64_t v9 = (void *)v8,
            [(NWCSunriseComplicationBundleDataSource *)self geocodeRequestDelayTimer],
            id v10 = objc_claimAutoreleasedReturnValue(),
            char v11 = [v10 isValid],
            v10,
            v9,
            (v11 & 1) == 0))
      {
        [(NWCSunriseComplicationBundleDataSource *)self _scheduleReverseGeocodeTimer:900.0];
        [(NWCSunriseComplicationBundleDataSource *)self _geocodeRequestDelayTimerTriggerred];
      }
    }
    if ([(NWCSunriseComplicationBundleDataSource *)self _needsToSendChinaLocationShiftRequest])
    {
      v12 = NTALogForCategory(7uLL);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v13 = 0;
        _os_log_impl(&dword_23C352000, v12, OS_LOG_TYPE_DEFAULT, "For new location, send a China location shifting request.", v13, 2u);
      }

      [(NWCSunriseComplicationBundleDataSource *)self _chinaLocationShiftRequest:v5];
    }
  }
  [(NWCSunriseComplicationBundleDataSource *)self setDisplayedLocation:v5];
  [(NWCSunriseComplicationBundleDataSource *)self _invalidate];
}

- (BOOL)_needsToSendGeocodingRequest
{
  int64_t v3 = [(CLKCComplicationDataSource *)self family];
  int v4 = _os_feature_enabled_impl();
  int v5 = v4;
  if (v3 == 1) {
    LOBYTE(v4) = 1;
  }
  if (v5 && v3 != 1) {
    LOBYTE(v4) = [(CLKCComplicationDataSource *)self family] == 11;
  }
  return v4;
}

- (void)_scheduleReverseGeocodeTimer:(double)a3
{
  id v4 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__geocodeRequestDelayTimerTriggerred selector:0 userInfo:0 repeats:a3];
  [(NWCSunriseComplicationBundleDataSource *)self setGeocodeRequestDelayTimer:v4];
}

- (BOOL)_needsToSendChinaLocationShiftRequest
{
  return [(CLKCComplicationDataSource *)self family] == 11;
}

- (void)_chinaLocationShiftRequest:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if (self->_waitingForChinaShiftingRequest)
  {
    int v5 = NTALogForCategory(7uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23C352000, v5, OS_LOG_TYPE_DEFAULT, "China location shift was triggered, but we are already waiting for a China location shift response.", buf, 2u);
    }
  }
  else
  {
    [v4 coordinate];
    double v7 = v6;
    [v4 coordinate];
    double v9 = v8;
    if ([MEMORY[0x263F417D8] isLocationShiftRequiredForCoordinate:v7])
    {
      if (qword_268BA3CE8 != -1) {
        dispatch_once(&qword_268BA3CE8, &unk_26EFF5958);
      }
      objc_initWeak(&location, self);
      id v10 = NTALogForCategory(7uLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v4;
        _os_log_impl(&dword_23C352000, v10, OS_LOG_TYPE_DEFAULT, "Kicking off asynchronous China location shift request for %@", buf, 0xCu);
      }

      self->_waitingForChinaShiftingRequest = 1;
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = sub_23C35AC40;
      v21[3] = &unk_264E3DA28;
      objc_copyWeak(&v23, &location);
      id v11 = v4;
      id v22 = v11;
      v12 = (void *)MEMORY[0x23ECE2850](v21);
      uint64_t v16 = MEMORY[0x263EF8330];
      uint64_t v17 = 3221225472;
      objc_super v18 = sub_23C35ADE0;
      long long v19 = &unk_264E3DA50;
      objc_copyWeak(&v20, &location);
      id v13 = (void *)MEMORY[0x23ECE2850](&v16);
      uint64_t v14 = (void *)qword_268BA3CE0;
      objc_msgSend(v11, "horizontalAccuracy", v16, v17, v18, v19);
      objc_msgSend(v14, "shiftCoordinate:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:", v12, 0, v13, MEMORY[0x263EF83A0], v7, v9, v15);

      objc_destroyWeak(&v20);
      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
    }
  }
}

- (id)_currentEntry:(BOOL)a3
{
  id v4 = objc_msgSend(MEMORY[0x263EFF910], "date", a3);
  int v5 = [MEMORY[0x263EFF8F0] calendarWithIdentifier:*MEMORY[0x263EFF3F8]];
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  double v6 = (void (*)(void))off_268BA3D10;
  id v22 = off_268BA3D10;
  if (!off_268BA3D10)
  {
    double v7 = (void *)sub_23C354468();
    v20[3] = (uint64_t)dlsym(v7, "NTKIdealizedDate");
    off_268BA3D10 = (_UNKNOWN *)v20[3];
    double v6 = (void (*)(void))v20[3];
  }
  _Block_object_dispose(&v19, 8);
  if (!v6)
  {
    uint64_t v17 = (_Unwind_Exception *)sub_23C35D2E0();
    _Block_object_dispose(&v19, 8);
    _Unwind_Resume(v17);
  }
  double v8 = v6();
  double v9 = [v5 components:30 fromDate:v8];

  [v9 setHour:19];
  [v9 setMinute:3];
  id v10 = [v5 dateFromComponents:v9];

  id v11 = NWCComplicationLocalizedString(@"LOCATION_NAME_DEFAULT", 0, 0);
  v12 = [NWCSunriseComplicationSunsetTimelineEntryModel alloc];
  id v13 = [(CLKCComplicationDataSource *)self device];
  LOBYTE(v18) = 0;
  uint64_t v14 = [(NWCSunriseComplicationTimelineEntryModel *)v12 initWithEntryDate:v4 eventDate:v10 atLocation:0 withDisplayName:v11 chinaShiftedLocation:0 constantSun:0 currentEvent:v18 animationGroup:0 device:v13];

  double v15 = [(NWCSunriseComplicationBundleDataSource *)self _timelineEntryFromEntry:v14];

  return v15;
}

- (id)_entryModelsForDate:(id)a3 nextEvaluationDate:(id *)a4
{
  id v80 = a3;
  double v6 = [(NWCSunriseComplicationBundleDataSource *)self displayedLocation];

  if (v6)
  {
    [(CLLocation *)self->_displayedLocation coordinate];
    double v8 = v7;
    [(CLLocation *)self->_displayedLocation coordinate];
    double v10 = v9;
    id v11 = [MEMORY[0x263F32100] transitInfoForDate:v80 location:v8];
    v12 = [MEMORY[0x263EFF8F0] currentCalendar];
    uint64_t v13 = [v11 day];
    uint64_t v14 = [v11 rise];
    if (v14)
    {
      double v15 = v14;
      uint64_t v16 = sub_23C35B800(v14);
    }
    else
    {
      uint64_t v16 = 0;
    }
    id v20 = [v11 set];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = sub_23C35B800(v20);
    }
    else
    {
      uint64_t v22 = 0;
    }
    uint64_t v23 = [v11 constantSun];
    if (v23) {
      BOOL v24 = 1;
    }
    else {
      BOOL v24 = v16 == 0;
    }
    BOOL v25 = v24 || v22 == 0;
    v79 = v12;
    v76 = (void *)v13;
    id v77 = v16;
    if (v25)
    {
      uint64_t v26 = v23;
      v75 = (void *)v22;
      uint64_t v27 = [(NWCSunriseComplicationBundleDataSource *)self _animationGroupForDate:v13 showingSunrise:v23 == 2 constantSun:v23];
      v28 = objc_opt_class();
      v29 = [(NWCSunriseComplicationBundleDataSource *)self displayedLocation];
      v30 = [(NWCSunriseComplicationBundleDataSource *)self locationName];
      v31 = [(NWCSunriseComplicationBundleDataSource *)self chinaShiftedLocation];
      v32 = [(CLKCComplicationDataSource *)self device];
      v78 = (void *)v27;
      uint64_t v18 = [v28 entryModelWithEntryDate:v13 eventDate:0 atLocation:v29 withDisplayName:v30 chinaShiftedLocation:v31 constantSun:v26 animationGroup:v27 device:v32];

      if (a4)
      {
        uint64_t v19 = 0;
        *a4 = 0;
LABEL_35:
        v45 = v79;
        goto LABEL_36;
      }
    }
    else
    {
      [v80 timeIntervalSinceDate:v16];
      double v34 = v33;
      [v80 timeIntervalSinceDate:v22];
      if (v34 < 0.0)
      {
        v73 = a4;
        v75 = (void *)v22;
        uint64_t v36 = [(NWCSunriseComplicationBundleDataSource *)self _animationGroupForDate:v16 showingSunrise:1 constantSun:0];
        v37 = [(NWCSunriseComplicationBundleDataSource *)self displayedLocation];
        v38 = [(NWCSunriseComplicationBundleDataSource *)self locationName];
        v39 = [(NWCSunriseComplicationBundleDataSource *)self chinaShiftedLocation];
        v40 = [(CLKCComplicationDataSource *)self device];
        v78 = (void *)v36;
        uint64_t v18 = +[NWCSunriseComplicationTimelineEntryModel entryModelWithEntryDate:v13 eventDate:v16 atLocation:v37 withDisplayName:v38 chinaShiftedLocation:v39 constantSun:0 animationGroup:v36 device:v40];

        uint64_t v19 = 0;
        if ([(NWCSunriseComplicationBundleDataSource *)self _needsCurrentEventEntry])
        {
          v41 = [(NWCSunriseComplicationBundleDataSource *)self displayedLocation];
          v42 = [(NWCSunriseComplicationBundleDataSource *)self locationName];
          v43 = [(NWCSunriseComplicationBundleDataSource *)self chinaShiftedLocation];
          v44 = [(CLKCComplicationDataSource *)self device];
          uint64_t v19 = +[NWCSunriseComplicationTimelineEntryModel currentEventEntryModelWithEntryAndEventDate:v16 atLocation:v41 withDisplayName:v42 chinaShiftedLocation:v43 constantSun:0 animationGroup:v36 device:v44];
        }
        v45 = v79;
        if (v73)
        {
          v46 = v16;
          id *v73 = v16;
LABEL_37:
          v52 = v75;
LABEL_38:

          goto LABEL_39;
        }
LABEL_36:
        v46 = v77;
        goto LABEL_37;
      }
      if (v35 < 0.0)
      {
        v74 = a4;
        uint64_t v47 = [v12 dateByAddingUnit:64 value:1 toDate:v16 options:0];
        uint64_t v48 = [(NWCSunriseComplicationBundleDataSource *)self _animationGroupForDate:v22 showingSunrise:0 constantSun:0];
        v49 = [(NWCSunriseComplicationBundleDataSource *)self displayedLocation];
        v50 = [(NWCSunriseComplicationBundleDataSource *)self locationName];
        v51 = [(NWCSunriseComplicationBundleDataSource *)self chinaShiftedLocation];
        [(CLKCComplicationDataSource *)self device];
        v53 = v52 = (void *)v22;
        v78 = (void *)v47;
        uint64_t v54 = v47;
        v55 = (void *)v48;
        uint64_t v18 = +[NWCSunriseComplicationTimelineEntryModel entryModelWithEntryDate:v54 eventDate:v52 atLocation:v49 withDisplayName:v50 chinaShiftedLocation:v51 constantSun:0 animationGroup:v48 device:v53];

        uint64_t v19 = 0;
        if ([(NWCSunriseComplicationBundleDataSource *)self _needsCurrentEventEntry])
        {
          v56 = [(NWCSunriseComplicationBundleDataSource *)self displayedLocation];
          v57 = [(NWCSunriseComplicationBundleDataSource *)self locationName];
          v58 = [(NWCSunriseComplicationBundleDataSource *)self chinaShiftedLocation];
          v59 = [(CLKCComplicationDataSource *)self device];
          uint64_t v19 = +[NWCSunriseComplicationTimelineEntryModel currentEventEntryModelWithEntryAndEventDate:v52 atLocation:v56 withDisplayName:v57 chinaShiftedLocation:v58 constantSun:0 animationGroup:v55 device:v59];
        }
        if (v74) {
          id *v74 = v52;
        }

        v46 = v16;
        v45 = v79;
        goto LABEL_38;
      }
      v75 = (void *)v22;
      uint64_t v60 = [v12 dateByAddingUnit:64 value:1 toDate:v22 options:0];
      v61 = [v12 dateByAddingUnit:16 value:1 toDate:v80 options:0];
      v62 = objc_msgSend(MEMORY[0x263F32100], "transitInfoForDate:location:", v61, v8, v10);
      v63 = [v62 rise];

      v64 = sub_23C35B800(v63);

      v65 = [(NWCSunriseComplicationBundleDataSource *)self _animationGroupForDate:v64 showingSunrise:1 constantSun:0];
      v66 = [(NWCSunriseComplicationBundleDataSource *)self displayedLocation];
      v67 = [(NWCSunriseComplicationBundleDataSource *)self locationName];
      v68 = [(NWCSunriseComplicationBundleDataSource *)self chinaShiftedLocation];
      v69 = [(CLKCComplicationDataSource *)self device];
      v78 = (void *)v60;
      uint64_t v18 = +[NWCSunriseComplicationTimelineEntryModel entryModelWithEntryDate:v60 eventDate:v64 atLocation:v66 withDisplayName:v67 chinaShiftedLocation:v68 constantSun:0 animationGroup:v65 device:v69];

      if (a4) {
        *a4 = 0;
      }
    }
    uint64_t v19 = 0;
    goto LABEL_35;
  }
  id v11 = [(NWCSunriseComplicationBundleDataSource *)self _animationGroupForNoLocation];
  uint64_t v17 = [(CLKCComplicationDataSource *)self device];
  uint64_t v18 = +[NWCSunriseComplicationTimelineEntryModel placeholderEntryModelWithEntryDate:v80 animationGroup:v11 device:v17];

  uint64_t v19 = 0;
  if (a4) {
    *a4 = 0;
  }
LABEL_39:

  v70 = objc_opt_new();
  [v70 addObject:v18];
  if (v19) {
    [v70 addObject:v19];
  }
  v71 = (void *)[v70 copy];

  return v71;
}

- (BOOL)_needsCurrentEventEntry
{
  BOOL v3 = [(CLKCComplicationDataSource *)self family] == 1
    || [(CLKCComplicationDataSource *)self family] == 3;
  int v4 = _os_feature_enabled_impl();
  BOOL result = v4 | v3;
  if (v4)
  {
    if (!v3) {
      return [(CLKCComplicationDataSource *)self family] == 11;
    }
  }
  return result;
}

- (id)_timelineEntryFromEntry:(id)a3
{
  id v4 = a3;
  int v5 = objc_msgSend(v4, "timelineEntryForComplicationFamily:", -[CLKCComplicationDataSource family](self, "family"));
  double v6 = [v4 animationGroup];

  [v5 setTimelineAnimationGroup:v6];

  return v5;
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (CLLocation)geocodeDelayedLocation
{
  return self->_geocodeDelayedLocation;
}

- (void)setGeocodeDelayedLocation:(id)a3
{
}

- (NSTimer)geocodeRequestDelayTimer
{
  return self->_geocodeRequestDelayTimer;
}

- (void)setGeocodeRequestDelayTimer:(id)a3
{
}

- (BOOL)waitingForChinaShiftingRequest
{
  return self->_waitingForChinaShiftingRequest;
}

- (void)setWaitingForChinaShiftingRequest:(BOOL)a3
{
  self->_waitingForChinaShiftingRequest = a3;
}

- (NWCComplicationTimelineEntryModelCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

- (CLLocation)displayedLocation
{
  return self->_displayedLocation;
}

- (void)setDisplayedLocation:(id)a3
{
}

- (NSString)locationName
{
  return self->_locationName;
}

- (void)setLocationName:(id)a3
{
}

- (CLLocation)chinaShiftedLocation
{
  return self->_chinaShiftedLocation;
}

- (void)setChinaShiftedLocation:(id)a3
{
}

- (BOOL)isWaitingForGeocodeRequest
{
  return self->_waitingForGeocodeRequest;
}

- (void)setWaitingForGeocodeRequest:(BOOL)a3
{
  self->_waitingForGeocodeRequest = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chinaShiftedLocation, 0);
  objc_storeStrong((id *)&self->_locationName, 0);
  objc_storeStrong((id *)&self->_displayedLocation, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_geocodeRequestDelayTimer, 0);
  objc_storeStrong((id *)&self->_geocodeDelayedLocation, 0);

  objc_storeStrong((id *)&self->_token, 0);
}

@end