@interface CCUIMutableCABasicAnimationParameters
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDuration:(double)a3;
- (void)setFrameRateRange:(CAFrameRateRange)a3;
- (void)setHighFrameRateReason:(unsigned int)a3;
- (void)setTimingFunction:(id)a3;
@end

@implementation CCUIMutableCABasicAnimationParameters

- (void)setDuration:(double)a3
{
  self->super._duration = a3;
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
  v4 = [CCUICABasicAnimationParameters alloc];

  return [(CCUICABasicAnimationParameters *)v4 _initWithAnimationParameters:self];
}

@end