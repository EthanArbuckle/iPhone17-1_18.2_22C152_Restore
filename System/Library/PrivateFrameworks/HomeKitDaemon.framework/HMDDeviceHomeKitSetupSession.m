@interface HMDDeviceHomeKitSetupSession
- (BOOL)hasFailedRelayAttempt;
- (BOOL)isFirstResidentForHome;
- (BOOL)shouldRelayRequest;
- (HMDDeviceHomeKitSetupSession)initWithFirstResidentForHome:(BOOL)a3 clientConnection:(id)a4;
- (HMDXPCClientConnection)clientConnection;
- (void)markHasFailedRelayAttempt;
- (void)setFirstResidentForHome:(BOOL)a3;
- (void)setHasFailedRelayAttempt:(BOOL)a3;
@end

@implementation HMDDeviceHomeKitSetupSession

- (void).cxx_destruct
{
}

- (HMDXPCClientConnection)clientConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientConnection);
  return (HMDXPCClientConnection *)WeakRetained;
}

- (void)setHasFailedRelayAttempt:(BOOL)a3
{
  self->_hasFailedRelayAttempt = a3;
}

- (BOOL)hasFailedRelayAttempt
{
  return self->_hasFailedRelayAttempt;
}

- (void)setFirstResidentForHome:(BOOL)a3
{
  self->_firstResidentForHome = a3;
}

- (BOOL)isFirstResidentForHome
{
  return self->_firstResidentForHome;
}

- (void)markHasFailedRelayAttempt
{
}

- (BOOL)shouldRelayRequest
{
  if ([(HMDDeviceHomeKitSetupSession *)self isFirstResidentForHome]) {
    return 0;
  }
  else {
    return ![(HMDDeviceHomeKitSetupSession *)self hasFailedRelayAttempt];
  }
}

- (HMDDeviceHomeKitSetupSession)initWithFirstResidentForHome:(BOOL)a3 clientConnection:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)HMDDeviceHomeKitSetupSession;
  v7 = [(HMDDeviceHomeKitSetupSession *)&v10 init];
  v8 = v7;
  if (v7)
  {
    v7->_firstResidentForHome = a3;
    objc_storeWeak((id *)&v7->_clientConnection, v6);
  }

  return v8;
}

@end