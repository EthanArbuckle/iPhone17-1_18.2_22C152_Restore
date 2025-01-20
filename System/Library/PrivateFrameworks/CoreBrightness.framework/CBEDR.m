@interface CBEDR
+ (float)animatedHeadroomForOrigin:(float)a3 target:(float)a4 andProgress:(float)a5;
+ (float)headroomToScalingFactor:(float)a3;
+ (float)headroomToStops:(float)a3;
+ (float)overallRampDuration:(float)a3 target:(float)a4 durationPerStop:(float)a5;
+ (float)scalingFactorToHeadroom:(float)a3;
+ (float)stopsToHeadroom:(float)a3;
- (BOOL)shouldUpdateEDRForRequestedHeadroom:(float)a3 targetHeadroom:(float *)a4 rampTime:(double *)a5;
- (BOOL)shouldUpdateEDRForRequestedHeadroom:(float)a3 targetHeadroom:(float *)a4 rampTime:(double *)a5 durationPerStop:(float)a6;
- (CBEDR)initWithRampPolicy:(unint64_t)a3 potentialHeadroom:(float)a4 andReferenceHeadroom:(float)a5;
- (CBEDRModulator)headroomModulator;
- (float)appliedCompensation;
- (float)availableHeadroom;
- (float)brightnessCap;
- (float)cappedHeadroomFromUncapped:(float)a3;
- (float)clampHeadroom:(float)a3;
- (float)maxHeadroom;
- (float)minHeadroom;
- (float)panelMax;
- (float)referenceHeadroom;
- (float)sdrBrightness;
- (float)secondsPerStop;
- (float)secondsPerStopExit;
- (id)copyStatusInfo;
- (id)description;
- (void)dealloc;
- (void)resetRequestedHeadroom;
- (void)sanityCheck;
- (void)setAppliedCompensation:(float)a3;
- (void)setBrightnessCap:(float)a3;
- (void)setHeadroomModulator:(id)a3;
- (void)setMaxHeadroom:(float)a3;
- (void)setMinHeadroom:(float)a3;
- (void)setPanelMax:(float)a3;
- (void)setReferenceHeadroom:(float)a3;
- (void)setSdrBrightness:(float)a3;
- (void)setSecondsPerStop:(float)a3;
- (void)setSecondsPerStopExit:(float)a3;
@end

@implementation CBEDR

- (float)maxHeadroom
{
  return self->_maxHeadroom;
}

- (void)setBrightnessCap:(float)a3
{
  self->_brightnessCap = a3;
}

- (void)setSdrBrightness:(float)a3
{
  self->_sdrBrightness = a3;
}

- (id)copyStatusInfo
{
  v20[13] = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1BA9ECAE0]();
  id v16 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v19[0] = @"PanelMax";
  *(float *)&double v2 = self->_panelMax;
  v20[0] = [NSNumber numberWithFloat:v2];
  v19[1] = @"RampPolicy";
  v20[1] = [NSNumber numberWithUnsignedInteger:self->_rampPolicy];
  v19[2] = @"MaxHeadroom";
  *(float *)&double v3 = self->_maxHeadroom;
  v20[2] = [NSNumber numberWithFloat:v3];
  v19[3] = @"BrightnessCap";
  *(float *)&double v4 = self->_brightnessCap;
  v20[3] = [NSNumber numberWithFloat:v4];
  v19[4] = @"SDR";
  *(float *)&double v5 = self->_sdrBrightness;
  v20[4] = [NSNumber numberWithFloat:v5];
  v19[5] = @"ReferenceHeadroom";
  *(float *)&double v6 = self->_referenceHeadroom;
  v20[5] = [NSNumber numberWithFloat:v6];
  v19[6] = @"Headroom";
  *(float *)&double v7 = self->_currentHeadroom;
  v20[6] = [NSNumber numberWithFloat:v7];
  v19[7] = @"AvailableHeadroom";
  v15 = NSNumber;
  [(CBEDR *)self availableHeadroom];
  v20[7] = objc_msgSend(v15, "numberWithFloat:");
  v19[8] = @"RequestedHeadroom";
  *(float *)&double v8 = self->_requestedHeadroom;
  v20[8] = [NSNumber numberWithFloat:v8];
  v19[9] = @"HDRMax";
  *(float *)&double v9 = self->_currentMaxBrightness;
  v20[9] = [NSNumber numberWithFloat:v9];
  v19[10] = @"AppliedCompensation";
  *(float *)&double v10 = self->_appliedCompensation;
  v20[10] = [NSNumber numberWithFloat:v10];
  v19[11] = @"SecPerStop";
  *(float *)&double v11 = self->_secondsPerStop;
  v20[11] = [NSNumber numberWithFloat:v11];
  v19[12] = @"SecPerStopExit";
  *(float *)&double v12 = self->_secondsPerStopExit;
  v20[12] = [NSNumber numberWithFloat:v12];
  v17 = objc_msgSend(v16, "initWithDictionary:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v20, v19, 13));
  if (self->_headroomModulator) {
    objc_msgSend(v17, "setObject:forKey:", -[CBEDRModulator description](self->_headroomModulator, "description"), @"Modulator");
  }
  return v17;
}

- (float)availableHeadroom
{
  float v4 = 1.0;
  [(CBEDR *)self sanityCheck];
  double sdrBrightness = self->_sdrBrightness;
  if (sdrBrightness > 0.0) {
    float v4 = (float)(self->_currentMaxBrightness / self->_sdrBrightness) / self->_appliedCompensation;
  }
  *(float *)&double sdrBrightness = v4;
  [(CBEDR *)self clampHeadroom:sdrBrightness];
  return result;
}

- (void)sanityCheck
{
  self->_currentMaxBrightness = fminf(self->_brightnessCap, self->_panelMax);
  self->_double sdrBrightness = fminf(self->_panelMax, self->_sdrBrightness);
}

- (float)cappedHeadroomFromUncapped:(float)a3
{
  double v12 = self;
  SEL v11 = a2;
  float v10 = a3;
  [(CBEDR *)self clampHeadroom:COERCE_DOUBLE((unint64_t)LODWORD(a3))];
  float v9 = v3;
  [(CBEDR *)v12 sanityCheck];
  v12->_currentHeadroom = v10;
  if (v12->_sdrBrightness > 0.0)
  {
    if ((float)((float)(v12->_sdrBrightness * v10) * v12->_appliedCompensation) > v12->_currentMaxBrightness) {
      float v9 = (float)(v12->_currentMaxBrightness / v12->_sdrBrightness) / v12->_appliedCompensation;
    }
  }
  else
  {
    float v9 = v10 / v12->_appliedCompensation;
  }
  float v8 = 0.0;
  float v7 = 0.0;
  if ([(CBEDRModulator *)v12->_headroomModulator isConfigured]
    && (*(float *)&double v4 = v9,
        *(float *)&double v5 = v12->_sdrBrightness,
        [(CBEDRModulator *)v12->_headroomModulator modulatedHeadroom:&v7 forHeadroom:v4 forSDRNits:v5]))
  {
    float v8 = v7;
  }
  else
  {
    float v8 = v9;
  }
  *(float *)&double v4 = v8;
  [(CBEDR *)v12 clampHeadroom:v4];
  return result;
}

- (float)clampHeadroom:(float)a3
{
  return clamp(a3, self->_minHeadroom, self->_maxHeadroom);
}

- (float)secondsPerStop
{
  return self->_secondsPerStop;
}

+ (float)overallRampDuration:(float)a3 target:(float)a4 durationPerStop:(float)a5
{
  return fabsf(log2f(a4 / a3)) * a5;
}

+ (float)animatedHeadroomForOrigin:(float)a3 target:(float)a4 andProgress:(float)a5
{
  id v22 = a1;
  SEL v21 = a2;
  float v20 = a3;
  float v19 = a4;
  float v18 = a5;
  if (a4 == 0.0)
  {
    v17 = 0;
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      inited = init_default_corebrightness_log();
    }
    v17 = inited;
    char v16 = 16;
    if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR))
    {
      log = v17;
      os_log_type_t type = v16;
      __os_log_helper_16_0_0(v15);
      _os_log_error_impl(&dword_1BA438000, log, type, "error: target == 0.0", v15, 2u);
    }
    return 1.0;
  }
  else if (v18 <= 1.0 && v18 >= 0.0)
  {
    if (v18 == 1.0) {
      return v19;
    }
    else {
      return v20 * powf(fabsf(v20 / v19), -v18);
    }
  }
  else
  {
    v14 = 0;
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      float v8 = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      float v8 = init_default_corebrightness_log();
    }
    v14 = v8;
    char v13 = 16;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      double v6 = v14;
      os_log_type_t v7 = v13;
      __os_log_helper_16_0_0(v12);
      _os_log_error_impl(&dword_1BA438000, v6, v7, "error: progress out of range", v12, 2u);
    }
    return 1.0;
  }
}

+ (float)headroomToStops:(float)a3
{
  return log2f(a3);
}

+ (float)stopsToHeadroom:(float)a3
{
  return powf(2.0, a3);
}

+ (float)headroomToScalingFactor:(float)a3
{
  return 1.0 / a3;
}

+ (float)scalingFactorToHeadroom:(float)a3
{
  return 1.0 / a3;
}

- (CBEDR)initWithRampPolicy:(unint64_t)a3 potentialHeadroom:(float)a4 andReferenceHeadroom:(float)a5
{
  SEL v11 = self;
  SEL v10 = a2;
  unint64_t v9 = a3;
  float v8 = a4;
  float v7 = a5;
  v6.receiver = self;
  v6.super_class = (Class)CBEDR;
  SEL v11 = [(CBEDR *)&v6 init];
  if (v11)
  {
    v11->_rampPolicy = v9;
    v11->_minHeadroom = 1.0;
    v11->_maxHeadroom = v8;
    v11->_referenceHeadroom = v7;
    v11->_currentHeadroom = 1.0;
    v11->_requestedHeadroom = 1.0;
    v11->_appliedCompensation = 1.0;
    v11->_secondsPerStop = 1.0;
    v11->_secondsPerStopExit = 1.0;
  }
  return v11;
}

- (void)dealloc
{
  double v4 = self;
  SEL v3 = a2;

  v2.receiver = v4;
  v2.super_class = (Class)CBEDR;
  [(CBEDR *)&v2 dealloc];
}

- (id)description
{
  double v4 = self;
  SEL v3 = a2;
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%s: r.policy: %lu | h.max: %f | h.ref=%f | h.req: %f | SDR: %f | cap: %f | p.max: %f | a.comp: %f | sec.per.stop: %f | sec.per.stop.exit: %f", "CBEDR", self->_rampPolicy, self->_maxHeadroom, self->_referenceHeadroom, self->_requestedHeadroom, self->_sdrBrightness, self->_brightnessCap, self->_panelMax, self->_appliedCompensation, self->_secondsPerStop, self->_secondsPerStopExit);
}

- (BOOL)shouldUpdateEDRForRequestedHeadroom:(float)a3 targetHeadroom:(float *)a4 rampTime:(double *)a5
{
  LODWORD(v5) = -1.0;
  return [(CBEDR *)self shouldUpdateEDRForRequestedHeadroom:a4 targetHeadroom:a5 rampTime:*(double *)&a3 durationPerStop:v5];
}

- (BOOL)shouldUpdateEDRForRequestedHeadroom:(float)a3 targetHeadroom:(float *)a4 rampTime:(double *)a5 durationPerStop:(float)a6
{
  if (!a4) {
    __assert_rtn("-[CBEDR shouldUpdateEDRForRequestedHeadroom:targetHeadroom:rampTime:durationPerStop:]", "CBEDR.m", 273, "target");
  }
  if (!a5) {
    __assert_rtn("-[CBEDR shouldUpdateEDRForRequestedHeadroom:targetHeadroom:rampTime:durationPerStop:]", "CBEDR.m", 274, "time");
  }
  BOOL v13 = 0;
  [(CBEDR *)self clampHeadroom:*(double *)&a3];
  float v17 = v6;
  [(CBEDR *)self sanityCheck];
  if (self->_sdrBrightness > 0.0 && v17 != self->_requestedHeadroom)
  {
    self->_requestedHeadroom = v17;
    if (v17 == self->_currentHeadroom)
    {
      BOOL v13 = 1;
      *a4 = v17;
      *a5 = 0.0;
    }
    else
    {
      BOOL v13 = 1;
      *a4 = v17;
      if (self->_rampPolicy == 1)
      {
        *a5 = 0.0;
      }
      else
      {
        *(void *)&double v9 = LODWORD(a6);
        if (a6 < 0.0) {
          float secondsPerStop = self->_secondsPerStop;
        }
        else {
          float secondsPerStop = a6;
        }
        *(float *)&double v9 = self->_currentHeadroom;
        *(float *)&double v7 = v17;
        *(float *)&double v8 = secondsPerStop;
        +[CBEDR overallRampDuration:v9 target:v7 durationPerStop:v8];
        *a5 = v10;
      }
    }
  }
  return v13;
}

- (void)resetRequestedHeadroom
{
  self->_requestedHeadroom = 1.0;
}

- (float)panelMax
{
  return self->_panelMax;
}

- (void)setPanelMax:(float)a3
{
  self->_panelMax = a3;
}

- (float)brightnessCap
{
  return self->_brightnessCap;
}

- (float)sdrBrightness
{
  return self->_sdrBrightness;
}

- (float)referenceHeadroom
{
  return self->_referenceHeadroom;
}

- (void)setReferenceHeadroom:(float)a3
{
  self->_referenceHeadroom = a3;
}

- (float)minHeadroom
{
  return self->_minHeadroom;
}

- (void)setMinHeadroom:(float)a3
{
  self->_minHeadroom = a3;
}

- (void)setMaxHeadroom:(float)a3
{
  self->_maxHeadroom = a3;
}

- (float)appliedCompensation
{
  return self->_appliedCompensation;
}

- (void)setAppliedCompensation:(float)a3
{
  self->_appliedCompensation = a3;
}

- (void)setSecondsPerStop:(float)a3
{
  self->_float secondsPerStop = a3;
}

- (float)secondsPerStopExit
{
  return self->_secondsPerStopExit;
}

- (void)setSecondsPerStopExit:(float)a3
{
  self->_secondsPerStopExit = a3;
}

- (CBEDRModulator)headroomModulator
{
  return (CBEDRModulator *)objc_getProperty(self, a2, 64, 1);
}

- (void)setHeadroomModulator:(id)a3
{
}

@end