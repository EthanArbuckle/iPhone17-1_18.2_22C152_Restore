@interface AASetupAssistantService
+ (id)urlConfiguration;
+ (void)resetURLConfiguration;
- (AASetupAssistantService)init;
- (AASetupAssistantService)initWithAccount:(id)a3;
- (AASetupAssistantService)initWithAppleID:(id)a3 password:(id)a4;
- (NSString)appleID;
- (NSString)emailChoice;
- (NSString)password;
- (id)_signingSession;
- (void)_doHSADeviceProvisioningSynchronizationWithDSID:(id)a3 data:(id)a4;
- (void)_doHSADeviceProvisioningWithDSID:(id)a3 data:(id)a4;
- (void)_doHSADeviceReprovisioningWithDSID:(id)a3;
- (void)authenticateWithHandler:(id)a3;
- (void)createAppleIDWithParameters:(id)a3 handler:(id)a4;
- (void)createAppleIDWithParameters:(id)a3 handlerWithResponse:(id)a4;
- (void)dealloc;
- (void)downloadURLConfiguration:(id)a3;
- (void)loginDelegatesWithParameters:(id)a3 completion:(id)a4;
- (void)setAppleID:(id)a3;
- (void)setCookieStorage:(OpaqueCFHTTPCookieStorage *)a3;
- (void)setEmailChoice:(id)a3;
- (void)setPassword:(id)a3;
- (void)setupDelegateAccountsWithParameters:(id)a3 handler:(id)a4;
- (void)shouldPresentUpgradeFlowWithCompletion:(id)a3;
- (void)updateAppleIDWithParameters:(id)a3 handler:(id)a4;
- (void)upgradeiCloudTermsIfNecessaryWithCustomHeaders:(id)a3 handler:(id)a4;
- (void)upgradeiCloudTermsIfNecessaryWithHandler:(id)a3;
@end

@implementation AASetupAssistantService

+ (id)urlConfiguration
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = sub_27FC;
  v13 = sub_280C;
  id v14 = 0;
  id v2 = objc_alloc_init((Class)AASetupAssistantConfigRequest);
  [v2 setFlushCache:byte_190E8];
  byte_190E8 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_2814;
  v6[3] = &unk_145D8;
  v8 = &v9;
  v3 = dispatch_semaphore_create(0);
  v7 = v3;
  [v2 performRequestWithHandler:v6];
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  id v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v4;
}

+ (void)resetURLConfiguration
{
  byte_190E8 = 1;
}

- (AASetupAssistantService)init
{
  v6.receiver = self;
  v6.super_class = (Class)AASetupAssistantService;
  id v2 = [(AASetupAssistantService *)&v6 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    requesterQueue = v2->_requesterQueue;
    v2->_requesterQueue = v3;
  }
  return v2;
}

- (AASetupAssistantService)initWithAppleID:(id)a3 password:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(AASetupAssistantService *)self init];
  if (v8)
  {
    uint64_t v9 = (NSString *)[v6 copy];
    appleID = v8->_appleID;
    v8->_appleID = v9;

    uint64_t v11 = (NSString *)[v7 copy];
    password = v8->_password;
    v8->_password = v11;
  }
  return v8;
}

- (AASetupAssistantService)initWithAccount:(id)a3
{
  id v5 = a3;
  id v6 = [(AASetupAssistantService *)self init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_account, a3);
    v8 = [v5 username];
    uint64_t v9 = (NSString *)[v8 copy];
    appleID = v7->_appleID;
    v7->_appleID = v9;

    uint64_t v11 = [(ACAccount *)v7->_account credential];
    v12 = [v11 password];
    v13 = (NSString *)[v12 copy];
    password = v7->_password;
    v7->_password = v13;
  }
  return v7;
}

- (void)dealloc
{
  cookieStorage = self->_cookieStorage;
  if (cookieStorage) {
    CFRelease(cookieStorage);
  }
  v4.receiver = self;
  v4.super_class = (Class)AASetupAssistantService;
  [(AASetupAssistantService *)&v4 dealloc];
}

- (void)setCookieStorage:(OpaqueCFHTTPCookieStorage *)a3
{
  cookieStorage = self->_cookieStorage;
  if (cookieStorage != a3)
  {
    if (cookieStorage) {
      CFRelease(cookieStorage);
    }
    self->_cookieStorage = a3;
    if (a3)
    {
      CFRetain(a3);
    }
  }
}

- (void)downloadURLConfiguration:(id)a3
{
  id v3 = a3;
  objc_super v4 = dispatch_queue_create("urlConfigurationQueue", 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2B78;
  block[3] = &unk_14600;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

- (void)authenticateWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_queue_create("authenticationRequestQueue", 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_2C94;
  v7[3] = &unk_14628;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)createAppleIDWithParameters:(id)a3 handler:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_2F98;
  v7[3] = &unk_14678;
  id v8 = a4;
  id v6 = v8;
  [(AASetupAssistantService *)self createAppleIDWithParameters:a3 handlerWithResponse:v7];
}

- (void)createAppleIDWithParameters:(id)a3 handlerWithResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _AALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "createAppleIDWithParameters start", buf, 2u);
  }

  uint64_t v9 = dispatch_queue_create("createAppleIDQueue", 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_30D4;
  block[3] = &unk_146A0;
  id v13 = v6;
  id v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)updateAppleIDWithParameters:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _AALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "updateAppleIDWithParameters start", buf, 2u);
  }

  uint64_t v9 = dispatch_queue_create("updateAppleIDQueue", 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3654;
  block[3] = &unk_146A0;
  id v13 = v6;
  id v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)setupDelegateAccountsWithParameters:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _AALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "setupDelegateAccountsWithParameters start", buf, 2u);
  }

  uint64_t v9 = dispatch_queue_create("setupDelegateAccountsQueue", 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3B8C;
  block[3] = &unk_146A0;
  id v13 = v6;
  id v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)loginDelegatesWithParameters:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _AALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "loginDelegatesWithParameters start", buf, 2u);
  }

  uint64_t v9 = dispatch_queue_create("loginDelegatesQueue", 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_40B8;
  block[3] = &unk_146A0;
  id v13 = v6;
  id v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)upgradeiCloudTermsIfNecessaryWithHandler:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_4544;
  v5[3] = &unk_146C8;
  id v6 = a3;
  id v4 = v6;
  [(AASetupAssistantService *)self upgradeiCloudTermsIfNecessaryWithCustomHeaders:0 handler:v5];
}

- (void)upgradeiCloudTermsIfNecessaryWithCustomHeaders:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_account)
  {
    id v8 = dispatch_queue_create("upgradeTermsQueue", 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_46C4;
    block[3] = &unk_146A0;
    void block[4] = self;
    id v12 = v6;
    id v13 = v7;
    dispatch_async(v8, block);
  }
  else
  {
    uint64_t v9 = _AALogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Error: No AppleAccount set on AASetupAssistant Service", v10, 2u);
    }

    id v8 = +[NSError errorWithDomain:@"com.apple.appleaccount" code:0 userInfo:0];
    (*((void (**)(id, void, void, NSObject *))v7 + 2))(v7, 0, 0, v8);
  }
}

- (void)shouldPresentUpgradeFlowWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = _AALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "shouldPresentUpgradeFlowWithCompletion start", buf, 2u);
  }

  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  id v7 = [(AASetupAssistantService *)self appleID];
  [v6 setValue:v7 forKey:@"apple-id"];

  id v8 = [(AASetupAssistantService *)self password];
  [v6 setValue:v8 forKey:@"password"];

  uint64_t v9 = +[AADeviceInfo appleIDClientIdentifier];
  [v6 setValue:v9 forKey:@"client-id"];

  id v10 = [objc_alloc((Class)AASetupAssistantUpgradeStatusRequest) initWithAccount:self->_account];
  if (self->_account)
  {
    id v11 = [objc_alloc((Class)AADeviceProvisioningSession) initWithAccount:self->_account];
    [v11 addProvisioningInfoToAARequest:v10];
  }
  [v10 setCookieStorage:self->_cookieStorage];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_4B5C;
  v13[3] = &unk_14650;
  id v14 = v4;
  id v12 = v4;
  [v10 performRequestWithHandler:v13];
}

- (id)_signingSession
{
  if (!self->_signingSession) {
    goto LABEL_7;
  }
  id v3 = +[NSDate date];
  [v3 timeIntervalSinceDate:self->_signingSessionCreationDate];
  double v5 = v4;

  if (v5 > 540.0)
  {
    id v6 = _AALogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "shared signing session expired. creating a new signing session.", buf, 2u);
    }

    signingSession = self->_signingSession;
    self->_signingSession = 0;
  }
  if (!self->_signingSession)
  {
LABEL_7:
    id v8 = +[NSDate date];
    signingSessionCreationDate = self->_signingSessionCreationDate;
    self->_signingSessionCreationDate = v8;

    id v10 = +[AASetupAssistantService urlConfiguration];
    id v11 = [v10 signingSessionCertURL];
    id v12 = +[AASetupAssistantService urlConfiguration];
    id v13 = [v12 signingSessionURL];
    id v22 = 0;
    id v14 = +[AASigningSession establishedSessionWithCertURL:v11 sessionURL:v13 error:&v22];
    id v15 = (AASigningSession *)v22;
    v16 = self->_signingSession;
    self->_signingSession = v14;

    if (v15)
    {
      v17 = _AALogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v15;
        _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "Failed to create a shared signing session: %@", buf, 0xCu);
      }
    }
  }
  v18 = _AALogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = self->_signingSession;
    *(_DWORD *)buf = 138412290;
    v24 = v19;
    _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "using shared signing session %@", buf, 0xCu);
  }

  v20 = self->_signingSession;
  return v20;
}

- (void)_doHSADeviceProvisioningWithDSID:(id)a3 data:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)AADeviceProvisioningSession) initWithDSID:v7];

  [v8 setCookieStorageRef:self->_cookieStorage];
  unsigned int v9 = [v8 provisionDeviceWithData:v6];

  id v10 = _AALogSystem();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      __int16 v15 = 0;
      id v12 = "Device provisioning failed";
      id v13 = (uint8_t *)&v15;
LABEL_6:
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, v12, v13, 2u);
    }
  }
  else if (v11)
  {
    __int16 v14 = 0;
    id v12 = "Device provisioning completed sucessfully";
    id v13 = (uint8_t *)&v14;
    goto LABEL_6;
  }
}

- (void)_doHSADeviceProvisioningSynchronizationWithDSID:(id)a3 data:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)AADeviceProvisioningSession) initWithDSID:v7];

  [v8 setCookieStorageRef:self->_cookieStorage];
  unsigned int v9 = [v8 synchronizeProvisioningWithData:v6];

  id v10 = _AALogSystem();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      __int16 v15 = 0;
      id v12 = "Device provisioning sync failed";
      id v13 = (uint8_t *)&v15;
LABEL_6:
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, v12, v13, 2u);
    }
  }
  else if (v11)
  {
    __int16 v14 = 0;
    id v12 = "Device provisioning sync completed successfully";
    id v13 = (uint8_t *)&v14;
    goto LABEL_6;
  }
}

- (void)_doHSADeviceReprovisioningWithDSID:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)AADeviceProvisioningSession) initWithDSID:v3];

  unsigned int v5 = [v4 eraseProvisioning];
  if (v5)
  {
    unsigned int v6 = v5;
    id v7 = _AALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109120;
      v8[1] = v6;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Something went wrong when trying to erase the device provisioning: %d", (uint8_t *)v8, 8u);
    }
  }
}

- (NSString)appleID
{
  return self->_appleID;
}

- (void)setAppleID:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (NSString)emailChoice
{
  return self->_emailChoice;
}

- (void)setEmailChoice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signingSessionCreationDate, 0);
  objc_storeStrong((id *)&self->_signingSession, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_emailChoice, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_requesterQueue, 0);
}

@end