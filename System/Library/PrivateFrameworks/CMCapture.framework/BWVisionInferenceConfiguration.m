@interface BWVisionInferenceConfiguration
- (BOOL)reuseUpstreamFaceObservations;
- (BOOL)suppressTimeOutFailure;
- (id)shouldPreventRequestForSampleBuffer;
- (void)dealloc;
- (void)setReuseUpstreamFaceObservations:(BOOL)a3;
- (void)setShouldPreventRequestForSampleBuffer:(id)a3;
- (void)setSuppressTimeOutFailure:(BOOL)a3;
@end

@implementation BWVisionInferenceConfiguration

- (void)setSuppressTimeOutFailure:(BOOL)a3
{
  self->_suppressTimeOutFailure = a3;
}

- (void)setShouldPreventRequestForSampleBuffer:(id)a3
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWVisionInferenceConfiguration;
  [(BWInferenceConfiguration *)&v3 dealloc];
}

- (id)shouldPreventRequestForSampleBuffer
{
  return self->_shouldPreventRequestForSampleBuffer;
}

- (BOOL)reuseUpstreamFaceObservations
{
  return self->_reuseUpstreamFaceObservations;
}

- (void)setReuseUpstreamFaceObservations:(BOOL)a3
{
  self->_reuseUpstreamFaceObservations = a3;
}

- (BOOL)suppressTimeOutFailure
{
  return self->_suppressTimeOutFailure;
}

@end