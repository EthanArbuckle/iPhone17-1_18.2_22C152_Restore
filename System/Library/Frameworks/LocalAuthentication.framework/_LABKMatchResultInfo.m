@interface _LABKMatchResultInfo
- (BKIdentity)identity;
- (int64_t)lockoutState;
- (void)setIdentity:(id)a3;
- (void)setLockoutState:(int64_t)a3;
@end

@implementation _LABKMatchResultInfo

- (BKIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
}

- (int64_t)lockoutState
{
  return self->_lockoutState;
}

- (void)setLockoutState:(int64_t)a3
{
  self->_lockoutState = a3;
}

- (void).cxx_destruct
{
}

@end