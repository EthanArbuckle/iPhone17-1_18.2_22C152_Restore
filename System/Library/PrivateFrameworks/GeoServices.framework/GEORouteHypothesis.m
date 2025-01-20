@interface GEORouteHypothesis
+ (BOOL)supportsSecureCoding;
+ (BOOL)supportsTravelState:(int64_t)a3 forTransportType:(int)a4;
+ (id)_routeHypothesisErrorWithUnderlyingError:(id)a3;
- (BOOL)supportsLiveTraffic;
- (GEOLocation)lastLocation;
- (GEORouteHypothesis)initWithCoder:(id)a3;
- (NSDate)aggressiveDepartureDate;
- (NSDate)conservativeDepartureDate;
- (NSDate)generationDate;
- (NSDate)suggestedDepartureDate;
- (NSError)error;
- (NSString)routeName;
- (NSString)trafficDensityDescription;
- (double)aggressiveTravelTime;
- (double)conservativeTravelTime;
- (double)estimatedTravelTime;
- (id)description;
- (int)transportType;
- (int64_t)travelState;
- (unint64_t)currentTrafficDensity;
- (unint64_t)historicTrafficDensity;
- (void)_clearHypothesisAndSetErrorWithCode:(int64_t)a3;
- (void)_setError:(id)a3;
- (void)_updateCurrentTrafficDensity:(double)a3 staticTravelTime:(double)a4;
- (void)_updateDepartureAndArrivalSuggestionsForArrivalDate:(id)a3 travelTimeWithTraffic:(double)a4 conservativeTravelTime:(double)a5 aggressiveTravelTime:(double)a6 transportType:(int)a7;
- (void)_updateHistoricTrafficDensity:(double)a3 staticTravelTime:(double)a4;
- (void)_updateTrafficDensityDescription:(id)a3;
- (void)_updateTravelStateHasArrived:(BOOL)a3 isTraveling:(BOOL)a4 travelScore:(double)a5 isNavigating:(BOOL)a6 isNavigatingToDestination:(BOOL)a7;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setLastLocation:(id)a3;
- (void)setRouteName:(id)a3;
- (void)setSupportsLiveTraffic:(BOOL)a3;
@end

@implementation GEORouteHypothesis

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  trafficDensityDescription = self->_trafficDensityDescription;
  self->_trafficDensityDescription = 0;

  v4.receiver = self;
  v4.super_class = (Class)GEORouteHypothesis;
  [(GEORouteHypothesis *)&v4 dealloc];
}

- (GEORouteHypothesis)initWithCoder:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)GEORouteHypothesis;
  v5 = [(GEORouteHypothesis *)&v34 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"GEORouteHypothesisGenerationDateKey"];
    generationDate = v5->_generationDate;
    v5->_generationDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"GEORouteHypothesisLastLocationKey"];
    lastLocation = v5->_lastLocation;
    v5->_lastLocation = (GEOLocation *)v8;

    v5->_transportType = [v4 decodeIntegerForKey:@"GEORouteHypothesisTransportTypeKey"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"GEORouteHypothesisSuggestedDepartureDateKey"];
    suggestedDepartureDate = v5->_suggestedDepartureDate;
    v5->_suggestedDepartureDate = (NSDate *)v10;

    [v4 decodeDoubleForKey:@"GEORouteHypothesisEstimatedTravelTimeKey"];
    v5->_estimatedTravelTime = v12;
    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"GEORouteHypothesisCurrentTrafficDensityKey"];
    v5->_currentTrafficDensity = [v13 unsignedIntegerValue];

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"GEORouteHypothesisHistoricTrafficDensityKey"];
    v5->_historicTrafficDensity = [v14 unsignedIntegerValue];

    v5->_travelState = [v4 decodeIntegerForKey:@"GEORouteHypothesisTravelStateKey"];
    v5->_supportsLiveTraffic = [v4 decodeBoolForKey:@"GEORouteHypothesisLiveTrafficKey"];
    v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v15, "setWithObjects:", v16, v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"GEORouteHypothesisErrorKey"];
    error = v5->_error;
    v5->_error = (NSError *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"GEORouteHypothesisConservativeDepartureDateKey"];
    conservativeDepartureDate = v5->_conservativeDepartureDate;
    v5->_conservativeDepartureDate = (NSDate *)v21;

    [v4 decodeDoubleForKey:@"GEORouteHypothesisConservativeTravelTimeKey"];
    v5->_conservativeTravelTime = v23;
    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"GEORouteHypothesisAggressiveDepartureDateKey"];
    aggressiveDepartureDate = v5->_aggressiveDepartureDate;
    v5->_aggressiveDepartureDate = (NSDate *)v24;

    [v4 decodeDoubleForKey:@"GEORouteHypothesisAggressiveTravelTimeKey"];
    v5->_aggressiveTravelTime = v26;
    v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"GEORouteHypothesisRouteNameKey"];
    uint64_t v28 = [v27 copy];
    routeName = v5->_routeName;
    v5->_routeName = (NSString *)v28;

    v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"GEORouteHypothesisTrafficDensityDescriptionKey"];
    uint64_t v31 = [v30 copy];
    trafficDensityDescription = v5->_trafficDensityDescription;
    v5->_trafficDensityDescription = (NSString *)v31;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(GEORouteHypothesis *)self generationDate];
  [v4 encodeObject:v5 forKey:@"GEORouteHypothesisGenerationDateKey"];

  uint64_t v6 = [(GEORouteHypothesis *)self lastLocation];
  [v4 encodeObject:v6 forKey:@"GEORouteHypothesisLastLocationKey"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[GEORouteHypothesis transportType](self, "transportType"), @"GEORouteHypothesisTransportTypeKey");
  v7 = [(GEORouteHypothesis *)self suggestedDepartureDate];
  [v4 encodeObject:v7 forKey:@"GEORouteHypothesisSuggestedDepartureDateKey"];

  [(GEORouteHypothesis *)self estimatedTravelTime];
  objc_msgSend(v4, "encodeDouble:forKey:", @"GEORouteHypothesisEstimatedTravelTimeKey");
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[GEORouteHypothesis currentTrafficDensity](self, "currentTrafficDensity"));
  [v4 encodeObject:v8 forKey:@"GEORouteHypothesisCurrentTrafficDensityKey"];

  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[GEORouteHypothesis historicTrafficDensity](self, "historicTrafficDensity"));
  [v4 encodeObject:v9 forKey:@"GEORouteHypothesisHistoricTrafficDensityKey"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[GEORouteHypothesis travelState](self, "travelState"), @"GEORouteHypothesisTravelStateKey");
  objc_msgSend(v4, "encodeBool:forKey:", -[GEORouteHypothesis supportsLiveTraffic](self, "supportsLiveTraffic"), @"GEORouteHypothesisLiveTrafficKey");
  uint64_t v10 = [(GEORouteHypothesis *)self error];
  [v4 encodeObject:v10 forKey:@"GEORouteHypothesisErrorKey"];

  v11 = [(GEORouteHypothesis *)self conservativeDepartureDate];
  [v4 encodeObject:v11 forKey:@"GEORouteHypothesisConservativeDepartureDateKey"];

  [(GEORouteHypothesis *)self conservativeTravelTime];
  objc_msgSend(v4, "encodeDouble:forKey:", @"GEORouteHypothesisConservativeTravelTimeKey");
  double v12 = [(GEORouteHypothesis *)self aggressiveDepartureDate];
  [v4 encodeObject:v12 forKey:@"GEORouteHypothesisAggressiveDepartureDateKey"];

  [(GEORouteHypothesis *)self aggressiveTravelTime];
  objc_msgSend(v4, "encodeDouble:forKey:", @"GEORouteHypothesisAggressiveTravelTimeKey");
  v13 = [(GEORouteHypothesis *)self routeName];
  [v4 encodeObject:v13 forKey:@"GEORouteHypothesisRouteNameKey"];

  id v14 = [(GEORouteHypothesis *)self trafficDensityDescription];
  [v4 encodeObject:v14 forKey:@"GEORouteHypothesisTrafficDensityDescriptionKey"];
}

- (void)setLastLocation:(id)a3
{
}

- (void)setSupportsLiveTraffic:(BOOL)a3
{
  self->_supportsLiveTraffic = a3;
}

- (void)setRouteName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  routeName = self->_routeName;
  self->_routeName = v4;
}

- (NSString)trafficDensityDescription
{
  trafficDensityDescription = self->_trafficDensityDescription;
  if (trafficDensityDescription)
  {
    v3 = trafficDensityDescription;
  }
  else
  {
    unint64_t currentTrafficDensity = self->_currentTrafficDensity;
    if (currentTrafficDensity > 3) {
      v3 = @"unknown";
    }
    else {
      v3 = off_1E53ED9B0[currentTrafficDensity];
    }
  }

  return (NSString *)v3;
}

- (void)_updateDepartureAndArrivalSuggestionsForArrivalDate:(id)a3 travelTimeWithTraffic:(double)a4 conservativeTravelTime:(double)a5 aggressiveTravelTime:(double)a6 transportType:(int)a7
{
  id v12 = a3;
  v13 = [MEMORY[0x1E4F1C9C8] date];
  generationDate = self->_generationDate;
  self->_generationDate = v13;

  self->_transportType = a7;
  self->_double estimatedTravelTime = a4;
  if (a4 == 0.0
    || a5 == 0.0
    || a6 == 0.0
    || (+[GEONavdDefaults sharedInstance],
        v15 = objc_claimAutoreleasedReturnValue(),
        int v16 = [v15 shouldUseServerSideETAs],
        v15,
        !v16))
  {
    v18 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORouteHypothesizer");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v41 = 0;
      _os_log_impl(&dword_188D96000, v18, OS_LOG_TYPE_DEBUG, "Server did not provide aggressive and conservative ETAs (or default overroad them), doing local calculation.", v41, 2u);
    }

    if (self->_transportType == 2)
    {
      uint64_t v19 = +[GEONavdDefaults sharedInstance];
      [v19 averageWalkingSpeed];
      double v21 = v20;
      v22 = +[GEONavdDefaults sharedInstance];
      [v22 slowWalkingSpeed];
      double v24 = v21 / v23;

      v25 = +[GEONavdDefaults sharedInstance];
      [v25 averageWalkingSpeed];
      double v27 = v26;
      uint64_t v28 = +[GEONavdDefaults sharedInstance];
      [v28 fastWalkingSpeed];
      double v30 = v27 / v29;

      double estimatedTravelTime = self->_estimatedTravelTime;
      self->_conservativeTravelTime = v24 * estimatedTravelTime;
      a6 = v30 * estimatedTravelTime;
    }
    else
    {
      a6 = self->_estimatedTravelTime;
      self->_conservativeTravelTime = a6;
    }
  }
  else
  {
    uint64_t v17 = GEOFindOrCreateLog("com.apple.GeoServices", "GEORouteHypothesizer");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v17, OS_LOG_TYPE_DEBUG, "Using server provided aggressive and conservative ETAs.", buf, 2u);
    }

    self->_conservativeTravelTime = a5;
  }
  self->_aggressiveTravelTime = a6;
  suggestedDepartureDate = self->_suggestedDepartureDate;
  self->_suggestedDepartureDate = 0;

  conservativeDepartureDate = self->_conservativeDepartureDate;
  self->_conservativeDepartureDate = 0;

  aggressiveDepartureDate = self->_aggressiveDepartureDate;
  self->_aggressiveDepartureDate = 0;

  if (v12)
  {
    v35 = (NSDate *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeInterval:v12 sinceDate:-self->_estimatedTravelTime];
    v36 = self->_suggestedDepartureDate;
    self->_suggestedDepartureDate = v35;

    v37 = (NSDate *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeInterval:v12 sinceDate:-self->_conservativeTravelTime];
    v38 = self->_conservativeDepartureDate;
    self->_conservativeDepartureDate = v37;

    v39 = (NSDate *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeInterval:v12 sinceDate:-self->_aggressiveTravelTime];
    v40 = self->_aggressiveDepartureDate;
    self->_aggressiveDepartureDate = v39;
  }
}

- (void)_updateCurrentTrafficDensity:(double)a3 staticTravelTime:(double)a4
{
  double v7 = pow(a4, 1.7) * 0.000167 + 300.0;
  if (v7 + a4 <= a3)
  {
    if (a4 + v7 * 2.0 <= a3)
    {
      unint64_t v8 = 3;
      if (a4 + v7 * 3.0 > a3) {
        unint64_t v8 = 2;
      }
    }
    else
    {
      unint64_t v8 = 1;
    }
  }
  else
  {
    unint64_t v8 = 0;
  }
  self->_unint64_t currentTrafficDensity = v8;
}

- (void)_updateHistoricTrafficDensity:(double)a3 staticTravelTime:(double)a4
{
  double v7 = pow(a4, 1.7) * 0.000167 + 300.0;
  if (v7 + a4 <= a3)
  {
    if (a4 + v7 * 2.0 <= a3)
    {
      unint64_t v8 = 3;
      if (a4 + v7 * 3.0 > a3) {
        unint64_t v8 = 2;
      }
    }
    else
    {
      unint64_t v8 = 1;
    }
  }
  else
  {
    unint64_t v8 = 0;
  }
  self->_historicTrafficDensity = v8;
}

- (void)_updateTrafficDensityDescription:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  trafficDensityDescription = self->_trafficDensityDescription;
  self->_trafficDensityDescription = v4;
}

- (void)_updateTravelStateHasArrived:(BOOL)a3 isTraveling:(BOOL)a4 travelScore:(double)a5 isNavigating:(BOOL)a6 isNavigatingToDestination:(BOOL)a7
{
  if (a7)
  {
    int64_t v8 = 2;
LABEL_14:
    self->_travelState = v8;
    return;
  }
  if (a3) {
    int64_t v8 = 5;
  }
  else {
    int64_t v8 = 0;
  }
  if (a4 && !a3)
  {
    uint64_t v9 = 4;
    if (a5 > 0.0) {
      uint64_t v9 = 1;
    }
    if (a5 <= 0.6) {
      int64_t v8 = v9;
    }
    else {
      int64_t v8 = 3;
    }
  }
  if (+[GEORouteHypothesis supportsTravelState:forTransportType:](GEORouteHypothesis, "supportsTravelState:forTransportType:", v8, self->_transportType, a6, a5))
  {
    goto LABEL_14;
  }
}

+ (id)_routeHypothesisErrorWithUnderlyingError:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v3 = a3;
    uint64_t v4 = [v3 code];
    BOOL v5 = (unint64_t)(v4 + 13) > 7 || ((1 << (v4 + 13)) & 0xCB) == 0;
    if (!v5 || v4 == -402) {
      uint64_t v6 = -1501;
    }
    else {
      uint64_t v6 = -1500;
    }
    uint64_t v10 = *MEMORY[0x1E4F28A50];
    v11[0] = v3;
    double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    int64_t v8 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:v6 userInfo:v7];
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

+ (BOOL)supportsTravelState:(int64_t)a3 forTransportType:(int)a4
{
  BOOL v5 = a3 == 5 || a3 == 0;
  return a4 != 1 || v5;
}

- (void)_setError:(id)a3
{
  id v10 = a3;
  error = self->_error;
  self->_error = 0;

  BOOL v5 = GEOErrorDomain();
  uint64_t v6 = [v10 domain];
  if ([v5 isEqualToString:v6])
  {
    if ([v10 code] == -1501)
    {

LABEL_6:
      int64_t v8 = (NSError *)v10;
      goto LABEL_8;
    }
    uint64_t v7 = [v10 code];

    if (v7 == -1500) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  int64_t v8 = [(id)objc_opt_class() _routeHypothesisErrorWithUnderlyingError:v10];
LABEL_8:
  uint64_t v9 = self->_error;
  self->_error = v8;
}

- (void)_clearHypothesisAndSetErrorWithCode:(int64_t)a3
{
  id v9 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:a3];
  [(GEORouteHypothesis *)self _setError:v9];
  generationDate = self->_generationDate;
  self->_generationDate = 0;

  lastLocation = self->_lastLocation;
  self->_lastLocation = 0;

  suggestedDepartureDate = self->_suggestedDepartureDate;
  self->_suggestedDepartureDate = 0;

  conservativeDepartureDate = self->_conservativeDepartureDate;
  self->_conservativeDepartureDate = 0;

  aggressiveDepartureDate = self->_aggressiveDepartureDate;
  self->_aggressiveDepartureDate = 0;

  self->_transportType = 4;
  self->_historicTrafficDensity = 0;
  self->_travelState = 0;
  self->_unint64_t currentTrafficDensity = 0;
}

- (id)description
{
  if (qword_1EB2A0620 != -1) {
    dispatch_once(&qword_1EB2A0620, &__block_literal_global_223);
  }
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v4 = [(GEORouteHypothesis *)self generationDate];

  if (v4)
  {
    BOOL v5 = (void *)MEMORY[0x1E4F28C10];
    uint64_t v6 = [(GEORouteHypothesis *)self generationDate];
    uint64_t v7 = [v5 localizedStringFromDate:v6 dateStyle:1 timeStyle:3];
    [v3 appendFormat:@"{\n\tGeneration date: %@\n", v7];
  }
  int64_t v8 = [(GEORouteHypothesis *)self suggestedDepartureDate];

  if (v8)
  {
    id v9 = (void *)MEMORY[0x1E4F28C10];
    id v10 = [(GEORouteHypothesis *)self suggestedDepartureDate];
    v11 = [v9 localizedStringFromDate:v10 dateStyle:1 timeStyle:3];

    [v3 appendFormat:@"\tSuggested departure date: %@\n", v11];
  }
  id v12 = [(GEORouteHypothesis *)self conservativeDepartureDate];

  if (v12)
  {
    v13 = (void *)MEMORY[0x1E4F28C10];
    id v14 = [(GEORouteHypothesis *)self conservativeDepartureDate];
    v15 = [v13 localizedStringFromDate:v14 dateStyle:1 timeStyle:3];

    [v3 appendFormat:@"\tConservative departure date: %@\n", v15];
  }
  int v16 = [(GEORouteHypothesis *)self aggressiveDepartureDate];

  if (v16)
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F28C10];
    v18 = [(GEORouteHypothesis *)self aggressiveDepartureDate];
    uint64_t v19 = [v17 localizedStringFromDate:v18 dateStyle:1 timeStyle:3];

    [v3 appendFormat:@"\tAggressive departure date: %@\n", v19];
  }
  double v20 = (void *)qword_1EB2A0628;
  [(GEORouteHypothesis *)self estimatedTravelTime];
  double v21 = objc_msgSend(v20, "stringFromTimeInterval:");
  [v3 appendFormat:@"\tEstimated travel time: %@\n", v21];

  v22 = (void *)qword_1EB2A0628;
  [(GEORouteHypothesis *)self conservativeTravelTime];
  double v23 = objc_msgSend(v22, "stringFromTimeInterval:");
  [v3 appendFormat:@"\tConservative travel time: %@\n", v23];

  double v24 = (void *)qword_1EB2A0628;
  [(GEORouteHypothesis *)self aggressiveTravelTime];
  v25 = objc_msgSend(v24, "stringFromTimeInterval:");
  [v3 appendFormat:@"\tAggressive travel time: %@\n", v25];

  double v26 = [(GEORouteHypothesis *)self routeName];
  [v3 appendFormat:@"\tRoute Name: %@\n", v26];

  objc_msgSend(v3, "appendFormat:", @"\tCurrent traffic density: %i | Historic traffic density: %i\n", -[GEORouteHypothesis currentTrafficDensity](self, "currentTrafficDensity"), -[GEORouteHypothesis historicTrafficDensity](self, "historicTrafficDensity"));
  double v27 = [(GEORouteHypothesis *)self trafficDensityDescription];
  [v3 appendFormat:@"\tTraffic description: %@\n", v27];

  unint64_t v28 = [(GEORouteHypothesis *)self travelState];
  if (v28 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %lu)", v28);
    double v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v29 = off_1E53ED9D0[v28];
  }
  uint64_t v30 = [(GEORouteHypothesis *)self transportType];
  if (v30 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v30);
    uint64_t v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v31 = off_1E53EDA00[(int)v30];
  }
  [v3 appendFormat:@"\tTravel state: %@\n\tTransportType: %@\n", v29, v31];

  BOOL v32 = [(GEORouteHypothesis *)self supportsLiveTraffic];
  v33 = @"NO";
  if (v32) {
    v33 = @"YES";
  }
  [v3 appendFormat:@"\tLive Traffic Supported: %@\n", v33];
  objc_super v34 = [(NSError *)self->_error description];
  [v3 appendFormat:@"\tError: %@\n", v34];

  [v3 appendFormat:@"}\n"];

  return v3;
}

uint64_t __33__GEORouteHypothesis_description__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C00]);
  v1 = (void *)qword_1EB2A0628;
  qword_1EB2A0628 = (uint64_t)v0;

  v2 = (void *)qword_1EB2A0628;

  return [v2 setUnitsStyle:2];
}

- (NSDate)generationDate
{
  return self->_generationDate;
}

- (GEOLocation)lastLocation
{
  return self->_lastLocation;
}

- (int)transportType
{
  return self->_transportType;
}

- (NSDate)suggestedDepartureDate
{
  return self->_suggestedDepartureDate;
}

- (double)estimatedTravelTime
{
  return self->_estimatedTravelTime;
}

- (unint64_t)currentTrafficDensity
{
  return self->_currentTrafficDensity;
}

- (unint64_t)historicTrafficDensity
{
  return self->_historicTrafficDensity;
}

- (int64_t)travelState
{
  return self->_travelState;
}

- (BOOL)supportsLiveTraffic
{
  return self->_supportsLiveTraffic;
}

- (NSError)error
{
  return self->_error;
}

- (NSDate)conservativeDepartureDate
{
  return self->_conservativeDepartureDate;
}

- (NSDate)aggressiveDepartureDate
{
  return self->_aggressiveDepartureDate;
}

- (double)conservativeTravelTime
{
  return self->_conservativeTravelTime;
}

- (double)aggressiveTravelTime
{
  return self->_aggressiveTravelTime;
}

- (NSString)routeName
{
  return self->_routeName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trafficDensityDescription, 0);
  objc_storeStrong((id *)&self->_routeName, 0);
  objc_storeStrong((id *)&self->_aggressiveDepartureDate, 0);
  objc_storeStrong((id *)&self->_conservativeDepartureDate, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_suggestedDepartureDate, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);

  objc_storeStrong((id *)&self->_generationDate, 0);
}

@end