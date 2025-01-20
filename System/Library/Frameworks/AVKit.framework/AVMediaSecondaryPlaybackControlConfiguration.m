@interface AVMediaSecondaryPlaybackControlConfiguration
- (AVMediaSecondaryPlaybackControlConfiguration)init;
- (AVMediaSecondaryPlaybackControlConfiguration)initWithType:(unint64_t)a3;
- (BOOL)isEnabled;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)type;
- (void)setEnabled:(BOOL)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation AVMediaSecondaryPlaybackControlConfiguration

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(AVMediaSecondaryPlaybackControlConfiguration);
  [(AVMediaSecondaryPlaybackControlConfiguration *)v4 setType:[(AVMediaSecondaryPlaybackControlConfiguration *)self type]];
  [(AVMediaSecondaryPlaybackControlConfiguration *)v4 setEnabled:[(AVMediaSecondaryPlaybackControlConfiguration *)self isEnabled]];
  return v4;
}

- (AVMediaSecondaryPlaybackControlConfiguration)initWithType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AVMediaSecondaryPlaybackControlConfiguration;
  result = [(AVMediaSecondaryPlaybackControlConfiguration *)&v5 init];
  if (result)
  {
    result->_type = a3;
    result->_enabled = 1;
  }
  return result;
}

- (AVMediaSecondaryPlaybackControlConfiguration)init
{
  return [(AVMediaSecondaryPlaybackControlConfiguration *)self initWithType:0];
}

@end