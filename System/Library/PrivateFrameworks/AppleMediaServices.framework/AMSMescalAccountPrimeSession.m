@interface AMSMescalAccountPrimeSession
- (AMSBagProtocol)bag;
- (AMSMescalAccountPrimeSession)initWithBag:(id)a3;
- (AMSMescalSession)session;
- (id)primeSignatureForData:(id)a3;
- (id)signData:(id)a3;
- (id)verifyPrimeSignature:(id)a3;
- (void)setBag:(id)a3;
- (void)setSession:(id)a3;
@end

@implementation AMSMescalAccountPrimeSession

- (AMSMescalAccountPrimeSession)initWithBag:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSMescalAccountPrimeSession;
  v6 = [(AMSMescalAccountPrimeSession *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bag, a3);
    v8 = [[AMSMescalSession alloc] initWithType:2];
    session = v7->_session;
    v7->_session = v8;
  }
  return v7;
}

- (id)primeSignatureForData:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSMescalAccountPrimeSession *)self session];
  v6 = [(AMSMescalAccountPrimeSession *)self bag];
  id v11 = 0;
  v7 = [v5 primeSignatureForData:v4 bag:v6 error:&v11];

  id v8 = v11;
  if (v7) {
    +[AMSPromise promiseWithResult:v7];
  }
  else {
  v9 = +[AMSPromise promiseWithError:v8];
  }

  return v9;
}

- (id)signData:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSMescalAccountPrimeSession *)self session];
  v6 = [(AMSMescalAccountPrimeSession *)self bag];
  id v11 = 0;
  v7 = [v5 signData:v4 bag:v6 error:&v11];

  id v8 = v11;
  if (v7) {
    +[AMSPromise promiseWithResult:v7];
  }
  else {
  v9 = +[AMSPromise promiseWithError:v8];
  }

  return v9;
}

- (id)verifyPrimeSignature:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSMescalAccountPrimeSession *)self session];
  id v11 = 0;
  int v6 = [v5 verifyPrimeSignature:v4 error:&v11];

  id v7 = v11;
  if (v6)
  {
    uint64_t v8 = +[AMSPromise promiseWithResult:MEMORY[0x1E4F1CC38]];
  }
  else
  {
    if (!v7)
    {
      AMSError(0, @"Mescal Account Prime Session", @"Failed to verify prime signature.", 0);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v8 = +[AMSPromise promiseWithError:v7];
  }
  v9 = (void *)v8;

  return v9;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (AMSMescalSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end