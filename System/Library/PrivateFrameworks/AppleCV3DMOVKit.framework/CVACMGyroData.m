@interface CVACMGyroData
+ (BOOL)supportsSecureCoding;
- (CVACLMotionTypeVector3)rotationRate;
- (CVACMGyroData)init;
- (CVACMGyroData)initWithCoder:(id)a3;
- (CVACMGyroData)initWithDictionary:(id)a3;
- (double)timestamp;
- (float)temperature;
- (id)debugDescription;
- (id)dictionary;
- (unint64_t)frameId;
- (unint64_t)sequenceNumber;
- (unint64_t)syncTimestamp;
- (void)encodeWithCoder:(id)a3;
- (void)setFrameId:(unint64_t)a3;
- (void)setRotationRate:(id)a3;
- (void)setSequenceNumber:(unint64_t)a3;
- (void)setSyncTimestamp:(unint64_t)a3;
- (void)setTemperature:(float)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation CVACMGyroData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CVACMGyroData)init
{
  v6.receiver = self;
  v6.super_class = (Class)CVACMGyroData;
  v2 = [(CVACMGyroData *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    rotationRate = v2->_rotationRate;
    v2->_rotationRate = (CVACLMotionTypeVector3 *)v3;
  }
  return v2;
}

- (CVACMGyroData)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(CVACMGyroData *)self init];
  if (v5)
  {
    objc_super v6 = [v4 objectForKeyedSubscript:@"x"];
    [v6 floatValue];
    -[CVACLMotionTypeVector3 setX:](v5->_rotationRate, "setX:");

    v7 = [v4 objectForKeyedSubscript:@"y"];
    [v7 floatValue];
    -[CVACLMotionTypeVector3 setY:](v5->_rotationRate, "setY:");

    v8 = [v4 objectForKeyedSubscript:@"z"];
    [v8 floatValue];
    -[CVACLMotionTypeVector3 setZ:](v5->_rotationRate, "setZ:");

    v9 = [v4 objectForKeyedSubscript:@"p"];
    [v9 floatValue];
    v5->_temperature = v10;

    v11 = [v4 objectForKeyedSubscript:@"t"];
    [v11 doubleValue];
    v5->_timestamp = v12;

    v13 = [v4 objectForKeyedSubscript:@"st"];
    v5->_syncTimestamp = [v13 unsignedLongLongValue];

    v14 = [v4 objectForKeyedSubscript:@"sn"];
    v5->_sequenceNumber = [v14 unsignedLongLongValue];

    v15 = [v4 objectForKeyedSubscript:@"fi"];
    v5->_frameId = [v15 unsignedLongLongValue];
  }
  return v5;
}

- (CVACMGyroData)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CVACMGyroData *)self init];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x21D490BF0]();
    [v4 decodeFloatForKey:@"x"];
    -[CVACLMotionTypeVector3 setX:](v5->_rotationRate, "setX:");
    [v4 decodeFloatForKey:@"y"];
    -[CVACLMotionTypeVector3 setY:](v5->_rotationRate, "setY:");
    [v4 decodeFloatForKey:@"z"];
    -[CVACLMotionTypeVector3 setZ:](v5->_rotationRate, "setZ:");
    [v4 decodeDoubleForKey:@"t"];
    v5->_timestamp = v7;
    [v4 decodeFloatForKey:@"p"];
    v5->_temperature = v8;
    v5->_syncTimestamp = [v4 decodeInt64ForKey:@"st"];
    v5->_sequenceNumber = [v4 decodeInt64ForKey:@"sn"];
    v5->_frameId = [v4 decodeInt64ForKey:@"fi"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = (void *)MEMORY[0x21D490BF0]();
  [(CVACLMotionTypeVector3 *)self->_rotationRate x];
  objc_msgSend(v6, "encodeFloat:forKey:", @"x");
  [(CVACLMotionTypeVector3 *)self->_rotationRate y];
  objc_msgSend(v6, "encodeFloat:forKey:", @"y");
  [(CVACLMotionTypeVector3 *)self->_rotationRate z];
  objc_msgSend(v6, "encodeFloat:forKey:", @"z");
  *(float *)&double v5 = self->_temperature;
  [v6 encodeFloat:@"p" forKey:v5];
  [v6 encodeDouble:@"t" forKey:self->_timestamp];
  [v6 encodeInt64:self->_syncTimestamp forKey:@"st"];
  [v6 encodeInt64:self->_sequenceNumber forKey:@"sn"];
  [v6 encodeInt64:self->_frameId forKey:@"fi"];
}

- (id)dictionary
{
  v18[8] = *MEMORY[0x263EF8340];
  v17[0] = @"x";
  uint64_t v3 = NSNumber;
  [(CVACLMotionTypeVector3 *)self->_rotationRate x];
  id v4 = objc_msgSend(v3, "numberWithFloat:");
  v18[0] = v4;
  v17[1] = @"y";
  double v5 = NSNumber;
  [(CVACLMotionTypeVector3 *)self->_rotationRate y];
  id v6 = objc_msgSend(v5, "numberWithFloat:");
  v18[1] = v6;
  v17[2] = @"z";
  double v7 = NSNumber;
  [(CVACLMotionTypeVector3 *)self->_rotationRate z];
  float v8 = objc_msgSend(v7, "numberWithFloat:");
  v18[2] = v8;
  v17[3] = @"p";
  *(float *)&double v9 = self->_temperature;
  float v10 = [NSNumber numberWithFloat:v9];
  v18[3] = v10;
  v17[4] = @"t";
  v11 = [NSNumber numberWithDouble:self->_timestamp];
  v18[4] = v11;
  v17[5] = @"st";
  double v12 = [NSNumber numberWithUnsignedLongLong:self->_syncTimestamp];
  v18[5] = v12;
  v17[6] = @"sn";
  v13 = [NSNumber numberWithUnsignedLongLong:self->_sequenceNumber];
  v18[6] = v13;
  v17[7] = @"fi";
  v14 = [NSNumber numberWithUnsignedLongLong:self->_frameId];
  v18[7] = v14;
  v15 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:8];

  return v15;
}

- (id)debugDescription
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  double v5 = [(CVACMGyroData *)self dictionary];
  id v6 = [v3 stringWithFormat:@"<%@: %@>", v4, v5];

  return v6;
}

- (CVACLMotionTypeVector3)rotationRate
{
  return self->_rotationRate;
}

- (void)setRotationRate:(id)a3
{
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (float)temperature
{
  return self->_temperature;
}

- (void)setTemperature:(float)a3
{
  self->_temperature = a3;
}

- (unint64_t)syncTimestamp
{
  return self->_syncTimestamp;
}

- (void)setSyncTimestamp:(unint64_t)a3
{
  self->_syncTimestamp = a3;
}

- (unint64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(unint64_t)a3
{
  self->_sequenceNumber = a3;
}

- (unint64_t)frameId
{
  return self->_frameId;
}

- (void)setFrameId:(unint64_t)a3
{
  self->_frameId = a3;
}

- (void).cxx_destruct
{
}

@end