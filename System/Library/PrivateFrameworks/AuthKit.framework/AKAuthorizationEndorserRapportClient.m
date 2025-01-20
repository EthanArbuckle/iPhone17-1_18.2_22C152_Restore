@interface AKAuthorizationEndorserRapportClient
- (AKAuthorizationDaemonService)authorizationService;
- (AKAuthorizationEndorserRapportClient)initWithDeviceID:(id)a3;
- (AKAuthorizationEndorserRapportClientDelegate)delegate;
- (RPCompanionLinkClient)endorseeClient;
- (RPCompanionLinkDevice)endorseeDevice;
- (void)_deactivate;
- (void)_handleStartAuthorizationWithResponse:(id)a3;
- (void)_sendAuthorizationDidFinishRequestWithAuthorization:(id)a3;
- (void)_sendAuthorizationDidFinishRequestWithError:(id)a3;
- (void)_sendDidStartServerAuthorizationEvent;
- (void)_sendStartAuthorizationRequest;
- (void)authorizationDaemonServiceWillProcessUserResponse:(id)a3;
- (void)setAuthorizationService:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEndorseeClient:(id)a3;
- (void)setEndorseeDevice:(id)a3;
- (void)startAuthorization;
- (void)startAuthorizationWithCompanionLinkClient:(id)a3;
@end

@implementation AKAuthorizationEndorserRapportClient

- (AKAuthorizationEndorserRapportClient)initWithDeviceID:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AKAuthorizationEndorserRapportClient;
  v5 = [(AKAuthorizationEndorserRapportClient *)&v10 init];
  if (v5)
  {
    v6 = (objc_class *)sub_100077970();
    if (v6) {
      v6 = (objc_class *)sub_100077CC0();
    }
    id v7 = objc_alloc_init(v6);
    [v7 setIdentifier:v4];
    endorseeDevice = v5->_endorseeDevice;
    v5->_endorseeDevice = (RPCompanionLinkDevice *)v7;
  }
  return v5;
}

- (void)startAuthorization
{
  v3 = (objc_class *)sub_100077970();
  if (v3) {
    v3 = (objc_class *)sub_100077B84();
  }
  id v4 = objc_alloc_init(v3);
  [(AKAuthorizationEndorserRapportClient *)self startAuthorizationWithCompanionLinkClient:v4];
}

- (void)startAuthorizationWithCompanionLinkClient:(id)a3
{
  id v5 = a3;
  endorseeClient = self->_endorseeClient;
  id v7 = _AKLogSiwa();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (endorseeClient)
  {
    if (v8)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Authorization Endorser already in progress, ignoring startAuthorization.", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    if (v8)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Authorization Endorser Started.", (uint8_t *)buf, 2u);
    }

    [v5 setDestinationDevice:self->_endorseeDevice];
    objc_storeStrong((id *)&self->_endorseeClient, a3);
    objc_initWeak(buf, self);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10008A160;
    v9[3] = &unk_1002291F8;
    objc_copyWeak(&v10, buf);
    [v5 activateWithCompletion:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(buf);
  }
}

- (void)authorizationDaemonServiceWillProcessUserResponse:(id)a3
{
}

- (void)_deactivate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained authorizationEndorserRapportClientDidFinish:self];
  }
  [(RPCompanionLinkClient *)self->_endorseeClient invalidate];
  endorseeClient = self->_endorseeClient;
  self->_endorseeClient = 0;
}

- (void)_sendStartAuthorizationRequest
{
  v3 = _AKLogSiwa();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    endorseeDevice = self->_endorseeDevice;
    *(_DWORD *)buf = 138412546;
    v11 = endorseeDevice;
    __int16 v12 = 2048;
    v13 = endorseeDevice;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Sending StartAuthorizationRequest. {device=%@, device_ptr=%p}", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  endorseeClient = self->_endorseeClient;
  uint64_t v6 = sub_100077970();
  if (v6)
  {
    id v7 = sub_100077F3C();
  }
  else
  {
    id v7 = 0;
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10008A414;
  v8[3] = &unk_100229D98;
  objc_copyWeak(&v9, (id *)buf);
  [(RPCompanionLinkClient *)endorseeClient sendRequestID:@"com.apple.AuthKit.StartAuthorization" request:&__NSDictionary0__struct destinationID:v7 options:0 responseHandler:v8];
  if (v6) {

  }
  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

- (void)_handleStartAuthorizationWithResponse:(id)a3
{
  id v4 = a3;
  id v5 = _AKLogSiwa();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Handling StartAuthorizationResponse. {response=%@}", buf, 0xCu);
  }

  uint64_t v6 = [v4 objectForKeyedSubscript:@"CredentialRequest"];
  id v18 = 0;
  id v7 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v18];
  id v8 = v18;
  if (v7)
  {
    objc_msgSend(v7, "set_isRapportLogin:", 1);
    id v9 = _AKLogSiwa();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_10018A2E0(v7, v9);
    }

    objc_msgSend(v7, "set_requirePassword:", 0);
    id v10 = _AKLogSiwa();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "StartAuthorization presenting authorization UI for Rapport request. {credentialRequestContext=%@}", buf, 0xCu);
    }

    v11 = [[AKOwnerProxyClient alloc] initWithCredentialRequest:v7];
    __int16 v12 = [[AKAuthorizationDaemonService alloc] initWithClient:v11];
    authorizationService = self->_authorizationService;
    self->_authorizationService = v12;

    [(AKAuthorizationDaemonService *)self->_authorizationService setDelegate:self];
    objc_initWeak((id *)buf, self);
    v14 = self->_authorizationService;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10008A83C;
    v16[3] = &unk_100229DC0;
    objc_copyWeak(&v17, (id *)buf);
    [(AKAuthorizationDaemonService *)v14 performAuthorization:v7 completion:v16];
    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v15 = _AKLogSiwa();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10018A258((uint64_t)v8, (uint64_t)v6, v15);
    }

    [(AKAuthorizationEndorserRapportClient *)self _sendAuthorizationDidFinishRequestWithError:v8];
  }
}

- (void)_sendAuthorizationDidFinishRequestWithAuthorization:(id)a3
{
  id v4 = a3;
  id v5 = _AKLogSiwa();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    endorseeDevice = self->_endorseeDevice;
    *(_DWORD *)buf = 138412802;
    id v20 = v4;
    __int16 v21 = 2112;
    v22 = endorseeDevice;
    __int16 v23 = 2048;
    v24 = endorseeDevice;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Sending AuthorizationDidFinish. {authorization=%@, device=%@, device_ptr=%p}", buf, 0x20u);
  }

  id v16 = 0;
  id v7 = +[NSKeyedArchiver archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v16];
  id v8 = v16;
  if (v7)
  {
    objc_initWeak((id *)buf, self);
    endorseeClient = self->_endorseeClient;
    CFStringRef v17 = @"Authorization";
    id v18 = v7;
    id v10 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    uint64_t v11 = sub_100077970();
    if (v11)
    {
      __int16 v12 = sub_100077F3C();
    }
    else
    {
      __int16 v12 = 0;
    }
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10008AB38;
    v14[3] = &unk_100229D98;
    objc_copyWeak(&v15, (id *)buf);
    [(RPCompanionLinkClient *)endorseeClient sendRequestID:@"com.apple.AuthKit.AuthorizationDidFinish" request:v10 destinationID:v12 options:0 responseHandler:v14];
    if (v11) {

    }
    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v13 = _AKLogSiwa();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10018A370((uint64_t)v8, v13);
    }

    [(AKAuthorizationEndorserRapportClient *)self _sendAuthorizationDidFinishRequestWithError:v8];
  }
}

- (void)_sendAuthorizationDidFinishRequestWithError:(id)a3
{
  id v4 = a3;
  id v5 = _AKLogSiwa();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_10018A460(v4);
  }

  if (!v4)
  {
    id v4 = +[NSError ak_errorWithCode:-7001];
  }
  id v17 = 0;
  uint64_t v6 = +[NSKeyedArchiver archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v17];
  id v7 = v17;
  if (v6)
  {
    CFStringRef v24 = @"Error";
    v25 = v6;
    id v8 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  }
  else
  {
    id v9 = _AKLogSiwa();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10018A3E8((uint64_t)v7, v9);
    }

    id v8 = &__NSDictionary0__struct;
  }
  id v10 = _AKLogSiwa();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    endorseeDevice = self->_endorseeDevice;
    *(_DWORD *)buf = 138412802;
    id v19 = v4;
    __int16 v20 = 2112;
    __int16 v21 = endorseeDevice;
    __int16 v22 = 2048;
    __int16 v23 = endorseeDevice;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Sending AuthorizationDidFinish. {error=%@, device=%@, device_ptr=%p}", buf, 0x20u);
  }

  objc_initWeak((id *)buf, self);
  endorseeClient = self->_endorseeClient;
  uint64_t v13 = sub_100077970();
  if (v13)
  {
    v14 = sub_100077F3C();
  }
  else
  {
    v14 = 0;
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10008AF28;
  v15[3] = &unk_100229D98;
  objc_copyWeak(&v16, (id *)buf);
  [(RPCompanionLinkClient *)endorseeClient sendRequestID:@"com.apple.AuthKit.AuthorizationDidFinish" request:v8 destinationID:v14 options:0 responseHandler:v15];
  if (v13) {

  }
  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

- (void)_sendDidStartServerAuthorizationEvent
{
  v3 = _AKLogSiwa();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    endorseeDevice = self->_endorseeDevice;
    *(_DWORD *)buf = 138412546;
    uint64_t v11 = endorseeDevice;
    __int16 v12 = 2048;
    uint64_t v13 = endorseeDevice;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Sending DidStartServerAuthorization event. {device=%@, device_ptr=%p}", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  endorseeClient = self->_endorseeClient;
  uint64_t v6 = sub_100077970();
  if (v6)
  {
    id v7 = sub_100077F3C();
  }
  else
  {
    id v7 = 0;
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10008B208;
  v8[3] = &unk_1002291F8;
  objc_copyWeak(&v9, (id *)buf);
  [(RPCompanionLinkClient *)endorseeClient sendEventID:@"com.apple.AuthKit.DidStartServerAuthorization" event:&__NSDictionary0__struct destinationID:v7 options:0 completion:v8];
  if (v6) {

  }
  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

- (AKAuthorizationEndorserRapportClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AKAuthorizationEndorserRapportClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (RPCompanionLinkClient)endorseeClient
{
  return self->_endorseeClient;
}

- (void)setEndorseeClient:(id)a3
{
}

- (RPCompanionLinkDevice)endorseeDevice
{
  return self->_endorseeDevice;
}

- (void)setEndorseeDevice:(id)a3
{
}

- (AKAuthorizationDaemonService)authorizationService
{
  return self->_authorizationService;
}

- (void)setAuthorizationService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorizationService, 0);
  objc_storeStrong((id *)&self->_endorseeDevice, 0);
  objc_storeStrong((id *)&self->_endorseeClient, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end