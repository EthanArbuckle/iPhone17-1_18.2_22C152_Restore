@interface AKPrivateEmailServiceController
- (AKPrivateEmailServiceController)initWithClient:(id)a3 altDSID:(id)a4;
- (BOOL)isSecondCall;
- (id)_constructRequestProviderForClient:(id)a3 altDSID:(id)a4;
- (void)executeFetchHmeListRequestWithCompletion:(id)a3;
- (void)setIsSecondCall:(BOOL)a3;
@end

@implementation AKPrivateEmailServiceController

- (AKPrivateEmailServiceController)initWithClient:(id)a3 altDSID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(AKPrivateEmailServiceController *)self _constructRequestProviderForClient:v7 altDSID:v8];
  if (v9
    && (v12.receiver = self,
        v12.super_class = (Class)AKPrivateEmailServiceController,
        v10 = [(AKServiceControllerImpl *)&v12 initWithRequestProvider:v9],
        (self = v10) != 0))
  {
    objc_storeStrong((id *)&v10->_client, a3);
    objc_storeStrong((id *)&self->_altDSID, a4);
    self->_isSecondCall = 0;
  }
  else
  {

    self = 0;
  }

  return self;
}

- (void)executeFetchHmeListRequestWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10007850C;
  v4[3] = &unk_100228748;
  v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(AKServiceControllerImpl *)v5 executeRequestWithCompletion:v4];
}

- (id)_constructRequestProviderForClient:(id)a3 altDSID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_opt_new();
  [v7 setAltDSID:v5];

  id v8 = [AKPrivateEmailRequestProvider alloc];
  v9 = [(AKURLRequestProviderImpl *)v8 initWithContext:v7 urlBagKey:AKURLBagKeyPrivateEmailFetchList];
  [(AKURLRequestProviderImpl *)v9 setClient:v6];

  [(AKGrandSlamRequestProvider *)v9 setAuthenticatedRequest:1];
  [(AKGrandSlamRequestProvider *)v9 setExpectedResponseType:1];

  return v9;
}

- (BOOL)isSecondCall
{
  return self->_isSecondCall;
}

- (void)setIsSecondCall:(BOOL)a3
{
  self->_isSecondCall = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altDSID, 0);

  objc_storeStrong((id *)&self->_client, 0);
}

@end