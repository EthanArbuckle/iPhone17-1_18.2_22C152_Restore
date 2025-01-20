@interface SRVisit
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CLLocationDistance)distanceFromHome;
- (NSDateInterval)arrivalDateInterval;
- (NSDateInterval)departureDateInterval;
- (NSString)description;
- (NSString)label;
- (NSUUID)identifier;
- (SRLocationCategory)locationCategory;
- (SRVisit)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5;
- (SRVisit)initWithCoder:(id)a3;
- (SRVisit)initWithDistanceFromHome:(double)a3 arrive:(id)a4 depart:(id)a5 category:(int64_t)a6 uuid:(id)a7;
- (id)binarySampleRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)sr_dictionaryRepresentation;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SRVisit

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SRVisit)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRVisit.m", 49, @"Invalid parameter not satisfying: %@", @"[decoder allowsKeyedCoding]");
  }
  [a3 decodeDoubleForKey:@"distanceFromHome"];
  double v7 = v6;
  uint64_t v8 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"arrivalDateInterval"];
  uint64_t v9 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"departureDateInterval"];
  uint64_t v10 = [a3 decodeIntegerForKey:@"locationCategory"];
  uint64_t v11 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];

  return [(SRVisit *)self initWithDistanceFromHome:v8 arrive:v9 depart:v10 category:v11 uuid:v7];
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRVisit.m", 65, @"Invalid parameter not satisfying: %@", @"[encoder allowsKeyedCoding]");
  }
  [(SRVisit *)self distanceFromHome];
  objc_msgSend(a3, "encodeDouble:forKey:", @"distanceFromHome");
  objc_msgSend(a3, "encodeObject:forKey:", -[SRVisit arrivalDateInterval](self, "arrivalDateInterval"), @"arrivalDateInterval");
  objc_msgSend(a3, "encodeObject:forKey:", -[SRVisit departureDateInterval](self, "departureDateInterval"), @"departureDateInterval");
  objc_msgSend(a3, "encodeInteger:forKey:", -[SRVisit locationCategory](self, "locationCategory"), @"locationCategory");
  double v6 = [(SRVisit *)self identifier];

  [a3 encodeObject:v6 forKey:@"UUID"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[SRVisit allocWithZone:a3];
  [(SRVisit *)self distanceFromHome];
  double v6 = v5;
  double v7 = [(SRVisit *)self arrivalDateInterval];
  uint64_t v8 = [(SRVisit *)self departureDateInterval];
  SRLocationCategory v9 = [(SRVisit *)self locationCategory];
  uint64_t v10 = [(SRVisit *)self identifier];

  return [(SRVisit *)v4 initWithDistanceFromHome:v7 arrive:v8 depart:v9 category:v10 uuid:v6];
}

- (SRVisit)initWithDistanceFromHome:(double)a3 arrive:(id)a4 depart:(id)a5 category:(int64_t)a6 uuid:(id)a7
{
  v15.receiver = self;
  v15.super_class = (Class)SRVisit;
  v12 = [(SRVisit *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_distanceFromHome = a3;
    v12->_arrivalDateInterval = (NSDateInterval *)a4;
    v13->_departureDateInterval = (NSDateInterval *)a5;
    v13->_locationCategory = a6;
    v13->_identifier = (NSUUID *)a7;
  }
  return v13;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SRVisit;
  [(SRVisit *)&v3 dealloc];
}

- (NSString)description
{
  id v3 = (id)objc_opt_new();
  [v3 setDateStyle:1];
  [v3 setTimeStyle:1];
  v4 = NSString;
  double v5 = [(SRVisit *)self identifier];
  double v6 = [(SRVisit *)self label];
  [(SRVisit *)self distanceFromHome];
  return (NSString *)[v4 stringWithFormat:@"loi %@(%@) distance from home %+.8f arrived %@ departed %@ ", v5, v6, v7, objc_msgSend(v3, "stringFromDateInterval:", -[SRVisit arrivalDateInterval](self, "arrivalDateInterval")), objc_msgSend(v3, "stringFromDateInterval:", -[SRVisit departureDateInterval](self, "departureDateInterval"))];
}

- (NSString)label
{
  SRLocationCategory v2 = [(SRVisit *)self locationCategory];
  if ((unint64_t)(v2 - 1) > 3) {
    return (NSString *)@"Unknown";
  }
  else {
    return &off_26452E290[v2 - 1]->isa;
  }
}

- (id)binarySampleRepresentation
{
  return (id)[MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
}

- (SRVisit)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  if (objc_msgSend(a3, "length", a5))
  {
    v11.receiver = self;
    v11.super_class = (Class)SRVisit;
    uint64_t v7 = [(SRVisit *)&v11 init];
    if (v7)
    {
      uint64_t v8 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:a3 error:0];
      if (v8)
      {
        SRLocationCategory v9 = (void *)v8;

        return (SRVisit *)v9;
      }
    }
  }
  else
  {

    return 0;
  }
  return v7;
}

- (id)sr_dictionaryRepresentation
{
  v11[7] = *MEMORY[0x263EF8340];
  v10[0] = @"distanceFromHome";
  v11[0] = [NSNumber numberWithDouble:self->_distanceFromHome];
  v10[1] = @"arrivalStartTime";
  id v3 = NSNumber;
  [[(NSDateInterval *)self->_arrivalDateInterval startDate] srAbsoluteTime];
  v11[1] = objc_msgSend(v3, "numberWithDouble:");
  v10[2] = @"arrivalDuration";
  v4 = NSNumber;
  [(NSDateInterval *)self->_arrivalDateInterval duration];
  v11[2] = objc_msgSend(v4, "numberWithDouble:");
  v10[3] = @"departureStartTime";
  double v5 = NSNumber;
  [[(NSDateInterval *)self->_departureDateInterval startDate] srAbsoluteTime];
  v11[3] = objc_msgSend(v5, "numberWithDouble:");
  v10[4] = @"departureDuration";
  double v6 = NSNumber;
  [(NSDateInterval *)self->_departureDateInterval duration];
  v11[4] = objc_msgSend(v6, "numberWithDouble:");
  v10[5] = @"locationCategory";
  v11[5] = [NSNumber numberWithInteger:self->_locationCategory];
  v10[6] = @"UUID";
  identifier = self->_identifier;
  if (identifier) {
    uint64_t v8 = [(NSUUID *)identifier UUIDString];
  }
  else {
    uint64_t v8 = &stru_26D165EC8;
  }
  v11[6] = v8;
  return (id)[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:7];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v7) = 1;
    return v7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_10;
  }
  double distanceFromHome = self->_distanceFromHome;
  [a3 distanceFromHome];
  if (distanceFromHome != v6) {
    goto LABEL_10;
  }
  int v7 = -[NSDateInterval isEqualToDateInterval:](self->_arrivalDateInterval, "isEqualToDateInterval:", [a3 arrivalDateInterval]);
  if (!v7) {
    return v7;
  }
  int v7 = -[NSDateInterval isEqualToDateInterval:](self->_departureDateInterval, "isEqualToDateInterval:", [a3 departureDateInterval]);
  if (!v7) {
    return v7;
  }
  int64_t locationCategory = self->_locationCategory;
  if (locationCategory != [a3 locationCategory])
  {
LABEL_10:
    LOBYTE(v7) = 0;
    return v7;
  }
  identifier = self->_identifier;
  uint64_t v10 = [a3 identifier];

  LOBYTE(v7) = [(NSUUID *)identifier isEqual:v10];
  return v7;
}

- (CLLocationDistance)distanceFromHome
{
  return self->_distanceFromHome;
}

- (NSDateInterval)arrivalDateInterval
{
  return (NSDateInterval *)objc_getProperty(self, a2, 16, 1);
}

- (NSDateInterval)departureDateInterval
{
  return (NSDateInterval *)objc_getProperty(self, a2, 24, 1);
}

- (SRLocationCategory)locationCategory
{
  return self->_locationCategory;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

@end