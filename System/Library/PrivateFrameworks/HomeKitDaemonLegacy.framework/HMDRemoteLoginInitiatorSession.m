@interface HMDRemoteLoginInitiatorSession
- (HMDRemoteLoginInitiatorSession)initWithSessionID:(id)a3;
- (NSString)sessionID;
- (id)description;
@end

@implementation HMDRemoteLoginInitiatorSession

- (void).cxx_destruct
{
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (id)description
{
  v2 = NSString;
  v3 = [(HMDRemoteLoginInitiatorSession *)self sessionID];
  v4 = [v2 stringWithFormat:@"[Login-Initiator-Session: %@]", v3];

  return v4;
}

- (HMDRemoteLoginInitiatorSession)initWithSessionID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDRemoteLoginInitiatorSession;
  v6 = [(HMDRemoteLoginInitiatorSession *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sessionID, a3);
  }

  return v7;
}

@end