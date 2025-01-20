@interface BLSHPendingBacklightRamp
- (BLSHPendingBacklightRamp)initWithBacklightRampBlock:(id)a3;
- (BOOL)hasPendingRamp;
- (BOOL)performBacklightRampIfNeededWithDuration:(double)a3;
- (id)description;
@end

@implementation BLSHPendingBacklightRamp

- (BLSHPendingBacklightRamp)initWithBacklightRampBlock:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BLSHPendingBacklightRamp;
  v5 = [(BLSHPendingBacklightRamp *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    uint64_t v7 = [v4 copy];
    id lock_backlightRampBlock = v6->_lock_backlightRampBlock;
    v6->_id lock_backlightRampBlock = (id)v7;
  }
  return v6;
}

- (BOOL)hasPendingRamp
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_backlightRampBlock != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)performBacklightRampIfNeededWithDuration:(double)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = (void (**)(void, double))MEMORY[0x223C5E2B0](self->_lock_backlightRampBlock);
  id lock_backlightRampBlock = self->_lock_backlightRampBlock;
  self->_id lock_backlightRampBlock = 0;

  os_unfair_lock_unlock(p_lock);
  if (v6) {
    v6[2](v6, a3);
  }

  return v6 != 0;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  os_unfair_lock_lock(&self->_lock);
  id v4 = (id)[v3 appendPointer:self->_lock_backlightRampBlock withName:@"backlightRamp"];
  os_unfair_lock_unlock(&self->_lock);
  v5 = [v3 build];

  return v5;
}

- (void).cxx_destruct
{
}

@end