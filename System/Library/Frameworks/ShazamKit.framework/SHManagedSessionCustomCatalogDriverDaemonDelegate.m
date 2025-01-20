@interface SHManagedSessionCustomCatalogDriverDaemonDelegate
- (NSUUID)inflightRequestID;
- (NSUUID)matchingSignatureID;
- (SHSessionDriverDelegate)sessionDriverDelegate;
- (void)matcher:(id)a3 didProduceResponse:(id)a4;
- (void)setSessionDriverDelegate:(id)a3;
@end

@implementation SHManagedSessionCustomCatalogDriverDaemonDelegate

- (void)matcher:(id)a3 didProduceResponse:(id)a4
{
  id v16 = a4;
  if ([v16 result] == 2)
  {
    v5 = [v16 signature];
    v6 = [v5 _ID];
    matchingSignatureID = self->_matchingSignatureID;
    self->_matchingSignatureID = v6;

    v8 = [v16 runningAssociatedRequestID];
    inflightRequestID = self->_inflightRequestID;
    self->_inflightRequestID = v8;

    v10 = [(SHManagedSessionCustomCatalogDriverDaemonDelegate *)self sessionDriverDelegate];
    v11 = [v16 signature];
    [v10 matchSignature:v11];
  }
  else
  {
    v12 = [v16 error];
    v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id v14 = +[SHError errorWithCode:500 underlyingError:0];
    }
    v10 = v14;

    v11 = [(SHManagedSessionCustomCatalogDriverDaemonDelegate *)self sessionDriverDelegate];
    v15 = [v16 signature];
    [v11 sessionDriverEncounteredUnrecoverableError:v10 forSignature:v15];
  }
}

- (NSUUID)matchingSignatureID
{
  return self->_matchingSignatureID;
}

- (NSUUID)inflightRequestID
{
  return self->_inflightRequestID;
}

- (SHSessionDriverDelegate)sessionDriverDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionDriverDelegate);

  return (SHSessionDriverDelegate *)WeakRetained;
}

- (void)setSessionDriverDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sessionDriverDelegate);
  objc_storeStrong((id *)&self->_inflightRequestID, 0);

  objc_storeStrong((id *)&self->_matchingSignatureID, 0);
}

@end