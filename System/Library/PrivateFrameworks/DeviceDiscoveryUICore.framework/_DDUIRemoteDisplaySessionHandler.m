@interface _DDUIRemoteDisplaySessionHandler
+ (id)sharedInstance;
- (BOOL)_isActivated;
- (BOOL)canEnterSession;
- (BOOL)isContinuityCaptureUserPreferenceEnabled;
- (BOOL)isWifiStateOn;
- (BOOL)shouldAutoAcceptCCConfirmation;
- (BOOL)shouldByPassConfirmationForRemoteDeviceID:(id)a3;
- (CPSAuthenticationSession)proxSession;
- (RPRemoteDisplayDiscovery)rDiscovery;
- (_DDUIRemoteDisplaySessionHandler)init;
- (void)activateWithCompletion:(id)a3;
- (void)cancelCurrentProxCard;
- (void)dealloc;
- (void)enterSessionWithRemoteDeviceID:(id)a3 reason:(id)a4;
- (void)presentProxCardForDevice:(id)a3 completion:(id)a4;
- (void)saveDedicatedDeviceInformation:(id)a3;
- (void)setActivated:(BOOL)a3;
@end

@implementation _DDUIRemoteDisplaySessionHandler

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50___DDUIRemoteDisplaySessionHandler_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, block);
  }
  v2 = (void *)sharedInstance_sharedInstance_0;
  return v2;
}

- (_DDUIRemoteDisplaySessionHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)_DDUIRemoteDisplaySessionHandler;
  v2 = [(_DDUIRemoteDisplaySessionHandler *)&v6 init];
  if (v2)
  {
    v3 = (RPRemoteDisplayDiscovery *)objc_alloc_init(MEMORY[0x1E4F94738]);
    rDiscovery = v2->_rDiscovery;
    v2->_rDiscovery = v3;
  }
  return v2;
}

- (void)dealloc
{
  [(RPRemoteDisplayDiscovery *)self->_rDiscovery invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_DDUIRemoteDisplaySessionHandler;
  [(_DDUIRemoteDisplaySessionHandler *)&v3 dealloc];
}

- (void)activateWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = _DDUICoreLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = self;
    _os_log_impl(&dword_1CFC71000, v5, OS_LOG_TYPE_DEFAULT, "Starting up _DDUIRemoteDisplaySessionHandler {self: %@}", buf, 0xCu);
  }

  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  rDiscovery = self->_rDiscovery;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59___DDUIRemoteDisplaySessionHandler_activateWithCompletion___block_invoke;
  v8[3] = &unk_1E685FC40;
  v8[4] = self;
  objc_copyWeak(&v10, (id *)buf);
  id v7 = v4;
  id v9 = v7;
  [(RPRemoteDisplayDiscovery *)rDiscovery activateWithCompletion:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

- (BOOL)isWifiStateOn
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F5E1F0]);
  BOOL v3 = [v2 wifiState] != 10;
  [v2 invalidate];

  return v3;
}

- (BOOL)isContinuityCaptureUserPreferenceEnabled
{
  return softLinkFigContinuityCaptureGetUserPreferenceDisabled() ^ 1;
}

- (BOOL)canEnterSession
{
  BOOL v3 = [(_DDUIRemoteDisplaySessionHandler *)self isWifiStateOn];
  if (v3)
  {
    LOBYTE(v3) = [(_DDUIRemoteDisplaySessionHandler *)self isContinuityCaptureUserPreferenceEnabled];
  }
  return v3;
}

- (void)enterSessionWithRemoteDeviceID:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(_DDUIRemoteDisplaySessionHandler *)self _isActivated])
  {
    [(RPRemoteDisplayDiscovery *)self->_rDiscovery enterDiscoverySessionWithDevice:v6 reason:v7];
  }
  else
  {
    id location = 0;
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __74___DDUIRemoteDisplaySessionHandler_enterSessionWithRemoteDeviceID_reason___block_invoke;
    v8[3] = &unk_1E685FC68;
    objc_copyWeak(&v11, &location);
    id v9 = v6;
    id v10 = v7;
    [(_DDUIRemoteDisplaySessionHandler *)self activateWithCompletion:v8];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (BOOL)shouldByPassConfirmationForRemoteDeviceID:(id)a3
{
  id v4 = a3;
  char v5 = _os_feature_enabled_impl();
  id v6 = [(RPRemoteDisplayDiscovery *)self->_rDiscovery dedicatedDevice];
  id v7 = [v6 persistentIdentifier];
  char v8 = [v7 isEqualToString:v4];

  return [(_DDUIRemoteDisplaySessionHandler *)self canEnterSession] & v5 & v8;
}

- (BOOL)shouldAutoAcceptCCConfirmation
{
  char has_internal_content = os_variant_has_internal_content();
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.Sharing"];
  char v5 = [v4 objectForKey:@"autoAcceptCCConfirmation"];
  if (v5) {
    int v6 = [v4 BOOLForKey:@"autoAcceptCCConfirmation"];
  }
  else {
    int v6 = 0;
  }

  BOOL v7 = [(_DDUIRemoteDisplaySessionHandler *)self canEnterSession];
  if (v6) {
    BOOL v8 = has_internal_content;
  }
  else {
    BOOL v8 = 0;
  }
  BOOL v9 = v7 && v8;

  return v9;
}

- (void)presentProxCardForDevice:(id)a3 completion:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void *))a4;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v13 = @"Disabled";
LABEL_10:
    v15 = UnsupportedErrorWithDescription(v13);
    v7[2](v7, v15);

    goto LABEL_11;
  }
  if (SFDeviceClassCodeGet() != 1)
  {
    v14 = _DDUICoreLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[_DDUIRemoteDisplaySessionHandler presentProxCardForDevice:completion:]((uint64_t)self, v14);
    }

    v13 = @"Dedicated cameras can only be setup on iPhones";
    goto LABEL_10;
  }
  id v8 = objc_alloc_init((Class)getCPSDedicatedCameraRequestClass[0]());
  BOOL v9 = [v6 name];
  [v8 setDeviceName:v9];

  if (([v6 deviceType] & 0x10) != 0) {
    [v8 setDeviceType:1];
  }
  [(_DDUIRemoteDisplaySessionHandler *)self cancelCurrentProxCard];
  id v10 = (void *)[objc_alloc((Class)getCPSAuthenticationSessionClass[0]()) initWithRequest:v8];
  id location = 0;
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __72___DDUIRemoteDisplaySessionHandler_presentProxCardForDevice_completion___block_invoke;
  v16[3] = &unk_1E685FC90;
  objc_copyWeak(&v18, &location);
  v17 = v7;
  [v10 setSessionCompletionHandler:v16];
  [v10 start];
  proxSession = self->_proxSession;
  self->_proxSession = (CPSAuthenticationSession *)v10;
  id v12 = v10;

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

LABEL_11:
}

- (void)cancelCurrentProxCard
{
  [(CPSAuthenticationSession *)self->_proxSession cancel];
  proxSession = self->_proxSession;
  self->_proxSession = 0;
}

- (void)saveDedicatedDeviceInformation:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F94730]);
    id v6 = [v4 identifier];
    BOOL v7 = [v4 name];
    id v8 = [v4 model];
    BOOL v9 = [v4 accountIdentifier];
    id v10 = (void *)[v5 initWithIdentifier:v6 name:v7 model:v8 accountID:v9];

    id v11 = _DDUICoreLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412546;
      v14 = self;
      __int16 v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_1CFC71000, v11, OS_LOG_TYPE_DEFAULT, "{self: %@} Saving dedicated device: %@", (uint8_t *)&v13, 0x16u);
    }

    [(RPRemoteDisplayDiscovery *)self->_rDiscovery saveDedicatedDevice:v10];
  }
  else
  {
    id v12 = _DDUICoreLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      v14 = self;
      _os_log_impl(&dword_1CFC71000, v12, OS_LOG_TYPE_DEFAULT, "{self: %@} Removing dedicated device", (uint8_t *)&v13, 0xCu);
    }

    [(RPRemoteDisplayDiscovery *)self->_rDiscovery saveDedicatedDevice:0];
  }
}

- (RPRemoteDisplayDiscovery)rDiscovery
{
  return self->_rDiscovery;
}

- (BOOL)_isActivated
{
  return self->_activated;
}

- (void)setActivated:(BOOL)a3
{
  self->_activated = a3;
}

- (CPSAuthenticationSession)proxSession
{
  return self->_proxSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxSession, 0);
  objc_storeStrong((id *)&self->_rDiscovery, 0);
}

- (void)presentProxCardForDevice:(uint64_t)a1 completion:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1CFC71000, a2, OS_LOG_TYPE_ERROR, "{self: %@} ignoring prox card request on device since this is not an iPhone", (uint8_t *)&v2, 0xCu);
}

@end