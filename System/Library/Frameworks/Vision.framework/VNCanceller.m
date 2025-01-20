@interface VNCanceller
- (BOOL)tryToPerformBlock:(id)a3 usingSignallingBlock:(id)a4;
- (BOOL)wasSignalled;
- (VNCanceller)init;
- (void)_releaseSignallingBlock;
- (void)reset;
- (void)signalCancellation;
@end

@implementation VNCanceller

- (void).cxx_destruct
{
}

- (BOOL)wasSignalled
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_signalled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)signalCancellation
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_signalled)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_signalled = 1;
    v4 = (void (**)(void))_Block_copy(self->_signallingBlock);
    os_unfair_lock_unlock(p_lock);
    if (v4)
    {
      v4[2](v4);
    }
  }
}

- (void)reset
{
  [(VNCanceller *)self _releaseSignallingBlock];
  os_unfair_lock_lock(&self->_lock);
  self->_signalled = 0;

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)tryToPerformBlock:(id)a3 usingSignallingBlock:(id)a4
{
  v6 = (void (**)(void))a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  BOOL signalled = self->_signalled;
  if (self->_signalled)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    v9 = _Block_copy(v7);
    id signallingBlock = self->_signallingBlock;
    self->_id signallingBlock = v9;

    os_unfair_lock_unlock(&self->_lock);
    if (v6) {
      v6[2](v6);
    }
    [(VNCanceller *)self _releaseSignallingBlock];
  }

  return !signalled;
}

- (void)_releaseSignallingBlock
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id signallingBlock = self->_signallingBlock;
  self->_id signallingBlock = 0;

  os_unfair_lock_unlock(p_lock);
}

- (VNCanceller)init
{
  v6.receiver = self;
  v6.super_class = (Class)VNCanceller;
  v2 = [(VNCanceller *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

@end