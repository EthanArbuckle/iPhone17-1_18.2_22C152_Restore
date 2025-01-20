@interface CRKFailIfSimulatorTransportProvider
- (CRKFailIfSimulatorTransportProvider)initWithTransportProvider:(id)a3;
- (CRKFailIfSimulatorTransportProvider)initWithTransportProvider:(id)a3 failureError:(id)a4;
- (CRKTransportProviding)baseProvider;
- (NSError)failureError;
- (void)fetchTransportWithCompletion:(id)a3;
@end

@implementation CRKFailIfSimulatorTransportProvider

- (CRKFailIfSimulatorTransportProvider)initWithTransportProvider:(id)a3
{
  id v4 = a3;
  v5 = CRKErrorWithCodeAndUserInfo(31, 0);
  v6 = [(CRKFailIfSimulatorTransportProvider *)self initWithTransportProvider:v4 failureError:v5];

  return v6;
}

- (CRKFailIfSimulatorTransportProvider)initWithTransportProvider:(id)a3 failureError:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRKFailIfSimulatorTransportProvider;
  v9 = [(CRKFailIfSimulatorTransportProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_baseProvider, a3);
    objc_storeStrong((id *)&v10->_failureError, a4);
  }

  return v10;
}

- (void)fetchTransportWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if (CRKIsSimulator())
  {
    id v5 = [(CRKFailIfSimulatorTransportProvider *)self failureError];
    v4[2](v4, 0);
  }
  else
  {
    id v5 = [(CRKFailIfSimulatorTransportProvider *)self baseProvider];
    [v5 fetchTransportWithCompletion:v4];
  }
}

- (CRKTransportProviding)baseProvider
{
  return self->_baseProvider;
}

- (NSError)failureError
{
  return self->_failureError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failureError, 0);

  objc_storeStrong((id *)&self->_baseProvider, 0);
}

@end