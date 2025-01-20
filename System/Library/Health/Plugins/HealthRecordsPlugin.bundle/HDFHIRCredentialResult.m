@interface HDFHIRCredentialResult
- (BOOL)shouldRefresh;
- (HDFHIRAuthResponse)authResponse;
- (HKFHIRCredential)credential;
- (NSError)refreshError;
- (_HDWrappedFHIRCredential)wrappedCredential;
- (id)_initWithCredential:(id)a3 authResponse:(id)a4;
- (id)_initWithWrappedCredential:(id)a3 authResponse:(id)a4 refreshError:(id)a5;
- (id)_resultWithAuthResponse:(id)a3;
- (id)_resultWithRefreshError:(id)a3;
- (id)asRefreshResultWithEndStates:(id)a3;
- (void)didRefreshCredential:(id)a3;
- (void)invalidate;
@end

@implementation HDFHIRCredentialResult

- (id)_initWithCredential:(id)a3 authResponse:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[_HDWrappedFHIRCredential alloc] _initWithCredential:v7];

  id v9 = [(HDFHIRCredentialResult *)self _initWithWrappedCredential:v8 authResponse:v6 refreshError:0];
  return v9;
}

- (id)_initWithWrappedCredential:(id)a3 authResponse:(id)a4 refreshError:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HDFHIRCredentialResult;
  v12 = [(HDFHIRCredentialResult *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_wrappedCredential, a3);
    v14 = (HDFHIRAuthResponse *)[v10 copy];
    authResponse = v13->_authResponse;
    v13->_authResponse = v14;

    v16 = (NSError *)[v11 copy];
    refreshError = v13->_refreshError;
    v13->_refreshError = v16;
  }
  return v13;
}

- (id)_resultWithAuthResponse:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)objc_opt_class()) _initWithWrappedCredential:self->_wrappedCredential authResponse:v4 refreshError:0];

  return v5;
}

- (id)_resultWithRefreshError:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)objc_opt_class()) _initWithWrappedCredential:self->_wrappedCredential authResponse:self->_authResponse refreshError:v4];

  return v5;
}

- (void)didRefreshCredential:(id)a3
{
}

- (BOOL)shouldRefresh
{
  v3 = [(HDFHIRCredentialResult *)self credential];
  id v4 = [(HDFHIRCredentialResult *)self refreshError];
  unsigned __int8 v5 = objc_msgSend(v4, "hk_OAuth2_isAccessDeniedError");

  if (v5)
  {
    unsigned __int8 v6 = 0;
  }
  else if ([v3 isExpired])
  {
    unsigned __int8 v6 = 1;
  }
  else
  {
    id v7 = [(HDFHIRCredentialResult *)self wrappedCredential];
    unsigned __int8 v6 = [v7 isInvalidated];
  }
  return v6;
}

- (void)invalidate
{
  id v2 = [(HDFHIRCredentialResult *)self wrappedCredential];
  [v2 setInvalidated:1];
}

- (HKFHIRCredential)credential
{
  v3 = [(_HDWrappedFHIRCredential *)self->_wrappedCredential refreshedCredential];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(_HDWrappedFHIRCredential *)self->_wrappedCredential originalCredential];
  }
  unsigned __int8 v6 = v5;

  return (HKFHIRCredential *)v6;
}

- (id)asRefreshResultWithEndStates:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)HKFHIRCredentialRefreshResult);
  unsigned __int8 v6 = [(HDFHIRCredentialResult *)self credential];
  id v7 = [v5 initWithCredential:v6 authResponse:self->_authResponse endStates:v4 error:self->_refreshError];

  return v7;
}

- (HDFHIRAuthResponse)authResponse
{
  return self->_authResponse;
}

- (NSError)refreshError
{
  return self->_refreshError;
}

- (_HDWrappedFHIRCredential)wrappedCredential
{
  return self->_wrappedCredential;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedCredential, 0);
  objc_storeStrong((id *)&self->_refreshError, 0);

  objc_storeStrong((id *)&self->_authResponse, 0);
}

@end