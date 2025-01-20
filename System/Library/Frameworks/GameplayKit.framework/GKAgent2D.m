@interface GKAgent2D
+ (BOOL)supportsSecureCoding;
- (GKAgent2D)init;
- (GKAgent2D)initWithCoder:(id)a3;
- (float)rotation;
- (float2)position_;
- (float2)velocity_;
- (vector_float2)position;
- (vector_float2)velocity;
- (void)applyBrakingForce:(float)a3 deltaTime:(double)a4;
- (void)applySteeringForce:(double)a3 deltaTime:;
- (void)encodeWithCoder:(id)a3;
- (void)setPosition:(vector_float2)position;
- (void)setPosition_:(float2)a3;
- (void)setRotation:(float)rotation;
- (void)updateWithDeltaTime:(NSTimeInterval)seconds;
@end

@implementation GKAgent2D

- (GKAgent2D)init
{
  v3.receiver = self;
  v3.super_class = (Class)GKAgent2D;
  return [(GKAgent *)&v3 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKAgent2D)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GKAgent2D;
  v5 = [(GKAgent *)&v7 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeFloatForKey:@"rotation"];
    -[GKAgent2D setRotation:](v5, "setRotation:");
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(GKAgent2D *)self rotation];
  objc_msgSend(v4, "encodeFloat:forKey:", @"rotation");
}

- (vector_float2)position
{
  objc_super v3 = [(GKAgent *)self vehicle];
  unsigned int v7 = COERCE_UNSIGNED_INT64((*(double (**)(void *))(*(void *)v3 + 48))(v3));
  id v4 = [(GKAgent *)self vehicle];
  (*(void (**)(void *))(*(void *)v4 + 48))(v4);
  return (vector_float2)__PAIR64__(v5, v7);
}

- (vector_float2)velocity
{
  objc_super v3 = [(GKAgent *)self vehicle];
  unsigned int v7 = COERCE_UNSIGNED_INT64((*(double (**)(void *))(*(void *)v3 + 192))(v3));
  id v4 = [(GKAgent *)self vehicle];
  (*(void (**)(void *))(*(void *)v4 + 192))(v4);
  return (vector_float2)__PAIR64__(v5, v7);
}

- (void)setPosition:(vector_float2)position
{
  objc_super v3 = [(GKAgent *)self vehicle];
  *(void *)(v3 + 44) = position.u32[0];
  *((_DWORD *)v3 + 13) = position.i32[1];
}

- (void)setPosition_:(float2)a3
{
  float var1 = a3.var1;
  float var0 = a3.var0;
  unsigned int v5 = [(GKAgent *)self vehicle];
  *((float *)v5 + 11) = var0;
  v5[12] = 0;
  *((float *)v5 + 13) = var1;
}

- (float2)position_
{
  objc_super v3 = [(GKAgent *)self vehicle];
  float v4 = (*(float (**)(void *))(*(void *)v3 + 48))(v3);
  unsigned int v5 = [(GKAgent *)self vehicle];
  (*(void (**)(void *))(*(void *)v5 + 48))(v5);
  float v7 = v6;
  float v8 = v4;
  result.float var1 = v7;
  result.float var0 = v8;
  return result;
}

- (float2)velocity_
{
  objc_super v3 = [(GKAgent *)self vehicle];
  float v4 = (*(float (**)(void *))(*(void *)v3 + 192))(v3);
  unsigned int v5 = [(GKAgent *)self vehicle];
  (*(void (**)(void *))(*(void *)v5 + 192))(v5);
  float v7 = v6;
  float v8 = v4;
  result.float var1 = v7;
  result.float var0 = v8;
  return result;
}

- (float)rotation
{
  objc_super v3 = [(GKAgent *)self vehicle];
  unsigned int v11 = COERCE_UNSIGNED_INT64((*(double (**)(void *))(*(void *)v3 + 32))(v3));
  float v4 = [(GKAgent *)self vehicle];
  (*(void (**)(void *))(*(void *)v4 + 32))(v4);
  float32x2_t v6 = vmul_f32((float32x2_t)__PAIR64__(v5, v11), (float32x2_t)__PAIR64__(v5, v11));
  v6.i32[0] = vadd_f32(v6, (float32x2_t)vdup_lane_s32((int32x2_t)v6, 1)).u32[0];
  float32x2_t v7 = vrsqrte_f32((float32x2_t)v6.u32[0]);
  float32x2_t v8 = vmul_n_f32((float32x2_t)__PAIR64__(v5, v11), vmul_f32(vrsqrts_f32((float32x2_t)v6.u32[0], vmul_f32(v7, v7)), v7).f32[0]);
  float result = atan2f(v8.f32[1], v8.f32[0]);
  if (result < 0.0) {
    return result + 6.28318531;
  }
  return result;
}

- (void)setRotation:(float)rotation
{
  __float2 v4 = __sincosf_stret(rotation);
  unsigned int v5 = [(GKAgent *)self vehicle];
  v5[8] = LODWORD(v4.__cosval);
  v5[9] = 0;
  v5[10] = LODWORD(v4.__sinval);
  float32x2_t v6 = [(GKAgent *)self vehicle];
  float32x2_t v7 = [(GKAgent *)self vehicle];
  v10[0] = (*(float (**)(void *))(*(void *)v7 + 32))(v7);
  v10[1] = v8;
  v10[2] = v9;
  (*(void (**)(void *, _DWORD *))(*(void *)v6 + 120))(v6, v10);
}

- (void)updateWithDeltaTime:(NSTimeInterval)seconds
{
  id v30 = [(GKAgent *)self delegate];
  if (v30)
  {
    unsigned int v5 = [(GKAgent *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v31 = [(GKAgent *)self delegate];
      [v31 agentWillUpdate:self];
    }
  }
  id v32 = [(GKAgent *)self behavior];
  [v32 getTotalForce:self agent:seconds];
  long long v29 = v7;

  [(GKAgent2D *)self applySteeringForce:*(double *)&v29 deltaTime:seconds];
  for (uint64_t i = 0; ; ++i)
  {
    id v33 = [(GKAgent *)self behavior];
    uint64_t v9 = [v33 goalCount];

    if (v9 <= i) {
      break;
    }
    v10 = [(GKAgent *)self behavior];
    id v34 = [v10 objectAtIndexedSubscript:i];

    unsigned int v11 = [(GKAgent *)self behavior];
    [v11 weightForGoal:v34];
    float v13 = v12;

    if ([v34 isTargetSpeedGoal])
    {
      [v34 speed];
      if (v14 < 1.0)
      {
        [v34 speed];
        float v16 = v15;
        [(GKAgent *)self speed];
        float v18 = v17;
        [(GKAgent *)self maxAcceleration];
        float v19 = v16 - v18;
        float v20 = v13 * seconds * v19;
        if (fabsf(v20) > v21)
        {
          [(GKAgent *)self maxAcceleration];
          float v20 = v22 * (float)(int)((__PAIR64__(v20 > 0.0, LODWORD(v20)) - COERCE_UNSIGNED_INT(0.0)) >> 32);
        }
        [(GKAgent *)self speed];
        float v24 = v23;
        v25 = [(GKAgent *)self vehicle];
        if ((float)(int)((__PAIR64__(v19 > 0.0, LODWORD(v19)) - COERCE_UNSIGNED_INT(0.0)) >> 32) == (float)(int)((__PAIR64__((float)(v16 - (float)(v24 + v20)) > 0.0, v16 - (float)(v24 + v20)) - COERCE_UNSIGNED_INT(0.0)) >> 32)) {
          v26.n128_f32[0] = v24 + v20;
        }
        else {
          v26.n128_f32[0] = v16;
        }
        (*(void (**)(void *, __n128))(*(void *)v25 + 208))(v25, v26);
      }
    }
  }
  id v35 = [(GKAgent *)self delegate];
  if (v35)
  {
    v27 = [(GKAgent *)self delegate];
    char v28 = objc_opt_respondsToSelector();

    if (v28)
    {
      id v36 = [(GKAgent *)self delegate];
      [v36 agentDidUpdate:self];
    }
  }
}

- (void)applySteeringForce:(double)a3 deltaTime:
{
  double v4 = v3;
  long long v7 = *(_OWORD *)&a3;
  unsigned int v5 = [(GKAgent *)self vehicle];
  Vec3 v8 = (Vec3)v7;
  float v6 = v4;
  OpenSteer::SimpleVehicle::applySteeringForce(v5, &v8, v6);
}

- (void)applyBrakingForce:(float)a3 deltaTime:(double)a4
{
  float v6 = [(GKAgent *)self vehicle];

  float v7 = a4;
  OpenSteer::SimpleVehicle::applyBrakingForce(v6, a3, v7);
}

@end