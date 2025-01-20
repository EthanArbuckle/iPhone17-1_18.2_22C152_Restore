@interface ARAccelerometerData
+ (BOOL)supportsSecureCoding;
+ (id)grabNextFromReader:(id)a3 timestamp:(double *)a4;
- ($1AB5FA073B851C12C2339EC22442E995)acceleration;
- (ARAccelerometerData)initWithAccelData:(id)a3;
- (ARAccelerometerData)initWithCoder:(id)a3;
- (ARAccelerometerData)initWithDictionary:(id)a3;
- (ARAccelerometerData)initWithMetadataWrapper:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (double)temperature;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)encodeToDictionary;
- (id)encodeToMetadataWrapper;
- (unint64_t)hash;
- (void)appendToWriter:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAcceleration:(id)a3;
- (void)setTemperature:(double)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation ARAccelerometerData

- (void)encodeWithCoder:(id)a3
{
  double timestamp = self->_timestamp;
  id v5 = a3;
  [v5 encodeDouble:@"timestamp" forKey:timestamp];
  [v5 encodeDouble:@"temperature" forKey:self->_temperature];
  [v5 encodeDouble:@"accelerationX" forKey:self->_acceleration.x];
  [v5 encodeDouble:@"accelerationY" forKey:self->_acceleration.y];
  [v5 encodeDouble:@"accelerationZ" forKey:self->_acceleration.z];
}

- (ARAccelerometerData)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ARAccelerometerData;
  id v5 = [(ARAccelerometerData *)&v12 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"timestamp"];
    -[ARAccelerometerData setTimestamp:](v5, "setTimestamp:");
    [v4 decodeDoubleForKey:@"temperature"];
    -[ARAccelerometerData setTemperature:](v5, "setTemperature:");
    [v4 decodeDoubleForKey:@"accelerationX"];
    double v7 = v6;
    [v4 decodeDoubleForKey:@"accelerationY"];
    double v9 = v8;
    [v4 decodeDoubleForKey:@"accelerationZ"];
    -[ARAccelerometerData setAcceleration:](v5, "setAcceleration:", v7, v9, v10);
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)encodeToDictionary
{
  v11[5] = *MEMORY[0x1E4F143B8];
  v10[0] = @"x";
  v3 = [NSNumber numberWithDouble:self->_acceleration.x];
  v11[0] = v3;
  v10[1] = @"y";
  id v4 = [NSNumber numberWithDouble:self->_acceleration.y];
  v11[1] = v4;
  v10[2] = @"z";
  id v5 = [NSNumber numberWithDouble:self->_acceleration.z];
  v11[2] = v5;
  v10[3] = @"t";
  double v6 = [NSNumber numberWithDouble:self->_timestamp];
  v11[3] = v6;
  v10[4] = @"p";
  double v7 = [NSNumber numberWithDouble:self->_temperature];
  v11[4] = v7;
  double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:5];

  return v8;
}

- (ARAccelerometerData)initWithDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ARAccelerometerData;
  id v5 = [(ARAccelerometerData *)&v17 init];
  if (v5)
  {
    double v6 = [v4 objectForKeyedSubscript:@"t"];
    [v6 doubleValue];
    v5->_double timestamp = v7;

    double v8 = [v4 objectForKeyedSubscript:@"p"];
    [v8 doubleValue];
    v5->_temperature = v9;

    double v10 = [v4 objectForKeyedSubscript:@"x"];
    [v10 doubleValue];
    v5->_acceleration.x = v11;

    objc_super v12 = [v4 objectForKeyedSubscript:@"y"];
    [v12 doubleValue];
    v5->_acceleration.y = v13;

    v14 = [v4 objectForKeyedSubscript:@"z"];
    [v14 doubleValue];
    v5->_acceleration.z = v15;
  }
  return v5;
}

- (id)encodeToMetadataWrapper
{
  v3 = objc_opt_new();
  [v3 setTimestamp:self->_timestamp];
  double temperature = self->_temperature;
  *(float *)&double temperature = temperature;
  [v3 setTemperature:temperature];
  float x = self->_acceleration.x;
  double v6 = [v3 acceleration];
  *(float *)&double v7 = x;
  [v6 setX:v7];

  float y = self->_acceleration.y;
  double v9 = [v3 acceleration];
  *(float *)&double v10 = y;
  [v9 setY:v10];

  float z = self->_acceleration.z;
  objc_super v12 = [v3 acceleration];
  *(float *)&double v13 = z;
  [v12 setZ:v13];

  v14 = [MEMORY[0x1E4F4D5C8] encodeAccelerometerData:v3 andAdditionalData:0];

  return v14;
}

- (ARAccelerometerData)initWithMetadataWrapper:(id)a3
{
  id v4 = [MEMORY[0x1E4F4D5C8] decodeAccel:a3];
  id v5 = [(ARAccelerometerData *)self initWithAccelData:v4];

  return v5;
}

- (ARAccelerometerData)initWithAccelData:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ARAccelerometerData;
  id v5 = [(ARAccelerometerData *)&v16 init];
  if (v5)
  {
    [v4 timestamp];
    v5->_double timestamp = v6;
    [v4 temperature];
    v5->_double temperature = v7;
    double v8 = [v4 acceleration];
    [v8 x];
    v5->_acceleration.float x = v9;

    double v10 = [v4 acceleration];
    [v10 y];
    v5->_acceleration.float y = v11;

    objc_super v12 = [v4 acceleration];
    [v12 z];
    v5->_acceleration.float z = v13;

    v14 = v5;
  }

  return v5;
}

- (void)appendToWriter:(id)a3
{
  id v4 = a3;
  id v15 = (id)objc_opt_new();
  [v15 setTimestamp:self->_timestamp];
  double temperature = self->_temperature;
  *(float *)&double temperature = temperature;
  [v15 setTemperature:temperature];
  float x = self->_acceleration.x;
  float v7 = [v15 acceleration];
  *(float *)&double v8 = x;
  [v7 setX:v8];

  float y = self->_acceleration.y;
  double v10 = [v15 acceleration];
  *(float *)&double v11 = y;
  [v10 setY:v11];

  float z = self->_acceleration.z;
  float v13 = [v15 acceleration];
  *(float *)&double v14 = z;
  [v13 setZ:v14];

  [v4 processAccelerometerData:v15 andAdditionalData:0];
}

+ (id)grabNextFromReader:(id)a3 timestamp:(double *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  double v6 = [MEMORY[0x1E4F1CA48] array];
  float v7 = (void *)MEMORY[0x1BA9C6160]();
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 16);
  long long v21 = *MEMORY[0x1E4F1FA30];
  long long v22 = v8;
  long long v23 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 32);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  float v9 = [v5 grabNextRawAccelData:&v21 location:0];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAccelData:*(void *)(*((void *)&v17 + 1) + 8 * i)];
        [v6 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v24 count:16];
    }
    while (v11);
  }

  *(_OWORD *)&v16.value = v21;
  v16.epoch = v22;
  *a4 = CMTimeGetSeconds(&v16);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)[(id)objc_opt_class() allocWithZone:a3];
  if (result)
  {
    *((void *)result + 1) = *(void *)&self->_timestamp;
    *((void *)result + 2) = *(void *)&self->_temperature;
    long long v5 = *(_OWORD *)&self->_acceleration.x;
    *((void *)result + 5) = *(void *)&self->_acceleration.z;
    *(_OWORD *)((char *)result + 24) = v5;
  }
  return result;
}

- (unint64_t)hash
{
  return (unint64_t)(self->_timestamp * 1000.0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    long long v5 = (double *)v4;
    BOOL v6 = vabdd_f64(self->_timestamp, v5[1]) < 0.00000011920929
      && vabdd_f64(self->_acceleration.x, v5[3]) < 0.00000011920929
      && vabdd_f64(self->_acceleration.y, v5[4]) < 0.00000011920929
      && vabdd_f64(self->_acceleration.z, v5[5]) < 0.00000011920929
      && vabdd_f64(self->_temperature, v5[2]) < 0.00000011920929;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (NSString)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  long long v5 = NSStringFromClass(v4);
  BOOL v6 = [v3 stringWithFormat:@"<%@: %p", v5, self];

  [(ARAccelerometerData *)self timestamp];
  objc_msgSend(v6, "appendFormat:", @" timestamp=%f", v7);
  [(ARAccelerometerData *)self acceleration];
  uint64_t v9 = v8;
  [(ARAccelerometerData *)self acceleration];
  uint64_t v11 = v10;
  [(ARAccelerometerData *)self acceleration];
  [v6 appendFormat:@" acceleration=(%f, %f, %f)", v9, v11, v12];
  [v6 appendString:@">"];
  return (NSString *)v6;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_double timestamp = a3;
}

- ($1AB5FA073B851C12C2339EC22442E995)acceleration
{
  double x = self->_acceleration.x;
  double y = self->_acceleration.y;
  double z = self->_acceleration.z;
  result.var2 = z;
  result.var1 = y;
  result.var0 = x;
  return result;
}

- (void)setAcceleration:(id)a3
{
  self->_acceleration = ($83A9B0F16167884A9BDC45564D3E7367)a3;
}

- (double)temperature
{
  return self->_temperature;
}

- (void)setTemperature:(double)a3
{
  self->_double temperature = a3;
}

@end