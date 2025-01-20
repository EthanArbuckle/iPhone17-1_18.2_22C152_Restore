@interface CLTripSegmentOutputData
+ (BOOL)supportsSecureCoding;
- (BOOL)isFinalPart;
- (CLTripSegmentOutputData)initWithCoder:(id)a3;
- (CLTripSegmentOutputData)initWithTripSegmentID:(id)a3 isFinalPart:(BOOL)a4 startDate:(id)a5 endDate:(id)a6 duration:(double)a7 modeOfTransport:(int64_t)a8 distance:(double)a9 distanceUnc:(double)a10 tripLocations:(id)a11;
- (NSArray)tripLocations;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSUUID)tripSegmentID;
- (double)distanceUnc_m;
- (double)distance_m;
- (double)duration_s;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)modeOfTransport;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setDistanceUnc_m:(double)a3;
- (void)setDistance_m:(double)a3;
- (void)setDuration_s:(double)a3;
@end

@implementation CLTripSegmentOutputData

- (CLTripSegmentOutputData)initWithTripSegmentID:(id)a3 isFinalPart:(BOOL)a4 startDate:(id)a5 endDate:(id)a6 duration:(double)a7 modeOfTransport:(int64_t)a8 distance:(double)a9 distanceUnc:(double)a10 tripLocations:(id)a11
{
  v23.receiver = self;
  v23.super_class = (Class)CLTripSegmentOutputData;
  v20 = [(CLTripSegmentOutputData *)&v23 init];
  if (v20)
  {
    v21 = (NSUUID *)a3;
    v20->_isFinalPart = a4;
    v20->_tripSegmentID = v21;
    v20->_modeOfTransport = a8;
    v20->_startDate = (NSDate *)a5;
    v20->_endDate = (NSDate *)a6;
    v20->_duration_s = a7;
    v20->_distance_m = a9;
    v20->_distanceUnc_m = a10;
    v20->_tripLocations = (NSArray *)a11;
  }
  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(CLTripSegmentOutputData *)self tripSegmentID];
  BOOL v6 = [(CLTripSegmentOutputData *)self isFinalPart];
  v7 = [(CLTripSegmentOutputData *)self startDate];
  v8 = [(CLTripSegmentOutputData *)self endDate];
  [(CLTripSegmentOutputData *)self duration_s];
  double v10 = v9;
  int64_t v11 = [(CLTripSegmentOutputData *)self modeOfTransport];
  [(CLTripSegmentOutputData *)self distance_m];
  double v13 = v12;
  [(CLTripSegmentOutputData *)self distanceUnc_m];
  double v15 = v14;
  v16 = [(CLTripSegmentOutputData *)self tripLocations];

  return (id)[v4 initWithTripSegmentID:v5 isFinalPart:v6 startDate:v7 endDate:v8 duration:v11 modeOfTransport:v16 distance:v10 distanceUnc:v13 tripLocations:v15];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLTripSegmentOutputData;
  [(CLTripSegmentOutputData *)&v3 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", -[CLTripSegmentOutputData tripSegmentID](self, "tripSegmentID"), @"tripSegmentID");
  objc_msgSend(a3, "encodeBool:forKey:", -[CLTripSegmentOutputData isFinalPart](self, "isFinalPart"), @"isFinalPart");
  objc_msgSend(a3, "encodeInteger:forKey:", -[CLTripSegmentOutputData modeOfTransport](self, "modeOfTransport"), @"modeOfTransport");
  objc_msgSend(a3, "encodeObject:forKey:", -[CLTripSegmentOutputData startDate](self, "startDate"), @"startDate");
  objc_msgSend(a3, "encodeObject:forKey:", -[CLTripSegmentOutputData endDate](self, "endDate"), @"endDate");
  [(CLTripSegmentOutputData *)self duration_s];
  objc_msgSend(a3, "encodeDouble:forKey:", @"duration");
  [(CLTripSegmentOutputData *)self distance_m];
  objc_msgSend(a3, "encodeDouble:forKey:", @"distance");
  [(CLTripSegmentOutputData *)self distanceUnc_m];
  objc_msgSend(a3, "encodeDouble:forKey:", @"distanceUnc");
  v5 = [(CLTripSegmentOutputData *)self tripLocations];

  [a3 encodeObject:v5 forKey:@"tripLocations"];
}

- (CLTripSegmentOutputData)initWithCoder:(id)a3
{
  v4 = [CLTripSegmentOutputData alloc];
  uint64_t v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"tripSegmentID"];
  uint64_t v6 = [a3 decodeBoolForKey:@"isFinalPart"];
  uint64_t v7 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
  uint64_t v8 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
  [a3 decodeDoubleForKey:@"duration"];
  double v10 = v9;
  uint64_t v11 = [a3 decodeIntegerForKey:@"modeOfTransport"];
  [a3 decodeDoubleForKey:@"distance"];
  double v13 = v12;
  [a3 decodeDoubleForKey:@"distanceUnc"];
  double v15 = v14;
  v16 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0), @"tripLocations");

  return [(CLTripSegmentOutputData *)v4 initWithTripSegmentID:v5 isFinalPart:v6 startDate:v7 endDate:v8 duration:v11 modeOfTransport:v18 distance:v10 distanceUnc:v13 tripLocations:v15];
}

- (NSUUID)tripSegmentID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)modeOfTransport
{
  return self->_modeOfTransport;
}

- (BOOL)isFinalPart
{
  return self->_isFinalPart;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (double)duration_s
{
  return self->_duration_s;
}

- (void)setDuration_s:(double)a3
{
  self->_duration_s = a3;
}

- (double)distance_m
{
  return self->_distance_m;
}

- (void)setDistance_m:(double)a3
{
  self->_distance_m = a3;
}

- (double)distanceUnc_m
{
  return self->_distanceUnc_m;
}

- (void)setDistanceUnc_m:(double)a3
{
  self->_distanceUnc_m = a3;
}

- (NSArray)tripLocations
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

@end