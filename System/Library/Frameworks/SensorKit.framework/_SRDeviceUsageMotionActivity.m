@interface _SRDeviceUsageMotionActivity
+ (BOOL)supportsSecureCoding;
+ (id)motionActivityWithActivityType:(int64_t)a3 duration:(double)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_SRDeviceUsageMotionActivity)initWithCoder:(id)a3;
- (double)duration;
- (id)sr_dictionaryRepresentation;
- (int64_t)motionActivityType;
- (void)encodeWithCoder:(id)a3;
- (void)setDuration:(double)a3;
- (void)setMotionActivityType:(int64_t)a3;
@end

@implementation _SRDeviceUsageMotionActivity

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRUsageReports.m", 820, @"Invalid parameter not satisfying: %@", @"[encoder allowsKeyedCoding]");
  }
  objc_msgSend(a3, "encodeInteger:forKey:", -[_SRDeviceUsageMotionActivity motionActivityType](self, "motionActivityType"), @"motionActivityType");
  [(_SRDeviceUsageMotionActivity *)self duration];

  objc_msgSend(a3, "encodeDouble:forKey:", @"duration");
}

- (_SRDeviceUsageMotionActivity)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRUsageReports.m", 826, @"Invalid parameter not satisfying: %@", @"[decoder allowsKeyedCoding]");
  }
  int64_t v6 = [a3 decodeIntegerForKey:@"motionActivityType"];
  [a3 decodeDoubleForKey:@"duration"];
  double v8 = v7;

  result = objc_alloc_init(_SRDeviceUsageMotionActivity);
  result->_motionActivityType = v6;
  result->_duration = v8;
  return result;
}

+ (id)motionActivityWithActivityType:(int64_t)a3 duration:(double)a4
{
  int64_t v6 = objc_alloc_init(_SRDeviceUsageMotionActivity);
  [(_SRDeviceUsageMotionActivity *)v6 setMotionActivityType:a3];
  [(_SRDeviceUsageMotionActivity *)v6 setDuration:a4];

  return v6;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  int64_t v6 = [(_SRDeviceUsageMotionActivity *)self motionActivityType];
  [(_SRDeviceUsageMotionActivity *)self duration];
  return (NSString *)[v3 stringWithFormat:@"%@ {activityType: %ld, duration: %f}", v5, v6, v7];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  int64_t motionActivityType = self->_motionActivityType;
  if (motionActivityType != [a3 motionActivityType]) {
    return 0;
  }
  double duration = self->_duration;
  [a3 duration];
  return duration == v7;
}

- (id)sr_dictionaryRepresentation
{
  v6[2] = *MEMORY[0x263EF8340];
  v5[0] = @"motionActivityType";
  uint64_t v3 = [NSNumber numberWithInteger:self->_motionActivityType];
  v5[1] = @"duration";
  v6[0] = v3;
  v6[1] = [NSNumber numberWithDouble:self->_duration];
  return (id)[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
}

- (int64_t)motionActivityType
{
  return self->_motionActivityType;
}

- (void)setMotionActivityType:(int64_t)a3
{
  self->_int64_t motionActivityType = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_double duration = a3;
}

@end