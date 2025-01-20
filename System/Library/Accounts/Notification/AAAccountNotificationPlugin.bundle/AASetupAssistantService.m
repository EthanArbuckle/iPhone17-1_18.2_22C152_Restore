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
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_2405268B4;
  v20 = sub_2405268C4;
  id v21 = 0;
  id v2 = objc_alloc_init(MEMORY[0x263F25950]);
  objc_msgSend_setFlushCache_(v2, v3, byte_268C87BB8, v4, v5);
  byte_268C87BB8 = 0;
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_2405268CC;
  v13[3] = &unk_2650BEA28;
  v15 = &v16;
  v7 = v6;
  v14 = v7;
  objc_msgSend_performRequestWithHandler_(v2, v8, (uint64_t)v13, v9, v10);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  id v11 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v11;
}

+ (void)resetURLConfiguration
{
  byte_268C87BB8 = 1;
}

- (AASetupAssistantService)init
{
  v6.receiver = self;
  v6.super_class = (Class)AASetupAssistantService;
  id v2 = [(AASetupAssistantService *)&v6 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    requesterQueue = v2->_requesterQueue;
    v2->_requesterQueue = v3;
  }
  return v2;
}

- (AASetupAssistantService)initWithAppleID:(id)a3 password:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = (AASetupAssistantService *)objc_msgSend_init(self, v8, v9, v10, v11);
  if (v16)
  {
    uint64_t v17 = objc_msgSend_copy(v6, v12, v13, v14, v15);
    appleID = v16->_appleID;
    v16->_appleID = (NSString *)v17;

    uint64_t v23 = objc_msgSend_copy(v7, v19, v20, v21, v22);
    password = v16->_password;
    v16->_password = (NSString *)v23;
  }
  return v16;
}

- (AASetupAssistantService)initWithAccount:(id)a3
{
  id v5 = a3;
  uint64_t v10 = objc_msgSend_init(self, v6, v7, v8, v9);
  uint64_t v11 = (AASetupAssistantService *)v10;
  if (v10)
  {
    objc_storeStrong((id *)(v10 + 40), a3);
    uint64_t v16 = objc_msgSend_username(v5, v12, v13, v14, v15);
    uint64_t v21 = objc_msgSend_copy(v16, v17, v18, v19, v20);
    appleID = v11->_appleID;
    v11->_appleID = (NSString *)v21;

    v27 = objc_msgSend_credential(v11->_account, v23, v24, v25, v26);
    v32 = objc_msgSend_password(v27, v28, v29, v30, v31);
    uint64_t v37 = objc_msgSend_copy(v32, v33, v34, v35, v36);
    password = v11->_password;
    v11->_password = (NSString *)v37;
  }
  return v11;
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
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_240526C30;
  block[3] = &unk_2650BEA50;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

- (void)authenticateWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_queue_create("authenticationRequestQueue", 0);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_240526D4C;
  v7[3] = &unk_2650BEA78;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)createAppleIDWithParameters:(id)a3 handler:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_240527050;
  v10[3] = &unk_2650BEAC8;
  id v11 = v6;
  id v7 = v6;
  objc_msgSend_createAppleIDWithParameters_handlerWithResponse_(self, v8, (uint64_t)a3, (uint64_t)v10, v9);
}

- (void)createAppleIDWithParameters:(id)a3 handlerWithResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _AALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_240524000, v8, OS_LOG_TYPE_DEFAULT, "createAppleIDWithParameters start", buf, 2u);
  }

  uint64_t v9 = dispatch_queue_create("createAppleIDQueue", 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_24052718C;
  block[3] = &unk_2650BEAF0;
  id v13 = v6;
  uint64_t v14 = self;
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
    _os_log_impl(&dword_240524000, v8, OS_LOG_TYPE_DEFAULT, "updateAppleIDWithParameters start", buf, 2u);
  }

  uint64_t v9 = dispatch_queue_create("updateAppleIDQueue", 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_24052770C;
  block[3] = &unk_2650BEAF0;
  id v13 = v6;
  uint64_t v14 = self;
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
    _os_log_impl(&dword_240524000, v8, OS_LOG_TYPE_DEFAULT, "setupDelegateAccountsWithParameters start", buf, 2u);
  }

  uint64_t v9 = dispatch_queue_create("setupDelegateAccountsQueue", 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_240527C44;
  block[3] = &unk_2650BEAF0;
  id v13 = v6;
  uint64_t v14 = self;
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
    _os_log_impl(&dword_240524000, v8, OS_LOG_TYPE_DEFAULT, "loginDelegatesWithParameters start", buf, 2u);
  }

  uint64_t v9 = dispatch_queue_create("loginDelegatesQueue", 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_240528170;
  block[3] = &unk_2650BEAF0;
  id v13 = v6;
  uint64_t v14 = self;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)upgradeiCloudTermsIfNecessaryWithHandler:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_2405285FC;
  v8[3] = &unk_2650BEB18;
  id v9 = v4;
  id v5 = v4;
  objc_msgSend_upgradeiCloudTermsIfNecessaryWithCustomHeaders_handler_(self, v6, 0, (uint64_t)v8, v7);
}

- (void)upgradeiCloudTermsIfNecessaryWithCustomHeaders:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_account)
  {
    id v8 = dispatch_queue_create("upgradeTermsQueue", 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_24052877C;
    block[3] = &unk_2650BEAF0;
    void block[4] = self;
    id v13 = v6;
    id v14 = v7;
    dispatch_async(v8, block);
  }
  else
  {
    id v9 = _AALogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_240524000, v9, OS_LOG_TYPE_DEFAULT, "Error: No AppleAccount set on AASetupAssistant Service", v11, 2u);
    }

    id v8 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v10, @"com.apple.appleaccount", 0, 0);
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
    _os_log_impl(&dword_240524000, v5, OS_LOG_TYPE_DEFAULT, "shouldPresentUpgradeFlowWithCompletion start", buf, 2u);
  }

  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v11 = objc_msgSend_appleID(self, v7, v8, v9, v10);
  objc_msgSend_setValue_forKey_(v6, v12, (uint64_t)v11, @"apple-id", v13);

  uint64_t v18 = objc_msgSend_password(self, v14, v15, v16, v17);
  objc_msgSend_setValue_forKey_(v6, v19, (uint64_t)v18, @"password", v20);

  uint64_t v25 = objc_msgSend_appleIDClientIdentifier(MEMORY[0x263F25820], v21, v22, v23, v24);
  objc_msgSend_setValue_forKey_(v6, v26, (uint64_t)v25, @"client-id", v27);

  id v28 = objc_alloc(MEMORY[0x263F25980]);
  uint64_t v35 = objc_msgSend_initWithAccount_(v28, v29, (uint64_t)self->_account, v30, v31);
  if (self->_account)
  {
    id v36 = objc_alloc(MEMORY[0x263F25838]);
    v40 = objc_msgSend_initWithAccount_(v36, v37, (uint64_t)self->_account, v38, v39);
    objc_msgSend_addProvisioningInfoToAARequest_(v40, v41, (uint64_t)v35, v42, v43);
  }
  objc_msgSend_setCookieStorage_(v35, v32, (uint64_t)self->_cookieStorage, v33, v34);
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = sub_240528C14;
  v48[3] = &unk_2650BEAA0;
  id v49 = v4;
  id v44 = v4;
  objc_msgSend_performRequestWithHandler_(v35, v45, (uint64_t)v48, v46, v47);
}

- (id)_signingSession
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  if (!self->_signingSession) {
    goto LABEL_7;
  }
  id v6 = objc_msgSend_date(MEMORY[0x263EFF910], a2, v2, v3, v4);
  objc_msgSend_timeIntervalSinceDate_(v6, v7, (uint64_t)self->_signingSessionCreationDate, v8, v9);
  double v11 = v10;

  if (v11 > 540.0)
  {
    v12 = _AALogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_240524000, v12, OS_LOG_TYPE_DEFAULT, "shared signing session expired. creating a new signing session.", buf, 2u);
    }

    signingSession = self->_signingSession;
    self->_signingSession = 0;
  }
  if (!self->_signingSession)
  {
LABEL_7:
    objc_msgSend_date(MEMORY[0x263EFF910], a2, v2, v3, v4);
    id v14 = (NSDate *)objc_claimAutoreleasedReturnValue();
    signingSessionCreationDate = self->_signingSessionCreationDate;
    self->_signingSessionCreationDate = v14;

    uint64_t v16 = (void *)MEMORY[0x263F25990];
    uint64_t v21 = objc_msgSend_urlConfiguration(AASetupAssistantService, v17, v18, v19, v20);
    uint64_t v26 = objc_msgSend_signingSessionCertURL(v21, v22, v23, v24, v25);
    uint64_t v31 = objc_msgSend_urlConfiguration(AASetupAssistantService, v27, v28, v29, v30);
    id v36 = objc_msgSend_signingSessionURL(v31, v32, v33, v34, v35);
    id v46 = 0;
    objc_msgSend_establishedSessionWithCertURL_sessionURL_error_(v16, v37, (uint64_t)v26, (uint64_t)v36, (uint64_t)&v46);
    uint64_t v38 = (AASigningSession *)objc_claimAutoreleasedReturnValue();
    uint64_t v39 = (AASigningSession *)v46;
    v40 = self->_signingSession;
    self->_signingSession = v38;

    if (v39)
    {
      v41 = _AALogSystem();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v48 = v39;
        _os_log_impl(&dword_240524000, v41, OS_LOG_TYPE_DEFAULT, "Failed to create a shared signing session: %@", buf, 0xCu);
      }
    }
  }
  uint64_t v42 = _AALogSystem();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v43 = self->_signingSession;
    *(_DWORD *)buf = 138412290;
    v48 = v43;
    _os_log_impl(&dword_240524000, v42, OS_LOG_TYPE_DEFAULT, "using shared signing session %@", buf, 0xCu);
  }

  id v44 = self->_signingSession;
  return v44;
}

- (void)_doHSADeviceProvisioningWithDSID:(id)a3 data:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v13 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v30 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v9, v10, v11, v12);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v30, v31, (uint64_t)a2, (uint64_t)self, @"AASetupAssistantService.m", 479, @"No DSID passed");

    if (v13) {
      goto LABEL_3;
    }
  }
  v32 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v9, v10, v11, v12);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v32, v33, (uint64_t)a2, (uint64_t)self, @"AASetupAssistantService.m", 480, @"No data passed");

LABEL_3:
  id v14 = objc_alloc(MEMORY[0x263F25838]);
  uint64_t v18 = objc_msgSend_initWithDSID_(v14, v15, (uint64_t)v7, v16, v17);
  objc_msgSend_setCookieStorageRef_(v18, v19, (uint64_t)self->_cookieStorage, v20, v21);
  int v25 = objc_msgSend_provisionDeviceWithData_(v18, v22, (uint64_t)v13, v23, v24);
  uint64_t v26 = _AALogSystem();
  BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
  if (v25)
  {
    if (v27)
    {
      __int16 v35 = 0;
      uint64_t v28 = "Device provisioning failed";
      uint64_t v29 = (uint8_t *)&v35;
LABEL_8:
      _os_log_impl(&dword_240524000, v26, OS_LOG_TYPE_DEFAULT, v28, v29, 2u);
    }
  }
  else if (v27)
  {
    __int16 v34 = 0;
    uint64_t v28 = "Device provisioning completed sucessfully";
    uint64_t v29 = (uint8_t *)&v34;
    goto LABEL_8;
  }
}

- (void)_doHSADeviceProvisioningSynchronizationWithDSID:(id)a3 data:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v13 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v30 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v9, v10, v11, v12);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v30, v31, (uint64_t)a2, (uint64_t)self, @"AASetupAssistantService.m", 496, @"No DSID passed");

    if (v13) {
      goto LABEL_3;
    }
  }
  v32 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v9, v10, v11, v12);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v32, v33, (uint64_t)a2, (uint64_t)self, @"AASetupAssistantService.m", 497, @"No data passed");

LABEL_3:
  id v14 = objc_alloc(MEMORY[0x263F25838]);
  uint64_t v18 = objc_msgSend_initWithDSID_(v14, v15, (uint64_t)v7, v16, v17);
  objc_msgSend_setCookieStorageRef_(v18, v19, (uint64_t)self->_cookieStorage, v20, v21);
  int v25 = objc_msgSend_synchronizeProvisioningWithData_(v18, v22, (uint64_t)v13, v23, v24);
  uint64_t v26 = _AALogSystem();
  BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
  if (v25)
  {
    if (v27)
    {
      __int16 v35 = 0;
      uint64_t v28 = "Device provisioning sync failed";
      uint64_t v29 = (uint8_t *)&v35;
LABEL_8:
      _os_log_impl(&dword_240524000, v26, OS_LOG_TYPE_DEFAULT, v28, v29, 2u);
    }
  }
  else if (v27)
  {
    __int16 v34 = 0;
    uint64_t v28 = "Device provisioning sync completed successfully";
    uint64_t v29 = (uint8_t *)&v34;
    goto LABEL_8;
  }
}

- (void)_doHSADeviceReprovisioningWithDSID:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v9 = a3;
  if (!v9)
  {
    uint64_t v22 = objc_msgSend_currentHandler(MEMORY[0x263F08690], v5, v6, v7, v8);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v22, v23, (uint64_t)a2, (uint64_t)self, @"AASetupAssistantService.m", 512, @"No DSID passed");
  }
  id v10 = objc_alloc(MEMORY[0x263F25838]);
  id v14 = objc_msgSend_initWithDSID_(v10, v11, (uint64_t)v9, v12, v13);
  int v19 = objc_msgSend_eraseProvisioning(v14, v15, v16, v17, v18);
  if (v19)
  {
    int v20 = v19;
    uint64_t v21 = _AALogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v24[0] = 67109120;
      v24[1] = v20;
      _os_log_impl(&dword_240524000, v21, OS_LOG_TYPE_DEFAULT, "Something went wrong when trying to erase the device provisioning: %d", (uint8_t *)v24, 8u);
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