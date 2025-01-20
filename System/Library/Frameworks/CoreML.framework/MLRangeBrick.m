@interface MLRangeBrick
- (BOOL)hasDynamicOutputShape:(unint64_t)a3;
- (BOOL)hasGPUSupport;
- (MLRangeBrick)initWithParameters:(id)a3;
- (float)endValueParameter;
- (float)start;
- (float)startValueParameter;
- (float)stepSize;
- (float)stepSizeValueParameter;
- (id)computeDynamicOutputShape:(id)a3;
- (id)setupForInputShapes:(id)a3 withParameters:(id)a4;
- (int)size;
- (void)computeOnCPUWithInputTensors:(id)a3 outputTensors:(id)a4;
@end

@implementation MLRangeBrick

- (float)stepSizeValueParameter
{
  return self->_stepSizeValueParameter;
}

- (float)endValueParameter
{
  return self->_endValueParameter;
}

- (float)startValueParameter
{
  return self->_startValueParameter;
}

- (float)stepSize
{
  return self->_stepSize;
}

- (float)start
{
  return self->_start;
}

- (int)size
{
  return self->_size;
}

- (void)computeOnCPUWithInputTensors:(id)a3 outputTensors:(id)a4
{
  id v7 = a4;
  v5 = [v7 objectAtIndexedSubscript:0];
  v6 = (float *)[v5 rawPointer];

  vDSP_vramp(&self->_start, &self->_stepSize, v6, 1, self->_size);
}

- (id)computeDynamicOutputShape:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectAtIndexedSubscript:0];
  v6 = (float *)[v5 rawPointer];

  id v7 = [v4 objectAtIndexedSubscript:1];
  v8 = (float *)[v7 rawPointer];

  v9 = [v4 objectAtIndexedSubscript:2];
  v10 = (float *)[v9 rawPointer];

  if (fabsf(*v10) < 0.00001)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x19F3C1380](exception, "Step size in the range layer cannot be 0");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  float v11 = *v6;
  float v12 = (float)((float)(*v8 - *v6) / *v10) + 1.0;
  if (v12 <= 0.0) {
    float v12 = 1.0;
  }
  float v13 = floorf(v12);
  if (vabds_f32(v13, v12) >= 0.001) {
    float v14 = v13;
  }
  else {
    float v14 = v13 + -1.0;
  }
  int v15 = (int)v14;
  if ((int)v14 <= 1) {
    int v15 = 1;
  }
  self->_size = v15;
  self->_start = v11;
  self->_stepSize = *v10;
  v16 = objc_opt_new();
  v17 = objc_opt_new();
  [v17 setWidth:self->_size];
  [v17 setHeight:1];
  [v17 setChannels:1];
  [v17 setBatch:1];
  [v17 setSequence:1];
  [v17 setRank:1];
  [v16 addObject:v17];

  return v16;
}

- (BOOL)hasDynamicOutputShape:(unint64_t)a3
{
  return a3 == 3;
}

- (BOOL)hasGPUSupport
{
  return 0;
}

- (MLRangeBrick)initWithParameters:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MLRangeBrick;
  v5 = [(MLRangeBrick *)&v20 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"startValue"];
    id v7 = v6;
    if (v6) {
      [v6 floatValue];
    }
    else {
      float v8 = 0.0;
    }
    v5->_float startValueParameter = v8;
    v9 = [v4 objectForKeyedSubscript:@"endValue"];

    if (v9) {
      [v9 floatValue];
    }
    else {
      float v10 = 1.0;
    }
    v5->_endValueParameter = v10;
    float v11 = [v4 objectForKeyedSubscript:@"stepSizeValue"];

    if (v11) {
      [v11 floatValue];
    }
    else {
      float v12 = 1.0;
    }
    v5->_stepSizeValueParameter = v12;
    if (fabsf(v12) < 0.00001)
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x19F3C1380](exception, "Step size in the range layer cannot be 0");
      __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
    float startValueParameter = v5->_startValueParameter;
    float v14 = (float)((float)(v5->_endValueParameter - startValueParameter) / v12) + 1.0;
    if (v14 <= 0.0) {
      float v14 = 1.0;
    }
    float v15 = floorf(v14);
    if (vabds_f32(v15, v14) >= 0.001) {
      float v16 = v15;
    }
    else {
      float v16 = v15 + -1.0;
    }
    int v17 = (int)v16;
    if ((int)v16 <= 1) {
      int v17 = 1;
    }
    v5->_size = v17;
    v5->_start = startValueParameter;
    v5->_stepSize = v12;
  }
  return v5;
}

- (id)setupForInputShapes:(id)a3 withParameters:(id)a4
{
  id v5 = a3;
  v6 = objc_opt_new();
  id v7 = objc_opt_new();
  if ([v5 count] == 3) {
    uint64_t size = 1;
  }
  else {
    uint64_t size = self->_size;
  }
  [v7 setWidth:size];
  [v7 setHeight:1];
  [v7 setChannels:1];
  [v7 setBatch:1];
  [v7 setSequence:1];
  [v7 setRank:1];
  [v6 addObject:v7];

  return v6;
}

@end