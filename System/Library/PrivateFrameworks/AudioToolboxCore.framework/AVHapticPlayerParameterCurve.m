@interface AVHapticPlayerParameterCurve
+ (BOOL)supportsSecureCoding;
- (AVHapticPlayerParameterCurve)init;
- (AVHapticPlayerParameterCurve)initWithCoder:(id)a3;
- (AVHapticPlayerParameterCurve)initWithType:(unint64_t)a3 relativeTime:(double)a4 shape:(unint64_t)a5 controlPoints:(id)a6;
- (NSArray)controlPoints;
- (double)time;
- (unint64_t)shape;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setShape:(unint64_t)a3;
- (void)setTime:(double)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation AVHapticPlayerParameterCurve

- (void).cxx_destruct
{
}

- (void)setShape:(unint64_t)a3
{
  self->_shape = a3;
}

- (unint64_t)shape
{
  return self->_shape;
}

- (void)setTime:(double)a3
{
  self->_time = a3;
}

- (double)time
{
  return self->_time;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (AVHapticPlayerParameterCurve)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1CA80]);
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v5, "initWithObjects:", v6, objc_opt_class(), 0);
  int v8 = [v4 decodeInt32ForKey:@"paramCurveType"];
  [v4 decodeDoubleForKey:@"paramCurveTime"];
  double v10 = v9;
  v11 = [v4 decodeObjectOfClasses:v7 forKey:@"controlPoints"];
  v12 = [(AVHapticPlayerParameterCurve *)self initWithType:v8 relativeTime:1 shape:v11 controlPoints:v10];

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:self->_type forKey:@"paramCurveType"];
  [v4 encodeDouble:@"paramCurveTime" forKey:self->_time];
  [v4 encodeObject:self->_controlPoints forKey:@"controlPoints"];
}

- (NSArray)controlPoints
{
  return self->_controlPoints;
}

- (AVHapticPlayerParameterCurve)initWithType:(unint64_t)a3 relativeTime:(double)a4 shape:(unint64_t)a5 controlPoints:(id)a6
{
  id v10 = a6;
  v16.receiver = self;
  v16.super_class = (Class)AVHapticPlayerParameterCurve;
  v11 = [(AVHapticPlayerParameterCurve *)&v16 init];
  v12 = v11;
  if (v11)
  {
    v11->_type = a3;
    v11->_time = a4;
    v11->_shape = a5;
    uint64_t v13 = [v10 copy];
    controlPoints = v12->_controlPoints;
    v12->_controlPoints = (NSArray *)v13;
  }
  return v12;
}

- (AVHapticPlayerParameterCurve)init
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end