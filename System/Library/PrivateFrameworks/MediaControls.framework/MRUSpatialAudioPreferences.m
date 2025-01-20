@interface MRUSpatialAudioPreferences
- (BOOL)isHeadTrackingEnabled;
- (MRUSpatialAudioPreferences)initWithMode:(int)a3 headTrackingEnabled:(BOOL)a4;
- (id)description;
- (id)descriptionForSpatialMode:(int)a3;
- (int)mode;
@end

@implementation MRUSpatialAudioPreferences

- (MRUSpatialAudioPreferences)initWithMode:(int)a3 headTrackingEnabled:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MRUSpatialAudioPreferences;
  result = [(MRUSpatialAudioPreferences *)&v7 init];
  if (result)
  {
    result->_mode = a3;
    result->_isHeadTrackingEnabled = a4;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(MRUSpatialAudioPreferences *)self descriptionForSpatialMode:self->_mode];
  v6 = (void *)v5;
  if (self->_isHeadTrackingEnabled) {
    objc_super v7 = @"YES";
  }
  else {
    objc_super v7 = @"NO";
  }
  v8 = [v3 stringWithFormat:@"%@ mode: %@ | tracking: %@", v4, v5, v7];

  return v8;
}

- (id)descriptionForSpatialMode:(int)a3
{
  if (a3 > 3) {
    return @"Unknown";
  }
  else {
    return off_1E5F102E8[a3];
  }
}

- (int)mode
{
  return self->_mode;
}

- (BOOL)isHeadTrackingEnabled
{
  return self->_isHeadTrackingEnabled;
}

@end