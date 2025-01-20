@interface CRKSingleConnectionAttemptStudentDaemonProxy
- (CRKSingleConnectionAttemptStudentDaemonProxy)init;
- (CRKSingleConnectionAttemptStudentDaemonProxy)initWithTransportProvider:(id)a3;
- (id)operationForRequest:(id)a3;
- (void)client:(id)a3 didInterruptWithError:(id)a4;
- (void)connect;
- (void)connectIfNeeded;
- (void)dealloc;
- (void)failWithError:(id)a3;
@end

@implementation CRKSingleConnectionAttemptStudentDaemonProxy

- (void)dealloc
{
  [(CATTaskClient *)self->mTaskClient invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CRKSingleConnectionAttemptStudentDaemonProxy;
  [(CRKSingleConnectionAttemptStudentDaemonProxy *)&v3 dealloc];
}

- (CRKSingleConnectionAttemptStudentDaemonProxy)init
{
  objc_super v3 = objc_opt_new();
  v4 = [(CRKSingleConnectionAttemptStudentDaemonProxy *)self initWithTransportProvider:v3];

  return v4;
}

- (CRKSingleConnectionAttemptStudentDaemonProxy)initWithTransportProvider:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRKSingleConnectionAttemptStudentDaemonProxy;
  v6 = [(CRKSingleConnectionAttemptStudentDaemonProxy *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->mTransportProvider, a3);
    uint64_t v8 = objc_opt_new();
    mTaskClient = v7->mTaskClient;
    v7->mTaskClient = (CATTaskClient *)v8;

    [(CATTaskClient *)v7->mTaskClient setDelegate:v7];
  }

  return v7;
}

- (void)connectIfNeeded
{
  if (!self->mDidAttemptToConnect)
  {
    self->mDidAttemptToConnect = 1;
    [(CRKSingleConnectionAttemptStudentDaemonProxy *)self connect];
  }
}

- (void)connect
{
  mTransportProvider = self->mTransportProvider;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __55__CRKSingleConnectionAttemptStudentDaemonProxy_connect__block_invoke;
  v3[3] = &unk_2646F57D0;
  v3[4] = self;
  [(CRKTransportProviding *)mTransportProvider fetchTransportWithCompletion:v3];
}

uint64_t __55__CRKSingleConnectionAttemptStudentDaemonProxy_connect__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_super v3 = *(id **)(a1 + 32);
  if (a3) {
    return objc_msgSend(v3, "failWithError:");
  }
  else {
    return [v3[2] connectWithTransport:a2];
  }
}

- (void)failWithError:(id)a3
{
  id v5 = (NSError *)a3;
  if (!v5)
  {
    v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"CRKSingleConnectionAttemptStudentDaemonProxy.m", 63, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];
  }
  mError = self->mError;
  self->mError = v5;
  uint64_t v8 = v5;

  [(CATTaskClient *)self->mTaskClient invalidateWithError:v8];
}

- (id)operationForRequest:(id)a3
{
  id v5 = a3;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    uint64_t v8 = [MEMORY[0x263F08690] currentHandler];
    v9 = NSStringFromSelector(a2);
    [v8 handleFailureInMethod:a2, self, @"CRKSingleConnectionAttemptStudentDaemonProxy.m", 71, @"%@ must be called from the main thread", v9 object file lineNumber description];
  }
  [(CRKSingleConnectionAttemptStudentDaemonProxy *)self connectIfNeeded];
  if (self->mError) {
    objc_msgSend(MEMORY[0x263F39CA8], "invalidRemoteTaskWithRequest:error:", v5);
  }
  else {
  v6 = [(CATTaskClient *)self->mTaskClient prepareTaskOperationForRequest:v5];
  }

  return v6;
}

- (void)client:(id)a3 didInterruptWithError:(id)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mError, 0);
  objc_storeStrong((id *)&self->mTaskClient, 0);

  objc_storeStrong((id *)&self->mTransportProvider, 0);
}

@end