@interface CBLuxBezierRamp
+ (id)luxRampStateToString:(int)a3;
- (BOOL)rampIsRunning;
- (BOOL)shouldRampFromStartLux:(float)a3 toTargetLux:(float)a4;
- (CBLuxBezierRamp)initWithBezierAnchors:(id)a3 rampDownLuxThreshold:(float)a4 rampUpLuxThreshold:(float)a5 rampDownDuration:(float)a6 rampUpDuration:(float)a7 rampStartLuxCapping:(id)a8 rampTargetLuxCapping:(id)a9;
- (CBLuxBezierRamp)initWithParams:(id)a3 andPolicy:(id)a4;
- (float)duration;
- (float)lux;
- (float)startLux;
- (float)startTime;
- (float)targetLux;
- (float)targetTime;
- (int)rampFromLux:(float)a3 toLux:(float)a4;
- (int)rampFromLux:(float)a3 toLux:(float)a4 forceRamp:(BOOL)a5;
- (int)rampTimedFromLux:(float)a3 toLux:(float)a4 atTime:(float)a5;
- (int)rampTimedFromLux:(float)a3 toLux:(float)a4 atTime:(float)a5 forceRamp:(BOOL)a6;
- (int)updateRampWithProgress:(float)a3;
- (int)updateTimedRamp:(float)a3;
- (void)commonInit;
- (void)dealloc;
- (void)forceLux:(float)a3;
@end

@implementation CBLuxBezierRamp

- (int)updateTimedRamp:(float)a3
{
  if (self->_duration == 0.0) {
    return self->_state;
  }
  float v4 = (float)(a3 - self->_startTime) / self->_duration;
  if (a3 > (float)((float)(self->_startTime + self->_duration) + 0.05)) {
    float v4 = 1.0;
  }
  return [(CBLuxBezierRamp *)self updateRampWithProgress:COERCE_DOUBLE((unint64_t)LODWORD(v4))];
}

- (float)lux
{
  return self->_lux;
}

- (BOOL)shouldRampFromStartLux:(float)a3 toTargetLux:(float)a4
{
  if (float_equal(a3, a4)) {
    return 0;
  }
  if ([(CBLuxBezierRamp *)self rampIsRunning] && float_equal(a4, self->_targetLux)) {
    return 0;
  }
  if ([(CBLuxBezierRamp *)self rampIsRunning]
    && (float)((float)(a4 - self->_lux) * (float)(self->_targetLux - self->_lux)) < 0.0)
  {
    return 1;
  }
  float rampDownLuxDeltaThreshold = self->_rampDownLuxDeltaThreshold;
  if (a4 > a3) {
    float rampDownLuxDeltaThreshold = self->_rampUpLuxDeltaThreshold;
  }
  return vabds_f32(a4, a3) >= rampDownLuxDeltaThreshold;
}

- (int)updateRampWithProgress:(float)a3
{
  if (![(CBLuxBezierRamp *)self rampIsRunning]) {
    return self->_state;
  }
  self->_lux = self->_startLux
             + (float)(clamp((float)((float)(a3 * (float)(1.0 - a3))* (float)((float)((float)((float)(6.0 * (float)(a3 * (float)(1.0 - a3)))* self->bezierAnchors[1])+ (float)((float)(4.0 * (float)((float)(1.0 - a3) * (float)(1.0 - a3)))* self->bezierAnchors[0]))+ (float)((float)(4.0 * (float)(a3 * a3)) * self->bezierAnchors[2])))+ (float)((float)(a3 * a3) * (float)(a3 * a3)), 0.0, 1.0)* (float)(self->_targetLux - self->_startLux));
  if (self->_targetLux <= self->_startLux) {
    BOOL v5 = self->_lux <= self->_targetLux;
  }
  else {
    BOOL v5 = self->_lux >= self->_targetLux;
  }
  BOOL v4 = 1;
  if (!v5) {
    BOOL v4 = a3 >= 1.0;
  }
  if (!v4) {
    return 0;
  }
  self->_startTime = 0.0;
  self->_state = 1;
  return 3;
}

- (BOOL)rampIsRunning
{
  return self->_state == 0;
}

- (CBLuxBezierRamp)initWithParams:(id)a3 andPolicy:(id)a4
{
  v31 = self;
  SEL v30 = a2;
  id v29 = a3;
  id v28 = a4;
  v27.receiver = self;
  v27.super_class = (Class)CBLuxBezierRamp;
  v31 = [(CBLuxBezierRamp *)&v27 init];
  if (v31)
  {
    [(CBLuxBezierRamp *)v31 commonInit];
    for (unsigned int i = 0; i < 3; ++i)
    {
      objc_msgSend((id)objc_msgSend(v29, "rampBezierAnchors"), "get:", i);
      v31->bezierAnchors[i] = v4;
    }
    [v29 rampDownLuxDeltaThreshold];
    v31->_float rampDownLuxDeltaThreshold = v5;
    [v29 rampUpLuxDeltaThreshold];
    v31->_rampUpLuxDeltaThreshold = v6;
    [v29 rampDownDuration];
    v31->_rampDownDuration = v7;
    [v29 rampUpDuration];
    v31->_rampUpDuration = v8;
    uint64_t v19 = MEMORY[0x1E4F143A8];
    int v20 = -1073741824;
    int v21 = 0;
    v22 = __44__CBLuxBezierRamp_initWithParams_andPolicy___block_invoke;
    v23 = &unk_1E6219718;
    id v24 = v28;
    v25 = &v19;
    uint64_t v9 = [&v19 copy];
    v31->_cappedRampStartLux = (id)v9;
    uint64_t v12 = MEMORY[0x1E4F143A8];
    int v13 = -1073741824;
    int v14 = 0;
    v15 = __44__CBLuxBezierRamp_initWithParams_andPolicy___block_invoke_2;
    v16 = &unk_1E6219718;
    id v17 = v28;
    v18 = &v12;
    uint64_t v10 = [&v12 copy];
    v31->_cappedRampTargetLux = (id)v10;
  }
  return v31;
}

uint64_t __44__CBLuxBezierRamp_initWithParams_andPolicy___block_invoke(uint64_t a1, double a2)
{
  return [*(id *)(a1 + 32) cappedRampStartLux:a2];
}

uint64_t __44__CBLuxBezierRamp_initWithParams_andPolicy___block_invoke_2(uint64_t a1, double a2)
{
  return [*(id *)(a1 + 32) cappedRampTargetLux:a2];
}

- (CBLuxBezierRamp)initWithBezierAnchors:(id)a3 rampDownLuxThreshold:(float)a4 rampUpLuxThreshold:(float)a5 rampDownDuration:(float)a6 rampUpDuration:(float)a7 rampStartLuxCapping:(id)a8 rampTargetLuxCapping:(id)a9
{
  v23 = self;
  SEL v22 = a2;
  id v21 = a3;
  float v20 = a4;
  float v19 = a5;
  float v18 = a6;
  float v17 = a7;
  id v16 = a8;
  id v15 = a9;
  v14.receiver = self;
  v14.super_class = (Class)CBLuxBezierRamp;
  v23 = [(CBLuxBezierRamp *)&v14 init];
  if (!v23) {
    return 0;
  }
  [(CBLuxBezierRamp *)v23 commonInit];
  for (unsigned int i = 0; i < 3; ++i)
  {
    objc_msgSend((id)objc_msgSend(v21, "objectAtIndexedSubscript:", i), "floatValue");
    v23->bezierAnchors[i] = v9;
  }
  v23->_float rampDownLuxDeltaThreshold = v20;
  v23->_rampUpLuxDeltaThreshold = v19;
  v23->_rampDownDuration = v18;
  v23->_rampUpDuration = v17;
  id v10 = v16;
  v23->_cappedRampStartLux = v10;
  id v11 = v15;
  v23->_cappedRampTargetLux = v11;
  return v23;
}

- (void)commonInit
{
  self->_lux = NAN;
  self->_startTime = 0.0;
  self->_duration = 0.0;
  self->_targetLux = NAN;
  self->_startLux = NAN;
  self->_state = 1;
}

- (void)dealloc
{
  float v4 = self;
  SEL v3 = a2;

  v2.receiver = v4;
  v2.super_class = (Class)CBLuxBezierRamp;
  [(CBLuxBezierRamp *)&v2 dealloc];
}

- (float)targetLux
{
  if ([(CBLuxBezierRamp *)self rampIsRunning]) {
    return self->_targetLux;
  }
  else {
    return self->_lux;
  }
}

- (void)forceLux:(float)a3
{
  self->_lux = a3;
  self->_targetLux = a3;
  self->_startLux = a3;
  self->_duration = 0.0;
}

- (int)rampTimedFromLux:(float)a3 toLux:(float)a4 atTime:(float)a5
{
  return [(CBLuxBezierRamp *)self rampTimedFromLux:0 toLux:*(double *)&a3 atTime:*(double *)&a4 forceRamp:*(double *)&a5];
}

- (int)rampTimedFromLux:(float)a3 toLux:(float)a4 atTime:(float)a5 forceRamp:(BOOL)a6
{
  if (!a6
    && ![(CBLuxBezierRamp *)self shouldRampFromStartLux:*(double *)&a3 toTargetLux:*(double *)&a4])
  {
    return self->_state;
  }
  float v12 = (*((float (**)(float))self->_cappedRampStartLux + 2))(a3);
  float v10 = (*((float (**)(float))self->_cappedRampTargetLux + 2))(a4);
  if (v10 <= v12) {
    float rampDownDuration = self->_rampDownDuration;
  }
  else {
    float rampDownDuration = self->_rampUpDuration;
  }
  self->_duration = rampDownDuration;
  if ([(CBLuxBezierRamp *)self rampIsRunning]
    && vabds_f32(v10, v12) <= vabds_f32(self->_targetLux, self->_lux))
  {
    self->_duration = rampDownDuration
                    * (float)(vabds_f32(self->_targetLux, self->_lux) / vabds_f32(self->_targetLux, self->_startLux));
  }
  self->_startTime = a5;
  self->_lux = v12;
  self->_startLux = v12;
  self->_targetLux = v10;
  self->_state = 0;
  return 2;
}

- (int)rampFromLux:(float)a3 toLux:(float)a4
{
  return [(CBLuxBezierRamp *)self rampFromLux:0 toLux:*(double *)&a3 forceRamp:*(double *)&a4];
}

- (int)rampFromLux:(float)a3 toLux:(float)a4 forceRamp:(BOOL)a5
{
  if (!a5
    && ![(CBLuxBezierRamp *)self shouldRampFromStartLux:*(double *)&a3 toTargetLux:*(double *)&a4])
  {
    return self->_state;
  }
  float v9 = (*((float (**)(float))self->_cappedRampStartLux + 2))(a3);
  float v7 = (*((float (**)(float))self->_cappedRampTargetLux + 2))(a4);
  self->_lux = v9;
  self->_startLux = v9;
  self->_targetLux = v7;
  self->_state = 0;
  return 2;
}

+ (id)luxRampStateToString:(int)a3
{
  if (a3)
  {
    uint64_t v4 = a3;
    char v3 = 1;
  }
  else
  {
    uint64_t v4 = 0;
    char v3 = 0;
  }
  if (v3) {
    return @"Unknown";
  }
  switch(v4)
  {
    case 0:
      float v6 = @"Running";
      break;
    case 1:
      float v6 = @"Idle";
      break;
    case 2:
      float v6 = @"Started";
      break;
    case 3:
      float v6 = @"Finished";
      break;
    default:
      JUMPOUT(0);
  }
  return v6;
}

- (float)duration
{
  return self->_duration;
}

- (float)startLux
{
  return self->_startLux;
}

- (float)startTime
{
  return self->_startTime;
}

- (float)targetTime
{
  return self->_targetTime;
}

@end