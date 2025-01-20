@interface APCPlayerEmbedInfo
- (APCPlayerEmbedInfo)initWithPasscodeDurationNSec:(unint64_t)a3;
- (BOOL)isValid;
- (unint64_t)estPasscodeDuration;
- (unint64_t)measPasscodeDuration;
- (void)setMeasPasscodeDuration:(unint64_t)a3;
@end

@implementation APCPlayerEmbedInfo

- (APCPlayerEmbedInfo)initWithPasscodeDurationNSec:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)APCPlayerEmbedInfo;
  v3 = [(APCPlayerEmbedInfo *)&v5 init];
  if (v3)
  {
    v3->_estPasscodeDuration = __udivti3();
    v3->_measPasscodeDuration = 0;
  }
  return v3;
}

- (BOOL)isValid
{
  return self->_estPasscodeDuration != 0;
}

- (unint64_t)estPasscodeDuration
{
  return self->_estPasscodeDuration;
}

- (unint64_t)measPasscodeDuration
{
  return self->_measPasscodeDuration;
}

- (void)setMeasPasscodeDuration:(unint64_t)a3
{
  self->_measPasscodeDuration = a3;
}

@end