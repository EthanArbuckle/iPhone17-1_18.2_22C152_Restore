@interface BWStillImageProcessorControllerConfiguration
- (BOOL)deferredCaptureSupportEnabled;
- (BOOL)deferredPhotoProcessorEnabled;
- (BOOL)postponeProcessorSetup;
- (BOOL)postponedProcessorSetupSupported;
- (BWInferenceScheduler)inferenceScheduler;
- (MTLCommandQueue)metalCommandQueue;
- (NSDictionary)sensorConfigurationsByPortType;
- (int)stillImageProcessingMode;
- (unsigned)figThreadPriority;
- (void)dealloc;
- (void)setDeferredCaptureSupportEnabled:(BOOL)a3;
- (void)setDeferredPhotoProcessorEnabled:(BOOL)a3;
- (void)setFigThreadPriority:(unsigned int)a3;
- (void)setInferenceScheduler:(id)a3;
- (void)setMetalCommandQueue:(id)a3;
- (void)setPostponeProcessorSetup:(BOOL)a3;
- (void)setSensorConfigurationsByPortType:(id)a3;
- (void)setStillImageProcessingMode:(int)a3;
@end

@implementation BWStillImageProcessorControllerConfiguration

- (void)setPostponeProcessorSetup:(BOOL)a3
{
  if (self->_postponeProcessorSetup != a3)
  {
    if (a3
      && ![(BWStillImageProcessorControllerConfiguration *)self postponedProcessorSetupSupported])
    {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Not supported - use -postponedProcessorSetupSupported." userInfo:0]);
    }
    self->_postponeProcessorSetup = a3;
  }
}

- (void)setDeferredCaptureSupportEnabled:(BOOL)a3
{
  self->_deferredCaptureSupportEnabled = a3;
}

- (void)setSensorConfigurationsByPortType:(id)a3
{
}

- (void)setInferenceScheduler:(id)a3
{
}

- (void)setStillImageProcessingMode:(int)a3
{
  self->_stillImageProcessingMode = a3;
}

- (void)setMetalCommandQueue:(id)a3
{
}

- (void)setDeferredPhotoProcessorEnabled:(BOOL)a3
{
  self->_deferredPhotoProcessorEnabled = a3;
}

- (void)setFigThreadPriority:(unsigned int)a3
{
  self->_figThreadPriority = a3;
}

- (NSDictionary)sensorConfigurationsByPortType
{
  return self->_sensorConfigurationsByPortType;
}

- (BWInferenceScheduler)inferenceScheduler
{
  return self->_inferenceScheduler;
}

- (unsigned)figThreadPriority
{
  return self->_figThreadPriority;
}

- (MTLCommandQueue)metalCommandQueue
{
  return self->_metalCommandQueue;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWStillImageProcessorControllerConfiguration;
  [(BWStillImageProcessorControllerConfiguration *)&v3 dealloc];
}

- (BOOL)postponedProcessorSetupSupported
{
  return 0;
}

- (BOOL)postponeProcessorSetup
{
  return self->_postponeProcessorSetup;
}

- (int)stillImageProcessingMode
{
  return self->_stillImageProcessingMode;
}

- (BOOL)deferredCaptureSupportEnabled
{
  return self->_deferredCaptureSupportEnabled;
}

- (BOOL)deferredPhotoProcessorEnabled
{
  return self->_deferredPhotoProcessorEnabled;
}

@end