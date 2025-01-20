@interface GTTelemetryRecordObject
+ (BOOL)supportsSecureCoding;
- (GTTelemetryRecordObject)initWithCoder:(id)a3;
- (float)average;
- (float)max;
- (float)min;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAverage:(float)a3;
- (void)setMax:(float)a3;
- (void)setMin:(float)a3;
@end

@implementation GTTelemetryRecordObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTTelemetryRecordObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GTTelemetryRecordObject;
  v5 = [(GTTelemetryRecordObject *)&v10 init];
  if (v5)
  {
    [v4 decodeFloatForKey:@"min"];
    v5->_min = v6;
    [v4 decodeFloatForKey:@"max"];
    v5->_max = v7;
    [v4 decodeFloatForKey:@"average"];
    v5->_average = v8;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  float min = self->_min;
  id v8 = a3;
  *(float *)&double v5 = min;
  [v8 encodeFloat:@"min" forKey:v5];
  *(float *)&double v6 = self->_max;
  [v8 encodeFloat:@"max" forKey:v6];
  *(float *)&double v7 = self->_average;
  [v8 encodeFloat:@"average" forKey:v7];
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)GTTelemetryRecordObject;
  v2 = [(GTTelemetryRecordObject *)&v4 description];
  return v2;
}

- (float)min
{
  return self->_min;
}

- (void)setMin:(float)a3
{
  self->_float min = a3;
}

- (float)max
{
  return self->_max;
}

- (void)setMax:(float)a3
{
  self->_max = a3;
}

- (float)average
{
  return self->_average;
}

- (void)setAverage:(float)a3
{
  self->_average = a3;
}

@end