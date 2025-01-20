@interface SRWristTemperature
+ (BOOL)supportsSecureCoding;
+ (SRWristTemperature)new;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (NSDate)timestamp;
- (NSMeasurement)errorEstimate;
- (NSMeasurement)temperatureT1;
- (NSMeasurement)temperatureT2;
- (NSMeasurement)value;
- (NSString)description;
- (SRWristTemperature)init;
- (SRWristTemperature)initWithCoder:(id)a3;
- (SRWristTemperature)initWithTimestamp:(id)a3 temperature:(id)a4 condition:(unint64_t)a5 errorEstimate:(id)a6 temperatureT1:(id)a7 temperatureT2:(id)a8;
- (SRWristTemperatureCondition)condition;
- (id)sr_dictionaryRepresentation;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SRWristTemperature

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    SRLogWristTemperature = (uint64_t)os_log_create("com.apple.SensorKit", "SRLogWristTemperature");
  }
}

- (SRWristTemperature)init
{
  return 0;
}

+ (SRWristTemperature)new
{
  return 0;
}

- (SRWristTemperature)initWithTimestamp:(id)a3 temperature:(id)a4 condition:(unint64_t)a5 errorEstimate:(id)a6 temperatureT1:(id)a7 temperatureT2:(id)a8
{
  v16.receiver = self;
  v16.super_class = (Class)SRWristTemperature;
  v14 = [(SRWristTemperature *)&v16 init];
  if (v14)
  {
    v14->_timestamp = (NSDate *)a3;
    v14->_value = (NSMeasurement *)a4;
    v14->_condition = a5;
    v14->_errorEstimate = (NSMeasurement *)a6;
    v14->_temperatureT1 = (NSMeasurement *)a7;
    v14->_temperatureT2 = (NSMeasurement *)a8;
  }
  return v14;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SRWristTemperature;
  [(SRWristTemperature *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SRWristTemperature)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRWristTemperature.m", 91, @"Invalid parameter not satisfying: %@", @"[decoder allowsKeyedCoding]");
  }
  uint64_t v20 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
  v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0), @"value");
  uint64_t v9 = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"condition"), "unsignedIntegerValue");
  v10 = (void *)MEMORY[0x263EFFA08];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0), @"errorEstimate");
  v13 = (void *)MEMORY[0x263EFFA08];
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0), @"temperatureT1");
  objc_super v16 = (void *)MEMORY[0x263EFFA08];
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0), @"temperatureT2");

  return [(SRWristTemperature *)self initWithTimestamp:v20 temperature:v8 condition:v9 errorEstimate:v12 temperatureT1:v15 temperatureT2:v18];
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRWristTemperature.m", 107, @"Invalid parameter not satisfying: %@", @"[encoder allowsKeyedCoding]");
  }
  objc_msgSend(a3, "encodeObject:forKey:", -[SRWristTemperature timestamp](self, "timestamp"), @"timestamp");
  objc_msgSend(a3, "encodeObject:forKey:", -[SRWristTemperature value](self, "value"), @"value");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SRWristTemperature condition](self, "condition")), @"condition");
  objc_msgSend(a3, "encodeObject:forKey:", -[SRWristTemperature errorEstimate](self, "errorEstimate"), @"errorEstimate");
  objc_msgSend(a3, "encodeObject:forKey:", -[SRWristTemperature temperatureT1](self, "temperatureT1"), @"temperatureT1");
  v6 = [(SRWristTemperature *)self temperatureT2];

  [a3 encodeObject:v6 forKey:@"temperatureT2"];
}

- (NSString)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v3 stringWithFormat:@"%@ (%p) {timestamp: %@, value: %@, condition: %lu, errorEstimate: %@}", NSStringFromClass(v4), self, -[SRWristTemperature timestamp](self, "timestamp"), -[SRWristTemperature value](self, "value"), -[SRWristTemperature condition](self, "condition"), -[SRWristTemperature errorEstimate](self, "errorEstimate")];
}

- (id)sr_dictionaryRepresentation
{
  v17[4] = *MEMORY[0x263EF8340];
  v16[0] = @"timestamp";
  [(NSDate *)[(SRWristTemperature *)self timestamp] timeIntervalSinceReferenceDate];
  double v4 = v3;
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithDouble:");
  if (fabs(v4) == INFINITY) {
    v6 = @"inf";
  }
  else {
    v6 = (__CFString *)v5;
  }
  v17[0] = v6;
  v16[1] = @"value";
  [(NSMeasurement *)[(SRWristTemperature *)self value] doubleValue];
  double v8 = v7;
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithDouble:");
  if (fabs(v8) == INFINITY) {
    v10 = @"inf";
  }
  else {
    v10 = (__CFString *)v9;
  }
  v17[1] = v10;
  v16[2] = @"condition";
  v17[2] = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SRWristTemperature condition](self, "condition"));
  v16[3] = @"errorEstimate";
  [(NSMeasurement *)[(SRWristTemperature *)self errorEstimate] doubleValue];
  double v12 = v11;
  uint64_t v13 = objc_msgSend(NSNumber, "numberWithDouble:");
  if (fabs(v12) == INFINITY) {
    uint64_t v14 = @"inf";
  }
  else {
    uint64_t v14 = (__CFString *)v13;
  }
  v17[3] = v14;
  return (id)[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:4];
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
    goto LABEL_12;
  }
  int v5 = -[NSDate isEqual:](-[SRWristTemperature timestamp](self, "timestamp"), "isEqual:", [a3 timestamp]);
  if (!v5) {
    return v5;
  }
  int v5 = -[NSMeasurement isEqual:](-[SRWristTemperature value](self, "value"), "isEqual:", [a3 value]);
  if (!v5) {
    return v5;
  }
  SRWristTemperatureCondition v6 = [(SRWristTemperature *)self condition];
  if (v6 != [a3 condition])
  {
LABEL_12:
    LOBYTE(v5) = 0;
    return v5;
  }
  int v5 = -[NSMeasurement isEqual:](-[SRWristTemperature errorEstimate](self, "errorEstimate"), "isEqual:", [a3 errorEstimate]);
  if (v5)
  {
    int v5 = -[NSMeasurement isEqual:](-[SRWristTemperature temperatureT1](self, "temperatureT1"), "isEqual:", [a3 temperatureT1]);
    if (v5)
    {
      double v7 = [(SRWristTemperature *)self temperatureT2];
      uint64_t v8 = [a3 temperatureT2];
      LOBYTE(v5) = [(NSMeasurement *)v7 isEqual:v8];
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDate *)self->_timestamp hash];
  uint64_t v4 = v3 ^ (2 * [(NSMeasurement *)self->_value hash]);
  uint64_t v5 = v4 ^ (4
           * objc_msgSend((id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", self->_condition), "hash"));
  return v5 ^ (8 * [(NSMeasurement *)self->_errorEstimate hash]);
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (NSMeasurement)value
{
  return self->_value;
}

- (SRWristTemperatureCondition)condition
{
  return self->_condition;
}

- (NSMeasurement)errorEstimate
{
  return self->_errorEstimate;
}

- (NSMeasurement)temperatureT1
{
  return self->_temperatureT1;
}

- (NSMeasurement)temperatureT2
{
  return self->_temperatureT2;
}

@end