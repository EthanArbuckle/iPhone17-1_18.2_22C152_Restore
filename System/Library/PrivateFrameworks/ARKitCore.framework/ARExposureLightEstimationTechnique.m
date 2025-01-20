@interface ARExposureLightEstimationTechnique
- (ARExposureLightEstimationTechnique)init;
- (BOOL)isBusy;
- (id).cxx_construct;
- (id)processData:(id)a3;
- (unint64_t)requiredSensorDataTypes;
- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4;
@end

@implementation ARExposureLightEstimationTechnique

- (ARExposureLightEstimationTechnique)init
{
  v6.receiver = self;
  v6.super_class = (Class)ARExposureLightEstimationTechnique;
  v2 = [(ARTechnique *)&v6 init];
  if (v2)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(1);
    resultSemaphore = v2->_resultSemaphore;
    v2->_resultSemaphore = (OS_dispatch_semaphore *)v3;
  }
  return v2;
}

- (BOOL)isBusy
{
  intptr_t v3 = dispatch_semaphore_wait((dispatch_semaphore_t)self->_resultSemaphore, 0);
  if (!v3) {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_resultSemaphore);
  }
  return v3 != 0;
}

- (unint64_t)requiredSensorDataTypes
{
  return 1;
}

- (id)processData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_resultSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    id v5 = v4;
    objc_super v6 = (arkit *)[v5 temperature];
    self->_temperature = arkit::mapColorTemperature(v6, v7);
    [v5 exposureTargetOffset];
    float v10 = ARMapExposureOffset(v8);
    self->_lightIntensity = arkit::ExponentialSmoother<float>::step((uint64_t)&self->_smoother, &v10, 1.0 / (float)[v5 captureFramesPerSecond], 0.016667, 0.2);
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_resultSemaphore);
  }
  return v4;
}

- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_resultSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  float v7 = objc_opt_new();
  float v8 = [[ARLightEstimate alloc] initWithAmbientIntensity:self->_lightIntensity * 1000.0 temperature:self->_temperature];
  [v7 setLightEstimate:v8];

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_resultSemaphore);
  v9 = [v7 lightEstimate];
  [v9 ambientIntensity];
  kdebug_trace();

  float v10 = [(ARTechnique *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    v12 = [(ARTechnique *)self delegate];
    v14[0] = v7;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    [v12 technique:self didOutputResultData:v13 timestamp:v6 context:a3];
  }
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((unsigned char *)self + 72) = 0;
  *((unsigned char *)self + 76) = 0;
  return self;
}

@end