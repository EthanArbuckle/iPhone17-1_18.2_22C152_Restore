@interface CATRemoteConnectionTrustDecision
- (CATRemoteConnectionTrustDecision)initWithConnection:(id)a3 trust:(__SecTrust *)a4;
- (id)trust;
- (void)dealloc;
- (void)respondWithDecisionToAllowUntrustedConnection:(BOOL)a3;
@end

@implementation CATRemoteConnectionTrustDecision

- (void)dealloc
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->mHasResponded);
  if ((v3 & 1) == 0) {
    [(CATRemoteConnectionTrustDecision *)self respondWithDecisionToAllowUntrustedConnection:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)CATRemoteConnectionTrustDecision;
  [(CATRemoteConnectionTrustDecision *)&v4 dealloc];
}

- (CATRemoteConnectionTrustDecision)initWithConnection:(id)a3 trust:(__SecTrust *)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CATRemoteConnectionTrustDecision;
  v7 = [(CATRemoteConnectionTrustDecision *)&v10 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->mConnection, v6);
    objc_storeStrong(&v8->_trust, a4);
  }

  return v8;
}

- (void)respondWithDecisionToAllowUntrustedConnection:(BOOL)a3
{
  char v3 = 0;
  atomic_compare_exchange_strong((atomic_uchar *volatile)&self->mHasResponded, (unsigned __int8 *)&v3, 1u);
  if (!v3)
  {
    BOOL v4 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->mConnection);
    [WeakRetained trustDecisionDidRespondWithDecisionToAllowUntrustedConnection:v4];
  }
}

- (id)trust
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_trust, 0);

  objc_destroyWeak((id *)&self->mConnection);
}

@end