@interface BWRamp
+ (void)initialize;
- (BOOL)isRamping;
- (BOOL)isRampingUp;
- (BWRamp)init;
- (BWRamp)initWithName:(id)a3;
- (float)currentValue;
- (float)updateRampForNextIteration;
- (void)dealloc;
- (void)reset;
- (void)startRampFrom:(float)a3 to:(float)a4 iterations:(int)a5 shape:(int)a6;
- (void)startRampFrom:(float)a3 to:(float)a4 iterations:(int)a5 shape:(int)a6 exponentialConvergenceFraction:(float)a7;
- (void)startSpringRampFrom:(float)a3 to:(float)a4 withTension:(float)a5 friction:(float)a6 snapFraction:(float)a7 frameRate:(float)a8;
@end

@implementation BWRamp

- (BOOL)isRamping
{
  return self->_isRamping;
}

- (float)updateRampForNextIteration
{
  if (!self->_isRamping) {
    return self->_currentValue;
  }
  int v3 = self->_currentIteration + 1;
  self->_currentIteration = v3;
  float startValue = self->_startValue;
  float targetValue = self->_targetValue;
  float v6 = (float)v3 / (float)self->_durationInIterations;
  switch(self->_shape)
  {
    case 0:
      break;
    case 1:
      double v7 = pow((float)(1.0 - self->_exponentialConvergenceFraction), (float)(1.0 - v6));
      goto LABEL_15;
    case 2:
      double v8 = pow((float)(1.0 - self->_exponentialConvergenceFraction), v6);
      if (v6 <= self->_exponentialSnapFraction)
      {
        double v7 = 1.0 - v8;
LABEL_15:
        float v6 = v7;
      }
      else
      {
        float v6 = 1.0;
      }
      break;
    case 3:
      int v9 = FigCaptureRoundFloatToMultipleOf(1, (float)((float)v3 / self->_frameRate) * 60.0);
      int v10 = [(BWSpringSimulation *)self->_spring updateCount];
      BOOL v11 = __OFSUB__(v9, v10);
      int v12 = v9 - v10;
      if (!((v12 < 0) ^ v11 | (v12 == 0)))
      {
        do
        {
          [(BWSpringSimulation *)self->_spring update];
          --v12;
        }
        while (v12);
      }
      [(BWSpringSimulation *)self->_spring output];
      double v14 = v13;
      float v6 = 1.0;
      if (![(BWSpringSimulation *)self->_spring isCompleted])
      {
        float v6 = v14;
        if (self->_exponentialSnapFraction > 0.0)
        {
          [(BWSpringSimulation *)self->_spring output];
          if (v15 >= 1.0 - self->_exponentialSnapFraction) {
            float v6 = 1.0;
          }
        }
      }
      break;
    default:
      float v6 = 0.0;
      break;
  }
  float v16 = vabds_f32(targetValue, startValue);
  float v17 = self->_startValue;
  if (self->_isRampingUp)
  {
    float result = v17 + (float)(v6 * v16);
    if (result >= self->_targetValue) {
      float result = self->_targetValue;
    }
  }
  else
  {
    float result = v17 - (float)(v6 * v16);
    if (result <= self->_targetValue) {
      float result = self->_targetValue;
    }
  }
  self->_currentValue = result;
  self->_isRamping = v6 < 1.0;
  return result;
}

- (BWRamp)initWithName:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BWRamp;
  v4 = [(BWRamp *)&v6 init];
  if (v4)
  {
    v4->_name = (NSString *)[a3 copy];
    *(int32x2_t *)&v4->_exponentialConvergenceFraction = vdup_n_s32(0x3F7AE148u);
  }
  return v4;
}

- (void)startRampFrom:(float)a3 to:(float)a4 iterations:(int)a5 shape:(int)a6 exponentialConvergenceFraction:(float)a7
{
  if (a6 == 3) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Use -startSpringRampFrom: for BWRampShapeSpring" userInfo:0]);
  }
  if (a3 == a4)
  {
    BOOL v7 = 0;
  }
  else
  {
    self->_float startValue = a3;
    self->_float targetValue = a4;
    self->_durationInIterations = a5;
    self->_shape = a6;
    self->_exponentialConvergenceFraction = a7;
    self->_exponentialSnapFraction = a7;
    self->_isRampingUp = a3 < a4;
    self->_currentIteration = 0;
    BOOL v7 = 1;
  }
  self->_currentValue = a3;
  self->_isRamping = v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWRamp;
  [(BWRamp *)&v3 dealloc];
}

- (float)currentValue
{
  return self->_currentValue;
}

- (BOOL)isRampingUp
{
  return self->_isRampingUp;
}

+ (void)initialize
{
}

- (BWRamp)init
{
  return [(BWRamp *)self initWithName:0];
}

- (void)startRampFrom:(float)a3 to:(float)a4 iterations:(int)a5 shape:(int)a6
{
}

- (void)startSpringRampFrom:(float)a3 to:(float)a4 withTension:(float)a5 friction:(float)a6 snapFraction:(float)a7 frameRate:(float)a8
{
  if (a8 <= 0.0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Invalid frame rate" userInfo:0]);
  }
  if (a3 == a4)
  {
    BOOL v11 = 0;
  }
  else
  {
    self->_float startValue = a3;
    self->_float targetValue = a4;
    self->_shape = 3;
    self->_exponentialSnapFraction = a7;

    double v15 = objc_alloc_init(BWSpringSimulation);
    self->_spring = v15;
    [(BWSpringSimulation *)v15 setTension:a5];
    [(BWSpringSimulation *)self->_spring setFriction:a6];
    [(BWSpringSimulation *)self->_spring resetWithInput:1.0 initialOutput:0.0 initialVelocity:0.0 convergedSpeed:0.001];
    uint64_t v16 = MEMORY[0x1E4F1FA48];
    *(_OWORD *)&self->_springPTS.value = *MEMORY[0x1E4F1FA48];
    self->_springPTS.epoch = *(void *)(v16 + 16);
    self->_frameRate = a8;
    self->_isRampingUp = a3 < a4;
    self->_currentIteration = 0;
    BOOL v11 = 1;
  }
  self->_currentValue = a3;
  self->_isRamping = v11;
}

- (void)reset
{
  *(void *)&self->_float startValue = 0;
  *(void *)&self->_currentValue = 0;
  *(void *)&self->_durationInIterations = 0;
  *(int32x2_t *)&self->_exponentialConvergenceFraction = vdup_n_s32(0x3F7AE148u);

  self->_spring = 0;
  self->_isRamping = 0;
  self->_isRampingUp = 0;
}

@end