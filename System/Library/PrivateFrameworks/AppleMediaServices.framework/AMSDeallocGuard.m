@interface AMSDeallocGuard
- (AMSDeallocGuard)initWithDeallocGuardBlock:(id)a3;
- (BOOL)invalidated;
- (id)block;
- (os_unfair_lock_s)invalidationLock;
- (void)dealloc;
- (void)invalidate;
@end

@implementation AMSDeallocGuard

- (void)dealloc
{
  p_invalidationLock = &self->_invalidationLock;
  os_unfair_lock_lock_with_options();
  BOOL invalidated = self->_invalidated;
  os_unfair_lock_unlock(p_invalidationLock);
  if (!invalidated)
  {
    v5 = [(AMSDeallocGuard *)self block];
    v5[2]();
  }
  v6.receiver = self;
  v6.super_class = (Class)AMSDeallocGuard;
  [(AMSDeallocGuard *)&v6 dealloc];
}

- (AMSDeallocGuard)initWithDeallocGuardBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSDeallocGuard;
  v5 = [(AMSDeallocGuard *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id block = v5->_block;
    v5->_id block = (id)v6;

    v5->_BOOL invalidated = 0;
    v5->_invalidationLock._os_unfair_lock_opaque = 0;
  }

  return v5;
}

- (void)invalidate
{
  p_invalidationLock = &self->_invalidationLock;
  os_unfair_lock_assert_not_owner(&self->_invalidationLock);
  os_unfair_lock_lock_with_options();
  self->_BOOL invalidated = 1;
  os_unfair_lock_unlock(p_invalidationLock);
}

- (id)block
{
  return self->_block;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (os_unfair_lock_s)invalidationLock
{
  return self->_invalidationLock;
}

- (void).cxx_destruct
{
}

@end