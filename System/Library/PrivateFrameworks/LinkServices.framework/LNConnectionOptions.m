@interface LNConnectionOptions
- (BOOL)initiatesAudioSession;
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)newConnectionAction;
- (int64_t)authenticationPolicy;
- (void)setAuthenticationPolicy:(int64_t)a3;
- (void)setInitiatesAudioSession:(BOOL)a3;
@end

@implementation LNConnectionOptions

- (int64_t)authenticationPolicy
{
  return self->_authenticationPolicy;
}

- (id)newConnectionAction
{
  v2 = [LNConnectionAction alloc];
  v3 = [MEMORY[0x1E4F29128] UUID];
  v4 = -[LNConnectionAction initWithIdentifier:metadataVersion:](v2, "initWithIdentifier:metadataVersion:", v3, [MEMORY[0x1E4F72600] latestMetadataVersion]);

  return v4;
}

- (BOOL)initiatesAudioSession
{
  return self->_initiatesAudioSession;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNConnectionOptions *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      int64_t v7 = [(LNConnectionOptions *)self authenticationPolicy];
      BOOL v8 = v7 == [(LNConnectionOptions *)v6 authenticationPolicy];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  return v8;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  int64_t v6 = [(LNConnectionOptions *)self authenticationPolicy];
  int64_t v7 = @"Force Unlock";
  if (!v6) {
    int64_t v7 = @"Default";
  }
  BOOL v8 = v7;
  BOOL v9 = [(LNConnectionOptions *)self initiatesAudioSession];
  v10 = @"NO";
  if (v9) {
    v10 = @"YES";
  }
  v11 = [v3 stringWithFormat:@"<%@: %p, authenticationPolicy: %@, initiatesAudioSession: %@>", v5, self, v8, v10];

  return v11;
}

- (void)setInitiatesAudioSession:(BOOL)a3
{
  self->_initiatesAudioSession = a3;
}

- (void)setAuthenticationPolicy:(int64_t)a3
{
  self->_authenticationPolicy = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setAuthenticationPolicy:", -[LNConnectionOptions authenticationPolicy](self, "authenticationPolicy"));
  return v4;
}

@end