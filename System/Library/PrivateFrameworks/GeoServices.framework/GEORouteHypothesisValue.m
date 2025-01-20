@interface GEORouteHypothesisValue
+ (BOOL)supportsSecureCoding;
- (BOOL)aggresiveArrivalIsAfterExpiration;
- (BOOL)canBePersistedToDisk;
- (BOOL)isStaleToPurgeFromDisk;
- (BOOL)isStaleToRefresh;
- (BOOL)prediction;
- (GEOComposedWaypoint)destination;
- (GEOComposedWaypoint)origin;
- (GEOMapServiceTraits)traits;
- (GEORouteAttributes)routeAttributes;
- (GEORouteHypothesis)currentHypothesis;
- (GEORouteHypothesisMonitor)monitor;
- (GEORouteHypothesisValue)initWithCoder:(id)a3;
- (GEORouteHypothesisValue)initWithSource:(id)a3 toDestination:(id)a4 arrivalDate:(id)a5 expirationDate:(id)a6 traceName:(id)a7 traits:(id)a8 routeAttributes:(id)a9 clientInfo:(id)a10;
- (NSDate)arrivalDate;
- (NSDate)expirationDate;
- (double)updatedTimeStamp;
- (double)valueRefreshTimeStamp;
- (id)description;
- (int)transportType;
- (int64_t)rowId;
- (void)commonInit;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrentHypothesis:(id)a3;
- (void)setPrediction:(BOOL)a3;
- (void)setRouteAttributes:(id)a3;
- (void)setRowId:(int64_t)a3;
- (void)setUpdatedTimeStamp:(double)a3;
- (void)setValueRefreshTimeStamp:(double)a3;
@end

@implementation GEORouteHypothesisValue

- (GEORouteHypothesisValue)initWithSource:(id)a3 toDestination:(id)a4 arrivalDate:(id)a5 expirationDate:(id)a6 traceName:(id)a7 traits:(id)a8 routeAttributes:(id)a9 clientInfo:(id)a10
{
  id v28 = a3;
  id v27 = a4;
  id v26 = a5;
  id v25 = a6;
  id v29 = a7;
  id v24 = a8;
  id v17 = a9;
  id v18 = a10;
  v30.receiver = self;
  v30.super_class = (Class)GEORouteHypothesisValue;
  v19 = [(GEORouteHypothesisValue *)&v30 init];
  v20 = v19;
  if (v19)
  {
    [(GEORouteHypothesisValue *)v19 commonInit];
    v20->_updatedTimeStamp = CFAbsoluteTimeGetCurrent();
    objc_storeStrong((id *)&v20->_origin, a3);
    objc_storeStrong((id *)&v20->_destination, a4);
    v20->_transportType = [v17 mainTransportType];
    objc_storeStrong((id *)&v20->_routeAttributes, a9);
    objc_storeStrong((id *)&v20->_arrivalDate, a5);
    objc_storeStrong((id *)&v20->_expirationDate, a6);
    objc_storeStrong((id *)&v20->_traits, a8);
    uint64_t v21 = +[GEORouteHypothesisMonitor monitorWithSource:v20->_origin toDestination:v20->_destination traceName:v29 traits:v20->_traits routeAttributes:v20->_routeAttributes clientInfo:v18];
    monitor = v20->_monitor;
    v20->_monitor = (GEORouteHypothesisMonitor *)v21;

    v20->_prediction = 0;
  }

  return v20;
}

- (GEORouteHypothesisValue)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)GEORouteHypothesisValue;
  v5 = [(GEORouteHypothesisValue *)&v26 init];
  v6 = v5;
  if (v5)
  {
    [(GEORouteHypothesisValue *)v5 commonInit];
    [v4 decodeDoubleForKey:@"UpdatedTimeStampKey"];
    v6->_updatedTimeStamp = v7;
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"OriginKey"];
    origin = v6->_origin;
    v6->_origin = (GEOComposedWaypoint *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DestinationKey"];
    destination = v6->_destination;
    v6->_destination = (GEOComposedWaypoint *)v10;

    v6->_transportType = [v4 decodeInt32ForKey:@"TransportTypeKey"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ArrivalDateKey"];
    arrivalDate = v6->_arrivalDate;
    v6->_arrivalDate = (NSDate *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ExpirationDateKey"];
    expirationDate = v6->_expirationDate;
    v6->_expirationDate = (NSDate *)v14;

    v6->_prediction = [v4 decodeBoolForKey:@"PredictionKey"];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TraitsKey"];
    traits = v6->_traits;
    v6->_traits = (GEOMapServiceTraits *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MonitorKey"];
    monitor = v6->_monitor;
    v6->_monitor = (GEORouteHypothesisMonitor *)v18;

    uint64_t v20 = [(GEORouteHypothesisMonitor *)v6->_monitor hypothesis];
    currentHypothesis = v6->_currentHypothesis;
    v6->_currentHypothesis = (GEORouteHypothesis *)v20;

    [v4 decodeDoubleForKey:@"ValueRefreshTimeStampKey"];
    v6->_valueRefreshTimeStamp = v22;
    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RouteAttributes"];
    routeAttributes = v6->_routeAttributes;
    v6->_routeAttributes = (GEORouteAttributes *)v23;
  }
  return v6;
}

- (void)commonInit
{
  self->_rowId = -1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeDouble:@"UpdatedTimeStampKey" forKey:self->_updatedTimeStamp];
  [v4 encodeObject:self->_origin forKey:@"OriginKey"];
  [v4 encodeObject:self->_destination forKey:@"DestinationKey"];
  objc_msgSend(v4, "encodeInt32:forKey:", -[GEORouteHypothesisValue transportType](self, "transportType"), @"TransportTypeKey");
  [v4 encodeObject:self->_arrivalDate forKey:@"ArrivalDateKey"];
  [v4 encodeObject:self->_expirationDate forKey:@"ExpirationDateKey"];
  [v4 encodeBool:self->_prediction forKey:@"PredictionKey"];
  [v4 encodeObject:self->_traits forKey:@"TraitsKey"];
  [v4 encodeObject:self->_monitor forKey:@"MonitorKey"];
  [v4 encodeDouble:@"ValueRefreshTimeStampKey" forKey:self->_valueRefreshTimeStamp];
  [v4 encodeObject:self->_routeAttributes forKey:@"RouteAttributes"];
}

- (BOOL)aggresiveArrivalIsAfterExpiration
{
  if (!self->_expirationDate) {
    return 0;
  }
  v3 = (void *)MEMORY[0x1E4F1C9C8];
  [(GEORouteHypothesis *)self->_currentHypothesis aggressiveTravelTime];
  id v4 = objc_msgSend(v3, "dateWithTimeIntervalSinceNow:");
  BOOL v5 = [v4 compare:self->_expirationDate] == 1;

  return v5;
}

- (BOOL)isStaleToRefresh
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_currentHypothesis)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    double updatedTimeStamp = self->_updatedTimeStamp;
    BOOL v5 = +[GEONavdDefaults sharedInstance];
    [v5 hypothesisResponseStaleToRefreshThresholdInSeconds];
    BOOL v7 = Current - updatedTimeStamp > v6;
  }
  else
  {
    BOOL v7 = 1;
  }
  uint64_t v8 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORouteHypothesisCache");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = @"no";
    if (v7) {
      v9 = @"yes";
    }
    int v11 = 138478083;
    uint64_t v12 = v9;
    __int16 v13 = 2113;
    uint64_t v14 = self;
    _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_DEBUG, "isStaleToRefresh: %{private}@ value: %{private}@", (uint8_t *)&v11, 0x16u);
  }

  return v7;
}

- (BOOL)isStaleToPurgeFromDisk
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  double Current = CFAbsoluteTimeGetCurrent();
  double updatedTimeStamp = self->_updatedTimeStamp;
  BOOL v5 = +[GEONavdDefaults sharedInstance];
  [v5 hypothesisResponseStaleToPurgeFromDiskThresholdInSeconds];
  double v7 = v6;

  uint64_t v8 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORouteHypothesisCache");
  double v9 = Current - updatedTimeStamp;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = @"no";
    if (v9 > v7) {
      uint64_t v10 = @"yes";
    }
    int v12 = 138478083;
    __int16 v13 = v10;
    __int16 v14 = 2113;
    uint64_t v15 = self;
    _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_DEBUG, "isStaleToPurgeFromDisk: %{private}@ value: %{private}@", (uint8_t *)&v12, 0x16u);
  }

  return v9 > v7;
}

- (BOOL)canBePersistedToDisk
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (self->_prediction)
  {
    v3 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORouteHypothesisCache");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      int v18 = 138478083;
      v19 = @"no";
      __int16 v20 = 2113;
      uint64_t v21 = self;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "canBePersistedToDisk: %{private}@ value: %{private}@", (uint8_t *)&v18, 0x16u);
    }
    LOBYTE(v4) = 0;
  }
  else
  {
    arrivalDate = self->_arrivalDate;
    if (arrivalDate)
    {
      [(NSDate *)arrivalDate timeIntervalSinceReferenceDate];
      double v7 = v6;
      double Current = CFAbsoluteTimeGetCurrent();
      [(NSDate *)self->_arrivalDate timeIntervalSinceReferenceDate];
      double v10 = v9;
      double v11 = CFAbsoluteTimeGetCurrent();
      int v12 = +[GEONavdDefaults sharedInstance];
      [v12 hypothesisShouldPersistThresholdInSeconds];
      if (v7 - Current >= 0.0) {
        double v14 = v10 - v11;
      }
      else {
        double v14 = -(v10 - v11);
      }
      BOOL v4 = v14 < v13;
    }
    else
    {
      BOOL v4 = 0;
    }
    if ([(GEORouteHypothesisValue *)self aggresiveArrivalIsAfterExpiration])
    {
      uint64_t v15 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORouteHypothesisCache");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_188D96000, v15, OS_LOG_TYPE_INFO, "Arrival is after expiration, so we will no longer persist this entry.", (uint8_t *)&v18, 2u);
      }

      BOOL v4 = 0;
    }
    v3 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORouteHypothesisCache");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v16 = @"no";
      if (v4) {
        uint64_t v16 = @"yes";
      }
      int v18 = 138478083;
      v19 = v16;
      __int16 v20 = 2113;
      uint64_t v21 = self;
      _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "canBePersistedToDisk: %{private}@ value: %{private}@", (uint8_t *)&v18, 0x16u);
    }
  }

  return v4;
}

- (int)transportType
{
  routeAttributes = self->_routeAttributes;
  if (routeAttributes) {
    return [(GEORouteAttributes *)routeAttributes mainTransportType];
  }
  else {
    return self->_transportType;
  }
}

- (id)description
{
  v3 = NSString;
  BOOL v4 = [(GEOComposedWaypoint *)self->_destination latLng];
  [v4 lat];
  uint64_t v6 = v5;
  double v7 = [(GEOComposedWaypoint *)self->_destination latLng];
  [v7 lng];
  uint64_t v9 = v8;
  double v10 = [MEMORY[0x1E4F28C10] localizedStringFromDate:self->_arrivalDate dateStyle:1 timeStyle:1];
  uint64_t v11 = [(GEORouteHypothesisValue *)self transportType];
  if (v11 >= 7)
  {
    int v12 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v11);
  }
  else
  {
    int v12 = *(&off_1E53E9DA0 + (int)v11);
  }
  double v13 = (void *)MEMORY[0x1E4F28C10];
  double v14 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_updatedTimeStamp];
  uint64_t v15 = [v13 localizedStringFromDate:v14 dateStyle:1 timeStyle:1];
  uint64_t v16 = [(GEORouteHypothesis *)self->_currentHypothesis description];
  id v17 = [v3 stringWithFormat:@"[ Destination: (%f,%f) | Arrival Date: %@ | TransportType: %@ | Updated TimeStamp: %@ | Hypothesis: %@ ]", v6, v9, v10, v12, v15, v16];

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEORouteHypothesisMonitor)monitor
{
  return self->_monitor;
}

- (GEORouteHypothesis)currentHypothesis
{
  return self->_currentHypothesis;
}

- (void)setCurrentHypothesis:(id)a3
{
}

- (BOOL)prediction
{
  return self->_prediction;
}

- (void)setPrediction:(BOOL)a3
{
  self->_prediction = a3;
}

- (double)updatedTimeStamp
{
  return self->_updatedTimeStamp;
}

- (void)setUpdatedTimeStamp:(double)a3
{
  self->_double updatedTimeStamp = a3;
}

- (GEOComposedWaypoint)origin
{
  return self->_origin;
}

- (GEOComposedWaypoint)destination
{
  return self->_destination;
}

- (NSDate)arrivalDate
{
  return self->_arrivalDate;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (GEORouteAttributes)routeAttributes
{
  return self->_routeAttributes;
}

- (void)setRouteAttributes:(id)a3
{
}

- (double)valueRefreshTimeStamp
{
  return self->_valueRefreshTimeStamp;
}

- (void)setValueRefreshTimeStamp:(double)a3
{
  self->_valueRefreshTimeStamp = a3;
}

- (int64_t)rowId
{
  return self->_rowId;
}

- (void)setRowId:(int64_t)a3
{
  self->_rowId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_arrivalDate, 0);
  objc_storeStrong((id *)&self->_routeAttributes, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_origin, 0);
  objc_storeStrong((id *)&self->_currentHypothesis, 0);

  objc_storeStrong((id *)&self->_monitor, 0);
}

@end