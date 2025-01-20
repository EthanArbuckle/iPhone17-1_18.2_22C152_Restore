@interface AKAuthorizationEndorserRapportDiscovery
- (AKAuthorizationEndorserRapportClient)authorizationEndorser;
- (AKAuthorizationEndorserRapportDiscovery)initWithClient:(id)a3;
- (AKClient)client;
- (BOOL)activateWithError:(id *)a3;
- (RPCompanionLinkClient)deviceDiscovery;
- (id)didDeactivateBlock;
- (void)_handleFoundDevice:(id)a3;
- (void)deactivate;
- (void)setAuthorizationEndorser:(id)a3;
- (void)setClient:(id)a3;
- (void)setDeviceDiscovery:(id)a3;
- (void)setDidDeactivateBlock:(id)a3;
@end

@implementation AKAuthorizationEndorserRapportDiscovery

- (AKAuthorizationEndorserRapportDiscovery)initWithClient:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKAuthorizationEndorserRapportDiscovery;
  v6 = [(AKAuthorizationEndorserRapportDiscovery *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_client, a3);
  }

  return v7;
}

- (BOOL)activateWithError:(id *)a3
{
  if (![(AKClient *)self->_client hasOwnerAccess])
  {
    if (a3)
    {
      uint64_t v5 = -7026;
      goto LABEL_7;
    }
    return 0;
  }
  if (self->_deviceDiscovery)
  {
    if (a3)
    {
      uint64_t v5 = -7071;
LABEL_7:
      id v6 = +[NSError ak_errorWithCode:v5];
      BOOL result = 0;
      *a3 = v6;
      return result;
    }
    return 0;
  }
  v8 = _AKLogSiwa();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Authorization Endorser discovery activated.", (uint8_t *)buf, 2u);
  }

  objc_super v9 = (objc_class *)sub_100077970();
  if (v9) {
    objc_super v9 = (objc_class *)sub_100077B84();
  }
  id v10 = objc_alloc_init(v9);
  [v10 setControlFlags:0x4000000];
  objc_storeStrong((id *)&self->_deviceDiscovery, v10);
  objc_initWeak(buf, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000657EC;
  v13[3] = &unk_1002291D0;
  objc_copyWeak(&v14, buf);
  [v10 setDeviceFoundHandler:v13];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100065848;
  v11[3] = &unk_1002291F8;
  objc_copyWeak(&v12, buf);
  [v10 activateWithCompletion:v11];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(buf);

  return 1;
}

- (void)deactivate
{
  [(RPCompanionLinkClient *)self->_deviceDiscovery invalidate];
  deviceDiscovery = self->_deviceDiscovery;
  self->_deviceDiscovery = 0;

  didDeactivateBlock = (void (**)(void))self->_didDeactivateBlock;
  if (didDeactivateBlock) {
    didDeactivateBlock[2]();
  }
  uint64_t v5 = _AKLogSiwa();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Authorization Endorser discovery deactivated.", v6, 2u);
  }
}

- (void)_handleFoundDevice:(id)a3
{
  id v4 = a3;
  if (self->_authorizationEndorser)
  {
    uint64_t v5 = _AKLogSiwa();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Authorization Endorser already in progress, ignoring device found. {device=%@}", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    id v6 = [AKAuthorizationEndorserRapportClient alloc];
    v7 = [v4 identifier];
    v8 = [(AKAuthorizationEndorserRapportClient *)v6 initWithDeviceID:v7];
    authorizationEndorser = self->_authorizationEndorser;
    self->_authorizationEndorser = v8;

    [(AKAuthorizationEndorserRapportClient *)self->_authorizationEndorser setDelegate:self];
    [(AKAuthorizationEndorserRapportClient *)self->_authorizationEndorser startAuthorization];
    [(RPCompanionLinkClient *)self->_deviceDiscovery invalidate];
  }
}

- (id)didDeactivateBlock
{
  return self->_didDeactivateBlock;
}

- (void)setDidDeactivateBlock:(id)a3
{
}

- (RPCompanionLinkClient)deviceDiscovery
{
  return self->_deviceDiscovery;
}

- (void)setDeviceDiscovery:(id)a3
{
}

- (AKClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (AKAuthorizationEndorserRapportClient)authorizationEndorser
{
  return self->_authorizationEndorser;
}

- (void)setAuthorizationEndorser:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorizationEndorser, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_deviceDiscovery, 0);

  objc_storeStrong(&self->_didDeactivateBlock, 0);
}

@end