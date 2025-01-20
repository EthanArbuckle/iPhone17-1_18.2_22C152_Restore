@interface GKAgent3D
+ (BOOL)supportsSecureCoding;
- (BOOL)rightHanded;
- (GKAgent3D)init;
- (GKAgent3D)initWithCoder:(id)a3;
- (matrix_float3x3)rotation;
- (vector_float3)position;
- (vector_float3)velocity;
- (void)applyBrakingForce:(float)a3 deltaTime:(double)a4;
- (void)applySteeringForce:(double)a3 deltaTime:;
- (void)encodeWithCoder:(id)a3;
- (void)setPosition:(vector_float3)position;
- (void)setRightHanded:(BOOL)rightHanded;
- (void)setRotation:(matrix_float3x3)rotation;
- (void)updateWithDeltaTime:(NSTimeInterval)seconds;
@end

@implementation GKAgent3D

- (GKAgent3D)init
{
  v3.receiver = self;
  v3.super_class = (Class)GKAgent3D;
  return [(GKAgent *)&v3 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKAgent3D)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GKAgent3D;
  v5 = [(GKAgent *)&v19 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeFloatForKey:@"rotation00"];
    unsigned int v18 = v6;
    [v4 decodeFloatForKey:@"rotation10"];
    unsigned int v17 = v7;
    [v4 decodeFloatForKey:@"rotation20"];
    unsigned int v16 = v8;
    [v4 decodeFloatForKey:@"rotation01"];
    unsigned int v15 = v9;
    [v4 decodeFloatForKey:@"rotation11"];
    unsigned int v14 = v10;
    [v4 decodeFloatForKey:@"rotation21"];
    unsigned int v13 = v11;
    [v4 decodeFloatForKey:@"rotation02"];
    [v4 decodeFloatForKey:@"rotation12"];
    [v4 decodeFloatForKey:@"rotation22"];
    -[GKAgent3D setRotation:](v5, "setRotation:", COERCE_DOUBLE(__PAIR64__(v15, v18)), COERCE_DOUBLE(__PAIR64__(v14, v17)), COERCE_DOUBLE(__PAIR64__(v13, v16)));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v19 = a3;
  [(GKAgent3D *)self rotation];
  objc_msgSend(v19, "encodeFloat:forKey:", @"rotation00");
  [(GKAgent3D *)self rotation];
  LODWORD(v5) = v4;
  [v19 encodeFloat:@"rotation10" forKey:v5];
  [(GKAgent3D *)self rotation];
  LODWORD(v7) = v6;
  [v19 encodeFloat:@"rotation20" forKey:v7];
  [(GKAgent3D *)self rotation];
  LODWORD(v8) = HIDWORD(v8);
  [v19 encodeFloat:@"rotation01" forKey:v8];
  [(GKAgent3D *)self rotation];
  LODWORD(v10) = v9;
  [v19 encodeFloat:@"rotation11" forKey:v10];
  [(GKAgent3D *)self rotation];
  LODWORD(v12) = v11;
  [v19 encodeFloat:@"rotation21" forKey:v12];
  [(GKAgent3D *)self rotation];
  LODWORD(v14) = v13;
  [v19 encodeFloat:@"rotation02" forKey:v14];
  [(GKAgent3D *)self rotation];
  LODWORD(v16) = v15;
  [v19 encodeFloat:@"rotation12" forKey:v16];
  [(GKAgent3D *)self rotation];
  LODWORD(v18) = v17;
  [v19 encodeFloat:@"rotation22" forKey:v18];
}

- (vector_float3)position
{
  objc_super v3 = [(GKAgent *)self vehicle];
  (*(void (**)(void *))(*(void *)v3 + 48))(v3);
  int v4 = [(GKAgent *)self vehicle];
  (*(void (**)(void *))(*(void *)v4 + 48))(v4);
  double v5 = [(GKAgent *)self vehicle];
  uint64_t v6 = (*(uint64_t (**)(void *))(*(void *)v5 + 48))(v5);
  result.i64[1] = v7;
  result.i64[0] = v6;
  return result;
}

- (void)setPosition:(vector_float3)position
{
  __n128 v8 = v3;
  int v4 = [(GKAgent *)self vehicle];
  v6.n128_u32[0] = v8.n128_u32[2];
  v5.n128_u32[0] = v8.n128_u32[1];
  uint64_t v7 = *(void (**)(__n128, __n128, __n128))(*(void *)v4 + 56);

  v7(v8, v5, v6);
}

- (vector_float3)velocity
{
  __n128 v3 = [(GKAgent *)self vehicle];
  (*(void (**)(void *))(*(void *)v3 + 192))(v3);
  int v4 = [(GKAgent *)self vehicle];
  (*(void (**)(void *))(*(void *)v4 + 192))(v4);
  __n128 v5 = [(GKAgent *)self vehicle];
  uint64_t v6 = (*(uint64_t (**)(void *))(*(void *)v5 + 192))(v5);
  result.i64[1] = v7;
  result.i64[0] = v6;
  return result;
}

- (BOOL)rightHanded
{
  return *(unsigned char *)([(GKAgent *)self vehicle] + 172);
}

- (void)setRightHanded:(BOOL)rightHanded
{
  *(unsigned char *)([(GKAgent *)self vehicle] + 172) = rightHanded;
  int v4 = [(GKAgent *)self vehicle];
  (*(void (**)(void *))(*v4 + 72))(v4);
  v4[7] = 0;
  *((unsigned char *)v4 + 88) = 0;
  (*(void (**)(void *, float))(*v4 + 168))(v4, 1.0);
  (*(void (**)(void *, double))(*v4 + 208))(v4, 0.0);
  (*(void (**)(void *, float))(*v4 + 184))(v4, 0.5);
  (*(void (**)(void *, float))(*v4 + 232))(v4, 1.0);
  (*(void (**)(void *, float))(*v4 + 248))(v4, 1.0);
  v4[18] = _static_vec3_zero;
  *((_DWORD *)v4 + 38) = dword_26884D848;
  v4[15] = _static_vec3_zero;
  *((_DWORD *)v4 + 32) = dword_26884D848;
  *(void *)((char *)v4 + 132) = _static_vec3_zero;
  *((_DWORD *)v4 + 35) = dword_26884D848;
  *((_DWORD *)v4 + 29) = 0;
  *((_DWORD *)v4 + 39) = 0;
  uint64_t v5 = _static_vec3_zero;
  *((_DWORD *)v4 + 42) = dword_26884D848;
  v4[20] = v5;
}

- (void)setRotation:(matrix_float3x3)rotation
{
  int v4 = [(GKAgent *)self vehicle];
  (*(void (**)(void *, simd_float3, float, float))(*(void *)v4 + 40))(v4, rotation.columns[0], rotation.columns[0].f32[1], rotation.columns[0].f32[2]);
  uint64_t v5 = [(GKAgent *)self vehicle];
  (*(void (**)(void *, simd_float3, float, float))(*(void *)v5 + 24))(v5, rotation.columns[1], rotation.columns[1].f32[1], rotation.columns[1].f32[2]);
  uint64_t v6 = [(GKAgent *)self vehicle];
  v8.n128_u32[0] = rotation.columns[2].u32[2];
  v7.n128_u32[0] = rotation.columns[2].u32[1];
  int v9 = *(void (**)(__n128, __n128, __n128))(*(void *)v6 + 8);

  v9((__n128)rotation.columns[2], v7, v8);
}

- (matrix_float3x3)rotation
{
  __n128 v3 = [(GKAgent *)self vehicle];
  v19.i64[0] = (*(double (**)(void *))(*(void *)v3 + 32))(v3);
  __int32 v18 = v4;
  __int32 v20 = v5;
  uint64_t v6 = [(GKAgent *)self vehicle];
  v16.i64[0] = (*(double (**)(void *))(*(void *)v6 + 16))(v6);
  __int32 v15 = v7;
  __int32 v17 = v8;
  v9.i32[0] = (**(float (***)(void))[(GKAgent *)self vehicle])();
  v9.i32[1] = v10;
  v9.i32[2] = v11;
  simd_float3 v12 = v19;
  v12.i32[1] = v18;
  v12.i32[2] = v20;
  simd_float3 v13 = v16;
  v13.i32[1] = v15;
  v13.i32[2] = v17;
  simd_float3 v14 = v9;
  result.columns[2] = v14;
  result.columns[1] = v13;
  result.columns[0] = v12;
  return result;
}

- (void)updateWithDeltaTime:(NSTimeInterval)seconds
{
  id v30 = [(GKAgent *)self delegate];
  if (v30)
  {
    __int32 v5 = [(GKAgent *)self delegate];
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

  [(GKAgent3D *)self applySteeringForce:*(double *)&v29 deltaTime:seconds];
  for (uint64_t i = 0; ; ++i)
  {
    id v33 = [(GKAgent *)self behavior];
    uint64_t v9 = [v33 goalCount];

    if (v9 <= i) {
      break;
    }
    __int32 v10 = [(GKAgent *)self behavior];
    id v34 = [v10 objectAtIndexedSubscript:i];

    __int32 v11 = [(GKAgent *)self behavior];
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
  __int32 v5 = [(GKAgent *)self vehicle];
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