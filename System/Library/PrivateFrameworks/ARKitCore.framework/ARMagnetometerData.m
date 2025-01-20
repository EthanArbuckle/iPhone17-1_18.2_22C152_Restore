@interface ARMagnetometerData
+ (BOOL)supportsSecureCoding;
+ (id)grabNextFromReader:(id)a3 timestamp:(double *)a4;
- ($1AB5FA073B851C12C2339EC22442E995)magneticField;
- (ARMagnetometerData)initWithCoder:(id)a3;
- (ARMagnetometerData)initWithCompassData:(id)a3;
- (ARMagnetometerData)initWithMetadataWrapper:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)encodeToMetadataWrapper;
- (unint64_t)hash;
- (void)appendToWriter:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setMagneticField:(id)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation ARMagnetometerData

- (void)encodeWithCoder:(id)a3
{
  double timestamp = self->_timestamp;
  id v5 = a3;
  [v5 encodeDouble:@"timestamp" forKey:timestamp];
  [v5 encodeDouble:@"magneticFieldX" forKey:self->_magneticField.x];
  [v5 encodeDouble:@"magneticFieldY" forKey:self->_magneticField.y];
  [v5 encodeDouble:@"magneticFieldZ" forKey:self->_magneticField.z];
}

- (ARMagnetometerData)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ARMagnetometerData;
  id v5 = [(ARMagnetometerData *)&v12 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"timestamp"];
    -[ARMagnetometerData setTimestamp:](v5, "setTimestamp:");
    [v4 decodeDoubleForKey:@"magneticFieldX"];
    double v7 = v6;
    [v4 decodeDoubleForKey:@"magneticFieldY"];
    double v9 = v8;
    [v4 decodeDoubleForKey:@"magneticFieldZ"];
    -[ARMagnetometerData setMagneticField:](v5, "setMagneticField:", v7, v9, v10);
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)encodeToMetadataWrapper
{
  v3 = objc_opt_new();
  [v3 setTimestamp:self->_timestamp];
  float x = self->_magneticField.x;
  id v5 = [v3 fieldValues];
  *(float *)&double v6 = x;
  [v5 setX:v6];

  float y = self->_magneticField.y;
  double v8 = [v3 fieldValues];
  *(float *)&double v9 = y;
  [v8 setY:v9];

  float z = self->_magneticField.z;
  v11 = [v3 fieldValues];
  *(float *)&double v12 = z;
  [v11 setZ:v12];

  v13 = [MEMORY[0x1E4F4D5C8] encodeCompassData:v3];

  return v13;
}

- (ARMagnetometerData)initWithMetadataWrapper:(id)a3
{
  id v4 = [MEMORY[0x1E4F4D5C8] decodeCompass:a3];
  id v5 = [(ARMagnetometerData *)self initWithCompassData:v4];

  return v5;
}

- (ARMagnetometerData)initWithCompassData:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ARMagnetometerData;
  id v5 = [(ARMagnetometerData *)&v15 init];
  if (v5)
  {
    [v4 timestamp];
    v5->_double timestamp = v6;
    double v7 = [v4 fieldValues];
    [v7 x];
    v5->_magneticField.float x = v8;

    double v9 = [v4 fieldValues];
    [v9 y];
    v5->_magneticField.float y = v10;

    v11 = [v4 fieldValues];
    [v11 z];
    v5->_magneticField.float z = v12;

    v13 = v5;
  }

  return v5;
}

- (void)appendToWriter:(id)a3
{
  id v4 = a3;
  id v14 = (id)objc_opt_new();
  [v14 setTimestamp:self->_timestamp];
  float x = self->_magneticField.x;
  double v6 = [v14 fieldValues];
  *(float *)&double v7 = x;
  [v6 setX:v7];

  float y = self->_magneticField.y;
  double v9 = [v14 fieldValues];
  *(float *)&double v10 = y;
  [v9 setY:v10];

  float z = self->_magneticField.z;
  float v12 = [v14 fieldValues];
  *(float *)&double v13 = z;
  [v12 setZ:v13];

  [v4 processCompassData:v14];
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
  double v9 = [v5 grabNextRawCompassData:&v21 location:0];
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
        id v14 = (void *)[objc_alloc((Class)objc_opt_class()) initWithCompassData:*(void *)(*((void *)&v17 + 1) + 8 * i)];
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
    long long v5 = *(_OWORD *)&self->_magneticField.x;
    *((void *)result + 4) = *(void *)&self->_magneticField.z;
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
    BOOL v6 = vabdd_f64(self->_timestamp, v5[1]) < 0.00000011920929
      && vabdd_f64(self->_magneticField.x, v5[2]) < 0.00000011920929
      && vabdd_f64(self->_magneticField.y, v5[3]) < 0.00000011920929
      && vabdd_f64(self->_magneticField.z, v5[4]) < 0.00000011920929;
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

  [(ARMagnetometerData *)self timestamp];
  objc_msgSend(v6, "appendFormat:", @" timestamp=%f", v7);
  [(ARMagnetometerData *)self magneticField];
  uint64_t v9 = v8;
  [(ARMagnetometerData *)self magneticField];
  uint64_t v11 = v10;
  [(ARMagnetometerData *)self magneticField];
  [v6 appendFormat:@" magneticField=(%f, %f, %f)", v9, v11, v12];
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

- ($1AB5FA073B851C12C2339EC22442E995)magneticField
{
  double x = self->_magneticField.x;
  double y = self->_magneticField.y;
  double z = self->_magneticField.z;
  result.var2 = z;
  result.var1 = y;
  result.var0 = x;
  return result;
}

- (void)setMagneticField:(id)a3
{
  self->_magneticField = ($83A9B0F16167884A9BDC45564D3E7367)a3;
}

@end