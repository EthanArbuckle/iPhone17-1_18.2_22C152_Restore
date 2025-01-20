@interface HDQueryServerClientState
- (BOOL)isBackgroundRunning;
- (BOOL)isForeground;
- (BOOL)isSuspended;
- (HDQueryServerClientState)init;
- (HDQueryServerClientState)initWithApplicationState:(unsigned int)a3;
- (id)description;
- (unsigned)applicationState;
@end

@implementation HDQueryServerClientState

- (HDQueryServerClientState)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDQueryServerClientState)initWithApplicationState:(unsigned int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HDQueryServerClientState;
  result = [(HDQueryServerClientState *)&v5 init];
  if (result) {
    result->_applicationState = a3;
  }
  return result;
}

- (BOOL)isForeground
{
  return self->_applicationState == 8;
}

- (BOOL)isSuspended
{
  return self->_applicationState == 2;
}

- (BOOL)isBackgroundRunning
{
  return self->_applicationState == 4;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = HDBKSApplicationStateString(self->_applicationState);
  if ([(HDQueryServerClientState *)self isForeground]) {
    objc_super v5 = @"YES";
  }
  else {
    objc_super v5 = @"NO";
  }
  if ([(HDQueryServerClientState *)self isSuspended]) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  v7 = [v3 stringWithFormat:@"<%@: foreground=%@, suspended=%@>", v4, v5, v6];

  return v7;
}

- (unsigned)applicationState
{
  return self->_applicationState;
}

@end