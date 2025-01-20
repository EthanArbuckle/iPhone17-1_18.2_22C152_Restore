@interface ASAuthorizationAppleIDRequest
- (ASAuthorizationAppleIDRequest)init;
- (NSString)user;
- (void)setUser:(NSString *)user;
@end

@implementation ASAuthorizationAppleIDRequest

- (ASAuthorizationAppleIDRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)ASAuthorizationAppleIDRequest;
  v2 = [(ASAuthorizationOpenIDRequest *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_internalLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (NSString)user
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = self->_user;
  os_unfair_lock_unlock(p_internalLock);

  return v4;
}

- (void)setUser:(NSString *)user
{
  v4 = user;
  os_unfair_lock_lock(&self->_internalLock);
  v5 = self->_user;
  self->_user = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (void).cxx_destruct
{
}

@end