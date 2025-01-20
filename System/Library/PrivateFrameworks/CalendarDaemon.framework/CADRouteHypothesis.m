@interface CADRouteHypothesis
+ (BOOL)supportsSecureCoding;
- (BOOL)supportsLiveTraffic;
- (CADRouteHypothesis)initWithCoder:(id)a3;
- (CADRouteHypothesis)initWithTransportType:(int)a3 conservativeDepartureDate:(id)a4 conservativeTravelTime:(double)a5 suggestedDepartureDate:(id)a6 estimatedTravelTime:(double)a7 aggressiveDepartureDate:(id)a8 aggressiveTravelTime:(double)a9 routeName:(id)a10 supportsLiveTraffic:(BOOL)a11 currentTrafficDensity:(unint64_t)a12 trafficDensityDescription:(id)a13 travelState:(int64_t)a14;
- (NSDate)aggressiveDepartureDate;
- (NSDate)conservativeDepartureDate;
- (NSDate)suggestedDepartureDate;
- (NSString)routeName;
- (NSString)trafficDensityDescription;
- (double)aggressiveTravelTime;
- (double)conservativeTravelTime;
- (double)estimatedTravelTime;
- (int)transportType;
- (int64_t)travelState;
- (unint64_t)currentTrafficDensity;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CADRouteHypothesis

- (CADRouteHypothesis)initWithTransportType:(int)a3 conservativeDepartureDate:(id)a4 conservativeTravelTime:(double)a5 suggestedDepartureDate:(id)a6 estimatedTravelTime:(double)a7 aggressiveDepartureDate:(id)a8 aggressiveTravelTime:(double)a9 routeName:(id)a10 supportsLiveTraffic:(BOOL)a11 currentTrafficDensity:(unint64_t)a12 trafficDensityDescription:(id)a13 travelState:(int64_t)a14
{
  id v23 = a4;
  id v24 = a6;
  id v25 = a8;
  id v26 = a10;
  id v27 = a13;
  v41.receiver = self;
  v41.super_class = (Class)CADRouteHypothesis;
  v28 = [(CADRouteHypothesis *)&v41 init];
  v29 = v28;
  if (v28)
  {
    v28->_transportType = a3;
    uint64_t v30 = [v23 copy];
    conservativeDepartureDate = v29->_conservativeDepartureDate;
    v29->_conservativeDepartureDate = (NSDate *)v30;

    v29->_conservativeTravelTime = a5;
    uint64_t v32 = [v24 copy];
    suggestedDepartureDate = v29->_suggestedDepartureDate;
    v29->_suggestedDepartureDate = (NSDate *)v32;

    v29->_estimatedTravelTime = a7;
    uint64_t v34 = [v25 copy];
    aggressiveDepartureDate = v29->_aggressiveDepartureDate;
    v29->_aggressiveDepartureDate = (NSDate *)v34;

    v29->_aggressiveTravelTime = a9;
    uint64_t v36 = [v26 copy];
    routeName = v29->_routeName;
    v29->_routeName = (NSString *)v36;

    v29->_supportsLiveTraffic = a11;
    v29->_currentTrafficDensity = a12;
    uint64_t v38 = [v27 copy];
    trafficDensityDescription = v29->_trafficDensityDescription;
    v29->_trafficDensityDescription = (NSString *)v38;

    v29->_travelState = a14;
  }

  return v29;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28ED0];
  id v5 = a3;
  v6 = objc_msgSend(v4, "numberWithInt:", -[CADRouteHypothesis transportType](self, "transportType"));
  [v5 encodeObject:v6 forKey:@"transportType"];

  v7 = [(CADRouteHypothesis *)self conservativeDepartureDate];
  [v5 encodeObject:v7 forKey:@"conservativeDepartureDate"];

  v8 = (void *)MEMORY[0x1E4F28ED0];
  [(CADRouteHypothesis *)self conservativeTravelTime];
  v9 = objc_msgSend(v8, "numberWithDouble:");
  [v5 encodeObject:v9 forKey:@"conservativeTravelTime"];

  v10 = [(CADRouteHypothesis *)self suggestedDepartureDate];
  [v5 encodeObject:v10 forKey:@"suggestedDepartureDate"];

  v11 = (void *)MEMORY[0x1E4F28ED0];
  [(CADRouteHypothesis *)self estimatedTravelTime];
  v12 = objc_msgSend(v11, "numberWithDouble:");
  [v5 encodeObject:v12 forKey:@"estimatedTravelTime"];

  v13 = [(CADRouteHypothesis *)self aggressiveDepartureDate];
  [v5 encodeObject:v13 forKey:@"aggressiveDepartureDate"];

  v14 = (void *)MEMORY[0x1E4F28ED0];
  [(CADRouteHypothesis *)self aggressiveTravelTime];
  v15 = objc_msgSend(v14, "numberWithDouble:");
  [v5 encodeObject:v15 forKey:@"aggressiveTravelTime"];

  v16 = [(CADRouteHypothesis *)self routeName];
  [v5 encodeObject:v16 forKey:@"routeName"];

  v17 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[CADRouteHypothesis supportsLiveTraffic](self, "supportsLiveTraffic"));
  [v5 encodeObject:v17 forKey:@"supportsLiveTraffic"];

  v18 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[CADRouteHypothesis currentTrafficDensity](self, "currentTrafficDensity"));
  [v5 encodeObject:v18 forKey:@"currentTrafficDensity"];

  v19 = [(CADRouteHypothesis *)self trafficDensityDescription];
  [v5 encodeObject:v19 forKey:@"trafficDensityDescription"];

  objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[CADRouteHypothesis travelState](self, "travelState"));
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v20 forKey:@"travelState"];
}

- (CADRouteHypothesis)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"transportType"];
  unsigned int v27 = [v4 intValue];

  id v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"conservativeDepartureDate"];
  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"conservativeTravelTime"];
  [v6 doubleValue];
  double v8 = v7;

  v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"suggestedDepartureDate"];
  v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"estimatedTravelTime"];
  [v10 doubleValue];
  double v12 = v11;

  v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"aggressiveDepartureDate"];
  v14 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"aggressiveTravelTime"];
  [v14 doubleValue];
  double v16 = v15;

  v17 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"routeName"];
  v18 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"supportsLiveTraffic"];
  uint64_t v19 = [v18 BOOLValue];

  id v20 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"currentTrafficDensity"];
  uint64_t v21 = [v20 unsignedIntegerValue];

  v22 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"trafficDensityDescription"];
  id v23 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"travelState"];

  uint64_t v24 = [v23 integerValue];
  id v25 = [(CADRouteHypothesis *)self initWithTransportType:v27 conservativeDepartureDate:v5 conservativeTravelTime:v9 suggestedDepartureDate:v13 estimatedTravelTime:v17 aggressiveDepartureDate:v19 aggressiveTravelTime:v8 routeName:v12 supportsLiveTraffic:v16 currentTrafficDensity:v21 trafficDensityDescription:v22 travelState:v24];

  return v25;
}

- (int)transportType
{
  return self->_transportType;
}

- (NSDate)conservativeDepartureDate
{
  return self->_conservativeDepartureDate;
}

- (double)conservativeTravelTime
{
  return self->_conservativeTravelTime;
}

- (NSDate)suggestedDepartureDate
{
  return self->_suggestedDepartureDate;
}

- (double)estimatedTravelTime
{
  return self->_estimatedTravelTime;
}

- (NSDate)aggressiveDepartureDate
{
  return self->_aggressiveDepartureDate;
}

- (double)aggressiveTravelTime
{
  return self->_aggressiveTravelTime;
}

- (NSString)routeName
{
  return self->_routeName;
}

- (BOOL)supportsLiveTraffic
{
  return self->_supportsLiveTraffic;
}

- (unint64_t)currentTrafficDensity
{
  return self->_currentTrafficDensity;
}

- (NSString)trafficDensityDescription
{
  return self->_trafficDensityDescription;
}

- (int64_t)travelState
{
  return self->_travelState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trafficDensityDescription, 0);
  objc_storeStrong((id *)&self->_routeName, 0);
  objc_storeStrong((id *)&self->_aggressiveDepartureDate, 0);
  objc_storeStrong((id *)&self->_suggestedDepartureDate, 0);
  objc_storeStrong((id *)&self->_conservativeDepartureDate, 0);
}

@end