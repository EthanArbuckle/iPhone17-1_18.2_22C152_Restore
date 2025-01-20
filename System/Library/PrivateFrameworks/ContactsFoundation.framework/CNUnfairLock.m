@interface CNUnfairLock
- (BOOL)tryLock;
- (CNUnfairLock)init;
- (id)description;
- (void)assertCurrentThreadIsNotOwner;
- (void)assertCurrentThreadIsOwner;
- (void)lock;
- (void)unlock;
@end

@implementation CNUnfairLock

- (void)unlock
{
}

- (void)lock
{
}

- (CNUnfairLock)init
{
  v6.receiver = self;
  v6.super_class = (Class)CNUnfairLock;
  v2 = [(CNUnfairLock *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_os_unfair_lock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (id)description
{
  v3 = +[CNDescriptionBuilder descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"os_unfair_lock_t" pointerValue:&self->_os_unfair_lock];
  v5 = [v3 build];

  return v5;
}

- (BOOL)tryLock
{
  return os_unfair_lock_trylock(&self->_os_unfair_lock);
}

- (void)assertCurrentThreadIsOwner
{
}

- (void)assertCurrentThreadIsNotOwner
{
}

@end