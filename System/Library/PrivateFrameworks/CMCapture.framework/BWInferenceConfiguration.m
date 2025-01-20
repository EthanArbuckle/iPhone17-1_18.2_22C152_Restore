@interface BWInferenceConfiguration
- (BOOL)propagatesFrameRatePrevention;
- (BWInferenceConfiguration)initWithInferenceType:(int)a3;
- (NSDictionary)tuningParameters;
- (float)maximumFramesPerSecond;
- (int)inferenceType;
- (unsigned)priority;
- (void)dealloc;
- (void)setMaximumFramesPerSecond:(float)a3;
- (void)setPriority:(unsigned int)a3;
- (void)setPropagatesFrameRatePrevention:(BOOL)a3;
- (void)setTuningParameters:(id)a3;
@end

@implementation BWInferenceConfiguration

- (BWInferenceConfiguration)initWithInferenceType:(int)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BWInferenceConfiguration;
  v4 = [(BWInferenceConfiguration *)&v7 init];
  v5 = (BWInferenceConfiguration *)v4;
  if (v4)
  {
    *((_DWORD *)v4 + 2) = a3;
    *(void *)(v4 + 12) = 0;
    *((void *)v4 + 3) = objc_alloc_init(MEMORY[0x1E4F1C9E8]);
  }
  return v5;
}

- (void)setMaximumFramesPerSecond:(float)a3
{
  self->_maximumFramesPerSecond = a3;
}

- (void)setPropagatesFrameRatePrevention:(BOOL)a3
{
  self->_propagatesFrameRatePrevention = a3;
}

- (unsigned)priority
{
  return self->_priority;
}

- (int)inferenceType
{
  return self->_inferenceType;
}

- (void)setPriority:(unsigned int)a3
{
  self->_priority = a3;
}

- (BOOL)propagatesFrameRatePrevention
{
  return self->_propagatesFrameRatePrevention;
}

- (float)maximumFramesPerSecond
{
  return self->_maximumFramesPerSecond;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWInferenceConfiguration;
  [(BWInferenceConfiguration *)&v3 dealloc];
}

- (NSDictionary)tuningParameters
{
  return self->_tuningParameters;
}

- (void)setTuningParameters:(id)a3
{
}

@end