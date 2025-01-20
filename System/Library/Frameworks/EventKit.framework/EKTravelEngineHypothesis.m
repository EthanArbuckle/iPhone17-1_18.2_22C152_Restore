@interface EKTravelEngineHypothesis
+ (BOOL)supportsSecureCoding;
+ (id)syntheticHypothesisWithStartDate:(id)a3 conservativeTravelTime:(double)a4 estimatedTravelTime:(double)a5 aggressiveTravelTime:(double)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToHypothesis:(id)a3;
- (BOOL)supportsLiveTraffic;
- (EKTravelEngineHypothesis)initWithCoder:(id)a3;
- (EKTravelEngineHypothesis)initWithTransportType:(int)a3 conservativeDepartureDate:(id)a4 conservativeTravelTime:(double)a5 suggestedDepartureDate:(id)a6 estimatedTravelTime:(double)a7 aggressiveDepartureDate:(id)a8 aggressiveTravelTime:(double)a9 routeName:(id)a10 supportsLiveTraffic:(BOOL)a11 currentTrafficDensity:(unint64_t)a12 trafficDensityDescription:(id)a13 travelState:(int64_t)a14;
- (NSDate)aggressiveDepartureDate;
- (NSDate)conservativeDepartureDate;
- (NSDate)creationDate;
- (NSDate)suggestedDepartureDate;
- (NSString)routeName;
- (NSString)trafficDensityDescription;
- (double)aggressiveTravelTime;
- (double)conservativeTravelTime;
- (double)estimatedTravelTime;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int)transportType;
- (int64_t)travelState;
- (unint64_t)currentTrafficDensity;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EKTravelEngineHypothesis

- (EKTravelEngineHypothesis)initWithTransportType:(int)a3 conservativeDepartureDate:(id)a4 conservativeTravelTime:(double)a5 suggestedDepartureDate:(id)a6 estimatedTravelTime:(double)a7 aggressiveDepartureDate:(id)a8 aggressiveTravelTime:(double)a9 routeName:(id)a10 supportsLiveTraffic:(BOOL)a11 currentTrafficDensity:(unint64_t)a12 trafficDensityDescription:(id)a13 travelState:(int64_t)a14
{
  id v23 = a4;
  id v24 = a6;
  id v25 = a8;
  id v26 = a10;
  id v27 = a13;
  v43.receiver = self;
  v43.super_class = (Class)EKTravelEngineHypothesis;
  v28 = [(EKTravelEngineHypothesis *)&v43 init];
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
    uint64_t v40 = [MEMORY[0x1E4F1C9C8] date];
    creationDate = v29->_creationDate;
    v29->_creationDate = (NSDate *)v40;
  }
  return v29;
}

- (id)description
{
  v19 = NSString;
  uint64_t v18 = objc_opt_class();
  uint64_t v3 = [(EKTravelEngineHypothesis *)self transportType];
  if (v3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v3);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = off_1E5B98608[(int)v3];
  }
  id v24 = [(EKTravelEngineHypothesis *)self conservativeDepartureDate];
  v4 = NSNumber;
  [(EKTravelEngineHypothesis *)self conservativeTravelTime];
  id v23 = objc_msgSend(v4, "numberWithDouble:");
  v22 = [(EKTravelEngineHypothesis *)self suggestedDepartureDate];
  v5 = NSNumber;
  [(EKTravelEngineHypothesis *)self estimatedTravelTime];
  v21 = objc_msgSend(v5, "numberWithDouble:");
  v6 = [(EKTravelEngineHypothesis *)self aggressiveDepartureDate];
  v7 = NSNumber;
  [(EKTravelEngineHypothesis *)self aggressiveTravelTime];
  v17 = objc_msgSend(v7, "numberWithDouble:");
  v8 = [(EKTravelEngineHypothesis *)self routeName];
  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[EKTravelEngineHypothesis supportsLiveTraffic](self, "supportsLiveTraffic"));
  v10 = +[EKTravelEngineUtilities geoTrafficDensityAsString:[(EKTravelEngineHypothesis *)self currentTrafficDensity]];
  v11 = [(EKTravelEngineHypothesis *)self trafficDensityDescription];
  unint64_t v12 = [(EKTravelEngineHypothesis *)self travelState];
  if (v12 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %lu)", v12);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = off_1E5B98640[v12];
  }
  v14 = [(EKTravelEngineHypothesis *)self creationDate];
  v15 = [v19 stringWithFormat:@"<%@: %p>(transportType = %@, conservativeDepartureDate = %@, conservativeTravelTime = %@, suggestedDepartureDate = %@, estimatedTravelTime = %@, aggressiveDepartureDate = %@, aggressiveTravelTime = %@, routeName = %@, supportsLiveTraffic = %@, currentTrafficDensity = %@, trafficDensityDescription = %@, travelState = %@, creationDate = %@)", v18, self, v20, v24, v23, v22, v21, v6, v17, v8, v9, v10, v11, v13, v14];

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [(EKTravelEngineHypothesis *)self isEqualToHypothesis:v4];

  return v5;
}

- (BOOL)isEqualToHypothesis:(id)a3
{
  id v4 = (EKTravelEngineHypothesis *)a3;
  if (self == v4)
  {
    BOOL v33 = 1;
  }
  else
  {
    int v5 = [(EKTravelEngineHypothesis *)self transportType];
    if (v5 != [(EKTravelEngineHypothesis *)v4 transportType]) {
      goto LABEL_14;
    }
    v6 = [(EKTravelEngineHypothesis *)self conservativeDepartureDate];
    v7 = [(EKTravelEngineHypothesis *)v4 conservativeDepartureDate];
    int v8 = CalEqualObjects();

    if (!v8) {
      goto LABEL_14;
    }
    [(EKTravelEngineHypothesis *)self conservativeTravelTime];
    double v10 = v9;
    [(EKTravelEngineHypothesis *)v4 conservativeTravelTime];
    if (v10 != v11) {
      goto LABEL_14;
    }
    unint64_t v12 = [(EKTravelEngineHypothesis *)self suggestedDepartureDate];
    v13 = [(EKTravelEngineHypothesis *)v4 suggestedDepartureDate];
    int v14 = CalEqualObjects();

    if (!v14) {
      goto LABEL_14;
    }
    [(EKTravelEngineHypothesis *)self estimatedTravelTime];
    double v16 = v15;
    [(EKTravelEngineHypothesis *)v4 estimatedTravelTime];
    if (v16 != v17) {
      goto LABEL_14;
    }
    uint64_t v18 = [(EKTravelEngineHypothesis *)self aggressiveDepartureDate];
    v19 = [(EKTravelEngineHypothesis *)v4 aggressiveDepartureDate];
    int v20 = CalEqualObjects();

    if (!v20) {
      goto LABEL_14;
    }
    [(EKTravelEngineHypothesis *)self aggressiveTravelTime];
    double v22 = v21;
    [(EKTravelEngineHypothesis *)v4 aggressiveTravelTime];
    if (v22 != v23) {
      goto LABEL_14;
    }
    id v24 = [(EKTravelEngineHypothesis *)self routeName];
    id v25 = [(EKTravelEngineHypothesis *)v4 routeName];
    int v26 = CalEqualStrings();

    if (!v26) {
      goto LABEL_14;
    }
    BOOL v27 = [(EKTravelEngineHypothesis *)self supportsLiveTraffic];
    if (v27 != [(EKTravelEngineHypothesis *)v4 supportsLiveTraffic]) {
      goto LABEL_14;
    }
    unint64_t v28 = [(EKTravelEngineHypothesis *)self currentTrafficDensity];
    if (v28 != [(EKTravelEngineHypothesis *)v4 currentTrafficDensity]) {
      goto LABEL_14;
    }
    v29 = [(EKTravelEngineHypothesis *)self trafficDensityDescription];
    uint64_t v30 = [(EKTravelEngineHypothesis *)v4 trafficDensityDescription];
    int v31 = CalEqualStrings();

    if (v31)
    {
      int64_t v32 = [(EKTravelEngineHypothesis *)self travelState];
      BOOL v33 = v32 == [(EKTravelEngineHypothesis *)v4 travelState];
    }
    else
    {
LABEL_14:
      BOOL v33 = 0;
    }
  }

  return v33;
}

- (unint64_t)hash
{
  uint64_t v3 = [(EKTravelEngineHypothesis *)self transportType];
  id v4 = [(EKTravelEngineHypothesis *)self conservativeDepartureDate];
  uint64_t v5 = [v4 hash] ^ v3;

  v6 = NSNumber;
  [(EKTravelEngineHypothesis *)self conservativeTravelTime];
  v7 = objc_msgSend(v6, "numberWithDouble:");
  uint64_t v8 = [v7 hash];

  double v9 = [(EKTravelEngineHypothesis *)self suggestedDepartureDate];
  uint64_t v10 = v5 ^ [v9 hash] ^ v8;

  double v11 = NSNumber;
  [(EKTravelEngineHypothesis *)self estimatedTravelTime];
  unint64_t v12 = objc_msgSend(v11, "numberWithDouble:");
  uint64_t v13 = [v12 hash];

  int v14 = [(EKTravelEngineHypothesis *)self aggressiveDepartureDate];
  uint64_t v15 = v10 ^ v13 ^ [v14 hash];

  double v16 = NSNumber;
  [(EKTravelEngineHypothesis *)self aggressiveTravelTime];
  double v17 = objc_msgSend(v16, "numberWithDouble:");
  uint64_t v18 = [v17 hash];

  v19 = [(EKTravelEngineHypothesis *)self routeName];
  uint64_t v20 = v18 ^ [v19 hash];

  uint64_t v21 = v15 ^ v20 ^ [(EKTravelEngineHypothesis *)self supportsLiveTraffic];
  unint64_t v22 = [(EKTravelEngineHypothesis *)self currentTrafficDensity];
  double v23 = [(EKTravelEngineHypothesis *)self trafficDensityDescription];
  uint64_t v24 = v22 ^ [v23 hash];

  return v21 ^ v24 ^ [(EKTravelEngineHypothesis *)self travelState];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[EKMutableTravelEngineHypothesis allocWithZone:a3];
  uint64_t v5 = [(EKTravelEngineHypothesis *)self transportType];
  v6 = [(EKTravelEngineHypothesis *)self conservativeDepartureDate];
  [(EKTravelEngineHypothesis *)self conservativeTravelTime];
  double v8 = v7;
  double v9 = [(EKTravelEngineHypothesis *)self suggestedDepartureDate];
  [(EKTravelEngineHypothesis *)self estimatedTravelTime];
  double v11 = v10;
  unint64_t v12 = [(EKTravelEngineHypothesis *)self aggressiveDepartureDate];
  [(EKTravelEngineHypothesis *)self aggressiveTravelTime];
  double v14 = v13;
  uint64_t v15 = [(EKTravelEngineHypothesis *)self routeName];
  BOOL v16 = [(EKTravelEngineHypothesis *)self supportsLiveTraffic];
  unint64_t v17 = [(EKTravelEngineHypothesis *)self currentTrafficDensity];
  uint64_t v18 = [(EKTravelEngineHypothesis *)self trafficDensityDescription];
  v19 = [(EKTravelEngineHypothesis *)v4 initWithTransportType:v5 conservativeDepartureDate:v6 conservativeTravelTime:v9 suggestedDepartureDate:v12 estimatedTravelTime:v15 aggressiveDepartureDate:v16 aggressiveTravelTime:v8 routeName:v11 supportsLiveTraffic:v14 currentTrafficDensity:v17 trafficDensityDescription:v18 travelState:[(EKTravelEngineHypothesis *)self travelState]];

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  id v5 = a3;
  v6 = objc_msgSend(v4, "numberWithInt:", -[EKTravelEngineHypothesis transportType](self, "transportType"));
  [v5 encodeObject:v6 forKey:@"transportType"];

  double v7 = [(EKTravelEngineHypothesis *)self conservativeDepartureDate];
  [v5 encodeObject:v7 forKey:@"conservativeDepartureDate"];

  double v8 = NSNumber;
  [(EKTravelEngineHypothesis *)self conservativeTravelTime];
  double v9 = objc_msgSend(v8, "numberWithDouble:");
  [v5 encodeObject:v9 forKey:@"conservativeTravelTime"];

  double v10 = [(EKTravelEngineHypothesis *)self suggestedDepartureDate];
  [v5 encodeObject:v10 forKey:@"suggestedDepartureDate"];

  double v11 = NSNumber;
  [(EKTravelEngineHypothesis *)self estimatedTravelTime];
  unint64_t v12 = objc_msgSend(v11, "numberWithDouble:");
  [v5 encodeObject:v12 forKey:@"estimatedTravelTime"];

  double v13 = [(EKTravelEngineHypothesis *)self aggressiveDepartureDate];
  [v5 encodeObject:v13 forKey:@"aggressiveDepartureDate"];

  double v14 = NSNumber;
  [(EKTravelEngineHypothesis *)self aggressiveTravelTime];
  uint64_t v15 = objc_msgSend(v14, "numberWithDouble:");
  [v5 encodeObject:v15 forKey:@"aggressiveTravelTime"];

  BOOL v16 = [(EKTravelEngineHypothesis *)self routeName];
  [v5 encodeObject:v16 forKey:@"routeName"];

  unint64_t v17 = objc_msgSend(NSNumber, "numberWithBool:", -[EKTravelEngineHypothesis supportsLiveTraffic](self, "supportsLiveTraffic"));
  [v5 encodeObject:v17 forKey:@"supportsLiveTraffic"];

  uint64_t v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[EKTravelEngineHypothesis currentTrafficDensity](self, "currentTrafficDensity"));
  [v5 encodeObject:v18 forKey:@"currentTrafficDensity"];

  v19 = [(EKTravelEngineHypothesis *)self trafficDensityDescription];
  [v5 encodeObject:v19 forKey:@"trafficDensityDescription"];

  objc_msgSend(NSNumber, "numberWithInteger:", -[EKTravelEngineHypothesis travelState](self, "travelState"));
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v20 forKey:@"travelState"];
}

- (EKTravelEngineHypothesis)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"transportType"];
  unsigned int v27 = [v4 intValue];

  id v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"conservativeDepartureDate"];
  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"conservativeTravelTime"];
  [v6 doubleValue];
  double v8 = v7;

  double v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"suggestedDepartureDate"];
  double v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"estimatedTravelTime"];
  [v10 doubleValue];
  double v12 = v11;

  double v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"aggressiveDepartureDate"];
  double v14 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"aggressiveTravelTime"];
  [v14 doubleValue];
  double v16 = v15;

  unint64_t v17 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"routeName"];
  uint64_t v18 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"supportsLiveTraffic"];
  uint64_t v19 = [v18 BOOLValue];

  id v20 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"currentTrafficDensity"];
  uint64_t v21 = [v20 unsignedIntegerValue];

  unint64_t v22 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"trafficDensityDescription"];
  double v23 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"travelState"];

  uint64_t v24 = [v23 integerValue];
  id v25 = [(EKTravelEngineHypothesis *)self initWithTransportType:v27 conservativeDepartureDate:v5 conservativeTravelTime:v9 suggestedDepartureDate:v13 estimatedTravelTime:v17 aggressiveDepartureDate:v19 aggressiveTravelTime:v8 routeName:v12 supportsLiveTraffic:v16 currentTrafficDensity:v21 trafficDensityDescription:v22 travelState:v24];

  return v25;
}

+ (id)syntheticHypothesisWithStartDate:(id)a3 conservativeTravelTime:(double)a4 estimatedTravelTime:(double)a5 aggressiveTravelTime:(double)a6
{
  id v9 = a3;
  double v10 = [EKTravelEngineHypothesis alloc];
  double v11 = [v9 dateByAddingTimeInterval:-a4];
  double v12 = [v9 dateByAddingTimeInterval:-a5];
  double v13 = [v9 dateByAddingTimeInterval:-a6];

  double v14 = [(EKTravelEngineHypothesis *)v10 initWithTransportType:4 conservativeDepartureDate:v11 conservativeTravelTime:v12 suggestedDepartureDate:v13 estimatedTravelTime:0 aggressiveDepartureDate:0 aggressiveTravelTime:a4 routeName:a5 supportsLiveTraffic:a6 currentTrafficDensity:0 trafficDensityDescription:0 travelState:0];

  return v14;
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

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_trafficDensityDescription, 0);
  objc_storeStrong((id *)&self->_routeName, 0);
  objc_storeStrong((id *)&self->_aggressiveDepartureDate, 0);
  objc_storeStrong((id *)&self->_suggestedDepartureDate, 0);

  objc_storeStrong((id *)&self->_conservativeDepartureDate, 0);
}

@end