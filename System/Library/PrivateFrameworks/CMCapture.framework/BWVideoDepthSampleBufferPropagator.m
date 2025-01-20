@interface BWVideoDepthSampleBufferPropagator
- (BOOL)allowsAsyncPropagation;
- (BWVideoDepthSampleBufferPropagator)initWithVideoRequirements:(id)a3 cloneRequirements:(id)a4;
@end

@implementation BWVideoDepthSampleBufferPropagator

- (BWVideoDepthSampleBufferPropagator)initWithVideoRequirements:(id)a3 cloneRequirements:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)BWVideoDepthSampleBufferPropagator;
  return [(BWInferenceSampleBufferPropagator *)&v5 initWithVideoRequirements:a3 cloneRequirements:a4 metadataRequirements:0];
}

- (BOOL)allowsAsyncPropagation
{
  return 1;
}

@end