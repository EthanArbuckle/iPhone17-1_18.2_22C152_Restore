@interface ASCredentialIdentityStoreState
- (ASCredentialIdentityStoreState)initWithEnabledState:(BOOL)a3 supportsIncrementalUpdates:(BOOL)a4;
- (BOOL)isEnabled;
- (BOOL)supportsIncrementalUpdates;
- (id)description;
@end

@implementation ASCredentialIdentityStoreState

- (ASCredentialIdentityStoreState)initWithEnabledState:(BOOL)a3 supportsIncrementalUpdates:(BOOL)a4
{
  v10.receiver = self;
  v10.super_class = (Class)ASCredentialIdentityStoreState;
  v6 = [(ASCredentialIdentityStoreState *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_enabled = a3;
    v6->_supportsIncrementalUpdates = a4;
    v8 = v6;
  }

  return v7;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [NSNumber numberWithBool:self->_enabled];
  v6 = [NSNumber numberWithBool:self->_supportsIncrementalUpdates];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; isEnabled=%@; supportsIncrementalUpdates=%@>",
    v4,
    self,
    v5,
  v7 = v6);

  return v7;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)supportsIncrementalUpdates
{
  return self->_supportsIncrementalUpdates;
}

@end