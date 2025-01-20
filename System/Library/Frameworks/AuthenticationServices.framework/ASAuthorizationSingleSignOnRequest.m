@interface ASAuthorizationSingleSignOnRequest
- (ASAuthorizationSingleSignOnRequest)initWithProvider:(id)a3;
- (BOOL)isUserInterfaceEnabled;
- (BOOL)supportsStyle:(int64_t)a3;
- (NSArray)authorizationOptions;
- (void)setAuthorizationOptions:(NSArray *)authorizationOptions;
- (void)setUserInterfaceEnabled:(BOOL)userInterfaceEnabled;
@end

@implementation ASAuthorizationSingleSignOnRequest

- (ASAuthorizationSingleSignOnRequest)initWithProvider:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ASAuthorizationSingleSignOnRequest;
  v3 = [(ASAuthorizationRequest *)&v7 initWithProvider:a3];
  v4 = v3;
  if (v3)
  {
    v3->_userInterfaceEnabled = 1;
    v3->_internalLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (BOOL)supportsStyle:(int64_t)a3
{
  return (a3 & 7) == 0 && (unint64_t)a3 < 3;
}

- (NSArray)authorizationOptions
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = self->_authorizationOptions;
  os_unfair_lock_unlock(p_internalLock);

  return v4;
}

- (void)setAuthorizationOptions:(NSArray *)authorizationOptions
{
  v4 = authorizationOptions;
  os_unfair_lock_lock(&self->_internalLock);
  v5 = self->_authorizationOptions;
  self->_authorizationOptions = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (BOOL)isUserInterfaceEnabled
{
  v2 = self;
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  LOBYTE(v2) = v2->_userInterfaceEnabled;
  os_unfair_lock_unlock(p_internalLock);
  return (char)v2;
}

- (void)setUserInterfaceEnabled:(BOOL)userInterfaceEnabled
{
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  self->_userInterfaceEnabled = userInterfaceEnabled;

  os_unfair_lock_unlock(p_internalLock);
}

- (void).cxx_destruct
{
}

@end