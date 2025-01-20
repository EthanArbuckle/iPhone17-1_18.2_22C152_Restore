@interface SRWristTemperatureSession
+ (BOOL)supportsSecureCoding;
+ (SRWristTemperatureSession)new;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPublishable;
- (NSDate)startDate;
- (NSEnumerator)temperatures;
- (NSMeasurement)meanQuiescentPower;
- (NSMeasurement)standardDeviationQuiescentPower;
- (NSString)description;
- (NSString)version;
- (NSTimeInterval)duration;
- (SRWristTemperatureSession)init;
- (SRWristTemperatureSession)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5;
- (SRWristTemperatureSession)initWithCoder:(id)a3;
- (SRWristTemperatureSession)initWithSession:(id)a3;
- (float)a0CorrectionCoefficient;
- (float)c0CorrectionCoefficient;
- (id)sr_dictionaryRepresentation;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SRWristTemperatureSession

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    SRLogWristTemperatureReading = (uint64_t)os_log_create("com.apple.SensorKit", "SRLogWristTemperatureReading");
  }
}

- (SRWristTemperatureSession)init
{
  return 0;
}

+ (SRWristTemperatureSession)new
{
  return 0;
}

- (SRWristTemperatureSession)initWithSession:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SRWristTemperatureSession;
  v4 = [(SRWristTemperatureSession *)&v6 init];
  if (v4) {
    v4->_healthwristTemperatureSession = (HAWristTemperatureSession *)a3;
  }
  return v4;
}

- (NSDate)startDate
{
  v2 = (void *)[(HAWristTemperatureSession *)self->_healthwristTemperatureSession sessionInterval];

  return (NSDate *)[v2 startDate];
}

- (NSTimeInterval)duration
{
  v2 = (void *)[(HAWristTemperatureSession *)self->_healthwristTemperatureSession sessionInterval];

  [v2 duration];
  return result;
}

- (NSString)version
{
  NSTimeInterval result = (NSString *)[(HAWristTemperatureSession *)self->_healthwristTemperatureSession algorithmVersion];
  if (!result) {
    return (NSString *)&stru_26D165EC8;
  }
  return result;
}

- (float)a0CorrectionCoefficient
{
  [(HAWristTemperatureSession *)self->_healthwristTemperatureSession a0CorrectionCoefficient];
  return result;
}

- (float)c0CorrectionCoefficient
{
  [(HAWristTemperatureSession *)self->_healthwristTemperatureSession c0CorrectionCoefficient];
  return result;
}

- (NSMeasurement)meanQuiescentPower
{
  return (NSMeasurement *)[(HAWristTemperatureSession *)self->_healthwristTemperatureSession meanQuiescentPower];
}

- (NSMeasurement)standardDeviationQuiescentPower
{
  return (NSMeasurement *)[(HAWristTemperatureSession *)self->_healthwristTemperatureSession stdDevQuiescentPower];
}

- (BOOL)isPublishable
{
  return [(HAWristTemperatureSession *)self->_healthwristTemperatureSession isPublishable];
}

- (void)dealloc
{
  self->_healthwristTemperatureSession = 0;
  v3.receiver = self;
  v3.super_class = (Class)SRWristTemperatureSession;
  [(SRWristTemperatureSession *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRWristTemperatureSession.m", 216, @"Invalid parameter not satisfying: %@", @"[encoder allowsKeyedCoding]");
  }
  objc_msgSend(a3, "encodeObject:forKey:", -[SRWristTemperatureSession startDate](self, "startDate"), @"startDate");
  if (self) {
    dataRepresentation = self->_dataRepresentation;
  }
  else {
    dataRepresentation = 0;
  }

  [a3 encodeObject:dataRepresentation forKey:@"dataRepresentation"];
}

- (SRWristTemperatureSession)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRWristTemperatureSession.m", 223, @"Invalid parameter not satisfying: %@", @"[decoder allowsKeyedCoding]");
  }
  objc_super v6 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
  uint64_t v7 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"dataRepresentation"];
  if (v7)
  {
    uint64_t v8 = v7;
    [v6 srAbsoluteTime];
    return -[SRWristTemperatureSession initWithBinarySampleRepresentation:metadata:timestamp:](self, "initWithBinarySampleRepresentation:metadata:timestamp:", v8, 0);
  }
  else
  {
    v10 = SRLogWristTemperatureReading;
    if (os_log_type_enabled((os_log_t)SRLogWristTemperatureReading, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_21FCA3000, v10, OS_LOG_TYPE_ERROR, "Failed to decode data", buf, 2u);
    }

    return 0;
  }
}

- (SRWristTemperatureSession)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  if (![a3 length]) {
    goto LABEL_6;
  }
  if (self) {
    objc_setProperty_nonatomic(self, v9, a3, 16);
  }
  uint64_t v10 = [MEMORY[0x263EFF910] dateWithSRAbsoluteTime:a5];
  uint64_t v11 = [objc_alloc(MEMORY[0x263F429D0]) initWithBinarySampleRepresentation:a3 metadata:a4 timestamp:v10];
  if (v11)
  {
    v12 = (void *)v11;
    v13 = [(SRWristTemperatureSession *)self initWithSession:v11];

    return v13;
  }
  else
  {
LABEL_6:

    return 0;
  }
}

- (NSEnumerator)temperatures
{
  v2 = [[SRWristTemperatureEnumerator alloc] initWithHAWristTemperatureEnumerator:[(HAWristTemperatureSession *)self->_healthwristTemperatureSession wristTemperatureEnumerator]];

  return (NSEnumerator *)v2;
}

- (NSString)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_super v6 = [(SRWristTemperatureSession *)self startDate];
  [(SRWristTemperatureSession *)self duration];
  return (NSString *)[v3 stringWithFormat:@"%@ (%p) {start date: %@, duration: %f,version: %@, temperatures: %@}", v5, self, v6, v7, -[SRWristTemperatureSession version](self, "version"), -[SRWristTemperatureSession temperatures](self, "temperatures")];
}

- (id)sr_dictionaryRepresentation
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF980] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v4 = [(SRWristTemperatureSession *)self temperatures];
  uint64_t v5 = [(NSEnumerator *)v4 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v8++), "sr_dictionaryRepresentation"));
      }
      while (v6 != v8);
      uint64_t v6 = [(NSEnumerator *)v4 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v6);
  }
  v23[0] = @"startDate";
  [(NSDate *)[(SRWristTemperatureSession *)self startDate] timeIntervalSinceReferenceDate];
  double v10 = v9;
  uint64_t v11 = objc_msgSend(NSNumber, "numberWithDouble:");
  if (fabs(v10) == INFINITY) {
    v12 = @"inf";
  }
  else {
    v12 = (__CFString *)v11;
  }
  v24[0] = v12;
  v23[1] = @"duration";
  [(SRWristTemperatureSession *)self duration];
  double v14 = v13;
  uint64_t v15 = objc_msgSend(NSNumber, "numberWithDouble:");
  if (fabs(v14) == INFINITY) {
    v16 = @"inf";
  }
  else {
    v16 = (__CFString *)v15;
  }
  v24[1] = v16;
  v23[2] = @"version";
  v17 = [(SRWristTemperatureSession *)self version];
  v23[3] = @"temperatures";
  v24[2] = v17;
  v24[3] = v3;
  return (id)[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v5) = 1;
    return v5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_13;
  }
  int v5 = -[NSDate isEqualToDate:](-[SRWristTemperatureSession startDate](self, "startDate"), "isEqualToDate:", [a3 startDate]);
  if (!v5) {
    return v5;
  }
  [(SRWristTemperatureSession *)self duration];
  double v7 = v6;
  [a3 duration];
  if (v7 != v8) {
    goto LABEL_13;
  }
  int v5 = -[NSString isEqualToString:](-[SRWristTemperatureSession version](self, "version"), "isEqualToString:", [a3 version]);
  if (!v5) {
    return v5;
  }
  int v5 = -[NSArray isEqualToArray:](-[NSEnumerator allObjects](-[SRWristTemperatureSession temperatures](self, "temperatures"), "allObjects"), "isEqualToArray:", objc_msgSend((id)objc_msgSend(a3, "temperatures"), "allObjects"));
  if (!v5) {
    return v5;
  }
  [(SRWristTemperatureSession *)self a0CorrectionCoefficient];
  float v10 = v9;
  [a3 a0CorrectionCoefficient];
  if (v10 != v11
    || ([(SRWristTemperatureSession *)self c0CorrectionCoefficient],
        float v13 = v12,
        [a3 c0CorrectionCoefficient],
        v13 != v14))
  {
LABEL_13:
    LOBYTE(v5) = 0;
    return v5;
  }
  int v5 = -[NSMeasurement isEqual:](-[SRWristTemperatureSession meanQuiescentPower](self, "meanQuiescentPower"), "isEqual:", [a3 meanQuiescentPower]);
  if (v5)
  {
    uint64_t v15 = [(SRWristTemperatureSession *)self standardDeviationQuiescentPower];
    uint64_t v16 = [a3 standardDeviationQuiescentPower];
    LOBYTE(v5) = [(NSMeasurement *)v15 isEqual:v16];
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_dataRepresentation hash];
  return [(NSData *)self->_dataRepresentation length] ^ v3;
}

@end