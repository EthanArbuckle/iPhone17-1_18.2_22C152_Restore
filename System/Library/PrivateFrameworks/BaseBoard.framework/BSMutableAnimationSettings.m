@interface BSMutableAnimationSettings
- (void)setDelay:(double)a3;
- (void)setDuration:(double)a3;
- (void)setHighFrameRateReason:(unsigned int)a3;
- (void)setTimingFunction:(id)a3;
@end

@implementation BSMutableAnimationSettings

- (void)setTimingFunction:(id)a3
{
}

- (void)setDelay:(double)a3
{
  if (self)
  {
    p_lock = &self->super._lock;
    os_unfair_lock_lock(&self->super._lock);
    self->super._lock_delay = a3;
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)setHighFrameRateReason:(unsigned int)a3
{
  if (self)
  {
    p_lock = &self->super._lock;
    os_unfair_lock_lock(&self->super._lock);
    self->super._lock_highFrameRateReason = a3;
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)setDuration:(double)a3
{
  if (self)
  {
    if (self->super._isSpring)
    {
      v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:sel__setDuration_ object:self file:@"BSAnimationSettings.m" lineNumber:581 description:@"cannot set duration on a spring animation"];
    }
    os_unfair_lock_lock(&self->super._lock);
    self->super._lock_storedDuration = a3;
    os_unfair_lock_unlock(&self->super._lock);
  }
}

@end