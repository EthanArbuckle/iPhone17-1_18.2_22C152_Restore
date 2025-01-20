@interface MRUSpatialAudioMode
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (MRUSpatialAudioMode)initWithType:(int64_t)a3;
- (MRUSpatialAudioMode)initWithType:(int64_t)a3 isEnabled:(BOOL)a4;
- (int64_t)type;
@end

@implementation MRUSpatialAudioMode

- (MRUSpatialAudioMode)initWithType:(int64_t)a3
{
  return [(MRUSpatialAudioMode *)self initWithType:a3 isEnabled:1];
}

- (MRUSpatialAudioMode)initWithType:(int64_t)a3 isEnabled:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MRUSpatialAudioMode;
  result = [(MRUSpatialAudioMode *)&v7 init];
  if (result)
  {
    result->_type = a3;
    result->_isEnabled = a4;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MRUSpatialAudioMode *)a3;
  if (self != v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      [(MRUSpatialAudioMode *)v5 type];
      [(MRUSpatialAudioMode *)v5 isEnabled];
    }
  }

  return self == v4;
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

@end