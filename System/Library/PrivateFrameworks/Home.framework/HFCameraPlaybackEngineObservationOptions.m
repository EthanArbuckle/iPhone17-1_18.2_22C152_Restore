@interface HFCameraPlaybackEngineObservationOptions
+ (HFCameraPlaybackEngineObservationOptions)defaultOptions;
- (NSNumber)periodicTimeUpdateInterval;
- (void)setPeriodicTimeUpdateInterval:(id)a3;
@end

@implementation HFCameraPlaybackEngineObservationOptions

+ (HFCameraPlaybackEngineObservationOptions)defaultOptions
{
  id v2 = objc_alloc_init((Class)a1);
  return (HFCameraPlaybackEngineObservationOptions *)v2;
}

- (NSNumber)periodicTimeUpdateInterval
{
  return self->_periodicTimeUpdateInterval;
}

- (void)setPeriodicTimeUpdateInterval:(id)a3
{
}

- (void).cxx_destruct
{
}

@end