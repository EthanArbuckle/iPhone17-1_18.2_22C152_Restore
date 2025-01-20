@interface CCUIMutableC2AnimationParameters
- (id)copyWithZone:(_NSZone *)a3;
- (void)setFrameRateRange:(CAFrameRateRange)a3;
- (void)setFriction:(double)a3;
- (void)setHighFrameRateReason:(unsigned int)a3;
- (void)setInteractive:(BOOL)a3;
- (void)setTension:(double)a3;
@end

@implementation CCUIMutableC2AnimationParameters

- (void)setInteractive:(BOOL)a3
{
  self->super._interactive = a3;
}

- (void)setTension:(double)a3
{
  self->super._tension = a3;
}

- (void)setFriction:(double)a3
{
  self->super._friction = a3;
}

- (void)setFrameRateRange:(CAFrameRateRange)a3
{
  self->super._frameRateRange = a3;
}

- (void)setHighFrameRateReason:(unsigned int)a3
{
  self->super._highFrameRateReason = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [CCUIC2AnimationParameters alloc];

  return [(CCUIC2AnimationParameters *)v4 _initWithAnimationParameters:self];
}

@end