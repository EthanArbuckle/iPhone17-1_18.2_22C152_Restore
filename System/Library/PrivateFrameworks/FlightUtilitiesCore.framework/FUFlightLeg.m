@interface FUFlightLeg
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (FUFlightLeg)initWithCoder:(id)a3;
- (FUFlightStep)arrival;
- (FUFlightStep)departure;
- (NSString)baggageClaim;
- (double)currentProgress;
- (double)duration;
- (id)description;
- (int64_t)status;
- (void)encodeWithCoder:(id)a3;
- (void)setArrival:(id)a3;
- (void)setBaggageClaim:(id)a3;
- (void)setDeparture:(id)a3;
- (void)setDuration:(double)a3;
- (void)setStatus:(int64_t)a3;
@end

@implementation FUFlightLeg

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t v7 = [(FUFlightLeg *)self status];
    if (v7 == [v6 status])
    {
      [(FUFlightLeg *)self duration];
      double v9 = v8;
      [v6 duration];
      if (v9 == v10)
      {
        v11 = [(FUFlightLeg *)self baggageClaim];
        v12 = [v6 baggageClaim];
        if (v11 != v12)
        {
          v3 = [(FUFlightLeg *)self baggageClaim];
          v4 = [v6 baggageClaim];
          if (![v3 isEqual:v4])
          {
            char v13 = 0;
            goto LABEL_19;
          }
        }
        v15 = [(FUFlightLeg *)self arrival];
        v16 = [v6 arrival];
        if (v15 != v16)
        {
          v17 = [(FUFlightLeg *)self arrival];
          v18 = [v6 arrival];
          if (![v17 isEqual:v18])
          {
            char v13 = 0;
            goto LABEL_17;
          }
          v29 = v18;
          v30 = v17;
        }
        v19 = [(FUFlightLeg *)self departure];
        uint64_t v20 = [v6 departure];
        if (v19 == (void *)v20)
        {

          char v13 = 1;
        }
        else
        {
          v21 = (void *)v20;
          [(FUFlightLeg *)self departure];
          v22 = v28 = v3;
          [v6 departure];
          v27 = v15;
          v23 = v12;
          v24 = v11;
          v26 = v25 = v4;
          char v13 = [v22 isEqual:v26];

          v4 = v25;
          v11 = v24;
          v12 = v23;
          v15 = v27;

          v3 = v28;
        }
        v18 = v29;
        v17 = v30;
        if (v15 == v16)
        {
LABEL_18:

          if (v11 == v12)
          {
LABEL_20:

            goto LABEL_8;
          }
LABEL_19:

          goto LABEL_20;
        }
LABEL_17:

        goto LABEL_18;
      }
    }
  }
  char v13 = 0;
LABEL_8:

  return v13;
}

- (double)currentProgress
{
  v3 = [(FUFlightLeg *)self departure];
  v4 = [v3 runwayTime];
  v5 = [v4 date];

  if (v5)
  {
    id v6 = [(FUFlightLeg *)self arrival];
    int64_t v7 = [v6 runwayTime];
    double v8 = [v7 date];
    double v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      v14 = [(FUFlightLeg *)self arrival];
      v15 = [v14 time];
      id v10 = [v15 date];
    }
    double v13 = 0.0;
    if (v10)
    {
      [v10 timeIntervalSinceDate:v5];
      double v17 = v16;
      v18 = +[FUUtils testDate];
      v19 = v18;
      if (v18)
      {
        [v18 timeIntervalSinceDate:v5];
        double v21 = v20;
      }
      else
      {
        v22 = [MEMORY[0x263EFF910] date];
        [v22 timeIntervalSinceDate:v5];
        double v21 = v23;
      }
      double v24 = v21 / v17;

      if (v24 <= 1.0)
      {
        if (v24 >= 0.0) {
          double v13 = v24;
        }
      }
      else
      {
        double v13 = 1.0;
      }
    }
  }
  else
  {
    id v10 = [(FUFlightLeg *)self departure];
    v11 = [v10 time];
    v12 = [v11 date];
    if (v12) {
      double v13 = 0.0;
    }
    else {
      double v13 = -1.0;
    }
  }
  return v13;
}

- (id)description
{
  double v16 = NSString;
  v18 = [(FUFlightLeg *)self departure];
  double v17 = [v18 airport];
  v3 = [v17 IATACode];
  v4 = [(FUFlightLeg *)self arrival];
  v5 = [v4 airport];
  id v6 = [v5 IATACode];
  unint64_t v7 = [(FUFlightLeg *)self status] - 1;
  if (v7 > 5) {
    double v8 = @"Status not defined";
  }
  else {
    double v8 = off_264545D98[v7];
  }
  double v9 = [(FUFlightLeg *)self departure];
  id v10 = [v9 time];
  v11 = [(FUFlightLeg *)self arrival];
  v12 = [v11 time];
  double v13 = [(FUFlightLeg *)self baggageClaim];
  v14 = [v16 stringWithFormat:@"Leg: %@ => %@ %@ Takeoff %@ Landing %@ baggage %@", v3, v6, v8, v10, v12, v13];

  return v14;
}

__CFString *__26__FUFlightLeg_description__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) status];
  if ((unint64_t)(v1 - 1) > 5) {
    return @"Status not defined";
  }
  else {
    return off_264545D98[v1 - 1];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  objc_msgSend(v10, "encodeInteger:forKey:", -[FUFlightLeg status](self, "status"), @"status");
  [(FUFlightLeg *)self duration];
  objc_msgSend(v10, "encodeDouble:forKey:", @"duration");
  v4 = [(FUFlightLeg *)self departure];

  if (v4)
  {
    v5 = [(FUFlightLeg *)self departure];
    [v10 encodeObject:v5 forKey:@"departure"];
  }
  id v6 = [(FUFlightLeg *)self arrival];

  if (v6)
  {
    unint64_t v7 = [(FUFlightLeg *)self arrival];
    [v10 encodeObject:v7 forKey:@"arrival"];
  }
  double v8 = [(FUFlightLeg *)self baggageClaim];

  if (v8)
  {
    double v9 = [(FUFlightLeg *)self baggageClaim];
    [v10 encodeObject:v9 forKey:@"baggageClaim"];
  }
}

- (FUFlightLeg)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FUFlightLeg;
  v5 = [(FUFlightLeg *)&v15 init];
  if (v5)
  {
    v5->_status = [v4 decodeIntegerForKey:@"status"];
    [v4 decodeDoubleForKey:@"duration"];
    v5->_duration = v6;
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"departure"];
    departure = v5->_departure;
    v5->_departure = (FUFlightStep *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"arrival"];
    arrival = v5->_arrival;
    v5->_arrival = (FUFlightStep *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"baggageClaim"];
    baggageClaim = v5->_baggageClaim;
    v5->_baggageClaim = (NSString *)v11;

    double v13 = v5;
  }

  return v5;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (FUFlightStep)departure
{
  return (FUFlightStep *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDeparture:(id)a3
{
}

- (FUFlightStep)arrival
{
  return (FUFlightStep *)objc_getProperty(self, a2, 32, 1);
}

- (void)setArrival:(id)a3
{
}

- (NSString)baggageClaim
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBaggageClaim:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baggageClaim, 0);
  objc_storeStrong((id *)&self->_arrival, 0);
  objc_storeStrong((id *)&self->_departure, 0);
}

@end