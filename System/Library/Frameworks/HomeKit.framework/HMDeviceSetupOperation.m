@interface HMDeviceSetupOperation
- (HMDeviceSetupOperation)init;
- (HMDeviceSetupOperation)initWithSession:(id)a3;
- (HMDeviceSetupOperation)initWithSession:(id)a3 sessionIdentifier:(id)a4;
- (HMDeviceSetupOperation)initWithSession:(id)a3 setupSessionFactory:(id)a4;
- (HMTRSession)trSession;
- (TRSession)session;
@end

@implementation HMDeviceSetupOperation

- (void).cxx_destruct
{
}

- (HMTRSession)trSession
{
  return (HMTRSession *)objc_getProperty(self, a2, 296, 1);
}

- (TRSession)session
{
  v7.receiver = self;
  v7.super_class = (Class)HMDeviceSetupOperation;
  v2 = [(HMDeviceSetupOperationBase *)&v7 sessionTransport];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  v5 = [v4 session];

  return (TRSession *)v5;
}

- (HMDeviceSetupOperation)initWithSession:(id)a3 setupSessionFactory:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[HMTRSession alloc] initWithSession:v7];

  v11.receiver = self;
  v11.super_class = (Class)HMDeviceSetupOperation;
  v9 = [(HMDeviceSetupOperationBase *)&v11 initWithSessionTransport:v8 setupSessionFactory:v6];

  if (v9) {
    objc_storeStrong((id *)&v9->_trSession, v8);
  }

  return v9;
}

- (HMDeviceSetupOperation)initWithSession:(id)a3 sessionIdentifier:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__HMDeviceSetupOperation_initWithSession_sessionIdentifier___block_invoke;
  v10[3] = &unk_1E5940BE8;
  id v11 = v6;
  id v7 = v6;
  v8 = [(HMDeviceSetupOperation *)self initWithSession:a3 setupSessionFactory:v10];

  return v8;
}

HMDeviceSetupSession *__60__HMDeviceSetupOperation_initWithSession_sessionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[HMDeviceSetupSession alloc] initWithRole:0 identifier:*(void *)(a1 + 32) delegate:v3];

  return v4;
}

- (HMDeviceSetupOperation)initWithSession:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F29128];
  id v5 = a3;
  id v6 = [v4 UUID];
  id v7 = [(HMDeviceSetupOperation *)self initWithSession:v5 sessionIdentifier:v6];

  return v7;
}

- (HMDeviceSetupOperation)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end