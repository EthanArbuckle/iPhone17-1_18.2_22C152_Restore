@interface AKClientAnisetteService
- (AKClientAnisetteService)initWithClient:(id)a3 context:(id)a4;
- (void)eraseAnisetteWithCompletion:(id)a3;
- (void)fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 withCompletion:(id)a4;
- (void)fetchPeerAttestationDataForRequest:(id)a3 completion:(id)a4;
- (void)legacyAnisetteDataForDSID:(id)a3 withCompletion:(id)a4;
- (void)provisionAnisetteWithCompletion:(id)a3;
- (void)syncAnisetteWithSIMData:(id)a3 completion:(id)a4;
@end

@implementation AKClientAnisetteService

- (AKClientAnisetteService)initWithClient:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(AKClientAnisetteService *)self init];
  if (v8)
  {
    uint64_t v9 = [v6 proxyWithErrorHandler:&stru_10022AD10];
    clientProxy = v8->_clientProxy;
    v8->_clientProxy = (AKAnisetteProvisioningClientProtocol *)v9;

    objc_storeStrong((id *)&v8->_context, a4);
  }

  return v8;
}

- (void)fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  id v7 = _AKLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10018FD3C();
  }

  clientProxy = self->_clientProxy;
  if (clientProxy)
  {
    [(AKAnisetteProvisioningClientProtocol *)clientProxy fetchAnisetteDataForContext:self->_context provisionIfNecessary:v4 withCompletion:v6];
  }
  else
  {
    uint64_t v9 = +[NSError ak_errorWithCode:-7061];
    v6[2](v6, 0, v9);
  }
}

- (void)syncAnisetteWithSIMData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10018FDB8();
  }

  clientProxy = self->_clientProxy;
  if (clientProxy)
  {
    [(AKAnisetteProvisioningClientProtocol *)clientProxy syncAnisetteForContext:self->_context withSIMData:v6 completion:v7];
  }
  else
  {
    v10 = +[NSError ak_errorWithCode:-7061];
    v7[2](v7, 0, v10);
  }
}

- (void)eraseAnisetteWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(id, void, void *))a3;
  v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10018FE34();
  }

  clientProxy = self->_clientProxy;
  if (clientProxy)
  {
    [(AKAnisetteProvisioningClientProtocol *)clientProxy eraseAnisetteForContext:self->_context withCompletion:v4];
  }
  else
  {
    id v7 = +[NSError ak_errorWithCode:-7061];
    v4[2](v4, 0, v7);
  }
}

- (void)provisionAnisetteWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(id, void, void *))a3;
  v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10018FEB0();
  }

  clientProxy = self->_clientProxy;
  if (clientProxy)
  {
    [(AKAnisetteProvisioningClientProtocol *)clientProxy provisionAnisetteForContext:self->_context withCompletion:v4];
  }
  else
  {
    id v7 = +[NSError ak_errorWithCode:-7061];
    v4[2](v4, 0, v7);
  }
}

- (void)legacyAnisetteDataForDSID:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10018FF2C();
  }

  clientProxy = self->_clientProxy;
  if (clientProxy)
  {
    [(AKAnisetteProvisioningClientProtocol *)clientProxy legacyAnisetteDataForContext:self->_context DSID:v6 withCompletion:v7];
  }
  else
  {
    v10 = +[NSError ak_errorWithCode:-7061];
    v7[2](v7, 0, v10);
  }
}

- (void)fetchPeerAttestationDataForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10018FFA8();
  }

  if (self->_clientProxy)
  {
    uint64_t v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      context = self->_context;
      int v12 = 138412802;
      v13 = self;
      __int16 v14 = 2112;
      v15 = context;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@: Calling client proxy to fetch peer attestation data for context (%@) with request (%@)", (uint8_t *)&v12, 0x20u);
    }

    [(AKAnisetteProvisioningClientProtocol *)self->_clientProxy fetchPeerAttestationDataForContext:self->_context withRequest:v6 completion:v7];
  }
  else
  {
    v11 = +[NSError ak_errorWithCode:-7061];
    v7[2](v7, 0, v11);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_clientProxy, 0);
}

@end