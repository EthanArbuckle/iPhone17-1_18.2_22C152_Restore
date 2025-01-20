@interface CLTripSegmentInputData
+ (BOOL)supportsSecureCoding;
- (BOOL)isAutomotiveModeOfTransport;
- (BOOL)isCyclingModeOfTransport;
- (BOOL)isFinalPart;
- (BOOL)isPedestrianModeOfTransport;
- (CLTripSegmentInputData)initWithCoder:(id)a3;
- (CLTripSegmentInputData)initWithTripSegmentID:(id)a3 isFinalPart:(BOOL)a4 modeOfTransport:(int64_t)a5 tripLocations:(id)a6;
- (CLTripSegmentInputData)initWithTripSegmentID:(id)a3 isFinalPart:(BOOL)a4 modeOfTransport:(int64_t)a5 tripLocations:(id)a6 startTripLocation:(id)a7 stopTripLocation:(id)a8 inertialData:(id)a9;
- (CLTripSegmentInputData)initWithTripSegmentID:(id)a3 isFinalPart:(BOOL)a4 modeOfTransport:(int64_t)a5 tripLocations:(id)a6 startTripLocation:(id)a7 stopTripLocation:(id)a8 inertialOdometryData:(id)a9;
- (CLTripSegmentLocation)startTripLocation;
- (CLTripSegmentLocation)stopTripLocation;
- (NSArray)inertialData;
- (NSArray)inertialOdometryData;
- (NSArray)tripLocations;
- (NSUUID)tripSegmentID;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)modeOfTransport;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLTripSegmentInputData

- (CLTripSegmentInputData)initWithTripSegmentID:(id)a3 isFinalPart:(BOOL)a4 modeOfTransport:(int64_t)a5 tripLocations:(id)a6
{
  v13.receiver = self;
  v13.super_class = (Class)CLTripSegmentInputData;
  v10 = [(CLTripSegmentInputData *)&v13 init];
  if (v10)
  {
    v11 = (NSUUID *)a3;
    v10->_isFinalPart = a4;
    v10->_tripSegmentID = v11;
    v10->_modeOfTransport = a5;
    v10->_tripLocations = (NSArray *)a6;
  }
  return v10;
}

- (CLTripSegmentInputData)initWithTripSegmentID:(id)a3 isFinalPart:(BOOL)a4 modeOfTransport:(int64_t)a5 tripLocations:(id)a6 startTripLocation:(id)a7 stopTripLocation:(id)a8 inertialData:(id)a9
{
  v18.receiver = self;
  v18.super_class = (Class)CLTripSegmentInputData;
  v15 = [(CLTripSegmentInputData *)&v18 init];
  if (v15)
  {
    v16 = (NSUUID *)a3;
    v15->_isFinalPart = a4;
    v15->_tripSegmentID = v16;
    v15->_modeOfTransport = a5;
    v15->_tripLocations = (NSArray *)a6;
    v15->_startTripLocation = (CLTripSegmentLocation *)a7;
    v15->_stopTripLocation = (CLTripSegmentLocation *)a8;
    v15->_inertialData = (NSArray *)a9;
    v15->_inertialOdometryData = 0;
  }
  return v15;
}

- (CLTripSegmentInputData)initWithTripSegmentID:(id)a3 isFinalPart:(BOOL)a4 modeOfTransport:(int64_t)a5 tripLocations:(id)a6 startTripLocation:(id)a7 stopTripLocation:(id)a8 inertialOdometryData:(id)a9
{
  v18.receiver = self;
  v18.super_class = (Class)CLTripSegmentInputData;
  v15 = [(CLTripSegmentInputData *)&v18 init];
  if (v15)
  {
    v16 = (NSUUID *)a3;
    v15->_isFinalPart = a4;
    v15->_tripSegmentID = v16;
    v15->_modeOfTransport = a5;
    v15->_tripLocations = (NSArray *)a6;
    v15->_startTripLocation = (CLTripSegmentLocation *)a7;
    v15->_stopTripLocation = (CLTripSegmentLocation *)a8;
    v15->_inertialData = 0;
    v15->_inertialOdometryData = (NSArray *)a9;
  }
  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithTripSegmentID:isFinalPart:modeOfTransport:tripLocations:startTripLocation:stopTripLocation:inertialOdometryData:", -[CLTripSegmentInputData tripSegmentID](self, "tripSegmentID"), -[CLTripSegmentInputData isFinalPart](self, "isFinalPart"), -[CLTripSegmentInputData modeOfTransport](self, "modeOfTransport"), -[CLTripSegmentInputData tripLocations](self, "tripLocations"), -[CLTripSegmentInputData startTripLocation](self, "startTripLocation"), -[CLTripSegmentInputData stopTripLocation](self, "stopTripLocation"), -[CLTripSegmentInputData inertialOdometryData](self, "inertialOdometryData"));
  v4[4] = [(CLTripSegmentInputData *)self inertialData];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLTripSegmentInputData;
  [(CLTripSegmentInputData *)&v3 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", -[CLTripSegmentInputData tripSegmentID](self, "tripSegmentID"), @"tripSegmentID");
  objc_msgSend(a3, "encodeBool:forKey:", -[CLTripSegmentInputData isFinalPart](self, "isFinalPart"), @"isFinalPart");
  objc_msgSend(a3, "encodeInteger:forKey:", -[CLTripSegmentInputData modeOfTransport](self, "modeOfTransport"), @"modeOfTransport");
  objc_msgSend(a3, "encodeObject:forKey:", -[CLTripSegmentInputData inertialData](self, "inertialData"), @"inertialData");
  objc_msgSend(a3, "encodeObject:forKey:", -[CLTripSegmentInputData tripLocations](self, "tripLocations"), @"tripLocations");
  objc_msgSend(a3, "encodeObject:forKey:", -[CLTripSegmentInputData startTripLocation](self, "startTripLocation"), @"tripStartLocation");
  objc_msgSend(a3, "encodeObject:forKey:", -[CLTripSegmentInputData stopTripLocation](self, "stopTripLocation"), @"tripStopLocation");
  v5 = [(CLTripSegmentInputData *)self inertialOdometryData];

  [a3 encodeObject:v5 forKey:@"inertialOdometryData"];
}

- (CLTripSegmentInputData)initWithCoder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CLTripSegmentInputData;
  v4 = [(CLTripSegmentInputData *)&v12 init];
  if (v4)
  {
    v4->_tripSegmentID = (NSUUID *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"tripSegmentID"];
    v4->_isFinalPart = [a3 decodeBoolForKey:@"isFinalPart"];
    v4->_modeOfTransport = [a3 decodeIntegerForKey:@"modeOfTransport"];
    v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = objc_opt_class();
    v4->_tripLocations = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), @"tripLocations");
    v4->_startTripLocation = (CLTripSegmentLocation *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"tripStartLocation"];
    v4->_stopTripLocation = (CLTripSegmentLocation *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"tripStopLocation"];
    v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    v4->_inertialData = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0), @"inertialData");
    v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    v4->_inertialOdometryData = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0), @"inertialOdometryData");
  }
  return v4;
}

- (BOOL)isAutomotiveModeOfTransport
{
  return self->_modeOfTransport == 1;
}

- (BOOL)isPedestrianModeOfTransport
{
  return self->_modeOfTransport == 2;
}

- (BOOL)isCyclingModeOfTransport
{
  return self->_modeOfTransport == 3;
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

- (NSArray)inertialData
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)tripLocations
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (CLTripSegmentLocation)startTripLocation
{
  return (CLTripSegmentLocation *)objc_getProperty(self, a2, 48, 1);
}

- (CLTripSegmentLocation)stopTripLocation
{
  return (CLTripSegmentLocation *)objc_getProperty(self, a2, 56, 1);
}

- (NSArray)inertialOdometryData
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

@end