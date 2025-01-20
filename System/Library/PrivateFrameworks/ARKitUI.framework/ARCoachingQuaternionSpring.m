@interface ARCoachingQuaternionSpring
- (ARCoachingQuaternionSpring)init;
- (NSArray)springs;
- (double)dampingRatio;
- (double)response;
- (void)setDampingRatio:(double)a3;
- (void)setResponse:(double)a3;
- (void)setTarget:(double *)a3;
- (void)setValue:(double *)a3;
- (void)setVelocity:(double *)a3;
- (void)stepWithDeltaTime:(double)a3;
- (void)target;
- (void)value;
- (void)velocity;
@end

@implementation ARCoachingQuaternionSpring

- (NSArray)springs
{
  return self->_springs;
}

- (void)value
{
  v16 = [*(id *)(a1 + 8) objectAtIndexedSubscript:0];
  [v16 value];
  uint64_t v15 = v4;
  v5 = [*(id *)(a1 + 8) objectAtIndexedSubscript:1];
  [v5 value];
  uint64_t v14 = v6;
  v7 = [*(id *)(a1 + 8) objectAtIndexedSubscript:2];
  [v7 value];
  uint64_t v13 = v8;
  v9 = [*(id *)(a1 + 8) objectAtIndexedSubscript:3];
  [v9 value];
  *(void *)&long long v10 = v13;
  *((void *)&v10 + 1) = v11;
  *(void *)&long long v12 = v15;
  *((void *)&v12 + 1) = v14;
  *a2 = v12;
  a2[1] = v10;
}

- (void)setValue:(double *)a3
{
  double v5 = *a3;
  uint64_t v6 = [*(id *)(a1 + 8) objectAtIndexedSubscript:0];
  [v6 setValue:v5];

  double v7 = a3[1];
  uint64_t v8 = [*(id *)(a1 + 8) objectAtIndexedSubscript:1];
  [v8 setValue:v7];

  double v9 = a3[2];
  long long v10 = [*(id *)(a1 + 8) objectAtIndexedSubscript:2];
  [v10 setValue:v9];

  double v11 = a3[3];
  id v12 = [*(id *)(a1 + 8) objectAtIndexedSubscript:3];
  [v12 setValue:v11];
}

- (void)target
{
  v16 = [*(id *)(a1 + 8) objectAtIndexedSubscript:0];
  [v16 target];
  uint64_t v15 = v4;
  double v5 = [*(id *)(a1 + 8) objectAtIndexedSubscript:1];
  [v5 target];
  uint64_t v14 = v6;
  double v7 = [*(id *)(a1 + 8) objectAtIndexedSubscript:2];
  [v7 target];
  uint64_t v13 = v8;
  double v9 = [*(id *)(a1 + 8) objectAtIndexedSubscript:3];
  [v9 target];
  *(void *)&long long v10 = v13;
  *((void *)&v10 + 1) = v11;
  *(void *)&long long v12 = v15;
  *((void *)&v12 + 1) = v14;
  *a2 = v12;
  a2[1] = v10;
}

- (void)setTarget:(double *)a3
{
  double v5 = *a3;
  uint64_t v6 = [*(id *)(a1 + 8) objectAtIndexedSubscript:0];
  [v6 setTarget:v5];

  double v7 = a3[1];
  uint64_t v8 = [*(id *)(a1 + 8) objectAtIndexedSubscript:1];
  [v8 setTarget:v7];

  double v9 = a3[2];
  long long v10 = [*(id *)(a1 + 8) objectAtIndexedSubscript:2];
  [v10 setTarget:v9];

  double v11 = a3[3];
  id v12 = [*(id *)(a1 + 8) objectAtIndexedSubscript:3];
  [v12 setTarget:v11];
}

- (void)velocity
{
  v16 = [*(id *)(a1 + 8) objectAtIndexedSubscript:0];
  [v16 velocity];
  uint64_t v15 = v4;
  double v5 = [*(id *)(a1 + 8) objectAtIndexedSubscript:1];
  [v5 velocity];
  uint64_t v14 = v6;
  double v7 = [*(id *)(a1 + 8) objectAtIndexedSubscript:2];
  [v7 velocity];
  uint64_t v13 = v8;
  double v9 = [*(id *)(a1 + 8) objectAtIndexedSubscript:3];
  [v9 velocity];
  *(void *)&long long v10 = v13;
  *((void *)&v10 + 1) = v11;
  *(void *)&long long v12 = v15;
  *((void *)&v12 + 1) = v14;
  *a2 = v12;
  a2[1] = v10;
}

- (void)setVelocity:(double *)a3
{
  double v5 = *a3;
  uint64_t v6 = [*(id *)(a1 + 8) objectAtIndexedSubscript:0];
  [v6 setVelocity:v5];

  double v7 = a3[1];
  uint64_t v8 = [*(id *)(a1 + 8) objectAtIndexedSubscript:1];
  [v8 setVelocity:v7];

  double v9 = a3[2];
  long long v10 = [*(id *)(a1 + 8) objectAtIndexedSubscript:2];
  [v10 setVelocity:v9];

  double v11 = a3[3];
  id v12 = [*(id *)(a1 + 8) objectAtIndexedSubscript:3];
  [v12 setVelocity:v11];
}

- (double)response
{
  return self->_response;
}

- (void)setResponse:(double)a3
{
  double v5 = [(NSArray *)self->_springs objectAtIndexedSubscript:0];
  [v5 parameters];
  double v7 = v6;
  uint64_t v8 = [(NSArray *)self->_springs objectAtIndexedSubscript:0];
  [v8 parameters];
  double v10 = v9;
  double v11 = [(NSArray *)self->_springs objectAtIndexedSubscript:0];
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

  v35 = [(NSArray *)self->_springs objectAtIndexedSubscript:2];
  [v35 parameters];
  double v37 = v36;
  v38 = [(NSArray *)self->_springs objectAtIndexedSubscript:2];
  [v38 parameters];
  double v40 = v39;
  v41 = [(NSArray *)self->_springs objectAtIndexedSubscript:2];
  double v42 = ARFLSpringParametersMake([v41 parameters], v37, v40, a3);
  double v44 = v43;
  double v46 = v45;
  double v48 = v47;
  v49 = [(NSArray *)self->_springs objectAtIndexedSubscript:2];
  objc_msgSend(v49, "setParameters:", v42, v44, v46, v48);

  id v64 = [(NSArray *)self->_springs objectAtIndexedSubscript:3];
  [v64 parameters];
  double v51 = v50;
  v52 = [(NSArray *)self->_springs objectAtIndexedSubscript:3];
  [v52 parameters];
  double v54 = v53;
  v55 = [(NSArray *)self->_springs objectAtIndexedSubscript:3];
  double v56 = ARFLSpringParametersMake([v55 parameters], v51, v54, a3);
  double v58 = v57;
  double v60 = v59;
  double v62 = v61;
  v63 = [(NSArray *)self->_springs objectAtIndexedSubscript:3];
  objc_msgSend(v63, "setParameters:", v56, v58, v60, v62);
}

- (double)dampingRatio
{
  return self->_dampingRatio;
}

- (void)setDampingRatio:(double)a3
{
  double v5 = [(NSArray *)self->_springs objectAtIndexedSubscript:0];
  [v5 parameters];
  double v7 = v6;
  uint64_t v8 = [(NSArray *)self->_springs objectAtIndexedSubscript:0];
  [v8 parameters];
  double v10 = v9;
  double v11 = [(NSArray *)self->_springs objectAtIndexedSubscript:0];
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

  v35 = [(NSArray *)self->_springs objectAtIndexedSubscript:2];
  [v35 parameters];
  double v37 = v36;
  v38 = [(NSArray *)self->_springs objectAtIndexedSubscript:2];
  [v38 parameters];
  double v40 = v39;
  v41 = [(NSArray *)self->_springs objectAtIndexedSubscript:2];
  double v42 = ARFLSpringParametersMake([v41 parameters], a3, v37, v40);
  double v44 = v43;
  double v46 = v45;
  double v48 = v47;
  v49 = [(NSArray *)self->_springs objectAtIndexedSubscript:2];
  objc_msgSend(v49, "setParameters:", v42, v44, v46, v48);

  id v64 = [(NSArray *)self->_springs objectAtIndexedSubscript:3];
  [v64 parameters];
  double v51 = v50;
  v52 = [(NSArray *)self->_springs objectAtIndexedSubscript:3];
  [v52 parameters];
  double v54 = v53;
  v55 = [(NSArray *)self->_springs objectAtIndexedSubscript:3];
  double v56 = ARFLSpringParametersMake([v55 parameters], a3, v51, v54);
  double v58 = v57;
  double v60 = v59;
  double v62 = v61;
  v63 = [(NSArray *)self->_springs objectAtIndexedSubscript:3];
  objc_msgSend(v63, "setParameters:", v56, v58, v60, v62);
}

- (ARCoachingQuaternionSpring)init
{
  v15[4] = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)ARCoachingQuaternionSpring;
  v2 = [(ARCoachingQuaternionSpring *)&v14 init];
  if (v2)
  {
    v3 = [[ARCoachingStateSpring alloc] initWithValue:1.0];
    v15[0] = v3;
    uint64_t v4 = [[ARCoachingStateSpring alloc] initWithValue:1.0];
    v15[1] = v4;
    double v5 = [[ARCoachingStateSpring alloc] initWithValue:1.0];
    v15[2] = v5;
    double v6 = [[ARCoachingStateSpring alloc] initWithValue:1.0];
    v15[3] = v6;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:4];
    springs = v2->_springs;
    v2->_springs = (NSArray *)v7;

    *(_OWORD *)&v2->_response = xmmword_20B232350;
    if ([(NSArray *)v2->_springs count])
    {
      unint64_t v9 = 0;
      do
      {
        double v10 = [(NSArray *)v2->_springs objectAtIndexedSubscript:v9];
        [v10 setTarget:1.0];

        double v11 = [(NSArray *)v2->_springs objectAtIndexedSubscript:v9];
        [v11 setValue:1.0];

        double v12 = [(NSArray *)v2->_springs objectAtIndexedSubscript:v9];
        [v12 setVelocity:0.0];

        ++v9;
      }
      while ([(NSArray *)v2->_springs count] > v9);
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
      double v6 = [(NSArray *)self->_springs objectAtIndexedSubscript:v5];
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