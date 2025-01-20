@interface ARGyroscopeData
+ (BOOL)supportsSecureCoding;
+ (id)grabNextFromReader:(id)a3 timestamp:(double *)a4;
- ($1AB5FA073B851C12C2339EC22442E995)rotationRate;
- (ARGyroscopeData)initWithCoder:(id)a3;
- (ARGyroscopeData)initWithDictionary:(id)a3;
- (ARGyroscopeData)initWithGyroData:(id)a3;
- (ARGyroscopeData)initWithMetadataWrapper:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)encodeToDictionary;
- (id)encodeToMetadataWrapper;
- (unint64_t)hash;
- (void)appendToWriter:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setRotationRate:(id)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation ARGyroscopeData

- (void)encodeWithCoder:(id)a3
{
  double timestamp = self->_timestamp;
  id v5 = a3;
  [v5 encodeDouble:@"timestamp" forKey:timestamp];
  [v5 encodeDouble:@"rotationX" forKey:self->_rotationRate.x];
  [v5 encodeDouble:@"rotationY" forKey:self->_rotationRate.y];
  [v5 encodeDouble:@"rotationZ" forKey:self->_rotationRate.z];
}

- (ARGyroscopeData)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ARGyroscopeData;
  id v5 = [(ARGyroscopeData *)&v12 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"timestamp"];
    -[ARGyroscopeData setTimestamp:](v5, "setTimestamp:");
    [v4 decodeDoubleForKey:@"rotationX"];
    double v7 = v6;
    [v4 decodeDoubleForKey:@"rotationY"];
    double v9 = v8;
    [v4 decodeDoubleForKey:@"rotationZ"];
    -[ARGyroscopeData setRotationRate:](v5, "setRotationRate:", v7, v9, v10);
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)encodeToDictionary
{
  v10[4] = *MEMORY[0x1E4F143B8];
  v9[0] = @"x";
  v3 = [NSNumber numberWithDouble:self->_rotationRate.x];
  v10[0] = v3;
  v9[1] = @"y";
  id v4 = [NSNumber numberWithDouble:self->_rotationRate.y];
  v10[1] = v4;
  v9[2] = @"z";
  id v5 = [NSNumber numberWithDouble:self->_rotationRate.z];
  v10[2] = v5;
  v9[3] = @"t";
  double v6 = [NSNumber numberWithDouble:self->_timestamp];
  v10[3] = v6;
  double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];

  return v7;
}

- (ARGyroscopeData)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ARGyroscopeData;
  id v5 = [(ARGyroscopeData *)&v15 init];
  if (v5)
  {
    double v6 = [v4 objectForKeyedSubscript:@"t"];
    [v6 doubleValue];
    v5->_double timestamp = v7;

    double v8 = [v4 objectForKeyedSubscript:@"x"];
    [v8 doubleValue];
    v5->_rotationRate.x = v9;

    double v10 = [v4 objectForKeyedSubscript:@"y"];
    [v10 doubleValue];
    v5->_rotationRate.y = v11;

    objc_super v12 = [v4 objectForKeyedSubscript:@"z"];
    [v12 doubleValue];
    v5->_rotationRate.z = v13;
  }
  return v5;
}

- (id)encodeToMetadataWrapper
{
  v3 = objc_opt_new();
  [v3 setTimestamp:self->_timestamp];
  float x = self->_rotationRate.x;
  id v5 = [v3 rotationRate];
  *(float *)&double v6 = x;
  [v5 setX:v6];

  float y = self->_rotationRate.y;
  double v8 = [v3 rotationRate];
  *(float *)&double v9 = y;
  [v8 setY:v9];

  float z = self->_rotationRate.z;
  double v11 = [v3 rotationRate];
  *(float *)&double v12 = z;
  [v11 setZ:v12];

  double v13 = [MEMORY[0x1E4F4D5C8] encodeGyroscopeData:v3 andAdditionalData:0];

  return v13;
}

- (ARGyroscopeData)initWithMetadataWrapper:(id)a3
{
  id v4 = [MEMORY[0x1E4F4D5C8] decodeGyro:a3];
  id v5 = [(ARGyroscopeData *)self initWithGyroData:v4];

  return v5;
}

- (ARGyroscopeData)initWithGyroData:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ARGyroscopeData;
  id v5 = [(ARGyroscopeData *)&v14 init];
  if (v5)
  {
    [v4 timestamp];
    v5->_double timestamp = v6;
    double v7 = [v4 rotationRate];
    [v7 x];
    v5->_rotationRate.float x = v8;

    double v9 = [v4 rotationRate];
    [v9 y];
    v5->_rotationRate.float y = v10;

    double v11 = [v4 rotationRate];
    [v11 z];
    v5->_rotationRate.float z = v12;
  }
  return v5;
}

- (void)appendToWriter:(id)a3
{
  id v4 = a3;
  id v14 = (id)objc_opt_new();
  [v14 setTimestamp:self->_timestamp];
  float x = self->_rotationRate.x;
  double v6 = [v14 rotationRate];
  *(float *)&double v7 = x;
  [v6 setX:v7];

  float y = self->_rotationRate.y;
  double v9 = [v14 rotationRate];
  *(float *)&double v10 = y;
  [v9 setY:v10];

  float z = self->_rotationRate.z;
  float v12 = [v14 rotationRate];
  *(float *)&double v13 = z;
  [v12 setZ:v13];

  [v4 processGyroscopeData:v14 andAdditionalData:0];
}

+ (id)grabNextFromReader:(id)a3 timestamp:(double *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  double v6 = [MEMORY[0x1E4F1CA48] array];
  double v7 = (void *)MEMORY[0x1BA9C6160]();
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 16);
  long long v21 = *MEMORY[0x1E4F1FA30];
  long long v22 = v8;
  long long v23 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 32);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  double v9 = [v5 grabNextRawGyroData:&v21 location:0];
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
        id v14 = (void *)[objc_alloc((Class)objc_opt_class()) initWithGyroData:*(void *)(*((void *)&v17 + 1) + 8 * i)];
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
    long long v5 = *(_OWORD *)&self->_rotationRate.x;
    *((void *)result + 4) = *(void *)&self->_rotationRate.z;
    *((_OWORD *)result + 1) = v5;
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
    BOOL v6 = vabdd_f64(self->_timestamp, v5[1]) < 2.22044605e-16
      && vabdd_f64(self->_rotationRate.x, v5[2]) < 0.00000011920929
      && vabdd_f64(self->_rotationRate.y, v5[3]) < 0.00000011920929
      && vabdd_f64(self->_rotationRate.z, v5[4]) < 0.00000011920929;
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

  [(ARGyroscopeData *)self timestamp];
  objc_msgSend(v6, "appendFormat:", @" timestamp=%f", v7);
  [(ARGyroscopeData *)self rotationRate];
  uint64_t v9 = v8;
  [(ARGyroscopeData *)self rotationRate];
  uint64_t v11 = v10;
  [(ARGyroscopeData *)self rotationRate];
  [v6 appendFormat:@" rotationRate=(%f, %f, %f)", v9, v11, v12];
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

- ($1AB5FA073B851C12C2339EC22442E995)rotationRate
{
  double x = self->_rotationRate.x;
  double y = self->_rotationRate.y;
  double z = self->_rotationRate.z;
  result.var2 = z;
  result.var1 = y;
  result.var0 = x;
  return result;
}

- (void)setRotationRate:(id)a3
{
  self->_rotationRate = ($83A9B0F16167884A9BDC45564D3E7367)a3;
}

@end