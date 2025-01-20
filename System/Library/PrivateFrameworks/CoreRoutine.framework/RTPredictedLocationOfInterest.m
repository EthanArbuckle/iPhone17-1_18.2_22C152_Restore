@interface RTPredictedLocationOfInterest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)sources;
- (NSDate)nextEntryTime;
- (RTLocationOfInterest)locationOfInterest;
- (RTPredictedLocationOfInterest)initWithCoder:(id)a3;
- (RTPredictedLocationOfInterest)initWithLocationOfInterest:(id)a3 confidence:(double)a4 nextEntryTime:(id)a5 modeOfTransportation:(int64_t)a6 sources:(id)a7;
- (RTSource)source;
- (double)confidence;
- (id)description;
- (int64_t)modeOfTransportation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setConfidence:(double)a3;
- (void)setModeOfTransportation:(int64_t)a3;
@end

@implementation RTPredictedLocationOfInterest

- (RTLocationOfInterest)locationOfInterest
{
  return self->_locationOfInterest;
}

- (void)encodeWithCoder:(id)a3
{
  locationOfInterest = self->_locationOfInterest;
  id v6 = a3;
  [v6 encodeObject:locationOfInterest forKey:@"locationOfInterest"];
  [v6 encodeDouble:@"confidence" forKey:self->_confidence];
  [v6 encodeObject:self->_nextEntryTime forKey:@"nextEntryTime"];
  v5 = [NSNumber numberWithUnsignedInteger:self->_modeOfTransportation];
  [v6 encodeObject:v5 forKey:@"modeOfTransportation"];

  [v6 encodeObject:self->_sources forKey:@"sources"];
}

- (RTPredictedLocationOfInterest)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)RTPredictedLocationOfInterest;
  v5 = [(RTPredictedLocationOfInterest *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locationOfInterest"];
    locationOfInterest = v5->_locationOfInterest;
    v5->_locationOfInterest = (RTLocationOfInterest *)v6;

    [v4 decodeDoubleForKey:@"confidence"];
    v5->_confidence = v8;
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nextEntryTime"];
    nextEntryTime = v5->_nextEntryTime;
    v5->_nextEntryTime = (NSDate *)v9;

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modeOfTransportation"];
    v5->_modeOfTransportation = [v11 unsignedIntegerValue];

    v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"sources"];
    sources = v5->_sources;
    v5->_sources = (NSArray *)v15;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_nextEntryTime, 0);
  objc_storeStrong((id *)&self->_locationOfInterest, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTPredictedLocationOfInterest)initWithLocationOfInterest:(id)a3 confidence:(double)a4 nextEntryTime:(id)a5 modeOfTransportation:(int64_t)a6 sources:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a7;
  if (v13)
  {
    v21.receiver = self;
    v21.super_class = (Class)RTPredictedLocationOfInterest;
    v16 = [(RTPredictedLocationOfInterest *)&v21 init];
    v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_locationOfInterest, a3);
      v17->_confidence = a4;
      objc_storeStrong((id *)&v17->_nextEntryTime, a5);
      v17->_modeOfTransportation = a6;
      objc_storeStrong((id *)&v17->_sources, a7);
    }
    self = v17;
    objc_super v18 = self;
  }
  else
  {
    v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A8FEF000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locationOfInterest", buf, 2u);
    }

    objc_super v18 = 0;
  }

  return v18;
}

- (void)setConfidence:(double)a3
{
  if (a3 <= 1.0)
  {
    if (a3 >= 0.0) {
      self->_confidence = a3;
    }
    else {
      self->_confidence = 0.0;
    }
  }
  else
  {
    self->_confidence = 1.0;
  }
}

- (RTSource)source
{
  return (RTSource *)[(NSArray *)self->_sources firstObject];
}

- (BOOL)isEqual:(id)a3
{
  v7 = (RTPredictedLocationOfInterest *)a3;
  if (v7 == self)
  {
    char v11 = 1;
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v11 = 0;
    goto LABEL_24;
  }
  double v8 = v7;
  uint64_t v9 = [(RTPredictedLocationOfInterest *)self locationOfInterest];
  if (v9
    || ([(RTPredictedLocationOfInterest *)v8 locationOfInterest],
        (v31 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v3 = [(RTPredictedLocationOfInterest *)self locationOfInterest];
    id v4 = [(RTPredictedLocationOfInterest *)v8 locationOfInterest];
    if (([v3 isEqual:v4] & 1) == 0)
    {

      char v11 = 0;
      goto LABEL_21;
    }
    int v10 = 1;
  }
  else
  {
    v31 = 0;
    int v10 = 0;
  }
  [(RTPredictedLocationOfInterest *)self confidence];
  double v13 = v12;
  [(RTPredictedLocationOfInterest *)v8 confidence];
  if (v13 == v14)
  {
    id v15 = [(RTPredictedLocationOfInterest *)self nextEntryTime];
    if (!v15)
    {
      v29 = [(RTPredictedLocationOfInterest *)v8 nextEntryTime];
      if (!v29)
      {
        int v30 = v10;
        v29 = 0;
        int v17 = 0;
LABEL_26:
        int64_t v19 = [(RTPredictedLocationOfInterest *)self modeOfTransportation];
        if (v19 != [(RTPredictedLocationOfInterest *)v8 modeOfTransportation])
        {
          char v11 = 0;
          int v23 = v30;
          if (!v17) {
            goto LABEL_34;
          }
          goto LABEL_33;
        }
        uint64_t v20 = [(RTPredictedLocationOfInterest *)self sources];
        if (v20
          || ([(RTPredictedLocationOfInterest *)v8 sources], (uint64_t v25 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          char v27 = v17;
          [(RTPredictedLocationOfInterest *)self sources];
          objc_super v21 = v26 = (void *)v20;
          v22 = [(RTPredictedLocationOfInterest *)v8 sources];
          char v11 = [v21 isEqualToArray:v22];

          if (v26)
          {

            int v23 = v30;
            if ((v27 & 1) == 0) {
              goto LABEL_34;
            }
            goto LABEL_33;
          }
          int v23 = v30;
          LOBYTE(v17) = v27;
          v24 = (void *)v25;
        }
        else
        {
          v24 = 0;
          char v11 = 1;
          int v23 = v30;
        }

        if ((v17 & 1) == 0)
        {
LABEL_34:
          if (!v15) {

          }
          if (!v23) {
            goto LABEL_21;
          }
          goto LABEL_20;
        }
LABEL_33:

        goto LABEL_34;
      }
    }
    v16 = [(RTPredictedLocationOfInterest *)self nextEntryTime];
    v5 = [(RTPredictedLocationOfInterest *)v8 nextEntryTime];
    if ([v16 isEqualToDate:v5])
    {
      v28 = v16;
      int v30 = v10;
      int v17 = 1;
      goto LABEL_26;
    }

    if (v15) {
    else
    }
  }
  char v11 = 0;
  if (v10)
  {
LABEL_20:
  }
LABEL_21:
  if (!v9) {

  }
LABEL_24:
  return v11;
}

- (unint64_t)hash
{
  v3 = [(RTPredictedLocationOfInterest *)self locationOfInterest];
  uint64_t v4 = [v3 hash];
  v5 = NSNumber;
  [(RTPredictedLocationOfInterest *)self confidence];
  uint64_t v6 = objc_msgSend(v5, "numberWithDouble:");
  uint64_t v7 = [v6 hash];
  double v8 = [(RTPredictedLocationOfInterest *)self nextEntryTime];
  uint64_t v9 = v7 ^ v4 ^ [v8 hash];
  int v10 = objc_msgSend(NSNumber, "numberWithInteger:", -[RTPredictedLocationOfInterest modeOfTransportation](self, "modeOfTransportation"));
  uint64_t v11 = [v10 hash];
  double v12 = [(RTPredictedLocationOfInterest *)self sources];
  unint64_t v13 = v9 ^ v11 ^ [v12 hash];

  return v13;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = [(RTPredictedLocationOfInterest *)self locationOfInterest];
  [(RTPredictedLocationOfInterest *)self confidence];
  uint64_t v6 = v5;
  uint64_t v7 = [(RTPredictedLocationOfInterest *)self nextEntryTime];
  double v8 = [v7 stringFromDate];
  uint64_t v9 = +[RTRoutineManager modeOfTransportationToString:[(RTPredictedLocationOfInterest *)self modeOfTransportation]];
  int v10 = [(RTPredictedLocationOfInterest *)self sources];
  uint64_t v11 = [v3 stringWithFormat:@"loi, %@, prediction confidence, %f, next entry time, %@, mode of transportation, %@, sources, %@", v4, v6, v8, v9, v10];

  return v11;
}

- (double)confidence
{
  return self->_confidence;
}

- (NSDate)nextEntryTime
{
  return self->_nextEntryTime;
}

- (int64_t)modeOfTransportation
{
  return self->_modeOfTransportation;
}

- (void)setModeOfTransportation:(int64_t)a3
{
  self->_modeOfTransportation = a3;
}

- (NSArray)sources
{
  return self->_sources;
}

@end