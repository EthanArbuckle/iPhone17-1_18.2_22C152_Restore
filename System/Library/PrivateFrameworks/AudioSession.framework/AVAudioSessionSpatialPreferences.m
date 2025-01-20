@interface AVAudioSessionSpatialPreferences
+ (BOOL)supportsSecureCoding;
- (AVAudioSessionSpatialPreferences)initWithCoder:(id)a3;
- (BOOL)alwaysSpatialize;
- (BOOL)prefersHeadTrackedSpatialization;
- (BOOL)prefersLossyAudioSources;
- (NSArray)spatialAudioSources;
- (int64_t)maximumSpatializableChannels;
- (void)encodeWithCoder:(id)a3;
- (void)setAlwaysSpatialize:(BOOL)a3;
- (void)setMaximumSpatializableChannels:(int64_t)a3;
- (void)setPrefersHeadTrackedSpatialization:(BOOL)a3;
- (void)setPrefersLossyAudioSources:(BOOL)a3;
- (void)setSpatialAudioSources:(id)a3;
@end

@implementation AVAudioSessionSpatialPreferences

- (NSArray)spatialAudioSources
{
  return self->spatialAudioSources;
}

- (void)setPrefersLossyAudioSources:(BOOL)a3
{
  self->prefersLossyAudioSources = a3;
}

- (void)setPrefersHeadTrackedSpatialization:(BOOL)a3
{
  self->prefersHeadTrackedSpatialization = a3;
}

- (void)setMaximumSpatializableChannels:(int64_t)a3
{
  self->maximumSpatializableChannels = a3;
}

- (void)setAlwaysSpatialize:(BOOL)a3
{
  self->alwaysSpatialize = a3;
}

- (void)setSpatialAudioSources:(id)a3
{
}

- (void).cxx_destruct
{
}

- (BOOL)prefersLossyAudioSources
{
  return self->prefersLossyAudioSources;
}

- (BOOL)prefersHeadTrackedSpatialization
{
  return self->prefersHeadTrackedSpatialization;
}

- (int64_t)maximumSpatializableChannels
{
  return self->maximumSpatializableChannels;
}

- (BOOL)alwaysSpatialize
{
  return self->alwaysSpatialize;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeBool:self->prefersHeadTrackedSpatialization forKey:@"prefersHeadTrackedSpatialization"];
  [v4 encodeBool:self->prefersLossyAudioSources forKey:@"prefersLossyAudioSources"];
  [v4 encodeBool:self->alwaysSpatialize forKey:@"alwaysSpatialize"];
  [v4 encodeInteger:self->maximumSpatializableChannels forKey:@"maximumSpatializableChannels"];
  [v4 encodeObject:self->spatialAudioSources forKey:@"spatialAudioSources"];
}

- (AVAudioSessionSpatialPreferences)initWithCoder:(id)a3
{
  id v4 = a3;
  self->prefersHeadTrackedSpatialization = [v4 decodeBoolForKey:@"prefersHeadTrackedSpatialization"];
  self->prefersLossyAudioSources = [v4 decodeBoolForKey:@"prefersLossyAudioSources"];
  self->alwaysSpatialize = [v4 decodeBoolForKey:@"alwaysSpatialize"];
  self->maximumSpatializableChannels = [v4 decodeIntegerForKey:@"maximumSpatializableChannels"];
  v5 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"spatialAudioSources"];
  spatialAudioSources = self->spatialAudioSources;
  self->spatialAudioSources = v5;

  return self;
}

@end