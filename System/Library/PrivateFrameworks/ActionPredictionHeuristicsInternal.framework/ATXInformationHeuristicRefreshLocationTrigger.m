@interface ATXInformationHeuristicRefreshLocationTrigger
+ (BOOL)_locationIsStaleOrNotAccurateEnough:(id)a3 now:(id)a4;
+ (BOOL)supportsSecureCoding;
- (ATXInformationHeuristicRefreshLocationTrigger)initWithCoder:(id)a3;
- (ATXInformationHeuristicRefreshLocationTrigger)initWithEnteringLocation:(CLLocationCoordinate2D)a3 radiusInMeters:(double)a4;
- (ATXInformationHeuristicRefreshLocationTrigger)initWithExitingLocation:(CLLocationCoordinate2D)a3 radiusInMeters:(double)a4;
- (ATXInformationHeuristicRefreshLocationTrigger)initWithLocation:(CLLocationCoordinate2D)a3 notifyOnEntry:(BOOL)a4 notifyOnExit:(BOOL)a5 radiusInMeters:(double)a6;
- (ATXInformationHeuristicRefreshLocationTrigger)initWithLocationManager:(id)a3 regionToMonitor:(id)a4;
- (unint64_t)hash;
- (void)_run;
- (void)_start;
- (void)_stop;
- (void)encodeWithCoder:(id)a3;
- (void)updateWithInjectedLocationManager:(id)a3;
@end

@implementation ATXInformationHeuristicRefreshLocationTrigger

- (ATXInformationHeuristicRefreshLocationTrigger)initWithEnteringLocation:(CLLocationCoordinate2D)a3 radiusInMeters:(double)a4
{
  return -[ATXInformationHeuristicRefreshLocationTrigger initWithLocation:notifyOnEntry:notifyOnExit:radiusInMeters:](self, "initWithLocation:notifyOnEntry:notifyOnExit:radiusInMeters:", 1, 0, a3.latitude, a3.longitude, a4);
}

- (ATXInformationHeuristicRefreshLocationTrigger)initWithExitingLocation:(CLLocationCoordinate2D)a3 radiusInMeters:(double)a4
{
  return -[ATXInformationHeuristicRefreshLocationTrigger initWithLocation:notifyOnEntry:notifyOnExit:radiusInMeters:](self, "initWithLocation:notifyOnEntry:notifyOnExit:radiusInMeters:", 0, 1, a3.latitude, a3.longitude, a4);
}

- (ATXInformationHeuristicRefreshLocationTrigger)initWithLocation:(CLLocationCoordinate2D)a3 notifyOnEntry:(BOOL)a4 notifyOnExit:(BOOL)a5 radiusInMeters:(double)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  id v12 = objc_alloc(MEMORY[0x1E4F1E5A8]);
  v13 = [MEMORY[0x1E4F29128] UUID];
  v14 = [v13 UUIDString];
  v15 = objc_msgSend(v12, "initWithCenter:radius:identifier:", v14, latitude, longitude, a6);

  [v15 setNotifyOnEntry:v8];
  [v15 setNotifyOnExit:v7];
  v16 = [MEMORY[0x1E4F935D0] sharedInstance];
  v17 = [(ATXInformationHeuristicRefreshLocationTrigger *)self initWithLocationManager:v16 regionToMonitor:v15];

  return v17;
}

- (ATXInformationHeuristicRefreshLocationTrigger)initWithLocationManager:(id)a3 regionToMonitor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXInformationHeuristicRefreshLocationTrigger;
  v9 = [(ATXInformationHeuristicRefreshTrigger *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_locationManager, a3);
    objc_storeStrong((id *)&v10->_regionToMonitor, a4);
  }

  return v10;
}

- (void)updateWithInjectedLocationManager:(id)a3
{
}

- (void)_run
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [(ATXLocationManagerProtocol *)self->_locationManager getCurrentLocation];
  v4 = __atxlog_handle_gi();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v6 = [v3 description];
      int v14 = 138412290;
      v15 = v6;
      _os_log_impl(&dword_1D0F43000, v4, OS_LOG_TYPE_DEFAULT, "[Location] Received %@", (uint8_t *)&v14, 0xCu);
    }
    uint64_t v7 = objc_opt_class();
    id v8 = [MEMORY[0x1E4F1C9C8] now];
    LOBYTE(v7) = [(id)v7 _locationIsStaleOrNotAccurateEnough:v3 now:v8];

    if ((v7 & 1) == 0)
    {
      regionToMonitor = self->_regionToMonitor;
      [v3 coordinate];
      BOOL v10 = -[CLCircularRegion containsCoordinate:](regionToMonitor, "containsCoordinate:");
      if ([(CLCircularRegion *)self->_regionToMonitor notifyOnEntry]
        && self->_previouslyOutsideRegion
        && v10)
      {
        v11 = __atxlog_handle_gi();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v14) = 0;
          _os_log_impl(&dword_1D0F43000, v11, OS_LOG_TYPE_DEFAULT, "ATXInformationHeuristicRefreshLocationTrigger: Entering monitored region. Triggering heuristics refresh.", (uint8_t *)&v14, 2u);
        }
      }
      else
      {
        if (![(CLCircularRegion *)self->_regionToMonitor notifyOnExit]
          || !self->_previouslyInsideRegion
          || v10)
        {
          goto LABEL_20;
        }
        v11 = __atxlog_handle_gi();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v14) = 0;
          _os_log_impl(&dword_1D0F43000, v11, OS_LOG_TYPE_DEFAULT, "ATXInformationHeuristicRefreshLocationTrigger: Leaving monitored region. Triggering heuristics refresh.", (uint8_t *)&v14, 2u);
        }
      }

      objc_super v12 = [(ATXInformationHeuristicRefreshTrigger *)self delegate];
      v13 = [(ATXInformationHeuristicRefreshTrigger *)self registeredHeuristics];
      [v12 informationHeuristicRefreshTrigger:self didTriggerRefreshForHeuristics:v13];

LABEL_20:
      self->_previouslyInsideRegion = v10;
      self->_previouslyOutsideRegion = !v10;
    }
  }
  else
  {
    if (v5)
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1D0F43000, v4, OS_LOG_TYPE_DEFAULT, "[Location] Nil location received. Ignoring trigger.", (uint8_t *)&v14, 2u);
    }
  }
}

- (void)_start
{
  self->_previouslyInsideRegion = 0;
  self->_previouslyOutsideRegion = 0;
  if (!self->_token)
  {
    objc_initWeak(&location, self);
    v3 = (void *)MEMORY[0x1E4FB36C8];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __55__ATXInformationHeuristicRefreshLocationTrigger__start__block_invoke;
    v6[3] = &unk_1E68A5150;
    objc_copyWeak(&v7, &location);
    v4 = [v3 registerForSuggestedActionNudgeOfType:5 withOptions:0 block:v6];
    id token = self->_token;
    self->_id token = v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __55__ATXInformationHeuristicRefreshLocationTrigger__start__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _run];
  }
  else
  {
    v3 = __atxlog_handle_gi();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __55__ATXInformationHeuristicRefreshLocationTrigger__start__block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

+ (BOOL)_locationIsStaleOrNotAccurateEnough:(id)a3 now:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 timestamp];
  [v6 timeIntervalSinceDate:v7];
  double v9 = v8;

  if (v9 <= 900.0)
  {
    [v5 horizontalAccuracy];
    if (v12 <= 200.0)
    {
      BOOL v14 = 0;
      goto LABEL_10;
    }
    uint64_t v10 = __atxlog_handle_gi();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      [v5 horizontalAccuracy];
      int v16 = 134217984;
      double v17 = v13;
      v11 = "[Location] Uncertainty too large, horizontalAccuracy, %f. Ignoring trigger.";
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v10 = __atxlog_handle_gi();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 134217984;
      double v17 = v9;
      v11 = "[Location] Location is stale. Age: %f. Ignoring trigger.";
LABEL_7:
      _os_log_impl(&dword_1D0F43000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v16, 0xCu);
    }
  }

  BOOL v14 = 1;
LABEL_10:

  return v14;
}

- (void)_stop
{
  if (self->_token) {
    objc_msgSend(MEMORY[0x1E4FB36C8], "unregisterForSuggestedActionNudgeOfType:");
  }
}

- (unint64_t)hash
{
  return (unint64_t)self->_regionToMonitor;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ATXInformationHeuristicRefreshLocationTrigger;
  id v4 = a3;
  [(ATXInformationHeuristicRefreshTrigger *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_regionToMonitor, @"regionToMonitor", v5.receiver, v5.super_class);
}

- (ATXInformationHeuristicRefreshLocationTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"regionToMonitor"];
  id v6 = [v4 error];

  uint64_t v7 = 0;
  if (!v6 && v5)
  {
    double v8 = [MEMORY[0x1E4F935D0] sharedInstance];
    self = [(ATXInformationHeuristicRefreshLocationTrigger *)self initWithLocationManager:v8 regionToMonitor:v5];

    uint64_t v7 = self;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_token, 0);
  objc_storeStrong((id *)&self->_regionToMonitor, 0);

  objc_storeStrong((id *)&self->_locationManager, 0);
}

void __55__ATXInformationHeuristicRefreshLocationTrigger__start__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end