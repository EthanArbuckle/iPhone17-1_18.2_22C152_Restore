@interface CLMinimumAltitudeCondition
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CLMinimumAltitudeCondition)initWithAltitude:(double)a3;
- (CLMinimumAltitudeCondition)initWithCoder:(id)a3;
- (double)altitude;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLMinimumAltitudeCondition

- (CLMinimumAltitudeCondition)initWithAltitude:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLMinimumAltitudeCondition;
  result = [(CLCondition *)&v5 initCondition];
  if (result) {
    result->_altitude = a3;
  }
  return result;
}

- (id)description
{
  v2 = NSString;
  [(CLMinimumAltitudeCondition *)self altitude];
  return (id)objc_msgSend(v2, "stringWithFormat:", @"CLMinimumAltitudeCondition(altitude: %+.2fm)", v3);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  uint64_t v17 = v4;
  uint64_t v18 = v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
  }
  [(CLMinimumAltitudeCondition *)self altitude];
  double v14 = round(v13 * 1000.0);
  [a3 altitude];
  return vabdd_f64(v14, round(v15 * 1000.0)) <= 2.22044605e-16;
}

- (unint64_t)hash
{
  [(CLMinimumAltitudeCondition *)self altitude];
  return vcvtad_u64_f64(v2 * 1000.0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [(CLMinimumAltitudeCondition *)self altitude];

  objc_msgSend(a3, "encodeDouble:forKey:", @"kCLMinimumAltitudeConditionAltitude");
}

- (CLMinimumAltitudeCondition)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CLMinimumAltitudeCondition;
  uint64_t v4 = -[CLCondition initWithCoder:](&v7, sel_initWithCoder_);
  [a3 decodeDoubleForKey:@"kCLMinimumAltitudeConditionAltitude"];
  v4->_altitude = v5;
  return v4;
}

- (double)altitude
{
  return self->_altitude;
}

@end