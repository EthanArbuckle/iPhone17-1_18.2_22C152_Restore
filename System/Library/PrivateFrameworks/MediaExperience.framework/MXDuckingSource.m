@interface MXDuckingSource
- (MXDuckingSource)initWithType:(unsigned int)a3 ID:(unint64_t)a4 duckVolume:(float)a5 duckFadeDuration:(float)a6;
- (float)duckFadeDuration;
- (float)duckVolume;
- (unint64_t)ID;
- (unsigned)type;
- (void)dealloc;
- (void)setDuckFadeDuration:(float)a3;
- (void)setDuckVolume:(float)a3;
@end

@implementation MXDuckingSource

- (MXDuckingSource)initWithType:(unsigned int)a3 ID:(unint64_t)a4 duckVolume:(float)a5 duckFadeDuration:(float)a6
{
  v11.receiver = self;
  v11.super_class = (Class)MXDuckingSource;
  result = [(MXDuckingSource *)&v11 init];
  if (result)
  {
    result->_type = a3;
    result->_ID = a4;
    result->_duckVolume = a5;
    result->_duckFadeDuration = a6;
  }
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)MXDuckingSource;
  [(MXDuckingSource *)&v2 dealloc];
}

- (unsigned)type
{
  return self->_type;
}

- (unint64_t)ID
{
  return self->_ID;
}

- (float)duckVolume
{
  return self->_duckVolume;
}

- (void)setDuckVolume:(float)a3
{
  self->_duckVolume = a3;
}

- (float)duckFadeDuration
{
  return self->_duckFadeDuration;
}

- (void)setDuckFadeDuration:(float)a3
{
  self->_duckFadeDuration = a3;
}

@end