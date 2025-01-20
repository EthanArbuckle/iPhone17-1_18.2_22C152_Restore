@interface ARInertialState
+ (BOOL)supportsSecureCoding;
- (ARInertialState)initWithCoder:(id)a3;
- (ARInertialState)initWithCovarianceMatrix:(double *)a3;
- (BOOL)isEqual:(id)a3;
- (__n128)accelerometerBias;
- (__n128)gyroscopeBias;
- (__n128)orientation;
- (__n128)position;
- (__n128)setOrientation:(long long *)a3;
- (__n128)velocity;
- (double)covarianceMatrix;
- (void)encodeWithCoder:(id)a3;
- (void)setAccelerometerBias:(ARInertialState *)self;
- (void)setGyroscopeBias:(ARInertialState *)self;
- (void)setPosition:(ARInertialState *)self;
- (void)setVelocity:(ARInertialState *)self;
@end

@implementation ARInertialState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ARInertialState)initWithCovarianceMatrix:(double *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ARInertialState;
  v4 = [(ARInertialState *)&v7 init];
  v5 = v4;
  if (v4) {
    memcpy(v4->_covarianceMatrix, a3, sizeof(v4->_covarianceMatrix));
  }
  return v5;
}

- (double)covarianceMatrix
{
  return self->_covarianceMatrix;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1C9B8];
  covarianceMatrix = self->_covarianceMatrix;
  id v6 = a3;
  objc_super v7 = [v4 dataWithBytesNoCopy:covarianceMatrix length:1800 freeWhenDone:0];
  [v6 encodeObject:v7 forKey:@"covarianceMatrix"];
  v8 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:&self[1] length:96 freeWhenDone:0];

  [v6 encodeObject:v8 forKey:@"orientation"];
  v9 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:self->_position length:32 freeWhenDone:0];

  [v6 encodeObject:v9 forKey:@"position"];
  v10 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:self->_velocity length:32 freeWhenDone:0];

  [v6 encodeObject:v10 forKey:@"velocity"];
  v11 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:self->_accelerometerBias length:32 freeWhenDone:0];

  [v6 encodeObject:v11 forKey:@"accelerometerBias"];
  id v12 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:self->_gyroscopeBias length:32 freeWhenDone:0];

  [v6 encodeObject:v12 forKey:@"gyroscopeBias"];
}

- (ARInertialState)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"covarianceMatrix"];
  if ([v5 length] == 1800)
  {
    id v6 = v5;
    objc_super v7 = -[ARInertialState initWithCovarianceMatrix:](self, "initWithCovarianceMatrix:", [v6 bytes]);
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"orientation"];

    [v8 getBytes:&v7[1] length:96];
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"position"];

    [v9 getBytes:v7->_position length:32];
    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"velocity"];

    [v10 getBytes:v7->_velocity length:32];
    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accelerometerBias"];

    [v11 getBytes:v7->_accelerometerBias length:32];
    v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gyroscopeBias"];

    [v5 getBytes:v7->_gyroscopeBias length:32];
    self = v7;
    id v12 = self;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (float64x2_t *)v4;
    if (!memcmp(self->_covarianceMatrix, &v5->f64[1], 0x708uLL)
      && (v6 = (int64x2_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f64(*(float64x2_t *)&self[1]._covarianceMatrix[3], v5[123]), (int8x16_t)vceqq_f64(*(float64x2_t *)&self[1].super.isa, v5[121])), (int8x16_t)vceqq_f64(*(float64x2_t *)&self[1]._covarianceMatrix[7], v5[125])), (vandq_s8((int8x16_t)vdupq_laneq_s64(v6, 1), vandq_s8(vandq_s8(vandq_s8((int8x16_t)vceqq_f64(*(float64x2_t *)&self[1]._covarianceMatrix[5], v5[124]), (int8x16_t)vceqq_f64(*(float64x2_t *)&self[1]._covarianceMatrix[1], v5[122])), (int8x16_t)vceqq_f64(*(float64x2_t *)&self[1]._covarianceMatrix[9], v5[126])), (int8x16_t)v6)).u64[0] & 0x8000000000000000) != 0)&& (int64x2_t v7 = vceqq_f64(*(float64x2_t *)self->_position, v5[113]), (vandq_s8((int8x16_t)vdupq_laneq_s64(v7, 1), vandq_s8((int8x16_t)vceqq_f64(*(float64x2_t *)&self->_position[16], v5[114]), (int8x16_t)v7)).u64[0] & 0x8000000000000000) != 0)&& (v8 = vceqq_f64(*(float64x2_t *)self->_velocity, v5[115]), (vandq_s8(
             (int8x16_t)vdupq_laneq_s64(v8, 1),
             vandq_s8((int8x16_t)vceqq_f64(*(float64x2_t *)&self->_velocity[16], v5[116]), (int8x16_t)v8)).u64[0] & 0x8000000000000000) != 0)
      && (int64x2_t v9 = vceqq_f64(*(float64x2_t *)self->_accelerometerBias, v5[117]),
          (vandq_s8((int8x16_t)vdupq_laneq_s64(v9, 1), vandq_s8((int8x16_t)vceqq_f64(*(float64x2_t *)&self->_accelerometerBias[16], v5[118]), (int8x16_t)v9)).u64[0] & 0x8000000000000000) != 0))
    {
      int64x2_t v12 = vceqq_f64(*(float64x2_t *)self->_gyroscopeBias, v5[119]);
      unint64_t v10 = vandq_s8((int8x16_t)vdupq_laneq_s64(v12, 1), vandq_s8((int8x16_t)vceqq_f64(*(float64x2_t *)&self->_gyroscopeBias[16], v5[120]), (int8x16_t)v12)).u64[0] >> 63;
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (__n128)orientation
{
  long long v2 = *(_OWORD *)(a1 + 1984);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 1968);
  *(_OWORD *)(a2 + 48) = v2;
  long long v3 = *(_OWORD *)(a1 + 2016);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 2000);
  *(_OWORD *)(a2 + 80) = v3;
  __n128 result = *(__n128 *)(a1 + 1936);
  long long v5 = *(_OWORD *)(a1 + 1952);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v5;
  return result;
}

- (__n128)setOrientation:(long long *)a3
{
  long long v3 = *a3;
  *(_OWORD *)(a1 + 1952) = a3[1];
  *(_OWORD *)(a1 + 1936) = v3;
  __n128 result = (__n128)a3[2];
  long long v5 = a3[3];
  long long v6 = a3[4];
  *(_OWORD *)(a1 + 2016) = a3[5];
  *(_OWORD *)(a1 + 2000) = v6;
  *(_OWORD *)(a1 + 1984) = v5;
  *(__n128 *)(a1 + 1968) = result;
  return result;
}

- (__n128)position
{
  __n128 result = *(__n128 *)(a1 + 1808);
  long long v3 = *(_OWORD *)(a1 + 1824);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

- (void)setPosition:(ARInertialState *)self
{
  long long v3 = *v2;
  *(_OWORD *)&self->_position[16] = v2[1];
  *(_OWORD *)self->_position = v3;
}

- (__n128)velocity
{
  __n128 result = *(__n128 *)(a1 + 1840);
  long long v3 = *(_OWORD *)(a1 + 1856);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

- (void)setVelocity:(ARInertialState *)self
{
  long long v3 = *v2;
  *(_OWORD *)&self->_velocity[16] = v2[1];
  *(_OWORD *)self->_velocity = v3;
}

- (__n128)accelerometerBias
{
  __n128 result = *(__n128 *)(a1 + 1872);
  long long v3 = *(_OWORD *)(a1 + 1888);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

- (void)setAccelerometerBias:(ARInertialState *)self
{
  long long v3 = *v2;
  *(_OWORD *)&self->_accelerometerBias[16] = v2[1];
  *(_OWORD *)self->_accelerometerBias = v3;
}

- (__n128)gyroscopeBias
{
  __n128 result = *(__n128 *)(a1 + 1904);
  long long v3 = *(_OWORD *)(a1 + 1920);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

- (void)setGyroscopeBias:(ARInertialState *)self
{
  long long v3 = *v2;
  *(_OWORD *)&self->_gyroscopeBias[16] = v2[1];
  *(_OWORD *)self->_gyroscopeBias = v3;
}

@end