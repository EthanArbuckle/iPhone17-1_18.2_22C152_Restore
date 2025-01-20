@interface ARDeviceOrientationData
+ (BOOL)supportsSecureCoding;
+ (id)grabNextFromReader:(id)a3 timestamp:(double *)a4;
- ($8452678F12DBC466148836A9D382CAFC)rotationMatrix;
- (ARDeviceOrientationData)init;
- (ARDeviceOrientationData)initWithCoder:(id)a3;
- (ARDeviceOrientationData)initWithDictionary:(id)a3;
- (ARDeviceOrientationData)initWithMetadataWrapper:(id)a3;
- (ARDeviceOrientationData)initWithMotionData:(id)a3;
- (ARDeviceOrientationData)initWithTimestamp:(double)a3 rotationMatrix:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (CMDeviceMotion)deviceMotion;
- (NSString)description;
- (double)rotationMatrixENU;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)encodeToDictionary;
- (id)encodeToMetadataWrapper;
- (unint64_t)hash;
- (void)appendToWriter:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceMotion:(id)a3;
- (void)setRotationMatrix:(id *)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation ARDeviceOrientationData

- (void)setDeviceMotion:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_deviceMotion, a3);
  [v5 timestamp];
  self->_timestamp = v6;
  v7 = [v5 attitude];
  v8 = v7;
  if (v7)
  {
    [v7 rotationMatrix];
  }
  else
  {
    double v13 = 0.0;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
  }
  *(_OWORD *)&self->_rotationMatrix.m13 = v10;
  *(_OWORD *)&self->_rotationMatrix.m22 = v11;
  *(_OWORD *)&self->_rotationMatrix.m31 = v12;
  self->_rotationMatrix.m33 = v13;
  *(_OWORD *)&self->_rotationMatrix.m11 = v9;
}

- (double)rotationMatrixENU
{
  float32x4_t v1 = *(float32x4_t *)(a1 + 40);
  float32x4_t v2 = *(float32x4_t *)(a1 + 72);
  float32x4_t v24 = *(float32x4_t *)(a1 + 56);
  float32x4_t v25 = v2;
  uint64_t v26 = *(void *)(a1 + 88);
  float32x4_t v22 = *(float32x4_t *)(a1 + 24);
  float32x4_t v23 = v1;
  *(double *)&long long v3 = ARMatrix4x4FromCMRotationMatrix((double *)v22.i64);
  long long v20 = v4;
  long long v21 = v3;
  long long v18 = v6;
  long long v19 = v5;
  *(double *)v7.i64 = ARIMUtoCameraCoordinateTransform();
  uint64_t v11 = 0;
  long long v27 = v21;
  long long v28 = v20;
  long long v29 = v19;
  long long v30 = v18;
  float32x4_t v22 = 0u;
  float32x4_t v23 = 0u;
  float32x4_t v24 = 0u;
  float32x4_t v25 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v22 + v11) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v7, COERCE_FLOAT(*(long long *)((char *)&v27 + v11))), v8, *(float32x2_t *)((char *)&v27 + v11), 1), v9, *(float32x4_t *)((char *)&v27 + v11), 2), v10, *(float32x4_t *)((char *)&v27 + v11), 3);
    v11 += 16;
  }
  while (v11 != 64);
  uint64_t v12 = 0;
  float32x4_t v13 = v22;
  float32x4_t v14 = v23;
  float32x4_t v15 = v24;
  float32x4_t v16 = v25;
  long long v27 = xmmword_1B8A53590;
  long long v28 = xmmword_1B8A535A0;
  long long v29 = xmmword_1B8A535B0;
  long long v30 = xmmword_1B8A2B050;
  float32x4_t v22 = 0u;
  float32x4_t v23 = 0u;
  float32x4_t v24 = 0u;
  float32x4_t v25 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v22 + v12) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v13, COERCE_FLOAT(*(long long *)((char *)&v27 + v12))), v14, *(float32x2_t *)((char *)&v27 + v12), 1), v15, *(float32x4_t *)((char *)&v27 + v12), 2), v16, *(float32x4_t *)((char *)&v27 + v12), 3);
    v12 += 16;
  }
  while (v12 != 64);
  return *(double *)v22.i64;
}

- (ARDeviceOrientationData)init
{
  uint64_t v4 = 0;
  memset(v3, 0, sizeof(v3));
  return [(ARDeviceOrientationData *)self initWithTimestamp:v3 rotationMatrix:0.0];
}

- (ARDeviceOrientationData)initWithTimestamp:(double)a3 rotationMatrix:(id *)a4
{
  v10.receiver = self;
  v10.super_class = (Class)ARDeviceOrientationData;
  result = [(ARDeviceOrientationData *)&v10 init];
  if (result)
  {
    result->_timestamp = a3;
    *(_OWORD *)&result->_rotationMatrix.m11 = *(_OWORD *)&a4->var0;
    long long v7 = *(_OWORD *)&a4->var2;
    long long v8 = *(_OWORD *)&a4->var4;
    long long v9 = *(_OWORD *)&a4->var6;
    result->_rotationMatrix.m33 = a4->var8;
    *(_OWORD *)&result->_rotationMatrix.m31 = v9;
    *(_OWORD *)&result->_rotationMatrix.m22 = v8;
    *(_OWORD *)&result->_rotationMatrix.m13 = v7;
  }
  return result;
}

- (ARDeviceOrientationData)initWithMotionData:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ARDeviceOrientationData;
  long long v5 = [(ARDeviceOrientationData *)&v8 init];
  long long v6 = v5;
  if (v5) {
    [(ARDeviceOrientationData *)v5 setDeviceMotion:v4];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  deviceMotion = self->_deviceMotion;
  if (deviceMotion)
  {
    id v9 = a3;
    [v9 encodeObject:deviceMotion forKey:@"deviceMotion"];
  }
  else
  {
    double timestamp = self->_timestamp;
    id v6 = a3;
    [v6 encodeDouble:@"timestamp" forKey:timestamp];
    long long v7 = *(_OWORD *)&self->_rotationMatrix.m13;
    long long v8 = *(_OWORD *)&self->_rotationMatrix.m31;
    v10[2] = *(_OWORD *)&self->_rotationMatrix.m22;
    v10[3] = v8;
    double m33 = self->_rotationMatrix.m33;
    v10[0] = *(_OWORD *)&self->_rotationMatrix.m11;
    v10[1] = v7;
    objc_msgSend(v6, "ar_encodeCMRotationMatrix:forKey:", v10, @"rotationMatrix");
  }
}

- (ARDeviceOrientationData)initWithCoder:(id)a3
{
  id v4 = a3;
  long long v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceMotion"];
  if (v5)
  {
    id v6 = [(ARDeviceOrientationData *)self initWithMotionData:v5];
  }
  else
  {
    [v4 decodeDoubleForKey:@"timestamp"];
    double v8 = v7;
    uint64_t v17 = 0;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    if (v4) {
      objc_msgSend(v4, "ar_decodeCMRotationMatrixForKey:", @"rotationMatrix");
    }
    v11[2] = v15;
    v11[3] = v16;
    uint64_t v12 = v17;
    v11[0] = v13;
    v11[1] = v14;
    id v6 = [(ARDeviceOrientationData *)self initWithTimestamp:v11 rotationMatrix:v8];
  }
  id v9 = v6;

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)encodeToDictionary
{
  v8[1] = *MEMORY[0x1E4F143B8];
  deviceMotion = self->_deviceMotion;
  if (deviceMotion)
  {
    long long v3 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:deviceMotion requiringSecureCoding:1 error:0];
    id v4 = [v3 base64EncodedStringWithOptions:1];
    double v7 = @"deviceMotion";
    v8[0] = v4;
    long long v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  }
  else
  {
    long long v5 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v5;
}

- (ARDeviceOrientationData)initWithDictionary:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"deviceMotion"];
  if (v4)
  {
    long long v5 = v4;
    id v6 = [v4 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_1F120C8F0];

    double v7 = [v6 stringByReplacingOccurrencesOfString:@"\r" withString:&stru_1F120C8F0];

    double v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v7 options:1];
    id v9 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v8 error:0];
    if (v9)
    {
      self = [(ARDeviceOrientationData *)self initWithMotionData:v9];
      objc_super v10 = self;
    }
    else
    {
      objc_super v10 = 0;
    }
  }
  else
  {
    objc_super v10 = 0;
  }

  return v10;
}

- (id)encodeToMetadataWrapper
{
  return (id)[MEMORY[0x1E4F4D5C8] encodeDeviceMotionData:self->_deviceMotion andAdditionalData:0];
}

- (ARDeviceOrientationData)initWithMetadataWrapper:(id)a3
{
  id v4 = [MEMORY[0x1E4F4D5C8] decodeCMDeviceMotion:a3];
  if (v4)
  {
    self = [(ARDeviceOrientationData *)self initWithMotionData:v4];
    long long v5 = self;
  }
  else
  {
    long long v5 = 0;
  }

  return v5;
}

- (void)appendToWriter:(id)a3
{
  id v4 = a3;
  id v5 = [(ARDeviceOrientationData *)self deviceMotion];
  [v4 processDeviceMotionData:v5 andAdditionalData:0];
}

+ (id)grabNextFromReader:(id)a3 timestamp:(double *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F1CA48] array];
  double v7 = (void *)MEMORY[0x1BA9C6160]();
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 16);
  long long v21 = *MEMORY[0x1E4F1FA30];
  long long v22 = v8;
  long long v23 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 32);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = [v5 grabNextCMDeviceMotion:&v21];
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
        long long v14 = (void *)[objc_alloc((Class)objc_opt_class()) initWithMotionData:*(void *)(*((void *)&v17 + 1) + 8 * i)];
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
  deviceMotion = self->_deviceMotion;
  id v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  if (deviceMotion)
  {
    id v6 = self->_deviceMotion;
    return (id)[v5 initWithMotionData:v6];
  }
  else
  {
    double timestamp = self->_timestamp;
    long long v9 = *(_OWORD *)&self->_rotationMatrix.m13;
    long long v10 = *(_OWORD *)&self->_rotationMatrix.m31;
    v11[2] = *(_OWORD *)&self->_rotationMatrix.m22;
    v11[3] = v10;
    double m33 = self->_rotationMatrix.m33;
    v11[0] = *(_OWORD *)&self->_rotationMatrix.m11;
    v11[1] = v9;
    return (id)[v5 initWithTimestamp:v11 rotationMatrix:timestamp];
  }
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
    id v5 = (char *)v4;
    if (vabdd_f64(self->_timestamp, *((double *)v5 + 2)) >= 2.22044605e-16)
    {
      LOBYTE(v18) = 0;
    }
    else
    {
      long long v6 = *(_OWORD *)&self->_rotationMatrix.m13;
      long long v7 = *(_OWORD *)&self->_rotationMatrix.m31;
      long long v26 = *(_OWORD *)&self->_rotationMatrix.m22;
      long long v27 = v7;
      double m33 = self->_rotationMatrix.m33;
      long long v24 = *(_OWORD *)&self->_rotationMatrix.m11;
      long long v25 = v6;
      *(double *)v8.i64 = ARMatrix4x4FromCMRotationMatrix((double *)&v24);
      float32x4_t v20 = v8;
      float32x4_t v21 = v9;
      float32x4_t v22 = v10;
      float32x4_t v23 = v11;
      long long v12 = *(_OWORD *)(v5 + 56);
      long long v25 = *(_OWORD *)(v5 + 40);
      long long v26 = v12;
      long long v27 = *(_OWORD *)(v5 + 72);
      double m33 = *((double *)v5 + 11);
      long long v24 = *(_OWORD *)(v5 + 24);
      *(double *)v13.i64 = ARMatrix4x4FromCMRotationMatrix((double *)&v24);
      float32x4_t v14 = (float32x4_t)vdupq_n_s32(0x25800000u);
      unsigned int v18 = vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vcgeq_f32(v14, vabdq_f32(v20, v13)), (int8x16_t)vcgeq_f32(v14, vabdq_f32(v21, v15))), vandq_s8((int8x16_t)vcgeq_f32(v14, vabdq_f32(v22, v16)), (int8x16_t)vcgeq_f32(v14, vabdq_f32(v23, v17))))) >> 31;
    }
  }
  else
  {
    LOBYTE(v18) = 0;
  }

  return v18;
}

- (NSString)description
{
  long long v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  long long v6 = [v3 stringWithFormat:@"<%@: %p", v5, self];

  [(ARDeviceOrientationData *)self timestamp];
  objc_msgSend(v6, "appendFormat:", @" timestamp=%f", v7);
  float32x4_t v8 = [(ARDeviceOrientationData *)self deviceMotion];
  float32x4_t v9 = [v8 attitude];
  [v9 pitch];
  uint64_t v11 = v10;
  long long v12 = [(ARDeviceOrientationData *)self deviceMotion];
  float32x4_t v13 = [v12 attitude];
  [v13 roll];
  uint64_t v15 = v14;
  float32x4_t v16 = [(ARDeviceOrientationData *)self deviceMotion];
  float32x4_t v17 = [v16 attitude];
  [v17 yaw];
  objc_msgSend(v6, "appendFormat:", @" pitch=%f roll=%f yaw=%f", v11, v15, v18);

  [v6 appendString:@">"];
  return (NSString *)v6;
}

- (CMDeviceMotion)deviceMotion
{
  return self->_deviceMotion;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_double timestamp = a3;
}

- ($8452678F12DBC466148836A9D382CAFC)rotationMatrix
{
  long long v3 = *(_OWORD *)&self->var5;
  long long v4 = *(_OWORD *)&self[1].var0;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self->var7;
  *(_OWORD *)&retstr->var6 = v4;
  retstr->var8 = self[1].var2;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var3;
  *(_OWORD *)&retstr->var2 = v3;
  return self;
}

- (void)setRotationMatrix:(id *)a3
{
  *(_OWORD *)&self->_rotationMatrix.m11 = *(_OWORD *)&a3->var0;
  long long v3 = *(_OWORD *)&a3->var2;
  long long v4 = *(_OWORD *)&a3->var4;
  long long v5 = *(_OWORD *)&a3->var6;
  self->_rotationMatrix.double m33 = a3->var8;
  *(_OWORD *)&self->_rotationMatrix.m31 = v5;
  *(_OWORD *)&self->_rotationMatrix.m22 = v4;
  *(_OWORD *)&self->_rotationMatrix.m13 = v3;
}

- (void).cxx_destruct
{
}

@end