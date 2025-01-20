@interface RTFamiliarityIndexOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)referenceLocationSummary;
- (NSDateInterval)dateInterval;
- (RTFamiliarityIndexOptions)init;
- (RTFamiliarityIndexOptions)initWithCoder:(id)a3;
- (RTFamiliarityIndexOptions)initWithDateInterval:(id)a3 lookbackInterval:(double)a4 spatialGranularity:(unint64_t)a5 referenceLocation:(id)a6 referenceLocationSummary:(BOOL)a7 distance:(double)a8;
- (RTFamiliarityIndexOptions)initWithDateInterval:(id)a3 spatialGranularity:(unint64_t)a4;
- (RTLocation)referenceLocation;
- (double)distance;
- (double)lookbackInterval;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)spatialGranularity;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RTFamiliarityIndexOptions

- (RTFamiliarityIndexOptions)init
{
  return [(RTFamiliarityIndexOptions *)self initWithDateInterval:0 lookbackInterval:0 spatialGranularity:0 referenceLocation:0 referenceLocationSummary:4838400.0 distance:0.0];
}

- (RTFamiliarityIndexOptions)initWithDateInterval:(id)a3 spatialGranularity:(unint64_t)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)RTFamiliarityIndexOptions;
  v7 = [(RTFamiliarityIndexOptions *)&v15 init];
  v8 = v7;
  if (v7)
  {
    if (v6)
    {
      v7->_lookbackInterval = 4838400.0;
    }
    else
    {
      v9 = [MEMORY[0x1E4F1C9C8] distantPast];
      v10 = [MEMORY[0x1E4F1C9C8] distantFuture];
      id v6 = (id)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v9 endDate:v10];
      v11 = [MEMORY[0x1E4F1C9C8] date];
      [v11 timeIntervalSinceDate:v9];
      v8->_lookbackInterval = v12 + 604800.0;
    }
    objc_storeStrong((id *)&v8->_dateInterval, v6);
    referenceLocation = v8->_referenceLocation;
    v8->_spatialGranularity = a4;
    v8->_referenceLocation = 0;

    v8->_referenceLocationSummary = 0;
    v8->_distance = 0.0;
  }

  return v8;
}

- (RTFamiliarityIndexOptions)initWithDateInterval:(id)a3 lookbackInterval:(double)a4 spatialGranularity:(unint64_t)a5 referenceLocation:(id)a6 referenceLocationSummary:(BOOL)a7 distance:(double)a8
{
  id v14 = a3;
  id v15 = a6;
  v23.receiver = self;
  v23.super_class = (Class)RTFamiliarityIndexOptions;
  v16 = [(RTFamiliarityIndexOptions *)&v23 init];
  v17 = v16;
  if (v16)
  {
    if (v14)
    {
      v16->_lookbackInterval = a4;
    }
    else
    {
      v18 = [MEMORY[0x1E4F1C9C8] distantPast];
      v19 = [MEMORY[0x1E4F1C9C8] distantFuture];
      id v14 = (id)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v18 endDate:v19];
      v20 = [MEMORY[0x1E4F1C9C8] date];
      [v20 timeIntervalSinceDate:v18];
      v17->_lookbackInterval = v21 + 604800.0;
    }
    objc_storeStrong((id *)&v17->_dateInterval, v14);
    v17->_spatialGranularity = a5;
    objc_storeStrong((id *)&v17->_referenceLocation, a6);
    v17->_referenceLocationSummary = a7;
    v17->_distance = a8;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTFamiliarityIndexOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectForKey:@"dateInterval"];
  [v4 decodeDoubleForKey:@"lookbackInterval"];
  double v7 = v6;
  [v4 decodeDoubleForKey:@"spatialGranularity"];
  unint64_t v9 = (unint64_t)v8;
  v10 = [v4 decodeObjectForKey:@"referenceLocation"];
  uint64_t v11 = [v4 decodeBoolForKey:@"referenceLocationSummary"];
  [v4 decodeDoubleForKey:@"distance"];
  double v13 = v12;

  id v14 = [(RTFamiliarityIndexOptions *)self initWithDateInterval:v5 lookbackInterval:v9 spatialGranularity:v10 referenceLocation:v11 referenceLocationSummary:v7 distance:v13];
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  dateInterval = self->_dateInterval;
  id v5 = a3;
  [v5 encodeObject:dateInterval forKey:@"dateInterval"];
  [v5 encodeDouble:@"lookbackInterval" forKey:self->_lookbackInterval];
  [v5 encodeDouble:@"spatialGranularity" forKey:(double)self->_spatialGranularity];
  [v5 encodeObject:self->_referenceLocation forKey:@"referenceLocation"];
  [v5 encodeBool:self->_referenceLocationSummary forKey:@"referenceLocationSummary"];
  [v5 encodeDouble:@"distance" forKey:self->_distance];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RTFamiliarityIndexOptions *)a3;
  id v5 = v4;
  if (self == v4)
  {
    BOOL v16 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    double v6 = v5;
    double v7 = [(RTFamiliarityIndexOptions *)self dateInterval];
    double v8 = [(RTFamiliarityIndexOptions *)v6 dateInterval];
    if ([v7 isEqualToDateInterval:v8]
      && ([(RTFamiliarityIndexOptions *)self lookbackInterval],
          double v10 = v9,
          [(RTFamiliarityIndexOptions *)v6 lookbackInterval],
          v10 == v11)
      && (unint64_t v12 = [(RTFamiliarityIndexOptions *)self spatialGranularity],
          v12 == [(RTFamiliarityIndexOptions *)v6 spatialGranularity]))
    {
      double v13 = [(RTFamiliarityIndexOptions *)self referenceLocation];
      id v14 = [(RTFamiliarityIndexOptions *)v6 referenceLocation];
      if (v13 == v14
        && (BOOL v15 = [(RTFamiliarityIndexOptions *)self referenceLocationSummary],
            v15 == [(RTFamiliarityIndexOptions *)v6 referenceLocationSummary]))
      {
        [(RTFamiliarityIndexOptions *)self distance];
        double v19 = v18;
        [(RTFamiliarityIndexOptions *)v6 distance];
        BOOL v16 = v19 == v20;
      }
      else
      {
        BOOL v16 = 0;
      }
    }
    else
    {
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [RTFamiliarityIndexOptions alloc];
  dateInterval = self->_dateInterval;
  double lookbackInterval = self->_lookbackInterval;
  unint64_t spatialGranularity = self->_spatialGranularity;
  referenceLocation = self->_referenceLocation;
  BOOL referenceLocationSummary = self->_referenceLocationSummary;
  double distance = self->_distance;
  return [(RTFamiliarityIndexOptions *)v4 initWithDateInterval:dateInterval lookbackInterval:spatialGranularity spatialGranularity:referenceLocation referenceLocation:referenceLocationSummary referenceLocationSummary:lookbackInterval distance:distance];
}

- (id)description
{
  v3 = NSString;
  id v4 = [(RTFamiliarityIndexOptions *)self dateInterval];
  [(RTFamiliarityIndexOptions *)self lookbackInterval];
  uint64_t v6 = v5;
  unint64_t v7 = [(RTFamiliarityIndexOptions *)self spatialGranularity];
  double v8 = [(RTFamiliarityIndexOptions *)self referenceLocation];
  BOOL v9 = [(RTFamiliarityIndexOptions *)self referenceLocationSummary];
  [(RTFamiliarityIndexOptions *)self distance];
  double v11 = [v3 stringWithFormat:@"dateInterval, %@, lookbackInterval, %.2f, spatialGranularity, %lu, referenceLocation, %@, referenceLocationSummary, %d, distance, %.2f", v4, v6, v7, v8, v9, v10];

  return v11;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (double)lookbackInterval
{
  return self->_lookbackInterval;
}

- (unint64_t)spatialGranularity
{
  return self->_spatialGranularity;
}

- (RTLocation)referenceLocation
{
  return self->_referenceLocation;
}

- (BOOL)referenceLocationSummary
{
  return self->_referenceLocationSummary;
}

- (double)distance
{
  return self->_distance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceLocation, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end