@interface CCUIMutableCASpringAnimationParameters
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDamping:(double)a3;
- (void)setFrameRateRange:(CAFrameRateRange)a3;
- (void)setHighFrameRateReason:(unsigned int)a3;
- (void)setMass:(double)a3;
- (void)setStiffness:(double)a3;
- (void)setTimingFunction:(id)a3;
@end

@implementation CCUIMutableCASpringAnimationParameters

- (void)setMass:(double)a3
{
  self->super._mass = a3;
}

- (void)setStiffness:(double)a3
{
  self->super._stiffness = a3;
}

- (void)setDamping:(double)a3
{
  self->super._damping = a3;
}

- (void)setTimingFunction:(id)a3
{
  self->super._timingFunction = (CCUIAnimationTimingFunctionDescription *)[a3 copyWithZone:0];

  MEMORY[0x1F41817F8]();
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
  v4 = [CCUICASpringAnimationParameters alloc];

  return [(CCUICASpringAnimationParameters *)v4 _initWithAnimationParameters:self];
}

@end