@interface CLSEndpointConnection
+ (BOOL)isAllowedToMakeXPCCalls;
+ (BOOL)isClassKitEnabled;
+ (BOOL)isInDevelopmentEnvironment;
+ (CLSEndpointConnection)sharedInstance;
+ (NSString)classKitEnvironment;
+ (id)instanceForEndpoint:(id)a3;
- (BOOL)isBorked;
- (CLSEndpointConnection)init;
- (CLSEndpointConnection)initWithEndpoint:(id)a3;
- (NSString)overrideBundleIdentifier;
- (id)onConnect;
- (id)onInterupt;
- (id)server:(id)a3;
- (id)serverConnection;
- (id)syncDataServer:(id)a3;
- (id)syncServer:(id)a3;
- (id)syncUtilityServer:(id)a3;
- (void)_registerForDarwinNotifications;
- (void)_updateBundleIdentifier:(id)a3 forConnection:(id)a4 completion:(id)a5;
- (void)accountChanged;
- (void)addBarrierBlock:(id)a3;
- (void)connect;
- (void)connectionBorked:(id)a3;
- (void)connectionInterrupted:(id)a3;
- (void)dealloc;
- (void)deleteAppWithBundleIdentifier:(id)a3 completion:(id)a4;
- (void)devModeChanged;
- (void)invalidate;
- (void)listAppsWithCompletion:(id)a3;
- (void)lock;
- (void)setOnConnect:(id)a3;
- (void)setOnInterupt:(id)a3;
- (void)setOverrideBundleIdentifier:(id)a3;
- (void)setOverrideBundleIdentifier:(id)a3 completion:(id)a4;
- (void)unlock;
@end

@implementation CLSEndpointConnection

+ (CLSEndpointConnection)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1DC679D24;
  block[3] = &unk_1E6C95AC0;
  block[4] = a1;
  if (qword_1EB5D4C20 != -1) {
    dispatch_once(&qword_1EB5D4C20, block);
  }
  v2 = (void *)qword_1EB5D4C18;

  return (CLSEndpointConnection *)v2;
}

+ (id)instanceForEndpoint:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    id v7 = objc_alloc((Class)a1);
    uint64_t v9 = objc_msgSend_initWithEndpoint_(v7, v8, (uint64_t)v6);
  }
  else
  {
    uint64_t v9 = objc_msgSend_sharedInstance(a1, v4, v5);
  }
  v10 = (void *)v9;

  return v10;
}

- (CLSEndpointConnection)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  uint64_t v5 = NSString;
  uint64_t v6 = objc_opt_class();
  id v7 = NSStringFromSelector(a2);
  uint64_t v9 = objc_msgSend_stringWithFormat_(v5, v8, @"The method -[%@ %@] is not available.", v6, v7);
  objc_msgSend_exceptionWithName_reason_userInfo_(v3, v10, v4, v9, 0);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v11);
}

- (CLSEndpointConnection)initWithEndpoint:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLSEndpointConnection;
  uint64_t v6 = [(CLSEndpointConnection *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    v6->_lock = 0;
    objc_storeStrong((id *)&v6->_endpoint, a3);
    objc_msgSend__registerForDarwinNotifications(v7, v8, v9);
  }

  return v7;
}

- (void)dealloc
{
  objc_msgSend_invalidate(self, a2, v2);
  uint64_t v6 = objc_msgSend_defaultCenter(CLSDarwinNotificationCenter, v4, v5);
  objc_msgSend_removeObserver_notificationName_(v6, v7, (uint64_t)self, @"com.apple.progressd.available");
  objc_msgSend_removeObserver_notificationName_(v6, v8, (uint64_t)self, @"com.apple.progressd.devModeChanged");
  objc_super v11 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v9, v10);
  objc_msgSend_removeObserver_(v11, v12, (uint64_t)self);

  v13.receiver = self;
  v13.super_class = (Class)CLSEndpointConnection;
  [(CLSEndpointConnection *)&v13 dealloc];
}

- (void)lock
{
}

- (void)unlock
{
}

- (void)_registerForDarwinNotifications
{
  objc_initWeak(&location, self);
  uint64_t v5 = objc_msgSend_defaultCenter(CLSDarwinNotificationCenter, v3, v4);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1DC67A11C;
  v10[3] = &unk_1E6C96630;
  objc_copyWeak(&v11, &location);
  objc_msgSend_addObserver_notificationName_block_(v5, v6, (uint64_t)self, @"com.apple.progressd.available", v10);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1DC67A2A0;
  v8[3] = &unk_1E6C96630;
  objc_copyWeak(&v9, &location);
  objc_msgSend_addObserver_notificationName_block_(v5, v7, (uint64_t)self, @"com.apple.progressd.devModeChanged", v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

- (BOOL)isBorked
{
  objc_msgSend_lock(self, a2, v2);
  BOOL v6 = !self->_serverConnection || self->_connectionBorked || self->_interrupted;
  objc_msgSend_unlock(self, v4, v5);
  return v6;
}

- (id)serverConnection
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  v3 = objc_opt_class();
  if (objc_msgSend_isClassKitEnabled(v3, v4, v5))
  {
    objc_msgSend_lock(self, v6, v7);
    if (!objc_msgSend_isBorked(self, v8, v9))
    {
LABEL_14:
      v38 = self->_serverConnection;
      objc_msgSend_unlock(self, v39, v40);
      goto LABEL_23;
    }
    endpoint = self->_endpoint;
    id v11 = objc_alloc(MEMORY[0x1E4F29268]);
    if (endpoint) {
      objc_super v13 = objc_msgSend_initWithListenerEndpoint_(v11, v12, (uint64_t)self->_endpoint);
    }
    else {
      objc_super v13 = objc_msgSend_initWithMachServiceName_options_(v11, v12, @"com.apple.progressd", 4096);
    }
    v14 = v13;
    if (v13)
    {
      objc_initWeak(location, v13);
      objc_initWeak(&from, self);
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = sub_1DC67A868;
      v49[3] = &unk_1E6C97308;
      objc_copyWeak(&v50, &from);
      objc_copyWeak(&v51, location);
      objc_msgSend_setInterruptionHandler_(v14, v15, (uint64_t)v49);
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = sub_1DC67A8CC;
      v46[3] = &unk_1E6C97308;
      objc_copyWeak(&v47, &from);
      objc_copyWeak(&v48, location);
      objc_msgSend_setInvalidationHandler_(v14, v16, (uint64_t)v46);
      v17 = CLSEndpointServerInterface();
      objc_msgSend_setRemoteObjectInterface_(v14, v18, (uint64_t)v17);

      v19 = CLSClientInterface();
      objc_msgSend_setExportedInterface_(v14, v20, (uint64_t)v19);

      v21 = objc_opt_new();
      objc_msgSend_setDelagate_(v21, v22, (uint64_t)self);
      objc_msgSend_setExportedObject_(v14, v23, (uint64_t)v21);
      serverConnection = self->_serverConnection;
      *(_WORD *)&self->_connectionBorked = 0;
      v25 = serverConnection;
      v28 = v25;
      if (v25) {
        objc_msgSend_invalidate(v25, v26, v27);
      }
      objc_storeStrong((id *)&self->_serverConnection, v14);
      objc_msgSend_resume(v14, v29, v30);
      v33 = objc_msgSend_overrideBundleIdentifier(self, v31, v32);
      if (objc_msgSend_length(v33, v34, v35)) {
        objc_msgSend__updateBundleIdentifier_forConnection_completion_(self, v36, (uint64_t)v33, self->_serverConnection, &unk_1F37A1710);
      }
      onConnect = (void (**)(void))self->_onConnect;
      if (onConnect) {
        onConnect[2]();
      }

      objc_destroyWeak(&v48);
      objc_destroyWeak(&v47);
      objc_destroyWeak(&v51);
      objc_destroyWeak(&v50);
      objc_destroyWeak(&from);
      objc_destroyWeak(location);

      goto LABEL_14;
    }
    if (qword_1EB5D4D10 != -1) {
      dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
    }
    v41 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_INFO))
    {
      v44 = self->_endpoint;
      if (!v44) {
        v44 = (NSXPCListenerEndpoint *)@"com.apple.progressd";
      }
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v44;
      _os_log_impl(&dword_1DC60F000, v41, OS_LOG_TYPE_INFO, "Could not establish connection with %@", (uint8_t *)location, 0xCu);
    }
    objc_msgSend_unlock(self, v42, v43);
  }
  v38 = 0;
LABEL_23:

  return v38;
}

- (void)connectionInterrupted:(id)a3
{
  if (a3)
  {
    uint64_t v4 = (NSXPCConnection *)a3;
    objc_msgSend_lock(self, v5, v6);
    serverConnection = self->_serverConnection;

    if (serverConnection == v4)
    {
      if (qword_1EB5D4D10 != -1) {
        dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
      }
      uint64_t v10 = CLSLogDefault;
      if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_1DC60F000, v10, OS_LOG_TYPE_INFO, "ClassKit daemon connection interrupted.", v12, 2u);
      }
      self->_interrupted = 1;
      onInterupt = (void (**)(void))self->_onInterupt;
      if (onInterupt) {
        onInterupt[2]();
      }
    }
    objc_msgSend_unlock(self, v8, v9);
  }
}

- (void)connectionBorked:(id)a3
{
  uint64_t v4 = (NSXPCConnection *)a3;
  if (v4)
  {
    uint64_t v9 = v4;
    objc_msgSend_lock(self, v5, v6);
    if (self->_serverConnection == v9)
    {
      self->_connectionBorked = 1;
      objc_msgSend_connectionInterrupted_(self, v7, (uint64_t)v9);
    }
    objc_msgSend_unlock(self, v7, v8);
    uint64_t v4 = v9;
  }
}

- (void)invalidate
{
  objc_msgSend_setInvalidationHandler_(self->_serverConnection, a2, 0);
  objc_msgSend_invalidate(self->_serverConnection, v3, v4);
  serverConnection = self->_serverConnection;
  self->_serverConnection = 0;
}

+ (NSString)classKitEnvironment
{
  if (qword_1EB5D4C30 != -1) {
    dispatch_once(&qword_1EB5D4C30, &unk_1F37A0C70);
  }
  uint64_t v2 = (void *)qword_1EB5D4C28;

  return (NSString *)v2;
}

+ (BOOL)isInDevelopmentEnvironment
{
  uint64_t v6 = objc_msgSend_classKitEnvironment(a1, a2, v2);
  if (v6 | (unint64_t)@"development")
  {
    uint64_t v9 = objc_msgSend_classKitEnvironment(a1, v4, v5);
    char isEqualToString = 0;
    if (v9 && @"development")
    {
      id v11 = objc_msgSend_classKitEnvironment(a1, v7, v8);
      char isEqualToString = objc_msgSend_isEqualToString_(v11, v12, @"development");
    }
  }
  else
  {
    char isEqualToString = 1;
  }

  return isEqualToString;
}

+ (BOOL)isClassKitEnabled
{
  if (objc_msgSend_isInDevelopmentEnvironment(a1, a2, v2)) {
    return 1;
  }

  return MEMORY[0x1F4181798](a1, sel_isAllowedToMakeXPCCalls, v4);
}

+ (BOOL)isAllowedToMakeXPCCalls
{
  v3 = objc_msgSend_cls_configURL(MEMORY[0x1E4F1CB10], a2, v2);
  char v6 = objc_msgSend_cls_fileExists(v3, v4, v5) ^ 1;

  return v6;
}

- (id)syncDataServer:(id)a3
{
  return (id)MEMORY[0x1F4181798](self, sel_syncServer_, a3);
}

- (id)syncUtilityServer:(id)a3
{
  return (id)MEMORY[0x1F4181798](self, sel_syncServer_, a3);
}

- (id)syncServer:(id)a3
{
  id v4 = a3;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = sub_1DC67B00C;
  v23[3] = &unk_1E6C95CF8;
  id v5 = v4;
  id v24 = v5;
  char v6 = (void *)MEMORY[0x1E01A05F0](v23);
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_1DC67B108;
  v21 = sub_1DC67B118;
  id v22 = 0;
  uint64_t v9 = objc_msgSend_serverConnection(self, v7, v8);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1DC67B120;
  v14[3] = &unk_1E6C97330;
  v16 = &v17;
  id v10 = v6;
  id v15 = v10;
  v12 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v9, v11, (uint64_t)v14);

  if (!v12) {
    (*((void (**)(id, uint64_t))v10 + 2))(v10, v18[5]);
  }

  _Block_object_dispose(&v17, 8);

  return v12;
}

- (id)server:(id)a3
{
  id v4 = a3;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = sub_1DC67B354;
  v23[3] = &unk_1E6C95CF8;
  id v5 = v4;
  id v24 = v5;
  char v6 = (void *)MEMORY[0x1E01A05F0](v23);
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_1DC67B108;
  v21 = sub_1DC67B118;
  id v22 = 0;
  uint64_t v9 = objc_msgSend_serverConnection(self, v7, v8);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1DC67B450;
  v14[3] = &unk_1E6C97330;
  v16 = &v17;
  id v10 = v6;
  id v15 = v10;
  v12 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v9, v11, (uint64_t)v14);

  if (!v12) {
    (*((void (**)(id, uint64_t))v10 + 2))(v10, v18[5]);
  }

  _Block_object_dispose(&v17, 8);

  return v12;
}

- (void)listAppsWithCompletion:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1DC67B568;
  v9[3] = &unk_1E6C95CF8;
  id v10 = v4;
  id v5 = v4;
  uint64_t v7 = objc_msgSend_server_(self, v6, (uint64_t)v9);
  objc_msgSend_remote_listAppsWithCompletion_(v7, v8, (uint64_t)v5);
}

- (void)setOverrideBundleIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v19 = (uint64_t)a3;
  char v6 = (void (**)(id, uint64_t, void))a4;
  uint64_t v8 = (void *)v19;
  uint64_t v9 = v6;
  overrideBundleIdentifier = self->_overrideBundleIdentifier;
  if (!(v19 | (unint64_t)overrideBundleIdentifier)
    || v19
    && overrideBundleIdentifier
    && (int isEqualToString = objc_msgSend_isEqualToString_(overrideBundleIdentifier, (const char *)v19, v19),
        uint64_t v8 = (void *)v19,
        isEqualToString))
  {
    v9[2](v9, 1, 0);
  }
  else
  {
    v12 = (NSString *)objc_msgSend_copy(v8, (const char *)v8, v7);
    objc_super v13 = self->_overrideBundleIdentifier;
    self->_overrideBundleIdentifier = v12;

    v14 = self->_overrideBundleIdentifier;
    uint64_t v17 = objc_msgSend_serverConnection(self, v15, v16);
    objc_msgSend__updateBundleIdentifier_forConnection_completion_(self, v18, (uint64_t)v14, v17, v9);
  }
}

- (void)_updateBundleIdentifier:(id)a3 forConnection:(id)a4 completion:(id)a5
{
  id v7 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1DC67B784;
  v16[3] = &unk_1E6C95CF8;
  id v8 = v7;
  id v17 = v8;
  id v9 = a3;
  id v11 = objc_msgSend_remoteObjectProxyWithErrorHandler_(a4, v10, (uint64_t)v16);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1DC67B79C;
  v14[3] = &unk_1E6C96BE8;
  id v15 = v8;
  id v12 = v8;
  objc_msgSend_remote_setOverrideBundleIdentifier_completion_(v11, v13, (uint64_t)v9, v14);
}

- (void)deleteAppWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1DC67B93C;
  v12[3] = &unk_1E6C95CF8;
  id v13 = v6;
  id v7 = v6;
  id v8 = a3;
  id v10 = objc_msgSend_server_(self, v9, (uint64_t)v12);
  objc_msgSend_remote_deleteAppWithBundleIdentifier_completion_(v10, v11, (uint64_t)v8, v7);
}

- (void)connect
{
  v3 = objc_msgSend_serverConnection(self, a2, v2);
}

- (void)addBarrierBlock:(id)a3
{
  id v4 = (void (**)(void))a3;
  objc_msgSend_lock(self, v5, v6);
  if (objc_msgSend_isBorked(self, v7, v8)) {
    v4[2](v4);
  }
  else {
    objc_msgSend_addBarrierBlock_(self->_serverConnection, v9, (uint64_t)v4);
  }

  objc_msgSend_unlock(self, v10, v11);
}

- (void)accountChanged
{
  objc_msgSend_server_(self, a2, (uint64_t)&unk_1F37A1330);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remote_accountChanged(v4, v2, v3);
}

- (void)devModeChanged
{
  objc_msgSend_lock(self, a2, v2);
  objc_msgSend_invalidate(self->_serverConnection, v4, v5);
  uint64_t v8 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v6, v7);
  objc_msgSend_postNotificationName_object_userInfo_(v8, v9, @"CLSDeveloperModeDidChangeNotification", 0, 0);

  objc_msgSend_unlock(self, v10, v11);
}

- (NSString)overrideBundleIdentifier
{
  return self->_overrideBundleIdentifier;
}

- (void)setOverrideBundleIdentifier:(id)a3
{
}

- (id)onInterupt
{
  return self->_onInterupt;
}

- (void)setOnInterupt:(id)a3
{
}

- (id)onConnect
{
  return self->_onConnect;
}

- (void)setOnConnect:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onConnect, 0);
  objc_storeStrong(&self->_onInterupt, 0);
  objc_storeStrong((id *)&self->_overrideBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);

  objc_storeStrong((id *)&self->_serverConnection, 0);
}

@end