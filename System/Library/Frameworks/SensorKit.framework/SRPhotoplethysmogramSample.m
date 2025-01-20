@interface SRPhotoplethysmogramSample
+ (BOOL)supportsSecureCoding;
+ (id)new;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPPGSample:(id)a3;
- (NSArray)accelerometerSamples;
- (NSArray)opticalSamples;
- (NSArray)usage;
- (NSDate)startDate;
- (NSMeasurement)temperature;
- (SRPhotoplethysmogramSample)init;
- (SRPhotoplethysmogramSample)initWithCoder:(id)a3;
- (SRPhotoplethysmogramSample)initWithHAPPGFrame:(id)a3;
- (SRPhotoplethysmogramSample)initWithStartDate:(id)a3 nsSinceStart:(int64_t)a4 usage:(id)a5 opticalSamples:(id)a6 accelSamples:(id)a7 degrees:(id)a8;
- (id)description;
- (int64_t)nanosecondsSinceStart;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SRPhotoplethysmogramSample

- (SRPhotoplethysmogramSample)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (SRPhotoplethysmogramSample)initWithStartDate:(id)a3 nsSinceStart:(int64_t)a4 usage:(id)a5 opticalSamples:(id)a6 accelSamples:(id)a7 degrees:(id)a8
{
  v16.receiver = self;
  v16.super_class = (Class)SRPhotoplethysmogramSample;
  v14 = [(SRPhotoplethysmogramSample *)&v16 init];
  if (v14)
  {
    v14->_startDate = (NSDate *)a3;
    v14->_nanosecondsSinceStart = a4;
    v14->_usage = (NSArray *)[a5 copy];
    v14->_opticalSamples = (NSArray *)a6;
    v14->_accelerometerSamples = (NSArray *)a7;
    v14->_temperature = (NSMeasurement *)a8;
  }
  return v14;
}

- (SRPhotoplethysmogramSample)initWithHAPPGFrame:(id)a3
{
  uint64_t v5 = objc_msgSend(MEMORY[0x263EFF8C0], "sr_arrayWithHAOpticalSamples:", objc_msgSend(a3, "opticalSamples"));
  uint64_t v6 = objc_msgSend(MEMORY[0x263EFF8C0], "sr_arrayWithHAAccelSamples:", objc_msgSend(a3, "accelSamples"));
  char v7 = [a3 usage];
  v8 = (void *)[MEMORY[0x263EFF980] array];
  v9 = v8;
  if (v7)
  {
    [v8 addObject:@"ForegroundHeartRate"];
    if ((v7 & 2) == 0)
    {
LABEL_3:
      if ((v7 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((v7 & 2) == 0)
  {
    goto LABEL_3;
  }
  [v9 addObject:@"DeepBreathing"];
  if ((v7 & 4) == 0)
  {
LABEL_4:
    if ((v7 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_10:
  [v9 addObject:@"ForegroundBloodOxygen"];
  if ((v7 & 8) != 0) {
LABEL_5:
  }
    [v9 addObject:@"BackgroundSystem"];
LABEL_6:
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithArray:v9];
  if ([a3 temperatureSample])
  {
    id v11 = objc_alloc(MEMORY[0x263F08980]);
    objc_msgSend((id)objc_msgSend(a3, "temperatureSample"), "degreesCelsius");
    v13 = objc_msgSend(v11, "initWithDoubleValue:unit:", objc_msgSend(MEMORY[0x263F08D20], "celsius"), v12);
  }
  else
  {
    v13 = 0;
  }

  v14 = -[SRPhotoplethysmogramSample initWithStartDate:nsSinceStart:usage:opticalSamples:accelSamples:degrees:]([SRPhotoplethysmogramSample alloc], "initWithStartDate:nsSinceStart:usage:opticalSamples:accelSamples:degrees:", [a3 startDate], objc_msgSend(a3, "timestamp"), v10, v5, v6, v13);
  return v14;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SRPhotoplethysmogramSample;
  [(SRPhotoplethysmogramSample *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }

  return [(SRPhotoplethysmogramSample *)self isEqualToPPGSample:a3];
}

- (BOOL)isEqualToPPGSample:(id)a3
{
  if ((-[SRPhotoplethysmogramSample temperature](self, "temperature") || [a3 temperature])
    && !-[NSMeasurement isEqual:](-[SRPhotoplethysmogramSample temperature](self, "temperature"), "isEqual:", [a3 temperature]))
  {
    return 0;
  }
  if (!-[NSDate isEqualToDate:](-[SRPhotoplethysmogramSample startDate](self, "startDate"), "isEqualToDate:", [a3 startDate]))return 0; {
  int64_t v5 = [(SRPhotoplethysmogramSample *)self nanosecondsSinceStart];
  }
  if (v5 != [a3 nanosecondsSinceStart]
    || !-[NSArray isEqual:](-[SRPhotoplethysmogramSample usage](self, "usage"), "isEqual:", [a3 usage])|| !-[NSArray isEqualToArray:](-[SRPhotoplethysmogramSample opticalSamples](self, "opticalSamples"), "isEqualToArray:", objc_msgSend(a3, "opticalSamples")))
  {
    return 0;
  }
  uint64_t v6 = [(SRPhotoplethysmogramSample *)self accelerometerSamples];
  uint64_t v7 = [a3 accelerometerSamples];

  return [(NSArray *)v6 isEqualToArray:v7];
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDate *)[(SRPhotoplethysmogramSample *)self startDate] hash];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(NSNumber, "numberWithLongLong:", -[SRPhotoplethysmogramSample nanosecondsSinceStart](self, "nanosecondsSinceStart")), "hash");
  uint64_t v5 = v3 ^ [(NSArray *)[(SRPhotoplethysmogramSample *)self usage] hash];
  uint64_t v6 = v5 ^ [(NSArray *)[(SRPhotoplethysmogramSample *)self opticalSamples] hash];
  return v4 ^ v6 ^ [(NSArray *)[(SRPhotoplethysmogramSample *)self accelerometerSamples] hash];
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"%@ (%p): startDate: %@, nanosecondsSinceStart: %lld, usage: %@, opticalSamples: %@, accelerometerSamples: %@, temperature: %@", NSStringFromClass(v4), self, -[SRPhotoplethysmogramSample startDate](self, "startDate"), -[SRPhotoplethysmogramSample nanosecondsSinceStart](self, "nanosecondsSinceStart"), -[SRPhotoplethysmogramSample usage](self, "usage"), -[SRPhotoplethysmogramSample opticalSamples](self, "opticalSamples"), -[SRPhotoplethysmogramSample accelerometerSamples](self, "accelerometerSamples"), -[SRPhotoplethysmogramSample temperature](self, "temperature")];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRPhotoplethysmogramSample.m", 560, @"Invalid parameter not satisfying: %@", @"[encoder allowsKeyedCoding]");
  }
  [a3 encodeObject:self->_startDate forKey:@"startDate"];
  [a3 encodeInt64:self->_nanosecondsSinceStart forKey:@"nanosecondsSinceStart"];
  [a3 encodeObject:self->_usage forKey:@"usage"];
  [a3 encodeObject:self->_opticalSamples forKey:@"opticalSamples"];
  [a3 encodeObject:self->_accelerometerSamples forKey:@"accelerometerSamples"];
  temperature = self->_temperature;

  [a3 encodeObject:temperature forKey:@"temperature"];
}

- (SRPhotoplethysmogramSample)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRPhotoplethysmogramSample.m", 571, @"Invalid parameter not satisfying: %@", @"[decoder allowsKeyedCoding]");
  }
  uint64_t v6 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
  uint64_t v7 = [a3 decodeInt64ForKey:@"nanosecondsSinceStart"];
  v8 = (void *)MEMORY[0x263EFFA08];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0), @"usage");
  id v11 = (void *)MEMORY[0x263EFFA08];
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0), @"opticalSamples");
  v14 = (void *)MEMORY[0x263EFFA08];
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0), @"accelerometerSamples");
  uint64_t v17 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"temperature"];

  return [(SRPhotoplethysmogramSample *)self initWithStartDate:v6 nsSinceStart:v7 usage:v10 opticalSamples:v13 accelSamples:v16 degrees:v17];
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (int64_t)nanosecondsSinceStart
{
  return self->_nanosecondsSinceStart;
}

- (NSArray)usage
{
  return self->_usage;
}

- (NSArray)opticalSamples
{
  return self->_opticalSamples;
}

- (NSArray)accelerometerSamples
{
  return self->_accelerometerSamples;
}

- (NSMeasurement)temperature
{
  return self->_temperature;
}

@end