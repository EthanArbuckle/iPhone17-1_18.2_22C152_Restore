@interface CSSimpleLockScreenActionProvider
- (SBFLockScreenActionContext)lockScreenActionContext;
- (void)invalidateLockScreenActionContext;
- (void)setLockScreenActionContext:(id)a3;
@end

@implementation CSSimpleLockScreenActionProvider

- (void)invalidateLockScreenActionContext
{
}

- (SBFLockScreenActionContext)lockScreenActionContext
{
  return self->_lockScreenActionContext;
}

- (void)setLockScreenActionContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end