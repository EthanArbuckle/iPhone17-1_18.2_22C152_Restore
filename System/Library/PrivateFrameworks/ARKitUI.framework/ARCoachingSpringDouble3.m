@interface ARCoachingSpringDouble3
- (ARCoachingSpringDouble3)init;
- (NSArray)springs;
- (__n128)floatValue;
- (__n128)target;
- (__n128)value;
- (__n128)velocity;
- (double)dampingRatio;
- (double)response;
- (void)setDampingRatio:(double)a3;
- (void)setFloatValue:(ARCoachingSpringDouble3 *)self;
- (void)setResponse:(double)a3;
- (void)setTarget:(ARCoachingSpringDouble3 *)self;
- (void)setValue:(ARCoachingSpringDouble3 *)self;
- (void)setVelocity:(ARCoachingSpringDouble3 *)self;
- (void)stepWithDeltaTime:(double)a3;
@end

@implementation ARCoachingSpringDouble3

- (NSArray)springs
{
  return self->_springs;
}

- (__n128)value
{
  v4 = [*(id *)(a1 + 8) objectAtIndexedSubscript:0];
  [v4 value];
  unint64_t v13 = v5;
  v6 = [*(id *)(a1 + 8) objectAtIndexedSubscript:1];
  [v6 value];
  unint64_t v12 = v7;
  v8 = [*(id *)(a1 + 8) objectAtIndexedSubscript:2];
  [v8 value];
  __n128 v11 = v9;
  v9.n128_u64[0] = v13;
  v9.n128_u64[1] = v12;
  __n128 v14 = v9;

  __n128 result = v14;
  *a2 = v14;
  a2[1] = v11;
  return result;
}

- (void)setValue:(ARCoachingSpringDouble3 *)self
{
  *(_OWORD *)unint64_t v7 = *(_OWORD *)v2;
  double v4 = *(double *)(v2 + 16);
  unint64_t v5 = [(NSArray *)self->_springs objectAtIndexedSubscript:0];
  [v5 setValue:*(double *)v7];

  v6 = [(NSArray *)self->_springs objectAtIndexedSubscript:1];
  [v6 setValue:*(double *)&v7[1]];

  v8 = [(NSArray *)self->_springs objectAtIndexedSubscript:2];
  [v8 setValue:v4];
}

- (__n128)floatValue
{
  uint64_t v2 = [*(id *)(a1 + 8) objectAtIndexedSubscript:0];
  [v2 value];
  float64_t v11 = v3;
  double v4 = [*(id *)(a1 + 8) objectAtIndexedSubscript:1];
  [v4 value];
  v5.f64[0] = v11;
  v5.f64[1] = v6;
  float32x2_t v12 = vcvt_f32_f64(v5);
  unint64_t v7 = [*(id *)(a1 + 8) objectAtIndexedSubscript:2];
  [v7 value];
  *(float *)&double v8 = v8;
  unsigned __int32 v10 = LODWORD(v8);

  result.n128_u64[0] = (unint64_t)v12;
  result.n128_u32[2] = v10;
  return result;
}

- (void)setFloatValue:(ARCoachingSpringDouble3 *)self
{
  *(_OWORD *)unint64_t v7 = v2;
  double v4 = *(float *)&v2;
  float64x2_t v5 = [(NSArray *)self->_springs objectAtIndexedSubscript:0];
  [v5 setValue:v4];

  float64_t v6 = [(NSArray *)self->_springs objectAtIndexedSubscript:1];
  [v6 setValue:*((float *)v7 + 1)];

  double v8 = [(NSArray *)self->_springs objectAtIndexedSubscript:2];
  [v8 setValue:*(float *)&v7[1]];
}

- (__n128)target
{
  double v4 = [*(id *)(a1 + 8) objectAtIndexedSubscript:0];
  [v4 target];
  unint64_t v13 = v5;
  float64_t v6 = [*(id *)(a1 + 8) objectAtIndexedSubscript:1];
  [v6 target];
  unint64_t v12 = v7;
  double v8 = [*(id *)(a1 + 8) objectAtIndexedSubscript:2];
  [v8 target];
  __n128 v11 = v9;
  v9.n128_u64[0] = v13;
  v9.n128_u64[1] = v12;
  __n128 v14 = v9;

  __n128 result = v14;
  *a2 = v14;
  a2[1] = v11;
  return result;
}

- (void)setTarget:(ARCoachingSpringDouble3 *)self
{
  *(_OWORD *)unint64_t v7 = *(_OWORD *)v2;
  double v4 = *(double *)(v2 + 16);
  unint64_t v5 = [(NSArray *)self->_springs objectAtIndexedSubscript:0];
  [v5 setTarget:*(double *)v7];

  float64_t v6 = [(NSArray *)self->_springs objectAtIndexedSubscript:1];
  [v6 setTarget:*(double *)&v7[1]];

  double v8 = [(NSArray *)self->_springs objectAtIndexedSubscript:2];
  [v8 setTarget:v4];
}

- (__n128)velocity
{
  double v4 = [*(id *)(a1 + 8) objectAtIndexedSubscript:0];
  [v4 velocity];
  unint64_t v13 = v5;
  float64_t v6 = [*(id *)(a1 + 8) objectAtIndexedSubscript:1];
  [v6 velocity];
  unint64_t v12 = v7;
  double v8 = [*(id *)(a1 + 8) objectAtIndexedSubscript:2];
  [v8 velocity];
  __n128 v11 = v9;
  v9.n128_u64[0] = v13;
  v9.n128_u64[1] = v12;
  __n128 v14 = v9;

  __n128 result = v14;
  *a2 = v14;
  a2[1] = v11;
  return result;
}

- (void)setVelocity:(ARCoachingSpringDouble3 *)self
{
  *(_OWORD *)unint64_t v7 = *(_OWORD *)v2;
  double v4 = *(double *)(v2 + 16);
  unint64_t v5 = [(NSArray *)self->_springs objectAtIndexedSubscript:0];
  [v5 setVelocity:*(double *)v7];

  float64_t v6 = [(NSArray *)self->_springs objectAtIndexedSubscript:1];
  [v6 setVelocity:*(double *)&v7[1]];

  double v8 = [(NSArray *)self->_springs objectAtIndexedSubscript:2];
  [v8 setVelocity:v4];
}

- (double)response
{
  return self->_response;
}

- (void)setResponse:(double)a3
{
  unint64_t v5 = [(NSArray *)self->_springs objectAtIndexedSubscript:0];
  [v5 parameters];
  double v7 = v6;
  double v8 = [(NSArray *)self->_springs objectAtIndexedSubscript:0];
  [v8 parameters];
  double v10 = v9;
  __n128 v11 = [(NSArray *)self->_springs objectAtIndexedSubscript:0];
  double v12 = ARFLSpringParametersMake([v11 parameters], v7, v10, a3);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  v19 = [(NSArray *)self->_springs objectAtIndexedSubscript:0];
  objc_msgSend(v19, "setParameters:", v12, v14, v16, v18);

  v20 = [(NSArray *)self->_springs objectAtIndexedSubscript:1];
  [v20 parameters];
  double v22 = v21;
  v23 = [(NSArray *)self->_springs objectAtIndexedSubscript:1];
  [v23 parameters];
  double v25 = v24;
  v26 = [(NSArray *)self->_springs objectAtIndexedSubscript:1];
  double v27 = ARFLSpringParametersMake([v26 parameters], v22, v25, a3);
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  v34 = [(NSArray *)self->_springs objectAtIndexedSubscript:1];
  objc_msgSend(v34, "setParameters:", v27, v29, v31, v33);

  id v49 = [(NSArray *)self->_springs objectAtIndexedSubscript:2];
  [v49 parameters];
  double v36 = v35;
  v37 = [(NSArray *)self->_springs objectAtIndexedSubscript:2];
  [v37 parameters];
  double v39 = v38;
  v40 = [(NSArray *)self->_springs objectAtIndexedSubscript:2];
  double v41 = ARFLSpringParametersMake([v40 parameters], v36, v39, a3);
  double v43 = v42;
  double v45 = v44;
  double v47 = v46;
  v48 = [(NSArray *)self->_springs objectAtIndexedSubscript:2];
  objc_msgSend(v48, "setParameters:", v41, v43, v45, v47);
}

- (double)dampingRatio
{
  return self->_dampingRatio;
}

- (void)setDampingRatio:(double)a3
{
  unint64_t v5 = [(NSArray *)self->_springs objectAtIndexedSubscript:0];
  [v5 parameters];
  double v7 = v6;
  double v8 = [(NSArray *)self->_springs objectAtIndexedSubscript:0];
  [v8 parameters];
  double v10 = v9;
  __n128 v11 = [(NSArray *)self->_springs objectAtIndexedSubscript:0];
  double v12 = ARFLSpringParametersMake([v11 parameters], a3, v7, v10);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  v19 = [(NSArray *)self->_springs objectAtIndexedSubscript:0];
  objc_msgSend(v19, "setParameters:", v12, v14, v16, v18);

  v20 = [(NSArray *)self->_springs objectAtIndexedSubscript:1];
  [v20 parameters];
  double v22 = v21;
  v23 = [(NSArray *)self->_springs objectAtIndexedSubscript:1];
  [v23 parameters];
  double v25 = v24;
  v26 = [(NSArray *)self->_springs objectAtIndexedSubscript:1];
  double v27 = ARFLSpringParametersMake([v26 parameters], a3, v22, v25);
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  v34 = [(NSArray *)self->_springs objectAtIndexedSubscript:1];
  objc_msgSend(v34, "setParameters:", v27, v29, v31, v33);

  id v49 = [(NSArray *)self->_springs objectAtIndexedSubscript:2];
  [v49 parameters];
  double v36 = v35;
  v37 = [(NSArray *)self->_springs objectAtIndexedSubscript:2];
  [v37 parameters];
  double v39 = v38;
  v40 = [(NSArray *)self->_springs objectAtIndexedSubscript:2];
  double v41 = ARFLSpringParametersMake([v40 parameters], a3, v36, v39);
  double v43 = v42;
  double v45 = v44;
  double v47 = v46;
  v48 = [(NSArray *)self->_springs objectAtIndexedSubscript:2];
  objc_msgSend(v48, "setParameters:", v41, v43, v45, v47);
}

- (ARCoachingSpringDouble3)init
{
  v14[3] = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)ARCoachingSpringDouble3;
  uint64_t v2 = [(ARCoachingSpringDouble3 *)&v13 init];
  if (v2)
  {
    double v3 = [[ARCoachingStateSpring alloc] initWithValue:1.0];
    v14[0] = v3;
    double v4 = [[ARCoachingStateSpring alloc] initWithValue:1.0];
    v14[1] = v4;
    unint64_t v5 = [[ARCoachingStateSpring alloc] initWithValue:1.0];
    v14[2] = v5;
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:3];
    springs = v2->_springs;
    v2->_springs = (NSArray *)v6;

    *(_OWORD *)&v2->_response = xmmword_20B232350;
    if ([(NSArray *)v2->_springs count])
    {
      unint64_t v8 = 0;
      do
      {
        double v9 = [(NSArray *)v2->_springs objectAtIndexedSubscript:v8];
        [v9 setTarget:1.0];

        double v10 = [(NSArray *)v2->_springs objectAtIndexedSubscript:v8];
        [v10 setValue:1.0];

        __n128 v11 = [(NSArray *)v2->_springs objectAtIndexedSubscript:v8];
        [v11 setVelocity:0.0];

        ++v8;
      }
      while ([(NSArray *)v2->_springs count] > v8);
    }
  }
  return v2;
}

- (void)stepWithDeltaTime:(double)a3
{
  if ([(NSArray *)self->_springs count])
  {
    unint64_t v5 = 0;
    do
    {
      uint64_t v6 = [(NSArray *)self->_springs objectAtIndexedSubscript:v5];
      [v6 step:a3];

      ++v5;
    }
    while ([(NSArray *)self->_springs count] > v5);
  }
}

- (void).cxx_destruct
{
}

@end