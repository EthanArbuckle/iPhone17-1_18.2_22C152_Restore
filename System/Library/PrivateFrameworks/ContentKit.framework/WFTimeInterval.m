@interface WFTimeInterval
+ (BOOL)supportsSecureCoding;
+ (id)objectWithWFSerializedRepresentation:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDateComponentsFormatter)timeIntervalFormatter;
- (NSString)absoluteTimeString;
- (WFTimeInterval)initWithCoder:(id)a3;
- (WFTimeInterval)initWithTimeInterval:(double)a3;
- (WFTimeInterval)initWithTimeInterval:(double)a3 allowedUnits:(unint64_t)a4 unitsStyle:(int64_t)a5 zeroFormattingBehavior:(unint64_t)a6;
- (double)timeInterval;
- (id)copyWithZone:(_NSZone *)a3;
- (id)wfSerializedRepresentation;
- (int64_t)compare:(id)a3;
- (int64_t)unitsStyle;
- (unint64_t)allowedUnits;
- (unint64_t)hash;
- (unint64_t)zeroFormattingBehavior;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFTimeInterval

- (void).cxx_destruct
{
}

- (unint64_t)zeroFormattingBehavior
{
  return self->_zeroFormattingBehavior;
}

- (int64_t)unitsStyle
{
  return self->_unitsStyle;
}

- (unint64_t)allowedUnits
{
  return self->_allowedUnits;
}

- (double)timeInterval
{
  return self->_timeInterval;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (WFTimeInterval)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeInterval"];
  [v5 doubleValue];
  double v7 = v6;

  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"allowedUnits"];
  uint64_t v9 = [v8 unsignedIntegerValue];

  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"unitsStyle"];
  uint64_t v11 = [v10 unsignedIntegerValue];

  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"zeroFormattingBehavior"];

  uint64_t v13 = [v12 unsignedIntegerValue];
  return [(WFTimeInterval *)self initWithTimeInterval:v9 allowedUnits:v11 unitsStyle:v13 zeroFormattingBehavior:v7];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  double timeInterval = self->_timeInterval;
  id v6 = a3;
  double v7 = [v4 numberWithDouble:timeInterval];
  [v6 encodeObject:v7 forKey:@"timeInterval"];

  v8 = [NSNumber numberWithUnsignedInteger:self->_allowedUnits];
  [v6 encodeObject:v8 forKey:@"allowedUnits"];

  uint64_t v9 = [NSNumber numberWithInteger:self->_unitsStyle];
  [v6 encodeObject:v9 forKey:@"unitsStyle"];

  id v10 = [NSNumber numberWithUnsignedInteger:self->_zeroFormattingBehavior];
  [v6 encodeObject:v10 forKey:@"zeroFormattingBehavior"];
}

- (id)wfSerializedRepresentation
{
  v13[1] = *MEMORY[0x263EF8340];
  v12 = @"link.contentkit.timeinterval";
  v10[0] = @"timeInterval";
  v3 = [NSNumber numberWithDouble:self->_timeInterval];
  v11[0] = v3;
  v10[1] = @"allowedUnits";
  id v4 = [NSNumber numberWithUnsignedInteger:self->_allowedUnits];
  v11[1] = v4;
  v10[2] = @"unitsStyle";
  v5 = [NSNumber numberWithInteger:self->_unitsStyle];
  v11[2] = v5;
  v10[3] = @"zeroFormattingBehavior";
  id v6 = [NSNumber numberWithUnsignedInteger:self->_zeroFormattingBehavior];
  v11[3] = v6;
  double v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:4];
  v13[0] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];

  return v8;
}

- (NSString)absoluteTimeString
{
  v3 = [(WFTimeInterval *)self timeIntervalFormatter];
  [(WFTimeInterval *)self timeInterval];
  id v4 = objc_msgSend(v3, "stringFromTimeInterval:");

  return (NSString *)v4;
}

- (NSDateComponentsFormatter)timeIntervalFormatter
{
  timeIntervalFormatter = self->_timeIntervalFormatter;
  if (!timeIntervalFormatter)
  {
    id v4 = (NSDateComponentsFormatter *)objc_opt_new();
    v5 = self->_timeIntervalFormatter;
    self->_timeIntervalFormatter = v4;

    [(NSDateComponentsFormatter *)self->_timeIntervalFormatter setAllowedUnits:self->_allowedUnits];
    [(NSDateComponentsFormatter *)self->_timeIntervalFormatter setUnitsStyle:self->_unitsStyle];
    [(NSDateComponentsFormatter *)self->_timeIntervalFormatter setZeroFormattingBehavior:self->_zeroFormattingBehavior];
    timeIntervalFormatter = self->_timeIntervalFormatter;
  }
  return timeIntervalFormatter;
}

- (int64_t)compare:(id)a3
{
  id v4 = NSNumber;
  id v5 = a3;
  [(WFTimeInterval *)self timeInterval];
  id v6 = objc_msgSend(v4, "numberWithDouble:");
  double v7 = NSNumber;
  [v5 timeInterval];
  double v9 = v8;

  id v10 = [v7 numberWithDouble:v9];
  int64_t v11 = [v6 compare:v10];

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WFTimeInterval *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(WFTimeInterval *)self timeInterval];
      double v6 = v5;
      [(WFTimeInterval *)v4 timeInterval];
      BOOL v8 = v6 == v7;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  [(WFTimeInterval *)self timeInterval];
  double v6 = v5;
  unint64_t v7 = [(WFTimeInterval *)self allowedUnits];
  int64_t v8 = [(WFTimeInterval *)self unitsStyle];
  unint64_t v9 = [(WFTimeInterval *)self zeroFormattingBehavior];
  return (id)[v4 initWithTimeInterval:v7 allowedUnits:v8 unitsStyle:v9 zeroFormattingBehavior:v6];
}

- (WFTimeInterval)initWithTimeInterval:(double)a3 allowedUnits:(unint64_t)a4 unitsStyle:(int64_t)a5 zeroFormattingBehavior:(unint64_t)a6
{
  id v10 = [(WFTimeInterval *)self init];
  int64_t v11 = v10;
  if (v10)
  {
    v10->_double timeInterval = a3;
    v12 = [NSNumber numberWithDouble:a3];
    v11->_hash = [v12 hash];

    v11->_allowedUnits = a4;
    v11->_unitsStyle = a5;
    v11->_zeroFormattingBehavior = a6;
    uint64_t v13 = v11;
  }

  return v11;
}

- (WFTimeInterval)initWithTimeInterval:(double)a3
{
  return [(WFTimeInterval *)self initWithTimeInterval:4348 allowedUnits:0 unitsStyle:1 zeroFormattingBehavior:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)objectWithWFSerializedRepresentation:(id)a3
{
  id v4 = a3;
  double v5 = [v4 wfObjectOfClass:objc_opt_class() forKey:@"link.contentkit.timeinterval"];

  double v6 = [v5 wfObjectOfClass:objc_opt_class() forKey:@"timeInterval"];
  [v6 doubleValue];
  double v8 = v7;

  unint64_t v9 = [v5 wfObjectOfClass:objc_opt_class() forKey:@"allowedUnits"];
  uint64_t v10 = [v9 unsignedIntegerValue];

  int64_t v11 = [v5 wfObjectOfClass:objc_opt_class() forKey:@"unitsStyle"];
  uint64_t v12 = [v11 unsignedIntegerValue];

  uint64_t v13 = [v5 wfObjectOfClass:objc_opt_class() forKey:@"zeroFormattingBehavior"];
  uint64_t v14 = [v13 unsignedIntegerValue];

  v15 = (void *)[objc_alloc((Class)a1) initWithTimeInterval:v10 allowedUnits:v12 unitsStyle:v14 zeroFormattingBehavior:v8];
  return v15;
}

@end