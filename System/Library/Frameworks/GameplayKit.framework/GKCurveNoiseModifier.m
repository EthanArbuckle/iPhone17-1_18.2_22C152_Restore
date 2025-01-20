@interface GKCurveNoiseModifier
- (GKCurveNoiseModifier)init;
- (GKCurveNoiseModifier)initWithControlPoints:(id)a3;
- (GKCurveNoiseModifier)initWithInputModuleCount:(unint64_t)a3;
- (double)valueAt:(GKCurveNoiseModifier *)self;
- (id)cloneModule;
- (int)requiredInputModuleCount;
- (void)dealloc;
@end

@implementation GKCurveNoiseModifier

- (GKCurveNoiseModifier)init
{
  v7[4] = *MEMORY[0x263EF8340];
  v6[0] = &unk_26E94B9E0;
  v6[1] = &unk_26E94BA00;
  v7[0] = &unk_26E94B9E0;
  v7[1] = &unk_26E94BA00;
  v6[2] = &unk_26E94BA10;
  v6[3] = &unk_26E94B9F0;
  v7[2] = &unk_26E94BA10;
  v7[3] = &unk_26E94B9F0;
  v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:4];
  v4 = [(GKCurveNoiseModifier *)self initWithControlPoints:v3];

  return v4;
}

- (GKCurveNoiseModifier)initWithInputModuleCount:(unint64_t)a3
{
  v8[4] = *MEMORY[0x263EF8340];
  v7[0] = &unk_26E94B9E0;
  v7[1] = &unk_26E94BA00;
  v8[0] = &unk_26E94B9E0;
  v8[1] = &unk_26E94BA00;
  v7[2] = &unk_26E94BA10;
  v7[3] = &unk_26E94B9F0;
  v8[2] = &unk_26E94BA10;
  v8[3] = &unk_26E94B9F0;
  v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:4];
  v5 = [(GKCurveNoiseModifier *)self initWithControlPoints:v4];

  return v5;
}

- (GKCurveNoiseModifier)initWithControlPoints:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)GKCurveNoiseModifier;
  v5 = [(GKNoiseModifier *)&v20 initWithInputModuleCount:1];
  if (v5)
  {
    if (v4 && [v4 count])
    {
      int v6 = [v4 count];
      v5->_count = v6;
      v5->_controlPoints = (double *)malloc_type_malloc(8 * v6, 0x100004000313F17uLL);
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v7 = v4;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v17 != v9) {
              objc_enumerationMutation(v7);
            }
            v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            v12 = objc_msgSend(v7, "valueForKey:", v11, (void)v16);
            [v12 doubleValue];
            *(void *)v5->_controlPoints = v13;
            [v11 doubleValue];
            *(void *)v5->_parameters = v14;
          }
          uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
        }
        while (v8);
      }
    }
    else
    {
      v5->_controlPoints = 0;
      v5->_count = 0;
    }
  }

  return v5;
}

- (void)dealloc
{
  controlPoints = self->_controlPoints;
  if (controlPoints) {
    free(controlPoints);
  }
  parameters = self->_parameters;
  if (parameters) {
    free(parameters);
  }
  v5.receiver = self;
  v5.super_class = (Class)GKCurveNoiseModifier;
  [(GKCurveNoiseModifier *)&v5 dealloc];
}

- (int)requiredInputModuleCount
{
  return 1;
}

- (double)valueAt:(GKCurveNoiseModifier *)self
{
  long long v30 = v2[1];
  long long v31 = *v2;
  id v4 = [(NSMutableArray *)self->super._inputModules objectAtIndexedSubscript:0];
  v32[0] = v31;
  v32[1] = v30;
  [v4 valueAt:v32];
  double v6 = v5;

  uint64_t count = self->_count;
  if (!count) {
    return v6;
  }
  int v8 = count - 1;
  if (count == 1) {
    return *self->_controlPoints;
  }
  parameters = self->_parameters;
  double v10 = *parameters;
  if (v6 <= *parameters) {
    return *self->_controlPoints;
  }
  uint64_t v11 = (int)count;
  if (v6 >= parameters[v11 - 1]) {
    return self->_controlPoints[v11 - 1];
  }
  if (count == 2) {
    return (self->_controlPoints[1] - *self->_controlPoints) * (v6 - v10) / (parameters[1] - v10)
  }
         + *self->_controlPoints;
  if (count == 3)
  {
    double v21 = (v6 - v10) / (parameters[1] - v10);
    controlPoints = self->_controlPoints;
    return *controlPoints
         + (controlPoints[1]
          - *controlPoints
          + -(controlPoints[2] - controlPoints[1] - (controlPoints[2] - controlPoints[1]) * v21) * v21)
         * v21;
  }
  if (count != 4)
  {
    int v23 = count - 2;
    if ((int)count < 2)
    {
      LODWORD(v24) = 1;
    }
    else
    {
      uint64_t v24 = 1;
      while (v6 >= self->_controlPoints[v24])
      {
        if (count == ++v24)
        {
          LODWORD(v24) = self->_count;
          break;
        }
      }
    }
    if (v8 >= (int)v24) {
      int v8 = v24;
    }
    unsigned int v25 = v8 & ~(v8 >> 31);
    if (v25 == v24) {
      return self->_controlPoints[v24];
    }
    if ((int)count + 1 < (int)v24) {
      int v26 = count + 1;
    }
    else {
      int v26 = v24;
    }
    unsigned int v27 = v26 & ~(v26 >> 31);
    if (v23 >= (int)v24) {
      int v23 = v24;
    }
    uint64_t v28 = v25;
    double v14 = v6 - parameters[v28];
    v29 = self->_controlPoints;
    double v16 = v29[v23 & ~(v23 >> 31)];
    double v17 = v29[v28];
    double v18 = v29[v24];
    double v19 = v29[v27];
    return v17 + (v18 - v16 + (v16 - v17 - (v19 - (v18 + v16 - v17)) + (v19 - (v18 + v16 - v17)) * v14) * v14) * v14;
  }
  double v12 = parameters[1];
  if (v6 <= v12) {
    return self->_controlPoints[1];
  }
  double v13 = parameters[2];
  if (v6 < v13)
  {
    double v14 = (v6 - v12) / (v13 - v12);
    v15 = self->_controlPoints;
    double v16 = *v15;
    double v17 = v15[1];
    double v18 = v15[2];
    double v19 = v15[3];
    return v17 + (v18 - v16 + (v16 - v17 - (v19 - (v18 + v16 - v17)) + (v19 - (v18 + v16 - v17)) * v14) * v14) * v14;
  }
  return self->_controlPoints[2];
}

- (id)cloneModule
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (self->_count >= 1)
  {
    uint64_t v4 = 0;
    do
    {
      double v5 = (void *)[objc_alloc(NSNumber) initWithDouble:self->_controlPoints[v4]];
      double v6 = (void *)[objc_alloc(NSNumber) initWithDouble:self->_parameters[v4]];
      [v3 setObject:v5 forKeyedSubscript:v6];

      ++v4;
    }
    while (v4 < self->_count);
  }
  id v7 = [[GKCurveNoiseModifier alloc] initWithControlPoints:v3];

  return v7;
}

@end