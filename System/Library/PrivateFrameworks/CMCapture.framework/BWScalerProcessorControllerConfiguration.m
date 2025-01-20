@interface BWScalerProcessorControllerConfiguration
- (BWMemoryAnalyticsPayload)memoryAnalyticsPayload;
- (NSDictionary)mainImageDownscalingFactorByAttachedMediaKey;
- (void)dealloc;
- (void)setMainImageDownscalingFactorByAttachedMediaKey:(id)a3;
- (void)setMemoryAnalyticsPayload:(id)a3;
@end

@implementation BWScalerProcessorControllerConfiguration

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWScalerProcessorControllerConfiguration;
  [(BWStillImageProcessorControllerConfiguration *)&v3 dealloc];
}

- (NSDictionary)mainImageDownscalingFactorByAttachedMediaKey
{
  return self->_mainImageDownscalingFactorByAttachedMediaKey;
}

- (void)setMainImageDownscalingFactorByAttachedMediaKey:(id)a3
{
}

- (BWMemoryAnalyticsPayload)memoryAnalyticsPayload
{
  return self->_memoryAnalyticsPayload;
}

- (void)setMemoryAnalyticsPayload:(id)a3
{
}

@end